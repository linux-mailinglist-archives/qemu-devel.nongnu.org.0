Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 737F662C036
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 14:57:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovIqT-0006Gm-Aj; Wed, 16 Nov 2022 08:52:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1ovIqQ-0006Bn-Rb; Wed, 16 Nov 2022 08:52:50 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1ovIqO-0002Zc-U5; Wed, 16 Nov 2022 08:52:50 -0500
Received: by mail-pj1-x1029.google.com with SMTP id l6so16628725pjj.0;
 Wed, 16 Nov 2022 05:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
 bh=PKnuLmi4gRrfh0Yp/jxdYijZtWeyUMJTFGu0qgNv+lQ=;
 b=mRVuaheTntle3DwM6AFb4eGQEokeW2cD9RWSWT+cLMMtOKOIdVHZr/QLxv++yU+8B8
 vWEQlOPy6PmhADs6OtMOSok9ipDBOvw3If6fATvUeXkoLQ2oylka8lNILR4KssfuR6JS
 FfkxycOA4Dw+/oc/ZQwGbmgJlhdGw1EF/tCj9e29ZtSdNTBJc4Icwl8GzlG5QG989MMn
 pWuIaThSjiowHG/KHmIXKeM1jw5BmoNz0zC+9nMqstWsMNsgr42MuWGv3LkzMpbiNwDf
 V/spbS5nh8bYc0H90QUZHX4eRlPiG3DXxoAkSOkFN0zkChn0o3lWHNHCDctAyqbsRG1A
 42+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PKnuLmi4gRrfh0Yp/jxdYijZtWeyUMJTFGu0qgNv+lQ=;
 b=iWqgVKttMW7pMwmuPLcIt4Pd9UInwghwLKjzvPMeCCpcnVGAhyMhyRXZiV6KOVLpni
 07+TntNKxDvCgVHHbqVqzlA/qDDTkg8ncJYCticBU4flylCxj/DjO9qjvdyXIYsv2UyK
 famhooyqlEee2cQvAaJqWiPhcR/I/mhQo5VVZQGjSeRcBRj27EfuHPuZuVbWYe1vCNmY
 +sm91CthItMlJt8aByOWsyhjjFhvU96u+ntfgOIeyeCi15F8YukxGyi/vmy2Bek5qSJu
 l81n3c6FY5yeGsrrhA0fuwnCnjAqdIK8FxDvgUQ3uqdS3uwTWki3Uyu9MpNsdWShboR5
 XieA==
X-Gm-Message-State: ANoB5png40g5/y3ho4wpX1wgyuzhIy6Bc8upa6H8vYofuviThyehHNtT
 0CMPzQNN1SXktifZV8qRM6ftwVlMW7s6XjQh
X-Google-Smtp-Source: AA0mqf4pi48cVKfjDCcu/0CY82DVLr57opE6WEotr8oTYaXAji0/nkeIDMoUkV0bUD2qDB7suYGSmQ==
X-Received: by 2002:a17:902:d642:b0:188:d552:fb02 with SMTP id
 y2-20020a170902d64200b00188d552fb02mr7569766plh.76.1668606766587; 
 Wed, 16 Nov 2022 05:52:46 -0800 (PST)
Received: from MBP ([183.159.178.109]) by smtp.gmail.com with ESMTPSA id
 x67-20020a623146000000b0056bee236e9csm11230377pfx.142.2022.11.16.05.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 05:52:45 -0800 (PST)
References: <20221108023542.17557-1-schspa@gmail.com>
 <87fsetg5xh.fsf@linaro.org>
 <CAMA88Tqt-7rCTC38OhZGmCZyO4rFz+HHBNtDjaVCbhna01yScQ@mail.gmail.com>
 <CAFEAcA8J2Tx4gW5Y2q6qtkJ0BPpM4iWkt3nz0uezV+kiz6m_Ag@mail.gmail.com>
 <CAFEAcA8KnNE90tHQjRNEVny=s7YLD5Wmff9R8ZyLxxz47bwRGA@mail.gmail.com>
 <875yfpbg38.fsf@gmail.com>
 <CAFEAcA_5_78qUNFdgpYGnS0tS3QWD4cJokJCzMC6Tq270bYbJg@mail.gmail.com>
 <m2edu3ig2s.fsf@gmail.com>
 <CAFEAcA9k5a8O02zT6x1tqFvo11NmYupX9mfe2YdSwebBHKSdbw@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 27.2
From: Schspa Shi <schspa@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/arm/boot: set initrd parameters to 64bit in fdt
Date: Wed, 16 Nov 2022 21:52:17 +0800
In-reply-to: <CAFEAcA9k5a8O02zT6x1tqFvo11NmYupX9mfe2YdSwebBHKSdbw@mail.gmail.com>
Message-ID: <m27czvhuqd.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=schspa@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 16 Nov 2022 at 06:11, Schspa Shi <schspa@gmail.com> wrote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Tue, 8 Nov 2022 at 15:50, Schspa Shi <schspa@gmail.com> wrote:
>> >>
>> >>
>> >> Peter Maydell <peter.maydell@linaro.org> writes:
>> >>
>> >> > On Tue, 8 Nov 2022 at 13:54, Peter Maydell <peter.maydell@linaro.org> wrote:
>> >> >>
>> >> >> On Tue, 8 Nov 2022 at 12:52, Schspa Shi <schspa@gmail.com> wrote:
>> >> >> > I think this lowmem does not mean below 4GB. and it is to make sure
>> >> >> > the initrd_start > memblock_start_of_DRAM for Linux address range check.
>> >> >>
>> >> >> The wording of this comment pre-dates 64-bit CPU support: it
>> >> >> is talking about the requirement in the 32-bit booting doc
>> >> >> https://www.kernel.org/doc/Documentation/arm/Booting
>> >> >> that says
>> >> >> "If an initramfs is in use then, as with the dtb, it must be placed in
>> >> >> a region of memory where the kernel decompressor will not overwrite it
>> >> >> while also with the region which will be covered by the kernel's
>> >> >> low-memory mapping."
>> >> >>
>> >> >> So it does mean "below 4GB", because you can't boot a 32-bit kernel
>> >> >> if you don't put the kernel, initrd, etc below 4GB.
>> >> >
>> >> > A kernel person corrects me on the meaning of "lowmem" here -- the
>> >> > kernel means by it "within the first 768MB of RAM". There is also
>> >> > an implicit requirement that everything be within the bottom 32-bits
>> >> > of the physical address space.
>> >> >
>> >>
>> >> Thanks for your comment.
>> >>
>> >> In this view, initrd shouldn't be placed higher than 4GB ? But it
>> >> seems the Linux kernel can boot when there is no memory below 4GB.
>> >
>> > A *32 bit* kernel cannot -- it is completely unable to access
>> > anything above the 4GB mark when the MMU is off, as it is on
>> > initial boot. This QEMU code handles both 32 bit and 64 bit
>> > kernel boot. These days of course there is 64-bit only hardware,
>> > and that might choose to put its RAM above the 4GB mark,
>> > because it isn't ever going to boot a 32-bit kernel anyway.
>> >
>>
>> Yes, I think we should accept this patch, because it will not affect
>> 32-bit devices, and provides support for 64-bit devices to put initrd
>> above 4GB.
>
> Yes, I agree. However since it doesn't cause a problem for any
> of the machine models in upstream QEMU, I think we should leave
> it until after the in-progress 7.2 release, so that we have
> plenty of time to investigate just in case it does cause an
> unexpected issue on 32-bit boards.
>
> This patch is on my list to review and deal with when 7.2
> goes out and development reopens for 8.0 (should be in about
> four weeks).
>
> thanks
> -- PMM

OK, thank you very much.

-- 
BRs
Schspa Shi

