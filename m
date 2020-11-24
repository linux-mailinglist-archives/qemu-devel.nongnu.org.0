Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FDE2C2397
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 12:07:01 +0100 (CET)
Received: from localhost ([::1]:33890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khWA0-0007LL-8L
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 06:07:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1khW62-00042S-9S
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 06:02:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1khW60-0007Ja-KO
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 06:02:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606215772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C1+IXTyW1cNwM8oi4SdXI3lDebUQjGWAaRp44peLqtI=;
 b=VbjWfnFa3T710pwZUrGSnSLgBIxNELT6NX9XjFsiSJAtXmxBWuERqqUHPvZJKTEPVptlRM
 DAvKDvJyOibsf8u1UFSmUOIcggHycJeQuDICrfhfY7YA4qZa354BXTuThbZCfeSOPuk1tA
 Ou4KLte6e5pJfeFm3ZSQlurbX5vt578=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-W5I-L33hM9SVwiGCY8EZRA-1; Tue, 24 Nov 2020 06:02:50 -0500
X-MC-Unique: W5I-L33hM9SVwiGCY8EZRA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDCAC1009B77;
 Tue, 24 Nov 2020 11:02:48 +0000 (UTC)
Received: from gondolin (ovpn-113-136.ams2.redhat.com [10.36.113.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12A0019C66;
 Tue, 24 Nov 2020 11:02:46 +0000 (UTC)
Date: Tue, 24 Nov 2020 12:02:44 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] hw/watchdog/wdt_diag288: Remove unnecessary includes
Message-ID: <20201124120244.2b2c5d6d.cohuck@redhat.com>
In-Reply-To: <7e1483d6-8767-0d0f-105d-b55d2d6d6165@redhat.com>
References: <20201118090344.243117-1-thuth@redhat.com>
 <800135fc-4552-b872-0117-4d9194393094@redhat.com>
 <873616kan8.fsf@dusky.pond.sub.org>
 <CAFEAcA9gg_cxcG59BHKosJmTeyyJ_7_Uofcyb9kMXSRAFnYebg@mail.gmail.com>
 <8a91ad94-9a18-1f8b-b73d-92872495fdc3@redhat.com>
 <874klgtkn6.fsf@dusky.pond.sub.org>
 <20201123165908.79203631.cohuck@redhat.com>
 <7e1483d6-8767-0d0f-105d-b55d2d6d6165@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Nov 2020 19:41:40 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 23/11/2020 16.59, Cornelia Huck wrote:
> > On Mon, 23 Nov 2020 11:47:25 +0100
> > Markus Armbruster <armbru@redhat.com> wrote:
> >  =20
> >> Thomas Huth <thuth@redhat.com> writes:
> >> =20
> >>> On 18/11/2020 15.30, Peter Maydell wrote:   =20
> >>>> On Wed, 18 Nov 2020 at 14:24, Markus Armbruster <armbru@redhat.com> =
wrote:   =20
> >>>>>
> >>>>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
> >>>>>   =20
> >>>>>> On 11/18/20 10:03 AM, Thomas Huth wrote:   =20
> >>>>>>> Both headers, sysbus.h and module.h, are not required to compile =
this file.   =20
> >>>>>
> >>>>> module.h is: it defines type_init().   =20
> >>>>    =20
> >>>>>>>  #include "qemu/timer.h"
> >>>>>>>  #include "hw/watchdog/wdt_diag288.h"
> >>>>>>>  #include "migration/vmstate.h"
> >>>>>>>  #include "qemu/log.h"
> >>>>>>> -#include "qemu/module.h"   =20
> >>>>>>
> >>>>>> Cc'ing Markus because of:   =20
> >>>>    =20
> >>>>>>     Include qemu/module.h where needed, drop it from qemu-common.h=
   =20
> >>>>>
> >>>>> If it still compiles and links, it must get it via some other heade=
r.   =20
> >>>>
> >>>> Yes: wdt_diag288.c -> include/hw/watchdog/wdt_diag288.h ->
> >>>>  include/qom/object.h -> include/qemu/module.h   =20
> >>>
> >>> So what's now our expectation here? Should every file that uses type_=
init()
> >>> also include module.h ? That's IMHO not very intuitive...
> >>> Or are we fine that type_init() is provided by qom/object.h which nee=
ds to
> >>> be pulled in by every device sooner or later anyway?   =20
> >>
> >> I think it's okay to rely on indirect inclusion. =20
> >=20
> > So, what's the final verdict? Maybe just tweak the description?
> >=20
> > "Neither sysbus.h nor module.h are required to compile this file.
> > diag288 is not a sysbus device, and module.h (for type_init) is
> > included eventually through qom/object.h." =20
>=20
> Yes, I think that's the way to go. Could you update the description when
> picking up the patch, or shall I send a v2?

No need for a v2, I queued it to s390-next with an updated description.


