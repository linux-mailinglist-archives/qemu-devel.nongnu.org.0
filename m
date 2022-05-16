Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60885529340
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:59:15 +0200 (CEST)
Received: from localhost ([::1]:60800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqikE-0007Xz-E3
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhjj-0001vG-Mp
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhjh-0006ms-PN
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6TBSwgl4erp1QVjV6hUdkH53hYVNMfCm5ztMd9UNMOM=;
 b=QRS4SFD5htlGPz+5HGk64eauPbQEw4pisOk9YgX31cA/SigZuB6BRwMYojrK+kc5TqHEsQ
 oxqg/6VC0nA2foqhgr9+qSRh2uXUWHz6Ipfzy5Y91nhUYrSJJ8IR2QrtHHNEifJDLibClO
 rKyyS0PkatVrCzgp9NOQaE7ehj6bREY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-MmZpWV5JPrq1WCu4DRdfeQ-1; Mon, 16 May 2022 16:54:35 -0400
X-MC-Unique: MmZpWV5JPrq1WCu4DRdfeQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 ay24-20020a056402203800b0042a96a76ba5so4445711edb.20
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6TBSwgl4erp1QVjV6hUdkH53hYVNMfCm5ztMd9UNMOM=;
 b=7CKMI5lccsG1bAUch/dvGasBbv9yBY+NnUBp4t9V8owHlEbCVlJ0WEfbbi6FE2rXUO
 z3xLeXfiKpmQF6V+xUeKlavmZnFJd9H3beFrd4B1qH4821rwutZbjYi69JgmUMtTtbxZ
 gwn9utRNWBIojOnaiZfY7cBcbZhYPxzDoPKoP/Ge7fjlI59ZFd2vyHIYoDWRTY0HjaOE
 r1YMh9ALltWPr/1MgiMwRDZbmWzwDzAtueUD1Fmr1LrEZS6cIls2OeTH03sLainHt1WJ
 RkO6+dyfzouqKiS+msGbDdNysg4sq4JkNO8d5K9Vd0pp3LDT35tnZmX0I6tOAfD1O1ky
 iDng==
X-Gm-Message-State: AOAM53029TAv67VMJ2mNdYpg7busZDitTjGEdkujeciPNyfXHn78xcbz
 mX5hH6wk5nGQVBYNtNrR2HjWDpe7fmtvK0C/L6zv0WzZQriUKxGqCrXbOfdtfafsTuqjAicp3T6
 YljcInYCPPmzVvQFgK+Yv5j/7lcIRnU/D2aC5xq230RrZZ2igpkX480PScOJr
X-Received: by 2002:a17:907:1b1e:b0:6d7:31b0:e821 with SMTP id
 mp30-20020a1709071b1e00b006d731b0e821mr16994538ejc.334.1652734474374; 
 Mon, 16 May 2022 13:54:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4gsR16HRqcE7pzNe3IuQKJzHkGFzl0Uxx1NsOvPoKzvZuG7fAklgIPln3cT55YFYH8SmJAQ==
X-Received: by 2002:a17:907:1b1e:b0:6d7:31b0:e821 with SMTP id
 mp30-20020a1709071b1e00b006d731b0e821mr16994514ejc.334.1652734474062; 
 Mon, 16 May 2022 13:54:34 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 a17-20020a50ff11000000b0042a2d9af0f8sm5689009edu.79.2022.05.16.13.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:54:33 -0700 (PDT)
Date: Mon, 16 May 2022 16:54:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jiang Liu <gerry@linux.alibaba.com>
Subject: [PULL v2 64/86] vhost-user.rst: add clarifying language about
 protocol negotiation
Message-ID: <20220516204913.542894-65-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Alex Bennée <alex.bennee@linaro.org>

Make the language about feature negotiation explicitly clear about the
handling of the VHOST_USER_F_PROTOCOL_FEATURES feature bit. Try and
avoid the sort of bug introduced in vhost.rs REPLY_ACK processing:

  https://github.com/rust-vmm/vhost/pull/24

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Jiang Liu <gerry@linux.alibaba.com>
Message-Id: <20210226111619.21178-1-alex.bennee@linaro.org>

Message-Id: <20220321153037.3622127-8-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/interop/vhost-user.rst | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 9159476678..73e710fe32 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -332,6 +332,18 @@ bit was dedicated for this purpose::
 
   #define VHOST_USER_F_PROTOCOL_FEATURES 30
 
+Note that VHOST_USER_F_PROTOCOL_FEATURES is the UNUSED (30) feature
+bit defined in `VIRTIO 1.1 6.3 Legacy Interface: Reserved Feature Bits
+<https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-4130003>`_.
+VIRTIO devices do not advertise this feature bit and therefore VIRTIO
+drivers cannot negotiate it.
+
+This reserved feature bit was reused by the vhost-user protocol to add
+vhost-user protocol feature negotiation in a backwards compatible
+fashion. Old vhost-user master and slave implementations continue to
+work even though they are not aware of vhost-user protocol feature
+negotiation.
+
 Ring states
 -----------
 
@@ -890,7 +902,8 @@ Front-end message types
   Get the protocol feature bitmask from the underlying vhost
   implementation.  Only legal if feature bit
   ``VHOST_USER_F_PROTOCOL_FEATURES`` is present in
-  ``VHOST_USER_GET_FEATURES``.
+  ``VHOST_USER_GET_FEATURES``.  It does not need to be acknowledged by
+  ``VHOST_USER_SET_FEATURES``.
 
 .. Note::
    Back-ends that report ``VHOST_USER_F_PROTOCOL_FEATURES`` must
@@ -906,7 +919,8 @@ Front-end message types
   Enable protocol features in the underlying vhost implementation.
 
   Only legal if feature bit ``VHOST_USER_F_PROTOCOL_FEATURES`` is present in
-  ``VHOST_USER_GET_FEATURES``.
+  ``VHOST_USER_GET_FEATURES``.  It does not need to be acknowledged by
+  ``VHOST_USER_SET_FEATURES``.
 
 .. Note::
    Back-ends that report ``VHOST_USER_F_PROTOCOL_FEATURES`` must support
-- 
MST


