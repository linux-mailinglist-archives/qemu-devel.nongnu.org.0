Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8D8619425
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 11:05:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqtZK-0001ts-K7; Fri, 04 Nov 2022 06:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oqtYH-0007ix-5L
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 06:03:53 -0400
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oqtYE-0001Iv-Eo
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 06:03:52 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mc0Er-1pRtCG3BlP-00dXIA; Fri, 04 Nov 2022 11:03:48 +0100
Message-ID: <e8ba12cf-32c3-ee67-b2a5-2e6debf8e2ef@vivier.eu>
Date: Fri, 4 Nov 2022 11:03:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3] linux-user: implement execveat
Content-Language: fr
To: Drew DeVault <sir@cmpwn.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Helge Deller <deller@gmx.de>
References: <20221103173212.3724698-1-sir@cmpwn.com>
 <b22ae5f1-41d9-3739-e219-a717b7ab8b98@linaro.org>
 <CO3F6B8K38DE.1OTGB55K8CMB2@taiga>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <CO3F6B8K38DE.1OTGB55K8CMB2@taiga>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:i8X13N7sAGcUwK/BKyj9KsMi+u07WW+m+rmmePXyLHKcfDDCDkD
 RRv4Lk2aPMTfWkqiajinAPawy17qKcNjcl2dHeXYrAAX089rkw8YWWSlC/r8BkkU4LxkF6v
 H3eZkWWwnJibYHtuMjOsKbpGonKDd8g6iAGCJRsTE9KMuGXlde/sul54f9UtBJV9ucdxHxB
 XHm37PCHZWiN1hdahU1pw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GWP6cY+p5Pk=:jwa8Et+kxZP5KLRhoAnIz+
 JmVv31/RNKW3H/2VqasfRj4Vh0WY2G3gQjTwfFf+kZkK4fTt4jd0ekYLOiZNbYt8cJvLWQd+9
 Mf21x61gLXjBggoThLJKANaxn4c8E8mpGjuyJ5hsEuP9uLRx4Wlwm+bYfIHZsQwgRr+QFTfEv
 TWErx86HgtG//wfeIOp1MvGuRuJU+TR+cnFne7tKSwkXr64CUGcSRvhp/QcvhodPYxaACsMqM
 xvzssBBSafy6Wi9KObmSpnVaoOnj+vbKpASZZ/qodwQ42AW0QbN9JbKvrL6grMxlKZPJ+JP+p
 ncyzFIOohdwwzsQZc/aZopQ1lBTUXnvaZxxNH85noAghGZrpA6yXAmK/VgxmvwBDT4mc5QvwN
 vVoxuKCkFVNoCn52yRRQRVEmQmCPWYCbVG0XG3ECvvMNJKI+3gTnZBvVoFQSHq705GftTKb/z
 rl6SZETr9dEvOXQKWXPRZ6oiTGkfW7LzYfMLMwreGOo+n1B5KjmKAN4bAvbOlSUo9E+Sf09aG
 u6TNu6kwKmOzei8AiMDFSVkako0LuZya7JiY9ZNHGzu7Ah0Cuw86duRapT+k0hdFjivfsGjrc
 CBzBQpJaTUqqw0HtWsWv0EeHk6qQfWkREYCgTBIDamf0dRPJUqxx/tKnJGGoXYBy+LbzaFb9u
 LoedkjsXn60Zht73SXwnk6f+siPaA0EiE4m7av0davTOWT1YQQahK3jA+2Ei7eBJY6CCgyb0i
 b/NhUeB4HmnO0h98vdT7r3a8z2FYswXSLtmFqQNDdU+EcDOQXV8F5GBpxXRP6yeDe/9m6kM3X
 UuSqhpt
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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

Le 04/11/2022 à 10:55, Drew DeVault a écrit :
> On Fri Nov 4, 2022 at 10:53 AM CET, Philippe Mathieu-Daudé wrote:
>> Splitting this big patch would ease review:
> 
> It's only +165/-131, are you sure it really needs to be split?
> 
>> 1/ Replace safe_execve() by safe_execveat()
>>
>>      -safe_execve(exec_path, argp, envp))
>>      +safe_execveat(AT_FDCWD, exec_path, argp, envp, 0));
>>
>> 2/ Extract do_execve()
>>
>> 3/ Convert do_execve() to do_execveat() adding dirfd/flags args
>>
>> 4/ Add TARGET_NR_execveat case
> 

I think it's not needed, it's mainly a code move and it's easy to compare.

Thanks,
Laurent

