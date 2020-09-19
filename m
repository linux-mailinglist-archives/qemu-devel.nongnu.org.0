Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE516270D4D
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Sep 2020 12:58:12 +0200 (CEST)
Received: from localhost ([::1]:45198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJaZH-0004Pl-6B
	for lists+qemu-devel@lfdr.de; Sat, 19 Sep 2020 06:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1kJaTz-0003BK-57
 for qemu-devel@nongnu.org; Sat, 19 Sep 2020 06:52:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1kJaTx-0004Xu-32
 for qemu-devel@nongnu.org; Sat, 19 Sep 2020 06:52:42 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 7B1B2401C5;
 Sat, 19 Sep 2020 13:52:30 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with ESMTP id 70E0EEE;
 Sat, 19 Sep 2020 13:49:43 +0300 (MSK)
Subject: Re: [PATCH] xen: xenguest is not used so is not needed
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200727140048.19779-1-mjt@msgid.tls.msk.ru>
 <20200727150949.GC2866@perard.uk.xensource.com>
 <c90a625b-51d3-3718-1e83-1019f1cbd227@tls.msk.ru>
Message-ID: <98a0ad72-8a3a-3561-1665-5f00af015256@msgid.tls.msk.ru>
Date: Sat, 19 Sep 2020 13:52:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <c90a625b-51d3-3718-1e83-1019f1cbd227@tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/19 06:52:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.869,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[ https://patchwork.kernel.org/patch/11686919/ ]

Ping?  This patch got lost somewhere. Should I try to apply it via trivial tree?

I've more cleanups pending for this area.  Just in case, I verified this patch
it wih xen 4.4 and with current xen, and with current qemu, - no  part of qemu
uses xenguest interface.


Thanks,

/mjt

27.07.2020 18:20, Michael Tokarev wrote:
> 27.07.2020 18:09, Anthony PERARD wrote:
>> On Mon, Jul 27, 2020 at 05:00:48PM +0300, Michael Tokarev wrote:
>>> There's no references in only file which includes xenguest.h
>>> to any xen definitions. And there's no references to -lxenguest
>>> in qemu, either. Drop it.
>>
>> I'm not sure what you mean by "no references to -lxenguest", do you mean
>> in the binary?
> 
> Yes, in the qemu-system-i386 binary, it can be linked without -lxenguest.
> 
> Just a caveat, -- I know almost nothing about xen, especially xen
> internals and its (stable, unversioned and unstable, versioned) libs.
> Qemu links fine without libxenguest in the mix with xen 4.11.4, - I
> can't say for other versions.  I just thought if it does not include
> <xenguest.h>, why it should link with -lxenguest? :)

