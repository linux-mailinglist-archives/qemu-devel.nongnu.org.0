Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB692321B32
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 16:19:36 +0100 (CET)
Received: from localhost ([::1]:32832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lECzo-0007Wt-0f
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 10:19:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lECx1-0005iv-0Y; Mon, 22 Feb 2021 10:16:43 -0500
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:35961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lECwz-0002YU-AA; Mon, 22 Feb 2021 10:16:42 -0500
Received: by mail-qv1-xf29.google.com with SMTP id e9so6176549qvy.3;
 Mon, 22 Feb 2021 07:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ajmCyicXnFLev704dhurS0zggWvXb37A4cEgGJ8e2eA=;
 b=F6pTw8LlFSHD1nt9ucnGyoet2dHZtzMScJOwsrRManVGaRNCAsRwar7LF3jFwOnR9a
 yCF3382IXiJXxNQ/6WHzM83nGXYXgHYCabNaDms8AFTYMrQfyNgOzgrYI5OEzpSgh8/r
 kafYhPfpGtLKGAaRL6ntO0Jp6r9lgDIzrKwyjuAtlXoFDIRXey5kmfAtEAijd/V400v+
 Xv0bBEMzo96hN6/9XdMv0f888LH31ijhjrseMC8ypPwU/EIW04PhRPQr0IDAL/7NenEO
 CAY9sgXGdgR4PlZbaJD6eTL2FXLwEIrpa8YOAIaG8Sc6+d1w7gXzrOIgx67E8APgc5vM
 Maag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ajmCyicXnFLev704dhurS0zggWvXb37A4cEgGJ8e2eA=;
 b=rEo3QzsiHEBQwC9xjgSOiTO6hbkXhdfDuu6oPs1179crpclCxKvaHQ9zEsyoOxcjCu
 W2gVbvO+QcuzbMBwD3TpI5FwuPBN05dChGHirZ4QnQN80K1Ez+SwnEoiGELIO8NC4yUW
 esDgPZopEjnFM4588JmYGygOUVsUwb097f80oXduvj1TkJY4krPa5N3zhkrip3ub/jWt
 +kk9j9esaFB+EiL7luXlXpTNblx2wgbxk3ukeCasQNkKTkkENB0fJT3h4qx2YrkbenY/
 IanUYPUEaTY8QHmq/RppKo+NlEpQIyX0WUzg8D/IjDCwO9nwZsYuuKfsDgvTZYM0AQsc
 Ofvw==
X-Gm-Message-State: AOAM533Vix5UnpvhOSoYfUZv7gQpN20uefrT7XqfKws7Au/QhYpGt9IY
 8NuMIW7Tp2lAj9fOQ7wcKm0=
X-Google-Smtp-Source: ABdhPJxbNl9ssXV3DzMQ6Pk5xufFkGHMdTjqBHU5HWZwd0Hvqk67YqgHzm3qeRcXnFs+oy/lEGE4Zg==
X-Received: by 2002:ad4:458b:: with SMTP id x11mr12642003qvu.24.1614006999489; 
 Mon, 22 Feb 2021 07:16:39 -0800 (PST)
Received: from [192.168.0.5] (d149-67-30-58.try.wideopenwest.com.
 [67.149.58.30])
 by smtp.gmail.com with ESMTPSA id 18sm10791121qtw.70.2021.02.22.07.16.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Feb 2021 07:16:39 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Editing QEMU POWER Platform wiki page
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <20210222120138.31f313c9@bahia.lan>
Date: Mon, 22 Feb 2021 10:16:36 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <58A59980-BF44-4BCC-AC58-BBF840E5574F@gmail.com>
References: <91874f1e-4b14-5fb1-f1ae-1225938df759@linux.ibm.com>
 <20210222120138.31f313c9@bahia.lan>
To: =?utf-8?Q?Leonardo_Augusto_Guimar=C3=A3es_Garcia?=
 <lagarcia@linux.ibm.com>, Greg Kurz <groug@kaod.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=programmingkidx@gmail.com; helo=mail-qv1-xf29.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU devel list <qemu-devel@nongnu.org>,
 QEMU PPC devel list <qemu-ppc@nongnu.org>, Cedric Le Goater <clg@kaod.org>,
 lagarcia@br.ibm.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Feb 22, 2021, at 6:01 AM, Greg Kurz <groug@kaod.org> wrote:
>=20
> On Thu, 18 Feb 2021 10:16:25 -0300
> Leonardo Augusto Guimar=C3=A3es Garcia <lagarcia@linux.ibm.com> wrote:
>=20
>> Hi there,
>>=20
>> I would like to edit the wiki page at [0] as it contains some =
outdated=20
>> information. Could anyone that has access to the wiki please help me=20=

>> create a user so that I can edit it?
>>=20
>> 0. https://wiki.qemu.org/Documentation/Platforms/POWER
>>=20
>=20
> Hi Leo,
>=20
> User creation isn't publicly available to avoid spam : only an =
existing
> user can create a new account. This being said, wiki isn't the =
preferred
> way to expose documentation since there's no review and things =
ultimately
> bitrot. Page [0] you want to update is a perfect example of the mess :
> not only it contains irrelevant data but also stuff that is definitely
> wrong (e.g. 'compat' cpu property was deprecated in QEMU 5.0 and will
> be removed in QEMU 6.0).
>=20
> Ideally we'd want everything to be in the main QEMU doc and don't
> even need a wiki.
>=20
> On the PowerPC front, the most up-to-date docs are in the QEMU tree:
>=20
> docs/system/ppc/embedded.rst=20
> docs/system/ppc/powermac.rst=20
> docs/system/ppc/powernv.rst =20
> docs/system/ppc/prep.rst    =20
> docs/system/ppc/pseries.rst =20
> docs/system/target-ppc.rst  =20
>=20
> So I don't know exactly what changes you had in mind, but maybe first
> consider to update the main documentation.
>=20
> On my side, I think I want do ditch all the current content and just =
put
> links to https://qemu.readthedocs.io/en/latest/ instead. I can take =
care
> of that, in which case you wouldn't need an account.
>=20
> Cheers,
>=20
> --
> Greg
>=20
> PS:
>=20
> Cedric reported that we also have a page for non-pseries
> platforms:
>=20
> https://wiki.qemu.org/Documentation/Platforms/PowerPC
>=20
> I'm Cc'ing some regular contributors for those platforms so
> they can  evaluate the bitrotting status of this wiki.
>=20
>> Cheers,
>>=20
>> Leo

Admittedly the wiki page for POWER is very unfriendly looking. I think =
it should be completely rewritten.=20

This format should work better:

- Description
   - IBM POWER system emulator

- Build Directions
   - configure --target-list=3Dppc64-softmmu && make

- Suggested Command-line
   - qemu-system-ppc64 -cpu POWER9 -machine pseries -m 2G -serial =
mon:stdio \
	-cdrom <cd image file> -hda <hard drive image file> -boot d

- Links
   - Linux iso files
   - AIX iso ?
   - https://worthdoingbadly.com/aixqemu/
   - https://www.youtube.com/watch?v=3DOlajaCWvcdw - AIX 7.2 in QEMU
=20
- Pictures
   - Linux running in the POWER VM
   - AIX running in the POWER VM
   - Any games running in one of the above VM's
   - Productivity software like OpenOffice in the VM

- Contacts
   - < maintainers' contact info >



If you want I could update the wiki page for you. I just would need help =
with verifying the above information.=

