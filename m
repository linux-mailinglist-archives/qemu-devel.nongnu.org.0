Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 129FA616BC7
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 19:09:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqI9x-0004Xg-IF; Wed, 02 Nov 2022 14:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqI9u-0004Vu-VB; Wed, 02 Nov 2022 14:08:14 -0400
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqI9t-0001hK-Aa; Wed, 02 Nov 2022 14:08:14 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MPooP-1ocruX2eJf-00Mw8a; Wed, 02 Nov 2022 19:08:07 +0100
Message-ID: <9ef77b6e-f7dc-d61f-533e-aeeb2e655fea@vivier.eu>
Date: Wed, 2 Nov 2022 19:08:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] Add nsis.py to W32/W64 section in MAINTAINERS
Content-Language: fr
To: Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Thomas Huth <thuth@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20221031095701.383874-1-sw@weilnetz.de>
 <f02209f3-4355-8bf1-e514-07da375837e1@linaro.org>
 <32be170f-97cd-49a2-6458-0fabb7442c2a@weilnetz.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <32be170f-97cd-49a2-6458-0fabb7442c2a@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2nDUI4HL8vDM/7axDNTSNgLqtra4mJa5r6fmqIsTmkxQNja9gU3
 C+Foh30qiPk3Nbi9A/wP4t93pESLTuzIzhZYoa1TMeYMI4WXO5/yKu2O317NBRqrxiN2UJY
 xEKxcGTk23C4wjcxopsyvLk+iT8dh9HBQPqm1vf2CSpndg8Hg0Q6VCWjudMoyMHmxwMYdbS
 86NOwJrs7m0xTGUZj/lkw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xsVqXaMRoiI=:itQR5HGxcvMKB2c3hUF9P3
 qM52Ic505bJZNzshdSDS3jducGrXt0uj2Jfog8oIaeQOz7YtP3UQe/ypwra2PHpXNUXMmsCui
 dvuiWFi9jdyam4R+VSmmmWVOzysPYUqzjfbfeCQqU8ehq2pAmB7GPqU1ZtlGtgOd8NDPc1cZD
 dLhmPBUyhmhWIj79+mhm243HK9BXXF0lbYfTzOsuY5btrnJPwNzqcDfp/H9CAK+dSXS55SrPo
 4vwX3LNrhoROgkU1cG1e9ShujTux0O60klmqw/i2nQ0iRjhhQ7AT2SJ5r3EMd1CK8s4RGFlzp
 al7sEZhBS8Mi6dg/uSiLJuwkY6bElRg6mVQjTXp9DWV8XxcncgsDkqGetzXhua68/OlpD8C98
 DUBKih4vu+417JiLezq9U7GC7UkCXcSp9THtZnjUv33mn8eT3vQZxtlIJyUOZyAMnWrXmWc3n
 gU6tTpLvvZO6TDDyNzL9C0CyGt3ZGhn3bSZBYEYbShW+ZjNrVgB14xq+FT3scfuXHIOwsTnP5
 juzNxkP11/++43H6dGLO+3om3CEiKroYUW81WxzdkzQK0c1NVPkth4voU51ddbngMaF/c3qA4
 +GFsv8VD2u8smUefnSIG1MvHiX1VaFnNFWjvgBjJzY70TsYKiQb3IKiEkp062ZAjS39nGqABH
 1G6uZRNPPVX93qh5JQMlmMMSSiHCt9bwhxNzCvnnuC8Nzf2jW0oERX4UZUHPOCE0S/4/6LEjm
 KCyT9Q7aBQ3+j786ycbL4dB/zyk4qutcgVBCxiN3Xy8UNHUXobVIh4brgW2ILDfIAghp8aUQl
 buPTsoZ
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 31/10/2022 à 14:17, Stefan Weil via a écrit :
> Am 31.10.22 um 11:28 schrieb Philippe Mathieu-Daudé:
> 
>> On 31/10/22 10:57, Stefan Weil via wrote:
>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>> ---
>>>   MAINTAINERS | 1 +
>>>   1 file changed, 1 insertion(+)
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> 
> Cc qemu-trivial
> 
> 
> 

If I'm right, this change has already been merged by:

commit 48fad83ff49bd47368223cf1121351f51cf3565f
Author: Alex Bennée <alex.bennee@linaro.org>
Date:   Thu Oct 27 19:36:21 2022 +0100

     MAINTAINERS: add entries for the key build bits

     Changes to the build files are a bit special in that they usually go
     through other maintainer trees. However considering the build system
     is the root of everything a developer is likely to do we should at
     least set it out in MAINTAINERS.

     I'm going to nominate Paolo for meson stuff given the conversion was
     his passion project. I'm happy to cast an eye over configure stuff
     considering a lot of the cross compile logic is in there anyway.

     Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
     Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
     Acked-by: Thomas Huth <thuth@redhat.com>
     Cc: Paolo Bonzini <pbonzini@redhat.com>
     Message-Id: <20221027183637.2772968-16-alex.bennee@linaro.org>

Thanks,
Laurent

