Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4376A6AE19C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:05:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZXvI-0006gn-Q2; Tue, 07 Mar 2023 09:04:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZXv0-0006Yd-Gl
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:03:56 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZXux-0001m1-9e
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:03:53 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso7282161wmo.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 06:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678197829;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lltYh7R+B2qiCRDkGQ7fa7sQg7oFYGwr6UbY78cSH0Y=;
 b=YRxLfe1v9ZiVzGCN/g37XvqG5xvBDVVqvxjpehvfCtwCkEHSRaxTWJ9euPW0ywAG0w
 P1y69UiSUacTKd++Fvfuq3OzumtuSHk0qBwySSFNRJ7A4ryMuKQHSllEHwTPVYTQXykd
 NTRb3wCH/nALxeYwcu0sox3SftRg0wAn1IiXONCgH7rSJ3nnw26Cjk4/1Cr1875T86PI
 soxRyL/q6E0C3+Ei4h2VR4zHn2j3C/Gi8y6lzaIc+BvbI1AUN/a5KzMEa1EchjMIozrN
 G8+6T2oTdwUgaWsnb/V5KsIkU/TYbwsdpO/SRQF/D8SrGzlOpVx6/ZAjUfl8HeAg5kuT
 Gg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678197829;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lltYh7R+B2qiCRDkGQ7fa7sQg7oFYGwr6UbY78cSH0Y=;
 b=CGpkuF2A31aLUCrwVWxmY7pxxz7mgXwMsKmyo0wOkiXYhuuLtRGMrSxUueslQAx2VZ
 /R7YqxUKwPHgTfbzF7g9eguaMnj0lXx7GkPz08d/ieyals2iRhbcu00wP2gY9XWklJXe
 NfmBGGtCRKcldz2cOQYZCOpxA9Cq6HDpiLmPGb1kOh4eSKJnk1G31u+UFVT8WOa0OpTB
 hU+7Or0REL85q3fIQ//q5CucFwSEUcubZrz+0GpVq84TA5qbmiwpqKfYDJ181mTuO+wj
 ueTggsZAPvkPMqCL2u21TmMqLsiv31UrjX2G3Sa3iMdXL+wBys597Eq0p2JbAn9Yz9sa
 5AMw==
X-Gm-Message-State: AO0yUKWTaRD/3oygT9ta3TrLb0XRQwy/pImlPd8HrZZmbyh88wwikbS3
 Art3S2gmoP1VBnPqZnnnCVPWxg==
X-Google-Smtp-Source: AK7set9xHFIX1xNikNDt108soTYWH5aI9cqzz/yZcva11vYDQG1CV7kb0CkRZdmQHjSNxq3pn5AAWA==
X-Received: by 2002:a05:600c:348d:b0:3eb:9822:2907 with SMTP id
 a13-20020a05600c348d00b003eb98222907mr9543824wmq.4.1678197829374; 
 Tue, 07 Mar 2023 06:03:49 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a05600c45d300b003df7b40f99fsm18510495wmo.11.2023.03.07.06.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 06:03:48 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 79F951FFB7;
 Tue,  7 Mar 2023 14:03:48 +0000 (GMT)
References: <cover.1678105081.git.balaton@eik.bme.hu>
 <23370610213adb60877c3751f954b203fe2fa775.1678105081.git.balaton@eik.bme.hu>
 <0ca8d3d3-2e42-a8c0-ed59-bc543e4149bd@ilande.co.uk>
 <3cbf9e02-5660-18dd-783b-9f9f09fe35bb@eik.bme.hu>
 <64b06dd7-4dbe-5f5b-3808-34acbf64b354@ilande.co.uk>
 <1ba22339-71f6-14a4-c138-05e31e169e0a@eik.bme.hu>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, Bernhard Beschow <shentey@gmail.com>, Peter
 Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 ReneEngel80@emailn.de, qemu-devel@nongnu.org, Michael S. Tsirkin
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v8 3/6] hw/isa/vt82c686: Implement PCI IRQ routing
Date: Tue, 07 Mar 2023 13:31:09 +0000
In-reply-to: <1ba22339-71f6-14a4-c138-05e31e169e0a@eik.bme.hu>
Message-ID: <87cz5kr73v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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


BALATON Zoltan <balaton@eik.bme.hu> writes:

> On Tue, 7 Mar 2023, Mark Cave-Ayland wrote:
>> On 07/03/2023 00:20, BALATON Zoltan wrote:
>>> On Mon, 6 Mar 2023, Mark Cave-Ayland wrote:
>>>> On 06/03/2023 12:33, BALATON Zoltan wrote:
<snip>
>>> Given that we only have a few hours left until the freeze I hope
>>> you're not proposing to drop this series and postpone all this to
>>> the next release,

This sort of passive aggressive framing isn't helpful or conducive to
collaboration. We should be striving to merge code based on the merits
of the patches not on how close we are to a given release.

>>> only that we do this clean up in the next devel
>>> cycle. You were away when this series were on the list for review
>>> so this is a bit late now for a big rewrite. (Especially that what
>>> you propose is a variant of the original I've submitted that I had
>>> to change due to other review comments.)
>>> Since this version was tested and works please accept this for QEMU
>>> 8.0 now then we can work out your idea in the next devel cycle but
>>> until then this version allows people to run AmigaOS on pegasos2
>>> with sound which is the goal I want to achieve for QEMU 8.0 and
>>> does not introduce any change to via-ide which was good enough for
>>> the last two years so it should be good enough for a few more
>>> months.
>>
>> My understanding from the thread was that testing shows there are
>> still hangs when using sound/USB/IDE simultaneously with this
>> series, no? Or has that now been fixed?
>
> No. This series fiixes sound/USB/PCI interrupts which is needed to get
> AmigaOS work and be usable on pegasos2. The hang Bernhard found with
> usb-mouse was only affecting MorphOS with this series which uses level
> sensitive mode of i8259 which wasn't implemented. Patch 2 in this
> series thanks to David Woodhouse fixes that (so did my work around
> before that patch) and MorphOS on pegasos2 is not a priority as it
> already runs on mac99 so what I'd like to make work here is AmigaOS
> for which it's the only G4 CPU platform now. This is important as it's
> much faster than the PPC440 version and may be able to run with KVM
> eventually but to find that out this should get in first so people can
> start to test it. We can always improve it later including
> implementing a better model of IRQ routing in VT8231. What we have in
> this series now works for all guests and all important patches have
> been tested and now reviewed. So I hope Philippe can pick this up and
> then we have time for this discussion afterwards.

We shouldn't make perfect the enemy of the good. If the changes are well
localised, reviewed and tested and importantly don't introduce
regressions then we shouldn't hold things up purely on the basis of a
not meeting a preferred style* of an individual maintainer. Obviously
the barrier for entry rises as the impact on the rest of the code base
increases. We have more than enough experience of introducing new APIs
and regretting it later to be understandably cautious in this regard.

(* as opposed to documented coding style which is a valid reason to
reject patches)

>> I completely understand it can be frustrating not getting patches
>> merged, but often as developers on less popular machines it can take
>> a long time. My perspective here is that both you and Bernhard have
>> out-of-tree patches for using the VIA southbridges, and during
>> review Bernhard has raised legitimate review questions based upon
>> his experience.
>
> Those review questions have been addressed, I've accepted Bernhard's
> alternative patch even though I think it's not entirely correct and
> although the first series was already tested I've re-done that based
> on Bernhard's idea and asked Rene to test all of it again. That's when
> you came along a few days before the freeze and blocking this without
> even fully understanding what it's about. That is what's frustrating.

While using Based-on gives enough information to reconstruct a final
tree perhaps it would be simpler to post a full series relative to
master to make for easier review and merging?

>> To me it makes sense to resolve these outstanding issues first to
>> provide a solution that works for everyone, rather than pushing to
>> merge a series that
>
> There are no issues to resolvc regatding functionality. All versions
> of this series that I have submitted were tested and are working and
> achieve the goal to make it possible to run AmigaOS on pegasos2 and
> get sound with MorphOS which are not yet possible currently. Nobody
> showed these patches would break anything (which would be surprising
> anyway as these are only used by pegasos2 and fuloong2e the latter of
> which has never been finished so only still around to have a way to
> test these components independent of pegasos2). A solution for
> everyone would be to merge this series now so they can use it in QEMU
> 8.0 then we have time to improve it and make the model conteptually
> more correct but there are no missing functionality that would prevent
> guests from running with this series so no reason to keep this out
> now.

Regressions would be a good reason to avoid premature merging.

>> still has reliability issues and where there is lack of consensus
>> between developers. The worst case scenario to me is that these
>> patches get merged, people report that QEMU is unreliable for
>> AmigaOS, and then we end up repeating this entire process yet again
>> several months down the line when Bernhard submits his series for
>> upstream.

Do we have any indication that AmigaOS (I assume as a guest) is less
reliable on this series? Is this an area where it can only be confirmed
by manual testing?

I'm not sure we can gate things on a manual test only a few people can
run. This is an argument for improving our testing coverage.

> I don't even know what to say to that. It already took me more time
> arguing with you about it than writing the whole series. We have
> pegasos2 in QEMU already which these really small patches that
> Bernhard now also agrees could be accepted for now would allow to run
> two more guests and reach usable state with them that is much better
> than what's possible now and there are several people who can't
> compile their QEMU from off-tree sources but would happily use it from
> their distro packages or binaries provided for release versions. But
> you just don't care about those people or my work and would hold this
> back indefinitely becuase maybe it could break some off-tree changes
> not even finished or submitted yet or maybe we will find a bug later.

Please don't assume peoples motivation in their feedback - its not
helpful. We should proceed with the default assumption that everyone
wants to improve the project even if opinions on how to do so differ.

> What's the freeze time for if not for finding bugs and fixing them.
> What's the development window for if not imrpving code already there?

We fix bugs that might of slipped in during development - we don't
knowingly introduce a bug with a promise to fix it during freeze.

> Again this is now tested, reviewed and isn't known to break anything
> that's already there or even make it less clean, in fact it does make
> existing code a bit cleaner and fixes some issues so the only problem
> is that you think there must be a better way doing it or do it more
> fully than this series does it but you've failed to say that during
> review because you were away.
>
> Philippe, Peter or any other maintainer please put an end on this
> suffering and submit a pull request with any version of this series
> (as I've said all versions I've sent are tested and working) now so we
> have it working and then we can rewrite it later however Mark wants in
> the future but let not make people who want to use it wait because of
> unreasonable concerns. Putting this off to wait until some other
> unfinished and unrelated machine is written just makes no sense.

I've added the PC machine maintainers to the CC because AFAICT they are
also maintainers for the systems touched here. From my point of view if
the maintainers of the affected subsystems are happy, code is reviewed
and there are no known regressions then there isn't a barrier to getting
this code merged.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

