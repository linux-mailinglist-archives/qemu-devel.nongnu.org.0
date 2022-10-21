Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6B3607A17
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 17:06:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oltbN-0003Wh-SF
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 11:06:26 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oltbJ-0004Yd-Gl
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 11:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oltb7-0003VK-1A
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 11:06:12 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oltao-0007ba-Ux
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 11:06:07 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1364357a691so3865892fac.7
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 08:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G57491iJaMGJGKq388gYKT+4zOaOZ4NFLYMgzywSLRo=;
 b=G0I4uqi1YC22wVhndjEsIVOXKQwjCvDsgqpfBzpgm4UTllw3WcMCunCZoNqsPLeUS6
 TPGmET9RtL1LfJdONlYAJok1rIcUkIbc+Juw5jztKjam6age04XDubETZRld4oigpS7u
 Who656/n3a9NTJXQXz2DVwzINkJAjhO+0UDV5Nnzkta4E9WYendhy/cyXC8w//aXMZD/
 7DrKMm2qjkJviKIiER0QcMdxsOp/a3SaqyO+qwmQH97OzCMxrS8XRICQvG5RcNxcAUJP
 A9EaMaGgAu5JdHLsd/XLp1lJCbKFGc32sHeNTQmRddLCCiHDy32sE2c+IlOsPMIcrhH2
 lScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G57491iJaMGJGKq388gYKT+4zOaOZ4NFLYMgzywSLRo=;
 b=F4r0ZT8OUNQoMCfqRLyiQn4r5a84305th3f73w3+qUzERA613nyLXjaPy86DYvVSm3
 vSLmvwVYZjNI9AK6PAdQexE0wmdcBH+Njcw4z/AEWqMUbMfDn736i724S6Bz9EIRaT1I
 tQzv62wgc2uhq1Hfma69xrU8i7tH+XO27XfVScZ4KrrHcgxfXaE0z/mINS+x0d7cJMdr
 x/hoS5QiHIHISuP0STG82Eyuu/0+aKTlZen2hICxqd9nOuXwPJ+/vLieBEOTrlaDXeJp
 FJNPxTcSPBMTI0HvGJBNrUFplRw+KPbpd99QD70YSWfzUX/mDZYh0yoOU5Um3aMmpVtJ
 3CtA==
X-Gm-Message-State: ACrzQf3WtoWOvNp8dNggTe60v1zFkQOOz+66RK3G8hHKcrlytoxfB+oT
 qxnTjUO5RFoNrawGPTW/k0pi82lmuhWTpB7LF9TnkhJVtjs=
X-Google-Smtp-Source: AMsMyM6iLfK2AfBVCV3vdFfmlusZndRcJ/CF+qPDrpHG8YCbd3PSUKQnrEGrDtG71kqdSDMkgQLlpMJNR05KmIYhhI0=
X-Received: by 2002:a17:90b:4b8e:b0:20a:f240:9b23 with SMTP id
 lr14-20020a17090b4b8e00b0020af2409b23mr22806194pjb.19.1666364738899; Fri, 21
 Oct 2022 08:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221004093206.652431-1-berrange@redhat.com>
 <20221004093206.652431-4-berrange@redhat.com>
 <d51ca4c0-6115-7ed3-a6be-dec67bdbfdb0@vivier.eu>
 <CAFEAcA-GSKzEwPnjzBw0tn4G6+uRHRL1dDmvAiiYUb1YVo8T4Q@mail.gmail.com>
 <Y1Kxv6djOygcZCuk@redhat.com>
In-Reply-To: <Y1Kxv6djOygcZCuk@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Oct 2022 16:05:27 +0100
Message-ID: <CAFEAcA8oxBaV-gdKncKEjAdWJQkSLOoWXf3Kz280PruFQj0veQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] meson: enforce a minimum Linux kernel headers version
 >= 4.18
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org, 
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 21 Oct 2022 at 15:50, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Fri, Oct 21, 2022 at 03:38:38PM +0100, Peter Maydell wrote:
> > On Fri, 21 Oct 2022 at 15:30, Laurent Vivier <laurent@vivier.eu> wrote:
> > >
> > > Le 04/10/2022 =C3=A0 11:32, Daniel P. Berrang=C3=A9 a =C3=A9crit :
> > > > Various areas of QEMU have a dependency on Linux kernel header
> > > > definitions. This falls under the scope of our supported platforms
> > > > matrix, but historically we've not checked for a minimum kernel
> > > > headers version. This has made it unclear when we can drop support
> > > > for older kernel headers.
> > > >
> > > >    * Alpine 3.14: 5.10
> > > >    * CentOS 8: 4.18
> > > >    * CentOS 9: 5.14
> > > >    * Debian 10: 4.19
> > > >    * Debian 11: 5.10
> > > >    * Fedora 35: 5.19
> > > >    * Fedora 36: 5.19
> > > >    * OpenSUSE 15.3: 5.3.0
> > > >    * Ubuntu 20.04: 5.4
> > > >    * Ubuntu 22.04: 5.15
> > > >
> > > > The above ignores the 3rd version digit since distros update their
> > > > packages periodically and such updates don't generally affect publi=
c
> > > > APIs to the extent that it matters for our build time check.
> > > >
> > > > Overall, we can set the baseline to 4.18 currently.
> > >
> > > As this change affects entire QEMU build, I'd prefer to have some "Ac=
ked-by" before merging it via
> > > linux-user branch.
> >
> > I still think we should be more conservative about kernel header
> > requirements than we are for other dependencies.
>
> How much more though ?  What other distros do we want to target that
> we don't already cover with our targetted platforms  ?

I don't want to target them. I just don't want to leave them
completely stuck. I think system headers are significantly
different from just needing to build a local version of some
dependency library.

Alternatively if we really need recent kernel headers to build
linux-user then we should come up with some scheme for using
a local copy of the relevant headers, as we do for KVM...

-- PMM

