Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A45A449EE7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 00:01:29 +0100 (CET)
Received: from localhost ([::1]:47790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkDdo-0002I6-Ib
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 18:01:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1mkDZS-0005B7-5L
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 17:56:58 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:60786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1mkDZP-0001Fi-MQ
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 17:56:57 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A8MoouM001213; 
 Mon, 8 Nov 2021 22:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=dCJhk/fQ4WMkzFF53nGwpyOpl9p5Jzk8xLhjpmxmu6I=;
 b=uubsH28Kq8g6bD2BS2H6QMcgBWSAA7GtyhV32p3QcXie5jbKIW23HElPkR059YpicbvS
 Q+sD+9UnVQUFQFkjkU9VBRP1P36P/oR1n5UuPaHUlQLRLJTEv8Vc5wP34tbwH9IcRvqT
 7IfLdlD7i45VuJauK7gKYLBcqfCk9WKT0Z+6KMM/C0F9Hd7c1DbTKr/B4wxhxlA25Jr4
 T5FnYqA+e2EBimGXbGpcGybqZnu5segcPV3fCydZAmqxOtB7x9N2s62Z61RVuzlZ5lkT
 GtUJEF0DFxwmKhUdojpzAB6fdQUQaZZK8lS940a7gSp5ABcurYtYIsKvHv8k74hCQc/o Og== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c6uh4f2ad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Nov 2021 22:56:52 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A8Mnxea111440;
 Mon, 8 Nov 2021 22:56:51 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by aserp3030.oracle.com with ESMTP id 3c5frd3a7q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Nov 2021 22:56:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EOMTdF4Gp7CG26OJIia5ULe+vx3nK7sb2EsdZtlPeIH8QwcUTLyhVoZUWzZKLSLEFgmD/N+P3qKOpsmmoEq8F6Ce8fw2b4UwWKnx9l0ZEgffafKaopx8TMZHjHvIrnUbBFVuRSiIIWdooL29XbH+PkLjzzcJOHLyGllTppmcFpuHC8QRnehZANkqIx+aYMcSWuSoYKx0VYwOVAYJZibRZxCfdjy2bc3IPR5kbDLGA/9YgDSWcaEFKUs3BS/h9v5698E88/8fBqlEr8n8eF0vAwTdT4kSY81sYmn2BtJFh7bm7Nslaq6grNFPWbWxApef2zp8kbnNQOqIEngIAXHHXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCJhk/fQ4WMkzFF53nGwpyOpl9p5Jzk8xLhjpmxmu6I=;
 b=DUaOM78cvUfjZVuKSUV2NT/6LsfeB0hxO1Avd3jZrAlOAnNmRYEka51JRpgREzJS4xfW3xbgz6Opgk5PrtsZ667WQDOmdwcg40vpcGpnrLhoAQXPJoSANtcIz3mjQ/Fwn4iM5QWO6Wc2NDyILZhpPLXxIgbPlhrM/NKs1oHIGuO/FHAJc1HIRRkvuEeq0DVx2z/prKl+rhiX/1IQHJ1uDvCF7iXshsxTy4iggfi/ifRz6bko0xD9WIWctZNFiSOl9HDyTJgYUTGAuopCZXgcsga3QzspQs4w2/TTf1g9sB8bD9H9o4gosvCSrY2KEmgdoBo9l0R4IJ8+poGnipRnRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCJhk/fQ4WMkzFF53nGwpyOpl9p5Jzk8xLhjpmxmu6I=;
 b=OAwiPUmkvX48FTFWB8wkJoTd1exirVeKn1jNGFzT6OTJZvIFEsmqQd/xcuN/1NsTQJeWnCM9jPqJUml2/Sdw+inlPE+JlttNIlsqzJjknbucNnBY3iBADUwlel8KJUfQctNlLSin6Eemd3EQiy8JyDevoQyx+khD6urNaOzzpsM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2523.namprd10.prod.outlook.com (2603:10b6:5:b2::27) by
 DM5PR1001MB2361.namprd10.prod.outlook.com (2603:10b6:4:2f::38) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.19; Mon, 8 Nov 2021 22:56:49 +0000
Received: from DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::6491:6cd2:c4d5:c1b7]) by DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::6491:6cd2:c4d5:c1b7%3]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 22:56:49 +0000
Message-ID: <4be352af-f3fc-0ef3-1d97-cd3eafbbb98f@oracle.com>
Date: Mon, 8 Nov 2021 17:56:45 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Failure of hot plugging secondary virtio_blk into q35 Windows 2019
Content-Language: en-US
From: "Annie.li" <annie.li@oracle.com>
To: qemu-devel@nongnu.org, jusual@redhat.com
References: <57170d20-635b-95fd-171e-e84de0d2d84e@oracle.com>
 <31c8012c-234f-2bb8-7db2-f7fee7bd311f@oracle.com>
In-Reply-To: <31c8012c-234f-2bb8-7db2-f7fee7bd311f@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0229.namprd04.prod.outlook.com
 (2603:10b6:806:127::24) To DM6PR10MB2523.namprd10.prod.outlook.com
 (2603:10b6:5:b2::27)
MIME-Version: 1.0
Received: from [10.39.228.151] (138.3.201.23) by
 SN7PR04CA0229.namprd04.prod.outlook.com (2603:10b6:806:127::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Mon, 8 Nov 2021 22:56:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45138d8f-9c4e-4565-fd1a-08d9a30b0c41
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2361:
X-Microsoft-Antispam-PRVS: <DM5PR1001MB236119834066D13EF7EFE89BE5919@DM5PR1001MB2361.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: atzrpkGPzdXjvFajN8xgm6cQwKyCPoB0DEKuQ9nzoVlvKQPRp47gmgTWb/jjHKTeDfUxHkwr766Abn1oGqJrKwQiSTYynBpqKWers7chtdBLU05a4KO7Y1gRY81OfoqZ4/zrGtt4nCot9XB60Z3rFuOujmc5XgsKFFAXz+IPDB7tveC/3YHpbkvGGXdYRVKsGNMlBL26ph6EfpNFW1B3txpEMtvW8iOg/m7HOsw8CmKL9bLLGtttb06ZILc8+mwsK7kPmH+NjnTG3odQW8JolXg6BC6K+YBPjqjzLFr33oejBZ3fcI33J26fjej1VQD3SjtWo4+1yK+DJ2XOvmyKPPRiDDNQwbfn3I7LCGxW9iP4mwRddlS3PczfCbutULWY/FeE4l3aunqcEQY6VCYxjX9myd0e7F2r4kod5/ROJU2m/+tvMEIfaNDApSpXsPTkPgahQRujCM+QojPMVKf2PpF1xh9i+4BaU5kU1hKpD+h5iaJmo4HR/IOzLmsZlhOhrgtQBTBF4mAuqFY7Hqf7LKh6bcOcd0ZuWTu8K6lOER4DFSxitEpdkTBtprwKoqcHN/nQFnMK2giUE8BbGruufZ6Q+BnEzdctqGxPgRBYLroHo094CnQ/3mCj4WeD1HgP5i+w0xs1fDgpJjAlzRHFQhMC4jPRknC8xFNcFaJ1bEl6LzYECsHQoJVk/PPSafMlZ/2/usdfVS/WQLKXvXCI7cuPXd3ZoaA5+8515aPQjznjmS6SPSsdYtxeoZD8KksoT+zXIUfVkSAI95nGNmrnXLbAQBYPsI1OU+9B0UoOlXH+dzNabAHzMj4sEiK6rMceJdnD1vKhVVqCfuDEhFigSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2523.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(6666004)(2906002)(66476007)(966005)(5660300002)(6486002)(26005)(83380400001)(4744005)(508600001)(316002)(66556008)(31696002)(16576012)(36756003)(66946007)(31686004)(186003)(86362001)(4326008)(2616005)(956004)(8936002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V21yTStLTytsYkNvYzdyQzA5R3dLSmRWSkNNVUZDNzR2WHJqRGZYcm9GT1My?=
 =?utf-8?B?VHpnaDJncDE5d3RHUDNPVHNFNWRBaXBtVEoxSktLd2J3MGxCWnFvQS9vckpS?=
 =?utf-8?B?SWVET3pqZW9tT3lFTTI0TEZuNXo2YUI1cEtuK0N6ZW80dVBYaTU0eXhCc3JV?=
 =?utf-8?B?SmJRVlRVMTJSRFV0aVBpa0MrV0xmL2tyT2pCVzVlVVF6NnBrQSt2SjFXTXVY?=
 =?utf-8?B?bzI2NE5CVVUxTVBWVkN3WjlZeGJGSWVtM0tZaHgwenRxSmlSSi9abGJVTVFG?=
 =?utf-8?B?OTZpMkFBUkVzS0pLeHdmWkE5WnVsMDJwczcwRnBaZmFOSWo3c25OLzV0bkcr?=
 =?utf-8?B?VE91Y3BLclE5ZFdKVG8yd2hoQmcvSFdKbDIwTmxRZXUyTXgrSExMTDkrSW1y?=
 =?utf-8?B?dnRubE45MmFRUmc2aERlN09BTkdiVHI5ZFJjUDRiZU5ZT1N3ZEJFbXNxRG5Z?=
 =?utf-8?B?by9nRkJaS1daR0lEdkc3cE50V0NObFFHL0loNk1kbFEzdENaZ3FpU2p6YzFl?=
 =?utf-8?B?UXJyNTd5VkJ4YkdXR1AzTjBlbWhHOWtLYnBZQVFQOERuemY5a2VJYVFMa3ZX?=
 =?utf-8?B?ZXZua0MyS2RLcDdIT3BtQmVuaWRqd3pZbHp6aXh6QlNRM1pieG5hTndZd1hJ?=
 =?utf-8?B?YUI1aG1sR2llbTJtZEZBdFI2L2xkR0VWSE9VamEydElnYk9jR2crQ1A3ZnRn?=
 =?utf-8?B?eERtSlpJZFl6d09tSnl1YWkvQ2ZhN2ljQW9PU0FsOXhHM2J2WXZMYVFnUmJ5?=
 =?utf-8?B?VlRqRjZUUHo4NnhQSU9DbXM4TzRvN1hnWTNIdE9SV0Z2SXNzS0xlejZGa2FB?=
 =?utf-8?B?bEd2MXpRRk1Md1Z2L2pzaEFsNjZ1eDVtRkZqUHhVM28vT1R4and0dWN5a3hk?=
 =?utf-8?B?TzQrdTBOOHNFNE9UdHQ4bGdibXJVcGxzSHlkVG9wYnc0V0ZVM2tUZk8zNDZM?=
 =?utf-8?B?UHZGY0lHK2dLbVBTWWRqYTd6U0gxeVd2OVd0dkE0RGdZVENMMEZIZHRPUVBT?=
 =?utf-8?B?SHRaaGV3SzNWa1BLTGYwQnNGczltYUNOblFGajRNeWZYOTFsS2ZpWlFGcHhG?=
 =?utf-8?B?VXlrcG9sbGJvOU9EeXZUR0VGajZ3MitZTGczYm9yVGduR21lSHJoWlVDNUJp?=
 =?utf-8?B?UEU2RHhiRVVvSmRYYWV4NWlXazg4V3ErSk9YOVF4VnVmVFBnL09iMEhmRksy?=
 =?utf-8?B?RXBxekVjbVZtVkVYRmlNNllkNzVPRTBjZ3VwbjE2dFBpdkRPVWpKU3FVVXZr?=
 =?utf-8?B?OVlMNFBmdTh1WEVic0pmWVFOUy96VkhhVjdPK2tsdEFFbTMrcEhOQmc5S2lG?=
 =?utf-8?B?cEVaNHBra2ZHMVZHdmRsWkdTbEMxQVBtbWlvN1d0YlpxOWk4dS9ucy9zWFV4?=
 =?utf-8?B?dS9uTkd1RE5RekN4c2RtV2szWFpiRWNXZmxpRkZVb1FNOWdjM051dTZlMVJt?=
 =?utf-8?B?eEJGc1dEd3UydERnTzhTZkxvdjAydTUwRkdMSEdjMzRkMTloNml4dnBDQ0Fv?=
 =?utf-8?B?WVR2cUVKa2l2TWoyMWoweTJFeG9TbDFjMTF2bVFscTdYcmlyMzA1UmFCMlIr?=
 =?utf-8?B?SWVabk96WDQ0OXY4TmZBbHlMVjEwN2IrOW9KUjZWNXRNaHViUFZYa2dlTWtu?=
 =?utf-8?B?QVc4WTJFWEJNRnhzNjJvT24yWW4reG5jNWdIQm5ybURXbkFKZlV0R1NrWll1?=
 =?utf-8?B?ZDVZbDJDT2R6ZGNFL0Nlb05OMGFZMjI2YVowSmVuYTZ4Q0VWQ0VRMEYxOWhU?=
 =?utf-8?B?UTBLL2piZFJ2NmdHMW1XdThjbHZuV3dZbFFSVzl5KzExa080Y3ZlN0NEbWNW?=
 =?utf-8?B?Z3FXZDg5NzQ0T3Q2ZG8wNlNqWStpVTFBSERSVlgwTlBhbWo0REZTWG8xMUFJ?=
 =?utf-8?B?TUY3cVd6UXJ4RW5KenJuT0w2SzAzUUlINitkV2UrUmtiZnUzS01WVkxDS05h?=
 =?utf-8?B?ZnRPMXpyWGRiNlA2Y1I5TlVZQ3pQU2hWREUyUWNVTXFvR2NMZnBKYVhmRlAw?=
 =?utf-8?B?VTlsZ1pLTEpGVzUwZWRWSnFsM3pzbXk1dUp3QTdDclphMDdKVDBSbnoxTW1k?=
 =?utf-8?B?R1NweFMrWjFHSXljWmdvdXRNUmFHNWRpTG9vMm5RQUdscHllQkVqL2Y0Unda?=
 =?utf-8?B?QkpCeGdJdG1pM2ZPWjlkYXBucHFrbUxWSzNtVk9RTFZlR2x5c0hXZ2VBcnQz?=
 =?utf-8?Q?1n8hfbj8oNFbc/Sg5UskcSc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45138d8f-9c4e-4565-fd1a-08d9a30b0c41
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2523.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 22:56:49.6544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tLLOyrV/KtFiKARIytnqSQY9mk+6CZxhbABhX7rgv9dndQco+m2QYoin/fyYQEZo3i+iBpEdBxlD+u8C2ZnDgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2361
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10162
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111080136
X-Proofpoint-ORIG-GUID: rnz71ddMFSZ-YBVixg9CRl0MOdtkbuUf
X-Proofpoint-GUID: rnz71ddMFSZ-YBVixg9CRl0MOdtkbuUf
Received-SPF: pass client-ip=205.220.177.32; envelope-from=annie.li@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: ani@anisinha.ca, "imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update:

I've tested q35 guest w/o OVMF, the APCI PCI hot-plugging works well in 
q35 guest. Seems this issue only happens in q35 guest w/ OVMF.

Looks that there is already a bug filed against this hotplug issue in 
q35 guest w/ OVMF,

https://bugzilla.redhat.com/show_bug.cgi?id=2004829

In this bug, it is recommended to add "-global 
ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off \" on qemu command for 
6.1. However, with this option for 6.1(PCIe native hotplug), there still 
are kinds of issues. For example, one of them is the deleted virtio_blk 
device still shows in the Device Manager in Windows q35 guest, the 
operation of re-scanning new hardware takes forever there. This means 
both PCIe native hotplug and ACPI hotplug all have issues in q35 guests.

Per comments in this bug, changes in both OVMF and QEMU are necessary to 
support ACPI hot plug in q35 guest. The fixes may likely be available in 
QEMU 6.2.0. I am wondering if  someone is already working on this?

Thanks

Annie




