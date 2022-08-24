Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7F359F16A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 04:29:40 +0200 (CEST)
Received: from localhost ([::1]:34754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQg9D-00041D-Tv
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 22:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQg8C-0002Ho-0t
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 22:28:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQg8A-0003jL-03
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 22:28:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661308113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MUDTCWdHolPEFkMQQBbKf1g66a/XCYEcJVsEMkSrulU=;
 b=aFF/X3l9Jvwv/kv262YmgtftfMI8T+es4B9qGSwkTMc6wUNDNCtmJdH/t3owf7fmbmBG0m
 8Zn0IVYo8nG7G0gRtnbNugkRHHP4uq7+SOg8cJMSP9MJHfBG1Md1s4wsdlfiWILp0pWiGm
 v1zsaI7OIgieuRc2nO5+1zVDyqNI1cI=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-209-wVsIfsZ0Pm-4JSpebhMPUg-1; Tue, 23 Aug 2022 22:28:32 -0400
X-MC-Unique: wVsIfsZ0Pm-4JSpebhMPUg-1
Received: by mail-pg1-f199.google.com with SMTP id
 s129-20020a632c87000000b00411564fe1feso6864759pgs.7
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 19:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=MUDTCWdHolPEFkMQQBbKf1g66a/XCYEcJVsEMkSrulU=;
 b=Ffja1CtzITOXFwLYoc1oftcI9sFB5hHtQHMUZcKUjbwiiXhORk/Vn52RV5Id0g2kEM
 yySVX8rpToRx88uqxMGr+Vhsa927qGr5nPTw7qgzsNH3FBBIVKSz/Wn64FNB2GuS/1Au
 iZry7I3MMfoFMtzCYpqzHpy61UfQPuAbRRnJfwvxcw4cIVWEsw573zTOvGKU3p8J75fS
 opyM7uT50k5KqxKSDAOflAsyD3mWHovZ5QPOC1o1MceRN+C7aODkM3VWMoFRfmW68LRf
 LQMsTXcCYeMe4bWu4/jQNcvTH4G9scVVsEbr2s2mHnZqxFXftbd7cFpTQiiwoanpCIlq
 5l6A==
X-Gm-Message-State: ACgBeo0NYI/s5OFzV2bcWcKiXuWy16bEVGuYNw/C/WIRjKWun8Gitrh9
 gLJ1jhLRWrxwg4EzouJkF8kRtbwJmygdLHaZvHSxKWM74XawjMEyAZjfJWH2hXE3DtWjKiz6gpD
 XHKoR+ae40HPkt/E=
X-Received: by 2002:a17:903:1c8:b0:173:c58:dc6d with SMTP id
 e8-20020a17090301c800b001730c58dc6dmr3325147plh.105.1661308110352; 
 Tue, 23 Aug 2022 19:28:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5BZH5V5fw5nQJapklw8qrTBA5UcPVkLgFLB+WQp8Laq6vUEX8jnmjpV8Dyvurk0oOMNJD9Yg==
X-Received: by 2002:a17:903:1c8:b0:173:c58:dc6d with SMTP id
 e8-20020a17090301c800b001730c58dc6dmr3324843plh.105.1661308104150; 
 Tue, 23 Aug 2022 19:28:24 -0700 (PDT)
Received: from [10.72.13.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 s184-20020a625ec1000000b0052e57ed8cdasm7714967pfb.55.2022.08.23.19.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 19:28:23 -0700 (PDT)
Message-ID: <d322005e-6f76-82bd-1e13-22108325adad@redhat.com>
Date: Wed, 24 Aug 2022 10:28:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH] net: tulip: Restrict DMA engine to memories
Content-Language: en-US
From: Jason Wang <jasowang@redhat.com>
To: Zheyu Ma <zheyuma97@gmail.com>
Cc: Sven Schnelle <svens@stackframe.org>, qemu-devel <qemu-devel@nongnu.org>
References: <20220821122943.835058-1-zheyuma97@gmail.com>
 <CACGkMEtFXdV-M8dPm_kW9y7CWRjzU-GRh=W2Qo-bq4PGQuOOGA@mail.gmail.com>
In-Reply-To: <CACGkMEtFXdV-M8dPm_kW9y7CWRjzU-GRh=W2Qo-bq4PGQuOOGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


在 2022/8/24 10:26, Jason Wang 写道:
> On Sun, Aug 21, 2022 at 8:29 PM Zheyu Ma <zheyuma97@gmail.com> wrote:
>> The DMA engine is started by I/O access and then itself accesses the
>> I/O registers, triggering a reentrancy bug.
>>
>> The following log can reveal it:
>> ==5637==ERROR: AddressSanitizer: stack-overflow
>>      #0 0x5595435f6078 in tulip_xmit_list_update qemu/hw/net/tulip.c:673
>>      #1 0x5595435f204a in tulip_write qemu/hw/net/tulip.c:805:13
>>      #2 0x559544637f86 in memory_region_write_accessor qemu/softmmu/memory.c:492:5
>>      #3 0x5595446379fa in access_with_adjusted_size qemu/softmmu/memory.c:554:18
>>      #4 0x5595446372fa in memory_region_dispatch_write qemu/softmmu/memory.c
>>      #5 0x55954468b74c in flatview_write_continue qemu/softmmu/physmem.c:2825:23
>>      #6 0x559544683662 in flatview_write qemu/softmmu/physmem.c:2867:12
>>      #7 0x5595446833f3 in address_space_write qemu/softmmu/physmem.c:2963:18
>>      #8 0x5595435fb082 in dma_memory_rw_relaxed /home/mzy/truman/third_party/qemu/include/sysemu/dma.h:87:12
>>      #9 0x5595435fb082 in dma_memory_rw /home/mzy/truman/third_party/qemu/include/sysemu/dma.h:130:12
>>      #10 0x5595435fb082 in dma_memory_write /home/mzy/truman/third_party/qemu/include/sysemu/dma.h:171:12
>>      #11 0x5595435fb082 in stl_le_dma /home/mzy/truman/third_party/qemu/include/sysemu/dma.h:272:1
>>      #12 0x5595435fb082 in stl_le_pci_dma /home/mzy/truman/third_party/qemu/include/hw/pci/pci.h:910:1
>>      #13 0x5595435fb082 in tulip_desc_write qemu/hw/net/tulip.c:101:9
>>      #14 0x5595435f7e3d in tulip_xmit_list_update qemu/hw/net/tulip.c:706:9
>>      #15 0x5595435f204a in tulip_write qemu/hw/net/tulip.c:805:13
>>
>> Fix this bug by restricting the DMA engine to memories regions.
>>
>> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> Queued for 7.2.


Ok, I saw v2, so I've queued that version since it has a better change log.

Thanks


>
> Thanks
>
>> ---
>>   hw/net/tulip.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/net/tulip.c b/hw/net/tulip.c
>> index 097e905bec..b9e42c322a 100644
>> --- a/hw/net/tulip.c
>> +++ b/hw/net/tulip.c
>> @@ -70,7 +70,7 @@ static const VMStateDescription vmstate_pci_tulip = {
>>   static void tulip_desc_read(TULIPState *s, hwaddr p,
>>           struct tulip_descriptor *desc)
>>   {
>> -    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
>> +    const MemTxAttrs attrs = { .memory = true };
>>
>>       if (s->csr[0] & CSR0_DBO) {
>>           ldl_be_pci_dma(&s->dev, p, &desc->status, attrs);
>> @@ -88,7 +88,7 @@ static void tulip_desc_read(TULIPState *s, hwaddr p,
>>   static void tulip_desc_write(TULIPState *s, hwaddr p,
>>           struct tulip_descriptor *desc)
>>   {
>> -    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
>> +    const MemTxAttrs attrs = { .memory = true };
>>
>>       if (s->csr[0] & CSR0_DBO) {
>>           stl_be_pci_dma(&s->dev, p, desc->status, attrs);
>> --
>> 2.25.1
>>


