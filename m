Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 159143FECF0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 13:28:57 +0200 (CEST)
Received: from localhost ([::1]:47482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLktr-0002pU-J5
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 07:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLkaI-0007NL-7h
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:08:42 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLkaG-0008Dm-JI
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 07:08:41 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v10so2263436wrd.4
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 04:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iYF4nPQjW7m2PBjRCFgvz8cWJn7v2qxH6jMLW7CSoHM=;
 b=k1KzD28CckVm0ChCgB5jRT/gMxvfu8/plHKIxK6820sJ0hzEoa9Xt23Vn535ac+PPF
 YxS8aMaGN4+SxfIoVnA4D+gzclCtAiMKDDgssqFia/RYKcW9HsQ0k6uoro4aGk0qTqzq
 mZ3sTF/gX+E849OYvRYcMmZ2SXPmMSC2Bwe+ujuY4pXEGOZvv2Rr7hxBDeOm3ejhxZpO
 uGd8A2cspPFo9osWanh6tT/lhibOyE2G38Z9SzpNwryi5nfKYkqwxoETDEBy7jPpvcQ0
 mFVpAQzuKxe351eaO5SnU9UeoBT6hW+qjDW7t9xgG2sQCQTAQki/WDe/EEJMUFmUzber
 uKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iYF4nPQjW7m2PBjRCFgvz8cWJn7v2qxH6jMLW7CSoHM=;
 b=Rvs40YEjdb9uQZeKGzQc0IpZnxNV6LcW6ZosN1NEbxMDdCb5K2B4ZwQofR8U7QAmli
 C6X4Iv8Ex6+ZZeLqRLDdf7HDBxbJp5THl0Y1miWXxh6gxq3Uc1bysjToKzusst6IAfPF
 XwKMuLEngWIGDDtie6KqMXK2EM0KYYktERDPXZhvaonmKK1VSpMLWlBmLHtDcYG5RyLj
 Q+9FC6z/o/81eJqZW7dVRXiLdwpOAvm75lmyevYkupGjtRivGxsoPF1f/k6+B2QjFwOb
 wizih4oUHugP19OiYQD2+OoaZg3oXA8tYz2gJ8HnMC4EYg86ZuD0ZqqOT2iNOHwxly/o
 /qVA==
X-Gm-Message-State: AOAM531Q/4K+rrZt3bYcCxdLoT65HDwgaDFiEXR0WlzxKg4uh5tFUNbY
 n/qmyUxf2J/kvI90+fR6mzFIzQLeujzL+h3BKG6cpA==
X-Google-Smtp-Source: ABdhPJwCJQaGKqQiZj/cdodJ3M1OAVUD9M5pBCjeSouDIyQtE4QTAWrl2QPcKYW1Z0G4/hUMUdjZWppgtJYBuf+9KBc=
X-Received: by 2002:adf:ebd2:: with SMTP id v18mr3165041wrn.248.1630580919074; 
 Thu, 02 Sep 2021 04:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210901151619.689075-1-hreitz@redhat.com>
In-Reply-To: <20210901151619.689075-1-hreitz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Sep 2021 12:07:50 +0100
Message-ID: <CAFEAcA9r9R0Pn4_XLU_W88NoK75RsWw-EEpxLPMobP0jF1DJ3g@mail.gmail.com>
Subject: Re: [PULL 00/56] Block patches
To: Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Sept 2021 at 16:16, Hanna Reitz <hreitz@redhat.com> wrote:
>
> The following changes since commit ec397e90d21269037280633b6058d1f280e276=
67:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply=
-20210901-2' into staging (2021-09-01 08:33:02 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/XanClic/qemu.git tags/pull-block-2021-09-01
>
> for you to fetch changes up to ebd979c74e2b8a7275090475df36dde4ab858320:
>
>   block/file-win32: add reopen handlers (2021-09-01 14:38:08 +0200)
>
>
> **Note:** I=E2=80=99ve signed the pull request tag with my new GPG key, w=
hich I
> have uploaded here:
>
>   https://xanclic.moe/A1FA40D098019CDF

Hi. Unfortunately my employer's internet setup blocks access to
that site :-(

> (I=E2=80=99ve also tried uploading this key to several keyservers, but it
> appears to me that keyservers are kind of a thing of the past now,
> especially when it comes to uploading keys with signatures on them...)

IME keyserver.ubuntu.com is still functional.

thanks
-- PMM

