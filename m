Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F966AE435
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 16:14:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZ0e-0001sJ-N8; Tue, 07 Mar 2023 10:13:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pZZ0T-0001rr-3M; Tue, 07 Mar 2023 10:13:38 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pZZ0M-0008Ci-Oq; Tue, 07 Mar 2023 10:13:34 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 4B8737457E7;
 Tue,  7 Mar 2023 16:13:13 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E5F79745720; Tue,  7 Mar 2023 16:13:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E3BC57456E3;
 Tue,  7 Mar 2023 16:13:12 +0100 (CET)
Date: Tue, 7 Mar 2023 16:13:12 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Bernhard Beschow <shentey@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org, 
 ReneEngel80@emailn.de, qemu-devel@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v8 3/6] hw/isa/vt82c686: Implement PCI IRQ routing
In-Reply-To: <87cz5kr73v.fsf@linaro.org>
Message-ID: <8868aae3-1d8e-0f14-0f76-614acaf0d746@eik.bme.hu>
References: <cover.1678105081.git.balaton@eik.bme.hu>
 <23370610213adb60877c3751f954b203fe2fa775.1678105081.git.balaton@eik.bme.hu>
 <0ca8d3d3-2e42-a8c0-ed59-bc543e4149bd@ilande.co.uk>
 <3cbf9e02-5660-18dd-783b-9f9f09fe35bb@eik.bme.hu>
 <64b06dd7-4dbe-5f5b-3808-34acbf64b354@ilande.co.uk>
 <1ba22339-71f6-14a4-c138-05e31e169e0a@eik.bme.hu> <87cz5kr73v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-1092065267-1678200001=:65948"
Content-ID: <eb70ee48-3273-f6d0-429d-3b56baed4151@eik.bme.hu>
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1092065267-1678200001=:65948
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <2705e51b-a0e8-6f20-0b5a-526db9b854a4@eik.bme.hu>

On Tue, 7 Mar 2023, Alex Bennée wrote:
> BALATON Zoltan <balaton@eik.bme.hu> writes:
>> On Tue, 7 Mar 2023, Mark Cave-Ayland wrote:
>>> On 07/03/2023 00:20, BALATON Zoltan wrote:
>>>> On Mon, 6 Mar 2023, Mark Cave-Ayland wrote:
>>>>> On 06/03/2023 12:33, BALATON Zoltan wrote:
> <snip>
>>>> Given that we only have a few hours left until the freeze I hope
>>>> you're not proposing to drop this series and postpone all this to
>>>> the next release,
>
> This sort of passive aggressive framing isn't helpful or conducive to
> collaboration. We should be striving to merge code based on the merits
> of the patches not on how close we are to a given release.
>
>>>> only that we do this clean up in the next devel
>>>> cycle. You were away when this series were on the list for review
>>>> so this is a bit late now for a big rewrite. (Especially that what
>>>> you propose is a variant of the original I've submitted that I had
>>>> to change due to other review comments.)
>>>> Since this version was tested and works please accept this for QEMU
>>>> 8.0 now then we can work out your idea in the next devel cycle but
>>>> until then this version allows people to run AmigaOS on pegasos2
>>>> with sound which is the goal I want to achieve for QEMU 8.0 and
>>>> does not introduce any change to via-ide which was good enough for
>>>> the last two years so it should be good enough for a few more
>>>> months.
>>>
>>> My understanding from the thread was that testing shows there are
>>> still hangs when using sound/USB/IDE simultaneously with this
>>> series, no? Or has that now been fixed?
>>
>> No. This series fiixes sound/USB/PCI interrupts which is needed to get
>> AmigaOS work and be usable on pegasos2. The hang Bernhard found with
>> usb-mouse was only affecting MorphOS with this series which uses level
>> sensitive mode of i8259 which wasn't implemented. Patch 2 in this
>> series thanks to David Woodhouse fixes that (so did my work around
>> before that patch) and MorphOS on pegasos2 is not a priority as it
>> already runs on mac99 so what I'd like to make work here is AmigaOS
>> for which it's the only G4 CPU platform now. This is important as it's
>> much faster than the PPC440 version and may be able to run with KVM
>> eventually but to find that out this should get in first so people can
>> start to test it. We can always improve it later including
>> implementing a better model of IRQ routing in VT8231. What we have in
>> this series now works for all guests and all important patches have
>> been tested and now reviewed. So I hope Philippe can pick this up and
>> then we have time for this discussion afterwards.
>
> We shouldn't make perfect the enemy of the good. If the changes are well
> localised, reviewed and tested and importantly don't introduce
> regressions then we shouldn't hold things up purely on the basis of a
> not meeting a preferred style* of an individual maintainer. Obviously
> the barrier for entry rises as the impact on the rest of the code base
> increases. We have more than enough experience of introducing new APIs
> and regretting it later to be understandably cautious in this regard.
>
> (* as opposed to documented coding style which is a valid reason to
> reject patches)
>
>>> I completely understand it can be frustrating not getting patches
>>> merged, but often as developers on less popular machines it can take
>>> a long time. My perspective here is that both you and Bernhard have
>>> out-of-tree patches for using the VIA southbridges, and during
>>> review Bernhard has raised legitimate review questions based upon
>>> his experience.
>>
>> Those review questions have been addressed, I've accepted Bernhard's
>> alternative patch even though I think it's not entirely correct and
>> although the first series was already tested I've re-done that based
>> on Bernhard's idea and asked Rene to test all of it again. That's when
>> you came along a few days before the freeze and blocking this without
>> even fully understanding what it's about. That is what's frustrating.
>
> While using Based-on gives enough information to reconstruct a final
> tree perhaps it would be simpler to post a full series relative to
> master to make for easier review and merging?

The last version v9 I've sent today is based on master without any other 
dependency but it wasn't decided until today what fix will be taken for an 
issue in master that was introduced independntly of this series a week ago 
and I had to rebase this on all propsed fixes for that change until it 
finally turned out I should not target the fix I was prevously was told to 
do.

>>> To me it makes sense to resolve these outstanding issues first to
>>> provide a solution that works for everyone, rather than pushing to
>>> merge a series that
>>
>> There are no issues to resolvc regatding functionality. All versions
>> of this series that I have submitted were tested and are working and
>> achieve the goal to make it possible to run AmigaOS on pegasos2 and
>> get sound with MorphOS which are not yet possible currently. Nobody
>> showed these patches would break anything (which would be surprising
>> anyway as these are only used by pegasos2 and fuloong2e the latter of
>> which has never been finished so only still around to have a way to
>> test these components independent of pegasos2). A solution for
>> everyone would be to merge this series now so they can use it in QEMU
>> 8.0 then we have time to improve it and make the model conteptually
>> more correct but there are no missing functionality that would prevent
>> guests from running with this series so no reason to keep this out
>> now.
>
> Regressions would be a good reason to avoid premature merging.
>
>>> still has reliability issues and where there is lack of consensus
>>> between developers. The worst case scenario to me is that these
>>> patches get merged, people report that QEMU is unreliable for
>>> AmigaOS, and then we end up repeating this entire process yet again
>>> several months down the line when Bernhard submits his series for
>>> upstream.
>
> Do we have any indication that AmigaOS (I assume as a guest) is less
> reliable on this series? Is this an area where it can only be confirmed
> by manual testing?

AmigaOS runs well on this series and can use PCI cards which it cannot on 
current master. The goal of this series is to allow that because otherwise 
it cannot use network and sound without which it's not really usable. With 
this series it finally can be used as shown on the video by Rene who 
tested it and I posted before.

> I'm not sure we can gate things on a manual test only a few people can
> run. This is an argument for improving our testing coverage.

It needs a license for AmigaOS Pegasos 2 version to test with that but 
this series also fixes PCI IRQs for Linux so the same could be tested by 
adding a network card to a Linux guest. But Mark did not run any tests 
just ctiticised based on looking at the patches so not sure it's a 
question of patch coverage in this case.

>> I don't even know what to say to that. It already took me more time
>> arguing with you about it than writing the whole series. We have
>> pegasos2 in QEMU already which these really small patches that
>> Bernhard now also agrees could be accepted for now would allow to run
>> two more guests and reach usable state with them that is much better
>> than what's possible now and there are several people who can't
>> compile their QEMU from off-tree sources but would happily use it from
>> their distro packages or binaries provided for release versions. But
>> you just don't care about those people or my work and would hold this
>> back indefinitely becuase maybe it could break some off-tree changes
>> not even finished or submitted yet or maybe we will find a bug later.
>
> Please don't assume peoples motivation in their feedback - its not
> helpful. We should proceed with the default assumption that everyone
> wants to improve the project even if opinions on how to do so differ.
>
>> What's the freeze time for if not for finding bugs and fixing them.
>> What's the development window for if not imrpving code already there?
>
> We fix bugs that might of slipped in during development - we don't
> knowingly introduce a bug with a promise to fix it during freeze.

This series does not introduce any bugs that we know about. All versions 
I've submitted work equally well without introducing regressions so all 
the different versions were only necessary to implement the same in 
different ways not to fix any regressions but to satisfy different views 
of different people. The regression we now have in master was introduced 
by a different series that wasn't sufficiently tested before merging. This 
series now also has a patch to fix that.

>> Again this is now tested, reviewed and isn't known to break anything
>> that's already there or even make it less clean, in fact it does make
>> existing code a bit cleaner and fixes some issues so the only problem
>> is that you think there must be a better way doing it or do it more
>> fully than this series does it but you've failed to say that during
>> review because you were away.
>>
>> Philippe, Peter or any other maintainer please put an end on this
>> suffering and submit a pull request with any version of this series
>> (as I've said all versions I've sent are tested and working) now so we
>> have it working and then we can rewrite it later however Mark wants in
>> the future but let not make people who want to use it wait because of
>> unreasonable concerns. Putting this off to wait until some other
>> unfinished and unrelated machine is written just makes no sense.
>
> I've added the PC machine maintainers to the CC because AFAICT they are
> also maintainers for the systems touched here. From my point of view if
> the maintainers of the affected subsystems are happy, code is reviewed
> and there are no known regressions then there isn't a barrier to getting
> this code merged.

The only patch that touches pc machine is the i8259 LTIM patch from David 
which is only needed for MorphOS as nothing else uses that mode of the 
i8259 PIC so if you can't decide on that one patch then just drop it and 
merge the rest of the series which is enough for AmigaOS to work. That 
patch being a bug fix could also wait a bit more, no reason to delay the 
whole series because of this patch.


I've said it before but here it is again to make it clearer:

v9-0001-hw-display-sm501-Add-debug-property-to-control-pi.patch
v9-0002-hw-intc-i8259-Implement-legacy-LTIM-Edge-Level-Ba.patch

The above two are optional but would be nice to have. Patch 1 adds a debug 
aid for testing sm501 emulation, patch 2 is only needed for MorphOS on 
pegasos2 which is less important than getting AmigaOS to work.

v9-0003-Revert-hw-isa-vt82c686-Remove-intermediate-IRQ-fo.patch

This fixes up Philippe's series which caused me to need to rebase the 
series several times.

v9-0004-hw-isa-vt82c686-Implement-PCI-IRQ-routing.patch
v9-0005-hw-ppc-pegasos2-Fix-PCI-interrupt-routing.patch
v9-0006-hw-usb-vt82c686-uhci-pci-Use-PCI-IRQ-routing.patch

These three are needed to fix PCI interrupts on pegasos2 and is the 
minimum we need for AmigaOS (with some fix for current breakage like the 
revert above).

v9-0007-hw-audio-via-ac97-Basic-implementation-of-audio-p.patch

This one implements audio output for pegasos2 but AmigaOS can use a sound 
card instead with the above PCI IRQ patches so this could be optional but 
since it's reviewed and tested no reason to not merge it but it depends on 
the other patches before.

Are there any more questions or concerns that I shuold answer about these?

Regards,
BALATON Zoltan
--3866299591-1092065267-1678200001=:65948--

