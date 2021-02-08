Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481793144FE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:41:23 +0100 (CET)
Received: from localhost ([::1]:39948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9H5l-0003nd-H3
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:41:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1l9Dkd-0001qz-6Q
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 16:07:19 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:33968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1l9DkY-0006j0-Os
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 16:07:17 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118L06vo062170;
 Mon, 8 Feb 2021 21:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=HJHEzpWumx+zdA0G38zBhlh3Sb1Ih6iorH4m0ghA7kg=;
 b=gQmtLan/6sAccD4v0KHmi1eLq4AK2+E3VVCRON+pHt/j+va1BI6E1yOaUYuXqoZuXH6k
 LSuZW7DfFBGTi7cQibWcFEFOTMGkVZY/zOkJLYhMAZLBz1GsRfS1uiWeuj6zNU0Zveul
 LaLccLILBN5EdRx90L2Z4efBAu82Sw6rOlfSTknZ7NJc5aJhMDwPe9thHtAoaKDvlsR2
 lnB2LflJnLlm85Wj75IjsHTLQyBuia474QFssCD8j/RZdOAYd25OSABOGGXwwYk7aH29
 oSSriS+5z38+/9gBbzXCST92yu9u/r01LJ2VKJc76499WpZe3K+sV9vNGdT5LSxNkcb1 nQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 36hgmadh5g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 21:07:11 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118L29Rc146977;
 Mon, 8 Feb 2021 21:07:11 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by aserp3030.oracle.com with ESMTP id 36j4pmu9aq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 21:07:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgDI8DszW6A389giCdkiEKSEZ1jdIo2cMvJJdK1wUEbzEE8Pz3PB50uqQgonqBVCvQLWumWf+K5XDtfgDqHMhu7VDg+7IK4x812PwFsIEA1wX4/IXu8cTB7gajLoVYJrQ5KwovKbzdSBRS+G+s1NEc/dJPLwBSmqMp0rsTBMEP7yrytcSi6uoHW5X4Md84d3xfr+C+womRbyN1t3/pMDPl+Hsfp4iXxq16t3RCpScBLFAsqnYWx2GHG30Opw+VOPnLHuK8B87QK4H/P8iRl7ck4Nkeh53mSzQ/ur/iXfS/UXvhx4+RX4YHwkg3aRMn8kR5lyZW/P10o6F0Bbv7CHBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJHEzpWumx+zdA0G38zBhlh3Sb1Ih6iorH4m0ghA7kg=;
 b=MkieQedrEdGn5cPJl3afJGso/nUijbp4+tXtayb6IBF43zSdgN3RtO98XcI+z/h23qUxUhQXRZAmNvMQq+5yUMXf1fpH5yi2zcoAmvhMiqExaw/AaPSN81KCdNvEhw1P57diIW3PmpU4UWWTPne2nVmh6Ts7AFvr01gn8BkWADMGMo2WbNhtCousZl3Q+b1/xjKW26o+TJLB6f2dml/ZtekgYKrOiAs2+l0RJv0kbFPqO4OGPJM3QHwXTd+JAdS9zdByMRJTaihsG/i7hujB0Mn5u9d1N4hZtb/qqqm2MA5qY+9SYhowlltxCPJppuDu5PvY26nl2tOoEhI/TS+4Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJHEzpWumx+zdA0G38zBhlh3Sb1Ih6iorH4m0ghA7kg=;
 b=jcJf6tMKDiTle6O+4tT/PE2N/U5C7ttzY9781uqDyI9w7xIfbxvid7hvawQ7WPDzwzxy1Xl8ULVzQ72eOLbJf/FmQLTaBGxQPFgRA3ghp8vBr52Ur5DCHNvi852J8Uev1+i4LMH26ckYVRL+YLrXCmrD1zPGYw2/WvCcDtttEmo=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4562.namprd10.prod.outlook.com (2603:10b6:303:93::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.24; Mon, 8 Feb
 2021 21:07:08 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::1193:5eb7:7993:85a2]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::1193:5eb7:7993:85a2%7]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 21:07:08 +0000
From: Eric Devolder <eric.devolder@oracle.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 0/1] acpi: Implement ACPI ERST support for guests
Thread-Topic: [PATCH 0/1] acpi: Implement ACPI ERST support for guests
Thread-Index: AQHWsfGasfMs1z7ALESELgeY2vz3IKpPV1/l
Date: Mon, 8 Feb 2021 21:07:08 +0000
Message-ID: <CO1PR10MB4531BEAD0719D242FADEE8AD978F9@CO1PR10MB4531.namprd10.prod.outlook.com>
References: <1603743573-9870-1-git-send-email-eric.devolder@oracle.com>,
 9833186.69647
In-Reply-To: 9833186.69647
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [138.3.200.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f19b53f3-b5b0-443d-590d-08d8cc757f1d
x-ms-traffictypediagnostic: CO1PR10MB4562:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR10MB45626A334D5E0870BE3B6D54978F9@CO1PR10MB4562.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iRKApUaQB1ewhNWsCkZywPuVsW717bEHGXuMB2U04i6NdoPSXHEtbDyCD7I/J03+iYYaPncw1dln/Z3MGneE9TeUJnvQgt2j3tSex2SQjppaX+WpHnIBju0zp/jxmE9E4lFu26/bItSc+oNpeymBd9mJd5kYNBxbFxNg61iFx2mCrb8j2CLLjyVXh0vyT2LaemQthIwlnQguhJUy5UfGDzuPMm6pwevlh47D1CPrU3nsVWD7Wq40Y0DUnWty4zlf4GZ+E5DHSsAn/JvOdnCJVtyp/4qvetU/5ov5WBGVLYarSEusqeWRJg2Sdg3orXTUDGqQHqoFQjxN4h30ED+O4QqQVtLDBu+YNylrYcZFSA958tjENkYSOfLu3Cnr6oS+DSTfOQi14yOBQJn/5KNeiYSJDc947goqUp24SATqLiCz/yhamSDz7SYOKmwVNBIll36Tz6fXrHgdmPC0dFZ4s5YNmRpn39KnzOV0HdH9cTYboz/6Yg+dMkWD6XhKqBFsP99pyHjzOvCmB0eY4Tn7Hg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(396003)(376002)(39860400002)(346002)(44832011)(54906003)(26005)(5660300002)(66476007)(64756008)(316002)(83380400001)(6916009)(66446008)(71200400001)(8676002)(4326008)(2906002)(86362001)(55016002)(52536014)(7696005)(478600001)(76116006)(91956017)(33656002)(9686003)(53546011)(6506007)(66946007)(8936002)(19627405001)(186003)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?7qmZ5/OfsoZ5p//hBfGeHu0cPL92VvZ6zf/bWPCcbdS+Nq3Sfr3pcNt59K?=
 =?iso-8859-1?Q?nGLF8+DnBigaQrrF74EPEC5otxsHEA8bVk82J2Bw81whelDYZMVArZ6RQ3?=
 =?iso-8859-1?Q?zFwQn1MPv9eTkFfg57bW/3SQappus5eTBsxNCHof66C4rv5S+81nea4fKs?=
 =?iso-8859-1?Q?5oh9zdSE1fp0rkL/XtaR+3RaPggl/P5UWAHKVX/OxPnnUfR4+rXnhVY9Zr?=
 =?iso-8859-1?Q?ky871BMIwVP8UFick/p9QlLJwlyJL7hhMnp+/+0Y/d6qv5CbGlim5pXaKf?=
 =?iso-8859-1?Q?9z/8yVyWnG+rcaFbiujHarN3V7+DsoBbZToffnZUI0DXL+5Fum7/B9SD7q?=
 =?iso-8859-1?Q?wqBgg5ISO6oCMm1rVjICVAAgM9WwUEkqVWdNeLVbZ2AhfD89g519Mpx0jh?=
 =?iso-8859-1?Q?9eEZW2oo3h1FUnscq4ph6vja1ApOu37K7iZfOQawoR3BnAfURSREGs/A6B?=
 =?iso-8859-1?Q?RudY91HSoFc5CquL520rvOGr9jUWcnYqnPVVkxeS9ZmAQiO8FfcINLiXyn?=
 =?iso-8859-1?Q?/HyEfYIZXiX/k+AqzES4WTuDeTMVRqWx7CwxOm/8udM038tbTAOaSlHn53?=
 =?iso-8859-1?Q?0rnR6Q6gl+bGvlIoToea2WynZDQ0f3yyqdJSKiMC9V4p5EoTJGk+nOd7rV?=
 =?iso-8859-1?Q?KBb6W4x3RrTvKZX6UXLuKyMi1F7Ng2zVYPFMOwh65/EscAWRk7ws5baFam?=
 =?iso-8859-1?Q?psz01XzWQx9I0VJCfMBxgp2fIk7ilvUzoAHXq/UyjsJx29e1pPKTpbS6gm?=
 =?iso-8859-1?Q?xwbpyxCDT3zxhv1okL39Hby5+IgN/MXa05FVc+VxWfFVnkhQ9+W+0SepXP?=
 =?iso-8859-1?Q?mEcHmBk2MKFknD07Zxf8nYsn0SOqca8k5B4pZDtYqm25iOTRwHuMnwTGjg?=
 =?iso-8859-1?Q?XbfGkXMgeUcOvWi/rCH1NVNDH/KMONaeZKbVakpTqTmR1UV3lsQIT2zH+b?=
 =?iso-8859-1?Q?WgzSkHkRpyYq12a8QT8Lj5YK4X1TJUuMJMITrUSEkXBbhmSOerJe0FPS07?=
 =?iso-8859-1?Q?T0aU3dAy6zbIeFYasIudt0ilVkB3PtSP/7CpdsWASEULiQ85bbuvr7znk1?=
 =?iso-8859-1?Q?xeXmpFfHAdr7LMAs89ZRgCD5gc3BvR/xTBJuV/RQn2zGMBePgtED3Pu4WW?=
 =?iso-8859-1?Q?T4MV8ns1V6Y5kRQPpMR5HmFiNS4P+wf6G+xUQqSYIM4WNUk20Z6I4Z9omy?=
 =?iso-8859-1?Q?xlpbviv1FvK/MqqmcCLl0t8u13qW4kVI4Ugzf6UMlz5moeo+OgbQhaAGLo?=
 =?iso-8859-1?Q?rWF4OCDamy06MrAWzMUaEI2/SuiT3vo6BEKeBM/RreeRmhwHtf+bz5Wsot?=
 =?iso-8859-1?Q?9r5OXvQS80EVOjJKri17GAmUjDly2hSj5IHMKJhMOwLwk2k=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CO1PR10MB4531BEAD0719D242FADEE8AD978F9CO1PR10MB4531namp_"
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f19b53f3-b5b0-443d-590d-08d8cc757f1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 21:07:08.7898 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mreiSqeX2jUhG3TRK/Ys88xgIEfLOpabT8JfIA+pvLi4Mk22fpKvR8cIQHNJhbDFadYnsi3GiAtqHGHqOizcleajJRi/zBhlkSvP8GaMT7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4562
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102080120
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 clxscore=1011 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102080120
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=eric.devolder@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "mst@redhat.com" <mst@redhat.com>, Konrad Wilk <konrad.wilk@oracle.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "lersek@redhat.com" <lersek@redhat.com>, "rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CO1PR10MB4531BEAD0719D242FADEE8AD978F9CO1PR10MB4531namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Igor,
Thanks for the feedback. Please see EJD: inline below.
I've posted v2 of this patch based on your feedback.
eric

________________________________
From: Igor Mammedov <imammedo@redhat.com>
Sent: Tuesday, November 3, 2020 8:57 AM
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>; mst@redhat.com <mst@redh=
at.com>; marcel.apfelbaum@gmail.com <marcel.apfelbaum@gmail.com>; pbonzini@=
redhat.com <pbonzini@redhat.com>; rth@twiddle.net <rth@twiddle.net>; ehabko=
st@redhat.com <ehabkost@redhat.com>; konrad.wilk@oracle.com <konrad.wilk@or=
acle.com>; boris.ostrovsky@oracle.com <boris.ostrovsky@oracle.com>; lersek@=
redhat.com <lersek@redhat.com>
Subject: Re: [PATCH 0/1] acpi: Implement ACPI ERST support for guests

On Mon, 26 Oct 2020 16:19:32 -0400
Eric DeVolder <eric.devolder@oracle.com> wrote:

> This changeset introduces support for the ACPI Error Record
> Serialization Table, ERST.
>
> The change to hw/acpi/meson.build simply adds in the new .c file
> for compilation.
>
> The change to hw/i386/acpi-build.c calls out the building of the
> ERST table (and also creates the associated device).
>
> The new file hw/acpi/erst.c contains the building of the ERST
> table, as well as the simple device for exchanging error records.
>
> The new file include/hw/acpi/erst.h contains associated definitions
> and declarations for ERST.
>
> The primary description of this changeset is in the patch commit
> message.
>
> NOTES: When reviewing, I would especially appreciate feedback
> on the following topics:
>
> - The hope is to have ERST always present if ACPI is enabled, however,
>   I have found it difficult to devise a method for passing the base
>   address that does not require the workaround at the bottom of
>   build_erst(). The issues I encountered are:
>   - desire to keep this is common ACPI code
>   - the device requires a qdev_new(), this needs to happen early,
>     thus the workaround in build_erst()
>   - the base address is machine/arch specific (eg ARM vs x86)
>   I've not found a nice way to thread this needle, so what I've settled
>   on is to simply lump ERST on to the CONFIG_ACPI (rather than a
>   separate CONFIG_ACPI_ERST), and the workaround at the bottom of
>   build_erst(). I suspect there is a better way for a built-in/
>   always present device. This does not support "-device acpi-erst,...".
>
> - I found a base address that "worked", but would like an address
>   that would be known to be availabe, and then to document/reserve
>   it for ERST. This takes into account that the base address can be
>   different for x86 vs ARM.
>
> - I've run this through checkpatch, and all issues addressed except
>   for the long lines in build_erst(). For readable I left the long
>   lines, but will change if asked.
>
> - What else do I need to provide?

For now, I have just several generic comments:

1. that's quite a lot code to maintain, why not use existing UEFI vars
   as pstore storage instead?
   Not sure ancient ACPI table is a way to go, with NVDIMMs around
   it probably possible to use pstores ram backend or make it work
   with nvdimms directly. The only benefit of ERST is that it should
   just work without extra configuration, but then UEFI backend
   would probably also just work.

EJD: UEFI is not available in all virtual machines types. While perhaps anc=
ient, ACPI ERST has been around for along time, and most bare metal (x86_64=
) machines implement this in BIOS.
EJD: My exposure to NVDIMM is limited, but it seems utilizing it as a stora=
ge backend to pstore would be quite difficult.

2. patch is too big to review, please split it up in smaller chunks.

EJD: Done.

3. Use of packed structures is discouraged in new ACPI code,
   see build_ghes_v2() as an example for building ACPI tables.

EJD: Done. Thanks for the pointer.

4. Maybe instead of SYSBUS device, implement it as a PCI device and
   use its BAR/control registers for pstore storage and control interface.
   It could save you headache of picking address where to map it +
   it would take care of migration part automatically, as firmware
   would do it for you and then QEMU could pickup firmware programmed
   address and put it into ERST table.

EJD: Thanks for the idea. For now I've left it as a SYSBUS device; we can r=
evisit as needed.

5. instead of dealing with file for storage directly, reuse hostmem backend
   to provide it to for your device. ex: pc-dimm. i.e. split device
   on frontend and backend

EJD: I had looked into that prior to posting v1. The entire ERST storage is=
 not memory mapped, just an exchange buffer. So the hostmem backend is not =
suitable for this purpose.


> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>
> ---
>  hw/acpi/erst.c         | 909 +++++++++++++++++++++++++++++++++++++++++++=
++++++
>  hw/acpi/meson.build    |   1 +
>  hw/i386/acpi-build.c   |   4 +
>  include/hw/acpi/erst.h |  97 ++++++
>  4 files changed, 1011 insertions(+)
>  create mode 100644 hw/acpi/erst.c
>  create mode 100644 include/hw/acpi/erst.h
>


--_000_CO1PR10MB4531BEAD0719D242FADEE8AD978F9CO1PR10MB4531namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Igor,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks for the feedback. Please see EJD: inline below.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I've posted v2 of this patch based on your feedback.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
eric<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Igor Mammedov &lt;i=
mammedo@redhat.com&gt;<br>
<b>Sent:</b> Tuesday, November 3, 2020 8:57 AM<br>
<b>To:</b> Eric DeVolder &lt;eric.devolder@oracle.com&gt;<br>
<b>Cc:</b> qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;; mst@redhat.=
com &lt;mst@redhat.com&gt;; marcel.apfelbaum@gmail.com &lt;marcel.apfelbaum=
@gmail.com&gt;; pbonzini@redhat.com &lt;pbonzini@redhat.com&gt;; rth@twiddl=
e.net &lt;rth@twiddle.net&gt;; ehabkost@redhat.com &lt;ehabkost@redhat.com&=
gt;;
 konrad.wilk@oracle.com &lt;konrad.wilk@oracle.com&gt;; boris.ostrovsky@ora=
cle.com &lt;boris.ostrovsky@oracle.com&gt;; lersek@redhat.com &lt;lersek@re=
dhat.com&gt;<br>
<b>Subject:</b> Re: [PATCH 0/1] acpi: Implement ACPI ERST support for guest=
s</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Mon, 26 Oct 2020 16:19:32 -0400<br>
Eric DeVolder &lt;eric.devolder@oracle.com&gt; wrote:<br>
<br>
&gt; This changeset introduces support for the ACPI Error Record<br>
&gt; Serialization Table, ERST.<br>
&gt; <br>
&gt; The change to hw/acpi/meson.build simply adds in the new .c file<br>
&gt; for compilation.<br>
&gt; <br>
&gt; The change to hw/i386/acpi-build.c calls out the building of the<br>
&gt; ERST table (and also creates the associated device).<br>
&gt; <br>
&gt; The new file hw/acpi/erst.c contains the building of the ERST<br>
&gt; table, as well as the simple device for exchanging error records.<br>
&gt; <br>
&gt; The new file include/hw/acpi/erst.h contains associated definitions<br=
>
&gt; and declarations for ERST.<br>
&gt; <br>
&gt; The primary description of this changeset is in the patch commit<br>
&gt; message.<br>
&gt; <br>
&gt; NOTES: When reviewing, I would especially appreciate feedback<br>
&gt; on the following topics:<br>
&gt; <br>
&gt; - The hope is to have ERST always present if ACPI is enabled, however,=
<br>
&gt;&nbsp;&nbsp; I have found it difficult to devise a method for passing t=
he base<br>
&gt;&nbsp;&nbsp; address that does not require the workaround at the bottom=
 of<br>
&gt;&nbsp;&nbsp; build_erst(). The issues I encountered are:<br>
&gt;&nbsp;&nbsp; - desire to keep this is common ACPI code<br>
&gt;&nbsp;&nbsp; - the device requires a qdev_new(), this needs to happen e=
arly,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; thus the workaround in build_erst()<br>
&gt;&nbsp;&nbsp; - the base address is machine/arch specific (eg ARM vs x86=
)<br>
&gt;&nbsp;&nbsp; I've not found a nice way to thread this needle, so what I=
've settled<br>
&gt;&nbsp;&nbsp; on is to simply lump ERST on to the CONFIG_ACPI (rather th=
an a<br>
&gt;&nbsp;&nbsp; separate CONFIG_ACPI_ERST), and the workaround at the bott=
om of<br>
&gt;&nbsp;&nbsp; build_erst(). I suspect there is a better way for a built-=
in/<br>
&gt;&nbsp;&nbsp; always present device. This does not support &quot;-device=
 acpi-erst,...&quot;.<br>
&gt; <br>
&gt; - I found a base address that &quot;worked&quot;, but would like an ad=
dress<br>
&gt;&nbsp;&nbsp; that would be known to be availabe, and then to document/r=
eserve<br>
&gt;&nbsp;&nbsp; it for ERST. This takes into account that the base address=
 can be<br>
&gt;&nbsp;&nbsp; different for x86 vs ARM.<br>
&gt; <br>
&gt; - I've run this through checkpatch, and all issues addressed except<br=
>
&gt;&nbsp;&nbsp; for the long lines in build_erst(). For readable I left th=
e long<br>
&gt;&nbsp;&nbsp; lines, but will change if asked.<br>
&gt; <br>
&gt; - What else do I need to provide?<br>
<br>
For now, I have just several generic comments:<br>
<br>
1. that's quite a lot code to maintain, why not use existing UEFI vars<br>
&nbsp;&nbsp; as pstore storage instead? <br>
&nbsp;&nbsp; Not sure ancient ACPI table is a way to go, with NVDIMMs aroun=
d<br>
&nbsp;&nbsp; it probably possible to use pstores ram backend or make it wor=
k<br>
&nbsp;&nbsp; with nvdimms directly. The only benefit of ERST is that it sho=
uld<br>
&nbsp;&nbsp; just work without extra configuration, but then UEFI backend<b=
r>
&nbsp;&nbsp; would probably also just work.</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">EJD: UEFI is not available in all virtual machines=
 types. While perhaps ancient, ACPI ERST has been around for along time, an=
d most bare metal (x86_64) machines implement this in BIOS.</div>
<div class=3D"PlainText">EJD: My exposure to NVDIMM is limited, but it seem=
s utilizing it as a storage backend to pstore would be quite difficult.<br>
</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">2. patch is too big to review, please split it up =
in smaller chunks.</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">EJD: Done.<br>
<br>
3. Use of packed structures is discouraged in new ACPI code,<br>
&nbsp;&nbsp; see build_ghes_v2() as an example for building ACPI tables.<br=
>
</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">EJD: Done. Thanks for the pointer.<br>
</div>
<div class=3D"PlainText"><br>
4. Maybe instead of SYSBUS device, implement it as a PCI device and<br>
&nbsp;&nbsp; use its BAR/control registers for pstore storage and control i=
nterface.<br>
&nbsp;&nbsp; It could save you headache of picking address where to map it =
+<br>
&nbsp;&nbsp; it would take care of migration part automatically, as firmwar=
e<br>
&nbsp;&nbsp; would do it for you and then QEMU could pickup firmware progra=
mmed<br>
&nbsp;&nbsp; address and put it into ERST table.<br>
</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">EJD: Thanks for the idea. For now I've left it as =
a SYSBUS device; we can revisit as needed.<br>
</div>
<div class=3D"PlainText"><br>
5. instead of dealing with file for storage directly, reuse hostmem backend=
<br>
&nbsp;&nbsp; to provide it to for your device. ex: pc-dimm. i.e. split devi=
ce<br>
&nbsp;&nbsp; on frontend and backend</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">EJD: I had looked into that prior to posting v1. T=
he entire ERST storage is not memory mapped, just an exchange buffer. So th=
e hostmem backend is not suitable for this purpose.<br>
<br>
<br>
&gt; Signed-off-by: Eric DeVolder &lt;eric.devolder@oracle.com&gt;<br>
&gt; <br>
&gt; ---<br>
&gt;&nbsp; hw/acpi/erst.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |=
 909 +++++++++++++++++++++++++++++++++++++++++++++++++<br>
&gt;&nbsp; hw/acpi/meson.build&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt;&nbsp; hw/i386/acpi-build.c&nbsp;&nbsp; |&nbsp;&nbsp; 4 +<br>
&gt;&nbsp; include/hw/acpi/erst.h |&nbsp; 97 ++++++<br>
&gt;&nbsp; 4 files changed, 1011 insertions(+)<br>
&gt;&nbsp; create mode 100644 hw/acpi/erst.c<br>
&gt;&nbsp; create mode 100644 include/hw/acpi/erst.h<br>
&gt; <br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO1PR10MB4531BEAD0719D242FADEE8AD978F9CO1PR10MB4531namp_--

