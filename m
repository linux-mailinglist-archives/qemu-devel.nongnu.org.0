Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8421E2F8F07
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 20:58:29 +0100 (CET)
Received: from localhost ([::1]:45266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0riO-0007bY-6x
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 14:58:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l0rh7-0007BU-AD
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 14:57:09 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:27803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l0rh4-0005iR-MC
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 14:57:08 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0B70B7456E3;
 Sat, 16 Jan 2021 20:57:03 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C52A77456B8; Sat, 16 Jan 2021 20:57:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C3AD27456B7;
 Sat, 16 Jan 2021 20:57:02 +0100 (CET)
Date: Sat, 16 Jan 2021 20:57:02 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Harry Sintonen <1912065@bugs.launchpad.net>
Subject: Re: [Bug 1912065] [NEW] Segfaults in tcg/optimize.c:212 after commit
 7c79721606be11b5bc556449e5bcbc331ef6867d
In-Reply-To: <161081817733.30007.5357056175605529567.malonedeb@chaenomeles.canonical.com>
Message-ID: <18e275f4-a0fe-3318-f3a3-af8167eb2542@eik.bme.hu>
References: <161081817733.30007.5357056175605529567.malonedeb@chaenomeles.canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 10%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for reporting it. Just found it as well and reported on the mailing 
list. It's currently being investigated. List thread is here:

https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg03936.html

