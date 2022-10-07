Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C775F7B33
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 18:12:33 +0200 (CEST)
Received: from localhost ([::1]:51740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogpxg-0002fq-N5
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 12:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ogpL2-00007y-Kj; Fri, 07 Oct 2022 11:32:37 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:21144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ogpL0-0007xr-FF; Fri, 07 Oct 2022 11:32:36 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 297EmlE3019409;
 Fri, 7 Oct 2022 15:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=tDmKXzeMIoTNzieqAD1xVHsJpiQym7inF/dpXYPRfS8=;
 b=dcsI3DE8wMknZsDWdrR6DAq8NwtUvHrLZE9SbGdGzl4sMC1eTmhr8F0Zjt9NPnp7JjA/
 KWYuAjR+JbFCZljziYNdZ8QzmX1Pqj0rhK8SCKg2UWL+jjzDBalfiED7gp7L2ZZhd0UX
 8w6rk6LrGimfD87MfB64DET3iqLS2pJaxsNasLY5IH9rto7MLNlN5wLq9fNdRuvhvdSx
 95ZVBRgzKC4Q0SrkCfBfBuLqsc63JIze1AwuaFGybwKU+pD4jWoGjhxPWN3xMvw3nw47
 eXPWnOe1I5DCQM0cgXaziqASHrpI09uxtZXWTS8WaRLzvqBC/15vKy7K/92AyH9qQNif Ww== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jxcb2yh8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Oct 2022 15:32:29 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 297DYcCU020628; Fri, 7 Oct 2022 15:32:28 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jxc079jmn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Oct 2022 15:32:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ww3yIcmPTc87THC1wow3RNtSBKFBVcA8hajRXfItCinOxszC8PgDWQS6cNg5VYURmD02+NJQazGv/OPhDazi1G5vwTJJDC4Gomd6hVtCp5E8EEva/2xyLYLc6LPprNLFxze3uDk/KEd1rOUZp2LfWiOvRyyqnFSHkzIHnguqtlQFB4psPFKrGV/BP66yxddXGnR7EgDAwLo+G3PaiG1ALPCaXL/ztrRfHTtU/ixqa+xgdvIY21Tyc4RoQ0yIDjM+M+sW8egJj2W1gODsFG6ympG3H+5687+400/XbntzxK8zSU0azYbHglHV9jix7H/GfPCirq4i4KRHFHKLC2tEMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDmKXzeMIoTNzieqAD1xVHsJpiQym7inF/dpXYPRfS8=;
 b=RjKctR7EL5N8iF0+MV49krTQMT8+Fnty+1QpxloDtZ1O8Kw/YdZrtyk8u6Ue6rJMBw04zI5YnBNAkefBZkHs5beTliGHJlNoqah6p7/Wp/4mulu+TnjG42b01l6a9u3ROo0vqnl+n6qTvGXBJ5CNOGBjo4RNOAyReFn0qJo4Fjh/9AjNoCx/HSoCaMTkgYYLgNdxJvXMS3T1diaylUMNtZHLXa14Lobm6PAsVpRAAotwemomzocGSvB0MpApJD2iSv7ol212DtTyZS0LkyoB8pd0nwxmwjG9q89pujkm4CSIMssAtD9jXfU75mOVVtB4A8P6egd7unjFjDskxDlyaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDmKXzeMIoTNzieqAD1xVHsJpiQym7inF/dpXYPRfS8=;
 b=BIqgwpkdYNH/f9iUiLuh+oW45t2uMoKbd5WtQIqHiWvB/RPY76Fto9MIMh5lX44DHv/ydmy9iQpcy8qbmAFn0RpIZwouYOyu9zWAuKZc61gfAnXurBSK5lWifcmJt1mZSn28fFi31/wsezA6qYYo2wrlEQwDovrmcfbk8+nX7LA=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by PH0PR10MB4677.namprd10.prod.outlook.com (2603:10b6:510:3d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Fri, 7 Oct
 2022 15:32:25 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::4c04:3c29:4a50:d882]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::4c04:3c29:4a50:d882%6]) with mapi id 15.20.5709.015; Fri, 7 Oct 2022
 15:32:25 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: Ani Sinha <ani@anisinha.ca>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "mst@redhat.com" <mst@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>, "shannon.zhaosl@gmail.com"
 <shannon.zhaosl@gmail.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>
Subject: Re: [External] : Re: [PATCH v2 0/3] fix for two ACPI GTDT physical
 addresses
Thread-Topic: [External] : Re: [PATCH v2 0/3] fix for two ACPI GTDT physical
 addresses
Thread-Index: AQHY2luN89dX00ryfUmXMGLyKlEYca4DDD4AgAADCIA=
Date: Fri, 7 Oct 2022 15:32:25 +0000
Message-ID: <F894152C-824D-4599-A048-B92398EA9539@oracle.com>
References: <20221007144553.79648-1-miguel.luis@oracle.com>
 <CAARzgwxpjfioHSWq3iyzbOT2LgfX_93A5Sje0e1K1tiXtz0wLw@mail.gmail.com>
In-Reply-To: <CAARzgwxpjfioHSWq3iyzbOT2LgfX_93A5Sje0e1K1tiXtz0wLw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB5433:EE_|PH0PR10MB4677:EE_
x-ms-office365-filtering-correlation-id: a3f4db8b-1419-4075-50b0-08daa87922cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0z95X11QhvKpQr0Akc3hKwxVmoqo1ammE4XfZt0RK5bKsIYQa/b6ccmCBhN9JPfnBVz5BQIyWbC8M6wc5ilfrfGywVl1bNczA4p8oXeD/1jZADhrdVm+E4moToxY9YOS1e+8ZFWmzU0gt/fTRLixlzuyGycelz/3uFUvzsfQczJ29WgegtX8L3vwfbR/1Gs0Mql01yg5gGqQhom7qx/aBB4XxoqpDBuZ1igX5VZh87xich089oS+E5EPv5JmsB6fY6e00jz1gDRO1KvuLEzyJBzblHbk7XsAqw98nw8caprDihqgrU++TcAYxASNpOlh+PfzGRvapMb7QFm05zLCokPQjGCBMNgAj/vFUWXDx9LpmzCPNi/W7ZyCM9JQolEvp0tGKVXxwmNRFwxWdMvBLFZXIsnOPxMihldzhq80yCWzmkOWq9ourr3sDLRBAKxHGu40ziDHthD/r4Y9wi5Zet3WBpfFqBxEEd4BGbmYeFwnPOSjhpxZCP3O8VkPhiUqy0KfjIeIqnbrnkA4N4Z17h5sq2O8qvIgdGTEi86Ag6JcRgov1h7wjBeeuEJy9QBj2JSvpALUJLtUf/+K4fNhzKjIMPipjrP4LtnKDxnSJIwHbucthc95F0xeycroRO2D6VFCejs/ePq/jGrurI2RNAEOfVQ1kBIHPXwGMSVUM5mLfefIHFsRWa5tuzTvHoI5yQcfC0w6++vw+6f+9AiwvtxF67PluGRs5kso+u2fs1It4RfgS9hoIgZwQnZQVp0xuLR3f96HPcTlGyEhlKr6Z8d6wkKSmgmblNu5JC0i6ZLFZ4E7w/avpxMW8uRydFhJyHOGI4ofliZ7zCBlZNXDOhFajUZCAvhbMKKzNp9PC/4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5433.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(376002)(346002)(366004)(396003)(136003)(451199015)(8936002)(53546011)(122000001)(91956017)(38070700005)(86362001)(316002)(66476007)(76116006)(4326008)(8676002)(64756008)(66446008)(66556008)(66946007)(33656002)(38100700002)(36756003)(83380400001)(6512007)(6506007)(966005)(6486002)(478600001)(71200400001)(6916009)(54906003)(2906002)(44832011)(2616005)(186003)(41300700001)(5660300002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BG/bURYUHxgvbrzfKla7V1XoTQ1vmErJLSeOLiZGX+vnPX0wtsZhasmpU7HU?=
 =?us-ascii?Q?qyYQmHdMoXtFL9G+On9lnoBnVPDKt5iF3VQl3kfzoHGaJCp2c0lMHPg4aDuG?=
 =?us-ascii?Q?oz8WTXB2/55jI0VdZAGSZcJ8yYv7cpDW1Do5WvGMn2YNrvXVUBWGCZQorhdN?=
 =?us-ascii?Q?ytFunRPaWIYtQNpvO3GKbRCvbCG834meU3tKVMoZIF5p7uSZ39N46RQJTt2E?=
 =?us-ascii?Q?bQMH0RnlDbhHfD4iMgyAZkzMAw+fkGXeQRbEqqdgzIGi96AHgUkrRln8gpTO?=
 =?us-ascii?Q?Dnch219ey/Scm8stAc9V8D2iu7SL1rXzuKBmg8cxtMFUI82OBsM6AGovS59e?=
 =?us-ascii?Q?tmWwMaAjAPpqJ5+gz6+5MouFP23Q3c+CFyLG7OxYpNSiejXW+gUUXTNhJrAL?=
 =?us-ascii?Q?IcRj2mOI0tubMfYqGXtP5baG5SYTTsF57i99hfK9uY7ipylUGIbhwEyRazf8?=
 =?us-ascii?Q?QVO3oRBlWR4deN8agXjhA3EbTFwJhZkMaGe7Zk1M9LGpn9KU9DeRAz+s5Urj?=
 =?us-ascii?Q?UH62WeZM+vVfntjs3ZNAcxCgDvfFEtve2op1asltm0KaPBTW2pPEs1IWZ7nq?=
 =?us-ascii?Q?HaG5pYkwwI/Ny5EWZ1QORq/q1KvxLIokr83CLyi1xOhl48u/pRJDEHooR5rp?=
 =?us-ascii?Q?BRrjEfQFZg4u+mL3+18d9qqGxgjB7reU8Gevc88NkzKdbUIPnU84dSr8bS5B?=
 =?us-ascii?Q?o2F3C5Si1FpmR5PE/9ovTXYZKNAREl5HA58zlAvPgQigcOB1keEAbvsG1pu4?=
 =?us-ascii?Q?iEtVtyudOEsHBKsqUNrtXgfv7uDSXKnnmZ4DsGz8IfFxL8dRnq6UhkS+V1lf?=
 =?us-ascii?Q?OicobvI1JkccFQ+8sUL1/UT+rBK480w9mDyI4KGQY3zwnculUCPh6MAbUfjS?=
 =?us-ascii?Q?jbZbVr1BMiKwa4vivR2DdP2OYkKKAnOuGu+3fCGV5ejVnXgu2GVe0ADBrvin?=
 =?us-ascii?Q?Bupiwzl7Tch9R7+RdR0YimQCNf0s3R4oF4x1Wzd2aIE7FlPHT+DQPFhsavyy?=
 =?us-ascii?Q?6ojpTDniaf9OXnHs+fwhJ2JwYA0ey5BCp3orOBao8ApN7/MC/fGMSmtVpw2W?=
 =?us-ascii?Q?GBqcq56rAziTV6EaGH2VKQHuEi7nuJJmTlmd9VqYh69pvp3bcVHLYfN7GrpI?=
 =?us-ascii?Q?mizA6RA2QRhUu8cN/lGxkd5I9fn0FHu7h1bSXW1aZwL01LQ9609TFnSV+QA+?=
 =?us-ascii?Q?zpgYmNYHkkc+lfswaz+OzC1ynIYo5kZgR1BgfMczOZMi89ZsAz83ephGpvmG?=
 =?us-ascii?Q?fjYssVODORyh11FXWkxSxEwGV2nzDF1APThjmMrre/MaIMPO07Z0/Kn7zXPe?=
 =?us-ascii?Q?FUT3QicpfffKlY5LcwCVBcbinXiwEeOQc0LtIwopxx6RlfL3kiBINt2CI1ub?=
 =?us-ascii?Q?IiArKq35J/cUnr9WdFm1OMO0rnwAIGRW+0UUEufHkWV/kJjnGRji5Jz/Fj/Y?=
 =?us-ascii?Q?CqpG1nKujJI6fHV5HGo2YC3lhtCatNX9pI8sq/iiUhGjZSy5AFm6Kj7u2mcs?=
 =?us-ascii?Q?pm0NrKpfe/DSRHhdyTtEDJlIJc78FJDI9al3+2tB6TLC0dQY1roKhG+cf3FA?=
 =?us-ascii?Q?JyaNlEky2XoZNkY//4jgNgn7hyX32Gw48VrFtAP4/5YwTNxSDMHoVf6+Xans?=
 =?us-ascii?Q?7/6dLK0o4kLwoohB+c3v3JE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <719CFA924792414586EFFCF0803AE291@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f4db8b-1419-4075-50b0-08daa87922cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 15:32:25.4111 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N/F8mSXRggtIlNtCkQflfGTlb8JAVdrxjoOctW8taFDLGoTl6cHXJkT+zBKJMWDHuiTXX6odwgAGx6j9BinhDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4677
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210070092
X-Proofpoint-GUID: 8l6XThK4U16itTF6EQ_l_w3CgwgJJwgG
X-Proofpoint-ORIG-GUID: 8l6XThK4U16itTF6EQ_l_w3CgwgJJwgG
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=miguel.luis@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 7 Oct 2022, at 15:21, Ani Sinha <ani@anisinha.ca> wrote:
>=20
> On Fri, Oct 7, 2022 at 8:16 PM Miguel Luis <miguel.luis@oracle.com> wrote=
:
>>=20
>> The ACPI GTDT table contains two invalid 64-bit physical addresses accor=
ding to
>> the ACPI spec. 6.5 [1]. Those are the Counter Control Base physical addr=
ess and
>> the Counter Read Base physical address. Those fields of the GTDT table s=
hould be
>> set to 0xFFFFFFFFFFFFFFFF if not provided, rather than 0x0.
>>=20
>> [1]: https://urldefense.com/v3/__https://uefi.org/specs/ACPI/6.5/05_ACPI=
_Software_Programming_Model.html*gtdt-table-structure__;Iw!!ACWV5N9M2RV99hQ=
!I-YqmAwYNhk19YHxcbjQBMwEE9a8rZOvufvOOonAPEtgTynOYOf5AyYKLTTGJ2RRzsjvkjIule=
Subpg$ =20
>>=20
>> Changelog:
>>=20
>> v2:
>>    Updated with collected tags from v1.
>=20
> For future reference, there is no need to send out a new version with
> just the tags added. The tooling make sure that the tags are collected
> correctly from the last version.
>=20

Great! Thanks for the tip which is very helpful.

Miguel

>>=20
>> v1: https://urldefense.com/v3/__https://lists.nongnu.org/archive/html/qe=
mu-devel/2022-09/msg02847.html__;!!ACWV5N9M2RV99hQ!I-YqmAwYNhk19YHxcbjQBMwE=
E9a8rZOvufvOOonAPEtgTynOYOf5AyYKLTTGJ2RRzsjvkjIulSis4m4$ =20
>>=20
>> Miguel Luis (3):
>>  tests/acpi: virt: allow acpi GTDT changes
>>  acpi: arm/virt: build_gtdt: fix invalid 64-bit physical addresses
>>  tests/acpi: virt: update ACPI GTDT binaries
>>=20
>> hw/arm/virt-acpi-build.c          |   5 ++---
>> tests/data/acpi/virt/GTDT         | Bin 96 -> 96 bytes
>> tests/data/acpi/virt/GTDT.memhp   | Bin 96 -> 96 bytes
>> tests/data/acpi/virt/GTDT.numamem | Bin 96 -> 96 bytes
>> 4 files changed, 2 insertions(+), 3 deletions(-)
>>=20
>> --
>> 2.37.3
>>=20


