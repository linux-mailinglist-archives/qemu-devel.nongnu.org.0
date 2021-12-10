Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8252A46FD71
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 10:11:44 +0100 (CET)
Received: from localhost ([::1]:48326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvbwN-0003bM-Kz
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 04:11:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mvbMc-0007KI-Sh
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 03:34:46 -0500
Received: from [2a00:1450:4864:20::532] (port=36434
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mvbMa-0001LR-Kn
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 03:34:46 -0500
Received: by mail-ed1-x532.google.com with SMTP id z5so28020613edd.3
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 00:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+E4DtUfxl6Pe14LwZnVaq1x6NK7MxNIOvxI6JdKRC20=;
 b=Udt2vcpEs9lReEz3/Lz91hfRl0gYdTNomEF8WOtnvxRmBvPxnW6HmrM7v6/pDpOKwM
 zdCWHHzhKiUQ/BNPRoA8hRalJgC7T2xhL11Da09qlU7u6IYe1JlzP1tARhADU+aWdhFh
 1IUr04ZMLPW2sndduJssfukcs2MZiy/dB2NpNfAjUCc41kQkgEm54S44Yu/5k7+pMuPi
 DQzfcA0mBjRVd32sgaoUo2c67GbldgorOX4hH85R4O5Rm2K5CUXg9WECqGdZ8BV3tXLd
 e+ZCQ9gUGAVhjSoqDQxwIoeKkgiclUFxYmZ+oNS7PSul1eZlELZ6QONDdFF9MximR8jN
 H90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+E4DtUfxl6Pe14LwZnVaq1x6NK7MxNIOvxI6JdKRC20=;
 b=AHidr7Tj2eEo9a8KPYXp4zuOYZa0veNI4D14Rl5dynGiTmlvw+bjbUNcFnBZIfXFtj
 Yl9VNyMEqSnn4pSl54MOhIUcf/J3B4E0u/H6tgGu36UMA5ircsVvssubquCq3yQYxPob
 pmTjsizLcTRYzV/eVqrBhRjoy7XmL7Bj6JMvmmFOWHMZ9iyFBKi4x15p7w9UPRAse9bj
 dLWqywyBhO/dOogzn1NIiVQEMWuhQ/7R03PpAMI28GDaRGR4bCCHgGIBK9Psqn9EdwQ6
 +dVS30aZaItgrWWtOKG2Sd3f/zO3pABDPE+c3yDrMQ3XxgiqUj2AmGGupXmK28diIxiK
 FvGA==
X-Gm-Message-State: AOAM5302+Z1C/BaY/4J5Z7af5xPKgui74cn+0xIVk2ulF6jVxJqyyCSF
 vPsJj+rRGi6UnFh8OhywSkM=
X-Google-Smtp-Source: ABdhPJx+3cQtci1Ks4DNpGOlbhhyGF1vqAWyunNQ9xyRcyqm1s4eBu5Pni+L9RtCe2CPv6TUaSD4Ww==
X-Received: by 2002:a17:906:974c:: with SMTP id
 o12mr23002306ejy.229.1639125282784; 
 Fri, 10 Dec 2021 00:34:42 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:48f9:bea:a04c:3dfe?
 ([2001:b07:6468:f312:48f9:bea:a04c:3dfe])
 by smtp.googlemail.com with ESMTPSA id jg36sm1169507ejc.44.2021.12.10.00.34.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 00:34:42 -0800 (PST)
Message-ID: <fb7e946e-6881-0ea3-d824-99693f938165@redhat.com>
Date: Fri, 10 Dec 2021 09:34:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Redesign of QEMU startup & initial configuration
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YbJU5vVdesoGuug9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.317,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-devel@nongnu.org,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/21 20:11, Daniel P. Berrangé wrote:
>>     They still need to bootstrap a QMP monitor, and for that, CLI is fine
>>     as long as it's simple and stable.

I would go a step further and say that the QMP monitor socket should be 
created by whoever invoked QEMU and passed down via systemd's socket 
activation protocol, with a fallback to stdin/stdout.

>> 2. CLI and configuration files
>>
>>     Human users want a CLI and configuration files.
> 
> I'd note that Kubernetes doesn't bother with a human CLI at
> all, and just expects everyone/everything to use JSON/YAML
> config files. So there's no divide between what syntax humans
> and machines use - humans just send the config via the CLI
> tool which uploads it to the REST API that machines use
> directly.

I agree with Mark here that configuration is beyond QEMU's role.  QEMU's 
JSON-based API isn't quite REST, but the idea is the same: the user 
talks to a tool which converts the configuration to QAPI commands.  The 
QAPI commands can be:

- invocations of qmp_* functions in the case of a command-line based 
configuration

- invocations of QMP commands on a socket if startup is mediated by a 
management tool

Where Markus and I disagree is whether the two cases should be covered 
by one binary or two.  Personally I don't see much advantage in having a 
single binary, just like I don't care if /bin/ls and /bin/dir are 
symlinks, or they're separate binaries, or one invokes the other.

What matters to me is the maintainability of the command-line based 
startup code.  Actual experience says that, as more and more options are 
supported via QMP-based configuration, the command-line based startup 
code gets simpler or at least more self-contained.

In the terms of my KVM Forum talk, this is obtained by converting 
"one-off" options (typically global variables) to a combination of a 
"shortcut" option (typically a qemu_opts_set or qemu_opts_parse 
invocation) and a QOM property or a QMP command.  Examples from recent 
QEMU versions include -no-shutdown, -no-hpet, -no-acpi.

>> = Ways forward =
> 
> Just to clarify or remind ourselves of scope.
> 
> When I think about startup/cli in QEMU, I essentially consider
> this to mean all softmmu/vl.c code.  Of course there are
> supporting pieces splattered around, but IMHO 90% of the pain
> is resulting from the code in the vl.c file.
>
>> 1. Improve what we have step by step, managing incompatible changes
>>
>>     We tried.  It has eaten substantial time and energy, it has
>>     complicated code and interfaces further, and we're still nowhere near
>>     where we need to be.  Does not feel like a practical way forward to
>>     me.
>>
>>     If you don't believe me, read the long version in "Appendix: Why
>>     further incremental change feels impractical".
> 
> Essentially death by 1000 cuts.

There are two kinds of incremental changes.  Incremental changes to the 
UI are one thing; incremental changes to the implementations aka 
refactoring is another.

I agree that further incremental changes to the UI (in the style of 
-preconfig) are impractical, but incremental changes to the 
implementation are totally practical.  The reason for that is that there 
*is* a way forward for decoupling the options from the command line 
parsing code, and this way forward has *already* proved itself.

> Refering back to my earlier note, when I've suggested this approach
> in the past, I've basically considered it to mean stop touching
> softmmu/vl.c, and create a softmmu/vl2.c. The existing binaries
> remain using vl.c, we get legacy free binaries built from vl2.c
> 
> Overtime we might get confidence to refactor bits of vl.c to
> reduce duplication, but I would consider that not a priority
> at least in the short term.

This is what I have in my tree, though it's called climain.c and 
qmpmain.c. :)  There is one major difference though: refactoring bits of 
vl.c to use more of QMP/QOM *is* the way you add functionality in qmpmain.c.

I disagree that vl.c is hard to refactor.  Sure there were some issues 
in 6.0/6.1, but at this point a lot of the hard parts have been done. 
The conversion of -smp to a QOM option, for example, was largely painless.

> On the other hand if we do a good job with the new binaries
> maybe there ceases to be any reason to keep the old binaries
> at all after a few years.

I'm not sure if this is possible if the new binaries provide exclusively 
a machine-oriented (JSON) interface.  But as you said, the pressure to 
keep a backwards-compatible command line would be much less with a good 
machine-oriented binary.

>> 3. Start over with the aim to replace the traditional QEMU
>>
>>     I don't want an end game where we have two QEMUs, one with bad CLI
>>     and limited QMP, and one without real CLI and decent QMP.  I want one
>>     QEMU with decent CLI and decent QMP.
>
> Right, so this is essentially what I've just suggested as a possible
> evoluation of (2). The only difference here is that you're setting
> the death of the old QEMU as an explicit end gaol in (3), while
> in (2) it is merely a nice-to-have.

I agree.  Though in my case I'd still go for two binaries: one with good 
CLI and limited QMP, and one with limited CLI and good QMP.

> In practical terms I don't think (2) and (3) are that different
> from each other for the first 2 years or so.  A lot can change in
> that time, so I don't think we need to fixate on a choice of
> (2) vs (3) upfront, just make it clear that the death of the old
> binaries is "on the table" as an outcome if we do well.

Agreed, but I would set the beginning of the "2 years or so" at last year...

>> = Appendix: Why further incremental change feels impractical =
>>
>> Crafting a big change in small steps sounds great.  It isn't when we
>> have to make things worse before they can get better, and every step is
>> painfully slow because it's just too hard, and the end state we aim for
>> isn't really what we want.
> 
> I can't disagree with this. If we carry on trying to evolve vl.c
> incrementally we are doomed to be stuck with a horrible starstup
> process for enternity (or at least as long as I'll still be
> working as QEMU maintainer).

... and if you compare vl.c in 5.2 and now, and consider current vl.c to 
be horrible, my knowedge of English does not include an adjective to 
describe the 5.2 state.  Some incremental work _is_ possible or even 
necessary, and has been done already.

Paolo

