Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A074316B5
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 13:01:22 +0200 (CEST)
Received: from localhost ([::1]:52882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcQOP-0005AI-Fz
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 07:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.junger@greensocs.com>)
 id 1mcQJ5-0000ee-Ir
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 06:55:51 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:44218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.junger@greensocs.com>)
 id 1mcQJ3-0000E8-98
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 06:55:51 -0400
Received: from [137.226.90.212] (vpn-212.iss.rwth-aachen.de [137.226.90.212])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 5F79A2077F;
 Mon, 18 Oct 2021 10:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1634554541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JBHMMpdwjfut3SQttoM0TeXiN4qWHF4WAmRsj1bqfF8=;
 b=DPC1sW7jpiDaiyBGh+rwLIRO1Mj10k6Z1rbSGo2/0q2FD92qS/TfuuPJjRraaYUqeCftE0
 dnh343ZelAqwFRFoaoCzFLdLHvgEyCbtiT0c4R2EFCcaDocd54zSDsoro2NrxzDi0i8XUh
 vgWzGv395bns7pU/rKrj8odox2ooKyo=
Message-ID: <2cf6222a-7c66-cbbc-a9a2-66c037c62918@greensocs.com>
Date: Mon, 18 Oct 2021 12:55:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/1] Add missing function names to symbol list
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210905140939.638928-1-lukas.junger@greensocs.com>
 <87ilzcy593.fsf@linaro.org>
From: =?UTF-8?Q?Lukas_J=c3=bcnger?= <lukas.junger@greensocs.com>
In-Reply-To: <87ilzcy593.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=lukas.junger@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: erdnaxe@crans.org, ma.mandourr@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/7/21 13:43, Alex Bennée wrote:
> Lukas Jünger <lukas.junger@greensocs.com> writes:
>
>> Hi all,
>>
>> I have been trying to use the hwprofile and cache plugin on
>> qemu-system-riscv64. They failed to load with an undefined
>> symbol error. It looks like some of the plugin API functions
>> are missing from the symbol list, so I added them.
> Heh I had a similar patch in plugins/next but yours includes more
> symbols so queued to plugins/next, thanks. Not sure how I missed it
> before - I think we might not have been honouring the symbol list
> before.
>
>> Afterwards
>> the plugins worked (eventhough the cache plugin is segfaulting
>> on shutdown, but that is a separate, unrelated issue).
> Has this been tracked down yet? There is a fix f7e68c9c99 (tcg/plugins:
> implement a qemu_plugin_user_exit helper) which was for user mode. At
> the time I didn't think system mode would be affected due to the atexit
> callback only being called once vCPUs had shutdown.

It seems like there is a race condition with the tcg threads.
The plugin exit handler is run with atexit(). While the exit callback
is freeing memory, tcg is still running and memory callbacks write
to the already freed data structures in the plugin causing the segfault.
I tested this with the current master branch and this cmdline:

bin/qemu-system-riscv64 -machine virt -nographic -bios fw_jump.elf
     -kernel Image -plugin path/to/libcache.so -d plugin -D log.txt

I wonder if we could somehow wait for the tcg to exit before executing
plugin exit cb. Do you have an idea?

>
>> Hope that's okay.
>>
>> BR,
>> Lukas
>>
>> Lukas Jünger (1):
>>    plugins/: Add missing functions to symbol list
>>
>>   plugins/qemu-plugins.symbols | 3 +++
>>   1 file changed, 3 insertions(+)
>

