Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05868321A7E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:44:46 +0100 (CET)
Received: from localhost ([::1]:48526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lECS4-00074A-9Y
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:44:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1lECMY-000677-5x
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:39:02 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:39399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1lECMW-0002h5-5w
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:39:01 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 5341B40727;
 Mon, 22 Feb 2021 17:38:48 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with ESMTP id 59EC68D;
 Mon, 22 Feb 2021 17:38:49 +0300 (MSK)
Subject: Re: [PATCH] linux-user: manage binfmt-misc preserve-arg[0] flag
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210222105004.1642234-1-laurent@vivier.eu>
 <0ee2b107-1533-3098-9797-040633964300@physik.fu-berlin.de>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <09fefe8c-c3bb-1303-9e85-d207c6ec4ffc@msgid.tls.msk.ru>
Date: Mon, 22 Feb 2021 17:38:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <0ee2b107-1533-3098-9797-040633964300@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Helge Deller <deller@gmx.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

22.02.2021 13:58, John Paul Adrian Glaubitz wrote:
> Hi Laurent!
> 
> On 2/22/21 11:50 AM, Laurent Vivier wrote:
>> Add --preserve-argv0 in qemu-binfmt-conf.sh to configure the preserve-argv0
>> flag.
>>
>> This patch allows to use new flag in AT_FLAGS to detect if
>> preserve-argv0 is configured for this interpreter:
>> argv[0] (the full pathname provided by binfmt-misc) is removed and
>> replaced by argv[1] (the original argv[0] provided by binfmt-misc when
>> 'P'/preserve-arg[0] is set)
> 
> Would this patch finally fix the issue with the perl package in Debian? [1]

It's been fixed a week or so ago.

/mjt

> Adrian
> 
>> [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=974004
> 


