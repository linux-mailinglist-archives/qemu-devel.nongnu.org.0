Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 024C22BC25A
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 23:04:47 +0100 (CET)
Received: from localhost ([::1]:49260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgazt-0003sq-Kc
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 17:04:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1kgayd-0003QV-Ch
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 17:03:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1kgayY-0003X9-9L
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 17:03:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605996199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iv838mtsyA6TwaDdAkZowdE6W2a79bpVD2iw8X/QXII=;
 b=WlO0LT52mc8OkfN4rZLt2hG9jD1kZWY3dFc3cQhebMRpfHpfTYpdgOPCXXeYeMaFKwzZVq
 vcQUwFHCaooh5D4vtHjMOOK202QP83lRbksdGqfht8ehUC265vKO+9EXuwbQxyg3dWrDsP
 j//9l/C4edtlzMN/RAvY1rT/kAeYdkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-2OJhTGMQPOSxVfZ3XGuWzw-1; Sat, 21 Nov 2020 17:03:16 -0500
X-MC-Unique: 2OJhTGMQPOSxVfZ3XGuWzw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8974E1005D70;
 Sat, 21 Nov 2020 22:03:15 +0000 (UTC)
Received: from [10.10.112.7] (ovpn-112-7.rdu2.redhat.com [10.10.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D54C660BF3;
 Sat, 21 Nov 2020 22:03:14 +0000 (UTC)
To: qemu-devel <qemu-devel@nongnu.org>
From: Cole Robinson <crobinso@redhat.com>
Subject: virtio-9p-test.c:300:v9fs_req_recv: assertion failed (hdr.id == id):
 (7 == 73)
Message-ID: <fad8a69d-9c21-ac25-028d-646a64ccecc5@redhat.com>
Date: Sat, 21 Nov 2020 17:03:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crobinso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: oss@crudebyte.com, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, I'm consistently seeing this assertion running the qemu-5.2.0  test
suite. rc0, rc1, rc2 have been consistently affected, it reproduces
consistently in parts of Fedora's build system. Here's an example build
log for rc2 x86 against Fedora 32

https://download.copr.fedorainfracloud.org/results/@kubevirt/qemu-5.2.0-0.6.rc2/fedora-32-x86_64/01781514-qemu/builder-live.log.gz

The full test error:

...
PASS 26 qtest-arm/qos-test
/arm/virt/virtio-mmio/virtio-bus/virtio-9p-device/virtio-9p/virtio-9p-tests/synth/readdir/split_128
PASS 27 qtest-arm/qos-test
/arm/virt/virtio-mmio/virtio-bus/virtio-9p-device/virtio-9p/virtio-9p-tests/local/config
Received response 7 (RLERROR) instead of 73 (RMKDIR)
ERROR qtest-arm/qos-test - Bail out!
ERROR:../tests/qtest/virtio-9p-test.c:300:v9fs_req_recv: assertion
failed (hdr.id == id): (7 == 73)
Rlerror has errno 95 (Operation not supported)
**
ERROR:../tests/qtest/virtio-9p-test.c:300:v9fs_req_recv: assertion
failed (hdr.id == id): (7 == 73)
make: *** [Makefile.mtest:1257: run-test-155] Error 1
error: Bad exit status from /var/tmp/rpm-tmp.EG4Dav (%check)


Thanks,
Cole


