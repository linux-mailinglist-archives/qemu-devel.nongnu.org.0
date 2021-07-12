Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CB43C5DCB
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:55:39 +0200 (CEST)
Received: from localhost ([::1]:39074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2wPK-0006dO-Oj
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m2vxj-0006VT-8f
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:27:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m2vxg-0001Kx-JY
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 09:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626096422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dfJBi8kTzTxTO0XAYv3uKrgA0sa1sP2HfO5PhRTA7JM=;
 b=AkQz7Z6t8xxEpE3XhitHjofZcGYPDtBLWnhpadhHR8TppoSoiASryyLk2Xop9x4wdbuy0w
 7/+Ti2Adu8abRKfCvT/4MuJtpbqpHaEb/30DejSsDlpsHlEzxtG3O+Vj2qDAkVsBkO3y0y
 igl6Ox+2vJlQw0KtVAaspqqISR7pth4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-yK_P_C4PPiCRu-QBP11LMg-1; Mon, 12 Jul 2021 09:27:01 -0400
X-MC-Unique: yK_P_C4PPiCRu-QBP11LMg-1
Received: by mail-qk1-f197.google.com with SMTP id
 t144-20020a3746960000b02903ad9c5e94baso14168898qka.16
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 06:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=dfJBi8kTzTxTO0XAYv3uKrgA0sa1sP2HfO5PhRTA7JM=;
 b=FoAr1dTfwLV5fmIksPCbz9VxfIV753Q2q1KP9iALNzZwCLzHC8oPuF41y4SlpAt/J3
 efx+TpYFhpOxjtSys3Y2vAifb2IjwSasYBRQh7oCPNalq2dfbREuu4///pUcjE84vDKW
 MW3on34b4+z3Xozrhyx8bPV+bms8dPXeecygEAQryyhYrs/zR/2DXdgJhNty/NmSqj3v
 NhKNvvx4konaUBSMvvZ9B9DIbBw6prbGNQQnHaspfav9PxNWdguhXNcYarTkfyuv/pZe
 zIM58hHpBMVzh2k0dM5grR9lFKWAiokcO59fU97vrg4F7d7p0J2KoAKwv8ZsC6bNALff
 YJ0Q==
X-Gm-Message-State: AOAM531pCVf9ReZqEsfU2gP8zioMGNd52HDWqFYeGOGWcDLGye9UEl0V
 sd5f+xhTOcXkZqER/+03A//Ybb8MVCpDDs6Uj5pS+Gx2P/WsSBE6X2U/NsoMfGjU73YU1AY+1/p
 d6j3D9MVPMbsjypo=
X-Received: by 2002:a05:620a:135b:: with SMTP id
 c27mr34872803qkl.51.1626096420572; 
 Mon, 12 Jul 2021 06:27:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1I0JjmfCOMs3KAwNE+1BSTHJVgP5xmAYa8H94czlxWUSO2X3P8vXbyjEoTyblq7ywOq0Wxw==
X-Received: by 2002:a05:620a:135b:: with SMTP id
 c27mr34872790qkl.51.1626096420338; 
 Mon, 12 Jul 2021 06:27:00 -0700 (PDT)
Received: from p50.localhost.localdomain
 ([2601:18d:8a00:ab70:b677:d979:630:695c])
 by smtp.gmail.com with ESMTPSA id y10sm5581426qta.35.2021.07.12.06.26.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 06:26:59 -0700 (PDT)
Subject: Re: [PATCH v5 1/4] avocado_qemu: Fix KNOWN_DISTROS map into the
 LinuxDistro class
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 philmd@redhat.com, wainersm@redhat.com
References: <20210706131729.30749-1-eric.auger@redhat.com>
 <20210706131729.30749-2-eric.auger@redhat.com>
 <df9835de-fe4a-2233-a625-3b04b7b0d514@redhat.com>
 <917bb587-ccd1-cac7-1e82-d2f869feaf02@redhat.com>
 <7e1cf0c6-97b4-ebfe-f046-c2fe06e5e6e3@redhat.com>
 <1cd52b26-aec2-6173-4340-8df87aa79c65@redhat.com>
From: Cleber Rosa <crosa@redhat.com>
Message-ID: <f6096139-e4b0-309b-dd17-982bebca421c@redhat.com>
Date: Mon, 12 Jul 2021 09:26:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1cd52b26-aec2-6173-4340-8df87aa79c65@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: wrampazz@redhat.com, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 7/8/21 3:32 PM, Eric Auger wrote:
> Hi Cleber,
>
> On 7/8/21 7:34 PM, Cleber Rosa wrote:
>> On 7/8/21 4:56 AM, Eric Auger wrote:
>>> I am not sufficiently expert on the test infra and python to be really
>>> efficient fixing that. Can anyone help quickly to target the soft
>>> freeze? Otherwise, today I will drop that patch and restore the code I
>>> had in v4, just based on Cleber series. I think the refactoring can
>>> happen later...
>>
>> Hi Eric,
>>
>>
>> The following diff works for me:
>>
>>
>> diff --git a/tests/acceptance/avocado_qemu/__init__.py
>> b/tests/acceptance/avocado_qemu/__init__.py
>> index af93cd63ea..b3bed00062 100644
>> --- a/tests/acceptance/avocado_qemu/__init__.py
>> +++ b/tests/acceptance/avocado_qemu/__init__.py
>> @@ -310,6 +310,8 @@ class LinuxDistro:
>>               '31': {
>>                   'x86_64':
>>                   {'checksum':
>> 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'},
>> +                'aarch64':
>> +                {'checksum':
>> '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49'},
>>                   'ppc64':
>>                   {'checksum':
>> '7c3528b85a3df4b2306e892199a9e1e43f991c506f2cc390dc4efa2026ad2f58'},
>>                   's390x':
>> @@ -323,10 +325,11 @@ def __init__(self, name, version, arch):
>>           self.version = version
>>           self.arch = arch
>>           try:
>> -            self._info =
>> self.KNOWN_DISTROS.get(name).get(version).get(arch)
>> +            info = self.KNOWN_DISTROS.get(name).get(version).get(arch)
>>           except AttributeError:
>>               # Unknown distro
>> -            self._info = {}
>> +            info = None
>> +        self._info = info or {}
>>
>>       @property
>>       def checksum(self):
>>
>>
>> I've tested it with both existing and the newly introduced tests.
> Thank you for the work! Do you plan to introduce it as a fixup or do I
> need to respin?


Hi Eric,


Yes, I can add it as a fixup.


Thanks,

- Cleber.



