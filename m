Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FD364E6AB
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 05:24:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p62FW-0001mJ-6y; Thu, 15 Dec 2022 23:23:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1p62FS-0001m2-Mv
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 23:23:03 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1p62FP-0008BQ-Dt
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 23:23:02 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BG2Ju0N013431; Fri, 16 Dec 2022 04:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=sfx/LOkQJXp5mQ25LGMbKT2AI4oT5W92Rd4MtEqDI48=;
 b=GOQeJ4GKiyUe4LEdesGABYfcgLFpBxtROLZfx6R2SHckyVdpRDkFQB2xyBnlSGPol7y+
 qdcKZZ9k/06vzD/KbNgeCkyfv8WvQjST4A1HOq5U6Co1NRcdCI4l+3mCgcxwD5fI9AJJ
 32G1B5+/sCsh6ZK5Al8RcO6ui7zbIvzNgAImgoseebAe2vJm+Sbvu2hG/Al4LBpQm8se
 zQ30oNy/+zZfbOLbv94sZ2pLTaHUlktbubduzxZG6hvUGUehcitOtU4ll/BeTE5cJfR3
 0TVSFR3tsn0JS1rWtc+3OQwH943TPwHPIBnPb9cxZcfsx7MiYopql3OwYUggcKDU1VvS 6g== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3meyewxqq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Dec 2022 04:22:53 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2BG2SIkD000884; Fri, 16 Dec 2022 04:22:52 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3meyesjdmm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Dec 2022 04:22:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BaLB2/KBE/fdYrlSStlTNKYW+RiQNnDkGfckxIuRH/eGiTQTk/bK0YgjThm6z9wfe1x7e+tIPRTBDKXcM1coWZ9PMEaTLvhBY9zjF5vRsunRUqVwfraXcYZrDuYwbKTLNNOLAngLpl5dJaoDUKvIokkWN92dySs87azJd5ghFZW2PMf/QksrTzb7zWu1bj/811993Rj4ri+b8GeEKWv/OaEEHMaC9Wqo5piTPKCsgVXavFkA1mgnspKOhkHjvKKfG9xPkatZq1n7wn7fxQOGfLo3hJdnghyFXgiVZbNxkJp/bZX8GD2Ou7j8MvZQ1CrCeWiv9vNfwPWE1bNf2e7ESg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfx/LOkQJXp5mQ25LGMbKT2AI4oT5W92Rd4MtEqDI48=;
 b=YjhLnhcrco6SSR1UTu28D/X6J+7ZEtocwFlz4fGvL8n0vAv1n1QAXYUVOUCKeZ+zkKTmqrh44B4Ay+hLZ+3cu7yNEUgD6+27Thk+UIrEApuB0+ch8p7sY2KRYf1aKveQAE0zIFixHArKyMknSIlcdKH/H0KMoT+mu4Diy33UJiwDepJFdFGnUDSaMJB2OWZCE/wsbA4IsGUmlgXLQ1jYGsIW0lE885SmA6apZaTmY6HigRo98lo4lz+f7CXTgyEgWW7OTAeKy4S7y66cV74NHtbwcl1AMh+OZcIaQlo5tOpS2QixLICnfF4/W8tHfsnzcakwaMS0VqETh1SBIykSAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfx/LOkQJXp5mQ25LGMbKT2AI4oT5W92Rd4MtEqDI48=;
 b=G8L0NW68IQqktObxaI+GlQuwnmN0NWklLV1xr8lamisZuMP++7Ui2MnCUqB81gOS85QqpxIJn0/MSu6eg6RH93AJ5vWTKcBIp3QxuHSdwfYtyuAJuV8NV1TAe+alO3bQDC3PMTrqLdRqah2jxxVGBlkfXo3Ck7obRPbeAMd3m/o=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by CH2PR10MB4197.namprd10.prod.outlook.com (2603:10b6:610:7d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Fri, 16 Dec
 2022 04:22:50 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::da0c:ff3e:b01:7730]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::da0c:ff3e:b01:7730%5]) with mapi id 15.20.5924.011; Fri, 16 Dec 2022
 04:22:50 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v1 22/24] vfio-user: add 'x-msg-timeout' option that
 specifies msg wait times
Thread-Topic: [PATCH v1 22/24] vfio-user: add 'x-msg-timeout' option that
 specifies msg wait times
Thread-Index: AQHY86IdVFnn81eSQ0OeupThNJmIR65vIgqAgAECzoA=
Date: Fri, 16 Dec 2022 04:22:50 +0000
Message-ID: <A2704937-3E82-4E72-9215-2DA9B667A046@oracle.com>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <c7fc9005cc61d7ca53156ee5ece4c17980a78b15.1667542066.git.john.g.johnson@oracle.com>
 <bfa00c52-8e1d-0abd-ff4c-72724620900a@redhat.com>
In-Reply-To: <bfa00c52-8e1d-0abd-ff4c-72724620900a@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR10MB3255:EE_|CH2PR10MB4197:EE_
x-ms-office365-filtering-correlation-id: a329cf50-63ad-4956-0061-08dadf1d3162
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wdjl7nGTYT0QxAU1cRPccNB7zV4+hMGFHA2yuocWR3c4ImU97imyvumbUYrKcyFpQaLBSXU+kjIPWthi926yn+mbAIZEyQr8QmctbKgaNt6cXbO/0yPr2LHVDpMp8cn3TBDbsx7Rry0E2m6BkzOssi4M4XPY0ZbsLn3ADBAjxMLE3qwHEeaH+BUyQKvm7G56FQ1nLBBHgOtH82QFXKrZK+VY5Hr8blWG4ysYHlQpbvGB6ARPuPi2waA2sqNLjYiiivYQnE7owzPmS329DkEI4M6ySy087VpjQvPRlGIy6BFvHu056jS/SUch+28M5Tzx+kjECeZTHod17CCgf+bv9M74vQAHRwAfaV2ngPYgzYCQFjGh5SrVbBKEJwgr/XytOU6WhB2wVQElIEWC98t7y32C/Qa2WfKLlJTU8UksZIseBgSZnpOQFKMsp2BxeqEc/3cqlgrxkqKph/2XUEFaNIhKu2p0ixuJmCKlFsE3BMRdaUqx5IdTwzU9cUz0NxK3ggcwHEisOguuZtki1vftcaISK7yoJlngw2tf+3QeP1E/REzN/oRvXNTqpYCTBnLqgCTbt5IdZagu1RQsBVMrG9r6vAP1nHdGk7huTNVyjWY4XA+mHzAEWqVzBraSIs9HMttB8dY4AIKgScyKUSgvlsU6AzuCX8MeYcYNr2eGvQ+b3i5QH3X+UBMm3sh5S4MDANc9PxAW3z2oCwn7/habcRYM2//Me6y93hwauobq690=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(136003)(376002)(39860400002)(346002)(451199015)(6486002)(71200400001)(478600001)(26005)(186003)(6506007)(53546011)(38070700005)(6512007)(316002)(5660300002)(2906002)(33656002)(4744005)(64756008)(36756003)(76116006)(66446008)(66946007)(66476007)(8676002)(4326008)(2616005)(6916009)(66556008)(8936002)(41300700001)(86362001)(38100700002)(122000001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y045YmI0eVhnM2dLK3VJSzkwSVBsT1hLMG1aczZ6TGllRXpNOUlJS0hLcTI1?=
 =?utf-8?B?WHFPSkpRL3JmQVZxUTJxMmRxQnRrb2QrbkRsQjVzQ0Nrckdoem50eGlWdWds?=
 =?utf-8?B?NlZxNjRFNlhxODQ2VThBbVdUa3NnS1kxQXhrdENjbDF2cHlSYll1SFN2RG4y?=
 =?utf-8?B?VW9JcTh6ZVBmN1FxQjZTMitBT1J2OHlrbTR0TkRvNHlzY1FobkxoU0RDcjNJ?=
 =?utf-8?B?eW0wLzdpSm9VcWxIYlNpcWl5YmtGQ1pyM0JLL3pjdXJYdmE0akxHK1k5WnBi?=
 =?utf-8?B?TTNWWitXOXZEek90akVKdkV3NVd4NnIzRGpYdHAwOUlCblMybWFGNlRnWTZM?=
 =?utf-8?B?UVh2aVA0L1F0VzBhTnhWWHNHdFBEM040RmUvVzl4MGtQYmJ2b3JSQjZRcnNr?=
 =?utf-8?B?b3VMSkFiMEVaczF6VWZDRisva2xVS3h4QmxidXpOa2hUSXpLMlV3NGVybHdZ?=
 =?utf-8?B?UWVDakRRSGQ0UDlrTHl1emYybFBVaUdUYyt1Zkc3WHNndHFLME5BbGxMU2RL?=
 =?utf-8?B?elV6ZVJDUXluTXpDdEsxTmdISFozRkZvcS9oMUdBNml6Y04rdjlJT250cDUw?=
 =?utf-8?B?bzRJTEVoMHpLdW1iSzNmUC9xcjBtZmNXREcwUTd3KzVlczJNbGdRVkcxY05s?=
 =?utf-8?B?c2JYSGFGS1k5cHB5ZUFqVjZmKzhRWlpta212MkNoM1FwaFNZM25QK3h2aENN?=
 =?utf-8?B?ZEVxdjVNdFFPT21OeXMzOWRKSnFHRnk2WjZONVN3SUhmMUFzZzl1cGp3Q2VZ?=
 =?utf-8?B?Z2VUN0pIcDlQSDdGUnZaMmI5TnordmlwVVdoSmxSL2tTZzlxUzZHdUlJTFI2?=
 =?utf-8?B?M2ZOdUtKaWJlSmlmUmM5UXFIVHRXcFBsQkZNQTdMaXByK05ydEJDYWFVN2ty?=
 =?utf-8?B?Vy9vZS8yYVRHZXJCWnNxNWk1bDZlLzh5TjBRbTFRZmF0MUNTS05rRXBrdEo2?=
 =?utf-8?B?VkpLWEp5UzdHdFdWaWw1ZHo0T0FNVGpybUtEZTNJM1lKLzVXbGthemlNRHJW?=
 =?utf-8?B?VUpQT0JIMzhBcDBjK24zRVd0QXlTVi9oaE1oUjR4a3RocVdrMkdvNFdxTVhv?=
 =?utf-8?B?OFhOZDhBaVFBU0t5clZrOGZ3V3labjRDai9vc3E5aEluYmNQdDBCZzNjK3Rp?=
 =?utf-8?B?UXZzeHcyZnJ6b1NuWlNyeStwZXBxd3VRZ2xWaWI5Smg3YUI0eEkrV1k5YXpx?=
 =?utf-8?B?SWRFK0NDWjlxZUo2ZHRyR1A3WC84a1FrNjByMnZjV0xNeGxlWWwzb2xlR2ZS?=
 =?utf-8?B?K0wrV3ZqNTNYcDg2eU9aNGp3NndYWGhraEtaT3RxVFJNU1lmZHpQNmdWRzBX?=
 =?utf-8?B?Y3RVbGhwWGw0NklJVXBPTHdRRGQ0REhzT2NtaEJqODdyWElyVkhTV0dvUkI5?=
 =?utf-8?B?ZHZIYXl3aHZTUHk0cnpVeGw4NkdabjE3aGNUSG84d3JQTlkvNXJ3OG0yZXp2?=
 =?utf-8?B?QzgzUmhKbWd6UzVOVTNOaW45TVRHU3VjL2FZUVFSNEdWTmtlQ256V0loeE9B?=
 =?utf-8?B?WFQ0NlZXMHFoS21XOElwS0xzRW1RaG9HbCsyYkJBdStrcE9JRXhRN29mOUs4?=
 =?utf-8?B?Y1YvY2FyUnpRQjBMVUpyNTNHR3ZYZ2sxSjRzSG9pd1NtSVpFN0gyV1JDNjJt?=
 =?utf-8?B?c3U5UFhNRk5KTHh2ZzYxNUMxWStVU3l2L3BnUWdtYUdvQ05EeDJ0U1U0VUNB?=
 =?utf-8?B?NXR6S1dEcTd6M05oZExFd3FibzBiY1dYaTQ0YUlnK1lZS0JsYk5DTmlvWE5o?=
 =?utf-8?B?aFFQajFhWFVSM3pSQVlCenRoTVgvU245MmZrcTZkV0FBdDZOOHViOUVMZGF4?=
 =?utf-8?B?M0M2WEhodTFJSVVING5pZnFGcW5Na0Y0YUYwbEFwajFCeGU5QzAxM3p3bHNM?=
 =?utf-8?B?T0Iwem8zOUkvMlRsajllaWVyMXFRWVFEanUvTFh2R2h4Nk9MQ3pmOEVKTVB5?=
 =?utf-8?B?dGdwTE9kdk1QZElVN1Iwa09BWW1IcXBwTEpjdkxBNXRicndmYW5GV2NMMzQz?=
 =?utf-8?B?Y09pdmhVZ05GNVBzVEd6czh5NHJYZUZKSW5Ka1JFNGcyUzdKdTZvNTdIMkNY?=
 =?utf-8?B?WUl2N1BpWHJvaHVrOUJBVVB0L3kzcm1MSDZIT3htdDUxY2pJOVVCbGlFaSti?=
 =?utf-8?B?ZUxhUUQ5VXRjWE9sTmJXdUVoSFA0MkRuaktxQnNNTi9QYjU4WVlvNWhrYTdO?=
 =?utf-8?B?dWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <438F285CC3676A44B131A8DF03DE5B6F@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a329cf50-63ad-4956-0061-08dadf1d3162
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2022 04:22:50.1742 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hrBk7xV+pjJCbfeH/XwWArbWoz+7GEZz0Vnaq0w8yUH3IEAY0gz5B8IXsp9TXcjxwxjEv046G8oeqobC/4Bq/AoIGLLRkiIHBgv557Pt6k8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4197
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_02,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212160037
X-Proofpoint-GUID: W_7C2hZPQqOrdDOiOT7Bc3CJ5-OMt-Vb
X-Proofpoint-ORIG-GUID: W_7C2hZPQqOrdDOiOT7Bc3CJ5-OMt-Vb
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

DQoNCj4gT24gRGVjIDE1LCAyMDIyLCBhdCA0OjU2IEFNLCBDw6lkcmljIExlIEdvYXRlciA8Y2xn
QHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gMTEvOS8yMiAwMDoxMywgSm9obiBKb2huc29u
IHdyb3RlOg0KPj4gDQo+PiArICAgIERFRklORV9QUk9QX1VJTlQzMigieC1tc2ctdGltZW91dCIs
IFZGSU9Vc2VyUENJRGV2aWNlLCB3YWl0X3RpbWUsIDApLA0KPiANCj4gSSBzZWUgdGhhdCBwYXRj
aCA5IGludHJvZHVjZWQgOg0KPiANCj4gK3N0YXRpYyBpbnQgd2FpdF90aW1lID0gNTAwMDsgICAv
KiB3YWl0IHVwIHRvIDUgc2VjIGZvciBidXN5IHNlcnZlcnMgKi8NCj4gDQo+IE1heSBiZSB1c2Ug
YSBkZWZpbmUgaW5zdGVhZCBhbmQgYXNzaWduICAieC1tc2ctdGltZW91dCIgdG8gdGhpcyBkZWZh
dWx0DQo+IHZhbHVlLg0KPiANCj4gaG93IGRvIHlvdSBwbGFuIHRvIHVzZSB0aGUgIngtbXNnLXRp
bWVvdXQiIHByb3BlcnR5ID8NCj4gDQoNCglJdCB3YXMgb3JpZ2luYWxseSB1c2VkIHRvIGVtcGly
aWNhbGx5IGRpc2NvdmVyIGEgdmFsdWUgdGhhdCB3b3VsZG4ndA0KdGltZW91dCB3aXRoIHRoZSBk
ZXZpY2Ugc2VydmVycyB3ZeKAmXJlIHVzaW5nLiAgSSBrZXB0IGluIGNhc2UgbmV3IGRldmljZXMg
d2l0aA0KbG9uZ2VyIHJlc3BvbnNlIHRpbWVzIGFyZSBlbmNvdW50ZXJlZC4NCg0KCQkJCQkJCUpK
DQoNCg==

