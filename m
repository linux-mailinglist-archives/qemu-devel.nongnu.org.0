Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D32C050E775
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 19:43:48 +0200 (CEST)
Received: from localhost ([::1]:39756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj2kV-0000Jh-8X
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 13:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nj2h6-00076o-8k
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 13:40:16 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:48124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nj2h3-00035B-Uu
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 13:40:15 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23PFrGx8027852;
 Mon, 25 Apr 2022 17:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=S5Tqbp5eJSKR5xtT2xS52oUC4uP8vzNDAYkulAF2gGY=;
 b=l/CJy083+fRyZkYSY332w/S192KeIuiaLNOQ13L7Dn5F1nuoaMo+kMcP4QM+rSd5xseE
 fVJ8/U7ZlLR0H8ZBoojaEmi2f+gf2r1Nd2+jo0lJ/GGpWFk1PNmJwOT9pXhAqu6g0OjV
 sYXx3/9blhDZw6OPL6mCWdiEHuzjkqcBPfZqhq+Dj//8L9tb8MUdslXoSqxkS6yB4k4N
 JNMsEWYhY0Sf37ZNGL8EVMeF4aPAKn785wBqx/vVv096qbBakEUWHX0UhPysHZX3Pbfd
 OpgNW4l5wDLBl85YBTaj5LeCUbwKGL31IAXnE9YMBQ++xkEaMMD6jTlgyCezBrG+UZS7 dQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmb9akwr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Apr 2022 17:40:08 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23PHe56n002140; Mon, 25 Apr 2022 17:40:07 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fm7w2u38t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Apr 2022 17:40:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YM/UAb0vXRHJyynVvzOGEFk1qyezx45wE1Z5qH2KfQE2my7JubGIpwyuNh+nmN7CuzMrBzqbEBt0UaOPP+24b44hKbaVTKhDY2/9opmzhyxV2ozzlUBHEAboWg2Rib4koA686PWG1tpTmnpBhjkH/d6hOlymbjD7UMpOxYsGDxbEWRaLFGfoSuDDJc/uEI/dA+SoGEELE60h28AOZlAnDe/j/VErDtFDneyAjoZoxdMAHkb3pLm4G4ZrtTAhOn8KAtw0uJmVTb7mb9HAwH95rDr2AdqHVPxS/gW3/XSEkf1RHzBD1wTRAlnf07kbyU4dF0msZa1mfvmzXZqfkGC4hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5Tqbp5eJSKR5xtT2xS52oUC4uP8vzNDAYkulAF2gGY=;
 b=kvqOmiFu96u2zGW7rzyOvLeeFk3rHSO0GFJ/+/08HR+iPrQ6COXwWSbRH9EFHN1a4ecws5q55jjGKX6XpKabE01Ij765WutWGmD/bstIQKgdSN3YxBQTCQyfkBevFHjCDpAoSb1XMUIkRwFW4LErLE3x2drCFjSdMrf0Mj4I76biYvrIs1Z9oijv6yvLtFIL5Rx3cDJ5G/wBoxgHvyoCucGOG/mqnFeA/JZIxmqTi+pr37jOW3jPonvvmK9TzSRa3oa1gPD9ohRJn5izta351C/Q+5ufp5mJIOCmhN/iY5BBMryM0oKNtI9nY4RHdzSL5xbfWYFC2BCc0ZNRUY9ogA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5Tqbp5eJSKR5xtT2xS52oUC4uP8vzNDAYkulAF2gGY=;
 b=NLh0hEPDEI5voimQoQgm44B3drc9orThtCT8I3plt0K+NCxmb3fPT0AetjA7lpymtMfm2I3L+025LU0GdIJO1/sDAR2dEtVcY7H1Xnufyx0MrKSgjdicKZyXSSCVXgfqfN7kNUxfff0a8DvsJtUr1UhSwn5pAFotuz+bxB9FoEU=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB1999.namprd10.prod.outlook.com (2603:10b6:300:10a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Mon, 25 Apr
 2022 17:40:01 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 17:40:01 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v8 15/17] vfio-user: handle device interrupts
Thread-Topic: [PATCH v8 15/17] vfio-user: handle device interrupts
Thread-Index: AQHYVC5oYVYFeJoOHkeZfwl5MTjALa0AddEAgAB4ywA=
Date: Mon, 25 Apr 2022 17:40:01 +0000
Message-ID: <0C1A24F0-A2F5-4B08-A015-92CBAA003497@oracle.com>
References: <cover.1650379269.git.jag.raman@oracle.com>
 <847e6d373eb3d8ff4cdeb7a3ad9b935785bfbf8e.1650379269.git.jag.raman@oracle.com>
 <YmZ3nAtyjt+gjqvL@stefanha-x1.localdomain>
In-Reply-To: <YmZ3nAtyjt+gjqvL@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27a5975f-b526-4aea-90c5-08da26e29ff6
x-ms-traffictypediagnostic: MWHPR10MB1999:EE_
x-microsoft-antispam-prvs: <MWHPR10MB199971D444D3296ABADC0D3590F89@MWHPR10MB1999.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /+ND2cCXwLCUjvxSHn3RIi7WK14sAX7rIN2REGlZ2gyLlpGOvEqtjLerBje7Hs/i7pQjLAksAt/zBDz372Imn9uBAAVqwV/p1ByIFfwf7NUfhB8Azwxi3mrJoCrnZFchN3yU4tDy/eyiAiM/KVhTNBWK9hlldnJNLX/3oc8ZUpML6QFv3j3UiUF66zjux1/0J7+7SjROtwpzse3L59EOTCZForoZhGvtjg7CO+NOGWHgE3Nm1utKm1DeLOHRXGpjUGIyr51/BPQHWaQX/u/PTHHz8GhJp1AWpncnoWOKCHEM3um1sq9G8bS8BYGutUcbUD/wGKycfZt320tPq0Qg1zF4aWVeheKFpZs6VsImRVNEtsEo0UAAgOa7udjNWwF3Imqn3wTev7EC+Zzp6iE3S5bNj6Jq9QE65IxUhl1ied6wlb/rghu7CjHk/BwzoklkzIDmR0lSQ1KVDqqQxDZ1+fGXCGv8/qX6brgkN89rUPfVUfy4cYsNFkkUaOTsmcHaY3BDsLju9BjTsbWLsrM6I/l1p2OOFQotOnvSV7m6BlUmicGhjPu3s60hO7sl+Nevhtdt80l4AiE6k3bDZ5vXkq12zeiCcRil/mKFUh3y11Z6y9DRLECfJKiIiIZWh387G5zmVG7I6J2jTBDV4puVvzjsTq3CSpDwrbnkVw3pgVzMK20dUEPW9QrIpMzAa9QL+Nn23Oo5JYsfPBWAO1wNo/fLNPKOfTSdb2InrL7cHmZboKXNsn+mCRSVK2I3LSf2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(38070700005)(76116006)(122000001)(2906002)(6916009)(91956017)(83380400001)(53546011)(508600001)(71200400001)(6506007)(6486002)(6512007)(36756003)(33656002)(54906003)(5660300002)(316002)(7416002)(86362001)(107886003)(186003)(2616005)(8936002)(64756008)(8676002)(66446008)(4326008)(66556008)(4744005)(44832011)(66946007)(66476007)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnJsV2s0VkZuc3d6azdVby8xOW5LVDVIMEdROWxpTDNVYXVzWUR1aXVmbWhn?=
 =?utf-8?B?dytPMG4yUitRcWxQRTJUYzBWZER2ZVNUYkFqQW9vaVJROUI2M1BXSUJVUDUv?=
 =?utf-8?B?M2lCaUVzU3k3SFN4V0txOTNvQ2N0dy9IZ0ZCb3pnNFRldDVmek9maVZSZWV6?=
 =?utf-8?B?UXhSV2x4ZDRNRVg0Rkx2bVpaL3VFdEJIOUxiSFJrZDZiaGZuUi8yUEY2WmM1?=
 =?utf-8?B?RVpUcXV2c1hJdVpFNlZIWGF4R3pzOVRGUmN3WGdXTDhDWlp0Si9LWWxtZXA3?=
 =?utf-8?B?ZFBOTTFvYy9LVDdnYnJkVW5yeDNoM09LeTJVVTlPTllFVzJIYkpObHdoaWxu?=
 =?utf-8?B?OFhFblNRNDErU21wQ0h1ZExEaGtzeXFvZHMxdVlKWmJpb1orM0JzZWFWNTZN?=
 =?utf-8?B?UEVuNkZGdjVKZytwRjFzU3VObUp1aEU1ZVZDcm5ndHhURFZzdmROb1VNOXVL?=
 =?utf-8?B?NEhBb3Y3NmQ1WHRxbFpIZFEwVDlvRFRTNE5USlBOQWdoR2RpQ0tYVVpPQnpz?=
 =?utf-8?B?UjkrVEp0eFJJOG1RVjlBZXRXSGpuTFpSUmNBVXhuS0xBNUZCNVlwU0h6VEtW?=
 =?utf-8?B?bFU0QTB4V0JHdS9xT01UY3k1Y0ZsS0l3TG1mck1pbEUvK1Y0bDE3SVR3MDZR?=
 =?utf-8?B?Q3pOODJEV0JxSFdCbTdkVUlaNCtLRGxQTm9mMCszQzVjRmpuZWY0TTl1Nlgv?=
 =?utf-8?B?TTBieDdQaUNudVlSNzY2Y1VJSWNDZWdhRXdTY3daUW9QZGxPdHZhbzBCeHZL?=
 =?utf-8?B?TWdNUVlObm43MXhMRWFmMHdTRDRDcmRNbmFKOFk1blhjL1h2d2ZEQ1ZzTnpk?=
 =?utf-8?B?SG5nekxmL2ZvMm12ZHVPRE84dW9YTDZKV0hpWlZicUhoTUN6aUUyeDNCc3FU?=
 =?utf-8?B?MER6RE1mQmF2TVNNbTg2Umt3Y3VKemJZZ2NqOWtCOGFKc09MNWpPQ0ozYnhq?=
 =?utf-8?B?eEcrRUovRGozSVNhNDRBUHovU3h4N0U5TE9zcXJSeGovOTNQWEtWNGRuNGZX?=
 =?utf-8?B?bE8xdGlXcFM2YXA0cE9QSC90SmRxUlZjcmg0Tko4L1BzTnA2ajNyUE44eVJi?=
 =?utf-8?B?dFJOS0lITzRIYXRBVHBQNzZIR1prbnpSMHpHQy9YSk11SHRQSEM4TmlETVBr?=
 =?utf-8?B?dTJOazl0dkVMZHNoYU9BTzdnb0Q3YVM0VWFFa2ZpZXo1bjNYbnJMdzd2YmdY?=
 =?utf-8?B?QTVsZG5OSEJVbDBJVWNoWHlidlFuV2I5TFRyUEtvT2RVbWJWL1lCMWdMeEZq?=
 =?utf-8?B?cEJhVUtmYldKcEV3RGV6V1N0cTlnNmd2N21sZ2x6RmhTbUtlbmhIT0thaHBY?=
 =?utf-8?B?SnV3aHFRTzFWZ0V1a0p5d0hCbWpLUGdQUDNRT0Zsd0g3blFNUWlFYnNiZk5K?=
 =?utf-8?B?V2c2eGxUVzBZRjkvOFAyQ3EwN3ZQcGtzTmJiU0hOcWpvWFZEMjNzKzJqcEZv?=
 =?utf-8?B?NnJ0M2crWThoeWwzTXovYkplazFSM3RnOHBZTVBnaTJMaUU3eUFncDU5UTlh?=
 =?utf-8?B?MVVRQnRUdURqUzVPQktEOEJrS2pTSElFMXNFRC9VUVRYTVVIT21UektZc3Y2?=
 =?utf-8?B?ZTV1WHcxeGk4b1FkUStwWkt6Z2Z3azlsQmRWVjdvWHpsV2Jmb1llZUhWaHR3?=
 =?utf-8?B?dXpGU1gwSU1oSDlMVExRQ1ZxNFo2NTVQeVdKckhSSE5QVmwrdW40V0pmeU03?=
 =?utf-8?B?aTBJUlMzcmI4d3NDbG9DeFNOTlZEQmJXdXBWUVVpMjZYTVlRcXRyMlc5KzNj?=
 =?utf-8?B?azU0ekFTWW5DcWg0ODJIVXF2U0FVNUNCV01Ra2JPYVZlRW1KS0dpRUNyRSt5?=
 =?utf-8?B?UGJZb0xxOVZsRUkzYnlkTmQ3Qi9QZVJ3eVAwTkUreFBpaDZGQ3Z3VmtvSStD?=
 =?utf-8?B?RXdHNXFSdWQ1ZjBIS0ZESlZONWZFNWNjTlRpakRvVHN5bHE0MXNxaEJkc2JO?=
 =?utf-8?B?OUFTSWhHeEtrN1RZR2JGOXBvV2Y0dkZVMW50cXhxYkhlTXlLQ3BSRlBQSlJP?=
 =?utf-8?B?OUViWktEejcrWWUwR2lhbWdiK1RjbEdLWnVVSFBMdmVqVWdsVlgvZms0L1Uv?=
 =?utf-8?B?MC9jTHJzdTdLMmQwSG5SMmhDOXJqZzZDcmZIOHhZTy9WOHI0aVNBdFpReHMr?=
 =?utf-8?B?MW1lMFJHTzZnNmlsYy9uVHZhSWYxc3hxYTFBMzl5QnlSV0UrRUFydjlpalF1?=
 =?utf-8?B?eC9nd0RBQlpyQ3QyK1NOd3paSUtZdE1lK3JQdmVxR1VJZFBqb2thTEFrcFgr?=
 =?utf-8?B?WmtHVGNxZTlrSUhkK0c2cXlHcVhocnd5VFdWN0VRdy9HZDNqeG1FTWx3dzlh?=
 =?utf-8?B?N1dIVlczMHBTR1NCS0ttK1VrV2NnNFQyVW5NTUpLSGRnZ1U0UHkxV29tVmtO?=
 =?utf-8?Q?7O/Sk5/jBwyJqJ70TUVd0rdiS4w1s6NNcSw+e?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A74D586C8649640B1E68E655D03B499@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a5975f-b526-4aea-90c5-08da26e29ff6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 17:40:01.4234 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LPtS8kphwdpoxcfbI/brW+0XP20vOoyWGfaynAQrRyr8Sswcx+jOZEno0zXq5Ua3qV0AzxJaxXMGbdlKCy8+8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1999
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-25_08:2022-04-25,
 2022-04-25 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204250079
X-Proofpoint-ORIG-GUID: bmzSLNXrPM2tcFmSMAwQl4-nRCov5jjQ
X-Proofpoint-GUID: bmzSLNXrPM2tcFmSMAwQl4-nRCov5jjQ
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
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gQXByIDI1LCAyMDIyLCBhdCA2OjI3IEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gVHVlLCBBcHIgMTksIDIwMjIgYXQgMDQ6
NDQ6MjBQTSAtMDQwMCwgSmFnYW5uYXRoYW4gUmFtYW4gd3JvdGU6DQo+PiArc3RhdGljIE1TSU1l
c3NhZ2UgdmZ1X29iamVjdF9tc2lfcHJlcGFyZV9tc2coUENJRGV2aWNlICpwY2lfZGV2LA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGlu
dCB2ZWN0b3IpDQo+PiArew0KPj4gKyAgICBNU0lNZXNzYWdlIG1zZzsNCj4+ICsNCj4+ICsgICAg
bXNnLmFkZHJlc3MgPSAwOw0KPj4gKyAgICBtc2cuZGF0YSA9IHZlY3RvcjsNCj4+ICsNCj4+ICsg
ICAgcmV0dXJuIG1zZzsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIHZvaWQgdmZ1X29iamVjdF9t
c2lfdHJpZ2dlcihQQ0lEZXZpY2UgKnBjaV9kZXYsIE1TSU1lc3NhZ2UgbXNnKQ0KPj4gK3sNCj4+
ICsgICAgdmZ1X2N0eF90ICp2ZnVfY3R4ID0gcGNpX2Rldi0+aXJxX29wYXF1ZTsNCj4+ICsNCj4+
ICsgICAgdmZ1X2lycV90cmlnZ2VyKHZmdV9jdHgsIG1zZy5kYXRhKTsNCj4+ICt9DQo+IA0KPiBX
aHkgZGlkIHlvdSBzd2l0Y2ggdG8gdmZ1X29iamVjdF9tc2lfcHJlcGFyZV9tc2coKSArDQo+IHZm
dV9vYmplY3RfbXNpX3RyaWdnZXIoKSBpbiB0aGlzIHJldmlzaW9uPw0KDQpXZSBwcmV2aW91c2x5
IGRpZCBub3QgZG8gdGhpcyBzd2l0Y2ggYmVjYXVzZSB0aGUgc2VydmVyIGRpZG7igJl0IGdldCB1
cGRhdGVzDQp0byB0aGUgTVNJeCB0YWJsZSAmIFBCQS4NCg0KVGhlIGxhdGVzdCBjbGllbnQgdmVy
c2lvbiAod2hpY2ggaXMgbm90IHBhcnQgb2YgdGhpcyBzZXJpZXMpIGZvcndhcmRzIGFjY2Vzc2Vz
DQp0byB0aGUgTVNJeCB0YWJsZSAmIFBCQSBvdmVyIHRvIHRoZSBzZXJ2ZXIuIEl0IGFsc28gcmVh
ZHMgdGhlIFBCQSBzZXQgYnkgdGhlDQpzZXJ2ZXIuIFRoZXNlIGNoYW5nZSBtYWtlIGl0IHBvc3Np
YmxlIGZvciB0aGUgc2VydmVyIHRvIG1ha2UgdGhpcyBzd2l0Y2guDQoNClRoYW5rIHlvdSENCi0t
DQpKYWcNCg0KPiANCj4gU3RlZmFuDQoNCg==

