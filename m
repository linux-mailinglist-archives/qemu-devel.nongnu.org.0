Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B162336D81
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 09:09:23 +0100 (CET)
Received: from localhost ([::1]:43136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKGNl-0003Qj-Ks
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 03:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lKGMe-0002Zl-5B
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 03:08:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lKGMb-0007tG-TF
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 03:08:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615450088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BrU5OrHw/R0SbfXDTT5Jw7YdNM1mHOPRgVwKm2q0VHQ=;
 b=gYnKks3dygycRNRFVq3+mqkvKVPGnrBDWUEnkZLNpMmdhQYinKyJHmworMmN+aC1HBU5mD
 QDriCnsBwr1LqUU0wvgYOQCelzQFTWEug7PsqrXFr/Wj9G0DqQeOFKZ/xza/MdWlGDA2Mc
 d7IFvMF+Qz058skDXABXhL75g8pzUeE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-NK_s3h2yNB2JkFwkp1al0g-1; Thu, 11 Mar 2021 03:08:06 -0500
X-MC-Unique: NK_s3h2yNB2JkFwkp1al0g-1
Received: by mail-wm1-f70.google.com with SMTP id i14so3669971wmq.7
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 00:08:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BrU5OrHw/R0SbfXDTT5Jw7YdNM1mHOPRgVwKm2q0VHQ=;
 b=YWkHdAUaDh9Yrn0vFT9+LgvcTx/CB2QauRB0Oo6cqJ2Nhw8gYKqObKZ8LEGILbu/4E
 Nc6VUQ+zlpLfEyZ6kWJqVtKCcv5/QU1+jWTjbbl7B2cFwId7+ryImccIkSxPO6unB91o
 n2p8lE6ZQ4AyUug3RP81P3qPb98DZ9TqUPQiYA88Re39JmIhB/MYxzgSIf49HDa70bW+
 YBhT9F1lCNpYT7wxQ/PwL+2gDMkMMzls67wh1gDRUHynvjV6Rju5fFu9XG8rETg3ttly
 EvlmTyn8jj5tMh1WAdWrt8tXYjINI09/uIzK3MFCLqtoIHigOKGQ6D6pBh5tvKBsQyWP
 nYSQ==
X-Gm-Message-State: AOAM5305PrQOEJMhVH/Udq4xD51MRc9zkfJMvth3BKpVxvgxY5i+vlbV
 tA1orbyqhP6YFKdRPjFKcZ9nmo57co9p2JXbylhUZ+/UzQJtbQ12f8dHsa0P2uYfCuc08LLDaR4
 QUbL5VL4VN/U7XXE=
X-Received: by 2002:adf:ed49:: with SMTP id u9mr7309319wro.337.1615450085674; 
 Thu, 11 Mar 2021 00:08:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwav1cuxueCIjaJPLho3GW15HF8ore3SwVa6GumUwOneE4ls4o5cF4W1DCG4DgfQ+Pu3l+WJQ==
X-Received: by 2002:adf:ed49:: with SMTP id u9mr7309297wro.337.1615450085491; 
 Thu, 11 Mar 2021 00:08:05 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id p17sm2269111wmd.42.2021.03.11.00.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 00:08:05 -0800 (PST)
Date: Thu, 11 Mar 2021 09:08:02 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v5 5/7] net/eth: Check iovec has enough data earlier
Message-ID: <20210311080802.oy6aa5pxcjxd2gwi@steredhat>
References: <20210310160135.1148272-1-philmd@redhat.com>
 <20210310160135.1148272-6-philmd@redhat.com>
 <20210310165327.w27noda3nva2yfcg@steredhat>
 <0a62edf6-9842-13df-2093-cbf8926a1b17@redhat.com>
 <823478a4-11cc-befb-e296-41a19821c959@redhat.com>
MIME-Version: 1.0
In-Reply-To: <823478a4-11cc-befb-e296-41a19821c959@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 07:26:19PM +0100, Philippe Mathieu-Daudé wrote:
>On 3/10/21 6:57 PM, Philippe Mathieu-Daudé wrote:
>> On 3/10/21 5:53 PM, Stefano Garzarella wrote:
>>> On Wed, Mar 10, 2021 at 05:01:33PM +0100, Philippe Mathieu-Daudé wrote:
>>>> We want to check fields from ip6_ext_hdr_routing structure
>>>> and if correct read the full in6_address. Let's directly check
>>>> if our iovec contains enough data for everything, else return
>>>> early.
>>>>
>>>> Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
>>>> net/eth.c | 2 +-
>>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/net/eth.c b/net/eth.c
>>>> index e870d02b0df..28cdc843a69 100644
>>>> --- a/net/eth.c
>>>> +++ b/net/eth.c
>>>> @@ -409,7 +409,7 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt,
>>>> int pkt_frags,
>>>>     size_t input_size = iov_size(pkt, pkt_frags);
>>>>     size_t bytes_read;
>>>>
>>>> -    if (input_size < ext_hdr_offset + sizeof(*ext_hdr)) {
>>>> +    if (input_size < ext_hdr_offset + sizeof(*rthdr) +
>>>> sizeof(*dst_addr)) {
>>>>         return false;
>>>>     }
>>>
>>> If you have to respin, maybe we should also fix the offset in
>>> iov_to_buf() in this patch and queue it for stable:
>>>
>>> @@ -415,7 +415,7 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt,
>>> int pkt_frags,
>>>  
>>>      if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
>>>          bytes_read = iov_to_buf(pkt, pkt_frags,
>>> -                                ext_hdr_offset + sizeof(*ext_hdr),
>>> +                                ext_hdr_offset + sizeof(*rthdr),
>>>                                  dst_addr, sizeof(*dst_addr));
>>
>> Oh, so we always screwed the address by 4 bytes...
>>
>> This code never worked correctly :(
>
>Confirmed with commit 4555ca6816c ("net: fix incorrect
>argument to iov_to_buf") when it then returns incorrect
>value until b2caa3b82ed ("net/eth: fix incorrect check
>of iov_to_buf() return value") one year later.
>

Ooooh, I agree, it never worked but I have no idea how to test...

Thanks for fixing this code,
Stefano


