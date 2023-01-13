Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC4F669AAC
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 15:38:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKv8-0006a4-LJ; Fri, 13 Jan 2023 09:20:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kallisti5@unixzen.com>)
 id 1pGKv3-0006VE-N4
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:20:35 -0500
Received: from mx.dal1.terarocket.io ([108.61.222.170])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kallisti5@unixzen.com>) id 1pGKuz-0005q5-BD
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:20:32 -0500
Received: by mx.dal1.terarocket.io (Postfix, from userid 1001)
 id 58E495DF10; Fri, 13 Jan 2023 14:20:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.dal1.terarocket.io 58E495DF10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unixzen.com;
 s=default; t=1673619624;
 bh=cLxxRz82cLo30uuPND6kf1r1ya7q2L9jHQ6i40lwx6c=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
 b=RUM8bRICJxUh4sVwJPwsTc8v6M9Fhv1vqwaKxK8x7MyuIfE4OYw6F2R9/56MWLNHW
 BNrVBZEdbU+fr32w+4wq5lQX/oIe/gBdDyfksRb0Fr7eCMDsnPMexJ6DjLIIOzWNL6
 Q60xyKtHiGxNmCs47OsXLR8dSp101sjFSN5UXN6Y=
Received: from mx.dal1.terarocket.io (localhost [IPv6:::1])
 by mx.dal1.terarocket.io (Postfix) with ESMTPSA id 20CD05DD09;
 Fri, 13 Jan 2023 14:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.dal1.terarocket.io 20CD05DD09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unixzen.com;
 s=default; t=1673619622;
 bh=cLxxRz82cLo30uuPND6kf1r1ya7q2L9jHQ6i40lwx6c=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
 b=Lc6+kXLwKGFSbK7l0vxTOu9AfnI4WQp7A0OUj5jWLwlB5LOGEOpf1V30tQmU5vuIK
 KvDTPoMVqYp9Hfbp4ZmlOwHKC1tHLPknf94EYkzVhI1BfNXpDQLaTSc8oYN/y+PgFK
 gKQpUE9qzLgPxTHNfJxiKRp6rxnjsqezL2hM4mDI=
MIME-Version: 1.0
Date: Fri, 13 Jan 2023 14:20:22 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: RainLoop/1.13.0
From: "Alexander von Gluck IV" <kallisti5@unixzen.com>
Message-ID: <5cb4fd7bbcd0d539fc9430e45fe14fe2@unixzen.com>
Subject: Re: [PATCH] tests/vm: Update haiku test vm to R1/Beta3
To: "=?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?=" <philmd@linaro.org>,
 "Thomas Huth" <thuth@redhat.com>
Cc: qemu-devel@nongnu.org
In-Reply-To: <27512349-0007-11bd-07fb-5fd8c3dae879@linaro.org>
References: <27512349-0007-11bd-07fb-5fd8c3dae879@linaro.org>
 <20220216154208.2985103-1-kallisti5@unixzen.com>
 <2d548e30-11eb-6f64-b082-25e5ff546309@redhat.com>
 <df446205-d3bc-5c1c-eb3c-bb475590e713@linaro.org>
Received-SPF: pass client-ip=108.61.222.170;
 envelope-from=kallisti5@unixzen.com; helo=mx.dal1.terarocket.io
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

January 13, 2023 7:30 AM, "Philippe Mathieu-Daud=C3=A9" <philmd@linaro.or=
g> wrote:=0A=0A> On 13/1/23 12:05, Philippe Mathieu-Daud=C3=A9 wrote:=0A>=
 =0A>> On 14/12/22 11:47, Thomas Huth wrote:=0A>>> On 16/02/2022 16.42, A=
lexander von Gluck IV wrote:=0A>> =0A>> ---=0A>> tests/vm/haiku.x86_64 | =
8 ++++----=0A>> 1 file changed, 4 insertions(+), 4 deletions(-)=0A>>> [..=
.]=0A>> =0A>> @@ -48,8 +48,8 @@ class HaikuVM(basevm.BaseVM):=0A>> name =
=3D "haiku"=0A>> arch =3D "x86_64"=0A>> -    link =3D >>>=0A>> "https://a=
pp.vagrantup.com/haiku-os/boxes/r1beta2-x86_64/versions/20200702/provider=
s/libvirt.box"=0A>> -    csum =3D >>> "41c38b316e0cbdbc66b5dbaf3612b86670=
0a4f35807cb1eb266a5bf83e9e68d5"=0A>> +    link =3D >>>=0A>> "https://app.=
vagrantup.com/haiku-os/boxes/r1beta3-x86_64/versions/20220216/providers/l=
ibvirt.box"=0A>> +    csum =3D >>> "e67d4aacbcc687013d5cc91990ddd86cc5d70=
a5d28432ae2691944f8ce5d5041"=0A>>> Hi Alexander!=0A>>> =0A>>> The Haiku V=
M started again to fail, I'm getting these error messages now:=0A>>> =0A>=
>> Encountered problems:=0A>>> problem 1: nothing provides haiku>=3Dr1~be=
ta4_hrev56578_4-1 needed by >> glib2_devel-2.75.0-1=0A>>> solution 1:=0A>=
>> - do not install "providing devel:libglib_2.0"=0A>>> problem 2: nothin=
g provides haiku>=3Dr1~beta4_hrev56578_31-1 needed by >> gettext-0.21.1-2=
=0A>>> solution 1:=0A>>> - do not install "providing devel:libintl"=0A>>>=
 problem 3: nothing provides haiku>=3Dr1~beta4_hrev56578_31-1 needed by >=
> curl-7.85.0-2=0A>>> solution 1:=0A>>> - do not install "providing devel=
:libcurl"=0A>>> problem 4: nothing provides haiku>=3Dr1~beta4_hrev56578_3=
1-1 needed by >> gnutls-3.7.8-1=0A>>> solution 1:=0A>>> - do not install =
"providing devel:libgnutls"=0A>>> problem 5: nothing provides haiku>=3Dr1=
~beta4_hrev56578_4-1 needed by >> glib2-2.75.0-1=0A>>> solution 1:=0A>>> =
- do not install "providing devel:libslirp"=0A>>> =0A>>> Does it need an =
update to a newer version of Haiku?=0A>> =0A>> Per https://www.haiku-os.o=
rg/guides/daily-tasks/updating-system we=0A>> can keep the box image in s=
ync with its repo by using:=0A>> # pkgman add https://eu.hpkg.haiku-os.or=
g/haiku/r1beta3/$(getarch)/current=0A>> I will try this:=0A>> -- >8 --=0A=
>> diff --git a/tests/vm/haiku.x86_64 b/tests/vm/haiku.x86_64=0A>> index =
29668bc272..9cbb46cfc1 100755=0A>> --- a/tests/vm/haiku.x86_64=0A>> +++ b=
/tests/vm/haiku.x86_64=0A>> @@ -112,2 +112,4 @@ class HaikuVM(basevm.Base=
VM):=0A>> # Install packages=0A>> +        self.ssh_root("pkgman add > ht=
tps://eu.hpkg.haiku-os.org/haiku/r1beta3/x86_64/current")=0A>> +        s=
elf.ssh_root("pkgman full-sync")=0A>> self.ssh_root("pkgman install -y %s=
" % " > ".join(self.requirements))=0A>> ---=0A> =0A> OS installed but is =
not usable...:=0A> =0A> runtime_loader: /boot/system/lib/libncurses.so.6.=
3.0: Could not resolve symbol '__ctype_b_loc'=0A> resolve symbol "__ctype=
_b_loc" returned: -2147478780=0A> runtime_loader: /boot/system/lib/libncu=
rses.so.6.3.0: Troubles relocating: Symbol not found=0A> Connection to 12=
7.0.0.1 closed.=0A=0AGood morning!=0A=0A=0AI'll work on this one.=0Ar1/be=
ta4 came out a few weeks ago and I need to update the Vagrant image these=
 are based on.=0A=0A=0A -- Alex

