Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD2C23F7A0
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Aug 2020 14:45:29 +0200 (CEST)
Received: from localhost ([::1]:33830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k4OE3-00051G-PX
	for lists+qemu-devel@lfdr.de; Sat, 08 Aug 2020 08:45:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1k4OCr-0004a9-Eq
 for qemu-devel@nongnu.org; Sat, 08 Aug 2020 08:44:13 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:17185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1k4OCn-0007Cp-9D
 for qemu-devel@nongnu.org; Sat, 08 Aug 2020 08:44:11 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 051FD745953;
 Sat,  8 Aug 2020 14:43:57 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C38BC745712; Sat,  8 Aug 2020 14:43:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C210C745702;
 Sat,  8 Aug 2020 14:43:56 +0200 (CEST)
Date: Sat, 8 Aug 2020 14:43:56 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: till <811683@bugs.launchpad.net>
Subject: Re: [Bug 811683] Re: 7400, 7410, 7450 cpus vector have wrong exception
 prefix at reset
In-Reply-To: <159688296990.21910.647956033834590534.malone@chaenomeles.canonical.com>
Message-ID: <alpine.BSF.2.22.395.2008081439260.46861@zero.eik.bme.hu>
References: <20110716214931.3466.65125.malonedeb@soybean.canonical.com>
 <159688296990.21910.647956033834590534.malone@chaenomeles.canonical.com>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 10%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/08 08:43:57
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Please don't close ticket if there's a known problem just to at least 
document there's a problem. Is this a CPU feature or board specific?

Doesn't these CPUs have some way to select the exception vectors base and 
could that be set wrong? I've also seen some problems with these CPUs but 
last time I asked nobody answered:
https://lists.nongnu.org/archive/html/qemu-ppc/2020-03/msg00292.html
Could this bug be related to that?

