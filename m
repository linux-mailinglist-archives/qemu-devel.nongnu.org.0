Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCAD489AF1
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 14:59:11 +0100 (CET)
Received: from localhost ([::1]:37288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6vCX-0007Z9-U8
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 08:59:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1n6v0i-0001oy-73
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:46:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1n6v0f-0006z8-3S
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 08:46:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641822411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yohAxh7aIY1j37z7ZwO35cGbhiaa38CEOOiYO6bP74E=;
 b=YHKDYAHzwhd0eyg7EsLu6CkPYJmFDCVzgeUa0A43zNj5cb6So/45wc0ItBXwGOvher5a0e
 v+Qi2YlLWHrwzLsEPo2ZJSWB+yf9voBW8tQNKewngUAbKbkFihLhQHX44D7daXGBLqvOWy
 Ung1EQDLPWhEqy8CQyVIehRODzJ+Wxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-346-UAoKJGpSO36MV7SlNUEKTg-1; Mon, 10 Jan 2022 08:46:48 -0500
X-MC-Unique: UAoKJGpSO36MV7SlNUEKTg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0C0783DD28;
 Mon, 10 Jan 2022 13:46:47 +0000 (UTC)
Received: from kostyanf14nb.Dlink (unknown [10.40.193.252])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BAF137BB41;
 Mon, 10 Jan 2022 13:46:46 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/9] qemu-ga-win patches
Date: Mon, 10 Jan 2022 15:46:35 +0200
Message-Id: <20220110134644.107375-1-kkostiuk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kkostiuk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit df722e33d5da26ea8604500ca8f509245a0ea524:

  Merge tag 'bsd-user-arm-pull-request' of gitlab.com:bsdimp/qemu into staging (2022-01-08 09:37:59 -0800)

are available in the Git repository at:

  https://github.com/kostyanf14/qemu.git tags/qga-win32-pull-2022-01-10

for you to fetch changes up to 206ce9699fae1f631ac74b7e1115db2affc759fd:

  qga-win: Detect Windows 11 by build number (2022-01-10 13:05:25 +0000)

----------------------------------------------------------------
qemu-ga-win patches

* Fix memory leak in get_pci_info function
* Add support for Windows 11 in guest-get-osinfo command


Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>

----------------------------------------------------------------
Kostiantyn Kostiuk (9):
      MAINTAINERS: Add entry for QEMU Guest Agent Windows components
      gqa-win: get_pci_info: Clean dev_info if handle is valid
      gqa-win: get_pci_info: Use common 'end' label
      gqa-win: get_pci_info: Free parent_dev_info properly
      gqa-win: get_pci_info: Split logic to separate functions
      gqa-win: get_pci_info: Add g_autofree for few variables
      gqa-win: get_pci_info: Replace 'while' with 2 calls of the function
      qga-win: Detect OS based on Windows 10 by first build number
      qga-win: Detect Windows 11 by build number

 MAINTAINERS          |   8 ++
 qga/commands-win32.c | 274 +++++++++++++++++++++++++++++----------------------
 2 files changed, 166 insertions(+), 116 deletions(-)

--
2.25.1


