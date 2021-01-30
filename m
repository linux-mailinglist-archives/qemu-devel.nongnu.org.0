Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D853097B9
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 19:57:52 +0100 (CET)
Received: from localhost ([::1]:35210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5vRP-0008Pp-1i
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 13:57:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5vOV-0005qq-Lb
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 13:54:51 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:43181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5vOT-0003Sh-Ub
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 13:54:51 -0500
Received: by mail-ej1-x62f.google.com with SMTP id a10so17981488ejg.10
 for <qemu-devel@nongnu.org>; Sat, 30 Jan 2021 10:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oXtPVE2IbtRRYCpvUtiVFQgbW5mh8YjoQMknIuSaeAc=;
 b=b1rE5reO+/ylwUvWHDQ6gFBD1ZMLvjmBVj7z6iHZEtOIrt85KafbIsrJiUTFMjgkMv
 EO239Ch7/2vVc0sITyLPdJw79Y+DCrMrThTp86B/tp4yto0D8J7B2oagD+F+VrSA1ciu
 I5poKTCsVbT2lrqibfeCp+VtxN5qYq2t6UgtTQzNfWSNTueccgRu9w7NSq60zrXpqF00
 E+yG6zYuZ31QrSrfccmyDg4uryatxiI+pF7o1OOGRbojYu5vd9czNJSN+4ROCzG5yfv6
 OGKU/10X2cC0Qells3y39Jm9YWDAtsEjcdG3fj0bTfhFF3WPV5yrPTu2+mgt4gwFPh4s
 n7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oXtPVE2IbtRRYCpvUtiVFQgbW5mh8YjoQMknIuSaeAc=;
 b=oDcWa3VQtc3jfYjujshcVpJ37w4zlZ4mGubNkvNDJQvaTdUjxX8rXZoPjrqPqitMwi
 tZM8+EiyI/oaxU+lD+1nO79M4ItQVnG1oGQ58DDjzuO/6/p3U0k/UPUDYQi9O2DPNZuD
 Zvml5egBpNmGaCDgPS7/dGljSo+CyLHaihukezT6nhHJsHe/RhJCYBdmCKNZYA5ufKhv
 WypGcf1F8q5wo+E5wXdvO+l71fj5m/iZuTpRNz78L8ykdei5NXPOeGs4OLVb0LZyQZmB
 jY6z3ZqhB+en0Lw0RXq2dpMUUNNYSrGRuPUzarS6KJJunu0ZisIhF7SNlQxqJ6WuUNlT
 1AIg==
X-Gm-Message-State: AOAM532E8cZgVPILvfAkfuspAuACT2XXRpztCSrNVTMQg5d0VA0SUJH9
 Lzthu+jkBVVJr+yr7hxG31tAGATXNLzW6fjWWXVsJg==
X-Google-Smtp-Source: ABdhPJwo7gvPhPJtvirAJL3BBx+tVDxaTzL7yXGFz6XeyRrStm+3laD7Nmfgez99qF2/kAXH8/BrkdUPl35U/QOjqxg=
X-Received: by 2002:a17:906:b215:: with SMTP id
 p21mr10088000ejz.407.1612032888158; 
 Sat, 30 Jan 2021 10:54:48 -0800 (PST)
MIME-Version: 1.0
References: <20210130015227.4071332-1-f4bug@amsat.org>
 <20210130015227.4071332-4-f4bug@amsat.org>
 <CAFEAcA8UCFghGDb4oMujek_W_wsyYz+duiQ-d8JyN09NYoff-g@mail.gmail.com>
 <2871f7db-fe0a-51d6-312d-6d05ffa281a3@amsat.org>
In-Reply-To: <2871f7db-fe0a-51d6-312d-6d05ffa281a3@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 30 Jan 2021 18:54:37 +0000
Message-ID: <CAFEAcA-W1tcRREaPTfMw98cNsHs7JHk4gjaJWaJNLpxZoVnKaw@mail.gmail.com>
Subject: Re: [PATCH v5 03/11] target/arm: Restrict ARMv4 cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 kvm-devel <kvm@vger.kernel.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 30 Jan 2021 at 18:36, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Hi Peter,
>
> On 1/30/21 4:37 PM, Peter Maydell wrote:
> > On Sat, 30 Jan 2021 at 01:52, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >>
> >> KVM requires a cpu based on (at least) the ARMv7 architecture.
> >
> > These days it requires ARMv8, because we dropped 32-bit host
> > support, and all 64-bit host CPUs are v8.
>
> Oh, this comment is about the target, to justify it is pointless to
> include pre-v7 target cpus/machines in a KVM-only binary.
>
> I'll update as:
>
> "KVM requires the target cpu based on (at least) the ARMv7
> architecture."

KVM requires the target CPU to be at least ARMv8, because
we only support the "host" cpu type, and all KVM host CPUs
are v8, which means you can't pass a v7 CPU as the target CPU.
(This used to not be true when we still supported running
KVM on a v7 CPU like the Cortex-A15, in which case you could
pass it to the guest.)

thanks
-- PMM

