Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1049E4B2504
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 12:58:07 +0100 (CET)
Received: from localhost ([::1]:56452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIUYv-0004S7-Qp
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 06:58:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nIUXS-0002s2-14
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:56:34 -0500
Received: from [2a00:1450:4864:20::42a] (port=40742
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nIUXM-00084t-M5
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:56:33 -0500
Received: by mail-wr1-x42a.google.com with SMTP id j26so3972583wrb.7
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 03:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MX81z94Hl6QTOXLHPfRW6jdMs6V8ozXJ7wSgWfakqy4=;
 b=Qf8GIbSVtBnn+9/5b9Pf/8DAcn9QD6luEX7QGEbpsUr3+STmudhzKQyGsTJDbq86oz
 rWC6Clxskq2BSr9yUavXN6ji4CFm1IHI6GQMwV67hCui2Hd0YNgdLwsBOLNynUhyVEks
 QDgXMyHv90pcuDgC8VnvtBEDl5iq0i8nSArtVhs+Gcgs36K0u2Xkx4fHdrwXNLyYBNtU
 1/VWoBNyRwBrdLDvoKN4WNwPg/Qnt0wSZAFMCO7BLwdzdT43nUVVRan99fU58Nz0UDmY
 GiTgo2D92rlZHaCcfaKYZpV9Aw/o6IrUBDRUPvMkOIAjlcIvDJdQX57IB8S5MAPrN61z
 gk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MX81z94Hl6QTOXLHPfRW6jdMs6V8ozXJ7wSgWfakqy4=;
 b=anwhajK4TZERe6fmzw2aBTQXDg8NUNvNpJhZ5z/cb367Mxv1dCowrIkdDoX8G5TpsW
 stkuDqsclATP7VDSO9822SkSs7V2ckB0+F8tApH1T4UgE35VOxV0tSaFDjMN02sTBfV4
 2ueRoYcsCC/6Mn/JsNUDOJlkxAeanDnyFj85IzEPMyRbOW9I3xIgsbBd0RcmjV8FS7BM
 4Kn2LeWRo2+sae6h30rIJOSTEL6A6yCCxQ+Vtf9sNdnQu451jMypUaN4E9CBs4wKYUDF
 aZBKmIXn+qVckCU/KrEmSDSTF0AIxk7cuuKkoI/XJCcUFB6TPmNOQbHMzkVRkNFynnpw
 nFjg==
X-Gm-Message-State: AOAM530TrYrbMKDkc+m5C8uvkrKYYGgp0W9LJfVYkEX9dA0QHMLO/5Hr
 F/EsQNx1CDWIWxDlykJgRLaysxLwLr6wVH3fu0nW6Q==
X-Google-Smtp-Source: ABdhPJy5ER3yRLIfUPmKHKil9BNMHyQuFvP2pgWwq2YxBgf2aruZWZwHAvGwxDzFrk1uu5fuL9fFkyX+oSMPnSHbSyc=
X-Received: by 2002:a5d:498d:: with SMTP id r13mr1139555wrq.172.1644580583205; 
 Fri, 11 Feb 2022 03:56:23 -0800 (PST)
MIME-Version: 1.0
References: <20220209230030.93987-1-f4bug@amsat.org>
 <20220209230030.93987-3-f4bug@amsat.org>
In-Reply-To: <20220209230030.93987-3-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Feb 2022 11:56:11 +0000
Message-ID: <CAFEAcA_DYEKgn31ULPVZzR9kQ32FZe+MBdkbC8cRNjy4Oa=7iA@mail.gmail.com>
Subject: Re: [PATCH 2/9] coverity-scan: Cover common-user/
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <Laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Feb 2022 at 23:12, Philippe Mathieu-Daud=C3=A9 via
<qemu-devel@nongnu.org> wrote:
>
> common-user/ has been added in commit bbf15aaf7c
> ("common-user: Move safe-syscall.* from linux-user").
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  scripts/coverity-scan/COMPONENTS.md | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/=
COMPONENTS.md
> index 183f26a32c..cea6695ecd 100644
> --- a/scripts/coverity-scan/COMPONENTS.md
> +++ b/scripts/coverity-scan/COMPONENTS.md
> @@ -127,7 +127,7 @@ usb
>    ~ (/qemu)?(/hw/usb/.*|/include/hw/usb/.*)
>
>  user
> -  ~ (/qemu)?(/linux-user/.*|/bsd-user/.*|/user-exec\.c|/thunk\.c|/includ=
e/exec/user/.*)
> +  ~ (/qemu)?(/common-user/.*|/linux-user/.*|/bsd-user/.*|/user-exec\.c|/=
thunk\.c|/include/exec/user/.*)
>
>  util
>    ~ (/qemu)?(/util/.*|/include/qemu/.*)

Note that there is no automatic process by which changes to this
file get applied to the coverity scan config, so hiding changes
to it inside a larger patchset increases the chance they get
overlooked (by Paolo, who gets to do the manual config update)...

-- PMM

