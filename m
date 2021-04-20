Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B91C836609F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 22:09:27 +0200 (CEST)
Received: from localhost ([::1]:38840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYwgX-00058J-9N
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 16:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYwaP-000415-Cc; Tue, 20 Apr 2021 16:03:05 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:40085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYwaN-0001Xw-0e; Tue, 20 Apr 2021 16:03:05 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 948B93E5C;
 Tue, 20 Apr 2021 16:03:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 20 Apr 2021 16:03:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=dLoW0jIS4gl1ASNAWnIA6/NGh0N
 ++9bpaPUneN+Cqbw=; b=nY1SmHp7Y7qneUMpzQQq2KUK23rDnhz7CeCFMUyhtjP
 bFm4zonTZcZyMdtRVgTii0z09wLzwf7+uWgRqxjWrw9jpx/oeAY0YNo/Y5N0hMHO
 jyKV8Xmw/40KYbApt+bBJuuxgzy9ZlerYlF0qxw2a7UNe/C+HRtuHOzxTDtAghgD
 KHY94pQ3DTCkplr+V1gymW01AXYyvU/Qp/+4sgXIzUsYWLADdyPgd1AfjVQE5VW/
 68ol81/pndrIqPPc+3bSPufHg6jW5mG8+Zg7PCKAxiNcNmNg+RLlcIGpfDiDjZp+
 9sc5ZUWmz5BQGiKHnc9K625zL8jCY0Y8rUtqkefmjkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=dLoW0j
 IS4gl1ASNAWnIA6/NGh0N++9bpaPUneN+Cqbw=; b=nWQrF0QaA3RpfGNpwdAXHe
 rl4lE9ekYgjn5qwrSDB6Y8XIS3sIYEZMTCWYfXvfZEqRW8QZ7n3rbxIz4+ZsTXmm
 fyKp9rxZSRg7mz6pcH5seniPYnHrim4+2tizjGEwoYRqvKCvVR1Vct5CpDqN+QUb
 jjC0dWbc/uQM4tx6ZYr5Tr+xvZPZ8X97pJz7I4OBZ7tAcyAnUAEJIh7qX3DOjRH6
 CWhkYCd/0VgLoRfNpHKf7fTNA1XvarlFlBgqDOM49k5fecKeyn8MMot0pRCDVUtD
 bQIHAQqLkG89UMm3I+aENx8eXYfrBMPgWBeTqwM9q3oRA54pCbEOTJWXuJJuR7sA
 ==
X-ME-Sender: <xms:cjN_YGq-A8wd_m07ju0R_3JfjaeJh-8Pv22ovtwen13EsZITCdqGSQ>
 <xme:cjN_YEprWfgrbTR6OWEDYLyRWez0DXo842Z3RK46tUQhnpa-PZQeAcnwM5vdlFXG0
 9vSlBX6qCkoZaHQKKY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtiedgudegjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgeduffeuieetkeeileekvdeule
 etveejudeileduffefjeegfffhuddvudffkeenucfkphepkedtrdduieejrdelkedrudel
 tdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:cjN_YLOCDyC6vGFhLF03-ZTxyxxLyKj8eyL3Q5RTwP6moGkDtPIn-A>
 <xmx:cjN_YF7k7pGvWy-q137_BKQ3Yjrig9FXqwKOikm0HCCqJFd-HUN2uQ>
 <xmx:cjN_YF50zwpCpP2ZIu_e9tCDryUbnsJ4wWmAzSIY8RTNN-lC54ru5Q>
 <xmx:dDN_YCuS5YdXi4TfVYJ0dnpq6mV3v-mMwBnEK7IMeAZnMAXVPojYww>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id EEB9724005A;
 Tue, 20 Apr 2021 16:02:56 -0400 (EDT)
Date: Tue, 20 Apr 2021 22:02:55 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH] hw/block/nvme: fix io-command set profile feature
Message-ID: <YH8zb4swobK1hKVQ@apples.localdomain>
References: <CGME20210419105126epcas5p4b8c4ed2a308b2cee570570485b7b5c89@epcas5p4.samsung.com>
 <20210419104832.25455-1-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AA5sU9uJ6v9sFh2H"
Content-Disposition: inline
In-Reply-To: <20210419104832.25455-1-anaidu.gollu@samsung.com>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--AA5sU9uJ6v9sFh2H
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 19 16:18, Gollu Appalanaidu wrote:
>Currently IO Command Set Profile feaure is supported, but
>feature support flag not set and this feature is changable
>add support for that.
>
>Remove filling default value of feature in CQE CDW0 with zero,
>since it fallbacks to default case and it is zero initialized,
>if feature default value not set explicitly.
>
>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>---
> hw/block/nvme.c | 5 ++---
> 1 file changed, 2 insertions(+), 3 deletions(-)
>
>diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>index 624a1431d0..b5d2c29fc4 100644
>--- a/hw/block/nvme.c
>+++ b/hw/block/nvme.c
>@@ -185,6 +185,7 @@ static const bool nvme_feature_support[NVME_FID_MAX] =
=3D {
>     [NVME_WRITE_ATOMICITY]          =3D true,
>     [NVME_ASYNCHRONOUS_EVENT_CONF]  =3D true,
>     [NVME_TIMESTAMP]                =3D true,
>+    [NVME_COMMAND_SET_PROFILE]      =3D true,
> };
>
> static const uint32_t nvme_feature_cap[NVME_FID_MAX] =3D {
>@@ -194,6 +195,7 @@ static const uint32_t nvme_feature_cap[NVME_FID_MAX] =
=3D {
>     [NVME_NUMBER_OF_QUEUES]         =3D NVME_FEAT_CAP_CHANGE,
>     [NVME_ASYNCHRONOUS_EVENT_CONF]  =3D NVME_FEAT_CAP_CHANGE,
>     [NVME_TIMESTAMP]                =3D NVME_FEAT_CAP_CHANGE,
>+    [NVME_COMMAND_SET_PROFILE]      =3D NVME_FEAT_CAP_CHANGE,
> };
>
> static const uint32_t nvme_cse_acs[256] =3D {
>@@ -4707,9 +4709,6 @@ defaults:
>             result |=3D NVME_INTVC_NOCOALESCING;
>         }
>         break;
>-    case NVME_COMMAND_SET_PROFILE:
>-        result =3D 0;
>-        break;
>     default:
>         result =3D nvme_feature_default[fid];
>         break;
>--=20
>2.17.1
>

Applied to nvme-next. Thanks!

--AA5sU9uJ6v9sFh2H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmB/M24ACgkQTeGvMW1P
DelfrQgAgsyqtoyhdA1XF9uXSfmsqw/3MGh44roATP2YaajNTVmr4LiLmJVRUsE0
eG4Xs2SCc2DYvGuu1rVfV+trjclgJbdzPOFz18ma0vQhxhTjqH+lWgsjTIFjnKUa
/O4G8+n6ojGaWGWxn7kSl2sLZYmcxUTJ5V4HnZ5I3Zrra/4hWN8X1tPr3A+6xO9z
nmq1qeJIgatrEaWdnkJCfkTz8Fb84vbOKPluFNkucPDF56+vhwh4CTKVRqEsp/6h
asmUJo4Q1y+WsX4hI/ov1hsHRd/iK6jmnrq01xY9khThoM8ENEt2WGo8qRzd6Lrb
yzMT9IFTQJdl1m5lHFYxISy0nKHNmg==
=WDLP
-----END PGP SIGNATURE-----

--AA5sU9uJ6v9sFh2H--

