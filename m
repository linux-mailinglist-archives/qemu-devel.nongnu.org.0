Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6A82EB8D5
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 05:24:44 +0100 (CET)
Received: from localhost ([::1]:53750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx0NH-0001Js-Bb
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 23:24:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kx0MN-0000t2-Ic
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 23:23:47 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:35993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kx0ML-0002rK-90
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 23:23:47 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4C87D58070E;
 Tue,  5 Jan 2021 23:23:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 05 Jan 2021 23:23:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=k
 4p0aGo5U0AED6Cqi2pRdkkQhEJ7xthVH6Y6AiDjeQk=; b=iaUh944zFmr07cMLG
 EG+Z1BHey/cUyyfuseKot62tnnsW8cqT4vO+VQtYrTFwaM1knGL3NfyIJVjEoK9O
 u5SoCMY9dsmYyMo8SAo5Az8wXobvIKdMrTBAmXyAQYa37SHve94+QwZ6xwguEPhG
 NlBz8uGaCkJAjiW2/fvKP9PhvsZzX1JKw/n9YBpS+s/7TFMCceX91JvlgYVtCrmE
 KTQW+V6B6o2ghdcUEoHA0EAyj1tA91GzUq9Wx1awo+B/yhnaE/j8PeTzKcVXoqdW
 6LdQC7n7r5LKi74QSNWrQfqPPYJeFfeKp5J4mCrhz6OI5jdRm6DAAKSTsa2dAUe3
 Jam1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=k4p0aGo5U0AED6Cqi2pRdkkQhEJ7xthVH6Y6AiDje
 Qk=; b=nBK0v6UaFz7yNPZ8tPa20BOVwyWBcjhAh4IlT9oGVc91gtAxIzvz5fR1c
 gNqjgmNk2HKRyPII+GxJWI5LEps/v9cVxnBN+RNJBqLSOw94BH1vl4KuYtIwOS2O
 /ubBOu6cKv3wWDcHjJBpCKQ7elYiuSMR62tymI8sv9XB6dJqJJmyisTk/JpCu7Uu
 hWG8ULnDWCMhhg6mDCZXV/80M+Sfiql6YmRcTNME7FGE3ZsqVshHAf7Qc9SRA1uM
 RTxHM2y4+JeY6vo6+oNJv28xsmZXFt7fffLFleHttHZx4AUmwOt0+tA5MT0Pej5a
 Xmoc5wcYtlgUoHR7DLRR80N2C6KVA==
X-ME-Sender: <xms:TTv1X3izyAMFa7ynnaCygN2k9gjeQtg8Dd4vpYKPm5E6w5G4GvohIA>
 <xme:TTv1X0BWSLgEm0SCpru8P6pB3-n6zSNGNOiYwgUIGx4CJ8l5pY3disiUQ11MojnZO
 rOjW2ABPV21M2UD5fE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefkedgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeeggfevhffgvdehkeehjeeukeegieetueeggefhleetfeehveeh
 vdfhvdeiffdtvdenucffohhmrghinheprghnrghnughtvggthhdrtghomhdpmhgrihhlqd
 grrhgthhhivhgvrdgtohhmnecukfhppeeghedrfeefrdehtddrvdehgeenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnh
 hgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:TTv1X3GRqm7_1WeAsRCNTp-WxhC0H1lpBrTnR06tJqvwLExlX3bDFQ>
 <xmx:TTv1X0TfWrRjz_XEry4LtBgQtNbkKkNgzCN3LfPIyM7EaRdqPPTWAw>
 <xmx:TTv1X0zsO3b4lT7YnhR6hscvNMHQ3KrTTt1Bak3W4J4KQqHl2_4BaQ>
 <xmx:Tjv1X_-2Q42VejKcQ6WMU0jLqD0JgqU0TrKcpW7O-yWoS4QFjW5UwQ>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
 by mail.messagingengine.com (Postfix) with ESMTPA id 55ACC24005D;
 Tue,  5 Jan 2021 23:23:39 -0500 (EST)
Subject: Re: [PATCH v3 04/15] target/mips/mips-defs: Introduce CPU_MIPS64 and
 cpu_type_is_64bit()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210104221154.3127610-1-f4bug@amsat.org>
 <20210104221154.3127610-5-f4bug@amsat.org>
 <aee2c3f4-f4b0-1d1a-2029-3c027d6cd724@linaro.org>
 <f351074a-e63e-f39a-c807-9250deca9c39@amsat.org>
 <d8cdb54c-bfd5-1ade-090a-7ad15974a302@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <59096982-882f-5912-0fc4-27cb89166381@flygoat.com>
Date: Wed, 6 Jan 2021 12:23:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <d8cdb54c-bfd5-1ade-090a-7ad15974a302@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: permerror client-ip=66.111.4.229;
 envelope-from=jiaxun.yang@flygoat.com; helo=new3-smtp.messagingengine.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.249,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

在 2021/1/5 下午6:05, Philippe Mathieu-Daudé 写道:
> Hi Richard,
>
> On 1/5/21 9:34 AM, Philippe Mathieu-Daudé wrote:
>> On 1/5/21 12:30 AM, Richard Henderson wrote:
>>> On 1/4/21 12:11 PM, Philippe Mathieu-Daudé wrote:
>>>> MIPS 64-bit ISA is introduced with MIPS3.
>>>>
>>>> Introduce the CPU_MIPS64 definition aliased to the MIPS3 ISA,
>>>> and the cpu_type_is_64bit() method to check if a CPU supports
>>>> this ISA (thus is 64-bit).
>>>>
>>>> Suggested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>> ---
>>>>   target/mips/cpu.h       | 5 +++++
>>>>   target/mips/mips-defs.h | 4 +++-
>>>>   2 files changed, 8 insertions(+), 1 deletion(-)
>>> I still don't understand this as an alias, as opposed to a separate bit.
>>> (ISA_MIPS3 | CPU_MIPS64R6) does not make sense, because R6 removes instructions.
> Well, FWIW (ISA_MIPS3 | CPU_MIPS64R6) is what we currently have:
>
> #define CPU_MIPS64R6    (CPU_MIPS64R5 | CPU_MIPS32R6 | ISA_MIPS64R6)
>
> #define CPU_MIPS64R5    (CPU_MIPS64R3 | CPU_MIPS32R5 | ISA_MIPS64R5)
>
> #define CPU_MIPS64R3    (CPU_MIPS64R2 | CPU_MIPS32R3 | ISA_MIPS64R3)
>
> #define CPU_MIPS64R2    (CPU_MIPS64 | CPU_MIPS32R2 | ISA_MIPS64R2)
>
> #define CPU_MIPS64      (CPU_MIPS5 | CPU_MIPS32 | ISA_MIPS64)
>
> #define CPU_MIPS5       (CPU_MIPS4 | ISA_MIPS5)
>
> #define CPU_MIPS4       (CPU_MIPS3 | ISA_MIPS4)
>
> #define CPU_MIPS3       (CPU_MIPS2 | ISA_MIPS3)
>
> So CPU_MIPS64R6 -> CPU_MIPS64R5 -> CPU_MIPS64R3 -> CPU_MIPS64R2
>   -> CPU_MIPS64 -> CPU_MIPS5 -> CPU_MIPS4 -> CPU_MIPS3 -> ISA_MIPS3
>
> This patch doesn't make it worst :)
>
>> I now understand your concern.
>>
>> I based the decodetree logic on the R6 ISA manual, decoding the
>> bits from the more recent feature (a leaf) to the root, following
>> this tree:
>> https://images.anandtech.com/doci/8457/MIPS%20ISA%20Evolution.JPG
>> (2.3 Evolution of the Architecture).
>>
>> Also "2.1 Historical Perspective":
>>
>>    In the MIPS IIITM ISA, 64-bit integers and addresses were added
>>    to the instruction set. [...]
>>    The MIPS32 Release 6 ISA maintains backward-compatibility, with
>>    the exception of a few rarely used instructions, though the use
>>    of trap-and-emulate or trap-and-patch; all pre-Release 6 binaries
>>    can execute under binary translation. [...]
>>    The MIPS64 Architecture is based on the MIPS V ISA and is backward
>>    compatible with the MIPS32 Architecture.

Hi all,

Well I don't think it's worthy to keep R6 backward compatible with previous
Release. Opcodes existed in pre-R6 but removed in R6 will be reused in
future Releases (e.g. R6.1) for different functions.

And the statement here about trap-and-emul, trap-and-patch is false. It 
never
happens in the real world. R2-to-R6 emul in kernel never goes into 
production
quality, not to mention IEEE754-2008 (NAN2008) issue.

Based on documents we have, I'd prefer to treat MIPS ISA into three eras
Classic (I, II, III, IV), Modern (R1, R2, R3, R5), R6+(R6 and afterwards).
The difference inside each era is well-documented in manuals, it can prevent
us from get into a long-term hide and seek game of finding difference 
between
ISA levels.

>>
>>> But if this is an intermediate step,
>> As this isn't planned as intermediate step, I'll try to keep
>> CPU_MIPS64 as a separate bit and post the result.
> I'm not sure it is worth the effort, as I plan to check each ISA /
> ASE bit from the CP0_ConfigX bits (similarly target/arm/ does), so
> these definitions should disappear eventually.
>
> I.e. for the MSA ASE see:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg767523.html
>
>   /* Check presence of MSA implementation */
>   static inline bool ase_msa_available(CPUMIPSState *env)
>   {
>       return env->CP0_Config3 & (1 << CP0C3_MSAP);
>   }
Unfortunately MIPS has a bad manner that allows vendors to have random
extensions without unique identification.
ASEs flag can never go...... But identify ASEs from registers is surely 
a good
idea though. At least removing MIPS defined ASEs from ASE flag can make
life easier.

AFAIK Loongson has a CPUID instruction for 3A4000 and we may
implement that to identify Loongson extensions, Ingenic is also marking
MXU support in CP0. There could be some PRID based match to further
reduce ASEs flag.

Thanks.

- Jiaxun

>
> Might I keep your R-b tag for this patch (eventually improving the
> commit description with some of the info added in this mail) and
> keep going?
>
> Thanks,
>
> Phil.


