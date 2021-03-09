Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FFE3323A6
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 12:09:45 +0100 (CET)
Received: from localhost ([::1]:38934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJaFE-0004af-9k
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 06:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJZyn-0001iN-4q; Tue, 09 Mar 2021 05:52:45 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:45923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lJZyl-0001ZV-8f; Tue, 09 Mar 2021 05:52:44 -0500
Received: by mail-ed1-x529.google.com with SMTP id dm26so19127674edb.12;
 Tue, 09 Mar 2021 02:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PBkIFw/rv3RVnbsvSdihRt0uNB3avplHNJapFSNbEKc=;
 b=HTb4R6SrSUb25rWrNEX0aycAGOzI3rHJXPa8pkrC/3KiBWdKO6pJJxcVB5MgayzvRG
 Jr1UwtLTlWZhZoN+rgV/RQ2StRIghHky4RkRQ+E96LcjZqtTBJxEVqJpBzQFhwk44SZ4
 PULqRoJ5OtyaiasWa5vtE/pFsiG1Pxhdq9a+bITx9IqRBfY14G3IrCE4xUZl34rhfnd5
 qCQGdApge03ygjAR+QSZAZk4ZQRgWIi0pBwXQTMuzFR7qcwrgNNzeN7uoHSFVytMZR7r
 WGi3I8lm4D6qf42eehbPHVojCYv9jGlRkAJ4JQMSbI8Y+W5eQbQpmgvWbAl3a63fNp3/
 PCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PBkIFw/rv3RVnbsvSdihRt0uNB3avplHNJapFSNbEKc=;
 b=qsAzDOcc3qMbK87sZS258c7NjG6qFXpEhBvJiHgSEnXTQ/rIAs7c/0Wz3YPHExrCav
 PyTHXwtLiSxDSIjoDHOgTpA8MYihYcn7zxd5knG55a+eWh1nvHIcW9nJ77w2dqB/YA1g
 0vaAGqruP4EbRTXuL6plTFyHifvi62nqKr9OdNI4xCjfLjmCJ3jx7z3EiZOo+69VTT56
 G8ymMzeld9g06BYMQjntgknFnMzoZxhrOhuPRC+Hq68C9/31jW1PAKGmtfRC9pc6y6Dq
 4exoHRxaIZBxkliT4NLRA9jtPf8z4GdUBkKiBxUCMVTjZLHjrB86+h3KVbild4f9bqWU
 UNzQ==
X-Gm-Message-State: AOAM530J13TFqupDyeVh9F5ndiEI0DngGfx0fB3tf9BOtEpVrjOak8Ma
 b4j4kdZ7LOkDBydT+K+zulnwtYRaXKtmVVZjUbo=
X-Google-Smtp-Source: ABdhPJwFsr2RlYE0n+Z0E6Xf/WYyOtxs7HGGS/Kv0zQXOo4AcHFKLJF47l2yZH4LCzJHkkBpWBxbdfinUUDJkfgcvmg=
X-Received: by 2002:a05:6402:50c8:: with SMTP id
 h8mr3229351edb.360.1615287160884; 
 Tue, 09 Mar 2021 02:52:40 -0800 (PST)
MIME-Version: 1.0
References: <20210305121748.65173-1-akihiko.odaki@gmail.com>
 <YEY/9DyFk9U87JtM@stefanha-x1.localdomain>
 <CAMVc7JUSFsLovDAPOX1-6q6fimyrvq9wt51jb=hEQm+oB8RpUg@mail.gmail.com>
 <CAMVc7JXpP7twOzPWkFnSCgFtGBSNKG=iS95KNW8p7C_WCmEt6w@mail.gmail.com>
 <20210309093718.GA5798@merkur.fritz.box> <YEdNUu5OGSJ/mIo+@redhat.com>
In-Reply-To: <YEdNUu5OGSJ/mIo+@redhat.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Tue, 9 Mar 2021 19:52:30 +0900
Message-ID: <CAMVc7JW4vPyLe4fXiS89nFFGrHPbeyy4g9XrMw4fJff_UiNeRA@mail.gmail.com>
Subject: Re: [PATCH v2] block/file-posix: Optimize for macOS
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 pkrempa@redhat.com, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu Developers <qemu-devel@nongnu.org>,
 Konstantin Nazarov <mail@knazarov.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B43=E6=9C=889=E6=97=A5(=E7=81=AB) 19:26 Daniel P. Berrang=C3=A9 =
<berrange@redhat.com>:
>
> On Tue, Mar 09, 2021 at 10:37:18AM +0100, Kevin Wolf wrote:
> > Am 09.03.2021 um 05:52 hat Akihiko Odaki geschrieben:
> > > 2021=E5=B9=B43=E6=9C=889=E6=97=A5(=E7=81=AB) 0:37 Akihiko Odaki <akih=
iko.odaki@gmail.com>:
> > > >
> > > > 2021=E5=B9=B43=E6=9C=889=E6=97=A5(=E7=81=AB) 0:17 Stefan Hajnoczi <=
stefanha@redhat.com>:
> > > > >
> > > > > The live migration compatibility issue is still present. Migratin=
g to
> > > > > another host might not work if the block limits are different.
> > > > >
> > > > > Here is an idea for solving it:
> > > > >
> > > > > Modify include/hw/block/block.h:DEFINE_BLOCK_PROPERTIES_BASE() to
> > > > > support a new value called "host". The default behavior remains
> > > > > unchanged for live migration compatibility but now you can use "h=
ost" if
> > > > > you know it's okay but don't care about migration compatibility.
> > > > >
> > > > > The downside to this approach is that users must explicitly say
> > > > > something like --drive ...,opt_io_size=3Dhost. But it's still bet=
ter than
> > > > > the situation we have today where user must manually enter values=
 for
> > > > > their disk.
> > > > >
> > > > > Does this sound okay to everyone?
> > > > >
> > > > > Stefan
> > > >
> > > > I wonder how that change affects other block drivers implementing
> > > > bdrv_probe_blocksizes. As far as I know, the values they report are
> > > > already used by default, which is contrary to the default not being
> > > > "host".
> > > >
> > > > Regards,
> > > > Akihiko Odaki
> > >
> > > Let me suggest a variant of Stefan's approach:
> > >
> > > Modify include/hw/block/block.h:DEFINE_BLOCK_PROPERTIES_BASE() to
> > > support a new value called "host". The default values for block size
> > > properties may be "host" or not, but they should be consistent. If
> > > they are "host" by default
> >
> > I'm not sure if it's a good idea, but maybe we could make it so that th=
e
> > default is "host" only as long as you didn't specify -nodefaults? Then
> > libvirt would automatically keep the old behaviour (because it always
> > sets -nodefaults) and manual invocations would usually get the new one.
> >
> > Of course, when I start with "I'm not sure if it's a good idea", it's
> > usually not, but I wanted to share the thought anyway...
>
> Can you elaborate on what the actual live migration problem is, and
> its impact ?  This patch is touching the block backends, so I'm
> wondering how backend data ends up having an impact on the migration
> stream which is all frontend device data ?  I'm especially concerned
> by the mention that some block backends already have this problem,
> and wondering if it already impacts libvirt ?
>
> Using -nodefaults is good practice, but I'm still uncomfortable saying
> that its use is a requirement if you want migration to work, as that
> feels like a change in semantics for non-libvirt users (who can be
> mgmt apps, nor merely human interactive users).
>
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

A problem is that block drivers else "file" already provide
logical_block_sizes and physical_block_sizes, which depends on their
backends, via bdrv_probe_blocksizes. It is apparently tolerated
because those block drivers have physical backends, unlike "file"
block driver which has files as its backends.

This patch has two important changes:
1. It adds new members, discard_granularity and opt_io_size, to the
value bdrv_probe_blocksizes.
2. It implements bdrv_probe_blocksizes which returns
discard_granularity and opt_io_size for "file" block driver.

2 is unacceptable here because it is a change for "file" block driver.
Now we are discussing how it can be fixed. A possible solution is to
make the feature to infer the default value from the backend opt-in.
Stefan's suggestion adds a non-default value, "host" to opt-in the
feature. However, it breaks the current behaviors of other block
drivers which already decides logical_block_sizes and
physical_block_sizes from their backends. My variant fixes the
compatibility issue by adding a global property to hw_compat_5_2.

Regards,
Akihiko Odaki

