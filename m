Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222A1403AEA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 15:48:21 +0200 (CEST)
Received: from localhost ([::1]:60942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNxw4-0004bh-7W
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 09:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNxuc-0003pl-SV
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 09:46:50 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNxuZ-0003hq-CF
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 09:46:50 -0400
Received: by mail-wr1-x42b.google.com with SMTP id u9so3392401wrg.8
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 06:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tHB1qqCs0p0uDxMS1SRzXEtEfY0FF95ezm/ei5vwF0s=;
 b=SVeH21414gRCX9GIE35OCJEmkYZb6l9GnaIN3WO92S6P02MXR49bSogqnqITDoRXTT
 Ios59UNAN3Ic9mGjRDvU2dPszmZsngkx5SrnqBjG8pZhSzveVMfYFYS1zNHBYve5ejOE
 4ed9fYzQGCWJtUousY7hD/3UYuxHhhnc0LsEKASnpoWMfuPO1vn/KwnD4f29uGA2LCNU
 FpMvJAYqXDW9VfBgZxz3JBzLaV+9G5/kOA7ucdiiWiiK0rwPZejhTrNNq1Q+uXWZiMeY
 RTUkkDTq9pKchd+vb0Bejg8F4GhfGNBqP2BX6orPWipO2DGpPgQowU/mb70EfMOdCfvC
 VtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tHB1qqCs0p0uDxMS1SRzXEtEfY0FF95ezm/ei5vwF0s=;
 b=JNLEmBdk6QaY3POwal2y4wEF9vwd+nhfL/1/raDPuDM1jnDvkxLBWvRdaOguZtWy5h
 rwJXPDpZRmf0dd7jdT6tyPG6Sr1cszrXvCcXc0iYCzECzomoP2jSf5CL/bZAODIHMbvH
 fzlpS613N06GzVDcnvhfTXjOcWVi/Wpo3bzXDhNkZV9FVCpKl0pqrLInW0P4DwSDWKE2
 +qaWuls95gJwZ4AntM8pHOUsDo07HUyfMMbjJhYOsesPhv2l31Qcw9pWXyR43UL9d5J1
 gbQL8abytC8YFWIbutItYniXZegBDgZznyi6I82w05cDGk/btIOfR4nTxU00a2/y01Fu
 QZOQ==
X-Gm-Message-State: AOAM530b7+mI8e/hTgdjGAOA2Gx+k8hXqI0tbqVxzAZbCeTLwjN9rhbo
 29Ryl0StqFPnNH/dPv1Seik6b+sFlsignHLiBuuM+w==
X-Google-Smtp-Source: ABdhPJxPTjfRiP0HOcrw5gVg1H5hz54Jg6hfc9ddjLJ3yOrvOvZH44bGlBjhUmBoDrJC2WKNq71v95I+IDXyVE0nvaY=
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr4166868wrq.263.1631108805677; 
 Wed, 08 Sep 2021 06:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-10-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-10-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 8 Sep 2021 14:45:56 +0100
Message-ID: <CAFEAcA-2bFpskmH6XRNk_Tn6x-4g476pY5nKq9Cpn=bV_D+62w@mail.gmail.com>
Subject: Re: [RFC v3 09/32] build-sys: add i686 cpu target
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Sept 2021 at 13:37, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Rust does not have i386 targets, so distinguish when target cpu is i686.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  configure | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/configure b/configure
> index 8adf2127c3..48ff2837d9 100755
> --- a/configure
> +++ b/configure
> @@ -617,6 +617,8 @@ esac
>  if test ! -z "$cpu" ; then
>    # command line argument
>    :
> +elif check_define __i686__ ; then
> +  cpu=3D"i686"
>  elif check_define __i386__ ; then
>    cpu=3D"i386"

This isn't what the 'cpu' variable is attempting to distinguish.
We care only about "is this the 32-bit Intel CPU family?", which
we for convenience name "i386". We do not attempt (at least not in
configure) to distinguish between different sub-flavours or
versions of that 32-bit architecture. (Similarly, 'arm' just
means "32-bit arm", and doesn't distinguish v5, v6, v7 or whatever.)

As it happens the existing C codebase won't work on a classic
i386 -- for instance the cpu_get_host_ticks() function
for i386 host is implemented as the 'rdtsc' insn, which
didn't come in until the pentium.

For native compilation, I guess we should just assume that
whatever rustc targets by default is the right thing.
For cross compilation we probably need some mechanism for
the user to tell us what the right rust cross target is,
the same way we currently have them pass a --cross-prefix
(which typically looks like a target-triple, but where the
cpu part of the triple isn't necessarily the same thing as
the 'cpu' variable configure is using.

thanks
-- PMM

