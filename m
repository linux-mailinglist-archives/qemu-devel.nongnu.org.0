Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB16C612B52
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 16:47:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opAVn-00027a-JX; Sun, 30 Oct 2022 11:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1opAVl-00025f-9w
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 11:46:09 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1opAVj-0000M3-Mi
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 11:46:09 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 d13-20020a17090a3b0d00b00213519dfe4aso8393837pjc.2
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 08:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HVqXVpHNSGUvCnjjELJoxCMuLNisKxs/jz2O/olF9yQ=;
 b=fbYmlvnaoeEGWEZeh1iz04UwHnqEBb71TrrdpAACG/2A0a/Rf0fqB+wcZwM8kh6OAE
 VCTvrvgFssBfsj/A9XBbQN/eGNq/0kFvXsNBNSIz+84Q1o/xxE0aTU1ExKNyiEbEC3o6
 w0x+sqwdJOzOO4hZl0RRGUev5VSMmFFF1GdmscpdsmTA7WXxtUqYoF6VXF2okS/+MreN
 3yxfQbCwviKk9ZWIVUo1AP+o0VOaEVGlZoLGqEHXzLQ62pDmUfrCzlCgQe8Eyshe5D5c
 gLv2Li88YY+/S//q60CrdPHD4ROvvgeev+f2AZmFxPz3ES4lMo+FXWZ/0IErA8pBfLnv
 6wBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HVqXVpHNSGUvCnjjELJoxCMuLNisKxs/jz2O/olF9yQ=;
 b=CV5a5j+nLN3uaGRNMAeMTxZkQyaVbBRVQB5WAwLrimtBSchf1DLJHXgAxYAuoFnfvA
 KBF7ra8hReiZ+mEZp2PyzWOH8OH2ViluoK2icceeNWGN4qsHuzzfbGYW/SUK6D5MwgBl
 OG0RZru40gxMo1FRXSbtyNz8A8t1uecs8tlsVvBNGfv7BYlPO/flGnCAq61igPuQlU0x
 23u12+QK8GbE3RuXyHW5YWfUkF8EWQYAWZMTZt9R2JzPUtAx6SuNm2aWs4FtYa6wYyIu
 UZfspY/LY66yPZkkSQ09ZfsGtUfjIU27uIOzKlxrcKg/0RHp02Vz8Ph6IbkrLmDgpk9i
 li6g==
X-Gm-Message-State: ACrzQf3FeQG+KmtQKWSzeN4brvWelFAr/x76WWwwhMqQXBMcLoS4/yzz
 gN4m8c8PDJ564huNPm8ofR5ZD1vhE4y6CqwV6ghfsQ==
X-Google-Smtp-Source: AMsMyM78ORezKwlOZq7NXus8WsMvTsHSotopYIu52EdngIEGLifp8v/r+0ArGmF1zsS5+SnGCYn453xKAH6fQtRFXx4=
X-Received: by 2002:a17:90b:4b81:b0:213:341d:3ea6 with SMTP id
 lr1-20020a17090b4b8100b00213341d3ea6mr10240606pjb.19.1667144765447; Sun, 30
 Oct 2022 08:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20221017062445.563431-1-richard.henderson@linaro.org>
 <20221017062445.563431-2-richard.henderson@linaro.org>
In-Reply-To: <20221017062445.563431-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 30 Oct 2022 15:45:53 +0000
Message-ID: <CAFEAcA-7q2fat9grNuTVcvzozTiCUBaPSSwqHLe02Dos7zFing@mail.gmail.com>
Subject: Re: [PATCH 1/3] tcg/sparc: Remove support for sparc32plus
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 17 Oct 2022 at 07:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Since 9b9c37c36439, we have only supported sparc64 cpus.
> Debian and Gentoo now only support 64-bit sparc64 userland,
> so it is time to drop the 32-bit sparc64 userland: sparc32plus.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc/tcg-target.h     |  11 ---
>  tcg/tcg.c                  |  75 +----------------
>  tcg/sparc/tcg-target.c.inc | 166 +++++++------------------------------
>  3 files changed, 33 insertions(+), 219 deletions(-)
>
> diff --git a/tcg/sparc/tcg-target.h b/tcg/sparc/tcg-target.h
> index c050763049..8655acdbe5 100644
> --- a/tcg/sparc/tcg-target.h
> +++ b/tcg/sparc/tcg-target.h
> @@ -25,8 +25,6 @@
>  #ifndef SPARC_TCG_TARGET_H
>  #define SPARC_TCG_TARGET_H
>
> -#define TCG_TARGET_REG_BITS 64

Why do we delete this?


> diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
> index 72d9552fd0..097bcfcd12 100644
> --- a/tcg/sparc/tcg-target.c.inc
> +++ b/tcg/sparc/tcg-target.c.inc
> @@ -22,6 +22,11 @@
>   * THE SOFTWARE.
>   */
>
> +/* We only support generating code for 64-bit mode.  */
> +#ifndef __arch64__
> +#error "unsupported code generation mode"

We might as well be more specific:
"no support for generating code for 32-bit SPARC"
(though I guess that configure ought in theory to prevent us getting here
in that situation ?)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

