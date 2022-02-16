Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1925F4B900C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 19:19:49 +0100 (CET)
Received: from localhost ([::1]:47896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKOu4-0000db-6v
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 13:19:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kallisti5@unixzen.com>)
 id 1nKOnQ-0000UM-0y; Wed, 16 Feb 2022 13:12:57 -0500
Received: from mx.dal1.terarocket.io ([108.61.222.170]:53934)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kallisti5@unixzen.com>)
 id 1nKOnL-0006cx-K2; Wed, 16 Feb 2022 13:12:55 -0500
Received: by mx.dal1.terarocket.io (Postfix, from userid 1001)
 id 082E95E76E; Wed, 16 Feb 2022 18:12:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.dal1.terarocket.io 082E95E76E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unixzen.com;
 s=default; t=1645035169;
 bh=wdXc83FJr0avoSdHJP3Qfa84LdqUXH/eUt68bG9Zoto=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
 b=gQ1LJB4iogBOEgCJ1LPvxXTT4E//RFARLovm+Kda4L6SojcIb7ijF0FB3Y6/JrT7s
 dc9oQ8kAfsTQaK0pocqGO1in7ep3j6fodd+BRcYdyXSa1azK31vvMZq+gwycUzqldX
 FXrauKT1akOkoICkjMRMXrPY3v99GnD4Gq6d+YPU=
Received: from mx.dal1.terarocket.io (localhost [IPv6:::1])
 by mx.dal1.terarocket.io (Postfix) with ESMTPSA id 21EB25E4C8;
 Wed, 16 Feb 2022 18:12:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.dal1.terarocket.io 21EB25E4C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unixzen.com;
 s=default; t=1645035165;
 bh=wdXc83FJr0avoSdHJP3Qfa84LdqUXH/eUt68bG9Zoto=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
 b=kZuPNaqEkwvYUpi+w+xQXgG4IyLXVUSMCFl0+8Jj5mGsv+iJwzX5zQV2f4WkWVTe+
 CrYz5CyrU6G83QIxmQ7j4J1Z8CsEH1hfnCrit/zeIkBxbbeYMUD39LvXukMmF69l5g
 UX8TMH+d/eOpEFbOdhioixtzOi7UCj0nXPv199KI=
MIME-Version: 1.0
Date: Wed, 16 Feb 2022 18:12:44 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: RainLoop/1.13.0
From: "Alexander von Gluck IV" <kallisti5@unixzen.com>
Message-ID: <dd3cfc5c9d69795b2e5be9b536066f8f@unixzen.com>
Subject: Re: [PATCH] tests/vm: Update haiku test vm to R1/Beta3
To: "Thomas Huth" <thuth@redhat.com>, qemu-devel@nongnu.org
In-Reply-To: <2d597b24-2b00-3e4c-27ed-3265a38a48a6@redhat.com>
References: <2d597b24-2b00-3e4c-27ed-3265a38a48a6@redhat.com>
 <20220216154208.2985103-1-kallisti5@unixzen.com>
Received-SPF: pass client-ip=108.61.222.170;
 envelope-from=kallisti5@unixzen.com; helo=mx.dal1.terarocket.io
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

February 16, 2022 10:26 AM, "Thomas Huth" <thuth@redhat.com> wrote:=0A> O=
n 16/02/2022 16.42, Alexander von Gluck IV wrote:=0A> =0A>> ---=0A>> test=
s/vm/haiku.x86_64 | 8 ++++----=0A>> 1 file changed, 4 insertions(+), 4 de=
letions(-)=0A>> diff --git a/tests/vm/haiku.x86_64 b/tests/vm/haiku.x86_6=
4=0A>> index 2eb736dae1..936f7d2ae2 100755=0A>> --- a/tests/vm/haiku.x86_=
64=0A>> +++ b/tests/vm/haiku.x86_64=0A>> @@ -2,7 +2,7 @@=0A>> #=0A>> # Ha=
iku VM image=0A>> #=0A>> -# Copyright 2020 Haiku, Inc.=0A>> +# Copyright =
2020-2022 Haiku, Inc.=0A>> #=0A>> # Authors:=0A>> # Alexander von Gluck I=
V <kallisti5@unixzen.com>=0A>> @@ -48,8 +48,8 @@ class HaikuVM(basevm.Bas=
eVM):=0A>> name =3D "haiku"=0A>> arch =3D "x86_64"=0A>>> - link =3D=0A>> =
"https://app.vagrantup.com/haiku-os/boxes/r1beta2-x86_64/versions/2020070=
2/providers/libvirt.box"=0A>> - csum =3D "41c38b316e0cbdbc66b5dbaf3612b86=
6700a4f35807cb1eb266a5bf83e9e68d5"=0A>> + link =3D=0A>> "https://app.vagr=
antup.com/haiku-os/boxes/r1beta3-x86_64/versions/20220216/providers/libvi=
rt.box"=0A>> + csum =3D "e67d4aacbcc687013d5cc91990ddd86cc5d70a5d28432ae2=
691944f8ce5d5041"=0A>>> poweroff =3D "shutdown"=0A>>> @@ -99,7 +99,7 @@ c=
lass HaikuVM(basevm.BaseVM):=0A>>> self.print_step("Extracting disk image=
")=0A>>> - subprocess.check_call(["tar", "xzf", tarball, "./box.img", "-O=
"],=0A>> + subprocess.check_call(["tar", "xzf", tarball, "box.img", "-O"]=
,=0A>> stdout=3Dopen(img, 'wb'))=0A>>> self.print_step("Preparing disk im=
age")=0A> =0A> Thank you very much for the quick fix, that indeed helps t=
o compile-test Haiku again! (the unit=0A> tests are failing, though, but =
IIRC that was already the case before)=0A> =0A> Tested-by: Thomas Huth <t=
huth@redhat.com>=0A=0AThanks!=0A=0ASorry for forgetting about it.   I han=
d release Vagrant images for Haiku after major releases=0Aand generally f=
orget to update them until ~6 months after a major release as there aren'=
t many users.=0A=0AI don't have commit access to qemu so will need someon=
e else to push when the time comes.=0A=0A -- Alex

