Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DB466166C
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 17:12:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEYGY-0002pa-P5; Sun, 08 Jan 2023 11:11:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hc94@poolhem.se>) id 1pEYGW-0002p9-7G
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 11:11:20 -0500
Received: from mailout12.inleed.net ([2a0b:dc80:cafe:112::1]
 helo=ns12.inleed.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hc94@poolhem.se>) id 1pEYGT-0003yA-Ra
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 11:11:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=poolhem.se; 
 s=x;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8ALXsaBxDFGL18z39u0pLEnRjGI9SDKkLJj1ubN7ps4=; b=LYD9xMzFxnujjU1sC6G6EZgelc
 eSaVEgR/zUaiQp1qOIwzSFQTszc35eYzLj1wNh/+/GYUGQKokVjK0vX4CpAfx857yFv9vCfgqMI8i
 3WIZR7eBxGDxbQSzz35Y9s477FBp6mP4M8BSWM6//Bq+oTT+XvSWTgr9I3dYvFjHk8fadiCQiZ62B
 VFnTQiWUqnvg9rOfFSOdDcnGU1VLw8cmPIuxcvR97gbWG/77X9B7zeQk+ccUMky1X/9uM+ieacCba
 6GLUsWT7hv2dR6dm9dz5aoTrrm6tAB25NNqKnw4G8tc8LdOEM/l7rgrAlSH+hfWQg7kQGkCjRsbIM
 Nqp9x5cQ==;
Received: from [213.115.245.47] (helo=balrog.lkp.se)
 by ns12.inleed.net with esmtpa (Exim 4.96)
 (envelope-from <hc94@poolhem.se>) id 1pEYGS-00Bvm1-29
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 17:11:16 +0100
Date: Sun, 8 Jan 2023 17:11:11 +0100
From: Henrik Carlqvist <hc94@poolhem.se>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH qemu v3 0/1] Emulating sun keyboard language layout dip
 switches
Message-Id: <20230108171111.4d2a2201.hc94@poolhem.se>
In-Reply-To: <TY0PR0101MB4285AC0905312A82102F3348A4F99@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
References: <TY0PR0101MB4285923FBE9AD97CE832D95BA4E59@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
 <TY0PR0101MB4285AD60FE3976F1AD5C6D02A4F89@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
 <87zgau1wgc.fsf@linaro.org>
 <TY0PR0101MB4285AC0905312A82102F3348A4F99@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
X-Mailer: Sylpheed version 0.9.7 (GTK+ 1.2.10; i686-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authenticated-Id: henrik@poolhem.se
Received-SPF: none client-ip=2a0b:dc80:cafe:112::1;
 envelope-from=hc94@poolhem.se; helo=ns12.inleed.net
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_SOFTFAIL=0.732, SPF_NONE=0.001 autolearn=no autolearn_force=no
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

> Year 2020 I made 2 attempts to contribute this patch. Unfortunately "git
> format-patch" produced crippled patches which were not possible to
> apply. Some @@-lines got extra code that didn't belong in those lines.
> Now I am instead trying to send my patch using sourcehut. Unfortunately,
> it seems as if the patch created by sourcehut is still crippled,

Much to my surprise, it seems as if the patch created and sent by sourcehut
applies cleanly. I falsely thought that it was the source text after the @@
lines that caused the problems, but it turned out that when I sent my first
attempts by mail lines got wrapped by my email client and those wrapped lines
caused the problem.

The patch v2 which 2020 I created manually with git and sent by email got a
nice"singed-off-by" line, the patch v3 created by sourcehut misses that line.

Is the missing signed-off-by line a show stopper? If so, is sourcehut somehow
usable to post patches? If sourcehut is unusable for this purpose I might have
to send the patch as email again, but to avoid lines getting wrapped I will
then post them as attachements instead of the preferred way as inline in the
email text.

regards Henrik

