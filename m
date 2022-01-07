Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B1248767B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:29:27 +0100 (CET)
Received: from localhost ([::1]:57250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nR0-0005x0-19
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:29:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2T-0008AG-Pk
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:04:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2N-0001qn-Ru
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:04:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HL8XzqiOuXS/c6MYdg/W1pc8MJs/HABojwX8X2NfKmA=;
 b=GhcGDQg2uSDcMn3zZZbK8GZ6yc6fi0/h2ZFaPBX30B7WCabaWsrP/wIZBaX/0vYITxrcf2
 kfl8FxDpUqRzAYvbQQqTxtH+n6j+/gbGpaBV1ymnwncRtC0n21aEybrk9EvZQiC6P7LFyK
 Ean2618wwhokPXsMAaN/dIB2sbDM284=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-tPE1HUUpMKCB3miult7-BA-1; Fri, 07 Jan 2022 06:03:58 -0500
X-MC-Unique: tPE1HUUpMKCB3miult7-BA-1
Received: by mail-wr1-f72.google.com with SMTP id
 t28-20020adf97dc000000b001a5b98d2c81so578497wrb.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:03:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HL8XzqiOuXS/c6MYdg/W1pc8MJs/HABojwX8X2NfKmA=;
 b=m1+hq6ijODeyofdQSH0j82cLiL4NzTEzstevWeJap+Vh5DocdKLSIML3oQDJ95si+u
 sQl+kOQyi9kf0ORLf6U4cpMR3uFT0ikv7yHZULpdgjwqwaobiQsMcOwIRSPNQ0ZGV1JT
 POiaFh0NCR7w9RJ6+dIjFMLmOXnLgtCRMMENIBAGiYcv093vj8Fe+72cbwcDGCIbn/Kz
 PiwZRfIck74HULKWTGYAE1Fr6KbpdpxD+Zp3nEfDy0P/wzZRUgbkeVVzZiblZs0JnxuF
 Yeno8EAB3hAgC+i6XrqW8uxLOIt6ZzWrDIJB2Uc1NOsMJP90mEUNhZlnB1cdJGqBVctG
 73tA==
X-Gm-Message-State: AOAM530GGBGBXUJ1wKTit88tb6fSbwY+zagYv5oAOIeHTx7Pgjo7pQSd
 6y+Imp5A7wW+s9lunHdRioUUTtu2vd/QT7sh4y7046zSP4cczWGeEyq11ivzHZ+TkQihW9TN54r
 S0jNeF3tEMhyYCIxaEnwmGDFHUlCnOdceNgXffeDxTyhDlV7y98+hj0Ykrpt9
X-Received: by 2002:a05:6000:168c:: with SMTP id
 y12mr56215047wrd.409.1641553437096; 
 Fri, 07 Jan 2022 03:03:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw02eB/rHFXGk5PNTo+eAU+uTYeHfFyzX4SUIyEbcjWuMMq+XMVZ1PJ7wpHkxfUmTcL9C2ucA==
X-Received: by 2002:a05:6000:168c:: with SMTP id
 y12mr56215033wrd.409.1641553436910; 
 Fri, 07 Jan 2022 03:03:56 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id s22sm7739323wmc.1.2022.01.07.03.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:03:56 -0800 (PST)
Date: Fri, 7 Jan 2022 06:03:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 17/55] vhost-backend: avoid overflow on memslots_limit
Message-ID: <20220107102526.39238-18-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Roman Kagan <rvkagan@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Kagan <rvkagan@yandex-team.ru>

Fix the (hypothetical) potential problem when the value parsed out of
the vhost module parameter in sysfs overflows the return value from
vhost_kernel_memslots_limit.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Message-Id: <20211111153354.18807-6-rvkagan@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-backend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
index b65f8f7e97..44f7dbb243 100644
--- a/hw/virtio/vhost-backend.c
+++ b/hw/virtio/vhost-backend.c
@@ -58,7 +58,7 @@ static int vhost_kernel_memslots_limit(struct vhost_dev *dev)
     if (g_file_get_contents("/sys/module/vhost/parameters/max_mem_regions",
                             &s, NULL, NULL)) {
         uint64_t val = g_ascii_strtoull(s, NULL, 10);
-        if (!((val == G_MAXUINT64 || !val) && errno)) {
+        if (val < INT_MAX && val > 0) {
             g_free(s);
             return val;
         }
-- 
MST


