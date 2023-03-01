Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758476A6D0B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 14:31:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXMXT-0001Hb-LM; Wed, 01 Mar 2023 08:30:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anton.kochkov@proton.me>)
 id 1pXMXO-0001HM-Ak
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:30:30 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anton.kochkov@proton.me>)
 id 1pXMXK-00049V-M2
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:30:28 -0500
Date: Wed, 01 Mar 2023 13:30:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1677677422; x=1677936622;
 bh=VQOSMcx1XZKSQkKRAcYIbmuFbhOZ247BCPgachZlL1w=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=RxC4Xk+vxZlimQarGDcS9poX6JEnnnCO2tEnQsiqm2qY9RdTFcaazIRALDvvXy93x
 pmQ/NNRrOnoVVNw93373za+ROC38IWuwclKgVgq1AgqbgzIETlXjvYHcDJMgZ49cEk
 CEvmFP/V3Tl+KRDbzTqKu6x87iRrSjluiWGZQ0wzDOCFcxo2cinhA0igjwawpZCCkK
 i5ylCJQ3mKvb7SaMRHojBRCZPXW80awwLar0tMWwUhtYMBBmdDozJ/2qeSKSIqMvLJ
 1+XfO5DA9QjCFnwAi5iyNv10BAdLd81uvwQ6o3wQ49YT1WDsADZL+VbLuskz90QsWy
 WX3rpNFstd2IQ==
To: qemu-devel@nongnu.org
From: Anton Kochkov <anton.kochkov@proton.me>
Subject: Writing TCG plugin - how to hook interrupts?
Message-ID: <Y/9TZO42Fh23Xqcs@localhost.localdomain>
Feedback-ID: 53490844:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.40.133;
 envelope-from=anton.kochkov@proton.me; helo=mail-40133.protonmail.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi,
Is it possible to set a hook for interrupts from the TCG plugin?
I searched in documentation, examples, and sources but found nothing of rel=
evance.
Did I miss something? Is this currently implemented?

Thank you for the answers.

Best regards,
Anton.


