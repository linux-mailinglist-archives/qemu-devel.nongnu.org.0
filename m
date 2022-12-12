Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D933E64A8B7
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 21:29:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4pPi-0000fu-P7; Mon, 12 Dec 2022 15:28:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1p4pPg-0000fh-7w
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 15:28:36 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1p4pPd-0007Ey-Ct
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 15:28:35 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCGwrYp002674; Mon, 12 Dec 2022 20:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=gQcjkK+8LcdlFxdTNbXuIN95wTRulu+FQOiE8XhJ3Ho=;
 b=G1Uw0iEZy6eVWSuYjgT5SOEe5xfd58WApVHeztE2JkXpQwnLu4NNo4rwKsBJ1csmft1w
 VK4ASVJsY5AelLLxZ8L8OV2f6pto4M5FTRRazPpPYfTI3W6L6Bl80RxE5UwVcWmz6sbK
 bgUwE6gn+e1AZhvcWFQ0887XzJFJplJR0k0F70WGV+77LmPrFJocHMNrRkjyFH32cN3/
 kDfbR8hYb5XNiu0SIM2UxIWrUnRfz1rDv0MIJ7se33SFzfxz9Xmt6HqssrhK/+MsgFIL
 4RPb+MCOUUCxn7UPV1mMKt78FmoGowm/mEVFXHtcOEVr8lu9/nU4GY3n6AM/fWR4dYTI Fg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3mcjnsurx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 20:28:26 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2BCKExoU032993; Mon, 12 Dec 2022 20:28:25 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3mcgjb459y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 20:28:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpmRSP0XOeIU0Suyk03/S3i+7in9nf3Ud83xW4TUMDq+uXqOR3Z4pMznocogxvW3HpTTeawyvEOZUexg4YUBm7bVxejKoCEd+ZK4vwoDt/P66/8J4aRvv2WCleGkJ8h/weHOlTxVF12pe1UBi+omVU/kI48NIhA0rPTbvIbhW1NFc559W6BVRvPC7s0MXmJgS3IB3fhenlaklRgiQHk6NHGB2z7TIbNi+X61LZOT/Wk7DifzgrOB0yTzOZGYcj0cpqiK15xnrEF0FnldOtdmOgEBtSpWLeXZkfMhJip4twCVxAvN62mgz8KhivyzAbOc3e0DQuPA2iKOnaJSe7Vg9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQcjkK+8LcdlFxdTNbXuIN95wTRulu+FQOiE8XhJ3Ho=;
 b=Z2AFuHA+PUWQvfZAGpZ4A0TXanytEQOGQDzFLGAqHfDj3uKNrtmuYVrZI55XA20V6CPy1su/JN2n9rerVeMdPw3f0nTxYBqo1mkNs1L2T2NY6lCQFsnTISBl1Nam6N3NzRwoqbZxziBSKOJOStJJnsZJuSSbLjNk5Pc9fKrKpp+B3/zoE/2QnCAYw1rJeZDciHj2RVhk33HCFFfwhC75KhNhBX+U9Bn2BZvWdK3UOX+niliXCq6SqweIRIImNTVchAXL4jxnkImFvprbf2tsvK6Ec5y312ikEZ+oMom3QQx23CagNKiQYToJibKBlkTKIIqi5QxOpERvPwX3+P4uTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQcjkK+8LcdlFxdTNbXuIN95wTRulu+FQOiE8XhJ3Ho=;
 b=RfB5PJk4FgTqkwE94ifforwzJNQtdObIoVmWkyBHP0zfCMjCDMMhaC6iH1y+h4ROExiWnr/LFASBR24XaNd1GDZnKA3xuBgdhfeguqxmnpZq0jzqh3vwUvukLNCVVPVa2jQKP3c0rI7fvmUsQqOXE6KKKKdj9z2SVBR4Rrielsg=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by DS7PR10MB4845.namprd10.prod.outlook.com (2603:10b6:5:38e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 20:28:23 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::4636:bc4:6c76:2486]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::4636:bc4:6c76:2486%4]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 20:28:23 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: John Levon <levon@movementarian.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v1 10/24] vfio-user: get device info
Thread-Topic: [PATCH v1 10/24] vfio-user: get device info
Thread-Index: AQHY86IYNOoWGWhxOkW/zzfHmu2YdK5l5r6AgAUCjYA=
Date: Mon, 12 Dec 2022 20:28:23 +0000
Message-ID: <6496E4C5-A83A-4343-A042-4013AA4549BF@oracle.com>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <d0fcc3415ab22bf66bbd86c1d69d4dade8c023bb.1667542066.git.john.g.johnson@oracle.com>
 <Y5NbBeoTnXLV/dwL@movementarian.org>
In-Reply-To: <Y5NbBeoTnXLV/dwL@movementarian.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR10MB3255:EE_|DS7PR10MB4845:EE_
x-ms-office365-filtering-correlation-id: dae7b634-53a0-4cd5-4157-08dadc7f6acf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hDOmhxuiNpcXJ/++KZJ8+DTv752wDT9YzUqJ5uWgI4hLqllb8zF6MJARxpU/DHH8j3VXAd0XHkII94+h4E5EpvHML8klWeTyXJBkb41LLlJ2VwboszwqMyRiqXMdrK/+W/gSAbPAokm+U+OQnc+ZYev2sB86fOPx1UTC4Z8SRDofcKBG++QQXp4IkY6NZt1+11M1qDGdYOLkHxVw/87bNbUoJG/znPSwHN9XwJ7qCR8Ym2RKWUzAOU950wFD+GHwZejIL9mnsT1zFVm5XBuRPFENltyZUQU2a1/VDa2/rqLRkfmWQHM24lPumACMJmW2ESX0Cf13YJya949Ou9xySQ7BxjIrTaVjkaoeUedw8SO+GprpRTvnYfiDVFbWVthy1J6egEMxEsRV0eLAbMydpDM5yD61p0H2kXzQNrdZPbxlrSkbBL8SmBJERouo71envNDXYgci5SLshGxsfqnQq2R4K8qzciOcJ6zO+L8zn+aIfqwEyITJMh0LotwcxuOHGcfaMAk9mHiTOY2IRWGjLkGtw/098Zgy1YTpe9AC3Gr+WY6ygvwClw8Zre7ot26VAfAVqHXoIVkAw5UzfyXXokRvFHk8dek6ZLGkbGnKKggPvGTRjvVl6SnJrsSEBJQyjfYlNpxZDiIWz7dFHagNsPbVVtbTlfnYU9dQhM7RL4oZ6fAzWAgwjtO+ZGn0CX1keLY7uUghRjCqM0T3P+MuumzEXDwMAuqMfYr/fiO6mTI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(376002)(39860400002)(346002)(366004)(451199015)(36756003)(33656002)(66476007)(38100700002)(83380400001)(316002)(76116006)(8676002)(66946007)(6916009)(66446008)(66556008)(64756008)(122000001)(86362001)(6486002)(6506007)(53546011)(38070700005)(8936002)(5660300002)(4744005)(2906002)(4326008)(6512007)(186003)(478600001)(2616005)(26005)(41300700001)(71200400001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pfx1mNNvF8i+4m+EYVtwXxsYwD1ZklCYr4bzth7pqZJQOYm1Pmtt9fz4L/9u?=
 =?us-ascii?Q?vBNwd3RvGfe+HqGeDgSIQng37BS/xTWiulT6IqIZS8TefPP7hQ7bFKCGlJZW?=
 =?us-ascii?Q?uxAry0jC8sNYkzdmMBe6tKHOYe+BqJLiSPt7bsS3iKMChe5k2B2vvutIWvE/?=
 =?us-ascii?Q?7p8aPztG3GhaocRmfgDyfRDqDdd1H/jHmGBQo7e9Ne/LLyaKhJLHYsi4n+UX?=
 =?us-ascii?Q?9yHMc0uF1zM59knuoeJbv5wpPyvffSHpZGYw7EbYQjSfrpkxF1/TeKrKCesD?=
 =?us-ascii?Q?8QwhTWGGZM6TWh5hPRDunYfDEOr2+43DaPVSWwLcYEQzFLoH42ZX1jF/0IXK?=
 =?us-ascii?Q?a5hRI/kXOb4FnUYWRVzd9Ayd+gjY08hNCvvYj8D8cZ4/COGro4DtaA/13LjZ?=
 =?us-ascii?Q?jCrbIme2QGvkSGJBWR/p9Mxa30Oda5pk81876enHpmJoHVEIE9qhMvCMqYoW?=
 =?us-ascii?Q?fTbKG24Rp/8tgBH37KVSIyPTIcbi4SUSPS64cz8MKE4G4L6/9m7aYaesSbLd?=
 =?us-ascii?Q?KAnMiG85DDAk402iHQB08f+bSbkjHVx4BfAs7+gXMAQWM+tSWUuw6Vj+I0/R?=
 =?us-ascii?Q?PkF9Yl8sX91h/jCyNacfGC685zaCA4/L4jIeYbcVbNDrwIX6rheXZDxdBtJS?=
 =?us-ascii?Q?YfCX/KJ8ZRMgdAn/iGZoaK9krdY1zo7xlBVFUoPE0nkMzvJu0NM+HVmHERMO?=
 =?us-ascii?Q?47HIaj+i5FX3K33oZCl3f+BbCrgs/MdmUdbLeWknWizGzZQoMas8tg2BiqLI?=
 =?us-ascii?Q?U77GsRzPUi+ULCwNGmLG0V/B13XWERJ2rWGsZ67lBcdhEhLvLf/qeF1CHTyr?=
 =?us-ascii?Q?NECwCIS7IIU0wGYFa+0Y3IOOVLU0pm/4pYGwgz77ZVIjSwcfyIFwcTwbi4Pm?=
 =?us-ascii?Q?EtTp7ptev53oh7gA4xcNsjXoFLxloftPHRDpFX/5lsAoHfT3fC/8VzE9yMz8?=
 =?us-ascii?Q?ZLWfqqr4jEltOL9HvkU2Loor0tb0CceY4t5gYYnGuHNehi7uNSzDfaSymy67?=
 =?us-ascii?Q?Eo7S+iKAxMhum90lA/MdviQVwXgPhLPCBAJnGgAeim5cGF2Ruve2D6iSYPdr?=
 =?us-ascii?Q?X15zVJSiVboJ5hryigL/IUM88p06GKiXN1cnqPBVy/RDOHLfgx3zccO2YyzW?=
 =?us-ascii?Q?sh8oY/UQBdQiTBq2VC29W5yYGwMTO8qZ8oxFfJnrT4+cHnZLprmEBPlErXM1?=
 =?us-ascii?Q?l0aRn5DIUh08U3/cfzuniagg6RMhrGiT99+i4kXFfir0jHjaZJw5xqPVuHIg?=
 =?us-ascii?Q?EsvviOWTlSypJjxYEIfuC3TdaRdfBzHONFQtiC7T8bDV3kro8yqZB3w1kAkN?=
 =?us-ascii?Q?R6OtxxGhjZx09SHE9Ombf2/YUA9rUPT2TPY9f48j3cfdvT3lNtlh3aSVLGRe?=
 =?us-ascii?Q?PySelQBN+1f9wTfE6OWgLyjI+x4MMnIxr25GiXV38OLFie28L+XHaSDIOwol?=
 =?us-ascii?Q?penowsm8rxUYX0JWS/KP3BxEGMPp2rwN8BfBNCTZ78b6gGmhIkRokr9i6SmX?=
 =?us-ascii?Q?/n8wu3Co7r0sMZPgcrWmBzvHRjulKj5LeW797L6hgtKPUvPofGynk4O13Rrh?=
 =?us-ascii?Q?oqGWWmqYGTu9zDOTW4ZQmsIuRkmKpOzQpCyIBGT/ZLk/OKrWfOauuYt7BIMl?=
 =?us-ascii?Q?sA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <516A997238CB5144A8B87F538B31F919@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dae7b634-53a0-4cd5-4157-08dadc7f6acf
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2022 20:28:23.6958 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qj5j/6ihgFYhfqD9rN47KHSzGiZCeHqJ6FivLRnhkf5lE3VX06yrVShPUKXmgv17lYIqxevj5e82WJN6OlMTAm5+OA1DWtTyMo1KCeWtd70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4845
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=920 phishscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212120181
X-Proofpoint-GUID: qQos6l-lmj_X5_n-MXMtnURwblhqPFHt
X-Proofpoint-ORIG-GUID: qQos6l-lmj_X5_n-MXMtnURwblhqPFHt
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> On Dec 9, 2022, at 7:57 AM, John Levon <levon@movementarian.org> wrote:
>=20
> On Tue, Nov 08, 2022 at 03:13:32PM -0800, John Johnson wrote:
>=20
>> +/*
>> + * VFIO_USER_DEVICE_GET_INFO
>> + * imported from struct_device_info
>> + */
>> +typedef struct {
>> +    VFIOUserHdr hdr;
>> +    uint32_t argsz;
>> +    uint32_t flags;
>> +    uint32_t num_regions;
>> +    uint32_t num_irqs;
>> +    uint32_t cap_offset;
>> +} VFIOUserDeviceInfo;
>=20
> The server doesn't have or populate cap_offset - and this isn't in the pr=
otocol
> either.
>=20

	I can just delete it from VFIOUserDeviceInfo

					JJ



