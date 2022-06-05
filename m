Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7AD53DC5B
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jun 2022 16:50:19 +0200 (CEST)
Received: from localhost ([::1]:55128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxra6-0001Z1-3U
	for lists+qemu-devel@lfdr.de; Sun, 05 Jun 2022 10:50:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1nxrXy-00009x-DW
 for qemu-devel@nongnu.org; Sun, 05 Jun 2022 10:48:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1nxrXu-0005We-U5
 for qemu-devel@nongnu.org; Sun, 05 Jun 2022 10:48:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654440480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VZRHxZI4iJx8q+NoMQ9aUfJDqIQH8XYrU6NnYx0qBCU=;
 b=NesrO5rm6kyFuSM40vq8R9ZQDgRNqGdsQE/JRXkumm9go64mmsgXy0VAOwyb4qbX6oIXCe
 vApGvBE/rOGyOEVWts6B7IUFoaJrOMriTuIssy1mJiQwfw8mcsWgEcjl6pyg88ZaOmoluC
 fXNsEkVWKL7LHydqFcKjlhtb+QDBfhc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-nmJczcEhO8Od0isMmxo16Q-1; Sun, 05 Jun 2022 10:46:34 -0400
X-MC-Unique: nmJczcEhO8Od0isMmxo16Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3CDAA801E67
 for <qemu-devel@nongnu.org>; Sun,  5 Jun 2022 14:46:34 +0000 (UTC)
Received: from [10.22.16.54] (unknown [10.22.16.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1544240CF8EF;
 Sun,  5 Jun 2022 14:46:34 +0000 (UTC)
Message-ID: <d2847516-b923-5301-f20f-8d4704a41b2c@redhat.com>
Date: Sun, 5 Jun 2022 10:46:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
From: Cole Robinson <crobinso@redhat.com>
Subject: dbus-display-test is flakey
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc-André,

dbus-display-test seems flakey. I'm occasionally seeing:

▶ 692/746
ERROR:../tests/qtest/dbus-display-test.c:68:test_dbus_display_vm:
assertion failed
(qemu_dbus_display1_vm_get_name(QEMU_DBUS_DISPLAY1_VM(vm)) ==
"dbus-test"): (NULL == "dbus-test") ERROR

Examples:

fedora rawhide x86_64:
https://kojipkgs.fedoraproject.org//work/tasks/4945/87834945/build.log
fedora rawhide aarch64:
https://kojipkgs.fedoraproject.org//work/tasks/4946/87834946/build.log
fedora 35 x86_64:
https://download.copr.fedorainfracloud.org/results/@virtmaint-sig/virt-preview/fedora-35-x86_64/04491978-qemu/builder-live.log.gz

This is qemu v7.0.0 with some unrelated patches on top. /usr/bin/make -O
-j5 V=1 VERBOSE=1 check

Side question: I know I can patch meson.build to skip the test, or
similar patch changes, but is there a non-patch way to skip specific tests?

Thanks,
Cole


