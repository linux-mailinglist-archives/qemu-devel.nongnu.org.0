Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533D6314B56
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 10:21:51 +0100 (CET)
Received: from localhost ([::1]:41498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9PDS-0000pP-Cs
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 04:21:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1l9OWr-0000mb-9j
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 03:37:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1l9OWo-0006kD-90
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 03:37:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612859864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QK1iJb9DxweX1KP/ll7ANmOKj89f925kVcSGmPjCXqE=;
 b=AdVNzy+GdOT0FwW7mYupjvCh0ilVnNrcZuY5jf51RfortIvV50YT7gr9N8Q9R75mtNAQXl
 IxQOkwwyWOam9fmxEiaxZqOrSg9AuI1T27xg57o+bx/BvCyJGTJn10a2NxwIycmR9iAAcw
 MSmG3+rUl6zMWdc7T6O9sEGMDncglNQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-TmFTnyXDNZ6-zX0WZCsnCg-1; Tue, 09 Feb 2021 03:37:40 -0500
X-MC-Unique: TmFTnyXDNZ6-zX0WZCsnCg-1
Received: by mail-ed1-f69.google.com with SMTP id i13so16677682edq.19
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 00:37:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QK1iJb9DxweX1KP/ll7ANmOKj89f925kVcSGmPjCXqE=;
 b=Lh8DBxSqs47AAPmCZQ9XI/66zcgzYHzx9URxaOgFvD6JD8hZcKlOLxpfanQJlkN/xT
 sAgfLLY+4NMh6lAZo4qdvK1RohrixT0nEd1r+PbX/nfG/5XI1eGuaUabGfT8tcBHf5WI
 Atjnj0rcV6X+i74r2PiuBBdsBnGKLqdFq8lyL0xfqJqkcsjX8mEBDrz1SjK55yMzPKw+
 3s/COuFX1Z1M+0jWJXnvA9WN3+S2hczLwOZZ46zeYbvLrk4ZyJVyPuc1NaU1ze2FtGV/
 neCDK9HDDbDPQjfFS/zFf8HvKGS8zlP9EyMNIgNkD58pIk32y1ak8UuUTkYLA0vmvnl1
 S5xA==
X-Gm-Message-State: AOAM530jhHDNUiP/JMNdwffu9yEGQdirYStn/3SsPmxDjg5WBsgFDSCn
 yKYxtgWmz81p06aRPBmgB+Z+GwF+RrKUPqQ7al1CJXWsFhE3zg2SgQmv28vTSBKjx2mVwhhxSAt
 OMd6qYisdn9sqbcnQ7WyTF03QBxAssXk=
X-Received: by 2002:a05:6402:1013:: with SMTP id
 c19mr11312684edu.86.1612859859563; 
 Tue, 09 Feb 2021 00:37:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz50c1Kp7OFNCxXg88PwtwpB1aHll8ItKxpH45QpLKlwL00RvigI8xGzBoeupW9CFR1u+qiOx3jpAK6v5B6cWM=
X-Received: by 2002:a05:6402:1013:: with SMTP id
 c19mr11312663edu.86.1612859859403; 
 Tue, 09 Feb 2021 00:37:39 -0800 (PST)
MIME-Version: 1.0
References: <20210208193450.2689517-1-f4bug@amsat.org>
 <CAA8xKjUPrQkqdJR46Pa4U2ymBDL=KZHvVC9-CzQOR3OqOp8hPg@mail.gmail.com>
 <CAAdtpL4_aLOz0FQihjXh1J9yQkkcW_VKM+pfwkKZ3KceykiN+w@mail.gmail.com>
In-Reply-To: <CAAdtpL4_aLOz0FQihjXh1J9yQkkcW_VKM+pfwkKZ3KceykiN+w@mail.gmail.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Tue, 9 Feb 2021 09:37:28 +0100
Message-ID: <CAA8xKjVG9TTfJq34UBgWdRr_kB8+wP1+=mGQmRSAQ4HVvN6bvA@mail.gmail.com>
Subject: Re: [PATCH] hw/sd/sdhci: Do not modify BlockSizeRegister if
 transaction in progress
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "open list:Block layer core" <qemu-block@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Li Qiang <liq3ea@163.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Prasad J Pandit <ppandit@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 8, 2021 at 9:26 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On Mon, Feb 8, 2021 at 8:59 PM Mauro Matteo Cascella
> <mcascell@redhat.com> wrote:
> > On Mon, Feb 8, 2021 at 8:35 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org> wrote:
> > >
> > > Per the "SD Host Controller Simplified Specification Version 2.00"
> > > spec. 'Table 2-4 : Block Size Register':
> > >
> > >   Transfer Block Size [...] can be accessed only if no
> > >   transaction is executing (i.e., after a transaction has stopped).
> > >   Read operations during transfers may return an invalid value,
> > >   and write operations shall be ignored.
> > >
> ...
> > >
> > > Fixes: CVE-2020-17380
> > > Fixes: CVE-2020-25085
> > > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > > ---
> > > Cc: Mauro Matteo Cascella <mcascell@redhat.com>
> > > Cc: Alexander Bulekov <alxndr@bu.edu>
> > > Cc: Alistair Francis <alistair.francis@wdc.com>
> > > Cc: Prasad J Pandit <ppandit@redhat.com>
> > > Cc: Bandan Das <bsd@redhat.com>
> > >
> > > RFC because missing Reported-by tags, launchpad/bugzilla links and
> > > qtest reproducer. Sending for review meanwhile.
> ...
> > For the above CVEs:
> > Tested-by: Mauro Matteo Cascella <mcascell@redhat.com>
>
> Thanks Mauro for testing. Do you know what tags I should add for the cred=
its?
>
> Phil.
>

I think the credit should go to Alexander for reporting [1] as well as
people from Ruhr-University Bochum for CVE-2020-25085 (I don't know
about their emails, though):

Reported-by: Alexander Bulekov <alxndr@bu.edu>
Reported-by: Sergej Schumilo (Ruhr-University Bochum)
Reported-by: Cornelius Aschermann (Ruhr-University Bochum)
Reported-by: Simon Wrner (Ruhr-University Bochum)

[1] https://bugs.launchpad.net/qemu/+bug/1892960



--
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


