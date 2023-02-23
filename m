Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B986A0D9D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 17:11:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVEBN-0002AC-Ng; Thu, 23 Feb 2023 11:10:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEBJ-00029j-Qy
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:10:53 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEBI-0007yR-By
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:10:53 -0500
Received: by mail-pg1-x531.google.com with SMTP id q189so5761194pga.9
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 08:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=azSLsfVfdpT+Jqtw1PJLsdYyVCFwMN5mJcqBgw1Wuho=;
 b=dkyidW4oMnJINyh0UZKatu3lcDKsLqnBszbwB70q8hI9+v94n2cR7cGoA9BN5Hi1+2
 wdkTPbOLmiI1f97stN9domG3Hu9/JMvlE+/+c6PevcQVpnDU2j7iRsS9P8ygZYDwCDKl
 lDTJ5FHuluHcD/fddK9bdTiaXw1BIGEl1Mz1xkfOrfrsLtprucgPiXyhaRvnubBGseyq
 drQ8fGmXBYG5IRZX8F0Tge9uI9ZYS926gQd9D+9Gc+7y+nFmNESHv49z5FVVIyeQOhit
 FEbR9/UMHQPlDbaXRFqSun9Dj1zg+Bm9jJRi4W4aOWhKPi7amyJaVharEwVBW1fD4uBM
 VEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=azSLsfVfdpT+Jqtw1PJLsdYyVCFwMN5mJcqBgw1Wuho=;
 b=Ix8zEqe+3XRYJUM9S2tL6J8UgugyFE3d+aeHxoDPqJWmlug5pvULsL0KDa4tSXCHm+
 BN7jNsHVIKAx2ktfiP6hffS+3zwYfkQ1cEu+UWL2nKew9DZtOJC5UIxHazDwQByqQa/O
 hpqnP2xpIvM03avNyqUdJOOciPjV4S24J13uwMVmh8AZRclroqbqsUS8SO96XC7m4p4x
 41nihlO2iHRbSA4Ixo8TphJ3942xdzlTpufKfwqpGvafGW3nFQ3LbutVLqqsvteG8Yxq
 aKH0afJdPOEoQ92Ysjv2kr86u5kXD9CEa4P7yElF7bBlC3ILX8F5fne0S9Ydqysl4Usr
 xKKg==
X-Gm-Message-State: AO0yUKU+NJfHBVVCUrmO54oeQSGoKn1hZmEsznvs99mm6UZMduDFXun5
 4K6tjgZrTYjVtEIeqWZoLFsIt+5dn8jc/0ov0C8igg==
X-Google-Smtp-Source: AK7set9vuYeF0Xe7f7EShB2V2tsPZgz9wVdBwlJzwI7oVjr6m4a63f3HAnR3wfhBdSmksvcO2SQPMAmlrZBhhP+yehE=
X-Received: by 2002:a63:7985:0:b0:502:f5c8:f5c8 with SMTP id
 u127-20020a637985000000b00502f5c8f5c8mr443763pgc.9.1677168650653; Thu, 23 Feb
 2023 08:10:50 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-14-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 16:10:39 +0000
Message-ID: <CAFEAcA_imbURUjmtHsKsRy5WarwLv4pBq_PSLgOdfFQ8E8dE2w@mail.gmail.com>
Subject: Re: [PATCH v1 13/19] target/arm: Pass single_memop to gen_mte_checkN
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 16 Feb 2023 at 03:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pass the individual memop to gen_mte_checkN.
> For the moment, do nothing with it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.h |  2 +-
>  target/arm/translate-a64.c | 26 +++++++++++++++-----------
>  target/arm/translate-sve.c |  4 ++--
>  3 files changed, 18 insertions(+), 14 deletions(-)
>
> diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
> index 3fc39763d0..b7518f9d34 100644
> --- a/target/arm/translate-a64.h
> +++ b/target/arm/translate-a64.h
> @@ -54,7 +54,7 @@ TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr);
>  TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
>                          bool tag_checked, MemOp memop);
>  TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
> -                        bool tag_checked, int size);
> +                        bool tag_checked, int size, MemOp memop);
>
>  /* We should have at some point before trying to access an FP register
>   * done the necessary access check, so assert that
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index e02bdd3e7c..1117a1cc41 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -288,7 +288,7 @@ TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
>   * For MTE, check multiple logical sequential accesses.
>   */
>  TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
> -                        bool tag_checked, int size)
> +                        bool tag_checked, int total_size, MemOp single_mop)

Argument name in function definition should match the one in the
prototype.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

