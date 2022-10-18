Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C94CF6033CD
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 22:10:48 +0200 (CEST)
Received: from localhost ([::1]:53280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oksvG-00039h-Ub
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 16:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oksmL-0006rM-6D
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 16:01:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oksmI-0000Sn-HK
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 16:01:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666123285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=thyQ8PPG2Ljp0RjHJuyNvq6hGakgZdT/kBj0a3yj9dY=;
 b=MwpbSX/YfUmWHwxMHfEFmCm1gb/s2udl6ByQYtYeDT5A35xAkumlvZZ2VF+ayXJQZU7t/q
 S42noarwFUdj41mkaEDVHymBCCx7EDzkcJtdzyxcxrrS+HdspMnAgn16weqcd5qeA1a9qf
 Nb9rTiwGsL12jQx0Vzbp9dhLjrWG6p0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-7mkIwJYjMg-r1Au53REMyA-1; Tue, 18 Oct 2022 16:01:21 -0400
X-MC-Unique: 7mkIwJYjMg-r1Au53REMyA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57FFC101A528;
 Tue, 18 Oct 2022 20:01:21 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98CA4C15BB4;
 Tue, 18 Oct 2022 20:01:20 +0000 (UTC)
Date: Tue, 18 Oct 2022 16:01:18 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, stefanha@redhat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PULL 00/38] ppc queue
Message-ID: <Y08GDrkF/FVv7yeu@fedora>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PnlJSFKTkG3uiJ3V"
Content-Disposition: inline
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--PnlJSFKTkG3uiJ3V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--PnlJSFKTkG3uiJ3V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNPBg4ACgkQnKSrs4Gr
c8gvMggAlv5shGinteSnzY4nOrmPEJtOLcqdwzSEdvH0LeezzS5PY4ixHeLYD1/X
rsC3g/AGccTXl7UHaQqnba1APTte4nKcK127glXnP3CkzNpvJQj5i27O9SkLsVBI
zpnKaokiBP/URoPkY0H+0pqnv9CacmGvHLryqkhHI8rI/rmg0P4SrNtt84RayuEq
cTq7zLm0WD7ZxvAU6h9ehKRuHPlXynJHNUxUmqaa47acXR9AmhIDXRA55zPVUIs2
ayQSrwwDYVt7O5RMPYmD3jH5qgrzV4Los8kfk8v4JqieidmxYwRmWcTAw9oyzxIA
oRCkf+/aGGFCQhcFO2sUqhI4PVSJkQ==
=WP4o
-----END PGP SIGNATURE-----

--PnlJSFKTkG3uiJ3V--


