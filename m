Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 011E63688FD
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 00:26:55 +0200 (CEST)
Received: from localhost ([::1]:38128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZhmg-0004vX-IU
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 18:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lZhkr-0003Pq-Om
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 18:25:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lZhkp-0003Kp-1L
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 18:25:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619130294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=PsvY5Kd0czlI8yCug//+q95mDn8xVwUuIx3G0nsqdKk=;
 b=hsLIPCKhKTY343pfPu4LYK9LayjXplcQm9iYHd6ssGHfysyCqfBnazvxNm2EXiF+Hh1Vdx
 Ifl55mJs9rU2tjjRWfIRSeZL3updafsUWm1YqIp+yFmKSvQCmPV2HbyPDIO6YG533pxOvE
 jEF7fv22KIbAVnMP5+jnHcLAl1BKbls=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-YjTMYT4PNZKLmjrOow9RFQ-1; Thu, 22 Apr 2021 18:24:52 -0400
X-MC-Unique: YjTMYT4PNZKLmjrOow9RFQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 y10-20020a50f1ca0000b0290382d654f75eso17507832edl.1
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 15:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=PsvY5Kd0czlI8yCug//+q95mDn8xVwUuIx3G0nsqdKk=;
 b=OHu5GWVTudbWt+E4aABP52m/+qv05i/wfQVFVtW82uNwbMrwgpOp1J7uui0G9YaR6b
 xC5u7TdFAZIBdyppAv4NaQiwb1CpMoh6N6oM1ZpZ6x/UxkiGtY6E+D/Cydbn9SRYMsnm
 l4HsA1z4GRiM94U/0GJwGeHQ1W6NnbX2qmDB/UT0+iMGTBjquyGDLOBjh99aV4nXrYyj
 3wR293GqkT8oupxQMMNNnrq3BJMxJz11dqBxZAAPmRlaw79Y6lq21TjadFZPYl5auVIr
 Qdf3o+npGpFeM97K4OnMBIfyeq8jlPnebtYhDlKSKALS5x3qLxIJIsrpwO80j54rmTUK
 5dlw==
X-Gm-Message-State: AOAM532KKdyOyk6tXQbgSuNDWZB62rdkwR8ka7DQC4gMZ2GfRoiEPtzr
 BGK9UHOb722kFlJs8Yq9LRDRho8h0BoRIitu16o94idutuIthCtdhRBPcEscloqCO2DLszTUwu1
 i4Ej2ndqiBXugb8HiWt9FJhuSkJ6/NspjUUMUOgBbwyEImQPbeXj/ZVIn4Grz
X-Received: by 2002:a17:906:c09:: with SMTP id s9mr868826ejf.145.1619130291377; 
 Thu, 22 Apr 2021 15:24:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpGObQ2TwUXwlEY3NbuRXMkYZQ8wxLPDf8dvZq+8Qwd4STEZeIOXZNf3+Kc8YuVTNu/+hCjQ==
X-Received: by 2002:a17:906:c09:: with SMTP id s9mr868817ejf.145.1619130291174; 
 Thu, 22 Apr 2021 15:24:51 -0700 (PDT)
Received: from redhat.com (212.116.168.114.static.012.net.il.
 [212.116.168.114])
 by smtp.gmail.com with ESMTPSA id c12sm2786749eja.12.2021.04.22.15.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 15:24:50 -0700 (PDT)
Date: Thu, 22 Apr 2021 18:24:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] pc: last minute bugfixes
Message-ID: <20210422222429.183108-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d83f46d189a26fa32434139954d264326f199a45:

  virtio-pci: compat page aligned ATS (2021-04-06 07:11:36 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream

for you to fetch changes up to 9106db1038bf3db5e4f8007038b3a1962018fa07:

  x86: acpi: use offset instead of pointer when using build_header() (2021-04-22 18:22:01 -0400)

----------------------------------------------------------------
pc: last minute bugfixes

Two bugfixes - both seem pretty obvious and safe ...

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Igor Mammedov (1):
      x86: acpi: use offset instead of pointer when using build_header()

Jean-Philippe Brucker (1):
      amd_iommu: Fix pte_override_page_mask()

 hw/acpi/aml-build.c  | 15 +++++++++------
 hw/i386/acpi-build.c |  8 ++++++--
 hw/i386/amd_iommu.c  |  4 ++--
 3 files changed, 17 insertions(+), 10 deletions(-)


