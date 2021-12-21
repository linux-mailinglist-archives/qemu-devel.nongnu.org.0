Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C5A47C51F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 18:40:02 +0100 (CET)
Received: from localhost ([::1]:55354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzj7J-00032O-CX
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 12:40:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mziz0-0007Xc-I7
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 12:31:26 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:58164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mziyy-0004kM-PI
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 12:31:26 -0500
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id B20F220777;
 Tue, 21 Dec 2021 17:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1640107882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UQasjyhuiS+0yX66mvBpmfa4JBuTy5rd5rLkf65yGWI=;
 b=VZB3f+6dBy2K3KEz/6M1O4864WtE14zzwLo7pVmTeEvx6T0V6o5B34Y9iQbZQUIv55VTY6
 L55h7/K9iuRCe5/PYONZNhT0dIRAVNzdinD0ektNLQpF7xEHRz4R5Bx2FAukWY4kcBXttC
 dH8KtJCgb9kk+NIjCDJIQshnwUbkDnA=
Message-ID: <f82373b8-6fcc-52a0-45c9-6353f9c43002@greensocs.com>
Date: Tue, 21 Dec 2021 18:31:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] vl: Add -set options to device opts dict when using JSON
 syntax for -device
Content-Language: en-US-large
To: Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20211221071818.34731-1-mkfssion@mkfssion.com>
 <877dbyjj0t.fsf@dusky.pond.sub.org> <87h7b2i07h.fsf@dusky.pond.sub.org>
 <1b8249e6-ffe1-86e4-a2e8-c85c794438e0@redhat.com>
 <871r26ge4z.fsf@dusky.pond.sub.org>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <871r26ge4z.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
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
Cc: Kevin Wolf <kwolf@redhat.com>, MkfsSion <mkfssion@mkfssion.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/21/21 16:40, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> On 12/21/21 13:58, Markus Armbruster wrote:
>>>> Is this a regression?  I suspect commit 5dacda5167 "vl: Enable JSON
>>>> syntax for -device" (v6.2.0).
>>>
>>> Obviously not a regression: everything that used to work still works.
>>
>> FWIW I think -set should be deprecated.  I'm not aware of any
>> particularly useful use of it.  There are a couple in the QEMU tests
>> (in vhost-user-test and in qemu-iotests 068), but in both cases the
>> code would be easier to follow without; patches can be dusted off if
>> desired.
> 
> -set has its uses, but they're kind of obscure.  When you want to use
> some canned configuration with slight modifications, then -readconfig
> canned.cfg -set ... is nicer than editing a copy of canned.cfg.  For
> what it's worth, we have a few cans in docs/config/, and we refer to at
> least one of them in the manual (in docs/system/devices/usb.rst).
> 
> There are a few really good ideas in QemuOpts.  I count -readconfig,
> -writeconfig and -set among them.  Unfortunately, they have been marred
> by us not converting the whole CLI to QemuOpts as envisaged.  And now we
> never will, because our needs have long outgrown what QemuOpts can
> provide.
> 
> I'd love to have unmarred, QAPI-based replacements.  However, I doubt
> maintaining backwards compatibility will be practical and worthwhile.
> 
> Declare these options unstable?
> 
> 
I agree.

Without QemuOpts, and more precisely the ability to alter them before 
they are really handled, this kind of feature will be impossible to have.

Only way I see, is to reverse the mechanism:
+ handle set option before, it store the key,value somewhere
+ an option like -device checks that store and fetch their values.

-- 
Damien

