Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C513B5D20
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 13:28:18 +0200 (CEST)
Received: from localhost ([::1]:45988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxpR3-0007Km-Ff
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 07:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lxpOy-0005J3-Pv
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 07:26:08 -0400
Received: from mail.ispras.ru ([83.149.199.84]:32820)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lxpOu-0006jE-Rs
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 07:26:08 -0400
Received: from [10.12.39.188] (unknown [85.142.117.224])
 by mail.ispras.ru (Postfix) with ESMTPSA id BF29140A2BD7;
 Mon, 28 Jun 2021 11:25:57 +0000 (UTC)
Subject: Re: tests: ReverseDebugging_AArch64.test_aarch64_virt ->
 InvalidPacketError
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <6f85be92-627c-c3ac-2d49-fd18a00dd1f9@amsat.org>
 <66d56c24-eacf-0d23-2def-0259b2c1b922@ispras.ru>
 <c484c8b0-691b-100a-b863-2d1a9d94950a@amsat.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <070c2b4c-83fe-c3cd-c75b-1bc412b6edfb@ispras.ru>
Date: Mon, 28 Jun 2021 14:25:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c484c8b0-691b-100a-b863-2d1a9d94950a@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.06.2021 14:20, Philippe Mathieu-Daudé wrote:
> On 6/28/21 7:14 AM, Pavel Dovgalyuk wrote:
>> On 25.06.2021 20:01, Philippe Mathieu-Daudé wrote:
>>> Hi Pavel,
>>>
>>> FYI as of commit 050cee12315 ("Merge remote-tracking branch
>>> 'remotes/stsquad/tags/pull-testing-updates-250621-1' into staging")
>>
>> Doesn't it mean, that the real culprit is hidden and we should bisect?
> 
> Could be, I have no idea, I don't run this test often, only when I do
> changes related to aa64. I could bisect if you can't, but it won't be
> soon.
> 
>>> the ReverseDebugging_AArch64 test is failing:
>>
>> Shouldn't the merge be postponed in such cases?
> 
> This test isn't run on CI (you marked it @skip in commit be52eca3097).

Thanks for clarification. I'll take a look at this bug, but it will not 
be soon too.

> 
>>>    (28/37)
>>> tests/acceptance/reverse_debugging.py:ReverseDebugging_AArch64.test_aarch64_virt:
>>>
>>>    ERROR (0.96 s)
>>>
>>> INFO | recorded log with 1690570+ steps
>>> INFO | replaying the execution...
>>> INFO | connecting to gdbstub
>>> INFO | stepping forward
>>> INFO | saving position 40000000
>>> ERROR|
>>> ERROR| Reproduced traceback from:
>>> lib/python3.8/site-packages/avocado/core/test.py:770
>>> ERROR| Traceback (most recent call last):
>>> ERROR|   File "acceptance/reverse_debugging.py", line 206, in
>>> test_aarch64_virt
>>> ERROR|     self.reverse_debugging(
>>> ERROR|   File "acceptance/reverse_debugging.py", line 140, in
>>> reverse_debugging
>>> ERROR|     pc = self.get_pc(g)
>>> ERROR|   File "acceptance/reverse_debugging.py", line 77, in get_pc
>>> ERROR|     return self.get_reg(g, self.REG_PC)
>>> ERROR|   File "acceptance/reverse_debugging.py", line 72, in get_reg
>>> ERROR|     return self.get_reg_le(g, reg)
>>> ERROR|   File "acceptance/reverse_debugging.py", line 58, in get_reg_le
>>> ERROR|     res = g.cmd(b'p%x' % reg)
>>> ERROR|   File "lib/python3.8/site-packages/avocado/utils/gdb.py", line
>>> 783, in cmd
>>> ERROR|     response_payload = self.decode(result)
>>> ERROR|   File "lib/python3.8/site-packages/avocado/utils/gdb.py", line
>>> 738, in decode
>>> ERROR|     raise InvalidPacketError
>>> ERROR| avocado.utils.gdb.InvalidPacketError


