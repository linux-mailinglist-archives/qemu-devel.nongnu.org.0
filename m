Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C880357C01
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 07:53:09 +0200 (CEST)
Received: from localhost ([::1]:33626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUNbI-0007ed-Et
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 01:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lUNZt-00077x-NV; Thu, 08 Apr 2021 01:51:41 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:43038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lUNZp-00048Y-13; Thu, 08 Apr 2021 01:51:41 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1385mo65115982;
 Thu, 8 Apr 2021 05:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=XzySDvNAY2uVtnyW7vvR9oTwpAQkOCmQUwdONNISlew=;
 b=pvHg71hqKvxoyElk9bHBf5WTJd0/SNtuhssxkEpwF6mpNMjGLMRqnTaABGh44PUtgyzX
 6k/+Uu9y1ABg6Wcp7QVGsgL4lQSY6C44DRndYoRwQSlAFdFefDwTF3LRirmawS42q/IW
 IiuSPX6wa6jOsKYxPyM24kByAovR9vgAXh4CVHQ6ZcjkX6zarbzrEVrfZ4jaN+MBrxOs
 KckGDteuXTx/0CP957aficrH5uWKv3q1A//7hgBVOWvyTXUutMJKVtYneSgVDnt8zGBA
 +6zCdMi3i2zOVcWzVGjUjj7gW7DbILDo3Wdh+gX4q8lNNUhJBRsiPZ8/PymQH9KyrxSN dg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 37rvas4nrn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 08 Apr 2021 05:51:32 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1385o03C194115;
 Thu, 8 Apr 2021 05:51:32 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2050.outbound.protection.outlook.com [104.47.36.50])
 by userp3030.oracle.com with ESMTP id 37rvbf87e5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 08 Apr 2021 05:51:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krnmtQKKLGLFgQ9hhGBi8WtdiiBP6DqfkpRFSkJ+oXZVvA2LUn3X19gI1VMZIt7CGvqFfhm1ENYmlDmdl/M63c02/0PWJqcGuMfOzy6C6DBh5ssZunqjvHOM8BbmG1oFDD6a9r+KkAJttPMEwh2pAFnF+NjPI9nZR9JA9iCmxDssQ3PjmTMlM/FYzJrv2VIoixVoIH9Ngue3R+5Sojfjmh2gTKK1NR8ML4fjmzssIKlrqRgAxlrRJN4dmavvLQV1A+veSUBT42cTnOWHy5ic/XWo/fUfHcRd8waRhTCywKq4mi69BCgAhzeCZEYx9IdxhZHRVc4qD+2CyX+mlyuH4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XzySDvNAY2uVtnyW7vvR9oTwpAQkOCmQUwdONNISlew=;
 b=ZQ3sw9t/fk8QHLWpgJPx3DaTomiOWUOcj3T7LED3+Tl3z8dcRx8v25EnGiESGRBkPKkW0t5Y5kVOGQ4Y/h1YsxGLm03MBmuNto7I1sjdvg9U7hF5dQ6pMaGRGEGDYBFSDNW6XtsAx4PGhdv4QypmZjo9uHB/rkJTbnB5N+NK9cRmcdz3mSh2QOoBUz8Ui/KgdQkfoNc0Xrh5e/GDXBXVG6CudFgeWbj0s0IPX51jOGVUeeoSnFlYUnoSyVFkV8fUi4cAcAQa3jjREA0aStVVOexDC8J3HJ9QChvBFwIzBQVmW7PFIHghi/WKOr0Mr/BQRu/FnCxq3tFPzcYLz5OQmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XzySDvNAY2uVtnyW7vvR9oTwpAQkOCmQUwdONNISlew=;
 b=pSkRNSD/e10UCSKI3lI7EasgTCwXpNVxxi53IHzvWAauQRsgH3jU3WtrxrpFTUhAReJyvfn21f6DNv9BOkTfZt0h6xBBPaGm3KCRk3cpEjhwiTS7KLQDWTIO7YM1mAz23OuZ50yWAJ2H4ovcDa3uHhjgC5bDWSxxlCnN4A3x2Hg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Thu, 8 Apr
 2021 05:51:30 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad%6]) with mapi id 15.20.4020.016; Thu, 8 Apr 2021
 05:51:29 +0000
Subject: Re: [PATCH 0/6] Add debug interface to kick/call on purpose
To: Jason Wang <jasowang@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
References: <20210326054433.11762-1-dongli.zhang@oracle.com>
 <440216a8-821f-92dd-bc8b-fb2427bdc0e6@redhat.com>
 <d5549b12-d269-a04d-01d2-2dbd1ee7fca0@oracle.com>
 <ceb1f31a-e353-2542-a516-68b49735672c@redhat.com>
 <9248ae00-9a7d-c960-a673-9b3a3ede0452@oracle.com>
 <da0ae46e-da09-5894-21d4-732e5e20d070@redhat.com>
 <2e48f463-0a17-4ffd-c3a6-4a847e0e34c6@oracle.com>
 <5b21b2a2-e3bd-3812-61d7-bd3550cf680f@redhat.com>
 <f2a81508-e000-4a48-a023-290d40a77b8e@oracle.com>
 <b96ca94e-01a6-f018-6d11-d3837c9501c1@oracle.com>
 <41cec775-8d41-8bf4-7ea6-ea45343dc451@redhat.com>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <7074ef2d-8410-3815-791b-84c3e034e872@oracle.com>
Date: Wed, 7 Apr 2021 22:51:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <41cec775-8d41-8bf4-7ea6-ea45343dc451@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2601:646:c303:6700::d22a]
X-ClientProxiedBy: SJ0PR05CA0134.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::19) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2601:646:c303:6700::d22a] (2601:646:c303:6700::d22a) by
 SJ0PR05CA0134.namprd05.prod.outlook.com (2603:10b6:a03:33d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.9 via Frontend
 Transport; Thu, 8 Apr 2021 05:51:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 711d8da0-70d2-4f16-5ef8-08d8fa525b2d
X-MS-TrafficTypeDiagnostic: BYAPR10MB2744:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB2744B8171CB9E587ED665578F0749@BYAPR10MB2744.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Xy/CkmvgeD4hKUT5X/3WnuSJ60N/c5/mlCCS4ehaY/OxA/URkQI9ZSY5356xvE5InROfidBCawhnQHx45JeC3AWT70NDYi7zQwdXeQ5NbPTEH1f5dZ7uuCm3yDkN9GiFnTQGGcmdCfEpMeyugiwcONDOXU5YOdPUA9l0IzSEiOK8/OwNLSASw5eGx+ldbx0PKoulewGO8TWu2s5j0oLK6kX+ESLijJ4hR3n0+IdmPYdQS//spA4xmPGegImM6Qx7d5rVMVDdlPMnHSkwq7DLAn3mIV475WMOumXbeQvXIIlyjkV3dDXfh5S8MQMPuD8zEaijBDi/YTpXqiMGdG4OgqzD/KhhmaMrNijlz3yGl0O6hkBVYm7kJJRVM6Fx7uM4pZjTxnLwtybnTPsiOc67+cGbh6U/J7O921P7gIlxfx8IZcWEitSIOSPcJE4o+LeEl9gdIEWN3H+CCfT1K5TGzL+M10stJIB1ZRKixYAXKIgTcEnxjPuhzaEIyuOul/Cq8RVCtpD5AgyUIFy7pGG1sY6i6qgRDri6OF50t/VzAqp/B4D5kWLLAXIbUWNsKEqSzpIF2L+XF9XuUH2f8y7E2M+f8HRk2gDUU28FOVQUfPNblkADgxUmYnJNEchoAxEdhleC7iU4aruZMBr0c0ejDyDFcVd1me7v6uOOlQ+xOkWNqiAtEaKaDyhexgxN1wewqTonQu65bf+Nxdu8ZSZxRdUYHLaFt73DDEyBe/gUro=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(366004)(396003)(39860400002)(376002)(478600001)(66946007)(31686004)(7416002)(66476007)(83380400001)(6486002)(53546011)(186003)(66556008)(31696002)(2616005)(44832011)(2906002)(86362001)(316002)(36756003)(16526019)(8936002)(4326008)(5660300002)(8676002)(38100700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NXVsemgrVDFFakxnakliWk96YWR4SGNBeDNIOWZBbTMrRkNpOXVMRWxlbmd3?=
 =?utf-8?B?VGJOcjUwWEd0ekpodk1va0twbGpCQUxlbFI1OXVGd25jckJDRTJMVDhTR2dP?=
 =?utf-8?B?U1p6bEQyVmJDbXhHUlQ2NGFHU0xGTGRIRG5CQjlXNHhCYjg1USt6bjREeGQr?=
 =?utf-8?B?enQ2SlBrUGZ1ek5lci9YN1A5QWplUVloRW5LcmxWRnIyMEU5K0NzTFR1Vjh4?=
 =?utf-8?B?dCt6d2FWamRxMERwUyt2K2NrU3U4ckc5S3VYVTFueHkzakx0ZGpFM2ZiblAy?=
 =?utf-8?B?TStMaW9qUU1FeDlTUEgvNEZ1SE10NEgzRGd1V200T0R5WGlZSy9FdlZlVzhi?=
 =?utf-8?B?MVN1Z0hlZzJrZ3I3V25QZWtmQzZIdUU3UWYxY3JRYkVyNUNLWkxpWndDbU5y?=
 =?utf-8?B?ZGEzamNCNVpMcnNENE80bFh2NEtKQUhEVFRDbVJpUzJPaTdjRkd2WFZnUnB0?=
 =?utf-8?B?MFBsbmYreWxRRTNZcmhZRnB2MWc5UUNTWktab1pIQXhxcXk2bU9EWWRpQkNj?=
 =?utf-8?B?eTdxOXJWRnE0UW9XaW9aUVpYTnhpeHVjOFluajRjWFQvUUU2NFcvWnVmQk44?=
 =?utf-8?B?SDhEeVVCa1FLd1c4MnhCMjFjdC9rd3lVVzc5SzB1bjgwbHlROWhMYW1lNEVa?=
 =?utf-8?B?d3pFc1JRK0Q0Q0lxSEh1WFgvQUJ6RitNM1BJOFdDV0V2WGg1d0RZVkZQUk03?=
 =?utf-8?B?QndVeFloZW1NWU5hNk42Y1Uxc1JxeFhXMlNzaGxucGRpZ1d0MU1BdW4ra2Y2?=
 =?utf-8?B?QW9KK1dDTHBzeEJYZzNuNWdDcVdGNDAxcSs2ZzczM2NxTnJjd0VnUE1SQml1?=
 =?utf-8?B?Z1BIdEZ6ZWxZNmhHYWk3dlcxTjFvVDJPbFo0dGtjUUZQUXllTUprcWw1akdR?=
 =?utf-8?B?THlOdmhHWUhQMGJkZzlxWVJPZExja1RqeFdZampXd1FrSUFSRElVbVgzRHo4?=
 =?utf-8?B?clpsNkFCN3hlM09NZ3ZnTGY2ZzhTdVVtYktUdm9paTc5ZlpldlJTc1hzTXcw?=
 =?utf-8?B?T3pwMkJNMHZUZW1Ta0tWWHBvWHYza08zaGpuWEZialZnY2JzV1JlM3RsdXlr?=
 =?utf-8?B?VGQvTTZ2YUZpN0VUT0VrMlFZVDFacUMxL0pDUGhQRU16UXdpYklQcGg3OEVs?=
 =?utf-8?B?SlEvS1lhY1ZhOUZCalpBVzRLRHBpQmxqNUR5ZVlIR2xNaEJyRCtycnQyUnZB?=
 =?utf-8?B?V2x0aHo4QWJkT3BSUHRUbUlJbnF3Q3J5MGNPOER6SGU3cXJGYlA4eVVYMkZz?=
 =?utf-8?B?eEsydFhVNnY2TEI3Y2RtM1VmUVBhc242VnZmNEtYMWdTQW5vV0FEWEtQNDhJ?=
 =?utf-8?B?MTNSUGV2OGoyVHFEemhkRnFub2ZVZzNNSHBydHpwRlV0dWp2SjcyL01vZmFn?=
 =?utf-8?B?dS90c1MwUnRXTTNRSGMyYmNFNDBtMzdlUWxEK3dlZENwMzVXVWpjRTUyMU9t?=
 =?utf-8?B?eEJtVTZ5eHJpZTZzWUpnOTNYMEVLMFVqU0Y4UEw4TVppS2wyZ2ZlblBqSWJZ?=
 =?utf-8?B?b3N3V1BDcEJodXdpelMwbDJTM1dRRVY5TmJZak1GRlNLZ2JxdEV3WThFSGtN?=
 =?utf-8?B?SHJvN3FsRStmM0xiZDZrazdIbVVDbjJCN3hNTzR2a2VQazVGais2L2NxazJB?=
 =?utf-8?B?U29BZ2oyV0dmZkNQUXVmOWhoNy9weHljL2ZzeDMvWXF6dy93R3BFNGE0dkI5?=
 =?utf-8?B?TE9Wa0FGWlkvYlh5b0JHNkZDb2NkeWdQaERXTDRGQklEWFpvb1N5eDB2Ykhh?=
 =?utf-8?B?WWdRS3RNbEFobHBGS1pDUXA1bmw4WWI3Q0RiN3JweW84OHFoQTF4QzkyamZS?=
 =?utf-8?Q?7nn2xKJQe/UHhv4PkI7NqXocKAG9SQl+dCK3c=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 711d8da0-70d2-4f16-5ef8-08d8fa525b2d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 05:51:29.8256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b6aBMB/zVvmOc5W4//kufDCRgYbrNvVCgSrdF92nVjUwMAl9qL+C81ktXCDuye1o8kmEy9Qmsu3IMB7I0ZJTFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2744
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9947
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104080040
X-Proofpoint-GUID: RRDdYZ5TZ0-9J3_om9b6pA9RVT9HgklD
X-Proofpoint-ORIG-GUID: RRDdYZ5TZ0-9J3_om9b6pA9RVT9HgklD
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9947
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 clxscore=1015
 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104080040
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=dongli.zhang@oracle.com; helo=userp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, fam@euphon.net, berrange@redhat.com, ehabkost@redhat.com,
 mst@redhat.com, joe.jin@oracle.com, armbru@redhat.com, dgilbert@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/6/21 7:20 PM, Jason Wang wrote:
> 
> 在 2021/4/7 上午7:27, Dongli Zhang 写道:
>>> This will answer your question that "Can it bypass the masking?".
>>>
>>> For vhost-scsi, virtio-blk, virtio-scsi and virtio-net, to write to eventfd is
>>> not able to bypass masking because masking is to unregister the eventfd. To
>>> write to eventfd does not take effect.
>>>
>>> However, it is possible to bypass masking for vhost-net because vhost-net
>>> registered a specific masked_notifier eventfd in order to mask irq. To write to
>>> original eventfd still takes effect.
>>>
>>> We may leave the user to decide whether to write to 'masked_notifier' or
>>> original 'guest_notifier' for vhost-net.
>> My fault here. To write to masked_notifier will always be masked:(
> 
> 
> Only when there's no bug in the qemu.
> 
> 
>>
>> If it is EventNotifier level, we will not care whether the EventNotifier is
>> masked or not. It just provides an interface to write to EventNotifier.
> 
> 
> Yes.
> 
> 
>>
>> To dump the MSI-x table for both virtio and vfio will help confirm if the vector
>> is masked.
> 
> 
> That would be helpful as well. It's probably better to extend "info pci" command.
> 
> Thanks

I will try if to add to "info pci" (introduce new arg option to "info pci"), or
to introduce new command.

About the EventNotifier, I will classify them as guest notifier or host notifier
so that it will be much more easier for user to tell if the eventfd is for
injecting IRQ or kicking the doorbell.

Thank you very much for all suggestions!

Dongli Zhang

> 
> 
>>
>> Thank you very much!
>>
>> Dongli Zhang
>>
> 

