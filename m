Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E16359B6BF
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 01:31:15 +0200 (CEST)
Received: from localhost ([::1]:54110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPuPR-0007dj-Gb
	for lists+qemu-devel@lfdr.de; Sun, 21 Aug 2022 19:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPuMk-0005rz-1M
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:28:26 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:45922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oPuMh-0001OJ-U0
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 19:28:25 -0400
Received: by mail-pg1-x52c.google.com with SMTP id f4so6114115pgc.12
 for <qemu-devel@nongnu.org>; Sun, 21 Aug 2022 16:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=+CBOOh4eVN2R7OaZJbJKUnSztkggNIYmMSePGkwP4ng=;
 b=ka7d4B06Y91iAh82BZeSVzg/d0w0gyK86jA7+tsx0qBpv2jR0jfUy0TA8Bdnypk+7c
 wcGBlQU4jW9VunPqxHOn0vyMNO0LEwSSRF0DLH1c+PkPR3qGDufK02i/x1i91sC2j2Ht
 zovxATH9espitBuGLcb1LKY3UbpOcfwOQjRSjLLZw7QYpD9+YpxERnm1yUUksE22cOmo
 G0uwjStCfSs4ZtCuSTx9HgxMqy5+TiLaI0E/Qy1t5H2hrDnBGuv3D37xqnpRSPMZkysP
 KSRgFeb+5nV3pGBf9+7eaiuJhO63d2sn0eHntgsxsW8CdUpCsDcCxh9bFglmnyYAqZpT
 hGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=+CBOOh4eVN2R7OaZJbJKUnSztkggNIYmMSePGkwP4ng=;
 b=01Jw8ehT3jOfWUYj3m0P4n5CErWyI6ACiZkQgnWCnouEcMNHmq/JV/N/WNMbrLp5FY
 k6nwEmbCGRy/Za+dR6mCnSqR/IyoxoDmq4Mfi8dcD27/fjhfutPnOjfNXSnF3RKd7s9D
 vujfQhN5j3pFR3/tvrdSV4bGse+kIQC1wOmOTbsS3zJEByU2JeCgke+NfIEqcA0MFc4+
 GpmLvk6ODx5CdsM/f1kzh1aSb5ttjJkeDLtUURtq+QQIbGrjIEdMhm9X2oe4wPkeAhgg
 HBVDDpETWus9/rMu2TsFrFsLH1L8Jtsf972W/4FsJzqGT6+9HuGZ51lmFAJibgK3glmu
 ExSw==
X-Gm-Message-State: ACgBeo3Drl1z7BEwgDrKZeoozOmPh0OX06ii06KcO86tP4b7V3217q9L
 LxEupBKIvgyr8OiV8ViICZxrPa4fLOIcw2XSrdk=
X-Google-Smtp-Source: AA6agR5h4p4N7pcIUxpl0OtDT480qdLiNFXfwc/C4stOUIQgVSgIi8jaqeTx4jplYcg/Se7Vd2aMBS6TMwb0rEuhx1Q=
X-Received: by 2002:aa7:814d:0:b0:535:c875:dd4f with SMTP id
 d13-20020aa7814d000000b00535c875dd4fmr17916992pfn.4.1661124502006; Sun, 21
 Aug 2022 16:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220819032615.884847-1-richard.henderson@linaro.org>
 <20220819032615.884847-8-richard.henderson@linaro.org>
In-Reply-To: <20220819032615.884847-8-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Aug 2022 09:27:55 +1000
Message-ID: <CAKmqyKPvKjma0814hZKLhxWikRiLLU_s7dwpiU8kx29dSM2f6Q@mail.gmail.com>
Subject: Re: [PATCH v6 07/21] accel/tcg: Introduce is_same_page()
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, iii@linux.ibm.com, 
 dramforever@live.com, Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 19, 2022 at 1:26 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Ilya Leoshkevich <iii@linux.ibm.com>
>
> Introduce a function that checks whether a given address is on the same
> page as where disassembly started. Having it improves readability of
> the following patches.
>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Message-Id: <20220811095534.241224-3-iii@linux.ibm.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> [rth: Make the DisasContextBase parameter const.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/exec/translator.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/include/exec/translator.h b/include/exec/translator.h
> index 7db6845535..0d0bf3a31e 100644
> --- a/include/exec/translator.h
> +++ b/include/exec/translator.h
> @@ -187,4 +187,14 @@ FOR_EACH_TRANSLATOR_LD(GEN_TRANSLATOR_LD)
>
>  #undef GEN_TRANSLATOR_LD
>
> +/*
> + * Return whether addr is on the same page as where disassembly started.
> + * Translators can use this to enforce the rule that only single-insn
> + * translation blocks are allowed to cross page boundaries.
> + */
> +static inline bool is_same_page(const DisasContextBase *db, target_ulong addr)
> +{
> +    return ((addr ^ db->pc_first) & TARGET_PAGE_MASK) == 0;
> +}
> +
>  #endif /* EXEC__TRANSLATOR_H */
> --
> 2.34.1
>
>

