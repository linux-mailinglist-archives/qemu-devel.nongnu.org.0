Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB0253E0A5
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 07:12:28 +0200 (CEST)
Received: from localhost ([::1]:53276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ny52R-0003o7-Hp
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 01:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1ny509-00035C-8N
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 01:10:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1ny505-0007vH-W5
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 01:10:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654492201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m8v91RFW/yTFkqUFKhfsvy7PF5CLDP5a8X41Jr8bUWw=;
 b=Cvlfy9NZ3GKnIVW35mjAAkYfsgbuCxNRub7ZsNZHyOr26zptKJQ4WpysxP9yld5cgCN9Kq
 6wIaXfHgGvEUPOF5KSyve2IkGpHfR4Ks77sdDEqP5D8PSKQf2GKQ/IwomXvETQcqL9OJdt
 zAz01gaP7ZeYTiuzv0p65uAzDkOHvXw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-nrmRdJ7FNvCuY1zvys3O2g-1; Mon, 06 Jun 2022 01:08:22 -0400
X-MC-Unique: nrmRdJ7FNvCuY1zvys3O2g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07C2485A5BC;
 Mon,  6 Jun 2022 05:08:22 +0000 (UTC)
Received: from localhost (unknown [10.33.36.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84D092166B26;
 Mon,  6 Jun 2022 05:08:21 +0000 (UTC)
Date: Mon, 6 Jun 2022 07:08:52 +0200
From: Sergio Lopez <slp@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH] microvm: turn off io reservations for pcie root ports
Message-ID: <20220606050852.2t74tbjbutunj5my@mhamilton>
References: <20220603085920.604323-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kezto3a35twes3im"
Content-Disposition: inline
In-Reply-To: <20220603085920.604323-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
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


--kezto3a35twes3im
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 03, 2022 at 10:59:20AM +0200, Gerd Hoffmann wrote:
> The pcie host bridge has no io window on microvm,
> so io reservations will not work.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/i386/microvm.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Sergio Lopez <slp@redhat.com>

--kezto3a35twes3im
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmKdi9kACgkQ9GknjS8M
AjUokA//Vl0ZKc6sOdmxE+bNolSGdtYt80e8+V/4MoSJrVXqrEKuqD3lixEHU3ac
kETFsIupaOIarKTqq6xbLdufNZ9VbeRnOmvyLuBeylMI1YnmfBhRWhI7ZdK/778n
HTzmD1G8XhkmAF1H0H/R2VGVE1YQhm03KiEX/F6gQVjU1T404PTXH09CbD0kpAOP
iOiA21kE7ikRhQBNN3edWa5D8ZCBrC2sW7hZzSamfI0Rj/aCWDKI+qgukrcOiFAV
MHB8ME9gLqhjxxaFT3kmcZTWtaLCKXdVExNtJgXJHLX2uHmBTTz6PR7jVBnImveM
EsoMOi++9qq5RtBAzCWalJDleV81cvdnJL1Jl+o8K5ypCWtihddUjgFMauCOuhVl
ydwrkRs4hrTmMFPzme+bpBqC7S3prG/+LTovz9WS4NRxDcq9rFDc3jAPnAtDI+TN
Wi00wYXS+VrnhjxE/Lf/UzoBpD4e+InR46AMEbjDiTwuk9O/ZU2ub/nYRY0ntZan
+vq/2G9uhgEP03PmGhclCaBuRQJofenUQ3FZegIhwptZuxd60eFT8n5coFNce+3T
cVOiNxoO7GyPxupKubhcjS1Z8JEINsRjsLTP462W8t7RHQjHm5ZJHxKa7NGL0gsM
yytnIXpuGVrNwyTeVGgYCh6K1TXTNMC0G8C169u5ZP/P/U45zTA=
=ql6Z
-----END PGP SIGNATURE-----

--kezto3a35twes3im--


