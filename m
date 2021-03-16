Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012C833D48F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 14:06:36 +0100 (CET)
Received: from localhost ([::1]:52724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM9P9-0003q9-1S
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 09:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lM9Nd-0003LY-MZ
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:05:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lM9Na-0004eQ-OS
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:05:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615899896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xAsBKBHQn+iUf++02U3wiP4aq73IWlrYphutcm8aopU=;
 b=gqntgEhN6V7XDerXzihZf9RLLCLOLCOX9GTtzmgTgGSvj5tLhlBlocgHtjWNa2oQjxxOhH
 lZlttj0S3CkrIU0higQo+zdrU4mlZc6pL8Mm0r5Oan7Rb6fBTMkiwvl7R8uhblRn6ZQKtb
 aScAFQs1khems70jXLRqwjlikUyg83Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-cRo1lu9SP-anqT5FzeyUEw-1; Tue, 16 Mar 2021 09:04:53 -0400
X-MC-Unique: cRo1lu9SP-anqT5FzeyUEw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE2C6800C78;
 Tue, 16 Mar 2021 13:04:52 +0000 (UTC)
Received: from localhost (unknown [10.40.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45BD460CCC;
 Tue, 16 Mar 2021 13:04:51 +0000 (UTC)
Date: Tue, 16 Mar 2021 14:04:49 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: Windows 10 won't run on default x86_64 machine anymore
Message-ID: <20210316140449.5e6695f9@redhat.com>
In-Reply-To: <YFCnPEvCDdbHRl/o@redhat.com>
References: <YE+SHIG8qQFMsEJl@diablo.13thmonkey.org>
 <20210315220526.GB1004959@private.email.ne.jp>
 <20210316133354.20460aca@redhat.com> <YFCnPEvCDdbHRl/o@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Reinoud Zandijk <reinoud@netbsd.org>, qemu-devel@nongnu.org,
 Isaku Yamahata <isaku.yamahata@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Mar 2021 12:40:28 +0000
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Tue, Mar 16, 2021 at 01:33:54PM +0100, Igor Mammedov wrote:
> > On Mon, 15 Mar 2021 15:05:26 -0700
> > Isaku Yamahata <isaku.yamahata@gmail.com> wrote:
> >  =20
> > > On Mon, Mar 15, 2021 at 05:58:04PM +0100,
> > > Reinoud Zandijk <reinoud@NetBSD.org> wrote:
> > >  =20
> > > > I think its better to revert this and fix Linux ;) or make it a sel=
ectable
> > > > feature as a workaround that's by default OFF :)   =20
> > >=20
> > > Anyway here is a patch to flip the default.
> > > At the moment, this is compile-only tested to provide the change quic=
kly
> > > and make discussion progress.
> > >=20
> > > From 50deeed38832ceccfb68f78dd66de5a1741b2897 Mon Sep 17 00:00:00 200=
1
> > > Message-Id: <50deeed38832ceccfb68f78dd66de5a1741b2897.1615845421.git.=
isaku.yamahata@intel.com>
> > > From: Isaku Yamahata <isaku.yamahata@intel.com>
> > > Date: Mon, 15 Mar 2021 14:42:33 -0700
> > > Subject: [PATCH] ich9, piix4: flip default value for smm-compat
> > >=20
> > > Make default value for smm-compat of ich9, piix4 true to keep old
> > > behavior.
> > > To get new (and more conformance to ACPI spec) behavior, explicitly
> > > set "-global ICH9-LPC.smm-compat=3Doff" or
> > > "-global PIIX4_PM.smm-compat=3Doff". =20
> >=20
> > I'm not sure we should do that,
> > it's fine for non-versioned/new machine type to change in incompatible =
way with old images,
> > it's the job of old versioned machines types to maintain compatibility.
> > It's of cause pain for users if they use are unable to boot old image
> > on newest machine type, but we never promised that and if we made such
> > promise we would never be able to fix bugs. =20
>=20
> If this incompatibility with Windows 10 is confirmed though, I don't
> think it is viable for QEMU to ship the default machine type with
> settings that break Windows 10.

Choice is Windows vs Linux kernel
the later behaves correctly (as spec dictates) and 'offending' commit
fixes QEMU deviation from spec. It might be hard to convince kernel
side to merge a hack for Windows sake that goes against spec.
As for Windows, if new install works fine then that's all fine,
users really should use version-ed machine types or instead of
pushing old broken 'features' to [new] default machine types.

>=20
>=20
>=20
> Regards,
> Daniel


