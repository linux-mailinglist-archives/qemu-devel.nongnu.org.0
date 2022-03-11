Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E1C4D608F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 12:27:50 +0100 (CET)
Received: from localhost ([::1]:40804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSdQz-0001t8-0V
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 06:27:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nSdP5-00014l-Fb
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 06:25:51 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:43584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nSdOv-0001Ue-BQ
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 06:25:44 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-HyRID87vNCKylbYDJdmZPA-1; Fri, 11 Mar 2022 06:25:28 -0500
X-MC-Unique: HyRID87vNCKylbYDJdmZPA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC47D1091DA2;
 Fri, 11 Mar 2022 11:25:26 +0000 (UTC)
Received: from bahia (unknown [10.39.192.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC502797E3;
 Fri, 11 Mar 2022 11:25:25 +0000 (UTC)
Date: Fri, 11 Mar 2022 12:25:24 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 1/6] tests/9pfs: walk to non-existent dir
Message-ID: <20220311122524.061a7b46@bahia>
In-Reply-To: <62e8103d249fcdb03ad6c706840579a075333398.1646850707.git.qemu_oss@crudebyte.com>
References: <cover.1646850707.git.qemu_oss@crudebyte.com>
 <62e8103d249fcdb03ad6c706840579a075333398.1646850707.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Mar 2022 13:18:50 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> Expect ENOENT Rlerror response when trying to walk to a
> non-existent directory.
>=20
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  tests/qtest/virtio-9p-test.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> index 01ca076afe..22bdd74bc1 100644
> --- a/tests/qtest/virtio-9p-test.c
> +++ b/tests/qtest/virtio-9p-test.c
> @@ -606,6 +606,25 @@ static uint32_t do_walk(QVirtio9P *v9p, const char *=
path)
>      return fid;
>  }
> =20
> +/* utility function: walk to requested dir and expect passed error respo=
nse */
> +static void do_walk_expect_error(QVirtio9P *v9p, const char *path, uint3=
2_t err)
> +{
> +    char **wnames;
> +    P9Req *req;
> +    uint32_t _err;
> +    const uint32_t fid =3D genfid();
> +
> +    int nwnames =3D split(path, "/", &wnames);
> +
> +    req =3D v9fs_twalk(v9p, 0, fid, nwnames, wnames, 0);
> +    v9fs_req_wait_for_reply(req, NULL);
> +    v9fs_rlerror(req, &_err);
> +
> +    g_assert_cmpint(_err, =3D=3D, err);
> +
> +    split_free(&wnames);
> +}
> +
>  static void fs_version(void *obj, void *data, QGuestAllocator *t_alloc)
>  {
>      alloc =3D t_alloc;
> @@ -974,6 +993,15 @@ static void fs_walk_no_slash(void *obj, void *data, =
QGuestAllocator *t_alloc)
>      g_free(wnames[0]);
>  }
> =20
> +static void fs_walk_nonexistent(void *obj, void *data, QGuestAllocator *=
t_alloc)
> +{
> +    QVirtio9P *v9p =3D obj;
> +    alloc =3D t_alloc;
> +
> +    do_attach(v9p);
> +    do_walk_expect_error(v9p, "non-existent", ENOENT);
> +}
> +
>  static void fs_walk_dotdot(void *obj, void *data, QGuestAllocator *t_all=
oc)
>  {
>      QVirtio9P *v9p =3D obj;
> @@ -1409,6 +1437,8 @@ static void register_virtio_9p_test(void)
>                    &opts);
>      qos_add_test("synth/walk/dotdot_from_root", "virtio-9p",
>                   fs_walk_dotdot,  &opts);
> +    qos_add_test("synth/walk/non_existent", "virtio-9p", fs_walk_nonexis=
tent,
> +                  &opts);
>      qos_add_test("synth/lopen/basic", "virtio-9p", fs_lopen,  &opts);
>      qos_add_test("synth/write/basic", "virtio-9p", fs_write,  &opts);
>      qos_add_test("synth/flush/success", "virtio-9p", fs_flush_success,


