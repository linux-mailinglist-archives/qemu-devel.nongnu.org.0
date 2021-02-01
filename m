Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCE830AA55
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:01:07 +0100 (CET)
Received: from localhost ([::1]:49326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ahO-0002be-3H
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:01:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan.weil@weilnetz.de>)
 id 1l6ael-00022d-4D
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 09:58:23 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:35038
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan.weil@weilnetz.de>)
 id 1l6aei-0001dJ-U9
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 09:58:22 -0500
Received: from mobile-149-057.wlan.uni-mannheim.de
 (mobile-149-057.wlan.uni-mannheim.de [134.155.149.57])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 3B2D6DA0D16;
 Mon,  1 Feb 2021 15:58:17 +0100 (CET)
From: Stefan Weil <stefan.weil@weilnetz.de>
Subject: Re: Makefile has local changes that will be overwritten
To: Programmingkid <programmingkidx@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, ddstreet@canonical.com
References: <B8D9E184-5C5A-4A15-BF48-927F0138F0DE@gmail.com>
Message-ID: <e18f2bd3-fcfd-2804-91d0-b4ecdb450bdc@weilnetz.de>
Date: Mon, 1 Feb 2021 15:58:14 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <B8D9E184-5C5A-4A15-BF48-927F0138F0DE@gmail.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.02.21 um 15:23 schrieb Programmingkid:

> When trying to build QEMU I see this error:
>
> error: Your local changes to the following files would be overwritten by checkout:
> 	Makefile
> Please commit your changes or stash them before you switch branches.
> Aborting
>
> What I do to see this error:
> ./configure --target-list=i386-softmmu


I suggest to start with a clean installation (or clean your existing 
installation manually, especially remove the generated Makefile) and run 
configure from a subdirectory:

mkdir -p build && cd build && ../configure --target-list=i386-softmmu

Running ./configure is no longer supported.

Regards,

Stefan


