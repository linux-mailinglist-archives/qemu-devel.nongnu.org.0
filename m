Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6749586349
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 06:20:52 +0200 (CEST)
Received: from localhost ([::1]:60392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIMvC-0002vq-8Z
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 00:20:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oIMsa-0000d9-3S
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 00:18:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oIMsV-0006uM-M9
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 00:18:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659327482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vjMy2mOvARO0F1kY8C2t2VH2Sk62mnMoUaeyZ4QHgOI=;
 b=JPzvAMdyzbKtMbxkiPIoaHJE7zz8g9BoITa8Yloh6/Jl3r0hvQ021slR1FEGOe3pe4IEco
 sWI4fYEbs9c+24fe2G5wcArpmBZUxbbiWzjCTpcdqDoLwDV6LJDkpyqMVB8dy+vmLycPTA
 Egh9p+UwCBmO9/EC86meXGAtR3Ta7CU=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-ssUAK8LnNFO0hKSaYbIXEg-1; Mon, 01 Aug 2022 00:18:00 -0400
X-MC-Unique: ssUAK8LnNFO0hKSaYbIXEg-1
Received: by mail-pj1-f69.google.com with SMTP id
 i16-20020a17090adc1000b001f4e121847eso1399332pjv.3
 for <qemu-devel@nongnu.org>; Sun, 31 Jul 2022 21:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vjMy2mOvARO0F1kY8C2t2VH2Sk62mnMoUaeyZ4QHgOI=;
 b=6iKWRPulJl9bhzTovp/7Ek1B6AmYYb0V5y/kAEAdJ6yasyxzRr4w6PDT+9CQXWrgKi
 B+qvNjxWGQw5ZhS5RyC5kjl3ryMUiO4t22Tb5zyZL6vNT545+gbtZHiOq6gX/kCgpEh4
 qy+uGeXRmQJ+cFrJMkUzhKHrQbfzDSpx9X1XK7rG2Ay/pdFBFXptXQ8femMubtlFEoAi
 SnLRYCiLvh1SccmZqLmthpq1TUK/qTZ40bTD6m8lQSl2PQcEgaCFu3G/IX++yFRdsgMd
 z5FLlSVaswODnwYrsqdSwbcObP/haDe/mIbBlRD+MmzgKruWbsUFCQ2Da3FaZD1Au/0J
 XA8g==
X-Gm-Message-State: ACgBeo09O1ITIsj+wHIAcw6oVHXLpheBaToTNmZUq39NK7wbUtAyqyJp
 8XD8cO+i9icqrVYd88V4p5x9E2KAT5D8u8cm6ILn86rHR6fW7UBcaptcZyNd7Ez7e3Ezl/dcfqQ
 K5a3uDtQ7Q8HwYzI=
X-Received: by 2002:a17:902:70c4:b0:16c:5306:9172 with SMTP id
 l4-20020a17090270c400b0016c53069172mr14812704plt.171.1659327479610; 
 Sun, 31 Jul 2022 21:17:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7igzqaPQysjJLbtO3C0Dn+qowtsCFh91HkYkNVCDtQ9fdlaZnSbjl0udt3DTa0fhBdbS85hg==
X-Received: by 2002:a17:902:70c4:b0:16c:5306:9172 with SMTP id
 l4-20020a17090270c400b0016c53069172mr14812690plt.171.1659327479312; 
 Sun, 31 Jul 2022 21:17:59 -0700 (PDT)
Received: from [10.72.13.139] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 130-20020a621488000000b0052d0aa54a88sm4107020pfu.181.2022.07.31.21.17.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jul 2022 21:17:54 -0700 (PDT)
Message-ID: <eaf256c7-5a3c-d850-be08-b2b18fc3f1c3@redhat.com>
Date: Mon, 1 Aug 2022 12:17:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PULL V2 25/25] net/colo.c: fix segmentation fault when packet is
 not parsed correctly
Content-Language: en-US
To: Zhang Chen <chen.zhang@intel.com>, Tao Xu <tao3.xu@intel.com>
Cc: qemu-devel@nongnu.org, Li Zhijian <lizhijian@fujitsu.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220720090313.55169-1-jasowang@redhat.com>
 <20220720090313.55169-26-jasowang@redhat.com>
 <CAFEAcA-LPM4LmfcM3kiHk9LWCrYRpB1izfxPijHvBrmLOfFJgQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAFEAcA-LPM4LmfcM3kiHk9LWCrYRpB1izfxPijHvBrmLOfFJgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


在 2022/7/29 21:58, Peter Maydell 写道:
> On Wed, 20 Jul 2022 at 10:04, Jason Wang <jasowang@redhat.com> wrote:
>> From: Zhang Chen <chen.zhang@intel.com>
>>
>> When COLO use only one vnet_hdr_support parameter between
>> filter-redirector and filter-mirror(or colo-compare), COLO will crash
>> with segmentation fault. Back track as follow:
>>
>> Thread 1 "qemu-system-x86" received signal SIGSEGV, Segmentation fault.
>> 0x0000555555cb200b in eth_get_l2_hdr_length (p=0x0)
>>      at /home/tao/project/COLO/colo-qemu/include/net/eth.h:296
>> 296         uint16_t proto = be16_to_cpu(PKT_GET_ETH_HDR(p)->h_proto);
>> (gdb) bt
>> 0  0x0000555555cb200b in eth_get_l2_hdr_length (p=0x0)
>>      at /home/tao/project/COLO/colo-qemu/include/net/eth.h:296
>> 1  0x0000555555cb22b4 in parse_packet_early (pkt=0x555556a44840) at
>> net/colo.c:49
>> 2  0x0000555555cb2b91 in is_tcp_packet (pkt=0x555556a44840) at
>> net/filter-rewriter.c:63
>>
>> So wrong vnet_hdr_len will cause pkt->data become NULL. Add check to
>> raise error and add trace-events to track vnet_hdr_len.
>>
>> Signed-off-by: Tao Xu <tao3.xu@intel.com>
>> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
>> Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
> Hi -- Coverity points out that there's a problem with this fix
> (CID 1490786):
>
>> @@ -46,7 +46,14 @@ int parse_packet_early(Packet *pkt)
>>       static const uint8_t vlan[] = {0x81, 0x00};
>>       uint8_t *data = pkt->data + pkt->vnet_hdr_len;
> data here is set to pkt->data + pkt->vnet_hdr_len.
> If pkt->data is NULL then this addition is C undefined behaviour,
> and if pkt->data is not NULL but the integer added is such
> that the pointer ends up not pointing within data, then that
> is also C undefined behaviour...


Right. And I don't see how pkt->data can be NULL, maybe a hint of bug 
elsewhere.


>
>>       uint16_t l3_proto;
>> -    ssize_t l2hdr_len = eth_get_l2_hdr_length(data);
>> +    ssize_t l2hdr_len;
>> +
>> +    if (data == NULL) {
> ...so the compiler is allowed to assume that data cannot be NULL
> here, and this entire error checking clause is logically dead code.
>
> If you're trying to check whether vnet_hdr_len is valid, you
> need to do that as an integer arithmetic check before you start
> using it for pointer arithmetic. And you probably want to be
> checking against some kind of bound, not just for whether the
> result is going to be NULL.


Or we can let the caller to validate the Pkt before calling this function.


>
> Overall this looks kinda sketchy and could probably use more
> detailed code review. Where does the bogus vnet_hdr_len come from in
> the first place? Is this data from the guest, or from the network
> (ie uncontrolled)?


If I understand correctly the vnet_hdr_len is set during handshake 
(net_fill_rstate()) which is sent from a network backend.

Chen or Xu, please post a fix and explain what happens in the changelog.

Thanks


>
>> +        trace_colo_proxy_main_vnet_info("This packet is not parsed correctly, "
>> +                                        "pkt->vnet_hdr_len", pkt->vnet_hdr_len);
>> +        return 1;
>> +    }
> thanks
> -- PMM
>


