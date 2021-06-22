Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FFB3B01E1
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:55:34 +0200 (CEST)
Received: from localhost ([::1]:39720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lve45-0004Bt-Vf
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lve3E-0003Ey-7j
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:54:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lve3B-0003u2-JH
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:54:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624359276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=frl3O3yplRFyBFF/ByteJIRAVeQXKAar/k+sTAd7KHM=;
 b=bOFq7wy6kx2sqxIzaIj0nmWEAQgNXMtlw0UJ1TIiJMkJD1AOO2qovHVcgGBD0kJ5cOgqVl
 vQJb3szjJotZAYksOG96y5/rSm8WWTpC4SohtOSjRGGMAgxAD2Va3a7f6rG89Jpf4eNywq
 sWoQWpnqZ0CdHsR0dMOLLpYBKC5FZjE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-A7k3bcyGN4mI_RXwJxxRRQ-1; Tue, 22 Jun 2021 06:54:34 -0400
X-MC-Unique: A7k3bcyGN4mI_RXwJxxRRQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCA3E8015D0
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 10:54:33 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56CAA5D6BA;
 Tue, 22 Jun 2021 10:54:29 +0000 (UTC)
Date: Tue, 22 Jun 2021 12:54:28 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC 0/3] qtest: pick tests that require KVM at runtime
Message-ID: <20210622125428.5da88a46@redhat.com>
In-Reply-To: <bb1b17d4-6da5-aebf-329a-905dd566ec6b@redhat.com>
References: <20210616152455.1270264-1-imammedo@redhat.com>
 <f136b5a1-504b-c602-2e70-12b5b0d976b6@redhat.com>
 <75263d99-5da8-bdc5-e977-13c83a31b532@redhat.com>
 <bb1b17d4-6da5-aebf-329a-905dd566ec6b@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: lvivier@redhat.com,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Jun 2021 09:59:48 +0200
Thomas Huth <thuth@redhat.com> wrote:

> On 22/06/2021 09.26, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 6/22/21 9:20 AM, Thomas Huth wrote: =20
> >> On 16/06/2021 17.24, Igor Mammedov wrote: =20
> >>>
> >>> Sometimes it's necessary to execute a test that depends on KVM,
> >>> however qtest is not aware if tested QEMU binary supports KVM
> >>> on the host it the test is executed.
> >>>
> >>> For an example:
> >>>  =C2=A0 test q35 machine with intel_iommu
> >>>  =C2=A0 This test will run only is KVM is available and fail
> >>>  =C2=A0 to start QEMU if it fallsback to TCG, thus failing whole test=
.
> >>>  =C2=A0 So if test is executed in VM where nested KVM is not enabled
> >>>  =C2=A0 or on other than x86 host, it will break 'make check-qtest'
> >>>
> >>> Series adds a lightweight qtest_has_kvm() check, which abuses
> >>> build system and should help to avoid running KVM only tests
> >>> on hosts that do not support it. =20
> >>
> >> You also might want to update the check in tests/qtest/migration-test.=
c
> >> while you're at it.
sure (this series was just a discussion starter).


> >>> PS:
> >>> there is an alternative 'query-accels' QMP command proposal
> >>> https://patchwork.kernel.org/project/qemu-devel/patch/20210503211020.=
894589-3-philmd@redhat.com/
> >>>
> >>> which I think is more robust compared to qtest_has_kvm() and
> >>> could be extended to take into account machine type. =20
> >>
> >> Could you please get in touch with Philippe directly and discuss which
> >> way to go? We certainly don't need two approaches in the end... =20
> >=20
> > I'm certainly fine if Igor wants to restart this effort :)
> >=20
> > Maybe doing as Claudio suggested, start have qtest_has_accel()
> > tests accel with Igor's shortpath first, then fallback to
> > 'query-accels' QMP command? =20

it should save time when shortpath result is positive,
but won't help on fallback path.

Maybe we can add a build option to enable fallback, or even better
to swap build time impl. with runtime impl., so ones who need qtest
as external harness can build and use it on request.

> Yeah, that's maybe a good idea ...
> But I'm currently wondering whether we need query-accels at all? For=20
> detecting kvm, we already have "query-kvm" ... and we don't have tests fo=
r=20
> any other accelerators yet (hax, hvf, etc.) ... so it's likely just about=
=20
> having a way to detect whether TCG is compiled into the binary?

if we ignore other accelerators, it's probably not hard to add detection
of TCG at build time, I'll look into it and also try to change API to
qtest_has_accel() instead of kvm specific one. This way whatever
solution we end up with, won't affect code that uses it.

> Is there=20
> already another command that could be used to check for the availability =
of TCG?
>=20
>   Thomas
>=20


