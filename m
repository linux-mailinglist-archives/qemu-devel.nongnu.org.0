Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBE4371527
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 14:19:17 +0200 (CEST)
Received: from localhost ([::1]:37540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldXXf-0003SV-Kc
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 08:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ldXSs-0001Ta-J0
 for qemu-devel@nongnu.org; Mon, 03 May 2021 08:14:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ldXSp-00077s-72
 for qemu-devel@nongnu.org; Mon, 03 May 2021 08:14:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620044053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eU8rFoWOKOnH2Oe4qlL8pQR7w6XKdT3Tqfta3ntFSfo=;
 b=RCyuGlOcQbQDCJuHvnc5obo7zL3ZTYDVzFgM+bUsP55M0n2PABCBTWfuOzCKUi6CfPCWAA
 q0xv9IpUzc1nOuz0cgpiwvn2/JpqLUupoA44a/k04DUE82CelkLmTcVllYX38I4FDP3CGu
 YWmu1b2g2rwO+5Mehb4sm93eCCyI07E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-AX2tn176MFuskjvNjMa9Mw-1; Mon, 03 May 2021 08:14:09 -0400
X-MC-Unique: AX2tn176MFuskjvNjMa9Mw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B2B98189C4
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 12:14:08 +0000 (UTC)
Received: from localhost (unknown [10.40.208.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A2245D9D0;
 Mon,  3 May 2021 12:14:06 +0000 (UTC)
Date: Mon, 3 May 2021 14:14:04 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH] Deprecate pmem=on with non-DAX capable backend file
Message-ID: <20210503141404.213a5cbd@redhat.com>
In-Reply-To: <20210428162929.bgwyol24brh2avfa@habkost.net>
References: <20210111203332.740815-1-imammedo@redhat.com>
 <20210427204848.ubgncujxjxcufpul@habkost.net>
 <20210428162929.bgwyol24brh2avfa@habkost.net>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: thuth@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 28 Apr 2021 12:29:30 -0400
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Tue, Apr 27, 2021 at 04:48:48PM -0400, Eduardo Habkost wrote:
> > On Mon, Jan 11, 2021 at 03:33:32PM -0500, Igor Mammedov wrote: =20
> > > It is not safe to pretend that emulated NVDIMM supports
> > > persistence while backend actually failed to enable it
> > > and used non-persistent mapping as fall back.
> > > Instead of falling-back, QEMU should be more strict and
> > > error out with clear message that it's not supported.
> > > So if user asks for persistence (pmem=3Don), they should
> > > store backing file on NVDIMM.
> > >=20
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =20
> >=20
> > I'm queueing this for 6.1, after changing "since 6.0" to "since 6.1".
> >=20
> > Sorry for letting it fall through the cracks. =20
>=20
> This caused build failures[1] and I had to apply the following
> fixup.
Thanks!

>=20
> [1] https://gitlab.com/ehabkost/qemu/-/jobs/1216917482#L3444
>=20
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  docs/system/deprecated.rst | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index cc8d810be1a..c55c4bceb00 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -257,6 +257,7 @@ is (a) not DAX capable or (b) not on a filesystem tha=
t support direct mapping
>  of persistent memory, is not safe and may lead to data loss or corruptio=
n in case
>  of host crash.
>  Options are:
> +
>      - modify VM configuration to set ``pmem=3Doff`` to continue using fa=
ke NVDIMM
>        (without persistence guaranties) with backing file on non DAX stor=
age
>      - move backing file to NVDIMM storage and keep ``pmem=3Don``


