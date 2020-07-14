Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EB721EE6B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 12:56:44 +0200 (CEST)
Received: from localhost ([::1]:40292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvIc7-0003pA-Uf
	for lists+qemu-devel@lfdr.de; Tue, 14 Jul 2020 06:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1jvIbA-0003FV-4g
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 06:55:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1jvIb8-0004Fv-Eb
 for qemu-devel@nongnu.org; Tue, 14 Jul 2020 06:55:43 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id A7873404A6;
 Tue, 14 Jul 2020 13:55:39 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with ESMTP id BE25DB3;
 Tue, 14 Jul 2020 13:55:39 +0300 (MSK)
Subject: Re: [PATCH for-5.1] acpi-pm-tmr: allow 2-byte reads
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200714095518.16241-1-mjt@msgid.tls.msk.ru>
 <464386eb-ad88-2fe8-d943-6febe511eb6a@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <44bb4516-197d-27dd-4977-dfc6c064154c@msgid.tls.msk.ru>
Date: Tue, 14 Jul 2020 13:55:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <464386eb-ad88-2fe8-d943-6febe511eb6a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/14 05:55:21
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
Cc: Simon John <git@the-jedi.co.uk>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

14.07.2020 13:26, Philippe Mathieu-Daudé пишет:
> On 7/14/20 11:55 AM, Michael Tokarev wrote:
>> As found in LP#964247, MacOS Catalina performs 2-byte reads
>> on the acpi timer address space while the spec says it should
>> be 4-byte. Allow 2-byte reads.
> 
> https://bugs.launchpad.net/qemu/+bug/964247 is about Unity-2D shell...

It's a debian bug# ( http://bugs.debian.org/964247 ), not LP, the
right LP bug is LP#1886318 . Mixed the two wrongly, I'm sorry for that.
I resent a v2, also allowing 1-byte access as suggested by mst.

> What is the target hardware used here?

It's x86.

Thanks,

/mjt

