Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DB44D02FB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 16:33:10 +0100 (CET)
Received: from localhost ([::1]:55918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRFMD-0003nt-L9
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 10:33:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nRFL4-0002il-IR
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 10:31:59 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:45832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nRFL0-00033S-Aj
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 10:31:57 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227EUkcw008819; 
 Mon, 7 Mar 2022 15:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=kbHFgps+Cv2KBcsxB1RF3ZHMclnORuzherXCmwJGFuk=;
 b=dUK1U9wqG337k4lzwEjcNx2Re4kGQGAGxs4M8+W98J2BNGB/BOBmq5Tl8QI7wKstM4/A
 9pa26kkd18psPTWG4q7x+S/YSCzcXM/4qe5ksDw5GQm5FSixhe8NLdOc5SsxPkPb/aIL
 av7ApvpoDtEBNxbbLaao+jldAlqLH3vItmJ+KpRweFbtB2T1WT0w9/9b3AeAbGj/bnfZ
 OnM8wXxEoxS7rYXGkHQb1epm7BEV/mPhTJKskWvG31+o5no/cqhAsxtBcbp1Z2gGdrWr
 DUzX/RMrpIbRsegjiZE1Rfh0I+q1PoseDtm+1lAs3+0EDQnaKMfLuWwWkq8D2dErlu0N Pg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekxf0m7k2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 15:31:46 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 227FFYVS018917;
 Mon, 7 Mar 2022 15:31:45 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by aserp3030.oracle.com with ESMTP id 3ekwwb32bm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 15:31:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOlCvtJkuOEfXzcgmUh1gCDi0FMsK76mqafbxsjLPZQ3s79gKbH6VJyp8ZZrnVV5PqKMPPrK21e/7LO078p8ALKup+15GMq/oohOzMct/aiCkMC3PJuwWKU0V9HccA9QvhEJlS65KOfOOgF9nwebdfgqjqCADWckLLQKI2aEq//UVjBua2hiqjAvkR6ofpLhzvpl5WDYDQyV/mg4arU9u8DdlZNbJkmNDHTjlUKZb1DOVT5LfIENHcLkHrkE44xRD2fL1A61YT479LZo2nuzRegSnVi2I8ae2HHf75PUh1UWIoP3pbW1njghk/V56z8Z3Q50EebcJki3ZOQTwD3PxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbHFgps+Cv2KBcsxB1RF3ZHMclnORuzherXCmwJGFuk=;
 b=mKOxoAJl1FrZu5X5ZSiGzDaol4heF6psbEqJLtmKNl1iRTd0E8dJJt+CCurQtvoo/HaaG+m+S8fuNJLqnxJf4Oz51Q1yqRe+al+1LluYRZpFKAKKIMM1wA06a/eOj0PQ/UUQegCACC+KqACeQyz5SUX4oaiWWrG3PHjd3mbRa+T+XWotMizNfPEp+omjG3UYUjgBmJZ4LJBr66C4EP1BUCY1PlKANfgDQP+vYNRab8ak6d4d13YkA3LdROzUr4EHBdlSsioqPfAm5Qxc8FwOdAnIDkAEUKIAmwLLxLhMjGJNh7CNaou7JRxyz5odJiXdNjaxeaxOPYuCvgq8KLooHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbHFgps+Cv2KBcsxB1RF3ZHMclnORuzherXCmwJGFuk=;
 b=U7dzUzAMiYfx3cnuP5f2WHkBO9zCRmq1DGenBAbwQ9OVkKBInnnlN7vi7+GIeZBCJ1Zk6xca67Wza7beaJKA96JJER6oLgVGUyPtKvRcTRRqP1YO2s1k9qXJfHqJW4oJEOEzw8t2r3/QTHq5YnLt7RfQQK93HlErlF2VpifymYQ=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by SA2PR10MB4588.namprd10.prod.outlook.com (2603:10b6:806:f8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Mon, 7 Mar
 2022 15:31:43 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 15:31:43 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v6 16/19] softmmu/vl: defer backend init
Thread-Topic: [PATCH v6 16/19] softmmu/vl: defer backend init
Thread-Index: AQHYI8rrbK9sxczZYU2b5BPM+D73bKyz2h6AgABPMAA=
Date: Mon, 7 Mar 2022 15:31:42 +0000
Message-ID: <9944FB4A-D77A-4221-AB0F-38BAB04FC5AE@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <55fa22ea0e82b204ca3c5ee2fc4b9b3d2c1669f6.1645079934.git.jag.raman@oracle.com>
 <YiXi8e+b5nn1FX0P@stefanha-x1.localdomain>
In-Reply-To: <YiXi8e+b5nn1FX0P@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c8cd3ab-ebf1-4f67-1658-08da004f9517
x-ms-traffictypediagnostic: SA2PR10MB4588:EE_
x-microsoft-antispam-prvs: <SA2PR10MB45884FE9F081A03B0F7CF31390089@SA2PR10MB4588.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5jn1FCZvyimFNu6yKpDUv5WJMaKlfqg190BtAz5ifINWAUrXRh93fRq4H+U41ltAZeBE/5XDYiTpxMSxiQRtzNpKT7vKB678lQhVbnxFGckVcZHt5z59hGjbZLPZlMjOcLOuMk+B1NgCel7Akr2V3ttm5XlTJUDqquNLUy3+jorsirYgKcKR09Kb9lTllpnIlxsRmRWdnAUdKhKZMHL5agxTOcMN5dy4Y7UEW48XIXwgDZVCH+OTlQwyPfsaxp6+uAtVLt0x3ckxi0hEb4lAXh6J0nLxVNyT5v/Y+NSGGaY1cFhoD5V5iA94y6tMbogDGxLJAm2DEqDn0USx9NsCGmnZ+OyoAVi8nh4+1ypoWmnmmKdYjwrKg2I/3SC2aetVBLE6e4bcMBYMErbGADyeBwrC2OlUxjxnJ+gptFQtbZ1Vb7KKw4mbuLX/de89Idfh9f2mzA6s60HllcYtR2EyhWTTAxDuj382phJgme+t93pk7RTUEZq9XZY40eaGP+X05n03LSZD84FIs6TiBRuDV1daOWvs9VkQ00WQwenIHYF6+jmr9rEdnnNGakZedgfLewxvivM4gloKZujTEHUzBiZL7NThVMt3QAuDiNEzzIFlB+RsdQ9fVxrszeOXdOlK5Nof1PleUlIZbQo/bCT6VC9VgfRqoFdOGPP+TeK3mMmoNrmGa6av3BfCw6DX0GzxOH2a/O6Baue8otOrNxQw74te3vw+QCVi1/y8ee19VMsQyXCl7GUyx2amcHd+xBAA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(7416002)(2906002)(44832011)(316002)(36756003)(508600001)(2616005)(186003)(71200400001)(6486002)(6506007)(33656002)(6512007)(53546011)(54906003)(38100700002)(6916009)(38070700005)(83380400001)(122000001)(66556008)(107886003)(66946007)(66476007)(66446008)(64756008)(76116006)(86362001)(5660300002)(4326008)(8676002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEYwenRqU1FyN1FKMzNoZlFpVGNIeVN3TGRlL1BZWWYybW12dU9JWlAwVFpN?=
 =?utf-8?B?ODhHSjljQXJTek4wNmRNaStjbmp2blpvVHE2QS9xaW8vUGxBSEtUbHNIWE9j?=
 =?utf-8?B?d2ZQQnFvdEVLaWdHOVdWOFQwS3NXV3VLRWcyc3F0Ym9zeW03ZG9FcXpYaG5M?=
 =?utf-8?B?c3FNMjE0ZTUweWdCS3p1TVp0QVU2ZzRTSW1SSXZadDZ2dzFqaWpSTjRna0t3?=
 =?utf-8?B?Wm5aa1FNZmswdnBrU1c5SHR5dk9PYUE4bnY2cXd0d1lmSjRRN0g5UXB3c2tB?=
 =?utf-8?B?TEcrT3J1SnZBekpybEhIaFNNUnlBYWM2dTJ3TC92OFFRQnhvSC9sVXhBZEN6?=
 =?utf-8?B?VHlJK1RscGNSdmZJK3ZXVU1HU0NENTB4dHlDZjVVZFN6THlKc0NTRDB4RWdK?=
 =?utf-8?B?SG9UcWY1RHh6TzZiTjNPeEpPeStYTVZqbmZwSEllREhGZVI1MXBKRTBlMmVa?=
 =?utf-8?B?VEVFUGx6aUNqcW9Sc3REWWVqVStWQkI1QmRlOU9XZGZ5U0tpRnc4NGFIZjJE?=
 =?utf-8?B?R2w0RXI1aEZmaG5kMkRvbkw1WjBSbTFYcW5lRnBLdEtMTUtwSUlEZDEwMUpY?=
 =?utf-8?B?L0IyR0RLUkNZWEhVMzlSVXE3ODVuV2pjNTNwRHFldllPRS9wNEdOUnZvTWpz?=
 =?utf-8?B?bW0zMWdIUmQ2RFBSTVdKc2Y2MEFtcmNqWFhPL1dlVGZpZVlubjg2ZGkrM3lx?=
 =?utf-8?B?cDFoQUpsSzNBaXk0bTVWSmVvaGhQVFVZSEVmR0NSWUFlSVY0T0kyVmUrYnpF?=
 =?utf-8?B?SDlwV0wvMlQrbGc1RHlEVFhKQVc5bmdsZTM1c3hCYzlHV0kzbzRPR2UvdjFO?=
 =?utf-8?B?NHhvdXJRaFhLU2M4V1dEM2RkcHNBZ2hFOHJrMUFXMFpTVzc2VnUreXAxOXRN?=
 =?utf-8?B?Mm9mbXJtSDRZUElYbVhOTG1yV3BVQXo2WENhTWo5V1BrY0t3SXFzYkthMktv?=
 =?utf-8?B?TDc4MDFLVUU5aVEzSzVCTU1hN0QvUXU3YkI0K1BnVzR1ZEpwMHRCYlVncDFC?=
 =?utf-8?B?WGFxVUV4NFB5S3A2Qi9DaG9WZ09GanNldC9hT3JHZUFad3ViL0xTRjJrcDRW?=
 =?utf-8?B?SG1VZ3hyS3djYi95MHlxb2NSbHdURXJCOWMzZ3Y5K1ZmRXg1dFl1UFRRYWpX?=
 =?utf-8?B?WVBXZkdQRGxGQThWZ2RYTlg1N0VOd1h1SmJlc1ZncE40eWVCTlZBallGQUh1?=
 =?utf-8?B?SkRQcXE0QUdHdnRDQTdFNm9iLyt2TU9HY0NnaDhxL2ZoSFQxckcwd3BWMU53?=
 =?utf-8?B?azU3TzB0Zkx2bUtna0Vld0pSMnp2NXN2STdHS3hVYXU5ZTBxQlYrQS9yek44?=
 =?utf-8?B?QmF3cG9uTDM1VVRocy9rUWlXc09sOStUODRLMjFQeGR4WU9PWXM5b2RZbUNT?=
 =?utf-8?B?Ty9DeENwYlMxKzdMcHRRa24vQk5GcWVGK3pBL1ZWL3Z4Z1FqOVQ5eXM1SmhF?=
 =?utf-8?B?Z3lsN3NsMFJpRkVHWFJGczVFN1ZBWFNHNFFUNW1zbisyZ1RqRE5Td3VHcFdj?=
 =?utf-8?B?NjRxeXBuSjd3UGxSMVF3YWtQZy9qRUpQZTFSUHVZNENoaVhrckFpaGN4c2tB?=
 =?utf-8?B?V3ByZzk4N1lsMlNzZEtpZ2pucEVlR1VCd3MwdmMydmdaajZUdEhWNTFoSFNZ?=
 =?utf-8?B?SjBXNnpjSE52clJYUXJzK282aWZSUEc0c2w0ajZPTm9ZU2xLSzZKVkh6emZk?=
 =?utf-8?B?anBjNThodTBwRHJNbityMzd1UVc5SVRpTFpHS041S2tyNmxDdFFjYk9HVDJU?=
 =?utf-8?B?RHA5T1BhditiVEllYllIZ1E1MkpHWVVDcm5zWFUyMVJjbGJXZnpyUnJnWkRp?=
 =?utf-8?B?NHRhenc1Y2YyL0YrTXorZWgrUStVUnpvTVZtS24yZlhhUUxtQTdNM291Ty82?=
 =?utf-8?B?c0dUSmdTeUJQZzcvcUtNbDBDbVhReTA3aDRtbzRseHgrRFZ6ZTg4UzJoQm91?=
 =?utf-8?B?aXJzNWVkazhramRsS3lvSmNoSWZpaTRLUFBQYVBuOW1wVkY1RVdUQWhyTkVZ?=
 =?utf-8?B?K2ZBOGRVUFNKU2xYdmNXSGNUU1NDU3BTc1NlRzh3eEhDRmhOV2FyeStnWjZH?=
 =?utf-8?B?c2ZwQ0VxQmRiYkR5eVA1eHp5blkzMGw4TTI4R1FmSndMcTZhcUViR2lpcm9P?=
 =?utf-8?B?MTBVNUpUQWdBVldDVUMzRm4yeFE2RzBxMTNTSXFYcVlCUnhHdm1kMEZuSzBV?=
 =?utf-8?B?T056Mm1YMlJOdGhPOHM5L2xWSDNBU1gzTU01T0tMRzNsNkpjSzJ1Q1R2WUpQ?=
 =?utf-8?B?d3N5WlNteEh5a09FY1FZUUdwUld3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8000FAB18FD4641A22DD7B085A5399E@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c8cd3ab-ebf1-4f67-1658-08da004f9517
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2022 15:31:42.9143 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b71TaDXFTj7M4pLQtlIE/yF4f+LWODX0/7WHw4de1AIV1xy2LCLD0twO7MDkni+gQ2RF5XUENpX+LWnpshTgtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4588
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10279
 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203070090
X-Proofpoint-ORIG-GUID: 10M1CjwAVXjeMRJeAMy1MAsnIb2BDPHt
X-Proofpoint-GUID: 10M1CjwAVXjeMRJeAMy1MAsnIb2BDPHt
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 John Johnson <john.g.johnson@oracle.com>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gTWFyIDcsIDIwMjIsIGF0IDU6NDggQU0sIFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFu
aGFAcmVkaGF0LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBUaHUsIEZlYiAxNywgMjAyMiBhdCAwMjo0
OTowM0FNIC0wNTAwLCBKYWdhbm5hdGhhbiBSYW1hbiB3cm90ZToNCj4+IEFsbG93IGRlZmVycmVk
IGluaXRpYWxpemF0aW9uIG9mIGJhY2tlbmRzLiBUWVBFX1JFTU9URV9NQUNISU5FIGlzDQo+PiBh
Z25vc3RpYyB0byBRRU1VJ3MgUlVOX1NUQVRFLiBJdCdzIHN0YXRlIGlzIGRyaXZlbiBieSB0aGUg
UUVNVSBjbGllbnQNCj4gDQo+IHMvSXQncy9JdHMvDQo+IA0KPj4gdmlhIHRoZSB2ZmlvLXVzZXIg
cHJvdG9jb2wuIFdoZXJlYXMsIHRoZSBiYWNrZW5kcyBwcmVzZW50bHkgZGVmZXINCj4+IGluaXRp
YWxpemF0aW9uIGlmIFFFTVUgaXMgaW4gUlVOX1NUQVRFX0lOTUlHUkFURS4gU2luY2UgdGhlIHJl
bW90ZQ0KPj4gbWFjaGluZSBjYW4ndCB1c2UgUlVOX1NUQVRFKiwgdGhpcyBjb21taXQgYWxsb3dz
IGl0IHRvIGFzayBmb3IgZGVmZXJyZWQNCj4+IGluaXRpYWxpemF0aW9uIG9mIGJhY2tlbmQgZGV2
aWNlLiBJdCBpcyBwcmltYXJpbHkgdGFyZ2V0ZWQgdG93YXJkcyBibG9jaw0KPj4gZGV2aWNlcyBp
biB0aGlzIGNvbW1pdCwgYnV0IGl0IG5lZWRlZCBub3QgYmUgbGltaXRlZCB0byB0aGF0Lg0KPiAN
Cj4gV2hhdCBpcyB0aGUgcHVycG9zZSBvZiB0aGlzIGNvbW1pdD8gSSBkb24ndCB1bmRlcnN0YW5k
IHRoZSBkZXNjcmlwdGlvbi4NCg0KU29ycnkgaXTigJlzIG5vdCBjbGVhci4gVGhpcyBwYXRjaCBp
cyBuZWVkZWQgdG8gc3VwcG9ydCB2ZmlvLXVzZXIgbWlncmF0aW9uLg0KDQpKdXN0IGZvciBiYWNr
Z3JvdW5kLCB0aGlzIHBhdGNoIGFsb25nIHdpdGggdGhlIG5leHQgb25lIGhlbHBzIHRvIG1pZ3Jh
dGUNCmluZGl2aWR1YWwgZGV2aWNlcyBmcm9tIHRoZSBzb3VyY2UgdG8gdGhlIGRlc3RpbmF0aW9u
LiBGb3IgZXhhbXBsZSwgaW4gYQ0Kc3RvcmFnZSBzZXJ2ZXIgZGFlbW9uIHdpdGggNSBQQ0kgY29u
dHJvbGxlcnMsIHdlIGNvdWxkIG1pZ3JhdGUganVzdCAyIG9mDQp0aGUgNSBjb250cm9sbGVycyB0
byB0aGUgZGVzdGluYXRpb24gd2hpbGUgdGhlIHJlbWFpbmluZyAzIGNvbnRpbnVlIHRvIHJ1bg0K
b24gdGhlIHNvdXJjZS4gVGhlIGRlc3RpbmF0aW9uIGNvdWxkIGFsc28gYmUgYSBzZXJ2ZXIgdGhh
dCBpcyBhbHJlYWR5DQpydW5uaW5nLCBpdCBkb2VzbuKAmXQgaGF2ZSB0byBiZSBmcm96ZW4gZm9y
IG1pZ3JhdGlvbi4NCg0KVGhpcyBwYXRjaCBzcGVjaWZpY2FsbHkgYWZmZWN0cyBob3cgYmxvY2sg
ZHJpdmVzIGFyZSBpbml0aWFsaXplZCBpbiB0aGUNCmRlc3RpbmF0aW9uLiBJbiBhbGwgdGhlIHBy
ZXNlbnRseSBkZWZpbmVkIHVzZSBjYXNlcywgUUVNVSBsYXVuY2hlcyB0aGUNCmRlc3RpbmF0aW9u
IGluIFJVTl9TVEFURV9JTk1JR1JBVEUuIFRoaXMgaXMgZXNzZW50aWFsbHkgYSBmcm96ZW4NCnN0
YXRlLCB3aGljaCBpbXBsaWNpdGx5IGRlZmVycyB0aGUgaW5pdGlhbGl6YXRpb24gb2YgdGhlIGJh
Y2tlbmRzIHN1Y2ggYXMNCmJsb2NrIGRyaXZlcyB1bnRpbCBhZnRlciB0aGUgbWlncmF0aW9uIGlz
IGNvbXBsZXRlLiBXaGVyZWFzIGluIHZmaW8tdXNlciwNCnRoZSBkZXN0aW5hdGlvbiBjYW5ub3Qg
YmUgaW4gUlVOX1NUQVRFX0lOTUlHUkFURSBhcyBpdCBjb3VsZCBhbHJlYWR5DQpiZSBydW5uaW5n
LiBUaGVyZWZvcmUsIHdlIG5lZWQgYSB3YXkgdG8gdGVsbCBiYWNrZW5kIGRldmljZXMgdG8gZGVm
ZXINCnRoZWlyIGluaXRpYWxpemF0aW9uLiBUaGlzIHBhdGNoIGFkZHJlc3NlcyB0aGUgbmVlZCB0
byBkZWZlciBiYWNrZW5kDQppbml0aWFsaXphdGlvbiBmb3IgYWxyZWFkeSBydW5uaW5nIFFFTVUg
aW5zdGFuY2VzLg0KDQo+IA0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBFbGVuYSBVZmltdHNldmEg
PGVsZW5hLnVmaW10c2V2YUBvcmFjbGUuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSm9obiBHIEpv
aG5zb24gPGpvaG4uZy5qb2huc29uQG9yYWNsZS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKYWdh
bm5hdGhhbiBSYW1hbiA8amFnLnJhbWFuQG9yYWNsZS5jb20+DQo+PiAtLS0NCj4+IGluY2x1ZGUv
c3lzZW11L3N5c2VtdS5oICAgIHwgIDQgKysrKw0KPj4gYmxvY2svYmxvY2stYmFja2VuZC5jICAg
ICAgfCAgMyArKy0NCj4+IGJsb2NrZGV2LmMgICAgICAgICAgICAgICAgIHwgIDIgKy0NCj4+IHNv
ZnRtbXUvdmwuYyAgICAgICAgICAgICAgIHwgMTcgKysrKysrKysrKysrKysrKysNCj4+IHN0dWJz
L2RlZmVyLWJhY2tlbmQtaW5pdC5jIHwgIDcgKysrKysrKw0KPj4gTUFJTlRBSU5FUlMgICAgICAg
ICAgICAgICAgfCAgMSArDQo+PiBzdHVicy9tZXNvbi5idWlsZCAgICAgICAgICB8ICAxICsNCj4+
IDcgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+IGNy
ZWF0ZSBtb2RlIDEwMDY0NCBzdHVicy9kZWZlci1iYWNrZW5kLWluaXQuYw0KPj4gDQo+PiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9zeXNlbXUvc3lzZW11LmggYi9pbmNsdWRlL3N5c2VtdS9zeXNlbXUu
aA0KPj4gaW5kZXggYjk0MjFlMDNmZi4uMzE3OWViMTg1NyAxMDA2NDQNCj4+IC0tLSBhL2luY2x1
ZGUvc3lzZW11L3N5c2VtdS5oDQo+PiArKysgYi9pbmNsdWRlL3N5c2VtdS9zeXNlbXUuaA0KPj4g
QEAgLTExOSw0ICsxMTksOCBAQCBleHRlcm4gUWVtdU9wdHNMaXN0IHFlbXVfbmV0X29wdHM7DQo+
PiBleHRlcm4gUWVtdU9wdHNMaXN0IHFlbXVfZ2xvYmFsX29wdHM7DQo+PiBleHRlcm4gUWVtdU9w
dHNMaXN0IHFlbXVfc2VtaWhvc3RpbmdfY29uZmlnX29wdHM7DQo+PiANCj4+ICtib29sIGRlZmVy
cmVkX2JhY2tlbmRfaW5pdCh2b2lkKTsNCj4+ICt2b2lkIHNldF9kZWZlcnJlZF9iYWNrZW5kX2lu
aXQodm9pZCk7DQo+PiArdm9pZCBjbGVhcl9kZWZlcnJlZF9iYWNrZW5kX2luaXQodm9pZCk7DQo+
PiArDQo+PiAjZW5kaWYNCj4+IGRpZmYgLS1naXQgYS9ibG9jay9ibG9jay1iYWNrZW5kLmMgYi9i
bG9jay9ibG9jay1iYWNrZW5kLmMNCj4+IGluZGV4IDRmZjZiNGQ3ODUuLmUwNGY5YjY0NjkgMTAw
NjQ0DQo+PiAtLS0gYS9ibG9jay9ibG9jay1iYWNrZW5kLmMNCj4+ICsrKyBiL2Jsb2NrL2Jsb2Nr
LWJhY2tlbmQuYw0KPj4gQEAgLTIwLDYgKzIwLDcgQEANCj4+ICNpbmNsdWRlICJzeXNlbXUvYmxv
Y2tkZXYuaCINCj4+ICNpbmNsdWRlICJzeXNlbXUvcnVuc3RhdGUuaCINCj4+ICNpbmNsdWRlICJz
eXNlbXUvcmVwbGF5LmgiDQo+PiArI2luY2x1ZGUgInN5c2VtdS9zeXNlbXUuaCINCj4+ICNpbmNs
dWRlICJxYXBpL2Vycm9yLmgiDQo+PiAjaW5jbHVkZSAicWFwaS9xYXBpLWV2ZW50cy1ibG9jay5o
Ig0KPj4gI2luY2x1ZGUgInFlbXUvaWQuaCINCj4+IEBAIC05MzUsNyArOTM2LDcgQEAgaW50IGJs
a19hdHRhY2hfZGV2KEJsb2NrQmFja2VuZCAqYmxrLCBEZXZpY2VTdGF0ZSAqZGV2KQ0KPj4gICAg
IC8qIFdoaWxlIG1pZ3JhdGlvbiBpcyBzdGlsbCBpbmNvbWluZywgd2UgZG9uJ3QgbmVlZCB0byBh
cHBseSB0aGUNCj4+ICAgICAgKiBwZXJtaXNzaW9ucyBvZiBndWVzdCBkZXZpY2UgQmxvY2tCYWNr
ZW5kcy4gV2UgbWlnaHQgc3RpbGwgaGF2ZSBhIGJsb2NrDQo+PiAgICAgICogam9iIG9yIE5CRCBz
ZXJ2ZXIgd3JpdGluZyB0byB0aGUgaW1hZ2UgZm9yIHN0b3JhZ2UgbWlncmF0aW9uLiAqLw0KPj4g
LSAgICBpZiAocnVuc3RhdGVfY2hlY2soUlVOX1NUQVRFX0lOTUlHUkFURSkpIHsNCj4+ICsgICAg
aWYgKHJ1bnN0YXRlX2NoZWNrKFJVTl9TVEFURV9JTk1JR1JBVEUpIHx8IGRlZmVycmVkX2JhY2tl
bmRfaW5pdCgpKSB7DQo+PiAgICAgICAgIGJsay0+ZGlzYWJsZV9wZXJtID0gdHJ1ZTsNCj4+ICAg
ICB9DQo+IA0KPiBXaHkgaXMgdGhpcyBuZWNlc3NhcnkgZm9yIHZmaW8tdXNlcj8gRGlzayBpbWFn
ZXMgc2hvdWxkbid0IGJlIGluIHVzZSBieQ0KPiBhbm90aGVyIHByb2Nlc3Mgc28gd2UgZG9uJ3Qg
bmVlZCB0byBieXBhc3MgcGVybWlzc2lvbnMgdGVtcG9yYXJpbHkuDQoNClRoZSBkZXN0aW5hdGlv
biBpbiB2ZmlvLXVzZXIgbWlncmF0aW9uIG5lZWRzIHRoaXMgLSB0aGUgc291cmNlIHdvdWxkDQph
bHJlYWR5IGJlIHVzaW5nIHRoZSBkaXNrIGltYWdlcy4NCg0KVGhhbmsgeW91IQ0KLS0NCkphZw0K
DQo+IA0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvYmxvY2tkZXYuYyBiL2Jsb2NrZGV2LmMNCj4+IGlu
ZGV4IDQyZTA5OGI0NTguLmQ0OTUwNzA2NzkgMTAwNjQ0DQo+PiAtLS0gYS9ibG9ja2Rldi5jDQo+
PiArKysgYi9ibG9ja2Rldi5jDQo+PiBAQCAtNTY5LDcgKzU2OSw3IEBAIHN0YXRpYyBCbG9ja0Jh
Y2tlbmQgKmJsb2NrZGV2X2luaXQoY29uc3QgY2hhciAqZmlsZSwgUURpY3QgKmJzX29wdHMsDQo+
PiAgICAgICAgIHFkaWN0X3NldF9kZWZhdWx0X3N0cihic19vcHRzLCBCRFJWX09QVF9BVVRPX1JF
QURfT05MWSwgIm9uIik7DQo+PiAgICAgICAgIGFzc2VydCgoYmRydl9mbGFncyAmIEJEUlZfT19D
QUNIRV9NQVNLKSA9PSAwKTsNCj4+IA0KPj4gLSAgICAgICAgaWYgKHJ1bnN0YXRlX2NoZWNrKFJV
Tl9TVEFURV9JTk1JR1JBVEUpKSB7DQo+PiArICAgICAgICBpZiAocnVuc3RhdGVfY2hlY2soUlVO
X1NUQVRFX0lOTUlHUkFURSkgfHwgZGVmZXJyZWRfYmFja2VuZF9pbml0KCkpIHsNCj4+ICAgICAg
ICAgICAgIGJkcnZfZmxhZ3MgfD0gQkRSVl9PX0lOQUNUSVZFOw0KPiANCj4gU2FtZSBoZXJlLg0K
DQo=

