Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A353B872C
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:38:12 +0200 (CEST)
Received: from localhost ([::1]:37522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lydE3-0001xm-VX
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyd8s-0005Gh-EP
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:32:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyd8j-0000Fo-W7
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:32:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625070760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3mYk0yoxK9nTk8soWTF46X3ls8SFUBa62JG5i859pIc=;
 b=G2IAKCDC86tcLamRmKauRXm9Z3PlTTWoXN/LTouQCNQpMs/k5IuOYSwmO64lon1PnCDxBk
 XC1ZYCmMQsnh/cE5kzog1GM+PHatWwIi1bv3Uw7QZMDMDSJJsQTfUhIrLz18RrrLP3cSbS
 +3Fp09YVCWWj8eemuqDts5iRZEPIQes=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-Yf3TZAyHNxOZuusNpOA9IQ-1; Wed, 30 Jun 2021 12:32:38 -0400
X-MC-Unique: Yf3TZAyHNxOZuusNpOA9IQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24C7F80430C
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 16:32:38 +0000 (UTC)
Received: from thuth.com (ovpn-113-129.ams2.redhat.com [10.36.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB9A25C1A3;
 Wed, 30 Jun 2021 16:32:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	kraxel@redhat.com
Subject: [PATCH 0/4] Improvements for the -display option
Date: Wed, 30 Jun 2021 18:32:27 +0200
Message-Id: <20210630163231.467987-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix some oddities of the -display option, deprecate the -no-quit
option and improve the documentation.

Thomas Huth (4):
  softmmu/vl: Remove obsolete comment about the "frame" parameter
  ui: Fix the "-display sdl,window_close=..." parameter
  ui: Mark the '-no-quit' option as deprecated
  qemu-options: Improve the documentation of the -display options

 docs/system/deprecated.rst | 12 +++++++++
 qemu-options.hx            | 50 +++++++++++++++++++++++++++-----------
 softmmu/vl.c               | 11 ++++++---
 3 files changed, 56 insertions(+), 17 deletions(-)

-- 
2.27.0


