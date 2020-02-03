Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E60DF1505EA
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 13:12:14 +0100 (CET)
Received: from localhost ([::1]:38848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iyaaM-0000c2-1C
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 07:12:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47397)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iyaZ7-0008AR-O9
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 07:10:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iyaZ6-0004FR-OT
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 07:10:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56680
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iyaZ6-0004FJ-L1
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 07:10:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580731856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EgXyIc9yJgt99aTXmAsn6Ote3c7lAnT4TIkX8vWTrh4=;
 b=bxeAYG1REgO/akwd/R4XhOdn0EsbUP/ZK6ESMVOruaCorIKoPnbleQnfnpvkH9iPgp2/WJ
 fFitGWwITcWxnbwnv/oTbyne6DbbT9w6vvDDWqcGguk9Z6aCLN+qdM3+wrzZWzOi1BYzyR
 JJQQ5g0XaFMct2k2LbZ6KCF4YWezCU0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-3eI0sc08M6K1UjmhTgyCPQ-1; Mon, 03 Feb 2020 07:10:52 -0500
Received: by mail-wm1-f69.google.com with SMTP id d4so3935274wmd.7
 for <qemu-devel@nongnu.org>; Mon, 03 Feb 2020 04:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MQd+Sg+CCsPuGVmbbl2Xu50bbinJ05N2ivB/V2mVvYM=;
 b=eBq2Yug/8kyNb7b/IBBuHgw3BH2loaxTIc/nTqccLIhA4eaElLAMhgakP0BM6xuX7F
 o/FMBWnGXg4ItMur0Zp9oFIP75vjlCwhZH292JT4sBFPXQp5LzhZieBbgOlzrve9n6zo
 bG9tmRNLzZoGY9iQtIbDE9ROvlJt3RdSJ1/y4Lg6hJEFLdTBiStr5IHIGNGf9NyrLerM
 JOu97sCY/p/wbveytyJ8FeyjmntluaUiBWUFq6vQ3R3t6Z6M1E9F04+rGNxQKBqyV9eM
 JIO6DKZC9edqhuEU1zm0FYQYNQQcBhMZAqtDN4nEykp+E6FwVwnETXwGZdx6lRlsHZK7
 1v9A==
X-Gm-Message-State: APjAAAVDNHD5MBgsGifT9aYb+BGi5LSOzC4NORCPZ1QP2/tnJLu2Cl+7
 2fRy6ZKbF2KLmWo3GGV5o43nXL/8UwVOSB7vPk2z8kyWUDW9J0+wXzPo1OnfY07ffdB7+V69fL/
 vwc/US9sg217B4F0=
X-Received: by 2002:a1c:9c52:: with SMTP id f79mr28831373wme.30.1580731851123; 
 Mon, 03 Feb 2020 04:10:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqxpuL9aZtQ35WRSc2Em3Us9bK+D3CGZQbvovqdReD95Glkvi5nLwGl49Ena3WrusvIlW7CAEg==
X-Received: by 2002:a1c:9c52:: with SMTP id f79mr28831357wme.30.1580731850954; 
 Mon, 03 Feb 2020 04:10:50 -0800 (PST)
Received: from [192.168.1.35] (162.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.162])
 by smtp.gmail.com with ESMTPSA id w22sm22569375wmk.34.2020.02.03.04.10.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2020 04:10:50 -0800 (PST)
Subject: Re: [PATCH v2 2/4] Add the NetBSD Virtual Machine Monitor accelerator.
To: Kamil Rytarowski <n54@gmx.com>, rth@twiddle.net, ehabkost@redhat.com,
 slp@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 max@m00nbsd.net
References: <20200107124903.16505-1-n54@gmx.com>
 <20200128140945.929-1-n54@gmx.com> <20200128140945.929-3-n54@gmx.com>
 <e3279b9d-e6f9-43f3-3ebb-b31ba8ff5f7e@redhat.com>
 <4e29b732-ce95-02f1-ec9c-31f1ce33cda0@gmx.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <703fb9e6-a4c6-ec21-ecfe-fa99834f8ea7@redhat.com>
Date: Mon, 3 Feb 2020 13:10:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <4e29b732-ce95-02f1-ec9c-31f1ce33cda0@gmx.com>
Content-Language: en-US
X-MC-Unique: 3eI0sc08M6K1UjmhTgyCPQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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

On 2/3/20 12:56 PM, Kamil Rytarowski wrote:
> On 03.02.2020 12:41, Philippe Mathieu-Daud=C3=A9 wrote:
>>> @@ -1768,6 +1785,7 @@ disabled with --disable-FEATURE, default is
>>> enabled if available:
>>>  =C2=A0=C2=A0=C2=A0 hax=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 HAX acceleration support
>>>  =C2=A0=C2=A0=C2=A0 hvf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 Hypervisor.framework acceleration support
>>>  =C2=A0=C2=A0=C2=A0 whpx=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 Windows Hypervisor Platform acceleration support
>>> +=C2=A0 nvmm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NetBSD Virtual Machine Monitor acceleration support
>>>  =C2=A0=C2=A0=C2=A0 rdma=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 Enable RDMA-based migration
>>>  =C2=A0=C2=A0=C2=A0 pvrdma=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Enable PVRDMA support
>>>  =C2=A0=C2=A0=C2=A0 vde=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 support for vde network
>>> @@ -2757,6 +2775,20 @@ if test "$whpx" !=3D "no" ; then
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>>  =C2=A0 fi
>>>
>>
>> Maybe you can add something like:
>>
>> if test "$targetos" =3D "NetBSD"; then
>>  =C2=A0=C2=A0=C2=A0 nvmm=3D"check"
>> fi
>>
>> to build by default with NVMM if available.
>=20
> I will add nvmm=3Dyes to the NetBSD) targetos check section.

Ah yes, clever :)


