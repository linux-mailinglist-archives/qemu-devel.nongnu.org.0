Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E90434942A1
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 22:51:29 +0100 (CET)
Received: from localhost ([::1]:34656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAIrY-0002kX-RN
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 16:51:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIix-0007dB-OM
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:42:38 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:38830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAIiu-0007H1-Qi
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 16:42:35 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JJVgQK032608; 
 Wed, 19 Jan 2022 21:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=HWg+Q6DRDHpWeu1f+ihlBCPxhS4LJGsT89Hfars5N80=;
 b=p2u67HwhVkJNaEQ+uZLSvuCmHeHo9JHV7fDhoRvqutB2GRr8P8y25tSu0LG4kfsmyF0e
 Q3MWAGFISy7RXUTQLXrNF6OxmaFXrRgNtZrQrhnBaFRe68w/57DCK9G/zDyQKS24ELWs
 rDBvyJPx/7k8rFFqQCbbYRR1i92NbMe3z3aw6Wg3FJghIZBZvSsRpDGmpadL37M4yN8h
 uaY9rIii0ToFY5IiTxX7WDM1ZuijqpDw3LMn795t+A21L2cLVDIEZKZhNfXtk8zsc0Vm
 LNhfe1AEBnEJkFqyR4G6ec0eT9Bs98A0tka0FZQ5ejI4tUNuK9tIPGYuAj9KrXh2NjiG rQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc4q6hwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:42:28 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20JLaSi8030907;
 Wed, 19 Jan 2022 21:42:26 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by aserp3020.oracle.com with ESMTP id 3dkp36kes3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 21:42:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZqAq7DRxf0IvChjbni2IotuwWiH6CKGwBdMHf2bL8nBVPCwViL9JMfb9mmyNGpyReoMUMQkmUljUW3Z/TYcPYUk4BUyPFfkEwLLvFHGbE9VYF1pR4WTbDHOq9nZNH4j+MdgEPj6UsMJGxx16yt3JyN8IZSmAQcKwB9nWrPU+6xCKRQHllHeToAI/r3DmcIUXf0Akx9T4Dz123IRBu8reifJYRWMZw/2N8uVhoYv39GVZxVYtxowt0cuEUEktf5lJIDEaMIABhPFmqTLDO4Im8hucNmp0rlsuuJE+L2z4MRvbTqcuB8D7ZuRUo6x4YOI6mIcWhMXbVj+akY1L+HBl1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWg+Q6DRDHpWeu1f+ihlBCPxhS4LJGsT89Hfars5N80=;
 b=PPwgt3tckSywLjH+AzOpboyF7Z3gu2uuhduQVLmuL9Bh5iJtjNVl2VZxEDV/JQ5yAJaDnJQkcrGNC8xKflFx6GCLW8KoR0hrwXsWHvgfeAQbiiblAxl5Xcplju9LthZtnA0HGbVtBa7Wd6sUiA4xHJZ2mYY0HKvalVHxBOkNNy0njBPE0VXXM3C63lOZpvFdQjsbSC9IMy42/WAE47nRYhSfLQtCXMar0SA7R+AZONIO16vjBfCZRBfdfB1IdMHddXVaaGHKfm1AhpyPWYle1SM98V3304IkmbbYniUjuhyYZXXOYQJhWpwZEElJOXedY43/3lfequRw8PclV9MsYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWg+Q6DRDHpWeu1f+ihlBCPxhS4LJGsT89Hfars5N80=;
 b=Arp/qZxyh5yufhkPkiQEzbmiLCNcwrKTdEetSTa5+X2v0Bmk1yIrw+Jt/w9OBysM6OkYsNM3GiFFoMJXjNgLW6aSD6pxAtJbBvNty5qnAPenBAhsxvutq/E7upRMY3Bxe6sjYKNapbvssg3nR/fM8VLxbrin2bsWQ8YSlBNoL0Y=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by SA1PR10MB5887.namprd10.prod.outlook.com (2603:10b6:806:22b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 21:42:24 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 21:42:24 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/18] tests/avocado: Specify target VM argument to helper
 routines
Date: Wed, 19 Jan 2022 16:41:51 -0500
Message-Id: <5ae7da5979b3f83bcf2ec620f5bbd7d4c15b5d80.1642626515.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1642626515.git.jag.raman@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0043.namprd08.prod.outlook.com
 (2603:10b6:a03:117::20) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b0407d4-efde-45e0-7a2a-08d9db94944e
X-MS-TrafficTypeDiagnostic: SA1PR10MB5887:EE_
X-Microsoft-Antispam-PRVS: <SA1PR10MB5887F8FBF6699575DFD0782890599@SA1PR10MB5887.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A3+WL2G5XMQfih0986p1t5cvenODQdLKE2eXCdKgMLe5j1APXiKg4OjryufypHraR5tMVohKMAc+LtAT18NeRob5GQTSuXLDbwpHQzTgBEKt6a0dH4JwdBW9WETphg8OkGlhAZc5gLyOnMeK353Bmu4gps6UUvjrF/g056f6Hu2UsT6HUCGx5Q7qLBR+BeDXqY57OZuakEVfNB89YoHWrj1Q6ZMbU5Kg0EISayprKelCCzegCL/XhmM4EJ3d7GGrwEtrYxk3OGcQBXfHB8AdZ/Mi56nrWcOR5MT3JWfQ/N3m3GAqfuEDeWvyGYGF7bPKhCrn6ebraDIfW/eCqRN9FSfz6kp96NbzkOv2CMJ4bn7bc1n+ydtPnBlYODDgOU8c45Q7kuNCybo2wkMRRIGUx1GD2/89WNlpThRjm8vi1pO6malGR57NumBaifUcwWRkrSN42/hQX+yK2qkiHPh627p4mxHL+PHnvKxnZdnOLWx0CJMT5VhJzfs/cCXzj5LJ+jJMHljyX2knrGxzihR7eBymaIrsmQLq0SyxQZguHyzFXfgZqofL0rcTeOcY4y9KHx6X8SFAFaUJIK5sFCmTz+n33yL7eKa9T4A0l2EY1lNDrO9PSmXnwJPGvoFEldqJXBz1by74LgWRqiz3kvdONHLs/+HRGQIKXiHdOysocAOrN31nEn/XhPnPw9rsLccTydlVGxXWsDf1E2s8k8ww8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(186003)(6666004)(6916009)(508600001)(66946007)(66556008)(26005)(7416002)(4326008)(66476007)(86362001)(107886003)(8936002)(38100700002)(38350700002)(8676002)(36756003)(83380400001)(6486002)(2616005)(6512007)(2906002)(6506007)(316002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWxBZG9EeVYzanJFbzBpSlZzTUMwZFEwblBDa05STEl3RGR3NGIwY0xyalBI?=
 =?utf-8?B?Wi92VU93OXkxRXU5cUEvZHdtOTcyWnU3QXhWQ0poUjJpVDZuRTc3OTNmVVVH?=
 =?utf-8?B?QlRGV3VMS0NzRUhjaFJ6aWlkbk1HTWZlVUVYdGx3T2xSWGhIRXhtSTUxejBy?=
 =?utf-8?B?OEJDZFc0dTNqbVE0TmptQ1F3YUdndHBjTVVrZHg1bDRVUkVSSG1NcEJDWGFr?=
 =?utf-8?B?L1FoUklQQm52VVgzS1B2RGYyakcxNm0wMkJBL0lhbTR0cnFrb0g2OURHV2Rk?=
 =?utf-8?B?SHZNUkNzUFlUTytuYzdQNlhzdC9WOGVDTmJ6MlNNdk9CalYvQTVlbHNwN2Zz?=
 =?utf-8?B?N3RRbC9aUHVIZ1pOREpqK3JsazN0MzF0UkRzdU5DOEhOVWgyTHVxUnhEYTZB?=
 =?utf-8?B?dVhlVjVqczR3a0JPRVpmd3pQNzN2WEdOSE04cUxFNWc4Ni8vVThtQ2prNjR6?=
 =?utf-8?B?dUhGS1lVWGI4U3U1cUN0NnA0dUV1KzgrWEtSbFppdUx6ZUZuRkxJbEZCRGRq?=
 =?utf-8?B?ZmFXOVhIRmNWQmZwbmh4MWNneHhMTXlENWpCK0E4TXdIb2xnVCtlL3NPMXl1?=
 =?utf-8?B?UHR2NGdiTHBrS3BKOFVwckNwV2V1S2xoSWdRSDlGK1RXdU8wK2pqZmJ3NzVw?=
 =?utf-8?B?bEcxVHRNZ09RQnBTZHUwZHJ6ZWdPUlRyZHZOZUUxc1NPU3Vhd2UrYkk3TEk3?=
 =?utf-8?B?ZlFwanlxNUdwZ05BZDNNYmVoY0FzT2dEQmpvN3dqOFI5T0o1RGdaMWQ3cml5?=
 =?utf-8?B?Ym10TmVLdit2Z0Nwc2p0Q1VYcDdnMU1xamlmVEtFbVVWeHZ1OTE3NzlPL3Yz?=
 =?utf-8?B?K2w5ZE1FZVVlY3lBTHR5bTZoWUJnUW94KzBQTlIvUVFjbDlUekZiaFVUMm4y?=
 =?utf-8?B?dEhCT01tUDk0c1dVS0lOMjM0bWhVQWpxZDN1ZW9UT3Fqa3RPSEU4K1luL3dV?=
 =?utf-8?B?NmZJK3dZM3ZFMkJTSEwrUVhhVXFVdVFFa21DSFJpT29kQ3R5d2w4ZXVudGlJ?=
 =?utf-8?B?aVlJMFZ6aDdQR2I4V3RFR3EwWXAvNzhwVnBsK1pIcnladUFSNWpjUmxmazBT?=
 =?utf-8?B?RzZ5ZXo3QmpEbytiUWhNc1R4ZUVDQ3ZQYy92eGdtblkvRHBMbktIdy9Odk5n?=
 =?utf-8?B?NmVMY0RsSWx1bGMvQzJiWHVSbXQxNkNsUTBvMTRpelJtV0JVazM5MVk2NDdE?=
 =?utf-8?B?aWZPNVp2WW90QmMrR2M0U0h2RDhkZTUvaHFNcmVsZlN4TU1YQ1EybEJmaEpi?=
 =?utf-8?B?VFBkQklIRTA4ZTJ5WUVsdHJuMk9INUpzcDF6RmIycyt3Sjh3NXdwRGVoNlMx?=
 =?utf-8?B?RUpQdVRYYVNENHJLLzZyQ1dnOWdmODZaeUxTcVU1a0FJUHhTVHcvRG5KRk9x?=
 =?utf-8?B?eE13L0d3SlppR20rOGNUWlk2KzJOUEdyek91bEJYTDU1U2NFc2I0MFU4M285?=
 =?utf-8?B?NW9LTlRidnoxZDBBc1Vza3htRVk1dlRMcGlDRXZYR3B3Mm41c0ZVSXRLSE5y?=
 =?utf-8?B?dHBZMWg2aFBhVTF3YkZ3V0xTQzVEcVd3N3lVMlBDMmIwbWZGYzR2a1J3NjBP?=
 =?utf-8?B?RkxGWVA4RG9yZm5iUlREVFQ2ajJTaGQySTQ2TnFMODY3eEFQbkwvNUJKLzNr?=
 =?utf-8?B?Y2E3L0I3eHZzKzJWbWFEMTZYOGhTWjFaSVNpaGVHR1VqcVQ3QTJ3K2x1dUhj?=
 =?utf-8?B?Um82TnM5dWRxeEFLRm56WTNncUU2cVRqZjBvaGZXR21DVnN5UWErQks0UzFx?=
 =?utf-8?B?aC81UUxhOU8zclVvOXNhOEIzeWhXeUwzUlNBdzd1TG42WGVYdEJmRjQzZzJy?=
 =?utf-8?B?bkNlc0svaC9XdDU5aTBGRXY3YklOVmQyQSt5VXhqQStJZEFMZ1IwRnphekFv?=
 =?utf-8?B?RitBMnQvbUNEM05OaFpudHBySFNTVkQ3bVdTWFpjNlUwUHhqeGIzSGxYOFFD?=
 =?utf-8?B?NWlCTkhrd084TTQxWkdnOVd3MFlpTHNTajZCeEYrUnlieVI0VCtmaFNtYVlH?=
 =?utf-8?B?MnhvL2VBWlpuVldjSmRSenM4a1JoMmNkWmFWd1pya0dEbDU2clkvN1owcEpR?=
 =?utf-8?B?K2VxU1NnRlRwM21CTURrZ1AwU29XejIwM3hWcmZxMUUvUFdIVVF2VUtWNFkv?=
 =?utf-8?B?U25tWmNjS3F4ZzFlREljLzhhUnpXWUxnKzA4OFVBMkVBNjhyQ1F6YXhIT2JF?=
 =?utf-8?Q?9GpZ/QCaeA4+XQteapDl1JY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0407d4-efde-45e0-7a2a-08d9db94944e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 21:42:24.0855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SqBRqi1gPcpclyL05tzW5YZmrz/HKT4QNMwk6xV+fn1TnYvuU94YCQN836//2O/L3Rw0r+2iFYkEXY9Hk1WG0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5887
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201190117
X-Proofpoint-GUID: OMyOwzC6dadeVkEKGO4BU7H7IXWdNGeK
X-Proofpoint-ORIG-GUID: OMyOwzC6dadeVkEKGO4BU7H7IXWdNGeK
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 marcandre.lureau@gmail.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 pbonzini@redhat.com, jag.raman@oracle.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Specify target VM for exec_command and
exec_command_and_wait_for_pattern routines

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
---
 tests/avocado/avocado_qemu/__init__.py | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 75063c0c30..b3fbf77577 100644
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


