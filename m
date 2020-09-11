Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F45826681F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 20:15:04 +0200 (CEST)
Received: from localhost ([::1]:57798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGnZf-0002i0-Mm
	for lists+qemu-devel@lfdr.de; Fri, 11 Sep 2020 14:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kGnVG-0005zI-UJ
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 14:10:30 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:39446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kGnVF-0006EI-3s
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 14:10:30 -0400
Received: by mail-wm1-x342.google.com with SMTP id b79so5609212wmb.4
 for <qemu-devel@nongnu.org>; Fri, 11 Sep 2020 11:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=URAH7WXrk6s4Noy+jgoHfYAFcO/gIgJ0g7+5O707IPM=;
 b=CKxLHReLMU/fQlynOZJtwMOH+0/XqORp4a01OXX3ct7aJYTkiPBhzLB5lr0xiqQZjX
 71zyuxlM/sW95TxRZkcUWYO7ukdqBz39yRRs0p2rpFeDOBLXdDMfTHtMUod7chP4Ci+d
 WR9pfVlvIeRqL70PEUQJN1iK7cLJlYt2zUeyHCcXDZGMjAQrg97cSR1G1ZtYleRXt9hL
 43ZX+rxcR0SbEgEut8YYfbBFX8Mb1CaddVZ4C1ZSh2IwwDtpXDvnhfrybBDpzAxqWCq4
 x9tCfTditfN1xYtrShN6K0sCNMs8sxtF/OwvlkXB42gX58ngo0oikV+X8QyCNaBqVwa5
 RR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=URAH7WXrk6s4Noy+jgoHfYAFcO/gIgJ0g7+5O707IPM=;
 b=lPjXIcsOxawmEoe+btGG1nkrIxTMYFqxoOt9OlmL0Uk5miDiWOQ7x6nmFqbxiWn4wo
 GLArixog7L3SjudPvjQioWU6Y1ibNVDlmguxDx7Cfd19M7T7VcoCswfUk5xcLgUxvvLN
 ylAyea7eW02F+srOHre9VCVZKgPJVn4o7BrhJIqvav6q/cDMOJlOZs5puNFQPNOdmRuG
 NLiAQZyeQSmqfDJjZvLVGO3X1er0ykvugmTlvlP+1dgcvkD1lwULWrAOhf7nL173bpiP
 pOfAp5jAUUVg0vPttauhcOyANXGWzp9HbFGkSyagJV/5wcz2pbUnMFYEuDZ9Z3L4ADX5
 Efqg==
X-Gm-Message-State: AOAM530O0TlvR45BLVQh19bFhwGE0rAnScISNzcOC3I5uO63rHW8zDqf
 KjQBSN1dfFmd4QK/pkpB7FWZevvMwJHVCalM0Ofqew==
X-Google-Smtp-Source: ABdhPJyVtJeSMlR8sD5XqEBU0Jbcq3045YzIO0JwWHAGoJ63sEmKo2rwBLyQYnmiYf2wKNQnR9412fuIPvrJvAam2Zg=
X-Received: by 2002:a05:600c:2182:: with SMTP id
 e2mr3453238wme.102.1599847827544; 
 Fri, 11 Sep 2020 11:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200905103520.12626-1-ani@anisinha.ca>
 <20200911120548-mutt-send-email-mst@kernel.org>
 <CAARzgwz9XkQQ=9t0bMp4qf=hMa+6Bb9MHtsffKED_aOTwHfvtQ@mail.gmail.com>
 <CAARzgwxHgUkh+gq+BHBLfJ3bPWeiwsC8ZtGr7Trngzs_C7DYdw@mail.gmail.com>
In-Reply-To: <CAARzgwxHgUkh+gq+BHBLfJ3bPWeiwsC8ZtGr7Trngzs_C7DYdw@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 11 Sep 2020 23:40:16 +0530
Message-ID: <CAARzgwy9fHzCimRXVwaun0T9Ld6PO2a=k3TzOuGFTpWS7FoE1Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] unit tests for change 'do not add hotplug related
 amls for cold plugged bridges'
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::342;
 envelope-from=ani@anisinha.ca; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Igor Mammedov <imammedo@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 11, 2020 at 9:51 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> I can't repro the breakage. What test command line are you running
> with? I am using " make check-qtest-x86_64 V=1"

Ok I was working off v5.1.0 tag. Did not realize. I rebased all my
patches to the latest master and reworked the unit tests.
I have sent you the entire patch set as exists in my workspace. It
passes unit tests.

>
> On Fri, Sep 11, 2020 at 9:41 PM Ani Sinha <ani@anisinha.ca> wrote:
> >
> > On Fri, Sep 11, 2020 at 9:38 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > >
> > > I am not sure why, but the expected files did not match for me.
> > >
> > > I dropped these for now:
> > >
> > > tests/acpi: add a new ACPI table in order to test root pci hotplug on/off
> > > tests/acpi: add a new unit test to test hotplug off/on feature on the root pci bus
> > > tests/acpi: document addition of table DSDT.roothp for unit testing root pci hotplug on/off
> >
> > This was already reviewed by Igor.
> >
> > > tests/acpi: add newly added acpi DSDT table blob for pci bridge hotplug flag
> > > tests/acpi: unit test for 'acpi-pci-hotplug-with-bridge-support' bridge flag
> > > tests/acpi: list added acpi table binary file for pci bridge hotplug test
> > >
> >
> > I will double check this one.
> >
> > > I suspect you have another change in there.
> > >
> > > Pls check and post a single series with all these tests.
> > >
> > > --
> > > MST
> > >

