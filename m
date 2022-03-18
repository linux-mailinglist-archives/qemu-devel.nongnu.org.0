Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C7A4DDA09
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 13:58:26 +0100 (CET)
Received: from localhost ([::1]:34572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVCBU-0002vY-T6
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 08:58:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nVC8F-0007ef-LD; Fri, 18 Mar 2022 08:55:04 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:34977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nVC8D-0005Tm-TK; Fri, 18 Mar 2022 08:55:03 -0400
Received: from [192.168.100.1] ([82.142.28.230]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MPooP-1njJ1w0lpz-00MunD; Fri, 18 Mar 2022 13:54:55 +0100
Message-ID: <4d62086f-f048-bb55-41dc-950cf83320c7@vivier.eu>
Date: Fri, 18 Mar 2022 13:54:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH trivial 1/1] hw/pci/pci.c: Fix typos of "Firewire", and of
 "controller" on same line
Content-Language: fr
To: Peter Maydell <peter.maydell@linaro.org>,
 Rebecca Cran <quic_rcran@quicinc.com>
References: <20220318101124.912-1-quic_rcran@quicinc.com>
 <CAFEAcA-SHKsmemg10VnO6pcKrR9HB=ViX0+zhwWKXGzMsp8Obg@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <CAFEAcA-SHKsmemg10VnO6pcKrR9HB=ViX0+zhwWKXGzMsp8Obg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:eU53p55pO6bjJ6w9khKhsHNPfraQ42Lbk62tEb2RmioyNjXkKBt
 lHtvyqpXakZ7mpSFeuFVS0TsuWJ/+fb/OhWZHO2GmYjQtx6sDPyEeIKl5EM5g24i0Eyyk/A
 lB8wR+l8QfXj+11eE0JN7tk9qM2oSMdA/tBKMW83XyvxR4TJutyDA0OSyNMzC0Ic6VmQspD
 39Z52nu0EpU3jFmVUAi0g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ppm/uO31+Y4=:gPEO/DCQocBMX4tTL4kkGO
 dzcdxq5oscVXrt41EvH5PYAP/2WzlmhpkqeXv3vPJAijpyGgpaHMOk4G8FtPm5F38t5TNTK+4
 481pEBEQwZrJtv7DifNFFfWVwhWvpmWjn4x1wf8tkzb1aQ7Q4BG+RBQjF1dUjX25ZfbRXwp2h
 LKkp3Gm+mLoXbjVik9r6WrVy06Hl5e5e8aOAHJ/qozP1UfuFoNpYoVdYNKzXdnOj7R7ej4DFB
 vdcjWkYL1r3vqVfJtGrVnac/QDdlJhzkKKotr+AHtRp4KXudUHxkRYzmNGepZ+sG5AYa4dGQ3
 NJjEHhfo/LVMy5BffEvptkuVc8RopQMKOTY+PTykWFDchGABzR3Pr4PYmMBg3e8WkAa16IcNX
 vPhqvAz8H3WB3e6jWf4ashwMdDTiTRZLAlwjDM9QeNfmFjZMZUXjOTs5J4lMPckZg1IrN4kM6
 H+QfR5CbgL74H9GO4XQcaefmNtHvQq0UmSpoZWhMOJdf9CnleRCYReyP+MHGWuiYcHLra7tLU
 stuYhBVsTx6I8GcTocmIkFiTQ5l0UNLJb4o+G9fWzDULQ8g69arfEBOPX7UTie8tD3cVVdxpi
 /M0ZAnZzrrmyaQ1g3mMFsFmSakKYPB2omsH5Np0gC/mxwNmUWhEcgVlVU6vDQcHuUmgAMHhv3
 7zu5Vc3opRYKP3S7s+BdLOkxLF+QIDb/8ZE4l0/Uy56SVPS2sFlBLRulBDr5vnWKpJto=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 18/03/2022 à 11:45, Peter Maydell a écrit :
> On Fri, 18 Mar 2022 at 10:14, Rebecca Cran <quic_rcran@quicinc.com> wrote:
>>
>> Signed-off-by: Rebecca Cran <quic_rcran@quicinc.com>
>> ---
>>   hw/pci/pci.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index 5cb1232e271d..dae9119bfe5f 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -1697,7 +1697,7 @@ static const pci_class_desc pci_class_descriptions[] =
>>       { 0x0902, "Mouse", "mouse"},
>>       { 0x0A00, "Dock station", "dock", 0x00ff},
>>       { 0x0B00, "i386 cpu", "cpu", 0x00ff},
>> -    { 0x0c00, "Fireware contorller", "fireware"},
>> +    { 0x0c00, "Firewire controller", "firewire"},
>>       { 0x0c01, "Access bus controller", "access-bus"},
>>       { 0x0c02, "SSA controller", "ssa"},
>>       { 0x0c03, "USB controller", "usb"},
>> --
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 


Applied to my trivial-patches branch.

Thanks,
Laurent

