Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615612D4A8F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:39:20 +0100 (CET)
Received: from localhost ([::1]:33190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5J1-0005Jz-Ay
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:39:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kn46v-0006Ic-RB
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:22:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kn46s-0004TP-CT
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:22:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607538161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AZ6xLYOIjjOunyhqs6r8z/QVDXmWxo06nZor8gPOKwQ=;
 b=i/6WRyUzEEGLq5+0QTz8Nn6IZfsOjMN/JQOoQHme/0GfihYkRMeGw44JOz2JUsWi7eACk0
 HvorpF55AUdulYAHJHGSFS89J+M/xl1rgQvFKNo2LwPX3riT2Re2S/yj8w/JnsT7M8mX6u
 Io9Ymfn/tH1css1v7EC9j2Nr9m94bjo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-sjPS-hCmOKmNHU5idsN2Vw-1; Wed, 09 Dec 2020 13:22:38 -0500
X-MC-Unique: sjPS-hCmOKmNHU5idsN2Vw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C306D1005504;
 Wed,  9 Dec 2020 18:22:37 +0000 (UTC)
Received: from gondolin (ovpn-113-135.ams2.redhat.com [10.36.113.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D03535D9CA;
 Wed,  9 Dec 2020 18:22:28 +0000 (UTC)
Date: Wed, 9 Dec 2020 19:22:26 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v3] tests/acceptance: test hot(un)plug of ccw devices
Message-ID: <20201209192226.60ed3365.cohuck@redhat.com>
In-Reply-To: <07eaa46e-336c-e28f-8904-127eb07d369c@redhat.com>
References: <20201208122843.147186-1-cohuck@redhat.com>
 <07eaa46e-336c-e28f-8904-127eb07d369c@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: patchew-devel@redhat.com, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Dec 2020 19:09:25 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Hi Paolo, Fam,
>=20
> On 12/8/20 1:28 PM, Cornelia Huck wrote:
> > Hotplug a virtio-net-ccw device, and then hotunplug it again.
> >=20
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > ---
> > v2->v3:
> > - do the dmesg cleanout and waiting for messages properly [Thomas]
> >=20
> > Wainer: I dropped your r-b, as there had been too many changes for
> >         me to be comfortable with retaining it
> >=20
> > ---
> >  tests/acceptance/machine_s390_ccw_virtio.py | 24 +++++++++++++++++++++
> >  1 file changed, 24 insertions(+) =20
>=20
> Patchew failed applying this patch... Any idea what got wrong?
>=20
> Switched to a new branch '20201208122843.147186-1-cohuck@redhat.com'
> Applying: tests/acceptance: test hot(un)plug of ccw devices
> error: sha1 information is lacking or useless
> (tests/acceptance/machine_s390_ccw_virtio.py).
> error: could not build fake ancestor
> hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
> Patch failed at 0001 tests/acceptance: test hot(un)plug of ccw devices
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> Failed to apply patch:
> [PATCH v3] tests/acceptance: test hot(un)plug of ccw devices
>=20
> https://patchew.org/QEMU/20201208122843.147186-1-cohuck@redhat.com/
>=20

Hm, seems I forgot to include the base version, which should be my
current s390-next branch...


