Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBC54BC8C4
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 14:56:29 +0100 (CET)
Received: from localhost ([::1]:53220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLQDr-0006jC-OZ
	for lists+qemu-devel@lfdr.de; Sat, 19 Feb 2022 08:56:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nLQB2-0005Lm-QR
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 08:53:33 -0500
Received: from [2607:f8b0:4864:20::234] (port=41763
 helo=mail-oi1-x234.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nLQAQ-0006lx-MA
 for qemu-devel@nongnu.org; Sat, 19 Feb 2022 08:53:32 -0500
Received: by mail-oi1-x234.google.com with SMTP id ay7so6112994oib.8
 for <qemu-devel@nongnu.org>; Sat, 19 Feb 2022 05:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=r8JotbY5i2w4Zt7zHBdThDre/U54uU8dSMK/7cc5hDo=;
 b=WE2uYkM2JntWwiDSJJmhmd4Rj3IylEredf0S7nyvKMKChoyDQ+tBi4OUjY71VnQkpr
 O0Dh5pKyFf7c2dbVcTMvjASSYwTRVKFuaz7Y47ABnQS60FmGE1ZSKgVafiAaNWFruKPE
 2IQoOHgwzahbMl4OsuUGHlhsr2Em+CAy0YeBnYV0PPUQaEMatQ4bQsJ8MwYq/2lWKyyG
 IUrIT4jStezKaAyBVEdU7qa4o429jtCQphjFcP5kyibZDITah7WBvcPyztBX1DEfE1DX
 8wsQp3gO153afwhFCAJN1Z4Y5niyBrHF2b4pVV6+IXFdmqu8ze4vICPIeqpfgMyviZg6
 BvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=r8JotbY5i2w4Zt7zHBdThDre/U54uU8dSMK/7cc5hDo=;
 b=kXlqkkRLCHiO56UmJbOoDAkQ5mJey7MKsHT/hJNol/IUffsTY/CpHtkQvlBYPl9cZX
 WBmbSUrTnLmoh6VyAnWu2E3mSvyYR9EZvfnb7sdQ3JfH1jFknxPly9/E3fI5EjbO6nwd
 CqpaBZ7wv1QL+3VKsvFqrCs2B0oaT8Kk5hpZavny82xJfDMt+wbeF/Wd5h6ioxXPHDQk
 sh82ifY6nZ7Aq0dbJicg/syB0Hi5k9Md/KF6BGDqgviNFtEzQzFq3lDH+KLO+6P+Roqa
 m7gV4lGJb2YO90SLcKPDp9Q240qhe2pBYzzPOct2Dcv4eeMgW/TRQhTVcet+Gj5CbvI8
 zMxg==
X-Gm-Message-State: AOAM530G9UlIUf3QrSpR5Yq79HPCNDSOXYw98yPlUjGAt2G4itVcKL6L
 1djtP8OKMu0r7gRaA2KhWRfMi1nPn5CQuQULKspR+ZCC
X-Google-Smtp-Source: ABdhPJzSmBwPqNDaIwav1DndGpgFXRQ2Hr/qn6Nad+yEtKdwLOkKZXRxvB6NKhUuJKL3XpVPfRTBd9RsXcsz6qSLdks=
X-Received: by 2002:a17:90a:d3d0:b0:1bb:f5b3:2fbf with SMTP id
 d16-20020a17090ad3d000b001bbf5b32fbfmr2977553pjw.87.1645278388162; Sat, 19
 Feb 2022 05:46:28 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
 <f7dc638d-0de1-baa8-d883-fd8435ae13f2@redhat.com>
 <bf97384a-2244-c997-ba75-e3680d576401@redhat.com>
 <ad4e6ea2-df38-005a-5d60-375ec9be8c0e@redhat.com>
In-Reply-To: <ad4e6ea2-df38-005a-5d60-375ec9be8c0e@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sat, 19 Feb 2022 13:46:16 +0000
Message-ID: <CAJSP0QVNjdr+9GNr+EG75tv4SaenV0TSk3RiuLG01iqHxhY7gQ@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::234
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=stefanha@gmail.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "libvir-list@redhat.com" <libvir-list@redhat.com>,
 =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, kvm <kvm@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Feb 2022 at 16:03, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 2/18/22 12:39, Michal Pr=C3=ADvozn=C3=ADk wrote:
> > On 2/17/22 18:52, Paolo Bonzini wrote:
> >> I would like to co-mentor one or more projects about adding more
> >> statistics to Mark Kanda's newly-born introspectable statistics
> >> subsystem in QEMU
> >> (https://patchew.org/QEMU/20220215150433.2310711-1-mark.kanda@oracle.c=
om/),
> >> for example integrating "info blockstats"; and/or, to add matching
> >> functionality to libvirt.
> >>
> >> However, I will only be available for co-mentoring unfortunately.
> >
> > I'm happy to offer my helping hand in this. I mean the libvirt part,
> > since I am a libvirt developer.
> >
> > I believe this will be listed in QEMU's ideas list, right?
>
> Does Libvirt participate to GSoC as an independent organization this
> year?  If not, I'll add it as a Libvirt project on the QEMU ideas list.

Libvirt participates as its own GSoC organization. If a project has
overlap we could do it in either org, or have a QEMU project and a
libvirt project if the amount of work is large enough.

Stefan

