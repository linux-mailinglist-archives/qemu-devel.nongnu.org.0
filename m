Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2F95B1AB6
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 12:56:48 +0200 (CEST)
Received: from localhost ([::1]:34430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWFDD-0001xY-MI
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 06:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oWFBi-0000ZM-2i
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 06:55:15 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:40679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oWFBd-00076E-38
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 06:55:13 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-324ec5a9e97so159777277b3.7
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 03:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=zFS7s/cEPD0Dhlv8vumt3JUR/FX6SVvqxEG7SQ8tMzo=;
 b=oD/H8ksoIV8AbYECgAReOcKMNQW0xjz1gEUL6aB1o/vPE222eRTsMJ+HP1NmxxwuA4
 MPQ/Hy9V/cdc+sNKtHBC2uCzF9APayxBGDNiVDasAErMPoxGyQbkjCdnTFeacniXzNXR
 UDu3CYPmQ8SA5ozTxX6Vq7a+mjcV/fSVF4CTJXKvHl5h2a0W83OJ/ZoVWaD7MhXqcLBf
 okzL5rw/SFOXXXnI6lSpBfwPaYnWoDbkuFyy3sqCdcVwwo7XN7QL8O1qyDm018rU/oTg
 9RV3zlcoKj8aIBKBG0FwpGHsyP+LAU6Tr0+Omag/eCRHq4XxhJSSBTsIfHy0DBUiSoBt
 1Jiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zFS7s/cEPD0Dhlv8vumt3JUR/FX6SVvqxEG7SQ8tMzo=;
 b=HlebqC9W6asUW8AFMeJ0VI2hTRv0vbAv3g8lR1ZfMjxYnkux9J9w1wx2j7decmL7IM
 q9hvyOZCdPtH2yS7ncu9lvkRD2r1uJhd12Z66qggwQ+JdH7P4vN+WkXCI7Oa9jdEfx+h
 YFfmSBJGMiWzGzt8LYfZ7owCVw994CBVA6x2ExyCAbCo09FbwGv7mVNlaFvTK+pzZo6H
 6euz/y9LuwLqzQpl0mdyJH0eUcuVLSRezYAuyXnMTb4yGgiEyuUHUJjOb5BZv2nHNv0/
 yhP/CUkx0FjRhH5t4/ojqGLuKTUFY6DmZdOXYrO1osRw/7fQVvaSDHUn+tO4UnE0pEOU
 YUuQ==
X-Gm-Message-State: ACgBeo2StokoddkzKB+bvoomYw00JRHrF4hh3FR3OvRKvkTtRJ6SJwu3
 9cqeQUd3rAdE6Pik85Xo4Dlh8q+rf+/o0S5kxcA+Ug==
X-Google-Smtp-Source: AA6agR5JM/W4fpcpCVvfyLc+ceulQ4f0p+jdr5j6inREuh0twFmS6ueROMVaqrtB3ctVm0GXw3ie/8EWvUNWSjdapjI=
X-Received: by 2002:a0d:fd05:0:b0:329:3836:53ac with SMTP id
 n5-20020a0dfd05000000b00329383653acmr7030518ywf.455.1662634506975; Thu, 08
 Sep 2022 03:55:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220908080749.32211-1-chenyi.qiang@intel.com>
 <20220908080749.32211-3-chenyi.qiang@intel.com>
 <CAFEAcA9J1mPL2Uj2yRhcpUq-Bg=G1o8V8q8n=7frAvMeT6_GRg@mail.gmail.com>
 <YxmxVuYq2vqFgvqK@redhat.com>
In-Reply-To: <YxmxVuYq2vqFgvqK@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Sep 2022 11:54:56 +0100
Message-ID: <CAFEAcA_wuKOTZN4u-Um4ya6_Ca7AnT-PW1nogrnwxUwfa6q6yQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] configure: Add -Wno-gnu-variable-sized-type-not-at-end
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Chenyi Qiang <chenyi.qiang@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, 8 Sept 2022 at 10:09, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Thu, Sep 08, 2022 at 09:53:44AM +0100, Peter Maydell wrote:
> > On Thu, 8 Sept 2022 at 09:08, Chenyi Qiang <chenyi.qiang@intel.com> wro=
te:
> > >
> > > After updating linux headers to v6.0-rc, clang build on x86 target wo=
uld
> > > generate warnings like:
> > >
> > > target/i386/kvm/kvm.c:470:25: error: field 'info' with variable sized
> > > type 'struct kvm_msrs' not at the end of a struct or class is a GNU
> > > extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
> > >         struct kvm_msrs info;
> > >                         ^
> > > target/i386/kvm/kvm.c:1701:27: error: field 'cpuid' with variable siz=
ed
> > > type 'struct kvm_cpuid2' not at the end of a struct or class is a GNU
> > > extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
> > >         struct kvm_cpuid2 cpuid;
> > >                           ^
> > > target/i386/kvm/kvm.c:2868:25: error: field 'info' with variable size=
d
> > > type 'struct kvm_msrs' not at the end of a struct or class is a GNU
> > > extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
> > >         struct kvm_msrs info;
> > >                         ^
> > >
> > > Considering that it is OK to use GNU extension in QEMU (e.g. g_auto s=
tuff),
> > > it is acceptable to turn off this warning, which is only relevant to =
people
> > > striving for fully portable C code.
> >
> > Can we get the kernel folks to fix their headers not to
> > use GCC extensions like this ? It's not a big deal for us
> > I guess, but in general it doesn't seem great that the
> > kernel headers rely on userspace to silence warnings...
>
> The kernel headers are fine actually - it is C99 compliant to have
> a unsized array field in structs. eg
>
> The problem is in the QEMU code which is taking the kernel declared
> struct, and then embedding it inside another struct. e.g. the
> kernel exposes:
>
>   struct kvm_msrs {
>         __u32 nmsrs; /* number of msrs in entries */
>         __u32 pad;
>
>         struct kvm_msr_entry entries[];
>   };
>
> which we then use as:
>
>   uint64_t kvm_arch_get_supported_msr_feature(KVMState *s, uint32_t index=
)
>   {
>     struct {
>         struct kvm_msrs info;
>         struct kvm_msr_entry entries[1];
>     } msr_data =3D {};

Hmm, and the kernel used to define the 'entries' field as 'entries[0]',
which is the GNU 'zero-length-array' extension. So the kernel has
switched to the C-standard-defined flexible array member. Those
(unlike the GNU zero-length-array) have some extra restrictions
like this "can't put the struct into another struct" one. So
effectively we've moved from a GCC extension that clang doesn't
complain about to one that it does complain about.

> IOW, our locally defined struct is just there to force a stack
> allocation large enough for 1 kvm_msr_entry. A clever trick, but
> requires that we turn off the CLang portability warning

I guess that's the most reasonable thing. Might be worth
expanding on some of this in the commit message, though.

Also, this patch disabling the warning needs to come before
the patch where the headers are updated; otherwise this will
break bisection with clang.

thanks
-- PMM

