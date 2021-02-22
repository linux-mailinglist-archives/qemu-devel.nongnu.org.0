Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B00C321E0B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:25:44 +0100 (CET)
Received: from localhost ([::1]:38948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEExr-0005On-8U
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEEvA-0002nD-CK
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:22:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEEv7-0006Dm-Ki
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:22:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614014572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oouKPZs8pq2lx21fWh+eIfJMlmw4PZdr5KNUx+8muhk=;
 b=RfNoLqCh549X5zexjVk9u/IR6trXW6EdxsdxfRayI+Ws0FnX57NCXpURR0WhjK4TeFlaGo
 mv3REzFVAR1VFP1OnhDL6irB36NU/1xHfuRi+miPLb+6AMai7aHgx3Y6zKYNY9GMmet5B6
 4UZzDw1N6no2paJXboLEdBTuD6CXH/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-SdLlWqz1N-OiRXeFkxkIWA-1; Mon, 22 Feb 2021 12:22:49 -0500
X-MC-Unique: SdLlWqz1N-OiRXeFkxkIWA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4D90AFA80;
 Mon, 22 Feb 2021 17:22:47 +0000 (UTC)
Received: from localhost (ovpn-112-255.ams2.redhat.com [10.36.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C46310013DB;
 Mon, 22 Feb 2021 17:22:44 +0000 (UTC)
Date: Mon, 22 Feb 2021 17:22:43 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jiahui Cen <cenjiahui@huawei.com>
Subject: Re: [PATCH v5 1/9] qapi/block-core: Add retry option for error action
Message-ID: <YDPoY4IbSa8XdIiC@stefanha-x1.localdomain>
References: <20210205101315.13042-1-cenjiahui@huawei.com>
 <20210205101315.13042-2-cenjiahui@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210205101315.13042-2-cenjiahui@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ImTbIprp6oO5BOFS"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, zhang.zhanghailiang@huawei.com,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 fangying1@huawei.com, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ImTbIprp6oO5BOFS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 05, 2021 at 06:13:07PM +0800, Jiahui Cen wrote:
> Add a new error action 'retry' to support retry on errors.
>=20
> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> ---
>  blockdev.c           | 2 ++
>  qapi/block-core.json | 9 +++++++--
>  2 files changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/blockdev.c b/blockdev.c
> index b250b9b959..ece1d8ae58 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -342,6 +342,8 @@ static int parse_block_error_action(const char *buf, =
bool is_read, Error **errp)
>          return BLOCKDEV_ON_ERROR_STOP;
>      } else if (!strcmp(buf, "report")) {
>          return BLOCKDEV_ON_ERROR_REPORT;
> +    } else if (!strcmp(buf, "retry")) {
> +        return BLOCKDEV_ON_ERROR_RETRY;
>      } else {
>          error_setg(errp, "'%s' invalid %s error action",
>                     buf, is_read ? "read" : "write");
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 9f555d5c1d..30ea43cb77 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -1143,10 +1143,13 @@
>  #
>  # @auto: inherit the error handling policy of the backend (since: 2.7)
>  #
> +# @retry: for guest operations, retry the failing request; (since: 6.0)
> +#         for jobs, not supported

Does this mean block_job_error_action() can now reach abort() in switch
(on_err)? If yes, please add a check that reports an error when "retry"
is specified so that abort() cannot be reached.

Stefan

--ImTbIprp6oO5BOFS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAz6GMACgkQnKSrs4Gr
c8j1iAf/abbjW9CXRnOW9T6rhkMULnaIp0rDvjfYoJYmZmGsDAqoJ5JZ3vVt8gS+
PJEONRndHxJhT+d2uOSy6cFoJL5wLSw/+Zn1pjwwcsKON81KHeOZ4sMWZ6q6IPBS
tS18vIeYanLXPYCD9+PDtZfr4NgwZdmU5DIVK1279VnHVIuyws486xZ0BptMojHm
ZOsEmbKILds988RHyd1cZRrDBfIOH1SsoSBoW4Y1b8fofy1t05Ovc9wtzzCC3Xhx
Zonj923e2e8gQn6X3DJVDtTZyJ64OaGBExLccWKb2ckkzrAfUihED0UWO54knq0l
GbbB34B4qtYw4nMoKwgQ6jdURRnI6g==
=iScn
-----END PGP SIGNATURE-----

--ImTbIprp6oO5BOFS--


