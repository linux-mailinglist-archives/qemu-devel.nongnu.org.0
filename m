Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B754F5B7969
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 20:27:15 +0200 (CEST)
Received: from localhost ([::1]:37012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYAcs-0002oD-SC
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 14:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1oYAXT-0004eC-Nt
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 14:21:39 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:36430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1oYAXQ-0007No-8H
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 14:21:38 -0400
Received: by mail-pf1-x42c.google.com with SMTP id y136so12556487pfb.3
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 11:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=73X7tjK24eyeMwRo5SkXom90dYm0sSUaWjd90OYmkp4=;
 b=Qu/O/4Kr8m6ElbRpxlxnefVOk/lX2UhgY0DLxyzrY9Bv/ghlq8l+ZPjczTCRIBt5bm
 ZzJkHyKIgR5ilKgSgDV4Jdh8yKmj2Q1tNtOgd5rN2nBzeg9h3bCFjOuj081YUHg5Zfsl
 nTyT9QYIyTl3XbdyFTigmganhtMbhY4mV0IpDCWNusuB9T1kQPlHbKW35XYdqJV+ISLD
 DS1UD4vBHITC8QHq0ZJ2bljgy+eTzoDurWmyX/N4Ej5USqkWBE/o5KFb1NH/U5eWD3fs
 YedpQmBmCNcEnTmfJSU09emmO3rIOv0qranI0OjTkIh3ZXrWklCAVjof2imhBO0O1P1R
 lLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=73X7tjK24eyeMwRo5SkXom90dYm0sSUaWjd90OYmkp4=;
 b=mhG7apVVnOVzoP9Pmocvyl6q7OSVjVCw9piqr8EJvqN1k/RsOurkyof3l9krg/CPl9
 hLBirI+MWoG9vz+IYutuNrUXd7LKAPnGCkrMXGxDatWXJZijTShEbueBmVN3N4f1+YxA
 RPEr2ZMaEaidu72ZooX0uVA9jT9Xts/Eg1OH2CD9CFQU634tdmQrgA1VPSP8pjTNMM/R
 rgXpfDI0gdBmpedfKLMJTJYN0ejb1EdZcDmPqsdz9vF5FN3uOUutziKZzPcy5TAACsyB
 yTe+MG1MYNYynjfsvnCU+0eah04nAabCSQlmnDNmDJnEVlKiuMsVHEEdAIhxffk0miAU
 D21w==
X-Gm-Message-State: ACgBeo3DqaZweD36kGKivRe9vMv64te52lRbDs2/2upJd2w5ohmn8dXz
 s4N24BXo4PTLIUYRaIEUFazOkfelwFxcSMfHi7e7PA==
X-Google-Smtp-Source: AA6agR46E5m6LtlN/c8jDmcA5myZHY7DFPd/9Qy6YmFe8biQgfZoKOCg+xGhLDvgdCRO2nwnAGmrzm4/aotVY0KAdxw=
X-Received: by 2002:a63:e055:0:b0:438:cd8e:f263 with SMTP id
 n21-20020a63e055000000b00438cd8ef263mr13539787pgj.378.1663093293725; Tue, 13
 Sep 2022 11:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220906220552.1243998-1-titusr@google.com>
 <YxuZ95ppk9lZ/23g@pdel-fedora-MJ0HJWH9>
In-Reply-To: <YxuZ95ppk9lZ/23g@pdel-fedora-MJ0HJWH9>
From: Titus Rwantare <titusr@google.com>
Date: Tue, 13 Sep 2022 11:20:57 -0700
Message-ID: <CAMvPwGqjfRrvx7uv0PNQK14VMbjf1wEK_w2LaELL02f91srWBA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Initial PECI bus support
To: Peter Delevoryas <peter@pjd.dev>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, patrick@stwcx.xyz, 
 iwona.winiarska@intel.com, tmaimon77@gmail.com, quic_jaehyoo@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=titusr@google.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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

On Fri, 9 Sept 2022 at 12:54, Peter Delevoryas <peter@pjd.dev> wrote:
>
> On Tue, Sep 06, 2022 at 10:05:49PM +0000, Titus Rwantare wrote:
...
> >
> > This is something that can also be extended as other parameters arise that need
> > to differ between platforms. So far you can have have different CPUs, DIMM counts,
> > DIMM temperatures here. These fields can also be adjusted at runtime through qmp.
>
> That looks good to me, seems like the standard way to do it in QEMU.
>
> >
> > A lot of the registers are hard coded, see hw/peci/peci-client.c. I'd like to
> > gauge interest in what potential users would like to be adjustable at runtime.
> > I've not written QEMU models that read config files at runtime, something I'd
> > appreciate guidance on.
>
> This part I don't totally understand. I also barely know anything about
> PECI.
>
> Is the register location for things different between CPU generations?

Some things seem to move between generations and others don't move, someone at
Intel would know better than I do.



> If so (and I expect it probably is), why is there only a configuration
> for Sapphire Rapids, and not for the other ones?
>
> Is that because of PECI protocol changes between generations?

I haven't dug into the other machines because of internal demand, but
I've found that
with newer generations, more features get used in addition to existing
ones. It's
possible these features existed on older machines.



> In which case, maybe there needs to be a notion of PECI version
> somewhere?
>
> Also, I don't understand why it would be adjustable at runtime, do we
> change register locations during execution?
>
> I would expect it to be part of the board definition.
>
> You could provide a bunch of sample configs for the CPU's that you're
> testing for, and the board configuration could just select the sample
> config it is using (corresponding to the CPU model).
>
> That's the model I would imagine, but I might be missing some important
> context here.

I think it would be nice to have additional registers at runtime, at
the time of writing,
I don't know how much of the internal workings of Sapphire Rapids
Intel is willing to
share publicly. If users are free to separately define registers, I
don't then get to
worry about this. e.g. I'd like to simulate errors from the memory controllers.



Titus

