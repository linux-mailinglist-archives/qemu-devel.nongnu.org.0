Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D99A541C373
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 13:29:54 +0200 (CEST)
Received: from localhost ([::1]:56968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVXmb-0006GM-3g
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 07:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1mVXf3-0003lA-1b
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 07:22:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1mVXf1-0006kR-7Y
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 07:22:04 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id D24CD40495;
 Wed, 29 Sep 2021 14:21:58 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id AE1CB8E;
 Wed, 29 Sep 2021 14:21:58 +0300 (MSK)
To: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Subject: blockdev driver=file,filename=/dev/block forbidden?
Message-ID: <ed1f265b-6db8-846e-cb52-09c3999d07bf@msgid.tls.msk.ru>
Date: Wed, 29 Sep 2021 14:21:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 8d17adf34f501ded65a106572740760f0a75577c
"block: remove support for using "file" driver with block/char devices"
explicitly forbids usage of file driver for block devices.

But _why_?

Hasn't we always used file for everything on *nix? And what's the _actual_
difference between file and host_device?

Please note this change has been added to qemu long before libvirt has
been adapted (I guess there's no released libvirt can be used with
qemu 6.0+).

Why?

Thanks,

/mjt

