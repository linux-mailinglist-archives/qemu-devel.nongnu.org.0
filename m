Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE53E6F42ED
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 13:42:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptoOO-0006F3-HU; Tue, 02 May 2023 07:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1ptoO8-0006Aw-Cz
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:41:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1ptoO6-0006yZ-Jx
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:41:44 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 6C85140076;
 Tue,  2 May 2023 14:41:32 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 958196D;
 Tue,  2 May 2023 14:41:31 +0300 (MSK)
Message-ID: <28135abf-407f-2d62-7101-ab5488a8c61b@msgid.tls.msk.ru>
Date: Tue, 2 May 2023 14:41:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] linux-user: Fix mips fp64 executables loading
Content-Language: en-US
To: Daniil Kovalev <dkovalev@compiler-toolchain-for.me>, qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Philippe Mathieu-Daude <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20230404052153.16617-1-dkovalev@compiler-toolchain-for.me>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230404052153.16617-1-dkovalev@compiler-toolchain-for.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -82
X-Spam_score: -8.3
X-Spam_bar: --------
X-Spam_report: (-8.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

04.04.2023 08:21, Daniil Kovalev Wrote:
> If a program requires fr1, we should set the FR bit of CP0 control status
> register and add F64 hardware flag. The corresponding `else if` branch
> statement is copied from the linux kernel sources (see `arch_check_elf` function
> in linux/arch/mips/kernel/elf.c).

Is it a -stable material?

Thanks,

/mjt

