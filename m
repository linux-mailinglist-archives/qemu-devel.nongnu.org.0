Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6723B8742
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:52:27 +0200 (CEST)
Received: from localhost ([::1]:50322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lydRp-0003D2-M6
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1lydPs-0001ma-Ty
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:50:24 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:36716
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1lydPp-0002xX-OR
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:50:24 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4GFS583Rfjz8PbP;
 Wed, 30 Jun 2021 12:50:20 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=hYrvZKKsr
 nqfSwmfSxJILoQWIxw=; b=E8DfE3upKH6eTojN0OWXKz8gvL0dKiRxo8EKNAnAc
 d54CmGDt2TmsNeJSKaQQZ2uASeQdhV1LqAvLF9r0FilfoHbnhuna8x1RQJSpUni6
 0cEb1tBCFkmZPXD+SNGYAk3o4Mf1gWB5B4VKS1h76WDhpjhwSvuhuEbZaD7bWhwh
 B8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=MdI
 jeBwve93Cbwyw2jNS6a25QmGz234a4p7aJQUWHnWGTDHkRjPRDL0f01ZSbWH/qb9
 JarSusfewGclqH+l0HPaKqcTeFEtK4nNSs7XhmH9V5/O7lzLZyK5ApbMXUXig3Oa
 POPJ8BlOMOn0QNEgzZwF2V7nM14mhIeQeZgzPYjk=
Received: from [IPV6:2001:470:b050:6:30c6:afbd:f093:7596] (unknown
 [IPv6:2001:470:b050:6:30c6:afbd:f093:7596])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4GFS582KMXz8PbN;
 Wed, 30 Jun 2021 12:50:20 -0400 (EDT)
Message-ID: <8341e3ac-ad15-9235-c61c-5e05f1dd6ebf@comstyle.com>
Date: Wed, 30 Jun 2021 12:50:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101
 Thunderbird/90.0
Subject: Re: [PATCH] tests/vm: update NetBSD to 9.2
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>
References: <YLe+LZ/j0pxVGeBi@humpty.home.comstyle.com>
 <eb7e9e07-939e-82cd-c561-7765337d5da6@amsat.org>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <eb7e9e07-939e-82cd-c561-7765337d5da6@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry my mistake.

I'll keep that script in mind as it looks incredibly useful.

On 6/30/2021 6:33 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Brad,
>
> You forgot to Cc the maintainers:
>
> $ ./scripts/get_maintainer.pl -f tests/vm/netbsd
> "Alex Benn=C3=A9e" <alex.bennee@linaro.org> (maintainer:Build and test =
au...)
> "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org> (maintainer:Build and t=
est au...)
> Thomas Huth <thuth@redhat.com> (maintainer:Build and test au...)
> Wainer dos Santos Moschetta <wainersm@redhat.com> (reviewer:Build and
> test au...)
> Willian Rampazzo <willianr@redhat.com> (reviewer:Build and test au...)
> qemu-devel@nongnu.org (open list:All patches CC here)
>
> On 6/2/21 7:21 PM, Brad Smith wrote:
>> tests/vm: update NetBSD to 9.2
>>
>> Signed-off-by: Brad Smith <brad@comstyle.com>
> Acked-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
>> ---
>>   tests/vm/netbsd | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/vm/netbsd b/tests/vm/netbsd
>> index b9efc269d2..4cc58df130 100755
>> --- a/tests/vm/netbsd
>> +++ b/tests/vm/netbsd
>> @@ -22,8 +22,8 @@ class NetBSDVM(basevm.BaseVM):
>>       name =3D "netbsd"
>>       arch =3D "x86_64"
>>  =20
>> -    link =3D "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.1/images/Net=
BSD-9.1-amd64.iso"
>> -    csum =3D "65bddc95945991c3b2021f9c8ded7f34c25f0a7611b7aa15a15fe23=
399e902307e926ae97fcd01dc1662ac67b5f6e4be643c6a2b581692ddcb616d30125066f9=
"
>> +    link =3D "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.2/images/Net=
BSD-9.2-amd64.iso"
>> +    csum =3D "5ee0ea101f73386b9b424f5d1041e371db3c42fdd6f4e4518dc79c4=
a08f31d43091ebe93425c9f0dcaaed2b51131836fe6774f33f89030b58d64709b35fda72f=
"
>>       size =3D "20G"
>>       pkgs =3D [
>>           # tools
>>

