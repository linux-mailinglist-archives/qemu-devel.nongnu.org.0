Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C4945A68D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 16:32:13 +0100 (CET)
Received: from localhost ([::1]:52032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpXmG-0005Fy-ID
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 10:32:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpXk4-0003pn-FR
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 10:29:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpXk1-0003p7-Tj
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 10:29:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637681393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RPZAJjWpPx0VfwwSceeurwyAvB+o2w4zNgo9zeoAhCM=;
 b=InK40C8E7frWMk3PAM6tS8VvPppDQQfGpr+0Z7n6Epg7kJxk51C740saLhldu7mNzVp/30
 uyaowGF5B9CwRgCblC6sWz3ocqwFhkU/RT+AVWeNXk5NJghUCF3Qi/WQC+AtnWVAscC7Yl
 2iF9uL2xErMu3OCcp55NJGP6z/8bZXY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-47Y6puaxM0yc-WwS3cAlhQ-1; Tue, 23 Nov 2021 10:29:50 -0500
X-MC-Unique: 47Y6puaxM0yc-WwS3cAlhQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so8623282wmb.3
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 07:29:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RPZAJjWpPx0VfwwSceeurwyAvB+o2w4zNgo9zeoAhCM=;
 b=dOGKeNVVFQ4oT/epWUhQCpbI1hU7Y1vTr+siZhIcUUx0hMuwVg3EuKzyph/Ln0f4g3
 883/45BNfAPihfsAipEszUsGusNGl+kYmUuUwx0dJsL4gFgR1Yfa2zVzVOrrXNjk1HRh
 ZQZe8De5L5MGlPte4GoC5NtRnvUMr/g0lgSb3PknrTVIfFKCz52ZZhZvsdCYhmk06RJd
 q+u1oD75jjZDYOT2dXqK2LAvm/sPbJ+hlAyiGhjOIuFA5b+40S/Z4m0djuw7t0gzIUKu
 TEmbUhs3aIbpVP5sA/vR/swArEeBILbEr8Y0ivehC3TC3fiDtrYdS3Ej0/x14n1opiDE
 +uDA==
X-Gm-Message-State: AOAM531rWIC5EvxZGU2epnAUKZzhOXuGnvzIR6r4tTz3Xu2qqQvd7EeV
 ky9Ct/JfKjZxe43qpBCT+FIsHpsBc6X7eTk4okV1Z+f/JM1xrske0sHW2TXLH+48tFuD+s0SmJE
 YnP048dr/R1unxcM=
X-Received: by 2002:a5d:4b8a:: with SMTP id b10mr8098560wrt.413.1637681389403; 
 Tue, 23 Nov 2021 07:29:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYMA22HwBPd7EiZLbtRRgk+gUFPArSZ3Xyf69NOxxi8RpRsIFewfMUqL7BKO+ITRr6NV0WPw==
X-Received: by 2002:a5d:4b8a:: with SMTP id b10mr8098528wrt.413.1637681389149; 
 Tue, 23 Nov 2021 07:29:49 -0800 (PST)
Received: from [192.168.8.100] (tmo-097-143.customers.d1-online.com.
 [80.187.97.143])
 by smtp.gmail.com with ESMTPSA id g13sm17023219wrd.57.2021.11.23.07.29.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 07:29:48 -0800 (PST)
Message-ID: <99260ad0-2b56-b235-dc7c-1f1b7b66df8e@redhat.com>
Date: Tue, 23 Nov 2021 16:29:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/1] MAINTAINERS: update email address of Christian
 Borntraeger
To: Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20211123095511.132810-1-borntraeger@linux.ibm.com>
 <bc047f32-4c79-da4b-4684-908c92a53439@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <bc047f32-4c79-da4b-4684-908c92a53439@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.515, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/11/2021 16.17, Christian Borntraeger wrote:
> 
> 
> Am 23.11.21 um 10:55 schrieb Christian Borntraeger:
>> My borntraeger@de.ibm.com email is just a forwarder to the
>> linux.ibm.com address. Let us remove the extra hop to avoid
>> a potential source of errors.
>>
>> While at it, add the relevant email addresses to mailmap.
>>
>> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
> 
> This should have been the new adress I think. Want me to resend?

Yes, it might be better if the S-o-B matches the "From:" address, I think.

  Thomas


>> ---
>>   .mailmap    | 1 +
>>   MAINTAINERS | 6 +++---
>>   2 files changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/.mailmap b/.mailmap
>> index 8beb2f95ae28..c45d1c530144 100644
>> --- a/.mailmap
>> +++ b/.mailmap
>> @@ -50,6 +50,7 @@ Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> 
>> <arikalo@wavecomp.com>
>>   Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> 
>> <aleksandar.rikalo@rt-rk.com>
>>   Alexander Graf <agraf@csgraf.de> <agraf@suse.de>
>>   Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori 
>> <aliguori@us.ibm.com>
>> +Christian Borntraeger <borntraeger@linux.ibm.com> <borntraeger@de.ibm.com>
>>   Filip Bozuta <filip.bozuta@syrmia.com> <filip.bozuta@rt-rk.com.com>
>>   Frederic Konrad <konrad@adacore.com> <fred.konrad@greensocs.com>
>>   Greg Kurz <groug@kaod.org> <gkurz@linux.vnet.ibm.com>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index d3879aa3c12c..e19d88ca9960 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -393,7 +393,7 @@ F: target/ppc/kvm.c
>>   S390 KVM CPUs
>>   M: Halil Pasic <pasic@linux.ibm.com>
>> -M: Christian Borntraeger <borntraeger@de.ibm.com>
>> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
>>   S: Supported
>>   F: target/s390x/kvm/
>>   F: target/s390x/ioinst.[ch]
>> @@ -1527,7 +1527,7 @@ S390 Machines
>>   -------------
>>   S390 Virtio-ccw
>>   M: Halil Pasic <pasic@linux.ibm.com>
>> -M: Christian Borntraeger <borntraeger@de.ibm.com>
>> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
>>   S: Supported
>>   F: hw/char/sclp*.[hc]
>>   F: hw/char/terminal3270.c
>> @@ -1541,7 +1541,7 @@ T: git https://github.com/borntraeger/qemu.git 
>> s390-next
>>   L: qemu-s390x@nongnu.org
>>   S390-ccw boot
>> -M: Christian Borntraeger <borntraeger@de.ibm.com>
>> +M: Christian Borntraeger <borntraeger@linux.ibm.com>
>>   M: Thomas Huth <thuth@redhat.com>
>>   S: Supported
>>   F: hw/s390x/ipl.*
>>
> 


