Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 441F85B48C0
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Sep 2022 22:21:57 +0200 (CEST)
Received: from localhost ([::1]:53638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oX6zD-0008Ir-UB
	for lists+qemu-devel@lfdr.de; Sat, 10 Sep 2022 16:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oX6y2-0006nX-4k; Sat, 10 Sep 2022 16:20:43 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:44595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oX6y0-0003ss-GP; Sat, 10 Sep 2022 16:20:41 -0400
Received: by mail-ed1-x534.google.com with SMTP id t5so7347426edc.11;
 Sat, 10 Sep 2022 13:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=8SkgFcyHTx5PG0No+rZdbUWbc0oOZ3PzWtLyAPABCek=;
 b=MOF239z/7iNdGM4XKI7Wi/W+3AVbJAidXkeI5ygs4wI3XsJLSJITyw99lvL9t4QmjJ
 86fWe08jQ/xCfM3sNHj1gCjWf2RwMKcnkDB9V1RJHqW8qySk8hTlh/8tC18/blMbEDzF
 7eTP/TJOszqscqzDbKS7BDnFgWhyXDiofE+D69wM7MH5g7oFsaa3lToEQOHiLDI1c/cr
 q5j6td6zr5B8fYE4XDmERbTq9iMiH4GJ7396MgERnRMeGhe7OHEwIZ/0abf9xU2gSDpL
 kEQNv6nq5sfmLJ4OdVge1qWq+4X90I/kvDTSoqkh6jZXeuwOl0P4NMkROvzVkFvwWlsv
 PWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8SkgFcyHTx5PG0No+rZdbUWbc0oOZ3PzWtLyAPABCek=;
 b=axHXEYLBGxgnZKcgtEKejdjDGADI9w+Qcr1zzDdvENoRhhsAFSFZOeszTjqs5/lVvw
 dAJwCogvKodascl70d2NjiugYSGoofNRMvQXUlTCQW4PVh+ZpyE/3crp+8m6ncOJM82n
 8G/uQOj20P64jIQd/iihCAcolNZcUUlqcxHzneYxzJjZXu1nbULDNCZ+wY2dIRHb/bl1
 LKFI+RvgPs0e6zhYzR/WrsILhurYKYAi/lXrHDdFLeA4lf1yQAEjlg/D3gpEEvcVgOPy
 u1JIPgPfMlHw5FDc0QmrEwgyn9uE4sJE93GFcNRtlrz2jGjwX+AuzJpHHocRU8r6/bnr
 QA2g==
X-Gm-Message-State: ACgBeo3OBbmoRT/x/CEDK3U5eO/vxG2O2VdEmjnTXmOUeYcCvUdpf3Pn
 iKpl4v8HMEAT5j/7MRjcU0yeN9+dIMM=
X-Google-Smtp-Source: AA6agR6bnXflL96pkjJWjLDAJLCQicVrG6RNRiwuxGXRQUg7kr8KDtx5+PrsmRZwWlXop1bct/YYMQ==
X-Received: by 2002:a05:6402:84c:b0:44d:6274:ab66 with SMTP id
 b12-20020a056402084c00b0044d6274ab66mr16174696edz.239.1662841237298; 
 Sat, 10 Sep 2022 13:20:37 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-012-029-149.89.12.pool.telefonica.de.
 [89.12.29.149]) by smtp.gmail.com with ESMTPSA id
 eu16-20020a170907299000b0073872f367cesm2078410ejc.112.2022.09.10.13.20.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Sep 2022 13:20:36 -0700 (PDT)
Date: Sat, 10 Sep 2022 20:20:26 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_hw/virtio/vhost-shadow-virtqu?=
 =?US-ASCII?Q?eue=3A_Silence_GCC_error_=22maybe-uninitialized=22?=
In-Reply-To: <20220910151117.6665-1-shentey@gmail.com>
References: <20220910151117.6665-1-shentey@gmail.com>
Message-ID: <52E205FD-5EE7-4DF5-878F-693165AE049A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Am 10=2E September 2022 15:11:17 UTC schrieb Bernhard Beschow <shentey@gmai=
l=2Ecom>:
>GCC issues a false positive warning, resulting in build failure with -Wer=
ror:
>
>  In file included from /usr/include/glib-2=2E0/glib=2Eh:114,
>                   from src/include/glib-compat=2Eh:32,
>                   from src/include/qemu/osdep=2Eh:144,
>                   from =2E=2E/src/hw/virtio/vhost-shadow-virtqueue=2Ec:1=
0:
>  In function =E2=80=98g_autoptr_cleanup_generic_gfree=E2=80=99,
>      inlined from =E2=80=98vhost_handle_guest_kick=E2=80=99 at =2E=2E/sr=
c/hw/virtio/vhost-shadow-virtqueue=2Ec:292:42:
>  /usr/include/glib-2=2E0/glib/glib-autocleanups=2Eh:28:3: error: =E2=80=
=98elem=E2=80=99 may be used uninitialized [-Werror=3Dmaybe-uninitialized]
>     28 |   g_free (*pp);
>        |   ^~~~~~~~~~~~
>  =2E=2E/src/hw/virtio/vhost-shadow-virtqueue=2Ec: In function =E2=80=98v=
host_handle_guest_kick=E2=80=99:
>  =2E=2E/src/hw/virtio/vhost-shadow-virtqueue=2Ec:292:42: note: =E2=80=98=
elem=E2=80=99 was declared here
>    292 |             g_autofree VirtQueueElement *elem;
>        |                                          ^~~~
>  cc1: all warnings being treated as errors
>
>There is actually no problem since "elem" is initialized in both branches=
=2E
>Silence the warning by initializig it with "NULL"=2E
>
>$ gcc --version
>gcc (GCC) 12=2E2=2E0
>
>Fixes: 9c2ab2f1ec333be8614cc12272d4b91960704dbe ("vhost: stop transfer el=
em ownership in vhost_handle_guest_kick")
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>

Forgot to add from v1:

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>

>---
> hw/virtio/vhost-shadow-virtqueue=2Ec | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/hw/virtio/vhost-shadow-virtqueue=2Ec b/hw/virtio/vhost-shado=
w-virtqueue=2Ec
>index e8e5bbc368=2E=2E596d4434d2 100644
>--- a/hw/virtio/vhost-shadow-virtqueue=2Ec
>+++ b/hw/virtio/vhost-shadow-virtqueue=2Ec
>@@ -289,7 +289,7 @@ static void vhost_handle_guest_kick(VhostShadowVirtqu=
eue *svq)
>         virtio_queue_set_notification(svq->vq, false);
>=20
>         while (true) {
>-            g_autofree VirtQueueElement *elem;
>+            g_autofree VirtQueueElement *elem =3D NULL;
>             int r;
>=20
>             if (svq->next_guest_avail_elem) {


