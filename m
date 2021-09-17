Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D2440F293
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 08:43:38 +0200 (CEST)
Received: from localhost ([::1]:33982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR7az-0004sY-3L
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 02:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mR7Zk-00040Y-7m
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 02:42:20 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:43757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mR7Zh-0004Rc-8o
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 02:42:20 -0400
Received: by mail-ed1-x52d.google.com with SMTP id n10so25480076eda.10
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 23:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mRucfBE3m0jS7yCA991+lKESEKC9rkLrp76UAzTUenY=;
 b=mt21cTCGQQJ87F+IBfXXO7x8n/6K5OP7nzGzKDoG3ZN0eG5UpZsj1NVSU/c7UAeFJn
 GDX4hkHM1cof57M+jhlsuyOYtyJsc6ZebcWyI0sWY0mW33DPxIWDuSIGES3rUn2z3Rd2
 ISiHw+iwslj1owwHqb3q9JqRfvFZUSocDz6x/CCPOSeyN90bnLp7RzJvwz2oBOJm/94q
 i/2MCeWVNf8VotaCo5PkVK6O1lXYGSfyBKlkLqYvGRDZNLCGPfjpz2+av25nlAAGEHEr
 d0H/trYnv5+bOPmAzj/HqU4pJF71X722TLIG4DNpy7t2zSht3qK+0sn2vHUzBp9jO/tA
 0alg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mRucfBE3m0jS7yCA991+lKESEKC9rkLrp76UAzTUenY=;
 b=ghscyBsL3DBG/nakKQP6PbK9BAs8/ravMh7LmyNITlumfyuIhAhp7VrzpOrb0Nu4oA
 Babgpnyzv352a4ydn105yOdySINjodgi+2nFLM8NTU+R6S+hDJx+EVHjA0F7HkNY6Rfd
 vo4Mgf0oWPurq/yqk5JhdzXZAq1qbHGLF8DoSNUP2BFsCUrCOR7l/o2ShjaU90pRLncl
 IWiwMhtcWwNnOwlJChBQ6oAhzoDG7CyuKWMIrI4W7Wde4V6fl4v/jjGWqHdHKHBrlhYP
 p+oFKBU89geUI4ri1o8zPc/MJOylZfTLYwJ7FRNcRjfqu61cTwUfhjRMqkpgN2qDS6wo
 mRbA==
X-Gm-Message-State: AOAM533RuFNXEeTdtJml4i4V6/gn7BDBWs6Rl3B1n/8bxuh2l6WM3Zem
 JbsjG8vzjpKgvtsfa1t9O17eUjoO75SJGyGHxf+7Dg==
X-Google-Smtp-Source: ABdhPJy+ihFP1SOEfXGL/WWr38Q8lmNq16189Sg2imTPnQ9baHK5lR+msBK7pcylotDz9Q7xOTMIjNOFAJHh3g7yh4s=
X-Received: by 2002:a17:906:d045:: with SMTP id
 bo5mr10539111ejb.461.1631860934107; 
 Thu, 16 Sep 2021 23:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210916132838.3469580-1-ani@anisinha.ca>
 <20210916185427-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2109171002510.3487658@anisinha-lenovo>
In-Reply-To: <alpine.DEB.2.22.394.2109171002510.3487658@anisinha-lenovo>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 17 Sep 2021 12:12:03 +0530
Message-ID: <CAARzgwzSR7K2NzgpvuS7gZ_AEKzkoFsfFkNi3pXz1AiP66RJYA@mail.gmail.com>
Subject: Re: hw/i386/acpi: fix conflicting IO address range for acpi pci
 hotplug in q35
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::52d;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 17, 2021 at 10:11 AM Ani Sinha <ani@anisinha.ca> wrote:
>
>
>
> On Thu, 16 Sep 2021, Michael S. Tsirkin wrote:
>
> > On Thu, Sep 16, 2021 at 06:58:35PM +0530, Ani Sinha wrote:
> > > Here's sending v2.
> > >
> > > changelog :
> > > v1: original patch.
> > > v2: typo fixed. reviewed-by tags added.
> >
> >
> > Thanks, tagged!
> > Ani pls make sure the voer letter in the series has
> > subject
> >
> > [PATCH 0/3] hw/i386/acpi: fix conflicting IO address range for acpi pci
> >  hotplug in q35
> >
> >
> > using --cover-letter with git format-patch will do this automatically.
> >
> > It will also include diffstat and other useful info.
>
> Ah I see. I was wondering about this few days back because I saw a
> patchset with diffstat etc. I use git send-email --cover -v2 -3 -cc
> --cc-cmd etc. I did not realize that git format-patch also has similar
> options and adds more info to the cover letter. I wonder why the behavior
> is different between them.  Also --cc-cmd is missing in format-patch!

Also note that checkpatch.pl can be run without spitting out the
patches in separate files:

./scripts/checkpatch.pl HEAD~3..HEAD
1/3 Checking commit 0a4f1a3d8733 (bios-tables-test: allow changes in
DSDT ACPI tables for q35)
total: 0 errors, 0 warnings, 12 lines checked

Patch 1/3 has no obvious style problems and is ready for submission.
2/3 Checking commit 5adcc9e39e6a (hw/i386/acpi: fix conflicting IO
address range for acpi pci hotplug in q35)
total: 0 errors, 0 warnings, 8 lines checked

Patch 2/3 has no obvious style problems and is ready for submission.
3/3 Checking commit 5e0a8181d2d9 (bios-tables-test: Update ACPI DSDT
table golden blobs for q35)
total: 0 errors, 0 warnings, 1 lines checked

Patch 3/3 has no obvious style problems and is ready for submission.

So I guess the workflow should always be :
1) use git format-patch -o <dir>
2) run checkpatch on patches in dir
3) git send-email dir/*.patch

>
> Was this an essential complexity or accidental one :-)
>
>
>
> >
> >
> > > This issue has been reported here:
> > > https://gitlab.com/qemu-project/qemu/-/issues/561
> > >
> > > We have disucssed this issue at length here:
> > > https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg02146.html
> > >
> > > This issue affects Qemu version 6.1.
> > >
> > > Patch 1 : allows q35 DSDT table changes.
> > > Patch 2 : actual fix.
> > > Patch 3: updates DSDT table blobs.
> > >
> > >
> >
> >

