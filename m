Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DCE4D0B84
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 23:54:42 +0100 (CET)
Received: from localhost ([::1]:45932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMFV-0007RR-So
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 17:54:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM5y-00052Z-Hg
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:44:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM5x-00059A-2S
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:44:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ma9iWGjH8QtszJxbcW9JyMpOmAV16xFQyYJbaD6EIFc=;
 b=SdddsIh/EdZPI3Su3eDtQA7r3EKU/NUlVse25wP6P519eME5gvqoZbq74mAv+NZsov6dFJ
 I20FP6KmZDxRt8sVCYK2seBOlOvvHZXwYmqycHvtkYG0lLVUAJp4v0eloJk28mSI2gn9FR
 qYj/6fv0Db04LKsYaBuGZMuoXuCBdU0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-qRtZ9trqMyeth4zu7g0h7A-1; Mon, 07 Mar 2022 17:44:47 -0500
X-MC-Unique: qRtZ9trqMyeth4zu7g0h7A-1
Received: by mail-wm1-f71.google.com with SMTP id
 7-20020a1c1907000000b003471d9bbe8dso392180wmz.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:44:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ma9iWGjH8QtszJxbcW9JyMpOmAV16xFQyYJbaD6EIFc=;
 b=0hk9upPzNidTCh3dhkugOiKiR67VADUhJyVdbZutcCocnIUqxd/+J1UZdIVenOLEWW
 NRKmLCAAULVHM3Pa2gwzBp4IITpVxMYX8iYF3SKbDUiRHKEb0hh0Zr4RtVQkcihWczir
 hH785HrNJfbDxuBKejcwLTCb4cyIJhcoswnJ9L/t85NZO8bdVjKkRT8EJ4p43RjISnlO
 1mPzgZPCPjp0MzHbVCFU3IQXfx/0vbZy4WKyro/3IobF2wSEDBDYTPw8lEA1zx2CjG0j
 yMgiQtn1bH1j9INRuivHFizocEAc2S1rSPjz6yMNFMaW/lbGS44CR9zM72BWVnQj/qHW
 i7Qw==
X-Gm-Message-State: AOAM531OU1WZXyXbGtXV9CBfJ2QsW03NxP1X4ps7qPbzahviv79H4B5t
 a+AaQECbUesOM95s9gwWKxe+kZ8qyyBrBFUhHDPS7Frww0ar0cfljNVBJpg2bqwk9Z8UGn7y9VB
 zN1GvQvenx/Ufh4f6ob9FN9bRzAVeEV0UMsPKPeqXHCss3elesk76sonQlS/2
X-Received: by 2002:a05:6000:15c1:b0:1f0:73d6:b716 with SMTP id
 y1-20020a05600015c100b001f073d6b716mr10050701wry.293.1646693085838; 
 Mon, 07 Mar 2022 14:44:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybdP4MfGEn7e4GHlftw/OBAJcwTtCE/kdChexelbkYJUfkuesH5EYdsLyfcbKLqgx/PqnymQ==
X-Received: by 2002:a05:6000:15c1:b0:1f0:73d6:b716 with SMTP id
 y1-20020a05600015c100b001f073d6b716mr10050686wry.293.1646693085560; 
 Mon, 07 Mar 2022 14:44:45 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 z2-20020a056000110200b001e7140ddb44sm12329972wrw.49.2022.03.07.14.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:44:45 -0800 (PST)
Date: Mon, 7 Mar 2022 17:44:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 04/47] docs/acpi/erst: add device id for ACPI ERST device
 in pci-ids.txt
Message-ID: <20220307224357.682101-5-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


