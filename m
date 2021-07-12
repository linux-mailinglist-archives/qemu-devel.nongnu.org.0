Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EC03C63A1
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 21:23:07 +0200 (CEST)
Received: from localhost ([::1]:53630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m31WE-0005uF-31
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 15:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m31TD-0003o2-OO
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 15:19:59 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:45614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m31TB-0003LY-LV
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 15:19:59 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CJIVt0024392; Mon, 12 Jul 2021 19:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=LUyp9uQT1KvEzobKzSoq79FS4wymP/PwvDCXwAP9jT8=;
 b=lXBq12pTPfr2mN94uASTwOx4Cqm2YWhlQzhXpXx1BA7LCGRDyAtohpcRvS+2spnFc7xw
 Fsg/KlPK9eEWD7iwA91ksE+Jm2V+SkdVLJNf9sTKIIhpcqz53S4bJCDWsuPt3BLI8cXS
 YOmV1hIDimwtUHCad3Ws3OC6bDsDemDUq9QNxjK3wYn4BFBHkm3xsBAAlC/E0FBPE8j8
 KggyrHSfydowXYZeqp8O89k67TpTNa15+QpdP+Z9W6+PjVB3L3rXXRPA2flMHvdTteZp
 77huXT9oGwdXy+2kqAnqG+l3+YkXCuBT+O2OWDmaKpR7aIK8TFt3zOWVLpBaEZrJvYO5 qg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39rqm0rpqb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 19:19:54 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16CJEqpX124662;
 Mon, 12 Jul 2021 19:19:54 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by aserp3030.oracle.com with ESMTP id 39qycsmjwf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 19:19:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LC2Mb/JY/zuFeFYdHFPIwot4uRzFqnxxHvC6PXVv7fLmpMBIJ3/eqqI6kXaSJCtpUm6LV7DJWxgNBzknr23/eqkQTh+A1bl4wNqdu3qk2LrRT3U6TKOZYOXdsGEeoOQGzYsofeFkr9FOoU9gBFuGR+UxIsPzUUTxCO/TpQeiDIVE+IYHmdvFGkeXekGauLwEBSTb1YnNhLOgKIgmQJoTVrB7RPwND7wC0kHONs6dX7nGKMTCO4qSbjOWp1TgbQmqEGQdBAi9i0GrhONs89i+AO5LGiOXDkyeNFNpfdlec6caTRVlcqW5r48iT6zMlCbPeg0I+0SQ06CRPWW84L3Ldw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LUyp9uQT1KvEzobKzSoq79FS4wymP/PwvDCXwAP9jT8=;
 b=P9wSHhEhvEfsUYAaI6p4pkyzVyITGicM+k+dN0MWUBACxMEjr/dIISkB7qmuh+q7osDOHHXIxRhj73HRf7hqdaoHX+Sfxt9NwGUnvQkxraszo7Pr0XsSlnua+GqPM4ssXf9nEihe6yH3bl4PNHYHU+ct4zV4PF514hnir62ki4CW4T6ti1iG9V64Ewz2DYFrU4fYLpcb3SZ912VVEERtsLLj0EwTfebvIrsM23VRLzos0jsmuk6S2TAq3YVA22Le6L+5VdYG54VJcs4N765iCmUUn+RHplW2Wz00RGjyg5eauc0alh7M/TN9SFV9TaTKyouD1afC1owsEw6DkHe30A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LUyp9uQT1KvEzobKzSoq79FS4wymP/PwvDCXwAP9jT8=;
 b=mam1F8TqL2fnlkVHRDT2+oskj8zP35++MyubApyMgRJxhPI99K6ySrkYQY+uKWLTwPqEAm21JB4vQEt5q/LhEsyvSOpGfWHwhRH3AeM6aNfbeYekR3UhhIcAlqs6Y/lhgtnDTFHLhcZDa0bYBroWxdL6IRcHSTUMeK6LHLmRiIM=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB3128.namprd10.prod.outlook.com (2603:10b6:a03:14e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Mon, 12 Jul
 2021 19:19:51 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812%7]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 19:19:51 +0000
Subject: Re: [PATCH V5 11/25] cpr: restart mode
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-12-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1CLAKCE__kj4cMgGUvUzqfGkT1igbqpdQ3CZWtgD8SGL7Q@mail.gmail.com>
 <CAJ+F1CKfKw9UDcs-jo4SXNvPfEUKcQsyD9+Z1hN+rzw_FE1WrA@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <372734b6-a181-2b05-c7cd-93bd62a234e0@oracle.com>
Date: Mon, 12 Jul 2021 15:19:47 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAJ+F1CKfKw9UDcs-jo4SXNvPfEUKcQsyD9+Z1hN+rzw_FE1WrA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::25) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SJ0PR13CA0170.namprd13.prod.outlook.com (2603:10b6:a03:2c7::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.11 via Frontend
 Transport; Mon, 12 Jul 2021 19:19:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09c2500e-b03c-4db6-5e0e-08d9456a05d2
X-MS-TrafficTypeDiagnostic: BYAPR10MB3128:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3128823268D17125437D3AD7F9159@BYAPR10MB3128.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v32VPxfilGGP9pLhBd78IbBmWBisl9Mlo0r/M9AWtOuRnmnDkedwqqT0dTwjkC+P+BBpun8I2GnSLQ/s00wX5JEg1S9BrGkgywsBljow5FhFmHczLr9uQFycZS5xpjNya3zVNF+ZsTR3NzXbP5S/zHF6krPMtNpZAzeAefYQMx1YxMteQzTfsJOFCAYpBDa4sAO1mqKSZ2zyp1cKteRfzBBlA94H/CmW833VNFDenkx9srnLI+58gnCO0J0mvTmuo+tyY+WLKHI2NsmTDzEiYq6kkmHPwjBjasw4n/vyQOr36VBYUy7bxoM7WHV3KCyAMyQDYndJdySE2cPe8Z1/UTZr6kOurJRLpJdew+cdphWdFUYW3u7Lg/TOXTwLPF9TouF6eFeZOP0SnRXe3CVfX88Oda4uhw/tcj0LfjbOgKGUIkMkKHw84LAHDf0NBgTA8MHLpLGbMNQ3AlCGauB2hxnio5LgehG2DIM/k+etgynMVix2HGeY4gXHryW/e6Cr4lozhhPLqoJfF6sDYjo4sZ7QDUiKL0MfcpqiFgbVjdh+qZJn3DwLX69PZDkrO1XYBazrjlNBCPGYImH/fYrNP6LQ+KQy6rOffUfnjw86jpIB5u2hy26c6si04XE9RN9tRnmYAhY8l+Yj5GX3VVU8lNJ63DULLNW4FdyZbImsIYBAareHFrn5LC+THag9Iw7y4Kq/L6IVJ3YLEjW5J3zuFxi8SxLT5Zjm61IF1y24i1gGGxfVvnc9m4cGY4QSTOtLs9wNF3SYa8TGQaCridIWpYDpMKSiC8H5c0I31Pkr1GEfYDo00LKyFFCc6m/r25iN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(39860400002)(396003)(346002)(366004)(966005)(478600001)(2906002)(66476007)(5660300002)(66556008)(36916002)(26005)(8936002)(6486002)(8676002)(53546011)(66946007)(83380400001)(7416002)(44832011)(6916009)(6666004)(31696002)(4326008)(36756003)(186003)(86362001)(38100700002)(54906003)(316002)(31686004)(16576012)(2616005)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cURTbXNJaFkzRGk5Ykdpc1kweHdZWlB4WTViWSswRjYvY24zWjkrUHlSalIw?=
 =?utf-8?B?eExrczI0SnZDY0VFejZ2SGduR0RpajRmTk1vYUlYT0EzTkxJN0s3dlJ5NTFO?=
 =?utf-8?B?RXdPSUZ1ZkpmaTl0S0dQOWY3YUNsayszQUtNdlNCVEZKcmhSVUFQWXpNNUpE?=
 =?utf-8?B?aFpNeUV6Q3Fja0x3V2pMMmZNcU9jeXBIdlpQRUQ0U3JGVDZLdVBvelUwZU5r?=
 =?utf-8?B?Zm1Yb2phVVlUWGdHZFlIdUQ0SDdNam11YWhOODlMUnNUREZ5V0g0eXozcWhS?=
 =?utf-8?B?RWIzaVRBY0lhMVNaTG5VbUJadmFGZytMOGtXSGVpVjhkUnJmTTJaVDlXS1dq?=
 =?utf-8?B?ZlV5YkNmcDZveVk1eG5pSFBFbGIvdlZkZzRYMTVXMGhUbXMwSWlQK1B6VjQ0?=
 =?utf-8?B?K280cHBwZ0xhcThKREhEcDhNeWJJcERQNEFPcmwrcXpKYlFFRk1rN01NZWtN?=
 =?utf-8?B?b3ZYMGpuU1dSYWRtNFQ3WmRVWnpqMG9FZlNYYzVlRTFURmlMTVgvQzBhencz?=
 =?utf-8?B?aW1IdkZnbDZCa1pSVFppanM0bTBLUlBCc0N0SElObWt0djBYRXNQdEpFT3d1?=
 =?utf-8?B?V2RKR3ZkNjlZVmFtM0M5dWJHWGlKcVBzWlhHblNNRldKNCtnVGN6S0NYVU15?=
 =?utf-8?B?eWZGQ3d2K0JnblVyTi9yTE5GQWhzelMySjNHSmFQZ3dqVFhCQjNqdTJrNzl5?=
 =?utf-8?B?WGFYU2o3c1NGL29keElST0FNcWFubFNpMkFQVHdwaWNaa21wS1hWb3pORFRr?=
 =?utf-8?B?dXlIQmVjaUJCckZsL21pVlRrTkRqOFpBMjJwdCtqSVljaTZWei84MEVYOCsw?=
 =?utf-8?B?ZDdCN1VTUEpVaCtESkdMaTNjUVVPRnFzOUNVVEtKZUlPZHE5N01SY2lmQVAy?=
 =?utf-8?B?OSthNWhSODhzN1ZoMEtPcVdjWDEzQVBMRVVrSlFmekpjVVRFZkpMU0NBY1Vk?=
 =?utf-8?B?bkhUTjVSc1VBNnhId3VSUzFGSkVCL0pNR1ZHb3p6TUsyK00wOTE2NHQ0SnNu?=
 =?utf-8?B?U1NoZFdXRnJiNzVqdkdtbnQ1dVg1YkMrSDJnY2RlWGQvWWJrT3pOWHF5aU1Y?=
 =?utf-8?B?M29nMmF3V0lidUppd1dNdHFNOE0veUsvbXZ2TEVtTlZaR3FLWDdiV2p1UmlH?=
 =?utf-8?B?QzBzTmRxVlNnMGpNN1dxTnI4ZTNaODFhWVNpcUVqUWs5K2JPMUZFY0NQcEEx?=
 =?utf-8?B?cUJKVXl1NU1ZRDdBeE96L2lGK0JQYTNhaGVZay9rRWl6bUpQbEdkWGFiZjNR?=
 =?utf-8?B?WDkzMnZNS3hzdDVIK3VXaGsrZThaSElBTXhxRFdxYmk2Y1loNk83eVlmK0VR?=
 =?utf-8?B?c1NsYUVpd2xIV3BTdndubnloYTNnblBvMWE5M3lvWlJFQ0ZjUWhqdmRTL2Za?=
 =?utf-8?B?ZXM1VGVEcy9xUDZpUGVLblJHbXVTbmduV3k0S050eFN5c1dadXVnb1d1SExD?=
 =?utf-8?B?Z3k2VU5lS2JITnlBQUp0dlkvalRTS1JsSUIxYnNEdEh6TlVyQzViQTZvdDA3?=
 =?utf-8?B?NXJLK2NVY1BMVjNXVW9CKy9renppaVdjOTZtcWQ4NFkrNUFpKzJ2OUhVcVkw?=
 =?utf-8?B?MWc1aHNXb3djTlAydldVYnpsV2xldFE1M0liM3B0UkZRZ2J3N293Z2JHNFRa?=
 =?utf-8?B?RVNKYXUwU2VZSURJQVIyaWJsT1FEeEJubWNya21HZktaaTR6TWh5c0YrYkp1?=
 =?utf-8?B?WEpyOHR1d3EzSXU3ZS9heFBlY2JWNjQvNHNVbEVyMnZ4TGFuZWx5WGRDd0k2?=
 =?utf-8?Q?/MNl5d/C4AXdbTTkfpuwxv+Kntepl9B4714hLv7?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c2500e-b03c-4db6-5e0e-08d9456a05d2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 19:19:51.7587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zxWQS78koV0LHCPe0omRxT+mNICH9y+VZnmiWqxBkQFVT/1dsc9Lciq3XQtaLo4QVrghp2qZ7BhSleSKgjuOjDig+58n403+JXcRsn9iXoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3128
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10043
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107120137
X-Proofpoint-GUID: aZmZX4N1pjZDGCepfxJVObVfpaJj67_7
X-Proofpoint-ORIG-GUID: aZmZX4N1pjZDGCepfxJVObVfpaJj67_7
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/2021 11:54 AM, Marc-André Lureau wrote:
> On Thu, Jul 8, 2021 at 7:43 PM Marc-André Lureau <marcandre.lureau@gmail.com <mailto:marcandre.lureau@gmail.com>> wrote:
> 
>     Hi
> 
>     On Wed, Jul 7, 2021 at 9:31 PM Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>> wrote:
> 
>         Provide the cprsave restart mode, which preserves the guest VM across a
>         restart of the qemu process.  After cprsave, the caller passes qemu
>         command-line arguments to cprexec, which directly exec's the new qemu
>         binary.  The arguments must include -S so new qemu starts in a paused state.
>         The caller resumes the guest by calling cprload.
> 
>         To use the restart mode, qemu must be started with the memfd-alloc machine
>         option.  The memfd's are saved to the environment and kept open across exec,
>         after which they are found from the environment and re-mmap'd.  Hence guest
>         ram is preserved in place, albeit with new virtual addresses in the qemu
>         process.
> 
>         The restart mode supports vfio devices in a subsequent patch.
> 
>         Signed-off-by: Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>>
> 
> 
>     What's the plan to make it work with -object memory-backend-memfd -machine memory-backend? > (or memory-backend-file, I guess that should work?)
> 
> 
> It seems to be addressed in some way in a later "hostmem-memfd: cpr support" patch. 

Correct, but in both cases you also need the memfd-alloc machine option so that misc small 
segments are preserved.  For some discussion see:
  https://lore.kernel.org/qemu-devel/YKPEWicpOeh3yo5%2F@stefanha-x1.localdomain/

> Imho it's worth mentioning in the commit message, reorganize patches closer. 

OK.

> And the checks be added anyway for unsupported configurations.

The only-cpr-capable option in the next to last patch performs those checks.

>     There should be some extra checks before accepting cprexec() on a misconfigured VM.
> 
>         ---
>          migration/cpr.c   | 21 +++++++++++++++++++++
>          softmmu/physmem.c |  6 +++++-
>          2 files changed, 26 insertions(+), 1 deletion(-)
> 
>         diff --git a/migration/cpr.c b/migration/cpr.c
>         index c5bad8a..fb57dec 100644
>         --- a/migration/cpr.c
>         +++ b/migration/cpr.c
>         @@ -29,6 +29,7 @@
>          #include "sysemu/xen.h"
>          #include "hw/vfio/vfio-common.h"
>          #include "hw/virtio/vhost.h"
>         +#include "qemu/env.h"
> 
>          QEMUFile *qf_file_open(const char *path, int flags, int mode,
>                                        const char *name, Error **errp)
>         @@ -108,6 +109,26 @@ done:
>              return;
>          }
> 
>         +static int preserve_fd(const char *name, const char *val, void *handle)
>         +{
>         +    qemu_clr_cloexec(atoi(val));
>         +    return 0;
>         +}
>         +
>         +void cprexec(strList *args, Error **errp)
>         +{
>         +    if (xen_enabled()) {
>         +        error_setg(errp, "xen does not support cprexec");
>         +        return;
>         +    }
>         +    if (!runstate_check(RUN_STATE_SAVE_VM)) {
>         +        error_setg(errp, "runstate is not save-vm");
>         +        return;
>         +    }
>         +    walkenv(FD_PREFIX, preserve_fd, 0);
> 
> 
>     I am  not convinced that relying on environment variables here is the best thing to do.
> 
>         +    qemu_system_exec_request(args);
>         +}
>         +
>          void cprload(const char *file, Error **errp)
>          {
>              QEMUFile *f;
>         diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>         index b149250..8a65ef7 100644
>         --- a/softmmu/physmem.c
>         +++ b/softmmu/physmem.c
>         @@ -65,6 +65,7 @@
>          #include "qemu/pmem.h"
> 
>          #include "qemu/memfd.h"
>         +#include "qemu/env.h"
>          #include "migration/vmstate.h"
> 
>          #include "qemu/range.h"
>         @@ -1986,7 +1987,7 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
>                  } else {
>                      name = memory_region_name(new_block->mr);
>                      if (ms->memfd_alloc) {
> 
> 
> 
>         -                int mfd = -1;          /* placeholder until next patch */
>         +                int mfd = getenv_fd(name);
>                          mr->align = QEMU_VMALLOC_ALIGN;
>                          if (mfd < 0) {
>                              mfd = qemu_memfd_create(name, maxlen + mr->align,
>         @@ -1994,7 +1995,9 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
>                              if (mfd < 0) {
>                                  return;
>                              }
>         +                    setenv_fd(name, mfd);
>                          }
>         +                qemu_clr_cloexec(mfd);
> 
> 
>     Why clear it now, and on exec again?

That's a bug, thanks.  This should be qemu_set_cloexec(), so the mfd is closed for
any misc fork/exec calls prior to cprexec.

- Steve


>                          new_block->flags |= RAM_SHARED;
>                          addr = file_ram_alloc(new_block, maxlen, mfd,
>                                                false, false, 0, errp);
>         @@ -2246,6 +2249,7 @@ void qemu_ram_free(RAMBlock *block)
>              }
> 
>              qemu_mutex_lock_ramlist();
>         +    unsetenv_fd(memory_region_name(block->mr));
>              QLIST_REMOVE_RCU(block, next);
>              ram_list.mru_block = NULL;
>              /* Write list before version */
>         -- 
>         1.8.3.1
> 
> 
> 
> 
>     -- 
>     Marc-André Lureau
> 
> 
> 
> -- 
> Marc-André Lureau

