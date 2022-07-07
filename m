Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88E5569B4E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 09:12:22 +0200 (CEST)
Received: from localhost ([::1]:52592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9LgT-0001pw-R9
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 03:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1o9LbP-0000IA-Gp
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:07:07 -0400
Received: from mail.ispras.ru ([83.149.199.84]:57788)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1o9LbL-0005tK-U3
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 03:07:07 -0400
Received: from [192.168.43.94] (unknown [85.249.22.201])
 by mail.ispras.ru (Postfix) with ESMTPSA id 997BE40737A1;
 Thu,  7 Jul 2022 07:06:32 +0000 (UTC)
Message-ID: <52627ce6-354b-f8d0-4e67-de5b293ac159@ispras.ru>
Date: Thu, 7 Jul 2022 10:06:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 4/4] target/mips: introduce Cavium Octeon CPU model
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: jiaxun.yang@flygoat.com, aurelien@aurel32.net, aleksandar.rikalo@syrmia.com
References: <165572671617.167724.12940170194930233873.stgit@pasha-ThinkPad-X280>
 <165572673785.167724.7604881144978983510.stgit@pasha-ThinkPad-X280>
 <36303c3f-14ee-478b-855f-0dddbfb26f3f@ispras.ru>
 <48ad37ed-4228-6cba-9c9a-a9bc39a66dbe@amsat.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
In-Reply-To: <48ad37ed-4228-6cba-9c9a-a9bc39a66dbe@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.07.2022 23:53, Philippe Mathieu-Daudé wrote:
> On 4/7/22 12:59, Pavel Dovgalyuk wrote:
>> ping
>>
>> This is the only non-reviewed patch in the series.
> 
> I've been looking for doc/datasheets but no luck (except the Linux 
> kernel comments).
> 
> What kind of testing are you doing?

We compared the instruction emulation with the behavior on dev board.

> 
>> On 20.06.2022 15:05, Pavel Dovgalyuk wrote:
>>> This patch adds Cavium Octeon 68XX vCPU which provides
>>> Octeon-specific instructions.
>>>
>>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>>>
>>> -- 
>>> v3 changes:
>>>   - split the patch to instruction set introduction and new vCPU
>>>     (suggested by Philippe Mathieu-Daudé)
>>> v2 changes:
>>>   - vCPU name changed to Octeon68XX (suggested by Richard Henderson)
>>> ---
>>>   target/mips/cpu-defs.c.inc |   28 ++++++++++++++++++++++++++++
>>>   1 file changed, 28 insertions(+)


