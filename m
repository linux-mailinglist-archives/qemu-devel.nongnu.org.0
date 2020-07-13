Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 378FA21B595
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 14:57:14 +0200 (CEST)
Received: from localhost ([::1]:34150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtsaX-00018l-Ax
	for lists+qemu-devel@lfdr.de; Fri, 10 Jul 2020 08:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1jtsZG-0000Gp-Fp
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 08:55:54 -0400
Received: from mx2.suse.de ([195.135.220.15]:45626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1jtsZE-0007zu-4N
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 08:55:54 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2C978ACBF;
 Fri, 10 Jul 2020 12:55:51 +0000 (UTC)
Subject: Re: [PULL v2 00/52] Misc patches for QEMU 5.1 soft freeze
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20200708172542.25012-1-pbonzini@redhat.com>
 <CAFEAcA8b6sn8fXOKwqOF6MvsKT5oKqS+4jjYDPAPvnXmVimLiQ@mail.gmail.com>
 <CAFEAcA-hVrJ90E=qQP+3CONPozQLrnaAP3LC1DwP7KuJ0nAwQA@mail.gmail.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <4abf6e80-abaf-5edc-c19b-cf5867843071@suse.de>
Date: Fri, 10 Jul 2020 14:55:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-hVrJ90E=qQP+3CONPozQLrnaAP3LC1DwP7KuJ0nAwQA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/10 00:07:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/10/20 2:28 PM, Peter Maydell wrote:
> On Fri, 10 Jul 2020 at 13:14, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Wed, 8 Jul 2020 at 22:32, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>>
>>> The following changes since commit eb2c66b10efd2b914b56b20ae90655914310c925:
>>>
>>>   Merge remote-tracking branch 'remotes/maxreitz/tags/pull-block-2020-07-06' into staging (2020-07-07 19:47:26 +0100)
>>>
>>> are available in the Git repository at:
>>>
>>>   git://github.com/bonzini/qemu.git tags/for-upstream
>>>
>>> for you to fetch changes up to 392f34e59755f99d69586a63e0f5d80a7ef67f94:
>>>
>>>   apic: Report current_count via 'info lapic' (2020-07-08 10:01:08 -0400)
>>
>> Hi; this still has the OSX failure, I'm afraid:
>>
>> /Users/pm215/src/qemu-for-merges/ui/cocoa.m:1478:9: error: implicit
>> declaration of function 'cpu_throttle_set' is invalid in C99 [-
>> Werror,-Wimplicit-function-declaration]
>>         cpu_throttle_set(throttle_pct);
>>         ^
>> /Users/pm215/src/qemu-for-merges/ui/cocoa.m:1478:9: error: this
>> function declaration is not a prototype [-Werror,-Wstrict-prototypes]
> 
> Squashing this into "cpu-throttle: new module, extracted from cpus.c"
> should fix this (ui/cocoa.m was just forgotten when adding #include lines
> after moving the function into its own header):
> 
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index cb556e4e66..0910b4a716 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -32,6 +32,7 @@
>  #include "ui/input.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/runstate.h"
> +#include "sysemu/cpu-throttle.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-commands-block.h"
>  #include "qapi/qapi-commands-misc.h"
> 
> (am just doing a compile-and-test run with that change).
> 
> thanks
> -- PMM
> 

Ah, just noticed this, yes, indeed I clearly forgot that,

at the same time clearly I need to improve both my local environment and the CI setups I am using,
because for me everything works!

Or, we could swap configurations so that QEMU builds are always successful... ;-)

Ciao,

Claudio


