Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09F2370B39
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 13:06:29 +0200 (CEST)
Received: from localhost ([::1]:48514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ld9vg-0004rY-A3
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 07:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ld9rB-0003so-8W
 for qemu-devel@nongnu.org; Sun, 02 May 2021 07:01:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ld9r8-0003G4-1i
 for qemu-devel@nongnu.org; Sun, 02 May 2021 07:01:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619953305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ogGGi1nimkDkciI6MJNXpaT7u49hRr0PWJjThi16z0Y=;
 b=ewD/goXDGKtLeBupZtQIpIF7tH14ChmtiybAVWFNi2/4R3IDH7Ol2L/AjEvxG8lZOGPMCx
 GiG8jzSQ+PChMxKO2A13lHv3wemiSEM2O6U/EpVv/f6mpZVaqJVMPc/mw8er2LO4ANfg7a
 HkhSOtCwwettHMqK1SvRzYmy5HW1uI8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-OK2r5628PVeqE9pI1ZsHPw-1; Sun, 02 May 2021 07:01:41 -0400
X-MC-Unique: OK2r5628PVeqE9pI1ZsHPw-1
Received: by mail-wr1-f69.google.com with SMTP id
 r12-20020adfc10c0000b029010d83323601so2113197wre.22
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 04:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ogGGi1nimkDkciI6MJNXpaT7u49hRr0PWJjThi16z0Y=;
 b=HOeI6WWWj3P5Km6k3Dj8AdQLIub2cVVjHbK4zJv8rQtEfuiiq9ITn4rvazAkWZRyHt
 PiwmP7Oak/nO9fknTk7ummZzrdcTaJ9O3OK7z0GZsoEpHuRebGvT6qf2HPgq1szzB0vQ
 K1bmA2SybIpa42y3s1BC3P8A4qRCdWE3nS2A7BBhsUEloJioQvjS+mHinYEbstUkbeN3
 IwvVmGDaGwMGTfQjwHPpuOlne8gwl+rUzf9Ux75uq41mHAlvLJyxxrDvw14sGczagBb+
 bxScvWUP01RfGDJfz9SKL7fAtCGVBjEmJKLrAYrcBpv72MbJKBl2LFhlf+F5M93xTsDW
 iJBg==
X-Gm-Message-State: AOAM5337sq41xwTeMil4O6UPRE6xOkV3Rz6ioMwwJKlC0wF4rEuBY7B+
 WrvX03U+s6pl623ZEoThmkgi8E3MdO0t1E/flsEqbMVt7MQOeo1yjek+GKHxOEBJq+pWYLu2yqJ
 G58UIoimkyqJV0Zw=
X-Received: by 2002:adf:fc02:: with SMTP id i2mr18812958wrr.112.1619953300131; 
 Sun, 02 May 2021 04:01:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhGakn+SPKNCS//+kM133n6CiIdD8vy/wqIhBIf0b/3QgthP6G/h0jPATy5yhCXkJZ6wyIUA==
X-Received: by 2002:adf:fc02:: with SMTP id i2mr18812932wrr.112.1619953299944; 
 Sun, 02 May 2021 04:01:39 -0700 (PDT)
Received: from thuth.remote.csb (p5791d34b.dip0.t-ipconnect.de.
 [87.145.211.75])
 by smtp.gmail.com with ESMTPSA id h14sm10646045wrq.45.2021.05.02.04.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 May 2021 04:01:39 -0700 (PDT)
Subject: Re: [PATCH] pc-bios/s390-ccw: Silence GCC 11 stringop-overflow warning
From: Thomas Huth <thuth@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210422145911.2513980-1-philmd@redhat.com>
 <8c0e3588-329e-6b89-fec3-95643a892ed6@redhat.com>
Message-ID: <764bc8f0-dfba-f68d-508f-677644bb64d6@redhat.com>
Date: Sun, 2 May 2021 13:01:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <8c0e3588-329e-6b89-fec3-95643a892ed6@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Miroslav Rezanina <mrezanin@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/05/2021 12.39, Thomas Huth wrote:
> On 22/04/2021 16.59, Philippe Mathieu-Daudé wrote:
>> When building on Fedora 34 (gcc version 11.0.0 20210210) we get:
>>
>>    In file included from pc-bios/s390-ccw/main.c:11:
>>    In function ‘memset’,
>>        inlined from ‘boot_setup’ at pc-bios/s390-ccw/main.c:185:5,
>>        inlined from ‘main’ at pc-bios/s390-ccw/main.c:288:5:
>>    pc-bios/s390-ccw/libc.h:28:14: warning: writing 1 byte into a region of 
>> size 0 [-Wstringop-overflow=]
>>       28 |         p[i] = c;
>>          |         ~~~~~^~~
>>
>> The offending code is:
>>
>>    memset((char *)S390EP, 0, 6);
>>
>> where S390EP is a const address:
>>
>>    #define S390EP 0x10008
>>
>> The compiler doesn't now how big that pointed area is, so assume its
>> length is zero. This has been reported as BZ#99578 to GCC:
>> "gcc-11 -Warray-bounds or -Wstringop-overread warning when accessing a
>> pointer from integer literal"
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578
>>
>> As this warning does us more harm than good in the BIOS code (where
>> lot of direct accesses to low memory are done), silence this warning
>> for all BIOS objects.
>>
>> Re-introduce the cc-c-option macro (see commit 036999e93e4) to check
>> whether the compiler supports this warning or not.
>>
>> Suggested-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   pc-bios/s390-ccw/Makefile | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
>> index 29fd9019b83..21581d1258d 100644
>> --- a/pc-bios/s390-ccw/Makefile
>> +++ b/pc-bios/s390-ccw/Makefile
>> @@ -8,6 +8,8 @@ CFLAGS = -O2 -g
>>   quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && 
>> $1, @$1))
>>   cc-option = $(if $(shell $(CC) $1 -S -o /dev/null -xc /dev/null > 
>> /dev/null \
>>             2>&1 && echo OK), $1, $2)
>> +cc-c-option = $(if $(shell $(CC) $1 $2 -c -o /dev/null -xc /dev/null \
>> +          >/dev/null 2>&1 && echo OK), $2, $3)
>>   VPATH_SUFFIXES = %.c %.h %.S %.m %.mak %.sh %.rc Kconfig% %.json.in
>>   set-vpath = $(if $1,$(foreach PATTERN,$(VPATH_SUFFIXES),$(eval vpath 
>> $(PATTERN) $1)))
>> @@ -30,6 +32,7 @@ OBJECTS = start.o main.o bootmap.o jump2ipl.o sclp.o 
>> menu.o \
>>         virtio.o virtio-scsi.o virtio-blkdev.o libc.o cio.o dasd-ipl.o
>>   QEMU_CFLAGS := -Wall $(filter -W%, $(QEMU_CFLAGS))
>> +QEMU_CFLAGS += $(call cc-c-option, $(QEMU_CFLAGS), -Wno-stringop-overflow)
> 
> Hi Philippe,
> 
> looking at this patch again, I wonder whether it's really necessary to 
> introduce the "cc-c-option" macro here? Wouldn't this work with the existing 
> "cc-option" macro, too, since it's only about a flag that is used for the 
> compiler, and not at the assembler stage?

Darn, that old cc-option macro seems to be broken ... needs to be fixed 
first ... I'll try to come up with a patch.

  Thomas


