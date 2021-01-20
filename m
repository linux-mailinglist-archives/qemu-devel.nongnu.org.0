Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F19742FD442
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:39:23 +0100 (CET)
Received: from localhost ([::1]:33808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2FZq-0004t3-Pp
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:39:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1l2FHR-0002Vd-Mm
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:20:22 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1l2FHP-0008H3-7F
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:20:21 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 3D47E40655;
 Wed, 20 Jan 2021 18:20:15 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with ESMTP id 420455B;
 Wed, 20 Jan 2021 18:20:15 +0300 (MSK)
Subject: Re: qemu broke booting of old RedHat floppies
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel qemu-devel <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>
References: <0bca1cd0-69c3-c07a-b4cf-015dcdbc6d61@tls.msk.ru>
Message-ID: <098ce1c2-e304-bf37-c3f9-f8cd81028020@msgid.tls.msk.ru>
Date: Wed, 20 Jan 2021 18:20:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <0bca1cd0-69c3-c07a-b4cf-015dcdbc6d61@tls.msk.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.094,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

20.01.2021 18:11, Michael Tokarev wrote:
..
> Now, I don't even know where to put that "type=144/288/auto" thing,
> I tried this:
> 
>   -drive file=RedHatLinuxBootDisk521998.disk1of1.img,if=floppy,format=raw,type=144
> 
> but it says that format=raw does not support "type=144" option.

So I found this:

  $ qemu-system-x86_64 \
   -drive file=RedHatLinuxBootDisk521998.disk1of1.img,if=none,id=d,format=raw \
   -device floppy,drive=d,type=144

But it fails:

  qemu-system-x86_64: -device floppy,drive=d,type=144: Insufficient permission to perform this operation

Umm?

/mjt


