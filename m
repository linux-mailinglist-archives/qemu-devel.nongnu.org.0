Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662C36A486B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 18:44:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWhXo-0006c6-Tp; Mon, 27 Feb 2023 12:44:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pWhXn-0006bg-5v
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:44:11 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pWhXk-000227-RQ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:44:10 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-536cd8f6034so196918717b3.10
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 09:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Cs0TuJ9s28+qkFJnKJXCdNdtNItiP2BDTVA/9eKnhb0=;
 b=CiEIQ6lxiTELVfT7yJEtfaOGc1FXY5wTtSHvC4Xttz2R+BwuXDr3IlglLLUgwn1c2D
 wpA/m2jN/9YjD00S1uwgFPQXtF/fkaelQaIDDeWdcVrrE5ZQiGv0hJXx9hOqQkOJwhn+
 aFtyMVum+Kh8tMw4yKBedBvISV0kpp9En82VTVnAcQt7yg4uzQ/T7d+PVTcqYuWQaJMg
 MbJJCZdhAaQY3ldbCNkySs+WZBHZhUGaEZFQ78yAzobhvwr+V7hmZJyq6jHkfG7WSeOk
 BLIPF5xZLtFVm50PtW+Zx0MyAbkTKEVwwumVQT61r9drxDZR7ce/QnmN44mTaK96pvDL
 y9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cs0TuJ9s28+qkFJnKJXCdNdtNItiP2BDTVA/9eKnhb0=;
 b=LcEvq+pYNmWf7bKogoET/AkAnE3sbqTAcE1QDw7FR7LxxIzvnoZIOp7QdFwHsW10hG
 Vu9PXWXffNMvLH4Ah9swEMnlq19VaXL/uW/31VlcJG0P+n6BafiCk0E2G2YWEZU5YkbP
 h4kC5jrc5uEJgnjHqFKx+Ep6IBgvfbfCci903IS5s27luYdoSKIlItFtm8X8d+RwGq4/
 zTr53QZ/ZMaKqMd9KbqbiJLkFCXuwjvOCQ4Qa8L7EGmdy78+/LAXRBEDJXQHEQdzO8wv
 QEOYwebE9yLSyOptcI1kpogdGifnpaB533dirqqg8J/aVZSrUuaXIarmXCrWuG9Wps7b
 mhqg==
X-Gm-Message-State: AO0yUKWXhFPI3mcpniMWtvznV5R4jquep7rT2qq12uSt58UaGxGONEhU
 GIC+lGWnLhl7pYDobmYqb0DIvEGK+BVJa0+2b0M=
X-Google-Smtp-Source: AK7set/mYTLDQVWyWV1T9vEcCp7EAFmSSPw6pZqcYgbk202Oqub7KXjrjJhrQ/HaPWM6wTewp9WEtvqlcCN4rp3S3Lo=
X-Received: by 2002:a25:9392:0:b0:997:bdfe:78c5 with SMTP id
 a18-20020a259392000000b00997bdfe78c5mr9636566ybm.6.1677519847141; Mon, 27 Feb
 2023 09:44:07 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA83u_ENxDj3GJKa-xv6eLJGJPr_9FRDKAqm3qACyhrTgg@mail.gmail.com>
 <20230223152836.dpn4z5fy6jg44wqi@hetzy.fluff.org>
 <Y/eHLCKcdYk0V4Tt@redhat.com>
 <Y/fkf3Cya1NOopQA@invalid> <Y/zhZ4brfdQ7nwLI@redhat.com>
In-Reply-To: <Y/zhZ4brfdQ7nwLI@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 27 Feb 2023 12:43:55 -0500
Message-ID: <CAJSP0QX2tkaVZh0FX4Ke8EWn7tO9qm76YnRCHe6-UxWJg6LzTQ@mail.gmail.com>
Subject: Re: out of CI pipeline minutes again
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Eldon Stegall <eldon-qemu@eldondev.com>, Ben Dooks <qemu@ben.fluff.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Here are IRC logs from a discussion that has taken place about this
topic. Summary:
- QEMU has ~$500/month Azure credits available that could be used for CI
- Burstable VMs like Azure AKS nodes seem like a good strategy in
order to minimize hosting costs and parallelize when necessary to keep
CI duration low
- Paolo is asking for someone from Red Hat to dedicate the time to set
up Azure AKS with GitLab CI
- Personally, I don't think this should exclude other efforts like
Eldon's. We can always add more private runners!

11:31 < pm215> does anybody who understands how the CI stuff works
have the time to take on the task of getting this all to work with
either (a) a custom runner running on one of the hosts we've been
offered or (b) whatever it needs to run using our donated azure
credits ?
11:34 < danpb> i would love to, but i can't volunteer my time right now :-(
11:34 < stefanha> Here is the email thread for anyone else who's
trying to catch up (like me):
https://lore.kernel.org/qemu-devel/CAFEAcA83u_ENxDj3GJKa-xv6eLJGJPr_9FRDKAqm3qACyhrTgg@mail.gmail.com/
11:34 -!- iggy [~iggy@47.152.10.131] has quit [Quit: WeeChat 3.5]
11:35 -!- peterx_ is now known as peterx
11:35 < danpb> what paolo suggested about using the Kubernetes runners
for Azure seems like the ideal  approach
11:35 -!- peterx
[~xz@bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca] has quit
[Quit: WeeChat 3.6]
11:35 -!- peterx
[~xz@bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca] has joined
#qemu
11:36 < danpb> as it would be most cost effective in terms of Azure
resources consumed, and would scale well as it would support as many
parallel runners as we can afford from our Azure allowance
11:36 < danpb> but its also probably ythe more complex option to setup
11:36 -!- dramforever [~dramforev@59.66.131.33] has quit [Ping
timeout: 480 seconds]
11:37 < stefanha> It's a little sad to see the people who are
volunteering to help being ignored in the email thread.
11:37 < stefanha> Ben Dooks asked about donating minutes (the easiest solution).
11:38 -!- sgarzare [~sgarzare@c-115-213.cust-q.wadsl.it] has quit
[Remote host closed the connection]
11:38 < peterx> jsnow[m]: an AHCI question: where normally does the
address in ahci_map_fis_address() (aka, AHCIPortRegs.is_addr[_hi])
reside?  Should that be part of guest RAM that the guest AHCI driver
maps?
11:38 < stefanha> eldondev is in the process of setting up a runner.
11:38 < pm215> stefanha: the problem is there is no one person who has
all of (a) the authority to do stuff (b) the knowledge of what the
right thing to do is (c) the time to do it...
11:38 < danpb> stefanha: the challenge is how to accept the donation
in a sustainable way
11:39 < th_huth> stefanha: Do you know whether we still got that
fosshost server around? ... I know, fosshost is going away, but maybe
we could use it as a temporary solution at least
11:39 < stefanha> th_huth: fosshost, the organization, has ceased to operate.
11:39 < danpb> fosshost ceased operation as a concept
11:39 < davidgiluk> I wonder if there's a way to make it so that those
of us with hardware can avoid eating into the central CI count
11:39 < danpb> if we still have any access to a machine its just by luck
11:39 < stefanha> th_huth: QEMU has 2 smallish x86 VMs ready to at
Oregon State University Open Source Lab.
11:40 < stefanha> (2 vCPUs and 4 GB RAM, probably not enough for
private runners)
11:40 -!- amorenoz [~amorenoz@139.47.72.25] has quit [Read error:
Connection reset by peer]
11:41 < peterx> jsnow[m]: the context is that someone is optimizing
migration by postponing all memory updates to after some point, and
the AHCI post_load is not happy because it cannot find/map the FIS
address here due to delayed memory commit()
(https://pastebin.com/kADnTKzp).  However when I look at that I failed
to see why if it's in normal RAM (but I think I had somewhere wrong)
11:41 < danpb> stefanha:   fyi  gitlab's shared runners are   1 vCPU,
 3.75 GB of RAM by default
11:41 < stefanha> Gerd Hoffmann seems to have a hands-off/stateless
private runner setup that can be scaled to multiple machines.
11:41 < stefanha> danpb: :)
11:41 < danpb> stefanha: so those two small VMs are equivalent to 2
runners, and with 30-40 jobs we run in parallel
11:41 < stefanha> The first thing that needs to be decided is which
approach to take:
11:41 < jsnow[m]> peterx: I'm rusty but I think so. the guest writes
an FIS (Frame Information Structure)  for the card to read and operate
on
11:41 < danpb> stefanha:  just having two runners is going to make our
pipelines take x20 longer to finish
11:41 < stefanha> 1. Donating more minutes to GitLab CI
11:42 < stefanha> 2. Using Azure to spawn runners
11:42 < stsquad> stefanha I think the main bottleneck is commissioning
and admin'ing machines - but we have ansible playbooks to do it for
our other custom runners so it should "just" be a case of writing one
for an x86 runner
11:42 < stefanha> 3. Hosting runners on servers
11:42 < danpb> that's why i think the Azure k8s  executor sounded
promising - it would burst upto 20-30 jobs in parallel for the short
time we run CI
11:42 < danpb> without us having to pay for 30 vms  24x7
11:42 < stsquad> who actually understands configuring k8s?
11:42 < th_huth> stefanha: I read that fosshost announcement that they
will be going away ... not that they have already terminated
everything ... but sure, it's not something sustainable
11:42 < stefanha> stsquad: Yep, kraxel's approach solves that because
it's stateless/automated.
11:43 < peterx> jsnow[m]: thanks, then let me double check
11:43 < jsnow[m]> peterx: iirc the guest writes the address of the FIS
to a register and then the pci card maps that address to read the
larger command structure
11:43 < danpb> stsquad (@_oftc_stsquad:matrix.org):   i don't think
we'd need to configure k8s itself, just figure out how to point gitlab
runner as the azure k8s service
11:44 < stefanha> danpb: Has someone calculated the cost needed to run
QEMU CI on Azure? It's great that we can burst it when needed, but
will the free Azure quota be enough?
11:44 -!- mmu_man [~revol@188410969.box.freepro.com] has joined #qemu
11:44 < danpb> stsquad:  the problem with our current ansible
playbooks is that none of them used docker AFAIR, they just setup the
gitlab runer as bare metal
11:44 < peterx> jsnow[m]: yes, the thing is if that's the case the RAM
should have been there when post_load() even without commit anything,
so maybe there's something else I missed
11:44 < stefanha> i.e. will we just hit a funding wall again but on
Azure instead of on GitLab?
11:44 < danpb> stefanha  don't think anyone's calculated it, would
hafve to ask bonzini what we actually get access to
11:45 < danpb> what would help is that we would not need azure for the
whole month
11:45 < danpb> we would onl need it to fill in the gap when gitlab
allowance is consumed
11:45 < stsquad> danpb I'm sure they can be re-written - I can't
recall what stopped us using docker in the first place
11:46 < stsquad> but I'm a little wary of experimenting on the live CI server
11:46 < danpb> they wanted to run  avocado tests which utilize some
bare metal features
11:46 < stsquad> ahh that would be it
11:46 < stsquad> access to /dev/kvm
11:46 < danpb> i suggested that we set it up to expose KVM etc to the
container but it wasn't done that way :-(
11:49 < stefanha> danpb: A simple estimate would be: "QEMU uses 50k CI
minutes around the 20th of each month, so thats 50/20 * 10 more days =
25k CI minutes needed to cover those last 10 days"
11:49 < stefanha> Assuming GitLab CI minutes are equivalent to Azure k8s minutes
11:50 < stefanha> and then multiply 25k minutes by the Azure instance
price rate.
11:51 < stefanha> ISTR the Azure quota is manually renewed by
bonzini[m]. It may have been something like $10k and we use $2k of it
for non-CI stuff at the moment.
11:52 < stefanha> I'm not sure if the $10k is renewed annually or semi-annually.
11:52 -!- genpaku_ [~genpaku@107.191.100.185] has quit [Read error:
Connection reset by peer]
11:52 < stefanha> So maybe $8k available per year.
11:52 < dwmw2_gone> I feel I ought to be able to round up some VM instances too.
11:53 -!- farosas [~farosas@177.103.113.244] has quit [Quit: Leaving]
11:53 -!- farosas [~farosas@177.103.113.244] has joined #qemu
11:54 < bonzini> stefanha: right, more like $3k to be safe
11:54 < bonzini> dwmw2_gone: the right thing to do would be to set up
kubernetes/Fargate
11:54 < bonzini> same for Azure
11:54 -!- zzhu [~zzhu@072-182-049-214.res.spectrum.com] has quit
[Remote host closed the connection]
11:55 < bonzini> dwmw2_gone: because what we really need is beefy VMs
(let's say 10*16 vCPU) for a few hours a week, not something 24/7
11:55 < bonzini> the Azure and AWS estimators both gave ~1000$/year
11:56 -!- genpaku [~genpaku@107.191.100.185] has joined #qemu
11:57 < dwmw2_gone> I have "build scripts" which launch an instance,
do the build there, terminate it. Why would you need anything 24/7? :)
11:57 < dwmw2_gone> I abuse some of our test harnesses for builds
11:57 < dwmw2_gone> You can have bare metal that way, and actually get KVM.
11:58 < bonzini> dwmw2_gone: 24/7 because that's what the gitlab
runners want (unless you put them on kubernetes)
11:59 -!- vliaskov
[~vliaskov@dynamic-077-191-055-225.77.191.pool.telefonica.de] has quit
[Remote host closed the connection]
11:59 < dwmw2_gone> Ah. Unless the gitlab runners just spawned the
instance to do the test, and waited for it. They don't use many CPU
minutse that way.
11:59 -!- bolt [~r00t@000182e9.user.oftc.net] has quit [Ping timeout:
480 seconds]
12:00 < stefanha> 25k mins / 60 minutes/hour = 417 hours/month @ AKS
node hourly price $0.077 = $32 month (!)
12:00 < bonzini> stefanha: danpb: i think spending 250-500 $ on GitLab
CI while we set up Azure in the next couple months is workable
12:00 < stefanha> That's with small nodes similar to GitLab CI runners
12:00 < danpb> bonzini:  unless we're trying to get the pipeline
wallclock time shorter,  we don't need really beefy VMs - gitlabs
runners are quite low resources, we just use a lot in parallel
12:01 < bonzini> danpb: 10*16 vCPUs cost less than 80*2 vCPUs anyway
12:01 < stefanha> It seems the Azure quota will be fine
12:01 < stefanha> Hmm...actually I think I'm underestimating the
number of instances and their size.
12:01 < danpb> bonzini  i guess RAM is probably their dominating cost
factor for VMs rather than CPUs
12:02 < bonzini> danpb: a bit of both
12:03 < danpb> stefanha:  don't forget that our gitlab CI credits
don't reflect wallclock time - there's a 0.5 cost factor - so our
50,000 credits == 100,000 wallclock minutes per month
12:03 -!- Moot [~Moo99@185.247.84.132] has quit [Read error:
Connection reset by peer]
12:03 -!- bkircher [~bk@2001:a61:251f:7001:8aae:ddff:fe01:5bb2] has
quit [Remote host closed the connection]
12:03 < stefanha> With the current Azure quota QEMU could spend around
$500/month on Azure container service and nodes.
12:03 -!- bkircher [~bk@2001:a61:251f:7001:8aae:ddff:fe01:5bb2] has joined #qemu
12:04 < danpb> we burnt through 100,000 in about 2.5 weeks so would
need to allow for perhaps another 50,000 wallclock minutes at that
rate
12:04 < stefanha> danpb: I think it's still worth a shot with a
$500/month budget.
12:04 < bonzini> AWS Fargate has 60000 minutes * vCPU at 60 $/month
12:04 < danpb> yeah it does seems like its worth a try to use Azure
since we have the resources there going otherwise unused
12:04 < bonzini> Azure I think it was $1000/year
12:04 < bonzini> which is the same
12:04 -!- iggy [~iggy@47.152.10.131] has joined #qemu
12:05 < bonzini>     Average duration: 40 minutes = 0.67 hours
12:05 < bonzini> 1,500 tasks x 1 vCPU x 0.67 hours x 0.04048 USD per
hour = 40.68 USD for vCPU hours
12:05 < bonzini> 1,500 tasks x 4.00 GB x 0.67 hours x 0.004445 USD per
GB per hour = 17.87 USD for GB hours
12:05 < bonzini> 40.68 USD for vCPU hours + 17.87 USD for GB hours =
58.55 USD total
12:05 < stefanha>
https://makinhs.medium.com/azure-kubernetes-aks-gitlab-ci-a-short-guide-to-integrate-it-e62a4df5c86a
12:06 < bonzini> stefanha: let's ask if jeff nelson could have someone do it
12:06 < stefanha> bonzini: ok, do you want to ping him?
12:06 -!- Katje [freemadi@mail.quixotic.eu] has joined #qemu
12:06 < bonzini> yep
12:06 < stefanha> Thank you!

