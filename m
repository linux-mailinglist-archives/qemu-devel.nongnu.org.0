Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50517863CF
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Aug 2019 16:00:28 +0200 (CEST)
Received: from localhost ([::1]:51978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvixv-0005Du-9Q
	for lists+qemu-devel@lfdr.de; Thu, 08 Aug 2019 10:00:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58593)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hvixA-0004hs-VC
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 09:59:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hvix9-0001IF-GX
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 09:59:40 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35565)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hvix9-0001Hk-AN
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 09:59:39 -0400
Received: by mail-wm1-f68.google.com with SMTP id l2so2549639wmg.0
 for <qemu-devel@nongnu.org>; Thu, 08 Aug 2019 06:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6sXO4Qj3cGT4zD/QKycIWPqFJ7ou/1KvGjEoMZC0CH4=;
 b=nLPC3Pcg0g6waE+RXdNTl2TIUlpVSEpxzrEIZYDqVIKY6zXy/ZtuZv4dWHeICn4VNn
 6C2s5O9R260qZns4ThnexNCEI2x/yUisGSkYQXW3EvuIfUXDe3sTVHtxBS7DBgkr4uV8
 b3Y72gHDeT6mStu3/lQrNBoJ/jHziSwi1zY/7uEFaPibifg9UslZKllaQEBg3sZIhxxg
 Xh9sk6vj3PqhabdNBln2JZjbs0uZt5mQE7lTUTgw/KvEOrcZhooj9BXJtfcV8H8gnChU
 evbZaEhr3lbq/58nBIrPnK5vF3sTGcvLZ8BLYnU0XGCGyjh+MO2dcIOKvuL7VaWdjOXc
 MmNg==
X-Gm-Message-State: APjAAAVOfiumWbk13mQhSMuqR6ypAQU/fSbZrpsvs0uTGvjPD+Kd6jBZ
 N4fYxpuHTZQdzxk8tYMD7HuFsQ==
X-Google-Smtp-Source: APXvYqyXKkZs450reJJBPrT0XZOx7MS1L53a6pZeq1rGEH8uS7JmaCfCKImDfbbRSOFAne6hnODsWQ==
X-Received: by 2002:a1c:a1c1:: with SMTP id k184mr4769081wme.81.1565272777879; 
 Thu, 08 Aug 2019 06:59:37 -0700 (PDT)
Received: from [192.168.1.39] (214.red-83-51-160.dynamicip.rima-tde.net.
 [83.51.160.214])
 by smtp.gmail.com with ESMTPSA id 66sm16177568wrc.83.2019.08.08.06.59.36
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 06:59:37 -0700 (PDT)
To: Marcelo Tosatti <mtosatti@redhat.com>
References: <20190808090652.2478-1-ppandit@redhat.com>
 <39a5c98f-f402-2985-2d49-800e73f53f4f@redhat.com>
 <20190808134646.GA6915@amt.cnet>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <84440ce1-374d-e612-c7a9-184e55242ffe@redhat.com>
Date: Thu, 8 Aug 2019 15:59:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190808134646.GA6915@amt.cnet>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-devel] [PATCH v2] scsi: lsi: exit infinite loop while
 executing script (CVE-2019-12068)
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
Cc: Fam Zheng <fam@euphon.net>, Prasad J Pandit <pjp@fedoraproject.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>,
 Bugs SysSec <bugs-syssec@rub.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/8/19 3:46 PM, Marcelo Tosatti wrote:
> On Thu, Aug 08, 2019 at 11:31:02AM +0200, Philippe Mathieu-Daudé wrote:
>> On 8/8/19 11:06 AM, P J P wrote:
>>> From: Prasad J Pandit <pjp@fedoraproject.org>
>>>
>>> When executing script in lsi_execute_script(), the LSI scsi
>>> adapter emulator advances 's->dsp' index to read next opcode.
>>> This can lead to an infinite loop if the next opcode is empty.
>>> Exit such loop after reading 10k empty opcodes.
>>>
>>> Reported-by: Bugs SysSec <bugs-syssec@rub.de>
>>> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
>>> ---
>>>  hw/scsi/lsi53c895a.c | 11 +++++++++--
>>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>> Update v2: define LSI_MAX_INSN 10000
>>>   -> https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg01370.html
>>>
>>> diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
>>> index 10468c1ec1..2adab341b1 100644
>>> --- a/hw/scsi/lsi53c895a.c
>>> +++ b/hw/scsi/lsi53c895a.c
>>> @@ -185,6 +185,9 @@ static const char *names[] = {
>>>  /* Flag set if this is a tagged command.  */
>>>  #define LSI_TAG_VALID     (1 << 16)
>>>  
>>> +/* Maximum instructions to process. */
>>> +#define LSI_MAX_INSN    10000
>>> +
>>>  typedef struct lsi_request {
>>>      SCSIRequest *req;
>>>      uint32_t tag;
>>> @@ -1132,7 +1135,10 @@ static void lsi_execute_script(LSIState *s)
>>>  
>>>      s->istat1 |= LSI_ISTAT1_SRUN;
>>>  again:
>>> -    insn_processed++;
>>> +    if (++insn_processed > LSI_MAX_INSN) {
>>> +        s->waiting = LSI_NOWAIT;
>>> +        goto exitloop;
>>> +    }
>>
>> If I understand the datasheet correctly, the model should set the
>> DSTAT.IID bit.
>>
>>   Illegal Instruction Detected
>>
>>   This status bit is set any time an illegal or reserved
>>   instruction opcode is detected, whether the LSI53C895A
>>   is operating in single step mode or automatically
>>   executing SCSI SCRIPTS.
> 
> Sounds the correct thing to do (exiting the loop seems arbitrary). 
> 
>> We already have:
>>
>>     trace_lsi_execute_script_tc_illegal();
>>     lsi_script_dma_interrupt(s, LSI_DSTAT_IID);
>>
>> Cc'ing Marcelo Tosatti since it is hard to understand the "Windows SCSI
>> driver hack":
> 
> What this patch is, if an infinite loop is detected, to raise UDC
> exception (Unexpected Disconnect). This would cause the driver to 
> restart processing, which would work around the infinite loop problem.

Thanks for the explanation.
So we agree using DSTAT.IID is the correct thing to do.
Any volunteer to fix this? :)

>> $ git show ee4d919f30f
>> commit ee4d919f30f1378cda697dd94d5a21b2a7f4d90d
>> Author: aliguori <aliguori@c046a42c-6fe2-441c-8c8c-71466251a162>
>> Date:   Mon Sep 22 16:04:16 2008 +0000
>>
>>     LSI SCSI: raise UDC on infinite loop (Marcelo Tosatti)
>>
>>     Raise UDC (Unexpected Disconnect) when a large enough number of
>>     instructions has been executed by the SCRIPTS processor. This "solution"
>>     is much simpler than temporarily interrupting execution.
>>
>>     This remedies the situation with Windows which downloads SCRIPTS code
>>     that busy loops on guest main memory. Their drivers _do_ handle UDC
>>     appropriately (at least XP and 2003).
>>
>>     It would be nicer to actually detect infinite loops, but until then,
>>     this bandaid seems acceptable.
>>
>>     Since the situation seems to be rare enough, raise the number
>>     of instructions to 10000 (previously 1000).
>>
>>     Three people other than myself had success with this patch.
>>
>>     Signed-off-by: Marcelo Tosatti <mtosatti@redhat.com>
>>     Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>
>>
>> $ git show 64c68080da4
>> commit 64c68080da429edf30a9857e3a698cb9ed335bd3
>> Author: pbrook <pbrook@c046a42c-6fe2-441c-8c8c-71466251a162>
>> Date:   Mon Sep 22 16:30:29 2008 +0000
>>
>>     Add comment to windows SCSI hack.
>>
>> diff --git a/hw/lsi53c895a.c b/hw/lsi53c895a.c
>> index e45eefaef7..53a2add0df 100644
>> --- a/hw/lsi53c895a.c
>> +++ b/hw/lsi53c895a.c
>> @@ -1199,6 +1199,11 @@ again:
>>          }
>>      }
>>      if (insn_processed > 10000 && !s->waiting) {
>> +        /* Some windows drivers make the device spin waiting for a memory
>> +           location to change.  If we have been executed a lot of code then
>> +           assume this is the case and force an unexpected device
>> disconnect.
>> +           This is apparently sufficient to beat the drivers into
>> submission.
>> +         */
>>          if (!(s->sien0 & LSI_SIST0_UDC))
>>              fprintf(stderr, "inf. loop with UDC masked\n");
>>          lsi_script_scsi_interrupt(s, LSI_SIST0_UDC, 0);
>>
>>>      insn = read_dword(s, s->dsp);
>>>      if (!insn) {
>>>          /* If we receive an empty opcode increment the DSP by 4 bytes
>>> @@ -1569,7 +1575,8 @@ again:
>>>              }
>>>          }
>>>      }
>>> -    if (insn_processed > 10000 && s->waiting == LSI_NOWAIT) {
>>> +exitloop:
>>> +    if (insn_processed > LSI_MAX_INSN && s->waiting == LSI_NOWAIT) {
>>>          /* Some windows drivers make the device spin waiting for a memory
>>>             location to change.  If we have been executed a lot of code then
>>>             assume this is the case and force an unexpected device disconnect.
>>>

