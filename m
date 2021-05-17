Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B502383D1F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:20:01 +0200 (CEST)
Received: from localhost ([::1]:38170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liimW-0003eV-3m
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1liiAd-0007Dy-L7
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:40:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1liiAb-0002Fy-UE
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:40:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621276849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5mskiK9eytv0Z/opdYmgVa/pUCvsB/3gGp56YzmWCyg=;
 b=i56XB4aPFTn2/IeNTMeXOfkOGngFhkkOvqLsoe+/1rxmMK6Y4ZRJWSh0yCltBC3dqY8Jhb
 BtNRMF3FNUgtuHFojTCFj0Hjk45ZGEEsVMgjm61XULO2CLmGCn9pT7C4POMz3Ns3HPOOLJ
 czzISyEZFcLtxM+xT0yTwDcRq+kVGks=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-F37UuDydO4GgRX-tebRRUQ-1; Mon, 17 May 2021 14:40:47 -0400
X-MC-Unique: F37UuDydO4GgRX-tebRRUQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 y17-20020a0564023591b02903886c26ada4so4409737edc.5
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 11:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5mskiK9eytv0Z/opdYmgVa/pUCvsB/3gGp56YzmWCyg=;
 b=ZKkL1xULZ5f77JIUQhx2Wi46e7N0qfSFxZBoOAdKWl1s/aS/HcX7/wKXT5h8uXe60y
 F/3xzFr8HBQsDI8QV5rh1B+ATsm1MXjP+R5d1+oOPTvIrtVDZ+W6OLP2BNFFWHjsgcPx
 dgU6nzueSC95rNGRMHiTOQ5a1VkAQxp6UWMlo++XLsiGlFwTMjsz2UCUlI+RnyTO93hQ
 NDRoDzak6kW6xG8Wx+NIlJnVc4etL9piyXa5tWjCv2nVOVchIov/CGW4mXkNYTWn8/er
 QBzaC3AqMDg0zEEheb9TryQa4fiHfkyPLFhnUpYwZmjESugDfg/9xnpjXGiEnUGgtKCr
 uQTQ==
X-Gm-Message-State: AOAM5331AGCnWbYICmQHHFZ4MpRcedh419U+4Vww0DdagFwqsEOC6+r1
 g/E1mRZoYlyQWlVjx7CvRHcSSEOBbhFnl7ESUpdqCQmocKXqpZ7xyfyIb1ScYl+hYQvy4tkADCD
 8sxR0U7QQD7lBVVM=
X-Received: by 2002:aa7:c718:: with SMTP id i24mr1636247edq.43.1621276846299; 
 Mon, 17 May 2021 11:40:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyZiETmxE5NhLWSdhvktBZnD+FOfCyAllwphHxBXKZauNVlXLydqO1ImEZMYdn6SonGrxf0A==
X-Received: by 2002:aa7:c718:: with SMTP id i24mr1636237edq.43.1621276846181; 
 Mon, 17 May 2021 11:40:46 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id ho32sm8997260ejc.82.2021.05.17.11.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 11:40:45 -0700 (PDT)
Subject: Re: [PATCH v3 3/8] hw/block/fdc: Extract ISA floppy controllers to
 fdc-isa.c
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210517174947.1199649-1-philmd@redhat.com>
 <20210517174947.1199649-4-philmd@redhat.com>
 <239bdcfb-1172-c27f-7cd3-2bb86c8beb3d@redhat.com>
 <14574bd1-6658-dbf3-0591-94e8168e89ea@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cbd71a68-1b3a-b9be-63d9-e3ec085c62d1@redhat.com>
Date: Mon, 17 May 2021 20:40:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <14574bd1-6658-dbf3-0591-94e8168e89ea@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 8:19 PM, John Snow wrote:
> On 5/17/21 2:04 PM, John Snow wrote:
>> On 5/17/21 1:49 PM, Philippe Mathieu-Daudé wrote:
>>> Some machines use floppy controllers via the SysBus interface,
>>> and don't need to pull in all the ISA code.
>>> Extract the ISA specific code to a new unit: fdc-isa.c, and
>>> add a new Kconfig symbol: "FDC_ISA".
>>>
>>> Reviewed-by: John Snow <jsnow@redhat.com>
>>> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> Sorry, I'm seeing build failures on this for patch #03:
>>
>> ../../configure --enable-docs; and make -j13
>>
>> ...
>>
>> /usr/bin/ld: libcommon.fa.p/hw_isa_isa-superio.c.o: in function
>> `isa_superio_realize':
>> /home/jsnow/src/qemu/bin/git/../../hw/isa/isa-superio.c:132: undefined
>> reference to `isa_fdc_init_drives'
>> collect2: error: ld returned 1 exit status
>>
>>
> 
> It appears to show up if you enable the mips-softmmu target.

Sorry, fixed in v4...


