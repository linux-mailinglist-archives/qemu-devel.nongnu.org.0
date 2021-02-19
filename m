Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DE231F9E6
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 14:29:17 +0100 (CET)
Received: from localhost ([::1]:57486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD5qO-00077d-I7
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 08:29:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lD5ep-0006eU-Vx
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:17:20 -0500
Received: from mx2.suse.de ([195.135.220.15]:54500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lD5eo-0007pk-EP
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:17:19 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B0339ABAE;
 Fri, 19 Feb 2021 13:17:16 +0000 (UTC)
Subject: Re: meson, NEED_CPU_H, CONFIG_TCG and tests/
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <eb7d8eca-13ef-07cf-41b4-d7276399fff1@suse.de>
 <008512eb-9b60-9d1f-4599-ad712574da80@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <7a465ccb-a2f9-9293-d0d4-dd4cc65bfb8d@suse.de>
Date: Fri, 19 Feb 2021 14:17:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <008512eb-9b60-9d1f-4599-ad712574da80@redhat.com>
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 2:14 PM, Philippe Mathieu-Daudé wrote:
> On 2/19/21 2:04 PM, Claudio Fontana wrote:
>> Hi Paolo,
>>
>> currently we have use of CONFIG_TCG in tests/,
>>
>> but is that variable available at all in there?
>>
>> I have to adapt some qemu/tests/qtest/* to work also without tcg for ARM,
>>
>> but I think I am not seeing CONFIG_TCG filtering through, and I wonder whether all the checks in there are actually "wrong".
> 
> Checking for ./configure definitions in tests is probably wrong,
> it should be done via binary introspection (ask the binary if it
> has the feature enabled).
> 

How are we going to launch with the correct qemu options in qtest/bios-tables-test.c and qtest/boot-serial-tests.c ?

I mean I agree with your sentiment, but it does not solve the problem..

Ciao,

Claudio

