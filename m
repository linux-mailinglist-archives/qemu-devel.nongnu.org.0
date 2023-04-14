Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8BD6E2612
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 16:47:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnKgr-0000NS-0P; Fri, 14 Apr 2023 10:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnKgj-0000N8-JG
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 10:46:14 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnKgg-0007b9-Ki
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 10:46:08 -0400
Received: by mail-wr1-x42b.google.com with SMTP id l18so17699569wrb.9
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 07:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681483564; x=1684075564;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0aGcHee9k3Mpx3lqEeBUc4XjJ7k1GYZeA3fq41N/yKM=;
 b=K6N4AuamL4M2cO7kTN+4B+VAy3HUmWCKdk+yC7Wd31GUKE84fc1kPm52lxWTedBdFC
 iOLlghEx4Yx1TBdq4iT0HrBpeU/4vUcDQgNV5oT2jZIFkarrWgBOSsdHeGz8qGRdDVf8
 yN1ATTwFN+LtmBPUYLeVHagWw/ON7izE5y1OAlo3JqQkDfXJz/B4SjqFqnQt9pf1917g
 vabpYaSK0EFAZ4v82lndaPzDPaxsApG8jlkqY6p2UdhMOKohmXW60Uw86EbwFtbzUklW
 8VL+YPQ4XF5IwVw7AQ1KkuyrRNaRiBmMw/PRsg0LYvNmi/WynWCFh4EHs3weJHKuZC86
 8fBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681483564; x=1684075564;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0aGcHee9k3Mpx3lqEeBUc4XjJ7k1GYZeA3fq41N/yKM=;
 b=cGy9QO3nqFirsv8PWIAJNLcORruEzFxfDPm3apluevk5lw7oJ4SuhTEbsRqVWQdosF
 hpR8510SYAPtHjUbIfsNRoblZFgqX93W70Ao86qZdrRgn49lvvF7bHjehVRtqClPHXAQ
 ENm+aXQ0mK+70lMeMTF3rwHCv9U/eeT/ZWYaw6eyegTqro1SQU7lrDyVgg1811ay3Q0k
 AT864CawfQLZ1R6sctU273yazJKTykXheeGCSwquNooO205IWjtV1SPIqfwiRU/fPG15
 5vSnES9i7uzC968JMYGYpn07px6nbMyI6WkaYLJjOmT6qVDufA/4Hb46L6unwNklNOeP
 c14g==
X-Gm-Message-State: AAQBX9dpBYrUNrf8HARsJ7SS8cYxOWMZ/Fcy+GzwKjZWcIt7JGsE4Trd
 Gg8tYRNV0pvascKgt6FFoelCOw==
X-Google-Smtp-Source: AKy350ZpWhrp6HU6nMtcODUZZIx9+Bfr/2fAEYPZ7U58kgUI/iUesjbBLvCBfqxELbhRasIHIKsMDw==
X-Received: by 2002:adf:db46:0:b0:2cf:e747:b0d4 with SMTP id
 f6-20020adfdb46000000b002cfe747b0d4mr5055598wrj.40.1681483564568; 
 Fri, 14 Apr 2023 07:46:04 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.204.198])
 by smtp.gmail.com with ESMTPSA id
 e1-20020adfe381000000b002efbb93c461sm3690542wrm.25.2023.04.14.07.46.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 07:46:04 -0700 (PDT)
Message-ID: <95840429-756a-98f9-b336-91e480b37781@linaro.org>
Date: Fri, 14 Apr 2023 16:46:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 08/40] igb: Always copy ethernet header
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
 <20230414113737.62803-9-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230414113737.62803-9-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.282,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 14/4/23 13:37, Akihiko Odaki wrote:
> igb_receive_internal() used to check the iov length to determine
> copy the iovs to a contiguous buffer, but the check is flawed in two
> ways:
> - It does not ensure that iovcnt > 0.
> - It does not take virtio-net header into consideration.
> 
> The size of this copy is just 22 octets, which can be even less than
> the code size required for checks. This (wrong) optimization is probably
> not worth so just remove it. Removing this also allows igb to assume
> aligned accesses for the ethernet header.
> 
> Fixes: 3a977deebe ("Intrdocue igb device emulation")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/net/igb_core.c | 39 +++++++++++++++++++++------------------
>   1 file changed, 21 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index 53f60fc3d3..1d188b526c 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c


> -static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
> +static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
>                                      size_t size, E1000E_RSSInfo *rss_info,
>                                      bool *external_tx)
>   {
>       static const int ta_shift[] = { 4, 3, 2, 0 };
> +    const struct eth_header *ehdr = &l2_header->eth;
>       uint32_t f, ra[2], *macp, rctl = core->mac[RCTL];
>       uint16_t queues = 0;
>       uint16_t oversized = 0;
> -    uint16_t vid = lduw_be_p(&PKT_GET_VLAN_HDR(ehdr)->h_tci) & VLAN_VID_MASK;
> +    uint16_t vid = be16_to_cpu(l2_header->vlan[0].h_tci) & VLAN_VID_MASK;

Why this API change? Are we certain tci is aligned in host memory?

