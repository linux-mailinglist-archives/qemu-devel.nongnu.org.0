Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 432D6174BD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 May 2019 11:13:19 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33677 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOIda-0003LN-FI
	for lists+qemu-devel@lfdr.de; Wed, 08 May 2019 05:13:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hOIcd-000315-Ut
	for qemu-devel@nongnu.org; Wed, 08 May 2019 05:12:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1hOIcc-0004dz-RO
	for qemu-devel@nongnu.org; Wed, 08 May 2019 05:12:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38720)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hOIcc-0004de-M4
	for qemu-devel@nongnu.org; Wed, 08 May 2019 05:12:18 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D82E6C057F3F;
	Wed,  8 May 2019 09:12:17 +0000 (UTC)
Received: from redhat.com (unknown [10.42.22.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12B7C60C61;
	Wed,  8 May 2019 09:12:15 +0000 (UTC)
Date: Wed, 8 May 2019 10:12:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Tao Xu <tao3.xu@intel.com>
Message-ID: <20190508091213.GC32552@redhat.com>
References: <20190508013153.15412-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190508013153.15412-1-tao3.xu@intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 08 May 2019 09:12:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3] i386: Add some MSR based features on
 Cascadelake-Server CPU model
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: ehabkost@redhat.com, xiaoyao.li@intel.com, qemu-devel@nongnu.org,
	robert.hu@intel.com, pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 08, 2019 at 09:31:53AM +0800, Tao Xu wrote:
> As noted in "c7a88b52f6 i386: Add new model of Cascadelake-Server"
> Because MSR based feature has been supported by QEMU, we add
> CPUID_7_0_EDX_ARCH_CAPABILITIES on Cascadelake-Server CPU model,
> and add IA32_ARCH_CAPABILITIES MSR based features (RDCL_NO,
> IBRS_ALL and SKIP_L1DFL_VMENTRY).
>=20
> And "014018e19b i386: Make arch_capabilities migratable" has been
> in QEMU upstream, the CPUID_7_0_EDX_ARCH_CAPABILITIES can be
> safely added into CPU Model.
>=20
> Signed-off-by: Tao Xu <tao3.xu@intel.com>

Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|

