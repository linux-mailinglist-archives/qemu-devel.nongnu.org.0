Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D86191543EA
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 13:19:36 +0100 (CET)
Received: from localhost ([::1]:37778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izg87-0001UP-MR
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 07:19:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36029)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1izg6u-0000cU-Dc
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 07:18:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1izg6r-0004DP-Sv
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 07:18:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20696
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1izg6q-0004Ac-Ae
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 07:18:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580991495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jZ94rHm6SBc+iTHRvTCar6CU4ctuj8QImUKR28E34wc=;
 b=NHouwRXkVk6snXdZspwQ1f2XNU8VAJilkocudYkl+sWWR8UZDOX4xv2mIF5gBSWBmXgYXN
 3vZ3Txfbgk+qppQS7+y1pMMkpDM6D2RvQd6pfpASFY9b7K2F9qvk8ZO+r7HqpYqMSNApyg
 Z/gJUhux20pDS/ptR8YVvoRz2HCEAI4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-MhyjJXa7N5WXiWA-0C0iVQ-1; Thu, 06 Feb 2020 07:18:11 -0500
Received: by mail-wm1-f69.google.com with SMTP id l11so394279wmi.0
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2020 04:18:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hXgx4GTY6S5CRlcwdA+IhIFGdtlYZsbqmwCs/pJ+6LA=;
 b=nMK6PbVVdsw8D/8W3zlxZVvIq5wboiaMk4ngh1nXBL2JHw+Eq9fxW9VAyc/hJchCa5
 ehPFHQipT6eS2Ug7j7gJpzk441gpQBakb11qTx9mJ3AitzVmqQgo84us7WrxVK7a7UF+
 7uTNZuMq1fnW3SHjUUZm5Iq8wuUNJt/i7FSglohMZxBQqKxxeDkJD6x8OnKRnvePFV4d
 NzMlux6w8sBDcuxH01mk9ObNH4qDgQzvBcO3H/LD8GSZG05yne8jhxuwdo48WfuaH1zs
 VUek6v57nX9KHLDmF985LCt/Ri2nFQJ+J3oVoR1Vlp4x9Sfru4s0KiXcZKrp4COcP2Ga
 MXUQ==
X-Gm-Message-State: APjAAAVXaCDGhj1e7GI4hcoxMXlGclFRw7XzhhzeaFAp67pStCgPHZi6
 nnpy/+rwHU99H8D1LGuFWwPJshdYoKcKy7BYKWhChfvLXs3jPm+MEHZ+59roiYFmsgvjE0L+qH5
 O6TokGbStOiox2Xg=
X-Received: by 2002:a1c:5f41:: with SMTP id t62mr4413172wmb.42.1580991490002; 
 Thu, 06 Feb 2020 04:18:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqzU0vSZSa54edxj8D0S4wZuy5C4zVwEsuHUktKp/RjIiU6jybzrfUbrwjCu8/V1+8fZqNT52Q==
X-Received: by 2002:a1c:5f41:: with SMTP id t62mr4413155wmb.42.1580991489824; 
 Thu, 06 Feb 2020 04:18:09 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id i4sm1652130wmd.23.2020.02.06.04.18.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2020 04:18:09 -0800 (PST)
Subject: Re: [PATCH v2 4/4] Add the NVMM acceleration enlightenments
To: Kamil Rytarowski <n54@gmx.com>, rth@twiddle.net, ehabkost@redhat.com,
 slp@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 max@m00nbsd.net
References: <20200107124903.16505-1-n54@gmx.com>
 <20200128140945.929-1-n54@gmx.com> <20200128140945.929-5-n54@gmx.com>
 <0ed12efa-eee4-b3ff-8f02-f9c3b80d0e21@redhat.com>
 <2ae4caf9-05fd-b740-2612-e1c1ecafe277@gmx.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ac824078-4a72-a5d9-5644-764eb1f5fcf6@redhat.com>
Date: Thu, 6 Feb 2020 13:18:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <2ae4caf9-05fd-b740-2612-e1c1ecafe277@gmx.com>
Content-Language: en-US
X-MC-Unique: MhyjJXa7N5WXiWA-0C0iVQ-1
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

On 2/6/20 11:24 AM, Kamil Rytarowski wrote:
> On 03.02.2020 12:54, Philippe Mathieu-Daud=C3=A9 wrote:
>>> @@ -2029,6 +2072,19 @@ static void qemu_whpx_start_vcpu(CPUState *cpu)
>>>  =C2=A0 #endif
>>>  =C2=A0 }
>>>
>>> +static void qemu_nvmm_start_vcpu(CPUState *cpu)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 char thread_name[VCPU_THREAD_NAME_SIZE];
>>> +
>>> +=C2=A0=C2=A0=C2=A0 cpu->thread =3D g_malloc0(sizeof(QemuThread));
>>> +=C2=A0=C2=A0=C2=A0 cpu->halt_cond =3D g_malloc0(sizeof(QemuCond));
>>
>> Nitpick, we prefer g_new0().
>=20
> In this file other qemu_*_start_vcpu() use  g_malloc0().
>=20
> I will leave this part unchanged and defer tor future style fixups if
> someone is interested.

Fair enough.


