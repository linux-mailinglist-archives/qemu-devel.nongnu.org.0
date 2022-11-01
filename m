Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46727615036
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:12:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oprkF-0005P6-Os; Tue, 01 Nov 2022 09:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oprkE-0005Ou-0t
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:55:58 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oprjx-0002zH-Qu
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 09:55:57 -0400
Received: by mail-qk1-x734.google.com with SMTP id g10so3010214qkl.6
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 06:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ff85hKne3A0aF9jaWxGL68Go4C89G3qho712CUJLjXg=;
 b=hsM6QR77R/u/Sk/VSJOmGaeB6Am1dHo8m4j5Kg1eV9nghl/5cd8yCZJCAsh2yzBv71
 PtRQAnU5N9GfoCR1sx+f0xUMu6ZrFi22zeZ2FtADtNcz73Jkint6W6XxrTUGNSYl1WmH
 /gX1FYi5vl6mjPojyn4f6K5zlGIYoppAgv1fBlU1t2mMHfTa3q7diq58Ufm1aik0T1UH
 Xn5Br8gR4FfH0hMuc/py93zh/tWLsAqw1hEm9kRrXJNWELHVkZjmaSCoaxI8KhdECrCg
 wLKts7m/8nYjgLC8J7pnIR+FJ2Lcjh3gzpVsMT2Wx65MTXCfSMPHSnX+VN33w3uNthfA
 67mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ff85hKne3A0aF9jaWxGL68Go4C89G3qho712CUJLjXg=;
 b=PxiflArGk07KcNaqEdzCcRZLPn2aLialV1AEzMvAMshHka7DFG4+NcSG7J3EG2p6ch
 oZe/M1YfdHodiOBhL4rW5oaCExDAXOHYAifQlUUwWhUd0qaoHawEP9K3RF4zNQHofSge
 oVPBX7D3BnJDIeJd5RDawescUJ1FOpMR/mMptqkZ5+AIm7yftjCCm7A9KK6oChuzT/qN
 6vr7kBqbG4kyBQCo2tA83+ZDbzKJdcI/n4Vp8GHAGNKIigjs9e9DYUos0legIkOo2DFt
 nZM6lw3VhuK6UWYoX3LWiuWvrRMv1i4daJwbWCRWZJ1SOZApHhOO9+AGGlbMTsKHzidU
 VS3w==
X-Gm-Message-State: ACrzQf1MK7AVLjA0WzyJf+aEvhCzr7fo+4VaWGseYdSx9zzY9on98VxX
 dFszWWj9n0rWB/BKshXkbP6cl6vw1HY2vPWegsbu6w==
X-Google-Smtp-Source: AMsMyM55Ac1+A9hxA5Krsu3e3xlFLYJyESR0CQ+KS+dwWVvPwWtiTOwL0SHZk4Bk9hxRB7DN5AjSZPuJob2XGJt5YE8=
X-Received: by 2002:a37:c242:0:b0:6fa:401d:a56c with SMTP id
 j2-20020a37c242000000b006fa401da56cmr4462113qkm.70.1667310939862; Tue, 01 Nov
 2022 06:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221031124928.128475-1-mst@redhat.com>
 <20221031124928.128475-22-mst@redhat.com>
 <20221101135221.00000a4a@huawei.com>
In-Reply-To: <20221101135221.00000a4a@huawei.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 1 Nov 2022 19:25:28 +0530
Message-ID: <CAARzgwwQw0wqBiSq03mh0uMkQw+HeYUZnBf18sbZ_WBBzoyR2w@mail.gmail.com>
Subject: Re: [PULL 21/86] bios-tables-test: add test for number of cores > 255
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Igor Mammedov <imammedo@redhat.com>, Julia Suvorova <jusual@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000004d0b8c05ec691449"
Received-SPF: none client-ip=2607:f8b0:4864:20::734;
 envelope-from=ani@anisinha.ca; helo=mail-qk1-x734.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000004d0b8c05ec691449
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 1, 2022 at 19:22 Jonathan Cameron <Jonathan.Cameron@huawei.com>
wrote:

> On Mon, 31 Oct 2022 08:51:44 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>
> > From: Julia Suvorova <jusual@redhat.com>
> >
> > The new test is run with a large number of cpus and checks if the
> > core_count field in smbios_cpu_test (structure type 4) is correct.
> >
> > Choose q35 as it allows to run with -smp > 255.
>
> Getting a failure on this on i386.
>
> qemu-system-i386: current -smp configuration requires kernel irqchip and
> X2APIC API support.
>
> Note that was on bisection of this pull request applied to current mainline
> (also in the CI report for the HMAT set - though there is another issue
> there.)


Can you point me to the CI report?


>
> My guess is fix is don't run it unless 64 bit?
>
> Jonathan
>
>
> >
> > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > Message-Id: <20220731162141.178443-5-jusual@redhat.com>
> > Message-Id: <20221011111731.101412-5-jusual@redhat.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  tests/qtest/bios-tables-test.c | 58 ++++++++++++++++++++++++++--------
> >  1 file changed, 45 insertions(+), 13 deletions(-)
> >
> > diff --git a/tests/qtest/bios-tables-test.c
> b/tests/qtest/bios-tables-test.c
> > index d4fbe6791d..e402b57d46 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -92,6 +92,8 @@ typedef struct {
> >      SmbiosEntryPoint smbios_ep_table;
> >      uint16_t smbios_cpu_max_speed;
> >      uint16_t smbios_cpu_curr_speed;
> > +    uint8_t smbios_core_count;
> > +    uint16_t smbios_core_count2;
> >      uint8_t *required_struct_types;
> >      int required_struct_types_len;
> >      QTestState *qts;
> > @@ -631,29 +633,42 @@ static inline bool smbios_single_instance(uint8_t
> type)
> >      }
> >  }
> >
> > -static bool smbios_cpu_test(test_data *data, uint32_t addr)
> > +static void smbios_cpu_test(test_data *data, uint32_t addr,
> > +                            SmbiosEntryPointType ep_type)
> >  {
> > -    uint16_t expect_speed[2];
> > -    uint16_t real;
> > +    uint8_t core_count, expected_core_count = data->smbios_core_count;
> > +    uint16_t speed, expected_speed[2];
> > +    uint16_t core_count2, expected_core_count2 =
> data->smbios_core_count2;
> >      int offset[2];
> >      int i;
> >
> >      /* Check CPU speed for backward compatibility */
> >      offset[0] = offsetof(struct smbios_type_4, max_speed);
> >      offset[1] = offsetof(struct smbios_type_4, current_speed);
> > -    expect_speed[0] = data->smbios_cpu_max_speed ? : 2000;
> > -    expect_speed[1] = data->smbios_cpu_curr_speed ? : 2000;
> > +    expected_speed[0] = data->smbios_cpu_max_speed ? : 2000;
> > +    expected_speed[1] = data->smbios_cpu_curr_speed ? : 2000;
> >
> >      for (i = 0; i < 2; i++) {
> > -        real = qtest_readw(data->qts, addr + offset[i]);
> > -        if (real != expect_speed[i]) {
> > -            fprintf(stderr, "Unexpected SMBIOS CPU speed: real %u
> expect %u\n",
> > -                    real, expect_speed[i]);
> > -            return false;
> > -        }
> > +        speed = qtest_readw(data->qts, addr + offset[i]);
> > +        g_assert_cmpuint(speed, ==, expected_speed[i]);
> >      }
> >
> > -    return true;
> > +    core_count = qtest_readb(data->qts,
> > +                    addr + offsetof(struct smbios_type_4, core_count));
> > +
> > +    if (expected_core_count) {
> > +        g_assert_cmpuint(core_count, ==, expected_core_count);
> > +    }
> > +
> > +    if (ep_type == SMBIOS_ENTRY_POINT_TYPE_64) {
> > +        core_count2 = qtest_readw(data->qts,
> > +                          addr + offsetof(struct smbios_type_4,
> core_count2));
> > +
> > +        /* Core Count has reached its limit, checking Core Count 2 */
> > +        if (expected_core_count == 0xFF && expected_core_count2) {
> > +            g_assert_cmpuint(core_count2, ==, expected_core_count2);
> > +        }
> > +    }
> >  }
> >
> >  static void test_smbios_structs(test_data *data, SmbiosEntryPointType
> ep_type)
> > @@ -686,7 +701,7 @@ static void test_smbios_structs(test_data *data,
> SmbiosEntryPointType ep_type)
> >          set_bit(type, struct_bitmap);
> >
> >          if (type == 4) {
> > -            g_assert(smbios_cpu_test(data, addr));
> > +            smbios_cpu_test(data, addr, ep_type);
> >          }
> >
> >          /* seek to end of unformatted string area of this struct
> ("\0\0") */
> > @@ -908,6 +923,21 @@ static void test_acpi_q35_tcg(void)
> >      free_test_data(&data);
> >  }
> >
> > +static void test_acpi_q35_tcg_core_count2(void)
> > +{
> > +    test_data data = {
> > +        .machine = MACHINE_Q35,
> > +        .variant = ".core-count2",
> > +        .required_struct_types = base_required_struct_types,
> > +        .required_struct_types_len =
> ARRAY_SIZE(base_required_struct_types),
> > +        .smbios_core_count = 0xFF,
> > +        .smbios_core_count2 = 275,
> > +    };
> > +
> > +    test_acpi_one("-machine smbios-entry-point-type=64 -smp 275",
> &data);
> > +    free_test_data(&data);
> > +}
> > +
> >  static void test_acpi_q35_tcg_bridge(void)
> >  {
> >      test_data data;
> > @@ -1859,6 +1889,8 @@ int main(int argc, char *argv[])
> >                  qtest_add_func("acpi/q35/tpm12-tis",
> >                                 test_acpi_q35_tcg_tpm12_tis);
> >              }
> > +            qtest_add_func("acpi/q35/core-count2",
> > +                           test_acpi_q35_tcg_core_count2);
> >              qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
> >              qtest_add_func("acpi/q35/multif-bridge",
> >                             test_acpi_q35_multif_bridge);
>
>

--0000000000004d0b8c05ec691449
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Nov 1, 2022 at 19:22 Jonathan Cameron &lt;<a href=
=3D"mailto:Jonathan.Cameron@huawei.com">Jonathan.Cameron@huawei.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bo=
rder-left-color:rgb(204,204,204)">On Mon, 31 Oct 2022 08:51:44 -0400<br>
&quot;Michael S. Tsirkin&quot; &lt;<a href=3D"mailto:mst@redhat.com" target=
=3D"_blank">mst@redhat.com</a>&gt; wrote:<br>
<br>
&gt; From: Julia Suvorova &lt;<a href=3D"mailto:jusual@redhat.com" target=
=3D"_blank">jusual@redhat.com</a>&gt;<br>
&gt; <br>
&gt; The new test is run with a large number of cpus and checks if the<br>
&gt; core_count field in smbios_cpu_test (structure type 4) is correct.<br>
&gt; <br>
&gt; Choose q35 as it allows to run with -smp &gt; 255.<br>
<br>
Getting a failure on this on i386.<br>
<br>
qemu-system-i386: current -smp configuration requires kernel irqchip and X2=
APIC API support.<br>
<br>
Note that was on bisection of this pull request applied to current mainline=
<br>
(also in the CI report for the HMAT set - though there is another issue the=
re.)</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Can you poin=
t me to the CI report?</div><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" =
dir=3D"auto"><br>
<br>
My guess is fix is don&#39;t run it unless 64 bit?<br>
<br>
Jonathan<br>
<br>
<br>
&gt; <br>
&gt; Signed-off-by: Julia Suvorova &lt;<a href=3D"mailto:jusual@redhat.com"=
 target=3D"_blank">jusual@redhat.com</a>&gt;<br>
&gt; Message-Id: &lt;<a href=3D"mailto:20220731162141.178443-5-jusual@redha=
t.com" target=3D"_blank">20220731162141.178443-5-jusual@redhat.com</a>&gt;<=
br>
&gt; Message-Id: &lt;<a href=3D"mailto:20221011111731.101412-5-jusual@redha=
t.com" target=3D"_blank">20221011111731.101412-5-jusual@redhat.com</a>&gt;<=
br>
&gt; Reviewed-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" =
target=3D"_blank">mst@redhat.com</a>&gt;<br>
&gt; Signed-off-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com=
" target=3D"_blank">mst@redhat.com</a>&gt;<br>
&gt; Reviewed-by: Igor Mammedov &lt;<a href=3D"mailto:imammedo@redhat.com" =
target=3D"_blank">imammedo@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tests/qtest/bios-tables-test.c | 58 ++++++++++++++++++++++++++--=
------<br>
&gt;=C2=A0 1 file changed, 45 insertions(+), 13 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-=
test.c<br>
&gt; index d4fbe6791d..e402b57d46 100644<br>
&gt; --- a/tests/qtest/bios-tables-test.c<br>
&gt; +++ b/tests/qtest/bios-tables-test.c<br>
&gt; @@ -92,6 +92,8 @@ typedef struct {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SmbiosEntryPoint smbios_ep_table;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint16_t smbios_cpu_max_speed;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint16_t smbios_cpu_curr_speed;<br>
&gt; +=C2=A0 =C2=A0 uint8_t smbios_core_count;<br>
&gt; +=C2=A0 =C2=A0 uint16_t smbios_core_count2;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint8_t *required_struct_types;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int required_struct_types_len;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 QTestState *qts;<br>
&gt; @@ -631,29 +633,42 @@ static inline bool smbios_single_instance(uint8_=
t type)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static bool smbios_cpu_test(test_data *data, uint32_t addr)<br>
&gt; +static void smbios_cpu_test(test_data *data, uint32_t addr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SmbiosEntryPointType ep_type)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 uint16_t expect_speed[2];<br>
&gt; -=C2=A0 =C2=A0 uint16_t real;<br>
&gt; +=C2=A0 =C2=A0 uint8_t core_count, expected_core_count =3D data-&gt;sm=
bios_core_count;<br>
&gt; +=C2=A0 =C2=A0 uint16_t speed, expected_speed[2];<br>
&gt; +=C2=A0 =C2=A0 uint16_t core_count2, expected_core_count2 =3D data-&gt=
;smbios_core_count2;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int offset[2];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Check CPU speed for backward compatibility */<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 offset[0] =3D offsetof(struct smbios_type_4, max_s=
peed);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 offset[1] =3D offsetof(struct smbios_type_4, curre=
nt_speed);<br>
&gt; -=C2=A0 =C2=A0 expect_speed[0] =3D data-&gt;smbios_cpu_max_speed ? : 2=
000;<br>
&gt; -=C2=A0 =C2=A0 expect_speed[1] =3D data-&gt;smbios_cpu_curr_speed ? : =
2000;<br>
&gt; +=C2=A0 =C2=A0 expected_speed[0] =3D data-&gt;smbios_cpu_max_speed ? :=
 2000;<br>
&gt; +=C2=A0 =C2=A0 expected_speed[1] =3D data-&gt;smbios_cpu_curr_speed ? =
: 2000;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; 2; i++) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 real =3D qtest_readw(data-&gt;qts, addr +=
 offset[i]);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (real !=3D expect_speed[i]) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Unexp=
ected SMBIOS CPU speed: real %u expect %u\n&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 real, expect_speed[i]);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 speed =3D qtest_readw(data-&gt;qts, addr =
+ offset[i]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmpuint(speed, =3D=3D, expected_=
speed[i]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 return true;<br>
&gt; +=C2=A0 =C2=A0 core_count =3D qtest_readb(data-&gt;qts,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 addr + offsetof(struct smbios_type_4, core_count));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (expected_core_count) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmpuint(core_count, =3D=3D, expe=
cted_core_count);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (ep_type =3D=3D SMBIOS_ENTRY_POINT_TYPE_64) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 core_count2 =3D qtest_readw(data-&gt;qts,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 addr + offsetof(struct smbios_type_4, core_count2));<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Core Count has reached its limit, chec=
king Core Count 2 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (expected_core_count =3D=3D 0xFF &amp;=
&amp; expected_core_count2) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_cmpuint(core_count=
2, =3D=3D, expected_core_count2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void test_smbios_structs(test_data *data, SmbiosEntryPoin=
tType ep_type)<br>
&gt; @@ -686,7 +701,7 @@ static void test_smbios_structs(test_data *data, S=
mbiosEntryPointType ep_type)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_bit(type, struct_bitmap);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (type =3D=3D 4) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert(smbios_cpu_test(da=
ta, addr));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 smbios_cpu_test(data, addr,=
 ep_type);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* seek to end of unformatted string=
 area of this struct (&quot;\0\0&quot;) */<br>
&gt; @@ -908,6 +923,21 @@ static void test_acpi_q35_tcg(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 free_test_data(&amp;data);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static void test_acpi_q35_tcg_core_count2(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 test_data data =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .machine =3D MACHINE_Q35,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .variant =3D &quot;.core-count2&quot;,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .required_struct_types =3D base_required_=
struct_types,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .required_struct_types_len =3D ARRAY_SIZE=
(base_required_struct_types),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .smbios_core_count =3D 0xFF,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .smbios_core_count2 =3D 275,<br>
&gt; +=C2=A0 =C2=A0 };<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 test_acpi_one(&quot;-machine smbios-entry-point-type=3D=
64 -smp 275&quot;, &amp;data);<br>
&gt; +=C2=A0 =C2=A0 free_test_data(&amp;data);<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static void test_acpi_q35_tcg_bridge(void)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 test_data data;<br>
&gt; @@ -1859,6 +1889,8 @@ int main(int argc, char *argv[])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qtest_ad=
d_func(&quot;acpi/q35/tpm12-tis&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_acpi_q35_tcg_tpm12_tis=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qtest_add_func(&quot;acpi/q=
35/core-count2&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_acpi_q35_tcg_core_count2);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qtest_add_func(&quot;a=
cpi/q35/bridge&quot;, test_acpi_q35_tcg_bridge);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qtest_add_func(&quot;a=
cpi/q35/multif-bridge&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test_acpi_q35_multif_bridge);<br>
<br>
</blockquote></div></div>

--0000000000004d0b8c05ec691449--

