Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C28CB64A8BC
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 21:32:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4pSy-0002ot-Gl; Mon, 12 Dec 2022 15:32:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1p4pSp-0002oC-K5
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 15:31:51 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1p4pSo-0003Qp-1I
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 15:31:51 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCGwoP7029975; Mon, 12 Dec 2022 20:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=Of4auNtjk/kAtoLbkNpOmfitsL6unIdHKeYmiMt1eN8=;
 b=ozxkGCDGMGCX4qVDfTpPmvmMkAqB1yZo2rDsopJj9DASUt3qiBn7AGBvXXksntTCcx6J
 7V6/AffDvKvTdHyzCv442LWPZE/CprcgImUXIet2D7B9Yh7aHl0WxT1njlNeH5m4z+lX
 LYX6QnRko7c9C7P01RxLPXdUHHXi1l4JPPiVrPrmE4N3Ih/QDVIo7QR+ZRoC/ryUIeW4
 w90JD8UHQPL9otAvoGIoBH9VrLjROqvvejTsWkq0UC9RaM5ZOGiHZJ7X+vUfY04ats/h
 bicYz2RZ1zfqC4SJoTRSQ3VTRxnrqjLdSLdxOhvRD3K/NjO8w1iF+ilEldux4gZC5ueU wA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3mcj093sya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 20:31:46 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2BCJ3AUm034700; Mon, 12 Dec 2022 20:31:45 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3mcgj4khs5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 20:31:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbz+lPZiACf/gi1b9fQ0gzmh3U13l0dUSzQBgJrn+SFR8IQu6u7ljiVRRUFXWYUKRCuIlanMjZBm5sWT8eeOUT8/KPhR3VoAPy5SiDixSLuXWt0QHZ84kFDfdn4rNbKNwMntnvsqUCbMLE13bBYgkplVmnCwQSfwl65R2cYaR+HUY2kIaMl2iLUz07y2RWtCoNHAqZ6wfqZQ98MIDFhY6tVK6tK9/0xCkD94cnnMXcuw/3/AvluMHC4bO8s9sjlGdKxU/8O5TVGv/dLe2T8HP5+dxb02GQerUD9pv+gagZ9dmlN1cuQTtmtjTKeq1Kx1nTfVMNQbznoEwRp4+EuGdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Of4auNtjk/kAtoLbkNpOmfitsL6unIdHKeYmiMt1eN8=;
 b=RzOfl8HxczLWKbdM3/zhJr2hjB1LdD5qRGBDpkMznrJoJo8L9vjqsXMnMXOZ9iROXO3sD8aPkWU3xq8lMHmUOOS9r3dHnb0yKE+mXdu2O4t5M+Z8ItC98sHtgiAYho38VaciydakJrVQQQllyPZlX5r+xaROhwCBDbBI8PUvBYw/0gaQpMZvLukcVgmkrI5QBkSduvEtBRUCk4qDRBv7lSlB1f0IQgFrC38E3awyd9+DpY0esPIs+a/6m3WJvTGZNHusx7WV0We5KOTDWNf7A8r2PUqbMfAJjgG6csoDw6YV3gxIFeZqMAgN/QreGw8O6+QkyltLjlovVwu9/5iUUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Of4auNtjk/kAtoLbkNpOmfitsL6unIdHKeYmiMt1eN8=;
 b=R+eK5idISrllz8A41cWizn8A8xM8jC1E6rlbq6j5Y3P5a0amj4AYtoWVB9yXd6mD7jm6jDs2TLYf5D1FdEqhJdd+8jmK//5aCKKPsauApe2dCff94zHLz6GQFJr0nbxkySqNodzz6KdmdazsI2PMoQBC/bBlvVuHBa6ARDIl9PE=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by IA0PR10MB6745.namprd10.prod.outlook.com (2603:10b6:208:43f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 20:31:43 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::4636:bc4:6c76:2486]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::4636:bc4:6c76:2486%4]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 20:31:43 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: John Levon <levon@movementarian.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v1 19/24] vfio-user: secure DMA support
Thread-Topic: [PATCH v1 19/24] vfio-user: secure DMA support
Thread-Index: AQHY86IcL1n0TOK0j0GRqvpORuG7la5mCV0AgATg2wA=
Date: Mon, 12 Dec 2022 20:31:43 +0000
Message-ID: <8B303F17-1D05-464F-BB78-1FF6CD74B81F@oracle.com>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <f01a4df56f967ab0ecb32087165c3cbd7167f384.1667542066.git.john.g.johnson@oracle.com>
 <Y5N4ELL9D/TdTrkp@movementarian.org>
In-Reply-To: <Y5N4ELL9D/TdTrkp@movementarian.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR10MB3255:EE_|IA0PR10MB6745:EE_
x-ms-office365-filtering-correlation-id: cb94b087-84d9-4287-94ca-08dadc7fe1d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iwJn2r5xX1GNRa68J/NO7OwseoURhnQiNT75f1TZDvdqbrMUHneXXfWIrTyP/Ig0g4HCU7+iE7PvhQQLqgmM6yryapzYycJIKMdrlBIPf8cv5AGblaFzgt9S4Af4cG2Xrkr7ugDuwESHItsRouX4DYbL6Zfe0r7x3Xq2hhYd8Q8dYdkeufEqH+qpPooBF5qhEf5IWJpbJgrCZ2WfopTDAIgwCoENjRvg7kMFjo84iKbOqZGMQYkHAjbnzDJI0kw8/6PHlAbbcFOQYgeCUPz4a4yHGRhypXby/k2tOTQpcZ+QqELKr/Emj+v2d3rEdF3RvZcDv+T+iJYbgEYrP+OW7CwbwakquUZenSJc3lRxOcL5j629+rmlNAb6HkT+ajE4bkTIM/RYfVi2xFPT3+TR/V65IGOULFCjfkiYFRDXuYAFHQndbYWmMQd197qeyoOUAm+Df8hhD1D684znGo3BuhAOMMOekuLSmP/q7+kzwbcEc5/RqGJkoZbpNDWIMC52nxsbeDGTsYt85/wB66dwa0lelLqBMi5Wz8C8wt31rQv1uhQ0pb8cX6E224iRE6UPlheKF739WFhEMZ1jnt+w2XoAiPNLR/54TWhQFnhZYJoABE3wrCmTMP447dy0K1i4So3/Ih+WmJy0zs8i5X7ugTIB2KsCkqVAeL55E4fP07b7CfH4UZNUDpCjGOcf19WCD1V/l7zlDhR/5JaRsoCg+bjRyK+KrPc+gb2I/NhoxAE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(39860400002)(396003)(346002)(376002)(451199015)(36756003)(86362001)(8676002)(2906002)(33656002)(83380400001)(186003)(4744005)(6916009)(6486002)(478600001)(26005)(41300700001)(71200400001)(6512007)(6506007)(53546011)(122000001)(38100700002)(66946007)(5660300002)(38070700005)(316002)(66446008)(66556008)(76116006)(8936002)(2616005)(64756008)(4326008)(66476007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2rgO++IqLzU8ODi91A5kyJHcC8Dsc3d7wkHZpjIA8H5qTTq0NfPvOpBKV194?=
 =?us-ascii?Q?AqdXT+xFhsFaVlWyVwvb3TPbgEAZHMurzcBQUi4FNjCoZ2q+oZPTCC3cGY3s?=
 =?us-ascii?Q?6m7TH4i+UWBT6QLWcEzv3MUn9XPvszYZ1b/fcITz2OYcgHpmLuwRh3i8tljv?=
 =?us-ascii?Q?2pRzQn71wlEFn77xXvJxjPA/5lFhutdaVZe0AGyBnSZzRBupH+A8aGwedeu1?=
 =?us-ascii?Q?5urZSU77s+lTiwV2PJY2LOQMklzBOhvIgWCwaBHvsQ+kJ5t9x5HINouRDsEa?=
 =?us-ascii?Q?KUnoiaD/xfca93jxonOCZi1s4J9sx4TwKpRlpG0IX8aDu8noPkMMYLKeor9S?=
 =?us-ascii?Q?LIWH/GQ6V3+bJTaPLSHQ3N0vhkOK/Kki1NaYXa0Z5AZ+yKA4d7oXvR8sKJUo?=
 =?us-ascii?Q?yAgPPBGkkKwqaazy8Az+6i1WYqO+rc+3YT9htR0SfXINBTdlYmhddT/ga8/U?=
 =?us-ascii?Q?KHm6MTiqXuJ9g0CW3WOzfOory2/1OAUC+tKBPGZES3yfgK74YFA1puA0b5vc?=
 =?us-ascii?Q?fqNrUJgkY8R4GrjbFf4K2Mzdhk1oxIqCXzMcsts6C2Fpfsr9cJkRDn1/hEAI?=
 =?us-ascii?Q?9aRpYfYfEimJzzx762TdlcHHueMW438qFUqHFFT5BE6NsGdvyVdwHQcuVl6H?=
 =?us-ascii?Q?zHJky7jPbxmB4Ykpatog3gRSSMQqp/FLGvYpmnNyN7k8jmFpzYEp5xNF69CS?=
 =?us-ascii?Q?kpi5nzvUoxcm/tKnivsISIdnjQ3R4XkeKJXfQPW4qAWNcrOds1+8V567Mlvz?=
 =?us-ascii?Q?1Kbae1BF6qSt6mvveaMyzoDX9tVQ3UBrxjiDuMrTUVxY62fLqSv8JsB3ics8?=
 =?us-ascii?Q?Jf8N1LCNoKsrnvNOX83VyBIRjfV+NK91CtRGGy6SB1gtc/59dk/K863AQ5+5?=
 =?us-ascii?Q?Oj65XQOn5e+Vko1o5YxZhUgU4GuKtA8Rc4Pw69swhpJX1MsOQhVE1twE+lCh?=
 =?us-ascii?Q?RUxvCyNN9wXKWszRHivmMtjznYDMhUHSPIAlBVXP2mIpJJ2lVn49Y0m2BLFG?=
 =?us-ascii?Q?9iDOdfk0AeS/Htbb+qEOljvY05hAbpQmqbo97rG/FB0VlRV2HE4yalHga4u1?=
 =?us-ascii?Q?GG//Wp3cdlNoFcqxtCWVNnlqU316XKtrx2spRJoBVZOTi+aTO7XK36nZuI7E?=
 =?us-ascii?Q?JDFoZrb1a3503d8Ftaajpzp4t8Hpy3VSNL9WTJmWjznNxZyAsgiTNUJE9V98?=
 =?us-ascii?Q?tJ20uDqG/PCPFYjlT6jGAhreA8QpPlfyiajaenLBG6pBQSn08Y0dESwbb5Ph?=
 =?us-ascii?Q?9x6ydVRJ+yUtDAV06Og8hhw9nl0CZmTRCmI6K+H5TEoeGwZWFz0ZBAodt81s?=
 =?us-ascii?Q?PslLJtBOk60Ggvw5GhVq/4Ea/+0S2I+sj9rXmw0zvD1wDX1Nkbhiz41uV1Fu?=
 =?us-ascii?Q?ijxXom7vCIpLPAuiqDqcVMkyyQA+MjHwL/JIDR0uQE8fV3Vc8wXT8+lCIpp4?=
 =?us-ascii?Q?YYLeo3o62+ZlNK6YOzvc8nx1wqcBQhOl27nem0lpeyVv6dZIGa/fibH1yp42?=
 =?us-ascii?Q?IPfP6qpWr3vnxQyKImeFYJ20tVH2RZVxz8YgtahTTYSaZkbyPkKCrFnXupuI?=
 =?us-ascii?Q?gUg0VhKmj5tyrrbzU9H1V5KXhoGywQO/QCQY7ssDfX0rsAyli4mMtXDhSP5O?=
 =?us-ascii?Q?Lg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2C37812D16224548AD1459A66AF23014@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb94b087-84d9-4287-94ca-08dadc7fe1d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2022 20:31:43.4018 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DYrNG5UJ/1m0ajKt8J+TbK6cwIP3L++xUPZSKWEeqm3ItG/Dx3GG7IT6uDn3M+TklDdfiHUuahoeM2+Alyhc/C9ovdjH9Jru2kbm/PwIzvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6745
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 mlxscore=0
 adultscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212120181
X-Proofpoint-ORIG-GUID: YxpW2vn79ncR3mtimuJM8GQTkGOg2HH9
X-Proofpoint-GUID: YxpW2vn79ncR3mtimuJM8GQTkGOg2HH9
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> On Dec 9, 2022, at 10:01 AM, John Levon <levon@movementarian.org> wrote:
>=20
> On Tue, Nov 08, 2022 at 03:13:41PM -0800, John Johnson wrote:
>=20
>> Secure DMA forces the remote process to use DMA r/w messages
>> instead of directly mapping guest memeory.
>=20
> I don't really get why this is called "secure" - shouldn't have an option=
 name
> more closely resembling what it actually does?
>=20

	The option was added to address a security concern if the server has
mmap() access to guest memory.  I can re-name it.

								JJ


