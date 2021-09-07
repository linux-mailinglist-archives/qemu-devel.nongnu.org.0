Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9BC402695
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 11:56:24 +0200 (CEST)
Received: from localhost ([::1]:48490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNXq3-0005yH-55
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 05:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mNXnv-0004YB-R7
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 05:54:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mNXnu-0004Fk-EY
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 05:54:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631008449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B4kpnfdp1Th81ZOUrh9yrOx32ReddCRYlTzn4eYFYiQ=;
 b=EZ/Yx/cKl9vP3/DBg8/UwAdSMcu1h/EXzADg1qs76dwUX7d+NC+H/ADhbslZn7xTws/wWp
 lE1EW9g1So1iezp6jP0eBhaZbBJlAhQo9dADU+g6oBgDjAtgFv7kikim5jTDpaz6edztQU
 ag8EUp1o+771o3Me+hgNfA6ORIMdnYY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-yQjPHnM4O2qRtWLrJMzU5g-1; Tue, 07 Sep 2021 05:54:06 -0400
X-MC-Unique: yQjPHnM4O2qRtWLrJMzU5g-1
Received: by mail-wm1-f70.google.com with SMTP id
 p5-20020a7bcc85000000b002e7563efc4cso907956wma.4
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 02:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=B4kpnfdp1Th81ZOUrh9yrOx32ReddCRYlTzn4eYFYiQ=;
 b=T+wBbvLGgEd0KCsJ8y4Zh5oEUEmr1xQEP4D+/QYEoOxJkBUOJ9iyvwLGDFmkomsVO+
 TcGw43FjQ+JehWi2XOcSeosLhper+eEkr0AMNIfFfXcHB7SoxDt1gtDhARkmTGJOm2IY
 VHsDF5modpJacuBWDLTB77TlKxn1jCD1d+UfqZhhfonZV/UAMVtApSOGwCGwCdAdlQ91
 vwIMmB6wWCEIRruetzJwtfBkgnAMlvZB96psOh3Dav2rykWctcAACoQtiE17JVhOCBTR
 Dwh1+AAdFGe7aso3QRZa0uEYS3iROfO2hF/KvRIYnL9qiSgaiAwXWYM+stwL/g0FKrzI
 +bOQ==
X-Gm-Message-State: AOAM532F9Hu+PNSYf8EqS19obQk5kvmY9aL25kkWPTmtInnHUXFV+ODd
 VffjNAl8sDTPXTzhq3g8v/AAw+YAJiEPBSnrUP1YjHGnuqgd7u3ktLZyPoLqWex1ITZY23wEgd4
 zt4hnn557/hCGxBM=
X-Received: by 2002:adf:9003:: with SMTP id h3mr17668465wrh.75.1631008445805; 
 Tue, 07 Sep 2021 02:54:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyESMjlLISPr/+Yfk64fKY/2jl3QCq17o/TWxFbalGBiHDyn1oVEHYZXATY/of+R4CTDhnVtg==
X-Received: by 2002:adf:9003:: with SMTP id h3mr17668447wrh.75.1631008445588; 
 Tue, 07 Sep 2021 02:54:05 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23fca.dip0.t-ipconnect.de. [79.242.63.202])
 by smtp.gmail.com with ESMTPSA id g1sm12835732wrb.27.2021.09.07.02.54.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 02:54:05 -0700 (PDT)
Subject: Re: [PATCH] s390x/cpumodel: Add more feature to gen16 default model
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>
References: <20210907091128.25051-1-borntraeger@de.ibm.com>
 <b28c3f9b-609c-b412-4a73-86b72b222fa3@de.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <675034b4-9954-a5a8-e8c5-e66ea33632a0@redhat.com>
Date: Tue, 7 Sep 2021 11:54:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b28c3f9b-609c-b412-4a73-86b72b222fa3@de.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07.09.21 11:22, Christian Borntraeger wrote:
> 
> 
> On 07.09.21 11:11, Christian Borntraeger wrote:
>> Add the new gen16 features to the default model and fence them for
>> machine version 6.1 and earlier.
>>
>> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
>> ---
>>    hw/s390x/s390-virtio-ccw.c  | 5 +++++
>>    target/s390x/gen-features.c | 8 +++++++-
>>    2 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>> index 4d25278cf20e..72573ec66e84 100644
>> --- a/hw/s390x/s390-virtio-ccw.c
>> +++ b/hw/s390x/s390-virtio-ccw.c
>> @@ -803,6 +803,11 @@ DEFINE_CCW_MACHINE(6_2, "6.2", true);
>>    static void ccw_machine_6_1_instance_options(MachineState *machine)
>>    {
>>        ccw_machine_6_2_instance_options(machine);
>> +    s390_cpudef_featoff_greater(12, 1, S390_FEAT_NNPA);
>> +    s390_cpudef_featoff_greater(12, 1, S390_FEAT_VECTOR_PACKED_DECIMAL_ENH2);
>> +    s390_cpudef_featoff_greater(12, 1, S390_FEAT_BEAR_ENH);
>> +    s390_cpudef_featoff_greater(12, 1, S390_FEAT_RDP);
>> +    s390_cpudef_featoff_greater(12, 1, S390_FEAT_PAI);
> 
> It does not hurt, but the 12 should be 16 of course.
> Will fix.
> 

... I was just about to reply this very second :D

LGTM otherwise

-- 
Thanks,

David / dhildenb


