Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED6E37AB00
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:44:07 +0200 (CEST)
Received: from localhost ([::1]:49242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgUYI-0005Nm-7O
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgUUt-0001Rg-Aw
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:40:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgUUr-0002vv-SR
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620747633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=afMXQs47/X8uyTx8IbHkyqUhJRvWBPZCuzImLHRVRGk=;
 b=SVLs+DfJo59ihH+LkdQ6OUN8pF6bnnhkCIPPfRc1y+zdcgHEPUZo8yusZMFEhNyKxfgSxa
 q64wOz0wz0IuorVFxPKwoT6A65TQeGBIC5vU32iSuOqkPxppe5enJfaGiYu1RNSRubixXf
 kvEHqvmV8+OFXBQkahU/xqPWppLcF78=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-grBtD2DtNpeAG_VsRPne7A-1; Tue, 11 May 2021 11:40:29 -0400
X-MC-Unique: grBtD2DtNpeAG_VsRPne7A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7C251854E24;
 Tue, 11 May 2021 15:40:26 +0000 (UTC)
Received: from localhost (ovpn-112-6.ams2.redhat.com [10.36.112.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EABEC1037F24;
 Tue, 11 May 2021 15:40:12 +0000 (UTC)
Date: Tue, 11 May 2021 16:40:12 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Levon <levon@movementarian.org>
Subject: Re: [PATCH v8] introduce vfio-user protocol specification
Message-ID: <YJqlXMR8QYkTtIuF@stefanha-x1.localdomain>
References: <20210414114122.236193-1-thanos.makatos@nutanix.com>
 <YJlmARxX5ZADZD5w@stefanha-x1.localdomain>
 <20210510222541.GA1916565@li1368-133.members.linode.com>
 <YJpX8XT+WvXYkyMD@stefanha-x1.localdomain>
 <20210511104357.GA1964660@li1368-133.members.linode.com>
MIME-Version: 1.0
In-Reply-To: <20210511104357.GA1964660@li1368-133.members.linode.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="biuH3CZMUchRcxXO"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: benjamin.walker@intel.com, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John G Johnson <john.g.johnson@oracle.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Christophe de Dinechin <cdupontd@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, jag.raman@oracle.com,
 james.r.harris@intel.com, John Levon <john.levon@nutanix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Kanth.Ghatraju@oracle.com,
 Felipe Franciosi <felipe@nutanix.com>, marcandre.lureau@redhat.com,
 Yan Zhao <yan.y.zhao@intel.com>, konrad.wilk@oracle.com,
 yuvalkashtan@gmail.com, dgilbert@redhat.com, eafanasova@gmail.com,
 ismael@linux.com, Paolo Bonzini <pbonzini@redhat.com>, changpeng.liu@intel.com,
 tomassetti.andrea@gmail.com, mpiszczek@ddn.com,
 Cornelia Huck <cohuck@redhat.com>, alex.williamson@redhat.com,
 tina.zhang@intel.com, xiuchun.lu@intel.com,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--biuH3CZMUchRcxXO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 10:43:57AM +0000, John Levon wrote:
> On Tue, May 11, 2021 at 11:09:53AM +0100, Stefan Hajnoczi wrote:
> > Fleshing out irqs sounds like a 1.0 milestone to me. It will definitely
> > be necessary but for now this can be dropped.
>=20
> I could be wrong, and probably am, but I believe we're basically fine for=
 IRQs
> right now, until we want to support servers on separate hosts where we'll
> obviously have to re-introduce something like the VM_INTERRUPT message.

Great!

Stefan

--biuH3CZMUchRcxXO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCapVsACgkQnKSrs4Gr
c8g9jQf/Uy1Ukzz0ObJkjGnCg89fLqakcQSd3C8psZlWX6j9jbtffXLU2GHIj1Zx
bOFHos+YeG0XjeoWBG5TxDOsT8IIDE4D+s8J6YH0ZyT7nQZZwVNdVzkhzvDjWZUH
WscV28Hdo0EkESec5X7mCXuuAy70yNM62sMr+kHFNNbmKLeewsd1sT0mdhK/2DNE
4DeDhn+hCTppEjKRCU/pK2MzmfL6MsCimRw/Vnn/QP9xCfHYrLcuiZaXXsTJ5qS3
EKv1xIiF3jD7gVHaClAOM2izfj+npRKpXlg0u8LKXLvwctbQfpOaY1aCBXWDZN+6
ULzF4rldCummgFW2wTYVYOr0Fg9lrQ==
=wYrd
-----END PGP SIGNATURE-----

--biuH3CZMUchRcxXO--


