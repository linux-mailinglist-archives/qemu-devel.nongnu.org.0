Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C08F2D2863
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 11:06:46 +0100 (CET)
Received: from localhost ([::1]:38642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmZtN-0000zQ-Mt
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 05:06:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kmZrz-0000Rx-1n
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 05:05:19 -0500
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:37722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1kmZrw-0006QJ-RP
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 05:05:18 -0500
Received: by mail-il1-x141.google.com with SMTP id k8so15008041ilr.4
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 02:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6LnaMpP28AhPqELORDxpGyeiGhwKtr8NCKhAMEZEzqQ=;
 b=L+XfISbAFgIfxS87GxCrhYKiMlmtmU5q/4XzGt+1MaYqX7WC0zjKyC1Dp3QGCCvgnH
 4Gpgwf4v95REbXpzfOqs9IRRzSp79kxWAWGJd89bfzw+XjIeZFNMOMauWMNFCF3/3nt2
 zd8PEkloYYtPaNNZ+1G2lzwarlH9aEdIlkS+bJ43S7ldxD2c18GQqiWAoiTvqYQtW2X1
 ZI8us7flGSUPvGATq6ryamJYxE7fjGHSLVOgrTGr5FZwPIDy+OUoQnStdw3Gbk9OPwa2
 N3mCmhQI1e6ycPMeVeZN7Ty/aIbvbo+r1+8pKiWcvZQLGYs6YjDEzgDqvqZYdNvS8DF0
 OrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6LnaMpP28AhPqELORDxpGyeiGhwKtr8NCKhAMEZEzqQ=;
 b=MqViUpAseC3KxQNqo/O+CTrS9YnWkWHAUguHBFclp8Lz3LG9lXkJv/3T1w/8NHRHvp
 EhXESQzc9C8e6PQO9/pqWMY/SEUQPXYnOK1wACdJ0Qnd82qPnCDU+3B5GD/SE4XAm1ZH
 tp9diHoL6iP23i6Mnj8J/RHRZ77YnCgqsN3T9Xa2KdruT4FOpK0XJuW5+Y5hRCCek/7m
 wWnKB5kgkTRiaptj/oyZhvGWmLWTorhGX6yYFO7CqGfSYy+H5ui8n217OFoTkoBg5Ad1
 Qg+Nk6K77/gYY+kyp6gAZQq19cJa4ELbg6nfkQ+KDr4EKgJhNKDPWdO3XSUb5leYSLr7
 2dNg==
X-Gm-Message-State: AOAM533q6SgDhmR7F70xS3WKJ8FsUImJRrjgEPFhSr9CgQ1vdfouG4No
 61FXnm7w8z01+BYn95cVSterJ6oWVE016xiMAa0E
X-Google-Smtp-Source: ABdhPJzbW06b3ZpO7gii59Pgjr48fjbD4MN+PTILyZ+espZo0UlzULDTEXFvIxozz3h4K7c5WAC4auSaiGwiH8gZ6m8=
X-Received: by 2002:a92:98db:: with SMTP id a88mr24921073ill.106.1607421915457; 
 Tue, 08 Dec 2020 02:05:15 -0800 (PST)
MIME-Version: 1.0
References: <20201119153901.53705-1-steven.price@arm.com>
 <CAFEAcA85fiqA206FuFANKbV_3GkfY1F8Gv7MP58BgTT81bs9kA@mail.gmail.com>
 <20201119184248.4bycy6ouvaxqdiiy@kamzik.brq.redhat.com>
 <db5ad775fa7cfe7defbd78d9ca6ccfd8@kernel.org>
 <c25c297e-e9b5-ab3f-e401-c21ddd4d2ad1@arm.com>
 <CAJc+Z1H7akXwDtVvQLiGVVyZ0DfmsxyJQhE7Sno6aAO9GaafEA@mail.gmail.com>
 <46fd98a2-ee39-0086-9159-b38c406935ab@arm.com>
 <CAFEAcA_Q8RSB-zcS8+cEfvWz_0U5GLzmsf12m_7BFjX8h-1hrA@mail.gmail.com>
 <b975422f-14fd-13b3-c8ca-e8b1a68c0837@arm.com> <20201207164428.GD3135@work-vm>
In-Reply-To: <20201207164428.GD3135@work-vm>
From: Haibo Xu <haibo.xu@linaro.org>
Date: Tue, 8 Dec 2020 18:05:04 +0800
Message-ID: <CAJc+Z1FbouCed4Hfc79CbuVtyKV-2=uiQQABtjPV0+drM=J5ZQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] MTE support for KVM guest
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x141.google.com
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
 Juan Quintela <quintela@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Marc Zyngier <maz@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Price <steven.price@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 dgibson@redhat.com, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm <kvmarm@lists.cs.columbia.edu>,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>,
 Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Dec 2020 at 00:44, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
>
> * Steven Price (steven.price@arm.com) wrote:
> > On 07/12/2020 15:27, Peter Maydell wrote:
> > > On Mon, 7 Dec 2020 at 14:48, Steven Price <steven.price@arm.com> wrote:
> > > > Sounds like you are making good progress - thanks for the update. Have
> > > > you thought about how the PROT_MTE mappings might work if QEMU itself
> > > > were to use MTE? My worry is that we end up with MTE in a guest
> > > > preventing QEMU from using MTE itself (because of the PROT_MTE
> > > > mappings). I'm hoping QEMU can wrap its use of guest memory in a
> > > > sequence which disables tag checking (something similar will be needed
> > > > for the "protected VM" use case anyway), but this isn't something I've
> > > > looked into.
> > >
> > > It's not entirely the same as the "protected VM" case. For that
> > > the patches currently on list basically special case "this is a
> > > debug access (eg from gdbstub/monitor)" which then either gets
> > > to go via "decrypt guest RAM for debug" or gets failed depending
> > > on whether the VM has a debug-is-ok flag enabled. For an MTE
> > > guest the common case will be guests doing standard DMA operations
> > > to or from guest memory. The ideal API for that from QEMU's
> > > point of view would be "accesses to guest RAM don't do tag
> > > checks, even if tag checks are enabled for accesses QEMU does to
> > > memory it has allocated itself as a normal userspace program".
> >
> > Sorry, I know I simplified it rather by saying it's similar to protected VM.
> > Basically as I see it there are three types of memory access:
> >
> > 1) Debug case - has to go via a special case for decryption or ignoring the
> > MTE tag value. Hopefully this can be abstracted in the same way.
> >
> > 2) Migration - for a protected VM there's likely to be a special method to
> > allow the VMM access to the encrypted memory (AFAIK memory is usually kept
> > inaccessible to the VMM). For MTE this again has to be special cased as we
> > actually want both the data and the tag values.
> >
> > 3) Device DMA - for a protected VM it's usual to unencrypt a small area of
> > memory (with the permission of the guest) and use that as a bounce buffer.
> > This is possible with MTE: have an area the VMM purposefully maps with
> > PROT_MTE. The issue is that this has a performance overhead and we can do
> > better with MTE because it's trivial for the VMM to disable the protection
> > for any memory.
>
> Those all sound very similar to the AMD SEV world;  there's the special
> case for Debug that Peter mentioned; migration is ...complicated and
> needs special case that's still being figured out, and as I understand
> Device DMA also uses a bounce buffer (and swiotlb in the guest to make
> that happen).
>
>
> I'm not sure about the stories for the IBM hardware equivalents.

Like s390-skeys(storage keys) support in Qemu?

I have read the migration support for the s390-skeys in Qemu and found
that the logic is very similar to that of MTE, except the difference that the
s390-skeys were migrated separately from that of the guest memory data
while for MTE, I think the guest memory tags should go with the  memory data.

>
> Dave
>
> > The part I'm unsure on is how easy it is for QEMU to deal with (3) without
> > the overhead of bounce buffers. Ideally there'd already be a wrapper for
> > guest memory accesses and that could just be wrapped with setting TCO during
> > the access. I suspect the actual situation is more complex though, and I'm
> > hoping Haibo's investigations will help us understand this.
> >
> > Thanks,
> >
> > Steve
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>

