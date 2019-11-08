Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD01F58D1
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Nov 2019 21:50:50 +0100 (CET)
Received: from localhost ([::1]:60202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iTBDV-00026v-QO
	for lists+qemu-devel@lfdr.de; Fri, 08 Nov 2019 15:50:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50142)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iTBCB-0001Fq-OM
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 15:49:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1iTBC9-0008Da-Il
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 15:49:27 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:40167)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1iTBC5-0008Ae-QX
 for qemu-devel@nongnu.org; Fri, 08 Nov 2019 15:49:23 -0500
Received: by mail-wm1-x343.google.com with SMTP id f3so7535195wmc.5
 for <qemu-devel@nongnu.org>; Fri, 08 Nov 2019 12:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Fn7mxwF8TtzvsgyURQwBP/xIWdiI+ujSn/Mb4sCAX3c=;
 b=rKNwbMuiFud3OHHmXfgTy4fHGM4pIb9VORLIPv0cPXKFetq1e6/a0JH2oW7Kv9bexb
 RaWxYJ2XoPW+3DqfW5fVQdaSG19AIdwGwnGmIHIqTImWxMc/UH/2RGiA3Xl8FC/+smSc
 fPuGbjfRMyctnOuS5CORJkPkyLZQRcMi7saB1fcVAyncVyrHU8mftpWYt8Eum/x87x3B
 /APASFuVE8f3DS+CmaQmPiXoi1YRfB0a6NWYdhdjmnl6R5TeEXfdGT2YIupvYuvEX8PT
 8LURE7oUzyM+8XDqtxBVGBkZHxGVl3GshaRnqhfXgmULLzitEeSWkdrRkVfPaPVxAhBK
 JVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Fn7mxwF8TtzvsgyURQwBP/xIWdiI+ujSn/Mb4sCAX3c=;
 b=Nzg6OWG7TlnsUHG2c7KJcPm/kqojGQ/Td0EeHwwz/oiv0TeqvRh74Oa1spRIq85maW
 FEwspnntFu3etoHP0drddRqmt6qH2lw3snQGrclHl9rvoj/AEEYe8rs/ZgGOdOTPzn05
 mvxKstEjYA9VUNsJ8CIPc15tiXXRHmh7Yn2R6vPQ+j8TstN7Ect4yEuOtRpW13x/qXN3
 qe2/3QbSEkP0Bwlvxi/ujOyS7c0OYS5OwrJvJoNK9R0jOVuMFvI6dzdZObi57ajGueJY
 Kl5oNwebxXto7PQfmSEklCGghLBM1Uf5SjF3n5BtP+RLk9SKo1+hqQEq9YdahKkHkvw7
 Cykg==
X-Gm-Message-State: APjAAAUhslux2uYf/rynf7bHchje9kkmnv2WIbVu01TwJILk1PfrjOIL
 A/ehPOLm2S0f4lGP3QIaQo6Fpgk7oLaU2lb8sqg=
X-Google-Smtp-Source: APXvYqyoOi9H0m5RKL/AZIoyaNZrisTrR33Do8CtFZzs17hooqviFPLV+0KOXJYcWSYI7MrTmEl2VC20U4/r0sAscE4=
X-Received: by 2002:a1c:9e10:: with SMTP id h16mr4927377wme.91.1573246158588; 
 Fri, 08 Nov 2019 12:49:18 -0800 (PST)
MIME-Version: 1.0
References: <20191011160552.22907-1-vsementsov@virtuozzo.com>
 <20191011160552.22907-7-vsementsov@virtuozzo.com>
In-Reply-To: <20191011160552.22907-7-vsementsov@virtuozzo.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sat, 9 Nov 2019 00:49:05 +0400
Message-ID: <CAJ+F1CJS6fxFRAa01eUZNZ0ktwMTYhAj7QNHaZ80a0CWWU4_Ww@mail.gmail.com>
Subject: Re: [RFC v5 006/126] qdev-monitor: well form error hint helpers
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Fri, Oct 11, 2019 at 8:11 PM Vladimir Sementsov-Ogievskiy
<vsementsov@virtuozzo.com> wrote:
>
> Make qbus_list_bus and qbus_list_dev hint append helpers well formed:
> rename errp to errp_in, as it is IN-parameter here (which is unusual
> for errp), rename functions to be error_append_*_hint.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  qdev-monitor.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/qdev-monitor.c b/qdev-monitor.c
> index 85b58620d1..d14ef6af01 100644
> --- a/qdev-monitor.c
> +++ b/qdev-monitor.c
> @@ -326,36 +326,36 @@ static Object *qdev_get_peripheral_anon(void)
>      return dev;
>  }
>
> -static void qbus_list_bus(DeviceState *dev, Error **errp)
> +static void error_append_qbus_bus_list_hint(DeviceState *dev, Error **er=
rp_in)

Please keep the qbus_ prefix

>  {
>      BusState *child;
>      const char *sep =3D " ";
>
> -    error_append_hint(errp, "child buses at \"%s\":",
> +    error_append_hint(errp_in, "child buses at \"%s\":",
>                        dev->id ? dev->id : object_get_typename(OBJECT(dev=
)));
>      QLIST_FOREACH(child, &dev->child_bus, sibling) {
> -        error_append_hint(errp, "%s\"%s\"", sep, child->name);
> +        error_append_hint(errp_in, "%s\"%s\"", sep, child->name);
>          sep =3D ", ";
>      }
> -    error_append_hint(errp, "\n");
> +    error_append_hint(errp_in, "\n");
>  }
>
> -static void qbus_list_dev(BusState *bus, Error **errp)
> +static void error_append_qbus_dev_list_hint(BusState *bus, Error **errp_=
in)

here too

>  {
>      BusChild *kid;
>      const char *sep =3D " ";
>
> -    error_append_hint(errp, "devices at \"%s\":", bus->name);
> +    error_append_hint(errp_in, "devices at \"%s\":", bus->name);
>      QTAILQ_FOREACH(kid, &bus->children, sibling) {
>          DeviceState *dev =3D kid->child;
> -        error_append_hint(errp, "%s\"%s\"", sep,
> +        error_append_hint(errp_in, "%s\"%s\"", sep,
>                            object_get_typename(OBJECT(dev)));
>          if (dev->id) {
> -            error_append_hint(errp, "/\"%s\"", dev->id);
> +            error_append_hint(errp_in, "/\"%s\"", dev->id);
>          }
>          sep =3D ", ";
>      }
> -    error_append_hint(errp, "\n");
> +    error_append_hint(errp_in, "\n");
>  }
>
>  static BusState *qbus_find_bus(DeviceState *dev, char *elem)
> @@ -498,7 +498,7 @@ static BusState *qbus_find(const char *path, Error **=
errp)
>          if (!dev) {
>              error_set(errp, ERROR_CLASS_DEVICE_NOT_FOUND,
>                        "Device '%s' not found", elem);
> -            qbus_list_dev(bus, errp);
> +            error_append_qbus_dev_list_hint(bus, errp);
>              return NULL;
>          }
>
> @@ -516,7 +516,7 @@ static BusState *qbus_find(const char *path, Error **=
errp)
>              if (dev->num_child_bus) {
>                  error_setg(errp, "Device '%s' has multiple child buses",
>                             elem);
> -                qbus_list_bus(dev, errp);
> +                error_append_qbus_bus_list_hint(dev, errp);
>              } else {
>                  error_setg(errp, "Device '%s' has no child bus", elem);
>              }
> @@ -532,7 +532,7 @@ static BusState *qbus_find(const char *path, Error **=
errp)
>          bus =3D qbus_find_bus(dev, elem);
>          if (!bus) {
>              error_setg(errp, "Bus '%s' not found", elem);
> -            qbus_list_bus(dev, errp);
> +            error_append_qbus_bus_list_hint(dev, errp);
>              return NULL;
>          }
>      }
> --
> 2.21.0
>
>

other than that:
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--=20
Marc-Andr=C3=A9 Lureau

