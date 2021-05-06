Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D33375104
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 10:43:23 +0200 (CEST)
Received: from localhost ([::1]:44108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leZbN-0003ee-Vq
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 04:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1leZZk-0002zd-Bx
 for qemu-devel@nongnu.org; Thu, 06 May 2021 04:41:40 -0400
Received: from 9.mo51.mail-out.ovh.net ([46.105.48.137]:42734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1leZZh-0003lu-CA
 for qemu-devel@nongnu.org; Thu, 06 May 2021 04:41:39 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.5])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 4E6FF288D1E;
 Thu,  6 May 2021 10:41:32 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 6 May 2021
 10:41:31 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0013e49f871-4110-410e-8fd8-c83a2fe46aa9,
 A011F864E236C67B2AFE342ECDF08F9E86568858) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 6 May 2021 10:41:30 +0200
From: Greg Kurz <groug@kaod.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH 5/5] target/ppc/kvm: Replace alloca() by g_malloc()
Message-ID: <20210506104130.5f617359@bahia.lan>
In-Reply-To: <20210505170055.1415360-6-philmd@redhat.com>
References: <20210505170055.1415360-1-philmd@redhat.com>
 <20210505170055.1415360-6-philmd@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 81b71a7d-59c2-4d1c-8aa8-7f6a7006e2cf
X-Ovh-Tracer-Id: 12374484402015738159
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdegtddgtdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtqhertdertdejnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevlefhtddufffhieevhefhleegleelgfetffetkedugeehjeffgfehhfefueduffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehkvhhmsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Received-SPF: pass client-ip=46.105.48.137; envelope-from=groug@kaod.org;
 helo=9.mo51.mail-out.ovh.net
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_BL_SPAMCOP_NET=1.347,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "open list:Overall KVM CPUs" <kvm@vger.kernel.org>,
 Kyle Evans <kevans@freebsd.org>, qemu-devel@nongnu.org,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  5 May 2021 19:00:55 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> The ALLOCA(3) man-page mentions its "use is discouraged".
>=20
> Replace it by a g_malloc() call.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  target/ppc/kvm.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 104a308abb5..ae62daddf7d 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -2698,11 +2698,11 @@ int kvmppc_save_htab(QEMUFile *f, int fd, size_t =
bufsize, int64_t max_ns)
>  int kvmppc_load_htab_chunk(QEMUFile *f, int fd, uint32_t index,
>                             uint16_t n_valid, uint16_t n_invalid, Error *=
*errp)
>  {
> -    struct kvm_get_htab_header *buf;
> -    size_t chunksize =3D sizeof(*buf) + n_valid * HASH_PTE_SIZE_64;
> +    size_t chunksize =3D sizeof(struct kvm_get_htab_header)

It is a bit unfortunate to introduce a new dependency on the struct type.

What about the following ?

-    struct kvm_get_htab_header *buf;
+    g_autofree struct kvm_get_htab_header *buf =3D NULL;
     size_t chunksize =3D sizeof(*buf) + n_valid * HASH_PTE_SIZE_64;
     ssize_t rc;
=20
-    buf =3D alloca(chunksize);
+    buf =3D g_malloc(chunksize);


    g_autofree struct kvm_get_htab_header *buf =3D NULL;
    size_t chunksize =3D sizeof(*buf) + n_valid * HASH_PTE_SIZE_64;

> +                       + n_valid * HASH_PTE_SIZE_64;
>      ssize_t rc;
> +    g_autofree struct kvm_get_htab_header *buf =3D g_malloc(chunksize);
> =20
> -    buf =3D alloca(chunksize);
>      buf->index =3D index;
>      buf->n_valid =3D n_valid;
>      buf->n_invalid =3D n_invalid;
> @@ -2741,10 +2741,10 @@ void kvmppc_read_hptes(ppc_hash_pte64_t *hptes, h=
waddr ptex, int n)
>      i =3D 0;
>      while (i < n) {
>          struct kvm_get_htab_header *hdr;
> +        char buf[sizeof(*hdr) + HPTES_PER_GROUP * HASH_PTE_SIZE_64];
>          int m =3D n < HPTES_PER_GROUP ? n : HPTES_PER_GROUP;
> -        char buf[sizeof(*hdr) + m * HASH_PTE_SIZE_64];
> =20
> -        rc =3D read(fd, buf, sizeof(buf));
> +        rc =3D read(fd, buf, sizeof(*hdr) + m * HASH_PTE_SIZE_64);
>          if (rc < 0) {
>              hw_error("kvmppc_read_hptes: Unable to read HPTEs");
>          }


