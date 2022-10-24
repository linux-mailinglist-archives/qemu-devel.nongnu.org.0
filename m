Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EECE60CD27
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 15:14:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onJih-0008TH-1V; Tue, 25 Oct 2022 09:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onJiN-0007Lb-Nw
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:11:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1onJiJ-0007fR-S1
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 09:11:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666703486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uorgmfCinbSiDCKOcvZm0fNAGviKYNUThCwFgHKOz14=;
 b=FxKRD+FwLfT1GYin4qQMVO11YzTXziqDN3jqp6yQjK/ThkfnB2t1seww55CMfm4yiMa1SN
 dpk/DgWO92B270yur4V9i148wUmqCOcgs0gwEOmsZtB/9OYRv7SpGKq/Oj0SUyuppPBSHI
 skR5QWbPQnkPlUn1dder5V+AMwGmef8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-6qPwOYbSN-O3s_th27r8WA-1; Tue, 25 Oct 2022 09:11:23 -0400
X-MC-Unique: 6qPwOYbSN-O3s_th27r8WA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB60286C14A;
 Tue, 25 Oct 2022 13:11:19 +0000 (UTC)
Received: from localhost (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 438A040C6E13;
 Tue, 25 Oct 2022 13:11:18 +0000 (UTC)
Date: Mon, 24 Oct 2022 17:07:11 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 0/2] M68k for 7.2 patches
Message-ID: <Y1b+f01izoQdpUZH@fedora>
References: <20221024085840.3023854-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9yEe62jT8o2y5Ae/"
Content-Disposition: inline
In-Reply-To: <20221024085840.3023854-1-laurent@vivier.eu>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.517, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--9yEe62jT8o2y5Ae/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--9yEe62jT8o2y5Ae/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNW/n4ACgkQnKSrs4Gr
c8jBcgf+NTJiqOu25u6gldYQLlcx0G0RhJLciJjeAMLig3pPgwp2gwyzkIY0Qpp/
VgHrzJWdP8rsaObxkR6Ys10X3TGvJwl7fnMeX+fW6iq0jY/V61LbCjgFk76AVcGn
zrMcIzDa0zU9tVkLj0k/8LtqVmwZr3kcOKRVRi897xQE80eQDB1s6gyKanpekUOb
RdDgiR/r9+yAKD3n8W86XuppaXvsZQ9QLEVa+kGwHVsG3naFoKgP6m1z6DVaPjS+
GvCzpqqPFxl7PcZz6juF6VU5HrKE45JFMPJcg0P/HZ9DhqYLvjZ4tyD4yGzIWpk8
aLwqRqvBtlpbSJrxxqof9IDjMKYNnw==
=cDL+
-----END PGP SIGNATURE-----

--9yEe62jT8o2y5Ae/--


