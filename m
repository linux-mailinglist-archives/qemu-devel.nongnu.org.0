Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 726D0389389
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:21:26 +0200 (CEST)
Received: from localhost ([::1]:42930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljOwn-0003Jh-HB
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ljOuH-0001Tl-7s
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:18:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ljOuF-0000dI-Lz
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:18:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621441122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fhx9Bn2RRNUw7JVeJnANI3w2q4jxz/kNric9jZ2HCjA=;
 b=dtgGqXplVdbk1vR6mBMdbyTxYKAv2QR6ts66lq42vpjNA4GNgx/xGoSODzwLi1UnprosgQ
 QfhwikGo4u9ve0F4inHUlsui6SlI6/kWdHx8cNmZA1FpiWZYRxKsc1zH3ovCsTmQRTwGKo
 4v2l4i5JoI/j8I529UFTCOISBZlJedI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-Jqz7LJAbM66fcWMKN9gUsQ-1; Wed, 19 May 2021 12:18:40 -0400
X-MC-Unique: Jqz7LJAbM66fcWMKN9gUsQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 758EB106BB29;
 Wed, 19 May 2021 16:18:39 +0000 (UTC)
Received: from localhost (ovpn-114-43.ams2.redhat.com [10.36.114.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD14E10027A5;
 Wed, 19 May 2021 16:18:38 +0000 (UTC)
Date: Wed, 19 May 2021 17:18:37 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 11/11] hw/isa: Rename isabus singleton as 'g_isabus'
Message-ID: <YKU6XVQSp37suuRa@stefanha-x1.localdomain>
References: <20210518215545.1793947-1-philmd@redhat.com>
 <20210518215545.1793947-12-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210518215545.1793947-12-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MCUyaGVnRRx1BvZ9"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--MCUyaGVnRRx1BvZ9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 18, 2021 at 11:55:45PM +0200, Philippe Mathieu-Daud=E9 wrote:
> @@ -55,7 +53,10 @@ static const TypeInfo isa_bus_info =3D {
>  ISABus *isa_bus_new(DeviceState *dev, MemoryRegion* address_space,
>                      MemoryRegion *address_space_io, Error **errp)
>  {
> -    if (isabus) {
> +    static ISABus *g_isabus;

QEMU doesn't use Hungarian notation, g_isabus isn't a global variable so
the prefix is confusing, and g_ conflicts with GLib's namespace so the
rename is odd. I suggest keeping the name unchanged and making the
commit message "remove the global isabus variable".

--MCUyaGVnRRx1BvZ9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmClOl0ACgkQnKSrs4Gr
c8j/gAf/dyZfEU3kC6t9v6V0DLYmuXdj6BSwWZEZTVvZqR9FqYazFFAWDAERBmJV
0PIymoejOAT6tb8Pf/5lwnTM7Vmd8uJsFDHbdksryNSOBHH5ZZnodByVaFovElYE
oEn9Xr+JsLS5WN6vJTdciYPFGNgz07yWDlcIu+m0q7CKVtjNB169Plw0mdRqBYTh
qGK8jaka8ASQLVssq4jYdWQYeWwf0gLxfWEuWakWjq9Dmn4e49iYx4OFcIYt1pbw
xy7LsIq9yIUmsIQsCc+xcZynH9SttTuaoccwZZdDnTGVFPH38E4Av+ViydfBpfUq
yozpATC6HxvRH+AL8pfWILdBLJodaQ==
=UCW0
-----END PGP SIGNATURE-----

--MCUyaGVnRRx1BvZ9--


