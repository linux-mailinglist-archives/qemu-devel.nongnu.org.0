Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBBA5A9B12
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 17:01:47 +0200 (CEST)
Received: from localhost ([::1]:52602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTlhS-0005ne-VD
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 11:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oTleB-0001Of-P4
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 10:58:24 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oTle8-0002xU-Du
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 10:58:22 -0400
Received: by mail-wr1-x42a.google.com with SMTP id v16so20001361wrm.8
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 07:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=WcTfIetTWIH8/Xw6ht70upU4HiRwSx2okBH+dVxF4LM=;
 b=Ct/NMhZd3xbQiEr9wLfQpsDU++UlY8kZMvDY4g4uaI58rkhn0Ykvm9JSqmTM0BEryX
 RI7ghe6V8aAteoyXBUNsl5o+7+/IZx2UX+ED4Jr8MxQ909BQnk+imEVAtR8nO0VKMYFp
 6vSDSh7hnCJYyNZbJP1CSH265d4WfOpFlaG6EYV4w1LiRbAEvRRZIal+GZrw8AgEI9ny
 o1VsqikNKbWkQI/2uL5Xb+5JhMakExzBX6wVDtzcyvziOYZthaU5COAgWubMoDPfeXes
 gK5pPQA28EUNYo+rANjqYNMT3s+aGUgnKTGxeZoFU93t0DJJ/2gq1rRRVWePc6iuhY6G
 /n0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=WcTfIetTWIH8/Xw6ht70upU4HiRwSx2okBH+dVxF4LM=;
 b=7uJkMQW/LcX7EN8MCJzwfzf/XKnUJcR5uTzX1OBdRG8/F0LqldGCL/v8EcwRHN8cqF
 MPSqRBvjg5AGf1dY2YYSRypoeW0A2nUSr/bZaIDv3UVRdN3OFsBcBBwRw5US+A3WlbKD
 pioO/+ck01JHVPLRZ7BZE9151CgZirwCYG65D9g7hUvchY7EgV6iPTMUvk9BRsUdtUzs
 cz79EYxv+KqA42nAs/D+Lcgk9OH+cja+WDQ6ZO5/dKTOs8FPNPCsxQvtqm6xGM+nYcZF
 1nsi1wfATvqEHKpgHKoc22hA7S26+w1bUV+gi6+9bxrO63oy+YP/qfztpQG1mReNaP9E
 +6Yw==
X-Gm-Message-State: ACgBeo0Su8+yh0BOB9OydlOdJ4GmaGsv/WVKbWJk8oj/JoINQZBgCVIL
 8KE5STWNtTcb+CwMNiMlKOegrQ==
X-Google-Smtp-Source: AA6agR78sOvv3G5+ARLcpyrPw4gJP1HFaDuZspCYwBW/qgq9alPJkVZ1lADMfjCBFbrhlcij3yIKKQ==
X-Received: by 2002:adf:eb52:0:b0:223:9164:b5b4 with SMTP id
 u18-20020adfeb52000000b002239164b5b4mr15024490wrn.518.1662044299089; 
 Thu, 01 Sep 2022 07:58:19 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 i7-20020a5d4387000000b002258619d342sm15330711wrq.2.2022.09.01.07.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 07:58:18 -0700 (PDT)
Date: Thu, 1 Sep 2022 15:58:16 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com
Subject: Re: [PATCH 05/10] hw/arm/virt: Fix devicetree warning about the
 timer node
Message-ID: <YxDIiA2UD3aP33M5@myrica>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
 <20220824155113.286730-6-jean-philippe@linaro.org>
 <CAFEAcA8jCLX8kyZHV4JW+QmKUeH2hL3Rq+q4gsvM1LXioBozYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8jCLX8kyZHV4JW+QmKUeH2hL3Rq+q4gsvM1LXioBozYw@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 24, 2022 at 08:40:21PM +0100, Peter Maydell wrote:
> On Wed, 24 Aug 2022 at 16:51, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > The compatible property of the Arm timer should contain either
> > "arm,armv7-timer" or "arm,armv8-timer", not both.
> >
> >   timer: compatible: 'oneOf' conditional failed, one must be fixed:
> >         ['arm,armv8-timer', 'arm,armv7-timer'] is too long
> >   From schema: linux/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
> >
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >  hw/arm/virt.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index ca5d213895..5935f32a44 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -344,7 +344,7 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
> >
> >      armcpu = ARM_CPU(qemu_get_cpu(0));
> >      if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
> > -        const char compat[] = "arm,armv8-timer\0arm,armv7-timer";
> > +        const char compat[] = "arm,armv8-timer";
> >          qemu_fdt_setprop(ms->fdt, "/timer", "compatible",
> >                           compat, sizeof(compat));
> >      } else {
> 
> Are we really sure there are no existing guests out there that are
> looking for this device under "armv7-timer" ?

It's highly unlikely. It would take for example a 32-bit Linux from before
2013 or a 32-bit FreeBSD from before 2015, running on a machine with
ARM_FEATURE_V8. But I can't say for sure that no one is running such a
config, so I'll ask about relaxing the binding.

> 
> This used to be valid DT before Linux kernel commit 4d2bb3e65035954,
> which changed from "should at least contain one of" to requiring
> exactly one-of, and that was only in 2018.

Yes the text bindings weren't always exact.

Thanks,
Jean

