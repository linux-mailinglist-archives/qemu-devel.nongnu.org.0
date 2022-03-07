Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 961B74CF99A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:07:17 +0100 (CET)
Received: from localhost ([::1]:32872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAGq-0008EN-K2
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:07:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRABT-0008Ks-M4
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:01:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRABS-0002Zu-1x
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:01:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ma9iWGjH8QtszJxbcW9JyMpOmAV16xFQyYJbaD6EIFc=;
 b=bxIwF1SO8jzCgYgxesUQ9onZv/Wo/9vEVyccJenTYpLxlENAHVSqTLQWpwY5RBmTBMJlpA
 xh9fRZMknQHm2LFMQpGFKDS2uYGmDOC4Sc+u7kHcYik3cQE9WMJQfn1+7/tA+NpLbXu7xp
 0F8FSeHSshON7KwzkF6KttK/Tv/vUxA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-wRZRzIruNxqY2iruXCsZcA-1; Mon, 07 Mar 2022 05:01:40 -0500
X-MC-Unique: wRZRzIruNxqY2iruXCsZcA-1
Received: by mail-ed1-f70.google.com with SMTP id
 o20-20020aa7dd54000000b00413bc19ad08so8338496edw.7
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:01:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ma9iWGjH8QtszJxbcW9JyMpOmAV16xFQyYJbaD6EIFc=;
 b=ylKkORd3neJZNCsckL03tpfxhdRYlbtOUMLoEpDugqMbViFnF+cXRxrnw5MXCA6+Vd
 Jreu6Rs0mcn3pRCvFWvPvhCc9I+yL5yCYb5HVkPn5gbA/t6QAbUsRsDpod1ce3hBgcSo
 umPzoU6FPnauBWn1rhDpKrXaTVY0VLKFRW2Nkuq2pwXR03Gt2YAXb6UWYizb2gWYTHj/
 oECeBuXArICgLd2iWoTvOef2aG8ycn4riXib11ewMnhHRwEE83AVVivlVqLjz43Ft5Bo
 0tHszMXC+x+ghSlFP5twyMYxYKoncbZimXd/F+mtRbpgfNn1TSdIh2MGv2W+iyudrXDs
 pG7g==
X-Gm-Message-State: AOAM532coQYGlXc3cr2po3pzOQuTR/O/JeQ28aRATy6dPxkiYgX3LxzD
 KwoZZP4qY4tE31lIIctFAXU7MkG79IXEqW8457Tzd9ShUeySpyqih/xy4IazUQ1/3+/bDjbvOOl
 sxp9V48C6g+mnNC/xU8WXD1NBbaJ5ooxtMNgJs7oubcKlM4kQotgIXtjX9cyD
X-Received: by 2002:a05:6402:1775:b0:416:537f:f422 with SMTP id
 da21-20020a056402177500b00416537ff422mr2009087edb.20.1646647298407; 
 Mon, 07 Mar 2022 02:01:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+fr0gX03GD/84tanC6Mnl/SBml6FgXUoapLigBxuv1z5Vcm3dUqCBo2tKeggULzi25tib7A==
X-Received: by 2002:a05:6402:1775:b0:416:537f:f422 with SMTP id
 da21-20020a056402177500b00416537ff422mr2009057edb.20.1646647298052; 
 Mon, 07 Mar 2022 02:01:38 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 bm23-20020a170906c05700b006d597fd51c6sm4628764ejb.145.2022.03.07.02.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:01:37 -0800 (PST)
Date: Mon, 7 Mar 2022 05:01:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 04/47] docs/acpi/erst: add device id for ACPI ERST device
 in pci-ids.txt
Message-ID: <20220307100058.449628-5-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
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
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Eric DeVolder <eric.devolder@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

Adding device ID for ERST device in pci-ids.txt. It was missed when ERST
related patches were reviewed.

CC: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20220223143322.927136-4-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/specs/pci-ids.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/specs/pci-ids.txt b/docs/specs/pci-ids.txt
index 5e407a6f32..dd6859d039 100644
--- a/docs/specs/pci-ids.txt
+++ b/docs/specs/pci-ids.txt
@@ -65,6 +65,7 @@ PCI devices (other than virtio):
 1b36:000f  mdpy (mdev sample device), linux/samples/vfio-mdev/mdpy.c
 1b36:0010  PCIe NVMe device (-device nvme)
 1b36:0011  PCI PVPanic device (-device pvpanic-pci)
+1b36:0012  PCI ACPI ERST device (-device acpi-erst)
 
 All these devices are documented in docs/specs.
 
-- 
MST


