Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B31415B9F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 12:00:51 +0200 (CEST)
Received: from localhost ([::1]:48588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTLX8-00033S-2c
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 06:00:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTLTS-0006iS-BU
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:57:02 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:43207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTLTQ-0001nS-Aq
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:57:02 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MKMIR-1m9Bcm3ouF-00Ljz4; Thu, 23 Sep 2021 11:56:56 +0200
Subject: Re: [PATCH] docs/nvdimm: Update nvdimm option value in machine example
To: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20210726071145.150832-1-pankaj.gupta.linux@gmail.com>
 <CAM9Jb+iukn4hszakOnGEgECpFyi0rZWp4FUx-MU+T_KdYd=GZQ@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <60e82b5e-4664-6969-0776-d87f73b6527b@vivier.eu>
Date: Thu, 23 Sep 2021 11:56:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAM9Jb+iukn4hszakOnGEgECpFyi0rZWp4FUx-MU+T_KdYd=GZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fkbjiqkqoJhC9unHMcOx5Xi3VdgYeUKbOn1i/6kgkt07yQHgwoQ
 qgzm/yJZkQDnPU4Qoz4YPwKxd+jdHnjJ8pixGf4JnLy+rJP63vsThN1kQVZAGB/u23CkICl
 0Rx6iPBu3k94zydGk20pf68kme/S9Iivi238xlrjmgNBotCgVrPIg8989pUDYqA0BcMg5pz
 cMvN7bAt+0DkeEbr912Dw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pd4SLHpJ+Iw=:akkgJAWKyafRWHZ5v1eTPh
 CM27W1GggCj9War7+1UTUhGNtebMygeChzW3td/0I3yumvAwnY1gfw6TQ5oNROLuCOHO8Zkep
 CJAKnuYWkC10u4Z++9wBzEr2pf0DHUqPsKZmEu1L2exJO15cwrmQWpev50vs81gxBChveuNKR
 IxuoxgIQhhnMi6ceQroday3BvV7m6cAoNStc8f0rVMVPicsUjKTzfjrlL53M0gH7sSW5z1FP9
 Y3p1+ymXSLr7SDq85623GnrLUNALGl8cvPPqWz0i8xTVsXVtz2GoluccMEK5EyB1j/7c15K9s
 vP8Xl6EOTuiM6UpaHA3iym0hURKb7l/YjsNxvh3Bdani3cGJKXUUROFuZh/2o5HhInJ6xjDVx
 2xLCUXGCSxcSgDJrB3C8mcjeJeF/XhpDYoVbX5qhx3nORIVXnEZlY765N+nx71QxejP+skfRV
 xYmmjYuNxFbI6VBQqfI3PuEbViDGw/yNcEqtlzcWGkRF87piQNlMlhA29mO3WF8IW7KKLP87h
 1aVDCPRM0FP9sYEitWiS5sJH38RcX7XS/yZ1oJTArktzB45Q42a/8bekXUcxqcbF3EvNbU//4
 /jnhSD+1MQqUahslMZMOf8YXpmtr82zN0Ek0C5zxwjp8h/pzxUI8V66guxDW5xfmWY2Aj8/GQ
 vJlKJiadR7Mcqclq/odRVvNGVYlq9XIBn7hjiDmUpgS1Hfn8ww4qOr+Ym1w1bd/vf+t7cvE6E
 ICpCwry3C1yOd6fN6vdt+yPVYLg78ZuzTp0YDA==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Qemu Developers <qemu-devel@nongnu.org>,
 Pankaj Gupta <pankaj.gupta@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 23/09/2021 à 11:47, Pankaj Gupta a écrit :
> ping

Could you post your patch with an email address ("From") that is the same as the "Signed-off-by"?

https://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a_Signed-off-by:_line

Thanks,
Laurent

>> Update nvdimm option value in example command from "-machine pc,nvdimm"
>> to "-machine pc,nvdimm=on" as former complains with the below error:
>>
>> "qemu-system-x86_64: -machine pc,nvdimm: Expected '=' after parameter 'nvdimm'"
>>
>> Signed-off-by: Pankaj Gupta <pankaj.gupta@ionos.com>
>> ---
>>  docs/nvdimm.txt | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/docs/nvdimm.txt b/docs/nvdimm.txt
>> index 0aae682be3..fd7773dc5a 100644
>> --- a/docs/nvdimm.txt
>> +++ b/docs/nvdimm.txt
>> @@ -15,7 +15,7 @@ backend (i.e. memory-backend-file and memory-backend-ram). A simple
>>  way to create a vNVDIMM device at startup time is done via the
>>  following command line options:
>>
>> - -machine pc,nvdimm
>> + -machine pc,nvdimm=on
>>   -m $RAM_SIZE,slots=$N,maxmem=$MAX_SIZE
>>   -object memory-backend-file,id=mem1,share=on,mem-path=$PATH,size=$NVDIMM_SIZE,readonly=off
>>   -device nvdimm,id=nvdimm1,memdev=mem1,unarmed=off
>> --
>> 2.25.1
>>
> 


