Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D9F20B1CE
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 14:57:34 +0200 (CEST)
Received: from localhost ([::1]:58268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jonvB-0003IP-EZ
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 08:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkysel@tachyum.com>)
 id 1jontz-00029A-3L
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 08:56:19 -0400
Received: from mx1.tachyum.com ([66.160.133.170]:28695 helo=mail.tachyum.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkysel@tachyum.com>)
 id 1jontx-0001MK-J9
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 08:56:18 -0400
Received: by mail.tachyum.com (Postfix, from userid 1001)
 id 0F556216; Fri, 26 Jun 2020 05:56:15 -0700 (PDT)
Received: from tsk-dev-swd001.tachyum.sk (unknown [93.184.71.90])
 by mail.tachyum.com (Postfix) with ESMTP id 48477216;
 Fri, 26 Jun 2020 05:56:10 -0700 (PDT)
From: Matus Kysel <mkysel@tachyum.com>
To: mkysel@tachyum.com, riku.voipio@iki.fi, laurent@vivier.eu,
 qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] linux-user: support of semtimedop syscall 
Date: Fri, 26 Jun 2020 14:46:10 +0200
Message-Id: <20200626124612.58593-1-mkysel@tachyum.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=66.160.133.170; envelope-from=mkysel@tachyum.com;
 helo=mail.tachyum.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 07:27:33
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Updated version according Laurent's comments.

v3: split patch and add some arch specific modification	
 



