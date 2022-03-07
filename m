Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4313E4D036D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 16:51:14 +0100 (CET)
Received: from localhost ([::1]:51714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRFdh-0005zG-BJ
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 10:51:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nRFRF-0005vP-N4
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 10:38:21 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:38694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nRFRB-00044T-1z
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 10:38:20 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227F04jt029198; 
 Mon, 7 Mar 2022 15:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=vOcbd0u5aZK3nzEiCQR7r/2Pwt90w/Cxu3/ydBeiKY8=;
 b=SV5qW1Gnwgz2hG4AZpusmzZYAJqe1ysRV5WqywnGiBanu8tgrZ7S8m6GeFCCNiMubXUq
 RdYODxtFbSR0iHHfZ/8WgWuPFZ5OXm5+lZXMrs41z7NtA5CM10k8SRkPntBGiwVpSlQN
 iUr1Nhyka2+Ua68Ago1pfZDtfYRYKYWI8kXnqWTveLUZMvL+24SfJCmMJ8Y7XcI+MWQK
 +0CZv0TVjYJ2OoDeSDFXM/J9Wlc9W7AF7xn5HBQHyIFUIpaAS/f9FmhM/kNv1N/V5j/x
 8zQAeTJsQHYmUt2xpABLf4SYWIW4jt6ANRlxsXLwFICF3OTkMoiYDQAPcTqKHjTjRU38 kA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekyfsc4u5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 15:37:55 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 227FHVmP153173;
 Mon, 7 Mar 2022 15:37:54 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2047.outbound.protection.outlook.com [104.47.74.47])
 by userp3020.oracle.com with ESMTP id 3em1aj3r6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 15:37:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJaNnw8FOfkELz9o5lz+5B5Rfy2OPjpUvTopjjXHhV4ZlA5zMMwyZgm2K4YzNL3auolNLtV4vmS/qNsx/m/yBwMwUPvjHPOqt07TtbsxDqK2UvGRpFY65dn+IJ3e5EKlJbrpuwofU9vGhuktwlvLT6W/ye5sDxb8RXtxWWXrqlaP28e7Z78qVZiwZUj++PoUe+rJ1RkjoZ8Gf1R8BkuZY4zUfne/zC4dbwE0XSUF4uYfzRria+Ic3wemlPFAcJEe3tmN4s40VkMm1dGQCfPDBA0NhSXcqVbXic3jK8DyY0l5++H9XqkwXClOhlWJBbQXV4UhtuT+clseGTOTRzSH5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOcbd0u5aZK3nzEiCQR7r/2Pwt90w/Cxu3/ydBeiKY8=;
 b=JbzL/C/a7zDkN5DymaL6p0Sk4AZL+LwKayyLNQcKH8lTlA2ld1ufDYxYqHaDrlWfZrO8PfPAQRegjvdh5dDqPyHhKYPhDRORiKZj9DaJ99mxLWbUhZyHUAC9KAAgrqMCAytD6W6o3dScej+CWWk/iCCjLdR5LbyJ4DrUpSmm5mR8IjzqpiMEHG6iTRhleV04AzdzjYzHw1syHDg6X+meE6ctM8JYEPpV3f77eOnz/JT5HTNl1ci5AoE1SASNJ3A2gTBbUQsFMcVHU1ZlZOmaSOGpkNOfZ8IDxoy7T0Vg0qRDopfZNsnHtq/ERT8OmoWJ8AYOwu0zgHmEucQzVcS7qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOcbd0u5aZK3nzEiCQR7r/2Pwt90w/Cxu3/ydBeiKY8=;
 b=gfRxCSXyJdglJec29QPacJEDLpNqu2szSeEUzFAmb6UEo0Gq/kHzm2Nwa2Yr+4xwSjdbZQeC37VDAT0BPmpkCesI2BinB+ewbRemjMnYSjyKDONK+V1ToCia4HTVuuvHalzmHd1qbsIbQNZSFRDiIKhmxsHFq2NaMjzbx+1hWTw=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by SJ0PR10MB4766.namprd10.prod.outlook.com (2603:10b6:a03:2ac::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 15:37:51 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 15:37:51 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v6 18/19] vfio-user: handle reset of remote device
Thread-Topic: [PATCH v6 18/19] vfio-user: handle reset of remote device
Thread-Index: AQHYI8rsS0cXsT7SIku2CN/C7/Iq2Kyz53uAgABDiQA=
Date: Mon, 7 Mar 2022 15:37:51 +0000
Message-ID: <36FEEF91-B3AD-4DCB-B529-546FAF75E9DB@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <54278334564d9e9f8d2eb3ff884260ac90da44e5.1645079934.git.jag.raman@oracle.com>
 <YiXuJ2YqCZEbrsHn@stefanha-x1.localdomain>
In-Reply-To: <YiXuJ2YqCZEbrsHn@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c08ab2d-1d9d-47ae-0b43-08da005070f8
x-ms-traffictypediagnostic: SJ0PR10MB4766:EE_
x-microsoft-antispam-prvs: <SJ0PR10MB4766DBBE6F4C88E6EEBB472090089@SJ0PR10MB4766.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YsK1i1tdsGrzpFZsM8O0bCsPPCcbJfW1WZ5h8WdorHx1c6l6H8RPd46lIFPZrb0HCIoLQofauJFFchcCqv+LWMSCJHyf6qWyAfua5GKPfHbo6QIchgOT3WvFxtjZ+ece66dlOHKQqfUnv6BqmH8ZFY9C+sO1jWSeioUpQPef12nTPzZnQc+jgx/xr5Wvqovgdn9fa5tJNXeNLMB0RnWkTvocB5y6R64vk9VHsgPawM7JeELm+MJiB44O7oGLLJUvjQjULIl4c3K6+X91vK3i9HxCihaFA/wIW+/S0H3gys04i9b5EmzlYfkr8okt2HOYELalJpdJ2VlPzKRPGTPhVvp0Dy5jJEKz7+w2TuDDiShTbNT+xnLKfhQUpIX/GLFV9BJf95hOe/QWKSksTL3wNycA8UsNlPmeP1R7CcCdyQmuPFpV3kDfpTRdBUBbT2UEDFKmD9Sp6VTaPuS6DfExyEdv3eL28AeXYvTCflzJU/UGWhMwibCS6jjZIi8L3BLsxwgierH2s8yuGr+w+soCFNKhgetRjiILpaQL3wqe7jOSa114v4QldHGIm61Dlu2t8H5xJrb6KGC5Eqnmpf7Bi5bT5pT4jZUv91ozVBp/6t4lo1PV+Fcq0Kp246XOLrlBCshaPotU32h9Kh8uwuDzJH7eP4NMTvuCGWLeJaXMRXqYimrBFVMMpwS2sjVDR5pBdqWuh2GEcNVsXs7KV3+QHV7VvyrxyZ/cPYaupykk+r8ODT9V5N//7oM6Zvqyz/l3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(66946007)(66556008)(66476007)(66446008)(76116006)(8936002)(6506007)(6512007)(33656002)(53546011)(54906003)(316002)(64756008)(122000001)(186003)(2616005)(6486002)(71200400001)(508600001)(107886003)(6916009)(2906002)(86362001)(38070700005)(8676002)(4326008)(5660300002)(38100700002)(7416002)(44832011)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?B9uyHYjmoaixrNVLOSSQTHHwPI6Oh6IJmUBVq8/ZnwPXe4zgA4mO85kz/+xU?=
 =?us-ascii?Q?sP6qQRaKaENpkTtdHgHqjM3x6Zflf6v5Ndq3sDaQJirAfpj4+TOS89mZgSva?=
 =?us-ascii?Q?Ku9mZ+nnjqd/Wo1hmxHR/ejl3BekP559cz61kZvNvHul4MxOnANfpqnS1mXz?=
 =?us-ascii?Q?Ju5OxZwM/7stHD6s6sA66bqLWfJX10fzbaYhUNAy2OmGxXaknG+Ohy39GIRn?=
 =?us-ascii?Q?LfMl7c/sx6WIHBJxwswQp+T5XTr+rmAmLSQH/GGBefVVzVfX5++2X+UhTbYt?=
 =?us-ascii?Q?VXTW7b2KZo7ynd3iT2Zb7lQ8/J7nub0RwncO2CxgSxb5s0XvLujESo5ZL51v?=
 =?us-ascii?Q?d3esRRb9WXhqOA9x0BxzXhI2aZlB5VKOdFvxD3hPcZHDcJBTbl/zsGBCgW9g?=
 =?us-ascii?Q?ZTbg/F3hbcRceYik5RA6MqSfXf4JQ6h9GAPUEuZTLVpLQSsW8sWIlrrmxl3Y?=
 =?us-ascii?Q?OYT2YYCNbIQRpRGPNca3jeqxeARTV/J8V7+HfjYTnXIYiiz147psuhoQNWYj?=
 =?us-ascii?Q?NM5Cy4tEVIpwAozi7Y6ngqABWNFwwyCSu77g3/Jav28bkOYeFsL83La5qxet?=
 =?us-ascii?Q?K2SKqLk+boZ8wHUM6OPY+cUF3KIy2W3UssccV8ZvuMxqsYmip+eDoyiDQvZF?=
 =?us-ascii?Q?Z/LTMMZ035wUACwtuhSYGCbz7jlpMPbA4rvtVxgilMWugPGS18nBgVqeJIMY?=
 =?us-ascii?Q?wjgL2vIXRu38SXKHPzKwf+yF23wsT4BTiymql8+IxjSnq3OiITvYRl5X5Ve8?=
 =?us-ascii?Q?e6gTO5mXf6KG0X8dmQU1AaiBGcdtLEAz1hvU9Dbr+GtJS8aNSFAgSkzyu5Jt?=
 =?us-ascii?Q?yoWcDUaxAJ+hds4lHeDBc3VWfY5A3YA2Uo+ATKNlzJcaho3m65Xzt41vV9rk?=
 =?us-ascii?Q?Ks8HcWyM3YFRstgXYXejMw6iChZC9BrGgoNwVEPlC8g2WI9+gUb8ScOeNBe4?=
 =?us-ascii?Q?HPkhqj6mC0j0cu3Yd3m+Sa+k3gxiQyNFhSVaGzPKjpFmNLxa/YaQ5ImnLOLE?=
 =?us-ascii?Q?2/ddSgS09nrvrPBSki264kT8y5ZZdZCxRAFyRrXeSCTcZimwl9FrrfOQqM03?=
 =?us-ascii?Q?cV71O5/Vn02xI30x2bHIWgTywzSp3MId25DPqc0B+Ha9mi+prgAqMfT5j8o4?=
 =?us-ascii?Q?MKcJvC9emoe7YGY9D2m3g7YdS4GbfcqgWBJiGsD8u3+EFMEGh7kiXt903NYH?=
 =?us-ascii?Q?oRnis8vuLlzkygoxx9XQGEmXqInyrPy9il9AbnNl7BtiSVevOmr85bNDFu8N?=
 =?us-ascii?Q?NJL9yWZVm7SCmAcA2sKZ28L184ECLbm2KI9/P4tAdMKbdqZh9CKKVV8ltZpi?=
 =?us-ascii?Q?GfzgR23iA+ZDKi0llYBHkd2tan+L6jbZ/6S1sT5Xcfvd4WpFDiN1Itat9xu5?=
 =?us-ascii?Q?qElFLR3LshGPTLRlX67jRz+TZooarOvYGBIdWjpvkQC/iNvk2XIaZnTlDjuO?=
 =?us-ascii?Q?GaEY08Or0/HzRq8bau63AzLKpBr8gQU+QM8HE1Xokqf0/NIMLqLh51LJnsbW?=
 =?us-ascii?Q?3wG6rnNWtem4RnAXRNXd88vsuKhBGDdOmUFOfwMVxAP5Z9dkEEBGAWsV9OcO?=
 =?us-ascii?Q?THkyx7TleI+oIS3LaoKBzcaCSsZ3OWpPxR4vlwiWY6rQfYTa778l7KZ+gRdu?=
 =?us-ascii?Q?uBXVSmdbpSvefBCClQ5SdfCKz13CbTkhu6hB25skN8GzCgYm07RCMquUjKJl?=
 =?us-ascii?Q?920+UA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <695A10FC41EA604B91176AED4B27BEE1@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c08ab2d-1d9d-47ae-0b43-08da005070f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2022 15:37:51.8409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cUYZPz1+SAJQu/Bakv4CsNeVeqHK54E5mfwMRWjNOTLQEMPq0dLqWIIUINF0pCbXafLrxVqz5zvvOXBI041G+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4766
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10279
 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203070090
X-Proofpoint-GUID: RBh2VqV0Jx7V73Hm6DXNPKGjpv6EcMOf
X-Proofpoint-ORIG-GUID: RBh2VqV0Jx7V73Hm6DXNPKGjpv6EcMOf
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
 "f4bug@amsat.org" <f4bug@amsat.org>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Mar 7, 2022, at 6:36 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> On Thu, Feb 17, 2022 at 02:49:05AM -0500, Jagannathan Raman wrote:
>> Adds handler to reset a remote device
>>=20
>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
>> ---
>> hw/remote/vfio-user-obj.c | 19 +++++++++++++++++++
>> 1 file changed, 19 insertions(+)
>>=20
>> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
>> index 2304643003..55f1bf5e0f 100644
>> --- a/hw/remote/vfio-user-obj.c
>> +++ b/hw/remote/vfio-user-obj.c
>> @@ -989,6 +989,19 @@ static bool vfu_object_migratable(VfuObject *o)
>>     return dc->vmsd && !dc->vmsd->unmigratable;
>> }
>>=20
>> +static int vfu_object_device_reset(vfu_ctx_t *vfu_ctx, vfu_reset_type_t=
 type)
>> +{
>> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
>> +
>> +    if (type =3D=3D VFU_RESET_LOST_CONN) {
>> +        return 0;
>> +    }
>=20
> Why is a lost connection ignored? Should there be a QMP monitor event?

We handle the lost connection case in vfu_object_ctx_run(), which is in
PATCH 5 of this series. We are sending a QMP monitor event in this case.

Thank you!
--
Jag

>=20
>> +
>> +    qdev_reset_all(DEVICE(o->pci_dev));
>> +
>> +    return 0;
>> +}
>> +
>> /*
>>  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'devi=
ce'
>>  * properties. It also depends on devices instantiated in QEMU. These
>> @@ -1105,6 +1118,12 @@ static void vfu_object_init_ctx(VfuObject *o, Err=
or **errp)
>>         goto fail;
>>     }
>>=20
>> +    ret =3D vfu_setup_device_reset_cb(o->vfu_ctx, &vfu_object_device_re=
set);
>> +    if (ret < 0) {
>> +        error_setg(errp, "vfu: Failed to setup reset callback");
>> +        goto fail;
>> +    }
>> +
>>     if (!vfu_object_migratable(o)) {
>>         goto realize_ctx;
>>     }
>> --=20
>> 2.20.1
>>=20


