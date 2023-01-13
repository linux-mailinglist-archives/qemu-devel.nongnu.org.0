Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 162156698DA
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 14:41:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKIR-0000Ah-7R; Fri, 13 Jan 2023 08:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGKIP-00008t-Dh
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:40:37 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGKIN-0005Rg-3w
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:40:37 -0500
Received: by mail-wm1-x32a.google.com with SMTP id ay40so15303404wmb.2
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 05:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GpzYGl6PT6bHvamin7EcPPvrJMO9/OiMQv6FtNM8zoc=;
 b=ytZHjU9jISEfk/2fBT4WeFaDmD+Kl0vkMs/G4H+vb9OBMEaifPPtTuR5p6mmnfAoXh
 VruB4jrcYi1FxUAWx5Z0cMKvBnmqw/QErkMx8Bk/UCSqb8/IdNYAn+S85P98hp/eyXMU
 Iixos72vt7lGRqu3zBS85xvx3YXqJ9umVRJjLqXZyovzDAq48iqhvedRW+00yCvqmmQC
 30TVYrjD9oBAethve4R9XKTLokjmfKmgZJeKmBFNGW6sGJRS4tuhmx8bZ1D7KYwbscMd
 XMgtMBdxfwjWgH8M6epFYGtCuWOxF1q0SEegTxWToPulXNeipityhzOKmmdCJkfcVz9P
 ADcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GpzYGl6PT6bHvamin7EcPPvrJMO9/OiMQv6FtNM8zoc=;
 b=xUTgr91DPOZJpZkXZYP+vWNNr56aT9yh/NwgjgPlkd3W786FtqsLZX8JB6+pvQ0Lip
 YNrpnE1joEYxncd3zrOP3l3RskUzYzu9wsP5SVQ5+0wE13YwQzfeC6u9Xs452CUb1zdd
 nf8GVaZywmEiKhTerI2PoVr+4/qI0I25w9By1cKaWKIRtMzJHrHMNH+2CJqWDmDxR1YX
 FcUTkf9EIyr4wzsiwEeBx8Nyu1cFam77Yvi0oW3MKIMDWPwDbdz+Iv2K93SqsbYe+ois
 p1mPCqWuWDD0+W/HyG2ya7MwDXRqQ4Bcf5AdYBdS7i/sXyqFXvwED5JRSzQtznsWny+Q
 vvIQ==
X-Gm-Message-State: AFqh2kogBcmLIIL5gAScGalJcb2aT558iUEjr0Ravk6jxDrvt1tzurtp
 aAcDGw5az2EgC4GOB3JPE8PwUw==
X-Google-Smtp-Source: AMrXdXsmeQcmHDsGWfks31ZEY/HJqxGJTpoSWuAqRuWXO70t9y32sGgEbKP+OoqPqnWUcEvordWo3g==
X-Received: by 2002:a05:600c:4d14:b0:3d3:5c7d:a5f3 with SMTP id
 u20-20020a05600c4d1400b003d35c7da5f3mr62155204wmp.37.1673617233743; 
 Fri, 13 Jan 2023 05:40:33 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w12-20020a05600c474c00b003d1e1f421bfsm8322843wmo.10.2023.01.13.05.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 05:40:33 -0800 (PST)
Message-ID: <4670e499-1599-95b6-7489-91f60afd40af@linaro.org>
Date: Fri, 13 Jan 2023 14:40:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] net: Strip virtio-net header when dumping
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jason Wang <jasowang@redhat.com>, Luigi Rizzo <rizzo@iet.unipi.it>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>,
 Vincenzo Maffione <v.maffione@gmail.com>, qemu-devel@nongnu.org
References: <20230113130833.81458-1-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230113130833.81458-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

On 13/1/23 14:08, Akihiko Odaki wrote:
> filter-dump specifiees Ethernet as PCAP LinkType, which does not expect
> virtio-net header. Having virtio-net header in such PCAP file breaks
> PCAP unconsumable. Unfortunately currently there is no LinkType for
> virtio-net so for now strip virtio-net header to convert the output to
> Ethernet.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   include/net/net.h |  6 ++++++
>   net/dump.c        | 11 +++++++----
>   net/net.c         | 18 ++++++++++++++++++
>   net/netmap.c      |  1 +
>   net/tap.c         | 16 ++++++++++++++++
>   5 files changed, 48 insertions(+), 4 deletions(-)
> 
> diff --git a/include/net/net.h b/include/net/net.h
> index dc20b31e9f..4b2d72b3fc 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -56,8 +56,10 @@ typedef RxFilterInfo *(QueryRxFilter)(NetClientState *);
>   typedef bool (HasUfo)(NetClientState *);
>   typedef bool (HasVnetHdr)(NetClientState *);
>   typedef bool (HasVnetHdrLen)(NetClientState *, int);
> +typedef bool (GetUsingVnetHdr)(NetClientState *);
>   typedef void (UsingVnetHdr)(NetClientState *, bool);
>   typedef void (SetOffload)(NetClientState *, int, int, int, int, int);
> +typedef int (GetVnetHdrLen)(NetClientState *);
>   typedef void (SetVnetHdrLen)(NetClientState *, int);
>   typedef int (SetVnetLE)(NetClientState *, bool);
>   typedef int (SetVnetBE)(NetClientState *, bool);
> @@ -84,8 +86,10 @@ typedef struct NetClientInfo {
>       HasUfo *has_ufo;
>       HasVnetHdr *has_vnet_hdr;
>       HasVnetHdrLen *has_vnet_hdr_len;
> +    GetUsingVnetHdr *get_using_vnet_hdr;

[*]

>       UsingVnetHdr *using_vnet_hdr;
>       SetOffload *set_offload;
> +    GetVnetHdrLen *get_vnet_hdr_len;
>       SetVnetHdrLen *set_vnet_hdr_len;
>       SetVnetLE *set_vnet_le;
>       SetVnetBE *set_vnet_be;
> @@ -183,9 +187,11 @@ void qemu_format_nic_info_str(NetClientState *nc, uint8_t macaddr[6]);
>   bool qemu_has_ufo(NetClientState *nc);
>   bool qemu_has_vnet_hdr(NetClientState *nc);
>   bool qemu_has_vnet_hdr_len(NetClientState *nc, int len);
> +bool qemu_get_using_vnet_hdr(NetClientState *nc);
>   void qemu_using_vnet_hdr(NetClientState *nc, bool enable);
>   void qemu_set_offload(NetClientState *nc, int csum, int tso4, int tso6,
>                         int ecn, int ufo);

> @@ -153,8 +154,10 @@ static ssize_t filter_dump_receive_iov(NetFilterState *nf, NetClientState *sndr,
>                                          int iovcnt, NetPacketSent *sent_cb)
>   {
>       NetFilterDumpState *nfds = FILTER_DUMP(nf);
> +    int offset = qemu_get_using_vnet_hdr(nf->netdev) ?
> +                 qemu_get_vnet_hdr_len(nf->netdev) : 0;
>   
> -    dump_receive_iov(&nfds->ds, iov, iovcnt);
> +    dump_receive_iov(&nfds->ds, iov, iovcnt, offset);
>       return 0;
>   }
>   
> diff --git a/net/net.c b/net/net.c
> index 2d01472998..3a95c3ba6a 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -513,6 +513,15 @@ bool qemu_has_vnet_hdr_len(NetClientState *nc, int len)
>       return nc->info->has_vnet_hdr_len(nc, len);
>   }
>   
> +bool qemu_get_using_vnet_hdr(NetClientState *nc)
> +{
> +    if (!nc || !nc->info->get_using_vnet_hdr) {
> +        return false;
> +    }
> +
> +    return nc->info->get_using_vnet_hdr(nc);

Per [*], is get_using_vnet_hdr() really useful? Can't we just
check for using_vnet_hdr != NULL as:

        return nc->info->using_vnet_hdr != NULL;

> +}
> +
>   void qemu_using_vnet_hdr(NetClientState *nc, bool enable)
>   {
>       if (!nc || !nc->info->using_vnet_hdr) {
> @@ -532,6 +541,15 @@ void qemu_set_offload(NetClientState *nc, int csum, int tso4, int tso6,
>       nc->info->set_offload(nc, csum, tso4, tso6, ecn, ufo);
>   }
>   
> +int qemu_get_vnet_hdr_len(NetClientState *nc)
> +{
> +    if (!nc || !nc->info->get_vnet_hdr_len) {
> +        return -ENOSYS;

Does -ENOSYS provides any value? Otherwise we could return 0.

> +    }
> +
> +    return nc->info->get_vnet_hdr_len(nc);
> +}

> diff --git a/net/netmap.c b/net/netmap.c
> index 9e0cec58d3..ed9c7ec948 100644
> --- a/net/netmap.c
> +++ b/net/netmap.c
> @@ -393,6 +393,7 @@ static NetClientInfo net_netmap_info = {
>       .has_ufo = netmap_has_vnet_hdr,
>       .has_vnet_hdr = netmap_has_vnet_hdr,
>       .has_vnet_hdr_len = netmap_has_vnet_hdr_len,
> +    .get_using_vnet_hdr = netmap_get_using_vnet_hdr,

On what is this patch based? I don't have netmap_get_using_vnet_hdr().

>       .using_vnet_hdr = netmap_using_vnet_hdr,
>       .set_offload = netmap_set_offload,
>       .set_vnet_hdr_len = netmap_set_vnet_hdr_len,


