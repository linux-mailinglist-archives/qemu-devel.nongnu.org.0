Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAD82B7360
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 01:48:31 +0100 (CET)
Received: from localhost ([::1]:60280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfBeA-0001ni-81
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 19:48:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erich.mcmillan@hp.com>)
 id 1kfBbs-0001JV-4R
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 19:46:09 -0500
Received: from us-smtp-delivery-162.mimecast.com ([216.205.24.162]:42763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <erich.mcmillan@hp.com>)
 id 1kfBbm-0005mH-JH
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 19:46:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com;
 s=mimecast20180716; t=1605660361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HVeYLJmCFqrL+qJ+CHYMl4MVAYkV3zBMiPpxJr97y7s=;
 b=XNK5qEcE1DBwjIRskF0o39jAYkcpPtr6PDdSyOGZep+jKRhYAd8QtI3fb5S53vSNPQqCor
 GUT3PTpcWwUp6reP2Kfuhuv1cnaVDT1nozaZCHJM5kRZwajZtSjqjtWR7O8OHEmgu2L1K4
 rh15wo7Z8PtHswb1/EX8CzR8jyCewA4=
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-JnG6RBYWPDuFOXfAZHCuNQ-1; Tue, 17 Nov 2020 19:44:30 -0500
X-MC-Unique: JnG6RBYWPDuFOXfAZHCuNQ-1
Received: from CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7507::9) by CS1PR8401MB0886.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:750f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 00:44:29 +0000
Received: from CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::51cc:84ed:4698:5dca]) by CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::51cc:84ed:4698:5dca%7]) with mapi id 15.20.3564.028; Wed, 18 Nov 2020
 00:44:29 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "lersek@redhat.com"
 <lersek@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>, "kraxel@redhat.com"
 <kraxel@redhat.com>
Subject: Re: [PATCH v6] hw/i386/pc: add max combined fw size as machine
 configuration option
Thread-Topic: [PATCH v6] hw/i386/pc: add max combined fw size as machine
 configuration option
Thread-Index: AQHWk2Vu5Zex3oyzg0aTR1075CA/CqnM3aqAgACDQ0U=
Date: Wed, 18 Nov 2020 00:44:28 +0000
Message-ID: <CS1PR8401MB03272F390100B1B88CCAC784F3E10@CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM>
References: <20200925175751.4017-1-erich.mcmillan@hp.com>,
 <20201117115329-mutt-send-email-mst@kernel.org>
In-Reply-To: <20201117115329-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [34.103.75.94]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa87ce77-88a7-4d9d-0c01-08d88b5b1b6e
x-ms-traffictypediagnostic: CS1PR8401MB0886:
x-microsoft-antispam-prvs: <CS1PR8401MB0886D87F19E75D3C3B5AE00FF3E10@CS1PR8401MB0886.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: j/ne6qyxmY6ZT2hecnJB2c5ieWAkkO5lOfkjKQN4tAMiLHFool9cE4Hreg/my7Ht9GwDM39pctyo+7KGQoXBUXrOErrAG0FljaeIdZ0X/avS+becjj1jzVoNi4zjChaFtdWCbE7LBZWNgZHow6EpKhRwJpXBxEA8tySlrSxeGgC/OKbrK/+CsE/MehqzB78ZhMJJwiSlRcxk7NmgbMO6DsPpONHql6KgVPP7VuH4ePDObAHZuKjKEl/Jfo8mIBtG19HKpBxSYf8sQioVref2wBuRrv9kkTULFlRx70QYaMOFj8FB0vY58LIlWhp4zjG/luYQoIeVFQxB+OQQ/LkdJg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(346002)(396003)(136003)(376002)(52536014)(5660300002)(83380400001)(71200400001)(54906003)(6916009)(316002)(91956017)(8936002)(66446008)(8676002)(76116006)(66946007)(4326008)(66476007)(66556008)(64756008)(2906002)(478600001)(6506007)(19627405001)(33656002)(53546011)(26005)(55016002)(186003)(86362001)(9686003)(7696005);
 DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata: 7ZoB7d+dt4IEQCXDUHhdmJOWJFQzWbIavNPxWGKtszRIIwnJnZRpVrwL9P1arH/WMHDoruBikshW9ZZIfRw6hRH40hY5+T75brwlpeTcDbjiYk+lXydl6fW/pxI56Du69BEHCMcx7Hrggb1tW/jn49sEqgBisaUqE1iQutbccTTdYBQSfmmPgvFC4a39kb1tjIVjEra5SWIELTevDAU4cQMWBraC/62OxgrwWNbpX9GknPhkw+sBgZs2NGaNC3eaQTjqs+gl0bkL/XrWLN8xBVOE968JU8rcDzmu1bvg6y6rG9YNDc/GrriOiWNyCGx8d9tfk4DtLfG+nxL65J/gCuiw3gvYxIPyuWo0EpvQCxuUQcVuDHp+KS8vXEh/wbUpq0qbhhyqZHbZ44WyT8FWB4qwXR28ikZGXYLKMYmBSnEExY2CEfTmiqAurj/iQWvvCTsV+PVtP8YnENN2j376jhcnB50WIGnbtew2r/qZjlN32aSR/67wyLjC9g1kyxsWkUk+ETGQBv1YCnq9ZYcAvKrKwBOm0mhUCieFOYZKvIivxYDmCNKI3NBipTBgKhxqRb1aQDJTgWnVkXyFc7hUa1OEuuuZUDEi7URNksJB59G7Y1bdPq8YDD37Lx9QnuvZD/xC+krCAhduZTtCBXN/vQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CS1PR8401MB0327.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fa87ce77-88a7-4d9d-0c01-08d88b5b1b6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2020 00:44:28.9857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4IAilC6UJogJBdAzHgjs3G4HNWleVXdrT+oikLlNPaltQKS5ABW6F1KY15g2kOxKKJ9iE2eirz73IWdDi8xp5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CS1PR8401MB0886
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA62A171 smtp.mailfrom=erich.mcmillan@hp.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: hp.com
Content-Language: en-US
Content-Type: multipart/alternative;
 boundary="_000_CS1PR8401MB03272F390100B1B88CCAC784F3E10CS1PR8401MB0327_"
Received-SPF: pass client-ip=216.205.24.162;
 envelope-from=erich.mcmillan@hp.com; helo=us-smtp-delivery-162.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:44:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: "McMillan, Erich" <erich.mcmillan@hp.com>
From: "McMillan, Erich" via <qemu-devel@nongnu.org>

--_000_CS1PR8401MB03272F390100B1B88CCAC784F3E10CS1PR8401MB0327_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Thanks Michael.

-Erich
________________________________
From: Michael S. Tsirkin <mst@redhat.com>
Sent: Tuesday, November 17, 2020 10:53 AM
To: McMillan, Erich <erich.mcmillan@hp.com>
Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>; lersek@redhat.com <lerse=
k@redhat.com>; dgilbert@redhat.com <dgilbert@redhat.com>; marcel.apfelbaum@=
gmail.com <marcel.apfelbaum@gmail.com>; imammedo@redhat.com <imammedo@redha=
t.com>; kraxel@redhat.com <kraxel@redhat.com>
Subject: Re: [PATCH v6] hw/i386/pc: add max combined fw size as machine con=
figuration option

On Fri, Sep 25, 2020 at 05:57:51PM +0000, Erich Mcmillan wrote:
> From: Erich McMillan <erich.mcmillan@hp.com>
>
> At Hewlett Packard Inc. we have a need for increased fw size to enable te=
sting of our custom fw.
> Move return statement for early return
>
> Signed-off-by: Erich McMillan <erich.mcmillan@hp.com>

My bad that I dropped it by mistake before code freeze.
I will queue it for the next release.

> ---
>
> Changes since v5:
>
>      Move return statement for pc_machine_set_max_fw_size() to follow err=
or_setg() as early return.
>
>  hw/i386/pc.c         | 51 ++++++++++++++++++++++++++++++++++++++++++++
>  hw/i386/pc_sysfw.c   | 13 ++---------
>  include/hw/i386/pc.h |  2 ++
>  3 files changed, 55 insertions(+), 11 deletions(-)
>
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index d11daacc23..70c8c9adcf 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1869,6 +1869,50 @@ static void pc_machine_set_max_ram_below_4g(Object=
 *obj, Visitor *v,
>      pcms->max_ram_below_4g =3D value;
>  }
>
> +static void pc_machine_get_max_fw_size(Object *obj, Visitor *v,
> +                                       const char *name, void *opaque,
> +                                       Error **errp)
> +{
> +    PCMachineState *pcms =3D PC_MACHINE(obj);
> +    uint64_t value =3D pcms->max_fw_size;
> +
> +    visit_type_size(v, name, &value, errp);
> +}
> +
> +static void pc_machine_set_max_fw_size(Object *obj, Visitor *v,
> +                                       const char *name, void *opaque,
> +                                       Error **errp)
> +{
> +    PCMachineState *pcms =3D PC_MACHINE(obj);
> +    Error *error =3D NULL;
> +    uint64_t value;
> +
> +    visit_type_size(v, name, &value, &error);
> +    if (error) {
> +        error_propagate(errp, error);
> +        return;
> +    }
> +
> +    /*
> +    * We don't have a theoretically justifiable exact lower bound on the=
 base
> +    * address of any flash mapping. In practice, the IO-APIC MMIO range =
is
> +    * [0xFEE00000..0xFEE01000] -- see IO_APIC_DEFAULT_ADDRESS --, leavin=
g free
> +    * only 18MB-4KB below 4G. For now, restrict the cumulative mapping t=
o 8MB in
> +    * size.
> +    */
> +    if (value > 16 * MiB) {
> +        error_setg(errp,
> +                   "User specified max allowed firmware size %" PRIu64 "=
 is "
> +                   "greater than 16MiB. If combined firwmare size exceed=
s "
> +                   "16MiB the system may not boot, or experience intermi=
ttent"
> +                   "stability issues.",
> +                   value);
> +        return;
> +    }
> +
> +    pcms->max_fw_size =3D value;
> +}
> +
>  static void pc_machine_initfn(Object *obj)
>  {
>      PCMachineState *pcms =3D PC_MACHINE(obj);
> @@ -1884,6 +1928,7 @@ static void pc_machine_initfn(Object *obj)
>      pcms->smbus_enabled =3D true;
>      pcms->sata_enabled =3D true;
>      pcms->pit_enabled =3D true;
> +    pcms->max_fw_size =3D 8 * MiB;
>
>      pc_system_flash_create(pcms);
>      pcms->pcspk =3D isa_new(TYPE_PC_SPEAKER);
> @@ -2004,6 +2049,12 @@ static void pc_machine_class_init(ObjectClass *oc,=
 void *data)
>
>      object_class_property_add_bool(oc, PC_MACHINE_PIT,
>          pc_machine_get_pit, pc_machine_set_pit);
> +
> +    object_class_property_add(oc, PC_MACHINE_MAX_FW_SIZE, "size",
> +        pc_machine_get_max_fw_size, pc_machine_set_max_fw_size,
> +        NULL, NULL);
> +    object_class_property_set_description(oc, PC_MACHINE_MAX_FW_SIZE,
> +        "Maximum combined firmware size");
>  }
>
>  static const TypeInfo pc_machine_info =3D {
> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> index b6c0822fe3..22450ba0ef 100644
> --- a/hw/i386/pc_sysfw.c
> +++ b/hw/i386/pc_sysfw.c
> @@ -39,15 +39,6 @@
>  #include "hw/block/flash.h"
>  #include "sysemu/kvm.h"
>
> -/*
> - * We don't have a theoretically justifiable exact lower bound on the ba=
se
> - * address of any flash mapping. In practice, the IO-APIC MMIO range is
> - * [0xFEE00000..0xFEE01000] -- see IO_APIC_DEFAULT_ADDRESS --, leaving f=
ree
> - * only 18MB-4KB below 4G. For now, restrict the cumulative mapping to 8=
MB in
> - * size.
> - */
> -#define FLASH_SIZE_LIMIT (8 * MiB)
> -
>  #define FLASH_SECTOR_SIZE 4096
>
>  static void pc_isa_bios_init(MemoryRegion *rom_memory,
> @@ -182,10 +173,10 @@ static void pc_system_flash_map(PCMachineState *pcm=
s,
>          }
>          if ((hwaddr)size !=3D size
>              || total_size > HWADDR_MAX - size
> -            || total_size + size > FLASH_SIZE_LIMIT) {
> +            || total_size + size > pcms->max_fw_size) {
>              error_report("combined size of system firmware exceeds "
>                           "%" PRIu64 " bytes",
> -                         FLASH_SIZE_LIMIT);
> +                         pcms->max_fw_size);
>              exit(1);
>          }
>
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index fe52e165b2..f7c8e7cbfe 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -43,6 +43,7 @@ struct PCMachineState {
>      bool smbus_enabled;
>      bool sata_enabled;
>      bool pit_enabled;
> +    uint64_t max_fw_size;
>
>      /* NUMA information: */
>      uint64_t numa_nodes;
> @@ -59,6 +60,7 @@ struct PCMachineState {
>  #define PC_MACHINE_SMBUS            "smbus"
>  #define PC_MACHINE_SATA             "sata"
>  #define PC_MACHINE_PIT              "pit"
> +#define PC_MACHINE_MAX_FW_SIZE      "max-fw-size"
>
>  /**
>   * PCMachineClass:
> --
> 2.25.1


--_000_CS1PR8401MB03272F390100B1B88CCAC784F3E10CS1PR8401MB0327_
Content-Type: text/html; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Thanks Michael.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
-Erich<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Michael S. Tsirkin &l=
t;mst@redhat.com&gt;<br>
<b>Sent:</b> Tuesday, November 17, 2020 10:53 AM<br>
<b>To:</b> McMillan, Erich &lt;erich.mcmillan@hp.com&gt;<br>
<b>Cc:</b> qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;; lersek@redh=
at.com &lt;lersek@redhat.com&gt;; dgilbert@redhat.com &lt;dgilbert@redhat.c=
om&gt;; marcel.apfelbaum@gmail.com &lt;marcel.apfelbaum@gmail.com&gt;; imam=
medo@redhat.com &lt;imammedo@redhat.com&gt;; kraxel@redhat.com
 &lt;kraxel@redhat.com&gt;<br>
<b>Subject:</b> Re: [PATCH v6] hw/i386/pc: add max combined fw size as mach=
ine configuration option</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Fri, Sep 25, 2020 at 05:57:51PM +0000, Erich Mc=
millan wrote:<br>
&gt; From: Erich McMillan &lt;erich.mcmillan@hp.com&gt;<br>
&gt; <br>
&gt; At Hewlett Packard Inc. we have a need for increased fw size to enable=
 testing of our custom fw.<br>
&gt; Move return statement for early return<br>
&gt; <br>
&gt; Signed-off-by: Erich McMillan &lt;erich.mcmillan@hp.com&gt;<br>
<br>
My bad that I dropped it by mistake before code freeze.<br>
I will queue it for the next release.<br>
<br>
&gt; ---<br>
&gt; <br>
&gt; Changes since v5:<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Move return statement for pc_machine_set=
_max_fw_size() to follow error_setg() as early return.<br>
&gt; <br>
&gt;&nbsp; hw/i386/pc.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 5=
1 ++++++++++++++++++++++++++++++++++++++++++++<br>
&gt;&nbsp; hw/i386/pc_sysfw.c&nbsp;&nbsp; | 13 ++---------<br>
&gt;&nbsp; include/hw/i386/pc.h |&nbsp; 2 ++<br>
&gt;&nbsp; 3 files changed, 55 insertions(+), 11 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/i386/pc.c b/hw/i386/pc.c<br>
&gt; index d11daacc23..70c8c9adcf 100644<br>
&gt; --- a/hw/i386/pc.c<br>
&gt; +++ b/hw/i386/pc.c<br>
&gt; @@ -1869,6 +1869,50 @@ static void pc_machine_set_max_ram_below_4g(Obj=
ect *obj, Visitor *v,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pcms-&gt;max_ram_below_4g =3D value;<br>
&gt;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; +static void pc_machine_get_max_fw_size(Object *obj, Visitor *v,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; const char *name, void *opaque,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; Error **errp)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; PCMachineState *pcms =3D PC_MACHINE(obj);<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t value =3D pcms-&gt;max_fw_size;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; visit_type_size(v, name, &amp;value, errp);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void pc_machine_set_max_fw_size(Object *obj, Visitor *v,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; const char *name, void *opaque,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; Error **errp)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp; PCMachineState *pcms =3D PC_MACHINE(obj);<br>
&gt; +&nbsp;&nbsp;&nbsp; Error *error =3D NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t value;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; visit_type_size(v, name, &amp;value, &amp;error);<=
br>
&gt; +&nbsp;&nbsp;&nbsp; if (error) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_propagate(errp, erro=
r);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; /*<br>
&gt; +&nbsp;&nbsp;&nbsp; * We don't have a theoretically justifiable exact =
lower bound on the base<br>
&gt; +&nbsp;&nbsp;&nbsp; * address of any flash mapping. In practice, the I=
O-APIC MMIO range is<br>
&gt; +&nbsp;&nbsp;&nbsp; * [0xFEE00000..0xFEE01000] -- see IO_APIC_DEFAULT_=
ADDRESS --, leaving free<br>
&gt; +&nbsp;&nbsp;&nbsp; * only 18MB-4KB below 4G. For now, restrict the cu=
mulative mapping to 8MB in<br>
&gt; +&nbsp;&nbsp;&nbsp; * size.<br>
&gt; +&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp; if (value &gt; 16 * MiB) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; error_setg(errp,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;User specified max allowed fi=
rmware size %&quot; PRIu64 &quot; is &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;greater than 16MiB. If combin=
ed firwmare size exceeds &quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;16MiB the system may not boot=
, or experience intermittent&quot;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;stability issues.&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; value);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; pcms-&gt;max_fw_size =3D value;<br>
&gt; +}<br>
&gt; +<br>
&gt;&nbsp; static void pc_machine_initfn(Object *obj)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PCMachineState *pcms =3D PC_MACHINE(obj)=
;<br>
&gt; @@ -1884,6 +1928,7 @@ static void pc_machine_initfn(Object *obj)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pcms-&gt;smbus_enabled =3D true;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pcms-&gt;sata_enabled =3D true;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pcms-&gt;pit_enabled =3D true;<br>
&gt; +&nbsp;&nbsp;&nbsp; pcms-&gt;max_fw_size =3D 8 * MiB;<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pc_system_flash_create(pcms);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pcms-&gt;pcspk =3D isa_new(TYPE_PC_SPEAK=
ER);<br>
&gt; @@ -2004,6 +2049,12 @@ static void pc_machine_class_init(ObjectClass *=
oc, void *data)<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; object_class_property_add_bool(oc, PC_MA=
CHINE_PIT,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pc_machine_get_p=
it, pc_machine_set_pit);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; object_class_property_add(oc, PC_MACHINE_MAX_FW_SI=
ZE, &quot;size&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pc_machine_get_max_fw_size=
, pc_machine_set_max_fw_size,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL, NULL);<br>
&gt; +&nbsp;&nbsp;&nbsp; object_class_property_set_description(oc, PC_MACHI=
NE_MAX_FW_SIZE,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Maximum combined fir=
mware size&quot;);<br>
&gt;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp; static const TypeInfo pc_machine_info =3D {<br>
&gt; diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c<br>
&gt; index b6c0822fe3..22450ba0ef 100644<br>
&gt; --- a/hw/i386/pc_sysfw.c<br>
&gt; +++ b/hw/i386/pc_sysfw.c<br>
&gt; @@ -39,15 +39,6 @@<br>
&gt;&nbsp; #include &quot;hw/block/flash.h&quot;<br>
&gt;&nbsp; #include &quot;sysemu/kvm.h&quot;<br>
&gt;&nbsp; <br>
&gt; -/*<br>
&gt; - * We don't have a theoretically justifiable exact lower bound on the=
 base<br>
&gt; - * address of any flash mapping. In practice, the IO-APIC MMIO range =
is<br>
&gt; - * [0xFEE00000..0xFEE01000] -- see IO_APIC_DEFAULT_ADDRESS --, leavin=
g free<br>
&gt; - * only 18MB-4KB below 4G. For now, restrict the cumulative mapping t=
o 8MB in<br>
&gt; - * size.<br>
&gt; - */<br>
&gt; -#define FLASH_SIZE_LIMIT (8 * MiB)<br>
&gt; -<br>
&gt;&nbsp; #define FLASH_SECTOR_SIZE 4096<br>
&gt;&nbsp; <br>
&gt;&nbsp; static void pc_isa_bios_init(MemoryRegion *rom_memory,<br>
&gt; @@ -182,10 +173,10 @@ static void pc_system_flash_map(PCMachineState *=
pcms,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((hwaddr)size=
 !=3D size<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; || total_size &gt; HWADDR_MAX - size<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||=
 total_size + size &gt; FLASH_SIZE_LIMIT) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||=
 total_size + size &gt; pcms-&gt;max_fw_size) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; error_report(&quot;combined size of system firmware exceeds &quot;<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &quot;%&quot; PRIu64 &quot; bytes&quot;,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 FLASH_SIZE_LIMIT);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 pcms-&gt;max_fw_size);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; exit(1);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h<br>
&gt; index fe52e165b2..f7c8e7cbfe 100644<br>
&gt; --- a/include/hw/i386/pc.h<br>
&gt; +++ b/include/hw/i386/pc.h<br>
&gt; @@ -43,6 +43,7 @@ struct PCMachineState {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool smbus_enabled;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool sata_enabled;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool pit_enabled;<br>
&gt; +&nbsp;&nbsp;&nbsp; uint64_t max_fw_size;<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* NUMA information: */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t numa_nodes;<br>
&gt; @@ -59,6 +60,7 @@ struct PCMachineState {<br>
&gt;&nbsp; #define PC_MACHINE_SMBUS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; &quot;smbus&quot;<br>
&gt;&nbsp; #define PC_MACHINE_SATA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;sata&quot;<br>
&gt;&nbsp; #define PC_MACHINE_PIT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;pit&quot;<br>
&gt; +#define PC_MACHINE_MAX_FW_SIZE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;ma=
x-fw-size&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; /**<br>
&gt;&nbsp;&nbsp; * PCMachineClass:<br>
&gt; -- <br>
&gt; 2.25.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CS1PR8401MB03272F390100B1B88CCAC784F3E10CS1PR8401MB0327_--


