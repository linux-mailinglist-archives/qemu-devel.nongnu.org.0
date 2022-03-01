Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7924C9881
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:48:08 +0100 (CET)
Received: from localhost ([::1]:37208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPBHr-0005z8-46
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:48:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nPBBC-00012g-Ef; Tue, 01 Mar 2022 17:41:19 -0500
Received: from [2a00:1450:4864:20::631] (port=39716
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nPBBA-0000DJ-W4; Tue, 01 Mar 2022 17:41:14 -0500
Received: by mail-ej1-x631.google.com with SMTP id dr20so9710109ejc.6;
 Tue, 01 Mar 2022 14:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=3PtXf/9ZSY2ea9Bml0tzGkk/SKwBueuVvD35fewJcYE=;
 b=GVKblIZZt4wVCK4XvGxXV13bYrvwUpAdVCmSyi5xf9SI+kDQA54XS14OSYlsUlh7xQ
 FYNpxP/SaPfgfRqvDXpujE5wYsXHsocaD2CWVa3gEeM81PU9dDJbGwjE7g264aqCyZdU
 LgpmhQ6p7OJEc/GsVyRSlrOaT3kjyBaFTgkfqSxh7IWNLyAIa8Bt9xp9mKpSJrIwV2Mt
 vP6ayEEoIxB7VkbC3ygKvyq/mUeUVlkRCk0428ISUswFHwETQREa3dxzbZiEFA9IUulA
 rQxuIhdt3D6Ak5VaelFi5dV3xe6fztZNzzahuZ/eweHcxTKUTV7pHxPTTwtGRVmMLMmT
 snOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=3PtXf/9ZSY2ea9Bml0tzGkk/SKwBueuVvD35fewJcYE=;
 b=KKC7d1tcj3HKrnuF6N2hLn52YHUBbyC90QrP/b5Tm9WFfTRDvexQ+QGirfSguYq49Y
 OTIBGKx4EvHg7TstBtgc02jnT6AyPD6hkvyz33U78dQC6QsPBltz9s+umSX0qVwfm8DO
 n8uIFvHV+8Qlh78SNXVgtmLKj17ot1izSD9DnszvZYYVtRZ2rPAePXntdTbEPongRqRO
 ZIuZeW/pMhxaxn64ko9Ev7LOt8Jz2N3y5wEMarkCpOrCdmP5gnN/FeZHYGlt2aqREJfm
 WqNmxkMkVq/9ZA9Fuhp3jhufkIEqet232gmZcO2G4ZMcy0mYRNjazZreDqZmDzN15qPY
 v1sg==
X-Gm-Message-State: AOAM531iA/W+9yCCAZ+ykCYL3GmroMfj87MlH5Yg/JUksplPUT5fn65y
 TRIWlXwicQG8VXBKExj4HhGtkWIrgd0=
X-Google-Smtp-Source: ABdhPJzjlHzGJDG+hzlOEj/k/57VXINwqS/brdLhT6Hi1rN5DOA6hhaB2PaQhe8rCH4v8BQGF8oHeg==
X-Received: by 2002:a17:907:75fc:b0:6d5:c6bd:6fbd with SMTP id
 jz28-20020a17090775fc00b006d5c6bd6fbdmr20845377ejc.695.1646174470724; 
 Tue, 01 Mar 2022 14:41:10 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-055-004-046.78.55.pool.telefonica.de.
 [78.55.4.46]) by smtp.gmail.com with ESMTPSA id
 cc20-20020a0564021b9400b00412f2502469sm7651548edb.23.2022.03.01.14.41.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Mar 2022 14:41:10 -0800 (PST)
Date: Tue, 01 Mar 2022 22:41:06 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RESEND=5D_virtio/virtio-ballo?=
 =?US-ASCII?Q?on=3A_Prefer_Object*_over_void*_parameter?=
In-Reply-To: <20220301222301.103821-1-shentey@gmail.com>
References: <20220301222301.103821-1-shentey@gmail.com>
Message-ID: <5208672E-35E6-49DE-9CB7-EE691D9D2A2E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 1=2E M=C3=A4rz 2022 22:23:00 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>*opaque is an alias to *obj=2E Using the ladder makes the code consistent=
 with
>with other devices, e=2Eg=2E accel/kvm/kvm-all and accel/tcg/tcg-all=2E I=
t also
>makes the cast more typesafe=2E
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>Reviewed-by: David Hildenbrand <david@redhat=2Ecom>
>---
> hw/virtio/virtio-balloon=2Ec | 10 +++++-----
> 1 file changed, 5 insertions(+), 5 deletions(-)
>
>diff --git a/hw/virtio/virtio-balloon=2Ec b/hw/virtio/virtio-balloon=2Ec
>index e6c1b0aa46=2E=2E163d244eb4 100644
>--- a/hw/virtio/virtio-balloon=2Ec
>+++ b/hw/virtio/virtio-balloon=2Ec
>@@ -242,7 +242,7 @@ static void balloon_stats_get_all(Object *obj, Visito=
r *v, const char *name,
>                                   void *opaque, Error **errp)
> {
>     Error *err =3D NULL;
>-    VirtIOBalloon *s =3D opaque;
>+    VirtIOBalloon *s =3D VIRTIO_BALLOON(obj);
>     int i;
>=20
>     if (!visit_start_struct(v, name, NULL, 0, &err)) {
>@@ -277,7 +277,7 @@ static void balloon_stats_get_poll_interval(Object *o=
bj, Visitor *v,
>                                             const char *name, void *opaq=
ue,
>                                             Error **errp)
> {
>-    VirtIOBalloon *s =3D opaque;
>+    VirtIOBalloon *s =3D VIRTIO_BALLOON(obj);
>     visit_type_int(v, name, &s->stats_poll_interval, errp);
> }
>=20
>@@ -285,7 +285,7 @@ static void balloon_stats_set_poll_interval(Object *o=
bj, Visitor *v,
>                                             const char *name, void *opaq=
ue,
>                                             Error **errp)
> {
>-    VirtIOBalloon *s =3D opaque;
>+    VirtIOBalloon *s =3D VIRTIO_BALLOON(obj);
>     int64_t value;
>=20
>     if (!visit_type_int(v, name, &value, errp)) {
>@@ -1015,12 +1015,12 @@ static void virtio_balloon_instance_init(Object *=
obj)
>     s->free_page_hint_notify=2Enotify =3D virtio_balloon_free_page_hint_=
notify;
>=20
>     object_property_add(obj, "guest-stats", "guest statistics",
>-                        balloon_stats_get_all, NULL, NULL, s);
>+                        balloon_stats_get_all, NULL, NULL, NULL);
>=20
>     object_property_add(obj, "guest-stats-polling-interval", "int",
>                         balloon_stats_get_poll_interval,
>                         balloon_stats_set_poll_interval,
>-                        NULL, s);
>+                        NULL, NULL);
> }
>=20
> static const VMStateDescription vmstate_virtio_balloon =3D {

No changes=2E Just also CC'ed to qemu-trivial=2E

