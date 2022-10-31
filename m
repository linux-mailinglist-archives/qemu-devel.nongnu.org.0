Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1247A613DD1
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 19:54:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opZu6-0001As-UW; Mon, 31 Oct 2022 14:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opZtv-00013i-5b
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 14:52:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opZtt-0003dI-Le
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 14:52:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667242365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xGzfEr8otiRfKxkiRm+8nACQkh+8E+/RMY79gaHvFio=;
 b=Ru7KhYeRGtXK373HP+kKTc5bOjEmbvqgHzcznkE2EZWoGuuIAOqQjNSSIvCpupBbcEen/p
 kWj3mQ6LbAh1qJFuXAOugMZVFk1LpZnphz4rYfKIxoQDU+r03EBCs7uI43+FqMe8ObT4kz
 4SaBdIIe/Wvj9iFyUOD5s/s9XXLC7mQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-SxXvvAbwO-io9JJ24viF7g-1; Mon, 31 Oct 2022 14:52:43 -0400
X-MC-Unique: SxXvvAbwO-io9JJ24viF7g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 057DB3C0D84D;
 Mon, 31 Oct 2022 18:52:43 +0000 (UTC)
Received: from localhost (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F25A492B0A;
 Mon, 31 Oct 2022 18:52:42 +0000 (UTC)
Date: Mon, 31 Oct 2022 14:38:11 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, stefanha@redhat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PULL v2 00/63] ppc queue
Message-ID: <Y2AWE3pkxUnTK2bu@fedora>
References: <20221029111727.1065252-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WHpspFIgZRZxru/9"
Content-Disposition: inline
In-Reply-To: <20221029111727.1065252-1-danielhb413@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org


--WHpspFIgZRZxru/9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--WHpspFIgZRZxru/9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNgFhIACgkQnKSrs4Gr
c8gTuAgAqR7o/2A1hEysdMYE740lVSlUOhNvcuIdQDHn40dz7/fJ6rlsZtyjmqJj
7fA51NCHCilExLrwF5Tl4tiW842Tem4tRtoeB1Smy2EQZ1gdabl1+ExufKdTyyw3
xklqnG6HhKCuD8V/NVMhRDjhqLcx329NR6KlCt+a3qEWwqIe8wewNUoRjg5EDsDe
+nZuYMGT0irH1Rru2PnJw73PvWjC4F277ul5qrLRVSHdEJlBHSgfZwPuLSuSdOTz
DvZAR6FfXngteA7hY03QXhFsFEBV2wZ5wsYGMMg1hitDWYn0fc2uoi1XFiRtUrMB
o6pt6IFKCiL62FYqipM2rpgM+7Vc/g==
=eHj5
-----END PGP SIGNATURE-----

--WHpspFIgZRZxru/9--


