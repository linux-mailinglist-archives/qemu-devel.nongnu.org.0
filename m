Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0EB4C1270
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 13:08:28 +0100 (CET)
Received: from localhost ([::1]:51934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMqRW-0008Co-VH
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 07:08:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nMqKA-0005JH-AD
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 07:00:54 -0500
Received: from [2a00:1450:4864:20::52c] (port=42872
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nMqK8-0007X1-4s
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 07:00:49 -0500
Received: by mail-ed1-x52c.google.com with SMTP id i11so42054536eda.9
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 04:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q9kJsMl025djWNk+9lnX+zMTDWyxwGPEjeGARgOQfBU=;
 b=n9h3Q9rV9WY3vIi60OWndKR+8fHxef0Xf01/wlzyaC/rA9SrVmPEP1ELWBDfyOOWpv
 VQ+ECGqsgMrDAakkrHUFLm8ODoav0HNkB/pKDtBJp920kdXg8KKWMEP+D3H3jtdrZUoF
 AFN2RFZZA5lh/qcB22grRP5r7vUHzua1cLTsCh6whODz8vn2/Fnkvwz3SsAYAy+p4Gwz
 ELq0ZYtVw7CfCYt+DO8gVpNSrTzH9Unp+ymciN3epTMWHPy+Cgi88TLFnsV0/i81DnWu
 R1tp8u37bgiFGfcgBBV1Vc01CQFVjZ40t/ASt/x2W0eHVrdx6n4QocFpvf0HLn1YuMM4
 w9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q9kJsMl025djWNk+9lnX+zMTDWyxwGPEjeGARgOQfBU=;
 b=GnlPFMOyX/HV+NblsWhIICtQ10xPhYBVRrfJl4aNEuKzUgP1rEkJIKOXy82x4kpY7J
 ty7dIHGFAZHFmaNFSv8PLzkcZ0eNf6SImUKexGflPH1dRFjMB2SWhphnZnb2dfpfFAU0
 Y9mqyuI6s06Ir0opLk6PzpvCAaDBxwhWNBDU0m1KCPUKDoovvjRdXgHw85tivPBctXWm
 e72T+3kTHnlnAIAhIN+l2zFxrROilCBPuERxV05PL0d69zCbd4e7Nnh7Nje0HwN+vsEx
 Zs+H9AdfotLhSdWkWxo2PYsH3E0I6eylWUzPJc9EVK3A0LhvrfqVmzMnfOWgQBF/gtJZ
 Q8yQ==
X-Gm-Message-State: AOAM532B5ej6W8MnUcViqWu48GiXoX1XQ0/Fo7NZbL2rSJRojUu1I5eG
 MHfIO6RDXXTfb3gwsr7z0DaoPqwq4/CT6DC08aV0rw==
X-Google-Smtp-Source: ABdhPJxrLmF0e2U+hJ01u62ElgRrkozOjHzVVcILQFem3YV34/TK6zTt/jcAcqCSuikhJ4u126dJCPG6FW5FCy8K8M4=
X-Received: by 2002:aa7:d6c3:0:b0:40f:405a:fbf8 with SMTP id
 x3-20020aa7d6c3000000b0040f405afbf8mr30524718edr.447.1645617645152; Wed, 23
 Feb 2022 04:00:45 -0800 (PST)
MIME-Version: 1.0
References: <20220210132822.2969324-1-ani@anisinha.ca>
 <20220223100410.756ffe35@redhat.com>
In-Reply-To: <20220223100410.756ffe35@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 23 Feb 2022 17:30:34 +0530
Message-ID: <CAARzgwxXAn83xE80o8+YNUeQJVn6NdtAGjC0e+KjEgbYAQaUkw@mail.gmail.com>
Subject: Re: [PATCH] hw/i386/pc: when adding reserved E820 entries do not
 allocate dynamic entries
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::52c;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52c.google.com
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

On Wed, Feb 23, 2022 at 2:34 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Thu, 10 Feb 2022 18:58:21 +0530
> Ani Sinha <ani@anisinha.ca> wrote:
>
> > When adding E820_RESERVED entries we also accidentally allocate dynamic
> > entries. This is incorrect. We should simply return early with the count of
> > the number of reserved entries added.
>
> can you expand commit message to explain what's wrong and
> how problem manifests ... etc.

The issue has been present for the last 8 years without apparent
visible issues. I think the only issue is that the bug allocates more
memory in the firmware than is actually needed.

>
> >
> > fixes: 7d67110f2d9a6("pc: add etc/e820 fw_cfg file")
> > cc: kraxel@redhat.com
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >  hw/i386/e820_memory_layout.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/hw/i386/e820_memory_layout.c b/hw/i386/e820_memory_layout.c
> > index bcf9eaf837..afb08253a4 100644
> > --- a/hw/i386/e820_memory_layout.c
> > +++ b/hw/i386/e820_memory_layout.c
> > @@ -31,6 +31,8 @@ int e820_add_entry(uint64_t address, uint64_t length, uint32_t type)
> >          entry->type = cpu_to_le32(type);
> >
> >          e820_reserve.count = cpu_to_le32(index);
> > +
> > +        return index;
> >      }
>
> this changes e820_table size/content, which is added by fw_cfg_add_file() to fwcfg,
> as result it breaks ABI in case of migration.

Ugh. So should we keep the bug? or do we add config setting to handle
the ABI breakage.

