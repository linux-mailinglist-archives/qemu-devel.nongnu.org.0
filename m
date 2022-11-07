Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5FA61FE62
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 20:13:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os7Xq-0007fx-EE; Mon, 07 Nov 2022 14:12:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1os7Xo-0007fo-V7
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 14:12:28 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1os7Xn-00015H-44
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 14:12:28 -0500
Received: by mail-wr1-x433.google.com with SMTP id l14so17721680wrw.2
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 11:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1gfcMaZESHnrCuwv0txin9+Z4fZhAvyki1TnPyG1Ras=;
 b=ux4WBcb14jcdUfIIV60Kn2IGhbwZdvtHUwfvY1/Ho4apq17E1RGFn+Y6ZQU0DPXKxI
 ziziW2EZXlBEwQ+Ywzm7KRNNQKRYOLHCdj3bvUX8Z4U+8A7OcUyeDKLhsbMnF1T5/XT2
 3DVJYvNa/HCI/0DttElZr65YuyzDiDhLZOw5JDwz5uEERmB/ezGAdcVdv79nbD8gRtMj
 z+w59pSmPkCoBnP3Q3Fq4hqzNuHRwVe560znWJsCeaQVzWUcSIxUJ6M8aoo2xFp1xCM2
 jdgX2k3iLfa22pqfIFShFCA5zO1Pyz9vTYBKFyfLgRLdLrK+ib8KFMnCkMwjiSHTETO5
 OINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1gfcMaZESHnrCuwv0txin9+Z4fZhAvyki1TnPyG1Ras=;
 b=HqgIECokXXjAlYgxjE1Ov8PM1Myubaizp1rDphl6EmmER2vzEl+8R+7zLw4iyc71y1
 ZTEF42QBoWR2yg1RA2VER2QEQYUA78giPAVJxTgvAqlRNwvonPG9OuZPzDxaXvVZh1RX
 U2BS1yJwuXr6ZXFoEzZUiiZ+zSDcVato0fFNx8b2jXj4ln2rQiFrELV+UGXx2B5BOcVK
 RTDns200Km4RvDxWy/TzIUEaGMvbLAD4c34dqI7V98iE1Z2gOS5lTsRtdaSgXqBsZJai
 RH0fkoter+xHX+VgC1pVc8Ah0xb/376SDffMczDciHI/xx4ufkI6NwSg3JdSlBTo9ren
 POgA==
X-Gm-Message-State: ACrzQf0jPjApBrHeDH3OR9brN0GHSv9l3yEcw1bbzCEEoRUh5VWg/+CA
 RWs/qccrgbGJUCFx/4j9hUJ6yg==
X-Google-Smtp-Source: AMsMyM7I8Xa1qyghaPbFzul4MhvCcw7KJdEabuPN7XqfywRIn/oCvn0xy4KNUONtEpdqsM87VJwLgg==
X-Received: by 2002:a05:6000:1566:b0:236:6a6f:6c27 with SMTP id
 6-20020a056000156600b002366a6f6c27mr32777346wrz.553.1667848344867; 
 Mon, 07 Nov 2022 11:12:24 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a1c7905000000b003cf6e1df4a8sm8705086wme.15.2022.11.07.11.12.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 11:12:24 -0800 (PST)
Message-ID: <0864b291-c9b7-bdff-bda4-124ff7c8d957@linaro.org>
Date: Mon, 7 Nov 2022 20:12:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] hw/sd/sdhci: reset data count in
 sdhci_buff_access_is_sequential()
Content-Language: en-US
To: Mauro Matteo Cascella <mcascell@redhat.com>, qemu-devel@nongnu.org,
 bin.meng@windriver.com
Cc: XRivenDell@outlook.com, coc.cyqh@gmail.com, ningqiang1@huawei.com
References: <20221107103510.34588-1-mcascell@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221107103510.34588-1-mcascell@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 7/11/22 11:35, Mauro Matteo Cascella wrote:
> Make sure to reset data_count if it's equal to (or exceeds) block_size.
> This prevents an off-by-one read / write when accessing s->fifo_buffer
> in sdhci_read_dataport / sdhci_write_dataport, both called right after
> sdhci_buff_access_is_sequential.
> 
> Fixes: CVE-2022-3872
> Reported-by: RivenDell <XRivenDell@outlook.com>
> Reported-by: Siqi Chen <coc.cyqh@gmail.com>
> Reported-by: ningqiang <ningqiang1@huawei.com>
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> ---
>   hw/sd/sdhci.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 306070c872..aa2fd79df2 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -978,6 +978,10 @@ static bool sdhci_can_issue_command(SDHCIState *s)
>   static inline bool
>   sdhci_buff_access_is_sequential(SDHCIState *s, unsigned byte_num)
>   {
> +    if (s->data_count >= (s->blksize & BLOCK_SIZE_MASK)) {
> +        s->data_count = 0;
> +    }

You avoid an off-by-one but now the model doesn't work per the spec.
Not really what the best fix IMHO.

>       if ((s->data_count & 0x3) != byte_num) {
>           trace_sdhci_error("Non-sequential access to Buffer Data Port register"
>                             "is prohibited\n");

I wonder why sdhci_data_transfer() indiscriminately sets
SDHC_SPACE_AVAILABLE in the write path (at least without
clearing the FIFO first).

The fix could be:

-- >8 --
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
@@ -955,5 +955,5 @@ static void sdhci_data_transfer(void *opaque)
          } else {
              s->prnsts |= SDHC_DOING_WRITE | SDHC_DAT_LINE_ACTIVE |
-                    SDHC_SPACE_AVAILABLE | SDHC_DATA_INHIBIT;
+                                           SDHC_DATA_INHIBIT;
              sdhci_write_block_to_card(s);
          }
---

Bin, what do you think?

Regards,

Phil.

