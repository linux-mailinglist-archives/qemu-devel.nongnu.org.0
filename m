Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0B8303BCE
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 12:39:39 +0100 (CET)
Received: from localhost ([::1]:34600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Mh8-0006xY-Ew
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 06:39:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4MWt-0006IZ-L6
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:29:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l4MWl-0003gq-PL
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:29:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611660534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cwUreLFAlgw4Ko5GaFdgcv8ckaMTl11AQV+twWsQ3mU=;
 b=J2LpjrOTzYDcoMgkQRg67ta76vIv0qxmsGvqW0eiUyyji/2XqrSU1mLKPoz8jy3wsyLHhf
 vsv3VerDUFJW6CxR9fIPiM+96R7BpybnSfZotuUB53epuaS3OJqQ44yX+NOGbuVc5zoxO8
 LysJADzbtNqMlgHfdiWRuWpD6FJUMBU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-ZEGF7Mb3PZmYGVYtudTI8g-1; Tue, 26 Jan 2021 06:28:53 -0500
X-MC-Unique: ZEGF7Mb3PZmYGVYtudTI8g-1
Received: by mail-ej1-f72.google.com with SMTP id z2so4826980ejf.3
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 03:28:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cwUreLFAlgw4Ko5GaFdgcv8ckaMTl11AQV+twWsQ3mU=;
 b=iRAJf1wzZdBu+mPdgp4bV5qBybelVQIQ4RUbCWTXLMHSbdOXP8lnxqcfLhSr7HnbOo
 NGSmITq3sNM9omUefEAUtwU8xGR51Xc2gNOgf/GKTPsZWFAVBqPY0Zs3AKMnJ59Tu4md
 nn+of9ApLortOczSmtLxdpFtrHtg5zxa503nyMBEwAu+NJT4x0Wu9LJTvJ2e8frQGilR
 vS6C4XJ9Z5foNnit+7wH8z585pdH0lxghpkQFAtzyHlrhT6naGu85QPTj6kAet26si2G
 gCAKsQlwPqGm+uT9vHGAdaCy0Hbhag+3wZc8ZDp+hENkjW4lhPugHn1mVkUnb6hqsvLf
 Skww==
X-Gm-Message-State: AOAM5329SVjUL72c/UZiHMH/QBX7cVRxCTbVtSrExrugHpO4QEUas5qw
 0hm4XfoET/Ot6OwJGApMNpeEV6P1hbT+oPg4Vtgh7v/Fd3jsfrGADBrra9UGQSDc83JPmB5fWOS
 aBWNjIDRyxxxbSOUDLF8mXriJ2ePQ/poDdmSBjS4VpXnQ2onBjmVX2GLb125O49af
X-Received: by 2002:aa7:d9c3:: with SMTP id v3mr4103119eds.133.1611660531665; 
 Tue, 26 Jan 2021 03:28:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRowPhI5MC8B5f6X1fbcRIh751abzMDDf7kNVarK7W+W4/xBvrd3gLbjFHRWY64Sjbe3FMyA==
X-Received: by 2002:aa7:d9c3:: with SMTP id v3mr4103100eds.133.1611660531439; 
 Tue, 26 Jan 2021 03:28:51 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id n5sm10666356edw.7.2021.01.26.03.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 03:28:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/2] MAINTAINERS: Cover fuzzer reproducer tests within
 'Device Fuzzing'
Date: Tue, 26 Jan 2021 12:28:49 +0100
Message-Id: <20210126112849.3145695-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210126111638.3141780-1-philmd@redhat.com>
References: <20210126111638.3141780-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Thomas Huth <thuth@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we started to commit the fuzzer QTest reproducers to
fuzz-test.c in commit d8dd1095019 ("qtest: add fuzz test case"),
we forgot to add the corresponding MAINTAINERS entry. Do it now.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e275c81fd49..1b88753b325 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2571,6 +2571,7 @@ R: Stefan Hajnoczi <stefanha@redhat.com>
 R: Thomas Huth <thuth@redhat.com>
 S: Maintained
 F: tests/qtest/fuzz/
+F: tests/qtest/fuzz-*test.c
 F: scripts/oss-fuzz/
 F: docs/devel/fuzzing.rst
 
-- 
2.26.2


