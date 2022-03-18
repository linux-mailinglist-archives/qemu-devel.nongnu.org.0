Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA96F4DDF9D
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 18:08:18 +0100 (CET)
Received: from localhost ([::1]:43144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVG5J-0003j6-Sq
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 13:08:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nVG1f-00085n-G8
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 13:04:33 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:30590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nVG1c-0005qy-Rd
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 13:04:30 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22IG1Mku001718; 
 Fri, 18 Mar 2022 17:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=D25NVEvTuGDtTX++uMhBVMR+bgeU2UtxMhFLOhci27U=;
 b=BF6mNMFc/dtcAecZil7ZZonCk+IdiJ2gWJNrlzPL8Kx+tXTWXA0GTixq6a+nJ0IEggyO
 k1uoOneyZ7RNIHpcux477Pux0A8NSRtHqiVeOai07PZQOo0qUlgVqPzUzkJ4OBd2yxa2
 AVXFS0d7xQ6Ta4DRLuQtqt8l1rx0zRvj7RGGbaPswrOZUXNYjTGHcEe7TbOyy7s+tJP+
 jjPFJhDUXjheOt27TPZxn0amwjiR0JE0OsDiVbb1IKauSU6Eu2mrDlKUyC2Ng1fczSGJ
 Gn7W/oAiWt4lCjOn1zELjD/GIzyuVVWTGNXxZ6GMWkRKlMPKdcre5voN9SBwueCSqUst EQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3et5fucmwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 17:04:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22IH03rF062201;
 Fri, 18 Mar 2022 17:04:23 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by userp3020.oracle.com with ESMTP id 3et65abx14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 17:04:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mlnXqlRKinJljpmoFKVA4rUIY6VnIg1AfYzz+pMijZer2GBX0T+RiecGsRP4zJOwfu1OpvBbRAyf2vNtbgkbn2VNR0b3tzD770o0xYzYYtpjkYXomwtyj7pL3EH9sDxsKucnJjw5mJkMAzqCjcP2JXM128Zv3/lIfoqrMDeMn0A3xh2PQW8sdAS+ircjlmvmadc/HyIgwSbv5F0xDnwyz2Cw4S2ZmouyZ89IwQIKqEruUEwUyRL/NbUeK3qdn730XCZw9U64NxHkeuXQx3Yjyn2/vkcXcF+8chdUmwhY56dWsZN+lIW6pYo3ozPfvJxn3SiXGeyXhRghvCRZy8nLLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D25NVEvTuGDtTX++uMhBVMR+bgeU2UtxMhFLOhci27U=;
 b=VnDzCB1HFfQArjJBfdP4mRAy641Ae4ZsQD5e3CkpN5hFqwY6uWJe07DFixJZa6AT07qdcXtFQzjoAWZ+cPOyxRyMbHcszsj28iEQ3UYl68rxX7S04g/pMq1BtTdTV60mVeVQiJnD7k0asLI74iOyH/0sEMXu6t12VVlgCM0CzhyRGRnDcREwrkIvkGvPLvx/KqkuxM6Pp6oZVcGU7zjYrC5NtIn7KooqqH2oIhvJSvqGnygW1LIQkfeAKZh0asv8qNDhsjVHbJuX34HPeoeOsVs7oiUYjv1aFRgDHihgWcfDAuttlLAQEBFmvDQ7iQE/czJG/6RPou2h/U6V0HLuCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D25NVEvTuGDtTX++uMhBVMR+bgeU2UtxMhFLOhci27U=;
 b=pHp+1p20j0IgLp+/fa0JGIS8kxD37SYTf9PWkYcKZAoALunRIY8iZ46tm/lY71jwb/OMT7/umTgZROtoTrTcucTFQe9aBge+RMH2EG9GY6dWFsBjTeEOxQDJ1nXl+6RKRI40JHfk5zJvc6LgV7L3jul6waoxkqVRqGs2lncg9+M=
Received: from MW5PR10MB5825.namprd10.prod.outlook.com (2603:10b6:303:19a::11)
 by CH0PR10MB5308.namprd10.prod.outlook.com (2603:10b6:610:c6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.16; Fri, 18 Mar
 2022 17:04:21 +0000
Received: from MW5PR10MB5825.namprd10.prod.outlook.com
 ([fe80::5915:58a8:f9b1:a71e]) by MW5PR10MB5825.namprd10.prod.outlook.com
 ([fe80::5915:58a8:f9b1:a71e%3]) with mapi id 15.20.5081.015; Fri, 18 Mar 2022
 17:04:20 +0000
Message-ID: <967828b5-19c2-fc64-4045-659c1f2f1ae8@oracle.com>
Date: Fri, 18 Mar 2022 12:04:17 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 5/5] i386/cpu: Free env->xsave_buf in
 x86_cpu_unrealizefn()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 qemu-devel@nongnu.org
References: <20220318151555.381737-1-mark.kanda@oracle.com>
 <20220318151555.381737-6-mark.kanda@oracle.com>
 <66dc469a-6ba7-055c-1d5c-ac22c42ced35@gmail.com>
From: Mark Kanda <mark.kanda@oracle.com>
In-Reply-To: <66dc469a-6ba7-055c-1d5c-ac22c42ced35@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR03CA0102.namprd03.prod.outlook.com
 (2603:10b6:5:333::35) To MW5PR10MB5825.namprd10.prod.outlook.com
 (2603:10b6:303:19a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e89866f3-11ef-451e-baf6-08da09015856
X-MS-TrafficTypeDiagnostic: CH0PR10MB5308:EE_
X-Microsoft-Antispam-PRVS: <CH0PR10MB530800B56A5CFC4E30FB8483F9139@CH0PR10MB5308.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bx1E/BaMp/IBnQf00m0LZDalSe7iGzIoKGGfs/WuQfCncWY2t20JXBTgJe3INpzsh3JLCugP1EgW6QdBKHor1nTMGAPBVr/6CUWB6NTSLlssyHuUK7CxdaGC8TW/fJDeqgSq9/JyrNk82RYNw3zBPo+x6QlpswBApE4Xvvztu6vCa3GunDuebEleCxhDMQKJ+bgBKLhBJkjj5dWWbcV2vDAyfGJOrI0cPrzcyaWuIjjXKV//qPShKoXcLa8fk9SrrQrfQy4wUlDyGIT6b8erEtitGfiVMQI54D4qkoKkK105OcdKnmxycDY5KYmwNUnK+rOpzwL51l9Umc/C6UPvy3Y6g9vLRJF84pCA4wxeRghr2GYFVsjsK9QwVpKGzKneo5QOiqARq19jLtR/1kmvsy05qnEAerMeY1j8YFCySyDWD++SR1EU+KGK8N5ddB04vAkvKKMlfMP6cJHKCpLRxAjSXc08QsfxagEK632ZUn/KmfyJ6zZmoCT+z4W1GnbbNtYUavZYh8Ri0i+o7bz7zDU+MPBIWczAlx/0q8YlmftTL/Yyz93jMUlOH/mWKQyDp1Eu1CfwBsehcWgZvCDElh/ZcKiZyD6/9raZ+94FzaO+V6EuaTtgXAANgswXnNbHDGtRGP5s78jKQBN3JWEMoFfX5OXCVPuhqB63ETAVKCZqzoiOvzPtQ+qVBc4IBKWfZepsXIXhvuoSCg4ACu+NJ9NU4AA2w9lyuBGpZqXmN/FAc5cpVL/Da/9WlDUXR+6Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR10MB5825.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(44832011)(2906002)(31686004)(4326008)(36756003)(66946007)(66556008)(66476007)(8676002)(38100700002)(5660300002)(8936002)(316002)(26005)(186003)(2616005)(86362001)(31696002)(508600001)(6486002)(53546011)(6506007)(6666004)(83380400001)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlFZYTY4UWNCNnAxaS9BVThmYlczeGgrTlM2ckVsd29LKzFwRkl4TXlMb1RO?=
 =?utf-8?B?TlR4U0szV1RCRTJ1YlVoYXlXL3pyQ2hpOGQxbTBnV3JEMktTV1d3NEhnVVRx?=
 =?utf-8?B?U3BIRFV5dUowSXB0ZmRsR3RkMHkyUVBxUXMwU2EzQjVCN2hUbTRQMUtROUk5?=
 =?utf-8?B?aUJORnRucllyT1hTUHNwb0h5NjhiYmRoOVNOaXlwRWUwV25BZ2J5ODNiSHJP?=
 =?utf-8?B?S3JpM0FtcVJOVFhTVVJUSE0xcTNURmtxYVpPOXVtWFk4cUhENUZmcTlIWWxs?=
 =?utf-8?B?Y1Z0c1F0SHJlK1NzOEZWVDg3MVNxdER5UGNrSFRLQ0RxYTFQTHg2Z2swQXFR?=
 =?utf-8?B?cmQvTjNXYTlMUHBKZ0p3dUwwbmlLNDVicFhmQ0k3VFBWOUtHcldTL3RlUGo5?=
 =?utf-8?B?NytReTlTUlpMbG1aSjcvQ05XeVBRZVdsWWZnZ2lVQXFzbzJvL1pQcXJkcW9F?=
 =?utf-8?B?QTZVV3FGaFc1ZnREQXdxc0pXcWFZTWVQM3p0OFowOU51Qjh4cnlwWTNPMnAv?=
 =?utf-8?B?VEpCRDlJUlFYVGJFaTRXMG9DVWxNLzA4QU9jWkQvK3ZUQUl6NTBycVljNzhS?=
 =?utf-8?B?aVBwazN6cWRzY0NGU3crd0RrNTdZTEowNzhPWGlabFhJWVpsd0VkaFZYVXVr?=
 =?utf-8?B?NUxGOXN2WmkzY2c1VXFyMmYwZWI3TE1tZ3k0TXRNRGtFTUVFMnF0RXFVUWtx?=
 =?utf-8?B?ZDRtUVlXaFRMM3hhL0NUZU1YVTR2bENKaFVhMkQ1UGlZM1UzK2I4ZkZRRk1Y?=
 =?utf-8?B?S1VReE4rQnFNTmhuTldZNVFHUmxNK2JIbGNEdFVqWXgvcGFtd0p4WmpZbHo4?=
 =?utf-8?B?ek9hNElvV21lVkNPOUh5UmtLUHBoL1l0Wi9LNDRHQ3pkYkJ0RU9QTmlXV0dr?=
 =?utf-8?B?Yy95VDJ0TWJSNDBIUnliMmRRdFpiNFhPUyt2d3E4V05BRm5GYmlZZGVmYzVo?=
 =?utf-8?B?V2JkMEdFKzNsaGkybHNxZGJoNUZTV28vcDBzSGtBV2VvMWpjOGJoUy9pKzZs?=
 =?utf-8?B?R2NtTlRyM0xoU0ZON0xVcWFrODMzemFVWTNEdm0zbWhSTnpUQ0ZqV25BdGJU?=
 =?utf-8?B?Nzl6WUpQV1YrUyt0V0t5QW04Y2REd1FLREd0ZURqMGMyaVhDempsVE8zdnNR?=
 =?utf-8?B?Z2lMNEVyODAxMUV6ZFlKOTRnWUFhVFN5UlZ6RjhLKy9TWi9lTEdGdXlqUisx?=
 =?utf-8?B?OTUzaTlPdUN3Ykh3YWdrcGFjUit6Q2tST0dpakVBeG4yZlhPeXJ2TVQ2MXVD?=
 =?utf-8?B?a3J4R0lOa1g2R09UNUNRZzNaMitRQ1QxSUNPR3d4K25LbS9VRFgvbmg3L1ox?=
 =?utf-8?B?blVVajhuSDMyRy9QWm84RE5KR1luQlhYZEtnanQwYk9aOWlPWnJhNTM2djlE?=
 =?utf-8?B?QTZLa3RTUDAzang0QUgwMjZMRndNN1RFYnMwbitCclVuTkt5YU90RSt1MTBu?=
 =?utf-8?B?YktKeXk4UGFqRUJ5b0NUdm9jNUlPT3lEeUJybWtGZTd3WnVkc2owMy9tczZV?=
 =?utf-8?B?SjhEcUJ0MHRYKzV6OTJrN3diNWFUZ3NlbWcwY1B0b3IrL0c3d2gwZGF5bjZ0?=
 =?utf-8?B?M2pONStXWFZKcndsVXJ3OVVuSVVmSVBSV1BlM0paS3dqOHVlRGNSNWpCUFdp?=
 =?utf-8?B?MVBYVElENjAyUll4N3cvRnJXMTJKbmszNDUvNUpsWEpKbVRvL0dBMDRBdEx0?=
 =?utf-8?B?bmJWYXJnZ1JyaE1Dcmw4MkVOT21DYlJNZk5nVXFPNWVTbzM2TGhFTFNEdkVS?=
 =?utf-8?B?bGQxa21GWGIrRlp1UFdVeGF3a0gvaG9iTkJQdEVrcmhkOUJOYUxqU2RVZUNY?=
 =?utf-8?B?dVV2ck1sUHlqTDVVQW9IN0VqUS8xK05GWktBVStjZHVJQVhPdE1vMThlbmtS?=
 =?utf-8?B?aUZhblJhSnVCSThRWTRKZDE2UGVQd2cxMjA5bjRIV0xjM1d1MmJzeW5WMUY0?=
 =?utf-8?B?enpJWjlvaFB1cHFENUdlLzY4dlkxcldHZFpDb0FyQUZVL05ocDB6UThCeTdp?=
 =?utf-8?B?V1VxNmFKMElBPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e89866f3-11ef-451e-baf6-08da09015856
X-MS-Exchange-CrossTenant-AuthSource: MW5PR10MB5825.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 17:04:20.9136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AcwB7P1ZaF2GDglKJeKPQMmD1Ss5Avi1Lw/0AZo1l2/bv/D+LzO+sgeIl86BQgMAnhnXZfcUU4PhXFqD7HxB6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5308
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10290
 signatures=694221
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203180090
X-Proofpoint-GUID: O50e8thNPOet7CMgv-099LmKYHZm19gK
X-Proofpoint-ORIG-GUID: O50e8thNPOet7CMgv-099LmKYHZm19gK
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/2022 11:32 AM, Philippe Mathieu-Daudé wrote:
> On 18/3/22 16:15, Mark Kanda wrote:
>> vCPU hotunplug related leak reported by Valgrind:
>>
>> ==132362== 4,096 bytes in 1 blocks are definitely lost in loss record 8,440 
>> of 8,549
>> ==132362==    at 0x4C3B15F: memalign (vg_replace_malloc.c:1265)
>> ==132362==    by 0x4C3B288: posix_memalign (vg_replace_malloc.c:1429)
>> ==132362==    by 0xB41195: qemu_try_memalign (memalign.c:53)
>> ==132362==    by 0xB41204: qemu_memalign (memalign.c:73)
>> ==132362==    by 0x7131CB: kvm_init_xsave (kvm.c:1601)
>> ==132362==    by 0x7148ED: kvm_arch_init_vcpu (kvm.c:2031)
>> ==132362==    by 0x91D224: kvm_init_vcpu (kvm-all.c:516)
>> ==132362==    by 0x9242C9: kvm_vcpu_thread_fn (kvm-accel-ops.c:40)
>> ==132362==    by 0xB2EB26: qemu_thread_start (qemu-thread-posix.c:556)
>> ==132362==    by 0x7EB2159: start_thread (in /usr/lib64/libpthread-2.28.so)
>> ==132362==    by 0x9D45DD2: clone (in /usr/lib64/libc-2.28.so)
>>
>> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
>> ---
>>   target/i386/cpu.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index a88d6554c8..014a716c36 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -6572,6 +6572,11 @@ static void x86_cpu_unrealizefn(DeviceState *dev)
>>       }
>>         xcc->parent_unrealize(dev);
>> +
>> +#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
>> +    CPUX86State *env = &cpu->env;
>> +    g_free(env->xsave_buf);
>
> This belong to hvf_arch_vcpu_destroy().
>
> And for KVM, in the missing kvm_arch_destroy_vcpu().
>

Will fix in v3.

Thanks Philippe,
-Mark

