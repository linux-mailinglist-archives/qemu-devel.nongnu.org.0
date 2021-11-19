Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B308456D1B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 11:18:30 +0100 (CET)
Received: from localhost ([::1]:51986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo0yT-0000W4-7T
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 05:18:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1mo0vz-0007PA-Ul
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 05:15:56 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:39778
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1mo0vv-0004Ks-LJ
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 05:15:54 -0500
Received: from [192.168.178.28] (p57b42bf1.dip0.t-ipconnect.de [87.180.43.241])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 030A6DA1BC6;
 Fri, 19 Nov 2021 11:15:46 +0100 (CET)
Message-ID: <37b8b2dd-89c0-ed8e-1c8e-cd591b133b7d@weilnetz.de>
Date: Fri, 19 Nov 2021 11:15:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH for-6.2] Fix some typos in documentation (found by
 codespell)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20211117210702.1393570-1-sw@weilnetz.de>
 <2130deed-8f14-05fb-5da1-3c86744bbffb@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
In-Reply-To: <2130deed-8f14-05fb-5da1-3c86744bbffb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.727,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.11.21 um 00:27 schrieb Philippe Mathieu-Daudé:

> On 11/17/21 22:07, Stefan Weil wrote:
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>   docs/devel/multi-process.rst            | 2 +-
>>   docs/devel/qgraph.rst                   | 2 +-
>>   docs/devel/writing-monitor-commands.rst | 2 +-
>>   docs/hyperv.txt                         | 2 +-
>>   docs/system/cpu-models-x86.rst.inc      | 2 +-
>>   docs/system/devices/nvme.rst            | 2 +-
>>   docs/system/gdb.rst                     | 2 +-
>>   docs/system/ppc/ppce500.rst             | 2 +-
>>   docs/system/riscv/shakti-c.rst          | 2 +-
>>   9 files changed, 9 insertions(+), 9 deletions(-)
>> diff --git a/docs/system/cpu-models-x86.rst.inc b/docs/system/cpu-models-x86.rst.inc
>> index 6e8be7d79b..884b6d20fb 100644
>> --- a/docs/system/cpu-models-x86.rst.inc
>> +++ b/docs/system/cpu-models-x86.rst.inc
>> @@ -49,7 +49,7 @@ future OS and toolchains are likely to target newer ABIs. The
>>   table that follows illustrates which ABI compatibility levels
>>   can be satisfied by the QEMU CPU models. Note that the table only
>>   lists the long term stable CPU model versions (eg Haswell-v4).
>> -In addition to whats listed, there are also many CPU model
>> +In addition to what's listed, there are also many CPU model
>>   aliases which resolve to a different CPU model version,
>>   depending on the machine type is in use.
> For a non-native English speaker, this is clearer:
>
> "In addition to what is listed"


I agree. Maybe Paolo or whoever applies that patch can change that detail.

Note that I restricted the typo fixes here to the documentation files. 
codespell finds many more in the rest of the code, but that can be 
handled after 6.2.

Thanks, Stefan


> Otherwise:
>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

