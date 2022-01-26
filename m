Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE0549C201
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 04:18:44 +0100 (CET)
Received: from localhost ([::1]:37960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCYpX-0008JY-4m
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 22:18:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nCYld-000659-PS
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 22:14:41 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:64728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nCYla-0006or-Qx
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 22:14:41 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20PMnMKl001977; 
 Wed, 26 Jan 2022 03:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=iII70Cq197chwD17IL4bXULN8IUkkuZaI8zo1fA3hBk=;
 b=D5dYhvcJ/URIeALwJVILjvBeW/aUcjGStPj0iq7a4m/j0BOYECaiv24WGiAVlMWskLaT
 CqaBYFj2vpq7azPjiXxMNtwxCnLdrB2o3nerYKcXK4N4KFRdSsdaiJOB8iGAwONcSkZv
 N1uthUNvkoeesZlWYWUfvyiyueTh1BIg9iSep69TjPSryPkGS9qJIfyQKNVUeUyGaDvs
 GKo0ERe+zr+oTpE2nQsajlxivierWXjImBo7LuBri7lGx+YeRW7KHpi4REl7oxMUBNSY
 OvXmq9hEf13ODJB2Vw0Mgw4xu0rwxXUU9FJLf036k6wjp5GcvJL9+HFHI/rqwK3wxoL6 Bg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dswh9n9tn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 03:14:32 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20Q37I1m020605;
 Wed, 26 Jan 2022 03:14:31 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by aserp3030.oracle.com with ESMTP id 3dr7yh1bbs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 03:14:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YKTHkrorzeTn+XFTznF4p3Zm6ejBAwpQOH256pX4yfuWGeP7UWvtm+0ykvDKhDBo4sVQJOxU0E6FPqeZsS/4GlnXDv+uahhyLkfqQBGeQyFWJF7iaMzm1620dcP2OB1WBKMzbFpMcT8uIhtUdY0HD+Iq4X/+CRF28EmedAt1fsR29efP1JyBmxTPOCoFhVKELpBoidl9rw7Wy8ZBFQrhny5fsMTM/e6K3SwC6mpFlEmANJEBUBsCcHTa7FBQJUe760l+yb2pbWfjZ8Ehq+m8+I9LHVspLnLeeMWzJ77fgKvsSA8q+zb4st6uEB5wCdF2ajPDYKWbnG2qTcPE6U2wbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iII70Cq197chwD17IL4bXULN8IUkkuZaI8zo1fA3hBk=;
 b=m8PJPLhJCU8tqZwDtw7g3dxsFUu6ZWkmv8NtlVSXJSgerg/soK2zRfqqPZ4r4EnwAmbbkxzm06L/8B5QmzH9p3a0dzf3l8/mxyRpwk7UDm9+6BViZMKmcN6tqzJt9mnuIM+hOGOvujNhBH1Hu4/+OczSDDHNtUslUBTWivAyIZxyn8RbAPs25ovQochw5B2WI6xjBB99A92sjGAYvrfKk962N4Q1dOF7KCay/T4macOqDe4dDywN1lhrccYs73OjelxMhUUMA5YYhlk/nEFhgFMG5frQEZ0z4+YyiIz1Aac4B9zfDIbcfxZf4baiSj6KnHFFwNs4OLveeq9taS6Mtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iII70Cq197chwD17IL4bXULN8IUkkuZaI8zo1fA3hBk=;
 b=qx+a00jpsLtlaCqCR7jw1XE/Z/gqkJhqgGkjkFxrY7pBJ7UuL9TVEPZaUl4SKKgofv/IEVuoTW2dlBTnk9k9QyTVChCdicSCjuRwnDV1y8Ewrgc3/eJCbzja0j34giHJXsFiFQ9/ExDk0jE50Wq7D3gUykwPCQBGMgbQNbU1fXw=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by PH0PR10MB5595.namprd10.prod.outlook.com (2603:10b6:510:f7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 03:14:29 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4909.017; Wed, 26 Jan 2022
 03:14:29 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v5 11/18] vfio-user: find and init PCI device
Thread-Topic: [PATCH v5 11/18] vfio-user: find and init PCI device
Thread-Index: AQHYDX2Eyc9NQTetHE+wvUDUBRytz6xz2h0AgADQjIA=
Date: Wed, 26 Jan 2022 03:14:29 +0000
Message-ID: <B9171621-5C17-41DD-B530-2464B095B205@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <01f4837eaa73d340542961cf36a6028f4a681a0e.1642626515.git.jag.raman@oracle.com>
 <YfANoO9sUaf7WCJv@stefanha-x1.localdomain>
In-Reply-To: <YfANoO9sUaf7WCJv@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42ea62b8-1842-4b38-8e53-08d9e079f753
x-ms-traffictypediagnostic: PH0PR10MB5595:EE_
x-microsoft-antispam-prvs: <PH0PR10MB55959074C1CB100C8B6A955F90209@PH0PR10MB5595.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:459;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3kzuMwIGLAG74K2TnuUdXMW/HXk5hvdeaH3wM8jlHu9OKygdSX23P39DHUDX6J3+FFDMunXsr+tXAsQ82twGEepkeGM0mQzE4S5LnYdG4SyjcnCv2Ns41XzKxgaH5Uf3hL1YlkuPrC8OG+Pa1NsGumnvOKJBQFmCp7I8311Er1SENdn2gaybHJCAEZ33bZ+e7LmLYpjr1y2ULkqKTD24hrPf0/YzXifbba/7EouWPqj2LRrvRf2FaygWgz56urpf+/D8kc+EjHz7y8NjQAoPT1EINrrllHLZXo3c9zR+iCQqu7ieV3ZbjtvHWcS8npVsZlgxdf2ifBAgEWSl4pCLGOnAoft/CLf+JzuixmC2OFPWLKi6RlsjUjM+Eblfr9nMm5sBqIeckMIs8dKD/iU0G6YIjzp0WrqRoywvuSUMbptUkratCrAAQIkZmAefvT5sRtN662PPQph7zIClbBHjoXzmTZoyCBmLOGH59sCSiAayuKMXa485ZOvh9zLP6sgcYskKTTTijT6n04ipAo+iZGQNWp1pNmGqP54qlxu9czD/3gsdJwpC4xe7rxmocA61AMpzPym82Y/JCWKuVNgAVQt+yobhf+UWAE2yDiYwk5GngK8iqvV3OGSkkqFwvTAN0VeKsEZlhX0yhTVZAgvBM/i4ZBGZr6id20S7yBVeW4xKDEfpmR2uZ+W43/XDOWHi7gzLB/FE5p1yEIFVr7PzoR3hnajgTyxe6LcFyFFb2KU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6916009)(33656002)(54906003)(6486002)(316002)(26005)(64756008)(66946007)(66476007)(66446008)(8936002)(8676002)(4326008)(122000001)(2616005)(36756003)(186003)(66556008)(71200400001)(76116006)(83380400001)(6506007)(6512007)(44832011)(107886003)(508600001)(53546011)(38070700005)(5660300002)(38100700002)(86362001)(7416002)(2906002)(45980500001)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?6b9uAoGDlgmD404LzSGFknRnhvrPkTMOXqvu3RzUAvk98HZLQCepz9sonG?=
 =?iso-8859-1?Q?UTkBjSF0BxITQMDZR0Zqbif48C1986I0noTIF+rRVyTk+zfLKDV8g9rv+o?=
 =?iso-8859-1?Q?HFAuHGswO1Ev381tkQ5RrAXZFTHiVGY7iDwcoRTCrGqLmnU5XN193E3a8h?=
 =?iso-8859-1?Q?npAk/4+NM1BwfGk4/wp7vxWVLk+dAW7unyhAySgUAOQIGaWn/CnYYobXjk?=
 =?iso-8859-1?Q?IOvAOda5EqMIiJ3NTgFYTu/VHoiwrA0MpPZHrrsYfq0eSXg1NS2ZIs+Gg3?=
 =?iso-8859-1?Q?Khk4pe2Sp5IQC5yKk5RUtDZMpdvZHVL18AzjUlakl8l2GRFYdDbl7qFSNz?=
 =?iso-8859-1?Q?aWwMfPsx1vMOq7JcQHdQsDzZoPeyiX95hlSU/2m2sieOcpCgAw+C1Wyn7u?=
 =?iso-8859-1?Q?PEv9yNkQuxlWyu6s9z3qoUPzcckNqZd1ao3X565cXA6uoDCAjp9DnmETka?=
 =?iso-8859-1?Q?HVfMWUCtTaq+uYudh/vtbTtuzZe4GkFhRQUY4pHSecXqMzdSUJtKbzdxhj?=
 =?iso-8859-1?Q?6l/L9sZ8b7u3q6Nv5lyeb4wVrkxHDAvkhXrN7zwe32q1bXiJqcJUgKcECr?=
 =?iso-8859-1?Q?TxrLZpaD4IGwU7PqAoE/m45lugU7KbSARxsp1+6GRTw5mvK5wbc/q13fTe?=
 =?iso-8859-1?Q?uwHLc/EcWg0/lC0+ITEjT97LW+PEkESN6MZ7waYnAkrS2Cg6WxD1+Ts7xY?=
 =?iso-8859-1?Q?ktPgnQioGDYBbK9p8qRxv/XVuYpvkqX89x1g7uVeTb6n0UT/aFWAUZLIOL?=
 =?iso-8859-1?Q?ufP1rAN0CxelxOWSJr9lPbF50wTxpOB1vpIR38BsRymJoMkCZ2tI9qGu6Z?=
 =?iso-8859-1?Q?LqG+A6ffyV6VNzWiu0guggAVPI/ylSV9GBQwVPunA3Vbi6BkMsDgi9VK15?=
 =?iso-8859-1?Q?Ptv9VdV8dbkWQ+cAhIOosZHlgAyy+21EfpdwcrvCCPOM+wak9zLLd4NM1E?=
 =?iso-8859-1?Q?CI+EzttRHIhEmotWlb5zM6PsYg8uBY1jqgjFQsez7DA04OMo/ITMz3cesO?=
 =?iso-8859-1?Q?KBOGDxbUaLConwbG629iddJ/Xd/JrZBNhbKFJYYE0DUEebphcI0jTFdUFH?=
 =?iso-8859-1?Q?ORf+3Nrk2/lQPtm5nOWt9w4VygbL3fm1hJPNnLWk0AC6TrfDcvemwOoT/C?=
 =?iso-8859-1?Q?OzymeWr46NUrlv/16XuavgR9hngW7xL8adiMC0R6iP9MIfq2OhJqWElYst?=
 =?iso-8859-1?Q?Imo2uAivV7/P0g/pNYHPbEoCY9GWQslGGy1Iz8uMVJRKntpd9aBrvczdHz?=
 =?iso-8859-1?Q?q4d5GN2ukZfFtL2aDSG2ev0xLwsXeOOye1h42qHymTJNDzxF/Kc3A3N6Se?=
 =?iso-8859-1?Q?ZDhVpiwnpL8+JGVjeMIaFS0g1yiXUsZtdxOZ9XX4F8gkXBL4D9p1uVpowl?=
 =?iso-8859-1?Q?0iAbejaZFHOkxmzlH0TlZAj2r2qaaj/4A6OSBGBm240mzLGMT3wogQTYvO?=
 =?iso-8859-1?Q?uE7CiKwLw36iQFxGCwBpwySJI/DsPWb42bblzQU5emNdF9ziALl88hfevw?=
 =?iso-8859-1?Q?etKMmSQt4/BO1WipABvRlcIiFg4YoMbaPLH3KHnZk8lFzwPBAZMT6Jz7HB?=
 =?iso-8859-1?Q?29ULSLpHbPCI9Q0j0vh/RitDif2sYcwsJ6msbTlL1ebCZj2+Ek+fujB0nv?=
 =?iso-8859-1?Q?P/p4TND8Ffu6rHhZT9aFisX7mNj3kIo8k01XZscDKZszUxSFTGsViFkZG3?=
 =?iso-8859-1?Q?QnTGtp/I61gHX6B6HVI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <3834497C416DA84B8E27652C4F26CB7C@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ea62b8-1842-4b38-8e53-08d9e079f753
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 03:14:29.3811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aUlB2BUhPKK1G2+aPch/1LaNis3ofPQ4ZChPrs7R7+VyAKTH4b9/v1WFs2prgkskDy2/+yXOje6VMLjMVFePgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5595
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10238
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260013
X-Proofpoint-ORIG-GUID: VDQDpGnZ6UWCiNTGJF9o-rqtuvor5bxs
X-Proofpoint-GUID: VDQDpGnZ6UWCiNTGJF9o-rqtuvor5bxs
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "mst@redhat.com" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jan 25, 2022, at 9:48 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>=20
> On Wed, Jan 19, 2022 at 04:42:00PM -0500, Jagannathan Raman wrote:
>> Find the PCI device with specified id. Initialize the device context
>> with the QEMU PCI device
>>=20
>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
>> ---
>> hw/remote/vfio-user-obj.c | 60 +++++++++++++++++++++++++++++++++++++++
>> 1 file changed, 60 insertions(+)
>>=20
>> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
>> index 810a7c3943..10db78eb8d 100644
>> --- a/hw/remote/vfio-user-obj.c
>> +++ b/hw/remote/vfio-user-obj.c
>> @@ -44,6 +44,8 @@
>> #include "qemu/notify.h"
>> #include "sysemu/sysemu.h"
>> #include "libvfio-user.h"
>> +#include "hw/qdev-core.h"
>> +#include "hw/pci/pci.h"
>>=20
>> #define TYPE_VFU_OBJECT "x-vfio-user-server"
>> OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
>> @@ -89,6 +91,10 @@ struct VfuObject {
>>     Notifier machine_done;
>>=20
>>     vfu_ctx_t *vfu_ctx;
>> +
>> +    PCIDevice *pci_dev;
>> +
>> +    Error *unplug_blocker;
>> };
>>=20
>> static void vfu_object_init_ctx(VfuObject *o, Error **errp);
>> @@ -161,6 +167,9 @@ static void vfu_object_machine_done(Notifier *notifi=
er, void *data)
>> static void vfu_object_init_ctx(VfuObject *o, Error **errp)
>> {
>>     ERRP_GUARD();
>> +    DeviceState *dev =3D NULL;
>> +    vfu_pci_type_t pci_type =3D VFU_PCI_TYPE_CONVENTIONAL;
>> +    int ret;
>>=20
>>     if (o->vfu_ctx || !o->socket || !o->device ||
>>             !phase_check(PHASE_MACHINE_READY)) {
>> @@ -179,6 +188,49 @@ static void vfu_object_init_ctx(VfuObject *o, Error=
 **errp)
>>         error_setg(errp, "vfu: Failed to create context - %s", strerror(=
errno));
>>         return;
>>     }
>> +
>> +    dev =3D qdev_find_recursive(sysbus_get_default(), o->device);
>> +    if (dev =3D=3D NULL) {
>> +        error_setg(errp, "vfu: Device %s not found", o->device);
>> +        goto fail;
>> +    }
>> +
>> +    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
>> +        error_setg(errp, "vfu: %s not a PCI device", o->device);
>> +        goto fail;
>> +    }
>> +
>> +    o->pci_dev =3D PCI_DEVICE(dev);
>> +
>> +    if (pci_is_express(o->pci_dev)) {
>> +        pci_type =3D VFU_PCI_TYPE_EXPRESS;
>> +    }
>> +
>> +    ret =3D vfu_pci_init(o->vfu_ctx, pci_type, PCI_HEADER_TYPE_NORMAL, =
0);
>> +    if (ret < 0) {
>> +        error_setg(errp,
>> +                   "vfu: Failed to attach PCI device %s to context - %s=
",
>> +                   o->device, strerror(errno));
>> +        goto fail;
>> +    }
>> +
>> +    error_setg(&o->unplug_blocker, "%s is in use", o->device);
>=20
> More detailed error message:
> "x-vfio-user-server for %s must be deleted before unplugging"

Got it, thank you!

--
Jag

>=20
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>


