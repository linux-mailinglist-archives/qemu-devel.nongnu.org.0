Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D108230DD25
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:45:14 +0100 (CET)
Received: from localhost ([::1]:43886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7JP6-0002yI-9w
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:45:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l7JNv-00027M-Px
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:43:59 -0500
Received: from mx2.suse.de ([195.135.220.15]:37586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l7JNu-0000yE-5L
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:43:59 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E60E0ACB0;
 Wed,  3 Feb 2021 14:43:56 +0000 (UTC)
Subject: Re: [PATCH v15 00/23] i386 cleanup PART 2
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210201100903.17309-1-cfontana@suse.de>
 <87ft2drzy1.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <9e821e84-8885-7923-c5a4-3a7afaf0273b@suse.de>
Date: Wed, 3 Feb 2021 15:43:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87ft2drzy1.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.178,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 3:22 PM, Alex Bennée wrote:
> 
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> v14 -> v15:
>>
>> * change the TcgCpuOperations so that all fields of the struct are
>>   defined unconditionally, as per original patch by Eduardo,
>>   before moving them to a separate struct referenced by a pointer
>>   (Richard, Eduardo).
>>
> <snip>
> 
> I'm not sure if their is some instability because I keep seeing failures
> in the review trees, e.g:
> 
>   https://gitlab.com/stsquad/qemu/-/pipelines/250749404
> 
> If you look at my pipeline history you'll see it is *mostly* green:
> 
>   https://gitlab.com/stsquad/qemu/-/pipelines
> 
> especially for the testing/next branches that I apply the reviews to. So
> I worry there might be something lurking in there. How have your CI runs
> looked?
> 

My CI has looked fine, I build-tested (with make check) every single commit.

Rebased last time the day before yesterday.

https://gitlab.com/hw-claudio/qemu/-/pipelines


