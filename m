Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0540D37577A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 17:36:06 +0200 (CEST)
Received: from localhost ([::1]:38508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leg2n-0003iY-4J
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 11:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lefzn-0001tQ-W3
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:33:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lefzk-00061g-C0
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:32:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620315174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lYimat6/VYHsdupEo7ml00CWie4ULlMMKNxMt0QdRDI=;
 b=hBb2/Ymw7VvwLkkETViitwlMBS7Fy17gki/E1ohMOnpu45JBer0wb7lO+2mcW35snlRanB
 4SpV0zrmPh+V0XtcydgNLWF+LNnViq+iiwMV3Y6PnMSCoL/x0OFDuT5JPw/OcYSiq1sXSG
 HTZmcOf4eDCT580Xk0F9nq5gYd6Hj9k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-SBgT6xtdMai-QvrTFkE9dg-1; Thu, 06 May 2021 11:32:52 -0400
X-MC-Unique: SBgT6xtdMai-QvrTFkE9dg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A0FB79ECA;
 Thu,  6 May 2021 15:32:51 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B8DE19D9F;
 Thu,  6 May 2021 15:32:47 +0000 (UTC)
Date: Thu, 6 May 2021 16:32:46 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 24/26] vhost-user-fs: Extend VhostUserFSSlaveMsg to
 pass additional info
Message-ID: <YJQMHh0U+qWekguO@stefanha-x1.localdomain>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-25-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210428110100.27757-25-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uYmuTQLrCxwedF5s"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, vgoyal@redhat.com,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--uYmuTQLrCxwedF5s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 12:00:58PM +0100, Dr. David Alan Gilbert (git) wrot=
e:
> @@ -144,6 +148,8 @@ typedef struct {
>  } VhostUserFSSlaveMsgEntry;
> =20
>  typedef struct {
> +    /* Generic flags for the overall message */
> +    uint32_t flags;
>      /* Number of entries */
>      uint16_t count;
>      /* Spare */

Please introduce the uint32_t field as a reserved field in the earlier
patch that left a hole in the struct. Everything is okay once we get to
this patch but the earlier patches should have avoided the hole too
(they had the confusing uint16_t padding field which was not enough to
avoid the 64-bit alignment hole).

--uYmuTQLrCxwedF5s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCUDB4ACgkQnKSrs4Gr
c8jTtQf/eLmojdYXkaG9x2oqZfUnUE0tGl1k6spkBTM/Bgh3A1CeHJJMI5et/Thi
OpxPyOf10a/wJ5/jmDRyR4VXSpwhwLE555OiA9Oy5DTnNu62MIzPNukBX4pPsfUU
5KhP6OU3Ik4VoNV0i0icUrMyIYr/ePYbCfvqKiQbG16kTijC2QFGtAkHC2oh4P7r
WT9v7zT3TuQoIoPz2gj293kHv1gLEt5gITNUAESOZ1n9doD+eVBciqEN9kRkHjC+
MAIifoIdYgJ3YfH4lANoy3qr7esDrePy/MLAxlAfDpvT20sODL49SYxFRCIkcVSg
xGohp+cftiJWkl7ZWLEm1bXX6ofZAg==
=kmeA
-----END PGP SIGNATURE-----

--uYmuTQLrCxwedF5s--


