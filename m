Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F933220AD
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 21:14:33 +0100 (CET)
Received: from localhost ([::1]:60522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEHbE-00018B-D7
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 15:14:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1lEHUm-0006yN-K9
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 15:07:52 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:58579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1lEHUk-0005vt-Kz
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 15:07:52 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 4D49940727;
 Mon, 22 Feb 2021 23:07:47 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with ESMTP id 58EBA8D;
 Mon, 22 Feb 2021 23:07:48 +0300 (MSK)
Subject: Re: [PATCH] linux-user: manage binfmt-misc preserve-arg[0] flag
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210222105004.1642234-1-laurent@vivier.eu>
 <3b5b0aa0-6fde-3e71-0e69-6bf127e9c627@msgid.tls.msk.ru>
 <995d4f7d-3afc-f0f6-0a86-c1eb0488bfa1@vivier.eu>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <b940a072-382e-2cd0-6d37-de89aa31707b@msgid.tls.msk.ru>
Date: Mon, 22 Feb 2021 23:07:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <995d4f7d-3afc-f0f6-0a86-c1eb0488bfa1@vivier.eu>
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
Cc: Helge Deller <deller@gmx.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

22.02.2021 20:09, Laurent Vivier wrote:

>> Here it is: https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg04639.html
>>
> In this case, we don't want to modify QEMU to manage special case based on the binary name but
> instead use a wrapper:

A wrapper immediately defeats the purpose of the fix-binary flag, unfortunately,
requiring the quemu-foo binary within the chroot again.  Such a wrapper has been
used for quite some time by Suse and others before the fix-binary flag appeared
in kernel. It was the first approach I considered and rejected.

Thanks,

/mjt

