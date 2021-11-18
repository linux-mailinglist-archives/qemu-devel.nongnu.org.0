Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6956F455961
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 11:48:53 +0100 (CET)
Received: from localhost ([::1]:44372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mneyK-0005JP-C8
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 05:48:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mnew5-0002sT-89
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 05:46:33 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:52802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mnew3-00075P-5G
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 05:46:32 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AIAAITM009978; 
 Thu, 18 Nov 2021 10:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=JwIYyyg8nj1/2mWmO4HLm1HPPvtmEYVLHMlK029KnlI=;
 b=JztmE02zcBAsel4cpJdiOJ+bWI1Dn/Rt2rs0EbrkuvpqNz3bYVNXxtJbdo8rkzAO/XTq
 84ZLEGfX5FV8aCQvTogJOmFzbHH4tL5djFmqz/3P4CH73P9+588tPI+f3F1DgBgb7o+2
 1DsXHg/9zbUwaw9JD4Y5tSQx4/t0i+qLoHeNQANn5mkgu3gZpBDx6sgBbtVGgovyn1+v
 ZOBE9dUIrkVx+hDghBQe7RzDHOMRhN5HLgyHxJlejdgxNpjXNinz/odYvI7eTuxoLP1I
 veTHN0y7qFNA/h+H7kZHceV/5/oLJ+aSh6C6MGwaTh2x4se3L6I0qFLBF9rbIF/BxGb9 yQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cd382ep4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 10:46:24 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AIAakev027840;
 Thu, 18 Nov 2021 10:46:23 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by aserp3020.oracle.com with ESMTP id 3ca568cq7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 10:46:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4Pqivy1wmq9gffe0iAXWwnHshYMJpngywSyy+T6XGrrxdtdC2R38IZriwKx0NBqPrHfHgiuH25YDSYUlyr2WkZ3DdlxqNbTTRCzzBaPjO1mb2EtYr+heGKAWck7BmmjwWKaBbRHazs6+pbJA4Nq8XrxMiL1V/CZlUbg+N3SdNKzzNDUhjlw8ryJhkVEo6JHi/jUW5Rv67PnCc7RmWd4i8fQ6eCSIOthcPEoYGhUGmDtLn26CuWAb2TklMEC8+ezhktSuHPvyoeizuw7Q1klp4J3WJn2B98j/71g5C4dNaVA6OTxNdxs6icnPLVenJ0LWa36PBeStBzJORqHhccwnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwIYyyg8nj1/2mWmO4HLm1HPPvtmEYVLHMlK029KnlI=;
 b=lTkwKnDKb//Kru2mQSJRDyoKhrIZ8quafXktrV06j6n4+kvrEplMxtvHpEhGUHgVVL5mDagq7EGdoX/hEXN6Qq4bOYmyWLejLI4qU8b3X6aYzh+CRnl/BqPwJYe0v+gIRR7mSwg+f2vSbMW7j3yZ9j1t5hf5ZEqovm/4SbphPmCRzEPh78AxnXJTy1xTKB2c41cLKgQWVcc77gPXxZsrDFKUhYcBUksioG0Z2yhqI+hT6dgGBQsuHdXSv+h7KF07HFNQoSg98Wvyvri7FPt8j+g361QJ6No/5Hed9FkDYNF6aytUltiOk6KdJK6AMrROar2XC2PfEbETBDb8+0CyeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwIYyyg8nj1/2mWmO4HLm1HPPvtmEYVLHMlK029KnlI=;
 b=UoxzZxltCs7v5nf2RVh3wwaUoieGvaKbHxyE6unwEuv9JCwuaebUK/5xuBZsO5CxL/cYddDfL9LqkrNbI0XM0GxYuTuUeVSgJTdH64JkZF33dDqs4SOOBE20pU+/q2R/u34xrjUP079dc2pDlyC+eCCWxR08B0O0oxXUgJe/chc=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by MN2PR10MB4048.namprd10.prod.outlook.com (2603:10b6:208:181::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 10:46:21 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::9418:7fcf:86ec:e0f4]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::9418:7fcf:86ec:e0f4%7]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 10:46:21 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH-for-6.2] hw/i386/microvm: Reduce annoying debug message
 in dt_setup_microvm()
In-Reply-To: <20211117174331.1715144-1-philmd@redhat.com>
References: <20211117174331.1715144-1-philmd@redhat.com>
Date: Thu, 18 Nov 2021 10:46:15 +0000
Message-ID: <m2k0h5n3m0.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB6PR0202CA0002.eurprd02.prod.outlook.com
 (2603:10a6:4:29::12) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
Received: from oracle.com (46.7.162.180) by
 DB6PR0202CA0002.eurprd02.prod.outlook.com (2603:10a6:4:29::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.22 via Frontend Transport; Thu, 18 Nov 2021 10:46:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 393fc2a8-a6e0-4139-d20b-08d9aa80a893
X-MS-TrafficTypeDiagnostic: MN2PR10MB4048:
X-Microsoft-Antispam-PRVS: <MN2PR10MB40488D66399EA4958BF21743F49B9@MN2PR10MB4048.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:138;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8sCKhxBWjBKcGuPAs/7IZmW7Sk+qSEOotyU0Yv/WkJwVVKa91TenWsQbTlcoS2OwRFfViu8fGLVmuIUx0ZY5wIYMFkLJ49Fc/biSzx9LhJnhX6TKIQ6RfTt/lPXuQsCHeiYLJ3Zyg/S8nNcRtkLM2YadIHybSK5SnUyLgj5jVBXcuLWrbKaUWsSBfc5CgNr41Cdb8vJiSkclsP8Do3PrC8T77ir8mhNJG5YtKSEwliYGazLEArjUe7QOqBQX2wVK6Ed7e99qqsOzbgIzmxi1mY9ewf/4sxUj0mO6Wdb07KPu72P9zP9L4P3C9ELf5lDuYVxCGRnu7b4u8sNPD5O7zuDuX++nzfPIyqP17Gmahx9Xz60WFyvxlueBLUwyEQp1plvQ3dcq6tqFAgDGlzmEAHuenISEChJ4WYVp+BY5oxu4CLxrY9jgP2BdBgd/6+3KUtdC5i+RYzUtLShdB8AbVdl5LQZof/RfAGr2J7KRbh5GxnUUxEycO6mujWQ801i4Y1HApEQ9439kzefbvPczhGpr9c0SCl8CO8fb7JvRNPivSnyby9lB7X01FzcqN8O0D+sst+jcsoXyFw5lRSm30Xz7Dm1ycohf8pnNu9W4CSHi/MDys3kzQwolXCNgGosfJ6/SsLU+6XMUTrRkCXpCteqyGZQsNaKI7oRti3zjNdwQg3O5gmBKQFd8IxcG4fvLUfJbYIW19VYrqAEXpTwaRg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(8936002)(83380400001)(2906002)(186003)(66476007)(316002)(66946007)(4744005)(4001150100001)(956004)(66556008)(4326008)(8676002)(44832011)(508600001)(55016002)(5660300002)(38100700002)(38350700002)(6666004)(54906003)(8886007)(52116002)(86362001)(36756003)(2616005)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1NQWnhzQ1lwYzJqQnRpbVNZTXBFUEh0amZPcE9NTUtCTTdqdmorTjh5eEdI?=
 =?utf-8?B?aGJlL0pWT2x6K1ptYVNTTktOQU54M0g4emZEZjBNSWNINlZ3aDZURUVVbWlp?=
 =?utf-8?B?L0lTMGlPdEZYRWFWTStmaFQ2ZDdHK2pDcjkrU0F5SVZiSVNINjlrZWtCcEd4?=
 =?utf-8?B?Y2pwTE03SGY3RDZ0aExLbTQzQktNcGZxZUFLNjhyZ0xuSWZlakxwMWIwUTBD?=
 =?utf-8?B?UDdJTjZheVRWRWVNbUpUdWl0NEFlQUtYRy9UUXlxOHBWODhOQnFCRnJhd1V3?=
 =?utf-8?B?VDRoQ0pZai9hKy9iUnlnL1drYzN2TTVZNVloOGkzTjVKUS9oNXBkaG5UMEhY?=
 =?utf-8?B?TklYNEpsazE2eTRXMUZmTWxXNjJjVUduR0FoN3JNTThWbEpqYjNDUUZ2a09p?=
 =?utf-8?B?SElQdVVVNis2ckRuOW4reUJjVzFmZmwxYXpBemR4UmJtL2cra0pXek44c0dW?=
 =?utf-8?B?NW5WNnV4bjlBTm8xTVdSRzdXOHpEWmhRYWg1cWlscVVLK2ZRQW1OSWllYWhQ?=
 =?utf-8?B?TW5xaGxpUVlWOS9yQVROd3R3bTJNNXlGKzc4WWpFSkJlUmZybEVxU2VsUzF6?=
 =?utf-8?B?a3I4Sit1R3hLQTVISlp0UnJyZnpTQ0tzZytQUjJFN3NLMG00clV0dTlqREN5?=
 =?utf-8?B?azA3RTVJNUJyMnNTZUt3bnJxeXAzQ3piQ2VQSWlwS01rb29ZeW1JNzM1THVU?=
 =?utf-8?B?UGRLSW9KSWFsMWYyMVdKSnZSS3kzM0E4cGRWK2hPd0FldXpKUkRnK1p3aFl1?=
 =?utf-8?B?VWcvZnVxL0tQSFo4NWhaWkM0WnlaeHlLWkZsUjlQOE1oQ1B0SHdnVG1qYi9x?=
 =?utf-8?B?NWxGcWVYamZjSDIzUjU3a0lBVTZ1dWMwY0JQV2ZyVC9GaTJJeFhWV2E1ZGdv?=
 =?utf-8?B?TitxTll1eWE1bzBuYS9DWE9TNkQ5QXFTV1VpZjBFV3kyNmxMYUNrVGJtN1lj?=
 =?utf-8?B?QkVwRk9sWTZ6MGllNjVzYk5ZWWVrakZlaGpqZUg0MjY5VUVObzNTK2VuOG81?=
 =?utf-8?B?ODlJeDFhbzRyajU0Njdac0dhbFVNZjcvUURiRk92UnRKNDdjZnNQK1c0Ukdp?=
 =?utf-8?B?QzZrUVlRZUFLdTVBdnhrNWhhVTU0OHk3TXpvbmNBNUJyRnAraWI5OHVSYjJm?=
 =?utf-8?B?L3lreWdjOGVPR0x6WjhyVnNoQWxhbHhZeVRZWWw3N1Z2Umwzc1JuM05oVlYv?=
 =?utf-8?B?VnAwYmtMKzVVbjk5clJZdU9yTkRYSmUxcDA4UzZsdlVzRTJGMER2OThTcDdC?=
 =?utf-8?B?WXlzMVE0bGowZkp1UFcyNjBCSTFRbWZFN2trdmk5RVVwdWFoZ2pkbmhUSndp?=
 =?utf-8?B?YVcxa1dHOElFWVFqNmFmQkFTckxVVVRtTHJiSElqMVdiR2g5WlNTU1ZrcDVE?=
 =?utf-8?B?ZkY0Z1VUZ1puUDFlRmlmUjFqZEFMWXJrZ0JqRkdlV3RxeTd0SnpxeTNxSkxL?=
 =?utf-8?B?c25nNDFsNWJOVFpQWlRNdnlxS1hpakFRYmwzTkdMK2tIYjJ5RHhqaXd6UTlU?=
 =?utf-8?B?MUp6MHduWDVZL3pOT2FFZUV3aEUyeG1LcXpIN1JlKzRYdGMwd3QvRk5PcmU5?=
 =?utf-8?B?Zk9qUXBQTlQxNDV4dkphRjNiL3RYNGk4a0x6OUJIeHNuWitEa1l3Qyt1ajk2?=
 =?utf-8?B?T2lsYjh6Q2lWR0J0dFBOWGJtaDVQMzgvanFsOWR5SE5BSXBtZ2ZCa1VzS2cr?=
 =?utf-8?B?SHVLbURmYzRLRlZiK2hscTMxN0xGWjRjV0tTbFA0RXpKTmVTeW5vU3ErRmhC?=
 =?utf-8?B?azYwVEltcWx0c0drdWFyZ3loajJpeDZ4TTFmMjFDdEZSQUhYZEhIN2hhclRL?=
 =?utf-8?B?eUYrU1ZleXVYOW5DdUN5WC9sdVNVc1Q3WmE3SWRsOWNxK1NKaTFXOGJGS1N2?=
 =?utf-8?B?Q0EyZGZuS09QdzlOcUR2VHY1eFpOM1JQYUR0OFNiU1BLaDN3c3NUOGk0OEMx?=
 =?utf-8?B?NTl6RW1LNkcweVB3T3JSUjBVK3JVRDk2RmhwY2Y3ZXVKWC9oclo3c0p5L2VT?=
 =?utf-8?B?eHdXbzlENGJBZG5LSXB3R0wxTnJpTElrT3pJaFhpbEJqZ0ZOaGY3WEoxL3dJ?=
 =?utf-8?B?b0tDT0RuSWRqZ1FYT1Z0WXQxWWdJTHhTbnkwZTRDUmh1cFVia3pqREVVdXoz?=
 =?utf-8?B?YkxaT3d1M3Ayd1BOU1IvYm1PdjJmSjUzYnI4M1Q3dmJLUHk0cXlOTU5pNnZN?=
 =?utf-8?Q?8YPFc0d5YN8m0zFBw7GmF+g=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 393fc2a8-a6e0-4139-d20b-08d9aa80a893
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 10:46:21.2811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JlZYJSEHicDcrLfjfLf/nh9rM3vf05Y8i9xSgF6NDdc/jv1klxRpptfFGpbnNtCNWHwy7BAP5l80KIHtaeL1mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4048
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10171
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111180062
X-Proofpoint-ORIG-GUID: Oyk4qMdvxm8-cH1AVAt6e9plp10OgT8r
X-Proofpoint-GUID: Oyk4qMdvxm8-cH1AVAt6e9plp10OgT8r
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2021-11-17 at 18:43:31 +01, Philippe Mathieu-Daud=C3=A9 wrote=
:
> Fixes: f5918a99283 ("microvm: add device tree support.")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

> ---
>  hw/i386/microvm-dt.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
> index 875ba919639..6ee6c42904d 100644
> --- a/hw/i386/microvm-dt.c
> +++ b/hw/i386/microvm-dt.c
> @@ -327,7 +327,9 @@ void dt_setup_microvm(MicrovmMachineState *mms)
>      dt_setup_sys_bus(mms);
> =20
>      /* add to fw_cfg */
> -    fprintf(stderr, "%s: add etc/fdt to fw_cfg\n", __func__);
> +    if (debug) {
> +        fprintf(stderr, "%s: add etc/fdt to fw_cfg\n", __func__);
> +    }
>      fw_cfg_add_file(x86ms->fw_cfg, "etc/fdt", mms->fdt, size);
> =20
>      if (debug) {
> --=20
> 2.31.1

