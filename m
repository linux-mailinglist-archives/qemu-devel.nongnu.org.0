Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E2E4A6740
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 22:47:30 +0100 (CET)
Received: from localhost ([::1]:56110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF0zp-0002pn-Mj
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 16:47:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nExGB-00082y-EW
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:48:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nExG8-0003cb-DF
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 12:48:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643737683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ip7aZiJAmcno+tG7bGGEtATq+FcPl1+Pf7aelUnURzY=;
 b=V6v6jgA+kdN2sXdVZCvLaMOzBzlBLesMxNGK2LXRQwjfPkZGHey6ji/3JiJSFQAE+HXbmh
 mB0Q8f4tgoRDZrNrq8EoKSdp3cnrvK7ERn2bNhAwVKRjx7z+ucrHqOVgDCMPsZk3B9Fuqv
 ugkgO5XzGp9oFbPnIiZlg3K0F5yvUtE=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-Vin6NsgKMo6x_YSmEQ4FbQ-1; Tue, 01 Feb 2022 12:48:00 -0500
X-MC-Unique: Vin6NsgKMo6x_YSmEQ4FbQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 q19-20020ab04a13000000b002fef2f854a6so9183538uae.7
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 09:48:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ip7aZiJAmcno+tG7bGGEtATq+FcPl1+Pf7aelUnURzY=;
 b=JnH2MZUoCIERVMNy5H2e95EM7/ndjDrmbq4P+lyLP7FW5szXa+gv/g8VcFiADcRXpt
 ra/q4k6UeuqsNRks9eJT60tInhQVjbHGb8S0dwYWq6w0ucY2ws1qNVSOK+eW7Eta+LMF
 QTZzNI6ceiKVLiy8jh+PmFjNRzERNZXogdNYevTdDbjJSYmF/8ZM3YCVqzounqAnMkpw
 N/Ey+Wr+7rB5EZ+fxdYhp3/XAsuOv1jj7mcT7J/I0mjbMPA9loars+LR0PjOmRvhtqKK
 TK5L6sjt9Inh5VhOY54cgn2kK5/gMY0MTNS+e0rKsbwStP+MSkg7M9C79psoaNWvQOpD
 g/hw==
X-Gm-Message-State: AOAM5318QRtGt7GRvdaGxvMyKsXgLYRSvVl5KAvLhzRK/VSOY6RCoNFP
 XO/k9PmplyVZHL+aFbs0UXmyCTOx4A5uX7hLlsk61RpR6ZSPlbEneRDjX5+AdUC6+JHYv409ypA
 MvZNxXLrIBjwxteBXWaQvHSIm2fO/f0E=
X-Received: by 2002:a67:b10b:: with SMTP id w11mr10062614vsl.75.1643737679514; 
 Tue, 01 Feb 2022 09:47:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkrWiKYwaqw5WUqFqbiURidZQ8MYVx0bWObGbUlLnd7iKcy7aOv6VhBRisSCOBWB19efQxISfrrg0eqXSUPH0=
X-Received: by 2002:a67:b10b:: with SMTP id w11mr10062601vsl.75.1643737679276; 
 Tue, 01 Feb 2022 09:47:59 -0800 (PST)
MIME-Version: 1.0
References: <87zgnp4b32.fsf@dusky.pond.sub.org>
 <CAFEAcA_kxrCgyxWPFLw6VZ-rKx-res0C8L2BWRvfB81cR+keLg@mail.gmail.com>
 <875yqd6zib.fsf@linaro.org> <YerPk2ABMHQf/3QP@redhat.com>
 <20220125092011.dq2t4ryl632vrvsf@sirius.home.kraxel.org>
 <20220201073139.7896e10b@elisabeth> <Yfj4ERdAvmCF4ZzY@redhat.com>
 <20220201112720.4ac9b8df@elisabeth> <87wnieygjp.fsf@linaro.org>
 <CA+bd_6JF5iRKufxVa=6TEtR-eH65iiiG-oarWRHkavX-3E-p1Q@mail.gmail.com>
 <Yfldie06h92qxqf3@redhat.com>
In-Reply-To: <Yfldie06h92qxqf3@redhat.com>
From: Cleber Rosa <crosa@redhat.com>
Date: Tue, 1 Feb 2022 12:47:48 -0500
Message-ID: <CA+bd_6Jnp846dL4FBUaduHGtnDJN29qQjSuS96V7aPS2iuqF0Q@mail.gmail.com>
Subject: Re: "make check-acceptance" takes way too long
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefano Brivio <sbrivio@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 1, 2022 at 11:20 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Tue, Feb 01, 2022 at 11:01:43AM -0500, Cleber Rosa wrote:
> > On Tue, Feb 1, 2022 at 6:25 AM Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
> > >
> > > We have up to now tried really hard as a project to avoid building an=
d
> > > hosting our own binaries to avoid theoretical* GPL compliance issues.
> > > This is why we've ended up relying so much on distros to build and ho=
st
> > > binaries we can use. Most QEMU developers have their own personal zoo=
 of
> > > kernels and userspaces which they use for testing. I use custom kerne=
ls
> > > with a buildroot user space in initramfs for example. We even use the
> > > qemu advent calendar for a number of our avocado tests but we basical=
ly
> > > push responsibility for GPL compliance to the individual developers i=
n
> > > that case.
> > >
> > > *theoretical in so far I suspect most people would be happy with a
> > > reference to an upstream repo/commit and .config even if that is not =
to
> > > the letter of the "offer of source code" required for true compliance=
.
> > >
> >
> > Yes, it'd be fine (great, really!) if a lightweight distro (or
> > kernels/initrd) were to
> > be maintained and identified as an "official" QEMU pick.  Putting the b=
inaries
> > in the source tree though, brings all sorts of compliance issues.
>
> All that's really needed is to have the source + build recipes
> in a separate git repo. A pipeline can build them periodically
> and publish artifacts, which QEMU can then consume in its pipeline.
>

I get your point, but then to acquire the artifacts one needs to:

1. depend on the CI system to deploy the artifacts in subsequent job
stages (a limitation IMO), OR
2. if outside the CI, implement a download/cache mechanism for those
artifacts, which gets us back to the previous point, only with a
different distro/kernel+initrd.

With that, the value proposal has to be in the characteristics of
distro/kernel+initrd itself. It has to have enough differentiation to
justify the development/maintenance work, as opposed to using existing
ones.

FWIW, my non-scientific tests booting on my 3+ YO machine:

* CirrOS x86_64+KVM: ~2 seconds
* CirroOS aarch64+TCG: ~20 seconds
* Fedora kernel+initrd aarch64+TCG
(tests/avocado/boot_linux_console.py:BootLinuxConsole.test_aarch64_virt):
~1 second

I would imagine that CirrOS aarch64+KVM on an adequate system would be
similar to the CirrOS x86_64+KVM.  We can develop/maintain a slimmer
distro, and/or set the default test workloads where they perform the
best.  The development cost of the latter is quite small.  I've added
a missing bit to the filtering capabilities in Avocado[1] and will
send a proposal to QEMU along these lines.

Regards,
- Cleber.

[1] https://github.com/avocado-framework/avocado/pull/5245


