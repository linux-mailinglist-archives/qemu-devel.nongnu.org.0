Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEBC42CAA7
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 22:06:05 +0200 (CEST)
Received: from localhost ([::1]:35950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1makVo-0002VI-5F
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 16:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1makU0-0001oZ-Iy
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 16:04:14 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1makTx-0004vM-U6
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 16:04:12 -0400
Received: by mail-pf1-x42c.google.com with SMTP id m14so3431319pfc.9
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 13:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BRQKmNBPsrlF572sitvW16Cy2WGQhn8/Iij2v0KRVAk=;
 b=UAYGMemLb38QjGqU6cZveiIefBevHBYrBGaka1zFriH/SBGs7YI8+Md5lo39uCye4Y
 5fgFYKfjz3eNKcZjQhP8y20lSc+3lSUtO5zTnxBY/djnhxUbK8CDje+EkivqyPUVXJv4
 /bGY/qWxRvBjfOlvQkLLbuwR4v3qk30w+FMogJVsW1Q0DXOVh13099w9ulUEJUwcWkrv
 uAkOAk/GB7/luloOgWXIvZgafsLjQEjQ9BmPEEzcL8xyTnZPf9pPigNsoPAuJVAlZvBv
 MXlEjz6JHHcrLWyGXY5RoU+zpPp9/yQOjpMy9i3vniOgMudCOjzn4FOFcNmrTRACf1RF
 ivCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BRQKmNBPsrlF572sitvW16Cy2WGQhn8/Iij2v0KRVAk=;
 b=hE/Xcg5M3eZA4wSirbDV52215PRBdD7XiwmYpqx0lGE8go2L9r2rCzfsEtSCtiK6bO
 YvnGUMcTr12MGu8skEdOm7qFeQntKaXdwsQ95Od8KFa4DXcWARfJ08WccZ0BE50pMFfI
 IMOkKpDvD5coGixySGXpfopy6wTIXEIKkGdUK35q2FpVRSmbJiQOJKtwD8EETD0Aqt8L
 wX330G/gtoXGuyQ0jXPDfzdAJ658jGoFChGDRyGRRY0xOBhg+xO++MjBMcAMBNBh+4oM
 Jk8kFAd9O1qXSK4ZLdtjXo8SP7uAOq/lL4cQ4iGqiTUzWKQkgDVg4pwMo1XXZd2pC4jf
 E4vw==
X-Gm-Message-State: AOAM532BaiEUF8tlhAmONuZJ8JJJFqZjNKlw0fsFazfLUuVnhbQY81E8
 EmleRNt4m2Wl9hi+ptMr1dn+7OuEfzOTioNqse2nbA==
X-Google-Smtp-Source: ABdhPJwnLa/HW1FkN2DDsKGakIQHf5uyD5qYCQPs7HIfin/bCsNqHDitDom5+DRI22eCBivpx1yqBkKjk1ChyQmmpVw=
X-Received: by 2002:a63:7e05:: with SMTP id z5mr968143pgc.354.1634155447241;
 Wed, 13 Oct 2021 13:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <CABgObfZvicuKLqkDqK3a4zn92LRiC_g--_oT-7sPgTO3O1PrAQ@mail.gmail.com>
 <001C97D2-2710-415C-9ECD-F8C20AB52196@gmail.com>
 <YWQ5zmFtL9yrJA81@errol.ini.cmu.edu>
In-Reply-To: <YWQ5zmFtL9yrJA81@errol.ini.cmu.edu>
From: Phil Dennis-Jordan <phil@philjordan.eu>
Date: Wed, 13 Oct 2021 22:03:55 +0200
Message-ID: <CAAibmn0=ZC74KOXoABtyhqjg_aAzJWaar2f3gO10DnPHiX8bug@mail.gmail.com>
Subject: Re: [PATCH] hw/misc: applesmc: use host osk as default on macs
To: "Gabriel L. Somlo" <gsomlo@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000f0e81805ce4176c0"
Received-SPF: neutral client-ip=2607:f8b0:4864:20::42c;
 envelope-from=phil@philjordan.eu; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Pedro_T=C3=B4rres?= <t0rr3sp3dr0@gmail.com>, rene@exactcode.de,
 "Kiszka, Jan" <jan.kiszka@siemens.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, suse@csgraf.de,
 Paolo Bonzini <pbonzini@redhat.com>, afaerber <afaerber@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f0e81805ce4176c0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Oct 2021 at 15:19, Gabriel L. Somlo <gsomlo@gmail.com> wrote:

> Given *this* conversation, it might be worth someone's effort to try
> that approach again. IMO it's really the most efficient: have an
> already existing applesmc driver in the hypervisor's kernel expose the
> desired key values (it's whole job is to expose key values to
> userspace in the first place). Then have userspace read that and use
> it for whatever purposes (including populating guest-facing emulated
> smc devices). Nobody has to use anyone's copyrighted code or strings
> or whatever. If only the hwmon folks could be convinced this time
> around :)
>

This is very similar to the situation on macOS. The way to request the
information from the kernel driver from userspace would of course be
different. (IOKitLib on macOS, sysfs or perhaps ioctls on some /dev node on
Linux.)

I can give a quick rundown on the situation on macOS:
- The SMC device is matched by the AppleSMC.kext kernel-mode driver.
- This driver provides a bunch of other functionality such the SMC's
hardware watchdog etc., but also the basics of reading these SMC keys.
- The driver offers a userspace-facing API via the "I/O Kit" HAL mechanism
that underpins almost all interfacing with device drivers on macOS.
- The IOKit node in question is "AppleSMC"; this service can be "opened"
(IOServiceOpen()) by user processes, with parameter type=3D0.
- With an open service connection, there are a number of different "method
calls" (via the IOConnectCall*Method() family of functions) that can be
invoked on the driver.

From here onwards you pretty much have to look at the source code that
Pedro linked in the original message, there's no actual documentation.

- One of these method calls (selector=3D2, Apple calls
this kSMCHandleYPCEvent) accepts a command struct (Apple calls
this SMCParamStruct) and returns a modified version of this struct. This
allows you to perform operations on each of the many defined "Keys" in the
SMC. (The keys are identified via 4 bytes which can be interpreted as 4
ASCII characters, like FourCC codes - GCC and clang support this by
multi-character character literals, e.g. 'OSK0'. The key is selected in the
first 4 bytes of the struct.)
- Within this struct there's a kind of command selector (data8 field, 1
byte, offset 42), one possible value is kSMCReadKey =3D 5 for reading the k=
ey
value. In that case you also need to provide space at the end of the output
struct (offset 48) for the read data and indicate in a size field (offset
28, uint32) how many bytes you're reading. (32 bytes seems to be the
maximum, which also coincides with the sizes of each of the OSK halves.
This means the struct is 80 bytes in total.) Everything else can be
0-initialised. There is a 1-byte "result" field at offset 20 which will be
0 if the call was successful. (And indeed the IOConnectCall*Method()
library function itself must return kIOReturnSuccess =3D 0 as well.)

To read the 2 OSK keys on macOS therefore, you need to perform 5 steps:
1. Find the AppleSMC IOKit service:
io_service_t service =3D IOServiceGetMatchingService(kIOMasterPortDefault,
IOServiceMatching("AppleSMC"));
2. Open a connection to the service (assuming it was found):
IOServiceOpen(service, mach_task_self(), 0, &connection);
3. Initialise the SMC command struct with key 'OSK0', command 5 (read key),
and set the data size to 32 for reading 32 bytes of data. Pass this as the
"input" struct argument to IOConnectCallStructMethod(connection, =E2=80=A6)=
 and a
pointer to another instance of such a struct as the output, and use method
selector 2.
4. Same for 'OSK1'
5. Clean up by closing the service connection (IOServiceClose) and
releasing the service handle. (IOObjectReturn)

Assuming appropriate error checking at every stage, the values for the 2
keys will be in the data fields of the respective output structs.

From this I *think* it should be possible to put together a working
implementation on macOS hosts. Pedro's original code did a lot more, but
anything outside of the above is essentially fluff.


Support for Linux would be great too; does the applesmc driver create a
node in /dev? If so, perhaps we can persuade the maintainers to accept a
patch with an ioctl for submitting commands directly to the SMC? Then it's
not specifically the OSK keys, but *any* key. The device supports more keys
than it publicly advertises, after all. (Such a feature would be useful for
improving qemu's virtual AppleSMC incidentally - there's a ~10 second boot
delay for macOS guests and I strongly suspect it's at least in part down to
the SMC not behaving as the OS expects. For example, the OS wants the
watchdog feature, but Qemu's virtual SMC does not provide it. If we could
easily submit arbitrary SMC commands to the physical device from a guest
running inside Qemu during development, we could work out some of that
hidden behaviour.)

Happy to answer any questions on the macOS side - for what it's worth, I'm
not affiliated with Apple in any way, but I do a lot of systems-level
development on their platforms and know the IOKit inside out.

Hope that helps!
Phil

--000000000000f0e81805ce4176c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 11 Oct 2021 at 15:19, Gabriel L. =
Somlo &lt;<a href=3D"mailto:gsomlo@gmail.com">gsomlo@gmail.com</a>&gt; wrot=
e:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
Given *this* conversation, it might be worth someone&#39;s effort to try<br=
>
that approach again. IMO it&#39;s really the most efficient: have an<br>
already existing applesmc driver in the hypervisor&#39;s kernel expose the<=
br>
desired key values (it&#39;s whole job is to expose key values to<br>
userspace in the first place). Then have userspace read that and use<br>
it for whatever purposes (including populating guest-facing emulated<br>
smc devices). Nobody has to use anyone&#39;s copyrighted code or strings<br=
>
or whatever. If only the hwmon folks could be convinced this time<br>
around :)<br></blockquote><div><br></div><div>This is very similar to the s=
ituation on macOS. The way to request the information from the kernel drive=
r from userspace would of course be different. (IOKitLib on macOS, sysfs or=
 perhaps ioctls on some /dev node on Linux.)</div><div><br></div><div>I can=
 give a quick rundown on the situation on macOS:</div><div>- The SMC device=
 is matched by the AppleSMC.kext kernel-mode driver.</div><div>- This drive=
r provides a bunch of other functionality such the SMC&#39;s hardware watch=
dog etc., but also the basics of reading these SMC keys.</div><div>- The dr=
iver offers a userspace-facing API via the &quot;I/O Kit&quot; HAL mechanis=
m that underpins almost all interfacing with device drivers on macOS.</div>=
<div>- The IOKit node in question is &quot;AppleSMC&quot;; this service can=
 be &quot;opened&quot; (IOServiceOpen()) by user processes, with parameter =
type=3D0.</div><div>- With an open service connection, there are a number o=
f different &quot;method calls&quot; (via the IOConnectCall*Method() family=
 of functions) that can be invoked on the driver.</div><div><br></div><div>=
From here onwards you pretty much have to look at the source code that Pedr=
o linked in the original message, there&#39;s no actual documentation.</div=
><div><br></div><div>- One of these method calls (selector=3D2, Apple calls=
 this=C2=A0kSMCHandleYPCEvent) accepts a command struct (Apple calls this=
=C2=A0SMCParamStruct) and returns a modified version of this struct. This a=
llows you to perform operations on each of the many defined &quot;Keys&quot=
; in the SMC. (The keys are identified via 4 bytes which can be interpreted=
 as 4 ASCII characters, like FourCC codes - GCC and clang support this by m=
ulti-character character literals, e.g. &#39;OSK0&#39;. The key is selected=
 in the first 4 bytes of the struct.)</div><div>- Within this struct there&=
#39;s a kind of command selector (data8 field, 1 byte, offset 42), one poss=
ible value is=C2=A0kSMCReadKey =3D 5 for reading the key value. In that cas=
e you also need to provide space at the end of the output struct (offset 48=
) for the read data and indicate in a size field (offset 28, uint32) how ma=
ny bytes you&#39;re reading. (32 bytes seems to be the maximum, which also =
coincides with the sizes of each of the OSK halves. This means the struct i=
s 80 bytes in total.) Everything else can be 0-initialised.=C2=A0There is a=
 1-byte &quot;result&quot; field at offset 20 which will be 0 if the call w=
as successful. (And indeed the=C2=A0IOConnectCall*Method() library function=
 itself must return kIOReturnSuccess =3D 0 as well.)</div><div><br></div><d=
iv>To read the 2 OSK keys on macOS therefore, you need to perform 5 steps:<=
/div><div>1. Find the AppleSMC IOKit service:</div><div>io_service_t servic=
e =3D IOServiceGetMatchingService(kIOMasterPortDefault, IOServiceMatching(&=
quot;AppleSMC&quot;));</div><div>2. Open a connection to the service (assum=
ing it was found):</div><div>IOServiceOpen(service, mach_task_self(), 0, &a=
mp;connection);<br></div><div>3. Initialise the SMC command struct with key=
 &#39;OSK0&#39;, command 5 (read key), and set the data size to 32 for read=
ing 32 bytes of data. Pass this as the &quot;input&quot; struct argument to=
=C2=A0IOConnectCallStructMethod(connection, =E2=80=A6) and a pointer to ano=
ther instance of such a struct as the output, and use method selector 2.</d=
iv><div>4. Same for &#39;OSK1&#39;</div><div>5. Clean up by closing the ser=
vice connection (IOServiceClose) and releasing the service handle. (IOObjec=
tReturn)</div><div><br></div><div>Assuming appropriate error checking at ev=
ery stage, the values for the 2 keys will be in the data fields of the resp=
ective output structs.</div><div><br></div><div>From this I *think* it shou=
ld be possible to put together a working implementation on macOS hosts. Ped=
ro&#39;s original code did a lot more, but anything outside of the above is=
 essentially fluff.</div><div><br></div><div><br></div><div>Support for Lin=
ux would be great too; does the applesmc driver create a node in /dev? If s=
o, perhaps we can persuade the maintainers to accept a patch with an ioctl =
for submitting commands directly to the SMC? Then it&#39;s not specifically=
 the OSK keys, but *any* key. The device supports more keys than it publicl=
y advertises, after all. (Such a feature would be useful for improving qemu=
&#39;s virtual AppleSMC incidentally - there&#39;s a ~10 second boot delay =
for macOS guests and I strongly suspect it&#39;s at least in part down to t=
he SMC not behaving as the OS expects. For example, the OS wants the watchd=
og feature, but Qemu&#39;s virtual SMC does not provide it. If we could eas=
ily submit arbitrary SMC commands to the physical device from a guest runni=
ng inside Qemu during development, we could work out some of that hidden be=
haviour.)</div><div><br></div><div>Happy to answer any questions on the mac=
OS side - for what it&#39;s worth, I&#39;m not affiliated with Apple in any=
 way, but I do a lot of systems-level development on their platforms and kn=
ow the IOKit inside out.</div><div><br></div><div>Hope that helps!</div><di=
v>Phil</div></div></div>

--000000000000f0e81805ce4176c0--

