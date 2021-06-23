Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F5B3B142F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 08:50:52 +0200 (CEST)
Received: from localhost ([::1]:34864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvwim-00043w-U9
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 02:50:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lvwhY-0003OG-G0
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 02:49:32 -0400
Received: from mail.ispras.ru ([83.149.199.84]:44530)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lvwhV-0007Rf-Pr
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 02:49:32 -0400
Received: from [10.0.41.144] (unknown [80.250.189.91])
 by mail.ispras.ru (Postfix) with ESMTPSA id 25D4D4076255;
 Wed, 23 Jun 2021 06:49:25 +0000 (UTC)
Subject: Re: [PATCH 2/6] tests/acceptance: add replay kernel test for ppc64
To: Willian Rampazzo <wrampazz@redhat.com>
References: <162332427732.194926.7555369160312506539.stgit@pasha-ThinkPad-X280>
 <162332429407.194926.5057230329979093589.stgit@pasha-ThinkPad-X280>
 <CAKJDGDYyz_-FokW+UzNEwhx4mBXrmH0xvgvoTkCc2Ht_K_p1Tw@mail.gmail.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <e8bae017-37a8-e5dc-ea3c-f0b2d18dfe96@ispras.ru>
Date: Wed, 23 Jun 2021 09:49:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKJDGDYyz_-FokW+UzNEwhx4mBXrmH0xvgvoTkCc2Ht_K_p1Tw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.06.2021 22:23, Willian Rampazzo wrote:
> On Thu, Jun 10, 2021 at 8:25 AM Pavel Dovgalyuk
> <pavel.dovgalyuk@ispras.ru> wrote:
>>
>> This patch adds record/replay test which boots Linux
>> kernel on ppc64 platform. The test uses kernel binaries
>> taken from boot_linux_console test.
>>
>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>> ---
>>   tests/acceptance/boot_linux_console.py |   12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
> 
> This is already upstream, right? b52d7e216c6 or am I missing something?
> 
My fault. I accidentally added this test to the wrong script.


