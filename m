Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED55633D682
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 16:10:20 +0100 (CET)
Received: from localhost ([::1]:48584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMBKu-0001aV-0p
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 11:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMBJr-0000yA-RZ
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:09:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMBJo-00040a-Rt
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 11:09:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615907351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vyz4nvL8a7Xgbvr4EhZlBUUsvnNSBA4mWCLrCFCoLj0=;
 b=L0E38GEy6UTK0JQzwXfnBo47JmjT7AQi549kL021k4kExPTR7WmsiWVuYZmv8JuliEaDhn
 1kI+CDKQJDFTlpaAClt5cTyxsmQHpn+J32LnVtIMAvZ23ak/pD8GDhjvQgG+CRGaJuPFLl
 zPS6SbhjV83JWLPOPACGR+LZr3irvFo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-qWW5xFNkPYKuO1vy-khmxg-1; Tue, 16 Mar 2021 11:09:10 -0400
X-MC-Unique: qWW5xFNkPYKuO1vy-khmxg-1
Received: by mail-wm1-f70.google.com with SMTP id o9so3459387wmq.9
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 08:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vyz4nvL8a7Xgbvr4EhZlBUUsvnNSBA4mWCLrCFCoLj0=;
 b=rR+ZeTdXJPhvrprWpuBI3wLhX7UXGPPChOHB90w/1Da7E82zKEWbPcBM8TaJCkqXQs
 aLuncMBfz6Jtb+wRhYqRbMMMwrqBb4BKsI7Ot+SOs8GPcPgrma/JOGwVawGS1uvTPJdX
 4e5u81rZE2THF5DCTyVDxalYg6q+qFteoDz+Ja9O61xpW2O9daknYCxdDqUeMQJSf5Fr
 Z1fM7nWdef0OUuVk5HiZYQ/vD/FMlrku8TvNBSU3VAbR7q9yWqea6kNvz5XGnlJgCknm
 OEm+9dwBp7aGAkcy9J+xt/3gBW+2KNgWM1vv5HQHU4ax0sjj9IHUtMK3GfrH7S17BaZb
 vHWg==
X-Gm-Message-State: AOAM5333DwLBWNPHUnsywztkEwDdhpOST8WImFvjW8nwJ1Jn5XMW7C8P
 u+aVNEI+PbUAVaaB0mLU/PhIS1W7vjloNeQGB2ILh44hp62itOb7L9tmcb1BP6yr6DwLBC9DaPP
 uHPG1lXb/TIQ9b1A4Ftw5f15x7wNfl+Lch1gb5feAtNcmj44b7ACTE3B/x5XM4AQI
X-Received: by 2002:a1c:1bc7:: with SMTP id b190mr100098wmb.115.1615907348726; 
 Tue, 16 Mar 2021 08:09:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUVt8wLOSwZ8o6BzGlaZ79gZ6XA0bCwaYfHg/f/ORJ/egCIearwPfT2rqMPmPmL1CXDAEqFw==
X-Received: by 2002:a1c:1bc7:: with SMTP id b190mr100078wmb.115.1615907348498; 
 Tue, 16 Mar 2021 08:09:08 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h8sm11830998wrt.94.2021.03.16.08.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 08:09:08 -0700 (PDT)
Subject: Re: [PATCH v4 01/12] net: eth: Add a helper to pad a short Ethernet
 frame
To: Bin Meng <bmeng.cn@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210316120420.19658-1-bmeng.cn@gmail.com>
 <20210316120420.19658-2-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <780f9e21-ab2c-e48f-b5ba-53f1c7bb01ea@redhat.com>
Date: Tue, 16 Mar 2021 16:09:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316120420.19658-2-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

On 3/16/21 1:04 PM, Bin Meng wrote:
> Add a helper to pad a short Ethernet frame to the minimum required
> length, which can be used by backend codes.

"backend codes" sounds odd but I'm not native English speaker.
I'd have used "backends' code" instead...

> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> 
> ---
> 
> Changes in v4:
> - change 'ethernet' to 'Ethernet'
> - do not inline the helper
> - check the padded buffer size to avoid buffer overflow
> 
> Changes in v3:
> - use 'without' instead of 'sans'
> - add a helper to pad short frames
> 
>  include/net/eth.h | 17 +++++++++++++++++
>  net/eth.c         | 17 +++++++++++++++++
>  2 files changed, 34 insertions(+)
> 
> diff --git a/include/net/eth.h b/include/net/eth.h
> index 0671be6916..6aabbdd0d3 100644
> --- a/include/net/eth.h
> +++ b/include/net/eth.h
> @@ -31,6 +31,7 @@
>  
>  #define ETH_ALEN 6
>  #define ETH_HLEN 14
> +#define ETH_ZLEN 60     /* Min. octets in frame without FCS */
>  
>  struct eth_header {
>      uint8_t  h_dest[ETH_ALEN];   /* destination eth addr */
> @@ -422,4 +423,20 @@ bool
>  eth_parse_ipv6_hdr(const struct iovec *pkt, int pkt_frags,
>                     size_t ip6hdr_off, eth_ip6_hdr_info *info);
>  
> +/**
> + * eth_pad_short_frame - pad a short frame to the minimum Ethernet frame length
> + *
> + * If the Ethernet frame size is shorter than 60 bytes, it will be padded to
> + * 60 bytes at the address @padded_pkt.
> + *
> + * @padded_pkt: buffer address to hold the padded frame
> + * @padded_buflen: buffer length of @padded_pkt. If the frame is padded, it is
> + *                 written to ETH_ZLEN, otherwise it remains unchanged.

 @padded_buflen: pointer holding length of @padded_pkt. If the frame is
                 padded, the length will be updated to the padded one.

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

(since you describe frames, maybe s/pkt/frame/?)

> + * @pkt: address to hold the original Ethernet frame
> + * @pkt_size: size of the original Ethernet frame
> + * @return true if the frame is padded, otherwise false
> + */
> +bool eth_pad_short_frame(uint8_t *padded_pkt, size_t *padded_buflen,
> +                         const void *pkt, size_t pkt_size);
> +
>  #endif
> diff --git a/net/eth.c b/net/eth.c
> index 1e0821c5f8..f913e4396f 100644
> --- a/net/eth.c
> +++ b/net/eth.c
> @@ -548,3 +548,20 @@ bool eth_parse_ipv6_hdr(const struct iovec *pkt, int pkt_frags,
>      info->l4proto = ext_hdr.ip6r_nxt;
>      return true;
>  }
> +
> +bool eth_pad_short_frame(uint8_t *padded_pkt, size_t *padded_buflen,
> +                         const void *pkt, size_t pkt_size)
> +{
> +    assert(padded_buflen && *padded_buflen >= ETH_ZLEN);
> +
> +    if (pkt_size >= ETH_ZLEN) {
> +        return false;
> +    }
> +
> +    /* pad to minimum Ethernet frame length */
> +    memcpy(padded_pkt, pkt, pkt_size);
> +    memset(&padded_pkt[pkt_size], 0, ETH_ZLEN - pkt_size);
> +    *padded_buflen = ETH_ZLEN;
> +
> +    return true;
> +}
> 


