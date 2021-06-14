Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F103A690D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 16:33:24 +0200 (CEST)
Received: from localhost ([::1]:57466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsneV-0004qm-Oc
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 10:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lsnd2-0003b7-Kf
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:31:52 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:64684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lsncy-0006f1-CP
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:31:52 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15EECKZ6020270; Mon, 14 Jun 2021 14:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=S4Litj/wSjld6OzpDxcdBvOiqtYDx1Tb6wjjL9oL7gc=;
 b=xj62cwS9a5TIkvgrEwBeBAs9PFCquQiyATr6Pee6XgOfsn37IZ2sqvLVo9C1Xm5Yn1Ze
 Eeie+qRZqaty1F6J3WfTUg2O4uCfHi0uTXF4YVbbsuQ9fbMICn/aqGBKYPvZf5Hm0pe2
 ag2ZzbyTv8oOZ/q4X9w/5X0B0YoRHj0b5hxtsvPdEu8oB2/3vr9gQQV/A3j2saq1nijg
 aI3/uL/h6Ph23AJdQFDq9aXbUWF0UzcfRR6L8DhYW+WTKfAbJz0Dkc2YVmfUnj2zYqGO
 z7dQLU5v1IkJRvZl/hry32M85CQZTJG4Bcdi1QCHuPntT8XXuMbLWMi4F5ZPFng81BWd gQ== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 395x06g6he-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 14:31:40 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15EEVdIY186627;
 Mon, 14 Jun 2021 14:31:39 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by aserp3030.oracle.com with ESMTP id 3959cjeet7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 14:31:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNfOXgi6rdsNICj/P972gvF3Lys15zzIS/le9468sW1ageTuiPplBjDjeys8aT0nEZaBec9h0jeMFG8sMo0hEzzCz+Y8Co3qql61Nbfj3tktTQB0LkO4nL4wRyppJDM3Ydabqv9+UzGihFmzwC7w4jD4axvoV5r7TqzFopKQ3v7DInxlFUflT6iP68LwfCVk20S2Kaki3akXjlaGF65sD0obSswcL1/fKMvWGs0eghKCe3qAZ0gltJLfvzFr/vkS7wCTkWZva8uk0FuLzUg+AKOuoRPqqT/jfQAhVzE/iF817SGFXlg6QQMe4nusgv5aIoZrCzzjlpP+7Q/srNyC7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4Litj/wSjld6OzpDxcdBvOiqtYDx1Tb6wjjL9oL7gc=;
 b=Re2BElC9LxCG3TinI1RjacE0IpGFku3czUZChdZHLc1YHNJ4Yl44w8mw1PedK/MAPI7Jm72bN8I+/EcWwoYAjm3N08sAYWvYsbgkr/LAt0LYWelH1vW7VSNyJD2lL1u+euGNkifvG+XtHRsO4hiujNL8bo4N1LzzPKcSK/rCNKVDFNuLjTDBRp6jr8aOEdoor+X0UzeyU85xO4dAocH6mEXWuWEJ1ts/2/s4UmPTiRUFJSr2BB3qdlFrDxwFfDcLwXcI6pUHiI4DwmJtmz9+dxIcfZLIfAOsYrmbMVYqv9/jLWWNJ5e/Vi3ncWuWnxKzp8jERMflnOieZ6Sc9Q5UdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4Litj/wSjld6OzpDxcdBvOiqtYDx1Tb6wjjL9oL7gc=;
 b=uiTlkD+6UM8mUxULT1UFnk3JOc56xnQX6TDD6vi6NQIR1zstjefgQgs/4+vVV6iq6Oy+wpccqf4o6ZgntRieA942uA1iYKNw0oCv9wyC939KGhLz1c8MBIJjBJ8F25gYRigj9f6iiXYLuVONeNDWCjHjAOXfUDEwPSU8T+dQbzw=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4557.namprd10.prod.outlook.com (2603:10b6:a03:2d4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Mon, 14 Jun
 2021 14:31:37 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 14:31:37 +0000
Subject: Re: [PATCH V3 00/22] Live Update [restart] : exec
From: Steven Sistare <steven.sistare@oracle.com>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <29356c3a-0b3f-2773-4f9f-18ff4ed4d5bb@oracle.com>
 <YKOPnkefxgRZ8PoQ@work-vm> <a1d3dfea-d15e-35a3-a216-3ce65600f2d6@oracle.com>
 <YKQULUn5F+x1wrYI@work-vm> <38dc91ab-b96b-1cc3-bf8b-84ff77b334fd@oracle.com>
 <YKZgZELudL9HobEe@work-vm> <37713c98-5f2a-6cff-d3c4-9e1c60cc4107@oracle.com>
 <YKuCbujlfOCEYUP3@work-vm> <9a1564dd-bed9-8518-8d5b-3ca9f0243643@oracle.com>
 <YLkvShM1MMLh6NpG@work-vm> <YLk/MoR2Wa20/gU/@redhat.com>
 <b8d0689d-7a54-de55-7cac-695812265d9f@oracle.com>
Organization: Oracle Corporation
Message-ID: <f65f79fa-20b4-ae98-d60a-b1813725647c@oracle.com>
Date: Mon, 14 Jun 2021 10:31:32 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <b8d0689d-7a54-de55-7cac-695812265d9f@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: SA9PR13CA0067.namprd13.prod.outlook.com
 (2603:10b6:806:23::12) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SA9PR13CA0067.namprd13.prod.outlook.com (2603:10b6:806:23::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Mon, 14 Jun 2021 14:31:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42e0eb24-be04-4224-1ad6-08d92f411dcc
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4557:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4557C88F3452AEA4A9E7163FF9319@SJ0PR10MB4557.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gyB3vXxwaU71YJV6YruzeSaFSVWXDebHUdOFoObXqcLcLZahlvwR2IZz1bfovh/92hTlrHLfiuUBy/abonS62FpaMQiSUukDNotdcbf7TCDQQEXxiFHx6T4OpAJ9yTqJbZZMiHshAOHZ91IxMXff2FL80CmItk1gug/8QqhUkEkARWV5Erp59MXwbOskae06g9ts2aLaTeVlqrNX3bAGzePZRvzgOnjt+HLz/Pa1MXoOKf9AXkutu4AA/i/6VhmvqdKFAtrANGeBI4CcMxDBvrEFeprGm5JHr0Xalr96OknMr1nIPpBqsYRKRGPxz6l1gxyUfy7n3JY4fOrF9q+nhCiE/mAvKAcP5psObHZ8JtRi8ubzKbYG0OpHsDvl/sXCUzclEG4Gke4JT1D+0MoF+pdGxUE9NfSLZi9PKdxC7RfYipCSnLbiraQVSsajIDi0uflpxrzqa6hkHc8JllgrvMUmC6sMMc9NoeHvZSKTBCcuklx7yYrmgEOJwFCIxaVkmyhTAf9KxHVBRedHLarSturBKeDrjynUw4wc/3rT4gdSKC5Tz37gNWXQlUOSnVHCHimjWGUz/fyaOKkiNDQqZzqoKvL+GIP8vQTRNOH2HeHxhYUp+3PZ2WPi9+aNUHpcGeFzlSSrSi0vHv+zuzIywQeOkKAIPanMzjVXL5SFyejOE3F37HAo+/GzswBOVq7W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(396003)(39860400002)(366004)(136003)(86362001)(316002)(110136005)(8936002)(16576012)(4326008)(15650500001)(36916002)(7416002)(54906003)(5660300002)(36756003)(83380400001)(107886003)(66476007)(66946007)(66556008)(53546011)(31686004)(956004)(186003)(2616005)(8676002)(6486002)(478600001)(16526019)(31696002)(2906002)(38100700002)(44832011)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RitQNWVXMUhRdVZ6Unozcmpzalp1eGFrcElWRGRLdHNaRHRQdExWMGNMVUln?=
 =?utf-8?B?eGVpZFNtSk9KNWYxUWpKODJ5ZzRjbWtMQ1ludDdiSEJsazJQQU9HcCs5QkRy?=
 =?utf-8?B?cGZqVnRRTmM1WmlTSmxWZ0dkZHMxanErMmxYVWJxaEZzZDJiM0ZmeWZib0tG?=
 =?utf-8?B?R09hcTdOWGJ0QW9xeVBodS90VXByaDVnTlN6QngrQ1FoYmtkeisyUW9vZlhq?=
 =?utf-8?B?SmpQQ05KY3pDNytSbWozQ1NwTUhaYkVvTG5GMlRzamVzaElvS1hTNGhtZzAr?=
 =?utf-8?B?TDlsQTZ4dGYvQmQrckNpRDk0Uk5IL3VXK25JUDNGSm5MUGV0MEFvVzgrUGpN?=
 =?utf-8?B?eWVFNGs5OEFJUTdRM1FsV3JwS09xeEM3SzVLUHl5dWpnRWx5bGNOcEFaOUUw?=
 =?utf-8?B?WGt1N3F0enpWczRDSUVBV04vdkJGZi84MnhXSDcyRlp1R3cva0l4OXk4RHZu?=
 =?utf-8?B?V012WnZVODBmbWlaUytLQlBuV2FVQVBNT0srckRpNEtyNngvbzN5OXhZQVY0?=
 =?utf-8?B?dnphYXc3S2hrQXBray9xWVlWUXlXa1h6VHdhQWFaWHY4NTV6UHFMQkxtcmEx?=
 =?utf-8?B?Nk1EeXhIUGdaTEVtbTRKZWxVOVJhclZDbTdJVDdCcW5zT2pXcU1CMTg1a0R6?=
 =?utf-8?B?S0ptV2ZBeFgxVlVtMmlXekFDalBlY0dlTW9DTXN6S1ZMYzI0Q3MrVldOM2JV?=
 =?utf-8?B?OU1ObGlka25iUVgvV1NOVDM5SzQ3RldJNUkvbm1iM0QwUk5NV0pwaEJucUlk?=
 =?utf-8?B?VEJNQVoxT3pyajVZRGhzQ2luMUxBZ0htcW1Ddm96MFBQRzRmOHNicnU2VFZM?=
 =?utf-8?B?M3lrZGMwRUQ2S3N4S1Rhdmt0Q1M5UUNqTElRbEdaNDN3RFh1Sjd5cmZrMExz?=
 =?utf-8?B?Uk9OK0p6L29GRDdKVmw3bHBmUmRzQVExeUJIandvZ05SeGI5VFVNUDRsb2Ey?=
 =?utf-8?B?N3RBWHpjcHZxN29TYSs5RTZzbElyQ2grSDdyazlzRk1BdTRzVEhWQncxaWRF?=
 =?utf-8?B?TGVQY0RzWUJLNG1MTzVoS2xDTWFUb082SkFlRzI3MndDRXhIdCtHRlF6N1Nz?=
 =?utf-8?B?VkI3MGdvQTlFemNkU3dvbzlValVrZTZVN0p0dUxpenJoUHovZ3g0WmVjcm5X?=
 =?utf-8?B?bEVSbDMwR3N1WCtFMDhaMUp4bHE0MnlwUmhGL2s1WlBmaWhweHg2TzRpOFVo?=
 =?utf-8?B?UEMySWFDdDdVRVNzZm9ucDh0c0VnSzJJUHVXMkJuTUw0YWhsWURsUjIwSmxi?=
 =?utf-8?B?ZC8zQUJiQWFEUjZTWjFrUXg3ZE1TKzZ6ZWlWWTVSOGVuK0lXZmUwb0o5ZmxI?=
 =?utf-8?B?ZXltdmF4UUhEV1p2T2pqY3M2NXFUMk90eTkwd2E2THRIOWc3VDAxU1JxRjV5?=
 =?utf-8?B?VVA5Y2VZa3puYUwybGV4amlYWTZmT1RkR1NacTkrd0kxZG05aW41MHJ2aFl6?=
 =?utf-8?B?UWQ3cFFwVE1UTHVha25CcEtEcXEweTdzY3ZzeFRYdnJnSzIrTmJndC8rSWRN?=
 =?utf-8?B?aEZEK09rWFRRb0N6YTlhUTJ5eURVTkZUTXZHUzZRSlVPd015RGRCZlRxR0Jq?=
 =?utf-8?B?WlQ3M3hweFJicE1ack5GRmZJLzRkb3NIdXpwaVZCNDZEUTRFOFhhbkZRbmho?=
 =?utf-8?B?dDBwa0RBOXA1VytNbU5HUEphYTBGQjV2dDVGTFpYUVNibC9PUjdINHRhWmJF?=
 =?utf-8?B?c0JnS0hmVkNQUCtmb1VEamk1ZnBScllFYU1adHVmeHg0UmQzSm5mK2czTGVC?=
 =?utf-8?Q?jTJ+Z8d+FlzV0uds226riBqdVbqEJtX3H9F06ej?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e0eb24-be04-4224-1ad6-08d92f411dcc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 14:31:37.0680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KcAXGIOprfZRwzENwW0v9gWPzn99Es6p0m2WxdT9kcP9A5BUe9kWM7G6rohVLqdw0x/Ir+eFOVVH9F+yftL9XLjELeuSPaAoSsLq8KepG20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4557
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10015
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 mlxscore=0
 adultscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106140095
X-Proofpoint-ORIG-GUID: eo87ipBmTdG0B_dBiJmfrMPumqN-JNkV
X-Proofpoint-GUID: eo87ipBmTdG0B_dBiJmfrMPumqN-JNkV
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/2021 12:40 PM, Steven Sistare wrote:
> On 6/3/2021 4:44 PM, Daniel P. Berrangé wrote:
>> On Thu, Jun 03, 2021 at 08:36:42PM +0100, Dr. David Alan Gilbert wrote:
>>> * Steven Sistare (steven.sistare@oracle.com) wrote:
>>>> On 5/24/2021 6:39 AM, Dr. David Alan Gilbert wrote:
>>>>> * Steven Sistare (steven.sistare@oracle.com) wrote:
>>>>>> On 5/20/2021 9:13 AM, Dr. David Alan Gilbert wrote:
>>>>>>> On the 'restart' branch of questions; can you explain,
>>>>>>> other than the passing of the fd's, why the outgoing side of
>>>>>>> qemu's 'migrate exec:' doesn't work for you?
>>>>>>
>>>>>> I'm not sure what I should describe.  Can you be more specific?
>>>>>> Do you mean: can we add the cpr specific bits to the migrate exec code?
>>>>>
>>>>> Yes; if possible I'd prefer to just keep the one exec mechanism.
>>>>> It has an advantage of letting you specify the new command line; that
>>>>> avoids the problems I'd pointed out with needing to change the command
>>>>> line if a hotplug had happened.  It also means we only need one chunk of
>>>>> exec code.
>>>>
>>>> How/where would you specify a new command line?  Are you picturing the usual migration
>>>> setup where you start a second qemu with its own arguments, plus a migrate_incoming
>>>> option or command?  That does not work for live update restart; the old qemu must exec
>>>> the new qemu.  Or something else?
>>>
>>> The existing migration path allows an exec - originally intended to exec
>>> something like a compressor or a store to file rather than a real
>>> migration; i.e. you can do:
>>>
>>>   migrate "exec:gzip > mig"
>>>
>>> and that will save the migration stream to a compressed file called mig.
>>> Now, I *think* we can already do:
>>>
>>>   migrate "exec:path-to-qemu command line parameters -incoming 'hmmmmm'"
>>> (That's probably cleaner via the QMP interface).
>>>
>>> I'm not quite sure what I want in the incoming there, but that is
>>> already the source execing the destination qemu - although I think we'd
>>> probably need to check if that's actually via an intermediary.
>>
>> I don't think you can dirctly exec  qemu in that way, because the
>> source QEMU migration code is going to wait for completion of the
>> QEMU you exec'd and that'll never come on success. So you'll end
>> up with both QEMU's running forever. If you pass the daemonize
>> option to the new QEMU then it will immediately detach itself,
>> and the source QEMU will think the migration command has finished
>> or failed.
>>
>> I think you can probably do it if you use a wrapper script though.
>> The wrapper would have to fork QEMU in the backend, and then the
>> wrapper would have to monitor the new QEMU to see when the incoming
>> migration has finished/aborted, at which point the wrapper can
>> exit, so the source QEMU sees a successful cleanup of the exec'd
>> command. </hand waving>
> 
> cpr restart does not work for any scheme that involves the old qemu process co-existing with
> the new qemu process.  To preserve descriptors and anonymous memory, cpr restart requires 
> that old qemu directly execs new qemu.  Not fork-exec.  Same pid.
> 
> So responding to Dave's comment, "keep the one exec mechanism", that is not possible.
> We still need the qemu_exec_requested mechanism to cause a direct exec after state is
> saved.
> 
>>>> We could shoehorn cpr restart into the migrate exec path by defining a new migration 
>>>> capability that the client would set before issuing the migrate command.  However, the
>>>> implementation code would be sprinkled with conditionals to suppress migrate-only bits
>>>> and call cpr-only bits.  IMO that would be less maintainable than having a separate
>>>> cprsave function.  Currently cprsave does not duplicate any migration functionality.
>>>> cprsave calls qemu_save_device_state() which is used by xen.
>>>
>>> To me it feels like cprsave in particular is replicating more code.
>>>
>>> It's also jumping through hoops in places to avoid changing the
>>> commandline;  that's going to cause more pain for a lot of people - not
>>> just because it's hacks all over for that, but because a lot of people
>>> are actually going to need to change the commandline even in a cpr like
>>> case (e.g. due to hotplug or changing something else about the
>>> environment, like auth data or route to storage or networking that
>>> changed).
>>
>> Management apps that already support migration, will almost certainly
>> know how to start up a new QEMU with a different command line that
>> takes account of hotplugged/unplugged devices. IOW avoiding changing
>> the command line only really addresses the simple case, and the hard
>> case is likely already solved for purposes of handling regular live
>> migration. 
> 
> Agreed, with the caveat that for cpr, the management app must communicate the new arguments
> to the qemu-exec trampoline, rather than passing the args on the command line to a new 
> qemu process.
> 
>>> There are hooks for early parameter parsing, so if we need to add extra
>>> commandline args we can; but for example the case of QEMU_START_FREEZE
>>> to add -S just isn't needed as soon as you let go of the idea of needing
>>> an identical commandline.
> 
> I'll delete QEMU_START_FREEZE.  
> 
> I still need to preserve argv_main and pass it to the qemu-exec trampoline, though, as 
> the args contain identifying information that the management app needs to modify the 
> arguments based the the instances's hot plug history.
> 
> Or, here is another possibility.  We could redefine cprsave to leave the VM in a
> stopped state, and add a cprstart command to be called subsequently that performs 
> the exec.  It takes a single string argument: a command plus arguments to exec.  
> The command may be qemu or a trampoline like qemu-exec.  I like that the trampoline
> name is no longer hardcoded.  The management app can derive new qemu args for the
> instances as it would with migration, and pass them to the command, instead of passing
> them to qemu-exec via some side channel.  cprload finishes the job and does not change.
> I already like this scheme better.

Or, pass argv as an additional parameter to cprsave.

Daniel, David, do you like passing argv to cprsave or a new cprstart command better than the 
current scheme?  I am ready to sent V4 of the series after we resolve this and the question of
whether or not to fold cpr into the migration command.

- Steve

