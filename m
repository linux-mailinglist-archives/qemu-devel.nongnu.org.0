Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C482BC543
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Nov 2020 12:08:29 +0100 (CET)
Received: from localhost ([::1]:33220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgnEK-0006JG-2Z
	for lists+qemu-devel@lfdr.de; Sun, 22 Nov 2020 06:08:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kgnBu-0004XV-MW
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 06:05:58 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:60780
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kgnBs-0008J9-PU
 for qemu-devel@nongnu.org; Sun, 22 Nov 2020 06:05:58 -0500
Received: from host86-179-247-26.range86-179.btcentralplus.com
 ([86.179.247.26] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kgnC7-00047V-4X; Sun, 22 Nov 2020 11:06:11 +0000
To: Bug 1892540 <1892540@bugs.launchpad.net>, qemu-devel@nongnu.org
References: <159803735569.2614.10182276398047269277.malonedeb@chaenomeles.canonical.com>
 <160600241540.29198.3271182381038888022.malone@chaenomeles.canonical.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <42383191-b44c-5781-54d7-9e4b895b4183@ilande.co.uk>
Date: Sun, 22 Nov 2020 11:05:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <160600241540.29198.3271182381038888022.malone@chaenomeles.canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.179.247.26
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [Bug 1892540] Re: qemu can no longer boot NetBSD/sparc
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
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

On 21/11/2020 23:46, Peter Maydell wrote:

> Is this bug now fixed, or are there still more patches not yet in
> master?

The additional for-5.2 patch above is still needed: I've just submitted it to 
Travis-CI, and assuming it passes I'll send a PR later.


ATB,

Mark.

