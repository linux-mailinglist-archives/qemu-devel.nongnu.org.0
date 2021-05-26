Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E899D3921AF
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 22:57:50 +0200 (CEST)
Received: from localhost ([::1]:49508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm0b7-00054O-Fv
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 16:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1lm0Zf-0004Nj-Jm
 for qemu-devel@nongnu.org; Wed, 26 May 2021 16:56:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1lm0Zc-0003HX-NR
 for qemu-devel@nongnu.org; Wed, 26 May 2021 16:56:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622062575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Fg5KHQMtUhJuE1gtdNLnXwhYNU1JY7E5AK1GB+Bexro=;
 b=VKEjwGEpa4f15nmwW3XgzTs6N8+kIUhYuCB3bY4/VB/7ayanYXxq90Os9oiQxjUKj2uONJ
 2sW2RWzqs1iL0m8t3rj599ei+0gEb6AtYSR0va6IxK1KzOqdFOjrpYKRoCgnhuw1zMlBNw
 GT8HvRrpEaFw85piHRG3jBzXJeiwpbs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-381sRECMNga38SA9dddRFQ-1; Wed, 26 May 2021 16:56:11 -0400
X-MC-Unique: 381sRECMNga38SA9dddRFQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E880100747A
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 20:56:10 +0000 (UTC)
Received: from wrampazz.redhat.com (ovpn-113-115.rdu2.redhat.com
 [10.10.113.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A3C25C257;
 Wed, 26 May 2021 20:56:03 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] tests/acceptance: change armbian archive to a faster host
Date: Wed, 26 May 2021 17:56:00 -0300
Message-Id: <20210526205601.263444-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Successful run of acceptance-system-debian job on an empty cache of GitLab =
CI:=0D
https://gitlab.com/willianrampazzo/qemu/-/jobs/1296353352=0D
=0D
Pipeline run:=0D
https://gitlab.com/willianrampazzo/qemu/-/pipelines/310116951=0D
=0D
The measure of the download speed with the previous host:=0D
https://gitlab.com/willianrampazzo/qemu/-/pipelines/309442706=0D
=0D
The current host for the image=0D
Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz=0D
(archive.armbian.com) is extremely slow in the last couple of weeks,=0D
making the job running the test=0D
tests/system/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi_bioni=
c_20_08=0D
for the first time when the image is not yet on GitLab cache, time out=0D
while the image is being downloaded.=0D
=0D
This changes the host to one faster, so new users with an empty cache=0D
are not impacted.=0D
=0D
Signed-off-by: Willian Rampazzo <willianr@redhat.com>=0D
=0D
Willian Rampazzo (1):=0D
  tests/acceptance: change armbian archive to a faster host=0D
=0D
 tests/acceptance/boot_linux_console.py | 3 ++-=0D
 1 file changed, 2 insertions(+), 1 deletion(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


