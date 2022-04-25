Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F27D50E76B
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 19:38:16 +0200 (CEST)
Received: from localhost ([::1]:35944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj2f9-0005UG-Ev
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 13:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nj2dj-00049E-TK
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 13:36:49 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:64818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nj2df-0002VT-QA
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 13:36:47 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23PGRFob022547;
 Mon, 25 Apr 2022 17:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=+MQubyDNZaebPhNjQwgY+WuoEQLBjo/XrgzHB/1EfHk=;
 b=d7mEj6cylDfQClS3VytzdMBpbNw2kwPgvnDQlbGgokTDndIjKDyp2essVUZYrzQ9RXOl
 1C5vAmSw4aME3Mr7/ie6iIyvUvFRWMftWX/uuIdQC0cncJ0c1NAy3lCyRUiXmRTyLNi7
 NDcq08S0b+ityTbWuo20Z9vWBxBubm84r8tqkXgnKbcMxFZAW7qCNlmZeCuAt1RUzuzA
 TypaUUw0zx/ytilhB/hzzpxDFBAqXjQ2Reb5yGk9cSX/AmU53mTIIREVAEIBtwvGk0s4
 etpql6Q4b7JCBcOonvIJSZ6oKFV/vTL31HhRg7QhZcCF6q2YxP1ROmlVVGXLeMt9J3qQ yA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmb0yut21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Apr 2022 17:36:16 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23PHW5tx039466; Mon, 25 Apr 2022 17:36:15 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fm7w2kf4e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Apr 2022 17:36:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BIMSnCpwq0AUZdx2/YeERIUZu2VaT+izy8bgjRUmwu8Aw+zLy4mIYxYQ60nPYr9qc9bkpVOGCG8enI1gQAz+SgFIHhopJzqu6fOdDgS5gc64mQEXNghdK0ccKtm0PLiOB/BZ7uF2Z4QO7A533uNPij+E42loV81QLg+a5dV6GPpTZHCz9QGAKWRcbd8MLbMDl5pBb5BW/Nrr+pd8yCGdQnyiMP/ES3C9domSQaBnNpmx2zCyBAmopESwsngCI7nY7VXIEcm24L9XuobzvIvc3w5TW2jguiKUaSS7Djo7TeA+BGI8cikQPSmPwPDnXQ5EUUMEfbLxwPoTy89nvh5ZlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+MQubyDNZaebPhNjQwgY+WuoEQLBjo/XrgzHB/1EfHk=;
 b=BYBfeR2qAMptLhNkciwIsg11Y9z/sUtmQNy6BMLySbOHP02d4psIbqE9hip9Oq72kYVvlr+9Sa+VgSOIoCxuGlKolwApOHToBPPpfBazpAk8bY6QdDjV6BX30iaG0BdaEDSmIUBSZymFbcLVlNcIRT3Mx4FIgRFvaMTOlZ847w/ICH7LxQXIu+CkDa8WY1OSYwbIT4e9DPQA0xQC8GjvxkR3OllsetG1qMO2Kuwj8ekxHhkJDhh3OwKGp7VUBTRtv+GtxeztMkaZqI/vdNkVzwok+H7LCciPbNeKewW7vnubIsaKTl55VK7U1OqRTKLiUpmyxpDOwsDzchwW9Pq9Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+MQubyDNZaebPhNjQwgY+WuoEQLBjo/XrgzHB/1EfHk=;
 b=o39eMdI7CBd2VvnLZcuIde5oEV4Ld1RB6ziJ9lWwqLo0SdtgS/zxO3rKXOe21dC47v7HfMSmT4SyNhqGwLfLiYVFcLuYw0Bgur/DjjSorhRrySqDa6KgRAt2AbP4+0puHL3P+1bZ8Svgk8WscXAkShj8cOxKgHbcuT3UATErzGY=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB1838.namprd10.prod.outlook.com (2603:10b6:300:10a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Mon, 25 Apr
 2022 17:36:13 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 17:36:13 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v8 14/17] vfio-user: handle PCI BAR accesses
Thread-Topic: [PATCH v8 14/17] vfio-user: handle PCI BAR accesses
Thread-Index: AQHYVC5magW/6Z20zEmses6kBCxuiq0Ab5EAgAB9+wA=
Date: Mon, 25 Apr 2022 17:36:13 +0000
Message-ID: <AB49E082-DACA-40F7-BBD1-3446B64A9CDE@oracle.com>
References: <cover.1650379269.git.jag.raman@oracle.com>
 <b01b6963d6d342aac6d715aa83695e7998826223.1650379269.git.jag.raman@oracle.com>
 <YmZyXrJWloInu5mo@stefanha-x1.localdomain>
In-Reply-To: <YmZyXrJWloInu5mo@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f823c89a-bd60-4cb4-0e7a-08da26e217d5
x-ms-traffictypediagnostic: MWHPR10MB1838:EE_
x-microsoft-antispam-prvs: <MWHPR10MB1838B53B9C9671A70255693D90F89@MWHPR10MB1838.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H82Te7pNiOUzLfXCyMxdOYBWNCNyvylUfk3JgJrE9KOcwe68bpapJWRw77LxTe6tmxA7Cftx0BxwyMWUvnqEAxVq9npZUI4Pu7xMcvoQv0fR7gCyf2Z3J3+42HENH1rTHlcdPxEZznRaOC2s+9+d86mW5l+w1t7YGXU7lsxxkNKK+NInNBtUTo/rYQMLEs1iF46W50cmzovZzZcL9LoYvZDz9Av4rj0YZOggdR6Q3QU3YQ6bySJwVz5PjADPKO/WAG+Dis8jyvyy2hW9qpYk8P7NfFLt26WcnO3DsL5s9DgCwSn7h3KZ15Zb6Cxez3QSm/EvRE6Q4VSI7eG1FS8LKCaNKG2zlUblBPrnC34BYac9I23JWTPz9sefE/VoC9PvxS2y5ZmnPAZ/0PVJ1aQbuAJVC/OTk1y5rNRT/i1544Lp9eiC7u60h0G3S8N2RurwAjN6iazhBsRcdtBQWXmAAc3BbyO2rQErKzjnuKpLgNrjvrz5qh+cwsV5R0D+eHnNIk5VwPHvED14AG1anZ6s+WCfYR4kBEkTCDo37o7Fb8iBkPAeKwaSzgwuVel+kPoUeyKCQ+K0RjmkD0pvBFtVtA3KQ0IrK2WE1rMMP60YXkZDbKP09AchGSt5ZibVk+g13EuJwbYV1BuXe+ZdxqIF4S9pANy/WbJArUi4bgz2UEjOEF5M1WTUh0rXyGsprDlFus30gLvbkTSkjrSsu9MF2/098YHOb/V7KFnauAGcagY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38070700005)(66476007)(316002)(64756008)(107886003)(86362001)(7416002)(5660300002)(53546011)(8676002)(122000001)(66446008)(38100700002)(2906002)(8936002)(4326008)(44832011)(2616005)(66946007)(91956017)(66556008)(6506007)(76116006)(6512007)(186003)(71200400001)(6916009)(54906003)(6486002)(508600001)(33656002)(36756003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?LzwpXCCSdp0+Xr5XJ9rA2seK7GN6xiN1u6tgCehrZg5X02dwDiVfVZEILI?=
 =?iso-8859-1?Q?E581F0vhE+4SIEAGNojk8h9CBBK+O76a9s3BoZaNChBsStXKLAA8lIKtVy?=
 =?iso-8859-1?Q?FfJ4bsLEK/ySSCpNTkZOxx/sG0KH5l38NmZQFgQGnUpuZ/wGFdZ5cUG6Ph?=
 =?iso-8859-1?Q?e6TeRS0jZY9URaNpGiWwWOkelQOu6kNvv8LdLx8W6tEGb2mjDa6o+2S8Hc?=
 =?iso-8859-1?Q?I8sSIoQJrDFuGH2j4M87fNA3YbREM9TV8v9TZ3CUEdAZFN6tUnmW4vcV//?=
 =?iso-8859-1?Q?PFYvwc/GDSYWVi2+wjxcbyQ6GkzNyFBSPX95Zm5qppCIYH4Pf2MWvIX0Nc?=
 =?iso-8859-1?Q?NseXuZETtpMTk3MZAE0MvDZYthHghBmZJsn0A+SyCkblhK7c1cUuvjyQs0?=
 =?iso-8859-1?Q?nSsnc3Q9Vh49WMJldNp2hLeuTvAEhnMzLso5eQ4n9yAKrnFERy4tgSNeuB?=
 =?iso-8859-1?Q?vb4gngIXNc7ng3Mkh/eoABoxc04m710g/riSYj4btSeojohhwpEZKV2dKS?=
 =?iso-8859-1?Q?c/f5eetxB3h98V7MIniuMVh4iudJo8EoaTlFbq3xiEZzGg8DW9utEFZKE2?=
 =?iso-8859-1?Q?7EdO20xRlnNzB8nWhoLmYjzw6oCtp0sXu4Pq0yNaZNZIhwc8ZiVHx1qM38?=
 =?iso-8859-1?Q?jfy6I90EGRN52JmorpbbCoKy0+dwws0IvS0Q9m3q4I4cxWI4l/tJPXsQq0?=
 =?iso-8859-1?Q?yc7oXjqXZ3nu6SCTvrMTFU5NKoLZ3+n74luH1+xEGTCWx1jeniJxKd/Yjx?=
 =?iso-8859-1?Q?xejaVUmRDnqod1qWIGwofxaTEChbozoxAorVWO8s9BknIjyXj/D2GQ1RKR?=
 =?iso-8859-1?Q?myJSy7WDk+sf4E/9zIbyJ2Z1pl33O+BQtIKtjl6s/PJusI0kgHJyu0tDjb?=
 =?iso-8859-1?Q?tL3BiIOmALwVtuRbcMc9hqnJJxW7xOxAl4PnKirOIRbWAPJkD2WbdBnZxm?=
 =?iso-8859-1?Q?RC2DK6u3X8liGWGWvgXLAwyzQBz3gD8pBum+BRfTRzt09Rr0/drK/Dd2Ej?=
 =?iso-8859-1?Q?3aXniWBd85e4gN37rKSAQ0sH3+JG16uGnc5gDmv/SvlP/bJfi0JNDlFKKA?=
 =?iso-8859-1?Q?NxdD+SGu23EelABtkMkXngHEOzcgRSREEUuJlXYG5RmKa43W76Y1/xWRyB?=
 =?iso-8859-1?Q?6FZFc8vSkjGaFCgAOhlvFNizpFNFP+9EVl6CYGGs58khdvNUIfs7hau/BJ?=
 =?iso-8859-1?Q?bcyyNyRERIo5gTZ9P1Ipzbwx1Kro0MgmZR/jCE0uk0xdo6hgQOirV2Wx0/?=
 =?iso-8859-1?Q?iK6wx7rYUmRCCk/Mnc9tmVOVi6VZKv50eTSlztp8QKT1A2KhT772ZMDw6+?=
 =?iso-8859-1?Q?3TCrDGBY3Hn9anh/da5x9210o70PEAxby61hQUE6GGAtJPSlds6XqpynRz?=
 =?iso-8859-1?Q?hmws5ixPBRxqzYzUyUKYCDXqC4CDSCa8tc2fgcIzbgSafOo/zipLtx9Qrj?=
 =?iso-8859-1?Q?srtQctZ5bBkvlA7QQQsptOdB3Yr70Zl8qHVrPI6hTD9CXxKZdcSr7HolJp?=
 =?iso-8859-1?Q?bJ1Zk641fLod+j9U0nuNCx5f6AcE5lxLx9/LdtH+R6MoGwDx/0U1FEBjkV?=
 =?iso-8859-1?Q?DhPinOkOMNr91W84Yuwl6e6WD+kPnk0C8O8HPDSAnKPSzrmBxV6Ohy06rj?=
 =?iso-8859-1?Q?Dremgf9EKGMuUVm/F3pdNMJkcdxIrGMitDMGP9Mx/AY4aCnNPQqg1rjdsO?=
 =?iso-8859-1?Q?CVZpY+vm9a0m6+gOEuupuw8UsnRrivzZuQgmTRRDaQc3h3UVxTUdm/AA2V?=
 =?iso-8859-1?Q?bF8vLQJcrSyBufsh/DFpbD2b48jzs/k0PlJpcLlMy9+wjzxGyDUIOEzFhb?=
 =?iso-8859-1?Q?L63+hqYN1Vr2cKxGsztIaKhCj/BPweHXcpP5lnsGY6tXMT2YymFG?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <05FFC626D243E84D8ED0CC97C0770529@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f823c89a-bd60-4cb4-0e7a-08da26e217d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 17:36:13.0181 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YP9epV+zq33XTkBEbE8S2JpJU/4xUkexqxcfWxMNfFd5yg27mvVOMQnXIVzTBhOVJT+aufcuJnt4BtmSXzRz6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1838
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-25_08:2022-04-25,
 2022-04-25 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=804
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204250078
X-Proofpoint-ORIG-GUID: B8xamVTFrszOsXCAbf1p7C7F9s-QXOuM
X-Proofpoint-GUID: B8xamVTFrszOsXCAbf1p7C7F9s-QXOuM
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 "thuth@redhat.com" <thuth@redhat.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Apr 25, 2022, at 6:05 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> On Tue, Apr 19, 2022 at 04:44:19PM -0400, Jagannathan Raman wrote:
>> +static size_t vfu_object_bar_rw(PCIDevice *pci_dev, int pci_bar,
>> +                                hwaddr bar_offset, char * const buf,
>> +                                hwaddr len, const bool is_write)
>> +{
>> +    MemoryRegionSection section =3D { 0 };
>> +    uint8_t *ptr =3D (uint8_t *)buf;
>> +    MemoryRegion *section_mr =3D NULL;
>> +    uint64_t section_size;
>> +    hwaddr section_offset;
>> +    hwaddr size =3D 0;
>> +
>> +    while (len) {
>> +        section =3D memory_region_find(pci_dev->io_regions[pci_bar].mem=
ory,
>> +                                     bar_offset, len);
>> +
>> +        if (!section.mr) {
>> +            warn_report("vfu: invalid address 0x%"PRIx64"", bar_offset)=
;
>> +            return size;
>> +        }
>> +
>> +        section_mr =3D section.mr;
>> +        section_offset =3D section.offset_within_region;
>> +        section_size =3D int128_get64(section.size);
>> +
>> +        if (is_write && section_mr->readonly) {
>> +            warn_report("vfu: attempting to write to readonly region in=
 "
>> +                        "bar %d - [0x%"PRIx64" - 0x%"PRIx64"]",
>> +                        pci_bar, bar_offset,
>> +                        (bar_offset + section_size));
>> +            memory_region_unref(section_mr);
>> +            return size;
>> +        }
>> +
>> +        if (vfu_object_mr_rw(section_mr, ptr, section_offset,
>> +                             section_size, is_write)) {
>> +            warn_report("vfu: failed to %s "
>> +                        "[0x%"PRIx64" - 0x%"PRIx64"] in bar %d",
>> +                        is_write ? "write to" : "read from", bar_offset=
,
>> +                        (bar_offset + section_size), pci_bar);
>> +            return size;
>=20
> Missing memory_region_unref(section_mr).

Ah got it.

Thanks!
--
Jag


