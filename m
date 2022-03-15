Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 503D84D9C64
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:39:29 +0100 (CET)
Received: from localhost ([::1]:57760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU7OZ-0006FX-KC
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:39:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nU7MX-0004tF-Ar
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 09:37:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nU7MU-00074Q-SF
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 09:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647351438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0edAbJDU2HiaIaWaoa+80CCgT9OvXYBUlEW+t7FTm2s=;
 b=PnyayU8KGfIgCrsfgXx5ZZRRee7Qesru642/n27+hFVYJabPU04DO3aN+SsyW+LcmM/wj+
 M7li8MwzWY8hxQUV2AU7kf1zapkZQlSKaUAg9VEiSensCLk+7J47W/OMpx1oCDZxIL4vaT
 8L6tbBwjgmuSubaBjwm6sjRkoh/zmwo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-kWDo0O6VMwOWgvQl1Sw2FQ-1; Tue, 15 Mar 2022 09:37:14 -0400
X-MC-Unique: kWDo0O6VMwOWgvQl1Sw2FQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FFF8101AA49;
 Tue, 15 Mar 2022 13:37:14 +0000 (UTC)
Received: from localhost (unknown [10.39.194.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C62611120AA3;
 Tue, 15 Mar 2022 13:36:53 +0000 (UTC)
Date: Tue, 15 Mar 2022 13:36:52 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Subject: Re: [PATCH v2 5/6] vduse-blk: Add vduse-blk resize support
Message-ID: <YjCWdPiZWiX9SYG1@stefanha-x1.localdomain>
References: <20220215105943.90-1-xieyongji@bytedance.com>
 <20220215105943.90-6-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="x5RQbzFFWBNsTNOT"
Content-Disposition: inline
In-Reply-To: <20220215105943.90-6-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 mlureau@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--x5RQbzFFWBNsTNOT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 06:59:42PM +0800, Xie Yongji wrote:
> To support block resize, this uses vduse_dev_update_config()
> to update the capacity field in configuration space and inject
> config interrupt on the block resize callback.
>=20
> Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> ---
>  block/export/vduse-blk.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--x5RQbzFFWBNsTNOT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIwlnQACgkQnKSrs4Gr
c8huaggAq+wzxjcaUOZ5DXVo1RXY3Yj7fc24aNdL4gKF8esf0FwoZiWNX6NhOWeE
1Q+cSrAiuVXzSk9xddAQMcTYX0x9j271ECIISmPT9w05ORDddwEVRJvuJ7S/NrDl
2XVKDcolC2/xi3qNf3N86yHehTdI1sAwPBiIMdGXAHavdqh2j4zg7nOZxoXg0VBM
IwHamQOhU3ktLgp8slc2hq+oRrzWCqyjC6vf2dKZLrpruCI+Fkd938+OhcwqkcEK
QT0rkUWsceOFZIq9q40I44DiHoxnSWoctYGddfFaMGTdK31bbXIRCDns17RDHYbS
rHwMnBq6XpqHVrPQixmSsXIWT5b+sA==
=nxH6
-----END PGP SIGNATURE-----

--x5RQbzFFWBNsTNOT--


