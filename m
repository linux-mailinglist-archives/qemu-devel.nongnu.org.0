Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8520B3A6E70
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 20:54:47 +0200 (CEST)
Received: from localhost ([::1]:35828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsrjS-0000io-I2
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 14:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsriI-0007NJ-Fh
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 14:53:34 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lsriF-0005gU-VP
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 14:53:33 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso82638wmg.2
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 11:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wf+C52FlCRWRnh8+7+rCFV0BGN1f0md7TCroHaVmxHg=;
 b=FVaq8g8ifPi4RZ1F7FAsUSsFJ4Zy/i4+zrNjlQld1ywlHYda4GASQ+QM+MP4HImYDi
 iN4FAawd3kFXrmW+qWy44uXMb4gIQifp3KdFhyaMQtOrG8Rze79UlqK5hK6xSQ9R7neL
 2eLyZ0zbAAz61iOpy7IBdXr5fE/NxQygoFYbRgcQL4qm85w9LN3/fmBXU4Op/VH2/NfE
 7L6hGQy7wZYRjnvkC2+6Ofa19mFSe2dUjqJ9YNXCoZCH9heG9DXR3BQV5vVWlI00kG5s
 kJBxN1AdStjdM529h6IVKD7OAsqh36Ne5jaToIFMRq2XiJ6aHcVkHl1rBdX6R5KU+4Gi
 Qzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wf+C52FlCRWRnh8+7+rCFV0BGN1f0md7TCroHaVmxHg=;
 b=Qi39Zd54myjfqdOWHkboHA4SxtwaKM2vXGs/6n3bBWd4W+ybdK5nBkwQqQtgnnKASg
 D4x+5BF/qIiE2Fm+GGiIID3SO+zpcTwVGwzrYr8uNRnavXK0EKg/PrrGRW4DYhNIQyWL
 MPsTKUXPR+hJABGK/4f/U03OxlnP1iDJY8dnVH0dqCTzJ7LCepQRHzLEWW3imC8kCYPE
 WqmUIHUsbRxbOh9k4D0FMl659tTIwt6IyHOwPBFaBUPRkDQJYch8Czmed8ve25RmvZHv
 TVNTkCSl0PcjVtVlPCfnClXpv8RhRRziVNNbtjSY6WT8cIIugLwI3GEcFv1VhQ9l+SB1
 VG1Q==
X-Gm-Message-State: AOAM530AGfXHFOzV2kmU6cKPbsFZlBCfAf9PYdEopM3SsbgQPc8IZ0Bw
 SxVhni1juJ17PML+A5HcXzU=
X-Google-Smtp-Source: ABdhPJwK+jVWSmnkchdN3phCiLEjzSYG2qeHXzUfWQAv+MGxojf4poET3lbsore8I4RAMXsNntX5KA==
X-Received: by 2002:a05:600c:2cd2:: with SMTP id
 l18mr17783089wmc.142.1623696809315; 
 Mon, 14 Jun 2021 11:53:29 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id h6sm17093254wrt.20.2021.06.14.11.53.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 11:53:28 -0700 (PDT)
Subject: Re: [RFC] GitLab issue tracker labeling process: arch/target, os, and
 accel labels
To: John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <0a19af15-2f34-4934-c6c9-113e49f5f1f2@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d6be9a79-07af-4c46-8fc3-4bd5e01cb63a@amsat.org>
Date: Mon, 14 Jun 2021 20:53:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <0a19af15-2f34-4934-c6c9-113e49f5f1f2@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.489,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 7:32 PM, John Snow wrote:

> # Accel
> 
> Currently "accel: XXX", for HAX, HVF, KVM, TCG, WHPX and Xen.
> 
> https://gitlab.com/qemu-project/qemu/-/labels?subscribed=&search=accel%3A
> 
> Multiple accel labels can be applied to an issue, not just one. The
> intent was to allow for issues that may impact multiple accelerators,
> though that case may be rare.

While we can have QEMU built for multiple accelerators, AFAIK there is
only one at runtime. This is the one we want to know in bug reports.

I don't see multiple accel: labels as a valid user case.

The exception could be nested virtualization, but it is the same accel,
so this could be covered by an extra accel:nested label.

> I think these are reasonably straightforward and unambiguous, though for
> some qemu-system reports it's not always evident which accelerator
> applies right away without more info. The accel tag is often omitted
> because of this uncertainty.
> 
> I'd like to keep the mapping here 1:1 against ACCEL_CLASS_NAME if I can.
> It makes the mapping from CLI to accel tag fairly straightforward.
> 
> We technically lack a "qtest" accel tag for that parity. It could be
> added, but it's likely not actually useful versus the "tests" label.
> It's not really a user-facing accelerator.

All the accel:qtest issues I recall are the Fuzzer ones.
Sufficient so far.

> I see we also have a new "nvmm" accelerator, too, which should now be
> added here.
> 
> RTH raises the issue of the "TCI" subsystem of TCG, which is not a full
> accelerator in its own right, but (I think) a special case of TCG. If I
> keep the 1:1 mapping to ACCEL_CLASS_NAME, "accel: TCI" is inappropriate.
> 
> Some suggestions:
> - "TCI" by itself, simple enough.
> - "TCG-TCI" or "TCG: TCI" or "TCG/TCI" or similar, so that it shows up
> in label search when you search for 'tcg'.
> - "accel: TCG:TCI". Similar to above but uses the "accel:" prefix too.

It is unlikely a reporter add the TCI label. We'll add it upon triage.
Likely from TCG with the sole objective to Cc Stefan, which isn't up to
date with the recent TCI changes, so back to TCG maintainers.
Is it worth the churn?

> My only concern here is completeness of the label: this one seems like
> it's at particular risk of being forgotten or lost. It works perfectly
> well as an organizational bucket for people working on TCI, but I wonder
> if it will work well as an "issue inbox". Intended use begins to matter
> here. Your thoughts, Stefan?
> 
> 
> # OS
> 
> Currently "os: XXX" for BSD, Linux, Windows, and macOS.
> 
> https://gitlab.com/qemu-project/qemu/-/labels?subscribed=&search=os%3A
> 
> Multiple OS labels can be applied to an issue.
> 
> Originally, we kept this label somewhat vague and have been using it to
> identify both the host AND guest involved with an issue.
> 
> Stefan Weil has requested that we refactor this to separate the concerns
> so that he can identify issues where Windows is the host without wading
> through numerous reports where Windows is merely the guest. Reasonable
> request.
> 
> Shall we split it into "host: XXX" and "guest: XXX" for {BSD, Linux,
> Windows, macOS}?

I'm missing the importance of the guest OS. Either it is in pair with
the host accel, or it is accel:TCG and I see the guest irrelevant (do
we want to list all firmwares?).

So I'll let other sort this out.

> This isn't too hard to do at initial triage time, but we'll need to sift
> through the bugs we've labeled so far and re-label them. Help on this
> would be appreciated. I would prefer we create a *new* set of labels and
> then draw down on the old labels instead of just renaming them. That
> way, the old label can be used as a re-triage queue.
> 
> 
> # arch/target
> 
> Currently "target: XXX" for alpha, arm, avr, cris, hexagon, hppa, i386,
> m68k, microblaze, mips, nios2, openrisc, ppc, riscv, rx, s390x, sh4,
> sparc, tricore, xtensa.
> 
> https://gitlab.com/qemu-project/qemu/-/labels?subscribed=&search=target%3A
> 
> The names map 1:1 to the directories in target/.
> The names in [square brackets] in the label descriptions correspond 1:1
> with the SysEmuTarget QAPI enum defined in qapi/machine.json.
> 
> Multiple target labels can be applied to an issue. Originally, this was
> named "arch", so this was to allow multiple architectures to be
> specified to cover the host/guest environment. If we disentangle this,
> we may still want to allow multiple labels to cover bugs that might
> affect multiple targets, though that case might be rare.
> 
> Recently, we renamed this from "arch: XXX" to "target: XXX", though the
> label had been being used for both the host and guest architecture, so
> this will need to be re-audited to remove cases where the label had been
> applied for the host architecture.

This audit list is simply ...

> We probably want to keep a set of labels that apply to the host
> architecture. These are useful for build failures, environment setup
> issues, or just documenting the exact environment on which an issue was
> observed.
> 
> We won't likely require the full set of targets to be duplicated for
> this purpose: possibly just the most common ones. I assume those are:
> 
> arm, i386, ppc, s390x

... this one ^.

Maybe use the list of architecture with accelerators?

The rest of problems likely fits into the "Build System" label
(or is not supported).

Regards,

Phil.

