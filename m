Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2502640C591
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 14:47:11 +0200 (CEST)
Received: from localhost ([::1]:49430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQUJh-0001EE-R1
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 08:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQUHb-0008Rq-Hd; Wed, 15 Sep 2021 08:44:59 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:41545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQUHZ-0002en-Qx; Wed, 15 Sep 2021 08:44:59 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mqro7-1nCSGl2eLB-00mvNP; Wed, 15 Sep 2021 14:44:46 +0200
Subject: Re: [PATCH V2] util: Remove redundant checks in the openpty()
To: Alex Chen <alex.chen@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>
References: <5F9FE5B8.1030803@huawei.com> <614052A9.4060107@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <0d0e66e0-1281-d739-da3c-6fb2d93f7a32@vivier.eu>
Date: Wed, 15 Sep 2021 14:44:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <614052A9.4060107@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:29Qp9maMeG4wc7qdQzXOeuEs7njX5T6h6bhS12l0ZjeUdp2tp3a
 +vm5CqRc58Be1FowRNERXjMlc2019lfmZJl0cPo5b6D5kutT+RtbhkO2EOyBd3rtEvPezhy
 gUSS0oonsJ3uGQ5KoA6kIOTL9EBzGVS5jorPzDgW0nyg+F0a15ia5+ounTOmVOUjeSG85EE
 g70Wp+USF/mLkQoZ558Vg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:t2IiWrq8ilk=:HCvnB+SApUqrBtPxNUAfY7
 BkuIQW5PBd9PCGwHRxjqK0iYXnr3XMpSHlm8gs/Lc/Jd3gD0doEJ/yjGZep4R56F26dlE8qut
 WGZJf1dN567uKw90/lpV8TYhNx5lsdGVfldvyeydTkLZ3pM/KLdDiWdQCb4Lnmx4qvWM91tQ0
 qD1INFesRXQpDFf9SjhsDyQ/WMySdxAkgvuNIT2BH6A2ryOMsXGhLKv12RAHT0AMrxG4rcKnK
 KBclUPGkmRZjXFlNfQqM2aekar1LATtA+sN7n7UhWMuHs+E85dvdlBEOUKPJ9y1WF3GWUWo2u
 m32jBzsKElIK5gWMN+8yERuHUUwcPjiV4CFAsDDmcrpvpfDDs9DtQDeSxax3x16cgZ2oDu6MW
 aBmvebAB7eVWINo4wBFuNMtwkdrvIMVCwTpXyejEVF6JzEIqfUDZ9RTOrpuNMzUeab3n2bZKp
 owUCcMtyQH2V/BTIuClt+gdR1NiFYvAIxA1uLZ5gDReCfPsp5wIwO2zUIz7W+QBFYgUCyoz4G
 /jVOf9fQQM8zWXvmm7bdnOmo5o61AGvDCtZgJOv9X0LfnOpz6gwWdlWU2IttsPJwtR9g8FqKS
 KMVZ1nKA2aStGnvUrp/rfUUQhfKxWeMvS41rt+8wHLYHyV0lt3aINm3XNXt4rIaqfHZSuFqix
 I7Fuf/RMi9/YUFTlku9AOOXbpKNvBzeY9n5nqfnD/xasReaqLBr8aEfRb2vJgoPo0TUh5T1zn
 QF77w796SR9WXia0ZUaO/DaA4VUOUuUtRoFN6g==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.698,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, yebiaoxiang@huawei.com,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 14/09/2021 à 09:43, Alex Chen a écrit :
> Hi all,
> 
> This patch has been reviewed by Peter. who can help merge it?
> 
> Thanks,
> Alex
> 
> On 2020/11/2 18:55, AlexChen wrote:
>> As we can see from the following function call stack, amaster and aslave
>> can not be NULL: char_pty_open() -> qemu_openpty_raw() -> openpty().
>> In addition, according to the API specification for openpty():
>> https://www.gnu.org/software/libc/manual/html_node/Pseudo_002dTerminal-Pairs.html,
>> the arguments name, termp and winp can all be NULL, but arguments amaster or aslave
>> can not be NULL.
>> Finally, amaster and aslave has been dereferenced at the beginning of the openpty().
>> So the checks on amaster and aslave in the openpty() are redundant. Remove them.
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Alex Chen <alex.chen@huawei.com>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  util/qemu-openpty.c | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/util/qemu-openpty.c b/util/qemu-openpty.c
>> index eb17f5b0bc..427f43a769 100644
>> --- a/util/qemu-openpty.c
>> +++ b/util/qemu-openpty.c
>> @@ -80,10 +80,9 @@ static int openpty(int *amaster, int *aslave, char *name,
>>              (termp != NULL && tcgetattr(sfd, termp) < 0))
>>                  goto err;
>>
>> -        if (amaster)
>> -                *amaster = mfd;
>> -        if (aslave)
>> -                *aslave = sfd;
>> +        *amaster = mfd;
>> +        *aslave = sfd;
>> +
>>          if (winp)
>>                  ioctl(sfd, TIOCSWINSZ, winp);
>>
> 
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

