Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3EE4D42F1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 09:58:56 +0100 (CET)
Received: from localhost ([::1]:51174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSEdL-0008Um-H5
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 03:58:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nSEby-0007nw-Va
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 03:57:30 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:37845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nSEbx-0008Su-2v
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 03:57:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=g0i+voTzspj7zyyJiYVb30vvdQY54uMm3YOlErqOxCw=; b=jXA+rQNe8Ul3gyL4/g/b0NWsKI
 tKJ63ijyA0u8Tr5TnbCk2T3tGPXe+llzcNAH8fO1r01sD3kPV9YbBRKnqeW4ZD8Xtg8DWxhw6FGSP
 CM5567NH/Rx2VkUPPSbd95VpgE9CQfFN7VfTy6xEN8eivH5LKkFBLFJONKj5MHkshDnYPC+SBpYKt
 ct0HS2to84turT9deHwih59emumdHyVbXDAKpiw5RdrI73U+bt5YxhEqfilZXc/OLU3NanwBGMJiw
 0WCDzxPBQ3gzVbWemH7nahJqbCm4FUP2RVWRP+bCAUeToSMr8A5WFVBKUF74t01KYMfG7DVEpzfTd
 TMZiybxbbO+Waq5v1+qikR26RNn1BOEcOFcdYNY9K6jHqfm79O3IETCIrEizExpthfAbddHf27M5z
 3m9WOl3CP9IkrYQKDVlB/xrecDf6PRnI/7RyWGIMCW3MwIEJ4ZFKj5cVpoS7MbcGAUHXzX49/LNHe
 5O3WkTiEcxDJ38m/DWfrGVUPDypa4uC1ncJluuwstrG7uxmL5zsgK1ebZnQVIqj+iFI2FgETloSnL
 vU3NxK4YuK+VHDrMl3dhWUJ34hV1bCPARdFf4WSVLLDvBFThhNAQz9nNb3sWLVxL3cNnEvd7NZFF8
 55F5ZZ40LevYl0tjKCCUE5bg1J/8uuxDiCkC0G+KI=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 2/6] tests/9pfs: Twalk with nwname=0
Date: Thu, 10 Mar 2022 09:57:25 +0100
Message-ID: <22257136.YvWK5Ti9pE@silver>
In-Reply-To: <f19d6f5fd2b569ebac797f18849710eb22c40984.1646850707.git.qemu_oss@crudebyte.com>
References: <cover.1646850707.git.qemu_oss@crudebyte.com>
 <f19d6f5fd2b569ebac797f18849710eb22c40984.1646850707.git.qemu_oss@crudebyte.com>
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

On Mittwoch, 9. M=E4rz 2022 14:24:24 CET Christian Schoenebeck wrote:
> Send Twalk request with nwname=3D0. In this case no QIDs should
> be returned by 9p server; this is equivalent to walking to dot.
>=20
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  tests/qtest/virtio-9p-test.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> index 22bdd74bc1..6c00da03f4 100644
> --- a/tests/qtest/virtio-9p-test.c
> +++ b/tests/qtest/virtio-9p-test.c
> @@ -1002,6 +1002,27 @@ static void fs_walk_nonexistent(void *obj, void
> *data, QGuestAllocator *t_alloc) do_walk_expect_error(v9p, "non-existent",
> ENOENT);
>  }
>=20
> +static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc)
> +{

Or maybe calling this function fs_walk_clone_fid and the test case name
"synth/walk/clone_fid" respectively instead?

> +    QVirtio9P *v9p =3D obj;
> +    alloc =3D t_alloc;
> +    v9fs_qid root_qid;
> +    g_autofree v9fs_qid *wqid =3D NULL;
> +    P9Req *req;
> +
> +    do_version(v9p);
> +    req =3D v9fs_tattach(v9p, 0, getuid(), 0);
> +    v9fs_req_wait_for_reply(req, NULL);
> +    v9fs_rattach(req, &root_qid);
> +
> +    req =3D v9fs_twalk(v9p, 0, 1, 0, NULL, 0);
> +    v9fs_req_wait_for_reply(req, NULL);
> +    v9fs_rwalk(req, NULL, &wqid);
> +
> +    /* special case: no QID is returned if nwname=3D0 was sent */
> +    g_assert(wqid =3D=3D NULL);
> +}
> +
>  static void fs_walk_dotdot(void *obj, void *data, QGuestAllocator *t_all=
oc)
> {
>      QVirtio9P *v9p =3D obj;
> @@ -1435,6 +1456,7 @@ static void register_virtio_9p_test(void)
>      qos_add_test("synth/walk/basic", "virtio-9p", fs_walk,  &opts);
>      qos_add_test("synth/walk/no_slash", "virtio-9p", fs_walk_no_slash,
>                    &opts);
> +    qos_add_test("synth/walk/none", "virtio-9p", fs_walk_none, &opts);
>      qos_add_test("synth/walk/dotdot_from_root", "virtio-9p",
>                   fs_walk_dotdot,  &opts);
>      qos_add_test("synth/walk/non_existent", "virtio-9p", fs_walk_nonexis=
tent,



