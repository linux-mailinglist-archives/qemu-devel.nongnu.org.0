Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AE93BE428
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 10:14:52 +0200 (CEST)
Received: from localhost ([::1]:37964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m12hm-0007ay-Rc
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 04:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m12gu-0006mE-0N
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 04:13:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m12gZ-0003vw-RG
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 04:13:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625645614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6aA7WbRS7MqzTvnYl7/nrZQHzywSWhxz4tp+MOsYAgo=;
 b=GoJ9WkC27qkvyP9K9Bv6tsgGD1g9RECMy4OzjjCT2Nwy5m7UJI6WLzD+Esy1qqxrfcNBvS
 mzcX4ebCgscV0gxer1qQMXyV/Ezuja1jPL7QKlKD38YCUu8wneRm27eu3lt+w+S6Cy4Rz0
 Nz0N84H7tHIuk2T5P+TCreKATVUNLjw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-fom6mrY1Pt-_QWcvc7BHYA-1; Wed, 07 Jul 2021 04:13:33 -0400
X-MC-Unique: fom6mrY1Pt-_QWcvc7BHYA-1
Received: by mail-wr1-f69.google.com with SMTP id
 h11-20020adffa8b0000b029013a357d7bdcso106503wrr.18
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 01:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6aA7WbRS7MqzTvnYl7/nrZQHzywSWhxz4tp+MOsYAgo=;
 b=e0MFihD30tzUAPhQlcV8DmjOnX5wDSVH+ibGeKPrKJcGrjPPPboby+g3ZRm0D5+Iwg
 eH7XWhYVmNNG6PIcW1q6X71K6d1WDBiByfPpcs6+i5v9zOOOXLOfEUNkq+/WlvXnHkxz
 PUAnf0geFdjs52nIp9weQRjwMWV51QPCzf03Dtk2cvIhYILLu5SlDIzSdm0H0UY0kYkD
 bpc4Jfl0yiPRG1NELEf+Be9cWc6Z32g4aF9HcYxSFv8cyE+bTBPio1rZZ8gNEJ92r9aA
 wDI9ocpVz3o5xpgULV8988Lr68JpZhxTbmSBPTHB4YvIglB0wwTYZ/8R6JNloffy7chR
 0wlQ==
X-Gm-Message-State: AOAM532+fBYYN8DIqxzqS4sdqxRUfmI/5guHZNoRdc1PT/TFEzbMsa8M
 ML1APl122q54n9KfojlKJMFQrvZIrpvgtjFWGSftrq6NKMJUh3FrCW01PNsqk7GxxxbOR7inLB1
 QyT4OdYKwPpHVBbY=
X-Received: by 2002:adf:ba43:: with SMTP id t3mr21103632wrg.184.1625645612520; 
 Wed, 07 Jul 2021 01:13:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4c9iR7oXKAw5OCKVws4OQ+4UeIDdBnKgnNSjzTqe1mWstXzSfgwoe2XAKWYcNVJ2ApG7Uvw==
X-Received: by 2002:adf:ba43:: with SMTP id t3mr21103609wrg.184.1625645612300; 
 Wed, 07 Jul 2021 01:13:32 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id q1sm15423581wma.27.2021.07.07.01.13.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 01:13:31 -0700 (PDT)
Subject: Re: [PATCH] Fix libdaxctl option
To: Thomas Huth <thuth@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 qemu-devel@nongnu.org
References: <20210707063124.81954-1-mrezanin@redhat.com>
 <66a2e508-462b-a19f-3d04-1a55077aba89@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0d76b55d-3c13-c0d1-4aea-49eab97d839b@redhat.com>
Date: Wed, 7 Jul 2021 10:13:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <66a2e508-462b-a19f-3d04-1a55077aba89@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/7/21 8:35 AM, Thomas Huth wrote:
> On 07/07/2021 08.31, Miroslav Rezanina wrote:
>> For some reason, libdaxctl option setting was set to work in an opposite
>> way (--enable-libdaxctl disabled it and vice versa). Fixing this so
>> configuration works properly.
>>
>> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
>> ---
>>   configure | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/configure b/configure
>> index 650d9c0735..4f51528a77 100755
>> --- a/configure
>> +++ b/configure
>> @@ -1531,9 +1531,9 @@ for opt do
>>     ;;
>>     --disable-keyring) secret_keyring="no"
>>     ;;
>> -  --enable-libdaxctl) libdaxctl=disabled
>> +  --enable-libdaxctl) libdaxctl="enabled"
>>     ;;
>> -  --disable-libdaxctl) libdaxctl=enabled
>> +  --disable-libdaxctl) libdaxctl="disabled"
>>     ;;
>>     --enable-fuse) fuse="enabled"
>>     ;;
>>
> 
> Fixes: 83ef16821a ("configure, meson: convert libdaxctl detection to
> meson")
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


