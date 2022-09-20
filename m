Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3906F5BDC7C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 07:34:33 +0200 (CEST)
Received: from localhost ([::1]:42100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaVtv-0002hd-R1
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 01:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oaVp8-0007aI-Px; Tue, 20 Sep 2022 01:29:34 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:37868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oaVp6-0005wU-Ue; Tue, 20 Sep 2022 01:29:34 -0400
Received: by mail-ej1-x62a.google.com with SMTP id a26so3496037ejc.4;
 Mon, 19 Sep 2022 22:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=E5CYXRUhkGL8C7j/V79FqD1/q2dkBqCAsiH+yU6lV6s=;
 b=Z1WbMHAT0/QUxdQDfBxY88t8bQuYSfkZqnDFxpQIco+NhXwzP0+E7TmMYERiq08U26
 75yT3eCLaG8Jg8Camnj83aP/f8NU2zY9rJr/ZntoufF9OKBZpfQKf0795LNaLL7kGHHE
 iLK6nkiqeXFPlmWnhY0TonDSv4Xw4XfKhUyRvzt1kDQW4bl5Lo0u4aFmzgOQAbz2UgvL
 ibeyHxynuDVhcEOzywzYx8xSXNZVN1LmxfteQ+ioUaHTvsjHbORottp6nkSUh34dtLv8
 ude7tvYtDUIERKgmU8ykJ4wXCUDlj86EdjRLovh6oe0JAgqPQNZl2Vi4rjkhdpxib+eA
 wjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=E5CYXRUhkGL8C7j/V79FqD1/q2dkBqCAsiH+yU6lV6s=;
 b=PNa9X6APW+yjxYh0mat9N5XruE8to2EHOXSzrc5ZIpzCWzPM0BIx4EaSfy0HZ5RnpR
 7xVyuP8mFtMLE6nnI/yDvXxP3kBbRRIc5qmH2GVgVjxIxrPp/Ac9AYZhQxvWKkZxPSr8
 sP/rEiB8k2QQOdCSZMsGpG7OyPOSg4pqVtHPFYgABr3a1s4kRpRwI9k8jfXZi8gyWNo1
 NDHSYIRL0roP3LUn5LVVz7Tq1V9qiXPSOldDd9a1MQjBhyoLgBYL9XUNa3gPwdePJtbL
 5r7tdEimgfwReWHU+AkkUyml96OlYOEseFgihR1smb0r3DDP5iZrYdhVf2LTdH8cbcEo
 hpIA==
X-Gm-Message-State: ACrzQf2OoQF5EG1Uv25hBLKj1/L5Qn5hjbHlT3KvjltJIW232CqZfrhK
 BoSZaq5ksd1hyYvexMHZlAWbgF5MFwk=
X-Google-Smtp-Source: AMsMyM4dXSl73YqZG/WkYWNwsk+wG9Zub5uwn9le6AQGD+V64KBIrPkM00kvmhfqHHd2xG6jvOr8oQ==
X-Received: by 2002:a17:907:968f:b0:774:d10f:a98e with SMTP id
 hd15-20020a170907968f00b00774d10fa98emr15687832ejc.750.1663651770606; 
 Mon, 19 Sep 2022 22:29:30 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-011-222-172.77.11.pool.telefonica.de.
 [77.11.222.172]) by smtp.gmail.com with ESMTPSA id
 n21-20020a5099d5000000b0044e7f40c48esm525886edb.62.2022.09.19.22.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 22:29:30 -0700 (PDT)
Date: Tue, 20 Sep 2022 05:29:25 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_hw/virtio/vhost-shadow-virtqu?=
 =?US-ASCII?Q?eue=3A_Silence_GCC_error_=22maybe-uninitialized=22?=
In-Reply-To: <20220910151117.6665-1-shentey@gmail.com>
References: <20220910151117.6665-1-shentey@gmail.com>
Message-ID: <D1ED14E5-CFF9-4525-96C5-60262DB17309@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
>---

Ping

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


