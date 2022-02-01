Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A922C4A6563
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 21:08:31 +0100 (CET)
Received: from localhost ([::1]:42026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEzS2-0003Mg-PO
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 15:08:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExXf-0001Kv-P0
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:06:11 -0500
Received: from [2a00:1450:4864:20::435] (port=37623
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExXc-0006Qc-Ss
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:06:11 -0500
Received: by mail-wr1-x435.google.com with SMTP id w11so33561796wra.4
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=lzU/TG9AwZwdupdEA69hLaNvw9cFrDKVpFVyevunExA=;
 b=fvDNGvnim8rhhZbQv8yhv+dRjIi2jOkfVpqX+MAJOOB0pwhIGGZ81x4M8KNPaFOezh
 JAYJ5slJV1hNi9NVzWQQQgaz1uhflH6FH7jVYh323SsSYS9K9w/yEpUGsu+n4cxl9rOI
 wF0U3VxzxbNgaQFik/68/WoOPM9+GASxwvEvnarQZ+o6p3qForylP69CoB5CBKgJKcJi
 36xoDSEUH2pupofJSJtMZ22V9CRoADJUpGNOWFji25mhgDgsa/HZuQIQg2JRXkWexD1Y
 BM0Py201UtnPv0wJE6Zdoai39QuJBKSw8swDPPoT7HsDibxYSY1TiMpGg4ru/dyMC+lm
 QPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=lzU/TG9AwZwdupdEA69hLaNvw9cFrDKVpFVyevunExA=;
 b=XIa4gu58j/rlcvYOYhilh+mgl7Ww04qxV09sRUNJcdcMHGOLoE7WbM1dQJ7EHAyaSl
 +oove5G5W7uiugqVYUeCWkV50JRwlATDDoOzjBwIJmAIWBktiQunAVRbTQslrwNoRgvu
 PbcN/SrDMobW41P3wL7VC04CYgjGeNqfJLYYSEXNAKRSAVngPJiknhw2bunfGVpaFRsW
 AbggWMk6lAyHH1rnW603Lum9AZiC18HbKsXX82xgz42QWCky7OnIOmlDyXM70hWhTwKD
 +KdYdZODiF0FK8D9+vpC7FPjAOwD0mDQLcVc7bSyDpiMAlzBgofXDkeR1eyKIEzEKiXz
 tILg==
X-Gm-Message-State: AOAM532WtVsCMIAixFg7D9P4OrvtiwGnAQ2zpDfWYApjAS/NxWpApu7L
 Tq2BomZE/LUDi/SGNpry0ozreQ==
X-Google-Smtp-Source: ABdhPJz3ELcCe8dcCizQTjEzu+X6nuyjmoB7gMw92w0uqzBTsUtfoQQRjVKfi6Qv0PG2ZjeUmfusLA==
X-Received: by 2002:a5d:5552:: with SMTP id g18mr23085227wrw.343.1643738765846; 
 Tue, 01 Feb 2022 10:06:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t4sm2622114wmj.10.2022.02.01.10.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:06:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6AC711FFB7;
 Tue,  1 Feb 2022 18:06:03 +0000 (GMT)
References: <87zgnp4b32.fsf@dusky.pond.sub.org>
 <CAFEAcA_kxrCgyxWPFLw6VZ-rKx-res0C8L2BWRvfB81cR+keLg@mail.gmail.com>
 <875yqd6zib.fsf@linaro.org> <YerPk2ABMHQf/3QP@redhat.com>
 <20220125092011.dq2t4ryl632vrvsf@sirius.home.kraxel.org>
 <20220201073139.7896e10b@elisabeth> <Yfj4ERdAvmCF4ZzY@redhat.com>
 <20220201112720.4ac9b8df@elisabeth> <87wnieygjp.fsf@linaro.org>
 <CA+bd_6JF5iRKufxVa=6TEtR-eH65iiiG-oarWRHkavX-3E-p1Q@mail.gmail.com>
 <Yfldie06h92qxqf3@redhat.com>
 <CA+bd_6Jnp846dL4FBUaduHGtnDJN29qQjSuS96V7aPS2iuqF0Q@mail.gmail.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: "make check-acceptance" takes way too long
Date: Tue, 01 Feb 2022 18:03:12 +0000
In-reply-to: <CA+bd_6Jnp846dL4FBUaduHGtnDJN29qQjSuS96V7aPS2iuqF0Q@mail.gmail.com>
Message-ID: <87fsp2xy0k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefano Brivio <sbrivio@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa <crosa@redhat.com> writes:

> On Tue, Feb 1, 2022 at 11:20 AM Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
>>
>> On Tue, Feb 01, 2022 at 11:01:43AM -0500, Cleber Rosa wrote:
>> > On Tue, Feb 1, 2022 at 6:25 AM Alex Benn=C3=A9e <alex.bennee@linaro.or=
g> wrote:
>> > >
>> > > We have up to now tried really hard as a project to avoid building a=
nd
>> > > hosting our own binaries to avoid theoretical* GPL compliance issues.
>> > > This is why we've ended up relying so much on distros to build and h=
ost
>> > > binaries we can use. Most QEMU developers have their own personal zo=
o of
>> > > kernels and userspaces which they use for testing. I use custom kern=
els
>> > > with a buildroot user space in initramfs for example. We even use the
>> > > qemu advent calendar for a number of our avocado tests but we basica=
lly
>> > > push responsibility for GPL compliance to the individual developers =
in
>> > > that case.
>> > >
>> > > *theoretical in so far I suspect most people would be happy with a
>> > > reference to an upstream repo/commit and .config even if that is not=
 to
>> > > the letter of the "offer of source code" required for true complianc=
e.
>> > >
>> >
>> > Yes, it'd be fine (great, really!) if a lightweight distro (or
>> > kernels/initrd) were to
>> > be maintained and identified as an "official" QEMU pick.  Putting the =
binaries
>> > in the source tree though, brings all sorts of compliance issues.
>>
>> All that's really needed is to have the source + build recipes
>> in a separate git repo. A pipeline can build them periodically
>> and publish artifacts, which QEMU can then consume in its pipeline.
>>
>
> I get your point, but then to acquire the artifacts one needs to:
>
> 1. depend on the CI system to deploy the artifacts in subsequent job
> stages (a limitation IMO), OR
> 2. if outside the CI, implement a download/cache mechanism for those
> artifacts, which gets us back to the previous point, only with a
> different distro/kernel+initrd.
>
> With that, the value proposal has to be in the characteristics of
> distro/kernel+initrd itself. It has to have enough differentiation to
> justify the development/maintenance work, as opposed to using existing
> ones.
>
> FWIW, my non-scientific tests booting on my 3+ YO machine:
>
> * CirrOS x86_64+KVM: ~2 seconds
> * CirroOS aarch64+TCG: ~20 seconds
> * Fedora kernel+initrd aarch64+TCG
> (tests/avocado/boot_linux_console.py:BootLinuxConsole.test_aarch64_virt):
> ~1 second
>
> I would imagine that CirrOS aarch64+KVM on an adequate system would be
> similar to the CirrOS x86_64+KVM.  We can develop/maintain a slimmer
> distro, and/or set the default test workloads where they perform the
> best.  The development cost of the latter is quite small.  I've added
> a missing bit to the filtering capabilities in Avocado[1] and will
> send a proposal to QEMU along these lines.

FWIW the bit I'm interested in for the slow test in question here is
that it does a full boot through the EDK2 bios (EL3->EL2->EL1). I'm not
overly concerned about what gets run in userspace as long as something
is run that shows EL0 can be executed and handle task switching. I
suspect most of the userspace startup of a full distro basically just
ends up testing the same code paths over and over again.

>
> Regards,
> - Cleber.
>
> [1] https://github.com/avocado-framework/avocado/pull/5245


--=20
Alex Benn=C3=A9e

