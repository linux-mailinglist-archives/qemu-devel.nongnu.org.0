Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A104CD7B3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 16:24:35 +0100 (CET)
Received: from localhost ([::1]:40508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ9nG-0001uL-Q8
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 10:24:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nQ91m-0007vU-QB
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:35:30 -0500
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:58589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nQ91j-00081H-EL
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 09:35:30 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.21])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 8B74B22BB1;
 Fri,  4 Mar 2022 14:35:24 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 4 Mar
 2022 15:35:22 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0069a39bcce-c610-4397-bb6c-6553568e316f,
 454269BBD7D092EADEDBDC9145CF0558877B405D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.1.230.64
Message-ID: <e29682d1-8dd1-9840-1581-a99363fc247f@kaod.org>
Date: Fri, 4 Mar 2022 15:35:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Issue with qemu-system-ppc running OSX guests
Content-Language: en-US
To: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 qemu-ppc <qemu-ppc@nongnu.org>, Howard Spoelstra <hsp.cat7@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Fabiano Rosas <farosas@linux.ibm.com>
References: <CABLmASFbowE4Cu8gHk9eD+_h8ZrdupE8MHKAfpW+T8Oe=-3=Wg@mail.gmail.com>
 <e2dd457d-29b3-32be-72e2-315e686dff69@eik.bme.hu>
 <CABLmASH5tFs86Dq+1e+ByMF43jZL5UZ7MempVVhtKCwjdpa7aw@mail.gmail.com>
 <87pmn352q0.fsf@linux.ibm.com>
 <a3917a31-b899-a289-5102-5b8be20aae27@eldorado.org.br>
 <7c7b2adb-67e1-26b8-03a3-74f70dc9bc80@kaod.org>
 <0cf4d2bb-0559-854b-8051-3c391988bc8b@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <0cf4d2bb-0559-854b-8051-3c391988bc8b@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9e08c99e-7920-4000-96fa-2eb5adf02c88
X-Ovh-Tracer-Id: 2570148013604637478
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddtkedgieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/22 15:18, Lucas Mateus Martins Araujo e Castro wrote:
> 
> On 04/03/2022 11:07, Cédric Le Goater wrote:
>>
>> On 3/4/22 12:08, Lucas Mateus Martins Araujo e Castro wrote:
>>>
>>> On 02/03/2022 20:55, Fabiano Rosas wrote:
>>>> Howard Spoelstra<hsp.cat7@gmail.com>  writes:
>>>>
>>>>> On Wed, Mar 2, 2022 at 9:11 PM BALATON Zoltan<balaton@eik.bme.hu>  wrote:
>>>>>
>>>>>> On Wed, 2 Mar 2022, Howard Spoelstra wrote:
>>>>>>> Hi all,
>>>>>>>
>>>>>>> I noticed qemu-system-ppc running OSX guests does not get to the desktop
>>>>>> or
>>>>>>> does not display the menu bars.
>>>>>> Cc-ing the relevant people and the PPC list might help, I've added them.
>>>>>> Also telling which OSX guest version can reproduce the problem could help
>>>>>> debugging. Is it any OSX version?
>>>>>>
>>>>>> Regards,
>>>>>> BALATON Zoltan
>>>>>>
>>>>> Oops, Qemu running on Fedora 35 host,
>>>>> Reproducer:
>>>>>
>>>>> ./qemu-system-ppc \
>>>>> -M mac99 \
>>>>> -m 512 \
>>>>> -L pc-bios \
>>>>> -display sdl -serial stdio \
>>>>> -boot c \
>>>>> -drive file=10.1.img,format=raw,media=disk
>>>>>
>>>>> The issue affects all supported Mac OSX guests: 10.0 to 10.5
>>>> Hi Howard,
>>>>
>>>> Thanks for bisecting this. It seems we inadvertently marked some of the
>>>> Vector Multiply instructions to be ISA v2.07 only.
>>>>
>>>> I can boot Mac OSX 10.4 until the desktop with this fix:
>>>>
>>>> diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
>>>> index f91bee839d..c5d02d13fe 100644
>>>> --- a/target/ppc/translate/vmx-impl.c.inc
>>>> +++ b/target/ppc/translate/vmx-impl.c.inc
>>>> @@ -3141,14 +3141,14 @@ static bool trans_VMULLD(DisasContext *ctx, arg_VX *a)
>>>>       return true;
>>>>   }
>>>>
>>>> -TRANS_FLAGS2(ALTIVEC_207, VMULESB, do_vx_helper, gen_helper_VMULESB)
>>>> -TRANS_FLAGS2(ALTIVEC_207, VMULOSB, do_vx_helper, gen_helper_VMULOSB)
>>>> -TRANS_FLAGS2(ALTIVEC_207, VMULEUB, do_vx_helper, gen_helper_VMULEUB)
>>>> -TRANS_FLAGS2(ALTIVEC_207, VMULOUB, do_vx_helper, gen_helper_VMULOUB)
>>>> -TRANS_FLAGS2(ALTIVEC_207, VMULESH, do_vx_helper, gen_helper_VMULESH)
>>>> -TRANS_FLAGS2(ALTIVEC_207, VMULOSH, do_vx_helper, gen_helper_VMULOSH)
>>>> -TRANS_FLAGS2(ALTIVEC_207, VMULEUH, do_vx_helper, gen_helper_VMULEUH)
>>>> -TRANS_FLAGS2(ALTIVEC_207, VMULOUH, do_vx_helper, gen_helper_VMULOUH)
>>>> +TRANS_FLAGS(ALTIVEC, VMULESB, do_vx_helper, gen_helper_VMULESB)
>>>> +TRANS_FLAGS(ALTIVEC, VMULOSB, do_vx_helper, gen_helper_VMULOSB)
>>>> +TRANS_FLAGS(ALTIVEC, VMULEUB, do_vx_helper, gen_helper_VMULEUB)
>>>> +TRANS_FLAGS(ALTIVEC, VMULOUB, do_vx_helper, gen_helper_VMULOUB)
>>>> +TRANS_FLAGS(ALTIVEC, VMULESH, do_vx_helper, gen_helper_VMULESH)
>>>> +TRANS_FLAGS(ALTIVEC, VMULOSH, do_vx_helper, gen_helper_VMULOSH)
>>>> +TRANS_FLAGS(ALTIVEC, VMULEUH, do_vx_helper, gen_helper_VMULEUH)
>>>> +TRANS_FLAGS(ALTIVEC, VMULOUH, do_vx_helper, gen_helper_VMULOUH)
>>>>   TRANS_FLAGS2(ALTIVEC_207, VMULESW, do_vx_helper, gen_helper_VMULESW)
>>>>   TRANS_FLAGS2(ALTIVEC_207, VMULOSW, do_vx_helper, gen_helper_VMULOSW)
>>>>   TRANS_FLAGS2(ALTIVEC_207, VMULEUW, do_vx_helper, gen_helper_VMULEUW)
>>>> ---
>>>>
>>>> I'll let Lucas comment on it and we can send a proper patch in the
>>>> morning.
>>>
>>> Checking here it seems I misread the PowerISA appendix and marked these instructions (vmul[eo].[bh]) as v2.07 even though they are v2.03.
>>>
>>> This patch seems to correct it and checking here the newer instructions are correct (v2.07 for vmul[eo].w and v3.1 for vmul[eo].d), so
>>>
>>> Reviewed-by: Lucas Mateus Castro<lucas.araujo@eldorado.org.br>
>>
>>
>> Could you please send a proper patch ? The above was given as an example.
>>
>> Thanks,
>>
>> C.
>>
> Yes, this will be added as a proper patch to the fix up patches Matheus will send later.

We are entering the freeze window. I would rather have one patch per issue please.

Thanks,

C.


