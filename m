Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF419E0518
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 15:31:33 +0200 (CEST)
Received: from localhost ([::1]:56930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMuG4-0001Tp-KJ
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 09:31:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32853)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iMtxA-0004qK-OS
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 09:12:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iMtx8-0003Ww-80
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 09:12:00 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:50552)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iMtx7-0003Vu-V0
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 09:11:58 -0400
Received: by mail-wm1-x344.google.com with SMTP id q13so7164046wmj.0
 for <qemu-devel@nongnu.org>; Tue, 22 Oct 2019 06:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=RGomnqlzbQaX/+pTthi8oGYNnI0CjCkjc8GqV2fgmPk=;
 b=nf7nXMJOrig3zxloni3qKmXfxiUDdZGZn+KFiwAyyUFbygaWz/t6g2d/V3udcdWkWc
 fL3eyDklUfWjQ4ppdshcMBxkraWMtKTiENvjxx0ky0IwegBDQVBolQ2ckx06oNpe8Zrj
 8zAVZuTX8LRYEVkdswP2SiwyK4DtiITuOdolBEmAnxH958tRCFTHdWJaYZP0nyflHTpd
 KtUH+Vb2ZPwkSpSuh1qHHmvFqbuPEK39dWkpmUxr8rEXT94U3DJkF0XEv/7b35KDOkcg
 bOoKyXOKa7c5GlRO6JhIwjBZfqI+XeXIGPlUfljOlNJKbFFdCw+i7ONTt72lq/acXiix
 ZU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=RGomnqlzbQaX/+pTthi8oGYNnI0CjCkjc8GqV2fgmPk=;
 b=oZL3z/4Jw1nBbV9Y7xUBIfShsDIDCfz2atx+xMvyzGYu2Q9lAtww62rUJ1bAzm/gof
 dOJqx/4/HhzT1e+e55X6xK2cHgsQ254+F6w4yrsanoY5DoQCD9LNmLeThlkk1SHKDhIf
 FYKLJmgp1IP4rn6OZ2kG/IRxjb2bfHJbXxCyMu5MCiLxNsoHOIPLfICN9O7udBwn8lJc
 2G4r45MkHOOXILTiKKEdPbzFTfxlgbYPNNLpPO1fmaG4rfzywdar8/cWSgVJRbPtulu5
 vj5b+UaQwKTa50B6QNPQjzdqTswrqOyX3LicUdOzrRm5cmobobi9WIFpWLq7NAvcq4+a
 PvHg==
X-Gm-Message-State: APjAAAU5fh59MUDMr+MZJR1XgEehvsESbolijhqXyixHe46KBZkeUEh3
 akWxqKG4CBgajCgEVTol17SxjQ==
X-Google-Smtp-Source: APXvYqziomzzfbl/S1ZfEp41BtxJVgp/sV6SCJuOHt0Hza15UVcmDar1E3dtw4ejOu/0aDGOyqH2lQ==
X-Received: by 2002:a7b:c94f:: with SMTP id i15mr3089656wml.8.1571749916481;
 Tue, 22 Oct 2019 06:11:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x12sm8856626wru.93.2019.10.22.06.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 06:11:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1F3D31FF87;
 Tue, 22 Oct 2019 14:11:55 +0100 (BST)
References: <20191022072135.11188-1-thuth@redhat.com>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v3 0/6] Enable more iotests during "make check-block"
In-reply-to: <20191022072135.11188-1-thuth@redhat.com>
Date: Tue, 22 Oct 2019 14:11:55 +0100
Message-ID: <87a79sx6uc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> As discussed here:
>
>  https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg00697.html
>
> and here:
>
>  https://lists.gnu.org/archive/html/qemu-devel/2019-10/msg01388.html

Queued to testing/next, thanks.

>
> it would be good to have some more valuable iotests enabled in the
> "auto" group to get better iotest coverage during "make check".
>
> And once Max' "iotests: Add and use $SOCK_DIR" patch series has been
> merged, we can indeed enable these Python-based tests, too.
>
> There is just one small downside: Since these tests require a QEMU
> that features a 'virtio-blk' device, we cannot run the iotests
> with binaries like qemu-system-tricore anymore. But since the iotests
> were not very useful with such binaries anyway, I think it's ok now
> if we skip them there.
>
> I've also added a patch that removes test 130 from the "auto" group
> instead. Test 130 has been reported to fail intermittently, so we
> should not use it in "make check" block until it is fixed.
>
> Based-on: 20191010152457.17713-1-mreitz@redhat.com
>
> v3:
>  - Test 183 fails on Patchew, so I removed it from the "auto" group
>    again
>
> v2:
>  - Checked the iotests with NetBSD, too (now that Eduardo has
>    re-activated Gerd's patches for creating NetBSD VM images)
>  - Use 'openbsd' instead of 'openbsd6'
>  - Use 'grep -q' instead of 'grep' for grep'ing silently
>  - Added the patch to disable 130 from the "auto" group
>
> John Snow (1):
>   iotests: remove 'linux' from default supported platforms
>
> Thomas Huth (5):
>   iotests: Test 041 only works on certain systems
>   iotests: Test 183 does not work on macOS and OpenBSD
>   iotests: Skip "make check-block" if QEMU does not support virtio-blk
>   iotests: Enable more tests in the 'auto' group to improve test
>     coverage
>   iotests: Remove 130 from the "auto" group
>
>  tests/check-block.sh          | 16 +++++++++++++++-
>  tests/qemu-iotests/041        |  3 ++-
>  tests/qemu-iotests/183        |  1 +
>  tests/qemu-iotests/group      | 18 +++++++++---------
>  tests/qemu-iotests/iotests.py | 16 +++++++++++-----
>  5 files changed, 38 insertions(+), 16 deletions(-)


--
Alex Benn=C3=A9e

