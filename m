Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 830633CD5D3
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 15:40:30 +0200 (CEST)
Received: from localhost ([::1]:49336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5TVV-0003T9-JD
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 09:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5TTv-0002nU-JW
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 09:38:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5TTs-0000rL-PW
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 09:38:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626701926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zqYBge7gyogOfAADyacLM89Th94pq2ObgdF9nY30s3E=;
 b=h8KboZCA4X++sVX+w94Yzrk0Zfgyn6duX2HYX4srCthorywU7zVYedP2qraAnUTiP5VgeT
 4sgKZHpN1b2sTiIIp8pscUIHOqBxSUZ+qhiy8CJ4h52b0eATfeJF8NTxps8ZNFAA+/HRZF
 dewKXKa9omLHmsOqCfrH04aFbLfcwR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-otI6lpLNPxChqtDhvpsd3w-1; Mon, 19 Jul 2021 09:38:45 -0400
X-MC-Unique: otI6lpLNPxChqtDhvpsd3w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E50E362FE;
 Mon, 19 Jul 2021 13:38:44 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEDE85B826;
 Mon, 19 Jul 2021 13:38:38 +0000 (UTC)
Date: Mon, 19 Jul 2021 15:38:37 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 0/9] tests: Add test cases for TPM 1.2 ACPI tables
Message-ID: <20210719153837.46fdef08@redhat.com>
In-Reply-To: <87a6modt46.fsf@dusky.pond.sub.org>
References: <20210712150949.165725-1-stefanb@linux.vnet.ibm.com>
 <bb8d222a-be8a-02b7-3ddc-de443290e29d@redhat.com>
 <36bcf543-0b56-7e2f-26e7-648ca3cf58dd@linux.ibm.com>
 <dd9e11e5-c39f-296b-e74a-4c66c8531500@redhat.com>
 <87a6mpez2b.fsf@dusky.pond.sub.org>
 <97703096-ad9d-f676-ffcb-46ad4bf340c2@redhat.com>
 <87a6modt46.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
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
 qemu-devel@nongnu.org, marcandre.lureau@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Jul 2021 07:49:13 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>=20
> > On 7/14/21 4:43 PM, Markus Armbruster wrote: =20
> >> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
> >>  =20
> >>> +Markus =20
>=20
> [...]
>=20
> >>> IMO the "right" solution is to check via QMP if TMP is supported
> >>> or not. This is now doable since commit caff255a546 ("tpm: Return
> >>> QMP error when TPM is disabled in build").
> >>>
> >>> Long term we'd like to decouple the tests/ build from the various
> >>> QEMU configurations, and build the tests once. =20
> >>=20
> >> This argument applies only to macros from target-specific headers like
> >> $TARGET-config-target.h, not to macros from config-host.h.  #ifdef
> >> CONFIG_TPM should be fine, shouldn't it? =20
> >
> > Some definitions depend on the host (OS, libraries installed, ...),
> > others depend on the --enable/--disable ./configure options.
> >
> > IMO it would be nice if we could get qtests independent of the latter. =
=20
>=20
> Why?

In another mail-thread Philippe mentioned that there is desire
to use qtest out of tree to test other QEMU binaries.

However, just probing for features at runtime aren't going
to help with the goal as tests are tailored for the latest
CLI/QMP/ABI. To make it work we would have practically
introduce versioned tests.

So I wonder why one external acceptance-tests suite is not
sufficient, that we would want to hijack relatively simple
internal qtest at expense of increased resources needed to
run/write unit tests.

> > I suppose config-host.h holds both kinds. =20
>=20
> Yes.
>=20
>=20


