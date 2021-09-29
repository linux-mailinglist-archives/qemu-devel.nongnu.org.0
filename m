Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 590F941CA90
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 18:46:52 +0200 (CEST)
Received: from localhost ([::1]:40822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVcjL-0007qd-6k
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 12:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mVcgj-00073n-DG
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 12:44:09 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:39309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mVcgh-0006yn-59
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 12:44:09 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 0CC9E5C013C;
 Wed, 29 Sep 2021 12:44:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 29 Sep 2021 12:44:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=z
 woYQu0CUv73pVd2QhoSgqBm7b6IOzzWlqxJbOd5Vm4=; b=hzAVKhFHjcxSz63Nd
 1cV+0sRw89wLn5Nsr1Zh4m6q9a0gpPrQYMlylWWqUbZ3wLxD8YJ/3OxPM/nv6UeW
 Fp0I3v6k4CHkNoOX9bmE9Jvor8dFdr6kfN4Wfga6JxRI1kzNxtnPXaVenJTYiTi7
 O4Lrq+6qGvY/DBViQdc6/gfprAMKziLtBAGELd/0YQDuR8X8m+lDpzXl7mzQO4Hv
 iVEVhCoLvHaPZXYr0OG5Wged3vfLcNyq+2ihTbyYzMLuba0ViaGGv9nny8777Ud+
 GzWrj2mLE3NvPcQCobf3U03iLfROzdbRzbrIUHzPZDnTVLzD1rvY0uAhLsOv9nK0
 PZjPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=zwoYQu0CUv73pVd2QhoSgqBm7b6IOzzWlqxJbOd5V
 m4=; b=aRqYNajCQO/Ipj8WUC3nPRW2ScHDVI4bnqim55p06Ib0ttcG1sU25fRaM
 F4XQ9itTovGmy3n0WuMlPV3we4qbtLaw7E1YK8yAEFAVBOgcpKkGgSKC3G2s0Vo/
 l+Y1+mVhvpFNdPTu0csXloYqmJO/3g6cqUOJm4kkzJRnGGCaHUG6/eiCOF+JMRkM
 e6J4Z4dwlNkz3VBLhY9QudAfJsF5GR/QnmY81TRgB+pccuXCn5W84nHF+ON/vLNN
 WEwgKUiQYI0Hc4sBWdLemyTITnmfPO+SYfyZ1t7TDQTFby8YscMYVvD78HcZXShQ
 T8JBLDanY8n85MwnhJG4So6INzx7g==
X-ME-Sender: <xms:1ZdUYc8qzKtrGjS36s5bklbIVMssolcBsH3I77ZVxHSS5zcWwE5FVg>
 <xme:1ZdUYUtQLtUOQTj0mYBaHhvcIVm6KjqiCfuuihznhKQybxdm0fOLQIN4lLbtrpFvd
 UKhtQ9KTsXorQQwRyw>
X-ME-Received: <xmr:1ZdUYSDqX2dsnbyrjWJht7S2qTDUGALCkgVmu5wz5ccUrZIBYG84tyrir30_MsU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekvddguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefkffggfgfuvfhfhfgjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgr
 gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
 cuggftrfgrthhtvghrnhepheeiuddvvefhkeejfedttdekieethfdukedvieeuueelgfel
 ieejgeehvdekudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:1ZdUYcfbkgquXOB3GbsS5hx3RgxYj-Y5LkDMs2IdIuVblk6URlSIrA>
 <xmx:1ZdUYRMitNvofmgp1T9klmZaQICpVPgz062q-3s2yp4nJ1dClj9kgg>
 <xmx:1ZdUYWkwusaTh5CdTPfXEs1Tq46Fu1CgtEpvOxZKJvNAVR6GH0qgug>
 <xmx:1pdUYSra5l1sRIRCHeFE47Fp_yvGNyQeqQtOkzIZLPzjMkV0GOEGMg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Sep 2021 12:44:05 -0400 (EDT)
Message-ID: <8027b068-1d39-a60d-0731-112ddbfb7db5@flygoat.com>
Date: Wed, 29 Sep 2021 17:44:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v2 2/3] hw/mips/boston: Allow loading elf kernel and dtb
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210929151211.108-1-jiaxun.yang@flygoat.com>
 <20210929151211.108-3-jiaxun.yang@flygoat.com>
 <ad60c95f-d2b1-a41b-ad27-cc811eef68dc@eik.bme.hu>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <ad60c95f-d2b1-a41b-ad27-cc811eef68dc@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=jiaxun.yang@flygoat.com;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.03,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: aleksandar.rikalo@syrmia.com, qemu-devel@nongnu.org, paulburton@kernel.org,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/9/29 16:36, BALATON Zoltan 写道:
>
>
> On Wed, 29 Sep 2021, Jiaxun Yang wrote:
>
>> ELF kernel allows us debugging much easier with DWARF symbols.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> -- 
>> v2: Use g_autofree
>> ---
>> hw/mips/boston.c | 36 ++++++++++++++++++++++++++++++++----
>> 1 file changed, 32 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
>> index 5c720440fb..5d3f054a3e 100644
>> --- a/hw/mips/boston.c
>> +++ b/hw/mips/boston.c
>> @@ -20,6 +20,7 @@
>> #include "qemu/osdep.h"
>> #include "qemu/units.h"
>>
>> +#include "elf.h"
>> #include "hw/boards.h"
>> #include "hw/char/serial.h"
>> #include "hw/ide/pci.h"
>> @@ -546,10 +547,37 @@ static void boston_mach_init(MachineState 
>> *machine)
>>             exit(1);
>>         }
>>     } else if (machine->kernel_filename) {
>> -        fit_err = load_fit(&boston_fit_loader, 
>> machine->kernel_filename, s);
>> -        if (fit_err) {
>> -            error_report("unable to load FIT image");
>> -            exit(1);
>> +        uint64_t kernel_entry, kernel_low, kernel_high, kernel_size;
>> +
>> +        kernel_size = load_elf(machine->kernel_filename, NULL,
>> +                           cpu_mips_kseg0_to_phys, NULL,
>> +                           (uint64_t *)&kernel_entry,
>> +                           (uint64_t *)&kernel_low, (uint64_t 
>> *)&kernel_high,
>
> These (uint64_t *) casts should not be needed and kernel_low seems to 
> be unused so you could just pass NULL for it (see commit 617160c9e1f8).
Oops, my fault, will fix in v3.
Thanks!

- Jiaxun
>
> Regards,
> BALATON Zoltan


