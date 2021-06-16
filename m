Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3110D3AA598
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:49:52 +0200 (CEST)
Received: from localhost ([::1]:41144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcTv-0002ZS-19
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcO7-0001JY-Nk
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:43:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcO4-0000Yl-LA
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:43:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623876227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p5nJW7GzOlB+OjmQ+29ZyDcsW+yUWhYkO5dsX/39F4M=;
 b=JnQvzQHUNphWU2i+bmr1v14Gcrar27Fe7XQDeaNDM7pKjSSK7I2k3mVEfMF+HNJ5Ts+p0u
 Yr6cVAcqN/aE7HJEII5oTkI3D+71UDM2ku2WIvL+E2mjze1ZbsW8Hznwun7aaZUuf3j6ZF
 g5GcvqsrrJuAaR2urJVXln3pILkEc+o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-Dbz_2vkMNxKnbvwFsqEhqA-1; Wed, 16 Jun 2021 16:43:38 -0400
X-MC-Unique: Dbz_2vkMNxKnbvwFsqEhqA-1
Received: by mail-wr1-f70.google.com with SMTP id
 l13-20020adfe9cd0000b0290119a0645c8fso1862929wrn.8
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 13:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p5nJW7GzOlB+OjmQ+29ZyDcsW+yUWhYkO5dsX/39F4M=;
 b=CpCKEVq3ik9CABRS+7G2AAqQo91FOxERmzMXJsAv6cDZ+9mnZdrWlO+SF7ODxzBKZT
 QiTaip2FIOSOZKZk2dNoE1xeUg0HZ7MAA+mmxkdIv2I00V3b6mmOXZQziHLmrCpFViy+
 86Urxom8Zwvx3nSCV7xJ5z6amQOWblMETRl8mU+OIPFTVaBeyNurttmtmSsQ1AMbLZm3
 qnZWEC7C/TqYFQtGCp5/MO9Nfr49kkSv4TjXswSrHkcD/rN4u74O7BMLsOdxA9ya7eOf
 7XYFsP1Kf+cSr7OEdwEeHLUG+20OyP5h4yse4NPbD3UGgK7t8OgFZkQ5VG59iF/8iqQy
 sEAQ==
X-Gm-Message-State: AOAM533BoKOROeScWRJJRTMXBVeDoIx931l0c9eBnDIBmg+t9BXd81wn
 SFGVZh7biHxxk71XelVp2T/Y8ORoldgAInsoDuo47WUhpfNhGbj57oYERQfPtj+a5DJbWuzwQpg
 0Ye841UH1z0+va5xIzucUOGu6hPP6fpNSNdeciwecTVaI2roNAlX4x2hLlnJPHCB6
X-Received: by 2002:a5d:47cb:: with SMTP id o11mr1206100wrc.38.1623876217732; 
 Wed, 16 Jun 2021 13:43:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxzfVDe9Le5QIWMAnO/CnzKYxXfzaVeVird4uqsJsQdTOKfE0MzqO+PYmR36IOxzeZJuKcIQ==
X-Received: by 2002:a5d:47cb:: with SMTP id o11mr1206072wrc.38.1623876217584; 
 Wed, 16 Jun 2021 13:43:37 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id v7sm3216962wru.66.2021.06.16.13.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 13:43:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/23] MAINTAINERS: Add Connor Kuehl as reviewer for AMD SEV
Date: Wed, 16 Jun 2021 22:43:06 +0200
Message-Id: <20210616204328.2611406-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616204328.2611406-1-philmd@redhat.com>
References: <20210616204328.2611406-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Connor Kuehl <ckuehl@redhat.com>

It may not be appropriate for me to take over as a maintainer at this time,
but I would consider myself familiar with AMD SEV and what this code is
meant to be doing as part of a VMM for launching SEV-protected guests.

To that end, I would be happy to volunteer as a reviewer for SEV-related
changes so that I am CC'd on them and can help share the review burden with
whoever does maintain this code.

Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210608192537.103584-1-ckuehl@redhat.com>
[PMD: Cover more files]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ccdb81c9f62..fbfaaa54721 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2937,6 +2937,13 @@ F: hw/core/clock-vmstate.c
 F: hw/core/qdev-clock.c
 F: docs/devel/clocks.rst
 
+AMD Secure Encrypted Virtualization (SEV)
+R: Connor Kuehl <ckuehl@redhat.com>
+F: docs/amd-memory-encryption.txt
+F: accel/kvm/sev-stub.c
+F: target/i386/sev*
+F: include/sysemu/sev.h
+
 Usermode Emulation
 ------------------
 Overall usermode emulation
-- 
2.31.1


