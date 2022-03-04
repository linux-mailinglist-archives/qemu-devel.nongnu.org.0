Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 775384CD68C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:39:15 +0100 (CET)
Received: from localhost ([::1]:60338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ95O-0002bs-JJ
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:39:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8D3-0006l5-RR
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:43:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ8D2-0001Ma-7l
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:43:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u98pZphtEuNO4dhvyopEU2A+hxzxAEs+t90wrkCxxYA=;
 b=fryeqqq+OgFhWqiXkF5ito5i1UGUzcZd4/j53c0Ow+kPsumeVD59GL2ROYOiKM1isT6L1X
 8bp7qVCI6Zihm6WDAUE3pjGOUK1V/lcU6bpoc5Q33LwNt1pqQFLR8Gi+HT2ul3+yNHLLaR
 yVohmwD5vfwuVQ9YkEVV5cAi1b+vclI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-0kusxn2XMFuU-KNXIhr_NA-1; Fri, 04 Mar 2022 08:43:02 -0500
X-MC-Unique: 0kusxn2XMFuU-KNXIhr_NA-1
Received: by mail-wr1-f71.google.com with SMTP id
 z16-20020adff1d0000000b001ef7dc78b23so3374101wro.12
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:43:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u98pZphtEuNO4dhvyopEU2A+hxzxAEs+t90wrkCxxYA=;
 b=7LwiBD+kOyZcMcR70HoD7mLH/VsXQXpV6tDsQcJf6XaW5qt3IEVU2ot0H0MT/k4zkj
 4hGmQ1TIbpC00sy3ceLwdrIHydimZyKcgVVuu+ri5DikfmNtiACxMwM302yAGusUD0Hk
 O271bV/Cv1w0kMrBEXNHA6Ssp0wo0wDTrnrSQw72rKX0SKEOfW/PQIHsGqmNA69sAxD/
 e0rimK4r16/pA0JAAVMAT/k2E5DOzRRMJ7egQvKzH+LZ6ndK7708CNIA7OkLJ1GW+gio
 fCQxLTxXLurgQa+FbMjOY6MWtLus+UC4MiEbCc31uxEZrJn/qDP8H6SZUt9dtkALREd0
 zOmg==
X-Gm-Message-State: AOAM531Ffy1fTk0MMvuNYP/I7lmeKCUzPEBTighyBEJwIKWJw7nj2H7h
 p9QHSfyh1mEyPD4WsMy+13QVNKKS9eWTnqVKlm7xUwfBTS3n2McYyv/N62v7i/0eqCUqfUc+HtO
 X8BxU232EaEdmfT3N3D7/UzB6R92DOjYNBDxRE+b40t7JN4FxXVWro9pSo+2o
X-Received: by 2002:a05:600c:6003:b0:381:455d:b571 with SMTP id
 az3-20020a05600c600300b00381455db571mr7717120wmb.162.1646401381233; 
 Fri, 04 Mar 2022 05:43:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBsWGjV8yDbW5TPj7tMi369y/xBemjDvOxCs78f7ul2y4lBjsh3NMmFNvqMzZHNrPGZXXcRw==
X-Received: by 2002:a05:600c:6003:b0:381:455d:b571 with SMTP id
 az3-20020a05600c600300b00381455db571mr7717101wmb.162.1646401380925; 
 Fri, 04 Mar 2022 05:43:00 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 bi6-20020a05600c3d8600b00381590dbb25sm17511657wmb.3.2022.03.04.05.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:42:59 -0800 (PST)
Date: Fri, 4 Mar 2022 08:42:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 45/45] docs: vhost-user: add subsection for non-Linux platforms
Message-ID: <20220304133556.233983-46-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sergio Lopez <slp@redhat.com>

Add a section explaining how vhost-user is supported on platforms
other than Linux.

Signed-off-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220304100854.14829-5-slp@redhat.com>
Signed-off-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/interop/vhost-user.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index edc3ad84a3..4dbc84fd00 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -38,6 +38,26 @@ conventions <backend_conventions>`.
 *Master* and *slave* can be either a client (i.e. connecting) or
 server (listening) in the socket communication.
 
+Support for platforms other than Linux
+--------------------------------------
+
+While vhost-user was initially developed targeting Linux, nowadays it
+is supported on any platform that provides the following features:
+
+- A way for requesting shared memory represented by a file descriptor
+  so it can be passed over a UNIX domain socket and then mapped by the
+  other process.
+
+- AF_UNIX sockets with SCM_RIGHTS, so QEMU and the other process can
+  exchange messages through it, including ancillary data when needed.
+
+- Either eventfd or pipe/pipe2. On platforms where eventfd is not
+  available, QEMU will automatically fall back to pipe2 or, as a last
+  resort, pipe. Each file descriptor will be used for receiving or
+  sending events by reading or writing (respectively) an 8-byte value
+  to the corresponding it. The 8-value itself has no meaning and
+  should not be interpreted.
+
 Message Specification
 =====================
 
-- 
MST


