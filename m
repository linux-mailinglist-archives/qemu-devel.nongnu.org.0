Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BB25391CF
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 15:27:01 +0200 (CEST)
Received: from localhost ([::1]:38346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw1tk-0005xN-0e
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 09:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nw1i2-000628-Mc
 for qemu-devel@nongnu.org; Tue, 31 May 2022 09:14:54 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:35518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nw1hz-00080Y-FC
 for qemu-devel@nongnu.org; Tue, 31 May 2022 09:14:54 -0400
Received: by mail-ed1-x531.google.com with SMTP id t5so17485360edc.2
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 06:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s5Y0z43EVd8TZjWHejK+9X+L1A0POYtwaj2PYzppy3U=;
 b=wd6LshtS3XkRb69AuOFG1f2gmKYZq3/8QYL2UpwD0p5ApYOORLYe3+FbcOLLqGT9tP
 YabbfbLI+YPPnvMVtuthatbjd4QNGdU+ZCM2mWhHgyMWZ7Cz4XatQmzz6gpWti4455l/
 JmETyzdtof8kEGn0cAexuuyY9U9hhTKQOZoL6vkc8fQp08xGWlvdDhaA1Rty8wgcLZ6H
 ocbOCzwb5d6ddE7fslgk0sgqi2wYXuNv9KonBmmLmcOD4BFi5q8rYiRgNmS7HI7ZRzt9
 FTqC9YmVdstwa0tAQSgkItfEYaNG0eTSpRuv3ghuApqM/WqTfvCkbn79Ip94vKT9kP8C
 kz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s5Y0z43EVd8TZjWHejK+9X+L1A0POYtwaj2PYzppy3U=;
 b=OEd90JEdpaTBNPgHlOysanx6r21opdfNf6ewo6VFBVs4z4B8SMsXmGBV0M+0+3sesj
 76vGgwIbPlNo//Q1dE4TUjLkYEesuB1NgzpNAuBP/4MLlD3Hybu0MVj38PT/VHkI4Cb8
 YzMN6xPoMvuAc1oAUOn1x3FL0U8gQwxJKqr7piR3/Qvd/A0mc9fj6tl1gbYIBDhhYpeu
 Y2B3TCCZv+H2yuxaqUEjF9s+Pr0vv16jTKlBYiGrmQZ81U67s0T8+4NDfKq4OJAnU6TV
 NWOZqylvMY9S/y0ebwscpAxYveH7ToykeCaPjK0qrT4wMei2dJC4A0KMymgliDEaoZcl
 IPTQ==
X-Gm-Message-State: AOAM533I2hhEwwJwLUfTXgJNh4Ncn+7TNFDtL1io79soaaj1hrEVdNlw
 scCMFHdvhooAbOTevxlZJURrorD/vkwVuSCdafvNNQ==
X-Google-Smtp-Source: ABdhPJyd96MfI0zLuQmCp0riQq/drDv7nQPBa5tyj6GbwFxwroe+JGX5FdCr586fWhqUG2189gnXAHD289nvus4jOB4=
X-Received: by 2002:a05:6402:26cb:b0:42b:6bc4:ce48 with SMTP id
 x11-20020a05640226cb00b0042b6bc4ce48mr27302152edd.133.1654002889572; Tue, 31
 May 2022 06:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220527165651.28092-1-jusual@redhat.com>
 <20220527165651.28092-5-jusual@redhat.com>
 <alpine.DEB.2.22.394.2205281039380.153682@anisinha-lenovo>
 <CAMDeoFVbjhKvAdNrn5xJ+g3Vk_vr48byPhP2KZpYQGCjEZNNsA@mail.gmail.com>
In-Reply-To: <CAMDeoFVbjhKvAdNrn5xJ+g3Vk_vr48byPhP2KZpYQGCjEZNNsA@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 31 May 2022 18:44:38 +0530
Message-ID: <CAARzgwxgq8d2qPTvzm7wsYU0LfYY9D+euSo84+ieBCqQpmaEDw@mail.gmail.com>
Subject: Re: [PATCH 4/5] bios-tables-test: add test for number of cores > 255
To: Julia Suvorova <jusual@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::531;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x531.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 31, 2022 at 5:53 PM Julia Suvorova <jusual@redhat.com> wrote:
>
> On Sat, May 28, 2022 at 7:22 AM Ani Sinha <ani@anisinha.ca> wrote:
> >
> >
> >
> > On Fri, 27 May 2022, Julia Suvorova wrote:
> >
> > > The new test is run with a large number of cpus and checks if the
> > > core_count field in smbios_cpu_test (structure type 4) is correct.
> > >
> > > Choose q35 as it allows to run with -smp > 255.
> > >
> > > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > > ---
> > >  tests/qtest/bios-tables-test.c | 35 +++++++++++++++++++++++++++++++++-
> > >  1 file changed, 34 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > > index 0ba9d749a5..f2464adaa0 100644
> > > --- a/tests/qtest/bios-tables-test.c
> > > +++ b/tests/qtest/bios-tables-test.c
> > > @@ -100,6 +100,8 @@ typedef struct {
> > >      smbios_entry_point smbios_ep_table;
> > >      uint16_t smbios_cpu_max_speed;
> > >      uint16_t smbios_cpu_curr_speed;
> > > +    uint8_t smbios_core_count;
> > > +    uint16_t smbios_core_count2;
> > >      uint8_t *required_struct_types;
> > >      int required_struct_types_len;
> > >      QTestState *qts;
> > > @@ -640,8 +642,9 @@ static inline bool smbios_single_instance(uint8_t type)
> > >
> > >  static bool smbios_cpu_test(test_data *data, uint32_t addr)
> > >  {
> > > +    uint8_t real_cc, expect_cc = data->smbios_core_count;
> > > +    uint16_t real, real_cc2, expect_cc2 = data->smbios_core_count2;
> > >      uint16_t expect_speed[2];
> > > -    uint16_t real;
> >
> > while you are at it, I suggest renaming this to real_speed or some such so
> > that its better redeable.
>
> Ok
>
> > >      int offset[2];
> > >      int i;
> > >
> > > @@ -660,6 +663,20 @@ static bool smbios_cpu_test(test_data *data, uint32_t addr)
> > >          }
> > >      }
> > >
> > > +    real_cc = qtest_readb(data->qts, addr + offsetof(struct smbios_type_4, core_count));
> > > +    real_cc2 = qtest_readw(data->qts, addr + offsetof(struct smbios_type_4, core_count2));
> > > +
> > > +    if (expect_cc && (real_cc != expect_cc)) {
> >
> > I think better to say if ((expect_cc < 256) && (real_cc != expect_cc))
>
> The check is not whether it fits into the field, but whether the field
> is initialized.

yes so the real_cc will contain the actual value of core count only
when the core count value is less than 256. This value should be the
same as the expect_cc (the cc value we pass). Is this not what is
being tested?

>
> > > +        fprintf(stderr, "Unexpected SMBIOS CPU count: real %u expect %u\n",
> > > +                real_cc, expect_cc);
> > > +        return false;
> > > +    }
> > > +    if ((expect_cc == 0xFF) && (real_cc2 != expect_cc2)) {
> > > +        fprintf(stderr, "Unexpected SMBIOS CPU count2: real %u expect %u\n",
> > > +                real_cc2, expect_cc2);
> > > +        return false;
> > > +    }
> > > +
> > >      return true;
> > >  }
> > >
> > > @@ -905,6 +922,21 @@ static void test_acpi_q35_tcg(void)
> > >      free_test_data(&data);
> > >  }
> > >
> > > +static void test_acpi_q35_tcg_core_count2(void)
> > > +{
> > > +    test_data data = {
> > > +        .machine = MACHINE_Q35,
> > > +        .variant = ".core-count2",
> > > +        .required_struct_types = base_required_struct_types,
> > > +        .required_struct_types_len = ARRAY_SIZE(base_required_struct_types),
> > > +        .smbios_core_count = 0xFF,
> > > +        .smbios_core_count2 = 275,
> > > +    };
> > > +
> > > +    test_acpi_one("-machine smbios-entry-point-type=64 -smp 275", &data);
> > > +    free_test_data(&data);
> > > +}
> > > +
> > >  static void test_acpi_q35_tcg_bridge(void)
> > >  {
> > >      test_data data;
> > > @@ -1787,6 +1819,7 @@ int main(int argc, char *argv[])
> > >          qtest_add_func("acpi/piix4/pci-hotplug/off",
> > >                         test_acpi_piix4_no_acpi_pci_hotplug);
> > >          qtest_add_func("acpi/q35", test_acpi_q35_tcg);
> > > +        qtest_add_func("acpi/q35/core-count2", test_acpi_q35_tcg_core_count2);
> >
> > How about checking thread count as well in the same test or in a
> > different test?
>
> Maybe a different test.
>
> Best regards, Julia Suvorova.
>
> > >          qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
> > >          qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
> > >          qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
> > > --
> > > 2.35.1
> > >
> > >
> >
>

