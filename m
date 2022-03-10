Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCB54D432B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 10:08:53 +0100 (CET)
Received: from localhost ([::1]:60026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSEmz-0006ZE-24
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 04:08:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nSEj9-00052J-9Q
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 04:04:56 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:53035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nSEj7-0000un-EO
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 04:04:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=XYHpPVtOrSAUr3lWFyg+nv6oV3Nc43WWuns1LSWK/pg=; b=b/YtW7emJY8eGFDBaFTWWxnb6C
 7PFMmKWMp83JUwFT51GOOundFtmgfB/0YnVMrh0Ep9pfEZjZL9JcYvbHKTfBEYqkEEdnBrN+kQHJ5
 lf+lcHBKFY81wtQhycHeNYn/ah/it+904nm9M73EZvc+t/28LqLgjY3eHasuIpRmJznpLN7NRnX2C
 hyYJpI4W3s8k24lfrBOCS0RwLZZ2i7hhlDhJ/gYxciLUaZMxCtE1i7bDxyL19EIUI5Aqq+jp19jBl
 3XdBe/3J9/s2lopwCjINLvkpDzFDgw6KH4n1XZBs5FMYV2Gqa9q5QURh96XJzlznwyrRdjhDkqDCo
 jH2ZOXjfK3WU3vrJSSjg/901yA2RQY4FQobRgr2oUUwKArpT7kLbLNDpRn3Rf1IEq4R3W9jcF4XE1
 7VHXpEXjGxzUyue3u65uj+aaoLM6sab7lAX0VnO2ARsXHOdZGdrG4+x2GK6HEKKFSh1o1KMQ14FR4
 97N72hhsjVz5oCa7IVluL8AU4s/yUB9zTB9KWDMziAwKJ2a8Dk+LnqzuAHlAU1D/45KkVuAMork4Y
 lkkzbBnaNd8sAHzHhVyLBAkb0Of1bYsYaaF5QudMOmUYrvii0sRnIA+FVmW1iF5tAPm/KQsTMUqKo
 1vjYZg2KoDkbSKOF8OWJELmz0z21KI5zUAy/mRKmk=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 3/6] tests/9pfs: compare QIDs in fs_walk_none() test
Date: Thu, 10 Mar 2022 10:04:50 +0100
Message-ID: <16470725.T4W6l4s3Qp@silver>
In-Reply-To: <699dea34f26b6f60746a16a35748b65d76515f1a.1646850707.git.qemu_oss@crudebyte.com>
References: <cover.1646850707.git.qemu_oss@crudebyte.com>
 <699dea34f26b6f60746a16a35748b65d76515f1a.1646850707.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mittwoch, 9. M=E4rz 2022 15:49:04 CET Christian Schoenebeck wrote:
> Extend previously added fs_walk_none() test by comparing the QID
> of the root fid with the QID of the cloned fid. They should be
> equal.
>=20
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  tests/qtest/virtio-9p-test.c | 70 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>=20
> diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> index 6c00da03f4..9098e21173 100644
> --- a/tests/qtest/virtio-9p-test.c
> +++ b/tests/qtest/virtio-9p-test.c
> @@ -146,6 +146,11 @@ static void v9fs_uint16_read(P9Req *req, uint16_t *v=
al)
> le16_to_cpus(val);
>  }
>=20
> +static void v9fs_int16_read(P9Req *req, int16_t *val)
> +{
> +    v9fs_uint16_read(req, (uint16_t *)val);
> +}
> +
>  static void v9fs_uint32_write(P9Req *req, uint32_t val)
>  {
>      uint32_t le_val =3D cpu_to_le32(val);
> @@ -166,12 +171,22 @@ static void v9fs_uint32_read(P9Req *req, uint32_t
> *val) le32_to_cpus(val);
>  }
>=20
> +static void v9fs_int32_read(P9Req *req, int32_t *val)
> +{
> +    v9fs_uint32_read(req, (uint32_t *)val);
> +}
> +
>  static void v9fs_uint64_read(P9Req *req, uint64_t *val)
>  {
>      v9fs_memread(req, val, 8);
>      le64_to_cpus(val);
>  }
>=20
> +static void v9fs_int64_read(P9Req *req, int64_t *val)
> +{
> +    v9fs_uint64_read(req, (uint64_t *)val);
> +}
> +
>  /* len[2] string[len] */
>  static uint16_t v9fs_string_size(const char *string)
>  {
> @@ -425,6 +440,40 @@ static void v9fs_rwalk(P9Req *req, uint16_t *nwqid,
> v9fs_qid **wqid) v9fs_req_free(req);
>  }
>=20
> +/* size[4] Tstat tag[2] fid[4] */
> +static P9Req *v9fs_tstat(QVirtio9P *v9p, uint32_t fid, uint16_t tag)
> +{
> +    P9Req *req;
> +
> +    req =3D v9fs_req_init(v9p, 4, P9_TSTAT, tag);
> +    v9fs_uint32_write(req, fid);
> +    v9fs_req_send(req);
> +    return req;
> +}
> +
> +/* size[4] Rstat tag[2] stat[n] */
> +static void v9fs_rstat(P9Req *req, struct V9fsStat *st)
> +{
> +    v9fs_req_recv(req, P9_RSTAT);
> +
> +    v9fs_int16_read(req, &st->size);
> +    v9fs_int16_read(req, &st->type);
> +    v9fs_int32_read(req, &st->dev);
> +    v9fs_uint8_read(req, &st->qid.type);
> +    v9fs_uint32_read(req, &st->qid.version);
> +    v9fs_uint64_read(req, &st->qid.path);
> +    v9fs_int32_read(req, &st->mode);
> +    v9fs_int32_read(req, &st->mtime);
> +    v9fs_int32_read(req, &st->atime);
> +    v9fs_int64_read(req, &st->length);
> +    v9fs_string_read(req, &st->name.size, &st->name.data);
> +    v9fs_string_read(req, &st->uid.size, &st->uid.data);
> +    v9fs_string_read(req, &st->gid.size, &st->gid.data);
> +    v9fs_string_read(req, &st->muid.size, &st->muid.data);
> +
> +    v9fs_req_free(req);
> +}
> +
>  /* size[4] Treaddir tag[2] fid[4] offset[8] count[4] */
>  static P9Req *v9fs_treaddir(QVirtio9P *v9p, uint32_t fid, uint64_t offse=
t,
>                              uint32_t count, uint16_t tag)
> @@ -1009,6 +1058,8 @@ static void fs_walk_none(void *obj, void *data,
> QGuestAllocator *t_alloc) v9fs_qid root_qid;
>      g_autofree v9fs_qid *wqid =3D NULL;
>      P9Req *req;
> +    struct V9fsStat st[2];
> +    int i;
>=20
>      do_version(v9p);
>      req =3D v9fs_tattach(v9p, 0, getuid(), 0);
> @@ -1021,6 +1072,25 @@ static void fs_walk_none(void *obj, void *data,
> QGuestAllocator *t_alloc)
>=20
>      /* special case: no QID is returned if nwname=3D0 was sent */
>      g_assert(wqid =3D=3D NULL);
> +
> +    req =3D v9fs_tstat(v9p, 0, 0);
> +    v9fs_req_wait_for_reply(req, NULL);
> +    v9fs_rstat(req, &st[0]);

Probably stat-ing the root fid (0) should happen before sending Twalk, to=20
better counter the 1st fid (0) having become potentially mutated?

> +
> +    req =3D v9fs_tstat(v9p, 1, 0);
> +    v9fs_req_wait_for_reply(req, NULL);
> +    v9fs_rstat(req, &st[1]);
> +
> +    /* don't compare QID version for checking for file ID equalness */
> +    g_assert(st[0].qid.type =3D=3D st[1].qid.type);
> +    g_assert(st[0].qid.path =3D=3D st[1].qid.path);

I could add a helper function is_same_qid() for this if desired.

> +
> +    for (i =3D 0; i < 2; ++i) {
> +        g_free(st[i].name.data);
> +        g_free(st[i].uid.data);
> +        g_free(st[i].gid.data);
> +        g_free(st[i].muid.data);
> +    }

I didn't find a more elegant way to do this cleanup.

>  }
>=20
>  static void fs_walk_dotdot(void *obj, void *data, QGuestAllocator *t_all=
oc)



