Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4769372D88
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 18:05:02 +0200 (CEST)
Received: from localhost ([::1]:53910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldxXh-0002Nq-Oj
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 12:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ldxQl-0007wc-GD; Tue, 04 May 2021 11:57:53 -0400
Received: from mail-eopbgr800111.outbound.protection.outlook.com
 ([40.107.80.111]:48320 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ldxQe-0006fX-B0; Tue, 04 May 2021 11:57:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUj9d0HCEOi13md2wepK+AMbG17tHcHY2qS1kYKy6cMaFvo5pHRJu95p0A3OoC98dqric5u2QHYp0wXg7tUQhzAkN+6ofV1NVE2OibmR+6ck2AUGJ8mT23hlvTiYno3SN8fBdwMYTrUN3aH5tr7fBCWr7aL7mjVHKrb/qWgwDgFz8TQblI2gvwKh+bqAdLmNFKeNPzDSoV2FwrHRQb8p/CCC+265XFIhs4m4LI3f0pwuES7vrX5s1Ayk15kc7hXmnOTVSSF9/atB4RwejC228Gf8Z/7I5/uW+jXmCv7UaXDzHAanzss2EVLr3QcjBAislxvHCRGn9z3XLPRt/BeXVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TAkBvvJzvlQ9eg7C9veUFRTjtvfJBwmAS3h+8Y+q4M=;
 b=XF1nXQSTm9KKpSxQbKMXMIlHDu9Sw8ZeqbAEu5nstCM8vRIPEB7rv9MRPS/2w2dq7SRsZfEl19pi4opjM3MVJqxDSMUfnTnCN6GASV5ilKBBI98dAP2hZn2HbChlxg9cwXrucTfHo6KUlAHvGEUj/5rm0jeQJBvUjE2byENnSw0tr1TxJvr+86cuJ57/RwUGWZG/XswApDw4eNTW6Is1veklzaJbJC/hx4RDvP2AD32wIpaT0qekJqQJ/bL2Onj29OE/V8DzeAhRyTVzqoEM3s4RQ9dNZXLXL4C62fw78ZBA5URyzv6Ye6CqEHsfPNmr8N9p8hQSNESiInaGpyweyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TAkBvvJzvlQ9eg7C9veUFRTjtvfJBwmAS3h+8Y+q4M=;
 b=zkYqwv1161VSY9tLl+3vdYX19fhS7tVsZ3Ph5k4xCU2XcjfMuaNt+lWp94BA7Bp2MVTvi18UWJA9rhl4ngOCpLD374Hcp1q8AbnTAh7hEBVBedP6yrUxcZeCGoZKD0oVxQbzstKJ9gKoTAS/D7CEh5g338zRkVoPV1RJ3NrbZrDPmLyoE6ccwpVFATKcUa5Ngfeu08JyHL6LLG2xpnQZlbDjCVGhyhXDoLdgn38tiue31639JnyUe6BUqJvZL8D9eTIOd8WPUF1WrR9RWfEOYc/WnFo5FFBfzNDObf3HJVgr/sK/nuLsaxup2ZX6H/YpgAcIDVWMj3zyrpVMG4PQWg==
Received: from RO1PR80MB5610.lamprd80.prod.outlook.com (10.164.211.139) by
 RO1PR80MB0026.lamprd80.prod.outlook.com (10.164.233.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24; Tue, 4 May 2021 15:57:37 +0000
Received: from RO1PR80MB5610.lamprd80.prod.outlook.com
 ([fe80::80c8:6be4:9ced:38bf]) by RO1PR80MB5610.lamprd80.prod.outlook.com
 ([fe80::80c8:6be4:9ced:38bf%12]) with mapi id 15.20.4087.044; Tue, 4 May 2021
 15:57:36 +0000
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
To: Fabiano Rosas <farosas@linux.ibm.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
Subject: Re: [RFC PATCH v2 0/2] hw/ppc: code motion to compile without TCG
Thread-Topic: [RFC PATCH v2 0/2] hw/ppc: code motion to compile without TCG
Thread-Index: AQHXPfBglg+VWdcwCEiSj0sss1M9uKrSWV2AgAEmT8A=
Date: Tue, 4 May 2021 15:57:36 +0000
Message-ID: <RO1PR80MB5610221E6521AE956D861750CE5A9@RO1PR80MB5610.lamprd80.prod.outlook.com>
References: <20210430184047.81653-1-lucas.araujo@eldorado.org.br>,
 <87sg331mso.fsf@linux.ibm.com>
In-Reply-To: <87sg331mso.fsf@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none
 header.from=eldorado.org.br;
x-originating-ip: [2804:14d:8084:88a2:f253:fb57:7cbb:598]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4fb92ac7-51e0-4bab-2cc1-08d90f155680
x-ms-traffictypediagnostic: RO1PR80MB0026:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <RO1PR80MB0026B91D8FB4D9EC538B2A2BCE5A9@RO1PR80MB0026.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q2Uy7qFyFCEmbHi7sKVl5UL5dfhB+ucwt8LdRr4+U/O6PFZBWDSRil2Xfz97D6T7LIa6VZDu7ZJx0upW6YhRxaVA7jHR8a+XJ6KqAJPQ5ksx06fcS59lfzykQP6GIL+G7FIHmbVvNgYZ2XrCV2c7/I2ezmNt2Rta7j/XLaBVYFEcBaWBN9U8jnHGf9aPxIpVtj8sqc4b8q2bdRMjW769v8OdtSD+LyXsCIna0XWHhWv+wVZ20qkTnLJnPXwRI0rFKrGx6c/G1pYpX0rFpK1oS6WI7lKza2K3VmZjK2Al635W9f8h2QyUhlqhpRYdvgaIMHa/z2BFrqVPrw0Mw41Gd7JCsRA4dI+LcB8lGGyUej2ZlNKrNsaVzs68i0KdsjppSglCG6aKnhLEzvqo+OZrDynN+orsBhyLYKo6HULZ5PSUPmR2dsEf/IGsygn+dP2FHxoiRAWIrDTxJhPbyzejr4hSAKC/fVbss9epIcEAGy0zB5YMe+udeS9tg/1xNgpym8a2tfQ2Nj/UJhJSmK0aGA/cyqeLazU/EpzTaQZHlxAViyHMinnNPADv4l83mgXAKRo8RHcOGwGtN87cVJlGAQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:RO1PR80MB5610.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(366004)(39840400004)(396003)(136003)(64756008)(76116006)(91956017)(66556008)(66946007)(86362001)(66476007)(38100700002)(66446008)(52536014)(4326008)(53546011)(5660300002)(122000001)(7696005)(33656002)(316002)(55016002)(71200400001)(9686003)(8676002)(2906002)(8936002)(83380400001)(186003)(478600001)(110136005)(54906003)(6506007)(19627405001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?VWW7dOaFB/pVDqCzv+e96EkjPEHYERUhQB5Fkh4/obDyVGQm0DO+XVUoatEU?=
 =?us-ascii?Q?AE+1NZS1lVWbZ6+uXWPm7voBh6HT0fizqk/nU8I0wY0wDORIupzVc69r+kBH?=
 =?us-ascii?Q?cWOhgiDqu1zPvGpO9oM2GpGWTP6kAG8xk2iy8c2HohjyZtNJ0R/Ex637q36w?=
 =?us-ascii?Q?edmemjCbKab42uBgNB4uu6HalTDNbL06nFkdzN21y7lFZlcSIsdcDM87t+Gx?=
 =?us-ascii?Q?jD/gM7vBbeB+TJ08MP6/e1a+LwTinUDzkIQVEm5s78UNlgyXFPz8s2IdNzR3?=
 =?us-ascii?Q?iI0+5rw14ArUsPqAK0MGiApH9ytdczkDVLP5q5wavA1mXbmxYTV/AeczT4ML?=
 =?us-ascii?Q?uflgw2Dn10xYAt4hh6+g2mqR80Bws0R4rG+XFxgehkLoGaYhGVHYVQzfMGKE?=
 =?us-ascii?Q?xiSatCDr+oiBvIIQqcCwuxKuvshCoXOMAPEn0fGMIv9ncdupyPySSgQbzVBv?=
 =?us-ascii?Q?eGsnrxXK8WKNEJEyctkjT4BhHObsgN5lzkk/sC+lbmNOTJvL9uEw32q7bvly?=
 =?us-ascii?Q?iLslbdHyEwCGIvuqaCY20SYZnt5J32tpKQ3RCHdXVumFLyaOhLP/HbLjbf54?=
 =?us-ascii?Q?mRfcAB+984bNIXa4Q2LWKFJgPKLUEVs+rDouQHWnooVXlm51FT+EXOH5gjbn?=
 =?us-ascii?Q?wwYdySgT1dbEZM3leFJWN0fDKyVF1wLCFbL5MGoZECEtwQb7JX8tOMBMkFXq?=
 =?us-ascii?Q?eyWzf0tDxGbZn/Mjg4PYAYSiei5TeeLp+W1G2LV+/WsHJzZnkPODTZaApPWK?=
 =?us-ascii?Q?t1to79KKxt4P1flZ+pKNenLNgaa75m0xcvHXDYVH+b/au/J20XPpRHt65ZHw?=
 =?us-ascii?Q?8l4HwnpdiVNaXjrSMVLe+025//0Xndil+9C3QA9yxBE/qAVGKVb3UMKGo/mn?=
 =?us-ascii?Q?RIriC9WVACCGsdX2OMgZzZFVgTByFAv1Rn1uKeo6P/QooJITCnNO/Zg/WXis?=
 =?us-ascii?Q?390iBnL5s1qAcWsUWZEMAn15To2g9NkVDki24V7tw/9BxU2O93WXs0vZW1Io?=
 =?us-ascii?Q?OJFbt515nKvda4GwgmC+WdOc5jSiSHAWWafP8CVMv3R5CujykJhLwWgW9JvI?=
 =?us-ascii?Q?oiMRrrQAykdD6CM5H8uZxpWYuEjzaDMjokjFpdr3GtaB8L0qMsQCEOzqznU9?=
 =?us-ascii?Q?TRlvat49fgET+wVcRP9aXW+I4HbVWkIuCcwx0kVyWN7RF5VWIR+4FvQbIF8w?=
 =?us-ascii?Q?fvUh4N8NPsZ5xFVMzVkngzQtFr+U7YL0PsiKFy5HI3JX9rLrP8hTtLm7hlkV?=
 =?us-ascii?Q?yJqVeYELAAsuoqSs+rNXoHwIZBotujXOXKniUAjOwH0VpB0/zICRq1eoVWxJ?=
 =?us-ascii?Q?G34frBQ0ULdbll+Rd6NU20avqhYB8FY/1XWY+qN4+qloCZAHymD3t9iMZE1W?=
 =?us-ascii?Q?U8LpJRA=3D?=
Content-Type: multipart/alternative;
 boundary="_000_RO1PR80MB5610221E6521AE956D861750CE5A9RO1PR80MB5610lamp_"
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: RO1PR80MB5610.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fb92ac7-51e0-4bab-2cc1-08d90f155680
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2021 15:57:36.8986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LC+zK/nsoAITVKQG5jA+w8duC1mlMdKJWiM8pFkYOMPbmUBwpwiqV5QMosSuId7xsyb5jndD6NKFK+0i7DxdpgCgVx4LpnsW6POfZeZsNdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: RO1PR80MB0026
Received-SPF: pass client-ip=40.107.80.111;
 envelope-from=lucas.araujo@eldorado.org.br;
 helo=NAM03-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_RO1PR80MB5610221E6521AE956D861750CE5A9RO1PR80MB5610lamp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks, it will be quite helpful.

Also, I agree with Bruno including this information somewhere would be quit=
e good in my opinion.
________________________________
From: Fabiano Rosas <farosas@linux.ibm.com>
Sent: Monday, May 3, 2021 7:21 PM
To: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>; qe=
mu-devel@nongnu.org <qemu-devel@nongnu.org>; qemu-ppc@nongnu.org <qemu-ppc@=
nongnu.org>
Cc: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>; Lucas Mateus Marti=
ns Araujo e Castro <lucas.araujo@eldorado.org.br>; david@gibson.dropbear.id=
.au <david@gibson.dropbear.id.au>
Subject: Re: [RFC PATCH v2 0/2] hw/ppc: code motion to compile without TCG

"Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br> writes:

> After the feedback from v1 I reworked the patch with suggested ideas and
> this version has less duplicated code and is overall simpler.
>
> This patch series is still a WIP, there are still 2 main problems I am
> trying to solve, I'll mention them in their respective patches.
>
> The aim of these patches is to progress toward enabling disable-tcg on
> PPC by solving errors in hw/ppc with that option.
>
> As a WIP comments are welcome.
>
> Lucas Mateus Castro (alqotel) (2):
>   target/ppc: Moved functions out of mmu-hash64
>   hw/ppc: Moved TCG code to spapr_hcall_tcg
>
>  hw/ppc/meson.build       |   3 +
>  hw/ppc/spapr.c           |   1 +
>  hw/ppc/spapr_caps.c      |   1 +
>  hw/ppc/spapr_cpu_core.c  |   1 +
>  hw/ppc/spapr_hcall.c     | 301 ++--------------------------------
>  hw/ppc/spapr_hcall_tcg.c | 343 +++++++++++++++++++++++++++++++++++++++
>  hw/ppc/spapr_rtas.c      |   1 +
>  target/ppc/meson.build   |   1 +
>  target/ppc/mmu-hash64.c  |  81 +--------
>  target/ppc/mmu-hash64.h  |   6 -
>  target/ppc/mmu-misc.c    |  86 ++++++++++
>  target/ppc/mmu-misc.h    |  22 +++
>  12 files changed, 478 insertions(+), 369 deletions(-)
>  create mode 100644 hw/ppc/spapr_hcall_tcg.c
>  create mode 100644 target/ppc/mmu-misc.c
>  create mode 100644 target/ppc/mmu-misc.h

This is the list of hypercalls registered with spapr_register_hypercall
and whether they are implemented by KVM HV, KVM PR or none. I also list
whether the KVM hcall uses the QEMU implementation as a fallback. Maybe
it will be helpful to this discussion.

(This is from just looking at the code, so take it with a grain of salt)

H_ADD_LOGICAL_LAN_BUFFER  - not impl. by KVM
H_CHANGE_LOGICAL_LAN_MAC  - not impl. by KVM
H_ENABLE_CRQ              - not impl. by KVM
H_FREE_CRQ                - not impl. by KVM
H_FREE_LOGICAL_LAN        - not impl. by KVM
H_GET_CPU_CHARACTERISTICS - not impl. by KVM
H_GET_TERM_CHAR           - not impl. by KVM
H_HOME_NODE_ASSOCIATIVITY - not impl. by KVM
H_INT_ESB                 - not impl. by KVM
H_INT_GET_QUEUE_INFO      - not impl. by KVM
H_INT_GET_SOURCE_CONFIG   - not impl. by KVM
H_INT_GET_SOURCE_INFO     - not impl. by KVM
H_INT_RESET               - not impl. by KVM
H_INT_SET_QUEUE_CONFIG    - not impl. by KVM
H_INT_SET_SOURCE_CONFIG   - not impl. by KVM
H_INT_SYNC                - not impl. by KVM
H_JOIN                    - not impl. by KVM
H_LOGICAL_CACHE_LOAD      - not impl. by KVM
H_LOGICAL_CACHE_STORE     - not impl. by KVM
H_LOGICAL_DCBF            - not impl. by KVM
H_LOGICAL_ICBI            - not impl. by KVM
H_MULTICAST_CTRL          - not impl. by KVM
H_PUT_TERM_CHAR           - not impl. by KVM
H_REGISTER_LOGICAL_LAN    - not impl. by KVM
H_REGISTER_PROC_TBL       - not impl. by KVM
H_REG_CRQ                 - not impl. by KVM
H_RESIZE_HPT_COMMIT       - not impl. by KVM
H_RESIZE_HPT_PREPARE      - not impl. by KVM
H_SCM_BIND_MEM            - not impl. by KVM
H_SCM_READ_METADATA       - not impl. by KVM
H_SCM_UNBIND_ALL          - not impl. by KVM
H_SCM_WRITE_METADATA      - not impl. by KVM
H_SEND_CRQ                - not impl. by KVM
H_SEND_LOGICAL_LAN        - not impl. by KVM
H_SET_SPRG0               - not impl. by KVM
H_SIGNAL_SYS_RESET        - not impl. by KVM
H_VIO_SIGNAL              - not impl. by KVM

H_CAS                     - not impl. by KVM | called by SLOF only
H_LOGICAL_MEMOP           - not impl. by KVM | called by SLOF only
H_TPM_COMM                - not impl. by KVM | called by UV only
H_UPDATE_DT               - not impl. by KVM | called by SLOF only

H_INT_GET_OS_REPORTING_LINE - not impl. by KVM | not called by linux/SLOF/U=
V
H_INT_GET_QUEUE_CONFIG      - not impl. by KVM | not called by linux/SLOF/U=
V
H_INT_SET_OS_REPORTING_LINE - not impl. by KVM | not called by linux/SLOF/U=
V
H_SCM_UNBIND_MEM            - not impl. by KVM | not called by linux/SLOF/U=
V

H_GET_TCE      - HV | not impl. by PR | QEMU fallback
H_SET_MODE     - HV | not impl. by PR | QEMU fallback
H_CONFER       - HV | not impl. by PR
H_PAGE_INIT    - HV | not impl. by PR
H_PROD         - HV | not impl. by PR
H_RANDOM       - HV | not impl. by PR
H_READ         - HV | not impl. by PR
H_REGISTER_VPA - HV | not impl. by PR
H_SET_DABR     - HV | not impl. by PR
H_SET_XDABR    - HV | not impl. by PR

H_CPPR             - HV | PR | QEMU fallback
H_EOI              - HV | PR | QEMU fallback
H_IPI              - HV | PR | QEMU fallback
H_IPOLL            - HV | PR | QEMU fallback
H_LOGICAL_CI_LOAD  - HV | PR | QEMU fallback
H_LOGICAL_CI_STORE - HV | PR | QEMU fallback
H_PUT_TCE          - HV | PR | QEMU fallback
H_PUT_TCE_INDIRECT - HV | PR | QEMU fallback
H_RTAS             - HV | PR | QEMU fallback
H_STUFF_TCE        - HV | PR | QEMU fallback
H_XIRR             - HV | PR | QEMU fallback
H_XIRR_X           - HV | PR | QEMU fallback

H_BULK_REMOVE      - HV | PR
H_CEDE             - HV | PR
H_ENTER            - HV | PR
H_PROTECT          - HV | PR
H_REMOVE           - HV | PR

H_CLEAN_SLB      - never called/implemented, added along with H_REGISTER_PR=
OC_TBL
H_INVALIDATE_PID - never called/implemented, added along with H_REGISTER_PR=
OC_TBL

PS: we could perhaps use this information to annotate
qemu/include/spapr.h. I can send a patch if people find it useful.

--_000_RO1PR80MB5610221E6521AE956D861750CE5A9RO1PR80MB5610lamp_
Content-Type: text/html; charset="us-ascii"
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
Thanks, it will be quite helpful.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Also, I agree with Bruno including this information somewhere would be quit=
e good in my opinion.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Fabiano Rosas &lt;far=
osas@linux.ibm.com&gt;<br>
<b>Sent:</b> Monday, May 3, 2021 7:21 PM<br>
<b>To:</b> Lucas Mateus Martins Araujo e Castro &lt;lucas.araujo@eldorado.o=
rg.br&gt;; qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;; qemu-ppc@no=
ngnu.org &lt;qemu-ppc@nongnu.org&gt;<br>
<b>Cc:</b> Bruno Piazera Larsen &lt;bruno.larsen@eldorado.org.br&gt;; Lucas=
 Mateus Martins Araujo e Castro &lt;lucas.araujo@eldorado.org.br&gt;; david=
@gibson.dropbear.id.au &lt;david@gibson.dropbear.id.au&gt;<br>
<b>Subject:</b> Re: [RFC PATCH v2 0/2] hw/ppc: code motion to compile witho=
ut TCG</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">&quot;Lucas Mateus Castro (alqotel)&quot; &lt;luca=
s.araujo@eldorado.org.br&gt; writes:<br>
<br>
&gt; After the feedback from v1 I reworked the patch with suggested ideas a=
nd<br>
&gt; this version has less duplicated code and is overall simpler.<br>
&gt;<br>
&gt; This patch series is still a WIP, there are still 2 main problems I am=
<br>
&gt; trying to solve, I'll mention them in their respective patches.<br>
&gt;<br>
&gt; The aim of these patches is to progress toward enabling disable-tcg on=
<br>
&gt; PPC by solving errors in hw/ppc with that option.<br>
&gt;<br>
&gt; As a WIP comments are welcome.<br>
&gt;<br>
&gt; Lucas Mateus Castro (alqotel) (2):<br>
&gt;&nbsp;&nbsp; target/ppc: Moved functions out of mmu-hash64<br>
&gt;&nbsp;&nbsp; hw/ppc: Moved TCG code to spapr_hcall_tcg<br>
&gt;<br>
&gt;&nbsp; hw/ppc/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&n=
bsp; 3 +<br>
&gt;&nbsp; hw/ppc/spapr.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp; hw/ppc/spapr_caps.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; =
1 +<br>
&gt;&nbsp; hw/ppc/spapr_cpu_core.c&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp; hw/ppc/spapr_hcall.c&nbsp;&nbsp;&nbsp;&nbsp; | 301 ++-----------=
---------------------<br>
&gt;&nbsp; hw/ppc/spapr_hcall_tcg.c | 343 +++++++++++++++++++++++++++++++++=
++++++<br>
&gt;&nbsp; hw/ppc/spapr_rtas.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; =
1 +<br>
&gt;&nbsp; target/ppc/meson.build&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp; target/ppc/mmu-hash64.c&nbsp; |&nbsp; 81 +--------<br>
&gt;&nbsp; target/ppc/mmu-hash64.h&nbsp; |&nbsp;&nbsp; 6 -<br>
&gt;&nbsp; target/ppc/mmu-misc.c&nbsp;&nbsp;&nbsp; |&nbsp; 86 ++++++++++<br=
>
&gt;&nbsp; target/ppc/mmu-misc.h&nbsp;&nbsp;&nbsp; |&nbsp; 22 +++<br>
&gt;&nbsp; 12 files changed, 478 insertions(+), 369 deletions(-)<br>
&gt;&nbsp; create mode 100644 hw/ppc/spapr_hcall_tcg.c<br>
&gt;&nbsp; create mode 100644 target/ppc/mmu-misc.c<br>
&gt;&nbsp; create mode 100644 target/ppc/mmu-misc.h<br>
<br>
This is the list of hypercalls registered with spapr_register_hypercall<br>
and whether they are implemented by KVM HV, KVM PR or none. I also list<br>
whether the KVM hcall uses the QEMU implementation as a fallback. Maybe<br>
it will be helpful to this discussion.<br>
<br>
(This is from just looking at the code, so take it with a grain of salt)<br=
>
<br>
H_ADD_LOGICAL_LAN_BUFFER&nbsp; - not impl. by KVM<br>
H_CHANGE_LOGICAL_LAN_MAC&nbsp; - not impl. by KVM<br>
H_ENABLE_CRQ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; - not impl. by KVM<br>
H_FREE_CRQ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; - not impl. by KVM<br>
H_FREE_LOGICAL_LAN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - not impl. by=
 KVM<br>
H_GET_CPU_CHARACTERISTICS - not impl. by KVM<br>
H_GET_TERM_CHAR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 - not impl. by KVM<br>
H_HOME_NODE_ASSOCIATIVITY - not impl. by KVM<br>
H_INT_ESB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - not impl. by KVM<br>
H_INT_GET_QUEUE_INFO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - not impl. by KVM<br>
H_INT_GET_SOURCE_CONFIG&nbsp;&nbsp; - not impl. by KVM<br>
H_INT_GET_SOURCE_INFO&nbsp;&nbsp;&nbsp;&nbsp; - not impl. by KVM<br>
H_INT_RESET&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; - not impl. by KVM<br>
H_INT_SET_QUEUE_CONFIG&nbsp;&nbsp;&nbsp; - not impl. by KVM<br>
H_INT_SET_SOURCE_CONFIG&nbsp;&nbsp; - not impl. by KVM<br>
H_INT_SYNC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; - not impl. by KVM<br>
H_JOIN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - not impl. by KVM<br>
H_LOGICAL_CACHE_LOAD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - not impl. by KVM<br>
H_LOGICAL_CACHE_STORE&nbsp;&nbsp;&nbsp;&nbsp; - not impl. by KVM<br>
H_LOGICAL_DCBF&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; - not impl. by KVM<br>
H_LOGICAL_ICBI&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; - not impl. by KVM<br>
H_MULTICAST_CTRL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - no=
t impl. by KVM<br>
H_PUT_TERM_CHAR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 - not impl. by KVM<br>
H_REGISTER_LOGICAL_LAN&nbsp;&nbsp;&nbsp; - not impl. by KVM<br>
H_REGISTER_PROC_TBL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - not impl. by KVM<=
br>
H_REG_CRQ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - not impl. by KVM<br>
H_RESIZE_HPT_COMMIT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - not impl. by KVM<=
br>
H_RESIZE_HPT_PREPARE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - not impl. by KVM<br>
H_SCM_BIND_MEM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; - not impl. by KVM<br>
H_SCM_READ_METADATA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - not impl. by KVM<=
br>
H_SCM_UNBIND_ALL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - no=
t impl. by KVM<br>
H_SCM_WRITE_METADATA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - not impl. by KVM<br>
H_SEND_CRQ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; - not impl. by KVM<br>
H_SEND_LOGICAL_LAN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - not impl. by=
 KVM<br>
H_SET_SPRG0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; - not impl. by KVM<br>
H_SIGNAL_SYS_RESET&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - not impl. by=
 KVM<br>
H_VIO_SIGNAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; - not impl. by KVM<br>
<br>
H_CAS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - not impl. by KVM | cal=
led by SLOF only<br>
H_LOGICAL_MEMOP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 - not impl. by KVM | called by SLOF only<br>
H_TPM_COMM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; - not impl. by KVM | called by UV only<br>
H_UPDATE_DT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; - not impl. by KVM | called by SLOF only<br>
<br>
H_INT_GET_OS_REPORTING_LINE - not impl. by KVM | not called by linux/SLOF/U=
V<br>
H_INT_GET_QUEUE_CONFIG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - not impl. by KVM | n=
ot called by linux/SLOF/UV<br>
H_INT_SET_OS_REPORTING_LINE - not impl. by KVM | not called by linux/SLOF/U=
V<br>
H_SCM_UNBIND_MEM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; - not impl. by KVM | not called by linux/SLOF/UV<br>
<br>
H_GET_TCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - HV | not impl. by PR | QEMU fallb=
ack<br>
H_SET_MODE&nbsp;&nbsp;&nbsp;&nbsp; - HV | not impl. by PR | QEMU fallback<b=
r>
H_CONFER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - HV | not impl. by PR<br>
H_PAGE_INIT&nbsp;&nbsp;&nbsp; - HV | not impl. by PR<br>
H_PROD&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - HV | not impl. by =
PR<br>
H_RANDOM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - HV | not impl. by PR<br>
H_READ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - HV | not impl. by =
PR<br>
H_REGISTER_VPA - HV | not impl. by PR<br>
H_SET_DABR&nbsp;&nbsp;&nbsp;&nbsp; - HV | not impl. by PR<br>
H_SET_XDABR&nbsp;&nbsp;&nbsp; - HV | not impl. by PR<br>
<br>
H_CPPR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; - HV | PR | QEMU fallback<br>
H_EOI&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; - HV | PR | QEMU fallback<br>
H_IPI&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; - HV | PR | QEMU fallback<br>
H_IPOLL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -=
 HV | PR | QEMU fallback<br>
H_LOGICAL_CI_LOAD&nbsp; - HV | PR | QEMU fallback<br>
H_LOGICAL_CI_STORE - HV | PR | QEMU fallback<br>
H_PUT_TCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - HV | PR |=
 QEMU fallback<br>
H_PUT_TCE_INDIRECT - HV | PR | QEMU fallback<br>
H_RTAS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; - HV | PR | QEMU fallback<br>
H_STUFF_TCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - HV | PR | QEMU fall=
back<br>
H_XIRR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; - HV | PR | QEMU fallback<br>
H_XIRR_X&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - HV |=
 PR | QEMU fallback<br>
<br>
H_BULK_REMOVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - HV | PR<br>
H_CEDE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; - HV | PR<br>
H_ENTER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -=
 HV | PR<br>
H_PROTECT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - HV | PR<b=
r>
H_REMOVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - HV |=
 PR<br>
<br>
H_CLEAN_SLB&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - never called/implemented, added=
 along with H_REGISTER_PROC_TBL<br>
H_INVALIDATE_PID - never called/implemented, added along with H_REGISTER_PR=
OC_TBL<br>
<br>
PS: we could perhaps use this information to annotate<br>
qemu/include/spapr.h. I can send a patch if people find it useful.<br>
</div>
</span></font></div>
</body>
</html>

--_000_RO1PR80MB5610221E6521AE956D861750CE5A9RO1PR80MB5610lamp_--

