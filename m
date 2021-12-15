Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82ECD474EE7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:11:01 +0100 (CET)
Received: from localhost ([::1]:60132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxHsq-0004fi-HA
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:11:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simonb@NetBSD.org>) id 1mxHjx-0000LQ-WC
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 19:01:50 -0500
Received: from thoreau.thistledown.com.au ([203.214.66.21]:55327)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <simonb@NetBSD.org>) id 1mxHjv-0004be-KQ
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 19:01:49 -0500
Received: from thoreau.thistledown.com.au (localhost [127.0.0.1])
 by thoreau.thistledown.com.au (Postfix) with ESMTP id F19873926;
 Wed, 15 Dec 2021 11:01:39 +1100 (AEDT)
From: Simon Burge <simonb@NetBSD.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2] MIPS - fix cycle counter timing calculations
In-Reply-To: Your message of "Tue, 14 Dec 2021 16:12:46 +0100"
 <d41a520d-8593-16fe-8ce6-e45b6288c336@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3778.1639526499.1@thoreau.thistledown.com.au>
Date: Wed, 15 Dec 2021 11:01:39 +1100
Message-Id: <20211215000139.F19873926@thoreau.thistledown.com.au>
Received-SPF: neutral client-ip=203.214.66.21; envelope-from=simonb@NetBSD.org;
 helo=thoreau.thistledown.com.au
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= wrote:

> Minor comment, it is better to post patch iterations as new thread,
> and not as reply to older patch, because in thread view your new
> patch might ended hidden / lost.

Ah, my bad.  I misread the part about using in-reply-to in the patch
submission page.

> Patch queued to mips-next, thanks.

Thanks!

Cheers,
Simon.

