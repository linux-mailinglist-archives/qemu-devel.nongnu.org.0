Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A46537B19
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 15:10:33 +0200 (CEST)
Received: from localhost ([::1]:56968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvfAF-0000Au-Vx
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 09:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nvf2u-000493-FC
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:02:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nvf2q-0006Sa-OM
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:02:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653915768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tZv4A3tTkPnddn6jWAqqGMw4jkaz49421x+RSxZInmc=;
 b=LZShXg8GMa0pKPaGFS8/9VU83VYY9xbohuYJLH9WeMw920HHDz3Sc4giH+JWiZhxMXk62o
 tID+CJS53oScuehXsaorffQT0r+SZ+oeW2AbjlbWsBzcD20fK2E23SyAIUoAcaKAzXhX7y
 tIFIx6tsLVVfISTYme1RkeTn/N2w04c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-Ei0c-YnDNrukCiedE-MITw-1; Mon, 30 May 2022 09:02:44 -0400
X-MC-Unique: Ei0c-YnDNrukCiedE-MITw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F65518E6C44;
 Mon, 30 May 2022 13:02:44 +0000 (UTC)
Received: from localhost (unknown [10.39.195.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 19C80C27E8F;
 Mon, 30 May 2022 13:02:42 +0000 (UTC)
Date: Mon, 30 May 2022 14:02:42 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Fam Zheng <fam@euphon.net>, Ari Sundholm <ari@tuxera.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 07/10] block: Implement
 bdrv_{pread,pwrite,pwrite_zeroes}() using generated_co_wrapper
Message-ID: <YpTAcn+G/CHkOjii@stefanha-x1.localdomain>
References: <20220519144841.784780-1-afaria@redhat.com>
 <20220519144841.784780-8-afaria@redhat.com>
 <Yo9AhsmzrQlzIr/z@stefanha-x1.localdomain>
 <CAELaAXy-Pp75sdkEDiaUEfg-SL5FF1LKTJ7ntajNcz75+FpiaQ@mail.gmail.com>
 <20220527142506.wkl2al5vtle45qji@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+GQgiQfSBYelZZ8n"
Content-Disposition: inline
In-Reply-To: <20220527142506.wkl2al5vtle45qji@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+GQgiQfSBYelZZ8n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

For completeness, a few more lines from IRC:

13:56 < hreitz> Errr s/E2BIG/ENOSPC/
13:57 < kwolf> Anthony added it like this in 71d0770c4ce, and then we only had extensions and refactorings
13:58 < kwolf> Yes, ENOSPC actually has a different meaning because of the werror/rerror stuff
13:58 < kwolf> Well, only werror for ENOSPC

--+GQgiQfSBYelZZ8n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKUwHIACgkQnKSrs4Gr
c8jE6wgAk5OwlSBKXCSMlt8P3LBlpLyG4zQOUV5loPUqmXP1NJ16eV1zDGyewuV8
Lr+nNX0r0hP+03i3XtFOBS/UxheSPkkPxHiHRixthQIXkQwoyTXq6IGOTsIE1cf2
2lqeUTFBgJ0VTJoxztyWk/S/W/hdgwsXXLy69RftZZQuCrpbFwijH5LCMhDiuSFs
1yhJ/QRCv6ukpXwLN4Xw9f3R+dQShWri9tpSG8MOsTWMNhPXeCkZXjW4RCTtYKFo
zzOVGnTHFdUo1uXUVIQdMCk5e5JYWH9bNNbNk+JGaFydrb7P31byj8Voo6YUXU0Y
WgmuPCpLv9946a2cEswr3S4NxIM5aA==
=nakf
-----END PGP SIGNATURE-----

--+GQgiQfSBYelZZ8n--


