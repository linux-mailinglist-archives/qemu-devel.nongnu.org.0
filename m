Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6654C424F12
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 10:19:44 +0200 (CEST)
Received: from localhost ([::1]:33548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYOcx-0002ag-EZ
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 04:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mYOZ8-000808-Ch
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 04:15:48 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:44016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mYOZ5-000361-UZ
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 04:15:46 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so4492001pji.2
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 01:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=4nTz/XUxU00rQBZyFssogXCfHvEwtrFpds4ZyifL5og=;
 b=X77npHLW4xwnE9yvkODrtxPR7EcaA9JhaB/u2lqxI7DtMUjKB87Up/LX/h4RzI996Y
 O8vSgJ5Q1P7AWKDYOCtiNeRPLBHDr1/hdkcmcW3D9AujwQ4Ao4lHuy4DAkO33PB4UUZ+
 4MAwu/Bzdk9miphvN+DMHW0h8eQpnGxCImyoKtnec8umcKS24bhCmUXuJP+4xVQOZ2la
 UyTz6eEut8Qv/tlxm9XNBy3u6zFGE7LKFHGckPpSkkpjC0f1+tJioOoxsawMtJnBN6hm
 uFKI1u3EKUcEXqUPMjV+KdFah4BAMp+CTOXHsirmwUezbtUInlqTBau2/FyVmrEIhV+f
 TdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=4nTz/XUxU00rQBZyFssogXCfHvEwtrFpds4ZyifL5og=;
 b=IbpKL22Wkz+PHUcKDc6jW3eNqw54UqB09PRMllA6DoXZcVDSjr73sTWWCsPiMpMPy5
 k7eWOttwbFEht4t6ogn/JNAyRqgYwgUljgXpKcizqkgbtei9Tjgw6cgHZq5exfovadfn
 w+IvMEJlHqCkIdN+HvpUVfy5OdvBO5IM2O/Xs9aSsPKhW73zyPTHmXqfLy5nV32L3eES
 wik3js4I+E2Z3rTQR6xc5b34WrQ1ffU5zPxQP5NtvjJX5MWXuQRmW+hW/Hi+x8zGjwU7
 iRCn0+U04XKLZQM+r9xlSKDEbEQgE1brTIfdoi4hopTz2YpQcO9Nrene/JSORw4KqF0R
 pImw==
X-Gm-Message-State: AOAM532YZu21xoNXQJNQJ0/euKDUB5oe+zXr3hVCEZyBYn7NlxUHU7HB
 Y3Isthjxyq6BFKhmeK+V0Fuk0w==
X-Google-Smtp-Source: ABdhPJzCnkD0MsfL24zTzwXJbMxSsGD3eZlriFZJa5n3YI2/VOpY7otmCRmU9tNZbSCkxsH5vZbD+A==
X-Received: by 2002:a17:902:8543:b029:12d:461f:a6a8 with SMTP id
 d3-20020a1709028543b029012d461fa6a8mr2553951plo.1.1633594541428; 
 Thu, 07 Oct 2021 01:15:41 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.196.214])
 by smtp.googlemail.com with ESMTPSA id e6sm13374448pgf.59.2021.10.07.01.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 01:15:40 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 7 Oct 2021 13:45:36 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 2/3] tests/acpi/pcihp: add unit tests for hotplug on
 multifunction bridges for q35
In-Reply-To: <20211007100700.327f1162@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2110071345060.820442@anisinha-lenovo>
References: <20210920070047.3937292-1-ani@anisinha.ca>
 <20210920070047.3937292-3-ani@anisinha.ca>
 <20211007100700.327f1162@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::102b;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102b.google.com
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
Cc: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Thu, 7 Oct 2021, Igor Mammedov wrote:

> On Mon, 20 Sep 2021 12:30:46 +0530
> Ani Sinha <ani@anisinha.ca> wrote:
>
> > commit d7346e614f4ec ("acpi: x86: pcihp: add support hotplug on multifunction bridges")
> > added ACPI hotplug descriptions for cold plugged bridges for functions other
> > than 0. For all other devices, the ACPI hotplug descriptions are limited to
> > function 0 only. This change adds unit tests for this feature.
> >
> > This test adds the following devices to qemu and then checks the changes
> > introduced in the DSDT table due to the addition of the following devices:
> >
> > (a) a multifunction bridge device
> > (b) a bridge device with function 1
> > (c) a non-bridge device with function 2
> >
> > In the DSDT table, we should see AML hotplug descriptions for (a) and (b).
> > For (a) we should find a hotplug AML description for function 0.
> >
> > The following diff compares the DSDT table AML with the new unit test before
> > and after the change d7346e614f4ec is introduced. In other words,
> > this diff reflects the changes that occurs in the DSDT table due to the change
> > d7346e614f4ec .
> >
> > @@ -5,13 +5,13 @@
> >   *
> >   * Disassembling to symbolic ASL+ operators
> >   *
> > - * Disassembly of /tmp/aml-7A7890, Sat Sep 18 13:13:29 2021
> > + * Disassembly of /tmp/aml-PE4S90, Sat Sep 18 13:08:54 2021
> >   *
> >   * Original Table Header:
> >   *     Signature        "DSDT"
> > - *     Length           0x0000206A (8298)
> > + *     Length           0x000020F3 (8435)
> >   *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
> > - *     Checksum         0x59
> > + *     Checksum         0x1B
> >   *     OEM ID           "BOCHS "
> >   *     OEM Table ID     "BXPC    "
> >   *     OEM Revision     0x00000001 (1)
> > @@ -20,28 +20,6 @@
> >   */
> >  DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
> >  {
> > -    /*
> > -     * iASL Warning: There was 1 external control method found during
> > -     * disassembly, but only 0 were resolved (1 unresolved). Additional
> > -     * ACPI tables may be required to properly disassemble the code. This
> > -     * resulting disassembler output file may not compile because the
> > -     * disassembler did not know how many arguments to assign to the
> > -     * unresolved methods. Note: SSDTs can be dynamically loaded at
> > -     * runtime and may or may not be available via the host OS.
> > -     *
> > -     * In addition, the -fe option can be used to specify a file containing
> > -     * control method external declarations with the associated method
> > -     * argument counts. Each line of the file must be of the form:
> > -     *     External (<method pathname>, MethodObj, <argument count>)
> > -     * Invocation:
> > -     *     iasl -fe refs.txt -d dsdt.aml
> > -     *
> > -     * The following methods were unresolved and many not compile properly
> > -     * because the disassembler had to guess at the number of arguments
> > -     * required for each:
> > -     */
> > -    External (_SB_.PCI0.S09_.PCNT, MethodObj)    // Warning: Unknown method, guessing 1 arguments
> > -
> >      Scope (\)
> >      {
> >          OperationRegion (DBG, SystemIO, 0x0402, One)
> > @@ -3280,9 +3258,45 @@
> >                  }
> >              }
> >
> > +            Device (S09)
> > +            {
> > +                Name (_ADR, 0x00010001)  // _ADR: Address
> > +                Name (BSEL, Zero)
> > +                Device (S00)
> > +                {
> > +                    Name (_SUN, Zero)  // _SUN: Slot User Number
> > +                    Name (_ADR, Zero)  // _ADR: Address
> > +                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > +                    {
> > +                        PCEJ (BSEL, _SUN)
> > +                    }
> > +
> > +                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
> > +                    {
> > +                        Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
> > +                    }
> > +                }
> > +
> > +                Method (DVNT, 2, NotSerialized)
> > +                {
> > +                    If ((Arg0 & One))
> > +                    {
> > +                        Notify (S00, Arg1)
> > +                    }
> > +                }
> > +
> > +                Method (PCNT, 0, NotSerialized)
> > +                {
> > +                    BNUM = Zero
> > +                    DVNT (PCIU, One)
> > +                    DVNT (PCID, 0x03)
> > +                }
> > +            }
> > +
> >              Method (PCNT, 0, NotSerialized)
> >              {
> > -                ^S09.PCNT (^S08.PCNT ())
> > +                ^S09.PCNT ()
> > +                ^S08.PCNT ()
> >              }
> >          }
> >      }
> >
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >  tests/qtest/bios-tables-test.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > index 4f11d03055..d4cd77ea02 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -859,6 +859,23 @@ static void test_acpi_q35_tcg_bridge(void)
> >      free_test_data(&data);
> >  }
> >
> > +static void test_acpi_q35_multif_bridge(void)
> > +{
> > +    test_data data = {
> > +        .machine = MACHINE_Q35,
> > +        .variant = ".multi-bridge",
> > +    };
> > +    test_acpi_one("-nodefaults -device pcie-root-port,id=pcie-root-port-0,"
>
> what's the reason for using "-nodefaults" here?

I have tried to use the same commandline that commit d7346e614f4ec
mentions as the repro case for the issue.


>
> > +                  "multifunction=on,"
> > +                  "port=0x0,chassis=1,addr=0x1,bus=pcie.0 "
> > +                  "-device pcie-root-port,id=pcie-root-port-1,"
> > +                  "port=0x1,chassis=2,addr=0x1.0x1,bus=pcie.0 "
> > +                  "-device virtio-balloon,id=balloon0,"
> > +                  "bus=pcie.0,addr=0x1.0x2",
> > +                  &data);
> > +    free_test_data(&data);
> > +}
> > +
> >  static void test_acpi_q35_tcg_mmio64(void)
> >  {
> >      test_data data = {
> > @@ -1534,6 +1551,7 @@ int main(int argc, char *argv[])
> >                         test_acpi_piix4_no_acpi_pci_hotplug);
> >          qtest_add_func("acpi/q35", test_acpi_q35_tcg);
> >          qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
> > +        qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
> >          qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
> >          qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
> >          qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
>
>

