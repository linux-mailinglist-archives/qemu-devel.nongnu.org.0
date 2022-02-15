Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5773A4B744F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 19:24:33 +0100 (CET)
Received: from localhost ([::1]:43192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK2V6-0000im-5X
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 13:24:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1nK2QL-0003tH-2E
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 13:19:37 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:39278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1nK2QJ-0003vQ-1F
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 13:19:36 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FH3nBO017254; 
 Tue, 15 Feb 2022 18:19:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2021-07-09;
 bh=EUe3w6c9n/hYzTtc4NULeev65zqnVlOU5CXtRAnbdW4=;
 b=dCccVnafHK9ynVkDJ2vbtj7XtIspIvBpgDZMxBbsLxhaqqy6o6pTAslFasJdVu+oG8sM
 zDQj/SQPFhIHG5Yzmg/aOTBzQGQUFlW5/AXd0xp8BGJn3amaVlUZeFTHmgnqqvmtJl8e
 uImuv2K3v/6EXKBYTTQyakS+EYazscTKQZk72BbgS6p2+g77cFz1xy2prOu+P7AblTUb
 +4VhB0aJkVEtfTGSfOReiX+jIPe3sqOfM39Pki1fKHk7xY3INSpDSNKUBb5AIYif9srv
 t1ognMdHhpEkfPoYfYQHox+b25wfRQyiG4YN6EaLMij9msIAh8FuE4T0T9sS3qjGUMXt 5g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e871pt078-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 18:19:33 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21FIB8OM182288;
 Tue, 15 Feb 2022 18:19:32 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by userp3020.oracle.com with ESMTP id 3e66bp1aqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 18:19:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqQtHkWIGbfqD2+wPNjoVr0+7BnNjZZbWpNlz22yilgLcZJkvGMRDzQ8aR3n4lfbq2zKe2PBc1vjeenWJqj8ICfJ5jHR3GE6Vc2Kh97H2DLFJg2YpPSjCVLByJZ63qX29XF3jD4//BHUqLWvgwpOC92/qc4gOMQlNhR02rSHR6pTEb2D55aqlmOMOqI3AQsCttejh6R/wuWHuGt51IGrHspdERRttD7OfXIaWfQuXDYcGVSVg2KmIwGzzuIPkkYfvTJc8wRN9Kard2RSRtNNNO1iUlSoQnC1EaUB1VEPp95Qldu6NYpwRqpNzYKcJ3Je7TMMlhgNklW3uDJRl+I5NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUe3w6c9n/hYzTtc4NULeev65zqnVlOU5CXtRAnbdW4=;
 b=NWKDmsJcizJWyMeT/Xq8MOpM9Kzn5syIPukDtnK4TA6zmh9UynvbJB7VPiwUJYTUQh/WdCtQRhd+JqlTPjVg1ZBWuBIHxvow5BvD+Skfdfbg1tYSJd8G5Oz4ErxBCa0yZSUPiZhVXEdHUGRAHOXhTbcMrOM+qg7xzOy3nFiJEKJxAWkXdXRnT1by/cZh9tacASXdbO6hNR8lCPWFtloLogq9QLsn6plZ6GHHZoyLe1bumuNRR5XXNqCg09VfPQKCW3T7eMB2kR1AjWITlTpbPuPcZUYAaEbeCl8j4/qU7eLw7WcGtbxe/wFYbYDDo5UK1ZEBY0I+LLBaGFWroKYbog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUe3w6c9n/hYzTtc4NULeev65zqnVlOU5CXtRAnbdW4=;
 b=TLILVVoT2Yhym+qZyJUB+pFe0Df6Iefkfjv+Su4xuPwO6q+z5GTGUUWXO5eCzaSDftzvEl/sDiDrap2FrZ5RgwZBrsnxAHnZygv6crOOK8Sdfh/Ml+zcq2qJcYbLX93XkAF4zeWGST8ImR/oq9AfSQpQ/VXmwToBLDvX5COJ260=
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB5803.namprd10.prod.outlook.com (2603:10b6:a03:427::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 15 Feb
 2022 18:19:29 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::4bd:1cfa:5aee:6c81]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::4bd:1cfa:5aee:6c81%3]) with mapi id 15.20.4995.015; Tue, 15 Feb 2022
 18:19:29 +0000
Date: Tue, 15 Feb 2022 10:19:27 -0800
From: Elena <elena.ufimtseva@oracle.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [RFC 4/8] ioregionfd: Introduce IORegionDFObject type
Message-ID: <20220215181927.GC33858@nuker>
References: <cover.1644302411.git.elena.ufimtseva@oracle.com>
 <fa5bc2e2773966fd209a2c866eb95ac8ac60a928.1644302411.git.elena.ufimtseva@oracle.com>
 <874k55o6rc.fsf@pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874k55o6rc.fsf@pond.sub.org>
X-ClientProxiedBy: SJ0PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::24) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f7db962-104a-4ffb-9fb2-08d9f0afb4ca
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5803:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB58038CA8B8FFBF65513E91E58C349@SJ0PR10MB5803.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h1/6PFGmGkJt/IiMp6Ild+ObHTDPQmCPQHuZa5LfqUB3Q+afwa8pjqMSI/w5vIz9nCrsD+E64DO7tYgfFvMNjxHDkcAXhG4SPLCuxmhTF2C6pr+qNMw0JlE3tLfkPoX2U9jc6O72mH7y/4gR5UKoCejhyDx8c4ZvFxa6VqHY4rPCeFw3P+9GlTxmUYFcsUzjGbEN7DUmrxWLLlGAgfZqKEfYUSXRqORuaVyLHowcIJn0pzawJSOF1BAtXDJYGpaFD+KCychXFGubALwAoG6hLl1zL4/um435fJr665Eg2qNRpmFWra32Zonms/uvhe7a9p9Od1gvas/jobJz1FLyuAANktP8mc90unCxoB0RW9tnc4llO4euWXnuN5LGB7h7hl3eBnI6cRzkhAx4s34Ievk/wQotw4lFddy/k8hNJ/SOlIfCI9+10HOgyJ9wBTB8Wf0zt6DGg8Lh3loTcOLdDyDpxx5IuHKZUFrpcrlpCX9+C0RIppc1gz/Os3S6+amqAkgXQUeZ0rqzDFri/mN9Bp9LTPCz65n9wz39frRHqWhvubkt/xNAaWKFUEZQDgSYvpDZGpYisJnTvVIx9f9vQ8u6L0FfPRovYUt9KWrCSQcn4M7dgkWRHNgMbk1xI+RewguzmgXaKvE12uM1dUpsGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(2906002)(33656002)(186003)(4326008)(38100700002)(8936002)(1076003)(5660300002)(8676002)(6486002)(86362001)(316002)(66556008)(66476007)(7416002)(508600001)(52116002)(6506007)(6512007)(66946007)(6916009)(33716001)(9686003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjJqdUUwNDdxNHIxeGR1U21mbGlaVnVRd0YvN2UzZS9aYXJHSHhiSG1rdFk4?=
 =?utf-8?B?MFRuaU5VMDdCVmphVE5mRzBXeVZpTVJCVUNmRmIxdXBhSjRNS3l2K0NSWlph?=
 =?utf-8?B?TU1UT3UzZmF5U3NsYTlZNVQrVTRCQzlWcTk5MWl2UGR0Rkkwd0JxOHJtR3VN?=
 =?utf-8?B?Wk1ROFc3V3U0T2d6Y1Q3RFM5OEwyUDV6RmlOQnc1UjdkR0FXVVdvcDVxcmVE?=
 =?utf-8?B?Q2FzTnV3UDRFMFRia1k2OS9xRi9WY2M3NDBoQ3RUTk1WVUswbkd1RHhHNVJw?=
 =?utf-8?B?OUEzR3N3VVJZaElicHN0a3A4QXhqVmJUSFpFdEg2TWZic1E0TzhRVWFFdjFI?=
 =?utf-8?B?ZGcvOHNGb3MvVGszOXZGZE5ZVnUwb0RiVWg1QU0yUTRoWFhjRkEzeGtzOXR0?=
 =?utf-8?B?UHVhOGZnd0U4SGd4TC9TK1o2cW5DYjFqQmtPNkJzSjdZWHIrWjBJYzBoMmZW?=
 =?utf-8?B?eG85QkRHZWNmZEFSYkRRUjNCRk5FU3M0Nm9HQ0NyRnk4YXVNQndPQ0JNT0xq?=
 =?utf-8?B?eGFDQ25jcWt3OEdaeWE0R0NoZGdMNFVPcU9BU0ZHUjJ1c1VKc1BHVG12Qnlr?=
 =?utf-8?B?YWZNZENRMTJDbjBrOEtOTEhaK0U1UkF1N3RWNS9jOExVQUxHQ3dlWTkvM3ln?=
 =?utf-8?B?SW1JbTVwd0E1MUx1OVF4YnFTYm9SVld0dlhtS2k5NVhQQXEzaHBkL2paTVM0?=
 =?utf-8?B?d0xTaUpwY1Q0aDVEbFU0SmpDcHRsWWF3MHhScFk5UnpKUEVYQThGUVpwOXJq?=
 =?utf-8?B?T1N2VkpKWmRrR3pKWnJkYzE0QWhFN3lJYVZKQVRYcy9vd2VkQVY5djhuNmRL?=
 =?utf-8?B?aktuaXYzT1h6RndtRVFaR0pnUUxHbHAyTXI3RCtiUjdSM2ZpWE1nTmdJam5u?=
 =?utf-8?B?OEcvOHRDTHJLN09oRi9yakNLa2x6Vk5icURaRDBtWlkrZnR3cU5FM3k2TUI5?=
 =?utf-8?B?WDVCMUE0N0VOQ2E2bWU0SHRHZGxFOEJZYjdlUjJ1MXFJR0FoZDMvZzRoQ0xm?=
 =?utf-8?B?MTNWQWV2d0djejI4TG1tMXc2MEJmUzVEeElNYUlpaGxyUkYyS3lPdTVGd3Nx?=
 =?utf-8?B?dXVIM01OQytoZ2Q5akNTNkt3NXJLVktSMUlHS0RPYjVwU1VVYmFCbEZRakh3?=
 =?utf-8?B?dWZ6MTdvMVRnRWVheFVnQW8wQktOdWt2YTVWSzNaMDg3QjhUSFc5emwrZFNR?=
 =?utf-8?B?ckppRlcwMkdqaWlVb2FqM1R6VjdxL3g2cUFYVkl2dWdrL3hQRlJTMTZHQkh2?=
 =?utf-8?B?OHJtLytlaGNlTEFNZHgxVDZ3cXVnclRUT3FNcDBmYSsreGxtRG9WVTBNZWNa?=
 =?utf-8?B?bzg5cndJNGkvSGM5M0N3dGV2NEhFbXVnL3pTRFpyY0lmcDBtWjV6eVk4QjVs?=
 =?utf-8?B?LzY2UDlDU3pKY2JJeUphSER2Skh5eU45RWl3bG1aMjhJK25heEErMlNWb3pU?=
 =?utf-8?B?aVExU09DR1hEZkw4LzlaVEw3RTRsTHJaRm14VHU4MDdPanlnVE4va2lsS3pa?=
 =?utf-8?B?MXpKUmJoU3ZRRmNmZmhtVFM2dFg2Mk0yaEJWeEhaQlNCeFIzcHpIdEhZdGQ5?=
 =?utf-8?B?WUpFaVptZUE3THVVT0lMWXFaOWlBbk5sOTBFelZ1VG0vd2xkTEgwZUUzTVR6?=
 =?utf-8?B?ancrRk14a1l4dnpMT216Zy9rbUQ4enRNcEZRM2p4WVh3bjUxZnNaOEpsVk5r?=
 =?utf-8?B?TXlscEozbVlRZFN5RXoyRDRxQ2JpRTJ6SnVQQTZQQkIrcWlzVk9ReHZpK0hx?=
 =?utf-8?B?dWdsb0JuY21JMExWOEVVcEtCQ2prV1BsTy8xWmcxV3FIVDNseWxnQmpKYkEx?=
 =?utf-8?B?cXJVYkpDNFJkT1I2Qmd0dStwZzgzOURzclhBK0JLakJWMFNiOXJrT1NjeGkw?=
 =?utf-8?B?Nk5MYWRHSHdiak9kUXljOTlSanltendtNHJrbHB6MGQzcEdzME5nWVdDWnl4?=
 =?utf-8?B?cVdVY3hGN2w4bXA0bW8xM3BXSkN4blJIQTdqSGZJYWZGWVQ1czVWNjVtb1Fn?=
 =?utf-8?B?WksvOHl6THV2QjBFc096UE9uNVJSZUFUT0NSTGJ5OVJidC9wc3lvRHBDSmQ0?=
 =?utf-8?B?T3JrZlpSOGRBeGFEbXUyamxHUi80cGxoamtPVmlVd2dLZTdvL2ZDcE9McjBh?=
 =?utf-8?B?dDd5TWE1UWIrUlpTbmYyaXFiNkhIZUM1TG5vLzhRSktUZ3VSaGw0YWY1SGVt?=
 =?utf-8?B?OXZzTG8vdDFUY3Y1RVhzYWR0dGp3QjA1QmN0UW1BTzgyTHlQeEsrS1VOS2h2?=
 =?utf-8?B?ck15UVZERjg2dXJJTURFSU51dzA5bENIQmtCUVVhTnZiejlCTmVHV3ZPNFJk?=
 =?utf-8?B?S2ZsaE9vN0R0QWxTT1pLSnROSDRXd095MU1XODNzS2psREROam9pUT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f7db962-104a-4ffb-9fb2-08d9f0afb4ca
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 18:19:29.4788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UAEs9vhViEFxTdHsp2DcEj+KUFc3HDJcWRqCbk7nut4ugxxYjvwwdt9qlmahdmr+69CX0LUuzHR5iWPCTqCDmLetDV4OxmoPFe3JdJcQXSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5803
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10259
 signatures=675924
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150106
X-Proofpoint-GUID: 1rTH-7Hgo9QDVQTY8vxIydwXMGkMMcUp
X-Proofpoint-ORIG-GUID: 1rTH-7Hgo9QDVQTY8vxIydwXMGkMMcUp
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: eduardo@habkost.net, john.g.johnson@oracle.com, cohuck@redhat.com,
 jag.raman@oracle.com, john.levon@nutanix.com, eblake@redhat.com,
 david@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com, mst@redhat.com,
 berrange@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 11, 2022 at 02:46:47PM +0100, Markus Armbruster wrote:
> Elena Ufimtseva <elena.ufimtseva@oracle.com> writes:
> 
> > Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> 
> [...]
> 
> > diff --git a/qapi/qom.json b/qapi/qom.json
> > index eeb5395ff3..439fb94c93 100644
> > --- a/qapi/qom.json
> > +++ b/qapi/qom.json
> > @@ -689,6 +689,29 @@
> >          'data': { 'chardev': 'str',
> >                    '*log': 'str' } }
> >  
> > +##
> > +# @IORegionFDObjectProperties:
> > +#
> > +# Describes ioregionfd for the device
> > +#
> > +# @devid: the id of the device to be associated with the ioregionfd
> > +#
> > +# @iofd: File descriptor
> > +#
> > +# @bar: BAR number to use with ioregionfd
> > +#
> > +# @start: offset from the BAR start address of ioregionfd
> > +#
> > +# @size: size of the ioregionfd
> > +##
> > +# Since: 2.9
> > +{ 'struct': 'IORegionFDObjectProperties',
> > +  'data': { 'devid': 'str',
> > +            'iofd': 'str',
> > +            'bar': 'int',
> > +            '*start': 'int',
> > +            '*size':'int' } }
> 
> Should these three be 'uint32' to match struct IORegionFD?
>

That is right, I will fix this.

Thank you Markus.
> > +
> >  ##
> >  # @RemoteObjectProperties:
> >  #
> > @@ -842,8 +865,10 @@
> >      'tls-creds-psk',
> >      'tls-creds-x509',
> >      'tls-cipher-suites',
> > -    { 'name': 'x-remote-object', 'features': [ 'unstable' ] }
> > -  ] }
> > +    { 'name': 'x-remote-object', 'features': [ 'unstable' ] },
> > +    { 'name' :'ioregionfd-object',
> > +      'if': 'CONFIG_IOREGIONFD' }
> > + ] }
> >  
> >  ##
> >  # @ObjectOptions:
> > @@ -905,7 +930,8 @@
> >        'tls-creds-psk':              'TlsCredsPskProperties',
> >        'tls-creds-x509':             'TlsCredsX509Properties',
> >        'tls-cipher-suites':          'TlsCredsProperties',
> > -      'x-remote-object':            'RemoteObjectProperties'
> > +      'x-remote-object':            'RemoteObjectProperties',
> > +      'ioregionfd-object':          'IORegionFDObjectProperties'
> >    } }
> >  
> >  ##
> > diff --git a/include/hw/remote/ioregionfd.h b/include/hw/remote/ioregionfd.h
> > new file mode 100644
> > index 0000000000..c8a8b32ee0
> > --- /dev/null
> > +++ b/include/hw/remote/ioregionfd.h
> > @@ -0,0 +1,40 @@
> > +/*
> > + * Ioregionfd headers
> > + *
> > + * Copyright © 2018, 2022 Oracle and/or its affiliates.
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> > + * See the COPYING file in the top-level directory.
> > + *
> > + */
> > +
> > +#ifndef IOREGIONFD_H
> > +#define IOREGIONFD_H
> > +
> > +#define PCI_BARS_NR 6
> > +
> > +typedef struct {
> > +    uint64_t val;
> > +    bool memory;
> > +} IORegionFDOp;
> > +
> > +typedef struct {
> > +    int fd;
> > +    char *devid;
> > +    uint32_t bar;
> > +    uint32_t start;
> > +    uint32_t size;
> > +    bool memory;
> > +} IORegionFD;
> > +
> > +struct IORegionFDObject {
> > +    /* private */
> > +    Object parent;
> > +
> > +    IORegionFD ioregfd;
> > +    QTAILQ_ENTRY(IORegionFDObject) next;
> > +};
> > +
> > +typedef struct IORegionFDObject IORegionFDObject;
> > +
> > +#endif /* IOREGIONFD_H */
> 
> [...]
> 

