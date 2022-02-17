Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3644B9AD7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 09:26:26 +0100 (CET)
Received: from localhost ([::1]:41762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKc7N-0000kd-8M
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 03:26:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbXq-0003nR-3s
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:43 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:5652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbXj-0004Rw-AJ
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:39 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H5U2GN009058; 
 Thu, 17 Feb 2022 07:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=iST3K82NIeqW+bG3KB6k4nm6u1olMU0vXCsFdF5rD94=;
 b=lHlc8y+anRaUcKNImHo61vlLGSTyOvn+5yI9EMaaLzZ8Kj5B+KNdWc4l+ch3Axq/U03k
 8DSA8cgF0wOQOedHr3QkwvBfYPGF+55U3oR0uEd+4sFVCz9ESWLxG+/QmincWTDnERMy
 cRw9EqSXWCilp+eGS9Xn/h5MyYDlr9ng3ijJ85Ljg+fDXDiqxMXDj2IBnuUZVWaTg5ZU
 FRdjAWcGp7HpUnWCiIxunVyEbLTSJD9tjqZZzolQMI/0UCKGPeoBZmiSQoRAQME8b3K9
 viiitvt7rj3OXfOPI1zQ8UqeVIMpc/UhkFVwquCG7Gcve2IxsGiZLXqOVh5Gw3OuXJuE kA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8nb3mhqx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:31 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21H7gaTG088434;
 Thu, 17 Feb 2022 07:49:30 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by aserp3030.oracle.com with ESMTP id 3e9brc0r8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mB+tVV/6cGnGlBzjEfkML69xfnpP7XDbUSib061r16yENLUUD70jhZdnOzyyjg/eHtVv7YscKSMxUB3YFli41ZX7bKOUiMXoBNfOr2FqOPFQmDjCclXlLg5Su7u0lXmv7DOO9LapLY9k8G+WRcgcDVG9I+uFvPIL5m4YLkcS9GylwLecvZnQQs2vaTto1z0NLEvmDaa2N0NGZC0tl0n/LfjqUogb9tDNzC+Rc6JNgxfQQg55oPL6vmcitWfwX21QUSna7OlU5s0MPfLM67M4tJAMzXdC79pO7nFi/I88VHKBKd21zS0P2ACTsBPq+mJG/HOHl1A639xEYEzfe1yIyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iST3K82NIeqW+bG3KB6k4nm6u1olMU0vXCsFdF5rD94=;
 b=XZHcDWS6X79Zp/JMQJTl9tMy242jkazaLV+POCBS3T5Cfx/IMD4mmrBmflcRpr9ltMgktumNcM9AgPjHClYadVKaauBNSt8nSoOJmLfS56O61uiTpBAsnr9eK9jJrMyY6WMENH/wQhiSAb7ZMfKmlCHhLbjqhkglEV53wpG9LT/PxjyhlYzJtWwa9WU6e2BTUJgeCDS1imKZC0dCzcwXXUKS74ey8uDH38UpsYVPAVG+1qrk0cGj44XDrQTBHUIshCCQBuwHN3AqTQbOOmAC4QCMbx+HvweeMpdnC/hjcLNo3b8SoP9696tcuhe5OwXdfx6WprqCKTlU1CJCvnbi5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iST3K82NIeqW+bG3KB6k4nm6u1olMU0vXCsFdF5rD94=;
 b=fjfKilRbkKdDfXXeqnwlReSy2fuFroSRRJj8Vrd8WFnUSx1DKCyhClUaNSoTBTNfAEZCeNz40WWSQ2hVsL+n83WWNVjHFeWTSa8kFprt9yuYssXFS647PlU0jaYjCf6bBTUNTCtk2BbC/9rm01etpRwSQ2BB0MIcTnbGLXO1te4=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by DM6PR10MB3211.namprd10.prod.outlook.com (2603:10b6:5:1a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Thu, 17 Feb
 2022 07:49:27 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe%6]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 07:49:27 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 07/19] vfio-user: define vfio-user-server object
Date: Thu, 17 Feb 2022 02:48:54 -0500
Message-Id: <309a6afc6f47d7e812a6f18ce591dff092efbb06.1645079934.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1645079934.git.jag.raman@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:806:a7::7) To CH2PR10MB4008.namprd10.prod.outlook.com
 (2603:10b6:610:c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8ff7ce3-0192-4cfa-516c-08d9f1ea05ea
X-MS-TrafficTypeDiagnostic: DM6PR10MB3211:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3211135E233E8C2AF14B04E590369@DM6PR10MB3211.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:457;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U6u8rjsRRaHASkH5ETrXQ9vJ7PXNOCN+HP8vrz64aJ+bFyRT8Mi6ZHy0inlW8gvltXOolxjuxytrGvn2RfwqT+2w8to0Z0ExShXr5wRVp739rOr9Y2w0TLqG/FnDr3Tse3ICopc8ycfc1ldbHkTl5Ofdq2eOq3h0WpMjtthPvuwUAVTAW9jH8bvsLNN+5Sufww8t0osQziD4ZqqkZR5stAzQIDpvZ+bZr4l/8tWo9vORwmw49tt+7yEUL9P/hZkAI9j64oZUckYE8Fs4CueX1n5ZUI9KQXiZd5/nq+ByvIB+yyiGAEgrQcvZ5TpgnoDScI57vsE+K7fXiXoJIXonbOdBRsDfwNKkqvp/i9VK2YGU3TogBoj34rCliLunUnQiSmRM4Xoh9s6rtv6EJvEYuEfYxK0tx/6ZZpLGRK+uZ7/vtFqEbDoDVO/v1iygxCdpCB+FnL44bPyuswX34eXv0FO5C185PDNXp0SvoYyjN/pOBd0UXAP8DCUrozUdcVycwrAtSsB9kav4KvK8fLqQ7eJJksIcNQXdVWNfi2J1Dt6ajQSLL8rA/wSqERYiyeq/GjPGm3DHJCjkf/4t0kI5p8TQ1nov43Kgf4pcot+vOWiGbRjFYrlAhMDsnWppDuIJQsTJHI5XASS1e4HZiZv8kf6cFAR/UrazUC4kpjSSQdToWHQInT7mIeSXxh9/0N5EwAXyc1lqAc5yI7/ofiZ3EA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(186003)(66946007)(38350700002)(7416002)(4326008)(107886003)(26005)(66556008)(6916009)(8676002)(5660300002)(2616005)(8936002)(86362001)(38100700002)(66476007)(36756003)(316002)(508600001)(52116002)(6512007)(6506007)(2906002)(6666004)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWh1cG8vQ3RlZkVrRDFPd29wa1NDaHhncnZOeTFWNU0vVDlxTDdKZUlpZnZu?=
 =?utf-8?B?R1RveHpjYjYvanFHODN1NXVCQ2E5RVRHUHdqb2dnNFgyVXo0c2FQdDdyL095?=
 =?utf-8?B?OTdtc2kzOElKck1oQnVKVnF6dUIycmpoQ0gwQ2oraUIzQVp1bktiT0JHTEtK?=
 =?utf-8?B?dXoySmd4KzhwcHhQSUNkcjE3RUY3RFJZMWFqVEVmSHpQeUUxcTIvUW9sdnhk?=
 =?utf-8?B?TkhjTFZXdlFiWjVYNVlqZVVhcFR1Sngva2F6KzdIaGFVMGlzVGpSdHhVY1cx?=
 =?utf-8?B?eElzUjh1b3p5MDZVTUUrWHA5b3FvbWo2WFBtK1QydXZRemFyZ0duNCtlMFFZ?=
 =?utf-8?B?Nmdxb2F1bGRIKzJ5aldGVTFuY0gwSG9EcjVUdU14emtiNlRkQzRBYXpZSTVu?=
 =?utf-8?B?TUhpallKWmdHRDdYaFBjRVZFbnJQcWhiOXY1WE82dmdzTXNXeHcrUWIyb3Bv?=
 =?utf-8?B?WW9zTXo3NzdidFF4dEhOMW9IbCtnZERQcmMvUFFSNmFJRlEweXFmV2NIc0pD?=
 =?utf-8?B?RTB4OU15UzRBbTExUzczcmZRT1QyODF2c3NJS0tTeS9ObVdCNTFpM1Q5U1Nt?=
 =?utf-8?B?VXZOQ1FSKzlCUU5JaTBoZElDTEJtRG1mM2RzRUhFb3JleWhYcXhuc0Zma0lx?=
 =?utf-8?B?LzlodHpiSGE0VXViWnBJL2xodnVaNXB1bjYyVUpiMXRqWEl2akkrYzlGbUpp?=
 =?utf-8?B?NTI1SFlZTjRTaWswcHFiMkZJVmdtV25UTzg5L0FsbWljNUxXR3ZHeG9RTklL?=
 =?utf-8?B?T1E1TmJNU2VUeFUxU3ZlTkwxRTgwVkRIYzJ5MUhLL0c4cER1RzZwRTAzU01L?=
 =?utf-8?B?dXFUV3dXV2MzZVhWRzJZcUE4dkE4cnptdEltU3hDUytKSGRpMjVSbmZIVC9H?=
 =?utf-8?B?VlhXTU1TRDJsUUE3U0M2bENGTTN5YkJrRy9DM091MDRiOTJJYlJOSVh2cnBI?=
 =?utf-8?B?UUpNb2F4VUEzL0tabFB0SEc0NGUyc2FyU1pkZVVYSzZjdEVncHgzY09PcWJM?=
 =?utf-8?B?bDBpeTBRdzZvTUlEWmhncXV3L24ySG1hUks3emgxYW16aFhYRGRxSG9zVVFB?=
 =?utf-8?B?SHJ6MjRPei9yVm85TXVCRy9SdldQTSsrL1hEcWh3bi8wNUdMSFovV3F1eHN2?=
 =?utf-8?B?V2d5bUpWUzJyeWpFQmdKLzdqOHVwbGFhalhJRkhjRE92Z1RWYjlScDRmdDlZ?=
 =?utf-8?B?dXoxTkFwOXNrYW40WUd6dFNaUHRWRWE1NSttU21nbW5ZSTk2TFhaaXRScHdl?=
 =?utf-8?B?Y1AzYWVhZk9CWU90SkV1ZXBIL2hpSDhUNFpnR1ZySG9oS3BkM1hSVmxRSlBC?=
 =?utf-8?B?dWRySGlmQzA3aXpiVy9YWmp4ckZ0ekNxSlpLVzBtV2lkZTgwaHNSRytadjdj?=
 =?utf-8?B?REZ2Y1lvNlUyaVFQa1g5UTF0YjFEeVErWVdTRzdVcDZnS2Q4UVZmU1BUeU12?=
 =?utf-8?B?aFVyNHFiSlZna0J6bEVyUWZhNDlRUjZEMGdWcVMwQzhqNVB4dGNkVktvbkZz?=
 =?utf-8?B?eE5Dd3F5bHdqWW5GeldQZG9hemVMR2VlbXkyaXFwWFRHVDA2RFRyNTIyRzl0?=
 =?utf-8?B?dFQwZUNxQU9keGtaVHFTWGJUR0hSUHlVNXl1Y3YvNjBUWjZvWDB4UjV1YWho?=
 =?utf-8?B?WFhWYkZGbzE0V25pTlZiVnVtRkJmVmdJalRBOElCYWRUZ2E3blVaYTB5Ry96?=
 =?utf-8?B?VUJac3I0M08xVDk2blAzYlJ3TVhYMUNhZThMeGRObzliRTJneFdpUnllYzNC?=
 =?utf-8?B?REt6dmh4Z2ZDdi93bnhLRENiZzdMK1RYc0dwV280VlJUQVdjTFYwcG8wMGJm?=
 =?utf-8?B?NEZXT29ON2s3L21PdE5aeUNueVpVbkdEVXcrUmZUZUIyaUh2ZzMxZFNpS0E5?=
 =?utf-8?B?UG5oTVlHbE5xa3VjQjJjQUloc1ZiNG5xSm5GalZ1ZzNoT1ArVjFwSVZwNktu?=
 =?utf-8?B?TEVzUFdpZ2ZPdGVYSk9wL20wT1lsQlJSU2NIdzJzb1ZVR2tQcFJkYk1JOFND?=
 =?utf-8?B?QjdQRHlFT05Zd2Q2Z1IrQUdlWXVhMmgxSWdOMitnLzNrY3h6Y0diSnpoblY2?=
 =?utf-8?B?c2o2VUFqamo4OGFPOWV3a1l0dVhIVm0xNm8xRm9xLytCc0hwcVFkUC9lMWhO?=
 =?utf-8?B?VlplYjNZdGNkMmFzRWNNMWlDSzZMQ0FmRlpQbGNBTEpkR3ExL1hadFJuVmwr?=
 =?utf-8?Q?zCS3fKbG7K3B5Ujit/D7u1I=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ff7ce3-0192-4cfa-516c-08d9f1ea05ea
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 07:49:27.4769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /fTKYkIB9a3qk1khgreVwDKN0w/CgENCw0X5G5mSdxjq0oXbIRcqDQDQ7ARO2UeL1oQoyAzLHAD6p8TxSaOR2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3211
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10260
 signatures=675971
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 phishscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202170034
X-Proofpoint-GUID: VbvgAWl2MO6-Xc8HBmOeuCI9MMxqE0m_
X-Proofpoint-ORIG-GUID: VbvgAWl2MO6-Xc8HBmOeuCI9MMxqE0m_
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, jag.raman@oracle.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define vfio-user object which is remote process server for QEMU. Setup
object initialization functions and properties necessary to instantiate
the object

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 qapi/qom.json             |  20 +++-
 hw/remote/vfio-user-obj.c | 194 ++++++++++++++++++++++++++++++++++++++
 MAINTAINERS               |   1 +
 hw/remote/meson.build     |   1 +
 hw/remote/trace-events    |   3 +
 5 files changed, 217 insertions(+), 2 deletions(-)
 create mode 100644 hw/remote/vfio-user-obj.c

diff --git a/qapi/qom.json b/qapi/qom.json
index eeb5395ff3..ff266e4732 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -703,6 +703,20 @@
 { 'struct': 'RemoteObjectProperties',
   'data': { 'fd': 'str', 'devid': 'str' } }
 
+##
+# @VfioUserServerProperties:
+#
+# Properties for x-vfio-user-server objects.
+#
+# @socket: socket to be used by the libvfiouser library
+#
+# @device: the id of the device to be emulated at the server
+#
+# Since: 6.3
+##
+{ 'struct': 'VfioUserServerProperties',
+  'data': { 'socket': 'SocketAddress', 'device': 'str' } }
+
 ##
 # @RngProperties:
 #
@@ -842,7 +856,8 @@
     'tls-creds-psk',
     'tls-creds-x509',
     'tls-cipher-suites',
-    { 'name': 'x-remote-object', 'features': [ 'unstable' ] }
+    { 'name': 'x-remote-object', 'features': [ 'unstable' ] },
+    { 'name': 'x-vfio-user-server', 'features': [ 'unstable' ] }
   ] }
 
 ##
@@ -905,7 +920,8 @@
       'tls-creds-psk':              'TlsCredsPskProperties',
       'tls-creds-x509':             'TlsCredsX509Properties',
       'tls-cipher-suites':          'TlsCredsProperties',
-      'x-remote-object':            'RemoteObjectProperties'
+      'x-remote-object':            'RemoteObjectProperties',
+      'x-vfio-user-server':         'VfioUserServerProperties'
   } }
 
 ##
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
new file mode 100644
index 0000000000..84cd16c4ad
--- /dev/null
+++ b/hw/remote/vfio-user-obj.c
@@ -0,0 +1,194 @@
+/**
+ * QEMU vfio-user-server server object
+ *
+ * Copyright © 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL-v2, version 2 or later.
+ *
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+/**
+ * Usage: add options:
+ *     -machine x-remote,vfio-user=on
+ *     -device <PCI-device>,id=<pci-dev-id>
+ *     -object x-vfio-user-server,id=<id>,type=unix,path=<socket-path>,
+ *             device=<pci-dev-id>
+ *
+ * Note that x-vfio-user-server object must be used with x-remote machine only.
+ * This server could only support PCI devices for now.
+ *
+ * type - SocketAddress type - presently "unix" alone is supported. Required
+ *        option
+ *
+ * path - named unix socket, it will be created by the server. It is
+ *        a required option
+ *
+ * device - id of a device on the server, a required option. PCI devices
+ *          alone are supported presently.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+
+#include "qom/object.h"
+#include "qom/object_interfaces.h"
+#include "qemu/error-report.h"
+#include "trace.h"
+#include "sysemu/runstate.h"
+#include "hw/boards.h"
+#include "hw/remote/machine.h"
+#include "qapi/error.h"
+#include "qapi/qapi-visit-sockets.h"
+
+#define TYPE_VFU_OBJECT "x-vfio-user-server"
+OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
+
+/**
+ * VFU_OBJECT_ERROR - reports an error message. If auto_shutdown
+ * is set, it aborts the machine on error. Otherwise, it logs an
+ * error message without aborting.
+ */
+#define VFU_OBJECT_ERROR(o, fmt, ...)                         \
+    {                                                         \
+        VfuObjectClass *oc = VFU_OBJECT_GET_CLASS(OBJECT(o)); \
+                                                              \
+        if (oc->auto_shutdown) {                              \
+            error_setg(&error_abort, (fmt), ## __VA_ARGS__);  \
+        } else {                                              \
+            error_report((fmt), ## __VA_ARGS__);              \
+        }                                                     \
+    }                                                         \
+
+struct VfuObjectClass {
+    ObjectClass parent_class;
+
+    unsigned int nr_devs;
+
+    /*
+     * Can be set to shutdown automatically when all server object
+     * instances are destroyed
+     */
+    bool auto_shutdown;
+};
+
+struct VfuObject {
+    /* private */
+    Object parent;
+
+    SocketAddress *socket;
+
+    char *device;
+
+    Error *err;
+};
+
+static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    VfuObject *o = VFU_OBJECT(obj);
+
+    qapi_free_SocketAddress(o->socket);
+
+    o->socket = NULL;
+
+    visit_type_SocketAddress(v, name, &o->socket, errp);
+
+    if (o->socket->type != SOCKET_ADDRESS_TYPE_UNIX) {
+        error_setg(errp, "vfu: Unsupported socket type - %s",
+                   SocketAddressType_str(o->socket->type));
+        qapi_free_SocketAddress(o->socket);
+        o->socket = NULL;
+        return;
+    }
+
+    trace_vfu_prop("socket", o->socket->u.q_unix.path);
+}
+
+static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
+{
+    VfuObject *o = VFU_OBJECT(obj);
+
+    g_free(o->device);
+
+    o->device = g_strdup(str);
+
+    trace_vfu_prop("device", str);
+}
+
+static void vfu_object_init(Object *obj)
+{
+    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(obj);
+    VfuObject *o = VFU_OBJECT(obj);
+
+    k->nr_devs++;
+
+    if (!object_dynamic_cast(OBJECT(current_machine), TYPE_REMOTE_MACHINE)) {
+        error_setg(&o->err, "vfu: %s only compatible with %s machine",
+                   TYPE_VFU_OBJECT, TYPE_REMOTE_MACHINE);
+        return;
+    }
+}
+
+static void vfu_object_finalize(Object *obj)
+{
+    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(obj);
+    VfuObject *o = VFU_OBJECT(obj);
+
+    k->nr_devs--;
+
+    qapi_free_SocketAddress(o->socket);
+
+    o->socket = NULL;
+
+    g_free(o->device);
+
+    o->device = NULL;
+
+    if (!k->nr_devs && k->auto_shutdown) {
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+    }
+}
+
+static void vfu_object_class_init(ObjectClass *klass, void *data)
+{
+    VfuObjectClass *k = VFU_OBJECT_CLASS(klass);
+
+    k->nr_devs = 0;
+
+    k->auto_shutdown = true;
+
+    object_class_property_add(klass, "socket", "SocketAddress", NULL,
+                              vfu_object_set_socket, NULL, NULL);
+    object_class_property_set_description(klass, "socket",
+                                          "SocketAddress "
+                                          "(ex: type=unix,path=/tmp/sock). "
+                                          "Only UNIX is presently supported");
+    object_class_property_add_str(klass, "device", NULL,
+                                  vfu_object_set_device);
+    object_class_property_set_description(klass, "device",
+                                          "device ID - only PCI devices "
+                                          "are presently supported");
+}
+
+static const TypeInfo vfu_object_info = {
+    .name = TYPE_VFU_OBJECT,
+    .parent = TYPE_OBJECT,
+    .instance_size = sizeof(VfuObject),
+    .instance_init = vfu_object_init,
+    .instance_finalize = vfu_object_finalize,
+    .class_size = sizeof(VfuObjectClass),
+    .class_init = vfu_object_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+static void vfu_register_types(void)
+{
+    type_register_static(&vfu_object_info);
+}
+
+type_init(vfu_register_types);
diff --git a/MAINTAINERS b/MAINTAINERS
index 9af3e96d63..751d97852d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3568,6 +3568,7 @@ F: include/hw/remote/proxy-memory-listener.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: subprojects/libvfio-user
+F: hw/remote/vfio-user-obj.c
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index dfea6b533b..534ac5df79 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -6,6 +6,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
+remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: files('vfio-user-obj.c'))
 
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: vfiouser)
 
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 0b23974f90..7da12f0d96 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -2,3 +2,6 @@
 
 mpqemu_send_io_error(int cmd, int size, int nfds) "send command %d size %d, %d file descriptors to remote process"
 mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d, %d file descriptors to remote process"
+
+# vfio-user-obj.c
+vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
-- 
2.20.1


