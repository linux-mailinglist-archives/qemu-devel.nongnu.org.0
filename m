Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D063196A3
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 00:31:09 +0100 (CET)
Received: from localhost ([::1]:54878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lALQS-0000uP-0m
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 18:31:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lALOB-0008Bn-Pl
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 18:28:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lALO8-0001Eg-RW
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 18:28:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613086123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5+3f2r4m6R2iFNPDerEd3X+YbQZTmmkdTeoGxTVjodY=;
 b=Pltx83y6K9wZivxmhpTD73gDcuAVHHaG7ApH9I2BPqAv8dV8Oy59ayGvPfkCyv090JUc9I
 RT+yUBLCrQSkDX3RPUUJJ62ATVZZGK212g/Mi3FHbHPDKDLF7YgAggNfgRfWa3SbVcQqax
 jyh+gFxivfWqgZwtA/1AOgJvPe3oqjE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-WiQlbmUkMdGcaPyxj3tcGw-1; Thu, 11 Feb 2021 18:28:41 -0500
X-MC-Unique: WiQlbmUkMdGcaPyxj3tcGw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EBAB801FD8;
 Thu, 11 Feb 2021 23:28:40 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-89.rdu2.redhat.com
 [10.10.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6068762678;
 Thu, 11 Feb 2021 23:28:36 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] Acceptance Tests: bump Avocado version requirement to 85.0
Date: Thu, 11 Feb 2021 18:28:34 -0500
Message-Id: <20210211232835.2608059-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is being proposed as a separate single patch simply to show=0D
that no known regressions have been introduced as far as the=0D
acceptance tests/jobs are related.  CI job:=0D
=0D
   https://gitlab.com/cleber.gnu/qemu/-/pipelines/255122420=0D
=0D
This version (and 84.0) contain improvements that address specific=0D
QEMU use cases, including:=0D
=0D
 * Being able to download and use Fedora 31 images and thus=0D
   re-activate the "boot_linux.py" tests=0D
=0D
 * Being able to register local assets via "avocado assets register"=0D
   and use them in tests=0D
=0D
Cleber Rosa (1):=0D
  Acceptance Tests: bump Avocado version requirement to 85.0=0D
=0D
 tests/requirements.txt | 2 +-=0D
 1 file changed, 1 insertion(+), 1 deletion(-)=0D
=0D
--=20=0D
2.25.4=0D
=0D


