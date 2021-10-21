Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD500435B12
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 08:46:56 +0200 (CEST)
Received: from localhost ([::1]:55964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdRqp-00042H-9A
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 02:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mdRp6-0003Ds-Ih
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 02:45:08 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:42807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mdRp4-0004mM-Qw
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 02:45:08 -0400
Received: by mail-pf1-x436.google.com with SMTP id m14so5013598pfc.9
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 23:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=PSG7mH00HjM1oJzTMcokuaPPOKtNlBxFHm18JImeqiQ=;
 b=aQSM6nhcApxXymU8Zjs/TKAsrqUFWHihE32ghvryWcT3y2VILRX3NuGv/pYeAtXppp
 pLD1cFOWjuU7DgwexnESWz+2dcnXPHWNZG9okzez9TKpXDKIYTanml2kwY8tBtYb2YhX
 Nhlca3JBmAHmHBf+S6dNLebqvxBXj2wLkUXLIqIxFTQQFKtn/h7vy4WFRNYMKurJu0qm
 Ebv/n1YqJxfOjqaBwOxUzK1ribhJs81XSNwWZL2sDtqRgOsQXrMqwdkVgkmma27xe35Y
 EA7EAjFNumsqVIdU/4+E0NuPbV1cg+o/nUmhlyoReJnVdqgvtJuEIJZFQ0hYT4g3JRd9
 218A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=PSG7mH00HjM1oJzTMcokuaPPOKtNlBxFHm18JImeqiQ=;
 b=UsZYwhZk7dtg9GOYWm4FQvrcwfxTvJfxUr82wCTyTpZqv603jOvDC8K6PtuOENkvF3
 Ho/JNLD8fhlK2XbARC4BC+vjYxJXYo3MzxXNQZjYE7hh//VlnySMARHQETWszYVldzKS
 vLefffOeSoWPgql9MDxeRM5zMaNmK2GhTI3C8JPDRJVMcrn8F6Wz6uvzoFU6VtJI1U0k
 J/cUbzEREWM8LCyq9Ly99p6hIpYNpIbDjrr1Llr3D0Dew0S4nys8xXgQ/fIeVJFz6Et+
 JK4gl+9jtDu+S3IE6zWavenM7+WyQtvUcd8BWeOhN0RV9uGUTPXYM1rZy0TbPxDWzyCN
 DBRA==
X-Gm-Message-State: AOAM533rPid1WzguHI3nzMPHw9vgq0bkWee/vXHJXWOHuzK8910gHnxK
 GEGQ7+6Na+/WUfiSzi6G+ZvieA==
X-Google-Smtp-Source: ABdhPJyGg/v4ORnSyiNCfJFe29hGJJR5ZrYv/22qND6BKqIaJ+O/hbfV3nAMR752y5/8LazEN4Mjdw==
X-Received: by 2002:a05:6a00:2309:b0:44d:bc24:4db8 with SMTP id
 h9-20020a056a00230900b0044dbc244db8mr3766117pfh.84.1634798705181; 
 Wed, 20 Oct 2021 23:45:05 -0700 (PDT)
Received: from anisinha-lenovo ([203.212.246.18])
 by smtp.googlemail.com with ESMTPSA id u74sm4683498pfc.87.2021.10.20.23.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 23:45:04 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 21 Oct 2021 12:14:58 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 0/3] tests/acpi/pcihp: add unit tests for hotplug on
 multifunction bridges for q35
In-Reply-To: <20211021021635-mutt-send-email-mst@kernel.org>
Message-ID: <alpine.DEB.2.22.394.2110211213010.235596@anisinha-lenovo>
References: <20211007135750.1277213-1-ani@anisinha.ca>
 <20211020043845-mutt-send-email-mst@kernel.org>
 <CAARzgwxh6g=p7UNsKnwPw9EKf+5kAv4Z0s2Bw8qvmX1Lc38wxQ@mail.gmail.com>
 <20211021021635-mutt-send-email-mst@kernel.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="2088271309-1926629746-1634798704=:235596"
Received-SPF: none client-ip=2607:f8b0:4864:20::436;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--2088271309-1926629746-1634798704=:235596
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT



On Thu, 21 Oct 2021, Michael S. Tsirkin wrote:

> On Thu, Oct 21, 2021 at 07:18:43AM +0530, Ani Sinha wrote:
> >
> >
> > On Wed, Oct 20, 2021 at 2:09 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> >     On Thu, Oct 07, 2021 at 07:27:47PM +0530, Ani Sinha wrote:
> >     > changelist:
> >     > v3: removed "nodefaults" from the command line and rebased the patchset.
> >     > v2: incorporated some of the feedbacks from Igor.
> >     > v1 : initial RFC patch.
> >
> >     This seems to break on s390 hosts for people. Likely an
> >     endian-ness bug somewhere. Dropped for now - care tracking that down
> >     and fixing so I can pick up the test again?
> >
> >     Thanks!
> >
> >
> > So I take it this patch wasn't causing the issue since this has been merged to
> > master now?
> >
> >
>
> Yes, we knew the bug is in the tested functionality not the test of
> course.

Yes which is why I was confused as well since the test would not
introduce regression in the product!

> With help from Thomas I was able to fix the original bug.

Ok good. wanted to take a look at it with a clear mind in the morning but
since this is fixed, all is good.

> The fix with more detail is here:
>
> commit 0e464f7d993113119f0fd17b890831440734ce15
> Author: Michael S. Tsirkin <mst@redhat.com>
> Date:   Wed Oct 20 05:48:54 2021 -0400
>
>     pci: fix PCI resource reserve capability on BE
>
>
>
> >
> >     > This patchset adds a unit test to exercize acpi hotplug support for
> >     multifunction
> >     > bridges on q35 machines. This support was added with the commit:
> >     >
> >     > d7346e614f4ec ("acpi: x86: pcihp: add support hotplug on multifunction
> >     bridges")
> >     >
> >     > Ani Sinha (3):
> >     >   tests/acpi/bios-tables-test: add and allow changes to a new q35 DSDT
> >     >     table blob
> >     >   tests/acpi/pcihp: add unit tests for hotplug on multifunction bridges
> >     >     for q35
> >     >   tests/acpi/bios-tables-test: update DSDT blob for multifunction bridge
> >     >     test
> >     >
> >     >  tests/data/acpi/q35/DSDT.multi-bridge | Bin 0 -> 8583 bytes
> >     >  tests/qtest/bios-tables-test.c        |  18 ++++++++++++++++++
> >     >  2 files changed, 18 insertions(+)
> >     >  create mode 100644 tests/data/acpi/q35/DSDT.multi-bridge
> >     >
> >     > --
> >     > 2.25.1
> >
> >
>
>
--2088271309-1926629746-1634798704=:235596--

