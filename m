Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502E05BE753
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 15:41:39 +0200 (CEST)
Received: from localhost ([::1]:47052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oadVJ-0001so-Gu
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 09:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaaz7-0004TH-3A
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 07:00:17 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:39647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaaz5-0001ge-Eh
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 07:00:12 -0400
Received: by mail-ej1-x62c.google.com with SMTP id y17so5210010ejo.6
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 04:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Hm/eNbhQUwswrxe8zDc5uRil7lz3tFxq2uFML034/1I=;
 b=ug1NpBvrjBK+HNgpAkgUfFP4pkAja6iTcUKekzYqBNjITKNdFVhHjN5P7zdEjafRYo
 qoE8wrk+MrKTUQq2/6ECyuYBJ8QdlgwTqM/eknHbJGcxPBt+PUGEVv6FsdC4FFahM+GZ
 7a1Xcz7wPsIjhxMu23qMYYLSG6biAfw/KQsWs6TQKFYYEKCu51scGsagbw2Ee4QBc7TP
 BzEXQL4m91N9GCWE4IM0T9xGINI/vtwRx8WGaKzX+VnsyU4JHS2Xtusc1ZKwjP3nI1ab
 C6csohN5PtaIEglY+IyJrUNhNeCr21tiaFwGZMmV4oxKrJKHGM4846QI0RKFsiTsO/GU
 JSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Hm/eNbhQUwswrxe8zDc5uRil7lz3tFxq2uFML034/1I=;
 b=hCVHL1BxsOljEN7+6X4B5GlIdBbcxcmHrpDdYMTAkE44WSKQqg8z9K9/l3hHRmFicT
 W82DqX8gpBHjdSnb6P/JrPVeZkGnawvUo9XVg3aoSKZ/satP+8GRRL4dWOKCd1f6BqoG
 F8qc1yt0XpIsFshbMFs5+C7VgL5Dzis3bOiNVUKkFNjslzCBOUHXU4R6X+CqFZzaiTMh
 cOHau9DTbBUaIJoYQMGGz6Uxg2bj+P4Rd+Df9XtKDV2m4WePrMzmouurGRJHN0Wcqw/d
 QLnr4GCBwnauXU4014oGdEoAvPBEeMZdlmCf7wTwimNiUxTzmO8m5frBpjQp95psp+bT
 vAoQ==
X-Gm-Message-State: ACrzQf1P6iICIw5uogpwPfizKYW6sRMa5vcVeDaf1T6XqZvFtu6p6dUz
 9epmqGIKJmK6ayZ91Yw9gTDLfXSOzf2rW6MDKH3p1w==
X-Google-Smtp-Source: AMsMyM4QSAulfnXPlTCQ3sap/7tvTPkgCsWldlDvJwWER8XgGpomvlEJRfBydfjteLSsyTVLdQ0HPCmJky53I+AMfNA=
X-Received: by 2002:a17:907:7209:b0:778:e86e:568 with SMTP id
 dr9-20020a170907720900b00778e86e0568mr16924724ejc.659.1663671609990; Tue, 20
 Sep 2022 04:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220905202259.189852-1-richard.henderson@linaro.org>
 <20220905202259.189852-7-richard.henderson@linaro.org>
In-Reply-To: <20220905202259.189852-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 11:59:58 +0100
Message-ID: <CAFEAcA-gmdOJpxg6oUK+CPPzipo8UsOqFyb-O05weiLS8aF6JA@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] include/exec: Introduce TARGET_PAGE_ENTRY_EXTRA
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, qemu-arm@nongnu.org, 
 pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 5 Sept 2022 at 21:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Allow the target to cache items from the guest page tables.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu-defs.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
> index 5e12cc1854..67239b4e5e 100644
> --- a/include/exec/cpu-defs.h
> +++ b/include/exec/cpu-defs.h
> @@ -163,6 +163,15 @@ typedef struct CPUTLBEntryFull {
>
>      /* @lg_page_size contains the log2 of the page size. */
>      uint8_t lg_page_size;
> +
> +    /*
> +     * Allow target-specific additions to this structure.
> +     * This may be used to cache items from the guest cpu
> +     * page tables for later use by the implementation.
> +     */
> +#ifdef TARGET_PAGE_ENTRY_EXTRA
> +    TARGET_PAGE_ENTRY_EXTRA
> +#endif
>  } CPUTLBEntryFull;

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Shouldn't be too painful to adjust in future if we decide we don't
like doing it by macro magic, I guess.

thanks
-- PMM

