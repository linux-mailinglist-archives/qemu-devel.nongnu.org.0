Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7672A7DAF
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 13:02:35 +0100 (CET)
Received: from localhost ([::1]:60046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kadyM-0001aM-It
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 07:02:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kadxU-0001AQ-N5
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 07:01:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kadxO-0003LD-AS
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 07:01:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604577691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4tWe0+46xM+xDD2ozAj+WgR2G8Uus3qpuaVdXFeCRcw=;
 b=dHqiJeaDU7y1EF7jTxM5P/V+xCbReQCg7s2XUnJoTu2j7cu/ivwE8Xh928JPiAa8FFX884
 VW6f/WFypn896FIFofTFZxkzWfbvDT1vvhmWATGzXH8u9fyZ3b2psju5cTMTap/tP/MAs/
 mUyxPOCR14ar00lZ4uIdtfrhTnDtFak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-qskz_Zf5NM6sorIoCgrT0A-1; Thu, 05 Nov 2020 07:01:27 -0500
X-MC-Unique: qskz_Zf5NM6sorIoCgrT0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C89281868409;
 Thu,  5 Nov 2020 12:01:25 +0000 (UTC)
Received: from gondolin (ovpn-112-138.ams2.redhat.com [10.36.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 649405C5DE;
 Thu,  5 Nov 2020 12:01:16 +0000 (UTC)
Date: Thu, 5 Nov 2020 13:01:13 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.2 v3 1/4] s390x: fix build for
 --without-default-devices
Message-ID: <20201105130113.4bacf2c0.cohuck@redhat.com>
In-Reply-To: <394ea3ee-fdef-e25b-4419-3b1bf51a48cc@redhat.com>
References: <20201104115706.3101190-1-philmd@redhat.com>
 <20201104115706.3101190-2-philmd@redhat.com>
 <20201104182547.5ae54d3f.cohuck@redhat.com>
 <394ea3ee-fdef-e25b-4419-3b1bf51a48cc@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/05 01:14:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 5 Nov 2020 12:58:01 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Hi Cornelia,
>=20
> On 11/4/20 6:25 PM, Cornelia Huck wrote:
> > On Wed,  4 Nov 2020 12:57:03 +0100
> > Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> >  =20
> >> From: Cornelia Huck <cohuck@redhat.com>
> >>
> >> s390-pci-vfio.c calls into the vfio code, so we need it to be
> >> built conditionally on vfio (which implies CONFIG_LINUX).
> >>
> >> Reported-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> Fixes: cd7498d07fbb ("s390x/pci: Add routine to get the vfio dma avail=
able count")
> >> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> >> Message-Id: <20201103123237.718242-1-cohuck@redhat.com>
> >> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> Acked-by: Greg Kurz <groug@kaod.org>
> >> Tested-by: Greg Kurz <groug@kaod.org>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >>  include/hw/s390x/s390-pci-vfio.h | 3 ++-
> >>  hw/s390x/meson.build             | 2 +-
> >>  2 files changed, 3 insertions(+), 2 deletions(-) =20
> >=20
> > I think you're missing Matt's r-b?
> >=20
> > Do you plan to send this, or should I include it on my s390-fixes
> > branch? =20
>=20
> I plan to send a pull request with gitlab patches (or maybe
> they will go via Alex's testing tree) but not soon. If you
> are preparing s390-fixes patches, please go ahead taking this
> one (I only included to have the series build succeed).

Thanks, I plan to prepare a pull req this week, so I'll just go ahead
and include it.


