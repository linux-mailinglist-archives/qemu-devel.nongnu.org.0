Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 094242B5A60
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 08:39:53 +0100 (CET)
Received: from localhost ([::1]:47904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kevah-0007Vj-KI
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 02:39:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kevZx-00076G-78
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 02:39:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kevZu-0004Dv-6T
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 02:39:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605598739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8zcfHArUEQajJ4DzG6Rxr8gfHRN5vif2QBHyG+qUNhk=;
 b=G9guVSKy1ziGlcK0N5eGMXbbNLilWlAQy41ui11Y0ZIAcN8zGW8kSsbZM7/OMllAHIKuVK
 KcSMGYTzLasV+O3lOAtxHHJVnCzulj5bV8bfiHQdbWa0zaV93WRK9vULYZPPSkZZPS8w9U
 erL5s1iKxUKyVy8t93vj4qx8zEFPXas=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-WTycnWQkPXCnZU2USeohmg-1; Tue, 17 Nov 2020 02:38:57 -0500
X-MC-Unique: WTycnWQkPXCnZU2USeohmg-1
Received: by mail-ed1-f70.google.com with SMTP id d3so4307343eds.3
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 23:38:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8zcfHArUEQajJ4DzG6Rxr8gfHRN5vif2QBHyG+qUNhk=;
 b=QoRV9YoNHys4Hv3QjNzuNDlqTLRIprJ+jYpLBnTm/YvMzmUx5TbgyTX+orPlNFZqGq
 Tno2K3T6UPoQ72WMI0KR3D4vrcU69NQUn4oKUQX/vqik7CNHrndPFAdzcYxpNMWa4Rq+
 g39jnLE/nUTBbXqun3+iWEyKr9IrOSBARPu9mnk6FHXZrwXEseU2vZy2jJwEyAW8PDEj
 tgKZh2DTP7vehZk8qAtCEZv02wwjUWvEOkzppRVWoAA4axjxPNPGiONgzAtGps2Kbx6R
 Bgjv+kGYxEkgSytLpeupEA18RHAoJlnq95VyDnRAnJKBxM5cUGY2Jlvx3uSZ7E/I4TBZ
 OgnA==
X-Gm-Message-State: AOAM530o5SSFTIvEQmcnh7Ehj1ZRgbPLUBhABlUB3am1sZq5DsvPje9j
 KOgmNpN/HmD+j3sNU4CNqTos/3xVXYnTA4joHwAxH8pIWZIgZINSXSUcly3BN5dO8PyRq4ki/ir
 nYJD1yrHputzwxCvfH+SMsYVPIHCWGDo7WN/zXxjcBvIbFkQXRZanbtFYSJe6om/yz1g=
X-Received: by 2002:a17:906:af8b:: with SMTP id
 mj11mr18342602ejb.129.1605598735955; 
 Mon, 16 Nov 2020 23:38:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0cy1mCW5i2wKarzYh/aotZ2ueNQVi/z1iFK/DbroNL/KArfMRVoAuZpqGT9jZIn1D4xCWRw==
X-Received: by 2002:a17:906:af8b:: with SMTP id
 mj11mr18342588ejb.129.1605598735664; 
 Mon, 16 Nov 2020 23:38:55 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b6sm11825861edu.21.2020.11.16.23.38.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 23:38:54 -0800 (PST)
Subject: Re: [PATCH 7/7] scsi: move host_status handling into SCSI drivers
To: Hannes Reinecke <hare@suse.de>
References: <20201116184041.60465-1-hare@suse.de>
 <20201116184041.60465-8-hare@suse.de>
 <e16d0002-8038-2ad0-da7f-969e770df2fc@redhat.com>
 <08795f50-2b4e-14cb-f5dd-709b054308c0@suse.de>
 <d2a538ca-d865-07d7-1c8f-380633bd4b0e@redhat.com>
 <f97fc536-d666-4a5e-5178-8ee86b2f3f7b@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <483cc7e9-fc93-2994-49cb-bd97e383dbb6@redhat.com>
Date: Tue, 17 Nov 2020 08:38:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <f97fc536-d666-4a5e-5178-8ee86b2f3f7b@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/11/20 07:55, Hannes Reinecke wrote:
> On 11/16/20 11:00 PM, Paolo Bonzini wrote:
>> On 16/11/20 20:05, Hannes Reinecke wrote:
>>>>> +    if (sreq->host_status == SCSI_HOST_OK) {
>>>>> +        SCSISense sense;
>>>>> +
>>>>> +        sreq->status = 
>>>>> scsi_sense_from_host_status(sreq->host_status, &sense);
>>>>> +        if (sreq->status == CHECK_CONDITION) {
>>>>> +            scsi_req_build_sense(sreq, sense);
>>>>> +        }
>>>>> +    }
>>>>
>>>> Should be != of course.
>>>>
>>> No.
>>> scsi_req_build_sense() transfers the sense code from the second argument
>>> into a proper SCSI sense. Which is only set if the status is 
>>> CHECK_CONDITION...
>>
>> I mean sreq->host_status != SCSI_HOST_OK.  I might be wrong, but every 
>> other HBA is using that...
>>
> Bah. Yes, of course, you are right.
> 
> Shall I resubmit? Or how is the process nowadays?

Depends on how busy and grumpy I am. :)  Since we're right in the middle 
of the freeze, let me send a RFC patch for Linux to clean up DID_* a 
little bit.

Paolo


