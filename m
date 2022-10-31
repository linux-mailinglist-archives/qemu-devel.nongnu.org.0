Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FAE613BA1
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 17:47:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opXue-0008Te-Tg; Mon, 31 Oct 2022 12:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1opXuc-0008Q9-3g; Mon, 31 Oct 2022 12:45:22 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1opXuY-0003Dq-R3; Mon, 31 Oct 2022 12:45:21 -0400
Received: from [192.168.178.59] (p5b151d14.dip0.t-ipconnect.de [91.21.29.20])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 476CFDA045D;
 Mon, 31 Oct 2022 17:45:09 +0100 (CET)
Message-ID: <caff7c23-c8e4-907a-6d79-72c7480e4977@weilnetz.de>
Date: Mon, 31 Oct 2022 17:45:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 "open list:PReP" <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221031074317.377366-1-sw@weilnetz.de>
 <8b60c05a-c687-30ec-160b-52a4993c65fd@linaro.org>
Subject: Re: [RFC PATCH] Add new build target 'check-spelling'
In-Reply-To: <8b60c05a-c687-30ec-160b-52a4993c65fd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Below I added some examples for the words which are currently ignored by 
codespell.

Am 31.10.22 um 16:40 schrieb Philippe Mathieu-Daudé:

> On 31/10/22 08:43, Stefan Weil via wrote:
>> `make check-spelling` can now be used to get a list of spelling errors.
>> It uses the latest version of codespell, a spell checker implemented 
>> in Python.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>
>> This RFC can already be used for manual tests, but still reports false
>> positives, mostly because some variable names are interpreted as words.
>> These words can either be ignored in the check, or in some cases the 
>> code
>> might be changed to use different variable names.
>>
>> The check currently only skips a few directories and files, so for 
>> example
>> checked out submodules are also checked.
>>
>> The rule can be extended to allow user provided ignore and skip lists,
>> for example by introducing Makefile variables CODESPELL_SKIP=userfile
>> or CODESPELL_IGNORE=userfile. A limited check could be implemented by
>> providing a base directory CODESPELL_START=basedirectory, for example
>> CODESPELL_START=docs.
>>
>> Regards,
>> Stefan
>>
>>   tests/Makefile.include       | 10 ++++++++++
>>   tests/codespell/README.rst   | 18 ++++++++++++++++++
>>   tests/codespell/exclude-file |  3 +++
>>   tests/codespell/ignore-words | 19 +++++++++++++++++++
>>   tests/requirements.txt       |  1 +
>>   5 files changed, 51 insertions(+)
>>   create mode 100644 tests/codespell/README.rst
>>   create mode 100644 tests/codespell/exclude-file
>>   create mode 100644 tests/codespell/ignore-words
>
> Just wondering about this list...
>
>> +++ b/tests/codespell/ignore-words
>> @@ -0,0 +1,19 @@
>> +buid
>
> What is 'buid'? PPC-specific apparently.

hw/ppc/spapr_pci.c:SpaprPhbState *spapr_pci_find_phb(SpaprMachineState 
*spapr, uint64_t buid)
include/hw/ppc/xics.h: * We currently only support one BUID which is our 
interrupt base
[...]


>> +busses
>> +dout
>> +falt
>> +fpr
>> +hace
>> +hax
>> +hda
>> +nd
>
> Apparently 'NIC info'...
hw/arm/aspeed.c:    NICInfo *nd = &nd_table[0];
hw/display/macfb.c:    NubusDevice *nd = NUBUS_DEVICE(s);
[...]


>> +ot
>
> Is 'ot' MemOp?

target/i386/tcg/decode-new.c.inc:static bool decode_op_size(DisasContext 
*s, X86OpEntry *e, X86OpSize size, MemOp *ot)
[...]


>> +pard
>> +parm
>> +ptd
>> +ser
>> +som
>> +synopsys
>> +te
>
> Is that 'target endianness'?

accel/tcg/cputlb.c: * @te: pointer to CPUTLBEntry
hw/audio/cs4231a.c:#define TE (1 << 6)
[...]


>> +toke
>
> Where is 'toke'?

This one is no longer needed. It was used in the old capstone code which 
I still had in my local sources.


>> +ue
> Where is 'ue'?
tests/tcg/i386/test-i386-fp-exceptions.c:#define UE (1 << 4)
tests/unit/test-keyval.c:    qdict = keyval_parse("val,,ue", "implied", 
NULL, &err);
[...]

I simply had added some examples of "words" which occurred often and 
which were reported by codespell as typos. These "typos" occur at least 
10 times (list produced with `grep "^[a-z]" codespell.log | sort -n +1`):

statics      10
regiser      11
usig         11
inh          12
tne          12
overriden    13
inactivate   15
upto         15
hsa          16
useable      17
daa          18
crate        21
endianess    22
olt          22
sring        23
vill         25
keypairs     35
gir          46
sav          47
asign       120
inflight    191

Some of them are real typos, others like aSign or statics are variable 
names and should be ignored, too.

Stefan



