Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6826F564D1D
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 07:40:43 +0200 (CEST)
Received: from localhost ([::1]:54100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Ep8-0005X5-Hw
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 01:40:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8Emc-0004pZ-O6
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:38:06 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:33692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8Ema-0004GS-Sd
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:38:06 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 j1-20020a17090aeb0100b001ef777a7befso2465756pjz.0
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 22:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fu5ImAVC+xNlXVnpf/2PJAwAASNFkreXtyPB8cr/L2o=;
 b=g+k7QvqGRU5m89LWJW9qqVMMJbGeAMw6txJPtxM7UX3gckoWUTq4TP27Xcc78ew0e+
 OAjjfoPCnLCxnq5aBkymswHrwMe+EVAGbStAZrawMJMcywkKa3Q/5DDLYQK6ielcX6J+
 wF+xh0f/OowewiMwgGGmD2bzB0AbfK/lqI5PIQSv3Q4t6xBLBMx7iyXdRjXfH9ki7tl8
 MFo7lpZ+zS/lynDIF++n94oECGOaq40ejF0og+3FzJUG+CZbyaBh3gtnStmHhANnyvWd
 QSAL477p0iLWCX4BOtzdl5N97pqhhK5c0JkX5TNrhB29Fi6I9GnMiP26fmjxxTtqCygS
 zEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fu5ImAVC+xNlXVnpf/2PJAwAASNFkreXtyPB8cr/L2o=;
 b=wmccsk5300FHy2bS5AVooH1oiM+ZNG/miv9p2uELgRY5S+sgGT2y2gRA+KSIBE8ErY
 Iux6zi+bvUaa74Ci70rxkycaFt/8UrhseYGQcbbKWpRz+VkAop+EkOxRiu+inYS4k8Jb
 ao0IwhK0yfApI4NSv8FBKM4LyiS6t5qXuK8NguUj6u5pVffZ/piK54eXWYgtX33MJaPE
 5yNufFaDxw4ZD1hG/2U+pF1+BhZFXj170QPOonwRGjH4XR6Q6Ixgx7rcFOM0judA9u3V
 mH7kR3a6tvBvpLbOHoQRCfc41NHtYWd3UuC+c8bu5FzOIik/OCuurJP1MD9FdbxfXziz
 WxTA==
X-Gm-Message-State: AJIora/Urpcpbo8LC1T4USLnYyFJxClyGAa+tJ+YVtRqQw/8vJsVF66t
 W121ILvoU7YnRQRZQEyS3fQzIw==
X-Google-Smtp-Source: AGRyM1sDi860PaRuKdA8FzkUruMrpKMY5NBO2QAD8oCWqh2G6qqeZVcxk3Yrq5kfROxNLqrjKT68oA==
X-Received: by 2002:a17:90a:1943:b0:1ef:8146:f32f with SMTP id
 3-20020a17090a194300b001ef8146f32fmr7789413pjh.112.1656913083036; 
 Sun, 03 Jul 2022 22:38:03 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 ik24-20020a170902ab1800b0016bdf0032b9sm1855551plb.110.2022.07.03.22.37.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jul 2022 22:38:02 -0700 (PDT)
Message-ID: <b73e54dc-a224-8413-f4cf-91da6bd346a0@linaro.org>
Date: Mon, 4 Jul 2022 11:07:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 11/11] hw/intc/loongarch_ipi: Fix mail send and any send
 function
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
 <20220701093407.2150607-12-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220701093407.2150607-12-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 7/1/22 15:04, Xiaojuan Yang wrote:
> By the document of ipi mailsend device, byte is written only when the mask bit
> is 0. The original code discards mask bit and overwrite the data always, this
> patch fixes the issue.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   hw/intc/loongarch_ipi.c | 45 ++++++++++++++++++++++-------------------
>   1 file changed, 24 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/intc/loongarch_ipi.c b/hw/intc/loongarch_ipi.c
> index 553e88703d..e4b1fb5366 100644
> --- a/hw/intc/loongarch_ipi.c
> +++ b/hw/intc/loongarch_ipi.c
> @@ -50,35 +50,40 @@ static uint64_t loongarch_ipi_readl(void *opaque, hwaddr addr, unsigned size)
>       return ret;
>   }
>   
> -static int get_ipi_data(target_ulong val)
> +static void send_ipi_data(CPULoongArchState *env, target_ulong val, target_ulong addr)
>   {
>       int i, mask, data;
>   
> -    data = val >> 32;
> -    mask = (val >> 27) & 0xf;
> -
> +    data = address_space_ldl(&env->address_space_iocsr, addr,
> +                             MEMTXATTRS_UNSPECIFIED, NULL);
> +    mask  = 0;
>       for (i = 0; i < 4; i++) {
> -        if ((mask >> i) & 1) {
> -            data &= ~(0xff << (i * 8));
> +        /* bit 27 - 30 is mask for byte write */
> +        if (val & (0x1UL << (27 + i))) {

UL suffix is never correct, since it means different things on different hosts.
Anyway, you don't any suffix here.

How often does mask == 0, so that all of val is written?  In which case you could skip the 
load.

r~

