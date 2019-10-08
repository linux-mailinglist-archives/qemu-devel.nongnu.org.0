Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2F6D00AB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 20:24:46 +0200 (CEST)
Received: from localhost ([::1]:60794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHuA9-0001nN-HY
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 14:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35066)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lersek@redhat.com>) id 1iHu8N-0000oX-Qp
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 14:22:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lersek@redhat.com>) id 1iHu8M-0001QT-34
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 14:22:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60768)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lersek@redhat.com>) id 1iHu8L-0001Pf-TK
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 14:22:54 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CBE9C3B714;
 Tue,  8 Oct 2019 18:22:52 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-109.rdu2.redhat.com
 [10.10.120.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E3C160BE0;
 Tue,  8 Oct 2019 18:22:46 +0000 (UTC)
Subject: Re: [PATCH 2/4] target/i386: remove useless
 enable_compat_apic_id_mode() prototype
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>
References: <20191008105259.5378-1-lersek@redhat.com>
 <20191008105259.5378-3-lersek@redhat.com>
 <dd4198fb-f29e-77b5-f6ce-8fbbfaa146a3@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <032944de-23f7-53f9-27d1-ca0ce2321964@redhat.com>
Date: Tue, 8 Oct 2019 20:22:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <dd4198fb-f29e-77b5-f6ce-8fbbfaa146a3@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Tue, 08 Oct 2019 18:22:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/08/19 15:35, Philippe Mathieu-Daud=C3=A9 wrote:
> On 10/8/19 12:52 PM, Laszlo Ersek wrote:
>> The enable_compat_apic_id_mode() function definition was removed earli=
er;
>=20
> "in 457cfcccdd1"

Thanks. I'll add that to the commit message if I need to post a v2.

>=20
>> there are no callers left. Remove the function declaration too.
>>
>> Cc: Eduardo Habkost <ehabkost@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Richard Henderson <rth@twiddle.net>
>> Ref: https://bugzilla.tianocore.org/show_bug.cgi?id=3D1515
>> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
>> ---
>> =C2=A0 target/i386/cpu.h | 2 --
>> =C2=A0 1 file changed, 2 deletions(-)
>>
>> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
>> index eaa5395aa539..c9ab1a367939 100644
>> --- a/target/i386/cpu.h
>> +++ b/target/i386/cpu.h
>> @@ -2126,8 +2126,6 @@ void x86_cpu_set_default_version(X86CPUVersion
>> version);
>> =C2=A0 /* Return name of 32-bit register, from a R_* constant */
>> =C2=A0 const char *get_register_name_32(unsigned int reg);
>> =C2=A0 -void enable_compat_apic_id_mode(void);
>> -
>> =C2=A0 #define APIC_DEFAULT_ADDRESS 0xfee00000
>> =C2=A0 #define APIC_SPACE_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x100000
>> =C2=A0
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Cheers!
Laszlo

