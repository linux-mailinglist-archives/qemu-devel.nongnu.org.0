Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C453310CD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:32:03 +0100 (CET)
Received: from localhost ([::1]:33904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGvS-0002At-15
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:32:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lJGJL-0000ag-DK
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:52:39 -0500
Received: from mx2.suse.de ([195.135.220.15]:40650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lJGJJ-0001k1-Gi
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:52:39 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E8D43AC54;
 Mon,  8 Mar 2021 13:52:35 +0000 (UTC)
Subject: Re: [PATCH v26 00/20] i386 cleanup PART 2
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210301085450.1732-1-cfontana@suse.de>
 <cfeead83-4890-bdd8-c5cb-9bdb2ca24abb@suse.de>
 <6230ef40-c0ec-875e-dbd3-46fb5925322e@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <81208ea0-f389-14d0-c366-0579dee3376d@suse.de>
Date: Mon, 8 Mar 2021 14:52:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6230ef40-c0ec-875e-dbd3-46fb5925322e@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 2:27 PM, Philippe Mathieu-Daudé wrote:
> Hi Claudio,
> 
> On 3/8/21 1:57 PM, Claudio Fontana wrote:
>> Hi,
>>
>> anything else for me to do here?
>>
>> The latest rebased state of this series should be always available here:
>>
>> https://gitlab.com/hw-claudio/qemu/-/tree/i386_cleanup_8
>>
>> When it comes to the ARM cleanup series,
>> I would like to have the tests pass for ARM, before doing even more changes, could you help me there Philippe?
>>
>> Maybe applying some of your changes on top would fix the failures? I tried, for example with the arm-cpu-features ones, but it didn't work for me..
> 
> TBH I wrote these patches during my personal spare time and this
> became a real Pandora box that drained too much energy. I prefer
> to step back and focus on finishing smaller tasks before burning
> out. That said I appreciate your effort and am interested in
> following / reviewing your work.
> 
> Regards,
> 
> Phil.
> 

Thanks Philippe for sharing this, and I agree completely, it is very draining.

The effort of making tests happy that run in artificial environments in particular often feels to me
as too disconnected from actually ensuring that there is no real run time regression.

qtest_enabled() (implicitly, or explicitly via open-ended else statements) is another painful variable to keep in mind in cpu and machine code, so it is not helpful in my view.

I'll try to push more to get the tests running again, if you have any comment or idea, feel free to just point me in the right direction,
that is very valuable to me, even without working code.

Currently I am struggling with arm-cpu-features and other tests (device-introspect-test, qom-test, test-hmp).

I'll publish arm_cleanup_v5 soon,

Thanks a lot,

Claudio

