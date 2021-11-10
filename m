Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C59A44C2F1
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 15:29:19 +0100 (CET)
Received: from localhost ([::1]:37218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkobG-0002vV-D1
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 09:29:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mkoZv-0001Oz-0F
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 09:27:55 -0500
Received: from [2a00:1450:4864:20::434] (port=34311
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mkoZr-0004H3-7u
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 09:27:54 -0500
Received: by mail-wr1-x434.google.com with SMTP id d5so4397745wrc.1
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 06:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P0K3cdD8fXjCq7W5KbwCXuO73k2Iz5yQa1CMAo5v1Hs=;
 b=IfXSHgLFzPrzhNO0q3RT3gQapTvMPcOqLyxN9D2BZIfmbsnBFtT3hUbS4mFbSGFCdS
 9w8MHtvIRKHv5e9sZShkaCMx027SKpHSVoxTrrbusw91BT9jWJ3ahd21htQHwY6TJJP5
 ztXPjFuM3WqG3xXcUYlmyjKB93wqjUxgdrJBrktlVpVGaa6uIdWyiWE8fQFK814CFasm
 fyXmRLRMTBBvICp76ZPbKIpSm7fGaLKsmGDZApCiCqklO9zlsyzAvLP+olW2UMlOAiWA
 j5DLrJFibe5CgemqWZc6DvR5n4J4XNPpAg5CyInVHpuisSjkvE4OCXX0bTp7FJSkHZ0l
 h/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P0K3cdD8fXjCq7W5KbwCXuO73k2Iz5yQa1CMAo5v1Hs=;
 b=4HrAzPRlNqqMVMwMXTlM4lZwo1bT1FOJQG61Fu4kfcHOy3t+OGOIn+zOzN4A2x/2/x
 1jptFKHXKcs67eiTcrjk1HRmp8RYgGm7iIGXC29YxVmNV4ezaQXU5MRJzGlgKfmHRS97
 HWMAmdmU9xdwKIk9IRZeeWlqyVAE6+wSWe/2TyrH61x5FTp2H7hhUzEsj47HxQ/YyeHJ
 qMl0GYhrTzVs3ygUlcBPNQPmFUnnrC1JX0dvUin76NEzGpc0a+49zr5dLlE0er49qeXC
 litxFDQSfgKNoweVfRCSnwoCbAF+SkdjHW3Lv2YxBHBp22FhQdwJuH5fae4e1+IvvVls
 p1aA==
X-Gm-Message-State: AOAM531gOnwdFwOeCYqZxfxpCMUE0SGfmZu7zBccMA1SOssLdirtChnh
 UKzUuQbSg7DhsAMas2eWcJbg+UnjJGC84H00verQpg==
X-Google-Smtp-Source: ABdhPJyPkgqd8EopVfbPAWYz23Vpd1EuK6nx88HevLKJE3jt0t/W0vHlvXZ9szl/5hrB7zTQwXFnDdNwOFizIRekTqg=
X-Received: by 2002:a05:6000:186e:: with SMTP id
 d14mr170525wri.376.1636554469304; 
 Wed, 10 Nov 2021 06:27:49 -0800 (PST)
MIME-Version: 1.0
References: <20211109111517.996104-1-laurent@vivier.eu>
 <20211109111517.996104-2-laurent@vivier.eu>
 <9537b527-d33e-59d5-e196-e1e84fa01325@eik.bme.hu>
 <YYpvvWLvkhR0/igt@redhat.com>
 <fa213548-ca60-bf7b-2075-83bd7f32462a@eik.bme.hu>
 <CAFEAcA8yQ01RfaWCZO-qBd=quTYsMyTxfNsg0xbjRrzUb7LDJg@mail.gmail.com>
 <f6ed2484-c92c-8ac4-e529-f9fc6797a0ec@eik.bme.hu>
In-Reply-To: <f6ed2484-c92c-8ac4-e529-f9fc6797a0ec@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Nov 2021 14:27:37 +0000
Message-ID: <CAFEAcA9SRuuteP4mMFC+KrqozfAc3TapdoWSE-dAoeh3SM9Bsg@mail.gmail.com>
Subject: Re: [PULL 1/2] hw: m68k: virt: Add compat machine for 6.1
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-stable@nongnu.org, Laurent Vivier <Laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Nov 2021 at 23:33, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> On Tue, 9 Nov 2021, Peter Maydell wrote:
> > On Tue, 9 Nov 2021 at 20:01, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> >> But maybe it's too late to change at this point.
> >
> > Massively too late. We've been using this versioned-machine
> > scheme for over a decade, and the upheaval of changing the
> > way it works now would be rather out of proportion purely to
> > tidy up the list of machines in the help output...
>
> Well it's more than just tidy up the list, as not adding identical
> machines would have saved maintenance of adding these, lines of code in
> code base that do nothing just making it harder to read and also would be
> easier for users but these benefits are maybe less than the effort to
> change it now so then it's too late (not because how long it's been done
> this way but how much effort would be to change for how much benefit). I'm
> OK with that, was just wondering so asked it to clarify.

The other reason for always adding these machine types, which I forgot
about yesterday, is that it decouples the "add new machine type"
part from "incompatible changes in devices" part. We add the new
machine types as a boilerplate change to all versioned machines
at the start of a release cycle. Then later on when a particular
device needs a change that's only enabled in the newer machine
versions, we make that change in the device and add the property
setting to the hw_compat_6_1[] array in hw/core/machine.c. That
causes it to be automatically used for every versioned machine type
that uses that device. If we only added new versioned machines
"on demand", then for every device change like that we would need
to identify all the machine types which have that device or
could use that device, and then add the new versioned machine
at that point. I think that would be easy to forget to do for
all the machines, or to accidentally not identify every versioned
machine that can use the device.

-- PMM

