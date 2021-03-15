Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6B233AE44
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:14:42 +0100 (CET)
Received: from localhost ([::1]:51918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLjJB-0006sj-5L
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLjIK-0006TH-0t
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:13:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLjIG-0006p9-14
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:13:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615799622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xf4Nzibpai3YQHNBUQDizMSEjC/zerMhUal1UPrXWfo=;
 b=PDQs3nCz0X4D+5gIxkX+FVtBe/pQR6XAMSrmOuu/056EZ418javtnoVnntJn9Gw7nxQm1B
 V9FOXqwpnUPpkxG1QNNF9jUMnKuzNrZFRkoqg/U6jc1ickRJQZ+EcgExXIpBnxtz22txz9
 DW58Ehq/GbVXN6TgsuE8B2ZrFucp+JY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-vKmuFXueOMSvF10XLoyi9Q-1; Mon, 15 Mar 2021 05:13:41 -0400
X-MC-Unique: vKmuFXueOMSvF10XLoyi9Q-1
Received: by mail-wm1-f71.google.com with SMTP id y9so2663823wma.4
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 02:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xf4Nzibpai3YQHNBUQDizMSEjC/zerMhUal1UPrXWfo=;
 b=fM+9N44DWwYbfpbet0mCqRNbu6XS0lfMB1OWRQq9um0Zd4nKABZwaCiT98QqYxEQ2v
 e2MdQ0m0nNlZLjYfiHt35Vn82iyYzzbEY3Y+HRoi7HKWH2BvYiqkZCtmuepPluwcsvgj
 CnOWGwl1z/Qe9LtaxxbW+U3gn0WeLLKU+GOq/LI5Y0xV/gsKaggr6nC7033Dca6WA1oA
 M27JfLvmZmCzl/WiAtxh5ulEJb9lQrIipGk49Ku8HETkCOVuhy0HYfkwDvSIi3vV0Sho
 5ornWUwxDi7pA6DSrRlD2sEAP3j8zf1Gyb2gTO/NaTntgdJy89qlJOc5lypQqQkmSl45
 OvqA==
X-Gm-Message-State: AOAM533uaISgP8UftIyY7NAzSsbjxdsQrw5BrndJcbNsdEWC8adSdTRe
 CeCBoXLonGZ1PL/F5EcYkEovIwvVIrMQwkEeNTgG4V1gD0SkhP+22+gMuVgoqzNpITIknvE8VP7
 HHW7G38mPgww/rELQloQZpqo9/GSP5ymb+azxNq4ZkhQ8ST7zaglIiTIH1q6IJAh6
X-Received: by 2002:adf:fec5:: with SMTP id q5mr25348198wrs.43.1615799619877; 
 Mon, 15 Mar 2021 02:13:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwAZssuwlq1xefnhGWCCoIJXiNOF/0RRGkla8l7S53QhNHRrsBUb1UR96hdDZz90FUViPP0w==
X-Received: by 2002:adf:fec5:: with SMTP id q5mr25348176wrs.43.1615799619675; 
 Mon, 15 Mar 2021 02:13:39 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id a5sm17883388wrs.35.2021.03.15.02.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 02:13:39 -0700 (PDT)
Subject: Re: [PATCH v2 01/13] net: Add ETH_ZLEN define in eth.h
To: Bin Meng <bmeng.cn@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210315075718.5402-1-bmeng.cn@gmail.com>
 <20210315075718.5402-2-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <236293f1-c23c-78a9-3e1f-7b523280262a@redhat.com>
Date: Mon, 15 Mar 2021 10:13:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315075718.5402-2-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 8:57 AM, Bin Meng wrote:
> Add a new macro ETH_ZLEN which represents the minimum size of an
> Ethernet frame without FCS.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> 
>  include/net/eth.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/net/eth.h b/include/net/eth.h
> index 0671be6916..7c825ecb2f 100644
> --- a/include/net/eth.h
> +++ b/include/net/eth.h
> @@ -31,6 +31,7 @@
>  
>  #define ETH_ALEN 6
>  #define ETH_HLEN 14
> +#define ETH_ZLEN 60     /* Min. octets in frame sans FCS */

What means 'sans'?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>  
>  struct eth_header {
>      uint8_t  h_dest[ETH_ALEN];   /* destination eth addr */
> 


