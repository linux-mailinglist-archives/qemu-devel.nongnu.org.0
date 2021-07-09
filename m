Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE2A3C2143
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 11:10:27 +0200 (CEST)
Received: from localhost ([::1]:42510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1mWg-00063r-91
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 05:10:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1mVj-0005Dh-CE; Fri, 09 Jul 2021 05:09:27 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:47099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1mVh-0003la-Jd; Fri, 09 Jul 2021 05:09:27 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MMXDj-1lmBCP0B0R-00JWki; Fri, 09 Jul 2021 11:09:14 +0200
Subject: Re: [PATCH] misc: Remove redundant new line in perror()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-devel@nongnu.org
References: <20210706094433.1766952-1-lizhijian@cn.fujitsu.com>
 <adc664b6-f4c8-1804-357a-f3f0b94e8e24@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <3b90356c-53e3-872f-2ca6-16c31eba68a5@vivier.eu>
Date: Fri, 9 Jul 2021 11:09:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <adc664b6-f4c8-1804-357a-f3f0b94e8e24@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3wi7y5V/fLXm37ZURUSGO0pWbHPhvrg40wqelgks7oBcINcMKEv
 0eyoxUQqNweEZjJGcSYcYg/utI1nJCzK/TYHF9n9YNmB3QoIoseSk8ynxNORgCcQwxGiUxp
 1YDG9lcl3Gd6BlRtWvOcQrzhwOXMGFvqTFriMxfK1FC5azPqlZ0yvQavck0dE9d0Njri7AE
 0zmVEW9fd+girAmfq6rmg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:a7dFB9kLaKU=:WZr48beCNlauACHv4h2Qd6
 DDgFgZmsAyaLPoUgzvwytA1y6N78RUzku92K8m5Q1+IeWULDOfGfIgKPhyZ4uy3m5r0UP6Oz0
 IOj7mWiw/sESUmiiXWUhR9/vI31aKg+JGOL39xLdBWrAWUh4AsBPDERfYaUeRY4XsylrIjCjZ
 Buu1r0mbzVeEO/qDP3AOeiGMffWYxYVqgu4FapLkyOmE+/W+hIq/CUoEkqxwpGc2UADaaEUS7
 YRSvTjsYGZsLe8vSDiEfIPmGHDbkEW/1Frv+kdLq7MFnVqFOBoKTsecDoIuMA7lrYuarj/o9i
 5zi9OyhVMktRhIB6kkKs0TNlEP7ndaQbt6bPs1xm2im9nwac0KnWBnWNvdSRIGTQ5K3iGFPdl
 MePSnAzU12skuCfoqd6JXqJEDtwD8VA2EhzQiBh34zOoc/Sb72SF8DGSOvjBF+EndFRYEN+AJ
 8N5x0UMonQQqRelX2MXBjOLPYJm3e8GFFzNsGQtt14tbTbb7iJQx0c6idesxtyB0xZyTltdYJ
 r7G5zsRorOB5sr6srQu2z0NDnLenJvbe5ZbIYjUm58zVTHqpRyOuQnoDE+JnNFRp39xhMzzGI
 iM6g/pAg/TiWo277om8lYkNUhCWq0IyuyiFzallm1cmNwKZYCy6rho16/oyExAAYVQd1PLCib
 pA/XiL0Bqvhsum5u7hpw1UlxYvwO/SVobyLrhKsFH7Qu1H9AZrEueTUCRQeg5TCv5gnnOP8wL
 zDoneq99b5avNcOYTJna3bv6igZuPCHHHJN8ULi+oW/M/WscREpW6Oy4eFi0XC3K11a58y8+3
 MH1VOm/u9fTmZWACwTTbYOft83lhdf/qIwsrMh0GXhY2hx7qnBJ0vIyjqtNZkNFxAnocBi8
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, pbonzini@redhat.com,
 richard.henderson@linaro.org, dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 06/07/2021 à 11:55, Philippe Mathieu-Daudé a écrit :
> Cc'ing qemu-trivial@
> 
> On 7/6/21 11:44 AM, Li Zhijian wrote:
>> Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
>> ---
>>  migration/rdma.c | 2 +-
>>  softmmu/cpus.c   | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/migration/rdma.c b/migration/rdma.c
>> index 7fb9646f6ef..e99e2e16a73 100644
>> --- a/migration/rdma.c
>> +++ b/migration/rdma.c
>> @@ -1133,7 +1133,7 @@ static int qemu_rdma_reg_whole_ram_blocks(RDMAContext *rdma)
>>                      IBV_ACCESS_REMOTE_WRITE
>>                      );
>>          if (!local->block[i].mr) {
>> -            perror("Failed to register local dest ram block!\n");
>> +            perror("Failed to register local dest ram block!");
>>              break;
>>          }
>>          rdma->total_registrations++;
>> diff --git a/softmmu/cpus.c b/softmmu/cpus.c
>> index c3caaeb26ec..071085f840b 100644
>> --- a/softmmu/cpus.c
>> +++ b/softmmu/cpus.c
>> @@ -325,7 +325,7 @@ static void sigbus_reraise(void)
>>          sigaddset(&set, SIGBUS);
>>          pthread_sigmask(SIG_UNBLOCK, &set, NULL);
>>      }
>> -    perror("Failed to re-raise SIGBUS!\n");
>> +    perror("Failed to re-raise SIGBUS!");
>>      abort();
>>  }
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
>


Applied to my trivial-patches branch.

Thanks,
Laurent



