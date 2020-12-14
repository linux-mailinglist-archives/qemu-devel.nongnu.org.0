Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE462DAB0C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 11:47:08 +0100 (CET)
Received: from localhost ([::1]:33316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp7rG-0000Pg-Nc
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 05:47:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kp7q4-0008Qh-TS
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 05:45:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kp7q2-00056a-J5
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 05:45:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608029148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QU8Gz43y5HmLy1X/nFJC8xpl8ELfzk7yV9hPzAs2UOY=;
 b=WTbp/ymMsifAyhqZfKada0lk/4dVkxNWedoDU7Y6QUI5lJ5kJhIDZZKouWx8vEC9hB3yQd
 aNMbQTIFMVn1blzb9m7+21mQQB+Ph67fKbe1UWZi4E7QDLsct4yLNjORXZn5CPxaR52Gd8
 WLh0bpLHcuFOxauziBoXr9Kq2aPLzkc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-oHxBXJmFPGmnFi2LFlNnXw-1; Tue, 15 Dec 2020 05:45:46 -0500
X-MC-Unique: oHxBXJmFPGmnFi2LFlNnXw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A413180A095;
 Tue, 15 Dec 2020 10:45:44 +0000 (UTC)
Received: from localhost (ovpn-117-148.ams2.redhat.com [10.36.117.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD0B571D4F;
 Tue, 15 Dec 2020 10:45:28 +0000 (UTC)
Date: Mon, 14 Dec 2020 21:17:32 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v13 00/19] Initial support for multi-process Qemu
Message-ID: <20201214211732.GJ620320@stefanha-x1.localdomain>
References: <cover.1607922214.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <cover.1607922214.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="J2uG6jHjFLimDtBY"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com, kwolf@redhat.com,
 berrange@redhat.com, mreitz@redhat.com, ross.lagerwall@citrix.com,
 marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--J2uG6jHjFLimDtBY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2020 at 12:14:40AM -0500, Jagannathan Raman wrote:
> Hello,
>=20
> This is the v13 of the patchset. Thank you very much for reviewing v12 an=
d
> sharing your feedback.

As mentioned on IRC, please add a ./configure option so package
maintainers can easily disable multi-process QEMU without patching the
source code.

Thanks,
Stefan

--J2uG6jHjFLimDtBY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/X1mwACgkQnKSrs4Gr
c8ipOgf/fBqGeg8InjB0TGFXLSxb9rJUuBK6y6FESfSbXcHk/jq6KUG0Q2a4v7wB
EQTCNhFnaDRvrG348G9keId5er8YWOOZmxAqdFtDzvbiLtnz61RwB1IeiItbcWrR
KgPXXbT+fvYIUfe4HbsHxlFfsaLeKIobFrgix6Y5/YPyFYjcMSzK/b3AZ1F8QmMC
CwapCOw3U7DC8yxt7YfR+crf5Iv9/smts51WE0iU5orrAC4FQPjMuo0XUkcaLlQg
TQctZvwQg48szxJzIuZHkpdhISBgmateV5Dfb2ngBloz/TpuH1W51GVW/da0lHdt
pRH8FuYlQvWeTRErtASRi/bQVy4yXQ==
=PHqC
-----END PGP SIGNATURE-----

--J2uG6jHjFLimDtBY--


