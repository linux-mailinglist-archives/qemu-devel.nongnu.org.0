Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4134D01B7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 15:46:36 +0100 (CET)
Received: from localhost ([::1]:53398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nREd9-0005b4-3v
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 09:46:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nREaH-0002hX-2g
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 09:43:38 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:47084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nREaF-0002I7-75
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 09:43:36 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227C3EPg009954; 
 Mon, 7 Mar 2022 14:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 from : subject : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=6aoiFQzGL6FkEh74oYXwcE9UI5CA+YRICwfLB8dMIYA=;
 b=MN0mPAWM4LCMotLpcze5Zx351l/xlP6SnUWT7aanEnOWwKtcR9NJqFYWwnJgtFPWsG9Y
 K+G2fw/IAHtVxbgfV5XfQIClyVU+g7nimiEwJwbbgSpuvPqdOJrz6/CslzDKZDB/7iO/
 h8KnPt+J7023kJOB8n22g6rRz31qli8pLeN9hURlMffvswU3wzQm3lSnAT5jW8j+WA9m
 eLZ9Qy6Z5RQqxJeAKrKnmzEdc2HnXum8s89Inr6Zt/JgQoJrC/W1EaCHympFNe4pO2Td
 BV/z9JFSpm8wr++HtFlndtltRTBFsJ+G7Dyn8mU1r19KATvN6fyR7le9oPf3Tr4yYv8Q 0Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekyrakweh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 14:42:25 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 227Ef3ja073433;
 Mon, 7 Mar 2022 14:42:20 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by userp3020.oracle.com with ESMTP id 3em1aj1y2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 14:42:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P59YClhTocVCf3bxYlDB/ogZYyxWrsYIbV0n4nxaY49OZb2Ho5s91W/a0elouYvRaLwJWvtOauwp9dWTUzjG6LXEHlriBUy2GQRN7nTmYq6baH/y6z3ppcwnqWXr3uG0p4iqGGTM3D8ZgrNzAMk/WUa45lIoixOH8RPzlAhP2MmOKhMmjEaQsjLWLcMBux4lqorcUFLAQvUWcvIr9kFL4AIGiwjpbS6n4xmgmqs/xNISEUVQg0BOrdS27b1sFKjjZgR6MvGIMo+3WcVPtZhB4uFCnhaLDVl29zg1HP4/ypnhkBsrims2v7l332UVjT6ag9dyM9Dkaei+sj4ZSBjBYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6aoiFQzGL6FkEh74oYXwcE9UI5CA+YRICwfLB8dMIYA=;
 b=Pq7F4ReC+ECQPBV2B8/04r1OBBKjphm718RvO5FFq3H2O20XWRU5z6yX0s8aumljh5HEselctBysZUOagS0wK19pkd8S7APkAEVBfTivzOlUeL1uVti3i5C8krdNi1etymdn3YHiS4Vt4IbIkHdAGA2VQCKqZsp5zs+Y/DzA9GtCcoITBhpmuZHQMsT2/m0LpmHNJms8YYvrZoUD2KK8/Pgi2CV5pw/g0ux8OnPojV55c9+U7y2bNqiKgChiyH9KImDlO5LGrgny1jgmAUWcUjFHYUZNJCu2aBUQGvxjrJ6exUeNpWbgFDsC9FtJebWWb61zD7Q7DWohXvHgGnqKoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6aoiFQzGL6FkEh74oYXwcE9UI5CA+YRICwfLB8dMIYA=;
 b=ykWedihqx3z1+nhJWnHDONO+rCN3eadPbFv4i3GiD9MJwDNEnbULLuSKGEiCGlWjGRWjwD5OinKuikDOF9s1cio8L4CY6k8Uo7fGK3Gn7vK0Lnnvurh25v+u+XsWYVX3FZx9eiCIwQHZpFaik8DVnwpNDQ0VOFFZADmpMR9DSig=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BN6PR1001MB2100.namprd10.prod.outlook.com (2603:10b6:405:35::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 14:42:18 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 14:42:17 +0000
Message-ID: <fcf54b76-1f0f-8a62-13d2-ef7d06de0647@oracle.com>
Date: Mon, 7 Mar 2022 09:42:14 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
From: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V7 18/29] vfio-pci: refactor for cpr
To: Alex Williamson <alex.williamson@redhat.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-19-git-send-email-steven.sistare@oracle.com>
 <20220303162103.0dbe93a1.alex.williamson@redhat.com>
Content-Language: en-US
Organization: Oracle Corporation
In-Reply-To: <20220303162103.0dbe93a1.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0044.namprd03.prod.outlook.com
 (2603:10b6:5:3b5::19) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f817e17b-0bb4-4e38-a0d0-08da0048ad97
X-MS-TrafficTypeDiagnostic: BN6PR1001MB2100:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1001MB21001694327454424DD520F1F9089@BN6PR1001MB2100.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7rWTdHF5sTOz1lnK6+htbmj01Ss1suA2kJoynl+ylpGqT2YEmt3TZbIA641EaUVMasxARSpUijC8WJftUsaSG0rqrOn4aJJiABMr7fSk5zEfgi9rowAzBNwa4cvemjgUin7uo+GgquCGN3F/HT+sJeUg34J29TUTDxAkskSNXkX1jHsp/eYeZ6shjhLMfcReIpqPU6iOw+MyrnS+CQ1Y+gXpIFmPR8QsIOdWaraISOPFfLew30qFFo5N5yP9+OQD+fIxW/VGWxGWdEmxRIer05zyyuxbdAY+83OqKIY8CaBzOszwED3sief7vg6eH8rUFeYz3yETbgODFBfBW4yQ2HXrdfz/Z6ZEGVijM8F4nSFZm4MwmXfPjrp8+B+xQsgTgchO5PN1c0ldPKkPxnbOxQPW9Wn0ROWqlLXlIO5CfUPNNQ3pu5O/grFXwf0bXW5DMeG3XM7lCzi2QhH8EK/XxTgRxsgUswbBZnilmvIzy6fJTp3uCHJdE4X4OL7Ndnxogw3s7OQA1ZEUIkwA4IrjXyB8H5boCbFH2KDyPi3YEZ89FY3SC1DHfJFqtLjYns2KxdSsdQ3/o5K8I0pjbRjhs/avgdvwOKEvmOShoLuf4rQXjjr+vX1hH3DZp5qJ8ac/bGDeT1taY0mkKeY77O277Mgi8jeKJlstLdymKjyjusE9WG4bMeUB55CIaGLWn4b3vF8DZ9fNZG2dHwYK2g/FhmJ9ANSX/SbXTutqFirNd60+h7qaeR4Anlmy71ndbPtK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(44832011)(508600001)(36916002)(6506007)(53546011)(8936002)(66946007)(7416002)(86362001)(5660300002)(6666004)(6486002)(2906002)(6512007)(26005)(186003)(8676002)(4326008)(31696002)(66476007)(66556008)(2616005)(38100700002)(316002)(31686004)(54906003)(36756003)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVB1dWNBdzNMVHd1c3dhV0dXVHpScHhjRXdwdDNNdjZYNmQ5Q3J0NVVDeWI0?=
 =?utf-8?B?VmdXZ1IxT2hmWTMyU0I4MkVpc2dkcWJwLzhmNzlreDBGeUM3YVJDZjY4Q0Fl?=
 =?utf-8?B?UXovQlpRMnZoVW52R2k5ejJPNTZrQUxlZkNyOTYwbWNYT0tTV1NvdFl3NWcz?=
 =?utf-8?B?bjJ5UUNqL2oraEE2d3BSM29PeWZPUHF6OU5lRGp0S1dpOGhkb0ZjOEJaV0FX?=
 =?utf-8?B?WlMwY0VCdXV2UHV2NVFleUpQeW90ZjRTY2djdEU0US9vRlpwRG8vaklrc0V1?=
 =?utf-8?B?R3BBM05yYSsyMFNXNUpDVFdrYUl6WWZLSXJHZy9QNWhSai9TN250YVArL2RY?=
 =?utf-8?B?b2d4SjV1WUh6YTRrSkZwUDUvWmhWdndxNmQ3Q1N0b25yR2ZtWC9lSzNvZE9s?=
 =?utf-8?B?UjRIYUViN2pzR2JsLzFVdFpuT1NHcEFyd0NUQitmd1BXVW9jK2FTT2NoT1E5?=
 =?utf-8?B?blRoVTlNSjA2bmFMR2VocEU0L1FJeGp3SWNkK2t4K3hIcW4wTFZnZDNNYlhj?=
 =?utf-8?B?NW55RzNDMnByZzJidVo5QWFRdWZKTGtZWWRleGFTQ1lhaDQ2TTZOT0RZNFB4?=
 =?utf-8?B?b2o1RFMvZVJ0aGFWTTZOamVuNENlcWRJSGQxcHVLU0YrN0tBK2l1NnJ3SkN0?=
 =?utf-8?B?aytrWmNXSGZnN3JVZ0gyZ3ZXSlpwMG5TZVZzRnU5UmUyUFpwdUpoU2lEZnVW?=
 =?utf-8?B?QjRBZDZGYVF5ZTcvVDkxb0hub1pmcWdZSWc4REk2bTl2SFJuaThtUDZKTm5M?=
 =?utf-8?B?Y1ZxV2dsdzBuYVdUWHY5ekR1L3RZSXZTRVhpNGsxVS9KcFNXajhUTDJQZ2dW?=
 =?utf-8?B?MVBXOGR0Uk1qeUFLQWM2ajY5T1NVSTVFUFFySFFhaXUyaURDaENsSlhuL00x?=
 =?utf-8?B?bVhPV0pvQlp3Mkg1YmpLUUhuUGx3WlFEcklLRGtMYkNRTTdxakV4cW44ays1?=
 =?utf-8?B?dUxqbWp6bmoyd0VCVWpVclFIakhZN2tBQkNFS0puZ0Z6YU9HbnZZMHNhQTFU?=
 =?utf-8?B?dStqZjRvRE9MTE0yc2JNZ2JhVllFQm9qYnY2ZTRjMHN3clE2dzl1eWUvOXJo?=
 =?utf-8?B?TnplVXBsZWVVMnMyU0RGSytrTTBuME0xNVY0dDBhbXRDcEQ4U3VBbWVVUU9V?=
 =?utf-8?B?Q1Qzd1pkQ29sbGdaWWFGQS9kODd2dEluMXg2bGk2RnJtOFc2bXB1QlIvbjZz?=
 =?utf-8?B?RWtOTTlWb0tNNUtqR0tOTUZOTzRNT3l2bTFoR2tmMW9ZYXB0elNDV3crbTRL?=
 =?utf-8?B?MFAwdGZvWU9oNTdTZXpHa3JsRnI0dkZFSWlkVHBZN2w1M1h2VEl5SGJGbS9q?=
 =?utf-8?B?UW05bENXdVJSNzZmaVpOOTl3Wk5paUZjbzFwNlFzc2djdUxUM1gwQjNqUEZK?=
 =?utf-8?B?b09zbDJ1V2VJNzhXc2t0R2xMNEJ1ck5kbWx1SVNlMWhmSHhXdy9zNXcwOWNI?=
 =?utf-8?B?VnZUS1oxYzlDR0ZJdXBnSzNBcCtUSEFvanJPc2ZlNlMzQ0g4VUliSWE3Q0tS?=
 =?utf-8?B?VEtLL3JHeXhheGh2WTdJOFFvOWRnRTZjbkJzVVQ4YmVFVzhkTzI1aStrd1J5?=
 =?utf-8?B?SzE2aHhHQmJFR1pQMnNBdGw2cEtrYTJOdExjRUZCNUM0T1UrM1lDS1ZRb2wz?=
 =?utf-8?B?d2FwaVZrNVlPeFVrekZjdDFlQ1JzN0l2VURoTlFjMzREd2xsY01kYlY3UWxi?=
 =?utf-8?B?dnVsNzl0eUdtMEdtZHppSFFGY1ZCR0VTaStveGphM1hFY1k2RmZJV2RnaGRy?=
 =?utf-8?B?UmpjZ3lXbVpMQklZNnFEZDZrb25wRy9kcEZGVDdQa091UWJJWlFxSHova2lZ?=
 =?utf-8?B?NDhQbytCcUJmUU5nQ29CYTR6ZExtWU5aejdWV1hHUDZZYXVLU0tJK2p0aGRw?=
 =?utf-8?B?WXQ5TVJJVzR2OWlGQVFzTEFDRUZWbEU0L1hmQmxrR0xKSkh3enB3Q3d3emgx?=
 =?utf-8?B?a0IxWHVwMDlJTmwzRFp0bDlFaVZlcUVOTURINTZCSFQxejY3aExFV20xZFI2?=
 =?utf-8?B?MUR1dkVPSkF3V1Zab2tGdDUraWYra0ZmMWNJb2ZNalN4aThxa2daMERWQzRm?=
 =?utf-8?B?UzM2bEJVZklJbGM5cS9OSWxFeWNRTzNKVXhnYWlIdkN2b3ZobnRrNEtoUm9z?=
 =?utf-8?B?YUlhR1BtM0lyYmJZaUkwelQzeGVhRVQycmtZNXc2NlcreERxRWd2dFpWd1Nw?=
 =?utf-8?B?OFE2bit5RWJ0TFBiYUU0VDM0Y082bXhZTkl2cCtiS3RYbjlXQ0RGamJha1Vh?=
 =?utf-8?B?U01uUk5XZHpLVWk5N0Vscys1Nzh3PT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f817e17b-0bb4-4e38-a0d0-08da0048ad97
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 14:42:17.8574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hiZUP51Y2steBsyC4PRtKitDlJThiNecqaXnx/Mmdx1LI3sgNXux2vvWurdb1O3fAlpVJ5U59TSnsLKZtovZnUHFZiOrBG78KBtm+nP59ZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1001MB2100
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10278
 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203070085
X-Proofpoint-GUID: G9K0K-fRBoogzjzpkez8V_-bS9GXpPMT
X-Proofpoint-ORIG-GUID: G9K0K-fRBoogzjzpkez8V_-bS9GXpPMT
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/2022 6:21 PM, Alex Williamson wrote:
> On Wed, 22 Dec 2021 11:05:23 -0800
> Steve Sistare <steven.sistare@oracle.com> wrote:
> 
>> +    if (vfio_notifier_init(vdev, &vdev->intx.unmask, "intx-unmask", 0)) {
> ...
>> +    vfio_notifier_cleanup(vdev, &vdev->intx.unmask, "intx-unmask", 0);
> ...
>> +    vfio_notifier_cleanup(vdev, &vdev->intx.unmask, "intx-unmask", 0);
> ...
>> +    ret = vfio_notifier_init(vdev, &vdev->intx.interrupt, "intx-interrupt", 0);
> ...
>> +        vfio_notifier_cleanup(vdev, &vdev->intx.interrupt, "intx-interrupt", 0);
> ...
>> +    vfio_notifier_cleanup(vdev, &vdev->intx.interrupt, "intx-interrupt", 0);
> ...
>> +    const char *name = "kvm_interrupt";
> ...
>> +    if (vfio_notifier_init(vdev, &vector->kvm_interrupt, name, nr)) {
> ...
>> +        vfio_notifier_cleanup(vdev, &vector->kvm_interrupt, name, nr);
> ...
>> +        vfio_notifier_cleanup(vdev, &vector->kvm_interrupt, name, nr);
> ...
>> +    vfio_notifier_cleanup(vdev, &vector->kvm_interrupt, "kvm_interrupt", nr);
> ...
>> +    if (vfio_notifier_init(vdev, &vector->interrupt, "interrupt", nr)) {
> ...
>> +        if (vfio_notifier_init(vdev, &vector->interrupt, "interrupt", i)) {
> ...
>> +            vfio_notifier_cleanup(vdev, &vector->interrupt, "interrupt", i);
> ...
>> +            vfio_notifier_cleanup(vdev, &vector->interrupt, "interrupt", i);
> ...
>> +    if (vfio_notifier_init(vdev, &vdev->err_notifier, "err", 0)) {
> ...
>> +        vfio_notifier_cleanup(vdev, &vdev->err_notifier, "err_notifier", 0);
> ...
>> +    vfio_notifier_cleanup(vdev, &vdev->err_notifier, "err_notifier", 0);
> ...
>> +    if (vfio_notifier_init(vdev, &vdev->req_notifier, "req", 0)) {
> ...
>> +        vfio_notifier_cleanup(vdev, &vdev->req_notifier, "req_notifier", 0);
> ...
>> +    vfio_notifier_cleanup(vdev, &vdev->req_notifier, "req_notifier", 0);
> 
> Something seems to have gone astray with "err" and "req" vs
> "err_notifier" and "req_notifier".  The pattern is broken.  Thanks,
> 
> Alex

Super catch, thanks.  Will fix:
  "err" -> "err_notifier"
  "req" -> "req_notifier"

- Steve


