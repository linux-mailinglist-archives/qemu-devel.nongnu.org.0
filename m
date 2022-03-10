Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF194D4D8C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 16:48:10 +0100 (CET)
Received: from localhost ([::1]:42588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSL1N-0008Fx-Hk
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 10:48:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nSKqD-0005uX-Fk
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 10:36:37 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:2530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nSKq9-0004ZI-87
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 10:36:36 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22AFWH4V032016; 
 Thu, 10 Mar 2022 15:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=JRC5FEXrtJhR6JDCev5771ef7bYxeu+GzH8KWYCFJL4=;
 b=MqNDKNSYTGHRaA6l7doxBqQ5mxHUPKiJF7LXr5w4azLAP+nfclTwyIX2t13lvyuGiSfl
 fizqAsm3R3EYKpbrpZ8fgYTwcLioTgf1jusPcv18gi+wkhthKBVrCVeTx8oH2L/FCelo
 Klyc4sIwInYb/uY6/ibyvNKO16oDzjfxEG0YjnvyNNLCMBEmkZLDiWE0vDTM03H6Br3t
 kBkQUrwlLZsdgumwe8o3lh2tolwcYzucIkr6zrNPvnffEHUl7evLpfYvAQSY9QgPbIyP
 dK9Xjpl4eMqxeAlY1H8CR2Lm8O8+RMqoAWb3wAAgB97kgmhqC+1IfL0oZcJInud4Ytz9 eA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekxn2ntap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 15:36:19 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22AFZvaY094347;
 Thu, 10 Mar 2022 15:36:18 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by aserp3030.oracle.com with ESMTP id 3ekwwdg4t2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 15:36:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvjvQHuFTMNHHjA9XDqny12x8VLAerqk4NgKncLvLlqOE03CwjTMIjJaRF9NNJbkUm62jAgjxXj0/Mc1NZe5wG3BWtd8F6PNeRe6H866aUG7FVnBdqaiLOCn2dD6ZsjIKf4PFdExZAvL+VYIthurc2ycTqeP/Sf4gCQ/s1xJheZ80eMoDIDaC4ZyShmtbSkEwn5KXf27lLPT84snSej+P9uprhCYlm+0vcLU8296KPtM2Ky2SMNWZ0etA0doFInSn8jTnlAL1Ldq7D9NomtlG3l0IUs2s/O5v5Ec/pdQ95S5ih8LzUkF5qj8rvCnQkhvfZzb8ldEviYL3dWEhWurbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRC5FEXrtJhR6JDCev5771ef7bYxeu+GzH8KWYCFJL4=;
 b=iX5x5RAU/nJ0dEMVGjDjRll2Rw2d4xLYKuTaekieou5k03v+i0RtrctLc6kh7BOkkdZu/c+GbIeLiut/8La2rP3ZJG/As3uWD0Ll8Zx4gz3JseBrPr9850neD5OH8QgfhnT7LOhbxcrhXXUPVordEYd014hRlZDksqzHVz3GzDFoY3JrO00PI+tZ3j8oaVgRbbtJdMtYkrN6ki/SMAdcFQxwd6IY1GKjI3fMPBEAwR50baQ9IZAkuNRvd9+MsoKTfs0RWpOKl5p/mdtZsOvdnBlWVxc4F95zSDmJ+6o0bGnLGs9UgcVBgLGmW02mlzdohv/Dg9Mf8d2G+KK1mwROhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRC5FEXrtJhR6JDCev5771ef7bYxeu+GzH8KWYCFJL4=;
 b=jePLQ69ynothBVZPz4tmrKORX2XaTdgmHQMLDdXMchAgeMC7ke84si7JtLnYLL7l1wAIZieddxY2sBxo7N/7UJLDP6eaYHbGIVplB8qmTWBIsfRGfBo2EOOwAgMOUMu+Wl816cLl2GovIOPig8MrJZdWEjYmjXg/r0Lc+IgPG4c=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by DM6PR10MB2636.namprd10.prod.outlook.com (2603:10b6:5:b6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 10 Mar
 2022 15:36:12 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da%6]) with mapi id 15.20.5038.026; Thu, 10 Mar 2022
 15:36:12 +0000
Message-ID: <3e0803ef-392a-b863-3474-3f76dcd27ae1@oracle.com>
Date: Thu, 10 Mar 2022 10:36:08 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH V7 10/29] machine: memfd-alloc option
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-11-git-send-email-steven.sistare@oracle.com>
 <20220303121534-mutt-send-email-mst@kernel.org>
 <20220304114124.6fe97646@redhat.com>
 <c42748ca-3e06-d57e-dcfb-a2a97006d2fc@oracle.com>
 <20220307184045-mutt-send-email-mst@kernel.org>
 <20220308082048.1783adbc@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20220308082048.1783adbc@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR18CA0034.namprd18.prod.outlook.com
 (2603:10b6:5:15b::47) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebdb149b-a6b7-4a0b-99cc-08da02abb4cb
X-MS-TrafficTypeDiagnostic: DM6PR10MB2636:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB2636A895FB9036A6507715BAF90B9@DM6PR10MB2636.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ddx/VajW5kbnVLYifQn4A6nre/7Q5ubrgmd91Xj/rWbdEbcZxp2ngXJB1/HbzCTu2n8HLkNXZCvIX7i+qZn6XbWRScPjRwoTowU3uHTLkVh2NiagP7fRlxW27Q5seLxczAVIo6FmTwzhgxk3KaoB+tXOQji7zOomS+8diSe7JLlXG8V1Xvej9wWjWE2G6ht/99DXbMQDrDRCUtL22m+Ng+FHZKUKOxobqftmJvOnpwwS6aupvcg9oKfKYUsV7CYMx+OViqAtUFc/CHnXqLVCQJpooYFPz+islUlM+nfCJL9oXskw13V5sbaF1/5wYwW38PBDeI6SQ4qbn3Wm8Q/wbCaj5TwjfAao4UaxW5zXPJOijcbQXZ4U6m7U2lU6ftPwvdFTUdY3J2G5DoaXNXmiJXEtHSl3JpRciAuuLFC2KDx7tv8SZ+A3LO+FFkv4whcJf27+xoqZFJc5Dgtfs7p6o80PVvNCLXiVUvRaPPjnqmH9I9z+Azs6NScgAZ/+xbwpeZcJvuwrHJrLus11IrgPXbByz8qWqPJa0xR8JRQyFc0NmQUAvOBp8oib6F/qvmNRvwffi5wBue7L93AHv4cM5eqCtM7yS5sd3LSA1KgCr0fgPWbYkb5mhNx+TxPd0EfxBvgJmdCZ33Me8MCnFOa9+8KZKVa9SEhlG0BQW7YeEFQd8RCx26nDTVasirIjZAXrdfA9gdEgygwJ8lu2y+kojZ9SZaXTjSaOrgl6ok7RATU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(54906003)(36916002)(44832011)(6666004)(2906002)(30864003)(6506007)(110136005)(38100700002)(66946007)(66556008)(66476007)(8676002)(4326008)(5660300002)(86362001)(31696002)(6486002)(508600001)(7416002)(316002)(31686004)(8936002)(2616005)(6512007)(36756003)(83380400001)(26005)(186003)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUVBa3E3a25iN3lJQ3c0cU1nNDBHQ3pDMGZReE41cXdTOEJTWU1VakpMcnJE?=
 =?utf-8?B?bElYV0hMb3JiL2R1dVB4eHc0S0RLT2lSNzcrKzV1SzJUYVlscDErQ0UxQjlp?=
 =?utf-8?B?cm1DVlYxSEs3M0N2OVhzK2diRE05L3FTOEJVL1pLcmJOdEZhdUIwaHZMemJz?=
 =?utf-8?B?QjNTMTFQbWlaR3pkMm9ySUUyUlFDVFdvS2NZYkZydy9mVjlzaDY3WUxEWjZN?=
 =?utf-8?B?MFZMWVZRNjJpbVl0SS96dTRzby9IL0hSRDBzQnpDVGY3emNYZHdMSStBVEc3?=
 =?utf-8?B?OUlsR2piWlRJcWJZbXhUeDdiWG5hdGd4UklpTFQ2cHVHV3Fxa1RiYVhoZnJr?=
 =?utf-8?B?VVpENGVaKzRRS2RWc0w0elVRcUxtZnpVMmUrMWZHdkhldDd5dFUvcXdqT29v?=
 =?utf-8?B?UHVFa1drR3FXZkZydWZ0RUhsRG55eUF3Nkx4a2Z2WHlVaHRXWWlDd3Y0Ykdy?=
 =?utf-8?B?Ni9nVDR4eU1QcjZ1Zy94eEFob1BvcWZRclFpb3hMZm1iZTQwQllyTEZ0TFZQ?=
 =?utf-8?B?TDd2YlRWL2lDVi9oRXBWTTlJVWZPN2xQNjdGaXBpUEQ2Q0E0c2N5M295NWRv?=
 =?utf-8?B?U1pOVXZqRzVoOGtyUHhndTIzQndGbWpMVFo5b0g0UElkWlFPR3ByS2lRdkNH?=
 =?utf-8?B?OGhXKzBJeEFXQWxkZHQxMFdvUHZHRVRpRFB1aHFYUHZaL2JEYTNrVm1ydE14?=
 =?utf-8?B?Rm9xa2xSdDJRcjJaRFVaK1MyL0I2QTNNeno5aW5hai9NVk80V1NIclZMMTBj?=
 =?utf-8?B?czF1Rkp2UVBWeTdFTXJMWlNrKzBBVFc2T3pkVGlKcFR5VTNibHdmU2dkc1V2?=
 =?utf-8?B?LzBjbHB2a0E3bGFYUnZ3SE5BR3VFNWpVRkRHNFppV1cyUi8xLy9iMFhSZmJv?=
 =?utf-8?B?VFk2OGwzZjZ0QmhoVEJJdER1WEJtQnNOTUpMcVBYWkFDTFlZbm8zYWluT3BL?=
 =?utf-8?B?MTdSSlJzZXRlay90YVNJcG5wUHY3TDNEaGhzZFMwUEZXcWYyNG9ybnZPYWtW?=
 =?utf-8?B?clJYTlErUk1KYzNqclFWcnpUaEhkK2VVamFuR1hibU5VdWJOZXFsVmhaRVlS?=
 =?utf-8?B?SVI2V1hVK0p1ZlA2enhEOFdtYWluK24ySlpQRUg0YzVQWHIvUk1QeWNIZEk2?=
 =?utf-8?B?dlpTYUd4NnlWTHAzS0dQNEZYM0RLc1gwZ21QSVAzNlBCdGtwYnYwa3l0VVov?=
 =?utf-8?B?ZEJyaFU4MTFGVzBCT1p5TnJRSkZTbHVMVUljcWIwOEJ3SDEzL01WRmNGRGxO?=
 =?utf-8?B?cFNTaHNQY1h3c1NCaUMzd2dEZ2NPaEpJOE9ZWks1blpDUGxDMVl0YWtURFgz?=
 =?utf-8?B?TFV5SVNEZTRhcnVGRW1CZVJZMm5kK0RCNVFEUnhyWUF2OWMySDZqakdrS3Vt?=
 =?utf-8?B?L2tnTUMxVjROT1d0VmJrT3NtZEZjSmlNY1UxTCs1SkdITVJKL1VmQ2cvbEpp?=
 =?utf-8?B?YnpicW1tQVFlL3Z1eURiTWdwbEZPYTJxWjcxcFcyU0dCazRkZXppOWh4dzJ2?=
 =?utf-8?B?dnhPVFF5VHhYOXQ5V0l0VXVlUFVwZE0wWHNuQitCYjdnMGJxb0tlVzNDcnA0?=
 =?utf-8?B?Y0lpSml3N0pBM2REQ2h3MDRVUHN1ZW1OdlpMbFFVaTBBWlhlSXo0OWZ1eVNH?=
 =?utf-8?B?Q3F5bHl0bDhWNTZNYisyQWZRdlpYMVpZM2duUUluL3l3dlRIMkpWdndnTVlK?=
 =?utf-8?B?WGtrRlJoMzNEK1A3ejB4UkFHekxyemVqSE8yYTVLQVNLaWpsSWE1MkpnYzV4?=
 =?utf-8?B?eWhRM0ViVHhPT0hXSlQzSnh5YkJvUjNDdFlReXk0Q1pWRVp3MWZNWGRGejVn?=
 =?utf-8?B?Y1JycklTdlYwVTcrOE41NmVQR1ZmYkh4YzlBazlXTXhUU3V5YnBnTUQvRGQ5?=
 =?utf-8?B?RTBoNHBJSEIrU3k1SldOTWdlTVpLTUs0YzBsRmFLdmc2M201TUZwR1NvMS9L?=
 =?utf-8?B?Vk9HOWNHWWhPTGFqNW15Q3g1SU5rNTFOaW91RnBXYUNPQUp3QjBReE9KbUl2?=
 =?utf-8?B?U0NSZU4rZnVhVXRDbWRJLzZaUnlndjkxWFM1a1hJeTRDZHBTeWtHb2dtRyt3?=
 =?utf-8?B?TVZ1bGF1TmprNDZ0KzE4NVdWeWJyZzlra3U5VlNUcnJ0WUtsSzlkVkk1T3FB?=
 =?utf-8?B?UDRsakJFUTQ3Q2dHVjFhRktUZ0RaZFhSVVVxemM4a0pvdUNZQnhBZVRnTGwr?=
 =?utf-8?B?ZGJXdEY2QTZPVjFxZHRKZjZ3TkpFYVBnT1FqeE1TS2RQQ2dWNnFFZWxHa05R?=
 =?utf-8?B?MDNDbEErVG8rZy9Qd1g2clFJMXVnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebdb149b-a6b7-4a0b-99cc-08da02abb4cb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 15:36:12.6626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SpSGZddpAI5j1/mAbxE3vbqa602Fr3VJYKGedBL0J8oQDmgbgZ1qDb8WsOgTo2zED30stMUXKC3HDdbm6+IphJyS4704r1Myvl+xszBKSfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2636
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10281
 signatures=692062
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203100084
X-Proofpoint-ORIG-GUID: G5Ya1vtrWdgL_vtksYt-9n7EbwR6eDU2
X-Proofpoint-GUID: G5Ya1vtrWdgL_vtksYt-9n7EbwR6eDU2
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/2022 2:20 AM, Igor Mammedov wrote:
> On Tue, 8 Mar 2022 01:50:11 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
>> On Mon, Mar 07, 2022 at 09:41:44AM -0500, Steven Sistare wrote:
>>> On 3/4/2022 5:41 AM, Igor Mammedov wrote:  
>>>> On Thu, 3 Mar 2022 12:21:15 -0500
>>>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>>>   
>>>>> On Wed, Dec 22, 2021 at 11:05:15AM -0800, Steve Sistare wrote:  
>>>>>> Allocate anonymous memory using memfd_create if the memfd-alloc machine
>>>>>> option is set.
>>>>>>
>>>>>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>>>>>> ---
>>>>>>  hw/core/machine.c   | 19 +++++++++++++++++++
>>>>>>  include/hw/boards.h |  1 +
>>>>>>  qemu-options.hx     |  6 ++++++
>>>>>>  softmmu/physmem.c   | 47 ++++++++++++++++++++++++++++++++++++++---------
>>>>>>  softmmu/vl.c        |  1 +
>>>>>>  trace-events        |  1 +
>>>>>>  util/qemu-config.c  |  4 ++++
>>>>>>  7 files changed, 70 insertions(+), 9 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>>>>>> index 53a99ab..7739d88 100644
>>>>>> --- a/hw/core/machine.c
>>>>>> +++ b/hw/core/machine.c
>>>>>> @@ -392,6 +392,20 @@ static void machine_set_mem_merge(Object *obj, bool value, Error **errp)
>>>>>>      ms->mem_merge = value;
>>>>>>  }
>>>>>>  
>>>>>> +static bool machine_get_memfd_alloc(Object *obj, Error **errp)
>>>>>> +{
>>>>>> +    MachineState *ms = MACHINE(obj);
>>>>>> +
>>>>>> +    return ms->memfd_alloc;
>>>>>> +}
>>>>>> +
>>>>>> +static void machine_set_memfd_alloc(Object *obj, bool value, Error **errp)
>>>>>> +{
>>>>>> +    MachineState *ms = MACHINE(obj);
>>>>>> +
>>>>>> +    ms->memfd_alloc = value;
>>>>>> +}
>>>>>> +
>>>>>>  static bool machine_get_usb(Object *obj, Error **errp)
>>>>>>  {
>>>>>>      MachineState *ms = MACHINE(obj);
>>>>>> @@ -829,6 +843,11 @@ static void machine_class_init(ObjectClass *oc, void *data)
>>>>>>      object_class_property_set_description(oc, "mem-merge",
>>>>>>          "Enable/disable memory merge support");
>>>>>>  
>>>>>> +    object_class_property_add_bool(oc, "memfd-alloc",
>>>>>> +        machine_get_memfd_alloc, machine_set_memfd_alloc);
>>>>>> +    object_class_property_set_description(oc, "memfd-alloc",
>>>>>> +        "Enable/disable allocating anonymous memory using memfd_create");
>>>>>> +
>>>>>>      object_class_property_add_bool(oc, "usb",
>>>>>>          machine_get_usb, machine_set_usb);
>>>>>>      object_class_property_set_description(oc, "usb",
>>>>>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>>>>>> index 9c1c190..a57d7a0 100644
>>>>>> --- a/include/hw/boards.h
>>>>>> +++ b/include/hw/boards.h
>>>>>> @@ -327,6 +327,7 @@ struct MachineState {
>>>>>>      char *dt_compatible;
>>>>>>      bool dump_guest_core;
>>>>>>      bool mem_merge;
>>>>>> +    bool memfd_alloc;
>>>>>>      bool usb;
>>>>>>      bool usb_disabled;
>>>>>>      char *firmware;
>>>>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>>>>> index 7d47510..33c8173 100644
>>>>>> --- a/qemu-options.hx
>>>>>> +++ b/qemu-options.hx
>>>>>> @@ -30,6 +30,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>>>>>>      "                vmport=on|off|auto controls emulation of vmport (default: auto)\n"
>>>>>>      "                dump-guest-core=on|off include guest memory in a core dump (default=on)\n"
>>>>>>      "                mem-merge=on|off controls memory merge support (default: on)\n"
>>>>>> +    "                memfd-alloc=on|off controls allocating anonymous guest RAM using memfd_create (default: off)\n"    
>>>>>
>>>>> Question: are there any disadvantages associated with using
>>>>> memfd_create? I guess we are using up an fd, but that seems minor.  Any
>>>>> reason not to set to on by default? maybe with a fallback option to
>>>>> disable that?  
>>>
>>> Old Linux host kernels, circa 4.1, do not support huge pages for shared memory.
>>> Also, the tunable to enable huge pages for share memory is different than for
>>> anon memory, so there could be performance loss if it is not set correctly.
>>>     /sys/kernel/mm/transparent_hugepage/enabled
>>>     vs
>>>     /sys/kernel/mm/transparent_hugepage/shmem_enabled  
>>
>> I guess we can test this when launching the VM, and select
>> a good default.
>>
>>> It might make sense to use memfd_create by default for the secondary segments.  
>>
>> Well there's also KSM now you mention it.
> 
> then another quest, is there downside to always using memfd_create
> without any knobs being involved?

Lower performance if small pages are used (but Michael suggests qemu could 
automatically check the tunable and use anon memory instead)

KSM (same page merging) is not supported for shared memory, so ram_block_add ->
memory_try_enable_merging will not enable it.

In both cases, I expect the degradation would be negligible if memfd_create is
only automatically applied to the secondary segments, which are typically small.
But, someone's secondary segment could be larger, and it is time consuming to
prove innocence when someone claims your change caused their performance regression.

- Steve

>>>>> I am concerned that it's actually a kind of memory backend, this flag
>>>>> seems to instead be closer to the deprecated mem-prealloc. E.g.
>>>>> it does not work with a mem path, does it?  
>>>
>>> One can still define a memory backend with mempath to create the main ram segment,
>>> though it must be some form of shared to work with live update.  Indeed, I would 
>>> expect most users to specify an explicit memory backend for it.  The secondary
>>> segments would still use memfd_create.
>>>   
>>>> (mem path and mem-prealloc are transparently aliased to used memory backend
>>>> if I recall it right.)
>>>>
>>>> Steve,
>>>>
>>>> For allocating guest RAM, we switched exclusively to using memory-backends
>>>> including initial guest RAM (-m size option) and we have hostmem-memfd
>>>> that uses memfd_create() and I'd rather avoid adding random knobs to machine
>>>> for tweaking how RAM should be allocated, we have memory backends for this,
>>>> so this patch begs the question: why hostmem-memfd is not sufficient?
>>>> (patch description is rather lacking on rationale behind the patch)  
>>>
>>> There is currently no way to specify memory backends for the secondary memory
>>> segments (vram, roms, etc), and IMO it would be onerous to specify a backend for
>>> each of them.  On x86_64, these include pc.bios, vga.vram, pc.rom, vga.rom,
>>> /rom@etc/acpi/tables, /rom@etc/table-loader, /rom@etc/acpi/rsdp.
>>>
>>> - Steve
>>>   
>>>>>>      "                aes-key-wrap=on|off controls support for AES key wrapping (default=on)\n"
>>>>>>      "                dea-key-wrap=on|off controls support for DEA key wrapping (default=on)\n"
>>>>>>      "                suppress-vmdesc=on|off disables self-describing migration (default=off)\n"
>>>>>> @@ -76,6 +77,11 @@ SRST
>>>>>>          supported by the host, de-duplicates identical memory pages
>>>>>>          among VMs instances (enabled by default).
>>>>>>  
>>>>>> +    ``memfd-alloc=on|off``
>>>>>> +        Enables or disables allocation of anonymous guest RAM using
>>>>>> +        memfd_create.  Any associated memory-backend objects are created with
>>>>>> +        share=on.  The memfd-alloc default is off.
>>>>>> +
>>>>>>      ``aes-key-wrap=on|off``
>>>>>>          Enables or disables AES key wrapping support on s390-ccw hosts.
>>>>>>          This feature controls whether AES wrapping keys will be created
>>>>>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>>>>>> index 3524c04..95e2b49 100644
>>>>>> --- a/softmmu/physmem.c
>>>>>> +++ b/softmmu/physmem.c
>>>>>> @@ -41,6 +41,7 @@
>>>>>>  #include "qemu/config-file.h"
>>>>>>  #include "qemu/error-report.h"
>>>>>>  #include "qemu/qemu-print.h"
>>>>>> +#include "qemu/memfd.h"
>>>>>>  #include "exec/memory.h"
>>>>>>  #include "exec/ioport.h"
>>>>>>  #include "sysemu/dma.h"
>>>>>> @@ -1964,35 +1965,63 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
>>>>>>      const bool shared = qemu_ram_is_shared(new_block);
>>>>>>      RAMBlock *block;
>>>>>>      RAMBlock *last_block = NULL;
>>>>>> +    struct MemoryRegion *mr = new_block->mr;
>>>>>>      ram_addr_t old_ram_size, new_ram_size;
>>>>>>      Error *err = NULL;
>>>>>> +    const char *name;
>>>>>> +    void *addr = 0;
>>>>>> +    size_t maxlen;
>>>>>> +    MachineState *ms = MACHINE(qdev_get_machine());
>>>>>>  
>>>>>>      old_ram_size = last_ram_page();
>>>>>>  
>>>>>>      qemu_mutex_lock_ramlist();
>>>>>> -    new_block->offset = find_ram_offset(new_block->max_length);
>>>>>> +    maxlen = new_block->max_length;
>>>>>> +    new_block->offset = find_ram_offset(maxlen);
>>>>>>  
>>>>>>      if (!new_block->host) {
>>>>>>          if (xen_enabled()) {
>>>>>> -            xen_ram_alloc(new_block->offset, new_block->max_length,
>>>>>> -                          new_block->mr, &err);
>>>>>> +            xen_ram_alloc(new_block->offset, maxlen, new_block->mr, &err);
>>>>>>              if (err) {
>>>>>>                  error_propagate(errp, err);
>>>>>>                  qemu_mutex_unlock_ramlist();
>>>>>>                  return;
>>>>>>              }
>>>>>>          } else {
>>>>>> -            new_block->host = qemu_anon_ram_alloc(new_block->max_length,
>>>>>> -                                                  &new_block->mr->align,
>>>>>> -                                                  shared, noreserve);
>>>>>> -            if (!new_block->host) {
>>>>>> +            name = memory_region_name(mr);
>>>>>> +            if (ms->memfd_alloc) {
>>>>>> +                Object *parent = &mr->parent_obj;
>>>>>> +                int mfd = -1;          /* placeholder until next patch */
>>>>>> +                mr->align = QEMU_VMALLOC_ALIGN;
>>>>>> +                if (mfd < 0) {
>>>>>> +                    mfd = qemu_memfd_create(name, maxlen + mr->align,
>>>>>> +                                            0, 0, 0, &err);
>>>>>> +                    if (mfd < 0) {
>>>>>> +                        return;
>>>>>> +                    }
>>>>>> +                }
>>>>>> +                qemu_set_cloexec(mfd);
>>>>>> +                /* The memory backend already set its desired flags. */
>>>>>> +                if (!object_dynamic_cast(parent, TYPE_MEMORY_BACKEND)) {
>>>>>> +                    new_block->flags |= RAM_SHARED;
>>>>>> +                }
>>>>>> +                addr = file_ram_alloc(new_block, maxlen, mfd,
>>>>>> +                                      false, false, 0, errp);
>>>>>> +                trace_anon_memfd_alloc(name, maxlen, addr, mfd);
>>>>>> +            } else {
>>>>>> +                addr = qemu_anon_ram_alloc(maxlen, &mr->align,
>>>>>> +                                           shared, noreserve);
>>>>>> +            }
>>>>>> +
>>>>>> +            if (!addr) {
>>>>>>                  error_setg_errno(errp, errno,
>>>>>>                                   "cannot set up guest memory '%s'",
>>>>>> -                                 memory_region_name(new_block->mr));
>>>>>> +                                 name);
>>>>>>                  qemu_mutex_unlock_ramlist();
>>>>>>                  return;
>>>>>>              }
>>>>>> -            memory_try_enable_merging(new_block->host, new_block->max_length);
>>>>>> +            memory_try_enable_merging(addr, maxlen);
>>>>>> +            new_block->host = addr;
>>>>>>          }
>>>>>>      }
>>>>>>  
>>>>>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>>>>>> index 620a1f1..ab3648a 100644
>>>>>> --- a/softmmu/vl.c
>>>>>> +++ b/softmmu/vl.c
>>>>>> @@ -2440,6 +2440,7 @@ static void create_default_memdev(MachineState *ms, const char *path)
>>>>>>          object_property_set_str(obj, "mem-path", path, &error_fatal);
>>>>>>      }
>>>>>>      object_property_set_int(obj, "size", ms->ram_size, &error_fatal);
>>>>>> +    object_property_set_bool(obj, "share", ms->memfd_alloc, &error_fatal);
>>>>>>      object_property_add_child(object_get_objects_root(), mc->default_ram_id,
>>>>>>                                obj);
>>>>>>      /* Ensure backend's memory region name is equal to mc->default_ram_id */
>>>>>> diff --git a/trace-events b/trace-events
>>>>>> index a637a61..770a9ac 100644
>>>>>> --- a/trace-events
>>>>>> +++ b/trace-events
>>>>>> @@ -45,6 +45,7 @@ ram_block_discard_range(const char *rbname, void *hva, size_t length, bool need_
>>>>>>  # accel/tcg/cputlb.c
>>>>>>  memory_notdirty_write_access(uint64_t vaddr, uint64_t ram_addr, unsigned size) "0x%" PRIx64 " ram_addr 0x%" PRIx64 " size %u"
>>>>>>  memory_notdirty_set_dirty(uint64_t vaddr) "0x%" PRIx64
>>>>>> +anon_memfd_alloc(const char *name, size_t size, void *ptr, int fd) "%s size %zu ptr %p fd %d"
>>>>>>  
>>>>>>  # gdbstub.c
>>>>>>  gdbstub_op_start(const char *device) "Starting gdbstub using device %s"
>>>>>> diff --git a/util/qemu-config.c b/util/qemu-config.c
>>>>>> index 436ab63..3606e5c 100644
>>>>>> --- a/util/qemu-config.c
>>>>>> +++ b/util/qemu-config.c
>>>>>> @@ -207,6 +207,10 @@ static QemuOptsList machine_opts = {
>>>>>>              .type = QEMU_OPT_BOOL,
>>>>>>              .help = "enable/disable memory merge support",
>>>>>>          },{
>>>>>> +            .name = "memfd-alloc",
>>>>>> +            .type = QEMU_OPT_BOOL,
>>>>>> +            .help = "enable/disable memfd_create for anonymous memory",
>>>>>> +        },{
>>>>>>              .name = "usb",
>>>>>>              .type = QEMU_OPT_BOOL,
>>>>>>              .help = "Set on/off to enable/disable usb",
>>>>>> -- 
>>>>>> 1.8.3.1    
>>>>>
>>>>>  
>>>>   
>>
> 

