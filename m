Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FD9518671
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 16:19:12 +0200 (CEST)
Received: from localhost ([::1]:45734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nltMt-0001cE-0S
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 10:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltL7-0007gI-3o
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:21 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:53096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltL3-0001LF-Vm
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:19 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243BpJOG013484;
 Tue, 3 May 2022 14:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=JpBsjHAvZ1qab1yYy12cHgZOwT/JgUZDs8vVbtCv7Mk=;
 b=Be0X4G93V/4N5EnuW1+UJjoE88UDr2QyddhHdLDf7AEhWDDLLXUiWOjCvMDY0G7571+B
 dPOQYCwvG9ewduffu7dvoBK6zfgmHxoUe1MwzkidDhVPyl/TdA1wLCq9saRECFS+KB74
 I86Itse8GKdKinaB5yYE5Cendna9Nr7Hk6YSGb6gr7TB9k31sSTCsqmIiqZtQ7D9MGwi
 pk66wwF9AeQJCGV/8zGd9IZXaL/kC/Js5YrXCO6HO/ofsf7ryXx68dqCpg3c6FXAuHA3
 9ju+Qbppi6EGslE0yO6WMFjtyNZ6lqm928gD9ixRppzuGX8Jbd7i9P0KSuHXDDpZeo3T 3g== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frvqsdtg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:09 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 243EGR29001721; Tue, 3 May 2022 14:17:09 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fruj91jt7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T9GAH6cGU+vncknotDptoanposlCDrV4xA1qV5OFSXrXzrUGeLtJ3kEE/xmiTtAHkT6qmTyXmtwGtK1ABcBPDza86yFXYU0lqfRiQVWWJbdSna7ZJnYc01vu6ijBp2kSFeHN5EwPg9s7xMioJsnOcOVZ182hXPddHIU0q8XU8qaPS+gcRBmu2EoO9pQcKuhDlgEY+neqqHfanuXBUVdi7zAN1kW4l+caJcziGkGcKNFqE9ZlxJ+nByHZISniXFt7dWDTvCA5Y2WOi3Wgi49WRxCJjh30mmySBfsAa1HHG3F+B4VnE7N7EzlJr1V52bvDrjupeWaNvUssBJDNt8CeEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JpBsjHAvZ1qab1yYy12cHgZOwT/JgUZDs8vVbtCv7Mk=;
 b=RMYHj4yo4/YwM9zW6IKzgkiSA00zQ6ZvftdPlBVOUWBwzwOks1tww7UGpM2ONaRmtR29cMOb3iavR3Lmps6JcvMES9aex0UZgn0d8JBQ5tzlgxoFW8Q0zqXiMg7njZl9C7Qmp4qR6YXQgXl08shfRfbRHs1/7aNCiAJzpdJo/kSWBsHM3QNEYia//Y0++eC46qMk8ScWpvE9HMHKPvD+aUfDUm4YmTsuXkbrZrtafiV4ivS39ASy1l7o78RIAjigK4ZI1GMZ+3elBviP5RnswY12rCmOYh/hLkOaGho+SGc6R64k3OlZUPJvcvS/XeRTbPzPiGf5AKfT7FEe2BKMvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JpBsjHAvZ1qab1yYy12cHgZOwT/JgUZDs8vVbtCv7Mk=;
 b=BvjSBoLU6TFwXcGAqwDpEjEDbcTYvV5AgkF9csyKRvDU736azaEsVqjxaX3RQjGj6BbLk4mYwCDNBzTWZTMfPUaj1HF58bylTajXcoi+9VFZvDhM/Ma3ogq/6Q0xNx9UT2kkCKvgA5AmIeNzICLDoGHjU9YKbK97zjw/WwbOGn0=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3358.namprd10.prod.outlook.com (2603:10b6:208:12f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 14:17:06 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5206.013; Tue, 3 May 2022
 14:17:06 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v9 01/17] tests/avocado: Specify target VM argument to helper
 routines
Date: Tue,  3 May 2022 10:16:42 -0400
Message-Id: <f93423c2e1bcea85ff9d380ea9d006209d864960.1651586203.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1651586203.git.jag.raman@oracle.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR11CA0005.namprd11.prod.outlook.com
 (2603:10b6:806:6e::10) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84db46a5-7766-4809-7a2f-08da2d0f9a40
X-MS-TrafficTypeDiagnostic: MN2PR10MB3358:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB33585EA119991F1A1703704F90C09@MN2PR10MB3358.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3XaSm9P+j/NJQFUu1HEjxrpmtverWG2ZW65ZJgHEbk1BdcS8nINAy0fZuF6V+bLmlmw4uQvsVq8+Qa/QzvNyTz4pH/jBjx1GHI6pnYWfQZ/KJiaqkuCShWCCBfu191rDZ146k3f7ute2EAfLgkmpEermtOs7HXBSSMNpw8/CZS8w06atWx37oReSLf09SvvBjsQ0rZFIFCy8kXppPvlvaxr9+R+zHmTXjEqlJKvNJ9Ixfm4fZ+w4MdwcAihGW0fbZuXuZAl+sgYeiPerA6GtZp3C70U46bpOLPCwuAmVZ9CyNIhvggO9pUZ/wsdUb7dIComrEQ5vFg1+yoENTMyKotFGvKmhkJpfqQmhhOlpFazhFuEU5ePJU2Y/litID9DkDY1yBVkfyf9akntk2FH7ZZJSiMeFsgtVOggIt32Hz5BTPUs9ltSO3tWOdxQKBcy4c45ajlpsWPrFMlM3NRd8kUp7D9sdL87H8Z+H+PprXY3+WR+J6elZ2WP0WnQyh3VhBzKifp/aEyI/JsBWLz1e/3frji0YBpTyuxxA9+xx/R0pTNMynweKRUKqtDf5SuisPHxryyecE2lKmX9NYUfwdF4AiO7y+9xXbGL7T61cfXQkUWe6WV3bX1Do4xI4901bqINFMZY3h7s8ZTtcicPhWI6+5oQEHNeA1FKCf0qAq09WnuJVLHVRdr9trRuATwpHKuNVuMi0FaQp7tM4/cqDUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(83380400001)(66946007)(2616005)(6506007)(186003)(107886003)(2906002)(6486002)(6916009)(316002)(38350700002)(38100700002)(7416002)(5660300002)(8936002)(6512007)(86362001)(4326008)(6666004)(52116002)(66476007)(508600001)(8676002)(26005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnZJaTB2N2dNSjA5eld4VHJJekp1VTFsL2tQOTdrYm1KUTBNZ0VuYUszZmtV?=
 =?utf-8?B?VEVMUHlkaWFFbTVoOTE5Y3piZ3p4VkZoenpnd0phanFkZXRtdFBHOGs3a205?=
 =?utf-8?B?UmF2Ny9hUDZGaStVM05ZYnd6aEptTmhmakJyMnhWZU51YU5mc1RtVkRMQitT?=
 =?utf-8?B?c2h0bDlNQUFiM3kxYkxBMnhkZXZBVCs3MmRrZXJVRHJlOXhqZ1B4VkRTWmRu?=
 =?utf-8?B?NFM3eDgwYmRudm1aWUx3V0cweHhlbXNucFh0a05ab0J1cmgzbUtDY2NCVmxy?=
 =?utf-8?B?Vms4enViWDNVOTlvaWlZdlFkcWFnRm9FMC9nNFV6enNYZmdacGpnTE9sZ2Ey?=
 =?utf-8?B?VjM1UFBpVUZXcDQwTUo4b3ZrQzBZKzI3WUZwSWpvYnFNZzA4REhtVUhqaTJo?=
 =?utf-8?B?cFFnSXFQcTIzK3RiR0wzbm5abUs5UVRBc3p6eXFJelhxaTZzcEN3NStWVmRM?=
 =?utf-8?B?VWtGc0R1ek1pRGxxNjZSNUNRT1ZrSXN1ZWtORy90bmN0WHM1SWxBSnRtejZK?=
 =?utf-8?B?eUE2OS9TSzRQRzB6N21RYVBocnZadVduREN1a2hCRWphdXpMSFZLajF6L0Jl?=
 =?utf-8?B?OVorNktIcFpncktTQm5QVjBEOUF3Vm9LNnQ3SlUwK0Fpckc0RHhscytQKzc4?=
 =?utf-8?B?SHErcnBjSEN2RzVzelc4aHBybUkwY25xNzdraDY3S0x5UnE1UVltRXlBSGlG?=
 =?utf-8?B?WndiR0tPRnFFL0RQeFhRZXpjbTFmL0pFRDdNL3p2ZmtPNVJkZnpLazBXbzU1?=
 =?utf-8?B?MUhqbm5ZUSt2b3RCaXJteDNOUEdZZDE0NDdPMlVNYkgraE9nMndYZXI4ZVc5?=
 =?utf-8?B?d01qYW13aE5BK0lzWmNXMVk3ZlNaTnRyZGJjWGllejF6WjlUMEtxelhCYWpI?=
 =?utf-8?B?UFRUSkY2cXAvUWU2YWNsNEdJdnFLK1Q2MThnQUY5YmI5NkhyUlZxQ1NEOS9W?=
 =?utf-8?B?NU9ZbkFJMXhoTUtWZ1lKWWhHVkNiaTNZd3A0N0lNL0NCdkxhdmEyVVIrM2Zm?=
 =?utf-8?B?azJ3aThkWVQ4NXFHdHFYNThSSHJHMHVISE1DeXNOdGkwUWN4YnNuODEwb2lJ?=
 =?utf-8?B?dER1MGp3SHZSdWVLdm1mdHhCSmk5TmV3MHY0MjhaYzNCRUpJdC91K3dURUpt?=
 =?utf-8?B?R1Nad2F0U1R4QzBCK1BsRmFlWjRONHlBOWx2V2t1ZFA4b1VsMkgybDZwMUNB?=
 =?utf-8?B?Z2ZiQUFkNVgvU2lNdUJpcC9oZHJldVN4L0RGWHg1TXc4ZkJpK1lOOEZyZjJN?=
 =?utf-8?B?bDRQaUFFN1J4UGRlbnNWdFRyVDB3R2xCU0hpUDgvb1N2blhuOEo5NktFVUxp?=
 =?utf-8?B?RGViZDNCdkJSUFRWWXBXelAxMXFYa0FpUmd1U1phUEt3aEZKc3lxQ1pDMVBZ?=
 =?utf-8?B?dkZISFJFZUVnYW9tL1cxYjhtaEdVT1pkV1VGS1puV295SnRVYUNyeXZJRDBN?=
 =?utf-8?B?YTJOVzJyMEpvZ1N2RW9kTSszNFE4bWtTZjhEZEYvZ3JZUndpYlVxaUlWNGg2?=
 =?utf-8?B?NnJxMVptY2JRaWJhV241YldCckN6cnBEeURyNnpLT3NvNUlzV1ZwMFBXRFFB?=
 =?utf-8?B?QTNuTCtDWDg5ZjZuQjUxWWg0VWJQaHNhRWtHdDlhQW1kZVcxZFRuMlVqVm5m?=
 =?utf-8?B?ekdxTDIvT1pmZWk5V3ErUWlrZkVHdnhqdHptNTIrdmVVcWlLYlZkVjFDeWVS?=
 =?utf-8?B?eStySjh4NTJBVVB3dW1EWXFta1BaN25wVmhTYnk5TzVpMHQ4OWdVUWJnOUJD?=
 =?utf-8?B?Wlc3cGRvV3NYYmhVV3RhZWJrUUEvTlpSWXhWSTFQNm5QU0JTWkgwUTUva3RI?=
 =?utf-8?B?M0hWMm9Fek1qZUhmYklIaThBdGl1N1hTYmY5QTlrb0QyaTFEVzgzTGhOVng0?=
 =?utf-8?B?eklqV0l5KzUyZ2pjblBEd2JvZ0JhdWZ2U09UOFBMeHc0VTRnelNOVjJYNnk4?=
 =?utf-8?B?VmJFaCsyM2RZWGR4bUUrMEV5OC9FdGlyZ1VMLzluVzZncTFyQjRLcng5T1ZE?=
 =?utf-8?B?UWMybllTSHEvL3lPWGNsNG9Za2VVOVhjaFY5K2orK1R2UHVPUjc5RnVFRmZi?=
 =?utf-8?B?S2oybnR6OEQ2TzNPVmxRMUJKKzRNRElaZWVLOUZVTmJsOUxuUzgwamFrZk9R?=
 =?utf-8?B?RCt2V3NEUDBjR2ZhTkMxY3RpNVpvUzluQlZtcncyU1ZCemQwSkJVbVJuVDJq?=
 =?utf-8?B?RExrK2hVR1FhQ1I3RDQ1K0JlUVJScjdvL3lWVTg1L2szOExUM3BicVN0YU1p?=
 =?utf-8?B?Z0RPRGNKbHNXNzJVU3dXSFpCUjhvN25qRDRMY0YvdzVuWFFSU3FQVjE3Zng2?=
 =?utf-8?B?VXIyc1FoQWtLbm1hcVlZTjdEQmR0SnF5VHRsSDBjT1owWFl1ZThPZz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84db46a5-7766-4809-7a2f-08da2d0f9a40
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 14:17:06.3741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XmolGDuMm1NG/DkOBJ3vdzV7yQ1Y8nwQ2oSVu+W0oItQLZFiu5aRhEHo2VACCn14Wj8Lmcb0K2au0ZfNX5/bEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3358
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-03_05:2022-05-02,
 2022-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205030103
X-Proofpoint-GUID: UdFFEEFJa8Sy1eGEkCSCnO47gw1AH0tQ
X-Proofpoint-ORIG-GUID: UdFFEEFJa8Sy1eGEkCSCnO47gw1AH0tQ
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Specify target VM for exec_command and
exec_command_and_wait_for_pattern routines

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/avocado/avocado_qemu/__init__.py | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 39f15c1d51..340a345799 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -198,7 +198,7 @@ def wait_for_console_pattern(test, success_message, failure_message=None,
     """
     _console_interaction(test, success_message, failure_message, None, vm=vm)
 
-def exec_command(test, command):
+def exec_command(test, command, vm=None):
     """
     Send a command to a console (appending CRLF characters), while logging
     the content.
@@ -207,11 +207,14 @@ def exec_command(test, command):
     :type test: :class:`avocado_qemu.QemuSystemTest`
     :param command: the command to send
     :type command: str
+    :param vm: target vm
+    :type vm: :class:`qemu.machine.QEMUMachine`
     """
-    _console_interaction(test, None, None, command + '\r')
+    _console_interaction(test, None, None, command + '\r', vm=vm)
 
 def exec_command_and_wait_for_pattern(test, command,
-                                      success_message, failure_message=None):
+                                      success_message, failure_message=None,
+                                      vm=None):
     """
     Send a command to a console (appending CRLF characters), then wait
     for success_message to appear on the console, while logging the.
@@ -223,8 +226,11 @@ def exec_command_and_wait_for_pattern(test, command,
     :param command: the command to send
     :param success_message: if this message appears, test succeeds
     :param failure_message: if this message appears, test fails
+    :param vm: target vm
+    :type vm: :class:`qemu.machine.QEMUMachine`
     """
-    _console_interaction(test, success_message, failure_message, command + '\r')
+    _console_interaction(test, success_message, failure_message, command + '\r',
+                         vm=vm)
 
 class QemuBaseTest(avocado.Test):
     def _get_unique_tag_val(self, tag_name):
-- 
2.20.1


