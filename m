Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F596A83C4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 14:47:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXjGj-0002a7-FX; Thu, 02 Mar 2023 08:46:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXjGW-0002Wu-P0
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:46:36 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXjGU-0006fi-Pw
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:46:36 -0500
Received: by mail-pg1-x536.google.com with SMTP id q189so9781728pga.9
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 05:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677764792;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cM7TzUwUKWR4y9CA6zT0N19JDajlnCxNNv+rZjI3jU0=;
 b=RPEI9CIA+B2o7WiblhF5NPDc2nC/JJFNkzjuaz3rs4AI+lXgoTmWeAlxkCdEUYUyjI
 jWBbk7xN0lZmC5Ej5VVNA2Hjryx54P6FrHoxwrNdlC9Q9cUp4h3vNMnWFD5L4pYJCnOk
 1Ia4+NiRDIgNbk8jL+YvDSHYyTwlRHD7T1RAfus+nOSBKfMLz2lVJ0jrTRqxA5g9oyl+
 ut8ECenWFn6vyoDsxkJXlJp1M8EV//zzbSDIyVHIorDINBvKxPdNbAU2O3MTLF8FXgP7
 OoXsyFApu5N/JXBMEeBT45cSX9QaKD3TT3VlFvPVMYNyFgzd347hI6VGybHxMuRsVOXF
 ZzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677764792;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cM7TzUwUKWR4y9CA6zT0N19JDajlnCxNNv+rZjI3jU0=;
 b=RdWFJGN70E+n0wSnX7mHs0buzpttEfpm+EMptoENTm04/biay9Wva/Gscr9AbOWqG7
 Iu9kDVzQLa7cr1pr5GUwpQtZw+rzHguv59+iwVlN7qAyWWldiFPGIPyy83xyMCjfn5nd
 ADzV/9tDXQ3j8vr4Cs40QBAF1Zo1ZsnObsEWavvjsPH6xLKVt3sdOwxNLQ8DnevLmtKn
 NA6xD9IOi2lxoNOccjOM524Xu8eweYrj0mTa9+O0upDQgTbAPUQYP/k1QwzT05JvdaTS
 wiPkl6Z3XvhKuw+6HZ6I7Eom5CjcF1nRX48PF0Q068u6nK/pYxUye0ZH4C6izTbTUjo5
 0+Gg==
X-Gm-Message-State: AO0yUKUetzcw7tGjgnsnm2D248LYIRP7fpO0PR6HtZ4YQEeZOmNMRcOY
 PCrYZW0f9uKLHnn90RoyGwyKgGf1L6osi46UfRl+aQ==
X-Google-Smtp-Source: AK7set/dl7f2rYmWWps//hBcKx4f/seag4m+W/Six6d6T6rlDaPFhRWNnbSLt73/CG8RFHanRYThvzelzG8uc51/18E=
X-Received: by 2002:a63:385e:0:b0:503:77ce:a1ab with SMTP id
 h30-20020a63385e000000b0050377cea1abmr1958699pgn.9.1677764792634; Thu, 02 Mar
 2023 05:46:32 -0800 (PST)
MIME-Version: 1.0
References: <20230228150216.77912-1-cohuck@redhat.com>
 <20230228150216.77912-2-cohuck@redhat.com>
 <CABJz62OHjrq_V1QD4g4azzLm812EJapPEja81optr8o7jpnaHQ@mail.gmail.com>
 <874jr4dbcr.fsf@redhat.com>
 <CABJz62MQH2U1QM26PcC3F1cy7t=53_mxkgViLKjcUMVmi29w+Q@mail.gmail.com>
 <87sfeoblsa.fsf@redhat.com>
In-Reply-To: <87sfeoblsa.fsf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2023 13:46:21 +0000
Message-ID: <CAFEAcA8z9mS55oBySDYA6PHB=qcRQRH1Aa4WJidG8B=n+6CyEQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] arm/kvm: add support for MTE
To: Cornelia Huck <cohuck@redhat.com>
Cc: Andrea Bolognani <abologna@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 kvm@vger.kernel.org, Eric Auger <eauger@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 1 Mar 2023 at 14:15, Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Wed, Mar 01 2023, Andrea Bolognani <abologna@redhat.com> wrote:
>
> > On Wed, Mar 01, 2023 at 11:17:40AM +0100, Cornelia Huck wrote:
> >> On Tue, Feb 28 2023, Andrea Bolognani <abologna@redhat.com> wrote:
> >> > On Tue, Feb 28, 2023 at 04:02:15PM +0100, Cornelia Huck wrote:
> >> >> +MTE CPU Property
> >> >> +================
> >> >> +
> >> >> +The ``mte`` property controls the Memory Tagging Extension. For TCG, it requires
> >> >> +presence of tag memory (which can be turned on for the ``virt`` machine via
> >> >> +``mte=on``). For KVM, it requires the ``KVM_CAP_ARM_MTE`` capability; until
> >> >> +proper migration support is implemented, enabling MTE will install a migration
> >> >> +blocker.
> >> >
> >> > Is it okay to use -machine virt,mte=on unconditionally for both KVM
> >> > and TCG guests when MTE support is requested, or will that not work
> >> > for the former?
> >>
> >> QEMU will error out if you try this with KVM (basically, same behaviour
> >> as before.) Is that a problem for libvirt, or merely a bit inconvinient?
> >
> > I'm actually a bit confused. The documentation for the mte property
> > of the virt machine type says
> >
> >   mte
> >     Set on/off to enable/disable emulating a guest CPU which implements
> >     the Arm Memory Tagging Extensions. The default is off.
> >
> > So why is there a need to have a CPU property in addition to the
> > existing machine type property?
>
> I think the state prior to my patches is actually a bit confusing: the
> user needs to set a machine type property (causing tag memory to be
> allocated), which in turn enables a cpu feature. Supporting the machine
> type property for KVM does not make much sense IMHO: we don't allocate
> tag memory for KVM (in fact, that would not work). We have to keep the
> previous behaviour, and explicitly instructing QEMU to create cpus with
> a certain feature via a cpu property makes the most sense to me.

This isn't really how the virt board does any other of these
properties, though: secure=on/off and virtualization=on/off also
both work by having a board property that sets up the board related
parts and also sets the CPU property appropriately.

I think having MTE in the specific case of KVM behave differently
to how we've done all these existing properties and how we've
done MTE for TCG would be confusing. The simplest thing is to just
follow the existing UI for TCG MTE.

The underlying reason for this is that MTE in general is not a feature
only of the CPU, but also of the whole system design. It happens
that KVM gives us tagged RAM "for free" but that's an oddity
of the KVM implementation -- in real hardware there needs to
be system level support for tagging.

thanks
-- PMM

