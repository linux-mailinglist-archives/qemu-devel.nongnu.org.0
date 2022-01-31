Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A9E4A48ED
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 15:04:56 +0100 (CET)
Received: from localhost ([::1]:52604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEXIc-0007ZT-D2
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 09:04:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nEWkM-000749-OD
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 08:29:32 -0500
Received: from [2607:f8b0:4864:20::434] (port=45017
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nEWkD-0001xM-Ql
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 08:29:25 -0500
Received: by mail-pf1-x434.google.com with SMTP id n32so12834403pfv.11
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 05:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=sz3e2zxZGlPGXphWdsf6hKYbUSAljlbcS8/BSiaKbRY=;
 b=4FIf02hk/0hCdc4UwkeIYXLZDmbf4lPPI8K6i04Oxdv+x4CnIAnvdVTys7Wp0W5t6e
 vUkmFedFsgAp8ydvWqXY/ko5qzY/uh/2Muo6uAUcfu4dvqK+RmcD23R7V32CoQ99Uh4I
 mBLql5lSd2X0bAWutrSwAWi6A/maXq/v2fRmjPYLzNb/MQ9KlmezF2uQ7W0gKToscQm8
 NgtgCHYWDRP6SoaaLjSJDFJNs9reuFAjWSOM12F9nmrG3P14sT+Yo10AGTL/1xw4u9Vp
 twD5Mf46NpaEgyFhfojcoxR4RTaVeBCJntUF9HCEMYklZhg47E7BHFCInGgW+SF59+y+
 u8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=sz3e2zxZGlPGXphWdsf6hKYbUSAljlbcS8/BSiaKbRY=;
 b=A9sPpHA/CAMMZgoza3j+1aJm25miLVDcY+8k6j/3ryJ3NLD42G6/fJgi5jw1KV8Rkw
 XPzG7Z1u2vbHj+m5O/a0BilhoVTtbanumuEY/khpgKYsanLecxbHzTU+0gHYjw566vJF
 pTzsV1IPrVmTsYLQqTkbOpKmpsu5i1Sc/w/8Yb4Oax29htdtC3wAPs8cxgCEDjFe0RND
 ik0lKYPRWZg9rkfJhdW1hWFoHNNgaF3v3NfNDzRmAk2XtKCEQ3xDc8ZGXrKtEHIo3d0M
 u9DZqr1LA4XMOIpXcDtZ6noMbLIqS+VrIgAELMLxT0+WamQOpnvIh9m/VzS/6+VjQDko
 Q+Yg==
X-Gm-Message-State: AOAM5303rnlJqZD+itWhBo08sKGpQZL8VPSt/b4kuyfOFqpUGobGTanr
 TZ9V7P5/Ogt69Muw6zQ8B+iazA==
X-Google-Smtp-Source: ABdhPJzqL8nmmPvnFSqP7MJ0YXE9n3+93iAto3PTmgFL/ALyJ1Q5NZuJR7qw2qbSl7KQ6smHiir7Cw==
X-Received: by 2002:a63:81c8:: with SMTP id
 t191mr16540973pgd.223.1643635747069; 
 Mon, 31 Jan 2022 05:29:07 -0800 (PST)
Received: from anisinha-lenovo ([203.163.234.212])
 by smtp.googlemail.com with ESMTPSA id
 e14sm19015868pfv.219.2022.01.31.05.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 05:29:06 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Mon, 31 Jan 2022 18:58:57 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 3/4] acpi: fix OEM ID/OEM Table ID padding
In-Reply-To: <20220131142015.5e73ff90@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2201311854290.1478493@anisinha-lenovo>
References: <20220112130332.1648664-1-imammedo@redhat.com>
 <20220112130332.1648664-4-imammedo@redhat.com>
 <CAARzgwyc4UkvDSfu_tg8PqvG9VUZWVuPgVv5NRWqAguJgc8Thw@mail.gmail.com>
 <20220131142015.5e73ff90@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::434;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x434.google.com
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

> On Mon, 31 Jan 2022 11:47:00 +0530
> Ani Sinha <ani@anisinha.ca> wrote:
>
> > On Wed, Jan 12, 2022 at 6:33 PM Igor Mammedov <imammedo@redhat.com> wrote:
> > >
> > > Commit [2] broke original '\0' padding of OEM ID and OEM Table ID
> > > fields in headers of ACPI tables. While it doesn't have impact on
> > > default values since QEMU uses 6 and 8 characters long values
> > > respectively, it broke usecase where IDs are provided on QEMU CLI.
> > > It shouldn't affect guest (but may cause licensing verification
> > > issues in guest OS).
> > > One of the broken usecases is user supplied SLIC table with IDs
> > > shorter than max possible length, where [2] mangles IDs with extra
> > > spaces in RSDT and FADT tables whereas guest OS expects those to
> > > mirror the respective values of the used SLIC table.
> > >
> > > Fix it by replacing whitespace padding with '\0' padding in
> > > accordance with [1] and expectations of guest OS
> > >
> > > 1) ACPI spec, v2.0b
> > >        17.2 AML Grammar Definition
> > >        ...
> > >        //OEM ID of up to 6 characters. If the OEM ID is
> > >        //shorter than 6 characters, it can be terminated
> > >        //with a NULL character.
> >
> > On the other hand, from
> > https://uefi.org/specs/ACPI/6.4/21_ACPI_Data_Tables_and_Table_Def_Language/ACPI_Data_Tables.html
> > ,
> >
> > "For example, the OEM ID and OEM Table ID in the common ACPI table
> > header (shown above) are fixed at six and eight characters,
> > respectively. They are not necessarily null terminated"
> >
> > I also checked version 5 and the verbiage is the same. I think not
> > terminating with a null is not incorrect.
>
> I have a trouble with too much 'not' within the sentence.

:-)

> So what's the point of this comment and how it's related to
> this patch?

My understanding of the spec is that null termination of both those IDs is
not mandatory. Guests may get confused or expect the strings to be null
termimated but they should really be open to expecting non-null terminated
strings as well. What is important is that the number of chars of those
two strings are fixed and well defined in the spec and qemu
implementation.

In any case, I think we can leave the patch as is for now and see if the
change causes trouble with other guests.

