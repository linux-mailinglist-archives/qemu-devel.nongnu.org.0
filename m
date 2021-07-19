Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 773893CD718
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 16:47:04 +0200 (CEST)
Received: from localhost ([::1]:53812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5UXv-0005BZ-Ah
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 10:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5UVj-0003wA-P1
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:44:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5UVf-0003OY-ST
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 10:44:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626705881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=voLydDOvcN3xrFT8ObqI2gWAVdn7ef5gYdyBKbbnvmo=;
 b=eRmnDKV1kFDgdDw7TSdlo2NjzNSSu6HhZmliCywmLEWaURYSd9yR39vfyiTDJndQZiA1XS
 QtRGqAEh8PFYpy1sYDLTylVhMsyxZ4QxaQCkjf2QhBNFnFYns+Z0wxY/SzrJUUeN+v+xG4
 YY0HAWWa44rqgZVJ+mKfhCi9SPr0sPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-80FEUd8RMCeB66EGv2ekCw-1; Mon, 19 Jul 2021 10:44:37 -0400
X-MC-Unique: 80FEUd8RMCeB66EGv2ekCw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBFC4804144;
 Mon, 19 Jul 2021 14:44:36 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CDEA25C1C5;
 Mon, 19 Jul 2021 14:44:31 +0000 (UTC)
Date: Mon, 19 Jul 2021 16:44:30 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v3 0/9] tests: Add test cases for TPM 1.2 ACPI tables
Message-ID: <20210719164430.161e9d1e@redhat.com>
In-Reply-To: <CAP+75-UZRjqWJKN3ningHrcmR=P3fx+mhG5SEzQ5u5V5SnXdjA@mail.gmail.com>
References: <20210712150949.165725-1-stefanb@linux.vnet.ibm.com>
 <bb8d222a-be8a-02b7-3ddc-de443290e29d@redhat.com>
 <36bcf543-0b56-7e2f-26e7-648ca3cf58dd@linux.ibm.com>
 <dd9e11e5-c39f-296b-e74a-4c66c8531500@redhat.com>
 <87a6mpez2b.fsf@dusky.pond.sub.org>
 <97703096-ad9d-f676-ffcb-46ad4bf340c2@redhat.com>
 <87a6modt46.fsf@dusky.pond.sub.org>
 <20210719153837.46fdef08@redhat.com>
 <871r7ummz8.fsf@dusky.pond.sub.org>
 <CAP+75-UZRjqWJKN3ningHrcmR=P3fx+mhG5SEzQ5u5V5SnXdjA@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Jul 2021 15:56:16 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On Mon, Jul 19, 2021 at 3:50 PM Markus Armbruster <armbru@redhat.com> wro=
te:
> > Igor Mammedov <imammedo@redhat.com> writes: =20
> > > On Thu, 15 Jul 2021 07:49:13 +0200
> > > Markus Armbruster <armbru@redhat.com> wrote: =20
> > >> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes: =20
>=20
> > >> >>> IMO the "right" solution is to check via QMP if TMP is supported
> > >> >>> or not. This is now doable since commit caff255a546 ("tpm: Retur=
n
> > >> >>> QMP error when TPM is disabled in build").
> > >> >>>
> > >> >>> Long term we'd like to decouple the tests/ build from the variou=
s
> > >> >>> QEMU configurations, and build the tests once. =20
> > >> >>
> > >> >> This argument applies only to macros from target-specific headers=
 like
> > >> >> $TARGET-config-target.h, not to macros from config-host.h.  #ifde=
f
> > >> >> CONFIG_TPM should be fine, shouldn't it? =20
> > >> >
> > >> > Some definitions depend on the host (OS, libraries installed, ...)=
,
> > >> > others depend on the --enable/--disable ./configure options.
> > >> >
> > >> > IMO it would be nice if we could get qtests independent of the lat=
ter. =20
> > >>
> > >> Why? =20
> > >
> > > In another mail-thread Philippe mentioned that there is desire
> > > to use qtest out of tree to test other QEMU binaries.
> > >
> > > However, just probing for features at runtime aren't going
> > > to help with the goal as tests are tailored for the latest
> > > CLI/QMP/ABI. To make it work we would have practically
> > > introduce versioned tests.
> > >
> > > So I wonder why one external acceptance-tests suite is not
> > > sufficient, that we would want to hijack relatively simple
> > > internal qtest at expense of increased resources needed to
> > > run/write unit tests. =20
> >
> > Yes.  qtest was not designed for use with anything but HEAD, and I doub=
t
> > we can make it fit such uses at reasonable expense. =20
>=20
> One HEAD but multiple configurations...

Even assuming reconfigure won't cause world rebuild,
It will be a win only if number of configuration probes
is small.
However it doesn't scale for large numbers and it might be
faster to rebuild affected tests in the end. (worst case: #probes * #target=
s)
I wonder if we can do probing once & cache it somewhere to avoid ^^^.


> If you want to simplify human time, can we simply run qtests once per
> arch/OS but with all features enabled? Otherwise skip qtests?
>=20


