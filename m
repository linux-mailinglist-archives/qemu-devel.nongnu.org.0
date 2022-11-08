Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A7B621CA8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 20:04:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osTsc-0007aA-Pe; Tue, 08 Nov 2022 14:03:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osTsR-0007ZL-NE
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 14:03:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1osTsP-0001aB-St
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 14:03:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667934192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=ktbY182+/U/bFo6KHNJ8u3t5pTNikaQeiFvogGwa9Ig=;
 b=iA0SuCpaj2cEJk/USqWQ+Tn/tNOUG0bgliXGvPXGJlUbxCY2qxfFa39LoaR722zthWR3+L
 soAsXNlhFuGDpUfLvGGdilcMSlbGE026lKY98piehcLd4VLlXJy+h/Z/gPTF/jhIdUH8Yd
 ah7XW4LfD+KsCCTKLQnddhDoAXaO6J8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-yzor_Be3MPqaHwMcbGlaWg-1; Tue, 08 Nov 2022 14:03:06 -0500
X-MC-Unique: yzor_Be3MPqaHwMcbGlaWg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CB2086EB21;
 Tue,  8 Nov 2022 19:03:06 +0000 (UTC)
Received: from localhost (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE22C2166B29;
 Tue,  8 Nov 2022 19:03:05 +0000 (UTC)
Date: Tue, 8 Nov 2022 13:08:30 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PULL 00/14] MIPS patches for 2022-11-08
Message-ID: <Y2qbHiudO08oWXyo@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ycz9+nAGbswvHJkR"
Content-Disposition: inline
In-Reply-To: <20221107235822.71458-1-philmd@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--Ycz9+nAGbswvHJkR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--Ycz9+nAGbswvHJkR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNqmx4ACgkQnKSrs4Gr
c8iPoQf+Jc4z0pNu3/faA+FY0aU6zCxSaXuuDmUT6A34sxpk+cuPaPeqj573nDwX
Ek/cUUr6IBHNAHd11JhkV4eG1VSVd+ohY8W2kt8Kp8gbdX10ZL8Tf190dQjLUvjI
+MKksryRGOHU4f9r4Xde80K7ukiqRX6ohZdijbWJ7bEQjrWDhwunmiK/rooc+dTA
iQL+DmW2l1lJ7/5VVQJIzO/Gto282YD1McmFfLmtjzB5iLanVtegMN07ArJE/nV/
P7QPEUZX/ZMJNSngCnGl0ENBUjUKbyvRNLcs8UBzO2h2QKcPZrahmTTMbuCxUmqc
5hB6l4kYgzqeOGQPjlAwN2B2OXCglA==
=bUo3
-----END PGP SIGNATURE-----

--Ycz9+nAGbswvHJkR--


