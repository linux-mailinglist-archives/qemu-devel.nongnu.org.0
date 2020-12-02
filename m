Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CB22CB15E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 01:16:22 +0100 (CET)
Received: from localhost ([::1]:55170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkFoi-0005Zi-K3
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 19:16:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kkFmP-0004y2-BE
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 19:13:57 -0500
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:39278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kkFmL-0002cS-5R
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 19:13:56 -0500
Received: by mail-il1-x142.google.com with SMTP id q1so3507350ilt.6
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 16:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ms2y6LB7pV+xBjtjWRR0tZJprFfybZJkirPgYxQNBFA=;
 b=S6P7AUgDHbwFarSRMd676g0p36P0LHqZF84Qm5XQnr8a+d++J2GF8Y5UzAhTKHYfKq
 /3+7GV+qIRle/BPj/TUrVBNZlOVjIyWRCi6p5/8lgJwnmUskGB+wn48vFgFe6WNOMN4W
 QhhIhgqDwGshoiydmQzcEWnQFMumfYqt2t9QnP/7fN2L3yzIMwDXaNT/jOmgeVZd5wYC
 +OhRUuioa8pI7now2DKxbt3Jw6wB5cV1uFW2eR7j6Y5Nfi+d9rVR2E9A6/XT5TDRUWk1
 MEeXlg3slhmR+122Z8AZAA69cHklG0vJvSmLN+xAdx1T7GWaCQR3nblCAkvu0GgPypX8
 bF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ms2y6LB7pV+xBjtjWRR0tZJprFfybZJkirPgYxQNBFA=;
 b=bcOWW79G9UmTYQsfYfOZRkPReHD5M/sqXOAu4deXDLwO/dsdpRTBI2Om9UR6+AG+88
 VHKuWCMw5Ea+TWzxbsTG1GoeEHb9x7bF8nEEcc66bG+I7wFSRy58jNaDCb0cnH4+/Vk1
 6BhYb8MY3VP4MO0ikdWpenir4FSicNTzUgw357Au5VBIeDB90DKIRxKCC7xAFGw0UZJf
 mbCJ7J8AbEVNpfVsrJ516DCSKija0tEIKGvyh37OuCCXiK32PB/6tJSI20feQChAnWhx
 I2+GY8laiILEI9P0+C6lE82vADWynAGLGBGwwzROAXvghVcI8zkXnqrDJuN2jAzSVH2p
 +paQ==
X-Gm-Message-State: AOAM5314MUVEodls6ZL8G83OkCLeG6677t7LJsual35Xpz9mE0D1TxZj
 rbWZLK9Dk+WVBuNu6CLQYxJDK54SCL53CAja+t8lSw==
X-Google-Smtp-Source: ABdhPJyDiJ8Q/EWcY3IPN4XVFVqDUON2wIA4gwbtVgCeVzor4tr9mouhcTubidDur4weBwyYCmmchxBPHa3JGH1A0pY=
X-Received: by 2002:a92:990e:: with SMTP id p14mr190484ili.28.1606868029464;
 Tue, 01 Dec 2020 16:13:49 -0800 (PST)
MIME-Version: 1.0
References: <4a2d15d01087207e2fba1f55ad312727dbfc782e.1606856104.git.pcc@google.com>
 <d91deec6e2c68a9cf0e911251992b4d845be14ab.1606856104.git.pcc@google.com>
 <bd199d49-91a6-e14a-41c3-4a4325c8eff2@csgraf.de>
In-Reply-To: <bd199d49-91a6-e14a-41c3-4a4325c8eff2@csgraf.de>
From: Peter Collingbourne <pcc@google.com>
Date: Tue, 1 Dec 2020 16:13:38 -0800
Message-ID: <CAMn1gO73SfYxEeHf5xyp0=R3UCKnjfLEACV1JpoEHEzz4yUBtg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm/hvf: Stop setting current_cpu
To: Alexander Graf <agraf@csgraf.de>
Cc: Frank Yang <lfy@google.com>, Roman Bolshakov <r.bolshakov@yadro.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, 
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=pcc@google.com; helo=mail-il1-x142.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 1, 2020 at 2:11 PM Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 01.12.20 22:00, Peter Collingbourne wrote:
> > This variable is already being set by the generic HVF code and it's a
> > thread-local variable so I don't see how it can be overwritten.
> >
> > Signed-off-by: Peter Collingbourne <pcc@google.com>
>
>
> Yikes :). Yes, absolutely!
>
> Would you mind if I squash this straight into my patch?

Sure, please go ahead.

Peter

>
>
> Thanks,
>
> Alex
>
>
> > ---
> >   target/arm/hvf/hvf.c | 8 --------
> >   1 file changed, 8 deletions(-)
> >
> > diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> > index 3321d48aa2..40984fcf4d 100644
> > --- a/target/arm/hvf/hvf.c
> > +++ b/target/arm/hvf/hvf.c
> > @@ -364,7 +364,6 @@ int hvf_vcpu_exec(CPUState *cpu)
> >       do {
> >           bool advance_pc = false;
> >
> > -        current_cpu = cpu;
> >           qemu_wait_io_event_common(cpu);
> >
> >           flush_cpu_state(cpu);
> > @@ -391,7 +390,6 @@ int hvf_vcpu_exec(CPUState *cpu)
> >               /* This is the main one, handle below. */
> >               break;
> >           case HV_EXIT_REASON_VTIMER_ACTIVATED:
> > -            current_cpu = cpu;
> >               qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 1);
> >               continue;
> >           case HV_EXIT_REASON_CANCELED:
> > @@ -412,8 +410,6 @@ int hvf_vcpu_exec(CPUState *cpu)
> >               uint32_t srt = (syndrome >> 16) & 0x1f;
> >               uint64_t val = 0;
> >
> > -            current_cpu = cpu;
> > -
> >               DPRINTF("data abort: [pc=0x%llx va=0x%016llx pa=0x%016llx isv=%x "
> >                       "iswrite=%x s1ptw=%x len=%d srt=%d]\n",
> >                       env->pc, hvf_exit->exception.virtual_address,
> > @@ -523,7 +519,6 @@ int hvf_vcpu_exec(CPUState *cpu)
> >               break;
> >           case EC_AA64_HVC:
> >               cpu_synchronize_state(cpu);
> > -            current_cpu = cpu;
> >               if (arm_is_psci_call(arm_cpu, EXCP_HVC)) {
> >                   arm_handle_psci_call(arm_cpu);
> >               } else {
> > @@ -533,7 +528,6 @@ int hvf_vcpu_exec(CPUState *cpu)
> >               break;
> >           case EC_AA64_SMC:
> >               cpu_synchronize_state(cpu);
> > -            current_cpu = cpu;
> >               if (arm_is_psci_call(arm_cpu, EXCP_SMC)) {
> >                   arm_handle_psci_call(arm_cpu);
> >               } else {
> > @@ -561,7 +555,5 @@ int hvf_vcpu_exec(CPUState *cpu)
> >           }
> >       } while (ret == 0);
> >
> > -    current_cpu = cpu;
> > -
> >       return ret;
> >   }

