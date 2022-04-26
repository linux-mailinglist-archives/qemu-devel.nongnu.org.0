Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DBE50FBA3
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 13:01:04 +0200 (CEST)
Received: from localhost ([::1]:37782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njIwJ-0000aZ-5E
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 07:01:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1njIOZ-0002np-4h; Tue, 26 Apr 2022 06:26:11 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:38403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1njIOV-0006VN-KW; Tue, 26 Apr 2022 06:26:10 -0400
Received: from [192.168.100.1] ([82.142.9.138]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MK3eI-1nSAyr2ZaQ-00LS8r; Tue, 26 Apr 2022 12:26:03 +0200
Message-ID: <2dac2575-08b4-e3c3-9b48-108037a10d59@vivier.eu>
Date: Tue, 26 Apr 2022 12:26:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] hw/pvrdma: Some cosmetic fixes
Content-Language: fr
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20220403095837.2378-1-yuval.shaia.ml@gmail.com>
 <CAC_L=vVn3zDbPfwzfKR3t=UCavSyC-p4dtU9Ka3xT9evOt1d+g@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <CAC_L=vVn3zDbPfwzfKR3t=UCavSyC-p4dtU9Ka3xT9evOt1d+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hVTkIUgTltZvj8gfCY6K3gDtxXkUHqJ7IBii5FFGD4yi1ycvXgm
 KfXzKyUzRqEHW9/gpyDfHXTQk4mqpscLcXqHxYHphSY/HLsly7T8yGNnaWW1sc9QWZXXJDr
 bXsB+vMZFgkl9B0NiEAt0YJRwihjnIRvSlNJIDCQEgWvMvdAvk7Mocx1DgGkeA47K991ANc
 UG6eGXBppKIWG85q1d1Yw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QuXhKVT/KM8=:8O2O5XRO4j2Ha02IdH7/ub
 6HcXlPV+bEjtFderu7tIGEG3lyaij3vRuduAEm4EilwSMyzYM6BTyz9xzpAs9zmwJlslH1Lrm
 Rh3WSIBccHW0IIY4Q9smMm8bUWmXcKnUJmRYDIQD2DkSf/MLfrKLUaqeKH6FqA9hkLoNHiEIr
 SncqkRY8nl0n9tGkndsjTldlVjt7OmFr2yrq/VrO07jRkMwRUkSb0BTev2yuoi4mx6ujvzkKb
 P/Z5FNSwllJxAE7sCLo0zotITZ7GQOKpE1y/Siie6hhbN3aVdG8M0fUu487s7eOZsRbeswA9a
 o4nJD7KNhnNLlrRWatDnrz0WZt5+51CfL+csOLOffkQj47xHjMN8198p4aYXwxnIapsQj4Jo1
 aB3/0hVUPHoFRw/nRJhtEPda3zH9QljxApo4fgizcEiTPvacEMtYETZ0NSnvHiU2e/8A88bP/
 S+yJeBA9jDLkkK3aH+SXPuYZpZHNiHfQBb5NAoqjfMVD8fr/04YohGx3hv30iVfzNDGyIJUjc
 SEjQn25+zI0Z4eNBj4hpFL+bLThhW7ZiNq6E73O5z47H7R/bjO8r0QiTclCFSaB6dow4EGomT
 lojaebnweoxEFCKs2X7xVBLpoMwLkmWiLeGpV9BHvRikKls0sP65cRFpDDGaZQLg8bRMMIXyK
 FE1/dPi+0asFzOcoJZgwCepJnk3zFaPmJrgoIdVOUGwnGWCf7b0WqOGNxsANVD/QLq00=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: qemu devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 05/04/2022 à 12:25, Marcel Apfelbaum a écrit :
> On Sun, Apr 3, 2022 at 12:00 PM Yuval Shaia <yuval.shaia.ml@gmail.com> wrote:
>>
>> Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
>> ---
>>   hw/rdma/vmw/pvrdma_main.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
>> index 91206dbb8e..aae382af59 100644
>> --- a/hw/rdma/vmw/pvrdma_main.c
>> +++ b/hw/rdma/vmw/pvrdma_main.c
>> @@ -159,13 +159,13 @@ static void free_dsr(PVRDMADev *dev)
>>       free_dev_ring(pci_dev, &dev->dsr_info.cq, dev->dsr_info.cq_ring_state);
>>
>>       rdma_pci_dma_unmap(pci_dev, dev->dsr_info.req,
>> -                         sizeof(union pvrdma_cmd_req));
>> +                       sizeof(union pvrdma_cmd_req));
>>
>>       rdma_pci_dma_unmap(pci_dev, dev->dsr_info.rsp,
>> -                         sizeof(union pvrdma_cmd_resp));
>> +                       sizeof(union pvrdma_cmd_resp));
>>
>>       rdma_pci_dma_unmap(pci_dev, dev->dsr_info.dsr,
>> -                         sizeof(struct pvrdma_device_shared_region));
>> +                       sizeof(struct pvrdma_device_shared_region));
>>
>>       dev->dsr_info.dsr = NULL;
>>   }
>> @@ -249,7 +249,8 @@ static void init_dsr_dev_caps(PVRDMADev *dev)
>>   {
>>       struct pvrdma_device_shared_region *dsr;
>>
>> -    if (dev->dsr_info.dsr == NULL) {
>> +    if (!dev->dsr_info.dsr) {
>> +        /* Buggy or malicious guest driver */
>>           rdma_error_report("Can't initialized DSR");
>>           return;
>>       }
>> --
>> 2.20.1
>>
> 
> cc: QEMU Trivial <qemu-trivial@nongnu.org>
> 
> Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>


Applied to my trivial-patches branch.

Thanks,
Laurent


