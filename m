Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4966D078E
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 16:03:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phsrx-0008Ek-HN; Thu, 30 Mar 2023 10:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1phsrv-0008Dy-AN
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:03:11 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1phsrs-0007xC-TU
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:03:10 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 e15-20020a17090ac20f00b0023d1b009f52so22050935pjt.2
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 07:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112; t=1680184987;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bbba0TpdX/+MZRHS5ch5oFXZb/MbtM4FYt9Wt3Q92Pw=;
 b=djhy5x7jYiHfr2W6pAlukxSkhn7v3GitqTTTxuVJcSCTH5aThtJrimoRAceukUd+US
 A3m29eb1gSybclbDOrKMEna8scZHV7SbeWFux/BjYdWygyqbki/le3+yIfQyGN6OQP4K
 RlUCWZz3u78ZbigLyBJHVvrRBIy4jMFFhlqP4kEx3IcGZH3ezOHSSbDuMf9PDq93f9cf
 quq7b8EYl4HNLnplHxhFGLPNN8PvHpXWbsaPd0cxTUJYxC9o6DKgS7KtrE7eJ9Y/C+Ml
 ZyisApd5LxPSBgnTQioRrSr+zw0PqRe7biNgElp2ioLoh1eVx6HlIOeG1WgBDoexWqK6
 qfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680184987;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bbba0TpdX/+MZRHS5ch5oFXZb/MbtM4FYt9Wt3Q92Pw=;
 b=mVSoahCjSROGhUYsGzwORwB7nL4ffgz4EGI20lNLuX5Wh/PNT85QOiFvNYBbkkv4aK
 B6OOv61i7/tACQV6KnBxxHu3OWAArtC2lPyPqTA0Vc/ASsQkAnd3xe3J1zsoQ8gJyrS1
 +kMo9OPEQ4236bnZyF0bPvOou4yFYU22Eduv2F0Kg7k1vUMwPva3cFY9roj6wizF0Lwl
 7bdRbXfBPC+BI4mZ+zrdfCQapGvlr8EdpRc/v+7Uz7OqQkxKYzal/Kh9TcLXcsS+Ep82
 kf7ySCBziO6Sl+Xb3wFjgYUKvRdVQNNBSdEuVCLEoYFYuasix+W7AHq5HJvz0SMR9eo5
 SPpQ==
X-Gm-Message-State: AO0yUKWUOYdxGKSOdFFk5eW3hmbPl6xcAyihDrjVxT4if44K0Ei3R+or
 18lpmNY/vubXUbxOz0JpVs5PLA==
X-Google-Smtp-Source: AK7set9jBAhoAGdr9YEgXilXKzYkJYc9rKsEqgzpvKM2wFZ6xEwrl0WQ6MUxxtqkOnra1orwmP2bHA==
X-Received: by 2002:a05:6a20:c509:b0:db:520c:430a with SMTP id
 gm9-20020a056a20c50900b000db520c430amr22704804pzb.38.1680184987151; 
 Thu, 30 Mar 2023 07:03:07 -0700 (PDT)
Received: from rhel9-box ([203.163.242.253])
 by smtp.googlemail.com with ESMTPSA id
 j26-20020aa7929a000000b0062c0c3da6b8sm11299417pfa.13.2023.03.30.07.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 07:03:06 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 30 Mar 2023 19:32:59 +0530 (IST)
To: "Michael S. Tsirkin" <mst@redhat.com>
cc: Ani Sinha <ani@anisinha.ca>, Eric DeVolder <eric.devolder@oracle.com>, 
 shannon.zhaosl@gmail.com, imammedo@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, 
 pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net, 
 boris.ostrovsky@oracle.com
Subject: Re: [PATCH 0/2] hw/acpi: bump MADT to revision 5
In-Reply-To: <20230330094323-mutt-send-email-mst@kernel.org>
Message-ID: <366bb156-f41f-e1c4-fc59-3ecca6eeaba7@anisinha.ca>
References: <20230328155926.2277-1-eric.devolder@oracle.com>
 <20230329010406-mutt-send-email-mst@kernel.org>
 <96144a1b-efa7-ecc2-3e35-56825fcf48c6@oracle.com>
 <20230329124442-mutt-send-email-mst@kernel.org>
 <68579d53-cbb5-154a-6c1e-e733f16540@anisinha.ca>
 <20230330094323-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On Thu, 30 Mar 2023, Michael S. Tsirkin wrote:

> On Thu, Mar 30, 2023 at 01:06:36PM +0530, Ani Sinha wrote:
> >
> >
> > On Wed, 29 Mar 2023, Michael S. Tsirkin wrote:
> >
> > > On Wed, Mar 29, 2023 at 08:14:37AM -0500, Eric DeVolder wrote:
> > > >
> > > >
> > > > On 3/29/23 00:19, Michael S. Tsirkin wrote:
> > > > > Hmm I don't think we can reasonably make such a change for 8.0.
> > > > > Seems too risky.
> > > > > Also, I feel we want to have an internal (with "x-" prefix") flag to
> > > > > revert to old behaviour, in case of breakage on some guests.  and maybe
> > > > > we want to keep old revision for old machine types.
> > > > Ok, what option name, for keeping old behavior, would you like?
> > >
> > > Don't much care. x-madt-rev?
> > >
> > > > >
> > > > >
> > > > > On Tue, Mar 28, 2023 at 11:59:24AM -0400, Eric DeVolder wrote:
> > > > > > The following Linux kernel change broke CPU hotplug for MADT revision
> > > > > > less than 5.
> > > > > >
> > > > > >   commit e2869bd7af60 ("x86/acpi/boot: Do not register processors that cannot be onlined for x2APIC")
> > > > >
> > > > > Presumably it's being fixed? Link to discussion? Patch fixing that in
> > > > > Linux?
> > > >
> > > > https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devolder@oracle.com/T/#t
> > >
> > > Great! Maybe stick a Link: tag in the commit log.
> >
> > If the original bug is in the kernel and kernel upstream has accepted both
> > your fix and Mario's patch on the acpi revision mess, I see no urgency to
> > fix this in QEMU.
> >
> > Maybe we can address this in the 8.1 development window.
>
> Why "maybe"? Eric is working on a patch I don't see why we won't
> address it.
>

I am not opposed to addressing it. I just think it might be too risky for
8.0 given that we are already past the hard feature freeze date.

