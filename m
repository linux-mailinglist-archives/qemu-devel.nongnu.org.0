Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362902F61F7
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:29:04 +0100 (CET)
Received: from localhost ([::1]:40646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02gR-0000fa-7n
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:29:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l02U2-0006VF-CU
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:16:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l02Tw-0005C1-9N
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:16:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610630166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5jPP/9zJby3Xa7ZURHcGbunj/cQQCAXmvUDh9OamUPE=;
 b=APWjAfgcpn79QUJ64jo4mDolL6ou/l2WXLK7wRyw15zjJnrpGrYGppF9U+9Klst/ELwFjw
 vSea0sm8SYeMaHNXg1VBRs+U7TeTVM7AR3b+h63Abm7WQ99mUoddKNYSXJdY9feBb6KqeX
 nKdBOIZZLV9depzF0HtuZ3RCvVjBCzw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-ZOmPOyzLONKgk43Pou2UDQ-1; Thu, 14 Jan 2021 08:16:03 -0500
X-MC-Unique: ZOmPOyzLONKgk43Pou2UDQ-1
Received: by mail-wr1-f69.google.com with SMTP id m20so2592980wrh.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 05:16:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:cc:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5jPP/9zJby3Xa7ZURHcGbunj/cQQCAXmvUDh9OamUPE=;
 b=R9TTzUpXXUrO0RAJqFbOhVHtu98PXi3pNdyG3bhgoTellVO4Vq8atJFCtV65eyMcd9
 1JxUM12ZSe3NWfuFsgpXrOUTjJj+u+o8M/Z4FEIFIA0D/rb26t4pOGlwIbAYUuD49k8y
 D5OhlpGwrzCouscYuZzZucEMiJ2XLqW2YEEp3IMD00zQlO61um6UcseCogE+FYQ3FkaU
 TWap5mbV7qOqMRq70leKgddnZ8oDDCSpAsF04WspDMwANgRAcK8xkHobW1o+vVH3M9Oh
 ubToHNM037gi5C5QUSHA2Wcce6bxRt9IAXi4D0VlNzjN3hndOsDPjjWR6y4f47peup2N
 s0rA==
X-Gm-Message-State: AOAM530lFTHDg6ziJz8PrMKXrDwbouentKfvvcUucwp3ofGIA6qoTkGW
 tO8PmEcDncUrj4gi1npnfrHONi0xmPlHbZBVlxrwO09N+ek/l0iFQGXmZNkSUuv1SCtLjsSupjm
 W+LlxZTM8bW2Dbtzn+xM0OKql9lg9XJpM/sVb60hgwmmiKDfp8H4dac2VGdIkxHaD
X-Received: by 2002:a05:6000:18c:: with SMTP id
 p12mr7783013wrx.7.1610630161626; 
 Thu, 14 Jan 2021 05:16:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrAC2/POLBV0BfoNvgnniXhV174ofmGV4xFRBpCkg78jdYryFIEMkjf2TZsJKnfxUaAWAjBQ==
X-Received: by 2002:a05:6000:18c:: with SMTP id
 p12mr7782991wrx.7.1610630161394; 
 Thu, 14 Jan 2021 05:16:01 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id v11sm9605637wrt.25.2021.01.14.05.16.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 05:16:00 -0800 (PST)
Subject: Re: [PATCH v3 1/2] Fix net.c warning on GCC 11
To: Miroslav Rezanina <mrezanin@redhat.com>
References: <cover.1610607906.git.mrezanin@redhat.com>
 <dcb4bfa3fe810236475b338f2f6401ec3d1a1c57.1610607906.git.mrezanin@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4fd8d2a3-e665-4422-79e0-4e2a7337e4fc@redhat.com>
Date: Thu, 14 Jan 2021 14:15:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <dcb4bfa3fe810236475b338f2f6401ec3d1a1c57.1610607906.git.mrezanin@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Jason +Dmitry

On 1/14/21 8:07 AM, Miroslav Rezanina wrote:
> When building qemu with GCC 11, compiling eth.c file produce following warning:
> 
>    warning: array subscript 'struct ip6_ext_hdr_routing[0]' is partly outside array bounds of 'struct ip6_ext_hdr[1]' [-Warray-bounds]
> 
> This is caused by retyping from ip6_ext_hdr to ip6_ext_hdr_routing that has more
> attributes.
> 
> As this usage is expected, suppress the warning temporarily through the function
> using this retyping.

This is not expected, this is a bug...

> 
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> ---
>  net/eth.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/net/eth.c b/net/eth.c
> index 1e0821c5f8..b9bdd0435c 100644
> --- a/net/eth.c
> +++ b/net/eth.c
> @@ -405,6 +405,8 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
>                          struct ip6_ext_hdr *ext_hdr,
>                          struct in6_address *dst_addr)
>  {
> +#pragma GCC diagnostic push
> +#pragma GCC diagnostic ignored "-Warray-bounds"
>      struct ip6_ext_hdr_routing *rthdr = (struct ip6_ext_hdr_routing *) ext_hdr;

eth_parse_ipv6_hdr() called iov_to_buf() to fill the 2 bytes of ext_hdr.

>      if ((rthdr->rtype == 2) &&

Here we access after the 2 bytes filled... rthdr->rtype is somewhere on
eth_parse_ipv6_hdr's stack, its content is unknown.

> @@ -426,6 +428,7 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
>      }
>  
>      return false;
> +#pragma GCC diagnostic pop

Nacked-by: Philippe Mathieu-Daudé <philmd@redhat.com>


