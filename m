Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD1D5A831C
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 18:25:30 +0200 (CEST)
Received: from localhost ([::1]:40222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTQWu-0005my-V3
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 12:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1oTQMJ-0004tM-6d
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 12:14:32 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:39544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1oTQMH-0007ei-Bo
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 12:14:30 -0400
Received: by mail-lf1-x12d.google.com with SMTP id p16so2634275lfd.6
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 09:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc; bh=rBgwgKoSwyzt+MgliJUiZyW9I34EqddDEjKPCPEjTXU=;
 b=LvhDh6Kl6Od8204gd3TtxfeebQaZfiyBelCwJxk+PWVdVKhrAIzrM9z5UGn5c45ULj
 spnF59goWGZF21qqBkzVuTr0kJ5SzNuabNT6dMaLsFtwM+IcVjDHxztAH6Exl0UJp64G
 15HOfOjlPH42pdFd0XsASrfVGp9fhNpsSxurGUJDy2DivFoQq0m3YDKsahhhdjR/j+HN
 Upnga0Lwqf/3sj9DWV+Mgdk+sZp0Ox44N4+ejjI+Zg5MB7iyQlL/qzVGnxIDJLI1fDlI
 z4aI1pF0PpcE/G9eKJvN1Yrlmq33Vy3fQ0EFo0Nl+XH/n79C72BQFuVg7tYiNgXYch5F
 PoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=rBgwgKoSwyzt+MgliJUiZyW9I34EqddDEjKPCPEjTXU=;
 b=BCpn1HpV+QpbvVVxP6hA4JEGtQsOEc7sX3uhUl9lpgF3w4YW6NDNQq+kJYcNl2LWIV
 GLf42JUdtJrw15+8LI0Rwsm4VphrlJUNmcvA0txf8t67pgyVrklfiiVH2V00ne+PqV6s
 XjOVeBPuo7C+LAJdhO0q6RMVS0e/mhIfmVvVLz7r7X5gWACjLUZUhrp1hcPWa/aNFREX
 eVJQoaGlgIRZfRlFqCLEJIzIelpWLJIvGP6UE+X6kNBRkaMBE/rvei3bwVga3B9jVWcj
 OfSSt8zYyYFcnhqrFF1dtkdP3j34nc9Q4526A9EsmQ28ldCjfFdfnJBD8lclN7PcCnWd
 rVAQ==
X-Gm-Message-State: ACgBeo1d2niKYUP29MZM5qfCIyJm9T6R7sAEKoTJ++Vz/MXzRS4FfqTr
 /fUh18rkclr7dDtUEsdAavo=
X-Google-Smtp-Source: AA6agR52XbP9gmK99itPuXpj3GwJbuBuUPkR/wVQpqBOAb9Yo6+K2op0T70Z4U96yaNA9L6JpYRlcQ==
X-Received: by 2002:a05:6512:c1c:b0:494:6c98:a298 with SMTP id
 z28-20020a0565120c1c00b004946c98a298mr4278565lfu.18.1661962467070; 
 Wed, 31 Aug 2022 09:14:27 -0700 (PDT)
Received: from gmail.com (81-232-4-135-no39.tbcn.telia.com. [81.232.4.135])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a2ea4a8000000b0026707e5a611sm791580ljm.20.2022.08.31.09.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 09:14:26 -0700 (PDT)
Date: Wed, 31 Aug 2022 18:14:26 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Mark Burton <mburton@qti.qualcomm.com>, Bill Mills <bill.mills@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Markus Armbruster <armbru@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Luc Michel <luc@lmichel.fr>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Alessandro Di Federico <ale@rev.ng>
Subject: Re: Any interest in a QEMU emulation BoF at KVM Forum?
Message-ID: <20220831161426.GA813051@toto>
References: <87a67kphih.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a67kphih.fsf@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Wed, Aug 31, 2022 at 03:35:19PM +0100, Alex Bennée wrote:
> Hi,
> 
> Given our slowly growing range of TCG emulations and the evident
> interest in keeping up with modern processor architectures is it worth
> having an emulation focused BoF at the up-coming KVM Forum?


Hi Alex,

Yes, I'd be interested in all topics you mention.

Best regards,
Edgar



> 
> Some potential topics for discussion I could think of might include:
> 
>  * Progress towards heterogeneous vCPU emulation
> 
>  We've been making slow progress in removing assumptions from the
>  various front-ends about their global nature and adding accel:TCG
>  abstractions and support for the translator loop. We can already have
>  CPUs from the same architecture family in a model. What else do we need
>  to do so we can have those funky ARM+RiscV+Tricore heterogeneous
>  models? Is it library or something else?
> 
>  * External Device Models
> 
>  I know this is a contentious topic given the potential for GPL
>  end-runs. However there are also good arguments for enabling the
>  testing of open source designs without having forcing the
>  implementation of a separate C model to test software. For example if
>  we hypothetically modelled a Pi Pico would it make sense to model the
>  PIO in C if we could just compile the Verilog for it into a SystemC
>  model? Would a plethora of closed device models be the inevitable
>  consequence of such an approach? Would it matter if we just
>  concentrated on supporting useful open source solutions?
> 
>  * Dynamic Machine Models
> 
>  While we try and avoid modelling bespoke virtual HW in QEMU
>  (virt/goldfish not withstanding ;-) there is obviously a desire in the
>  EDA space to allow such experimentation. Is this something we can
>  provide so aspiring HW engineers can experiment with system
>  architectures without having to form QEMU and learn QOM. There have
>  been suggestions about consuming device trees or maybe translating to
>  QMP calls and adding support for wiring devices together. Given the
>  number of forks that exist is this something that could be better
>  supported upstream without degenerating into messy hacks?
> 
>  * A sense of time
> 
>  Currently we have the fairly limited support for -icount in QEMU. At
>  the same time we have no desire to start expanding frontends with
>  the details cost models required for a more realistic sense of time to
>  be presented. One suggestion is to expand the TCG plugin interface to
>  allow for the plugin to control time allowing as much or little logic
>  to be pushed there as we like and freeing up frontends from ever having
>  to consider it.
> 
> Are any of these topics of interest? Are there any other emulation
> topics people would like to discuss?
> 
> -- 
> Alex Bennée

