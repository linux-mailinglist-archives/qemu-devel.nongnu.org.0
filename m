Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6175ED010
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 00:11:38 +0200 (CEST)
Received: from localhost ([::1]:50876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odInh-0005EA-CT
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 18:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1odIkS-0001Ra-Lr; Tue, 27 Sep 2022 18:08:18 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:36358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1odIkQ-0003MD-Hl; Tue, 27 Sep 2022 18:08:16 -0400
Received: by mail-ej1-x630.google.com with SMTP id 13so23514668ejn.3;
 Tue, 27 Sep 2022 15:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=LSsZ7Zzodm+J4AdIzVzrt59xtXzFIQYAp4B1mMdCnlg=;
 b=LPeWtOvHCHtcV3r8r6TSpSuv4ZSQP9jOAQvZi1WC35/SHJW7rkkI2ClNC+Uh6n557X
 6Ljm9g3AULCm+twQjljeRuT/o4TBWXSf5LfE+6RuMDQZQqpLqn4ndZx9BN9ySdCXD4g3
 39ebMnDUC22Wrzf6BvzV+IuEod0BGSHs1bsPxHedtCwqbuDNinXmpTPOr5ImL3QuxNds
 u93mH6i3VKiGarfuwGuk9m9sg7GfiVdwQCs/LFgb3ttO7ki3Er8zI/cX3TMQXYsKHX1N
 Tf5zNphkLpLuYXxf/qzFIqEQ+GX545ZjaO+LMJCECbsZiORLCXlrLyS/Up0BmehPh6Dp
 aueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=LSsZ7Zzodm+J4AdIzVzrt59xtXzFIQYAp4B1mMdCnlg=;
 b=ZN6RgnWQgYunN1C56spYOE82bTGPxq0y9OYjnZ9aJJXSOhXXOy+Nr2nztC1HXxnlSd
 EwDcV87jmQtzLO6CZUWioVJRhm09nVW1FOAwDxUx6n63odu3+mqBlb8mUEUxWQpf8Um4
 4sE+a19gypalWvbTeWtew95YVNnvIzeknq9dBiTD0caCdXrgpFGPhyLoOedK1xzKeNUl
 eBx+seJGI5ha+Sk5mlLuj2juiY0pRBAzlGp7WpkmqGA+Dt9eImvn6gVj4ri88KmjqLoG
 MXM72HfooCgVjfaPfaQffOYVK9/nmy6xDcxunk2TytochFzcDCH/dOuDuFcQzcn7l6qz
 4VEg==
X-Gm-Message-State: ACrzQf1KDFSkGengMHVa68FOe1wCko+FQQ0tgeGrZsLZpWnTyHCscj/E
 TPEYTjbEb7DxQ03u8LE9fGHc8NkD594=
X-Google-Smtp-Source: AMsMyM5MA6KriOHoVUm0p8EoaEQq9w5QAs7lNgyaMBHoiCEt8x4wUPFesO1kiywgXD3iflQjqiUODA==
X-Received: by 2002:a17:907:3e06:b0:733:693:600e with SMTP id
 hp6-20020a1709073e0600b007330693600emr23486571ejc.410.1664316489914; 
 Tue, 27 Sep 2022 15:08:09 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-011-044-017.77.11.pool.telefonica.de.
 [77.11.44.17]) by smtp.gmail.com with ESMTPSA id
 k20-20020aa7d8d4000000b00457d9c16fb2sm557877eds.23.2022.09.27.15.08.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Sep 2022 15:08:09 -0700 (PDT)
Date: Tue, 27 Sep 2022 22:08:06 +0000
From: B <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_hw/virtio/vhost-shadow-virtqu?=
 =?US-ASCII?Q?eue=3A_Silence_GCC_error_=22maybe-uninitialized=22?=
In-Reply-To: <D1ED14E5-CFF9-4525-96C5-60262DB17309@gmail.com>
References: <20220910151117.6665-1-shentey@gmail.com>
 <D1ED14E5-CFF9-4525-96C5-60262DB17309@gmail.com>
Message-ID: <3565DD2F-D779-4EEA-9273-EC11963BC3C0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
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



Am 20=2E September 2022 05:29:25 UTC schrieb Bernhard Beschow <shentey@gma=
il=2Ecom>:
>Am 10=2E September 2022 15:11:17 UTC schrieb Bernhard Beschow <shentey@gm=
ail=2Ecom>:
>>GCC issues a false positive warning, resulting in build failure with -We=
rror:
>>
>>  In file included from /usr/include/glib-2=2E0/glib=2Eh:114,
>>                   from src/include/glib-compat=2Eh:32,
>>                   from src/include/qemu/osdep=2Eh:144,
>>                   from =2E=2E/src/hw/virtio/vhost-shadow-virtqueue=2Ec:=
10:
>>  In function =E2=80=98g_autoptr_cleanup_generic_gfree=E2=80=99,
>>      inlined from =E2=80=98vhost_handle_guest_kick=E2=80=99 at =2E=2E/s=
rc/hw/virtio/vhost-shadow-virtqueue=2Ec:292:42:
>>  /usr/include/glib-2=2E0/glib/glib-autocleanups=2Eh:28:3: error: =E2=80=
=98elem=E2=80=99 may be used uninitialized [-Werror=3Dmaybe-uninitialized]
>>     28 |   g_free (*pp);
>>        |   ^~~~~~~~~~~~
>>  =2E=2E/src/hw/virtio/vhost-shadow-virtqueue=2Ec: In function =E2=80=98=
vhost_handle_guest_kick=E2=80=99:
>>  =2E=2E/src/hw/virtio/vhost-shadow-virtqueue=2Ec:292:42: note: =E2=80=
=98elem=E2=80=99 was declared here
>>    292 |             g_autofree VirtQueueElement *elem;
>>        |                                          ^~~~
>>  cc1: all warnings being treated as errors
>>
>>There is actually no problem since "elem" is initialized in both branche=
s=2E
>>Silence the warning by initializig it with "NULL"=2E
>>
>>$ gcc --version
>>gcc (GCC) 12=2E2=2E0
>>
>>Fixes: 9c2ab2f1ec333be8614cc12272d4b91960704dbe ("vhost: stop transfer e=
lem ownership in vhost_handle_guest_kick")
>>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>---
>
>Ping

Ping2

>
>> hw/virtio/vhost-shadow-virtqueue=2Ec | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>diff --git a/hw/virtio/vhost-shadow-virtqueue=2Ec b/hw/virtio/vhost-shad=
ow-virtqueue=2Ec
>>index e8e5bbc368=2E=2E596d4434d2 100644
>>--- a/hw/virtio/vhost-shadow-virtqueue=2Ec
>>+++ b/hw/virtio/vhost-shadow-virtqueue=2Ec
>>@@ -289,7 +289,7 @@ static void vhost_handle_guest_kick(VhostShadowVirtq=
ueue *svq)
>>         virtio_queue_set_notification(svq->vq, false);
>>=20
>>         while (true) {
>>-            g_autofree VirtQueueElement *elem;
>>+            g_autofree VirtQueueElement *elem =3D NULL;
>>             int r;
>>=20
>>             if (svq->next_guest_avail_elem) {
>

