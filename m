Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70674B4FEC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 13:21:18 +0100 (CET)
Received: from localhost ([::1]:49816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJaM2-0001CD-1S
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 07:21:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJaHt-0006qR-Ue
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:17:01 -0500
Received: from [2a00:1450:4864:20::32b] (port=46994
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJaHs-0001KD-9T
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:17:01 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 l67-20020a1c2546000000b00353951c3f62so10701942wml.5
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 04:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VnDKhTcDu+C1GF3vqYrUxuEQUdd610FxDp/q/Y+4EGE=;
 b=foW16MfYO5R/xQdBgRSUfwjdH5QMitnLkW/VKqwQ50tDrKWcUdkCVSWG5FFvOIXkbX
 x/01D81g/hdHQ7a9kbZEFTjDoiSKnJZ+kMCx5ocUqVCtx614yxdAm1m5k/o3wrnkcQ7Z
 3Gw8UQF2T2eodEiwO774pxahxmbCk4EeXYwFJKIm7FUIzKY1wozm7qZ6BdskIDDXAoCN
 iOAiR46lxBH5setQj76zVpqVY2qLeuRV9MlRtn5HxKWPK2SiYx+ByMTcduEcWfLZ0xTt
 Pu4lx2CbeYpuSi/Zxr8WxvV8CPuxB+kAI+SETY4txbFwZKeiyZe5SVHvohIindwApXV4
 ULjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VnDKhTcDu+C1GF3vqYrUxuEQUdd610FxDp/q/Y+4EGE=;
 b=xOTPifuGZ6cj7hiFRVewoMpKPxv2bOUjH6rKtiP/JQzQqlONEZkVTDflf1cDIA1BwQ
 3XOTbX1KxTldpcfDtFZJKUITmbKHY0+SWsqgU3VLz+oZFnoAb1JkJG3Yx3lpoAUk7NFZ
 gCNab96WvoTvcDUCNWh3sFj+ohbzp611oOvObkqMsW9GzF/HC+AjLlCtH2BmcaAWm5H6
 FZ2zjBKUr6cbu9dctjlWILJlZQY1IX8qmdXo8WGl04Nzw3jXCgo2OHjHNZnmNn7D0sAh
 pgDJSVkEBVfRIK4HisZPq+/Ww2pcmfjbYzEFQKtplRwDs58hQTEuJ/a4wvpme7MeHs/U
 5TUw==
X-Gm-Message-State: AOAM532xkDOWpG0UsPSkm2rVnYSb3HuYv/H0Fs3KxGerIMMCuVArxmPC
 VrHFDqmJdCFVlO9HJwbWVShJSiTGgpQ=
X-Google-Smtp-Source: ABdhPJyBovtOj6A0yBKuHZq8PiyxubhDFZhq1HXA6nWMeZyyhGCvvfdgqyupOd6NHE+2YzKwp4XyPQ==
X-Received: by 2002:a7b:c778:: with SMTP id x24mr10791843wmk.11.1644841018004; 
 Mon, 14 Feb 2022 04:16:58 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id o16sm17209181wrn.87.2022.02.14.04.16.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 04:16:57 -0800 (PST)
Message-ID: <2f6b8e88-6336-c6ae-257f-6e637d3b3a85@amsat.org>
Date: Mon, 14 Feb 2022 13:16:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH] hw/i386: Improve bounds checking in OVMF table parsing
Content-Language: en-US
To: Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 James Bottomley <jejb@linux.ibm.com>
References: <20220214120857.1147288-1-dovmurik@linux.ibm.com>
In-Reply-To: <20220214120857.1147288-1-dovmurik@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 14/2/22 13:08, Dov Murik wrote:
> When pc_system_parse_ovmf_flash() parses the optional GUIDed table in
> the end of the OVMF flash memory area, the table length field is checked
> for sizes that are too small, but doesn't error on sizes that are too
> big (bigger than the flash content itself).
> 
> Add a check for maximal size of the OVMF table, and add an error report
> in case the size is invalid.
> 
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> ---
>   hw/i386/pc_sysfw_ovmf.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/pc_sysfw_ovmf.c b/hw/i386/pc_sysfw_ovmf.c
> index f4dd92c588..0663f3f54a 100644
> --- a/hw/i386/pc_sysfw_ovmf.c
> +++ b/hw/i386/pc_sysfw_ovmf.c
> @@ -24,6 +24,7 @@
>    */
>   
>   #include "qemu/osdep.h"
> +#include "qemu/error-report.h"
>   #include "hw/i386/pc.h"
>   #include "cpu.h"
>   
> @@ -66,7 +67,13 @@ void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
>       ptr -= sizeof(uint16_t);
>       tot_len = le16_to_cpu(*(uint16_t *)ptr) - sizeof(guid) - sizeof(uint16_t);
>   
> -    if (tot_len <= 0) {
> +    if (tot_len < 0 || tot_len > flash_size - 50) {

Please use a definition instead of this magic '50' number.

> +        error_report("OVMF table has invalid size %d", tot_len);
> +        return;
> +    }
> +
> +    if (tot_len == 0) {
> +        /* no entries in the OVMF table */
>           return;
>       }
>   
> 
> base-commit: 48033ad678ae2def43bf0d543a2c4c3d2a93feaf


