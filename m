Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E4221D791
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 15:51:16 +0200 (CEST)
Received: from localhost ([::1]:49978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1juyrT-0001wj-Lx
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 09:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@the-jedi.co.uk>)
 id 1juyqf-0001WQ-NW
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 09:50:25 -0400
Received: from vps.the-jedi.co.uk ([93.93.130.107]:34750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@the-jedi.co.uk>)
 id 1juyqc-0003fv-Vn
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 09:50:25 -0400
Received: by vps.the-jedi.co.uk (Postfix, from userid 111)
 id 396B742D1E; Mon, 13 Jul 2020 14:50:21 +0100 (BST)
Received: from [192.168.0.5] (host86-179-4-163.range86-179.btcentralplus.com
 [86.179.4.163])
 by vps.the-jedi.co.uk (Postfix) with ESMTPSA id 11166400BA
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 14:50:20 +0100 (BST)
To: qemu-devel@nongnu.org
References: 
Subject: Re: [PATCH] Allow acpi-tmr size=2
From: Simon John <git@the-jedi.co.uk>
Message-ID: <76222a42-823f-7f37-e9c9-4c50a5a5ce42@the-jedi.co.uk>
Date: Mon, 13 Jul 2020 14:50:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=93.93.130.107; envelope-from=git@the-jedi.co.uk;
 helo=vps.the-jedi.co.uk
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 09:50:21
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 13 Jul 2020 08:17:41 -0400, Michael S. Tsirkin wrote:

> Sounds good. And how about also adding:
> 
>       .impl.min_access_size = 4,
> 
> ?

Yes, this works too - what does that do?

static const MemoryRegionOps acpi_pm_tmr_ops = {
     .read = acpi_pm_tmr_read,
     .write = acpi_pm_tmr_write,
     .valid.min_access_size = 2,
     .valid.max_access_size = 4,
     .impl.min_access_size = 4,
     .impl.max_access_size = 4,
     .endianness = DEVICE_LITTLE_ENDIAN,
};

Regards.

-- 
Simon John

