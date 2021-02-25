Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD707324B1C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 08:18:55 +0100 (CET)
Received: from localhost ([::1]:40880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFAvG-0001rc-75
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 02:18:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lFAt8-0001Ot-Tk
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 02:16:42 -0500
Received: from mx2.suse.de ([195.135.220.15]:58082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lFAt7-0002Eb-7v
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 02:16:42 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 07C7AB02B;
 Thu, 25 Feb 2021 07:16:38 +0000 (UTC)
Subject: Re: [PATCH v22 06/17] meson: add target_user_arch
To: Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210224133428.14071-1-cfontana@suse.de>
 <20210224133428.14071-7-cfontana@suse.de>
 <ab323577-c68e-c215-655f-1b45d2e9b112@redhat.com>
 <37da6126-a6eb-a12e-2944-9ac4a232390c@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <d1ebfe89-34cd-447f-ba50-a0db23c6e987@suse.de>
Date: Thu, 25 Feb 2021 08:16:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <37da6126-a6eb-a12e-2944-9ac4a232390c@redhat.com>
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

On 2/24/21 11:35 PM, Eric Blake wrote:
> On 2/24/21 3:21 PM, Philippe Mathieu-Daudé wrote:
>> On 2/24/21 2:34 PM, Claudio Fontana wrote:
>>> the lack of target_user_arch makes it hard to fully leverage the
>>> build system in order to separate user code from sysemu code.
>>>
>>> Provide it, so that we can avoid the proliferation of #ifdef
>>> in target code.
>>>
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>>
>>> [claudio: added changes for new target hexagon]
>>
>> Again, this line goes ...
>>
>>> ---
>>
>> ... here. Else it is not stripped by git-am and ends
>> burried in the repository (see commit 940e43aa30e).
> 
> If you are modifying a patch originally written by someone else (that
> is, their S-o-b appears first, but your edits mean you also add S-o-b),
> it is courteous to include your modifications in the commit log in this
> manner.  (For an example, see commit 2c4c556e06)
> 
> You're right that it can look fishy if your changlog appears on your own
> commit (if you rebased things with no one else touching the patch in
> between, just update the commit message as part of that rebase; the
> changelog goes after the --- for review in that case).  But it's not
> completely wrong: you'll see me doing it when wearing my maintainer hat
> and preparing a pull request, and modifying my own patch different from
> how it was posted on the mailing list while wearing my developr hat
> prior to the pull request (see commit c930831446 for an example)
> 

Hi, yes, I extended this kind of meaning to my own patches;

what I tried to express there was that the change was reviewed,
but afterwards there was a small modification (needed for rebase),
that seemed trivial enough not to warrant stripping the reviewed-by,
but still worth mentioning in the log.

I probably should have added an additional S-o-b at the end anyway..

If you have a better suggestion on how to do this, let me know,

thanks,

Claudio





