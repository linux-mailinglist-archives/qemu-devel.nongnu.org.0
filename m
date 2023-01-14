Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA9766AE58
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 23:49:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGpJU-0008KN-Bk; Sat, 14 Jan 2023 17:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kallisti5@unixzen.com>)
 id 1pGpJR-0008K0-Uz
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 17:47:45 -0500
Received: from [2001:19f0:6401:8d3:5400:1ff:fe4f:75e6]
 (helo=mx.dal1.terarocket.io) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kallisti5@unixzen.com>) id 1pGpJP-0006Ws-52
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 17:47:45 -0500
Received: by mx.dal1.terarocket.io (Postfix, from userid 1001)
 id 7C65A5DD0C; Sat, 14 Jan 2023 22:47:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.dal1.terarocket.io 7C65A5DD0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unixzen.com;
 s=default; t=1673736458;
 bh=Hi0cM3/43/DVXvXvlW3YugwIC/83McxDC+TZqmVYZ9E=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
 b=HkbjsPYnHZKLcfcfSHhSZ0qgp+9tUy0mPFJ6k58RVlwxguVKIHk9McmTU40u2IwDT
 aRboU1zGIXzZC1YPr+MzZ3U83KAH8Ou1nYcoQVZMTMl379pIlO021179RuBbbR+qWx
 YfGZ/SGkdcP8EKb28vBGl3oLDDf4BUw/1Hm9s4Vo=
Received: from mx.dal1.terarocket.io (localhost [IPv6:::1])
 by mx.dal1.terarocket.io (Postfix) with ESMTPSA id C1AA05DCFA;
 Sat, 14 Jan 2023 22:47:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.dal1.terarocket.io C1AA05DCFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unixzen.com;
 s=default; t=1673736455;
 bh=Hi0cM3/43/DVXvXvlW3YugwIC/83McxDC+TZqmVYZ9E=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
 b=IkTrSFRRrKoXtnQ/79G9mHjZS48VcDdBV5YMEGZ+HPOufQ/6MYE5MGOw7lK+w32WU
 MCO9pOQvu1QzV8FMUhfZjXES3BBDvl230OMF/YYKuupKICfG+16cA0olsJ6Pp/LKBS
 VIfCZ8B4ccBT1wuwJS/4PLXsBaR3lJW3Gd/Mxamw=
MIME-Version: 1.0
Date: Sat, 14 Jan 2023 22:47:35 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: RainLoop/1.13.0
From: "Alexander von Gluck IV" <kallisti5@unixzen.com>
Message-ID: <ff214f477579f8e588ba42745c08e41d@unixzen.com>
Subject: Re: [PATCH] tests/vm: Update haiku test vm to R1/Beta3
To: "=?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?=" <philmd@linaro.org>,
 "Thomas Huth" <thuth@redhat.com>
Cc: qemu-devel@nongnu.org
In-Reply-To: <27512349-0007-11bd-07fb-5fd8c3dae879@linaro.org>
References: <27512349-0007-11bd-07fb-5fd8c3dae879@linaro.org>
 <20220216154208.2985103-1-kallisti5@unixzen.com>
 <2d548e30-11eb-6f64-b082-25e5ff546309@redhat.com>
 <df446205-d3bc-5c1c-eb3c-bb475590e713@linaro.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2001:19f0:6401:8d3:5400:1ff:fe4f:75e6 (failed)
Received-SPF: permerror client-ip=2001:19f0:6401:8d3:5400:1ff:fe4f:75e6;
 envelope-from=kallisti5@unixzen.com; helo=mx.dal1.terarocket.io
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
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
 =0A>> Per https://www.haiku-os.org/guides/daily-tasks/updating-system we=
=0A>> can keep the box image in sync with its repo by using:=0A>> # pkgma=
n add https://eu.hpkg.haiku-os.org/haiku/r1beta3/$(getarch)/current=0A>> =
I will try this:=0A>> -- >8 --=0A>> diff --git a/tests/vm/haiku.x86_64 b/=
tests/vm/haiku.x86_64=0A>> index 29668bc272..9cbb46cfc1 100755=0A>> --- a=
/tests/vm/haiku.x86_64=0A>> +++ b/tests/vm/haiku.x86_64=0A>> @@ -112,2 +1=
12,4 @@ class HaikuVM(basevm.BaseVM):=0A>> # Install packages=0A>> +     =
   self.ssh_root("pkgman add > https://eu.hpkg.haiku-os.org/haiku/r1beta3=
/x86_64/current")=0A>> +        self.ssh_root("pkgman full-sync")=0A>> se=
lf.ssh_root("pkgman install -y %s" % " > ".join(self.requirements))=0A>> =
---=0A> =0A> OS installed but is not usable...:=0A> =0A> runtime_loader: =
/boot/system/lib/libncurses.so.6.3.0: Could not resolve symbol '__ctype_b=
_loc'=0A> resolve symbol "__ctype_b_loc" returned: -2147478780=0A> runtim=
e_loader: /boot/system/lib/libncurses.so.6.3.0: Troubles relocating: Symb=
ol not found=0A> Connection to 127.0.0.1 closed.=0A=0AOk. I updated the v=
agrant image to the latest release.  r1beta2 is getting a bit too old, an=
d=0Ar1beta3 instances should really be upgraded to r1beta4.=0A=0Ahttps://=
app.vagrantup.com/haiku-os/boxes/r1beta4-x86_64=0A=0ALet me know if this =
works for you.  Don't add the full-sync stuff. Isn't needed from the=0Ar1=
beta4 base.=0A=0A -- Alex

