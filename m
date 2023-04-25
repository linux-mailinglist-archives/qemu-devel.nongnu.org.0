Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8526EDCFE
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:46:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDMl-0006ny-0k; Tue, 25 Apr 2023 03:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDMW-0006Sd-4O
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDMU-0006cz-Fd
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5xPxndmu6u19FkD0GIHESUMsZqlnKGGs95IpGgfP/Ak=;
 b=IT0q6raaXpbiQ3D9tCyLxkem49/oSJkGmD6LR2ceLhAq19cfo9cTzdOgBVew+9U5KaYhJe
 6QMeNt/cWZl/ESZr5T1yH3K7h4Ki+L26Uw2JKPXc6zbIFwkPBeNghy30qICs5zdULM/jd3
 G9qLvxALopjyzxriGAXKO+66Ho8ShtQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-m4pUveJqP9a4KgS9pAAdKQ-1; Tue, 25 Apr 2023 03:45:14 -0400
X-MC-Unique: m4pUveJqP9a4KgS9pAAdKQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f080f46fb1so20306825e9.0
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:45:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408712; x=1685000712;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5xPxndmu6u19FkD0GIHESUMsZqlnKGGs95IpGgfP/Ak=;
 b=HwQnD4VrgfCIwtTCyLnOLg9qb0XmfjNorYSMjnkAL51mv6e7+n5sx+fDb/jdEwCfRm
 uYaly+rk3OuvLqxHTS66r26lmg8IDgdvZv8aB147/od5R+YCUgYbDH37j0n4MhDkTGrD
 wbEMb5DTXYDNhBMhXnS/84n0qHb/eFcJ7CdOlLdj+XJ4OIPFm5NoTCWFqtJesP/MZppb
 53kjHVzZ64kRwfJ3hnOiSzV/xgZ17NAFg1CQUxzaVb/2JD56g0ifF+uRJikCutUhtZ2f
 UJm2ZX9y9Lou0JcKODZlOC+rl1oh5XLs8ScvfbWllmsLtt+uSxr3XAd6GTEOdjU0IpK0
 iuBQ==
X-Gm-Message-State: AAQBX9diY1QyInl6YnBScO7HoXc3PR2a9qlap3Y8VQQ01fRL0Sk60Lny
 OhmokKgPxZ5RQwppdrzU1LXogm0aeLmx1Y4txvppQihe0WS1XEkroebwkecrytqRbRa5nCLuKD9
 ZELRBVi+qRhDbjlkuZZhcxQWhc8Uw3j2f4VrUckeoH6qMECJUzKkolurNNGrl5qGtOkqX
X-Received: by 2002:a05:600c:2059:b0:3f1:73c5:66db with SMTP id
 p25-20020a05600c205900b003f173c566dbmr9032319wmg.20.1682408712307; 
 Tue, 25 Apr 2023 00:45:12 -0700 (PDT)
X-Google-Smtp-Source: AKy350aoz9iqKU12pCbzZ1M0ShyYqzcNoBfALG7pBK8wfhdrNY0U+vh7JaXbRafDNk6DP/rWjnV4uA==
X-Received: by 2002:a05:600c:2059:b0:3f1:73c5:66db with SMTP id
 p25-20020a05600c205900b003f173c566dbmr9032296wmg.20.1682408711994; 
 Tue, 25 Apr 2023 00:45:11 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 m1-20020a7bca41000000b003f179fc6d8esm14046536wml.44.2023.04.25.00.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:45:11 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:45:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 07/31] docs: vhost-user: Add Xen specific memory mapping support
Message-ID: <f21e95ee97d5adb4a274b48c6c8f70a221c1f513.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Viresh Kumar <viresh.kumar@linaro.org>

The current model of memory mapping at the back-end works fine where a
standard call to mmap() (for the respective file descriptor) is enough
before the front-end can start accessing the guest memory.

There are other complex cases though where the back-end needs more
information and simple mmap() isn't enough. For example Xen, a type-1
hypervisor, currently supports memory mapping via two different methods,
foreign-mapping (via /dev/privcmd) and grant-dev (via /dev/gntdev). In
both these cases, the back-end needs to call mmap() and ioctl(), with
extra information like the Xen domain-id of the guest whose memory we
are trying to map.

Add a new protocol feature, 'VHOST_USER_PROTOCOL_F_XEN_MMAP', which lets
the back-end know about the additional memory mapping requirements.
When this feature is negotiated, the front-end will send the additional
information within the memory regions themselves.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Message-Id: <6d0bd7f0e1aeec3ddb603ae4ff334c75c7d0d7b3.1678351495.git.viresh.kumar@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/interop/vhost-user.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 1720d68126..5a070adbc1 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -145,6 +145,26 @@ Memory region description
 
 :mmap offset: 64-bit offset where region starts in the mapped memory
 
+When the ``VHOST_USER_PROTOCOL_F_XEN_MMAP`` protocol feature has been
+successfully negotiated, the memory region description contains two extra
+fields at the end.
+
++---------------+------+--------------+-------------+----------------+-------+
+| guest address | size | user address | mmap offset | xen mmap flags | domid |
++---------------+------+--------------+-------------+----------------+-------+
+
+:xen mmap flags: 32-bit bit field
+
+- Bit 0 is set for Xen foreign memory mapping.
+- Bit 1 is set for Xen grant memory mapping.
+- Bit 8 is set if the memory region can not be mapped in advance, and memory
+  areas within this region must be mapped / unmapped only when required by the
+  back-end. The back-end shouldn't try to map the entire region at once, as the
+  front-end may not allow it. The back-end should rather map only the required
+  amount of memory at once and unmap it after it is used.
+
+:domid: a 32-bit Xen hypervisor specific domain id.
+
 Single memory region description
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
@@ -864,6 +884,7 @@ Protocol features
   #define VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS 14
   #define VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS  15
   #define VHOST_USER_PROTOCOL_F_STATUS               16
+  #define VHOST_USER_PROTOCOL_F_XEN_MMAP             17
 
 Front-end message types
 -----------------------
-- 
MST


