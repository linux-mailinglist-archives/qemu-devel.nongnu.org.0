Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A119632DA58
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 20:26:29 +0100 (CET)
Received: from localhost ([::1]:54848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHtcC-0002Gz-N2
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 14:26:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHtaT-0001Ix-T7
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 14:24:41 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:38452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lHtaS-0008J9-8M
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 14:24:41 -0500
Received: by mail-ej1-x635.google.com with SMTP id mj10so31562384ejb.5
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 11:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VxmZWaot6jky7XYV+t1x4MjYFtIKfyCSO02WZtlnG9c=;
 b=S5Mnc5hnmJuT5l+K9tywhMQjl4Ae+hNDXxfLctBLRpVoAKHCF6HkE1YXz+Trmu2jhb
 SBK5/BrJuBq9I9zff4gcaXC6i4PY/jerzozTQLLOgcCZDi9FVMq5+b05nnxF1SVIWJ1c
 lo4gciYIfBDRzfpBv7bBZsidhEFlNaNiX+k7XTwJ5QHbLJXmZON4ZzYiaenir/2pvOMK
 IJpL8+RlNBGUOE4pt8qiKUZ0EWjcrCHAjb/OQ5Y3kBVAgXhWnxHD/g01lM0EfHeT3AVa
 WcLGUkyUbTCknMQg95CQg/BTq8txlBwUBUCuwFJjhQI6rR0ayBU5BrNyYQIq7LhL5SHl
 JCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VxmZWaot6jky7XYV+t1x4MjYFtIKfyCSO02WZtlnG9c=;
 b=gSPHiNJPNrEndoPqyKhvxpa62SEcWLcXYOBn50nN8EhmDWZXCSs7QLoq/uWzXLP+gT
 3i5I7TXcbcBTPTXaQqsxLp6x83fx9oGzPFbFDK9g86+NnN/6CkYlc5w+XRX/FAfu1g2N
 UYaUQIw9Wr7ynCqMKB3Af7rygUYQIBSMK75n/w/WhI0Tw7vtqQLocdCaFrfIhtu3E1T7
 e7TBRTkngMeTTBOO3T8jFZz0m6McbSrc6W741wa8f5I1J2gxe9P4B0Zv/J9bzIJ/niaF
 tGQ8WOGmYsoZ06KzssKW4s5JsNZY+AFJv2q9SvlOGljnm842vs457tp+M0+aU7qD9D/c
 6CJw==
X-Gm-Message-State: AOAM531Y7B9L1DbTPNUb1gwSeXwrOeqb+N+PDVsPIzxDgYmvSzLbrjpc
 IdAJ4CGM+A+dNsXg/S4w5jTLrWF5vv+AUObeBTho6w==
X-Google-Smtp-Source: ABdhPJwIUiATIlk1JInfTccjRDaFs3DEsvXiPCRpxMT/t2dWP1wWcszKaSRrLUD8A4kbYMXJ2yfAMMYAiB5ONK5Rbio=
X-Received: by 2002:a17:906:b14d:: with SMTP id
 bt13mr5957746ejb.407.1614885878595; 
 Thu, 04 Mar 2021 11:24:38 -0800 (PST)
MIME-Version: 1.0
References: <20210221092449.7545-1-cfontana@suse.de>
 <875z2k53mn.fsf@linaro.org>
 <a3ed4064-6dec-24c6-8138-ce8301f01e1e@redhat.com>
 <63847c79-93c2-5ee3-d568-9091fedf325c@suse.de>
 <87a6rmkffo.fsf@linaro.org> <8d4a427a-94dd-7472-e8ae-98c4efa44ce0@suse.de>
 <CAFEAcA_eWrgo9CcLF3ZpAPeK08_PmKNLjqKAzuBPcSGh+1SFCA@mail.gmail.com>
 <5fb3cf49-fc09-7e7c-d34e-299f04e9842a@suse.de>
 <335966c3-9f31-5868-54e5-edb28a37c50c@suse.de>
 <a9190376-ba0b-02d5-124d-a336c586ad5d@linaro.org>
 <dabd15eb-109a-802a-6abc-3831d7b1c203@suse.de>
 <1b92cbea-8abf-40b9-337a-15f34ef40f61@linaro.org>
 <38f0a65d-b5e4-3795-03a3-d6b1b3346816@amsat.org>
In-Reply-To: <38f0a65d-b5e4-3795-03a3-d6b1b3346816@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Mar 2021 19:24:22 +0000
Message-ID: <CAFEAcA9q4vbyi85ZAYAfW-F-SCDNt=XScDkb78TN8MEO7VvbAA@mail.gmail.com>
Subject: Re: [RFC v1 00/38] arm cleanup experiment for kvm-only build
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Mar 2021 at 16:39, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> On 3/3/21 7:54 PM, Richard Henderson wrote:
> > On 3/3/21 10:45 AM, Claudio Fontana wrote:
> >> It is a bit weird that qemu-system-aarch64 runs with a cortex-a15
> >> model tbh, as cortex-a15 is not capable of aarch64.
> >
> > No, but qemu-system-aarch64 is capable of 32-bit emulation (because mos=
t
> > 64-bit cpus retain 32-bit mode).  It takes no extra effort to run
> > cortex-a15 than it does a cortex-a57.
>
> IIRC qemu-system-arm starts the aa64 cores in 32-bit mode, while

...no, it simply doesn't have them at all; it only has
the 32-bit-only cores. We only support '64-bit core that
starts in 32-bit mode' for KVM; it would be nice to have the
TCG support for that but nobody's ever written it.

> qemu-system-aarch64 in 64-bit (this gave me trouble because the
> kernels for the raspi 64-bit SoCs are in 32-bit mode -- because
> the GPU starts them in this mode).
>
> > I have wondered if we should have just one qemu-system-arm that does it
> > all and drop the separate qemu-system-aarch64 -- or vice versa.  But
> > we've had the separation around so long I'm sure someone would be confu=
sed.
>
> That would be great cleanup IMHO.

I figure it's not really worth the bother until/unless we ever
some day get to the holy grail of "one binary that supports
multiple target architectures", at which point we could have
one qemu-system for everything...

-- PMM

