Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0149130A44B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 10:23:57 +0100 (CET)
Received: from localhost ([::1]:37804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6VR5-0008Kj-NQ
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 04:23:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l6VPr-0007hb-FW
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 04:22:39 -0500
Received: from mx2.suse.de ([195.135.220.15]:47934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l6VPp-0001wX-TD
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 04:22:39 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4F675AE76;
 Mon,  1 Feb 2021 09:22:36 +0000 (UTC)
Subject: Re: [PATCH v14 18/22] accel: introduce AccelCPUClass extending
 CPUClass
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210128092814.8676-1-cfontana@suse.de>
 <20210128092814.8676-19-cfontana@suse.de>
 <64d8385c-db22-b647-2402-3840b0e0e9b5@redhat.com>
 <9a51a203-f6a8-686f-7859-475537b3607a@suse.de> <878s8dujj5.fsf@linaro.org>
 <40ed971e-a4fe-77c5-94b9-28691874ee32@redhat.com>
 <0943e736-6847-4b6a-8433-f28f4692a299@linaro.org>
 <aaafff05-f3c6-ef44-2d98-f6fcb74ccf64@suse.de>
 <03ac58b2-619b-572f-85ae-0760c0c12bac@linaro.org> <87v9bcw3iu.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <fd7b1af8-fd54-2181-b338-a8908a9e39d1@suse.de>
Date: Mon, 1 Feb 2021 10:22:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87v9bcw3iu.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.079,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/21 10:15 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 1/30/21 12:53 AM, Claudio Fontana wrote:
>>> To summarize:
>>>
>>> 1) accel->cpu_realizefn extends the current cpu target-specific realize functions with accelerator-specific code,
>>>    which currently does not make use of errp at all (thus, the temptation to remove errp from the interface until it is actually needed by a target).
>>
>> No, arm does use errp in realizefn already.
>> It's just that the void return value is hinky.
> 
> Sounds like fixing the void return would be part of a larger qdev
> clean-up rather than this particular series. If I recall there have been
> various phases of clean-ups and refactoring of the error code paths in
> the past.
> 
>>
>>
>> r~
> 
> 

I think you are right.

I added a patch in this series to at least not make the problem worse,
by adding a return value to accel_cpu::cpu_realizefn,

and cleaning up the only code path case that signals an error there for now in i386.

(will add as the last patch in the series)

Thanks,

Claudio


