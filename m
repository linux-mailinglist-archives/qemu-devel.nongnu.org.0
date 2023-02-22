Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500AE69FBB8
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 20:08:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUuSR-0007PJ-Q0; Wed, 22 Feb 2023 14:07:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1pUuSP-0007P3-Qj
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 14:07:14 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1pUuSL-0001cD-Gv
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 14:07:12 -0500
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31MGTFkf030952; Wed, 22 Feb 2023 19:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=eAEkbxxGd69MjPmZH9GuwGMusCImDZ5OP8coZ6Wtcp8=;
 b=u38JB5/z2R2pd0mPlVt+Xs4j1OVAZoQHfQyrn/F86DD8rXfnzOQcvCMtdV/us0Ub64pZ
 1m8hA9+4mMzhHSG+Mb7nkjWXuDTvCD4zP3QLuZAAJI2F8R1zu7kkJ0F9K0DamEpglONl
 gvfFCGpWcAMG/IBeMWZWGm87ljPTSszxhSZgArrlj28v8wQeHgY3BiSqA76TDkfyuR1x
 uqFy0VoR0edHRqz9u+S6zl/g+6AH7qOUs4Bb3GwkREJdK0ZD32csxcjp/0lw+SZGsGpK
 IMbmoSkG/Q+0dL+JnF97yLPRBj9WJ7NxVl0AhrMmPsYzxMYC8DLDjZWm6QJIfALrQizi EQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntpqcguc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Feb 2023 19:07:02 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31MIncHY006871; Wed, 22 Feb 2023 19:07:02 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ntn4dj7s0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Feb 2023 19:07:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4Lq3fd2fnWH6ogB1tmtd7KiKs/xZlwNt10H6epOP1+wn/0pCGmGBVFapwnqYMG+hYeTvTWVA4/pWwvnGlUsV6Sx3bQdnfjfhwNH1NvsZuOvpjrpTYHtsisOefDQS0wHPPfnOdi203a+1RySGjQ4lvy2Ou4NaKGNuzhSbcCcTrCH43MHducAbDEmHBf6wdb1NPBppTOx7/dL/zk7IOxkkpoY3DevnByd8nA5zxjTFDiU0nkJegODsEELVnN2Jh9ZidCRhqsqTm8LcxdGfMz0yga34/G9Vw0U0O2G5GxG5oRuoECF3W25rBOXSN/iSu6MoG6Jyl0PZb/AAGQzzN2Kog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAEkbxxGd69MjPmZH9GuwGMusCImDZ5OP8coZ6Wtcp8=;
 b=LCachnXuovDwdHn7jbpuRbc9cs69flyT2x7PB3vSvZHkSQrL158JepB+bUa1RnS1IFettafTNtvWMgMp1iP67N/+p2VSLE4AaF5cJw9TWi1tnD1Ykasr+fWJK7ibtczEWGxcyK+llvYRMzk+Vs3pAKisc3LQdwPQVF9h/RXWmwaf9rrQHLmPzsWRqljZGWzw6kMCWHZob5mkAEdHypo1+CWjCAsGGJU6CONm/gL/PVPemvSXgG6R626sTMdaoZxekoc84K7SWnNmZBHYGQI60RVkE5/JUyYbkzGiuxpa0cNAunX4NdNgvjIWl3ambR9XgCOVjCAiQGTh1SMODByd0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAEkbxxGd69MjPmZH9GuwGMusCImDZ5OP8coZ6Wtcp8=;
 b=ip7FLOw/2GXRg5fxx5CAmkLRYSc6rcuZPv6Sp7uVpgIsO0QuJ+ePGwVQWXBOI0cK9z38MkkUaL+ljXSgBnx0t2Ma2ORNRpSVUIQyZghoeRaquPZ0xWaBQrc51uMm4YMNZzjxV/Kcf8C6OpcTtDsxEiRlF7ktM1nCuqtmz3H0I+0=
Received: from DM6PR10MB2523.namprd10.prod.outlook.com (2603:10b6:5:b2::27) by
 DM4PR10MB7427.namprd10.prod.outlook.com (2603:10b6:8:181::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.19; Wed, 22 Feb 2023 19:07:00 +0000
Received: from DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::ad99:51ac:ebaf:e7a1]) by DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::ad99:51ac:ebaf:e7a1%4]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 19:07:00 +0000
Message-ID: <da21c1d2-8e9f-ddf4-a03d-98bfd3d7ba1d@oracle.com>
Date: Wed, 22 Feb 2023 14:06:56 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v1 2/3] contrib/elf2dmp: move PE dir search to
 pe_get_data_dir_entry
Content-Language: en-US
To: Viktor Prutyanov <viktor@daynix.com>, pbonzini@redhat.com
Cc: viktor.prutyanov@phystech.edu, yuri.benditovich@daynix.com, yan@daynix.com,
 qemu-devel@nongnu.org
References: <20221130000320.287976-1-viktor@daynix.com>
 <20221130000320.287976-3-viktor@daynix.com>
From: "Annie.li" <annie.li@oracle.com>
In-Reply-To: <20221130000320.287976-3-viktor@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR01CA0065.prod.exchangelabs.com (2603:10b6:208:23f::34)
 To DM6PR10MB2523.namprd10.prod.outlook.com
 (2603:10b6:5:b2::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB2523:EE_|DM4PR10MB7427:EE_
X-MS-Office365-Filtering-Correlation-Id: e10e3e83-473e-4601-ac9a-08db1507f9cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uk71jPpWMRBdlLz/StSJohq0azCNO5+ciXCj0GMFHChNyjVzISfd8cgWb8AbJDVn3J4DvKGoGUkMIxQiCmTwZdlkG0dvccC/BJblAXgJeEkJxr1tYpSftla/iTP3GxKflSb3LQHjaDwP9hAciIgiRKwTwgR5/tECL8c356CyW0fWYivACOePPxkbNXInIbnRIbeXsA99OUrL9B5alyzIQX8XLQNdVZ0wGHP7Rn5LipolDJTnKc8SzZjF2rZz1SKp+14QEZobpy/vZa9mu39YIllOYQfkws9Ksqm8seFEZUlCnE7iloStlSj9bo1uQ4QVrRlp5IBiAwoqW6eSK/ykI2CCT9Vre9XbQxp/69JXFgc7zP2E8yz+meP4okjy+0e7umquDbmlVrZ4kt2bJAwFR3vSBO+Y68zUo4EStV20uhi9U2/jMEV+p8epuQj7PDvAK1gnhzvmJ3XxUyKgeqdKx9/+5wFRFAw8P8OW9JgZbgYE96nlFf6jlIJQLR/LdMqzGahhEfEJ37Gkf9ux/jfaU+J0kP30Uox8I7UIRPWbA1cO8lIOCq8Qa4u3ih12YBedfY0h7ODj1XxfJDuilSG+phL0/SAcaC+LBAc8d4fM5YhflEYnUjwFe+lsArszcphhZBeBYvnTF0hDHLPOTgm6pXlIfnYuc4ABWCEC4JrtgCFc2DBZVmUHlfkb3px6zaQxJDHGXZ/hspaLJ49y5/Koy8CvHDZgCo9Sa8eJm1PIQfw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2523.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(39860400002)(396003)(136003)(376002)(366004)(451199018)(36756003)(83380400001)(6506007)(6512007)(6486002)(53546011)(26005)(186003)(478600001)(41300700001)(4326008)(2616005)(66556008)(8676002)(86362001)(66946007)(66476007)(31696002)(8936002)(2906002)(5660300002)(38100700002)(6666004)(316002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXJ5eXpZTVVhTG52cVpua0IxZXhnelIrWS9jdXNiVmU2dWRtd2JIK1dUakRy?=
 =?utf-8?B?RU1UVzY0OXJSQzY4Snp1RTgwQVlwQTFYR2VqcEdsbjNGWWdzaGFucTVuL0V6?=
 =?utf-8?B?RnUvM2ZlWmRMZTMzUHkxdXgvWnpic1l5MFF2ZDFtVTVnbXdOSDdhME1WZ3FL?=
 =?utf-8?B?cEVyaVpQVXZFdjlKbkplcjdTdElKTFcvR29rbEYzQWlweEIyaG9wMDFreE4v?=
 =?utf-8?B?YktobnBqT243RTUrWHNYUmJWVEYreUtVQzZXdFY2SmplSUNkWCtRWm1HMXdE?=
 =?utf-8?B?UDBzQzE0NVdWcEMzamtJZkhDdXRYbUZxL0N2QjlMdFptVTJaTEg1MUpFS3JX?=
 =?utf-8?B?b0JXaGxZZm9SWGtCVTVrTHJVblBJTkEydjM4WlRPZHNkeEpQalBTZVB6VjdN?=
 =?utf-8?B?cldRWTYyb28vc0MzSnZMbHpuN1lKWVd6RG5Rak5aNjNrMHczWkpPQ01rNEdn?=
 =?utf-8?B?Z2EzUCt1R2J1QUsrdTNLQ1QvZFhSaTJkUjIxd1JMQTl5eC9OdDBJOFRmSUsy?=
 =?utf-8?B?S1JXOWVYT09xY1J0RGFXUzNxZERUOUQySFVCTFJjcjZ5ejNzb3VPNjVrTElP?=
 =?utf-8?B?SUsxUlA1QkJUODk1dzM5Q0ZsazIzazh5RFpBWFBqczhnUzN0Zllsb3lPY3VW?=
 =?utf-8?B?UVVqZnZvSS9aOG9XUnFXbFErVGJOY1k4ZUFSYXN3QnEvbnpibUdkYStESmN2?=
 =?utf-8?B?TEdPTXN2Qjh2d25TeE1pUTBZSUZTaHJjNUgyb0Z1MHBUZEwraHhKVytaRkp1?=
 =?utf-8?B?Y2thalNmWXA2SDh0bG1XYklTSy9GcCtLQXZuVlo2UkNCTFRQQmljU2NTWTUx?=
 =?utf-8?B?eFAwbVlNdWNPcDVCUG5xMmw0dkVzWkdYNnNtU3dVUGkzcllGS1k3U1dKcFgw?=
 =?utf-8?B?WXBUOU9PcWRlNmVrUml4b0RCYSs3RGZFTnNEUzcycDQ3UkU2TDBGQms5UFdE?=
 =?utf-8?B?aCtubktRbUlZTkl1Rks1cGkwNzJob01mQU9Ud09IcjVhdUp2ZHVFNkpGRng1?=
 =?utf-8?B?TWFlbUlFeEc5bTJKaE9lblZZdGo4STVjcXJVYUJxdVdncHB6clBPVG9ObGtl?=
 =?utf-8?B?ZnJRamlmQ0FKdStEMHpnc0xoU1AraGExbS91bTh2SWt5Y3FDT21YRTlKR2t2?=
 =?utf-8?B?SzFMNjZUaUFzM0xnMThkODNudCswamNLUXAwL3FVaDRXcWpiUDVqZEE1ZXhw?=
 =?utf-8?B?WUYxYzJMb1NMM1ltTEY1QURjcWFPSnZXSTNwWE1FUEw5cmRLSTRUVm5DQmRE?=
 =?utf-8?B?K0NFSWRkUXp4TkxSdGlhUFYybHZ4SGM2bWNITHRmQlQxb2F6NElLQyt2M29n?=
 =?utf-8?B?RC8rVnZwelZnOTBFWExjNUtYdXA3UmlBN1RES29oTTFkd0VtTFFLVEJVcHJk?=
 =?utf-8?B?eWZVK2h4YWZZaVlqM3UwSHpZZXRIQlNVTUloR092bXRCbWpqSWRRaDg4b0wz?=
 =?utf-8?B?M1FxSDJiaTJVWHFtSnQrYklESUVscUxlSXZtemlxRFhVSmFVMHBvRkk5TmVU?=
 =?utf-8?B?OHVPYUxCZGNDelVUM3gyd3dLR3JMem1nUElYbmFzNElFMXV5QWJGa0NZUFpX?=
 =?utf-8?B?NW9JWlo2K1JJWGEwUTgrTHBPVGZES2pIRjl4clpsazBzRlkzVzU2dktYck4r?=
 =?utf-8?B?WTZuckUxN2FhZHZ4RzZkMGpNS3pHTkp4T3pFNzB0VWlDVTNneHdOSGFCWlY5?=
 =?utf-8?B?dldJMnJwY2R5c3lON25mOUNuNmYwREFHQW0xZnNLajd1aHB2MkZ5MVRETi84?=
 =?utf-8?B?V1hXUGhEQkUvT1RrcTBOb0Zmak5PVjFWMkhkNXdxNk14NW52V0RKbmp5S2Nl?=
 =?utf-8?B?WDJPaUkxMVZ5cURiTE4yc3UvYkcrVDhhRGRMamVRWEw0SWNRYThVSTRXUHZE?=
 =?utf-8?B?TUhWMG80UVFVL3BxeGFkU3l6bVEwdXVHUlhvZ3IvWG5wdmI3MkQ4NTN5TCt0?=
 =?utf-8?B?dEZWS012NGh0ZUM5Zk9hUVpVN0NJN3Y4ZUtDQ1BRSWFzYlZDdU1UMXFOK3lp?=
 =?utf-8?B?QWFjTnVZRFR3dituQnlxbDJhYlp2WHp0TDdaRDRVZy9VWFdteldRbWgxZHcw?=
 =?utf-8?B?cWlYSmNDdW44V1hlaGRLSTJmWE1QdjdhYjNHbGdGR1YvTkJST1VNQ2dpZUNP?=
 =?utf-8?Q?FkVnsENk1MvbLtpTgNxF91mod?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: GDCTWrotf1KnoHCN4Fe4yUWSYsrkV9EuyxJ3xC6LLZbFQzauT+pRKnuEynADrIqX6d2VhIbQERmqQ8ormw++cNtZtUyep4x5BMNvKEg3BiW1Ft/99lMDVLn2HslyGYQV3OKuRU/FMGLZU0MYdkwo9xvgfdKQjieC3GHScHZVoZaYWybUvxv97bYj0qZr5aHD2Q0X0L/puWp77r0UAu+PPL7D3M7yh4Fa6NE92StG3qIpsbcnFloVY6I7yCxiUzgwr+45WixFqDr9Ot2KX201BZ8WdtNPsE9SA/V+KWyS+Cd+QtjpiHhfS5wu1FnVm3vgzeAR0UAPgQDBdO5J58PxItnaXNLoV5Cv60ipyKnmWxB6PkIAuhHGJjSUlfq3IpCI1ui7b+OOSlvIhsyVJwDq/bqk2OBSlVMYH/Bvb37JscyhRsRpEZlRRXa7yxZr7Hn3u0VqF1Da8YpokUYT+c/xVpqDrrekkdb5pj7S3DRc8AQcWnYdjtMPmdKhOMVqrBQownVUoJKLKMSj8T1BdAB6AX3Usni5m87UFNHz7odhxxPZqmuUmrlImBiSPHd/rG9nSTHbrd2qr8InHgf1mgt2v1yxF9D1id3JBMcYLMNRqcfTHT7HbPe3p1pfetvM1il/nIJlL2EqpXVfM0UP6LD6eJQ0DulLSS1taSAnUVuMbvVfCNffC7FhstCGaRAhZXopwF1w4bU+CBLOvMAbmc6JCZW3mccUo3ZeucXI97VH7LgiJQ56QRjupd1eKP2JmHhA4vXgSZbou08aD2GTFDbUnV4YwB5eYP7L3d4GVTykRwhi5hE1C2Slf8UGkw1/xPzcDsQA23ojDA6QGfI+4B3Lxg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e10e3e83-473e-4601-ac9a-08db1507f9cf
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2523.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 19:07:00.5335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EVw9n4qj/tHPjPTxf4Nb8RY3Ws7ZbQO6bEXi8ksQleXXzlYSZrK2dDlHkv7rvyvggyiiHaYB6jA+nJmrbd2+wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7427
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_08,2023-02-22_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302220164
X-Proofpoint-GUID: gxfpecvKavGSZwdr7-qTPCK9eESg57Sk
X-Proofpoint-ORIG-GUID: gxfpecvKavGSZwdr7-qTPCK9eESg57Sk
Received-SPF: pass client-ip=205.220.177.32; envelope-from=annie.li@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello Viktor,

See my following comments inline,

On 11/29/2022 7:03 PM, Viktor Prutyanov wrote:
> Move out PE directory search functionality to be reused not only
> for Debug Directory processing but for arbitrary PE directory.
>
> Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
> ---
>   contrib/elf2dmp/main.c | 66 +++++++++++++++++++++++-------------------
>   1 file changed, 37 insertions(+), 29 deletions(-)
>
> diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
> index 9224764239..f3052b3c64 100644
> --- a/contrib/elf2dmp/main.c
> +++ b/contrib/elf2dmp/main.c
> @@ -333,6 +333,40 @@ static int fill_context(KDDEBUGGER_DATA64 *kdbg,
>       return 0;
>   }
>   
> +static int pe_get_data_dir_entry(uint64_t base, void *start_addr, int idx,
> +        void *entry, size_t size, struct va_space *vs)
> +{
> +    const char e_magic[2] = "MZ";
> +    const char Signature[4] = "PE\0\0";
> +    IMAGE_DOS_HEADER *dos_hdr = start_addr;
> +    IMAGE_NT_HEADERS64 nt_hdrs;
> +    IMAGE_FILE_HEADER *file_hdr = &nt_hdrs.FileHeader;
> +    IMAGE_OPTIONAL_HEADER64 *opt_hdr = &nt_hdrs.OptionalHeader;
> +    IMAGE_DATA_DIRECTORY *data_dir = nt_hdrs.OptionalHeader.DataDirectory;
> +
> +    if (memcmp(&dos_hdr->e_magic, e_magic, sizeof(e_magic))) {
> +        return 1;
> +    }
> +
> +    if (va_space_rw(vs, base + dos_hdr->e_lfanew,
> +                &nt_hdrs, sizeof(nt_hdrs), 0)) {
> +        return 1;
> +    }
> +
> +    if (memcmp(&nt_hdrs.Signature, Signature, sizeof(Signature)) ||
> +            file_hdr->Machine != 0x8664 || opt_hdr->Magic != 0x020b) {
> +        return 1;
> +    }
> +
> +    if (va_space_rw(vs,
> +                base + data_dir[idx].VirtualAddress,
> +                entry, size, 0)) {
> +        return 1;
> +    }
> +
> +    return 0;
> +}
> +
>   static int write_dump(struct pa_space *ps,
>           WinDumpHeader64 *hdr, const char *name)
>   {
> @@ -369,42 +403,16 @@ static int write_dump(struct pa_space *ps,
>   static int pe_get_pdb_symstore_hash(uint64_t base, void *start_addr,
>           char *hash, struct va_space *vs)
>   {
> -    const char e_magic[2] = "MZ";
> -    const char Signature[4] = "PE\0\0";
>       const char sign_rsds[4] = "RSDS";
> -    IMAGE_DOS_HEADER *dos_hdr = start_addr;
> -    IMAGE_NT_HEADERS64 nt_hdrs;
> -    IMAGE_FILE_HEADER *file_hdr = &nt_hdrs.FileHeader;
> -    IMAGE_OPTIONAL_HEADER64 *opt_hdr = &nt_hdrs.OptionalHeader;
> -    IMAGE_DATA_DIRECTORY *data_dir = nt_hdrs.OptionalHeader.DataDirectory;
>       IMAGE_DEBUG_DIRECTORY debug_dir;
>       OMFSignatureRSDS rsds;
>       char *pdb_name;
>       size_t pdb_name_sz;
>       size_t i;
>   
> -    QEMU_BUILD_BUG_ON(sizeof(*dos_hdr) >= ELF2DMP_PAGE_SIZE);

This BUG_ON gets removed due to encapsulating the code into function 
pe_get_data_dir_entry.

Any reason of not keeping this check in pe_get_data_dir_entry?
> -
> -    if (memcmp(&dos_hdr->e_magic, e_magic, sizeof(e_magic))) {
> -        return 1;
> -    }
> -
> -    if (va_space_rw(vs, base + dos_hdr->e_lfanew,
> -                &nt_hdrs, sizeof(nt_hdrs), 0)) {
> -        return 1;
> -    }
> -
> -    if (memcmp(&nt_hdrs.Signature, Signature, sizeof(Signature)) ||
> -            file_hdr->Machine != 0x8664 || opt_hdr->Magic != 0x020b) {
> -        return 1;
> -    }
> -
> -    printf("Debug Directory RVA = 0x%08"PRIx32"\n",
> -            (uint32_t)data_dir[IMAGE_FILE_DEBUG_DIRECTORY].VirtualAddress);

Or add common log for both Debug and PE directory instead of removing it?

Thanks

Annie

> -
> -    if (va_space_rw(vs,
> -                base + data_dir[IMAGE_FILE_DEBUG_DIRECTORY].VirtualAddress,
> -                &debug_dir, sizeof(debug_dir), 0)) {
> +    if (pe_get_data_dir_entry(base, start_addr, IMAGE_FILE_DEBUG_DIRECTORY,
> +                &debug_dir, sizeof(debug_dir), vs)) {
> +        eprintf("Failed to get Debug Directory\n");
>           return 1;
>       }
>   

