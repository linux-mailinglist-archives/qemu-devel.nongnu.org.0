Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1E54A587E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 09:26:54 +0100 (CET)
Received: from localhost ([::1]:45256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEoV3-0002tb-3I
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 03:26:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nEo0h-0002bp-Py
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 02:55:31 -0500
Received: from [2607:f8b0:4864:20::102f] (port=44023
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nEo0e-0000AZ-Bq
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 02:55:31 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 qe6-20020a17090b4f8600b001b7aaad65b9so1626199pjb.2
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 23:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=iwq5UgV9PZB6aurBg6ZP0D3jOAE+xpJ5cVHSNnedr/Y=;
 b=o1XzIAsZStOhHZNXk1TmTGBjw1SQm3rSIRkUXRsloODiqY8zSjEozYwKbnaSmKNA3r
 ByTzVGKGW6nuH9ghg7GdVeQ0cJikq1M+aN3m9ZZqgMwGz/yWJdMP4rtpqqOfaaOrBmHf
 y2nYubVDuSIWRjfgOwGAfZb11lEoLo5qfg4wABxHv/8Z+vNX+AyI8FJprbXX70YD06+r
 UC1X1G2yrWF26+amPSkypE+u8kHyki7m0UDgXtKMV+V9SX9pca2LKlNgUhAHKk+IwH7s
 dmisR+P/n2RyUjrMiVTRe26v3HuNh9Bv2JwTmgZuo79cc+Rm1XWAq/9uh/5F8KysbCD4
 UO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=iwq5UgV9PZB6aurBg6ZP0D3jOAE+xpJ5cVHSNnedr/Y=;
 b=kYKzbJxTyeYVnac3OWUHgR5huoxiTipMUniR1QXRIF1ftsVHRT+tbtXKWamg8sAGe7
 aXf04laCatcXG4cycKaXn/AJQFvzNOLxgFkPeFBDIKrK1ORol4pB6NAmrL2fcVFIThMl
 6m7g8/6QjgUgGOrej2jtHbCnzfExSltRaOdGZSF0pjkMTdyylJeLTx8Ck6QOp7vkwEZF
 RRp8Jgdt/lv/DHoGje/lE1pqtktPuhGPAsE8WL7XmcKke7rZqWbNEH8rDyqk65rT+MhC
 vj8NzpLKjzKaNR3MaPfB5NfVaNhZLDHBCtmgUKfQUpAWAM6cbKQE5IIWGRg1cmhrKgeu
 CfzQ==
X-Gm-Message-State: AOAM532qfb62W/m57ASIIC7704uy9MMO1s59CcYAFvc0S+xeC31GDCOx
 BEpp5TXmDji9XqHPzz+zZEa3cw==
X-Google-Smtp-Source: ABdhPJzIYNrLJJ8oDNp0Iq4MrnOgXLRx5q/H496vjFKCWguAfaQc6l/gkjsnfI0C2Zs34/Psy/N/tA==
X-Received: by 2002:a17:90b:255:: with SMTP id
 fz21mr918668pjb.226.1643702126268; 
 Mon, 31 Jan 2022 23:55:26 -0800 (PST)
Received: from anisinha-lenovo ([115.96.137.127])
 by smtp.googlemail.com with ESMTPSA id h6sm22191636pfk.110.2022.01.31.23.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 23:55:25 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 1 Feb 2022 13:25:20 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 3/4] acpi: fix OEM ID/OEM Table ID padding
In-Reply-To: <20220201083922.73428015@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2202011314320.1532434@anisinha-lenovo>
References: <20220112130332.1648664-1-imammedo@redhat.com>
 <20220112130332.1648664-4-imammedo@redhat.com>
 <CAARzgwyc4UkvDSfu_tg8PqvG9VUZWVuPgVv5NRWqAguJgc8Thw@mail.gmail.com>
 <20220131142015.5e73ff90@redhat.com>
 <alpine.DEB.2.22.394.2201311854290.1478493@anisinha-lenovo>
 <20220131151024.15070c15@redhat.com>
 <alpine.DEB.2.22.394.2201311942130.1491657@anisinha-lenovo>
 <20220201083922.73428015@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::102f;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102f.google.com
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



On Tue, 1 Feb 2022, Igor Mammedov wrote:

> On Mon, 31 Jan 2022 19:51:24 +0530 (IST)
> Ani Sinha <ani@anisinha.ca> wrote:
>
> > On Mon, 31 Jan 2022, Igor Mammedov wrote:
> >
> > > On Mon, 31 Jan 2022 18:58:57 +0530 (IST)
> > > Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > > > On Mon, 31 Jan 2022, Igor Mammedov wrote:
> > > >
> > > > > On Mon, 31 Jan 2022 11:47:00 +0530
> > > > > Ani Sinha <ani@anisinha.ca> wrote:
> > > > >
> > > > > > On Wed, Jan 12, 2022 at 6:33 PM Igor Mammedov <imammedo@redhat.com> wrote:
> > > > > > >
> > > > > > > Commit [2] broke original '\0' padding of OEM ID and OEM Table ID
> > > > > > > fields in headers of ACPI tables. While it doesn't have impact on
> > > > > > > default values since QEMU uses 6 and 8 characters long values
> > > > > > > respectively, it broke usecase where IDs are provided on QEMU CLI.
> > > > > > > It shouldn't affect guest (but may cause licensing verification
> > > > > > > issues in guest OS).
> > > > > > > One of the broken usecases is user supplied SLIC table with IDs
> > > > > > > shorter than max possible length, where [2] mangles IDs with extra
> > > > > > > spaces in RSDT and FADT tables whereas guest OS expects those to
> > > > > > > mirror the respective values of the used SLIC table.
> > > > > > >
> > > > > > > Fix it by replacing whitespace padding with '\0' padding in
> > > > > > > accordance with [1] and expectations of guest OS
> > > > > > >
> > > > > > > 1) ACPI spec, v2.0b
> > > > > > >        17.2 AML Grammar Definition
> > > > > > >        ...
> > > > > > >        //OEM ID of up to 6 characters. If the OEM ID is
> > > > > > >        //shorter than 6 characters, it can be terminated
> > > > > > >        //with a NULL character.
> > > > > >
> > > > > > On the other hand, from
> > > > > > https://uefi.org/specs/ACPI/6.4/21_ACPI_Data_Tables_and_Table_Def_Language/ACPI_Data_Tables.html
> > > > > > ,
> > > > > >
> > > > > > "For example, the OEM ID and OEM Table ID in the common ACPI table
> > > > > > header (shown above) are fixed at six and eight characters,
> > > > > > respectively. They are not necessarily null terminated"
> > > > > >
> > > > > > I also checked version 5 and the verbiage is the same. I think not
> > > > > > terminating with a null is not incorrect.
> > > > >
> > > > > I have a trouble with too much 'not' within the sentence.
> > > >
> > > > :-)
> > > >
> > > > > So what's the point of this comment and how it's related to
> > > > > this patch?
> > > >
> > > > My understanding of the spec is that null termination of both those IDs is
> > > > not mandatory. Guests may get confused or expect the strings to be null
> > > > termimated but they should really be open to expecting non-null terminated
> > > > strings as well. What is important is that the number of chars of those
> > > > two strings are fixed and well defined in the spec and qemu
> > > > implementation.
> > > >
> > > > In any case, I think we can leave the patch as is for now and see if the
> > > > change causes trouble with other guests.
> > >
> > >
> > > these fields have a fixed length so one doesn't need terminating NULL
> > > in case the full length of the field is utilized, otherwise in case of
> > > where the value is shorter than max length it has to be null terminated
> > > to express a shorter value. That way QEMU worked for years until
> > > 602b458201 introduced regression.
> > >
> >
> > My comment was based on what I interpreted from reading the latest
> > version of the specs. I guess the spec does not explicitly say what the
> > padding
> > bytes would be in case the length of the IDs are less the max length. I
> > interpreted the wording to mean that whether or not the
> > length of the string is shorter, one should not expect it to terminate with null.
>
> that's what AML grmamar quoted in commit message clarifies
> for specific field(s), as opposed to your generic string
> type description

Ah yes, my bad. In
https://uefi.org/specs/ACPI/6.4/20_AML_Specification/AML_Specification.html ,
section 20.2.1 has this also :

ByteData(6) // OEM ID of up to 6 characters. If the OEM ID is shorter than
6 characters,
it can be terminated with a NULL character.

etc. Somehow I missed it.
>
> PS:
> you were asking the other day if there is any bugs left in ACPI,
> (the answer is that I'm not aware of any).

Yes spoke to Gerd offline. On native side also he is unaware of any issues
post 6.2.

> But there are issues with SMBIOS tables that need to be fixed
> (it's corner cases with large VM configurations), are you
> interested in trying to fix it?

Yes sure. I will try my best.

