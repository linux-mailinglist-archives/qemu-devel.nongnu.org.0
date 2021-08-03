Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F043DEF4E
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 15:50:27 +0200 (CEST)
Received: from localhost ([::1]:35502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAuoM-0001Mh-Kn
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 09:50:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAulq-0005RT-1Q
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 09:47:50 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:38894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAulo-0008UO-Fg
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 09:47:49 -0400
Received: by mail-ej1-x62d.google.com with SMTP id nd39so36490775ejc.5
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 06:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kfA7/rfdvDbhhwIDuByzt15zzPqKlWnvybK2DyuLrLQ=;
 b=BWTPNADbS6y7DV/0Y4jd5kXgPFAt16qj2u07munOwDvDW+Jc9PnfH09Wxir8gHda71
 +IRR/+NrFK5o96cHZhFk8T1hfjQ66kFihazivV29lBBMQ6al4pi5h96Eap48XV/HxRJA
 PuV52eDbnOsuUSnp3zFGfV6bURiVTak3I/qiyQaxKrvLgkOo3HwKN7KTQa6ZdAYBVefZ
 rbRe6DeQYD7yahWGngvKsAnNND47uJL/ZwG4IEFlHZLZv7aiZc/xl+ggpRXKRZVPljiw
 UN/wyB42q0N1bV2Lz27aBiGww/MJe8LxR1MmjRHSnlofv+Kk1vJxXgNkqGy3indwpcbx
 dXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kfA7/rfdvDbhhwIDuByzt15zzPqKlWnvybK2DyuLrLQ=;
 b=AwPPBKfii0/eL68uKZyMnRsOfumDogiJdCnMXXcW1x5RqU3LFbWKgfTFno/2frGx+i
 2LGl6TPMUZKklxhM0tDjSFg0vertnwQ2tdJjgoGGE2lszQoPLCO0J7VXwrt+fufSwW87
 5Ci83ECqovZ5y+nt4or4E6y2rkUxYcR8/Pfsx+pVS/rS5/I/DOu8FYI08sgar+SFCSCE
 49EHj8ByMxes8Q9wip4pfjVazlAJJ5RRw5jHmRYx/EgbNHNphGOL4eM4d28sD/S1/S8L
 g4t9z6G1bQfrWZcoBMGycSFcLBzbtf/IUVTXHslLJL6EmmDtAHhd3wZCq0+m10j/IGok
 4EmQ==
X-Gm-Message-State: AOAM532LTYRjysG5ufogaMXKqILbkJNsNrWpgkSR5oMKGzZGJVDYDE+E
 HGSRlt0uBVPdnRy2/MsebUTIWOY4WDu7ugpd5GQ8HQ==
X-Google-Smtp-Source: ABdhPJwYJMs50hHf3qwuBUW+5w2Y2dVRcI9+wJXnFmcY+XTpYXn62xHE81cCVliHTCtEFuJYTTO7WGUuvegLh7DeAl0=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr20429926ejy.407.1627998466060; 
 Tue, 03 Aug 2021 06:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_g8F26bV6wHFRUt7TSZMjt8hs6Pip8kHw=s4-WXy_AXg@mail.gmail.com>
 <CA+bd_6KanUEpDxVv4-T1mxvFMeCsG7XGXv9t06-b-AL3UxK0-w@mail.gmail.com>
In-Reply-To: <CA+bd_6KanUEpDxVv4-T1mxvFMeCsG7XGXv9t06-b-AL3UxK0-w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Aug 2021 14:47:02 +0100
Message-ID: <CAFEAcA_c=ipCiN8bHn+EK92BqvDbWpzdC5kfs321O5ZGR6jSrw@mail.gmail.com>
Subject: Re: 'make check-acceptance' eats lots of disk space and never cleans
 it up
To: Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Aug 2021 at 13:58, Cleber Rosa <crosa@redhat.com> wrote:
>
> On Tue, Aug 3, 2021 at 8:43 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > It looks like 'make check-acceptance' creates directories in
> > build/clang/tests/results which are huge and which it never
> > cleans up. For example one of my build directories (configured
> > just for arm targets) has over 350 'job-[timestamp]' directories,
> > many of which are 2.5GB or more in size.
> >
>
> Every "job-[timestamp]" directory is the result of an "avocado run"
> invocation, that is, one "make check-acceptance" command.
>
> > I assume most of this is artefacts (disk images etc) needed to
> > rerun the tests. That's useful to keep around so you can manually
> > run a test. However, we should be sharing this between runs, not
> > creating a fresh copy for every time check-acceptance is
> > run, surely ?
> >
>
> They contain results and files needed for debugging the results of
> tests, not artefacts needed to re-run them.  Everything that is
> shareable is in the "~/avocado/data/caches" directory.

This doesn't in practice seem to be the case. Picking a subdirectory
at random:

./build/clang/tests/results/job-2021-07-30T11.20-63bd0a6/test-results/tmp_dir4_a3m36o/091-tests_acceptance_machine_sparc64_sun4u.py_Sun4uMachine.test_sparc64_sun4u/day23

This contains (among other things) a vmlinux file which I assume is
the one we run on the guest. It looks to me like this is a directory
where we unzipped/untarred a downloaded file with the guest image.

And another:

./build/clang/tests/results/job-2021-07-30T11.20-63bd0a6/test-results/tmp_dirwowk1bzp/026-tests_acceptance_boot_linux_console.py_BootLinuxConsole.test_arm_cubieboard_initrd/

This seems to contain a rootfilesystem for some test or other,
with a boot/, lib/, usr/, etc.

These all look like artefacts to me, in the sense that they're
the same every time.

I notice that all these have 'tmp_dir*' directories in the paths. Is the
problem just that we're failing to clean up a tempdir in some situations?

thanks
-- PMM

