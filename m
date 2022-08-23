Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E43959E4EF
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 16:10:41 +0200 (CEST)
Received: from localhost ([::1]:35222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQUc4-0007xh-K3
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 10:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oQUVy-0002ka-KU
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 10:04:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oQUVv-0004Av-Ho
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 10:04:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661263459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=d+Vn1+Nxth1ryiEHR49OF8MMdkr/vsz2rqyLdsB2xSI=;
 b=eiDGCkSQd0Gv2/7pnUK1VL04ygRdj1vvETw7s8c0wO6RlTkZmI/gfl67iVIvpBfQu+k8FB
 j6x1gI0LY053OyMtJO5Np4BwZ82F9aW2g5yMqX1d+iuUnKBZPuCt+sZaiEifmkZT84/qY6
 N6xSK4Mt/SCgsMtgfdh7WBxigGiutjw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-qbdp0J7LPvONJtVXrx6ZeQ-1; Tue, 23 Aug 2022 10:04:15 -0400
X-MC-Unique: qbdp0J7LPvONJtVXrx6ZeQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F24263814960;
 Tue, 23 Aug 2022 14:04:14 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39F97492C3B;
 Tue, 23 Aug 2022 14:04:14 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 0/1] Block layer patches
Date: Tue, 23 Aug 2022 16:04:05 +0200
Message-Id: <20220823140406.73805-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The following changes since commit ba58ccbef60338d0b7334c714589a6423a3e7f91:

  Merge tag 'for-7.1-hppa' of https://github.com/hdeller/qemu-hppa into staging (2022-08-19 09:35:29 -0700)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 51e15194b0a091e5c40aab2eb234a1d36c5c58ee:

  scsi-generic: Fix emulated block limits VPD page (2022-08-23 16:01:13 +0200)

----------------------------------------------------------------
Block layer patches

- scsi-generic: Fix I/O errors due to wrong block limits

----------------------------------------------------------------
Kevin Wolf (1):
      scsi-generic: Fix emulated block limits VPD page

 hw/scsi/scsi-generic.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)


