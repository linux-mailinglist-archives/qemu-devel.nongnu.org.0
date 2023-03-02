Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC266A7CA1
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:28:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeGd-0005Nr-2b; Thu, 02 Mar 2023 03:26:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGW-0005Fm-Ty
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGV-0002RF-0t
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wjucy0cfusU4XwAvaR67yzsR5ckrokMlyHf5HfD6GQY=;
 b=Y8xc5a56gcgh/EsbbF5+ZAn6LovlAWYDxQnVPqIDws0ESEXZYnPG2SqnCCTzQL01qQzltw
 yOf77VL+dJTDLRqhLaTk7PsHgfRuWeOAz84YozvjYTPWc9/3+fZn+SVGkYQGaUghPjItpA
 VHVekxh2Ipd8sf3y7wU1jRlhvlDN1IE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-N9Pju26GNxK8M8DnM0K8Kg-1; Thu, 02 Mar 2023 03:26:12 -0500
X-MC-Unique: N9Pju26GNxK8M8DnM0K8Kg-1
Received: by mail-wm1-f72.google.com with SMTP id
 z6-20020a05600c220600b003e222c9c5f4so5460823wml.4
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:26:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745570;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wjucy0cfusU4XwAvaR67yzsR5ckrokMlyHf5HfD6GQY=;
 b=5pS/KkciLQeYzrnQ7CEOcQjBHj0hq9PPbC8cGYjs5Rc6p1MqZYOWIuK1MS+jhXEvOB
 /3YKDP+D85e5FC72hlHZA8YQ2bVCPcZc5Z3zIjqItsMyAHSp0i084QC5Sdm0aqyu5cvz
 TaAFErVeFmea9THF9WdnzBKgtCCl7H2lwKuoj0j4WYDebbFs8EYVODowwmZPwUDS5Fje
 mR/BacvCdEMShrrM0vvyhyWowf2o49MfjahY2fYLzhvrKro4bLJg4ELyBaJPn5uHbKBJ
 faIABGu2AVpT6ME+cE8WbDTQAQC/6REPlrNcNgyLc1w/RvvhZpn/qwLbRX96EHlGkD+V
 xFLw==
X-Gm-Message-State: AO0yUKVaHlavNS3pPsa8/lSXHkxlh3FrZEK46fmUc4M2A0XuUdVJX+0z
 ZkEAHhSfrq59wNakLzXqK1nJC76L+PFOEvl85lbaUHjjzSU5XOWuvKtmPsN0ALfl1u/bSFVLYzB
 nUpP0Vonnh9yuL2LzxSORSP4weGOFmiYFuMCZ/KOeJa8dOpJBdsZtTOVnA9MOzJbmlg==
X-Received: by 2002:a5d:4586:0:b0:2c7:1d71:e672 with SMTP id
 p6-20020a5d4586000000b002c71d71e672mr6599776wrq.7.1677745570287; 
 Thu, 02 Mar 2023 00:26:10 -0800 (PST)
X-Google-Smtp-Source: AK7set/GhEUguNKXV1QJMrhPFPQ/WSDcVVbMnNujEuBk/wK5wxjV2l2O1zOABxdFa+dN1eTyRkhvSQ==
X-Received: by 2002:a5d:4586:0:b0:2c7:1d71:e672 with SMTP id
 p6-20020a5d4586000000b002c71d71e672mr6599766wrq.7.1677745569967; 
 Thu, 02 Mar 2023 00:26:09 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 a4-20020a5d5704000000b002c559843748sm14742920wrv.10.2023.03.02.00.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:26:09 -0800 (PST)
Date: Thu, 2 Mar 2023 03:26:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Carlos =?utf-8?B?TMOzcGV6?= <clopez@suse.de>
Subject: [PULL 32/53] vhost: avoid a potential use of an uninitialized
 variable in vhost_svq_poll()
Message-ID: <20230302082343.560446-33-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Carlos López <clopez@suse.de>

In vhost_svq_poll(), if vhost_svq_get_buf() fails due to a device
providing invalid descriptors, len is left uninitialized and returned
to the caller, potentally leaking stack data or causing undefined
behavior.

Fix this by initializing len to 0.

Found with GCC 13 and -fanalyzer (abridged):

../hw/virtio/vhost-shadow-virtqueue.c: In function ‘vhost_svq_poll’:
../hw/virtio/vhost-shadow-virtqueue.c:538:12: warning: use of uninitialized value ‘len’ [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
  538 |     return len;
      |            ^~~
  ‘vhost_svq_poll’: events 1-4
    |
    |  522 | size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
    |      |        ^~~~~~~~~~~~~~
    |      |        |
    |      |        (1) entry to ‘vhost_svq_poll’
    |......
    |  525 |     uint32_t len;
    |      |              ~~~
    |      |              |
    |      |              (2) region created on stack here
    |      |              (3) capacity: 4 bytes
    |......
    |  528 |         if (vhost_svq_more_used(svq)) {
    |      |             ~
    |      |             |
    |      |             (4) inlined call to ‘vhost_svq_more_used’ from ‘vhost_svq_poll’

    (...)

    |  528 |         if (vhost_svq_more_used(svq)) {
    |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~
    |      |            ||
    |      |            |(8) ...to here
    |      |            (7) following ‘true’ branch...
    |......
    |  537 |     vhost_svq_get_buf(svq, &len);
    |      |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    |      |     |
    |      |     (9) calling ‘vhost_svq_get_buf’ from ‘vhost_svq_poll’
    |
    +--> ‘vhost_svq_get_buf’: events 10-11
           |
           |  416 | static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
           |      |                          ^~~~~~~~~~~~~~~~~
           |      |                          |
           |      |                          (10) entry to ‘vhost_svq_get_buf’
           |......
           |  423 |     if (!vhost_svq_more_used(svq)) {
           |      |          ~
           |      |          |
           |      |          (11) inlined call to ‘vhost_svq_more_used’ from ‘vhost_svq_get_buf’
           |

           (...)

           |
         ‘vhost_svq_get_buf’: event 14
           |
           |  423 |     if (!vhost_svq_more_used(svq)) {
           |      |        ^
           |      |        |
           |      |        (14) following ‘false’ branch...
           |
         ‘vhost_svq_get_buf’: event 15
           |
           |cc1:
           | (15): ...to here
           |
    <------+
    |
  ‘vhost_svq_poll’: events 16-17
    |
    |  537 |     vhost_svq_get_buf(svq, &len);
    |      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
    |      |     |
    |      |     (16) returning to ‘vhost_svq_poll’ from ‘vhost_svq_get_buf’
    |  538 |     return len;
    |      |            ~~~
    |      |            |
    |      |            (17) use of uninitialized value ‘len’ here

Note by  Laurent Vivier <lvivier@redhat.com>:

    The return value is only used to detect an error:

    vhost_svq_poll
        vhost_vdpa_net_cvq_add
            vhost_vdpa_net_load_cmd
                vhost_vdpa_net_load_mac
                  -> a negative return is only used to detect error
                vhost_vdpa_net_load_mq
                  -> a negative return is only used to detect error
            vhost_vdpa_net_handle_ctrl_avail
              -> a negative return is only used to detect error

Fixes: d368c0b052ad ("vhost: Do not depend on !NULL VirtQueueElement on vhost_svq_flush")
Signed-off-by: Carlos López <clopez@suse.de>
Message-Id: <20230213085747.19956-1-clopez@suse.de>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 4307296358..515ccf870d 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -522,7 +522,7 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
 size_t vhost_svq_poll(VhostShadowVirtqueue *svq)
 {
     int64_t start_us = g_get_monotonic_time();
-    uint32_t len;
+    uint32_t len = 0;
 
     do {
         if (vhost_svq_more_used(svq)) {
-- 
MST


