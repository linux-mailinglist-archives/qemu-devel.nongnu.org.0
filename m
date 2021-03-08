Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D680F3310BD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:26:09 +0100 (CET)
Received: from localhost ([::1]:48530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGpk-0004fU-QC
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:26:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christian.ehrhardt@canonical.com>)
 id 1lJGHy-0006Nb-5o
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:51:14 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:39019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.90_1) (envelope-from <christian.ehrhardt@canonical.com>)
 id 1lJGHv-00018Y-72
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:51:13 -0500
Received: from mail-qk1-f198.google.com ([209.85.222.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.ehrhardt@canonical.com>)
 id 1lJGHr-0007yq-2D
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 13:51:07 +0000
Received: by mail-qk1-f198.google.com with SMTP id h126so7240441qkd.4
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 05:51:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FJFgtwg5w5bktQL4NvTCWdCJ9EVBSp6Vqm1Mn3kQ+LM=;
 b=TRH16Bny4EUOwnyKLgkH3aIpcphsDAk3Ch4d27tmyn2ng7XvaTfmxYI1qIQlRT+DxJ
 05vmIgbOEFfxjoNqpOv7IDvPwcnL+uWuuP647QpbFc7Sq89sMt0RexQWMLi0jMqBSrrp
 cl4cXCWb3rjP53tNHKd6EiwFy3BdlkPKfebqjly/aGc3HA0P09xtRQEX2Joz5MikpGKW
 idzzEaqXIZ5tBrUK5K/ZPoa5NUSQTjlOqs8S8hmejDSphaiK4vWJcOxHm4p5HZqTXVHi
 BAnrQbWS1B1EeRU72YiHsu8i6Z178E2T2xRSdC+jcLxAU90h1YoWfP7QuRL6xMXc4O7y
 p9Zg==
X-Gm-Message-State: AOAM53296gNjzpeYuIzRyqoqMM+iQAezn2q5kL4LWJTRQAOKbxk5cSqp
 qotR9o91+DvzC7ysXG5TxWtItyQosLz03LKHUwY2YKUXqOsBoKuf71c0I7l+PTjb74A4Ruhj0Z+
 xleHJRkXBwPZ9K4WiiKGWESGeQuD5lXDcKjPxfynu5ebgT0Kw
X-Received: by 2002:a05:620a:15e1:: with SMTP id
 p1mr20424024qkm.33.1615211466149; 
 Mon, 08 Mar 2021 05:51:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4ailRdaTbDCwlJaVbU9a8D1HZQGqvWV/VWaTvoU/Tu33ErRecX22G6BO7rjZ/CFQ1ITWXOOmJACbMBdrVugM=
X-Received: by 2002:a05:620a:15e1:: with SMTP id
 p1mr20424001qkm.33.1615211465856; 
 Mon, 08 Mar 2021 05:51:05 -0800 (PST)
MIME-Version: 1.0
References: <20210223145646.4129643-1-christian.ehrhardt@canonical.com>
 <CAFEAcA-LiCAK5EPCqwxOvJofhkoNpYs6UyrjrkOkYLTfJAxfmg@mail.gmail.com>
 <YDUoX0DZz6jcxjVy@redhat.com>
 <CAATJJ0LbLfmQt3y-=nS7R+=WLpGHZH0bie20FLaYXxZt2WA84w@mail.gmail.com>
 <YDYyoeFU4jQBN/8v@redhat.com>
 <CAFEAcA8DvXVxRvB0ZtQh3j5Y=34DOC1CzUY1LkuMB5WCJKthmg@mail.gmail.com>
 <YDZRbkiRzDgtKvXu@redhat.com>
In-Reply-To: <YDZRbkiRzDgtKvXu@redhat.com>
From: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Date: Mon, 8 Mar 2021 14:50:39 +0100
Message-ID: <CAATJJ0JZ-Je+2UPWjUEenTS9n0K5J-PCqfzSwVZ26NDE3VB1GA@mail.gmail.com>
Subject: Re: [PATCH] disas: Fix build with glib2.0 >=2.67.3
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=91.189.89.112;
 envelope-from=christian.ehrhardt@canonical.com; helo=youngberry.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 24, 2021 at 2:15 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Wed, Feb 24, 2021 at 01:07:33PM +0000, Peter Maydell wrote:
> > On Wed, 24 Feb 2021 at 11:04, Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
> > > So from osdep.h I think something like this is likely sufficient:
> > >
> > > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > > index ba15be9c56..7a1d83a8b6 100644
> > > --- a/include/qemu/osdep.h
> > > +++ b/include/qemu/osdep.h
> > > @@ -126,6 +126,7 @@ extern int daemon(int, int);
> > >  #include "glib-compat.h"
> > >  #include "qemu/typedefs.h"
> > >
> > > +extern "C" {
> >
> > Needs to be protected by #ifdef so it's only relevant for the
> > C++ compiler, right?
> >
> > >  /*
> > >   * For mingw, as of v6.0.0, the function implementing the assert mac=
ro is
> > >   * not marked as noreturn, so the compiler cannot delete code follow=
ing an
> > > @@ -722,4 +723,6 @@ static inline int platform_does_not_support_syste=
m(const char *command)
> > >  }
> > >  #endif /* !HAVE_SYSTEM_FUNCTION */
> > >
> > > +}
> > > +
> > >  #endif
> > >
> > >
> > > We'll also need to them protect any local headers we use before this =
point.
> > >
> > > $ grep #include ../../../include/qemu/osdep.h  | grep -v '<'
> > > #include "config-host.h"
> > > #include CONFIG_TARGET
> > > #include "exec/poison.h"
> > > #include "qemu/compiler.h"
> > > #include "sysemu/os-win32.h"
> > > #include "sysemu/os-posix.h"
> > > #include "glib-compat.h"
> > > #include "qemu/typedefs.h"
> > >
> > > and transitively through that list, but I think there's no too many
> > > more there.
> >
> > Is there anything we can do to make the compiler complain if we
> > get this wrong? Otherwise it seems likely that we'll end up
> > accidentally putting things inside or outside 'extern "C"'
> > declarations when they shouldn't be, as we make future changes
> > to our headers.
>
> There's nothing easy I know of to highlight this.  It is more the kind
> of thing checkpatch would have to look at - complain if there is
> anything which isn't a  preprocessor include directive or comment
> before the 'extern'.
>
> > (The other approach would be to try to get rid of the
> > C++ in the codebase. We could probably say 'drop vixl
> > and always use capstone', for instance.)
>
> Yeah, getting rid of C++ would probably be the sanest solution long
> term.

Just as an input on short-term alternatives,
in open-vm-tools we've found to follow
https://developer.gnome.org/glib/stable/glib-Version-Information.html#GLIB-=
VERSION-MIN-REQUIRED:CAPS
to be an easy fix for the time being.
Which in the autoconf magic there was just:
  +AC_DEFINE(GLIB_VERSION_MIN_REQUIRED, GLIB_VERSION_2_34, [Ignore
post 2.34 deprecations])
  +AC_DEFINE(GLIB_VERSION_MAX_ALLOWED, GLIB_VERSION_2_34, [Prevent
post 2.34 APIs])
(Or any other/newer version that one would want to select)

Not sure what would apply to qemu here, but I wanted to let you know
of the overall concept in regard to this issue.


> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


--=20
Christian Ehrhardt
Staff Engineer, Ubuntu Server
Canonical Ltd

