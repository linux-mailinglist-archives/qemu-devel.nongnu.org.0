Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 112F75B1F82
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 15:44:56 +0200 (CEST)
Received: from localhost ([::1]:38890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWHpv-00038Z-7J
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 09:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oWHaQ-0004si-Nb
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 09:28:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oWHaM-0002dD-PR
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 09:28:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662643729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EudXVOt0Mk6M0kHQy905Hms34xh06rmgpQv2Eca6/Ng=;
 b=cn+zjCvBev/un7OhKqdfvAAXKGE9vIBr3WJdWOVHpQDgkIAdRFGS9w1s4cA3D7+Zu+1Bx3
 qioZitM7Wwqu7BSz8JQW/0kpE5HLEdBah9zPWN6QpithzkYthQjsxO3Wk7/z/2meoflqvx
 z3MQwq770BR2wrb1g8Ycl6+KCrcqp90=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-LN0D77S-PdKBYMTrowb8Ag-1; Thu, 08 Sep 2022 09:28:48 -0400
X-MC-Unique: LN0D77S-PdKBYMTrowb8Ag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 266E6101E168
 for <qemu-devel@nongnu.org>; Thu,  8 Sep 2022 13:28:48 +0000 (UTC)
Received: from localhost (unknown [10.39.193.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A02C40CF8F0;
 Thu,  8 Sep 2022 13:28:47 +0000 (UTC)
Date: Wed, 7 Sep 2022 14:43:22 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [PULL 00/10] QAPI patches patches for 2022-09-07
Message-ID: <YxjmSoIF2vfe8VTg@fedora>
References: <20220907150327.538464-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="O95jAsMlD4ONKG7D"
Content-Disposition: inline
In-Reply-To: <20220907150327.538464-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


--O95jAsMlD4ONKG7D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--O95jAsMlD4ONKG7D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMY5koACgkQnKSrs4Gr
c8gz3ggAguK7KuVaSfhkhXfpc7nWeA4ugfw5H9E5zKaEBB7FbAfDJcLJsyue/K6X
x0V+8nTbxSlnXzhKW5VbPjSEINQ0rYdIw7UG8xm3J69Mux1fDM5xrE7gqjyhhLER
ZU6Io/x+c2Dp586YK/qV8H16MidB61cTyzKRqC9IS8e19BnAWfkS7QJdDeHfgUjQ
f2SSQQ2XpQUaCo1XrdQBU0+/zIW6rOveMfobqKAsE/vHS87Rp2KH5ttdLaXgE/TR
fOGkPZhL2bRicOeBo3ejBRsXzehw/SLgBBennmPE3dEY+hdUTtyy1hI4g3A1idgk
la7UXBVi65xKvXkZzaW0+2wKoz+Lqw==
=/Yvw
-----END PGP SIGNATURE-----

--O95jAsMlD4ONKG7D--


