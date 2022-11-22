Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AA0634237
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 18:10:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxWmR-0006qo-5q; Tue, 22 Nov 2022 12:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oxWmO-0006qc-Vu
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 12:09:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oxWmM-00083U-3W
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 12:09:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669136988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TMYxlB0Ga+SeLF3XElWXSmbP0YOkioi785ZlbN95RNI=;
 b=YsC9YIskZdIvtFpo93b17brmp8+TP/IPjT3NV4NaQOTTP2HvN1VfztQWJd+b3opz0t4X/S
 tW1OFMAomuSmUDaBAdJfNT4YhTiM/fYGOtsVV1MLiTRjpO2K6oSz059/blRcxpeaAxUYHs
 w6+lynx3lwsT35BUWUNthkUhRCqakkw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-yqQoyrHyOwGpQVOMfqz7mQ-1; Tue, 22 Nov 2022 12:09:43 -0500
X-MC-Unique: yqQoyrHyOwGpQVOMfqz7mQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCB7E101A528;
 Tue, 22 Nov 2022 17:09:42 +0000 (UTC)
Received: from localhost (unknown [10.39.194.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 473A62166B26;
 Tue, 22 Nov 2022 17:09:41 +0000 (UTC)
Date: Tue, 22 Nov 2022 12:09:38 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Song Gao <gaosong@loongson.cn>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, stefanha@gmail.com
Subject: Re: [PULL for 7.2-rc2 0/3] loongarch for 7.2-rc2 patches
Message-ID: <Y30CUiG+LBbHhjVH@fedora>
References: <20221122131027.1250769-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="S5SwRUW15Rag0R51"
Content-Disposition: inline
In-Reply-To: <20221122131027.1250769-1-gaosong@loongson.cn>
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


--S5SwRUW15Rag0R51
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--S5SwRUW15Rag0R51
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmN9AlIACgkQnKSrs4Gr
c8iLvgf+NGSUaLYOBUcsNLmiUxCXerSJXIIJ5FijUZ5TlkgqRYHD+SNVczt74y4r
TqN9Cm6J5xf3VqWZNtQok6SjxKbskqurBqfz1kCj5B8wDZlb6TvkasH5L+A1MgqI
18ZkVq9u2MJUuTbeLoD4HMvVHcQyB2Kdgj5ihbvkUzplTk2Dtocj08dyXOyJ422T
6gA1x41rd6+zAvwhd2DlAyhADQLkLxwr+jbxqZE8JS0FoAAJAnxzvs8rbZX762zV
f1SMzraSb7KpSNORHY2vryj3LVTblGx6/+AfXwoBR7HeXLQQaEWSqlzHjYJGo5zR
98OTeQuwNnXNBz9qXSPY1TfWFmdBhQ==
=cDpp
-----END PGP SIGNATURE-----

--S5SwRUW15Rag0R51--


