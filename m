Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E995F3CAE11
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 22:39:59 +0200 (CEST)
Received: from localhost ([::1]:47324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m489G-00038k-JE
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 16:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m488P-0002Lf-1b
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 16:39:05 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:33324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m488M-0004O3-L7
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 16:39:04 -0400
Received: by mail-ed1-x52d.google.com with SMTP id dj21so10093044edb.0
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 13:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W1xUyCsLR5oZR+ij1xDWfWqarqf0CPoASMWVgGvqo/U=;
 b=I1EZdGmRGC+ziklTfeqPxcEO0uL6F5BkZVLv7ci65BsJGnxEvbjh1nQp4BK8sgx5nb
 TMZIQQon2Q5Ukis1eA7IOUVDdXVyq9KRtSZAsFT1YEKUZWO/NogiPEHkgA6/GwGf2jb+
 zFRnJlWjtGf4GbSW9kg2IWZU8V9SYXA5GrKbDt36UxgyEAk6s6sWPbi4+LiJkqS3Cfio
 Z3xG//hz5PyOuvTOLyge7ktGQvlMtWY06uUtwnUCRxsFW+9zlrqV8kBdHbxZglqJmgqX
 m0Unb3c1WyAu1PUh2BXmPoJlyBrUWqk4PiQfAaoaToqF9UwjEQb+D/karMUc0v4brpcu
 lkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W1xUyCsLR5oZR+ij1xDWfWqarqf0CPoASMWVgGvqo/U=;
 b=KmXZE98ocUyKTbvne6s4l0shWBFHU+EQjTvvZxjSYwITIHOZJYEbZTLOzHYZG7PN2x
 HEHIfHYxfDCGcTSiYMfPYmxkq16AfYVmOSBCP0Wn4Hqkf6b3s/MfIJtVX6jajAeeUA1W
 WILTJoUpvfdN/b1wz2N0xxhRoxz20cuhoX0gXHZYJ4P2FTEDBO2ToZRfx7PLFzNJnT01
 RLG86PqucII2h10gaOYBWPBfppmHLmaP6oVDRNSdae8yGRc6wVN6477vF6IAUJf2MP4R
 rYpBWEvIthpL830RXVCGG5XLOa45oX3nc+W4a0J8VOhYP3+ob0i4IkhynJYCQE7R3NSe
 BEDA==
X-Gm-Message-State: AOAM533bS/9W1LtegyiaP0e2JI6ZB2L0SLjDmnRt77sf2DJYrAPPsX+h
 f+t8dT8XE+4UTddnq+uo6Sr5eX0JV6YRtS4R0VbGZA==
X-Google-Smtp-Source: ABdhPJxdV02se05xq9chCN+7IDNDOUvnLysxZgAJITtThy1He9DpevcJk/jeZeGnbdIGV3pOED7jjsT7JRwA3g8XqrQ=
X-Received: by 2002:a05:6402:697:: with SMTP id
 f23mr9562109edy.44.1626381541115; 
 Thu, 15 Jul 2021 13:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210714140858.2247409-1-berrange@redhat.com>
In-Reply-To: <20210714140858.2247409-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Jul 2021 21:38:21 +0100
Message-ID: <CAFEAcA8wKbHVHe8C3-QtBfhQjjbAEhMA66OMbXUi8THPaPfURQ@mail.gmail.com>
Subject: Re: [PULL v2 00/26] Crypto and more patches
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Jul 2021 at 15:12, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> The following changes since commit 4aa2454d94cca99d86aa32e71bd7c8159df91c=
59:
>
>   Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-re=
quest' into staging (2021-07-14 12:00:56 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/berrange/qemu tags/crypto-and-more-pull-request
>
> for you to fetch changes up to 80d78357495837f1f0e53fbb6bca5fb793631d94:
>
>   qemu-options: rewrite help for -smp options (2021-07-14 14:16:35 +0100)
>
> ----------------------------------------------------------------
> Merge crypto updates and misc fixes
>
>  * Introduce a GNUTLS backend for crypto algorithms
>  * Change crypto library preference gnutls > gcrypt > nettle > built-in
>  * Remove built-in DES impl
>  * Remove XTS mode from built-in AES impl
>  * Fix seccomp rules to allow resource info getters
>  * Fix migration performance test
>  * Use GDateTime in io/ and net/rocker/ code
>  * Improve docs for -smp
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

