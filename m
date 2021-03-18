Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE6634010D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 09:33:34 +0100 (CET)
Received: from localhost ([::1]:33388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMo60-00035M-UQ
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 04:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMo4n-0002bB-69
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 04:32:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:41416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lMo4l-0003Vy-Mr
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 04:32:16 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A9AA8AF0C;
 Thu, 18 Mar 2021 08:32:12 +0000 (UTC)
Subject: Re: [RFC v9 29/50] target/arm: cleanup cpu includes
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210317183013.25772-1-cfontana@suse.de>
 <20210317183013.25772-30-cfontana@suse.de>
 <3bcc1889-8479-7c00-b799-829938702515@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <80fd7ca2-8a70-44d0-de47-517da0425557@suse.de>
Date: Thu, 18 Mar 2021 09:32:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3bcc1889-8479-7c00-b799-829938702515@redhat.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 8:01 PM, Philippe Mathieu-Daudé wrote:
> On 3/17/21 7:29 PM, Claudio Fontana wrote:
>> cpu.c,
>> cpu32.c,
>> cpu64.c,
>> tcg/sysemu/tcg-cpu.c,
>>
>> all need a good cleanup when it comes to included header files.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>  target/arm/cpu.c                |  8 ++------
>>  target/arm/cpu32.c              | 14 --------------
>>  target/arm/cpu64.c              |  6 ------
>>  target/arm/tcg/sysemu/tcg-cpu.c | 22 +---------------------
>>  roms/SLOF                       |  2 +-
>>  5 files changed, 4 insertions(+), 48 deletions(-)
> 
>> diff --git a/roms/SLOF b/roms/SLOF
>> index 33a7322de1..e18ddad851 160000
>> --- a/roms/SLOF
>> +++ b/roms/SLOF
>> @@ -1 +1 @@
>> -Subproject commit 33a7322de13e9dca4b38851a345a58d37e7a441d
>> +Subproject commit e18ddad8516ff2cfe36ec130200318f7251aa78c
> 
> Besides this dubious change, the rest LGTM :)
> 

Oops thanks, no idea how that got in there.

Ciao,

C

