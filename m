Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 823C36605B8
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 18:30:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDqWq-0004TP-4m; Fri, 06 Jan 2023 12:29:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pDqWb-0004Pu-75; Fri, 06 Jan 2023 12:29:02 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pDqWZ-0004R3-2x; Fri, 06 Jan 2023 12:29:00 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 2C1BE20B92AA;
 Fri,  6 Jan 2023 09:28:56 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2C1BE20B92AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1673026137;
 bh=P7KG7W2xk0l0+mElEeVX1hNHOHzvVAM/573gniUSkoE=;
 h=From:To:Cc:Subject:Date:From;
 b=LHLN+S0uNy2OBxkW8kKqjB4NrCYL/xrB6Td15NZ+w8wo6X4xqidCA8axKoO0prMqU
 gsyJDD0I5Td7R8o9pW3Cl4Y11KbpMZjTFJa31ChVWWNd5773mbmHqkjkvG0TzbFEq8
 5pXRUIoVQyMtD0jcGiiRlJtwSk2/hX5C8dVl7SaY=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org
Subject: [PATCH 0/2] Series of fixes for PL011 char device
Date: Fri,  6 Jan 2023 18:28:49 +0100
Message-Id: <20230106172851.2430-1-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

Evgeny Iakovlev (2):
  hw/char/pl011: better handling of FIFO flags on LCR reset
  hw/char/pl011: check if UART is enabled before RX or TX operation

 hw/char/pl011.c         | 51 ++++++++++++++++++++++++++++++-----------
 include/hw/char/pl011.h |  5 +++-
 2 files changed, 41 insertions(+), 15 deletions(-)

-- 
2.34.1


