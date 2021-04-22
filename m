Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AB136827E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 16:34:24 +0200 (CEST)
Received: from localhost ([::1]:35136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZaPQ-0007PV-3E
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 10:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZaN7-0006BY-3P
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 10:32:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZaN2-0002fu-Qw
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 10:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619101915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cxHRnjoWKAgJC6CB2Eru+SlGCj9RkitFT6BVxxgZEl4=;
 b=Tk7MuRNdHi+6OdrCIlTHfJY6iZrae+5VgnLRltldRhMoQaK3Z/GVfwu23Yo56rWQf8Ek+z
 KgHOqJeEH+QXgqc98BbLkb9eCCXS5LTtN4Amw7C0nhgNFbvMPdZXga0IiqVrRV1I70JifL
 5lktEBYCO1FVdYIe92BPudNLKKVQBVw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-DegEb2ZvNC2xojk-58f10g-1; Thu, 22 Apr 2021 10:31:52 -0400
X-MC-Unique: DegEb2ZvNC2xojk-58f10g-1
Received: by mail-wm1-f70.google.com with SMTP id
 g199-20020a1c9dd00000b02901355dd71edaso1699036wme.7
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cxHRnjoWKAgJC6CB2Eru+SlGCj9RkitFT6BVxxgZEl4=;
 b=j18xZGE3WmTIlrAQkXUzJs9n+nFVp7A7CsauJt+8ZDpd9pToSe/RpugC+NW/GU/JVu
 T6W6RT2sybX/XdIBBjOu5xq6HIvPFO4dTGvRU96l6/FxYyq/aCAgFMLSx+oNIUAjvkP9
 L9Q9sBngFkdCU/zQC0+lUuqIc1Jajz+C5deoYMYZ53dhP2IaFVfdaxYlxvEyTkit7KiS
 ba3N2qP3YF29szUE++tzRNLRxlt4mhtg/o513go0gnhCHNJWBGHxWvAsYn7WEW1V5l9R
 ZFH5wsK6kT4HhWEBxIUFrUX/Bzp2D1llNzIXvAWGixvgvv7btgY9/0AFgrGTNwUQiEEV
 RqMw==
X-Gm-Message-State: AOAM533OKfBNMzHwC8gb7zPALdnmzyX1PtglUkyZ06OsxvQ1rZ19f8DP
 E5RmDDsP7z+EwlGNpyFPitMisu2aVrEwKJ7Dgaexxo3+LVUAziwOLTjBhGHsdMT1oxY/ETCLwU0
 ASze0h60At1umTcY=
X-Received: by 2002:a1c:20c2:: with SMTP id g185mr4144968wmg.74.1619101911578; 
 Thu, 22 Apr 2021 07:31:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWLnHuRVx+rBJU1nzuHIUvaPkCtM5dZK/dM4xo6SItPbHjzt0oV86G5kgSnF9pHxGSOtQzlQ==
X-Received: by 2002:a1c:20c2:: with SMTP id g185mr4144941wmg.74.1619101911322; 
 Thu, 22 Apr 2021 07:31:51 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id a2sm4091493wrt.82.2021.04.22.07.31.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 07:31:50 -0700 (PDT)
Subject: Re: s390-ccw: warning: writing 1 byte into a region of size 0
 [-Wstringop-overflow=]
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <4e327c80-8f5d-c848-b524-7f2c75255da4@redhat.com>
 <485773db-fca2-03ca-c6e8-90ef313fb8f1@redhat.com>
 <YIFMt+xg+xH+M4rd@redhat.com>
 <CAFEAcA8r2k9f=XG6T_hYk542-dDJnR7Lr8DZnyc=SFgnzNYxxQ@mail.gmail.com>
 <089df242-8788-a162-4a75-4c9c9e04a64e@redhat.com>
 <8afd0f34-7e75-2661-9ea5-3ebadff3b85d@redhat.com>
 <2ec6e995-6833-1ebd-03c8-a3fede7fddb8@de.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e4116908-7172-fd9c-1837-82c489b61620@redhat.com>
Date: Thu, 22 Apr 2021 16:31:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2ec6e995-6833-1ebd-03c8-a3fede7fddb8@de.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/21 2:41 PM, Christian Borntraeger wrote:
> On 22.04.21 13:47, Thomas Huth wrote:
>> On 22/04/2021 13.24, Philippe Mathieu-Daudé wrote:
>>> On 4/22/21 12:30 PM, Peter Maydell wrote:
>>>> On Thu, 22 Apr 2021 at 11:18, Daniel P. Berrangé
>>>> <berrange@redhat.com> wrote:

>>> This silents the warning however:
>>>
>>> -- >8 --
>>> diff --git a/pc-bios/s390-ccw/libc.h b/pc-bios/s390-ccw/libc.h
>>> index bcdc45732d..2dea399904 100644
>>> --- a/pc-bios/s390-ccw/libc.h
>>> +++ b/pc-bios/s390-ccw/libc.h
>>> @@ -19,6 +19,8 @@ typedef unsigned short     uint16_t;
>>>   typedef unsigned int       uint32_t;
>>>   typedef unsigned long long uint64_t;
>>>
>>> +#pragma GCC diagnostic push
>>> +#pragma GCC diagnostic ignored "-Wstringop-overflow"
>>>   static inline void *memset(void *s, int c, size_t n)
>>>   {
>>>       size_t i;
>>> @@ -30,6 +32,7 @@ static inline void *memset(void *s, int c, size_t n)
>>>
>>>       return s;
>>>   }
>>> +#pragma GCC diagnostic pop
>>
>> Honestly, that compiler "bug" sounds like it could trigger at any
>> other spot in the bios code, too, since we are doing lots of direct
>> accesses to low memory there. I think it's likely best if we shut it
>> off with -Wno-stringop-overflow in the pc-bios/s390-ccw/Makefile ...
>> could you please try to add it there?
> 

We are good with:

-- >8 --
diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
index 29fd9019b8..dcec09b6f9 100644
--- a/pc-bios/s390-ccw/Makefile
+++ b/pc-bios/s390-ccw/Makefile
@@ -8,6 +8,9 @@ CFLAGS = -O2 -g
 quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 &&
$1, @$1))
 cc-option = $(if $(shell $(CC) $1 -S -o /dev/null -xc /dev/null >
/dev/null \
              2>&1 && echo OK), $1, $2)
+cc-c-option = $(if $(shell $(CC) $1 $2 -c -o /dev/null -xc /dev/null \
+                >/dev/null 2>&1 && echo OK), $2, $3)

 VPATH_SUFFIXES = %.c %.h %.S %.m %.mak %.sh %.rc Kconfig% %.json.in
 set-vpath = $(if $1,$(foreach PATTERN,$(VPATH_SUFFIXES),$(eval vpath
$(PATTERN) $1)))
@@ -30,6 +33,7 @@ OBJECTS = start.o main.o bootmap.o jump2ipl.o sclp.o
menu.o \
          virtio.o virtio-scsi.o virtio-blkdev.o libc.o cio.o dasd-ipl.o

 QEMU_CFLAGS := -Wall $(filter -W%, $(QEMU_CFLAGS))
+QEMU_CFLAGS += $(call cc-c-option, $(QEMU_CFLAGS), -Wno-stringop-overflow)
 QEMU_CFLAGS += -ffreestanding -fno-delete-null-pointer-checks
-fno-common -fPIE
 QEMU_CFLAGS += -fwrapv -fno-strict-aliasing -fno-asynchronous-unwind-tables
 QEMU_CFLAGS += $(call cc-option, $(QEMU_CFLAGS), -fno-stack-protector)
---

> Ack. This warning does more harm than good in here.
>

Patch coming.


