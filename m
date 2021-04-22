Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88184368281
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 16:35:48 +0200 (CEST)
Received: from localhost ([::1]:37378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZaQl-0008N5-IX
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 10:35:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZaPi-0007st-QA
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 10:34:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZaPf-0004Cl-PN
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 10:34:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619102079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CEJWK+K3GNVHmmE8v7iG74wtzx7+oyy0C5owKvGem3I=;
 b=FjMkQD2PUBDjWuE5fC78KBZl5482rb6js8mZJwaGzvZzIxtVbsINzVG5pGtViUrC5alfGj
 5cxxGrKabrWvwgJ+WzeWSpLMwlpsZw2KjD1lM/e3awqihlwoY6XC/KO+vS6pyNihPd0L+2
 GX+3OJ3OqRTJ7PakCl+CvAmeU0Kimn4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-eJIgD0QpOe20bYnAdkjGqA-1; Thu, 22 Apr 2021 10:34:37 -0400
X-MC-Unique: eJIgD0QpOe20bYnAdkjGqA-1
Received: by mail-wm1-f72.google.com with SMTP id
 a71-20020a1c984a0000b029013841a43c3dso1361605wme.3
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CEJWK+K3GNVHmmE8v7iG74wtzx7+oyy0C5owKvGem3I=;
 b=mL7uUl8BgkiSIZWXSdCFxvBUkf9psUEXHm1QuhoZzbiVFzmoxyPMwnJyiN46ZUHMHA
 pREjhIMpHd0+hMf5iNTldtrjc7unTMCZ+fkc/6hHksyAYt4E6jGukXtm1kMxjEPkospm
 ZKExWnj4M0QoeOO4mBZ1SFOgKsw29Jtp9s+exd/joQ5vpvdFmEjWWSK0ZMKkokW3vX2U
 tUNSvpO8L+CAVmBG5WzhQ8cup1jBp3Y4/9Suz7hPU7VgOVa8vXJsX2ACkekoZ2ekukDE
 hfBWw0beJo3Y6IupnytJcvXg4pYPZ9fqoPXvnxLUNi2XjSJIbOYmT0Rc7aUB+c70q8o4
 1ohQ==
X-Gm-Message-State: AOAM532uEQqXSHAoMKMdu4t6Qxpm3MlaFqcChpubisfQ6BFz+ITM8BrQ
 wBpFsJh+1qfuW4053XeI4ncMDOy3MdYwn1olDDGiOE1rNA1fWcGYQPVRlEosWldlA0TpuhgVfhv
 gbAVE9pqlJjud+VA=
X-Received: by 2002:a1c:5fc4:: with SMTP id t187mr362994wmb.9.1619102076345;
 Thu, 22 Apr 2021 07:34:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvOGOr7iMx1OdafVfdqxIMrNzdFAExCkqyk1kHlPsjyZ0dGGqYThlESrSvjTYWAnUwkyGeTw==
X-Received: by 2002:a1c:5fc4:: with SMTP id t187mr362972wmb.9.1619102076156;
 Thu, 22 Apr 2021 07:34:36 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id y11sm4126406wro.37.2021.04.22.07.34.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 07:34:35 -0700 (PDT)
Subject: Re: s390-ccw: warning: writing 1 byte into a region of size 0
 [-Wstringop-overflow=]
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <4e327c80-8f5d-c848-b524-7f2c75255da4@redhat.com>
 <485773db-fca2-03ca-c6e8-90ef313fb8f1@redhat.com>
 <YIFMt+xg+xH+M4rd@redhat.com>
 <CAFEAcA8r2k9f=XG6T_hYk542-dDJnR7Lr8DZnyc=SFgnzNYxxQ@mail.gmail.com>
 <089df242-8788-a162-4a75-4c9c9e04a64e@redhat.com>
 <YIFik1TKV3SaUZWv@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <38db0a77-7a53-3853-e350-0449b38e8068@redhat.com>
Date: Thu, 22 Apr 2021 16:34:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIFik1TKV3SaUZWv@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/21 1:48 PM, Daniel P. Berrangé wrote:
> On Thu, Apr 22, 2021 at 01:24:30PM +0200, Philippe Mathieu-Daudé wrote:
>> This silents the warning however:
>>
>> -- >8 --
>> diff --git a/pc-bios/s390-ccw/libc.h b/pc-bios/s390-ccw/libc.h
>> index bcdc45732d..2dea399904 100644
>> --- a/pc-bios/s390-ccw/libc.h
>> +++ b/pc-bios/s390-ccw/libc.h
>> @@ -19,6 +19,8 @@ typedef unsigned short     uint16_t;
>>  typedef unsigned int       uint32_t;
>>  typedef unsigned long long uint64_t;
>>
>> +#pragma GCC diagnostic push
>> +#pragma GCC diagnostic ignored "-Wstringop-overflow"
>>  static inline void *memset(void *s, int c, size_t n)
>>  {
>>      size_t i;
>> @@ -30,6 +32,7 @@ static inline void *memset(void *s, int c, size_t n)
>>
>>      return s;
>>  }
>> +#pragma GCC diagnostic pop
> 
> I wonder if it works if you put the pragma around the specific
> caller, as that would make the scope more limited so we can still
> see valid bugs elsewhere

No, this doesn't silence it:

-- >8 --
diff --git a/pc-bios/s390-ccw/main.c b/pc-bios/s390-ccw/main.c
@@ -182,7 +182,10 @@ static void boot_setup(void)
      * Clear out any potential S390EP magic (see jump_to_low_kernel()),
      * so we don't taint our decision-making process during a reboot.
      */
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wstringop-overflow"
     memset((char *)S390EP, 0, 6);
+#pragma GCC diagnostic pop

     have_iplb = store_iplb(&iplb);
 }
---

> 
>>
>>  static inline void *memcpy(void *s1, const void *s2, size_t n)
>>  {
>> ---
>>
>> Oddly this code doesn't emit any warning:
> 
> Let me correct that for you
> 
>   s/doesn't emit any warning/doesn't emit any warning *yet*/
> 
> compilers get more strict all the time. The memcmp is just
> a memory read, however, while memset is a write, so less
> severe

OK :)

>>   if (!memcmp((char *)S390EP, "S390EP", 6)) {
>>   ...
> 
> Regards,
> Daniel
> 


