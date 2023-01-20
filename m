Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB1C67545E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:27:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqTr-0002Rm-Ic; Fri, 20 Jan 2023 07:26:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqTn-0002Qh-Mz
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:26:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqTl-0000Gu-Lw
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:26:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674217602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FnJbH5DKOPt9PEf3gTUsbrsFxhns+/Y6DAnIUGKN6/I=;
 b=OBfr71A3QRE5NH8IOgs2xsR7apI0v0OcLNSPLxQ4yPt3YfsLnQaOkZePfdKRDal7EJRqMV
 5ZqdecIi2YU4Dp7SSyMe+Dw0OG7EaTjSEGL0qlmvOPof3ZvwSf4H1iv91w6z5vA6+PiRMZ
 JQFUJcUosbxW2rYCjfnxOzj0ntLdYns=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-C_I3qRH5P8Gzukt6g2Z3CA-1; Fri, 20 Jan 2023 07:26:39 -0500
X-MC-Unique: C_I3qRH5P8Gzukt6g2Z3CA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CF9F381494A;
 Fri, 20 Jan 2023 12:26:39 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 523E940C1141;
 Fri, 20 Jan 2023 12:26:38 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 01/38] tests/qemu-iotests/312: Mark "quorum" as required driver
Date: Fri, 20 Jan 2023 13:25:56 +0100
Message-Id: <20230120122633.84983-2-kwolf@redhat.com>
In-Reply-To: <20230120122633.84983-1-kwolf@redhat.com>
References: <20230120122633.84983-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Thomas Huth <thuth@redhat.com>

"quorum" is required by iotest 312 - if it is not compiled into the
QEMU binary, the test fails. Thus list "quorum" as required driver
so that the test gets skipped in case it is not available.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230104114601.269351-1-thuth@redhat.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/312 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qemu-iotests/312 b/tests/qemu-iotests/312
index 4139745f0e..0d9ea09a31 100755
--- a/tests/qemu-iotests/312
+++ b/tests/qemu-iotests/312
@@ -52,6 +52,7 @@ _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
 _unsupported_imgopts cluster_size data_file
+_require_drivers quorum
 
 echo
 echo '### Create all images' # three source (quorum), one destination
-- 
2.38.1


