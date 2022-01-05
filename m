Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BA7485731
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 18:26:39 +0100 (CET)
Received: from localhost ([::1]:54296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5A3a-0006wQ-Bt
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 12:26:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n5A1g-0005Wx-EW
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 12:24:42 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:55104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n5A1e-0002eK-4D
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 12:24:39 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 205FYL2C028321; 
 Wed, 5 Jan 2022 17:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=eTVCuWSofBO50OtNWfO0nwrxORD/eEFbvIq+FpHwFds=;
 b=iQi68Lnwyf1/PfP57cfPHH0PmzXhURuSPJb4P0XIrVIRZ1ufWIw4/8n0WPqTukzbWDv+
 4tXzJXxHiHWZMahJO+RYjJjZHG3cgme4A09dVSTuPBPugi/PXi41Mmug6R5UxdJS51M0
 cPxi6+WYulgWQixYtGIJ2jy9QejFF2kGcnvfoTIgoCd6GsAbTg73UUyutEB8d6frQnpn
 Ni7/TI4cpvd6AT/ywv/ftRdzC0BC8rfpdDufgeqYRjABTADZTZUuBTNDZNMEjrfVCmgq
 Ew7IC38rwVSXdsnqrZvmwY9Qf13QhzLKJC5myHiQWScAgTl/xTl2ZMNkqxFojISqAs7d oA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dc3v4nefx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Jan 2022 17:24:29 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 205HA89u062686;
 Wed, 5 Jan 2022 17:24:27 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by aserp3030.oracle.com with ESMTP id 3dad0fa2cd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Jan 2022 17:24:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BtWt9a8WJnAqjsllRz+8mt6NKIlovDSDLw6sPusBynbUaZYFC6Fc2d8Qk9qcxa1WCedP9A4ZyAR2IFfDDR1Vdd1tGMCF0aWrd2+qiSwGCUPtP+jcpSL/L6M/26R3W2P5sIBllw8h0sYYN0JcrqyzIk+zkP6wr3gasGCJjjViNNbmG+aDfUffNz4OAd5QXwTBnlGv0Qt2JzkGL7OITFyA9pv3IRsYdbUJ8TpyPnlDH5GhmHMs7mIcp1Ly80pGyvKvIGfk1FYoZlVX3MtrugTYleDF2QUxfWJRaM2TNRUnu7L6zhYj6HnY6Aves2tZqyT6FuKH1ocoQvpYq+0xwT1OpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTVCuWSofBO50OtNWfO0nwrxORD/eEFbvIq+FpHwFds=;
 b=OsSH338PCn5RWGz9YR7tWPUS10tBGuuIsfUPaYuQZCzknV/yOIbfmiYFixDlr4Kl5p02P9WCQA6eoTmxe1sXiP2qKGpimA52fqKCX4mjaYHeVjT965Sex6jSUoM5H52KM+KUiIagQpQqZoHZcsMjOezIX4/Ss3/DMbENKQKoIVRO1pQ4s9AqD0wLZ1V4T6Tf+QrYcoXRJxv78ykiphB8Kd9YgQPAkqPVRb4gXBLu1iMmdG/0Sgklae9gaQBRgtByMVgXdjXJbVAoCWdzv9Ap8ZjWhcM+TWnSdY6uRkjwThvSqZUEJK3xYzBUFouf3J2W67RKiHzq2BPua7onkcyJfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTVCuWSofBO50OtNWfO0nwrxORD/eEFbvIq+FpHwFds=;
 b=enxjZscRFSdGRrsLp4k8BDHSQXgI9174P57tzfXmz883M0l+ElQ+Cyd+Gl2QfuvePVoTrW2v/TbbSy/5Lprn2wy369V9QRsMN7zmEPFySL/nUC5rDcKq3ZgfBeIU3IFkfbkK0wTeL5+4PdUIjOMffay9mModatS82toXDdjg4Bg=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB3318.namprd10.prod.outlook.com (2603:10b6:a03:15d::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Wed, 5 Jan
 2022 17:24:25 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%5]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 17:24:25 +0000
Message-ID: <f1cadf51-795b-200c-8abb-f8f97b34c228@oracle.com>
Date: Wed, 5 Jan 2022 12:24:21 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V7 19/29] vfio-pci: cpr part 1 (fd and dma)
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-20-git-send-email-steven.sistare@oracle.com>
 <20211222181003-mutt-send-email-mst@kernel.org>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20211222181003-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR04CA0079.namprd04.prod.outlook.com
 (2603:10b6:805:f2::20) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 342354f8-ebab-4967-9d2c-08d9d0703879
X-MS-TrafficTypeDiagnostic: BYAPR10MB3318:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB33183C9D811CF7A26DB4B7EBF94B9@BYAPR10MB3318.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yViN0P07ore42wZePH+C/TiSz6YJ64+fq5/TTCCr3VOVCb8+4tugxENt09jYZSWE9w0UoWuXMRtYaaMqEdZhBGi/lcRqXr4/c0Vsddx8VuJrPbdO2YH7wZrOPm21nGsBznTgl9B7jCNcLncGEUwCaGH5KyO2vFSUw+FxOl5v/tDyzfAlag3+bHDK7txY2sng8TVKh7mgH1ua3jQS+8TQ530qAEGz9t5N+OxE2jXRqO4zs6UI+8JSl6ALQEbDZY0S01WShC5YxTE2GOdylkKfawuh0rg0yCwg1N09JIez7FM2SgwGDwtxrtUR7+eDUfaF/WT+Pc3zxQV38OGQviyJZnmQxww8vd/jrcGDSovcyfj/xwxg6tDt8tl+shxKDJuFFm5f90gTEUZ8miXn1faqJJ+tyLZfBLNFGJyNNt5DmAdoeKIzlNsz5JkuImKBMmoQPjnjJ5glPdCKJnyrWcgyx1+B59Kl0s0mRS3ZDJDAsMYm54dncDPZaBPPANWNE2MDZmzXq+kkcd7LnTWQeZbJ1EJarh3CCiwwvODOkkFSNSA+qsZRK1J4jp2YFJl/1IQh1/2JjinRkLkktsw9fwSuhsZMsoFokI4iTsLl8DWuKToJ6tq/nFXBj2czZgyiSTx6yhA3FbT8y17IV3q02fYRd2X9a5aMSpIjuccx6/p5YXynfIxzEwxDQeMBs4fTOKFg9jVKaksyeGFdPO8zwnD48muUgimLMuOJcP7E6uYRzZ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(6506007)(53546011)(36916002)(107886003)(31696002)(6512007)(8676002)(2906002)(8936002)(66476007)(26005)(36756003)(6666004)(6916009)(66946007)(186003)(38100700002)(6486002)(5660300002)(44832011)(4326008)(316002)(54906003)(2616005)(31686004)(66556008)(7416002)(86362001)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkpSdXhqZXBoZUppTEFuS2RURjRZZVFqbDFLbkYxY2tpTjBrWjhtYnpObXhZ?=
 =?utf-8?B?bFViTnlhMEF2VEsrQSt0NGFaR05vb2hkM3U3RGtoVW50SXVOalYyZUVZUzR4?=
 =?utf-8?B?aUt0cllKSW90OWV4YTdVaEV2eGFwOHNHSjNoeW1RamZFZXd0dGpWN3NQZjMx?=
 =?utf-8?B?dlcrbjNGcTZoV29mVzdNajdaYlBib1FyOUlzckMwMmNaNlFlZVczeFV2Szc5?=
 =?utf-8?B?QWZhdDkyN1BRalR1NnRXckN0ZDFOUjl5alMyd0pQQk9FR1BxVFRCZURzaHlL?=
 =?utf-8?B?aEs1T3NWWXBoanJsUXhvLy9DUmJJeTlBZWtIZDU3M1lkNUxpTzV5ZzUyeE5t?=
 =?utf-8?B?ZlFMOGRNN1NPQ0NmOUxTcU1PcHNIWmJhVTdDVW9JbUZmOUpxdzRURXRZOEE0?=
 =?utf-8?B?TmVyVmtDaGJ5dCtobDFFcTh0b0tkQzhXeXlDQnVSZ1NmWU9jUis1aGY4dnY5?=
 =?utf-8?B?OTcyMllLaWZxTUQ1alhQanBxWEc0RGErN1kycGROZ1JBYXdMQm92ZGl5WXJ0?=
 =?utf-8?B?QnFlVVNpT25SY3hweVhaOHBpVEJiaHFReG9jU3VHOFFOaTVLUEJiWlVmSE9Q?=
 =?utf-8?B?SCtFUFNVNmhOM3BYdnlqYVlPMFFjd0NNajQvOVRMMFR4bFlMc3JlWDkzS2Vn?=
 =?utf-8?B?dGFqYTg4V1pjcUVmMUxaVzQzck5CTnlLMm96WFJXMnpkK3JWVUpkMTU5ZG1Q?=
 =?utf-8?B?dGdGcmtvZnlPM2RqTVBCL0hlM00vc3B5WFY0eTFGejNDL0JQMjhPVnJwRzBw?=
 =?utf-8?B?R1M3OWZ6TFJOUENtWmNDNG1TR09IS1VSNTJaWGN0czh5OHhCSmlGOVNRK1po?=
 =?utf-8?B?a0h5b0tOSmx2VmxmdFZzeWZSOXVCaUs2N3VJbWVtaUhlamIwZnB1TlMweUdV?=
 =?utf-8?B?N0xuYk8rYk1ZQUZWMXdVL2p3QnpYSzV6ZGxUeEdGaFBpWFdOMjViMFJDdklO?=
 =?utf-8?B?MG9XanRHSDdsakxmZjI4SFZHNDRvbjVOM2hhd04weWVIN2kyZHZRNDI4ZytI?=
 =?utf-8?B?MFN6Yk1nODVrSldLc1BkMDFidnFHUkRaK0cwWmgwd3MySmZBSDZnVmZPczVh?=
 =?utf-8?B?OHhBcnpDMzRyOFdmb0d6RkxoSU5tSmtEWm5ZbzE2aTV4NWZ5VzNpOVNzeW1s?=
 =?utf-8?B?czBQQ25lbUNyNnNOcHlzaU5QUGlSV0tEekxqSGtCMXBkcXR6cmlJSTY1Vk43?=
 =?utf-8?B?M3hFVllEbWIveFRqM2ZyaVVHM0VpYVNURXdBcXRJWHNGY2xIbitDVzNaZi9x?=
 =?utf-8?B?NFFEdEJ6cjRGUXZRUTQ3NHBod0RTWmlrOHZpd3V1RDdjR1NFMkp5M1RSRlJy?=
 =?utf-8?B?UEgyWER3aU9YbEVwT1JXMC9jQmxTSzhtYmpRbThvbkhOTTk3SWdDcWowTGY4?=
 =?utf-8?B?T2ZVdC9DWnFiSEhiRnVvNmRmQ3hQYmlnM3JoRjhGa1NyclhhWCtUUE9ad1Rh?=
 =?utf-8?B?Q1psWHArU2c5aHg4MDBlQ0UzdmNhTUNRUCtydUIrQ0hJN29CdkJYOWwvWFZR?=
 =?utf-8?B?bzNsNkpEdHBTd1I3dXNpUDkvUlRpcE5QUDY3V2NlVG45MlNBZHZucU43SExm?=
 =?utf-8?B?cnpiZHcwTlFtbEVRUENIa2hJRE5nWUlpSkxjaVdhczdObm5tUDR2bVpobmtz?=
 =?utf-8?B?eXl2REl6SHlieDZsNnpjTlh0WHRaMElCb085bDQ3T2RxZFVKU1AveXZDWnVU?=
 =?utf-8?B?MzFxcm1MMDRQVnNuQ0hBczZvdDJmMUlMMGk1eEFhOERRcWtLV2JKVk9nRHhu?=
 =?utf-8?B?NVR1aWpyOEU4UjQyb3RjSXBwUW81TjBTZGQ2UVFWcTg1QW9nOW50SFlJQm82?=
 =?utf-8?B?ejdoM3RheXhsb1E5TmpxY2FKUE1NNUlLSFBzL0cyVE1wWEJqaWVSZTdDaUp1?=
 =?utf-8?B?RkgzZVR1MVNIb3MyV3ZOZkxqNkNBQmNHSUJmNmlIVGdjTFpYN2QwdXdsT0ZY?=
 =?utf-8?B?OUwyY0VQaFlVdUZTZFVPNU01aDBITUxEbndRaUhzYU1Kam1PK2dzbkEzVXFs?=
 =?utf-8?B?bS9mT1pBaURGN1A5SVprY2g1M25DeW9mNmdvWEMxdFVmVWdJQ1Mwb2d0enF3?=
 =?utf-8?B?eHBLdjl2MEtHS3diTm5COWJVQkVzSWIxajBocno1U0VpWVNGOUJjellSMVVJ?=
 =?utf-8?B?aHAwVi91T0dsMTF4bERYNklOelNEenZFcFlrOFppM1BBZzZrWHQrcVlIZU8z?=
 =?utf-8?B?M2l2cnNpbklzNzFrSHJYZVBPUUk4Z1dKblVvWklkZDNNTlNWVmtyakxYYlFr?=
 =?utf-8?B?LzNETi81SnpINndVOWhmWXdJUTNRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 342354f8-ebab-4967-9d2c-08d9d0703879
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 17:24:25.3919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/7Hn5eFwkMBD1Mla8mt59AO+4PMitNW3SWmXbvJ9B/hjn8R74U+B1NqPca52L77BndZG3F7T9mps3fOu5+VOAiHIxB27+sVSkMYO0WQIqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3318
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10218
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201050115
X-Proofpoint-GUID: fzH_wys43gasncfmKeuPPyMRmGAKBnTd
X-Proofpoint-ORIG-GUID: fzH_wys43gasncfmKeuPPyMRmGAKBnTd
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.057,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/22/2021 6:15 PM, Michael S. Tsirkin wrote:
> On Wed, Dec 22, 2021 at 11:05:24AM -0800, Steve Sistare wrote:
>> Enable vfio-pci devices to be saved and restored across an exec restart
>> of qemu.
>>
>> At vfio creation time, save the value of vfio container, group, and device
>> descriptors in cpr state.
>>
>> In cpr-save and cpr-exec, suspend the use of virtual addresses in DMA
>> mappings with VFIO_DMA_UNMAP_FLAG_VADDR, because guest ram will be remapped
>> at a different VA after exec.  DMA to already-mapped pages continues.  Save
>> the msi message area as part of vfio-pci vmstate, save the interrupt and
>> notifier eventfd's in cpr state, and clear the close-on-exec flag for the
>> vfio descriptors.  The flag is not cleared earlier because the descriptors
>> should not persist across miscellaneous fork and exec calls that may be
>> performed during normal operation.
>>
>> On qemu restart, vfio_realize() finds the saved descriptors, uses
>> the descriptors, and notes that the device is being reused.  Device and
>> iommu state is already configured, so operations in vfio_realize that
>> would modify the configuration are skipped for a reused device, including
>> vfio ioctl's and writes to PCI configuration space.  The result is that
>> vfio_realize constructs qemu data structures that reflect the current
>> state of the device.  However, the reconstruction is not complete until
>> cpr-load is called. cpr-load loads the msi data and finds eventfds in cpr
>> state.  It rebuilds vector data structures and attaches the interrupts to
>> the new KVM instance.  cpr-load then invokes the main vfio listener callback,
>> which walks the flattened ranges of the vfio_address_spaces and calls
>> VFIO_DMA_MAP_FLAG_VADDR to inform the kernel of the new VA's.  Lastly, it
>> starts the VM and suppresses vfio pci device reset.
>>
>> This functionality is delivered by 3 patches for clarity.  Part 1 handles
>> device file descriptors and DMA.  Part 2 adds eventfd and MSI/MSI-X vector
>> support.  Part 3 adds INTX support.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  MAINTAINERS                   |   1 +
>>  hw/pci/pci.c                  |  10 ++++
>>  hw/vfio/common.c              | 115 ++++++++++++++++++++++++++++++++++++++----
>>  hw/vfio/cpr.c                 |  94 ++++++++++++++++++++++++++++++++++
>>  hw/vfio/meson.build           |   1 +
>>  hw/vfio/pci.c                 |  77 ++++++++++++++++++++++++++++
>>  hw/vfio/trace-events          |   1 +
>>  include/hw/pci/pci.h          |   1 +
>>  include/hw/vfio/vfio-common.h |   8 +++
>>  include/migration/cpr.h       |   3 ++
>>  migration/cpr.c               |  10 +++-
>>  migration/target.c            |  14 +++++
>>  12 files changed, 324 insertions(+), 11 deletions(-)
>>  create mode 100644 hw/vfio/cpr.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index cfe7480..feed239 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2992,6 +2992,7 @@ CPR
>>  M: Steve Sistare <steven.sistare@oracle.com>
>>  M: Mark Kanda <mark.kanda@oracle.com>
>>  S: Maintained
>> +F: hw/vfio/cpr.c
>>  F: include/migration/cpr.h
>>  F: migration/cpr.c
>>  F: qapi/cpr.json
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index 0fd21e1..e35df4f 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -307,6 +307,16 @@ static void pci_do_device_reset(PCIDevice *dev)
>>  {
>>      int r;
>>  
>> +    /*
>> +     * A reused vfio-pci device is already configured, so do not reset it
>> +     * during qemu_system_reset prior to cpr-load, else interrupts may be
>> +     * lost.  By contrast, pure-virtual pci devices may be reset here and
>> +     * updated with new state in cpr-load with no ill effects.
>> +     */
>> +    if (dev->reused) {
>> +        return;
>> +    }
>> +
>>      pci_device_deassert_intx(dev);
>>      assert(dev->irq_state == 0);
>>  
> 
> 
> Hmm that's a weird thing to do. I suspect this works because
> "reused" means something like "in the process of being restored"?
> Because clearly, we do not want to skip this part e.g. when
> guest resets the device.

Exactly.  vfio_realize sets the flag if it detects the device is reused during
a restart, and vfio_pci_post_load clears the reused flag.

> So a better name could be called for, but really I don't
> love how vfio gets to poke at internal PCI state.
> I'd rather we found a way just not to call this function.
> If we can't, maybe an explicit API, and make it
> actually say what it's doing?

How about:

pci_set_restore(PCIDevice *dev) { dev->restore = true; }
pci_clr_restore(PCIDevice *dev) { dev->restore = false; }

vfio_realize()
  pci_set_restore(pdev)

vfio_pci_post_load()
  pci_clr_restore(pdev)

pci_do_device_reset()
    if (dev->restore)
        return;

- Steve
 

