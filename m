Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED8467AEBA
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 10:48:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKcNl-0005g4-7e; Wed, 25 Jan 2023 04:47:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sir@cmpwn.com>) id 1pKcNh-0005bx-Ns
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 04:47:50 -0500
Received: from out-191.mta0.migadu.com ([2001:41d0:1004:224b::bf])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sir@cmpwn.com>) id 1pKcNf-0000iU-HS
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 04:47:49 -0500
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cmpwn.com; s=key1;
 t=1674640062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hlTwfyGugdffQqsINlZXFb4xlbpLBCdYQslj8nS7NEk=;
 b=ojUNjTGIBIOXyTqhHyTyST0xzrAt8xpYzXpNLptbBZhG+c5REZptHHKSKSimL1XhQcVqaZ
 UnkQEwCZeF+Xi5NflzWfMpSwm8/rnwTEHD29I7Q+KYPyfCIZ/Y7Pd2BRBYx01v/zCTY5cp
 IaTN6587qET88bkxLP3HDhp3l79ilykdUSvtyG/7+RpH5LBdWHvmwp9G2wEhlO3ImYfAAC
 c5AKtLpx3AVIscsou+Lb8RqdbBhkLuIXRCZBSRbelyAn2tZpGi1/Dlyic0odqtVXu6ma7P
 OKIIF4mLXnyoIRukWQARPzWYbaEP2lI+IlNsgZzInyZeBgNMtqWocGlrIngZ3g==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Jan 2023 10:47:41 +0100
Message-Id: <CQ16CVQJHGJJ.3BJ39RGPXBEAW@taiga>
Cc: "Helge Deller" <deller@gmx.de>, =?utf-8?b?RGFuaWVsIFAgLiBCZXJyYW5nw6k=?=
 <berrange@redhat.com>
Subject: Re: [PATCH v5 0/5] linux-user: implement execveat
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Drew DeVault" <sir@cmpwn.com>
To: "Laurent Vivier" <laurent@vivier.eu>,
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
References: <20221104173632.1052-1-philmd@linaro.org>
 <b062ef26-c73c-e76e-70bc-bb081fbb61de@vivier.eu>
In-Reply-To: <b062ef26-c73c-e76e-70bc-bb081fbb61de@vivier.eu>
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=2001:41d0:1004:224b::bf;
 envelope-from=sir@cmpwn.com; helo=out-191.mta0.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Wed Jan 25, 2023 at 10:46 AM CET, Laurent Vivier wrote:
> Applied to my linux-user-for-8.0 branch.

Thanks!

