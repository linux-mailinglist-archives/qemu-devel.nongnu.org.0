Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C9E34581B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 08:02:53 +0100 (CET)
Received: from localhost ([::1]:50644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOb3y-0001K2-3Q
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 03:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lOb1v-0000V8-R4
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 03:00:43 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:38894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1lOb1t-00078S-Az
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 03:00:43 -0400
Received: by mail-io1-xd2d.google.com with SMTP id e8so16614493iok.5
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 00:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lbg2A/CJ6usy/ccxkVDPwpLxllfsa/WysFRdXWARbIY=;
 b=NvtwXSsltI23KV6anotjLnIuK4BgE5iuiktv0/ezG1ryYA89B097k6TD0vmUOKHZ5H
 UGo6t7H9bR4VxBCpzJtjbFPXimypDIM3EG9j3otL0JvRSuk/qcMeymOG2XxztBiRBCIN
 u5fhQ+xLH5Yd5dT0mQgfbqse1PsNbbaayBMovlvDl5axzqdjJcmwcw25HPn85PrGqdw2
 sNkT9GPJwIkGIsKyU5AX9u02T/l5fvyieN/O/lO0a/DUcXVAlNtb8qznQkGpg25hjE7f
 xBzG3ZsW5EWvV9+LNUgKsHkcaL6xo+okxaPSN3SZUU8iWnSMG/HlHdsqBf4I97qXZaSJ
 9Bzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lbg2A/CJ6usy/ccxkVDPwpLxllfsa/WysFRdXWARbIY=;
 b=oR56jrAu39IMIY+SoPnvURyccC/QQQ26EehvC1Zx4qydDKKluucWV9Db6ML21FqLxE
 t//nuF4WTIfOdIXpw+O1o5oAedK+3+MexRUQy3xoI4r0I4YRM1PFQVYKFX9pG50ON7gA
 TYwfOSJGt5Hu7KKYAZBxfJZTesXMfenVAwbzC+K4GoJXkdN9et+v1OlS1FgvVMZdpKni
 BPx3s0YpsXwMuuzQq2b9nsHiCMGP9LyM8rRrxAjsN04cahpRCOIZDoe7setyS0D7zVGb
 mKbK8W+MdyltGIWwMCqqMWu135ShTzp76VHtiJb46U3TTOY/9nHtFulQoD8grhejHr5M
 z5lA==
X-Gm-Message-State: AOAM531uHk+RqGisBRGD9PCDKk42+nblNcydym8P5OITkeT5aFw0CEIJ
 dcYcyXosTjC889vKvo5IZ9M7oRbG1ai+rWTmbAbD
X-Google-Smtp-Source: ABdhPJwO04C9h1lGEEp4ffqEEiUlH+d/lwPV5LkchcJqrencjMXOFrhFtU/D8JKhJ0TYPCsSidPn5OjbuGmQKykDQq8=
X-Received: by 2002:a5d:850c:: with SMTP id q12mr3183304ion.13.1616482840016; 
 Tue, 23 Mar 2021 00:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616052889.git.haibo.xu@linaro.org>
 <4b35e1dc2c6a2af117542eca6571ddf1e261fe10.camel@redhat.com>
 <20210322163238.kkuvtvmqeb437cke@kamzik.brq.redhat.com>
In-Reply-To: <20210322163238.kkuvtvmqeb437cke@kamzik.brq.redhat.com>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Tue, 23 Mar 2021 15:00:29 +0800
Message-ID: <CAJc+Z1GHx_KWB_U1PUEkuVnfTq-1nHJ6cNhrUdw9SLeo_hFK5Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] target/arm: Add nested virtualization support
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=haibo.xu@linaro.org; helo=mail-io1-xd2d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrea Bolognani <abologna@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 pbonzini@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Mar 2021 at 00:32, Andrew Jones <drjones@redhat.com> wrote:
>
> On Mon, Mar 22, 2021 at 04:42:23PM +0100, Andrea Bolognani wrote:
> > On Mon, 2021-03-22 at 10:07 +0000, Haibo Xu wrote:
> > > This series add support for ARMv8.3/8.4 nested virtualization support
> > > in KVM mode. It's based on Marc Zyngier's kernel KVM patches[1], and
> > > has been tested on a FVP model to run a L2 guest with Qemu. Now the
> > > feature can be enabled by "-M virt,accel=kvm,virtualization=on" when
> > > starting a VM.
> >
> > Why the need to enable this explicitly? AFAIK, that's not necessary
> > for any other architecture: on x86, you just need to make sure you're
> > using '-cpu host' and pass a parameter to the kernel module.
> >
> > Even assuming this can't be enabled transparently, wouldn't its
> > availability it be controlled by a CPU feature flag, similar to what
> > already happens for SVE and PMU, rather than a machine type option?
>
> I 100% agree. We should control this feature with a CPU feature property.
> NV is a CPU feature, after all. Also, we should add it to the properties
> that we can probe in cpu_model_advertised_features[].
>

Thanks so much for the comments!

Yes, NV should be a vCPU feature, just as the kernel macro
KVM_ARM_VCPU_HAS_EL2 implies.
To implement it as a VM feature here just want to reuse the codes in
TCG mode which emulate a
guest CPU with virtualization extension support.

I will change the NV in KVM mode to a vCPU feature in  the next version.
@Peter Maydell and @Richard Henderson, shall we change that in TCG mode as well?

Thanks,
Haibo

> Thanks,
> drew
>
> >
> > That would also address the discoverability issue: unless I'm
> > mistaken (which I very well might be :), with the current
> > implementation there's no way to tell whether nested KVM will be
> > usable short of trying and seeing whether QEMU errors out.
> >
> > --
> > Andrea Bolognani / Red Hat / Virtualization
> >
> >
>

