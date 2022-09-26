Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0375EAE6E
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 19:45:27 +0200 (CEST)
Received: from localhost ([::1]:50848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocsAS-00055K-Su
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 13:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocrao-0005iX-7h
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:08:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocraj-0005T9-RH
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:08:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664212104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=drWi1DHiUWr7wK/Lif2h9vxTEvOepXqQd7lJiDXyv6s=;
 b=U+Cb9Oh3auGMzKmgC5++hGpKhdrnhubJVpU5RfGy2uWtGt6SbRXrlunx4KyonQTGE90R6R
 i6Fpu8dWreIwk9b2lelkQIZcOyTugJUiDoH3Q33jgxtSFyxN/iloe1uBqKGEudogPF3DMP
 gf/kspkzvA7rdzDgnajqkJtkL2pkriY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-1Iuj7SsNMT6vhpTO7Ba-QA-1; Mon, 26 Sep 2022 13:08:21 -0400
X-MC-Unique: 1Iuj7SsNMT6vhpTO7Ba-QA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDA9A185A794;
 Mon, 26 Sep 2022 17:08:20 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77083140EBF4;
 Mon, 26 Sep 2022 17:08:18 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Chenyi Qiang <chenyi.qiang@intel.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PULL 05/14] configure: Add -Wno-gnu-variable-sized-type-not-at-end
Date: Mon, 26 Sep 2022 19:07:55 +0200
Message-Id: <20220926170804.453855-6-thuth@redhat.com>
In-Reply-To: <20220926170804.453855-1-thuth@redhat.com>
References: <20220926170804.453855-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Chenyi Qiang <chenyi.qiang@intel.com>

A Linux headers update to v6.0-rc switches some definitions from GNU
'zero-length-array' extension to the C-standard-defined flexible array
member. e.g.

struct kvm_msrs {
        __u32 nmsrs; /* number of msrs in entries */
        __u32 pad;

-       struct kvm_msr_entry entries[0];
+       struct kvm_msr_entry entries[];
};

Those (unlike the GNU zero-length-array) have some extra restrictions like
'this must be put at the end of a struct', which clang build would complain
about. e.g. the current code

struct {
        struct kvm_msrs info;
        struct kvm_msr_entry entries[1];
} msr_data = { }

generates the warning like:

target/i386/kvm/kvm.c:2868:25: error: field 'info' with variable sized
type 'struct kvm_msrs' not at the end of a struct or class is a GNU
extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
        struct kvm_msrs info;
                        ^
In fact, the variable length 'entries[]' field in 'info' is zero-sized in
GNU defined semantics, which can give predictable offset for 'entries[1]'
in local msr_data. The local defined struct is just there to force a stack
allocation large enough for 1 kvm_msr_entry, a clever trick but requires to
turn off this clang warning.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Chenyi Qiang <chenyi.qiang@intel.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20220915091035.3897-2-chenyi.qiang@intel.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 0bbf9d28af..78e0ab8db4 100755
--- a/configure
+++ b/configure
@@ -1258,6 +1258,7 @@ add_to nowarn_flags -Wno-string-plus-int
 add_to nowarn_flags -Wno-typedef-redefinition
 add_to nowarn_flags -Wno-tautological-type-limit-compare
 add_to nowarn_flags -Wno-psabi
+add_to nowarn_flags -Wno-gnu-variable-sized-type-not-at-end
 
 gcc_flags="$warn_flags $nowarn_flags"
 
-- 
2.31.1


