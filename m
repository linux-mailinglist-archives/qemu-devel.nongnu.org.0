Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD9761FF16
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 21:04:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os8LV-0004qn-J2; Mon, 07 Nov 2022 15:03:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1os8LS-0004qH-FP
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 15:03:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1os8LQ-0004fr-Rs
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 15:03:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667851423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OgFM+fxF/fAJLn9kueQnYlnVCZwTJEBKQVOpclT4yB0=;
 b=KYxUoaBKKyf2J9xkSMpgaGDqjDZ8GvqG6ll2okeCU6xI2ebj+rc0SAY4iDpO4IUfZpaTUT
 oGlv5J9nucAluRrYdCPmaLAGZXbP00J1fvr3hQqs/lL7ym9EpWp0MAN0jGNwolFYREIWRw
 mVF2XRS4F1qeTtZjhM2sULJFOphNwi0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-9z_INIxHP2K0YmmKFBfeLQ-1; Mon, 07 Nov 2022 15:03:42 -0500
X-MC-Unique: 9z_INIxHP2K0YmmKFBfeLQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C15133817A60
 for <qemu-devel@nongnu.org>; Mon,  7 Nov 2022 20:03:41 +0000 (UTC)
Received: from localhost (unknown [10.39.194.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54E75492B05;
 Mon,  7 Nov 2022 20:03:41 +0000 (UTC)
Date: Mon, 7 Nov 2022 15:03:39 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 00/12] Misc bugfix patches (+ improved module errors) for
 QEMU 7.2
Message-ID: <Y2lkm4CkrEvcpOao@fedora>
References: <20221106085115.257018-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dYEMnaslsDURnVnd"
Content-Disposition: inline
In-Reply-To: <20221106085115.257018-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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


--dYEMnaslsDURnVnd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--dYEMnaslsDURnVnd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNpZJsACgkQnKSrs4Gr
c8gB1ggAvYwOfa89ATOfM4NUq0M6ccyNmsHeP9DSlKQDmzZTWyok4k4KXNA1+u28
wNzv5tSM/PcQO87oEpgfR/d7c32oEbzDWU73gMyhs2hE2W1TeQNYIsz+6fwoBbsY
ruDDOR+14ERiKT8hVfThwDTV24AFbmLKQofO01E/YzgGS6TnMAlZ2DPWMwNsa4Mk
bAbNVHuRU/X/QWUbwgGfzgDII7ZMDe+j3z+SSi9Rmcrs3KtvDlmrs15Fep51qUVB
OHV5aXId4s4iXSJStUZZKkZ473xnbq+VUVcbs3dlY3veTCmp3MdMJQ4ZKBXK7frJ
tip5OLgNpYR2dDhithoIkv+BKZDSXQ==
=v4/l
-----END PGP SIGNATURE-----

--dYEMnaslsDURnVnd--


