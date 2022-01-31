Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7142C4A4967
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 15:34:18 +0100 (CET)
Received: from localhost ([::1]:45740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEXl3-0001Zp-I2
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 09:34:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nEXYu-00045o-T8
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 09:21:45 -0500
Received: from [2607:f8b0:4864:20::52c] (port=36421
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nEXYr-0001kJ-Ud
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 09:21:44 -0500
Received: by mail-pg1-x52c.google.com with SMTP id e9so12389982pgb.3
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 06:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=ScD9I0/REEu+zWR/AcNKiZQRCQGAqNcGRf44/Oovsso=;
 b=tRD9+paWKzBNz7912zOna1RW50eJu4KBLW2TMjZj7h591Q4vmPrIjn8ZYPiacLs659
 OkUa1h+KSZ+LvarEY9/Xts+BnzBDnb1XDmVlG6IvA/9jJThDUgGrvGt2OQfsQ1Fc3qzn
 VwYtuR+gqJrKyAYSVYeppfUIRcO4G83G1LaXrOYyD1rXVoOzynRVZPLsj7If20nds6G8
 pMBB205LkrVkGmVByYFeujYYUZ4rLmSKwQ41RUawt98GWSi6vNMaQ+dB7FgZkY/3FKEf
 zmTbqkKnFz0r4/OoBXUtrNS4lR2k/XjH0nVNGlNRksH15D+N+w7BQwXJb8SLgFMQYuaH
 uCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=ScD9I0/REEu+zWR/AcNKiZQRCQGAqNcGRf44/Oovsso=;
 b=5eir8b4cy4USaWeFJ5AAvulIxqa9KRuhcQW0ZUOliXb7vvyTbCQi39rEpXKwTuz60r
 CkNbWPOksywKBUSbbDrDqk2rvftErWtTu66YJGevXNEbueeqgcHqlLCpEpnkZNcnHI0X
 wNZEjzz0nw06r9++TDWaO8cxt+ARI+9fYZOBaoQZq4JrAZFlnEcAsuGlj3ijWDzJGgSR
 +WxM0Z0xMk2p+bwrbvD440Q9KB8X/QLKejKC69KC/OMVaTtw98Krghwn/kvJRAJ1T7BE
 Lm6hMzDvWF5sF9w4ceaKUNZFx9Ujup5V0RZIwiLKv2xdk/y+u0qxiCZtTNrPT5ivwfF2
 Bf5w==
X-Gm-Message-State: AOAM531+crntcilVoifeh8AgwUxmr30nkVEG+C7IhqwyKVf2e3jgVUYK
 BOBNw4c5occt9CcX2UVF+Hf0rQ==
X-Google-Smtp-Source: ABdhPJy/05KrQTbDf7u6jXLhDPOe0KP9FbFZwgbnyef2gNH6YNf+336K3nVjZ7tcTSrcr0x6cdHrFQ==
X-Received: by 2002:a05:6a00:23ce:: with SMTP id
 g14mr20411684pfc.13.1643638890483; 
 Mon, 31 Jan 2022 06:21:30 -0800 (PST)
Received: from anisinha-lenovo ([203.163.234.212])
 by smtp.googlemail.com with ESMTPSA id f12sm13355669pfj.37.2022.01.31.06.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 06:21:30 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Mon, 31 Jan 2022 19:51:24 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 3/4] acpi: fix OEM ID/OEM Table ID padding
In-Reply-To: <20220131151024.15070c15@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2201311942130.1491657@anisinha-lenovo>
References: <20220112130332.1648664-1-imammedo@redhat.com>
 <20220112130332.1648664-4-imammedo@redhat.com>
 <CAARzgwyc4UkvDSfu_tg8PqvG9VUZWVuPgVv5NRWqAguJgc8Thw@mail.gmail.com>
 <20220131142015.5e73ff90@redhat.com>
 <alpine.DEB.2.22.394.2201311854290.1478493@anisinha-lenovo>
 <20220131151024.15070c15@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::52c;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Marian Postevca <posteuca@mutex.one>,
 "Dmitry V . Orekhov" <dima.orekhov@gmail.com>, Ani Sinha <ani@anisinha.ca>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, 31 Jan 2022, Igor Mammedov wrote:

> On Mon, 31 Jan 2022 18:58:57 +0530 (IST)
> Ani Sinha <ani@anisinha.ca> wrote:
>
> > On Mon, 31 Jan 2022, Igor Mammedov wrote:
> >
> > > On Mon, 31 Jan 2022 11:47:00 +0530
> > > Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > > > On Wed, Jan 12, 2022 at 6:33 PM Igor Mammedov <imammedo@redhat.com> wrote:
> > > > >
> > > > > Commit [2] broke original '\0' padding of OEM ID and OEM Table ID
> > > > > fields in headers of ACPI tables. While it doesn't have impact on
> > > > > default values since QEMU uses 6 and 8 characters long values
> > > > > respectively, it broke usecase where IDs are provided on QEMU CLI.
> > > > > It shouldn't affect guest (but may cause licensing verification
> > > > > issues in guest OS).
> > > > > One of the broken usecases is user supplied SLIC table with IDs
> > > > > shorter than max possible length, where [2] mangles IDs with extra
> > > > > spaces in RSDT and FADT tables whereas guest OS expects those to
> > > > > mirror the respective values of the used SLIC table.
> > > > >
> > > > > Fix it by replacing whitespace padding with '\0' padding in
> > > > > accordance with [1] and expectations of guest OS
> > > > >
> > > > > 1) ACPI spec, v2.0b
> > > > >        17.2 AML Grammar Definition
> > > > >        ...
> > > > >        //OEM ID of up to 6 characters. If the OEM ID is
> > > > >        //shorter than 6 characters, it can be terminated
> > > > >        //with a NULL character.
> > > >
> > > > On the other hand, from
> > > > https://uefi.org/specs/ACPI/6.4/21_ACPI_Data_Tables_and_Table_Def_Language/ACPI_Data_Tables.html
> > > > ,
> > > >
> > > > "For example, the OEM ID and OEM Table ID in the common ACPI table
> > > > header (shown above) are fixed at six and eight characters,
> > > > respectively. They are not necessarily null terminated"
> > > >
> > > > I also checked version 5 and the verbiage is the same. I think not
> > > > terminating with a null is not incorrect.
> > >
> > > I have a trouble with too much 'not' within the sentence.
> >
> > :-)
> >
> > > So what's the point of this comment and how it's related to
> > > this patch?
> >
> > My understanding of the spec is that null termination of both those IDs is
> > not mandatory. Guests may get confused or expect the strings to be null
> > termimated but they should really be open to expecting non-null terminated
> > strings as well. What is important is that the number of chars of those
> > two strings are fixed and well defined in the spec and qemu
> > implementation.
> >
> > In any case, I think we can leave the patch as is for now and see if the
> > change causes trouble with other guests.
>
>
> these fields have a fixed length so one doesn't need terminating NULL
> in case the full length of the field is utilized, otherwise in case of
> where the value is shorter than max length it has to be null terminated
> to express a shorter value. That way QEMU worked for years until
> 602b458201 introduced regression.
>

My comment was based on what I interpreted from reading the latest
version of the specs. I guess the spec does not explicitly say what the
padding
bytes would be in case the length of the IDs are less the max length. I
interpreted the wording to mean that whether or not the
length of the string is shorter, one should not expect it to terminate with null.

It would be nice if a future version of the spec made is explicit and
clearer.

