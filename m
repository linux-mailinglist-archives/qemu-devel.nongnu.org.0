Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 524893FD96E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:22:12 +0200 (CEST)
Received: from localhost ([::1]:40688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPFr-0001ZC-DY
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mLPCQ-0008Ae-7E
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:18:39 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:38741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mLPCO-0000rK-4B
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 08:18:37 -0400
Received: by mail-ej1-x62f.google.com with SMTP id n27so6183412eja.5
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 05:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DxQ8cqKbg/94b5cEyUxF4jkhpq7XIe8H3Q4JVFB+gMQ=;
 b=bckjK1MyU20+1MRacu86a0rSxOPHGDPa78ivZoInKlkse7JZ9sR1RBJKPWOpT3g2Pe
 QzeRre8eny65dc8MhMR2eWdezU8tgmpppb4hVfXMugUGnu1our/XVTYMdIN/NDHgKQN2
 qbn7pRmGo8w3S7uLoWzGtWH+sSCWDmOXDfhF3tZZBnYT2Yi6S4o9FGA32zUHHQ+H7IxW
 En/Zltsm1Esch56s4ybuPUdK/UhkJnYcyFocMXLwEFA1qOZcUqsRSuXrIZv/z4LPlEvt
 crCgVBt+Jx+qg1EzEQDcUo7KdVvcPJHAkihiB67G0sL7nogT2cNLnZ/w0EdDKLjpAmJ0
 fhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DxQ8cqKbg/94b5cEyUxF4jkhpq7XIe8H3Q4JVFB+gMQ=;
 b=rNTv9ADtTN+JBE2envK808sz2h7/zDxdAy4dhY9onMOO1yVTb4ZQr0YwwSirVMdyBx
 8xAFM3VvBi5SGWCwvfXDgF6npCOvx4QRuSiutrfpsA9vZmt5WTu0BVzYCeGmjxQhkF+X
 Z1iTJLl5hciR745ktcyuaQg04HdiTa9j0rDhClZFE4/JKgmsLAIfj2LtX4ii8dQ0rqnZ
 82Y+otqnKqonPmcLTOrOonjmtHEZSlrFwVbyi/DbE5PjBBCVj0of68Zj86ENs2qsqi0J
 uFe1kypKygDxlcuXD3vdvtRm9KvFKiR7+G/QIpbQJqB94CFwVmnjjpCLais2aAKjknhY
 5oAg==
X-Gm-Message-State: AOAM530Bter/fEEe+8KPhO7BTsdfna/COM4NenkkPT6dA72rS0Y/E3ZM
 L4LWwbtgnf/MCr05cCVfaX9XSb2nvDFwIB+gnbJ58g==
X-Google-Smtp-Source: ABdhPJyGHAXiDAYY+BJEu0azq4kTpx+YAbMQo8uK6VUireGhts+tdaPoWxWcp84/wrGqEDimZu0ogeAEnlk+mQ4S9Ac=
X-Received: by 2002:a17:906:1d41:: with SMTP id
 o1mr37931081ejh.232.1630498713211; 
 Wed, 01 Sep 2021 05:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210806174642.490023-1-ani@anisinha.ca>
 <20210806174642.490023-2-ani@anisinha.ca>
 <alpine.DEB.2.22.394.2108162113390.186141@anisinha-lenovo>
In-Reply-To: <alpine.DEB.2.22.394.2108162113390.186141@anisinha-lenovo>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 1 Sep 2021 17:48:22 +0530
Message-ID: <CAARzgwyb+Rtr-=UzzN3xcAKApb_U37VeX0+jhjqbzCQkdi9Scg@mail.gmail.com>
Subject: Re: [RFC PATCH] tests/acpi/pcihp: add unit tests for hotplug on
 multifunction bridges for q35
To: Ani Sinha <ani@anisinha.ca>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::62f;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62f.google.com
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping ...

On Mon, Aug 16, 2021 at 9:14 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> Ping ...
>
> Igor, if this looks ok, I will send the entire patch series with the blobs
> updated.
>
> On Fri, 6 Aug 2021, Ani Sinha wrote:
>
> > commit d7346e614f4ec ("acpi: x86: pcihp: add support hotplug on multifunction bridges")
> > added ACPI hotplug descriptions for cold plugged bridges for functions other
> > than 0. For all other devices, the ACPI hotplug descriptions are limited to
> > function 0 only. This change adds unit tests for this feature.
> >
> > The diff of ACPI DSDT table before and after the change d7346e614f4e with the
> > same newly added unit test is provided below:
> >
> > @@ -5,13 +5,13 @@
> >   *
> >   * Disassembling to symbolic ASL+ operators
> >   *
> > - * Disassembly of /tmp/aml-35UR70, Fri Aug  6 21:00:03 2021
> > + * Disassembly of /tmp/aml-GY8760, Fri Aug  6 21:10:31 2021
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
> >  tests/qtest/bios-tables-test.c | 28 ++++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > index 51d3a4e239..c92b70e8b8 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -859,6 +859,33 @@ static void test_acpi_q35_tcg_bridge(void)
> >      free_test_data(&data);
> >  }
> >
> > +static void test_acpi_q35_multif_bridge(void)
> > +{
> > +    test_data data = {
> > +        .machine = MACHINE_Q35,
> > +        .variant = ".multi-bridge",
> > +        .required_struct_types = base_required_struct_types,
> > +        .required_struct_types_len = ARRAY_SIZE(base_required_struct_types)
> > +    };
> > +    /*
> > +     * lets try three things:
> > +     * (a) a multifunction bridge device
> > +     * (b) a bridge device with function 1
> > +     * (c) a non-bridge device with function 2
> > +     * We should see AML hotplug descriptions for (a) and (b) in DSDT.
> > +     * For (a) it should have a hotplug AML description for function 0.
> > +     */
> > +    test_acpi_one("-nodefaults -device pcie-root-port,id=pcie-root-port-0,"
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
> > @@ -1528,6 +1555,7 @@ int main(int argc, char *argv[])
> >                         test_acpi_piix4_no_acpi_pci_hotplug);
> >          qtest_add_func("acpi/q35", test_acpi_q35_tcg);
> >          qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
> > +        qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
> >          qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
> >          qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
> >          qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
> > --
> > 2.25.1
> >
> >

