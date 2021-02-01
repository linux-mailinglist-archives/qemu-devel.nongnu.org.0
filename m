Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1332E30AC3F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 17:06:15 +0100 (CET)
Received: from localhost ([::1]:58288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6biQ-0002nl-55
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 11:06:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan.weil@weilnetz.de>)
 id 1l6bgi-0001YK-62
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:04:28 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:35656
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan.weil@weilnetz.de>)
 id 1l6bgf-0005yq-Cj
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:04:27 -0500
Received: from mobile-149-057.wlan.uni-mannheim.de
 (mobile-149-057.wlan.uni-mannheim.de [134.155.149.57])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id D0152DA164B;
 Mon,  1 Feb 2021 17:04:22 +0100 (CET)
Subject: Re: Makefile has local changes that will be overwritten
To: Programmingkid <programmingkidx@gmail.com>
References: <B8D9E184-5C5A-4A15-BF48-927F0138F0DE@gmail.com>
 <e18f2bd3-fcfd-2804-91d0-b4ecdb450bdc@weilnetz.de>
 <03FB77FD-2C50-40E5-8BE3-2F005D5056AA@gmail.com>
From: Stefan Weil <stefan.weil@weilnetz.de>
Message-ID: <b8717d48-4ba3-7dbc-6848-4e2cbd8f8b38@weilnetz.de>
Date: Mon, 1 Feb 2021 17:04:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <03FB77FD-2C50-40E5-8BE3-2F005D5056AA@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.120.169.71;
 envelope-from=stefan.weil@weilnetz.de; helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: ddstreet@canonical.com, Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.02.21 um 16:36 schrieb Programmingkid:

> Thank you for the suggestion. I tried it but didn't seem to help. I 
> should report this is what I see when I try to build QEMU:
> Disabling PIE due to missing toolchain support
> error: Your local changes to the following files would be overwritten by checkout:
> 	Makefile
> Please commit your changes or stash them before you switch branches.
> Aborting
> Unable to checkout '85e5d839847af54efab170f2b1331b2a6421e647' in submodule path 'dtc'
> /Users/john/Documents/Development/Projects/Qemu/qemu-git/scripts/git-submodule.sh: failed to update modules
>
> Unable to automatically checkout GIT submodules ' ui/keycodemapdb tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 meson dtc capstone slirp'.

So dtc/Makefile is causing the problem.

What does "git -C dtc diff" show?

"git -C dtc reset --hard" might fix the problem for you.

Stefan



