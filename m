Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1411F4203E5
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 22:21:48 +0200 (CEST)
Received: from localhost ([::1]:48782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX7zW-000267-M7
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 16:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mX7y5-00013G-KQ
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 16:20:18 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:37421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1mX7y3-00017l-In
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 16:20:16 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 61CF95C0125;
 Sun,  3 Oct 2021 16:20:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sun, 03 Oct 2021 16:20:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=u
 2bxOz2svgK/AFHl5pt/vSJs4zUaOruoMWi0Pvqh0W0=; b=EoU9dN0wGwPrShi08
 VidflLQCWTKHo7iXBwv1v/5GLSnja1ibbJNAHgZFrV5v45yszpbMdmJeGQmupfaE
 Eny7dOmKzlS8v6l3VYB/J04cs87boM3V7dIYfMKwlUQeT9ppaHkn48zPQBUugh7r
 cxLE+NI9n++bZ7NEzZ4ztkRHzzNPFtRJu3xK2Or+4G61+eE41inKMtDZUvqR3a+w
 d/2XGepHF+i7golHSFKP4cEI/yVLLU8tL5In4CYE/IWqwlEhLpWWX3ShPR2nSsGs
 W/inQdo7RpwOoMzpwFR4GE9Jd4AHSmfmoEUhFTChIii1ZyfcdrqzBQZ2pqb/i1CI
 6drMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=u2bxOz2svgK/AFHl5pt/vSJs4zUaOruoMWi0Pvqh0
 W0=; b=S1X3w5c3hfpX1B+6Yx/b9RUr+vf6fvxaYdEu/PFH30qucgoWXKazVYCLM
 hkpJfqsqYLXCqBA0grAKxe3WphbGjBXbpS49srn49QTPSrtSYMWnRRICvUWnO/si
 p96HgC5XJoJ8t3YNV4MsgQvHqmuBKK2Gs+8x4PgeRRt8dDoAcle350wB/XHPGEQJ
 SctKG23kgaDvY2BTXiOUsbW7gYCRzB5D4nOO2CAsdZxbsfsQ8ViauD5CVFQ5BoS+
 dSxHOpVCKEu49zVE8ZanO42IlwWXPGx+L1N3e9hagSKpT0gi/38pSK/PBI9XHqkZ
 Br8ZJ0gec/aypQeAP+IY5xcNY5hOQ==
X-ME-Sender: <xms:fBBaYSCcN4htRey6eH8Gg8Tx2TAJMMwFBLThmw75sJck7lKFHNgGnw>
 <xme:fBBaYchVaOv8jGP-Mit_CwUYxucSMDLi6U8IppuS71Il7De96FIqfdWW7OI_wg_iI
 BSZxqFKWcd_j5D4N7E>
X-ME-Received: <xmr:fBBaYVmOPnQaUJ-buOhiN5aIg7RksRm-E9h-VQwWJE5go1cOA_0k12iGKyKtbms>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeltddgudegiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepkfffgggfuffvfhfhjggtgfesth
 ekredttdefjeenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
 nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeehieduvdevhfekje
 eftddtkeeitefhudekvdeiueeulefgleeijeeghedvkeduleenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
 ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:fBBaYQz-dV8iWTAfSUhbJ_yRbx2blvZ4eEqglYxRdB8-VGLsguFIJQ>
 <xmx:fBBaYXS3z37Dm51j9OCfAI9NrouLnJysU6iS9MVJUhGZj6TpsLfPAw>
 <xmx:fBBaYbbwGdXzsCK2ifMlY_jU_aUkpDk93U4NmhnBo_S9Ki2xgN08rQ>
 <xmx:fBBaYSe_RqgRw0Pk3gwaf5fNWUMjrML3CUOO5pHHI7BlfBBIWCeGbA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 3 Oct 2021 16:20:11 -0400 (EDT)
Message-ID: <b6b86f6f-b707-05e8-2bae-e09b98324d79@flygoat.com>
Date: Sun, 3 Oct 2021 21:20:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v3 3/3] hw/mips/boston: Add FDT generator
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211002184539.169-1-jiaxun.yang@flygoat.com>
 <20211002184539.169-4-jiaxun.yang@flygoat.com>
 <7e001a0a-c7e4-ac60-d9b7-bfc018a9f9fe@amsat.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <7e001a0a-c7e4-ac60-d9b7-bfc018a9f9fe@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=jiaxun.yang@flygoat.com;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: aleksandar.rikalo@syrmia.com, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/10/3 18:45, Philippe Mathieu-Daudé 写道:
> On 10/2/21 20:45, Jiaxun Yang wrote:
>> Generate FDT on our own if no dtb argument supplied.
>> Avoid introducing unused device in FDT with user supplied dtb.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> --
>> v2: Address f4bug cmments (Thanks!)
>> ---
>>   hw/mips/boston.c | 234 +++++++++++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 226 insertions(+), 8 deletions(-)
>>   static void boston_mach_init(MachineState *machine)
>>   {
>>       DeviceState *dev;
>> @@ -555,21 +771,23 @@ static void boston_mach_init(MachineState *machine)
>>                              NULL, 0, EM_MIPS, 1, 0);
>>   
>>           if (kernel_size) {
>> +            int dt_size;
>> +            g_autofree const void *dtb_file_data, *dtb_load_data;
>>               hwaddr dtb_paddr = QEMU_ALIGN_UP(kernel_high, 64 * KiB);
>>               hwaddr dtb_vaddr = cpu_mips_phys_to_kseg0(NULL, dtb_paddr);
>>   
>>               s->kernel_entry = kernel_entry;
>>               if (machine->dtb) {
>> -                int dt_size;
>> -                g_autofree const void *dtb_file_data, *dtb_load_data;
>> -
>>                   dtb_file_data = load_device_tree(machine->dtb, &dt_size);
>> -                dtb_load_data = boston_fdt_filter(s, dtb_file_data, NULL, &dtb_vaddr);
> Isn't it better to let boston_fdt_filter() here, ...
>
>> -
>> -                /* Calculate real fdt size after filter */
>> -                dt_size = fdt_totalsize(dtb_load_data);
>> -                rom_add_blob_fixed("dtb", dtb_load_data, dt_size, dtb_paddr);
>> +            } else {
>> +                dtb_file_data = create_fdt(s, boston_memmap, &dt_size);
> ... and pass kernel_cmdline & machine->ram_size to create_fdt(),
> filling the bootargs & memory nodes?
That will be done in boston_fdt_filter, which shares between FDT 
generator path
and dtb file path.

Thanks.
- Jiaxun
>
>>               }
>> +
>> +            dtb_load_data = boston_fdt_filter(s, dtb_file_data, NULL, &dtb_vaddr);
>> +
>> +            /* Calculate real fdt size after filter */
>> +            dt_size = fdt_totalsize(dtb_load_data);
>> +            rom_add_blob_fixed("dtb", dtb_load_data, dt_size, dtb_paddr);
>>           } else {
>>               /* Try to load file as FIT */
>>               fit_err = load_fit(&boston_fit_loader, machine->kernel_filename, s);
>>


