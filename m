Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE1B5F2BB4
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 10:25:35 +0200 (CEST)
Received: from localhost ([::1]:35094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofGlZ-0005Q5-RS
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 04:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hal.martin@gmail.com>)
 id 1ofGjZ-00042g-6D
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 04:23:29 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:34621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hal.martin@gmail.com>)
 id 1ofGjX-00089d-2f
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 04:23:28 -0400
Received: by mail-oi1-x229.google.com with SMTP id m81so10677353oia.1
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 01:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=UFyyaAr9cd/yQpV8LcNG5khiwTIgIxxzjvs7S//6fe0=;
 b=GE86PxVl88gCDU9pON50dcQve8Igowt5ayAMsME/p1gT0qgs8l2En0GY9CWUr9yYzl
 0l6LfdbYE6ZrffkzZCixjY9ZECH1qxM0dS+5R0gxSD8VzYBTCUpOewk2mzIMd2oU/Xb8
 vpqj8h4vbWJ1ETs3GwS+3nFGH/gIjaxxgYOeD1vTZBLD3VmX0mp0VMBVZo+QnARw/4AV
 SEjIyZfM/UxeMPQA+DxsaPjIHWcMdQp1QIRZ5v+zuYapLESfyYu1vTbu8NhvOnGyT32r
 mOdtstF9wsY4YpyJO3QvdQTlTR8bhZw4nkzsCNYYsTe0YUJZs7iAKzFsmIgMb9dcyYDt
 QMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=UFyyaAr9cd/yQpV8LcNG5khiwTIgIxxzjvs7S//6fe0=;
 b=8MsfySSr+909CtxXyMyIoTCZOJA6fDQVDBGvNZKBJqvxJsZ2+BQZmU6LbYdICiJ3W6
 GBILhJzx9RZYIN1sOu0wsJp5YG3loiHt+9QTNP6cTNpXddAtdYE2sNFMGNOtwGN8HTO8
 kpwFc3KR7lbe5uwJrw5iouI32JVD5w8tL0QN5xmx5E9E8kLNIz3Pg1OGlkavSsLqWE7Q
 CQUt91DIYq5czph1imX++DSFeDthfvcN88YEbCpWgfibcc58lLfHISZPpyuawHE5M5ii
 WeQTHgxSzVapEoyGOaYm6AjyVKMA8imAPevv5OdmhU/WG25u/pbbIE0OHFgvMSlJlk3f
 ZR3Q==
X-Gm-Message-State: ACrzQf2njzBO1DPSz7HsHUN8ZnujF2y+pE9AlSO8ERii/NPNI3EfjOdh
 qXj0EhXl8IAm27v+FWInnnyCHdpM55Sd+Yj3a1c=
X-Google-Smtp-Source: AMsMyM7L33OImzX0SVMDDWqF8jC2iDzcbYS0jUHvXL5ILAqjsFtN/FVCq4tcCOYBqcr0p8+geIoPhIrj9o21ZCcOgl0=
X-Received: by 2002:a05:6808:238c:b0:351:3c64:6bb3 with SMTP id
 bp12-20020a056808238c00b003513c646bb3mr3368276oib.245.1664785404863; Mon, 03
 Oct 2022 01:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220812135153.17859-1-hal.martin@gmail.com>
 <20220812110220-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220812110220-mutt-send-email-mst@kernel.org>
From: Hal Martin <hal.martin@gmail.com>
Date: Mon, 3 Oct 2022 10:23:11 +0200
Message-ID: <CAHkvJJ+VPsxQGRsxQgNNAah_McJj86toGEC8R55_Zd8sTEaVXQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/smbios: support for type 8 (port connector)
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=hal.martin@gmail.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hello,

Any update on merging this?

Kind regards,
Hal

On Fri, Aug 12, 2022 at 5:04 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Aug 12, 2022 at 03:51:53PM +0200, Hal Martin wrote:
> > PATCH v1: add support for SMBIOS type 8 to qemu
> > PATCH v2: incorporate patch v1 feedback and add smbios type=8 to qemu-options
>
> history after --- pls
>
> > internal_reference: internal reference designator
> > external_reference: external reference designator
> > connector_type: hex value for port connector type (see SMBIOS 7.9.2)
> > port_type: hex value for port type (see SMBIOS 7.9.3)
> >
> > After studying various vendor implementationsi (Dell, Lenovo, MSI),
> > the value of internal connector type was hard-coded to 0x0 (None).
> >
> > Example usage:
> > -smbios type=8,internal_reference=JUSB1,external_reference=USB1,connector_type=0x12,port_type=0x10 \
> > -smbios type=8,internal_reference=JAUD1,external_reference="Audio Jack",connector_type=0x1f,port_type=0x1d \
> > -smbios type=8,internal_reference=LAN,external_reference=Ethernet,connector_type=0x0b,port_type=0x1f \
> > -smbios type=8,internal_reference=PS2,external_reference=Mouse,connector_type=0x0f,port_type=0x0e \
> > -smbios type=8,internal_reference=PS2,external_reference=Keyboard,connector_type=0x0f,port_type=0x0d
> >
> >
> > Signed-off-by: Hal Martin <hal.martin@gmail.com>
>
> We are in freeze, I tagged this for after the release.
> Just to make sure pls ping me after the release if possible.
>
>
>
> > ---
> >  hw/smbios/smbios.c           | 63 ++++++++++++++++++++++++++++++++++++
> >  include/hw/firmware/smbios.h | 10 ++++++
> >  qemu-options.hx              |  2 ++
> >  3 files changed, 75 insertions(+)
> >
> > diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> > index 60349ee402..578cae0f0a 100644
> > --- a/hw/smbios/smbios.c
> > +++ b/hw/smbios/smbios.c
> > @@ -111,6 +111,13 @@ static struct {
> >      .processor_id = 0,
> >  };
> >
> > +struct type8_instance {
> > +    const char *internal_reference, *external_reference;
> > +    uint8_t connector_type, port_type;
> > +    QTAILQ_ENTRY(type8_instance) next;
> > +};
> > +static QTAILQ_HEAD(, type8_instance) type8 = QTAILQ_HEAD_INITIALIZER(type8);
> > +
> >  static struct {
> >      size_t nvalues;
> >      char **values;
> > @@ -337,6 +344,29 @@ static const QemuOptDesc qemu_smbios_type4_opts[] = {
> >      { /* end of list */ }
> >  };
> >
> > +static const QemuOptDesc qemu_smbios_type8_opts[] = {
> > +    {
> > +        .name = "internal_reference",
> > +        .type = QEMU_OPT_STRING,
> > +        .help = "internal reference designator",
> > +    },
> > +    {
> > +        .name = "external_reference",
> > +        .type = QEMU_OPT_STRING,
> > +        .help = "external reference designator",
> > +    },
> > +    {
> > +        .name = "connector_type",
> > +        .type = QEMU_OPT_NUMBER,
> > +        .help = "connector type",
> > +    },
> > +    {
> > +        .name = "port_type",
> > +        .type = QEMU_OPT_NUMBER,
> > +        .help = "port type",
> > +    },
> > +};
> > +
> >  static const QemuOptDesc qemu_smbios_type11_opts[] = {
> >      {
> >          .name = "value",
> > @@ -718,6 +748,26 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
> >      smbios_type4_count++;
> >  }
> >
> > +static void smbios_build_type_8_table(void)
> > +{
> > +    unsigned instance = 0;
> > +    struct type8_instance *t8;
> > +
> > +    QTAILQ_FOREACH(t8, &type8, next) {
> > +        SMBIOS_BUILD_TABLE_PRE(8, T0_BASE + instance, true);
> > +
> > +        SMBIOS_TABLE_SET_STR(8, internal_reference_str, t8->internal_reference);
> > +        SMBIOS_TABLE_SET_STR(8, external_reference_str, t8->external_reference);
> > +        /* most vendors seem to set this to None */
> > +        t->internal_connector_type = 0x0;
> > +        t->external_connector_type = t8->connector_type;
> > +        t->port_type = t8->port_type;
> > +
> > +        SMBIOS_BUILD_TABLE_POST;
> > +        instance++;
> > +    }
> > +}
> > +
> >  static void smbios_build_type_11_table(void)
> >  {
> >      char count_str[128];
> > @@ -1030,6 +1080,7 @@ void smbios_get_tables(MachineState *ms,
> >              smbios_build_type_4_table(ms, i);
> >          }
> >
> > +        smbios_build_type_8_table();
> >          smbios_build_type_11_table();
> >
> >  #define MAX_DIMM_SZ (16 * GiB)
> > @@ -1346,6 +1397,18 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
> >                             UINT16_MAX);
> >              }
> >              return;
> > +        case 8:
> > +            if (!qemu_opts_validate(opts, qemu_smbios_type8_opts, errp)) {
> > +                return;
> > +            }
> > +            struct type8_instance *t;
> > +            t = g_new0(struct type8_instance, 1);
> > +            save_opt(&t->internal_reference, opts, "internal_reference");
> > +            save_opt(&t->external_reference, opts, "external_reference");
> > +            t->connector_type = qemu_opt_get_number(opts, "connector_type", 0);
> > +            t->port_type = qemu_opt_get_number(opts, "port_type", 0);
> > +            QTAILQ_INSERT_TAIL(&type8, t, next);
> > +            return;
> >          case 11:
> >              if (!qemu_opts_validate(opts, qemu_smbios_type11_opts, errp)) {
> >                  return;
> > diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
> > index 4b7ad77a44..e7d386f7c8 100644
> > --- a/include/hw/firmware/smbios.h
> > +++ b/include/hw/firmware/smbios.h
> > @@ -189,6 +189,16 @@ struct smbios_type_4 {
> >      uint16_t processor_family2;
> >  } QEMU_PACKED;
> >
> > +/* SMBIOS type 8 - Port Connector Information */
> > +struct smbios_type_8 {
> > +    struct smbios_structure_header header;
> > +    uint8_t internal_reference_str;
> > +    uint8_t internal_connector_type;
> > +    uint8_t external_reference_str;
> > +    uint8_t external_connector_type;
> > +    uint8_t port_type;
> > +} QEMU_PACKED;
> > +
> >  /* SMBIOS type 11 - OEM strings */
> >  struct smbios_type_11 {
> >      struct smbios_structure_header header;
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 377d22fbd8..a27ab6afee 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -2538,6 +2538,8 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
> >      "              [,asset=str][,part=str][,max-speed=%d][,current-speed=%d]\n"
> >      "              [,processor-id=%d]\n"
> >      "                specify SMBIOS type 4 fields\n"
> > +    "-smbios type=8[,external_reference=str][,internal_reference=str][,connector_type=%d][,port_type=%d]\n"
> > +    "                specify SMBIOS type 8 fields\n"
> >      "-smbios type=11[,value=str][,path=filename]\n"
> >      "                specify SMBIOS type 11 fields\n"
> >      "-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str]\n"
> > --
> > 2.36.1
>

