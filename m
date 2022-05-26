Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E21A534773
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 02:23:07 +0200 (CEST)
Received: from localhost ([::1]:58332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu1HO-0002WP-Ev
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 20:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nu1AM-0003R8-Ko
 for qemu-devel@nongnu.org; Wed, 25 May 2022 20:15:51 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:32777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nu1AK-00045L-Ue
 for qemu-devel@nongnu.org; Wed, 25 May 2022 20:15:50 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MtPzy-1nYMgQ2V5i-00uqmf; Thu, 26 May 2022 02:15:44 +0200
Message-ID: <c8c71525-f517-dbcc-11b1-461569b3392f@vivier.eu>
Date: Thu, 26 May 2022 02:15:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220430175342.370628-1-richard.henderson@linaro.org>
 <20220430175342.370628-11-richard.henderson@linaro.org>
 <ce53c8b1-b3fc-1cd4-7c65-58d970df5733@vivier.eu>
 <6e1fc8f9-b422-ab6a-191f-cc36e404355a@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v4 10/17] target/m68k: Implement TRAPcc
In-Reply-To: <6e1fc8f9-b422-ab6a-191f-cc36e404355a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2wwNPHfahFivHBZStUmNm6NyDr7fm8NukGjaKof4yv03RjMifcT
 AcitXb6PzGxMqg9IS5gIgtkYv82eTFETFDuKEHYmvVRloE+m/SvA5UzaVP477o0LRbYBOsq
 H+DJCqwItZNkmwA7nxaLaBBSBNPvGtSqEJsOqPHnuJ/vgx4OdKhHrX28nG9sdkXwkVnlP7N
 9e0FifeepMGuBiB917ssg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vzi/HX9nUqY=:gyzymSLPhusGtgv7Urez8z
 OS9fCkIhrj9q/BEzVLbaTzmf9BMhdmrEs22SdrkFuwzLp38/BYF3RkUX5O2mkXH8Bhtotkgje
 UqOJ3lVMhPl+Qpa9Kf4BXrr2ayb8QDwQ000o1jPtfBVQlXXZe5UNqu/tu6HAmw4DqLze6PPe4
 X7B178Ilro09koCqd/dr2vHVttKZyjehfjRzrmcdZUbM4IyaCFTJncDfRWufD0apWiodPHExJ
 0qDqpUIVYJT3Wx9t+ZdCOzbhVJglCPbSaAQTQspPSF+8ueVE3ODnDzikesV1MyDODcBLNUT5z
 AYGSc0/RjftYVTxskoynIK9X101tZoX+2YL4xPy/cAOvlz3EjmTFDmosw4nxyVvo9wf2rz3sd
 d3NGPbANo0RT0Wre2SnUuGJq4I+pZXefgt29ZdHwEInc+K0/8xJ4ghGDOvPxy6gCcVnX12vCm
 RKQMZ1Eh0+tBWHTIP4K42QA80//Pt+S6NE3BAFCD6T8n+/wlaXvQwNiQ8NRGd1dzL4EHCwPME
 wPy1yc+mL9+u848NFjxuCt8QbOcOnRHIdzAuWQJnyLGsH7d98tXLUexW15HYow/92zcndbdmY
 4X0m7NzZxS1i1bQXhp0wewNAgwKEtn8LjShQ0N9e55pQ3MXdWVsY4407W1wWess6Jko/8SsT+
 s+EHVNqKjQti8MqnI0jruiBwHCDnRap+l9H0dG9acvzHajvfOKmugWI8oBTw9OelOYVH2H2mp
 FVhL18fGfY8flPtxvheWbSh9mBmGAXh+IMS0cw==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 26/05/2022 à 00:26, Richard Henderson a écrit :
> On 5/25/22 14:40, Laurent Vivier wrote:
>>> +DISAS_INSN(trapcc)
>>> +{
>>> +    DisasCompare c;
>>> +
>>> +    /* Consume and discard the immediate operand. */
>>> +    switch (extract32(insn, 0, 3)) {
>>> +    case 2: /* trapcc.w */
>>> +        (void)read_im16(env, s);
>>> +        break;
>>> +    case 3: /* trapcc.l */
>>> +        (void)read_im32(env, s);
>>> +        break;
>>
>> Do we really need to read the data or do we only need to increment s->pc (as the data are only 
>> here to be available for the trap handler)?
> 
> We need to read the data to (1) trigger sigsegv when this insn crosses a page and (2) passing to tcg 
> plugins.
> 

For (1) I was wondering if the real CPU is actually doing it.

Nothing is said about it in the instruction definition.

Thanks,
Laurent

