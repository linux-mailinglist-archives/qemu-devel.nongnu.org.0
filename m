Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 529094C78C7
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 20:25:41 +0100 (CET)
Received: from localhost ([::1]:36446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOleO-00049s-Bj
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 14:25:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nOlcQ-0002mG-61
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:23:38 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:13752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nOlcO-0003Pb-KV
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:23:37 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21SIJ4iY018802; 
 Mon, 28 Feb 2022 19:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=vRrm048ltXxmRsPY4LB19Tq39jy39n8vhw+FtKDfHXY=;
 b=uBp/NdfPSiWVabClVtPoI8AFFGXm24wcNnmNvp/jGkd+jmZ08+kmDT2negJNeE8rEJ5U
 WAgT77J23e6/vEwVREIL0Es7iWmsNKCya9xzy4EAL3NVXGZUJy9iY9at1mUtAJecSXXV
 3DF1f0AmpDcQbELT8marGNhBz7rxhm0xbn6AKy2HZnWdOIFcoo+6AteomMgY8SVowCEK
 aRHKcLt+j5C0Ifs3qZKKEi3NRFbCRJDBeWCDiGNwhTNIkqzhLz/mZhXuOayo8OlJ+HGe
 Yq+HD0cXfqMR0yd5ULVHUsv8b6s8z3j4v/UWCjXenNBCzAfA3XwZLeZSD/BdsAxNK2a3 Vw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3efbttd9he-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 19:23:33 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21SJFQ6d015778;
 Mon, 28 Feb 2022 19:23:32 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by aserp3030.oracle.com with ESMTP id 3efa8cx4fw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 19:23:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6VzEMKOhmOFItxqKijaVgZoSSVUlANnH1mbGL2RzUZiHTK0B4Q9afAZrtykSKSJ3TekoRfx5C40QX8kTIcAFv4CG5kIkdOhcDnUBeKB0C7yL5M+P/f8OgXIX7O31Ch/A6r0YZbq8B20r3PPs8SliniX4PkvnvvDSlFHDPfwFJ6iuDsyXjZtYuwJ3aAVv8NJmBcKPmJTTJIzpT4PJ1xho2wssdqTszwpKS6pkHIGJDPnZWoxgUlV0o+yIy6J9B2coVKJGHplONauivSOATZpG3AUqjUVMyNPDw+C4g9XvMaxSco55fU+I1I4Hl/9z+0bNqTHxmHpnpQv8VR21wzk+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRrm048ltXxmRsPY4LB19Tq39jy39n8vhw+FtKDfHXY=;
 b=cVkmzXqhY633Ot1YLexxdghZXqC5S9zGJnSzL3Ym4ZrGOkJe1EtpO9JaVggA4o6AE3Abxuw0XdzEY1N0yf3mHSFdHjFRDcgkqYPP5L3oFH5MnROOyXE4UAoz5AGC6OlXr0uSXJP6/Rf7FiCNFLF6bWH01cCZFwAWw036I09EmzSl0apVNVJV2ozHX+Q1Z5QKJ8J1ZCY8m7n2dMWcpVhq4bHyBSaNKqbDSv3tCbkAbS9c/Y/sRYXv+xAn6dEx907GJdD1UpRKp88HdoXBBTOBzrh0EwfqOd7rDzAm+xWmhWsJpJYe7FVB9aNxZ5ZiV6fvYydFtpctkMPjEzwuFyNYMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRrm048ltXxmRsPY4LB19Tq39jy39n8vhw+FtKDfHXY=;
 b=Q6HvRVyFaZMFCL98aH48tTvpfvIilQ2nsqKlO1XUjVUVRN3td0IgNVumDCa0ka3AH4A8y1rrCmfX+F3xnOcFRWa1IGHolsxea1Sbf2f1nvjzBj0c2/voYer4dzk+o157J2gZiJ+oAOQ9BLRXMEIDHH4XX702Yf9LCv7YET5k4kc=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN6PR10MB1778.namprd10.prod.outlook.com (2603:10b6:405:9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Mon, 28 Feb
 2022 19:23:30 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%4]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 19:23:30 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v6 11/19] vfio-user: handle PCI config space accesses
Thread-Topic: [PATCH v6 11/19] vfio-user: handle PCI config space accesses
Thread-Index: AQHYI8rp225EONBtOkq3jmdu7DTr1KyfcdAAgAn37oA=
Date: Mon, 28 Feb 2022 19:23:30 +0000
Message-ID: <EAE9749E-EF85-4F7A-9CB4-6EBE3705DAAD@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <435dad76ebf552f1b155c8ebb2becdefdb9edd10.1645079934.git.jag.raman@oracle.com>
 <YhTEehuOC5SXXBA9@stefanha-x1.localdomain>
In-Reply-To: <YhTEehuOC5SXXBA9@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eadbd408-65d9-4057-62c0-08d9faefcd9b
x-ms-traffictypediagnostic: BN6PR10MB1778:EE_
x-microsoft-antispam-prvs: <BN6PR10MB177841B90BA63CFA6564EBF290019@BN6PR10MB1778.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qPqHKpf8h9zDvZeuzmGiCfVWuJwp5roVfVcqbuyyRBJ7AkY9gtyPsp4xM6ElAPF3qIZMhugPXnRuu/LtjW3wbFh834YbaAyo24XsKAQ3IgswOJCio0FIqM9WDwdk8oAHgr7OK12y5/ZB39DkN3u6Gj7dBTkpPldwbl9E4fMEmhRy5mrp36Q/NHG/FmxFXPAEpk4j7Yxx+8txE94EMDhH18z2EAiqAXKlUkTk95qP4OPMF4piVrPvNdQ5HzYA8OKSwV0quhH1u2pI/GfdAyP+tJG30wJtSnfa7T1LJDOxJ3mDSwwoONL5SLdPz2Bi4DdGvBNkBLNBYPFhtNzWduTmREyX4zsmA1Iit7RGCidzBVVF5a4Bmk2O2TfoVZj1W77LclnWgJOqq6rx3EWv2r9jU41VhOFRg0BjzE97LmypNMnl+WUsNFUOLfVXT+5v7b/6UU6h/ZvLDX0dAjKEfwCvMwv9ZFhrx+rP5KhViKr2NwRq+ST+7cPtJ5nRV2rnYVmpfH6TwzkCx+NM4L1RfUYwHCmFLyw28TsdwYSwhm6SLi23/8oD+gBcObWxZsICzXz6A8vJdJY8BykF4wNbHjVDISqEpubwygnY3hJg+eRqNVtLOyUiXx2dyueP7DDK3v+jcrVN/aFxfK1UX+U7y5CFFADplEXomUUSFuHM8T7tspwezLB0TPbI7UbW+kQFwDk5xUhcIaIqy83KwuIHlQ5YJBao055/X6R3C+sebPEtV8GlZqyU5g0ZJdYNhqQ4iaOP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(186003)(107886003)(6506007)(6512007)(53546011)(71200400001)(508600001)(6486002)(6916009)(54906003)(2616005)(66476007)(64756008)(66946007)(66556008)(76116006)(8676002)(66446008)(44832011)(8936002)(4326008)(7416002)(5660300002)(2906002)(122000001)(4744005)(316002)(36756003)(33656002)(38070700005)(86362001)(38100700002)(91956017)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?5dral8GOrJpqrM3aeVsK8+dslxmZv4hh+xnFqMlJboQz9kxKm5Cgh3YzFz?=
 =?iso-8859-1?Q?f+8YuKFeLp2Ke2HbAN6FPM+dz7cRL7SIWMVh39luP8DJTls18uPVP+mJax?=
 =?iso-8859-1?Q?YJsn5NE53e9ikSLt4lZpotybL+1LdOHd3R9ZJ/k/IA9TToHppNDkrbzMBB?=
 =?iso-8859-1?Q?HSu3/TKlPkfeWZF3289ngApLbXZroni2vjeqzWVwm2Y0phdq4A1Q/26sCt?=
 =?iso-8859-1?Q?a8Ag8P2qyPUBYNKT2LpDsuFWn5PbaXm/CEmdHJEdHmO/8FiBqkspdXebUZ?=
 =?iso-8859-1?Q?tcEdcKJpD1bIN3EwjH5LwI6LMD9HnSd+91sLnCzi7ms267NVjJ10V784GA?=
 =?iso-8859-1?Q?rLAkDcMJxFaYkkibxUgdfmami5J5hPYdh+E2zj3qnIOjUyaPa/plZDUIxP?=
 =?iso-8859-1?Q?HhRl4YDTVrvkfb+PA0pdn9obY2SLmo1cdquzlYYZsDRgso+t/NagMBdTze?=
 =?iso-8859-1?Q?TCfiDj7sPxavUzU4dP4srlT2tCp3XUVc6KN4hKmWR7amUeaoNgAral7VGa?=
 =?iso-8859-1?Q?klkfGuOO0wG+0oFJnbzJZRJUJNLn921wTIi1X4OL9OdrS/OWX/YWAxT/Yf?=
 =?iso-8859-1?Q?XlsG6av1qXjiO7NoYar9fPDrMOCxPWVuc0UIZ2ZkqJvhAOuvcUrdBtnTJn?=
 =?iso-8859-1?Q?RunDmxh/S1PVFDcaHn9vByEBPRsJ/bn0Eww+HGkFLtdPfvK7undWH2eZ9X?=
 =?iso-8859-1?Q?3KNwRkW1NkDoXXsdYm1ZNe8ZNREgU0kfYNTq8dv7GDUb2GNlGsYInZJcBA?=
 =?iso-8859-1?Q?268IAaQFjCSoxULgWmxGsnn9XmDcgStGd3okmq7sxkUiOlui715ssFzgsp?=
 =?iso-8859-1?Q?Qn1NKZxCJ9qmGwRPn1ffBs6QW3JwOoZmuqOFqsLd8cMv/Jx2ml7nIgHPgg?=
 =?iso-8859-1?Q?1DHHfXBafvgV7xFtdEtma68QzTk7mcBtuGP2h5F7dibMDH56zsMXWIGGMY?=
 =?iso-8859-1?Q?u7gGaXekWiv//edlukmGS+N7CPLs45FxQU8Tbtpgv6NbjSnI0htOJZx9x6?=
 =?iso-8859-1?Q?rmRyDtmRAaYiF9vscfDJf82zVpA/B6FJGDwQQ48cr0U9tDBM5wOng10vv4?=
 =?iso-8859-1?Q?jOjN+FzCiMlmWYC0Vrs6ZRJ97GIxHtX8BsrB/Yghxf0lLlzspENNcTRrHa?=
 =?iso-8859-1?Q?NGY9bC5t0ldm0ilZFX7xqZBeAIue98UoPu3KTqAWliQU6DjBpn7FcXS9vp?=
 =?iso-8859-1?Q?hCfKp2x3OjDpDICPeJjXdKUSKOIbfae0I26oh5oEHfytRcptSJK4xo9W/7?=
 =?iso-8859-1?Q?yQ4zes6xL6DtkjFI6EhwVB3NA0UqDKpm7Z7xmJUUj0zMV0352hy7uGyAiC?=
 =?iso-8859-1?Q?s7E9STqp8C/Z5g+SZCpvP0hAn5UHpBVq398+AaC7+/4JOENHxUi34LvXZa?=
 =?iso-8859-1?Q?P8AFn6aMxMGmoCW4hCsW6AQFrAnfwVKhF1E1bZLwn4F0oVHIcYmcoFl/dR?=
 =?iso-8859-1?Q?YQVrvKTPEu5TLtG7GVOp4F3U/qwQomzG5ig2a3d5VUrTE3GGXdGUquUkk6?=
 =?iso-8859-1?Q?d+XohoC1F9TOgfeDSJugwaEfaNwB+omnbjlS/HJkRNvaC+xTj030jJIDbL?=
 =?iso-8859-1?Q?g48nEhhnVoRjZriUjsWUPrSjLL0n1z62K366driN4OvlWr4De5zniC5jVZ?=
 =?iso-8859-1?Q?82WTAmSByC1VwH3nFdDdtbhkgiPUL0Kie6VMHbOSlZemMBP3BL1kX8xJ6Z?=
 =?iso-8859-1?Q?MIy/cTHX3FY6NdPIbzdfqxhUIvOSH2X6KNkJemf4YEDwY7zrftmi5hRhiQ?=
 =?iso-8859-1?Q?n/lw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B689FA7F05630F4AA7BEEBF4FACE3BB6@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eadbd408-65d9-4057-62c0-08d9faefcd9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 19:23:30.2182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uwADdZ4LY5rQj/LRtrpcEU/R6hk8bunqiJhEwhUpY94YDiD6Teri/hQdRl3on00YXLAIlHiSX6/M7rIpu+4hLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1778
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10272
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 phishscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202280095
X-Proofpoint-GUID: q8V9tAtbEnQQ2n3rgx39L6WVVi1rNVUz
X-Proofpoint-ORIG-GUID: q8V9tAtbEnQQ2n3rgx39L6WVVi1rNVUz
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Feb 22, 2022, at 6:09 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> On Thu, Feb 17, 2022 at 02:48:58AM -0500, Jagannathan Raman wrote:
>> Define and register handlers for PCI config space accesses
>>=20
>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>> hw/remote/vfio-user-obj.c | 45 +++++++++++++++++++++++++++++++++++++++
>> hw/remote/trace-events    |  2 ++
>> 2 files changed, 47 insertions(+)
>=20
> hw/pci/pci.c:pci_update_mappings() will unmap/map BARs when the
> vfio-user client touches BARs. Please add a comment that the remote
> machine type never dispatches memory accesses in the global memory addres=
s
> space and therefore we don't care that multiple remote devices may set
> up conflicting Memory and I/O Space BARs.

OK, will do.

Thank you!
--
Jag


