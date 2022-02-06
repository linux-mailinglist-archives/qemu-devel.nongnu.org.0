Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D5A4AAEE8
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 11:55:31 +0100 (CET)
Received: from localhost ([::1]:38004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGfCY-0005k1-6Q
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 05:55:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nGezk-0000Fb-ML
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 05:42:13 -0500
Received: from [2a00:1450:4864:20::430] (port=45028
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nGezi-00044T-Pi
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 05:42:12 -0500
Received: by mail-wr1-x430.google.com with SMTP id k18so19745290wrg.11
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 02:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rgos2MRD1ymHAXF2H7QIlSA/AJ/SS/QL8FJwHcs9yVQ=;
 b=Mdl7yJXD/3MrJGImbbccQHMFMdrhc/hxXZhR+0HPnP35v45BR+DT0BannZE/bsiWID
 5myn72WoCgd5lEd0MOkOqE9hnJb+dcSlN4AY/LJBJ365Vgz8aRtJStIsnJT2PtvcgSG0
 eYP5H2HG9ylGxtlTabzMNs8b2wp523hWWp0X+lYoryjb+W9f8GFreWuM5R8qhZbOEWHe
 ZNnzblrMkrPhkgxmK4VTIqB8uskaQ93nxIGWS2HukL+MgJ1yduAy6e+mlaPIWo1r2CIv
 yAJwTqJ/dOG+y+hHubRrAZIGOAzeQcmrKe/H79O36qk/LKFEHUcd46LPfx/k1FtPaDE0
 4wMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rgos2MRD1ymHAXF2H7QIlSA/AJ/SS/QL8FJwHcs9yVQ=;
 b=rrvnZwwM2TPSwyNDSM2ys++rHIrUuHwpjY5wbMt5HxS5RVp/AluIKtB7xGu2h43iyM
 og+DABcwlCv7AbUuN8bT3TzCX/rjdLREye5L1cenlQLxYyPR9z81qB0iMcKX+gv8BZ6z
 KtnUhje28Ei9ZPc97CQKosCWLvF6Z1wNYY8bRyol3YMhMdSqiWnDMi1nfbEOJcW611PQ
 XE7OpiWzwKkWZoL5ChtgDxKxljwr+9PaWKuJymQsFVokN0SU0kYS5/WxW18QseAh5AV0
 tihEEpYRpagUw5p9U7d1hlR9SpSWnzc35V5ChgY1hrOaVlvX54aXsEZpXAUPTDXp9Wtw
 cj7g==
X-Gm-Message-State: AOAM5326ZkmU3QFwWTWjNNv2byjclzFWtglGDwoU44xEzrRIR522Muo9
 eaEp+kH+nDhGaP7yTiuDELLs41I3CI65cnf/DwjM1w==
X-Google-Smtp-Source: ABdhPJyUNyoYGAR27rch6z4RCjyNifRkL8CKl2knKE/pHA87g8BQZa1gcgOOYNbOYrpoeDm0iog80N2qw7l+6dowsDs=
X-Received: by 2002:a5d:6d8d:: with SMTP id l13mr3405675wrs.295.1644144118376; 
 Sun, 06 Feb 2022 02:41:58 -0800 (PST)
MIME-Version: 1.0
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
 <20220204165506.2846058-7-peter.maydell@linaro.org>
 <06bc9314-2f23-4a0d-4ae5-8695a93778a2@linaro.org>
In-Reply-To: <06bc9314-2f23-4a0d-4ae5-8695a93778a2@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 6 Feb 2022 10:41:47 +0000
Message-ID: <CAFEAcA-0-U0ugC_7O06f0PzzxzRtFWutCAKCsSDb0Ha19ZSzsg@mail.gmail.com>
Subject: Re: [PATCH 6/6] target/arm: Support PAuth extension for hvf
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 6 Feb 2022 at 00:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/5/22 03:55, Peter Maydell wrote:
> > Currently we don't allow guests under hvf to use the PAuth extension,
> > because we didn't have any special code to handle that, and therefore
> > in arm_cpu_pauth_finalize() we will sanitize the ID_AA64ISAR1 value
> > the guest sees to clear the PAuth related fields.
> >
> > Add support for this in the same way that KVM does it, by defaulting
> > to "PAuth enabled" if the host CPU has it and allowing the user to
> > disable it via '-cpu pauth=no' on the command line.
> >
> > Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> > ---
> >   target/arm/cpu64.c | 14 ++++++++++----
> >   1 file changed, 10 insertions(+), 4 deletions(-)
>
> Currently not a problem in practice because M1 doesn't support PAuth, so the ID fields are
> already clear.  However, it is a confusing difference to kvm, and presumably some future
> Apple chip will enable PAuth.

No, this is an actual bug that was reported to me. The M1
does support PAuth, with an IMPDEF algorithm (and no
support for QARMA5), and we were suppressing this by
clearing the ID register fields.

thanks
-- PMM

