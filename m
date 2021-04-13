Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A97835E44A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:44:11 +0200 (CEST)
Received: from localhost ([::1]:60384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWM94-0005sQ-6h
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lWM0p-0001qi-8n
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:35:39 -0400
Received: from mail-eopbgr740138.outbound.protection.outlook.com
 ([40.107.74.138]:26103 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lWM0k-0002nc-19
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:35:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ociCyFbGK07BiKMIxvuYEAyp1hxs0oCQqPDYmwqi200ajB2GfhcO43CbIMQtnP/yqb6CVupjmk2CHoEdmkWrf+fjg2UjL7dAHiJJQuqHoH4twF5+qAw35zDdzi2a/WVPoDK+Tkt/qTGEUqvr0yu7qqKsGorT57BftZlCZGSdNMJ28/Up0IjMtVS7FwNqvZF0WebBay7LfKC0xWsIUI9J9TJLe2U4bTi/DXewljrFwwcnZQL6dfHlBVhakgy63piOmRAmicnnBajClzKiPpSg8SVvWaM1PberEc/mgJgiP7lKdIZHibMHR/bfPWLoe2A5sJZFzCPIbOWt0kyhHaIk4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwa1FobmLrB7ESyB/s6kjytuqV4GTx5bl1YbyFTVN/Y=;
 b=g0EofIkFH8Yz+YDKreIoMzpxhyW5WT16tllboGfcPgwqZMZsf0kyDkBJOXqbjkiVAuIZsyisbMMzhV/bSt4DIY7crhVp+9tL1MFApZb0ZTWafI7CaRF/Ipl7PIGEgbCi9upmcdCTgQL9lL9k1DDtKTaDKyPMcwXcvy6FBLx/zQZnyxN/DYA0S1UPK/dYGOLYO/IpYqHmeI0oJwv5FcGmRTop+XZ8z/x3CQEayFs01v4Id98St5Tmiz312HZFpsnBbYFr61mtXRj3n6AnR8+hcxf7KvIYNAaOOQ0e1oTV+IY1EMgFiuc2SFOrpc0sqR4ep/ywHW8sYKbNJoO3AfRjzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwa1FobmLrB7ESyB/s6kjytuqV4GTx5bl1YbyFTVN/Y=;
 b=zvNIVq+GBGkopjY5SSoF32MMgqL0rbSYbt3xRiICk0mi8OraIbxRbLhlmfHId+WOvgAHTN5SfwtlGL5tkThVt+0g5Jn1FsRyCkl26H2SrYigamieFMgXZ0U/XctKXFO2QgMNfDuXGYftr8N6afX2vnjynyZcLTfx07cdpJxwyTdumdkpvi3beP2GuAD5ORILiTOq/co7kDjOq9pAdg9XXmKBaC4AIBcUe25djN0ctI65SbnIX2jynun8CvbsRvPnEeuESj1KwvP6xowBFztBU6bWclwaMW2ljbb7XA/UfVJmA6MsGH6ZQ9ueTGMJfsKGPKAjMHSUOHYkJKrczTeL9g==
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com (2603:10d6:102:45::19)
 by CP2PR80MB4322.lamprd80.prod.outlook.com (2603:10d6:102:3d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Tue, 13 Apr
 2021 16:35:28 +0000
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b]) by CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b%7]) with mapi id 15.20.4020.022; Tue, 13 Apr 2021
 16:35:28 +0000
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2] target/ppc: code motion from translate_init.c.inc to
 gdbstub.c
Thread-Topic: [PATCH v2] target/ppc: code motion from translate_init.c.inc to
 gdbstub.c
Thread-Index: AQHXMHUbr/+ZDHav+kmgP6xwaR6OHqqymVCAgAAHodg=
Date: Tue, 13 Apr 2021 16:35:28 +0000
Message-ID: <CP2PR80MB449944BBB61F3858D3F566DFC74F9@CP2PR80MB4499.lamprd80.prod.outlook.com>
References: <20210413145427.41749-1-bruno.larsen@eldorado.org.br>,
 <f580510c-0468-f1bd-5d3a-dc52043e5c1a@linaro.org>
In-Reply-To: <f580510c-0468-f1bd-5d3a-dc52043e5c1a@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [2804:14c:482:7ed1:f76e:bbb3:9eaa:b6e3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb92b314-d2b5-4065-d55e-08d8fe9a25e4
x-ms-traffictypediagnostic: CP2PR80MB4322:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB4322F4715DD2C10D75ED1159C74F9@CP2PR80MB4322.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j46PVaW2VofvQy9BjAymJ6Mt6f3T9p/TLssOD0hLFR4RkCwzFhs/WAgDL0SxoI2FzBDTQ+0wOZ9nj5k78M4x4nGO5tR4HppNxLDJnvZYFBGkcyWbSjaRLcu1270Qb/UCdBHxCGU4hBRffR3Yjy2npj71PUAKAQ9O5K38gfH7SOrTaiXf337gOdZn9Nx+DUm/d7OMgZ8uYc7iglHKlkk5mStCuPdLaMDM5yPR9HnNkPQLscpec2gQY2bdrW1RhdE4wA1gP0ec7C5Ba9Pif4uB/GgWkNy33CT1Qse47KhhxYtwLpLDQ+6+vs5a1LXnC0/exfWOKFHpAs3puWb10x97iGl2cUOvMb1vqeXxkSmNG3xCHChj72rL78JsTTXnOfjPi9SVu9zfiVbvgYAOZ0YQyxqc3FuFbzODjF4Nhyj4Ebpm/x4KiZhACBLqFuCYzPxJlzJTMJJzuszsFSW+0wRui8v62nq2v3lmDDRwhinlwvt07zxyj5OqbV+D1c49pV6CZHOBRAuqHB/xc+gJxI2zJ0SKopksocSo2JzY0mvKaA6ylz5W0KnBrQhaeofrI6zoO+PB1wRpUueoHOTceIQAg49VO4XyEmyX2i1DmLAQfCycPN2BDzFbSLImHXlltYltXNhtHWRDCSIfBxcblRD4ONSbbV8wQiewGTXlD1exRlrjUAWD9mNIYUDOzTUheWwE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB4499.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(19627405001)(66556008)(71200400001)(110136005)(166002)(5660300002)(86362001)(33656002)(38100700002)(186003)(91956017)(54906003)(498600001)(52536014)(76116006)(66946007)(7696005)(8936002)(6506007)(21615005)(8676002)(122000001)(2906002)(66446008)(55016002)(9686003)(66476007)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?vBTaDruMU7enr8EUnXUA1YZU0xDHgXN68m3nrdX7ZQqVnnT5gMgXOSm5sK?=
 =?iso-8859-1?Q?WwxEruGrGpmsj55BtvmGVv7HPF/d4PYEaD1PJmiMQTvcfaGwVq2vtSWcU+?=
 =?iso-8859-1?Q?ZRTiUUwpJU8mmRtTNE4oac/EbQNAwq4bCiwcbQH/7q2fFEOa3U1XL86ZLV?=
 =?iso-8859-1?Q?l2onmCxcz/uCls75vzQMVnQ927MAMRN3cENk/7kc9Y84rUqa+2S4Njphp8?=
 =?iso-8859-1?Q?G+gbVrvm9/u5JBquSAlAf1/Q3olrPZK3LKJWCG5bD13LhnkGbKATe+dVUz?=
 =?iso-8859-1?Q?0W6RqyjRE9Rp1dMvcszd4oqDTUqE0Z3DGaAX7T/OEFpQpd8nNMuvFf9Jm4?=
 =?iso-8859-1?Q?vcDGo3twkFjaK1h9vxFJGCW5q7FNqBYvSIYMGp9a0o7WvKLPd607+rIHvJ?=
 =?iso-8859-1?Q?gVXnlWlqv/wpdbOrbVVrvMQyv1HOnRgqlAA0iSy2cqluLZ3gsvpXe04fqo?=
 =?iso-8859-1?Q?lQNG/l2Apr5Gr+fogGPsikvHgzHVKjITwBV0KG4hrJUInuMABHjC58zVGZ?=
 =?iso-8859-1?Q?QJ/nH7+PEpcA61tTHnd70VXuzcaW46Kal8r7Wi1hF9DFqD7aOTfNQH3V1J?=
 =?iso-8859-1?Q?iREIpMYkOOIfPrborCcoWFNudILA3pvB0Js3yneH1FlnwlnrXwAAmJE3K4?=
 =?iso-8859-1?Q?Ifi9+qEnCRpbHKLXW82Tv3MqVc3NsWRwrkAqICJLKAFm/SMeBhbFOKUsem?=
 =?iso-8859-1?Q?i8vNsv19VwusnMkx82o8P1niQPVxDp/6ISIsz1qg9NfX2jLQzxVf5vLB9M?=
 =?iso-8859-1?Q?gzUsDz044I271KtiBVVwDbkDC9PCJ0TB62OvyiDgF8siXYzegl6VAqGyqs?=
 =?iso-8859-1?Q?n8fmnA0DxkwTTV0kmDkI3lbDY0Dqit+OuMyK73SDQkO140MCP04F3zQBvW?=
 =?iso-8859-1?Q?v2VCgFdsEBkPfqLox5YoONKQgZByqW4ursCFztiYU3I6PbDoPqFVv232Fu?=
 =?iso-8859-1?Q?B4wp5npT0NWl84auZP7EXOh6zCWhGkA9XJqr4WBPFvoDblL6lOkbQ07gFA?=
 =?iso-8859-1?Q?Mo4fqE102A8AKKhvTv6ZkUI3rD7dKj+7iCgn8ah5VelAh9JMTyiKi/BuJQ?=
 =?iso-8859-1?Q?yaMDV2bA2KiZM3ev4fZlmX3C1uYI36+WtX7L88C9MQRYMGSFdMGzozP/SM?=
 =?iso-8859-1?Q?+fMKRNukfunWTs13TtUb50lpXr/Jft+DPzSiKWFeoXS6UGsUiStx8fKXiz?=
 =?iso-8859-1?Q?alucAjaPXZj9ftpUJbhpDGk1CTxi+NPcylyaRsJVGWxZbEfS4wnxWwCzYo?=
 =?iso-8859-1?Q?k5wbq8J9l23P660ZXWS7ep++xBrKA6LtB0uUlLhWpKvyZHYGMyzDctP18n?=
 =?iso-8859-1?Q?DVnazGSJB6WOSGDDpsJORHgml8H+WM+LcvbEcjYzBJSvekmEkbgpFqqj78?=
 =?iso-8859-1?Q?tLv6IZSVEofxD+Y2mU+qNw7pGioMMK+/+8rx3Q1PyU8RpBkoyN0/s=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CP2PR80MB449944BBB61F3858D3F566DFC74F9CP2PR80MB4499lamp_"
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB4499.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb92b314-d2b5-4065-d55e-08d8fe9a25e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2021 16:35:28.5338 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V7VYeizInV0wL0VH/B4ymGFvyysabtRyeXzGrvWLQ2nQvkjY4b3XIWCKgx5f5Daznw+/WtFMDh3j28eAX5rw7eXKTlEMDwP9lw1mzhhHbzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4322
Received-SPF: pass client-ip=40.107.74.138;
 envelope-from=bruno.larsen@eldorado.org.br;
 helo=NAM01-BN3-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_KAM_HTML_FONT_INVALID=0.01 autolearn=ham autolearn_force=no
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
Cc: "farosas@linux.ibm.com" <farosas@linux.ibm.com>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CP2PR80MB449944BBB61F3858D3F566DFC74F9CP2PR80MB4499lamp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> > +/* gdbstub.c */
> > +void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *ppc);
> > +gchar *ppc_gdb_arch_name(CPUState *cs);
>
> These should probably go into internal.h and not cpu.h.
> These do not need to be exposed outside of target/ppc/.

Makes sense, I can do that. Is such a small change worth a v3, or do I fix =
this as I send the disable-tcg patch series?

> > +#include "exec/helper-proto.h"
>
> Not ideal, but ok temporarily.

yeah, this is only here until we figure out how to deal with the vscr stuff=
.

> > +        gdb_get_reg32(buf, helper_mfvscr(env));
> ...
> > +        helper_mtvscr(env, ldl_p(mem_buf));
>
> These should be modeled on e.g. store_fpscr, where there's a non-"helper"
> function to be called, which is then called by the "helper" function.
>
> Obviously, splitting that out should be a separate patch.

We already expected to fix this in the disable-tcg patch series, but this r=
eference does help (:
However, checking now, store_fpscr is defined in fpu_helper.c, which is mos=
tly TCG stuff. Any
idea where we could move the store_* functions to have them compile in the =
!tcg build?

My best guess is to do it in cpu.c, as the other files compiled with the sa=
me options are cpu-models.c and
gdbstub.c.


Bruno Piazera Larsen

Instituto de Pesquisas ELDORADO<http://clickemailmkt.eldorado.org.br/ls/cli=
ck?upn=3DUPoxpeIcHnAcbUZyo7TTaswyiVb1TXP3jEbQqiiJKKGsxOn8hBEs5ZsMLQfXkKuKXZ=
7MVDg0ij9eG8HV4TXI75dBzDiNGLxQ8Xx5PzCVNt6TpGrzBbU-2Biu0o69X5ce-2FW-2FOk1uUi=
puK0fZnWXJEgbRw-3D-3DJY4T_wWk-2BG6VvNBoa1YzxYjhCdFS9IfANIaBzDSklR1NyyrKOI1w=
j0P-2BdBFcuO4FnHcsA1MyHu0ly1Yt3oDMp7KKdJPM68iKuI2jiRH5v4B0d8wf3chU3qy5n5iXW=
nW1QjSaNFHOgELzxaP-2FnesTeBgJ5dFkjH4f279sVQpOtyjw5xAqj34M6pgNRAxVvuXif4IWDc=
VzXg1FzfYlEfkKzr9vvpA3Hg8kitwMtlU3zwbQUBCgL30fQoJPcRPMGKyOY8RmoAlXNqTJYDYIv=
qmfnI7KLUvw6vKB5R-2B5q1FJRAzX7H-2BmF0NnDET6jMLuIqtCcVIch>

Departamento Computa=E7=E3o Embarcada

Analista de Software Trainee

Aviso Legal - Disclaimer<https://www.eldorado.org.br/disclaimer.html>

________________________________

--_000_CP2PR80MB449944BBB61F3858D3F566DFC74F9CP2PR80MB4499lamp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; &gt; +/* gdbstub.c */<=
br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; &gt; +void ppc_gdb_ini=
t(CPUState *cs, PowerPCCPUClass *ppc);<br>
&gt; &gt; +gchar *ppc_gdb_arch_name(CPUState *cs);<br>
&gt; <br>
&gt; These should probably go into internal.h and not cpu.h.<br>
&gt; These do not need to be exposed outside of target/ppc/.</span></font><=
/div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">Makes sense, I can do that.=
 Is such a small change worth a v3, or do I fix this as I send the disable-=
tcg patch series?
<br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"></span></font><font size=3D=
"2"><span style=3D"font-size:11pt">&gt; &gt; +#include &quot;exec/helper-pr=
oto.h&quot;<br>
&gt; <br>
&gt; Not ideal, but ok temporarily.</span></font><br>
</div>
<div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
yeah, this is only here until we figure out how to deal with the vscr stuff=
.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; &gt; +&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; gdb_get_reg32(buf, helper_mfvscr(env));<br>
&gt; ...<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; helper_mtvscr(env, ld=
l_p(mem_buf));<br>
&gt; <br>
&gt; These should be modeled on e.g. store_fpscr, where there's a non-&quot=
;helper&quot; <br>
&gt; function to be called, which is then called by the &quot;helper&quot; =
function.<br>
&gt; <br>
&gt; Obviously, splitting that out should be a separate patch.</span></font=
></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size: 11pt;">We already expected to fi=
x this in the disable-tcg patch series, but this reference does help
<span id=3D"&#55357;&#56898;">(:</span></span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size: 11pt;"><span id=3D"&#55357;&#568=
98;">However, checking now, store_fpscr is defined in fpu_helper.c, which i=
s mostly TCG stuff. Any</span></span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size: 11pt;"><span id=3D"&#55357;&#568=
98;">idea where we could move the store_* functions to have them compile in=
 the !tcg build?</span></span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size: 11pt;"><span id=3D"&#55357;&#568=
98;"><br>
</span></span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size: 11pt;"><span id=3D"&#55357;&#568=
98;">My best guess is to do it in cpu.c, as the other files compiled with t=
he same options are cpu-models.c and</span></span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size: 11pt;"><span id=3D"&#55357;&#568=
98;">gdbstub.c.<br>
</span></span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont">Bruno Piazer=
a Larsen<span style=3D"color:#1F497D"></span></span></p>
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont"><a href=3D"h=
ttp://clickemailmkt.eldorado.org.br/ls/click?upn=3DUPoxpeIcHnAcbUZyo7TTaswy=
iVb1TXP3jEbQqiiJKKGsxOn8hBEs5ZsMLQfXkKuKXZ7MVDg0ij9eG8HV4TXI75dBzDiNGLxQ8Xx=
5PzCVNt6TpGrzBbU-2Biu0o69X5ce-2FW-2FOk1uUipuK0fZnWXJEgbRw-3D-3DJY4T_wWk-2BG=
6VvNBoa1YzxYjhCdFS9IfANIaBzDSklR1NyyrKOI1wj0P-2BdBFcuO4FnHcsA1MyHu0ly1Yt3oD=
Mp7KKdJPM68iKuI2jiRH5v4B0d8wf3chU3qy5n5iXWnW1QjSaNFHOgELzxaP-2FnesTeBgJ5dFk=
jH4f279sVQpOtyjw5xAqj34M6pgNRAxVvuXif4IWDcVzXg1FzfYlEfkKzr9vvpA3Hg8kitwMtlU=
3zwbQUBCgL30fQoJPcRPMGKyOY8RmoAlXNqTJYDYIvqmfnI7KLUvw6vKB5R-2B5q1FJRAzX7H-2=
BmF0NnDET6jMLuIqtCcVIch" target=3D"_blank" rel=3D"noopener noreferrer"><spa=
n style=3D"color:windowtext">Instituto
 de Pesquisas ELDORADO</span></a></span></p>
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont">Departamento=
 Computa=E7=E3o Embarcada<br>
</span></p>
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont">Analista de =
Software Trainee<br>
</span></p>
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont"><a href=3D"h=
ttps://www.eldorado.org.br/disclaimer.html" target=3D"_blank" rel=3D"noopen=
er noreferrer"><span style=3D"color:windowtext">Aviso
 Legal - Disclaimer</span></a></span></p>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
</body>
</html>

--_000_CP2PR80MB449944BBB61F3858D3F566DFC74F9CP2PR80MB4499lamp_--

