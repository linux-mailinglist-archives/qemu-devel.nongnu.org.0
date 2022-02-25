Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD874C46D6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 14:45:45 +0100 (CET)
Received: from localhost ([::1]:38814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNaul-0006fv-Ot
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 08:45:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nNa7y-0001X5-H4
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:55:18 -0500
Received: from [2607:f8b0:4864:20::534] (port=40828
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nNa7v-0000Yy-Da
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:55:18 -0500
Received: by mail-pg1-x534.google.com with SMTP id w37so4584762pga.7
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 04:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gIPLQIBAtfhj/PZ2de8eGc+4Cx/G/kGBx8Jr9LqiBb0=;
 b=fDAP+Nwn9ciayx9KZfqwqui1pYhSQpGSJlSxvgT1Yzb3tLAl4sMb9trsQ6OqwCUnFx
 RrDmtLtj4uvzuqE01e7MEXa/2kD0tObOPHSzpE5z89pDd9DDypKUCny+9/LJi9g+kTHr
 vcBIw/hN7hbgrRhtG+vacrPzeGn9racfx6pgy0RLowrgQq+jgzMp9P3sywd4KTaA7XY2
 dWQzDkfvVvRnBB2jwWg87y/9dYTJ3+WUQzhmuThLT/YyDNK1qWqI1bE3vDaJInCdG+8c
 5d1yGzMKqMl8FNaJdls3hBivGrbIf8mBxsfzq/0cGFK8WUWTO6ueKZ8kLKREupt2YRiK
 TO5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gIPLQIBAtfhj/PZ2de8eGc+4Cx/G/kGBx8Jr9LqiBb0=;
 b=Vve3YnwZHhgvm+5tDUmaWId/2NLMSX+oCb6iDmvTot/pJb/mOvrKPkOfUp0uqB708z
 +9xgB5+oDGvb1DseeE4qQOy3h2KJUf6FILE6ap59hBFXA4zr9dTw8008lq4R5WTLrxgk
 tNP+y4QvPq8cmsSaUis1ZmFlP8VKN+Hfb0lD8YjOZ0OF9uda6rovWrS/n6qw6nOC6dc4
 EeboRtzUVVM6pgDKbG4jcnHgllr7u8mm59gFdc3Fnuxsr6ntYBYcYTDCd4u3xX8kv9RD
 W2K1tRB6dwUiD9WCT6WFqzVDmC3aPnes4t/7GM4cNDnkHrYkf5D+4vPR9Lhglj6AbUdS
 XlFQ==
X-Gm-Message-State: AOAM531rku1TNieKufPSN506PPezA1/NuIg0RDQAV5Br93wsbEX15Smh
 aXM6IGihh9yT9JGn3qkQWjLWlh05GKwhnS7M+24=
X-Google-Smtp-Source: ABdhPJytViQsMNRFajL/A67mJyN7GKsWPE3xuJF8dakK0vzIBlv9S1hHUNGamdEqiOi+6exCZoyGDLhLZyy9qUVz4yA=
X-Received: by 2002:a63:a84f:0:b0:374:3bb7:6d7d with SMTP id
 i15-20020a63a84f000000b003743bb76d7dmr6145096pgp.608.1645793712110; Fri, 25
 Feb 2022 04:55:12 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
 <54dddcf5-85d7-5170-899e-589dd79a34fb@amazon.com>
In-Reply-To: <54dddcf5-85d7-5170-899e-589dd79a34fb@amazon.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 25 Feb 2022 12:55:01 +0000
Message-ID: <CAJSP0QXknCnbF-NmPM-dqKfs7M15L8S+ejTrWfe+9c4pVznaSA@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
To: Andreea Florescu <fandree@amazon.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=stefanha@gmail.com; helo=mail-pg1-x534.google.com
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sergio Lopez <slp@redhat.com>, kvm <kvm@vger.kernel.org>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, John Snow <jsnow@redhat.com>,
 Hannes Reinecke <hare@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Alex Agache <aagch@amazon.com>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 Paolo Bonzini <pbonzini@redhat.com>, gsserge@amazon.com,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Feb 2022 at 08:48, Andreea Florescu <fandree@amazon.com> wrote:
> On 1/28/22 17:47, Stefan Hajnoczi wrote:
> > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> >
> >
> >
> > Dear QEMU, KVM, and rust-vmm communities,
> > QEMU will apply for Google Summer of Code 2022
> > (https://summerofcode.withgoogle.com/) and has been accepted into
> > Outreachy May-August 2022 (https://www.outreachy.org/). You can now
> > submit internship project ideas for QEMU, KVM, and rust-vmm!
> >
> > If you have experience contributing to QEMU, KVM, or rust-vmm you can
> > be a mentor. It's a great way to give back and you get to work with
> > people who are just starting out in open source.
> >
> > Please reply to this email by February 21st with your project ideas.
> Hey, I am a bit late here, but in case it is still possible, I would
> like to also propose a project.
>
> Title: Extend the aarch64 support for rust-vmm/vmm-reference

Great project idea. I have added it to the list!

Please take a look and let me know if you want to change anything:
https://wiki.qemu.org/Google_Summer_of_Code_2022#Extend_aarch64_support_in_rust-vmm.2Fvmm-reference

Stefan

