Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD649410971
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 05:01:27 +0200 (CEST)
Received: from localhost ([::1]:41436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRn54-0006u4-TZ
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 23:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mRn3g-0006D7-Sa
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 23:00:00 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:35348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mRn3f-0008Ln-27
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 23:00:00 -0400
Received: by mail-pl1-x633.google.com with SMTP id bb10so8812456plb.2
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 19:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=tGqJhurf0btyMKa8P6QZg9RUR1IsqaMuIeXwFNPkALo=;
 b=NM0GNbd7vRWVgKihKi5U4Loyqlh+9D8YpPG3xg+2qNdEXmQ72ROESpQXCMVyHvE0wE
 b4JiQ2/aoX6zG/tx0gQo/6ji7RlLyXxaaxr3zKD+hhVD3vg4rgSbHdIMtP50N5HVo/yP
 jrvOwDOqnW5TztbuOJ3YiqQObHXYdXalVcUKxMnogwq5Kp7emmiwTs4J5Jq5ImeZjFl3
 bWcB09jJiiUrJqvwdYvAvQrX/EiQm2nfZsZNPRFSn/kj4Ws2ZReX+AJzB3ZjwKIj4hMv
 xnTnXSpCyplPGszwbOBD2Vhn3D1hZPIWACNXEnvergraD3JZFeKHsoZo005A3daEguYq
 Vgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=tGqJhurf0btyMKa8P6QZg9RUR1IsqaMuIeXwFNPkALo=;
 b=kE02V+xYCYuxON7InSkfPPXqJcRcoXpC5oJBoZpzAr3so/zdoJ06C+vc4arvCphz7y
 39izr3lkbBn3glNgtzjSP6ddWiIKGkVAs8hg1Fuv7EhNNw7DlTQPbhwgqOmAEcNwV8Je
 ojUO6+SWH+dMH7qsQXQnHrdmtfqrS18V90xtTfC4o2dCKo7z4rxZ2G+MyMTMSY8t+8l7
 jzbMkwArQpl0RP0VJL/qkmcga0fGl/r2h/VJ/PLq9TlCFvJvr5RDHrhi0tedj0Mfopjh
 oEl9H7RpcmIOS8jQi+5p+mC/+yg0vSKtEr6cMVk6WUZKgtKV5SDPRrSDFcqIY8bp1Btc
 O2Aw==
X-Gm-Message-State: AOAM532ye7cer78IN3sElVmO4cZmyBAoQB7DDONz2Y7s0PlEhg+plyN/
 ouEkDgSe2ttyEtsY/02nclrZUw==
X-Google-Smtp-Source: ABdhPJx/+Zxd+wGGF7+zjqApp7zVkewO4Aj1RTJnSJqY+7rw2Ss8VRM0MDHgx8ANifbaQcaNReYXVA==
X-Received: by 2002:a17:902:9303:b029:12c:29c:43f9 with SMTP id
 bc3-20020a1709029303b029012c029c43f9mr16651517plb.5.1632020397209; 
 Sat, 18 Sep 2021 19:59:57 -0700 (PDT)
Received: from anisinha-lenovo ([203.212.243.59])
 by smtp.googlemail.com with ESMTPSA id u15sm9494824pfi.123.2021.09.18.19.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 19:59:56 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Sun, 19 Sep 2021 08:29:51 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [RFC PATCH] tests/acpi/pcihp: add unit tests for hotplug on
 multifunction bridges for q35
In-Reply-To: <alpine.DEB.2.22.394.2109190814020.3818584@anisinha-lenovo>
Message-ID: <alpine.DEB.2.22.394.2109190822510.3818584@anisinha-lenovo>
References: <20210806174642.490023-1-ani@anisinha.ca>
 <20210806174642.490023-2-ani@anisinha.ca>
 <20210917153248.6ef88697@redhat.com>
 <alpine.DEB.2.22.394.2109190814020.3818584@anisinha-lenovo>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::633;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x633.google.com
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Sun, 19 Sep 2021, Ani Sinha wrote:

>
>
> On Fri, 17 Sep 2021, Igor Mammedov wrote:
>
> > On Fri,  6 Aug 2021 23:16:42 +0530
> > Ani Sinha <ani@anisinha.ca> wrote:
> >
> > > commit d7346e614f4ec ("acpi: x86: pcihp: add support hotplug on multifunction bridges")
> > > added ACPI hotplug descriptions for cold plugged bridges for functions other
> > > than 0. For all other devices, the ACPI hotplug descriptions are limited to
> > > function 0 only. This change adds unit tests for this feature.
> > >
> > > The diff of ACPI DSDT table before and after the change d7346e614f4e with the
> > > same newly added unit test is provided below:
> >
> > ASL below should be updated to match actual diff it's spewing out
> > (I get more than it mentioned below)
>
> No. this diff is correct. This is the diff of the DSDT table before and
> after appplying your change with the same unit test. So this diff shows
> what effectively changes in the DSDT table when your fix
>
> d7346e614f4ec ("acpi: x86: pcihp: add support hotplug on multifunction
> bridges")
>
> is applied. So I think it is important to capture this data. I will
> clarify the diff more clearly in the commit log in the next version.
>
>
> >
> > > @@ -5,13 +5,13 @@
> > >   *
> > >   * Disassembling to symbolic ASL+ operators
> > >   *
> > > - * Disassembly of /tmp/aml-35UR70, Fri Aug  6 21:00:03 2021
> > > + * Disassembly of /tmp/aml-GY8760, Fri Aug  6 21:10:31 2021
> > >   *
> > >   * Original Table Header:
> > >   *     Signature        "DSDT"
> > > - *     Length           0x0000206A (8298)
> > > + *     Length           0x000020F3 (8435)
> > >   *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
> > > - *     Checksum         0x59
> > > + *     Checksum         0x1B
> > >   *     OEM ID           "BOCHS "
> > >   *     OEM Table ID     "BXPC    "
> > >   *     OEM Revision     0x00000001 (1)
> > > @@ -20,28 +20,6 @@
> > >   */
> > >  DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
> > >  {
> > > -    /*
> > > -     * iASL Warning: There was 1 external control method found during
> > > -     * disassembly, but only 0 were resolved (1 unresolved). Additional
> > > -     * ACPI tables may be required to properly disassemble the code. This
> > > -     * resulting disassembler output file may not compile because the
> > > -     * disassembler did not know how many arguments to assign to the
> > > -     * unresolved methods. Note: SSDTs can be dynamically loaded at
> > > -     * runtime and may or may not be available via the host OS.
> > > -     *
> > > -     * In addition, the -fe option can be used to specify a file containing
> > > -     * control method external declarations with the associated method
> > > -     * argument counts. Each line of the file must be of the form:
> > > -     *     External (<method pathname>, MethodObj, <argument count>)
> > > -     * Invocation:
> > > -     *     iasl -fe refs.txt -d dsdt.aml
> > > -     *
> > > -     * The following methods were unresolved and many not compile properly
> > > -     * because the disassembler had to guess at the number of arguments
> > > -     * required for each:
> > > -     */
> > > -    External (_SB_.PCI0.S09_.PCNT, MethodObj)    // Warning: Unknown method, guessing 1 arguments
> > > -
> > >      Scope (\)
> > >      {
> > >          OperationRegion (DBG, SystemIO, 0x0402, One)
> > > @@ -3280,9 +3258,45 @@
> > >                  }
> > >              }
> > >
> > > +            Device (S09)
> > > +            {
> > > +                Name (_ADR, 0x00010001)  // _ADR: Address
> > > +                Name (BSEL, Zero)
> > > +                Device (S00)
> > > +                {
> > > +                    Name (_SUN, Zero)  // _SUN: Slot User Number
> > > +                    Name (_ADR, Zero)  // _ADR: Address
> > > +                    Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device, x=0-9
> > > +                    {
> > > +                        PCEJ (BSEL, _SUN)
> > > +                    }
> > > +
> > > +                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
> > > +                    {
> > > +                        Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
> > > +                    }
> > > +                }
> > > +
> > > +                Method (DVNT, 2, NotSerialized)
> > > +                {
> > > +                    If ((Arg0 & One))
> > > +                    {
> > > +                        Notify (S00, Arg1)
> > > +                    }
> > > +                }
> > > +
> > > +                Method (PCNT, 0, NotSerialized)
> > > +                {
> > > +                    BNUM = Zero
> > > +                    DVNT (PCIU, One)
> > > +                    DVNT (PCID, 0x03)
> > > +                }
> > > +            }
> > > +
> > >              Method (PCNT, 0, NotSerialized)
> > >              {
> > > -                ^S09.PCNT (^S08.PCNT ())
> > > +                ^S09.PCNT ()
> > > +                ^S08.PCNT ()
> > >              }
> > >          }
> > >      }
> > >
> > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > ---
> > >  tests/qtest/bios-tables-test.c | 28 ++++++++++++++++++++++++++++
> > >  1 file changed, 28 insertions(+)
> > >
> > > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > > index 51d3a4e239..c92b70e8b8 100644
> > > --- a/tests/qtest/bios-tables-test.c
> > > +++ b/tests/qtest/bios-tables-test.c
> > > @@ -859,6 +859,33 @@ static void test_acpi_q35_tcg_bridge(void)
> > >      free_test_data(&data);
> > >  }
> > >
> > > +static void test_acpi_q35_multif_bridge(void)
> > > +{
> > > +    test_data data = {
> > > +        .machine = MACHINE_Q35,
> > > +        .variant = ".multi-bridge",
> >
> > > +        .required_struct_types = base_required_struct_types,
> > > +        .required_struct_types_len = ARRAY_SIZE(base_required_struct_types)
> > do we care, i.e. why is this here?
>
> This verifies the smbios struct. It seems most of the other tests uses it.
> So I left it in this test also.
> Which of the tests should not be testing smbios?

Right now smbios is only tested for non-uefi firmware. There are lots
of tests that does not use uefi yet exercize the smbios struct tests.
For example:

test_acpi_piix4_tcg
test_acpi_piix4_tcg_bridge
test_acpi_piix4_no_root_hotplug
test_acpi_piix4_no_bridge_hotplug
test_acpi_piix4_no_acpi_pci_hotplug
test_acpi_q35_tcg
test_acpi_q35_tcg_bridge
test_acpi_q35_tcg_mmio64
test_acpi_q35_tcg_ipmi
test_acpi_piix4_tcg_ipmi

Should the smbios struct verification tests be removed from all of them?


> Maybe we can remove this
> from other tests (even the ones that I added earlier)? I wasnt' sure so
> maybe you can clarify.


>
>
> >
> > > +    };
> > > +    /*
> > > +     * lets try three things:
> > s/try .../test following configuration/
> >
> > > +     * (a) a multifunction bridge device
> > > +     * (b) a bridge device with function 1
> > > +     * (c) a non-bridge device with function 2
> > > +     * We should see AML hotplug descriptions for (a) and (b) in DSDT.
> > > +     * For (a) it should have a hotplug AML description for function 0.
> > > +     */
> >
> > A little bit hard to parse this comment, maybe explain a bit more
> > what is being tested
> > also I'd move this comment into commit message
>
> OK will do in next revision.
>
> >
> > > +    test_acpi_one("-nodefaults -device pcie-root-port,id=pcie-root-port-0,"
> > > +                  "multifunction=on,"
> > > +                  "port=0x0,chassis=1,addr=0x1,bus=pcie.0 "
> > > +                  "-device pcie-root-port,id=pcie-root-port-1,"
> > > +                  "port=0x1,chassis=2,addr=0x1.0x1,bus=pcie.0 "
> > > +                  "-device virtio-balloon,id=balloon0,"
> > > +                  "bus=pcie.0,addr=0x1.0x2",
> > > +                  &data);
> > > +    free_test_data(&data);
> > > +}
> > > +
> > >  static void test_acpi_q35_tcg_mmio64(void)
> > >  {
> > >      test_data data = {
> > > @@ -1528,6 +1555,7 @@ int main(int argc, char *argv[])
> > >                         test_acpi_piix4_no_acpi_pci_hotplug);
> > >          qtest_add_func("acpi/q35", test_acpi_q35_tcg);
> > >          qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
> > > +        qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
> > >          qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
> > >          qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
> > >          qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
> >
> >
>

