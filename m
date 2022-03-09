Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA74B4D2B37
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 10:01:57 +0100 (CET)
Received: from localhost ([::1]:51312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRsCi-0003Fy-Nc
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 04:01:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nRs62-0006vY-UZ; Wed, 09 Mar 2022 03:55:03 -0500
Received: from mga11.intel.com ([192.55.52.93]:23125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1nRs60-000141-OZ; Wed, 09 Mar 2022 03:55:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646816100; x=1678352100;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/RXwmBLshaAhCcVazoJBcuvLJch/TaQRI7AHTWa5apU=;
 b=CHUyHvhyc2K/DwWsAVpTB1iT/u+6k1PkIJE0p6K8mhGFyVOC6LLa/Zhn
 hHgvMNQlPait2iVlPxhYM8szQHuDNHHcv83h/fn384PDbW/vyLzyZS05x
 DrfSeKZQ1rnJE8+Lr3OG5wXiplqZnVsNiIIFIXyojeBhEL0hzbaHWeowT
 vdeLq8T5OhLQpw2iqTFj9wAhwae/YQFiervnXn3LsvEmh3n2po8YyA899
 DXsa5hsJpAyF2QP3u1T3eMMli5BVWo7pLukxNvQs8WvJQgOnfPpHNNfEh
 KcQEFH0Eq0DYtz2xzk/wDnkFriDy+3TOJ2lbCn//d2+gnL41jaCb5tQEy Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252495577"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="252495577"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 00:54:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="642078218"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga002.fm.intel.com with ESMTP; 09 Mar 2022 00:54:58 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 9 Mar 2022 00:54:58 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 9 Mar 2022 00:54:58 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Wed, 9 Mar 2022 00:54:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IamVG3TFapvhGb/YUkgPIQarvRoxaGc5doLW/7Qa4IsJB7UhXRlehZVeuWiX0uyyUQ4EJwKbc0ol+8lYCY4kKm4CmnLYqUrP7dI9Oy+vv4fT91SbTY5GxS2eZVVHGOLZhgtcyrf34N0x79knqyQfhRhaVB6JZyyNrnSvQc0cdloSamE9loC+r0o+3NR69nxUGzyGuNX0Lu3glFjH/1z8msSp+JEH486fRVmyl5wdhTJ2dP5Mkm9RIvsJQdUTk2TdS/kD+Sd8fzUHmIUqqzMiXXfn2zoXYWrv7bViX3aX2wlpdJ3DJql2fgfhIA54W6Jja1hO08k8E5q6ztheZ9xaJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2V3/neQGDbZ9OKcIWNKndozU44s4GD96S5xEKVD2rKs=;
 b=jFbfIv5Wifv8QaiXg5BARkHM7iZwCUGF00GDtWaaFsiIdmNs3Y9DeDKJtWTgQfbP9azM2J179eFYQsGNolGVymXOKU7yYeSRk2aIINnmP9texAZuRnPBlBd5TdMUBzJ31erGsG3Rwr3x+PWOj6vEacNHZCah5TV1w1YK/NyBE3bKrGGsAhh0zj6NHVJLyjOuKuoorwI5gYQJQQz3uJYzITibxkubsUUQH3rxem5BFdYA7V+ELrqpovf6ZuRaHwmbZeVBYco1b3RB653VWx4H//nLdNmkyeKrc3zyV5XIV24xWkvGzic6lsWOCiQVpsCqPDAUbEb9vA1PVtJ7NLg8ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by BL3PR11MB5732.namprd11.prod.outlook.com (2603:10b6:208:353::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 08:54:55 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e553:da6e:25d2:dc97]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e553:da6e:25d2:dc97%7]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 08:54:55 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Subject: RE: [PATCH] docs/devel/migration.rst: Updates content from code and
 fixes minor issues
Thread-Topic: [PATCH] docs/devel/migration.rst: Updates content from code and
 fixes minor issues
Thread-Index: AQHYE2rJvgPkDSho5UCu9AmYxCbtBay2/7Ng
Date: Wed, 9 Mar 2022 08:54:55 +0000
Message-ID: <MWHPR11MB00313BB9800F0B0BAAAF73349B0A9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220127103244.3277760-1-chen.zhang@intel.com>
In-Reply-To: <20220127103244.3277760-1-chen.zhang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6449ff85-b04a-4856-b6ac-08da01aa7b88
x-ms-traffictypediagnostic: BL3PR11MB5732:EE_
x-microsoft-antispam-prvs: <BL3PR11MB5732E20B87E6AFDEF7BCFD0B9B0A9@BL3PR11MB5732.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G7z+ejlYtqhZ6+Juy3NmhCccvYuwjA74PabewG2gMXufrQFokNCOIhPc0V1aTKpQVjMjfOc1BEkuIsR6AueS8etnb/ojP3GeP+1lM+O0UGSxOnni92VL5CBT9m9D8DDLRkMU8vBdItkqI+Im+++YyrVR3xKLhKqKiBE8/otVR6dHM39bpXzb1XyGGbvGwMGtrjFqqv8J6hNGxHEMpT3n5dQIDi1v/wKAjM2jjEZWHuOhpzBP8+FEf+61OTC/65y4WYhwr8szG7x7q2vOmrusQB27LxWl1oFVYKMdKgISpjcY6ZASJplurSM5SNoJDl3M1VlPGuZ1wcBGsQync6k6lICfKPFxqy5a9VQYs0WQacvUVr+w+xiSUld5Sod+3saUpUReYhjOJ1GcliD8BIfGI97pCM8dcNoB+DimsQ1zmlp7CqODYAt0EXB5Mn/yKEtfq9/acaSdlRoWZEdxEznmqjhFDhAGNUtm7h/IMNsFq5Yp5hzFA/skD8+6q6k3YmCx/igfVxsVyAoQ8JkI//9wOd3vHXUrH+DbgNhmhZdLR7n951toiOeCcwqPdw6TzBrgrwu9qlRreds3haI8om0uxNg5eFiVjpVZ3vROfVJ5jtRqbVsi/RXTACVorD5Zvwv4CtFREkFFzJ6lOlTxRnjGN7mOSU/b6/s352+ImWg/JTWhNkziJbORvgT/Il/llUgwkfO4a7t3ZNEx/AwuXITP1w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(186003)(71200400001)(52536014)(316002)(83380400001)(53546011)(64756008)(76116006)(66946007)(66556008)(38100700002)(7696005)(6506007)(66476007)(122000001)(55016003)(66446008)(26005)(8676002)(82960400001)(5660300002)(2906002)(110136005)(33656002)(508600001)(38070700005)(15650500001)(9686003)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?trli6oQcYtzsuY5TPBdKNYWKgVnqKzn6/qacGyXqu2dZNmFNAWjdD7kdIJu1?=
 =?us-ascii?Q?UR/oCDZRx7wRzQnvGS5rOqOP33QI4vNaHywLJ1bTBNMBJjgjJQQq2TpUpNyG?=
 =?us-ascii?Q?EOeqbzZkwGzGYDbHizq8is/44W70XWec92cBEh3v9FaeeeXhKOVilWp0xo80?=
 =?us-ascii?Q?Q4QRbuu9GchHz7Zf1fTxJ2UeGsMLpHpmGaX/JstjAmkHKzbpFogmhEACMyU1?=
 =?us-ascii?Q?6quN1/qviAVkrC3nNnNJJbOBKyYNK+DZAQ1Yh5lmXm1CMavpMiW9alaSdhM2?=
 =?us-ascii?Q?/QRe08PPwVRU0UoTrwqkxjhx4pICOlGcaLwpdJQj9HqaDLLMAho0K/BJx22O?=
 =?us-ascii?Q?HbKM34gVghZZJf6nIYWSX1NhZXPEzpMBSbwVNSmioT6yPAEVLhx11x6KgfEZ?=
 =?us-ascii?Q?rLEXQ7nNkXvFZifIVpbKaxLdghtmFvrxYpZ5Dt/LJOxILrQDIC/XAhiy1abq?=
 =?us-ascii?Q?ig2hi5gj4c8WrlyseV1tResvHY760OPPxFw+tHde6hw31McW6gxfNJoHe4Zw?=
 =?us-ascii?Q?nShzOykRo+8Um6VUSBtg1X/Lok1sVV0zm89N1yl+FEuQKNQC/p00Di6gLIKN?=
 =?us-ascii?Q?nNKmnuw0A3uYAzMIJ0QVqedQZzwYucxftsewPhrL+6wyb1aNj7/AysoPwo3D?=
 =?us-ascii?Q?9ttKrlUA4j9ad8429KhVaaysXd3Q/wqIxao8UBvTXrWogsNTRyhL83Hs73wd?=
 =?us-ascii?Q?2sYnTFQrTBcTBxjz9c429MZIqlWX4RrabVjpHIpKTnSY/XmF7qqFxTozxlKS?=
 =?us-ascii?Q?k0ZEGhFsIUiA4jHGW8fE4WukgSdd/ynnjnCXi7eQZoSPBfFgHnvB/OZPZnRf?=
 =?us-ascii?Q?/FytHRZUb5m3LtJF87JgiYTgj0RfLanLUtwwS+Czh3j9iBxZeduzvLEFED+s?=
 =?us-ascii?Q?13ccRuZpg+p2z/YrX1MiIAtynuC27Iq4+Ph3LlG1kPZCAjxWof2ady7OpEXv?=
 =?us-ascii?Q?Bctbbe3omf/l42Npac/OpYc64AkItbG1px4eJY+mD7exMWDxnnVId2BAXb0y?=
 =?us-ascii?Q?GwFU+OHuSL6+gZ/LdyOyg/1Gne/MW4vQLgv2cJkYHvfDb+3agtV17M/HIWb9?=
 =?us-ascii?Q?a8ntqYjKFS4i3pJ9RuYF7Q6dXszgGplnrJjcidntr5Zn8ykcPeyVaps5W9GN?=
 =?us-ascii?Q?F6oC1gbOZ/CZiPlFU+Fq1Q6nYrQ7T565kJeUo297M0AdSZDrx8xuEuahklA4?=
 =?us-ascii?Q?neVKIfABwgfFQ9m7JUhx9e7JD4JKTd2CyXnjk3+1CiBhgufm2ouVAlTcaw3n?=
 =?us-ascii?Q?uX6ab+r1X6qvlDN7ASVMtn8ssW1x5b/05dMxaml/jW40aLnhMHrjL+AxrqdK?=
 =?us-ascii?Q?xJPoq2nOOSUd/VZGob5IVwj//DYFz7Hmg0zsv+5dPWIwbDxbZsM6XcJJrPR4?=
 =?us-ascii?Q?WzURNi8rDrMFV9Fg9whrTb8bWQI7uT//kL5nSUn9crY1Nx+I6/PXyPRqxidp?=
 =?us-ascii?Q?d3gTNuBabpsvXoh8DpMHyVZ+QEMuNiiNS6mqGZfWhVjE/CZSx+9a1/lMbvkB?=
 =?us-ascii?Q?GZiOzeWfzDN/xcoYklJ52/HYS/2e+Mk2Tgp/0ZbxlE1n+QQXokv0JpIgb8t6?=
 =?us-ascii?Q?Sf3oe9nGxvXDlnSW5HFYippVFd1fMEMDuE8cW8rrOu425oUIOF7+VHUWFa82?=
 =?us-ascii?Q?ov+ThsDszoFFl8P6ri8FjNY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6449ff85-b04a-4856-b6ac-08da01aa7b88
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2022 08:54:55.3878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GZZhLeTGrh5tFNhXTl/i9NYKqhcTsGotavc0oNcs7VesiYfeoR0RhQuFr7bn+r3cbXWC4nvSAlmpBJDPV8gMnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB5732
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.93; envelope-from=chen.zhang@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Ping....

Thanks
Chen

> -----Original Message-----
> From: Zhang, Chen <chen.zhang@intel.com>
> Sent: Thursday, January 27, 2022 6:33 PM
> To: Dr. David Alan Gilbert <dgilbert@redhat.com>; Juan Quintela
> <quintela@redhat.com>; qemu-dev <qemu-devel@nongnu.org>; qemu-
> trivial@nongnu.org
> Cc: Zhang, Chen <chen.zhang@intel.com>
> Subject: [PATCH] docs/devel/migration.rst: Updates content from code and
> fixes minor issues
>=20
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  docs/devel/migration.rst | 36 +++++++++++++++++++++++-------------
>  1 file changed, 23 insertions(+), 13 deletions(-)
>=20
> diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst index
> 2401253482..9f190d439a 100644
> --- a/docs/devel/migration.rst
> +++ b/docs/devel/migration.rst
> @@ -156,12 +156,20 @@ An example (from hw/input/pckbd.c)
>        .name =3D "pckbd",
>        .version_id =3D 3,
>        .minimum_version_id =3D 3,
> +      .pre_load =3D kbd_pre_load,
> +      .post_load =3D kbd_post_load,
> +      .pre_save =3D kbd_pre_save,
>        .fields =3D (VMStateField[]) {
>            VMSTATE_UINT8(write_cmd, KBDState),
>            VMSTATE_UINT8(status, KBDState),
>            VMSTATE_UINT8(mode, KBDState),
> -          VMSTATE_UINT8(pending, KBDState),
> +          VMSTATE_UINT8(pending_tmp, KBDState),
>            VMSTATE_END_OF_LIST()
> +      },
> +      .subsections =3D (const VMStateDescription*[]) {
> +          &vmstate_kbd_outport,
> +          &vmstate_kbd_extended_state,
> +          NULL
>        }
>    };
>=20
> @@ -278,7 +286,7 @@ Example:
>        IDEState *s =3D opaque;
>=20
>        return ((s->status & DRQ_STAT) !=3D 0)
> -          || (s->bus->error_status & BM_STATUS_PIO_RETRY);
> +          || (s->bus->error_status & IDE_RETRY_PIO);
>    }
>=20
>    const VMStateDescription vmstate_ide_drive_pio_state =3D { @@ -312,6
> +320,8 @@ Example:
>        },
>        .subsections =3D (const VMStateDescription*[]) {
>            &vmstate_ide_drive_pio_state,
> +          &vmstate_ide_tray_state,
> +          &vmstate_ide_atapi_gesn_state,
>            NULL
>        }
>    };
> @@ -481,11 +491,11 @@ versions exist for high bandwidth IO.
>=20
>  An iterative device must provide:
>=20
> -  - A ``save_setup`` function that initialises the data structures and
> -    transmits a first section containing information on the device.  In =
the
> -    case of RAM this transmits a list of RAMBlocks and sizes.
> +  - A ``save_setup`` function that initialize the data structures and
> +    transmits a first section containing information on the device. In t=
he
> +    case of RAM used to transmit a list of RAMBlocks and sizes.
>=20
> -  - A ``load_setup`` function that initialises the data structures on th=
e
> +  - A ``load_setup`` function that initialize the data structures on
> + the
>      destination.
>=20
>    - A ``save_live_pending`` function that is called repeatedly and must =
@@ -
> 756,13 +766,13 @@ ADVISE->DISCARD->LISTEN->RUNNING->END
>      (the 'listen thread') which takes over the job of receiving
>      pages off the migration stream, while the main thread carries
>      on processing the blob.  With this thread able to process page
> -    reception, the destination now 'sensitises' the RAM to detect
> +    reception, the destination now 'sensitive' the RAM to detect
>      any access to missing pages (on Linux using the 'userfault'
>      system).
>=20
>   - Running
>=20
> -    POSTCOPY_RUN causes the destination to synchronise all
> +    POSTCOPY_RUN causes the destination to synchronize all
>      state and start the CPUs and IO devices running.  The main
>      thread now finishes processing the migration package and
>      now carries on as it would for normal precopy migration @@ -771,8 +7=
81,8
> @@ ADVISE->DISCARD->LISTEN->RUNNING->END
>=20
>   - End
>=20
> -    The listen thread can now quit, and perform the cleanup of migration
> -    state, the migration is now complete.
> +    The listen thread already exited, and perform the cleanup of migrati=
on
> +    state, the migration has been completed.
>=20
>  Source side page maps
>  ---------------------
> @@ -861,9 +871,9 @@ Firmware
>  =3D=3D=3D=3D=3D=3D=3D=3D
>=20
>  Migration migrates the copies of RAM and ROM, and thus when running -on
> the destination it includes the firmware from the source. Even after -
> resetting a VM, the old firmware is used.  Only once QEMU has been
> restarted -is the new firmware in use.
> +on the destination it includes the firmware from the source. The old
> +firmware of the VM is still used even rebooted. And the new firmware
> +will not be loaded until QEMU is restarted.
>=20
>  - Changes in firmware size can cause changes in the required RAMBlock si=
ze
>    to hold the firmware and thus migration can fail.  In practice it's be=
st
> --
> 2.25.1


