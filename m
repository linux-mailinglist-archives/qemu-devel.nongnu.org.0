Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9530478393
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 04:14:42 +0100 (CET)
Received: from localhost ([::1]:54860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my3hh-0005KU-EK
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 22:14:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1my3fh-0004cM-2n
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 22:12:38 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:21966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1my3fe-0003zb-AE
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 22:12:36 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BH2EEIs014963; 
 Fri, 17 Dec 2021 03:12:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=+H8FcDtCA5F7uae1ngAjvoubFVTbn3LY94mKr4XRQ5Y=;
 b=eVdagkhzX8Cy37CLuWUDLUSmwJJb/Me9p6k8w0thWYjJ1gny0vfevFnCmtjoHDzFiq2C
 EEXK0OjWDTonrGmG2V0ffOUvTrAHSbwmx1PzGmIAOMEVLKdyeAqZdgDCcUqjty8cnaZK
 SyjfzBANTx6a5mxfaadxYEObrTVzWlMlCgSCGTEJIQN9UlixKAr3628NWZp8QAB16XQ/
 y19/1EVkNlijrS7hLuoB9mr31J/omvvbAquRPs5LxZqZ5oxZqo7HEjmN9Zy+8I5e84zT
 3CEZcq45fpMXF3ts7uOrJIpGEOMiiDApK+qLpa/vt8fKu/rvkOXbN3WxV4jI6b+C22Hy /A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cykm5cqkt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Dec 2021 03:12:29 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BH3Ahnr032191;
 Fri, 17 Dec 2021 03:12:28 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
 by userp3030.oracle.com with ESMTP id 3cvh434tfb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Dec 2021 03:12:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFkIviCrIkJekmR6pmUCOV74xP00dcX68MDVTRoCDS1/9QDHh42FxIIKV+eiE1p0F0Pbi0/MnsVBkyn1Q+SZ2KAmax/q8T1YsPvtpCozRChpVkcBWpbFlIgji8lE2N3p28DxTY7yeZFQ3tbzyntwvqOurCV7SMa+zekACK8iNyaGGLjEFS1LJRyGc3qLyL+W5H9zuwuyevLrs0KOOvA7HnVlKPEN+bIfEIUV7aLlrYJhGnPUbB1vJd171cLE2ZuUmiWikkoNvYUrOxrCfxvvBgjIJ3EY2E/lbm393LA5G2lceWRWBeo8HMFDxGs80sxxTy/gwyCztVsUwlQAtN6vVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+H8FcDtCA5F7uae1ngAjvoubFVTbn3LY94mKr4XRQ5Y=;
 b=FCHR8ZbkiL+58CdH7G5SGDsgeytqlcxJgQ/mbin2fdFnPtVixQnLRgUm0kZmw3EVa8vrgLcdA+qRwLYtwkGdwh5/NMc1X/OE8OVsKVxuSeH1Mzb92RQbGw0+TwBO1iZbzAh5RI9Ks9+hR9lV9CBgxSmXEZZ2U5ZJ6EZ4P71DgxAsxMimWtT7El4jO3ZUda/ZXY2wXdJzO0n91m8gT42dfX1jvEPRTq9eykyJipSrGTuTUdCEU7g4qZwZlas1TfLn6dIbxxpjcLb/Ys4TU9oVT8o8ba9WkFXNZxANF43vN4Z4tsPAGsWccqdNThVpK8pBfML6SOjg3wRkNYrTXviyVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+H8FcDtCA5F7uae1ngAjvoubFVTbn3LY94mKr4XRQ5Y=;
 b=oUPqUYDOiCSFlzoVS+hvIOYIE323bk0ILX/++x2bObooTY/nc4qx5qfWEr4nyydbffyO6YpDs3kjYvmsySj8uBQstA/1PSEqwkbPRLOCAlyYT3A0gTQVyc+CyZZDo/PF+deREFb+yasFPbQbtxUlgxvo7Zelu8XVko0kJW89HOU=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB5041.namprd10.prod.outlook.com (2603:10b6:208:30e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 03:12:26 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%5]) with mapi id 15.20.4778.018; Fri, 17 Dec 2021
 03:12:25 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4 06/14] vfio-user: find and init PCI device
Thread-Topic: [PATCH v4 06/14] vfio-user: find and init PCI device
Thread-Index: AQHX8YApTrHk+7wDC0Sg1iU1Milq96w0734AgAEVU4A=
Date: Fri, 17 Dec 2021 03:12:25 +0000
Message-ID: <190FFFA9-EED0-4FD2-BA41-29B13FCEC719@oracle.com>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <06d8cd0be786fb6786d42c9251b37094bff813a0.1639549843.git.jag.raman@oracle.com>
 <YbsXdCYdXSm1UuHX@stefanha-x1.localdomain>
In-Reply-To: <YbsXdCYdXSm1UuHX@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4053d98b-e173-46c0-9574-08d9c10b0d1b
x-ms-traffictypediagnostic: BLAPR10MB5041:EE_
x-microsoft-antispam-prvs: <BLAPR10MB50419401107B518AEE2E8D7E90789@BLAPR10MB5041.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o12pyfCR5R9iA6ZXOkS9lbQfW3jmxefxXv9d2RH7+argDBbRUxOjlKiFxF95ghug0EktzCLXd+9ilzbONhx1JIGGXMQLWzC6qRXCeBIhUzaePe+YhqikgJzYfFsEQG7hpxX/3Gg/93YZ8O9Ik8D7pDJf5x/svV/zwXpKOmiAmq7VDfyDRfJ7rgWQIiYCPXtmd7w7sJYiOtzGyz7NPTyTeMLEX9jV/5mq39YkRdBrEin+m6PSZCMkdLFlHfJsTDguVGJ9mRyWQtnSgCBRrumBm4YQEywh8OdJK8fTWvHqOz4XD6iibKjrg9IzXwNlE7c3w6sXDYsIJXBs5BQZhuImSZ0QJUOpUHk4WjzeIcVAtFYcTRNeA4expYP4MZlv3JB8UdYywk/Tuikkm6pzK9f+aVvcPdEUyVGzaDSVGW8BSU2X40AKpvt3FkOk/Ky/1MdIGhgmK5y3O4Pm5HGYBGvGjLtP53df8ehPifRI2vghUrOLzzB4Tnr1jgrlGrgOynTQ4BcqTJnHOOumZTDVR/lSU2/YnmQk/4tU67iYh6iWIg+qf3/WlLwmp+qF4LwdmtClz7rSLvKaat7UeBh2GOMFgnua/Ny26LpolfPQ4ScRSZeUblZPlUL6xWiIs288GNqZFD5DqZASfslWkLlKACvTOvPOdq7bXksud4ZY/mV3VRJeqWD8GgdUEC1eV4E0XyyHR8+oFYkiAJfPpjLBaBIMFfa7HX436g3FV0bgaxe1dYlIPmJEwpYE+ikzb+V47VBf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(33656002)(38070700005)(53546011)(2906002)(2616005)(316002)(86362001)(54906003)(44832011)(83380400001)(6512007)(64756008)(186003)(66446008)(66556008)(6506007)(8676002)(4326008)(38100700002)(7416002)(122000001)(71200400001)(36756003)(508600001)(5660300002)(66946007)(91956017)(8936002)(66476007)(6916009)(76116006)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?VBy7Ft0VlTH0+k2I1PKfGOkM0JuI8euXQd7ZSVkq5+D0Ra37umsw9n/oo7?=
 =?iso-8859-1?Q?rQ3zZqsBjJ3jXuxEokT+7R6Gw8eqhsMzRFb0kBZCGw3mwfiiJfQSn9eh1s?=
 =?iso-8859-1?Q?Z+Z13/BFq3PRYqMcqzYpFroxNwv47sZPN0YokWXzadAmvnqNJHSaU1xjTB?=
 =?iso-8859-1?Q?a1iKZePC8i2ZEWpnqPkVruRVjS3R8k35h3Gr6cZI9NrIQpuSZqraw6RA+l?=
 =?iso-8859-1?Q?8yGnQOSZNH8h4+S8pLLrU+215rSeniL0qnUa+CuST4vaG+SOAsJfpjZxZj?=
 =?iso-8859-1?Q?9+AZx0YR6z/Tf7LfXxL7lmwDxh2ZA6Cxz3z227ifKnX0oztzCCjvGehgin?=
 =?iso-8859-1?Q?bm+gdDLJBfBYeDWVoKL77Q9DDdfSoyD5I/hS0zADvUoNSbOKJ5ybflMQBc?=
 =?iso-8859-1?Q?/2K1o+GGkpCytXoUmtvNGWlUnsry3Tu0Bl5Faq2qUjnQGOzys1pGmMLSbK?=
 =?iso-8859-1?Q?2Vw87gv9VBcahPRsje9eqyx+m6GcLywLB4ERMWFGb2JxdkMRtvh7OGvd/7?=
 =?iso-8859-1?Q?a+cn2OjdTQU77bZWw1YqT54GTO4RCFJTm5pyQo1DRomU61srdp8cSwSoMU?=
 =?iso-8859-1?Q?BstJsEtDavoJ7aZbLamUVDUv5QzlcYnCnbtL0g3vHZ3N8nRPeqstHNBOix?=
 =?iso-8859-1?Q?fmosu5Ug9uoXw9Wegglq3BKj18H4XhYUA0y7ORh2CdnMo2CguVeniuwAEV?=
 =?iso-8859-1?Q?dTp6J3K8qQNmzsMnjITMchNsYRBN25sw6ZIRGFez53/BBBn65hVKjU3/P/?=
 =?iso-8859-1?Q?ngsc/gKZQQ7NYOaHsXlph7KuNv+8u9XcFsM2s8UXnXN/bcrMgCrDfEZw6f?=
 =?iso-8859-1?Q?5Zll4+MiylDMBCFbuxEoEofP+T9G9yhjcxO9Cpks8uzdmHGg8rC5Fv65Ff?=
 =?iso-8859-1?Q?hsD4C9RTG+nbksW/z5gB5Gcd9YBre0sb+ZX1KBglEjUgs1ng0Jq5wadbDj?=
 =?iso-8859-1?Q?sw22JIkMsjmb4A3zscLh86csi9ZrfSl20z9sD2YPvYvjbd2tmY7Onet0kJ?=
 =?iso-8859-1?Q?0AfBMEpb6G1msPRJfTzcuP2uci47eNQKZ5j9zDBnNhcawnfL22SkYUfiRf?=
 =?iso-8859-1?Q?OkOvzF8Nxn1t0RoHv0366Mkthr1zRjEVj9miyK9owW09TvmlyypDo3rQww?=
 =?iso-8859-1?Q?y4L03nCLw2J20PHEYllmvjcFN0LRPw/bjEaRR83YsnTDEvjS74DKv4zWwg?=
 =?iso-8859-1?Q?Ny4yBM1eXFT1jqGNes0U8xxwr/Ox0KFF7vv2XjjkslmPJE1iy42tf3qYHu?=
 =?iso-8859-1?Q?+EOg1r5bJMR02gYHYIyRmq9ovuoYL6n3ev9e2LDCqGPiBToc9cKqdgPnNQ?=
 =?iso-8859-1?Q?eUNsIW0NLVPcSShhQiW3dyT1TQoRRrYmV7apyNVHAQ1MqaOjlFkdgpIP/D?=
 =?iso-8859-1?Q?WsxR3U/C2FbcQr8lIc2tJ+TM2lpD7GDLLzxgz2sYAI1DAtAyMMUZhZFwHt?=
 =?iso-8859-1?Q?MzqN8DffSrPsloWkK3/TErRMGJpZBAEqvH67V+p730L+aPt+uzg4gYNrqe?=
 =?iso-8859-1?Q?rBkUtLr5L2kHgPrXEeGX0HZbzu/rtu6UE+40W/y0mtl60pjxtqD8iieZx2?=
 =?iso-8859-1?Q?9JbtXEsQkoohGlRluD3SJQkpg8YUjf6dL0/MNSVIJoVpGqhx3FtnTQB7oW?=
 =?iso-8859-1?Q?Bb9netmPM2T6Uv/dzPbNDMO7tR5I+Pn632AM96VGB32+j+xb5fAKLVzlkE?=
 =?iso-8859-1?Q?3dwr1D07rU6Lq3aAjU3jQ4qb/4cd7CLJkqddTruxvaRA5JwaPD+THYVG8c?=
 =?iso-8859-1?Q?TLOA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <8E27A15577229D47801BE984E592645C@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4053d98b-e173-46c0-9574-08d9c10b0d1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 03:12:25.7098 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GDcpaE+kNhU6dhc10M3IGf7/qet/XIQqS63A4vsDFwOP7/PKbZKkK3P/W5fEC+lXTJ5pdQowefNHxFf5gMNmmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5041
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10200
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112170015
X-Proofpoint-GUID: KC3fVD8yOh6uVX0IShoU7FwculbuOzTJ
X-Proofpoint-ORIG-GUID: KC3fVD8yOh6uVX0IShoU7FwculbuOzTJ
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "bleal@redhat.com" <bleal@redhat.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "wainersm@redhat.com" <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@gmail.com>,
 "crosa@redhat.com" <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Dec 16, 2021, at 5:39 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> On Wed, Dec 15, 2021 at 10:35:30AM -0500, Jagannathan Raman wrote:
>> @@ -150,6 +157,38 @@ static void vfu_object_init_ctx(VfuObject *o, Error=
 **errp)
>> +    o->pci_dev =3D PCI_DEVICE(dev);
> ...
>> @@ -190,6 +229,8 @@ static void vfu_object_finalize(Object *obj)
>>=20
>>     o->device =3D NULL;
>>=20
>> +    o->pci_dev =3D NULL;
>=20
> We need to consider how this interacts with device_del hot unplug.
> o->pci_dev is a pointer and we don't hold a refcount, so I think
> o->pci_dev could disappear at any moment.
>=20
> A pair of object_ref/unref(OBJECT(o->pci_dev)) calls would not be enough
> because device_del will still unrealize the device that's in use by the
> vfio-user server.
>=20
> I suggest adding a check to qdev_unplug() that prevents unplug when the
> device is in use by the vfio-user server. That's similar to the code in
> that function for preventing unplug during migration.
>=20
> One way to do that is by adding a new API:
>=20
>  /*
>   * Register an Error that is raised when unplug is attempted on a
>   * device. If another blocker has already been registered then that
>   * Error may be raised during unplug instead.
>   *
>   * qdev_del_unplug_blocker() must be called to remove this blocker.
>   */
>  void qdev_add_unplug_blocker(DeviceState *dev, Error *blocker);
>=20
>  /*
>   * Deregister an Error that was previously registered with
>   * qdev_add_unplug_blocker().
>   */
>  void qdev_del_unplug_blocker(DeviceState *dev, Error *blocker);
>=20
> The vfio-user server then needs to add an Error *unplug_blocker field to
> VfuObject and call qdev_add/del_unplug_blocker() on the PCI device.
>=20
> From a user perspective this means that device_del fails with "Device
> currently in use by vfio-user server '%s'".

OK sounds good, will add the above unplug blocker API for PCI devices.

Thank you!
--
Jag

>=20
> Stefan


