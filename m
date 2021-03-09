Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD970332FCC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:21:59 +0100 (CET)
Received: from localhost ([::1]:55484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJire-0002fP-QA
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:21:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJh53-0000Xv-1O
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:27:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJh4z-0001B9-VF
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:27:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615314456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Cw7CoH51/r0CFse4vhuIOju4779l3jyBvx4wg2pQlc=;
 b=hir0FIrdzP3lpMrHyXhvG7yX9iexrnpVfMbTF9ZxbeSGJfBCDSnV0S7iON/GYeuqAoxBVp
 5tH7Jcs/k0xnEeNi4sLwGmtcYlSiq6lsvLAXdFj9BUIILWWdxXoqUMO31G+fd57aRGbG6A
 tpMo8fh0e9ZBnmxs+6S1ZkMsG53MZQE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-mrdO22ixO1CL1Qx3Fwydmg-1; Tue, 09 Mar 2021 13:27:35 -0500
X-MC-Unique: mrdO22ixO1CL1Qx3Fwydmg-1
Received: by mail-ej1-f70.google.com with SMTP id 11so6020098ejz.20
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 10:27:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Cw7CoH51/r0CFse4vhuIOju4779l3jyBvx4wg2pQlc=;
 b=kp5k8wUfjSM8S3t17ukEaFnhjl83LD3kOSgS2w4Wz89ywRPJShfbR6dtCBnfR0X5Z7
 M2t891s+oB8OMdxjPoCOTzUlw3xVswmz/6OaCmGIODUQSNuUIQbCPAZD1ZM3sAzAE3Q1
 KrMgCw6xrPPi5+MTlK6QRlcp/qFiBdgptschNo2HiLCjaKpBsFEXUO9AzZ5NdB3DwEAY
 +t0avkO9BSQM7Osa5LPqU0DdkduSrDFMLuouk4n+iFn94eiy0XvBlwGQ4x8FflcTjI3p
 poRTU/fj0C8SSvOL85yD6svcVMbHJWMEuOqArXbXY/3X2B939W8z0qJSUGedOev8EHsb
 spOg==
X-Gm-Message-State: AOAM530BdUzjAImhv0UupooVXFSqbcWQBCwq+wUrA3i72+i8iIDNBwZS
 PTzhZsfLS3NO4RT9zHwEgmH3qIU2TfB7uBMWNlT6fIis3S35Kimt6AK72onz9VgcdRPGbQ2U/3G
 IQ/p/T86gVTFXW/DVTetm/8XlR14iZztAWeQmnmE1wQ6+Kh/oXlUV0/23CLPma/M7
X-Received: by 2002:a50:fe08:: with SMTP id f8mr5646707edt.217.1615314453638; 
 Tue, 09 Mar 2021 10:27:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXOcB/iW1PfnTntYx57G0zbFJG1OuN8NJOGsr9wLYuIB3ixSzYgJP8QYeCuM5F2SBbvSIWyA==
X-Received: by 2002:a50:fe08:: with SMTP id f8mr5646680edt.217.1615314453455; 
 Tue, 09 Mar 2021 10:27:33 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b19sm9571453edu.51.2021.03.09.10.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 10:27:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/6] net/eth: Initialize input_size variable earlier
Date: Tue,  9 Mar 2021 19:27:06 +0100
Message-Id: <20210309182709.810955-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309182709.810955-1-philmd@redhat.com>
References: <20210309182709.810955-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Initialize the 'input_size' variable earlier to make the
next commit easier to review.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 net/eth.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/eth.c b/net/eth.c
index 6a5a1d04e0b..77af2b673bb 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -405,11 +405,10 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
                         struct ip6_ext_hdr *ext_hdr,
                         struct in6_address *dst_addr)
 {
+    size_t input_size = iov_size(pkt, pkt_frags);
     struct ip6_ext_hdr_routing *rthdr = (struct ip6_ext_hdr_routing *) ext_hdr;
 
     if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
-
-        size_t input_size = iov_size(pkt, pkt_frags);
         size_t bytes_read;
 
         if (input_size < ext_hdr_offset + sizeof(*ext_hdr)) {
-- 
2.26.2


