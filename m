Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AC45F3990
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 01:06:32 +0200 (CEST)
Received: from localhost ([::1]:52934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofUW6-00047V-Va
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 19:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ofURS-0001QC-KZ
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 19:01:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ofURO-0001rG-Ci
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 19:01:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664838096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oAk+vg06/r3LlGWM2OVs+e0yAkXJizE+021ewC8PvWk=;
 b=QC8LN+qLnNHm9WRNkXvdXVZnlUz6xj2vy1byMohoaNqt9XEdDQ9cSaNMcyoZ4rjI/JmN7I
 qGz5Rv6hRESQmoy+WTsF1vklgeaOWxYL0EmrKN1L8kjrzW/Lt7/nMbRtSxgdjHGqAz3j0j
 2W6w4jQ5CXg729cZZ4evXhI+boKEgbg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-3279MQcsNhCCF44VOamt1w-1; Mon, 03 Oct 2022 19:01:35 -0400
X-MC-Unique: 3279MQcsNhCCF44VOamt1w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05B041C0513A
 for <qemu-devel@nongnu.org>; Mon,  3 Oct 2022 23:01:35 +0000 (UTC)
Received: from localhost (unknown [10.39.192.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AC83140EBF5;
 Mon,  3 Oct 2022 23:01:33 +0000 (UTC)
Date: Mon, 3 Oct 2022 19:01:32 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, stefanha@redhat.com,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PULL 0/8] chardev patches
Message-ID: <YztpzMK0Q6rzS/nu@fedora>
References: <20220929110508.1323529-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oReGIoGMpZWcwnI1"
Content-Disposition: inline
In-Reply-To: <20220929110508.1323529-1-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--oReGIoGMpZWcwnI1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--oReGIoGMpZWcwnI1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmM7acwACgkQnKSrs4Gr
c8hYPAf9E2Im40BRDCaUtXJYWF/daIXU/B6TsVQ2XI5QGs8yjkXtAHkIvDZHk2mm
lf+Wkevop5mzTc1bp5x85BPmToR43Y7vs2Ud59mZA5/wc4DD8aZfZ7NlNLg8n8K8
PX18lOLDDE2HhoXb//x3egclcoT+FI9OdVIlbQSPWjWqP+zbLulYdbRJRqqh2ai8
HKkE8uTn7z7LEFn+D7JNritjhmgcsQdoIjJRQVKecQQPUx3VD3PcuiItDPeDHAnU
1GvSdiS2Yt8sXjFCPMLMUUQUmCGq781OhFyDwLUlw5IjLcX/CXxmF8AKjLD95cY7
HKOTieSkoaVrExWX8q9G7aBy4rWlnw==
=BLf2
-----END PGP SIGNATURE-----

--oReGIoGMpZWcwnI1--


