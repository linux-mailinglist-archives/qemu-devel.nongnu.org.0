Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6895B2454
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 19:23:32 +0200 (CEST)
Received: from localhost ([::1]:51618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWLFT-0002AL-Gw
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 13:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oWLDr-0000cP-Iy; Thu, 08 Sep 2022 13:21:51 -0400
Received: from mout.gmx.net ([212.227.15.19]:56061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oWLDp-0000of-ES; Thu, 08 Sep 2022 13:21:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662657707;
 bh=VLqL4lCG8K2ZMXSrbGObyi72b/w5ZnIS3EeziCk1Gkk=;
 h=X-UI-Sender-Class:Date:From:Subject:To:Cc:References:In-Reply-To;
 b=b/Z4XIlaDptAJLW0zebj2mEzPnoAzHU/p9qUUTK2opImmkySK70+VRHfs72Q4w2MB
 T864U69N8Tr+7AfYNLjt1AnQKlyTAfQyOxcLa1lRU4Bv7i/SuamikqDVK1+4hc+8lb
 afm0plukMOC+KoiUUFIsgSe6Sq9WBOoHsX7R/3Fk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.49] ([178.8.103.19]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mzyya-1pJVdN1ANa-00x0FA; Thu, 08
 Sep 2022 19:21:47 +0200
Message-ID: <4fb8e7f1-acc0-d94f-bf5c-d8913ea876ee@gmx.de>
Date: Thu, 8 Sep 2022 19:21:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Arwed Meyer <arwed.meyer@gmx.de>
Subject: Re: [PATCH 1/4] msmouse: Handle mouse reset
Content-Language: de-DE
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220906194755.98090-1-arwed.meyer@gmx.de>
 <20220906194755.98090-2-arwed.meyer@gmx.de>
 <CAJ+F1CLLZBQFnCp0n5yeK6fSN7vhRiHnT=SZ8pUkk09kkGsgVA@mail.gmail.com>
In-Reply-To: <CAJ+F1CLLZBQFnCp0n5yeK6fSN7vhRiHnT=SZ8pUkk09kkGsgVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:D39Sn72jlhNO3k9WMvAJoX03xuuarrG3jinSTR87spnooETFwai
 VW0iRqy+s4KbgMao/Q5df+uK8tYW9zfordivF8bTs0ilPzdIKv3JvHp1/+j71l0f/YVUF+a
 YXKBI/htIHcOljFWARlZg1k9iVrJi4FFHDTgZfT85g1Cw8Q1/K7z0nE4OIonVGVkS8fajCS
 4eKHUYUPS6LCfDNCXB/RA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZJkGCJwOErk=:gpOwu5i5YkYgrIVEy0zCAg
 02oxzO3nwOZOPvXqdiW5Q1tue9HqrPsrOZ88JBsl6D7D04NDREWsok4IBDMoXH0/6w6E9Gt9w
 nre3F3zBXYieNg5OtHVxwnopNtvmfTkT/trJgrmfXMfLpDmx1/G7HD5AyDvRSCOJWV37nTC25
 u9vkcmsyibX+crLkqOETLys/ASROrDqlLBKqWk1S4j9byIpkQWlP9EMW7gImt3eJEnz1ZLiUR
 rKScpXoZOulIYeRgvWXiRrb8Qmuk4EJe80V7G+cy0Jt7smaSNmmXBBh/0nUodTC31flPNSXpA
 AJ7DQf+uohB2AXKBZDtiDtb+1GfZgY8qj3J6iLMgF1aDg4UqaMvwO8t4LIS9cGEBOCsrStJ7i
 2tIhhtZg8rICBGm23+rzsa70MwKSF64KWZvCHN+ImfY8Kw4f4rxCj5sMrTekKwiUW5Q+oo0lC
 H3+31k17VbY2DG76Au8kaU/LSwUGY2CpDAPxbAQIgePgWG83DZivhGSbx+flWgV9p9q2pbHPt
 M1GyLtDXVvIFaJ18oOguxEB8J6A9Koersybpuvf0JoxFAket7g+p0Us/s6XMO9CwAfoe0pcdE
 yGz8oy6QvJbXkHBCtKEReao/MAQ3wobSKNEy0pe6rN9yVglZoSy/djsQBSHnP3h26SSQ0GoWW
 c9aNdY8t63VNGsNdf57gpjBbRWsKUnrPH4Pc0iod0JRnPA0V5qZB3oizfDU9oClN07CifjwyG
 zgb04IVAduGk7uJepcUZ35rtZmE5X/AOX3XsSOk/BRcqjvWF7o8RQ4wBbcLkpa+/1d3htCjn1
 Z8twphCBzhIIwHrD+htofOovle2fJ7Zzj3NtYqkJc9K4OMBWfVia+mrhfeEyomPsbGHN2HNKz
 js0HrwGhXCmxZ0SIsykM3DD1p4paJMBPKhXmvo0UCSpPudZvfXRI5ULmjIDi52XpLZ/MXcB6L
 S7LNF77lgZxVEJfJPiyYDGILeFbfDHn8ZSyoXxnHu3TfLeoEk7oMw8gN22/M9Hi/oApa5Oyjy
 wibLiv8e1+MEvbTAS6xJmWMfxZYDE9YvD9S0eji3RX3B1lLt/0Pg55e6W6Warjk6BW1pbwTOV
 Az3tedujBqcXWh2s95LLsp6kJfXz/+mTYUk8rOJBGoVN6ZG48GOtf4zvR/fMVRGFVYllFG8YR
 Yw7NG8HGIU1gEySmntcGLvEHgR
Received-SPF: pass client-ip=212.227.15.19; envelope-from=arwed.meyer@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.142,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.09.22 um 11:45 schrieb Marc-Andr=C3=A9 Lureau:
> Hi
>
> On Wed, Sep 7, 2022 at 2:03 AM Arwed Meyer <arwed.meyer@gmx.de
> <mailto:arwed.meyer@gmx.de>> wrote:
>
>     Detect mouse reset via RTS or DTR line:
>     Don't send or process anything while in reset.
>     When coming out of reset, send ID sequence first thing.
>     This allows msmouse to be detected by common mouse drivers.
>
>     Resolves: https://gitlab.com/qemu-project/qemu/-/issues/77
>     <https://gitlab.com/qemu-project/qemu/-/issues/77>
>     Signed-off-by: Arwed Meyer <arwed.meyer@gmx.de
>     <mailto:arwed.meyer@gmx.de>>
>     ---
>      =C2=A0chardev/msmouse.c | 65 ++++++++++++++++++++++++++++++++++++++=
+++++++--
>      =C2=A01 file changed, 63 insertions(+), 2 deletions(-)
>
>     diff --git a/chardev/msmouse.c b/chardev/msmouse.c
>     index eb9231dcdb..0ecf26a436 100644
>     --- a/chardev/msmouse.c
>     +++ b/chardev/msmouse.c
>     @@ -25,17 +25,20 @@
>      =C2=A0#include "qemu/osdep.h"
>      =C2=A0#include "qemu/module.h"
>      =C2=A0#include "chardev/char.h"
>     +#include "chardev/char-serial.h"
>      =C2=A0#include "ui/console.h"
>      =C2=A0#include "ui/input.h"
>      =C2=A0#include "qom/object.h"
>
>     -#define MSMOUSE_LO6(n) ((n) & 0x3f)
>     -#define MSMOUSE_HI2(n) (((n) & 0xc0) >> 6)
>     +#define MSMOUSE_LO6(n)=C2=A0 ((n) & 0x3f)
>     +#define MSMOUSE_HI2(n)=C2=A0 (((n) & 0xc0) >> 6)
>     +#define MSMOUSE_PWR(cm) (cm & (CHR_TIOCM_RTS | CHR_TIOCM_DTR))
>
>      =C2=A0struct MouseChardev {
>      =C2=A0 =C2=A0 =C2=A0Chardev parent;
>
>      =C2=A0 =C2=A0 =C2=A0QemuInputHandlerState *hs;
>     +=C2=A0 =C2=A0 int tiocm;
>      =C2=A0 =C2=A0 =C2=A0int axis[INPUT_AXIS__MAX];
>      =C2=A0 =C2=A0 =C2=A0bool btns[INPUT_BUTTON__MAX];
>      =C2=A0 =C2=A0 =C2=A0bool btnc[INPUT_BUTTON__MAX];
>     @@ -109,6 +112,11 @@ static void msmouse_input_event(DeviceState
>     *dev, QemuConsole *src,
>      =C2=A0 =C2=A0 =C2=A0InputMoveEvent *move;
>      =C2=A0 =C2=A0 =C2=A0InputBtnEvent *btn;
>
>     +=C2=A0 =C2=A0 /* Ignore events if serial mouse powered down. */
>     +=C2=A0 =C2=A0 if (!MSMOUSE_PWR(mouse->tiocm)) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
>     +=C2=A0 =C2=A0 }
>     +
>      =C2=A0 =C2=A0 =C2=A0switch (evt->type) {
>      =C2=A0 =C2=A0 =C2=A0case INPUT_EVENT_KIND_REL:
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0move =3D evt->u.rel.data;
>     @@ -132,6 +140,11 @@ static void msmouse_input_sync(DeviceState *dev=
)
>      =C2=A0 =C2=A0 =C2=A0MouseChardev *mouse =3D MOUSE_CHARDEV(dev);
>      =C2=A0 =C2=A0 =C2=A0Chardev *chr =3D CHARDEV(dev);
>
>     +=C2=A0 =C2=A0 /* Ignore events if serial mouse powered down. */
>     +=C2=A0 =C2=A0 if (!MSMOUSE_PWR(mouse->tiocm)) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
>     +=C2=A0 =C2=A0 }
>     +
>      =C2=A0 =C2=A0 =C2=A0msmouse_queue_event(mouse);
>      =C2=A0 =C2=A0 =C2=A0msmouse_chr_accept_input(chr);
>      =C2=A0}
>     @@ -142,6 +155,52 @@ static int msmouse_chr_write(struct Chardev *s,
>     const uint8_t *buf, int len)
>      =C2=A0 =C2=A0 =C2=A0return len;
>      =C2=A0}
>
>     +static int msmouse_ioctl(Chardev *chr, int cmd, void *arg)
>     +{
>     +=C2=A0 =C2=A0 MouseChardev *mouse =3D MOUSE_CHARDEV(chr);
>     +=C2=A0 =C2=A0 int c;
>     +=C2=A0 =C2=A0 int *targ =3D (int *)arg;
>     +
>     +=C2=A0 =C2=A0 switch (cmd) {
>     +=C2=A0 =C2=A0 case CHR_IOCTL_SERIAL_SET_TIOCM:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 c =3D mouse->tiocm;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse->tiocm =3D *(int *)arg;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (MSMOUSE_PWR(mouse->tiocm)) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!MSMOUSE_PWR(c)) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Pow=
er on after reset: send "M3"
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* cau=
se we behave like a 3 button logitech
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* mou=
se.
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse->outb=
uf[0] =3D 'M';
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse->outb=
uf[1] =3D '3';
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse->outl=
en =3D 2;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Start se=
nding data to serial. */
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msmouse_chr=
_accept_input(chr);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Reset mouse buffers on power do=
wn.
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Mouse won't send anything witho=
ut power.
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse->outlen =3D 0;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(mouse->axis, 0, sizeof(mouse->ax=
is));
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (c =3D INPUT_BUTTON__MAX - 1; c >=
=3D 0; c--) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse->btns[c] =3D false;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mouse->btnc[c] =3D false;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>
>
> Why not memset those fields as well?
>
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>     +=C2=A0 =C2=A0 case CHR_IOCTL_SERIAL_GET_TIOCM:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Remember line control status. */
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *targ =3D mouse->tiocm;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>     +=C2=A0 =C2=A0 default:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOTSUP;
>     +=C2=A0 =C2=A0 }
>     +=C2=A0 =C2=A0 return 0;
>     +}
>     +
>      =C2=A0static void char_msmouse_finalize(Object *obj)
>      =C2=A0{
>      =C2=A0 =C2=A0 =C2=A0MouseChardev *mouse =3D MOUSE_CHARDEV(obj);
>     @@ -166,6 +225,7 @@ static void msmouse_chr_open(Chardev *chr,
>      =C2=A0 =C2=A0 =C2=A0*be_opened =3D false;
>      =C2=A0 =C2=A0 =C2=A0mouse->hs =3D qemu_input_handler_register((Devi=
ceState *)mouse,
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0&msmouse_handler);
>     +=C2=A0 =C2=A0 mouse->tiocm =3D 0;
>      =C2=A0}
>
>      =C2=A0static void char_msmouse_class_init(ObjectClass *oc, void *da=
ta)
>     @@ -175,6 +235,7 @@ static void char_msmouse_class_init(ObjectClass
>     *oc, void *data)
>      =C2=A0 =C2=A0 =C2=A0cc->open =3D msmouse_chr_open;
>      =C2=A0 =C2=A0 =C2=A0cc->chr_write =3D msmouse_chr_write;
>      =C2=A0 =C2=A0 =C2=A0cc->chr_accept_input =3D msmouse_chr_accept_inp=
ut;
>     +=C2=A0 =C2=A0 cc->chr_ioctl =3D msmouse_ioctl;
>      =C2=A0}
>
>      =C2=A0static const TypeInfo char_msmouse_type_info =3D {
>     --
>     2.34.1
>
>
>
> lgtm otherwise,
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com
> <mailto:marcandre.lureau@redhat.com>>
>
> --
> Marc-Andr=C3=A9 Lureau
Hi,

old reflexes. Throwing memset at bool didn't really feel well. I
reconsidered in v2 patchset.

