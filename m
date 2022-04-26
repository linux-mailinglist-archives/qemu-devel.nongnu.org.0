Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16045510958
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:54:48 +0200 (CEST)
Received: from localhost ([::1]:52846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njRGo-0003du-Mo
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1njRFj-0002sp-VG
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 15:53:40 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:10516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1njRFg-00042y-GC
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 15:53:38 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23QICLB8015535;
 Tue, 26 Apr 2022 19:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=ZNxLjTscsR1o+E5RxOphXQFymzi/akqBlrFw+s7qAKg=;
 b=AjN8em6h+HLrVkIIOhTZKMXVMEaISXJWORtqt2NEl2cPCxYmhkUTY3+ZXgfQZAb2LaYE
 iHTW/AX6iTGbhrFqj3+iAm/7v/tkPx7fp0Atx6TgBRqtyZmquKEXfFnIMxSh/6PPJ+Dl
 65KSiKpZlqrR8L7Tgu/7MA3Nq7lFEH3EO4PMlFJWQEk58pQujWJ9HPDyZbQyAb2/CZ73
 CdyuG6RUNuaFoh29L6rAFLpw/mCHw0xhKdVRrVyr6JLhDjUi8d+3hBXGk61I8209a54Y
 SWG9C9z+S/eoQyn/fd9DN1ZrvULIQYMV6XSUqJepF+4xLFQ9KX2IQWSHwCPDU7JnFVBC 8Q== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmb9aq53q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Apr 2022 19:53:18 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23QJoW1M013074; Tue, 26 Apr 2022 19:53:16 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fp5yjvawk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Apr 2022 19:53:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbyCXR3F/qgG4QMS4F70UtH23JZsmyGkUo1fDI1GLzMlYWaoNCLieA9LjF1aMC+3xl3mmwOb84yySAfnExaaalJoNwgZZTp4S0TgBLiWavX01wwrDczENqIgWURkZ8rVYgYeWi4a+spBQ3o5F9HiSXDVJILhkYgKD8Ue3R6ADUXalno5FGOedCoZWJwjvZu+YQYTnChPn+/WyvIzK1E5WUi6WmsHYB7+mq9h28OiRnYfMO1vx2c40ZOZF9DbMAyvTA9Q9GYBR1WG7NmjQr0902kzeM+MB7vJ9MNfinguzyfxU3mYOawjGfhly2I22DruM1MFJfULmWw4o/wIHLPGiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNxLjTscsR1o+E5RxOphXQFymzi/akqBlrFw+s7qAKg=;
 b=RM6Bq89qYutcbO2HuFZNXX28CGqme+NWJFEPDgvPe7C+fQdtWJcE4OROsX6a6O0fikhYLEFws/jD95aDF1oc3g5WxzybBTFBMh6rtEplaKgpsg+VxhIHe1/rYMl/tHufFzXiDBLOuY8jEO3LR3ujFLmqaM3b74vb7exIKfdzik8jO9b90rgnP0mhKJ85j5al5Jrub2aywH5zux84xoFapuUs+pbAHyYTcYdnirjq76PYsDJFVX4v3dUI0cWEz30j8TZjO5yupJsHB3G/uIbSGnT6TCLIanDPnlwshJG5Uo9oHTsU5QLAZXhg8NtgVWIXMpGNRuh2QL6THS61LtaLjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNxLjTscsR1o+E5RxOphXQFymzi/akqBlrFw+s7qAKg=;
 b=yslz3DplTwjfoe7P2RpJTCPZ7FJBsD9KzEXc3KFk60IAX2VBE9UXajY3Wy2xYo9mG/oWks5zQZCUEMz101DR4jeheDAP7ckwHbbKd9/MN7Jf1aYv9AOKirBk5p32WW3KEi2U6Inv2bO5t3yl1AmAk+kn1yoCAQLbAncM+vsSBTk=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN6PR10MB1377.namprd10.prod.outlook.com (2603:10b6:404:43::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 19:53:14 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 19:53:14 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v8 13/17] vfio-user: handle DMA mappings
Thread-Topic: [PATCH v8 13/17] vfio-user: handle DMA mappings
Thread-Index: AQHYVC5kQy0YCRYTy0u/ggYMkZr9f60AbRSAgACADoCAAbkIAA==
Date: Tue, 26 Apr 2022 19:53:14 +0000
Message-ID: <80C58234-8E8A-4779-90FD-5F825B95F62A@oracle.com>
References: <cover.1650379269.git.jag.raman@oracle.com>
 <e786c5991ac8b5830624305acaec31d8072716ee.1650379269.git.jag.raman@oracle.com>
 <YmZwRzW/FW97l/tp@stefanha-x1.localdomain>
 <C75E641A-1654-440C-93BF-3AE223C60CFC@oracle.com>
In-Reply-To: <C75E641A-1654-440C-93BF-3AE223C60CFC@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5ec2b03-4cf1-4c10-d9aa-08da27be66a3
x-ms-traffictypediagnostic: BN6PR10MB1377:EE_
x-microsoft-antispam-prvs: <BN6PR10MB1377F086DD2E5D58F0706E2E90FB9@BN6PR10MB1377.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bDMfUNyM1YJHTX9pNf0YVI49R3x5Fx2VITqOyqIRBVC8m5rAkN1kq0sINCWRljRUq6kJmQxyONjU+hrdJ9gWLCZHJtGdDvHTIhU+6hDhMsTpohrJ1QuYpjbOVH5vBAdLGFJpfa9QQFSXnErpcAXX3nD/oE0wWoLj6Hifq8REI46E/AG1dA6Sk+M1hcPz9PaDCFjSv+/Eq56tYDFmnLzOYzYqMZOG42s63QdrDFcxAc3TDMGQCynkB0NvCxyYkTTgJHYcc9DtXhANW7Xqi2Ng/VfD24miwnql5B1QuKvjc0849SnHhBqDRCuJhEqgPB78AdIcGs8LvK6PAL9BHK1ba8huocfTJdIOvCe/t6AIaGGgHTM1xZiFf6DztvH0dlk1/4uaPUOKSNKwJ0myT0QQPYfIHLvlr1T99TpUPynCP4Hxv/75aeXRX/9rFLJwXlY/UOa+POgiv781ATtM+xFC5ZBQ8wSeOuwSLUkxiZoNazNoI7mjT7xX5rdNtuD2NUdVRHi9Tc+DF3GGw6U2z1nahL9uvU01JmhU2EJAD0E0xd00mvMMzefGniRUpRhctfI2WbaCajXKYOYbYhwY3uSS27IPCIupG3KTqgXWfN4a9t0CvoKvtYrJp7txConjleDVL2n30TylJBeUZX3UZw1VP4ZB1gxIOtrqKOHP+WH49dRRDYD1moTg7Fyj8K0+vDHb1sN0YstRcGjKBWPjm3t+Sw0ZqrySe/+SGrmkrY23jCc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8676002)(186003)(66476007)(66446008)(64756008)(66556008)(5660300002)(66946007)(4326008)(38100700002)(36756003)(38070700005)(6506007)(6512007)(6916009)(316002)(53546011)(76116006)(54906003)(122000001)(2616005)(86362001)(6486002)(33656002)(107886003)(7416002)(2906002)(71200400001)(8936002)(508600001)(44832011)(91956017)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1pTeFY1MVh5Z1VmSElxOFhJOGp3Nko5eFU1Mmo4MGxGK1JiVmQwQXhjV1NF?=
 =?utf-8?B?TlFjL3dRQm5hRlpKZmNnT3BGR1pzcmpjaW1ubWtpN1ZPK3BWakxGRENOUkV3?=
 =?utf-8?B?OXYyNUlaYmpYN3hrUmdTSU5oVW9KSGxhc1dEWFRZeGFFRHU2SGxVQzYvYkhT?=
 =?utf-8?B?MkYvb2xpY25TNVBXWVQzSk5iaHZ0dGFqa2RiNWxEaHdpdm5YNEtOdUFJMUxM?=
 =?utf-8?B?bit1bU9HS3BxM3ZDeWNGdVBVQzZUVFNROUNuNlhkdldxTndMOW1ocERhTW1B?=
 =?utf-8?B?US9yaytXeGhmN1Q5SUhWQkF6T2U5NHEyeEE3MEtCVDFHdmlHdFdUV0NaZXJh?=
 =?utf-8?B?UTZvSEU2WE1jUXhvRkFNbzc3RWVkRU5oTGxXQnpXdjhWRnMvaUhZVXpMaU9Y?=
 =?utf-8?B?UzI2WStZUlFDTlhTRFVvckgwTFpzQld6bTIrYXdjeFJVZFp0aVlHaDRUblJ3?=
 =?utf-8?B?cDc0ODByREI4eW9xZ0cwRzRMWGorVUMveUlwNld6dDZyU0VnWXFIM2djeDU4?=
 =?utf-8?B?am9qVTNjNVhzTHdwTm0xOG1BTC9DQXNma1FRL3praVRxaXRhZ1FrNnpTUzNX?=
 =?utf-8?B?b29xWmxmSmF5dFlmQ0tkWmZWeWJubmpRSm9HdU9WMEdtZjNsQVppeDJidEJV?=
 =?utf-8?B?Z0l5M1Q4WEx4SHJQb1AveFIvN3AwRTFDV2lGSEx6clExdHFOd3JqSFdVOXcw?=
 =?utf-8?B?MW5vZlFWK2h6NWVZaUwwdDBmV3JuSGVEQzVlT2RFSjJub1VZdmJrZHVUUGRw?=
 =?utf-8?B?Tk5EaFZlQk9UT2gxR3V2VkNOQ3VNd0F1Vjc4c3BzV1pLLyt2dU9DZ3RQSlJt?=
 =?utf-8?B?RFAzcU16MmJqZ1NpbmR3Q2gvM0Y4Z2VHZmluZm9aZVlrendKQkFMakhoczBN?=
 =?utf-8?B?QmppcWM2MFhnTkVKRDRxZ29wQW45Z21PT1lqQlNWRDhtTVBLZzFYTHYxVFh6?=
 =?utf-8?B?bFlyY3pZRmdrS1B3U2NmTnJlc1p4RFdnN04vVDdaV1JveUxXdXNXZjlOOEpU?=
 =?utf-8?B?aUxPRGtCV1JDYUZ4SU9vNVk0ZERTSk9kMEJTUnpPWVQvZ0VVOHRWUDJZUHIy?=
 =?utf-8?B?bW5SZ0dwL3JRRTlFeGE1WU81Y3ZQcEpaemhzMlRPcEhUcGUxaHZpY0JnR1ZM?=
 =?utf-8?B?WTVQQjBVM0tnWERDSjJzM2hlcDhLa29hVlJnYlB1TExlVHVTNnI0UGlhQlNp?=
 =?utf-8?B?R2cxZkNWRmQzQURzVHZ0QlZFNzhvNXA1eS9CbzNjSjhaMlJpN00vWVI2T0Ro?=
 =?utf-8?B?RG8yZ2VFbzlKZzE2aUlUZVhDZVgzME1PeEpLWDgzWURqZjYwRElNYk4reXRn?=
 =?utf-8?B?dTIwZWNwUUFFT3NQSFFEYjlaQzZDcHQ5L0JGSnZhSXpid1JPc0hrTml6SnU5?=
 =?utf-8?B?ajhTNURwcUpOcjRHeFlMSENqTm1hSktkMWJEK0dSNEEwUGJMZjZ3U1NXUklW?=
 =?utf-8?B?TVAyT0VDN0ZuTDlUMnJlRUVUMXZXbStBOWpzaHM4eHZ4TmVtM3dJUEYzR1JF?=
 =?utf-8?B?WmhiN2ZmL0k1b1JqeVNVSWpXTWxWdTBqNHdtYWgzc21yNGhxOUNubnVuc3RL?=
 =?utf-8?B?WUhFTlJ0akhpa2NuckNnbnNrdk01WmU2VWhmSTVPVVQrR1FNR3U0YkErbUpv?=
 =?utf-8?B?RTNXQVhCd2JpUVg1cW94LzlsOWNMYk9nS2R4MWtwbXNwQXBEdHQzVlp4c3ZT?=
 =?utf-8?B?aHpJRzVteFE1SHZvckw4Tnd2RTJuM0dPdlNRTHIxRXhjM3dhczNkUW9pdDFS?=
 =?utf-8?B?Y0xTc0JvNmptUUJ3UjZxMHB2NTJHN25ydXE0OGpsaDRuYVVtMjhNaStpNFdY?=
 =?utf-8?B?SEI0dEJZZXVUTkxwN214Q1huR1UybkY1NHUyRTFNS3pBUlh2OGxmdUxVcGtH?=
 =?utf-8?B?UGx5WkVqUFdla2ZVbkxDWS9ZVlI3WGpFZEhNQVFWOEwxVEZCWTN2eVBNaWNq?=
 =?utf-8?B?ZGhJVk83RWY3UW1sdnpicHY3NDlRVE4rQ2l6NUxSeU9pS2gwUnJVSFdlUTdv?=
 =?utf-8?B?TitUSS9uNVQ0M1pqSnJyTDhSQWp1WUhaUGdMeithVGpLRG5yR1IxNXlMenVC?=
 =?utf-8?B?RjdhZnlUWkx3Vk0zbkpPYjdLZ3Bjbkk2K0JYc1Rob3c2d29OanRMWWlUWFdS?=
 =?utf-8?B?WFZFUVpBV1d4K285bGhzR3prb2g3N1k4T3BEREJtbTZOVkNmeEsxbWV2bFVN?=
 =?utf-8?B?a3VicGtIZStGZEkrVEtqdmhjQk9aSUFKSGhOUUxtb1NROG5BczJScmRBOStw?=
 =?utf-8?B?MnhCcWZhOHp3TS83WFg4MHM1cEtYV1NDNXpTbGpOZEpSOVZyV21MTnB6R0NK?=
 =?utf-8?B?bmFrdjJySjhta25EYWoxSE9YSXpmYldObG5kRjBJRDF5ZnRwZXNMT1ZlbXo4?=
 =?utf-8?Q?5NBRx8o41HXTfuMmdvq4u7monNk6XPVt9sE0n?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <35A5EC8B877C1240826FB569266BD57D@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ec2b03-4cf1-4c10-d9aa-08da27be66a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2022 19:53:14.5473 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RjNwirmq73aHIuSeKuPE5gdapUM/IR/7Dr+8z/pfn0puTRNNGSP2WO0hbmsytZc34xOMaQh8S4jfGMueFI+d5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1377
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-26_06:2022-04-26,
 2022-04-26 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204260126
X-Proofpoint-ORIG-GUID: vUoLh6SLQEHAVPJJHjSE9n07utOlfQrp
X-Proofpoint-GUID: vUoLh6SLQEHAVPJJHjSE9n07utOlfQrp
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
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gQXByIDI1LCAyMDIyLCBhdCAxOjM0IFBNLCBKYWcgUmFtYW4gPGphZy5yYW1hbkBv
cmFjbGUuY29tPiB3cm90ZToNCj4gDQo+IA0KPiANCj4+IE9uIEFwciAyNSwgMjAyMiwgYXQgNTo1
NiBBTSwgU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPiB3cm90ZToNCj4+IA0K
Pj4gT24gVHVlLCBBcHIgMTksIDIwMjIgYXQgMDQ6NDQ6MThQTSAtMDQwMCwgSmFnYW5uYXRoYW4g
UmFtYW4gd3JvdGU6DQo+Pj4gK3N0YXRpYyB2b2lkIGRtYV91bnJlZ2lzdGVyKHZmdV9jdHhfdCAq
dmZ1X2N0eCwgdmZ1X2RtYV9pbmZvX3QgKmluZm8pDQo+Pj4gK3sNCj4+PiArIFZmdU9iamVjdCAq
byA9IHZmdV9nZXRfcHJpdmF0ZSh2ZnVfY3R4KTsNCj4+PiArIEFkZHJlc3NTcGFjZSAqZG1hX2Fz
ID0gTlVMTDsNCj4+PiArIE1lbW9yeVJlZ2lvbiAqbXIgPSBOVUxMOw0KPj4+ICsgcmFtX2FkZHJf
dCBvZmZzZXQ7DQo+Pj4gKw0KPj4+ICsgbXIgPSBtZW1vcnlfcmVnaW9uX2Zyb21faG9zdChpbmZv
LT52YWRkciwgJm9mZnNldCk7DQo+Pj4gKyBpZiAoIW1yKSB7DQo+Pj4gKyByZXR1cm47DQo+Pj4g
KyB9DQo+Pj4gKw0KPj4+ICsgZG1hX2FzID0gcGNpX2RldmljZV9pb21tdV9hZGRyZXNzX3NwYWNl
KG8tPnBjaV9kZXYpOw0KPj4+ICsNCj4+PiArIG1lbW9yeV9yZWdpb25fZGVsX3N1YnJlZ2lvbihk
bWFfYXMtPnJvb3QsIG1yKTsNCj4+PiArDQo+Pj4gKyBvYmplY3RfdW5wYXJlbnQoKE9CSkVDVCht
cikpKTsNCj4+IA0KPj4gV2hlcmUgaXMgb2JqLT5wYXJlbnQgc2V0Pw0KPiANCj4gWWVhaCwgaXQg
c2hvdWxkIGJlIG9iamVjdF91bnJlZigpLg0KDQpJIHRoaW5rIG9iamVjdF91bnBhcmVudCgpIGlz
IHRoZSBhcHByb3ByaWF0ZSB3YXkgdG8gZmluYWxpemUgdGhlDQpNZW1vcnlSZWdpb24gaW4gdGhp
cyBjYXNlLg0KDQrigJhtcuKAmSBpcyBhbiBvd25lci1sZXNzIE1lbW9yeVJlZ2lvbiBjcmVhdGVk
IGJ5IGRtYV9yZWdpc3RlcigpLiBvd25lci1sZXNzDQpNZW1vcnlSZWdpb25zIGluaXRpYWxpemVk
IHVzaW5nIG1lbW9yeV9yZWdpb25faW5pdCogZnVuY3Rpb25zIGFyZSBjaGlsZHJlbg0Kb2YgdGhl
IOKAnC91bmF0dGFjaGVk4oCdIG9iamVjdC4NCg0KVGhlIHBhcmVudCBpcyBzZXQgYnkgZG1hX3Jl
Z2lzdGVyKCkgLT4gbWVtb3J5X3JlZ2lvbl9pbml0X3JhbV9wdHIoKSAtPg0KbWVtb3J5X3JlZ2lv
bl9pbml0KCkgLT4gbWVtb3J5X3JlZ2lvbl9kb19pbml0KCkgLT4NCm9iamVjdF9wcm9wZXJ0eV9h
ZGRfY2hpbGQoKSAtPiBvYmplY3RfcHJvcGVydHlfdHJ5X2FkZF9jaGlsZCgpLg0KDQpUaGFuayB5
b3UhDQotLQ0KSmFnDQoNCj4gDQo+IFRoYW5rIHlvdSENCj4gLS0NCj4gSmFnDQo+IA0KPj4gDQo+
PiBJZiBpdCBpcyBub3Qgc2V0IHRoZW4gdGhpcyBjYWxsIGlzIGEgbm9wIGFuZCBtciBpcyBub3Qg
ZnJlZWQ6DQo+PiANCj4+IHZvaWQgb2JqZWN0X3VucGFyZW50KE9iamVjdCAqb2JqKQ0KPj4gew0K
Pj4gaWYgKG9iai0+cGFyZW50KSB7DQo+PiBvYmplY3RfcHJvcGVydHlfZGVsX2NoaWxkKG9iai0+
cGFyZW50LCBvYmopOw0KPj4gfQ0KPj4gfQ0KDQo=

