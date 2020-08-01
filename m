Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC812353E3
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Aug 2020 19:55:25 +0200 (CEST)
Received: from localhost ([::1]:50696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1vj9-0006xB-E6
	for lists+qemu-devel@lfdr.de; Sat, 01 Aug 2020 13:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1k1veP-0005bV-UM
 for qemu-devel@nongnu.org; Sat, 01 Aug 2020 13:50:29 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1k1veN-0003O7-TW
 for qemu-devel@nongnu.org; Sat, 01 Aug 2020 13:50:29 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 68C9B4000B;
 Sat,  1 Aug 2020 20:50:24 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with ESMTP id 85211C3;
 Sat,  1 Aug 2020 20:50:25 +0300 (MSK)
Subject: Re: [PATCH v2 0/4] target-hppa fixes
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <20200801131357.17379-1-deller@gmx.de>
 <21ec077f-b3aa-b755-7191-fc12985714bc@msgid.tls.msk.ru>
 <066e9cd1-9a69-7302-3d8f-0800455b67a7@gmx.de>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <fa97cfa1-a707-bdda-9e03-4de3846ebe6c@msgid.tls.msk.ru>
Date: Sat, 1 Aug 2020 20:50:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <066e9cd1-9a69-7302-3d8f-0800455b67a7@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/01 12:47:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

01.08.2020 20:26, Helge Deller wrote:
> Hi Michael,
> 
> On 01.08.20 18:47, Michael Tokarev wrote:
>> 01.08.2020 16:13, Helge Deller wrote:
>>> A few late fixes for target-hppa:
>>>
>>> * Fix the SeaBIOS-hppa firmware build with gcc-10 on Debian
>>
>> It looks like you forgot the above change somehow.
> 
> Actually, no, I did not forgot this patch.
> It's part of the seabios-hppa repo, see here:
> https://github.com/hdeller/seabios-hppa/commit/14a26ffb0d9ad1fc510da5d03215b0e36f717fce

Oh. Yeah, my bad, I thought that patch should be within the 4
changes of this series, while this series is about qemu, not
the seabios-hppa sources. N/m :)

/mjt

