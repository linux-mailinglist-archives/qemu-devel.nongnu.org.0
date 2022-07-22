Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7667557DA40
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 08:28:16 +0200 (CEST)
Received: from localhost ([::1]:55484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEm90-0005js-T6
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 02:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1oEm4e-000474-HY
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 02:23:44 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:15896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1oEm4a-0004Wi-VA
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 02:23:44 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26M1XqVn004156;
 Fri, 22 Jul 2022 06:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=v95spW75e5kXwqjfm47D3LD9/1s83zuWdStbyN1j40M=;
 b=wrJxynV0kVwKA4DEyROhL+a68QaBGrt1uCEspB9NJxoNvm9tHRSpF8vbd4Bm8rWjV//F
 SNLrGWVAqqInGsxFnSgOeQi5T3E06+Uc7jfsIUWu6jRzxxhMsOJEM9aTyGWp5dnS0ky8
 JTtaCqNwYfgzq0sgk/G9/dR9oOEhGRvQ4nm0wqLvlK+qX9GYfg9pSJI/6ByPgWK4yfDD
 n3+tlu5CCeIyonQ8c9PnmjfVxgSJRbR1rNLNMDqEXadziiJgBWInAZDM3ebWaKq+VnRM
 dfF6vnmhtLkfIMmEV+Fq4XM9/afaZcRjPL0wAG6E+YZ7LHVKLHgQ0b6+k71WwJmO7q+4 zg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbnvtpj4x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jul 2022 06:23:35 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26M3nXUk016506; Fri, 22 Jul 2022 06:23:34 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hc1eqcqd0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jul 2022 06:23:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSKLwgTEFeuMzshWnJfbYTWq4fogdMzOrQ7EEH6uDjh9PuMD0jP/jEg0z/qbhje4tCSKcv2zPQYRv/iWwTejHtN4KJQtf3nxPz6cEi56Nh9VlBE0EY2qRkmqzzmekxZN922zG/seOix+rHjp9WrbvqKBdoUFqMeItZYQcUGJWKxN9hj+PTzi2m3OnFPBjYTVDAoCsBlcUi2wnw5fMYG8AV6sUxjtuxOvp3z+wgBPOknzsfr9y47nOeuP2bk7gFzrF8PqxDl7BR4RwK2+04TyRUMMxPpaYJeH/GvkTBjPhtPq3LQbUiMG9tqC7iADUoSfWzQXJnqi8XsbBKfLsJyE0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v95spW75e5kXwqjfm47D3LD9/1s83zuWdStbyN1j40M=;
 b=bec3joW6/IAZUUJCyd6H/KemXBCgpJGBlAunpeAppMY42Cbpy+1EDBXcJoh0IIrhFWEQ6Ke1mX1vwOqpU5IYoBQJG/JM0vgZx/Hwd8EzQ4ymIvBMn05XANhgOk/AFitF1xrlOYp/3FQMsQ3gSM7FlWy9DeaMvs42BnoeQLqni8kd0i7xcauXvYXoR4Gymy4L3VU5e1UuoHyYyGON61OaGxcKutO3xKpQCv8Lde4H5NZ4k526XMJytrX1NW6b4tGMM6T3QL08rqEc0c2y3Mq0bEh4GxiTM5rMunuMIftdV+CfGPi/VRMcrWTlUZKqJ16os62O/0AXHMshLj1BWZWPKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v95spW75e5kXwqjfm47D3LD9/1s83zuWdStbyN1j40M=;
 b=JLeG6sHDEs6NkTqJ6Rx7wlfqjol6Wf6pk6G4VlyaSLIN6zWxahM/dyOK7GcgiXwmTYv7Jf27kxNk757/07bWMM2udhFC0I3nuQVhub8Mp71JEwk8MfrUDKzC42gPznGMR4CKKumM7HdiJjE/VcSjBJRiz1IkkvN+vF4gGvJVU9I=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by CO1PR10MB5506.namprd10.prod.outlook.com (2603:10b6:303:161::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Fri, 22 Jul
 2022 06:23:32 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::c988:4363:d60f:ee91]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::c988:4363:d60f:ee91%7]) with mapi id 15.20.5438.023; Fri, 22 Jul 2022
 06:23:32 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
CC: QEMU Devel Mailing List <qemu-devel@nongnu.org>
Subject: Re: [RFC v4 01/21] vfio-user: introduce vfio-user protocol
 specification
Thread-Topic: [RFC v4 01/21] vfio-user: introduce vfio-user protocol
 specification
Thread-Index: AQHYBowpN0q6N125FE+bUIMVtVRQyKy3/rGAgNMbVwA=
Date: Fri, 22 Jul 2022 06:23:32 +0000
Message-ID: <172B1117-7361-4EEE-9711-16626824BC0E@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
 <a9b696ca38ee2329e371c28bcaa2921cac2a48a2.1641584316.git.john.g.johnson@oracle.com>
 <20220309153453.25eee9dd.alex.williamson@redhat.com>
In-Reply-To: <20220309153453.25eee9dd.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6fa94d8d-526b-4884-a7d1-08da6baab37c
x-ms-traffictypediagnostic: CO1PR10MB5506:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9xNmeZzT1Cc+b0M4vddGSpYE3E3EwVEgTXy1XPT3NG6yWVdMiWabTsGVfn1GWQ2Cc+xysA0CjIT1dOnPHOpP6QqBWPFiOpELpq/a3DrRI6gSEEBvm/OgOzyPC0qdZGG83JOeV9JhwqRWornYIJe//Hs2lwVTw2AWJLagk+qCiCXjO9/P+1m++aD1vdaz8vh3JX+wuXPeY5TQX/2xO17Zi9w2WUrNJkRZ3IaPn7ROm1X/YjO6LzBSwbMZ1NMsoYRseM36OWWN67tWNf8KiFb+rYEIc5d4z23O8foR/dnl4RseT+RgfzEANGNuqFUD42+DVt/KELfR7Rxi874I0cwgp143geLBcPczDemPVP2XYJvbnUqLK/W8DSdjUt1IGYz5xSWK7MAHMsCbON4kCE/eT6IfavoVqmO1wivUD7R7W+alq0z3Z653CeNrqrAGPBnA+3FPgyw7X94f1tsZ/YIxkzHHrz1ItjzFJURxpRZhYkfkPkC85toETD9zdwSh30puH6S/VVeiF5kQDviCr6ZCSSSZFheqLb/JylLvC5QUZ6ETDKhI+FZbz90tIJEiG+G/SA6iJy1YVodkRd0Wj6iPpKFNiZQqbQhcEoq/N/an2EgR2YI0xnJRRql7xvxTksbB/ErDmxBUK2Cq6F+5JOkKMnGxNfYF9kFbEgT3Hf25Xo8tqvJdgqlunM4jNG57DomRE8nWG8Pg/tpXq0S0QS1BvtDn3ds795al1J1auyJcOLAGUyZkl33fL8pgRcvrNw1uehahAsFeAj2J16u7gyj1yTNuPKSFVvQQ+bxmSdog0IzUbnbDT3eK90IsTSnmMrfHj+Y+47+ltkoAzy5QnCO0dH8YTBl2h/Vkj5DWdpx71VA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(136003)(366004)(396003)(346002)(39860400002)(5660300002)(8936002)(478600001)(38070700005)(6916009)(41300700001)(36756003)(2616005)(316002)(186003)(26005)(2906002)(6486002)(966005)(6506007)(71200400001)(6512007)(86362001)(33656002)(122000001)(8676002)(66946007)(64756008)(76116006)(53546011)(4326008)(66556008)(66446008)(38100700002)(66476007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MDMwak9ocW9BTnRtcnZhS2kzZDNRL2FoK05FUEhrbW9Ta3NJdzlxWjNIQml5?=
 =?utf-8?B?ekV5WEF0UlU0aXB5Vnd6NGN5SVpQN3lzMVZOamY2QkExWWg2dWg4ODZXYUpp?=
 =?utf-8?B?YW1Tdi9yM2NNK2NZWGRLUElUMGFVdHpXWitmTVV4KzJVYjgxUWtvSC9FKy9n?=
 =?utf-8?B?MVpGYXZlU1NZTXg3L0N1dnkwMURVbVBnbnIxZmZBdmtnb25FL3kzTlA3NURm?=
 =?utf-8?B?a1ZGUDBtY0h3cENwMTZMaXRxd0NBY3ZRMVAvYmt1a3BYRUZQcXRQWS9Wc1lq?=
 =?utf-8?B?MVBpOFZiaWp4NC9oVW9XMDhpWm5HNkp4TzhBNjdhVWRnY0dSZGZhQjZTbHZy?=
 =?utf-8?B?WEd6Zmd3Q1ZYaThxV3d0WDRUZ0RoZC8vY1ZBNmFxLzE2UVdpQkxFZTYzM2FX?=
 =?utf-8?B?a2tXcVNXM25NbVpxVWNMOEI3MTdXOXJGYmh3eFdJYXVkQjVybWZFSk94R2s3?=
 =?utf-8?B?U3dCTmtpanNXS3d6b056QjBiVmQ4UUk0L0ltNDVYWG9FZW9Da2d4WGYxUEZY?=
 =?utf-8?B?WUovZTNqRzE2WXZSR3ExVEo5Z3J0TGk3dy8xY3dIV21lS28zS29DMVAxVVpr?=
 =?utf-8?B?dXozTkJiN21xV0xaNWtjZ3dHcWFTTG03Y0pFQU8vbEVoY0d0T0RaL1M0cnFO?=
 =?utf-8?B?N1I5Y2hsRHVtN3R4eHE5N29zTUpUSlJOVW9NbWthMlhhSWhjOFkybVUwYUhh?=
 =?utf-8?B?bUxLYXJUaXZSQ29zY2JIS3RrS1Y3WVhQSHgyMThCWENTRFpkWkNZUzBZRHNv?=
 =?utf-8?B?VnZyYWZxczVzUkh4SUl2Wm54US93dWVkcHJIZVJoaTcrV2ZzUUg5WEFPY0N2?=
 =?utf-8?B?L2xwQXlkeVJZMXRCYjZKWDloUFE4ei9FNHlqWHdSQ0NoTFpzVVdjT3JXbm1x?=
 =?utf-8?B?bHFBUTdXVU9jeFpFYnd2TWl2cG9pdnErLytWUkNreUFXNCsyMU85enVlNDNR?=
 =?utf-8?B?RDlab2gwTFJocG9SMVdsWWl5T05VbFZmbVlIMXJweFMrM2FqdnFFVW1PNkdz?=
 =?utf-8?B?MkpmV1YzY2ZyNmpEZmY3bTFydzRmYUdyZWJseEJnKzMvekY0SGgrd1JibFNZ?=
 =?utf-8?B?eDRkb2FkWWFKVkNEQmM1d3lQRDBYNFFPMWt2bU1lZGFRMkhWSCtZQldRRnl6?=
 =?utf-8?B?cGZWeUhYdzRrM0xqWnRxWCtiTFVhUDZyd2wrS25JVDJLOVJlMmNNNTdpZVo5?=
 =?utf-8?B?WDlUUktPRHhnakNtSnlDaDhlenUvMGpKc292dExaRVlWSkxObUdwa1J6Y0FG?=
 =?utf-8?B?UWZYMUxMVDVzUThKRWV4MHJJM3BtYi9xWjg4U0tvOWdxKytvRk1kM3ViaHpN?=
 =?utf-8?B?dTNxWnR5WDRiWEM3UEZhZDQyNDhCZzlXODNSUFN4Mk5FVkVsdnkwZGczOEgy?=
 =?utf-8?B?MzlXN2xqSk1sQ3ZuTFR4Wk1vUktOZ01KbklubEJ6Yk8va1pNdEJsbEtUNTFN?=
 =?utf-8?B?S0ZoeWd3L1ZXYUp2R2twYzVFcHFBOVhSUUQxYUpaTHJyQ045bVZJY0ZZMUVQ?=
 =?utf-8?B?WG90MWIvdkpMREhVbnJ0b1dvdG9mVXRoK1M5RUd3OStoYWZWNXpVdHdUaDRa?=
 =?utf-8?B?M05tYjJwQmZ4cGQ4eU9KeVdKQ0FWeUFBb2txWEtxWlpDTTlDazFUMmRwL0tT?=
 =?utf-8?B?dWNmU3orVCtTMTh1RWNIUUJRdzJ6UHV1RU9UczdDSG95Q0pJYlZ6WHgxTlQw?=
 =?utf-8?B?Zy9VcjloZUlCTXFGNHZKM0prUEZBYUtJamJFcDJMMEw5Tmp3THZHaHdVU2N1?=
 =?utf-8?B?S1hnZjl2bk5NQ0VpRnRSVkxPUVRiMzd5Z0x4U1JaRzJZRHFrYkFxT0UvVFo3?=
 =?utf-8?B?U0FtQzdoVmxPVjRJRXZiZ0FaNWxSSFFkamIrbjhGZWV1MksxMmtUSHlKZDdy?=
 =?utf-8?B?N0ZRajJZdEV0clNFZnpHdGxtK3c5N3NJYkxDZW5iUDVCa3RLNG81U2JHNHg4?=
 =?utf-8?B?U3FtaWNreWZ2M0JMSzVIc05QTzRTK2xRS3drU2w5cW5vT053VStDeThPTXUx?=
 =?utf-8?B?ZXEyS2htb1NEMzM3UFJzbitiQWhrNG0rd0ZqMERHZk5ZdUlhSE56KzgySTJt?=
 =?utf-8?B?TU5CME05TDQ4SmFWeFpkYUdvZE8rdm9MYWxielJyTTgyakRPTDdsNitwZXl4?=
 =?utf-8?B?dFlPS1VvM1F3QWV3cVc2cWx0VTFDOTRuMVJ6dXFVYk5nZHlyd3BjbGU3SFdC?=
 =?utf-8?B?Q1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6EE25C090F5C76499A30204C5085DD18@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa94d8d-526b-4884-a7d1-08da6baab37c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2022 06:23:32.6093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6g3sh+6fPca2Ff5AjnDkhoY+ByxOf1hDNnlxrmqtsJJ3VXqOhx+bXQIphV5rMGuVa2VfXC0sznLjIYRaLHJV9V509jtekhmtiOX682sirsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB5506
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_28,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207220025
X-Proofpoint-GUID: gnwqLIgylr13IreAoSnJeaC6B6eYPhvB
X-Proofpoint-ORIG-GUID: gnwqLIgylr13IreAoSnJeaC6B6eYPhvB
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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

DQoNCj4gT24gTWFyIDksIDIwMjIsIGF0IDI6MzQgUE0sIEFsZXggV2lsbGlhbXNvbiA8YWxleC53
aWxsaWFtc29uQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gVHVlLCAxMSBKYW4gMjAyMiAx
Njo0MzozNyAtMDgwMA0KPiBKb2huIEpvaG5zb24gPGpvaG4uZy5qb2huc29uQG9yYWNsZS5jb20+
IHdyb3RlOg0KPj4gDQo+PiArDQo+PiArVkZJTyByZWdpb24gdHlwZSBjYXAgaGVhZGVyDQo+PiAr
IiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiDQo+PiArDQo+PiArKy0tLS0tLS0tLS0tLS0tLS0t
LSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+PiArfCBOYW1lICAgICAgICAgICAgIHwg
VmFsdWUgICAgICAgICAgICAgICAgICAgICB8DQo+PiArKz09PT09PT09PT09PT09PT09PSs9PT09
PT09PT09PT09PT09PT09PT09PT09PT0rDQo+PiArfCBpZCAgICAgICAgICAgICAgIHwgVkZJT19S
RUdJT05fSU5GT19DQVBfVFlQRSB8DQo+PiArKy0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0rDQo+PiArfCB2ZXJzaW9uICAgICAgICAgIHwgMHgxICAgICAgICAg
ICAgICAgICAgICAgICB8DQo+PiArKy0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0rDQo+PiArfCBuZXh0ICAgICAgICAgICAgIHwgPG5leHQ+ICAgICAgICAgICAg
ICAgICAgICB8DQo+PiArKy0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0rDQo+PiArfCByZWdpb24gaW5mbyB0eXBlIHwgVkZJTyByZWdpb24gaW5mbyB0eXBlICAg
ICB8DQo+PiArKy0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0r
DQo+PiArDQo+PiArVGhpcyBjYXBhYmlsaXR5IGlzIGRlZmluZWQgd2hlbiBhIHJlZ2lvbiBpcyBz
cGVjaWZpYyB0byB0aGUgZGV2aWNlLg0KPj4gKw0KPj4gK1ZGSU8gcmVnaW9uIGluZm8gdHlwZSBj
YXANCj4+ICsiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiDQo+PiArDQo+PiArVGhlIFZGSU8gcmVn
aW9uIGluZm8gdHlwZSBpcyBkZWZpbmVkIGluIGBgPGxpbnV4L3ZmaW8uaD5gYA0KPj4gKyhgYHN0
cnVjdCB2ZmlvX3JlZ2lvbl9pbmZvX2NhcF90eXBlYGApLg0KPj4gKw0KPj4gKystLS0tLS0tLS0r
LS0tLS0tLS0rLS0tLS0tKw0KPj4gK3wgTmFtZSAgICB8IE9mZnNldCB8IFNpemUgfA0KPj4gKys9
PT09PT09PT0rPT09PT09PT0rPT09PT09Kw0KPj4gK3wgdHlwZSAgICB8IDAgICAgICB8IDQgICAg
fA0KPj4gKystLS0tLS0tLS0rLS0tLS0tLS0rLS0tLS0tKw0KPj4gK3wgc3VidHlwZSB8IDQgICAg
ICB8IDQgICAgfA0KPj4gKystLS0tLS0tLS0rLS0tLS0tLS0rLS0tLS0tKw0KPj4gKw0KPj4gK1Ro
ZSBvbmx5IGRldmljZS1zcGVjaWZpYyByZWdpb24gdHlwZSBhbmQgc3VidHlwZSBzdXBwb3J0ZWQg
YnkgdmZpby11c2VyIGlzDQo+PiArYGBWRklPX1JFR0lPTl9UWVBFX01JR1JBVElPTmBgICgzKSBh
bmQgYGBWRklPX1JFR0lPTl9TVUJUWVBFX01JR1JBVElPTmBgICgxKS4NCj4gDQo+IFRoZXNlIHNo
b3VsZCBiZSBjb25zaWRlcmVkIGRlcHJlY2F0ZWQgZnJvbSB0aGUga2VybmVsIGludGVyZmFjZS4g
IEkNCj4gaG9wZSB0aGVyZSBhcmUgcGxhbnMgZm9yIHZmaW8tdXNlciB0byBhZG9wdCB0aGUgbmV3
IGludGVyZmFjZSB0aGF0J3MNCj4gY3VycmVudGx5IGF2YWlsYWJsZSBpbiBsaW51eC1uZXh0IGFu
ZCBpbnRlbmRlZCBmb3IgdjUuMTguDQo+IA0KDQoNCglJIHJlLWlzc3VlZCB0aGUgc2VyaWVzIHdp
dGhvdXQgdjEgbWlncmF0aW9uIHN1cHBvcnQsIGJ1dCBJDQpoYXZlbuKAmXQgc2VlbiBhbnkgYWRk
aXRpb25hbCBmZWVkYmFjay4gIFdoYXQgZG8geW91IHRoaW5rIHRoZSBuZXh0IHN0ZXANCnNob3Vs
ZCBiZT8gIFdhaXQgZm9yIHYyIHRvIGJlIHB1bGxlZCBhbmQgbWVyZ2UgaXQ/ICBTb21ldGhpbmcg
ZWxzZT8NClRoYW5rIHlvdS4NCg0KCQkJCQkJSkoNCg0KDQpubyBtaWdyYXRpb24gVVJMOg0KaHR0
cHM6Ly9saXN0cy5nbnUub3JnL2FyY2hpdmUvaHRtbC9xZW11LWRldmVsLzIwMjItMDUvbXNnMDEx
MDUuaHRtbA0KDQo=

