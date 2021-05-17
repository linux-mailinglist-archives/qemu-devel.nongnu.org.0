Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B76383B27
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:21:10 +0200 (CEST)
Received: from localhost ([::1]:43950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligvU-0000H9-CL
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ligR2-0007Re-Sr
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:49:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ligR1-0004tT-1b
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:49:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621270178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D9bEnk2Q5e9NmpVa6UNVSUtbFaa2xxN5C82EKZWqWqs=;
 b=iZ/c2y5vKVyHI0cECCkTQp1U7fQXyrxzGq3InG+kPBwT0XtzzOVE5045SpXDcqxSxNr1nm
 WRZSfG+4fDQ91VHAkzi+7b24KZG+H7tXYQDiLFKNtnEXO4LFix7+yMNhjXTLBFRmlmox3/
 R9XvPPJ6+NY8AMy+dBSO85Z5mRpvmAc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-var6vVpYMjWr8E5QA3FeYQ-1; Mon, 17 May 2021 12:49:34 -0400
X-MC-Unique: var6vVpYMjWr8E5QA3FeYQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 cn20-20020a0564020cb4b029038d0b0e183fso4242903edb.22
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D9bEnk2Q5e9NmpVa6UNVSUtbFaa2xxN5C82EKZWqWqs=;
 b=GdlvYnTuousbuZYpM2JF3YKAj3MZm6uzMTCux5PBkKqMd/9eiqAbm/rvDDsTOa3q9p
 WSxL+wibASSpftmFYq1BiVicf75J+S4zZg/RCSspq+emhaEr4iLXTm3eGSvjITOqchQt
 hHDYd5DkhPCgi2p4VRaOHVDPfQc2ZAKhVoX4JdMr6ib8eS6wF+gbmUd5M6BOq6LmeAvD
 vEiXYEs//T2xmPArkBnAuAMpeFTHGOclH+pdjVDNun9nuc+ernUH0zXd06WLF3LlzVBt
 /Vq3Ww0mK2O5kAGQcMHKqY6E7CqyTQ0J1hZOmrIJ+HhmYwVs6u69C14pF46wCL5F1l/j
 FezA==
X-Gm-Message-State: AOAM530hrVgpdv7SAg7xzOod/fDcXcxZ+/XdbcNjQ3YloCkPA59jOHz/
 ZsVgG8IEMF9wLlJcGt5wgRh7MDceu5RhDo7RTZXnx35qu1yAnY4s+ITO7K0XGUD0k5ZKa57jMER
 PwIDwEvLF6TOMmVI=
X-Received: by 2002:a17:906:9159:: with SMTP id
 y25mr878243ejw.144.1621270173470; 
 Mon, 17 May 2021 09:49:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwoWtyq4+AG9YdH4xWdVMCN3vBYOdooO012IlNhJPAqiOIrJ0ztrECKVW0TLGWBhYuRdSCPA==
X-Received: by 2002:a17:906:9159:: with SMTP id
 y25mr878220ejw.144.1621270173288; 
 Mon, 17 May 2021 09:49:33 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id f20sm4295099edu.24.2021.05.17.09.49.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 09:49:32 -0700 (PDT)
Subject: Re: [PATCH 1/3] pc-bios/s390-ccw: Fix inline assembly for older
 versions of Clang
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20210512171550.476130-1-thuth@redhat.com>
 <20210512171550.476130-2-thuth@redhat.com>
 <20210517181434.74a1c2f0.cohuck@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cc4b6572-8896-2990-e257-704777d94340@redhat.com>
Date: Mon, 17 May 2021 18:49:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517181434.74a1c2f0.cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 6:14 PM, Cornelia Huck wrote:
> On Wed, 12 May 2021 19:15:48 +0200
> Thomas Huth <thuth@redhat.com> wrote:
> 
>> Clang versions before v11.0 insist on having the %rX or %cX register
>> names instead of just a number. Since our Travis-CI is currently
>> still using Clang v6.0, we have to fix this to avoid failing jobs.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  pc-bios/s390-ccw/helper.h   | 2 +-
>>  pc-bios/s390-ccw/jump2ipl.c | 4 ++--
>>  pc-bios/s390-ccw/menu.c     | 8 ++++----
>>  pc-bios/s390-ccw/virtio.c   | 2 +-
>>  4 files changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/pc-bios/s390-ccw/helper.h b/pc-bios/s390-ccw/helper.h
>> index dfcfea0ff0..3d0731c4c6 100644
>> --- a/pc-bios/s390-ccw/helper.h
>> +++ b/pc-bios/s390-ccw/helper.h
>> @@ -31,7 +31,7 @@ static inline void *u32toptr(uint32_t n)
>>  
>>  static inline void yield(void)
>>  {
>> -    asm volatile ("diag 0,0,0x44"
>> +    asm volatile ("diag %%r0,%%r0,0x44"
>>                    : :
>>                    : "memory", "cc");
>>  }
> 
> Sigh, this really looks uglier, but if it pleases the compiler...

Personally I find it easier to read, it makes obvious we are
accessing a register, not using an immediate value.


