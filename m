Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6BC40DC6E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 16:08:55 +0200 (CEST)
Received: from localhost ([::1]:46892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQs4M-0004AJ-7k
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 10:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQs1o-0001fw-7F
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 10:06:16 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQs1m-0001u3-Ag
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 10:06:15 -0400
Received: by mail-wr1-x433.google.com with SMTP id t8so2698962wri.1
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 07:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=flE3/Xp9xEou041iPWoTUEH1ojqRrVEenXKxIz2IbME=;
 b=HVPw1HIz9L3iKwpRx+yrWAOvHAjAeImDSe/Cl/07mnaTNqRN5wTOkt3cdtkdddFo7C
 9b7R/Dx5mKS59Rvc3Xzai8lKpppRTl6t1I1U9klrWTxP6GK9HHYDjB5S1/m5U3xKctL+
 /5PTRVd+UXlprQwIJeMDK5VBbcHKheJ/WEAR96jzPTZS9ztyuCIoz6Wkb2krY3Ouhcu7
 iSh00jstWTEXH6qZZENI/u56ajOzR9xDzNop8G5d41DAcFl9q30oHA435S08mZVDEmt4
 9kJM0R8AiHmpQa2DVqhC+M7zKKPdFE7bQ+0rFipNryllGiCdXI7NlVG1Z03O/8dAtmxQ
 NTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=flE3/Xp9xEou041iPWoTUEH1ojqRrVEenXKxIz2IbME=;
 b=6DAxbDbbwO+zRlB3/rl/wl4asQBXWf6y5TcFYe0bIEMDraOKSQecOyp71KZ54uFlIk
 ZGHSeBB0ShQot23iHga4QI34pl4+SI/o5hk/AxB7rHOZnn5q6SQozwSck8JTOb3IweAu
 Ct01gyqwJ8rq2KcqAeDnIFyWjfvLSotAf0IQVZ630uGdXe77aMkw3RfqjvfepHUToGJB
 l/9oqRbdMXF59eOeAGtc5tBpRHL1a4AdQiROaq/LwA64+aF6ZMZCMCuqpMNcNsDImnD3
 w5vbjCL2DYQij5urZ4KnMFPw9O5bzGJZFhslyg+rx55+nq79egyXbpcro+WMo6yghoOU
 x0NA==
X-Gm-Message-State: AOAM531FpHPcDNb9SaUsbf6UiXCsXYyJpSw2SbwFxBdtg+TBR+woth/G
 9/BJN7Wjdw8yzgW7x3CT+i61uqQeJTnsk/XiBah/Wg==
X-Google-Smtp-Source: ABdhPJy9d7woP0xm/a1NJOExjCI/s03tDWiZkd9jb+skf8dsswMdXifSoTFfbUMlple7nuY6SS0FN7kRz37lS2T+qrM=
X-Received: by 2002:adf:f185:: with SMTP id h5mr6393048wro.302.1631801172409; 
 Thu, 16 Sep 2021 07:06:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-3-agraf@csgraf.de>
 <CAFEAcA9e+tnF56J11AWcsyKGH+h+3VKKADOFGaM37JhYR_HqDA@mail.gmail.com>
 <2b3f4581-56c3-db0e-f083-fd6d1b7cc2f8@csgraf.de>
In-Reply-To: <2b3f4581-56c3-db0e-f083-fd6d1b7cc2f8@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 15:05:21 +0100
Message-ID: <CAFEAcA9+mRkGwHTnHzRrhAFRKj=NM3Yj_tsMskGjNE+=fzdf3w@mail.gmail.com>
Subject: Re: [PATCH v11 02/10] hvf: Add execute to dirty log permission bitmap
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Sept 2021 at 15:04, Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 16.09.21 13:59, Peter Maydell wrote:
> > On Wed, 15 Sept 2021 at 19:10, Alexander Graf <agraf@csgraf.de> wrote:
> >> Hvf's permission bitmap during and after dirty logging does not include
> >> the HV_MEMORY_EXEC permission. At least on Apple Silicon, this leads to
> >> instruction faults once dirty logging was enabled.
> >>
> >> Add the bit to make it work properly.
> >>
> >> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> >> ---
> >>  accel/hvf/hvf-accel-ops.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
> >> index d1691be989..71cc2fa70f 100644
> >> --- a/accel/hvf/hvf-accel-ops.c
> >> +++ b/accel/hvf/hvf-accel-ops.c
> >> @@ -239,12 +239,12 @@ static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
> >>      if (on) {
> >>          slot->flags |= HVF_SLOT_LOG;
> >>          hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
> >> -                      HV_MEMORY_READ);
> >> +                      HV_MEMORY_READ | HV_MEMORY_EXEC);
> >>      /* stop tracking region*/
> >>      } else {
> >>          slot->flags &= ~HVF_SLOT_LOG;
> >>          hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
> >> -                      HV_MEMORY_READ | HV_MEMORY_WRITE);
> >> +                      HV_MEMORY_READ | HV_MEMORY_WRITE | HV_MEMORY_EXEC);
> >>      }
> >>  }
> > Makes sense -- this matches the premissions we set initially
> > for memory regions in hvf_set_phys_mem().
> >
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> >
> > Should we change also the hv_vm_protect() call in
> > target/i386/hvf/hvf.c:ept_emulation_fault(), for consistency ?
>
>
> The x86 hvf code seems to deal just fine with !X mappings, so I'd leave
> it as is as part of the arm enablement series - especially because I
> have limited testing capabilities for x86 hvf.

Yeah, I should have been clearer -- that would be best as
a separate x86-specific patch.

-- PMM

