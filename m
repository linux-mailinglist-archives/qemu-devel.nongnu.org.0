Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC952938E9
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 12:10:45 +0200 (CEST)
Received: from localhost ([::1]:38906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUobM-00005n-Km
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 06:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kUoaF-00080k-Ho
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 06:09:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kUoaD-00080T-Je
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 06:09:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603188572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3QyRW8TWk+sSIn8HvhL9Ibg6zxLaqYTtBXibeJQjLNY=;
 b=VHK//dt4S0abhOOtMoAwYpbIcEC8+2bX64uutf1HMk1hJjc4Yn3ppesAUACwb6ti2Nac20
 E28oy2ldFRXsi9w70CERMNygI2GWngFC6LNhJRuwOhiru2ZZewMGAUeq/nMX3OrPKrnenO
 sJ7F8itwKbjGbLYBe33QEgyDQuI11to=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-UcUy3e5PNZeCyKfpBUljKw-1; Tue, 20 Oct 2020 06:09:30 -0400
X-MC-Unique: UcUy3e5PNZeCyKfpBUljKw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 764531084C84
 for <qemu-devel@nongnu.org>; Tue, 20 Oct 2020 10:09:29 +0000 (UTC)
Received: from localhost (ovpn-115-35.ams2.redhat.com [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DA291A4D7;
 Tue, 20 Oct 2020 10:09:22 +0000 (UTC)
Date: Tue, 20 Oct 2020 11:09:22 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 5/5] tools/virtiofsd: xattr name mappings: Simple 'map'
Message-ID: <20201020100922.GF140014@stefanha-x1.localdomain>
References: <20201014180209.49299-1-dgilbert@redhat.com>
 <20201014180209.49299-6-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201014180209.49299-6-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lIrNkN/7tmsD/ALM"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:15:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: dinechin@redhat.com, virtio-fs@redhat.com, qemu-devel@nongnu.org,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--lIrNkN/7tmsD/ALM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 14, 2020 at 07:02:09PM +0100, Dr. David Alan Gilbert (git) wrote:
> +static XattrMapEntry *parse_xattrmap_map(const char *rule,
> +                                         XattrMapEntry *map,
> +                                         size_t *nentries)
> +{
> +    char sep = *rule++;
> +    const char *tmp;
> +    char *key;
> +    char *prefix;
> +    XattrMapEntry tmp_entry;
> +
> +    /* At start of 'key' field */
> +    tmp = strchr(rule, sep);

Missing sep == '\0' check. The strchr(3) man page says:

  The terminating null byte is considered part of the string, so that if
  c is specified as '\0', these functions return a pointer to the
  terminator.

So the code in this patch will eventually access beyond the end of the
string:

  rule = tmp + 1; <-- tmp is already at the NUL terminator

--lIrNkN/7tmsD/ALM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+Ot1EACgkQnKSrs4Gr
c8joDwf+LjvGfFhjtzgTWfk0XXiPUPH2CZKehHLqMydxgUVhtEwSASvy/0VE8DQV
f4qGlYyDmMwMKrOBytazuHu4bc9mdSdB0NuG24gaDLB/vajiX8gbXfSchTV5rXGz
QDnjZbYLqB9b7KbrYWVpDKhYXtqq035xQY1zdjAvAl1aRy1AlCk+yc2M8KRpnkzE
EOGEMBjRoX9dmo54WhZi93VTsJhIb7j/kRAhISrEjDjXHcXE2QtANswX9tnjWQmn
mNsorHNQ71MVe00iLNWsaOLcTdkmFBU93SwSol5exXbOK1cFwcqNE8y/XAJVQFWE
1okVx/sV9Y8LdtelwivbdM2MHlv80Q==
=vlQF
-----END PGP SIGNATURE-----

--lIrNkN/7tmsD/ALM--


