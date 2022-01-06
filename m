Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCE34865A7
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:58:53 +0100 (CET)
Received: from localhost ([::1]:45208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TI4-0005nQ-RX
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:58:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sf8-0005fL-6i
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sf6-00015O-H3
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HCH8M2xzOuTzVRMTHu52Ea//JZbOjY+v7CpKskn1oCw=;
 b=Rk4t2P+6CkNHIqMdnaXTSlxdtIHKJBlNm7dWhBZySBxR2KGOIz45BGfon/zxSgl0fSESJL
 d3gI8FqFs8MPNyqUY5ub0jEZuSaE1tX4JNJA+m30d7c6r0FWgRYN83g0JZyFsCJLiPnmGG
 j2VRBaS16PmLyuuvqrhbCIEq3jFvTDc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-wJlr8IVpN1-ndcg6oxxEow-1; Thu, 06 Jan 2022 08:18:34 -0500
X-MC-Unique: wJlr8IVpN1-ndcg6oxxEow-1
Received: by mail-ed1-f70.google.com with SMTP id
 o20-20020a056402439400b003f83cf1e472so1912097edc.18
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:18:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HCH8M2xzOuTzVRMTHu52Ea//JZbOjY+v7CpKskn1oCw=;
 b=Xj0FoFEOCv3+1o9p2tejTKhvfLIApIbVTdUHTJlzjQ/gZyrym0weFdPsvssQBW5hXD
 v4IqDfdQWonp33pm9bKKItESusjttLC4gsAFPa73CC4sMQ0v5rMAb+3N2l9EYVZ4D4tn
 h4BrhfEXHGJ6GFD67mmSYpFuCnpL0L4Okgr//mNFfPd/xo9enFOO/xVmRydYR0CP5MCG
 6jscRxMFany/fcnzULTLVnUc105Ah/pIs1d1/VhpJe7IQxlFqeV/M3cEHjNxs8zPnUZL
 JDdgamzJuq3SguSFD67qjFfF7eaGLmTHIAdkaY3KfQD4QLGSOzem3i44ELrJNQDkL9Ao
 zQUg==
X-Gm-Message-State: AOAM5324m7Ow4JTiVuhea3k+J/VwHmy/F5qK+XO1z3PPDmn/5cg8g+0g
 XgloyHU5VnvpuhIMqq15XrDhONe3tfteV8mJ0AKas8ToPq5ZtmYXI3r66mo0SoIzV1okOIuEKJL
 qlZW/iumWULmwipxVsRrXA5MvIsk6vHQrxIdeN+OchspJWgPs+AtdVLozgQUy
X-Received: by 2002:a05:6402:5202:: with SMTP id
 s2mr50905411edd.206.1641475113388; 
 Thu, 06 Jan 2022 05:18:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfmCgocRcF1x2u5obTs7lGCOuLwsvamPeBIMVVJgfbFoD+3iGnirzo2Tt1GLBQ5LsDY/R87g==
X-Received: by 2002:a05:6402:5202:: with SMTP id
 s2mr50905392edd.206.1641475113119; 
 Thu, 06 Jan 2022 05:18:33 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id hb17sm482890ejc.195.2022.01.06.05.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:18:32 -0800 (PST)
Date: Thu, 6 Jan 2022 08:18:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 46/52] tests: acpi: SLIC: update expected blobs
Message-ID: <20220106131534.423671-47-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20211227193120.1084176-5-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 tests/data/acpi/q35/FACP.slic               | Bin 244 -> 244 bytes
 tests/data/acpi/q35/SLIC.slic               | Bin 0 -> 36 bytes
 3 files changed, 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 49dbf8fa3e..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/FACP.slic",
-"tests/data/acpi/q35/SLIC.slic",
diff --git a/tests/data/acpi/q35/FACP.slic b/tests/data/acpi/q35/FACP.slic
index f6a864cc863c7763f6c09d3814ad184a658fa0a0..891fd4b784b7b6b3ea303976db7ecd5b669bc84b 100644
GIT binary patch
delta 28
jcmeyu_=Qo#&CxmF3j+fKvygL;W3Y#Uud9N>M3Dyoc<=}c

delta 28
jcmeyu_=Qo#&CxmF3j+fK^G+v!XOCb7r-%UOi6RdGgN+Fa

diff --git a/tests/data/acpi/q35/SLIC.slic b/tests/data/acpi/q35/SLIC.slic
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..fd26592e2480c5d02a018e0d855a04106661a7b5 100644
GIT binary patch
literal 36
mcmWIc@pM*UU|?YMbPjS1_E7M31#*C(gN1>iFg3Rn#0CI%)&>Cp

literal 0
HcmV?d00001

-- 
MST


