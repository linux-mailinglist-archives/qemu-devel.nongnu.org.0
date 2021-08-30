Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9823FBAFE
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 19:33:14 +0200 (CEST)
Received: from localhost ([::1]:51550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKl9k-0000Zn-Jn
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 13:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1mKl3w-0008AP-KA
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 13:27:12 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1mKl3u-0007Ie-ML
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 13:27:12 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 5C9D7407AD
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 20:26:58 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id B6D717D
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 20:26:58 +0300 (MSK)
To: qemu-devel@nongnu.org
From: Michael Tokarev <mjt@tls.msk.ru>
Subject: usage of virtio-blk-device etc (microvm?)
Message-ID: <95fd8301-713e-fa88-36e0-072860b88e63@msgid.tls.msk.ru>
Date: Mon, 30 Aug 2021 20:26:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
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

Hi!

I tried to run the microvm variant of qemu-system, and found out
there's very little information about it available.

In particular, I wasn't able to have a hdd in the virtual machine
using virtio-blk-device like this:

  -drive file=foo,if=none,id=drv -device virtio-blk-device,drive=drv

What modules/options are needed within linux guest to see such a
drive?  By loading just virtio-blk module (which loads all its
dependencies) the drive isn't becoming available, like it usually
happens after loading virtio-pci with the pci version of virtio-blk.

Also, is there a way to use virtio-blk-device with, say, q35 machine
type? That is, to have virtio-BUS too?

Thanks!

