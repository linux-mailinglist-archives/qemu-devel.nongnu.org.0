Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760FC4794AF
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 20:17:17 +0100 (CET)
Received: from localhost ([::1]:59078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myIjE-0005OJ-5O
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 14:17:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1myIeL-00024j-O0
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 14:12:15 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:52500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1myIeI-0006Zp-NT
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 14:12:13 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BHGXtaY027778; 
 Fri, 17 Dec 2021 19:12:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=cixZeqXccbBYKg/gZaTPHT2WA+qW0YFTZLgng4fwLPw=;
 b=wThcq+MB1YDsMY84e4ctEk7l5OkjxPg5BxU6PB+E2aZaViG87ShihzN/YCpzxQ7LWy4E
 DjLipBeJp8GO/TsWTfrAEq3gbOkmVV95rIBUQx3B5oAugPDNd2+L1QgQq7yiK/Fud6CJ
 Cq8aw0pb2JKYfO65lU09B8+i6i26k/SEwNBoOOJLpzgPBEsgM9Qii43KI1yIAY/5mhbp
 jYsvffKi3oxvUQr8sbDsj1eH+Dg5wXnhIHYn3YhubUEL7FiI+TlbIV9Trzj9jAtLDEcx
 0qccS+qDGsyLDiDJ1878G3T6686AN7NtLOpWu+Pjn3vO/ofdb7xmjDzZlPVmG5RgPtMT xg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cykmbpm39-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Dec 2021 19:12:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BHJ5wEc133954;
 Fri, 17 Dec 2021 19:12:07 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by userp3020.oracle.com with ESMTP id 3cvnevws01-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Dec 2021 19:12:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhWjamdOKGoMcDDeX9Hhlt2XVhvNbjWIs1wr/n3+fkl+TpGWcu/ln2F8TNbLlh0DVsccFUtEJrXJ7k02KBTpK4HJmdq86pPVG0LbVuwXxS2i+zwnb3OcPSRoJMIRpPenou/p/ufM3FW+m8sEJg7uvaSuLkDp82NlN9Yivd1pepp8rc3W2PR7vyDgf2KMeOJ15Lr2c0BxXayihWsI6EUs5hb+mS411gMnBDGdapoAviosFhvoqufkYpE3xk00oJyxmG7GucxNntIGt/RTU9bqsEG6UyCTsQ3bsXwcdMilJNcujYA4p3hFUUPwL2yhIimowRzOx7DyzGsemzOuyojMsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cixZeqXccbBYKg/gZaTPHT2WA+qW0YFTZLgng4fwLPw=;
 b=BBvE32sUKUAk6aHdUckNCKD2Jsp+rzps8NCSLjGTn5H/eBNVAkT/cFBJDvLeyaC5gI52CLqRdNF8L4yPh1yyChblSojtMjVhkTMv8r//er6Rz0NKJSTgxqm4K1TAEAT+mGBK7yAI2/IkHCvGnLZyMy/Br/scwFR9lPmZThCDZM4h/6h44t0kZkREAjp+NsvWecAUITLBoDMp9JejjX2mKFcDtMKllOdQKUEq4GQdY6QSxwYdDZ96KuMXmQM8X+qM73dUKceuqqIAb2JXgHz29HQ441gsM0W/+/SI/4T6e2fGMDhIXOwXKW/PXTpCJZDXeFMx2vwPtTLiJiRXv4e7rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cixZeqXccbBYKg/gZaTPHT2WA+qW0YFTZLgng4fwLPw=;
 b=gGidQmp9m4roGvzUBbORcqFUwRHJem12rVzc27n1S/P/W9DMC1cmKmsAMnZsmAbke5tSLfbDmzWfc0gZK/3UXMosSx0E3uXGa857BoYZXywOwO+DNSMY8rchQgeqSylrSD/yRLDFH2ntvMgqA3V+qpZlyZ1JpNirkWy7zomTH7M=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB5284.namprd10.prod.outlook.com (2603:10b6:208:333::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Fri, 17 Dec
 2021 19:12:05 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%5]) with mapi id 15.20.4778.018; Fri, 17 Dec 2021
 19:12:05 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4 10/14] vfio-user: handle PCI BAR accesses
Thread-Topic: [PATCH v4 10/14] vfio-user: handle PCI BAR accesses
Thread-Index: AQHX8YArDG1jq5m12EiUzADvaZvXRKw1KnQAgAHmgIA=
Date: Fri, 17 Dec 2021 19:12:05 +0000
Message-ID: <B5C384A5-625B-43CA-826B-04D151AF0F55@oracle.com>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <da25f11aa2c7f4aeb2eec3d6930e491051794ecf.1639549843.git.jag.raman@oracle.com>
 <YbtI6t3xdLaXFmJc@stefanha-x1.localdomain>
In-Reply-To: <YbtI6t3xdLaXFmJc@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 433d96ae-4fa7-4043-c3d7-08d9c1911d44
x-ms-traffictypediagnostic: BLAPR10MB5284:EE_
x-microsoft-antispam-prvs: <BLAPR10MB5284F35CE03B0A60C46E705190789@BLAPR10MB5284.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 28FIMkI4zYmaaoazSBrIPAwi95zy5il6r2E51yEghc5rFE6yEXczejQkYH7LLS1ENhnxEeQv7Z0hCB7aEm1qbWpZTdkTK3V1/G9okGwOF1Pyna+nOHdx39T7AV4XEP+soTbJJHSn3xMDP0EMsWQ58NEqcSk7q4fR43XtTBvDeOAVC8wKE3K+Zt8gFI0VrmkO/HCthCQJgYCg1J6y6UW7m1CvN5jI/IfoeWiHyCox9SzoFgfKmEFtoLfRjv4KCT/dIvVFiZSOhrojpWtS4LMEEcliq69Iy9F9dgF2xRrYLcEUSAYHCLiTXsIpITvZu1L/3QAwMwJxaSJenoR8OqYVKb6oECetovngM+6Jr+BUadQTD8xLnzRGugsXRr4IFlIPDkH5Oj1Z5ehRO+LTafmfS/FgF7ZjkjNgyYBWu/glZB227OHhYzwWxlIm4zHaSKVUgct3LwFNctnP2tMSU9XnDpoqpGDKh2aBXCuLIXvV+1UfSm2rAPbutANQk8mvzA5TA8z6gCM8fBD1gEqcNVJVJSg20q0O39vyKnUr5DOj/uckR808NqCoO7XgE7rkEM2TAj7EX8gKwYIhs7vMedO1pr2BKA1lSdpIK7zse57KKkH9HYw3vQXcZjedyDxxqYH56LOO9o43OFtczdV43dwakGCZxAqpMr33GzAE0k8SI7Ywlc8+JLqcy/EfX5V6m29xQAVcOuqR4Xw5Lpp6ePccSGK6vwKB1O43EZYbKDzbagBsRxBy9HvGDUHDkmWY4N6+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(6486002)(8936002)(7416002)(71200400001)(83380400001)(6916009)(33656002)(66476007)(64756008)(66556008)(66446008)(36756003)(5660300002)(6512007)(76116006)(54906003)(66946007)(86362001)(186003)(6506007)(2616005)(2906002)(53546011)(44832011)(316002)(4744005)(4326008)(122000001)(91956017)(8676002)(508600001)(38100700002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?3Vl/oEqQuYyZN7/DGATbnxlFdaXeVJ04XckNSvDZktJ/yUx2Nx2CyXxCCo?=
 =?iso-8859-1?Q?Be8KTORp1XY/VkZ68raYl4/gsiw6687IigTOx5AY5Xzma1vlwC/dPfrtv9?=
 =?iso-8859-1?Q?NxSCzSEB7Up4m8E9JTK0g3Ijlezcl3SpS/Fu749f/wiFGCA2T6Vga7yl1e?=
 =?iso-8859-1?Q?lyZMi0BvgQQcHCFxHdpKoen1IyM9KiArdHY9aFa6sVElgAr6Hp1JuueeaJ?=
 =?iso-8859-1?Q?zbhNF+Xx9edhs5qcWfFU2L6AzcW/nSGkAkHSPSLw5+JMVyIK4aEW76v3eo?=
 =?iso-8859-1?Q?vszQWKvhnDTcSkSK+T1UbgtQuBPr9wMT0HXUvMaXnUqPY5Na3w2tI/O5qt?=
 =?iso-8859-1?Q?qT7/XhFKmo2O2UGZj9sUjONFPEPa42IGJ2iLGAvFjTSy71RybIU1vKZEoF?=
 =?iso-8859-1?Q?85nSsIiUEzO+Dc8tyCEG3X+NI139etMIF+IddYJJvsEDLnF7w799wVGQ1L?=
 =?iso-8859-1?Q?3TKr4TKEZqtFtn6LZKr4iuVjlQZyvz59rsdYLehi8Wxq7v62sP5eFuKt67?=
 =?iso-8859-1?Q?pte3U3SKC9nBn/nXZFLJKurIOWxbmwQ+EmRtkryQU1m7pONHblNSbdss+Z?=
 =?iso-8859-1?Q?UJ+KpOTLgTX1Qg/+9I6ByhitogZ8KeAiFGysM07qmqqucxroESoZwmonTL?=
 =?iso-8859-1?Q?ZNgjVoCsHj3tLwehZVsSx4k2eo9wBVSlMqJvCQSJkRcczUrKV9r+pQr/FY?=
 =?iso-8859-1?Q?p0WiYqtcSTlTnnUPiuaIkS3pBj7dHPWIEtDeCbJdBMI/F08hyyC7hvJGWm?=
 =?iso-8859-1?Q?mQ/vvHS5Y+6ywVvAoWzw1br4fufsdyeMcHAcTrnh7RPjPPwwq6HSVWXoHl?=
 =?iso-8859-1?Q?oNkf2ZrrjqtJIjF/XBGnIPr8vNhwfNt4DrkiiSpxqhs1rCrgMX0OkicCsH?=
 =?iso-8859-1?Q?ZTsrREeqA8mVF82NjGiLr6k4MAE7qJwnOxXQrLo7Quhuh+UhpUaJz6KtJI?=
 =?iso-8859-1?Q?13kuKQ2Hf+0AjNUBIHerqvTIKyaSqj73UrSMwqwIlnBtPZlbj8I6muMj//?=
 =?iso-8859-1?Q?rCWU6gWNzmKF+tmvi0AlPsQ2odQ6/yJ5zQ19SWMTFPQqpM+A+HjrEIZYn6?=
 =?iso-8859-1?Q?tTJPIdvNmwXVKqxPd+EH2Y5zhXps6c7Ud+9//wFnbb3EWGdlRdyT1wgl7S?=
 =?iso-8859-1?Q?v5w/rRGCuqbRiRhpisg0/ZqvwRI37XAFHiiLoWj7IBu90zz0k8pg9AwVL2?=
 =?iso-8859-1?Q?at5nemJF+qocerNZEEh9LSjwkICtJZG83yWDks3/58JFKty1QlbMVpPz9X?=
 =?iso-8859-1?Q?n7bCNM930zzU/Mpa37v8pJH302qJpbBaoX9sYqpUXlyKAwYsn1vXH3RDGw?=
 =?iso-8859-1?Q?2/bcy+hbrkMwBrs+ZN8rQNY58vjTub8k+HPavET+GPh0goojxCUgE1eJef?=
 =?iso-8859-1?Q?Z4NbNowPs6jizlSzcIx4pWdQ1rSYJh0Rj0T5uNtvaEtGNDjVfthurtSmyR?=
 =?iso-8859-1?Q?gP/xvGPQi1cLh7bJrPeQk186EO4PISfgzDEnnuU1qiPnqYB1tzvHmFEww/?=
 =?iso-8859-1?Q?Jf17izs3gP3TWcLADd/yhWWjU+LzQ+uZK+4o+AVl9Zg+zDIPC7A6pVd4QR?=
 =?iso-8859-1?Q?omkxV1AlIGOe4OExkycWAB22cfHRmGrIRxTHP1viGSE9xCH+JcVwO/NCZ4?=
 =?iso-8859-1?Q?pxXxwFBizOUL4iRYoj7l+fIb4soakK0toqu1m532nw511HUFFbfAfpKgdJ?=
 =?iso-8859-1?Q?+OcM/rruX7lI2M32VvRUn5Tq/xH733JXgFZgS/hESv0UJI1ZkXAzD2P7zT?=
 =?iso-8859-1?Q?Qn+A=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <24B627515711EC40BD697B759CE0C621@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 433d96ae-4fa7-4043-c3d7-08d9c1911d44
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2021 19:12:05.4787 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: an5L6hxjuSQhqLwkB2JREga4eDycOjoZiLtFFXIx9rcCqDFeUmcYKcgHor2aOmV/aWVGzZ7tyDgQRa3gMeqe1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5284
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10201
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112170109
X-Proofpoint-ORIG-GUID: CLRtx7mSZfedybY424K33sek_s5oacRq
X-Proofpoint-GUID: CLRtx7mSZfedybY424K33sek_s5oacRq
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 "crosa@redhat.com" <crosa@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Dec 16, 2021, at 9:10 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> On Wed, Dec 15, 2021 at 10:35:34AM -0500, Jagannathan Raman wrote:
>> +static ssize_t vfu_object_bar_rw(PCIDevice *pci_dev, hwaddr addr, size_=
t count,
>> +                                 char * const buf, const bool is_write,
>> +                                 bool is_io)
>> +{
>> +    AddressSpace *as =3D NULL;
>> +    MemTxResult res;
>> +
>> +    if (is_io) {
>> +        as =3D &address_space_io;
>> +    } else {
>> +        as =3D pci_device_iommu_address_space(pci_dev);
>=20
> This access is not initiated by the device, it's coming from the CPU. It
> shouldn't go through the IOMMU address space.

Got it, thank you!
--
Jag


