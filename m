Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C804BD8EF
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 11:08:13 +0100 (CET)
Received: from localhost ([::1]:49944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5c4-0003Su-LW
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 05:08:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nM55Z-0005gu-34
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:34:38 -0500
Received: from [2607:f8b0:4864:20::1030] (port=35762
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nM55X-0001vq-3Y
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:34:36 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 t4-20020a17090a3b4400b001bc40b548f9so1816894pjf.0
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+z38o2AuyC9uCa7uvA5CctNElBqiXVLTZOkjYvSbv/I=;
 b=Bn0csyyCp38/o3NTZBO1aDJKbbl+x1rIO08ZpKDEuO2Pt/MVc/DVtm4TSwtGEJe52L
 hy6rtuQaqte/m91K3UNT6B/jjq3h+mxKUCo5V7jpDpYxAnOi7TnXtWPgTUAAOC8dO9JX
 mhPmXLb5GYouHfAMffSido1cJuq9csxZ2qBmTgF5GmJ9ONJJX+cKiAjLw9NdAeSPRjpn
 +Rkcf/SbktkbKx2XtYLbm7gFP3F7OlFCfQIyaljx70HGdGPutBp3qxzCPSGsskls0ES5
 x1uAWDu02ol4Pc2u/FiWTLOkJ5t/PJHcm/Pf8d28OVVyvTa75iB3VCQZll9xr6VVd0Wp
 If+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+z38o2AuyC9uCa7uvA5CctNElBqiXVLTZOkjYvSbv/I=;
 b=bySC1HOV4f52cGKYJCQHKzsdfqp5IUb2ZmBuRj1a9bzgJFqQTpG7ZBSUhUS80s8mXl
 twKL8CYd+T6RTKrBfkdYFFjqtPC6DnEgepEGBBYVWl5hyW3SeO9x/uWCqZ3pK8MtOhCS
 EH1c86/qN2fBs3Rm+mzKPjMwrO7Id8ABiCWPX0B7Xivv37myVcBvHUHWtbu0FWxV4+7+
 PQMgFJlRhbHc5ms/fPHLXHsYdxzNufWeEvtjqMJd8zo6YBEjRoFSv8jT4ESmv0Mfa80o
 ncrxvdGIdOexldTMbHQ1ijdmGA4YmXMOeOFqpjHOKCY/RI60ffnxz5IVdG9agpEQR3QS
 cyKw==
X-Gm-Message-State: AOAM530xzJsarN49ufR1tVz128dax8jEObFKbnogBr3nbtdgJ1HO/6aB
 5XGQLUc/FYKYq9HAqjZ5JUAQH4aa/V3zi81np+Y=
X-Google-Smtp-Source: ABdhPJw9Suoh59SvPz8JFSzK3/5kKtIrydHWVvABx9Rho58UFlL0RMn13nid4jNojkMDuUP4w5wHPJ2DhvxUVUp5Kxk=
X-Received: by 2002:a17:902:bc82:b0:14f:2b9c:4aa with SMTP id
 bb2-20020a170902bc8200b0014f2b9c04aamr17880462plb.145.1645436068677; Mon, 21
 Feb 2022 01:34:28 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
 <20220218210323.hw2kkid25l7jczjo@mozz.bu.edu>
In-Reply-To: <20220218210323.hw2kkid25l7jczjo@mozz.bu.edu>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 21 Feb 2022 09:34:17 +0000
Message-ID: <CAJSP0QXxJhxc6gr=DnPGomL+z+fcTfpUcGSDRzXt9ivP86qU+g@mail.gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
To: Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=stefanha@gmail.com; helo=mail-pj1-x1030.google.com
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, bdas@redhat.com,
 kvm <kvm@vger.kernel.org>, Sergio Lopez <slp@redhat.com>,
 Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, John Snow <jsnow@redhat.com>,
 Alex Agache <aagch@amazon.com>, qemu-devel <qemu-devel@nongnu.org>, "Florescu,
 Andreea" <fandree@amazon.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Darren Kenny <darren.kenny@oracle.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Feb 2022 at 21:05, Alexander Bulekov <alxndr@bu.edu> wrote:
>
> On 220128 1547, Stefan Hajnoczi wrote:
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
> >
> > Good project ideas are suitable for remote work by a competent
> > programmer who is not yet familiar with the codebase. In
> > addition, they are:
> > - Well-defined - the scope is clear
> > - Self-contained - there are few dependencies
> > - Uncontroversial - they are acceptable to the community
> > - Incremental - they produce deliverables along the way
> >
> > Feel free to post ideas even if you are unable to mentor the project.
> > It doesn't hurt to share the idea!
>
> Here are two fuzzing-related ideas:

Hi Alex,
I have added both ideas to the wiki. I tried to edit them, including
adding specific goals for the intern to complete during the summer.
Please take a look at then and feel free to edit!

> Summary: Implement rapid guest-initiated snapshot/restore functionality (for
> Fuzzing).

https://wiki.qemu.org/Google_Summer_of_Code_2022#Implement_a_snapshot_fuzzing_device

> Summary: Implement a coverage-guided fuzzer for QEMU images

https://wiki.qemu.org/Google_Summer_of_Code_2022#Coverage-guided_disk_image_fuzzing

Stefan

