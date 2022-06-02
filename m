Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EF253BCA6
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 18:39:36 +0200 (CEST)
Received: from localhost ([::1]:36802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwnrC-00016N-Dl
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 12:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nwnja-0003EY-Pt
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 12:31:43 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:36691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nwnjX-0001s0-Px
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 12:31:41 -0400
Received: by mail-ed1-x52c.google.com with SMTP id fd25so6967480edb.3
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 09:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xiG0r+isXinQbQ7f9fbWWS7furE5yI6O/p5CMdL5u6g=;
 b=jIy301ZMCCsT+IGHx1anczvRk9be09ZE3YW51TgRI/cTfYjQRv1z5vJmOH9B01o6lo
 vy/iltHPRf4FDPMy8vI+AgqtX2wKOO5yYelQW+qdAYmnGno7nlTc9Y/dXHYLO9tHJYWw
 ZV/ax1uCUITttJ+am1ikYVMoL4DrAL04gpQeT0IVN3Xcyhmc9ZUfZqx/yGrst6SWqXZ4
 l6gkx02TI6lYzApwIP6xmUFSJXQzFMv+/7jmbJh5IwOY5W0lseNaW6aNSd7wVptr+5e/
 m+ER5xpjwJXOUJoWs0xOmCgTSWa1uTU6sTtfvuYCSotcJLPAeheh4i8lJW4RaQqTMiQJ
 U4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xiG0r+isXinQbQ7f9fbWWS7furE5yI6O/p5CMdL5u6g=;
 b=Isl7TDqntMh6itiIX0QoOcvRC9721x+DD8EtWB8TPQlN1rabjA3LbOQORlXs8uQyXC
 DTtn06k1zvwF8nULSfHNR/iNG9GQC4NeDtQZeFCZCvWeghkVPF6hyylxbUudfvQshqW2
 ggZqjS9cV0eMzrGrgY85cMhNc0j1SEiiHXTnz2tv4V5VBmAewETXSkc0ua0pTTWwo8bG
 1eL9PmZx2rSI8j84Fbu1IAFlkJkgMu5ki7TGoZYSA9QvA0JB3gZOcUzYqpwrsFSBCveu
 obK6kQ6SN6dTTe9VpYXFIefK770/CXSPuxZGfydpp5EB8R9r2JXO+uZGRGOefs6F83lU
 5ewQ==
X-Gm-Message-State: AOAM531NtWR83egpa5ZmzsGKoMofP/+z7kmOFtCZZuIuQUxoUb/NRJXb
 GBH97Q+4yVH97u2KDLuNZFLv3vbq67CvoM4OBOUhrw==
X-Google-Smtp-Source: ABdhPJz4L+pVj58Pto65T+tZU6vzL2FwXyqUQW2GYGIqLTI4GOTLRXJ5s61HEWZCLCwJYiiHYNM4e8PMzZVhGAahzi8=
X-Received: by 2002:aa7:ce96:0:b0:42d:e1ae:6815 with SMTP id
 y22-20020aa7ce96000000b0042de1ae6815mr6393860edv.109.1654187497063; Thu, 02
 Jun 2022 09:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220527165651.28092-1-jusual@redhat.com>
 <20220527165651.28092-5-jusual@redhat.com>
 <20220602172007.27cd7e81@redhat.com>
In-Reply-To: <20220602172007.27cd7e81@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 2 Jun 2022 22:01:26 +0530
Message-ID: <CAARzgwz1s60VNjvcckYi1EZ5QxBy94qhG=AGR=sAN0s=zvHymA@mail.gmail.com>
Subject: Re: [PATCH 4/5] bios-tables-test: add test for number of cores > 255
To: Igor Mammedov <imammedo@redhat.com>
Cc: Julia Suvorova <jusual@redhat.com>, qemu-devel@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::52c;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52c.google.com
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

On Thu, Jun 2, 2022 at 8:50 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Fri, 27 May 2022 18:56:50 +0200
> Julia Suvorova <jusual@redhat.com> wrote:
>
> > The new test is run with a large number of cpus and checks if the
> > core_count field in smbios_cpu_test (structure type 4) is correct.
> >
> > Choose q35 as it allows to run with -smp > 255.
> >
> > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > ---
> >  tests/qtest/bios-tables-test.c | 35 +++++++++++++++++++++++++++++++++-
> >  1 file changed, 34 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > index 0ba9d749a5..f2464adaa0 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -100,6 +100,8 @@ typedef struct {
> >      smbios_entry_point smbios_ep_table;
> >      uint16_t smbios_cpu_max_speed;
> >      uint16_t smbios_cpu_curr_speed;
> > +    uint8_t smbios_core_count;
> > +    uint16_t smbios_core_count2;
> >      uint8_t *required_struct_types;
> >      int required_struct_types_len;
> >      QTestState *qts;
> > @@ -640,8 +642,9 @@ static inline bool smbios_single_instance(uint8_t type)
> >
> >  static bool smbios_cpu_test(test_data *data, uint32_t addr)
> >  {
> > +    uint8_t real_cc, expect_cc = data->smbios_core_count;
>
> %s/expect/expected/
> also I'd s/real_cc/core_count/

If you are going to go that path, I would suggest real_core_count and
exp_core_count.

>
> > +    uint16_t real, real_cc2, expect_cc2 = data->smbios_core_count2;
> ditto
>
> >      uint16_t expect_speed[2];
> > -    uint16_t real;
> >      int offset[2];
> >      int i;
> >
> > @@ -660,6 +663,20 @@ static bool smbios_cpu_test(test_data *data, uint32_t addr)
> >          }
> >      }
> >
> > +    real_cc = qtest_readb(data->qts, addr + offsetof(struct smbios_type_4, core_count));
> > +    real_cc2 = qtest_readw(data->qts, addr + offsetof(struct smbios_type_4, core_count2));
> > +
> > +    if (expect_cc && (real_cc != expect_cc)) {
> > +        fprintf(stderr, "Unexpected SMBIOS CPU count: real %u expect %u\n",
> > +                real_cc, expect_cc);
> > +        return false;
>
> since you are rewriting it anyways, how about
> if (expect_cc) {
>   g_assert_cmpuint(...)
> }
>
> instead of printing/propagating error
>
> > +    }
> > +    if ((expect_cc == 0xFF) && (real_cc2 != expect_cc2)) {
> > +        fprintf(stderr, "Unexpected SMBIOS CPU count2: real %u expect %u\n",
> > +                real_cc2, expect_cc2);
> > +        return false;
> > +    }
> > +
> >      return true;
> >  }
> >
> > @@ -905,6 +922,21 @@ static void test_acpi_q35_tcg(void)
> >      free_test_data(&data);
> >  }
> >
> > +static void test_acpi_q35_tcg_core_count2(void)
> > +{
> > +    test_data data = {
> > +        .machine = MACHINE_Q35,
> > +        .variant = ".core-count2",
> > +        .required_struct_types = base_required_struct_types,
> > +        .required_struct_types_len = ARRAY_SIZE(base_required_struct_types),
> > +        .smbios_core_count = 0xFF,
> > +        .smbios_core_count2 = 275,
> > +    };
> > +
> > +    test_acpi_one("-machine smbios-entry-point-type=64 -smp 275", &data);
> > +    free_test_data(&data);
> > +}
> > +
> >  static void test_acpi_q35_tcg_bridge(void)
> >  {
> >      test_data data;
> > @@ -1787,6 +1819,7 @@ int main(int argc, char *argv[])
> >          qtest_add_func("acpi/piix4/pci-hotplug/off",
> >                         test_acpi_piix4_no_acpi_pci_hotplug);
> >          qtest_add_func("acpi/q35", test_acpi_q35_tcg);
> > +        qtest_add_func("acpi/q35/core-count2", test_acpi_q35_tcg_core_count2);
> >          qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
> >          qtest_add_func("acpi/q35/multif-bridge", test_acpi_q35_multif_bridge);
> >          qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
>

