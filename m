Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7731147BD06
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 10:40:33 +0100 (CET)
Received: from localhost ([::1]:60418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzbdI-0002Lj-HL
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 04:40:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mzbXr-0004wt-5u
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 04:34:55 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:11262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1mzbXp-0002Tf-FF
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 04:34:54 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BL9Gw7f022358; 
 Tue, 21 Dec 2021 09:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=yAuKOx5BHeoH/JWNSTQFJCK6ksl1PeDf0XWAt24zXTs=;
 b=rRUhIhMHsor9VjLbWsg8hBf6F8kHIhczk3DD8HPLOjPYuux35Zp0Ta1GH146+NRF+KQo
 VC9wF+t0bsm/zTZuTvsK4R577cn74t5WyAml6xb7ChpinHhJRQH0rY4sswa9Q5XrB+St
 RBs+vhZOWe2Hh2b/Yf7r5upoobwm0Ve38Xt4iBVlpXIQQgwEXBw3fzISP/EBSYbr50VU
 FDSwJTKamKz9ab9lRtgVUnL8PoWm/78QQXFQVE2D/UcRiejm66Irtt9bJ+dXoIulJWIG
 2ZrP+D8+yJxznJZd3ROP0U8pXXIFtue4f35IjHtVTQo8SGPjW0ETXKJ5Dl9c+cR5aE4T Qw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d2rkujmfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Dec 2021 09:34:51 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BL9GwJK018916;
 Tue, 21 Dec 2021 09:34:50 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by userp3030.oracle.com with ESMTP id 3d14rv7dgb-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Dec 2021 09:34:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXvlVPXt5DxVjfTNNC7v5Xr/iDXIqRPPkrHkSVbWvOUDUQfS0kTvDb+EkRc6CvGbrBoIycbnQZ7BWGZ3crcd7s8v0S5qnahnaa+1jrp6RbTJx5fz6ix9UNz4N6pLwjvZkrzOPKHlvFR8Vnhvda8c/D9dPGUITNNZF5eIk7Vr4TeeI+lzI9kZ1kA9z42YA8IKIiaaPXFrJJ2wB/uhCBwYj0oXAg/+75akcIRu6PSsiY8vDWk/kanqt6deD4fMGx8XNgCEOGjpavWkY7H/pBdCO24DU9iPnqtmzDWcl5sqO/EUn4B5bGS5j6nNW8jPjIAPN+EOJjnSbifqg5CXnwN2sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAuKOx5BHeoH/JWNSTQFJCK6ksl1PeDf0XWAt24zXTs=;
 b=dquG7ClZt2jtwdkuOw0RKlplm6VBvV/YnUjG5RJ434VN9bV8T8mUAurLkPZ8DeE3kJebw3vaBKvkrpDrbqjBcxCtFyfypqQbBujazHxljFBdcHshotxpqqG+ASttmiKa4Mbfk0/8FaM8wTpc8jJlePCyNSsYUTQjmE2D7iXJqVkq2mSn/pPXt+FJMqn76xYjBuGPezIXcHbopaz1KrNZelIHXsHIeXoThdi45HISPA2PQcnoTZCWO7VpxHYGVR01Bt8zeARLgiKlkzYZG4p4ggqEOjosATgjdYL5yqj21vOB+EwFNazsqUfg9gyUoGKDDA8OobEYgxcIDjilP3rAng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAuKOx5BHeoH/JWNSTQFJCK6ksl1PeDf0XWAt24zXTs=;
 b=qxa3fI40npv9JH/FRHb2D/4wTJPvYj4eiMXtLHLHcFgn/Bl2GN6jRV/ehbmQEfeUaqt5DpGOgkNVO14mPv1nLiDR4NbrFno6U9oST5jjdeJP89Sa/rsqlsrDEABNkkkCY8hfjATjAXGpodecEabeL3Md1zbtuTgtFgcMHQZZUHM=
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM5PR1001MB2267.namprd10.prod.outlook.com (2603:10b6:4:2e::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.19; Tue, 21 Dec
 2021 09:34:49 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::c517:d737:a012:1a0e]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::c517:d737:a012:1a0e%6]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 09:34:49 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] migration: Tally pre-copy,
 downtime and post-copy bytes independently
Date: Tue, 21 Dec 2021 09:34:41 +0000
Message-Id: <20211221093441.1445590-3-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211221093441.1445590-1-david.edmondson@oracle.com>
References: <20211221093441.1445590-1-david.edmondson@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0122.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::19) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2783450-89fe-45a4-bb97-08d9c46521d8
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2267:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB2267B6DD6F7A98CA087A2C0F887C9@DM5PR1001MB2267.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:261;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fgqmBWpfR/Ia3wqLs3kC39c9oHAB0FzOBEQ7JSIba/jCTJM7VN5PDdHaGYFhWh9zymH+NyQ33jDmupFNnLyJ80kfAIdsg11HesVx1hbhjVV0slAcP0sclficvyMtSQVwvScjcGZdwp4qfb10UpBZhUJI0MLA0TZJfw0SNwEuxhKdK0SEnCkZsW7SRlMXsh8TzeeeB5SYI/0mY91IoopCUSBCnxbYz8DHunbjHvxCA/w71s3gm8EWqReHBc4HnRAwsedmkaR+jY5fzmn85AwvxzT5YzTKESOtXoWoR94HYNwnQQ12TRrDB1gw+GKfhkl9v1fhbwuzSLBMDvXBlR7HOz/juTZRSQIpbmhKjXFmZas02cAuPkF6gWtpaIE1ghxTINeeOw19b8hkfqB2ApTWxDO+tghqkLCglKSLLqOFb7tQ5Vs/2eQ+hhykI4XpWvjvbSUrGK24aoLwPkw1e5+1ltD/5g9/kLJMsmEeWZQO5ePDpChVaVPaZj2mL+nxR4LfDSBopsTPAvElte1u4q1IeWemRDErPdpOWW3H1FNk0h3WSvOnUqf02eRtgNsucBY6GepZYTKoL77+4+WI7RZFh7rZSy2SLs2RqqYQHr/jLcgkYvX66U1MEtgibNwqlSA/+SucsjY1LSat3VAWU0gx/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(52116002)(1076003)(83380400001)(54906003)(6512007)(44832011)(186003)(5660300002)(6486002)(86362001)(38100700002)(36756003)(8936002)(508600001)(66556008)(2616005)(6666004)(6916009)(6506007)(2906002)(316002)(4326008)(66476007)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUZVWGxQK1hsalVmb2dTMDJ1TG51YmU3QWl4Ym9UNTliTmsyNG5SY3RjVkpM?=
 =?utf-8?B?SW50Q2xqM3JQeDBsb2FkRnRudkNuNkE4S3ZTTUV3T2IySmZMNDBOa2ZQaFBo?=
 =?utf-8?B?bGlKbzNSQnppVEt4ejlZZDBRSThOVll6cW9XZW1zUlRnc3h6eHBDSEwySnFW?=
 =?utf-8?B?eDF1Z2kyRTZPd2UxZWJ6YnZ1VHRheHZSaFd5K05kMFRoVjFnbGtWeGMrTGtq?=
 =?utf-8?B?SVpSVE1CSlh6eEZoUUY4a1RuQVNZNWJ3WVE1QUpvWlRyY3Z0UnNCYUlFWjln?=
 =?utf-8?B?aXBzRmZZVW5JMGxMNW1lU05qMWxJUU1UbEtYbGd4ODNPazdMNUQrakpjRmZn?=
 =?utf-8?B?cEcwTzgvT2ZnQWY2YSt5Z1RlTE12aDVUL3oyQzZsL2wvKzd1RGJzUzgwVjds?=
 =?utf-8?B?aDJaY0RuZitOTnFZbmk0eVVscU9HRlV4RTVqc0kyZWRRRDl5YlFIUStKRHBE?=
 =?utf-8?B?dTRJSW1GVndYNno2ZkFMUFdVcUxIck9DOCtvOEtyZGE0SjdUVE8xUEFvOHV6?=
 =?utf-8?B?UVM3UmxrZUpVdEJHZmRObWhtUGRGVll6N0E4ZVk3R3VYSUIzU2E5anBaQTVD?=
 =?utf-8?B?YmVJREdMZUhJVlZpYW9qTWdRK0Y0eW01aExxWUUzTjNqVkFsVlh6QmJyKzZY?=
 =?utf-8?B?and0d0EraEw3dFEzbUZtaVUvYTZsSllFdk5IY3RlWEZNakxYQk1JZjVkc21U?=
 =?utf-8?B?SUVzMkNuLzFnLzd2TFhQMm5ReXlqYmtjRHJDTVl3MThjL3NGU1grdnRHNXdt?=
 =?utf-8?B?L3FsTWcyUGVEdmJxanZEL1RHb1YvVGlpdlZtNnkwMlpCQVlha2tNQzR1QzRi?=
 =?utf-8?B?aVJEeW42cDNzMzNJR1lINk1GNXFUYmtzS3lVQnpYaFU2dzRleDZKZk5iZDdG?=
 =?utf-8?B?aFB4d0xaU1VMZiswa1I4KzRNOG9FMWdHdE9WN0VQVVVtaWd0YmVqSWgwQVph?=
 =?utf-8?B?UTdmODJ6dXRCTndRekQ4ZlpGWlpzeisyZW0wQkxENUVGbTFBbVVIdGtqbjZD?=
 =?utf-8?B?VS9yOXljWExEbnYxMW1IWi9qb0xpTmd4bGRJb0hKVkY0R1dndjAxSzF2WXhN?=
 =?utf-8?B?eEV6MzJHK2NLcnFueGwrNEtUMkdaU0NTOWhFWGt2NHJERUorUVBhYlQvbXli?=
 =?utf-8?B?WVNDUDRTQ3k3dnBWN3pXeVdablZpZjlZdHRtUlRYZ2NxOU9oZTNibi90YXlB?=
 =?utf-8?B?YW5jdDI4SEFFQjNwOGVodlFDMGVpUEJBZEFIem1yazdVZXMrd21rMTU1OWdI?=
 =?utf-8?B?Tk15cjVWYW1CMW94SXJPVVJndEVqUzFQbkdOQXg4SGo2cnJhRTRPcVhCY0lv?=
 =?utf-8?B?NUtKcm0zY3MvcUhVUmJHTS9iQlJ4WkhHTVBobkI5ZkNlMzZmai95VmVPVU4z?=
 =?utf-8?B?ZWlIaThzVlhoTGEzWGZReFlhcGx6Y3VVcC9IMHVyOGNBR0EzTlZXYUczUkZD?=
 =?utf-8?B?M2t6YVVFRjB6TlAxenBLcWQvV3I0S05ocWZxTGI5VDBVNFVQeC9McEgzRFdE?=
 =?utf-8?B?c0NucElhV1VKMDhVeDRMVVFrd2pVdXJTdFhJQk1IUnhsc1Y4K0RVdVNFREVQ?=
 =?utf-8?B?TW9oZDlSOWZmSldsb1RZUDJ4aERUYyswM1ZuVVhPbU1sWUwrUk9yUlRqQnZC?=
 =?utf-8?B?bzZVNlgxTk9qWW8rQzZYdlJjRGIvbHJMZW9Fem41U3ZuK2xqMjdCVCtpbzhR?=
 =?utf-8?B?b1FxM2plRk12RXd1Y0JQQlZIR1JLZVBhWFRpVXpuTldCQkNSdmVlVjVpTEx4?=
 =?utf-8?B?aEtvWVlOR0svaTl0c0tXVEliUVViajRGRHAxVXhEa3g2YzlMVlFLUlA4WEh0?=
 =?utf-8?B?c3JLWHBDS0RicTVycmsvNFIrVitYdVZQYUVpZjY3cFpFVll5TVhQRGc2R2ZF?=
 =?utf-8?B?NC8raEJGMDY0THpvNmNZZ2VSSTlabnIzUXVzSTRrbCtPWUh5cVIzdWJ4dk84?=
 =?utf-8?B?d3ZIMVd0RGV1T3JaMnNzVTFHcEMrUm4xVHI0Y2VhRjliN3BOcTB0cEZCWDZs?=
 =?utf-8?B?Ums3RmgydHkxcGlxT0o0MGFXQnI1cnN5Wks2UDVCK2VKbUg2Y3lERGFvbGtq?=
 =?utf-8?B?QlovUkpnaER3ekVmTzhzRTltM3lJQUcvUVlSQ2hvQ3dKL3hLdFlabVc5TXhI?=
 =?utf-8?B?VitlelVsbHI4QlUxYVVjQ2RiUnM2WjZHNWRyQk9SZGZxVVEwVStTK1owaE8r?=
 =?utf-8?B?eFZOY21DZzgvQnVJenRKV281VFpYTldmZjBBOVdMb2FFUlFLb1dXcUVIVVIx?=
 =?utf-8?B?RzJNaUlydXBGSEVhZXRzOGs4bFlQR0ZHU2c3cHlwdWl3OUVYMkgwMlpmRml4?=
 =?utf-8?Q?vWyJda0+nop06lOQHh?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2783450-89fe-45a4-bb97-08d9c46521d8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 09:34:49.0767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vti/bD8cPuipfyn4cyuXyPLbUc8CczXJebsP8X31O+8VQg+k+BnE4wkkyWqkRrh/ZWgWI6W/5tdzExKzW0d6i0/4aLqFwpByC+1D9L4/cDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2267
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10204
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112210041
X-Proofpoint-ORIG-GUID: iYID7rXeMaFDScadoq8fsvc-g4SST8th
X-Proofpoint-GUID: iYID7rXeMaFDScadoq8fsvc-g4SST8th
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Provide information on the number of bytes copied in the pre-copy,
downtime and post-copy phases of migration.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 migration/migration.c |  3 +++
 migration/ram.c       |  7 +++++++
 monitor/hmp-cmds.c    | 12 ++++++++++++
 qapi/migration.json   | 13 ++++++++++++-
 4 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 3de11ae921..3950510be7 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1013,6 +1013,9 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
     info->ram->page_size = page_size;
     info->ram->multifd_bytes = ram_counters.multifd_bytes;
     info->ram->pages_per_second = s->pages_per_second;
+    info->ram->precopy_bytes = ram_counters.precopy_bytes;
+    info->ram->downtime_bytes = ram_counters.downtime_bytes;
+    info->ram->postcopy_bytes = ram_counters.postcopy_bytes;
 
     if (migrate_use_xbzrle()) {
         info->has_xbzrle_cache = true;
diff --git a/migration/ram.c b/migration/ram.c
index bd53e50a7f..389868c988 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -388,6 +388,13 @@ MigrationStats ram_counters;
 
 static void ram_transferred_add(uint64_t bytes)
 {
+    if (runstate_is_running()) {
+        ram_counters.precopy_bytes += bytes;
+    } else if (migration_in_postcopy()) {
+        ram_counters.postcopy_bytes += bytes;
+    } else {
+        ram_counters.downtime_bytes += bytes;
+    }
     ram_counters.transferred += bytes;
 }
 
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 9c91bf93e9..6049772178 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -293,6 +293,18 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
             monitor_printf(mon, "postcopy request count: %" PRIu64 "\n",
                            info->ram->postcopy_requests);
         }
+        if (info->ram->precopy_bytes) {
+            monitor_printf(mon, "precopy ram: %" PRIu64 " kbytes\n",
+                           info->ram->precopy_bytes >> 10);
+        }
+        if (info->ram->downtime_bytes) {
+            monitor_printf(mon, "downtime ram: %" PRIu64 " kbytes\n",
+                           info->ram->downtime_bytes >> 10);
+        }
+        if (info->ram->postcopy_bytes) {
+            monitor_printf(mon, "postcopy ram: %" PRIu64 " kbytes\n",
+                           info->ram->postcopy_bytes >> 10);
+        }
     }
 
     if (info->has_disk) {
diff --git a/qapi/migration.json b/qapi/migration.json
index bbfd48cf0b..5975a0e104 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -46,6 +46,15 @@
 # @pages-per-second: the number of memory pages transferred per second
 #                    (Since 4.0)
 #
+# @precopy-bytes: The number of bytes sent in the pre-copy phase
+#                 (since 7.0).
+#
+# @downtime-bytes: The number of bytes sent while the guest is paused
+#                  (since 7.0).
+#
+# @postcopy-bytes: The number of bytes sent during the post-copy phase
+#                  (since 7.0).
+#
 # Since: 0.14
 ##
 { 'struct': 'MigrationStats',
@@ -54,7 +63,9 @@
            'normal-bytes': 'int', 'dirty-pages-rate' : 'int',
            'mbps' : 'number', 'dirty-sync-count' : 'int',
            'postcopy-requests' : 'int', 'page-size' : 'int',
-           'multifd-bytes' : 'uint64', 'pages-per-second' : 'uint64' } }
+           'multifd-bytes' : 'uint64', 'pages-per-second' : 'uint64',
+           'precopy-bytes' : 'uint64', 'downtime-bytes' : 'uint64',
+           'postcopy-bytes' : 'uint64' } }
 
 ##
 # @XBZRLECacheStats:
-- 
2.33.0


