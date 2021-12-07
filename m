Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128F246B4C6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 08:56:15 +0100 (CET)
Received: from localhost ([::1]:57858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muVKg-0004xR-1i
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 02:56:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1muVFK-0006nk-Cf
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:50:42 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:39334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1muVFI-00069t-7q
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:50:42 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B753w80004252; 
 Tue, 7 Dec 2021 07:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=xLkivv8+MommNlmdq5bnLkxK9be6boZC6IBG7nU7wEU=;
 b=sb7020OKA0vUZcyTS6m4yu8GCGTR74o8gFXKTa+vB8EM61POl1kr451kUzgnK0bVws0c
 FTOSsKoVJKuL/AKEugbLlnntw9t16NATFDGeoTBjLGAgVLxszLoDBexhtwbtKtlWMUYs
 c3hjel9HUdmbju1g8uRa3E/o4u5isN5ZXagqYJ8QC1g8bG7NKXTq/S+f5faAtd+lUoAN
 LEO5exqYqkqofdUJ4UVItlv7QzUgfaPOmWjIjOQ3itOm1kqAO1aAazGirrIQVBificNp
 JleLaT3wlln3YHkCM1qb/BnpAxkKoSfdkPUA0IzKAd5cyObjLdROMu1GbsoHgjtGvdD2 DA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cscwccqaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Dec 2021 07:50:38 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B77f8ZG066758;
 Tue, 7 Dec 2021 07:50:37 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by userp3030.oracle.com with ESMTP id 3cqwex8vh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Dec 2021 07:50:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOcol7bdi/0uDT94SlZ4DwGfUdekKJ6A10T5wvKAjySarpT4m5KZBtP2sbOm6PyZRUPF3iplnfY6vj8xysfZJQEqMSe7bIjeah/US0JF1x10mkfV06dBQG5iu80hkjUFiHqmRl5hLuEkqVnoDzv73WSnJ8oK98UkG7B9ggp1eCvv22EQvdmIDtnKObzCYiirt7sOGaDOZgKVfzejg6Xr7hPM28sCMcVA+8NYb0kN0b4pAK+FxoUeCBN/gBMJx79uPCCihwtnL9g96GLUp0hcqzAwFsqK5yEJ8fb6x7SWmhMpQl2NMTpMdWPVwx7XHfCCuMSLep19QafAn5SlR6LQKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLkivv8+MommNlmdq5bnLkxK9be6boZC6IBG7nU7wEU=;
 b=Ku28tnV8K+8SlUM9PgLLvXy39bJceZsVgZVXTNYhERycLyruqe0EkCb4SZQwxcw3y/ZLgXYrEWud5/R520h6ZvmlOtd5qk9+VzYZ5LmUuN73rtkhSlu8jXtO3wEZf9fTSyhFbGi/7xTVPkdP8k9BN245IJdmqnPCXd4r9IwoQ+3tVNzZxj7+lY4tYvV2P4YiLk9rAx1mlI1Z+SpSOIy7I7Jv5Xz29Ox6Wi1nDzlMNteXspYQcdSnEgOL1144dc8n/dlZj6QM7+s9iD/4ri1fDpULMSoC2FE/Hel487G3E+GEXNwsmjjmCD6hX4LSWJqWMYW+9M4CjlJ+sqv4/KmRzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLkivv8+MommNlmdq5bnLkxK9be6boZC6IBG7nU7wEU=;
 b=z14vcRB5uVzk6PLSKWMacdY+6Ww9klzeRRKRDsxUEtyvoMhfFyTcNeZqNfHIKYF4oy3RKZQVOkwe4vB+YLHS/5FZD0XrID5AMecNjm8TpVX1epZn+Z/qXyxjDwe9pl3w0AWzcrL8NHhJk+uQVZo+UX23qK9aqJMn19LQRAPM0rw=
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BY5PR10MB4225.namprd10.prod.outlook.com (2603:10b6:a03:20f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Tue, 7 Dec
 2021 07:50:35 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::3c06:36a6:bab9:fffd]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::3c06:36a6:bab9:fffd%2]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 07:50:35 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC v3 13/19] vfio-user: pci_user_realize PCI setup
Thread-Topic: [RFC v3 13/19] vfio-user: pci_user_realize PCI setup
Thread-Index: AQHX0bouyjf0v/CLJ0mGIG22w9G486wLigMAgBtQxIA=
Date: Tue, 7 Dec 2021 07:50:35 +0000
Message-ID: <63C9EBEB-204A-4084-95C5-A8B907446E7E@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
 <faab1fd983815a5563b246849d68d57884d3fb41.1636057885.git.john.g.johnson@oracle.com>
 <20211119154230.0a06ea21.alex.williamson@redhat.com>
In-Reply-To: <20211119154230.0a06ea21.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7ebafe1-30ff-459a-470f-08d9b95640c4
x-ms-traffictypediagnostic: BY5PR10MB4225:EE_
x-microsoft-antispam-prvs: <BY5PR10MB4225485D896B819773A42D5FB66E9@BY5PR10MB4225.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NtJ4V63Yu8/Ancj5r0AnAHJYL4OTdUafImmwxSB+ee1cvLV9sJzLSULdd6jquU4fPfwVZOBXLZ8jtR463FLqhz6/7ptWq2kuEkhlLFHf8jCrzofPW4MCGMUzUq1xlZl9xwwBY4ihtIn08cOv7L5KUGCAzWqOLui/2zh0VjmBVXVIHGb1WYiopjNvPXKby0DkEo7Rg/b22X/7AtGF72sC84CYROB5II6OKrtAIRd51dW5q8sxKGdv3H81XRfZt5cR9LK7r3DxmHpbm370OSbi7dnFf6HRJ16gh5ULXcEu/4xg8VLfgqxNnxuegLASJX71fGhIEXotWKuhRPCtluNkqu9vS7oBDMAZRQMIwHQhOYE9o+thorAKYFrjpCFlRxDrcEbvDowg/4ZIdw7KfBJZGzBcRp5F5yqatKZrDcuQhdBssbg1Svz8HAf+axOrFEbXrCIUiPPgw5wULYGYGeLS5yYxZ1975BKiPEP54YDG794dI3mIXMp95wnI/tIaSXtWVditnhFY5u0PWpXtkh1uBXnux7fydI6FlHlxe1wv1pXlfrFsMY73KYrBD864Ug4ir3DRyoToAVjZZq7yt+OVbfkLHDb/OUZKrzImM3TLf96P3XOfQopuyOMITVC+3/qt+8K/MPECMjt+9aPjNmEzmSpAuBpdPs7ePISZrWYQbV5YqCjysLb2p3A/0fEJV+8xW4UgsXqtEjUxaDODGDPJEg6AgapAeCXw+iB/xpqzJFI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(71200400001)(6512007)(8676002)(66556008)(4744005)(66476007)(64756008)(66946007)(316002)(33656002)(6916009)(66446008)(53546011)(6486002)(186003)(83380400001)(38100700002)(76116006)(5660300002)(2616005)(36756003)(4326008)(8936002)(26005)(122000001)(6506007)(508600001)(2906002)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NEdUc0FGZEt0VWJsZzhhSkV4bk4xUGdQS1B6UkhUa2trZjJXUDdrb2EwbHZt?=
 =?utf-8?B?VklNVUFrU0UvU0FSam52emszZlo3dG9oK0MwR1N1SVl6VWFWQzF4SHR6U2dF?=
 =?utf-8?B?MDl2Z2hZN2tNdStZd1VPb1I1TzlRMVRzV2xNUlFVREJkMlFqZnQxL2dXdGJB?=
 =?utf-8?B?WXBhSVVRa2JkZ1dNMjJDakYwM3lUMUtFYnM5bzNFUmFNTkR5ZkU0Zm8zcXJp?=
 =?utf-8?B?Q1JsUmJOWXhsUThpbDc5c284dEJQNndEaUE3T0NramdCbzBzcjRwUkkvcUdG?=
 =?utf-8?B?OUFEeGgyalpaMHBRRnhZT3Q4MUVPb2Jxam5XT1c5bDZVNUlKWFNoM1psVk9l?=
 =?utf-8?B?ZURUMVJIS0ZwNm5acDVZSVRxajEzSUg0M1pIL0xjZms3NzFQN3JMbHR2UVJy?=
 =?utf-8?B?cEY1Y1FmM0o3ME5rR1c4MjJQNHpQQ05XZ3VhZHVCM2ZxNzFYcTNVZHkxQVZr?=
 =?utf-8?B?YzF1VlJ2aHI0cUhuTkhvSytJeWtvaklNY3hJR01UQktCSGhQbFFLMUt2L0tL?=
 =?utf-8?B?U2dDWm14VVFLNXdUanRWNVVmQm9aTUR2N3RKTEZVSDdSQ3ZFcUZRTm1hUmpl?=
 =?utf-8?B?Si9GaThJZjdlaUlyN0Y0dGVOZlFlaUNQOG1BZFZZQUlFMDdpdVBQblNMcllq?=
 =?utf-8?B?eXFLZG56K0NsWWRhL1p4bEo1TW5GZFZnSUQ3S1FhalZxS29TekNkT0JqZ28x?=
 =?utf-8?B?NjZWcEt5UCt2TmJFTWRYOXRZc3JaQ2s3UjBaNXFmWEEwZWZYY0l4amIwSGV3?=
 =?utf-8?B?QXppYlQ5TEc3cXUzN3MwYm9wOUNBU3VvTWNTczZCNC9wSGNZM2lnSHA2cWRM?=
 =?utf-8?B?NGtjOXdpaEZVb3EvVjNhSnFoVmpmVXpEeUZwTkhta1lLSm1aTEdnS0hxcXph?=
 =?utf-8?B?M2U3WklXR3J2bTNsa0F4OFZKWGJSWFBnS1M3OGI5cmo5YVBjQVJIaytIam5V?=
 =?utf-8?B?UGN2RWtzTWpZaUV5ODFNNzZic2xDeTVTTjh4SEFXNk05UVRIeXpvaTI0bjda?=
 =?utf-8?B?c2pZRC9NSC9CQkoxTnoyam1LSHpISWtMWXpSVTI0RWNaOEJNRm1WTmNBaHkr?=
 =?utf-8?B?YitGamk1RTlMSi9MUVU1bDVFc1lJcGZMbytVb09JT3hQT3VSdlNyckt2Q0lp?=
 =?utf-8?B?UUtHUklJaTRrNkJrNmNmUk5nZnhub2ZTSGJFemQrN1poWHBzejZsQVlmQjc3?=
 =?utf-8?B?OFIwd2dqTHpoWXNMdXNhRGZZTFpOV3FWWVRrcW5mRmsrTVM3NVJJaXk4U3JX?=
 =?utf-8?B?cVNDUVZWcXRKNng2TFNJajFydXdOc1dzZU1ISzFIZkdGelFTa0JSbkhZNHJr?=
 =?utf-8?B?OFFOaU40Um9VOXhIYkFrUmVnQ1diNEhNZC9wMEg4UG9RNzhwcENML0FqT3lU?=
 =?utf-8?B?WjhYRUpGM0V1SXArR2RjUXFEK0FiSHRNRVdSWTF4b0ttNVBrQ0d1STVtbnh3?=
 =?utf-8?B?ZGIvdnpVYUtWZkVQRWtLd3VJOTRNRkh4cVEzQmNaY1V4UWlraFdmakZlakhq?=
 =?utf-8?B?eXJkMWlKRGRHcHhmU0VRaEZybnoyc0V5aW50OVRYeEJ0UFpBUUNPZWpFQ2N2?=
 =?utf-8?B?dE91cVUzbkora0pnZGU0MHdTU0R4TkliYzFEcU83c1RLVEtCcUxqRi9QcWJZ?=
 =?utf-8?B?eGorTFNaOEptRnBzR3RUa0k4b09BV3d2ZkJOdlo1MXVsSFZ5N3lRTzhxWURQ?=
 =?utf-8?B?MXBKOThkVXcyVjJQUjZXdHFEVFBZeEFmU2twS2c2Zzg2L2hYZFhiT0o3bzdF?=
 =?utf-8?B?ZHRwbWFBckRLcFcyUHVTVW80WWtWVlhrZGxHQUpYOUkyODQ5MXJFcHFyUU1t?=
 =?utf-8?B?NTl4L2hRNTNMbkdXMzhJeUErSjNhS1dZQkhTV3pKUHZvd1ltc1FKV1VrbkRm?=
 =?utf-8?B?bjZmUXhHNG82N0hNQkczbnNOMFpSTE5vdHBNVTRLbUpTVmlTK3BGZ05HL1Yx?=
 =?utf-8?B?Y25jclFwd3NkZ1FpeWZYRTFQa3BwSmlMRWFMS2E5SStkSnVwZHkxVy8zbVRT?=
 =?utf-8?B?TUdQM1VSbURZdVpSNXpDYlgxTjJOZU95ZzhadEtmTW9udXlpV01uV3NPcXVL?=
 =?utf-8?B?c01tWDFYYVNXanNLZjl2NHMrb2FRY0VsYTNXWnFXYzJnaUFjc2F5bW5kVHh2?=
 =?utf-8?B?Qml4blkvTFVFaW9yRTErS2xVMWxFcVQ3RW8ycWFJSzUxRUVKa0sxdGVza2Qv?=
 =?utf-8?B?K1RUbXR6eW9Xd0dMWkZFNmt2Qk5HY2R2d1g3WmtFT1BsKzRGRHNKbzFhVmRO?=
 =?utf-8?B?OUt4YTRTd25qajZDR1lQaElxdUpBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B61490393A1EB4B899C7FF5349A8CBF@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ebafe1-30ff-459a-470f-08d9b95640c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 07:50:35.3472 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HJrwok5g7x8xMk4o95jbnDbs4Op7bIUh/cA6aZ+KLBiuoQucZBBTnCuEwkr6gEuRJUmmSKHRVCAyx4o4zVSntDPNjdAFl6y8iHzPS8oiva8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4225
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10190
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112070044
X-Proofpoint-ORIG-GUID: Wtl97xSFSu0pktuyCxI07tSFPCb3_MxI
X-Proofpoint-GUID: Wtl97xSFSu0pktuyCxI07tSFPCb3_MxI
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gTm92IDE5LCAyMDIxLCBhdCAyOjQyIFBNLCBBbGV4IFdpbGxpYW1zb24gPGFsZXgu
d2lsbGlhbXNvbkByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgIDggTm92IDIwMjEg
MTY6NDY6NDEgLTA4MDANCj4gSm9obiBKb2huc29uIDxqb2huLmcuam9obnNvbkBvcmFjbGUuY29t
PiB3cm90ZToNCj4gDQo+PiBQQ0kgQkFScyByZWFkIGZyb20gcmVtb3RlIGRldmljZQ0KPj4gUENJ
IGNvbmZpZyByZWFkcy93cml0ZXMgc2VudCB0byByZW1vdGUgc2VydmVyDQo+PiANCj4+IFNpZ25l
ZC1vZmYtYnk6IEVsZW5hIFVmaW10c2V2YSA8ZWxlbmEudWZpbXRzZXZhQG9yYWNsZS5jb20+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBKb2huIEcgSm9obnNvbiA8am9obi5nLmpvaG5zb25Ab3JhY2xlLmNv
bT4NCj4+IFNpZ25lZC1vZmYtYnk6IEphZ2FubmF0aGFuIFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xl
LmNvbT4NCj4+IC0tLQ0KPj4gaHcvdmZpby9wY2kuYyB8IDg5ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+PiAxIGZpbGUgY2hhbmdl
ZCwgODggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEv
aHcvdmZpby9wY2kuYyBiL2h3L3ZmaW8vcGNpLmMNCj4+IGluZGV4IGQ1Zjk5ODcuLmY4NzI5YjIg
MTAwNjQ0DQo+PiAtLS0gYS9ody92ZmlvL3BjaS5jDQo+PiArKysgYi9ody92ZmlvL3BjaS5jDQo+
PiBAQCAtMzU1MSw4ICszNTUxLDkzIEBAIHN0YXRpYyB2b2lkIHZmaW9fdXNlcl9wY2lfcmVhbGl6
ZShQQ0lEZXZpY2UgKnBkZXYsIEVycm9yICoqZXJycCkNCj4+ICAgICAgICAgZ290byBlcnJvcjsN
Cj4+ICAgICB9DQo+PiANCj4gDQo+IFRoZXJlJ3MgYSBMT1Qgb2YgZHVwbGljYXRpb24gd2l0aCB0
aGUga2VybmVsIHJlYWxpemUgZnVuY3Rpb24gaGVyZS4NCj4gVGhhbmtzLA0KPiANCg0KCVdoZW4g
SSBhZGQgbW9yZSBjb21tb24gcHJvcGVydGllcywgdGhlcmUgd2lsbCBiZSBldmVuIG1vcmUNCmR1
cGxpY2F0aW9uLCBzbyBJ4oCZbGwgYWRkIGEgdmZpb19yZWFsaXplX2NvbW1vbigpIHJvdXRpbmUu
DQoNCgkJCQkJCQlKSg0KDQoNCg==

