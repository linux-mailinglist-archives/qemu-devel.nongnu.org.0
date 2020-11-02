Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 543EA2A26F1
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 10:26:50 +0100 (CET)
Received: from localhost ([::1]:48016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZW6z-0002qU-Dv
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 04:26:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kZW5g-0002JB-HL
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 04:25:28 -0500
Received: from mail.ispras.ru ([83.149.199.84]:56308)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kZW5e-0006Qi-6w
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 04:25:28 -0500
Received: from [192.168.0.183] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 5173B40D403E;
 Mon,  2 Nov 2020 09:25:18 +0000 (UTC)
Subject: Re: [PATCH] target/s390x: fix execution with icount
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <160404699734.17100.6515653500382355060.stgit@pasha-ThinkPad-X280>
 <fd06fcf1-3850-3858-5e02-908d642d5229@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <7484db0f-ed50-881b-34ce-5ff4964160db@ispras.ru>
Date: Mon, 2 Nov 2020 12:25:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fd06fcf1-3850-3858-5e02-908d642d5229@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 04:25:18
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, cohuck@redhat.com, rth@twiddle.net, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.10.2020 19:21, Richard Henderson wrote:
> On 10/30/20 1:36 AM, Pavel Dovgalyuk wrote:
>> This patch adds some gen_io_start() calls to allow execution
>> of s390x targets in icount mode with -smp 1.
>> It enables deterministic timers and record/replay features.
> 
> Thanks for pointing this out.
> 
> There are enough of these that I think it would be worthwhile to annotate them
> in insn-data.def instead, much as we do for privileged instructions with IF_PRIV.
> 
> Perhaps call it IF_IO?

Thanks for the idea.
New version of the patch is coming.

> 
> 
> r~
> 


