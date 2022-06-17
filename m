Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A93054F698
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 13:22:43 +0200 (CEST)
Received: from localhost ([::1]:44924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2A3m-0007mV-93
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 07:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o29xA-0003PR-R5
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 07:15:53 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:19358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o29x7-0004JI-3D
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 07:15:52 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25H7bRDP005230;
 Fri, 17 Jun 2022 11:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=1olOazpx6MmD3K1xf0UInUhkG8ADONOVzxmNXrFdGQk=;
 b=QMDMxQDGqQOHjQV7+lGZqEizrxZdO/1f00N4On7qzNCFX32EnbFpf3/4sLGTWQYtkv0C
 SpJb0xaI1vgdcpHwmQ+jIUaJkJloBLg0mmY8hItJ/6hUspwpRBYYkBhZEWfVB5kTAU5d
 TnEM1A0ldzpT/fRM1t8/7pra1gW3itEid0SeZy68/fiZzL0yOuG8Op1dpngl1ZlWr52C
 PqM4h3Rj4G8IwNhD3d04cN+s5JekZ6rtnh0yt+1P0uIvQmeQ2Co3husQf8XRhrFsV7x7
 mSILOUWUCBvRyFBOcizv5CR9wN5geSLyYQ7VweNO8TRRuu/G0lIMEzXPyoEcLrwAIM0I UA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmjnsdk2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jun 2022 11:15:29 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25HB8C6o010107; Fri, 17 Jun 2022 11:13:53 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gprbttrv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jun 2022 11:13:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fODXq/Lw54G+m0Rcr/TyRkAZO8OpOspgttAKmdalnsADu9XFXff0w0H0bgd3ZX9lRiW3NhKIFtpVpWqcWyQCRGGDcNjk6S14Lpix/w3FugH+4OMNtXbsngxPXgSJPUM6zl3/SZ4O06uIvqCE7DhQ5p7jRroPS7EI9mKgsC7yI72XSEEvTokEr78H12i+3YiLv8OL9Y4jvb6x89RuVR3LpJ+NjN/ttkvgE0+icBdtXQZswrWlTz+0ZDtvVqaEHrtCtmGzKAnrmytj9FW4dPkyrvgvJnF4tUhMbSuTuwjlMXcmx9jLQh0Z8EfaGVoDNmBnl8EObkkiNwDPX93BLf0BFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1olOazpx6MmD3K1xf0UInUhkG8ADONOVzxmNXrFdGQk=;
 b=Abk1EHce5g1HCWBCbbnCytNj3s5GKlRPOtS0ULlDfkNot2ATqYxntzAA5aU1M6QpwQO/UEf1W/dV1Q/5lyz0UHHMxRSabThDUsbUUYEE8yItmgWL1xey46MOIKDwrl1tZknDZg9GzaAt6RnOjRcL5mtvk0cUnrlRihn4MEpvmyxh+km+ScQYehB2b/zXTf4bhsryjYxJ5Mll+TI7LSrNumLP8gR39k+PcUzOvvEGOpC3WJT1k7O5aCXH2yekOc3N5W4R/cXDMZgKYbZ/PP2wLXU9s+yinsV7vCoj3NYr6cHHAQKNqWeo+WfxMRtKbJU+/Xr+TY+KAZKo9nylHFyPfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1olOazpx6MmD3K1xf0UInUhkG8ADONOVzxmNXrFdGQk=;
 b=V8X+oXuTcfjdjnhoWXukCV1Xb4mVnSG6cEkJ/DO0TyFgbhdQkaCidBgIfciPuXHqVi6Re+YtfyaZ806LjI9WwMaWPZMV3iSAOu8uXHEI6QB+7eoWkFzsT9fTUdaV+kjTQHOIHi1kxMLQs3IOrHzc2JCBTpv4O2pxSjC4VPVH5Ns=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by DM6PR10MB3228.namprd10.prod.outlook.com (2603:10b6:5:1a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Fri, 17 Jun
 2022 11:13:51 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5353.015; Fri, 17 Jun 2022
 11:13:51 +0000
Message-ID: <1f1cc9dc-a077-0fd8-0ac1-caf38bf8fc66@oracle.com>
Date: Fri, 17 Jun 2022 12:13:45 +0100
Subject: Re: [PATCH v5 3/5] i386/pc: pass pci_hole64_size to pc_memory_init()
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
 <20220520104532.9816-4-joao.m.martins@oracle.com>
 <20220616153014.1aa4d16b@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220616153014.1aa4d16b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR04CA0136.eurprd04.prod.outlook.com (2603:10a6:207::20)
 To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86d81a0a-ec55-4069-8631-08da50527595
X-MS-TrafficTypeDiagnostic: DM6PR10MB3228:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB32284B66127D81442DC99FE6BBAF9@DM6PR10MB3228.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ymQy3nmf+3YS3WXHVIqFTyVo7slWzLMKXLFnuyjK3uwBgx8MuaA0BhbjZbGS05eJSjB4JNpNg8aYhos4MCV2vizkxfEweTBLF0LMgPHpRPzJmORAB4dc7fwzUz5pJPLQgkMzb07bFj0/O42oHDvmHquq2C4eYqacdwCVTLG4yNBQOgPOzO50w1zxP751N/YK+vzKBRflBK23BN33mtrHY6hg6bzcTlFdMVegY+RylcuwIOM5PEwoKryMstyCbVBocvnsoAkf/4G4UoZOeKmXEi0TdIAA4rqZTMhqKggf7j2ZlHXO8DicI/13tn0OrH6mZd7MzIu9rdIvlzOP68RJneICxj0tkwQc+rmMfj0EfYds2o9kl68AjF+UO63W9UPqAmvVEPVwmNJzvszsXeqbPQPr7XqW+BXmE/m2Jt+5T/ErVSdt44iafhvnIvYUAv7Q8CWXoU9KEAqkl+V3uhAuUzrGss2iEn7657wj75oov1mdWT/2hh9gv8cpRnXR1hILhIr5Odq01npF07Yyi0v572iaKuPaP4sHKgk1/6lOWcdjmCOtRd9uxyaw4489qqc78FGVYUovC5/Z+mS3z7AoFJiwev1ELXCr5BG0XBLQCZUbHrAA1qSM0KZJyczYw+Avb1+U2ICSBgaPioAq9501iW19PBIG9jjkGA3I5scz/ktHqpftGqlS1WHxnqcJpEjcttPauiyeicgSmObZmlq08A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(6512007)(2616005)(31696002)(86362001)(53546011)(6506007)(2906002)(186003)(6666004)(38100700002)(26005)(83380400001)(5660300002)(6916009)(31686004)(36756003)(7416002)(8936002)(498600001)(66476007)(6486002)(54906003)(316002)(4326008)(66556008)(8676002)(66946007)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTQ1QWpsLzJTdUtlTXdLVkwvV1hjZ2tSTnNXbEZuUHhzNm4zdTVwZm1GV3pa?=
 =?utf-8?B?dDB4MFpGa09vak5XMU5YNVlSTXA2V2VqMGRQVm1GQ1BNOXlSNmhVWlVDbWNJ?=
 =?utf-8?B?TG5Zb0VyejEzT3RDTzQra2JraDUwSnlXaVVlekQ3VDJQeEJUQjZjN3dYNFlX?=
 =?utf-8?B?U2trOTZCVnJlNy95cGhreG5hc29neDR6Ky84NUxaaVNabkRRYzlCWUhPcFd6?=
 =?utf-8?B?VGd5YzUxQjdBK29zdE45aDcySVFlRmhoeGVGZVBVZE80S0RnVVRaZDZZRlBn?=
 =?utf-8?B?ay9pMFBQTVVMYi9pWmdRc0ZpN1N1OWpkakh3QTA5MVBVb3RhUEE5ZVNRRi9M?=
 =?utf-8?B?eG9xbC9pcVhyYlJ2bm1zcjlneGFTY3hQbHErNmlRNG5PRVY5R0x1QXZ1eVpv?=
 =?utf-8?B?NVBrQ3NvSkM1T3RiLzRNNk80NFo3K2FVeVk2bXM0UzNKQjRKVDA2UGRXUGM2?=
 =?utf-8?B?ejkxd1J1VmhwdUVTRWdjQzhmRE1VUUQySTFrTDlsU0JWdjVITW5XRzlrRy9Y?=
 =?utf-8?B?U2g3Y2E3aS81Z1hudms2eGFZWnVnY28vZGowNWF0ZmsrUlRCUnNYZ3BJNms0?=
 =?utf-8?B?aGNJbTdFRFRCK3ZvL1hyWFgwaUpDMVZIQ0VjNkw5dEVrd2NiZzhCTUFHWWNa?=
 =?utf-8?B?dHJsYnBBZHZoNmtqSmlqNktnd0s0M3ozZ05jdEtYUnZ4R0s3ZG9meitDbXNJ?=
 =?utf-8?B?R25pcHQ2MGs2N3k1emNZMFJBL3BFVFVhMFhweGl6V1Fvakp6YU55a0paOU5R?=
 =?utf-8?B?Z1ZHQ0I1NmlGZkc2T08rRzNoeWd6c0t2VzY4SWxQMGVlbytDMnBuVExqdzVT?=
 =?utf-8?B?RkVtWDR1VlVFOUhhT1NNK2JUVWlSMVF1enJCaTI0Q2tQNGxaeXEwNldzTXRv?=
 =?utf-8?B?bnhrY2pyRG1NS01mZDdNeEYwNUV5R241NTRnYnNIaVFnMUQ1VGkvZlNqMXFD?=
 =?utf-8?B?UldxQ3VZczlNcWRmcHdsWk9zc1pWZHZXdnorWm1XR2FOVXFKaHRqQitJU1Jr?=
 =?utf-8?B?amFVNytHbkxKakhZNTlVR2Nuamw2VzJaZHJrTldkRnFVNU0rM0N1SnZiK0Z5?=
 =?utf-8?B?WDZ0dXNUQXV5R0JSdGhrNVFvMTQ3Mi9KcjBLeUFoeTI2OVBnWjMzd3lsS0Uv?=
 =?utf-8?B?U0E0NmVGZXhVYjNFSFk5ZE9UOS9QYUZYbkZwYnNHYTFLTWJtV0NDR2dCMkVr?=
 =?utf-8?B?QUdwRGdSNGZTVmI5STNKWWNhQjNCcGZSSnVJMHpLaXBTbnQ3UXA5OXQ4QXJO?=
 =?utf-8?B?WTZDMDkyTllYWXA3YUorUE5lcHBXaUFPTkx1bjNBTlZWNGllS3JRTWxXTEpa?=
 =?utf-8?B?clZ6M1lnTnV5a0lmNVpWUVBEOTdXY1R6U21hVCtMS2ZHN09IMStHc2xla0VO?=
 =?utf-8?B?K0F2NkoyVlUxUzQwWnpKU2c2L0JLZ0RvT0xZYVBqa29NTndjaHhyU3ZPK0Jy?=
 =?utf-8?B?aGI2M0RycS9PcWdiM2VBNlhWMU51Y24zS21tdmV4K0RabU0zZmEwOGpIV1JH?=
 =?utf-8?B?Y2xqMDFEaGt0WlZLdVJYVjE2VGg0SFRVSFVwdzBFK0JvVk5yTXRCZG9KUmZJ?=
 =?utf-8?B?MWR2cjY3eERhTG9NdlVwSmxrNlIyYVgrbTBGcU82OUU0cndvNncvdXlPQVdV?=
 =?utf-8?B?NnBJUVJTSnB1MCtPTmx6NjNjS1l2NDhSbWdlRzhnd002cWJWSENVdWVCUnJu?=
 =?utf-8?B?N2FSZmUxSTFlNFdaNzg0UFBSaGUxdGtUM1ZUV2tRVWROR1NhM29kRmlCQ28r?=
 =?utf-8?B?SW90cjFiNEVremMwUmxZLzdsd29HUFRvWC9sSFl1c2VMNnFVRW1qSWVIZzJj?=
 =?utf-8?B?ZnlhbTlzOGliQ1JrNUt6OFVRLzJZaGNSSHY3b0o5bU1NMHBpQWRDSk9ES1Jy?=
 =?utf-8?B?NlJhKzZ0UlROTk1xYzRTUXk4SG9mS3lhbDZtNW44V0xEaHhWYlRXZDUyNlFt?=
 =?utf-8?B?R05ad0JEOWpJR2pBbFhMdHpPakx4bkdGcDd3bzJCeDBJSWVSQlNCK2M4T1NO?=
 =?utf-8?B?YTR2cloxamc3eGtoTnFIN1BzT09VM1g3V3Z4RW1UVktEK1F2OGdNak4yNm1k?=
 =?utf-8?B?b3hGMnhESTdCeTBUY0V6cFZkYzlJd2ZTUWNIejd3aWt1ai93M1dPUTdoOGs0?=
 =?utf-8?B?dkllSkd0alpWMFZwU1lzc1ZTWGNaaHRjQm5vZzFuZ0x1bXR5d0t5UnpuK2dZ?=
 =?utf-8?B?a0YybUEySnlwbzZJcG5paW5HaHZGZ244ZlB6MEphS1U5aFZ2YXVJMFZIVkZU?=
 =?utf-8?B?QUNxTE84akxmV0Ewd0lxd0xRelFRN1ZvWndndTc1NmdlN2pIc280aGpQUU14?=
 =?utf-8?B?Um9ZRmVDeU41OEFKcURYamZvMGVoRUJZZ05UeDlmRGN3Z3NpRlhScHh2MHNQ?=
 =?utf-8?Q?Dz58pAaQbbVHp4Ng=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d81a0a-ec55-4069-8631-08da50527595
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 11:13:51.8651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sV3WdWluKzBKXfyy8thnaAa2E9gAkVtkxTNaPmOt+G5EQchIpusd1vO6TowdHL73b/JI/aiYeb3x1r64GF567SWrk7vnoDSHfOEbINr0JSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3228
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-06-17_07:2022-06-16,
 2022-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 spamscore=0
 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206170050
X-Proofpoint-GUID: h9y3STc1PXnG6jFE266J0CoCsnH0DREj
X-Proofpoint-ORIG-GUID: h9y3STc1PXnG6jFE266J0CoCsnH0DREj
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/16/22 14:30, Igor Mammedov wrote:
> On Fri, 20 May 2022 11:45:30 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> Use the pre-initialized pci-host qdev and fetch the
>> pci-hole64-size into pc_memory_init() newly added argument.
>> piix needs a bit of care given all the !pci_enabled()
>> and that the pci_hole64_size is private to i440fx.
>>
>> This is in preparation to determine that host-phys-bits are
>> enough and for pci-hole64-size to be considered to relocate
>> ram-above-4g to be at 1T (on AMD platforms).
> 
> modulo nit blow
> 
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> 

I haven't tackled the initialization nit below but I would assume
you agree with the rest of the patch. Let me know if I should still
add the Rb tag.

>>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>  hw/i386/pc.c                 | 3 ++-
>>  hw/i386/pc_piix.c            | 5 ++++-
>>  hw/i386/pc_q35.c             | 8 +++++++-
>>  hw/pci-host/i440fx.c         | 7 +++++++
>>  include/hw/i386/pc.h         | 3 ++-
>>  include/hw/pci-host/i440fx.h | 1 +
>>  6 files changed, 23 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index f7da1d5dd40d..af52d4ff89ef 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -799,7 +799,8 @@ void xen_load_linux(PCMachineState *pcms)
>>  void pc_memory_init(PCMachineState *pcms,
>>                      MemoryRegion *system_memory,
>>                      MemoryRegion *rom_memory,
>> -                    MemoryRegion **ram_memory)
>> +                    MemoryRegion **ram_memory,
>> +                    uint64_t pci_hole64_size)
>>  {
>>      int linux_boot, i;
>>      MemoryRegion *option_rom_mr;
>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> index 12d4a279c793..57bb5b8f2aea 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -91,6 +91,7 @@ static void pc_init1(MachineState *machine,
>>      MemoryRegion *pci_memory;
>>      MemoryRegion *rom_memory;
>>      ram_addr_t lowmem;
>> +    uint64_t hole64_size;
> 
> init it to 0 right here to avoid chance of run amok uninitialized variable?
> 
I haven't done this given that mst disagreed, plus the fact that the code style of
the function seems to place the NULL initialization mostly left to else conditional
clause. Part of the reason I haven't inited @i440fx_dev to NULL here as well (now
i440fx_host. The location we use hole64_size is also the same location we are using
@i440fx_host.

>>      DeviceState *i440fx_dev;
>>  
>>      /*
>> @@ -166,10 +167,12 @@ static void pc_init1(MachineState *machine,
>>          memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
>>          rom_memory = pci_memory;
>>          i440fx_dev = qdev_new(host_type);
>> +        hole64_size = i440fx_pci_hole64_size(i440fx_dev);
>>      } else {
>>          pci_memory = NULL;
>>          rom_memory = system_memory;
>>          i440fx_dev = NULL;
>> +        hole64_size = 0;
>>      }
>>  
>>      pc_guest_info_init(pcms);
>> @@ -186,7 +189,7 @@ static void pc_init1(MachineState *machine,
>>      /* allocate ram and load rom/bios */
>>      if (!xen_enabled()) {
>>          pc_memory_init(pcms, system_memory,
>> -                       rom_memory, &ram_memory);
>> +                       rom_memory, &ram_memory, hole64_size);
>>      } else {
>>          pc_system_flash_cleanup_unused(pcms);
>>          if (machine->kernel_filename != NULL) {
>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>> index 8d867bdb274a..4d5c2fbd976b 100644
>> --- a/hw/i386/pc_q35.c
>> +++ b/hw/i386/pc_q35.c
>> @@ -138,6 +138,7 @@ static void pc_q35_init(MachineState *machine)
>>      MachineClass *mc = MACHINE_GET_CLASS(machine);
>>      bool acpi_pcihp;
>>      bool keep_pci_slot_hpc;
>> +    uint64_t pci_hole64_size = 0;
>>  
>>      /* Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
>>       * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapping
>> @@ -206,8 +207,13 @@ static void pc_q35_init(MachineState *machine)
>>      /* create pci host bus */
>>      q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
>>  
>> +    if (pcmc->pci_enabled) {
>> +        pci_hole64_size = q35_host->mch.pci_hole64_size;
>> +    }
>> +
>>      /* allocate ram and load rom/bios */
>> -    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
>> +    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
>> +                   pci_hole64_size);
>>  
>>      object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
>>      object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
>> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
>> index 5c1bab5c58ed..c5cc28250d5c 100644
>> --- a/hw/pci-host/i440fx.c
>> +++ b/hw/pci-host/i440fx.c
>> @@ -237,6 +237,13 @@ static void i440fx_realize(PCIDevice *dev, Error **errp)
>>      }
>>  }
>>  
>> +uint64_t i440fx_pci_hole64_size(DeviceState *i440fx_dev)
>> +{
>> +        I440FXState *i440fx = I440FX_PCI_HOST_BRIDGE(i440fx_dev);
>> +
>> +        return i440fx->pci_hole64_size;
>> +}
>> +
>>  PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>>                      DeviceState *dev,
>>                      PCII440FXState **pi440fx_state,
>> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
>> index ffcac5121ed9..9c847faea2f8 100644
>> --- a/include/hw/i386/pc.h
>> +++ b/include/hw/i386/pc.h
>> @@ -158,7 +158,8 @@ void xen_load_linux(PCMachineState *pcms);
>>  void pc_memory_init(PCMachineState *pcms,
>>                      MemoryRegion *system_memory,
>>                      MemoryRegion *rom_memory,
>> -                    MemoryRegion **ram_memory);
>> +                    MemoryRegion **ram_memory,
>> +                    uint64_t pci_hole64_size);
>>  uint64_t pc_pci_hole64_start(void);
>>  DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
>>  void pc_basic_device_init(struct PCMachineState *pcms,
>> diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
>> index c4710445e30a..1299d6a2b0e4 100644
>> --- a/include/hw/pci-host/i440fx.h
>> +++ b/include/hw/pci-host/i440fx.h
>> @@ -45,5 +45,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>>                      MemoryRegion *pci_memory,
>>                      MemoryRegion *ram_memory);
>>  
>> +uint64_t i440fx_pci_hole64_size(DeviceState *i440fx_dev);
>>  
>>  #endif
> 

