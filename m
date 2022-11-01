Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68424615087
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:22:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opsmK-0007en-7n; Tue, 01 Nov 2022 11:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opsmG-0007e5-Vz
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 11:02:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opsmC-0005zK-9z
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 11:02:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667314918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=feA7pxreuMKIKr7ISbXIMg9FEtOC1rHBzuS/H2WB6Ug=;
 b=bAmlXSBFXLYs7tAGwEzJH1Pgz3x/CTkGjy+6AYuQ1CmsoNia6XOnwJNtkXp6qWTpOhneQo
 6PZET9vKWRMoBrV1bjQJjIOCcFDOSgrwEc3WpM9UryG8j9X6uQWFFGahMnCdjhsVd2aaXC
 v0NCrxz/BkvooGvBsRI2KKlOq39yGSA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-qsKhvBuuO6m4JsBghC7tqQ-1; Tue, 01 Nov 2022 11:01:55 -0400
X-MC-Unique: qsKhvBuuO6m4JsBghC7tqQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCD1D185A7A8;
 Tue,  1 Nov 2022 15:01:54 +0000 (UTC)
Received: from localhost (unknown [10.39.193.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AAE4C15BB9;
 Tue,  1 Nov 2022 15:01:54 +0000 (UTC)
Date: Tue, 1 Nov 2022 11:01:52 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, stefanha@redhat.com
Subject: Re: [PULL 00/14] qemu-macppc queue 20221031
Message-ID: <Y2E04PWIRMDYVv1n@fedora>
References: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ha10JiNNsHe6GxhE"
Content-Disposition: inline
In-Reply-To: <20221031201435.677168-1-mark.cave-ayland@ilande.co.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--ha10JiNNsHe6GxhE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--ha10JiNNsHe6GxhE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNhNN8ACgkQnKSrs4Gr
c8jpCAgAsp/nodTaSg+/q9t6wKvS48Jk11juBSFVDjHeQLqWpQYDYKFnlxmr7Y99
EY5mJwUi7rqrytGQFvCIxPQc5lKNnf/jlQ2Zl5ijiv53f8dErF6xSP81WBP+CpFG
4NCaNJTiswzsHG1g3CppqyJ/0G8W5NAS32MT7JGrW7Kaf4uSOJsJRQTTCtR5a8pl
34ajgHAKK0i8OmVIjmdjzwcgb+8BX34As0YHc5ArxpZId9gZVhKCgMJHy2Kmp0KF
gMIkYjb3S/U30NzBQ8ZYp6JNgOHudFPKwo7o+AUnNhSHC6BBA6FWWumx/lO33Ts/
WJxj/0L/bGPC3uGuosxRDpMcJ6Jesg==
=fxnG
-----END PGP SIGNATURE-----

--ha10JiNNsHe6GxhE--


