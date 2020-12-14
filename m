Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 024052D9783
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 12:41:07 +0100 (CET)
Received: from localhost ([::1]:52718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1komDy-0000EC-2D
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 06:41:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1komCT-0007ku-Rk
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:39:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1komCS-0002pQ-5s
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607945971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VJKzp+2JWOw19f34jvf7g+JAEQzh1nD2E5Q+i+rghOw=;
 b=HHThO0hkMpbhqlasK3F4Nsnt6tkOspdbN519gCV9MpjDt+0Hih/mhFKUf5fXMF2JBAp8fu
 FUdIypJjqAyj2DCAtOJMDJR+iFz8/Kk+MSttwn/Yf3ldFjwegPKmqsLu1iJ2fwTHI/f+t6
 KdwM8mtk09WUTyqT5+MCs0UY5wUQT54=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-mnrGrib_OQWaubK1op3EqA-1; Mon, 14 Dec 2020 06:39:29 -0500
X-MC-Unique: mnrGrib_OQWaubK1op3EqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 546AE8030A8;
 Mon, 14 Dec 2020 11:39:28 +0000 (UTC)
Received: from gondolin (ovpn-113-171.ams2.redhat.com [10.36.113.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6053C1C930;
 Mon, 14 Dec 2020 11:39:23 +0000 (UTC)
Date: Mon, 14 Dec 2020 12:39:20 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/3] tests/acceptance: Test virtio-rng and -balloon on
 s390x
Message-ID: <20201214123920.1aae5cb7.cohuck@redhat.com>
In-Reply-To: <ee0257d8-3b38-5baf-5552-8c0f3f09ce37@redhat.com>
References: <20201211173134.376078-1-thuth@redhat.com>
 <15276695-1718-e3a9-907e-c6e145294a87@redhat.com>
 <ee0257d8-3b38-5baf-5552-8c0f3f09ce37@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-s390x@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 12 Dec 2020 08:15:13 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 11/12/2020 21.10, Willian Rampazzo wrote:
> > On 12/11/20 2:31 PM, Thomas Huth wrote: =20
> >> Add two more simple tests to check that virtio-rng and virtio-balloon
> >> are at least (very) basically working on s390x.
> >>
> >> Based-on: 20201204121450.120730-1-cohuck@redhat.com
> >>
> >> Thomas Huth (3):
> >> =C2=A0=C2=A0 tests/acceptance: Extract the code to clear dmesg and wai=
t for CRW
> >> =C2=A0=C2=A0=C2=A0=C2=A0 reports
> >> =C2=A0=C2=A0 tests/acceptance/machine_s390_ccw_virtio: Test virtio-rng=
 via
> >> =C2=A0=C2=A0=C2=A0=C2=A0 /dev/hwrng
> >> =C2=A0=C2=A0 tests/acceptance/machine_s390_ccw_virtio: Test the virtio=
-balloon
> >> =C2=A0=C2=A0=C2=A0=C2=A0 device
> >>
> >> =C2=A0 tests/acceptance/machine_s390_ccw_virtio.py | 59 ++++++++++++++=
+------
> >> =C2=A0 1 file changed, 43 insertions(+), 16 deletions(-)
> >> =20
> >=20
> > One observation, test_s390x_devices tends to get longer and difficult t=
o
> > debug in case of problems. If a test covers one specific device type, I=
t
> > will improve readability, flexibility, and debugging. In case you don't=
 want
> > to spend time breaking this into multiple tests, I'll be glad to do tha=
t
> > after the whole series is merged. =20
>=20
> Theoretically yes, but practically we also want to run the tests as fast =
as
> possible. Quite a bit of time is used to boot the kernel, so if we add a =
new
> test for each and every device, that would increase the test time quite a
> bit. Thus I'd rather prefer to keep everything in one single test instead
> for now.

I agree.

Is there any other way to make this more debuggable?


