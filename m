Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C4D4C2C25
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 13:52:08 +0100 (CET)
Received: from localhost ([::1]:40108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNDbJ-0002DV-T7
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 07:52:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nNDUW-0008Uc-NU
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:45:04 -0500
Received: from [2a00:1450:4864:20::636] (port=40609
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nNDUG-00005n-SC
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:45:04 -0500
Received: by mail-ej1-x636.google.com with SMTP id p15so4059503ejc.7
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 04:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5o8gKgjWpTsIxM8u6sDsnd+yEytRUV6wJ3zErbHXO74=;
 b=UjyqmeNsGFO8dfxNB98iTypLJEEsTOP0W6SW/McnGrP7YPWEuT0YGpyDDql6u9z5I8
 op13kyReqd2P9ekFkT5h320YGN2jWNW0awUyiqAo2voElZcVYIWJ927Ywa2rt6dQt7Xu
 IcP5zmGIT1iqu4iZGZz336ZJs6771aitLbQbyfcpiN5fJyjJkcqhrMbQ7HdlUUVeFNyB
 luHNSDRAR00DJnVt0qRLKtHhaJp4M5zm0N+vQoQP95bsxut4rdhvdbsXCP5oysfW3DOJ
 6YfrIB1ywa08zIKw+DyPWRlo2/oP+6I5tRQbY7Gy1HpxXvLPtksIR51jeddMv1bjrSIx
 k2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5o8gKgjWpTsIxM8u6sDsnd+yEytRUV6wJ3zErbHXO74=;
 b=jVsXNeyfRIr5lbhmvq3eGeRHVlOl6rSMtcwRUDtfmh+komdS9o6hg3i0twlmOyzWjz
 VdsGGCW+LBWDGNBTtlu7m1fSPFT4S3SQVjH4jMY1ngBIAcp6PjtdMusXvlRiD2pXTl+i
 aBbWkcF1MPW9N3JmH+233rnEcyKpWrIcNYhDHRNORnaNmQqlA1zgS0S9Iw7mTsRWY1cD
 CNeFaq5HvTfjYW9IVkyXI62lP6HleEe0aocxf04Nk3+CQfe+JF5EYumQaXD6oQsaC4SZ
 RjrHIvXJcUyQknn4g88OB8y6ITlvToAqiCrvOZY0ZKJ1ESj501o4f61mC2nqlfkSWdIc
 aZxg==
X-Gm-Message-State: AOAM530gz7D8w1gx5gKQIqthht8hIHAAdA1cBfYBfRBpTi6i8PTRvI5u
 UmvvI+G4AJbpE4PkUYt4VnhhXMRqRNgQ8bdJHfoDuA==
X-Google-Smtp-Source: ABdhPJwlgZRP3j3Vzt8+AZmlgUGRRjy4UlyH4qWLuFVXcCcuyu+YxgpUivEnfrxSqmd0Odc7WYXYPKTYCKKFWMIAQP8=
X-Received: by 2002:a17:906:a85:b0:6d0:827a:89d0 with SMTP id
 y5-20020a1709060a8500b006d0827a89d0mr2169531ejf.230.1645706686945; Thu, 24
 Feb 2022 04:44:46 -0800 (PST)
MIME-Version: 1.0
References: <20220210132822.2969324-1-ani@anisinha.ca>
 <20220223100410.756ffe35@redhat.com>
 <CAARzgwxXAn83xE80o8+YNUeQJVn6NdtAGjC0e+KjEgbYAQaUkw@mail.gmail.com>
 <20220224100345.2bdfc9d9@redhat.com>
In-Reply-To: <20220224100345.2bdfc9d9@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 24 Feb 2022 18:14:35 +0530
Message-ID: <CAARzgwyTsbpxHAko9iLE1RSeuJCAEvRywdQ25e93oLkvSWP8GA@mail.gmail.com>
Subject: Re: [PATCH] hw/i386/pc: when adding reserved E820 entries do not
 allocate dynamic entries
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::636;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x636.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 kraxel@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 24, 2022 at 2:33 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Wed, 23 Feb 2022 17:30:34 +0530
> Ani Sinha <ani@anisinha.ca> wrote:
>
> > On Wed, Feb 23, 2022 at 2:34 PM Igor Mammedov <imammedo@redhat.com> wrote:
> > >
> > > On Thu, 10 Feb 2022 18:58:21 +0530
> > > Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > > > When adding E820_RESERVED entries we also accidentally allocate dynamic
> > > > entries. This is incorrect. We should simply return early with the count of
> > > > the number of reserved entries added.
> > >
> > > can you expand commit message to explain what's wrong and
> > > how problem manifests ... etc.
> >
> > The issue has been present for the last 8 years without apparent
> > visible issues. I think the only issue is that the bug allocates more
> > memory in the firmware than is actually needed.
>
> let me repeat: Why do you think it's an issue or why it's wrong

Allocating more memory than what we need unnecessarily bloats up the
rom. We should not be allocating memory that we do not use.

>
> >
> > >
> > > >
> > > > fixes: 7d67110f2d9a6("pc: add etc/e820 fw_cfg file")
> > > > cc: kraxel@redhat.com
> > > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > > ---
> > > >  hw/i386/e820_memory_layout.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/hw/i386/e820_memory_layout.c b/hw/i386/e820_memory_layout.c
> > > > index bcf9eaf837..afb08253a4 100644
> > > > --- a/hw/i386/e820_memory_layout.c
> > > > +++ b/hw/i386/e820_memory_layout.c
> > > > @@ -31,6 +31,8 @@ int e820_add_entry(uint64_t address, uint64_t length, uint32_t type)
> > > >          entry->type = cpu_to_le32(type);
> > > >
> > > >          e820_reserve.count = cpu_to_le32(index);
> > > > +
> > > > +        return index;
> > > >      }
> > >
> > > this changes e820_table size/content, which is added by fw_cfg_add_file() to fwcfg,
> > > as result it breaks ABI in case of migration.
> >
> > Ugh. So should we keep the bug? or do we add config setting to handle
> > the ABI breakage.
> >
>

