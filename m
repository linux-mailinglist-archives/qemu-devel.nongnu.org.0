Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B6B6115EA
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 17:33:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooRKc-00045X-BL; Fri, 28 Oct 2022 11:31:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1ooRKL-0003rH-O4
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 11:31:25 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1ooRKG-00087K-Dd
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 11:31:21 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29SEgNCV011144;
 Fri, 28 Oct 2022 15:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=N3fRGG199NcycSiOW5rPDmt22rhp8DfCzjFI9n7L7JA=;
 b=wlrpLCT9H3MtUNkw3SU4tAf+hxBFJQIMPERXmrQQk/D8EOa2Jy0d6ILkSXbU8npjkyZv
 pRZtM0RM8YWH/CsXad0R4MJIlmomynKuHvw0yaUTrvo8/CuYPApNs7eJJuiN03lcNBzn
 CedsRqYAIWKQf5gmMGyWeP/Kd1ruv4HpTwlzvxYH/PqTbGTgd8yhSdh4ioXZURAQjpXG
 FP3Ualx0tH3eR+YINR5wJxYDXOxVPEHDqpDrX+fjGK/TjSKHYnO16tz7twBqw1RHQm/g
 gV2n/rMWLL3LEJQ+blk2tw5PaR7Q9Lv9edj3rBjXPlMXq/3tSezMfBWsm8g/nyLNPBUN gQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kfahedpc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Oct 2022 15:31:11 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29SCb9t9006906; Fri, 28 Oct 2022 15:31:11 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3kfagj5r15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Oct 2022 15:31:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaTh7P3NDb1JC8sDOMKWqxkaLUQMCwCWCYIWEEoTTyiVYysN8fLOo3Bl4jdqiAjuZvlDlasrYzMS9vpGwoxAaLNkkTh0uEMesrEFRH/R/I+w/3mLQ8PQ3TlNajbp01zM06I4b8tWG1up5rhpZ9cVK+VXarVF9v/qYdSMEtM0G39THqAtWp0gq0FiaKE6EyXC7gS9eB/uWa1Nxd417FPC1mIPhcekvwLEGZUkDEivQ2EGxA3dfd4gF5dIp19qant/pCKqfWpozOUoqm7BbYkLAuLEtUzIO07fJclySQYn80Md3iYY87NJ6i5Tqu3WVnNTG95rwi1L4OfseCyg0oHs6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3fRGG199NcycSiOW5rPDmt22rhp8DfCzjFI9n7L7JA=;
 b=f6eQVAM02jKVQ1CkbxyxlOE9ufDS1JuPPs9yfZLyjrlht3oMVeP9HimhpTm+42HWlEuOu8motYlSh8KqKwgDL6Km1yOOQSAaYX/QCvDvVT+jBKxWy+sM/dtnq+Wm/UgJQihw8AvWPlVt+T99Ba+RchH8Ez9ni2JnWc0iNwDmYh5kes5FRy6AhxXefG2YJiikAGkrzIILNNpahp+RGJAvop6Zlb/6hbfPDluLQpUT/eXmXMGnRUHU/2kiNUgD8SQ1ujhANSyfM7G/SCtteLd1TJJ3o/xjt4cxd+OswVPITnht8e+lcn67aFTCXAiXIl0we150hUCtvTG120k53iPF2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3fRGG199NcycSiOW5rPDmt22rhp8DfCzjFI9n7L7JA=;
 b=R+2/FTppLNxJDmBpvC1vPwppp62ipLap5wfwuz1J0UmMBTGrtgGNlCy56oJJBHF7eUt+OMc4avKxhyAwfshiHe4upsbyg1aScWWnm47mVd7vqSh1LuTStt6hJ3G2VJeg4RJoMojyen2v8IGf71xY5gyMv8Jqr2NV6qhIngP9AhE=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by SA2PR10MB4748.namprd10.prod.outlook.com (2603:10b6:806:112::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 15:31:08 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::9830:ae4d:f10c:c30a]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::9830:ae4d:f10c:c30a%5]) with mapi id 15.20.5723.032; Fri, 28 Oct 2022
 15:31:08 +0000
Content-Type: multipart/alternative;
 boundary="------------IENgt8t6DfVQ98YShU4cI30S"
Message-ID: <31d7eff8-8105-2cd1-69b9-4ecd7a3e846d@oracle.com>
Date: Fri, 28 Oct 2022 08:31:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2] vhost-vdpa: allow passing opened vhostfd to vhost-vdpa
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 eperezma@redhat.com, Cindy Lu <lulu@redhat.com>,
 Shuo Wang <shuo.s.wang@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <1665215938-24473-1-git-send-email-si-wei.liu@oracle.com>
 <CACGkMEuc3Kwjt8r7HsU_-s-AVsAiMXddYZ0Um0sAhN6igaMn7Q@mail.gmail.com>
 <fff559ab-ce66-5830-f5da-e0d9e61adf59@oracle.com>
 <CACGkMEu6h5kHX1isY7GaVGySjE+2+hkM0pMXmdUTmC7HkoFg-Q@mail.gmail.com>
 <1c114850-c96a-b5d4-f44b-3699fc19b8dc@oracle.com>
 <6310b693-b885-3242-9579-92f189f0d1b5@redhat.com>
 <d625202e-9729-a050-db31-da2a5d89d58c@oracle.com>
 <dca26485-162a-6c61-33af-94e062503e11@oracle.com>
 <CACGkMEujkyvGX4Vbq=z1J=o4pU6UkoXzE-oUNmscmDyt6GTqvQ@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CACGkMEujkyvGX4Vbq=z1J=o4pU6UkoXzE-oUNmscmDyt6GTqvQ@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0383.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::28) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|SA2PR10MB4748:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a800e14-b267-4ec5-6fc7-08dab8f96f3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xnCqrJW/y9RCOhYuEps9cfNsftZE3kRS60+5eDzoLAO+k8Tw/2p/PYKxGxgwJrDtFvD1p/Kxp/u9LzJlY+5GMif/ptNO8bfnQ91k0/u67iPFT7/MYSNBMll+Stc/Zw+03VNsUTCsMza5AQ+AC3052u15aJS5Uq+7HZ35NS5iONzqKzGljMZQFinxqZJ0ntBYvFHBGJi2ZU6YI+8LlDozVyHH+MLt9ry7h5hL/gTauV/x1Yp6j2MXK4PloIH4kxDK11G6y3TYpZjXqsPBOq+J+TUIGKXYSGH48Gxhxy1fexP5dPwCSTRasldZJeorYBPNO+WlMpZuIvRpKrMgUl6hHJMjGM476tgF5aFiocHaNey8NFYKQE3pzhKpnKha+xiH3AvxGxD0tp+jmuqHnmZfUhqVVGRiSYkhBzaSNi5m1Np5NuvIkq66t9Ug+vvtFsRwN5CeSYMkcOKLWEOsTBfmrtwnsuFaJ+fK03U+KCnsQrvGLJZMiC6cL9G4O72nI0RJcsgQJvmSKFxhMYbixVfWg2Dd9b8a1SPTmJdceOnCMV/CnPuzx8Lt69f81fhPceLHByp/l1YSorVYc7DYT3FC8X86UUMYa9yL5Yh4sVyi/5sDY3mgxtUkjCcUN5j8+7s32yteuYD8LyBFjd/Al9jHGzmzTXd0XSu0ZEwE9B3q+IkZGqaf9tWiSBXk4LDAEOuQzEIwmzzIkSPLbxEUnMDtBUwK/q8QkiYqUhslwAe6Ok8kIUq81VXPKpR7ry9pCEl5ZHsmPc1AEkV5TTBWDcD3KDVsTGSWxn72o4qNuiVUmFM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6535.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199015)(53546011)(33964004)(6506007)(36916002)(66556008)(66476007)(4326008)(8676002)(66946007)(66574015)(30864003)(26005)(2616005)(5660300002)(36756003)(83380400001)(41300700001)(2906002)(8936002)(6512007)(186003)(86362001)(38100700002)(31686004)(6486002)(31696002)(478600001)(66899015)(6916009)(54906003)(316002)(107886003)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkZrbnZlK0FmcmRZdnZSOWZzTDFiekJMQjNLUUZXZWt1QnZ4aGhZRlFKd3E2?=
 =?utf-8?B?VEVWaGlYdE1OamFzTHRJNTAzT2psdE9rNUgycE5XVDY5dWtNSkQ1K2U0dEpW?=
 =?utf-8?B?M1pJNzlzb1NGRmY1OVRDNFVwVmdPSXZJSThxc05ERE55K3h1Z1JQWVdkTFhX?=
 =?utf-8?B?UHh3QjBNVnZpTVRjbmdncldpdE95dnhjRjhoY3FYQnlRMWlYc0JqdndCV3Bm?=
 =?utf-8?B?S1M2QjVCNzlYWmM3akZGZEVxZGJCNEtUK2pMUDUyT3lpVGJuKy9acHdZM1I1?=
 =?utf-8?B?ZXJzMHU4U3lWbmxSc0NLWDdsUzZzSVR5VHB5dzl5dU1qc0hGelBMT2tjT3Fo?=
 =?utf-8?B?MHBPYUcxSGV6MGJjMEJKZW9VZnlYMnVGcHoyRVl5MlEvNWhscEU4cERjRUNi?=
 =?utf-8?B?ZGxwWjNwU2t2ZFFPbVNmYkNLREltQlVOZFpVYzJ6cCtNN1hraXFSUkZLRzhB?=
 =?utf-8?B?V2NqMVl6em1DRDhIMUVpRXVyWmV5Znc5SXN5YkxZaEVvZnpRaytORUd3THQz?=
 =?utf-8?B?a3V2TkZmbUdISjdkdFVHZ1A0a2tNaTRCRzRKdHR5SmpyMFh4SkxHZjliNHJO?=
 =?utf-8?B?R2xXSDBEWC9QQnNnclh0QWxNcWRBNFJtbThVOCswVUF4MEdLUXhObjFXOFRJ?=
 =?utf-8?B?L0F5dGFMTlUxTjhRanRoT2NYTDNiZDNzQzBOcWo2NjB6cDdrTTJTSFZDeWUx?=
 =?utf-8?B?eTdGNlZhc1FPT3lXTFJ4TWs5dUo0NGJGcUVxd2R1aExjaWdYNFVoVjlFamxS?=
 =?utf-8?B?dXNzQUN2Y1pJaGdyN2NQYngzbmFjSVpPVm1mdlVONkVmMm5FOEYwdjdLMkZm?=
 =?utf-8?B?UWtSTllGQTB4M29EaitOMkdMc3RHOUFabXFDYVRlZGxWTlF6cDRMY0VSYUhG?=
 =?utf-8?B?eVBMTUE2azQzZWc2QTdjcVVINGdOc0dSazVJLzlxWjZ5K1BsTyt2SjJPWS9y?=
 =?utf-8?B?MVh0aXJSZUplTXNyYlp3OTZPVGJXNEV0T3pGd3BjU1grakFyQS93bzB5ZFYw?=
 =?utf-8?B?eFFob205alRnR0l2Z1BrSGlXODA4V2Q3M2JFT0FTdFlkc21MM0VZdFl5L3RM?=
 =?utf-8?B?c3EzaTFZZ1dhNFpsb2xMOWRyZjduRWVaMkhIZ3pLc3BTVk5YTFNFeHZQWDdM?=
 =?utf-8?B?Wk9xa1M1bUFIdkdaQWkyVDJxUnZuc0UyR24zUTRIamtlZDBnREFWNnVwS1da?=
 =?utf-8?B?ZkdUTG5ZTkl1akpLaTJpNmpLamgxNEI0OTlibWw4NGJJQWFPQ1ErOXNWL1ls?=
 =?utf-8?B?TGVHZVBqVE9LOHBKL0RvbGdqK2drTW8yZ1JRd0lPVXIvNHNscFBpaGthTEhO?=
 =?utf-8?B?LzA5dmJ1cHM0aTZNa011VGhtS3llQTJzcklKRUNrZkFCVURZbWNEUjhOWWJT?=
 =?utf-8?B?OHgxdzMzNm80R3V1MjM5TjFWRmtGRnFMWU9YMWVzZSsvSEh4STFTSm9LL2ta?=
 =?utf-8?B?VGtSb2dIcDdrYXEvdnBudmFIR2hCclgzWTZrbjYvY2piQTdzaUsveU9UUDZk?=
 =?utf-8?B?REtsQUQ1Mmpwc0ZBTjdEcDJyM3pnNTROYTBoWTRYNDhhTFRPZ1pLVHF0ZlpO?=
 =?utf-8?B?Z3hXZzZJQys4cFdSMWp0T1N3eU0ydGNEUGdkQ1FhcWlaWllxL3Bmd2NzYXY0?=
 =?utf-8?B?T2o4Q0V4a0hvZlpTYVE4ZzNJSjIyeEpqaUM3MXNtU3JmQjNZZ0l4YWFkdVNI?=
 =?utf-8?B?cDlFK3hTVXNyY3k5RGIyVVMzTjhIaFd3Q1l1RlN6K3ZEMCtXWm5NbEdMdlJn?=
 =?utf-8?B?VW9hQTU1UkFySEtqOW9UQ2Z2Z0tYSUNWd0ppNjZpK3hIZDd4SEFMZHZqUE15?=
 =?utf-8?B?VXQxdE8zM0xqNHFMVFBQOHRYaklJbld1c0dnVmMxY2NpNWw0bTZMSzF0WW5F?=
 =?utf-8?B?ZGJ4SFJ0RHY1YWQ3OVhnSTM1R1d4Sm5sRThCRTB6U1JKS05pcDd2WWo0RFZI?=
 =?utf-8?B?ZVpSc3R1anM5WlZVdUVmdXJqaVVGcHFsemEwMWRCU3IreHlVLzA1cnZOUklq?=
 =?utf-8?B?eVBNL05NWEEyN2ZOMStWbnBSL1BUcUtPVmplb1d2Zi9oMGdHK0szbkVxbzB2?=
 =?utf-8?B?bkdKUjBxSDBEMzk3KzdjRURvNUppT1YxdlRtdC9VQXdqK1doQTRtVmhxNTJr?=
 =?utf-8?Q?fZ3cyVb5jlxTcm00izDd81K/7?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a800e14-b267-4ec5-6fc7-08dab8f96f3b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 15:31:08.1067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: So2WPFo2Dih0GnFJH/Px09gogfUAewCEs5JUMgNiVRvcDACdTYMdQmGFJjolQYPMjHEfRfYAjp8rZZS365XS3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4748
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_07,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280096
X-Proofpoint-GUID: ZQRY_3fNxAYygSitdeUFTXfVSeiU_kYJ
X-Proofpoint-ORIG-GUID: ZQRY_3fNxAYygSitdeUFTXfVSeiU_kYJ
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--------------IENgt8t6DfVQ98YShU4cI30S
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/27/2022 6:50 PM, Jason Wang wrote:
> On Fri, Oct 28, 2022 at 5:56 AM Si-Wei Liu<si-wei.liu@oracle.com>  wrote:
>> Hi Jason,
>>
>> Sorry for top posting, but are you going to queue this patch? It looks
>> like the discussion has been settled and no further comment I got for 2
>> weeks for this patch.
> Yes, I've queued this.
Excellent, thanks Jason. I see it gets pulled.

-Siwei
>
> Thanks
>
>> Thanks,
>> -Siwei
>>
>> On 10/13/2022 4:12 PM, Si-Wei Liu wrote:
>>> Jason,
>>>
>>> On 10/12/2022 10:02 PM, Jason Wang wrote:
>>>> 在 2022/10/12 13:59, Si-Wei Liu 写道:
>>>>>
>>>>> On 10/11/2022 8:09 PM, Jason Wang wrote:
>>>>>> On Tue, Oct 11, 2022 at 1:18 AM Si-Wei Liu<si-wei.liu@oracle.com>
>>>>>> wrote:
>>>>>>> On 10/8/2022 10:43 PM, Jason Wang wrote:
>>>>>>>
>>>>>>> On Sat, Oct 8, 2022 at 5:04 PM Si-Wei Liu<si-wei.liu@oracle.com>
>>>>>>> wrote:
>>>>>>>
>>>>>>> Similar to other vhost backends, vhostfd can be passed to vhost-vdpa
>>>>>>> backend as another parameter to instantiate vhost-vdpa net client.
>>>>>>> This would benefit the use case where only open file descriptors, as
>>>>>>> opposed to raw vhost-vdpa device paths, are accessible from the QEMU
>>>>>>> process.
>>>>>>>
>>>>>>> (qemu) netdev_add type=vhost-vdpa,vhostfd=61,id=vhost-vdpa1
>>>>>>>
>>>>>>> Adding Cindy.
>>>>>>>
>>>>>>> This has been discussed before, we've already had
>>>>>>> vhostdev=/dev/fdset/$fd which should be functional equivalent to what
>>>>>>> has been proposed here. (And this is how libvirt works if I
>>>>>>> understand
>>>>>>> correctly).
>>>>>>>
>>>>>>> Yes, I was aware of that discussion. However, our implementation
>>>>>>> of the management software is a bit different from libvirt, in
>>>>>>> which the paths in /dev/fdset/NNN can't be dynamically passed to
>>>>>>> the container where QEMU is running. By using a specific vhostfd
>>>>>>> property with existing code, it would allow our mgmt software
>>>>>>> smooth adaption without having to add too much infra code to
>>>>>>> support the /dev/fdset/NNN trick.
>>>>>> I think fdset has extra flexibility in e.g hot-plug to allow the file
>>>>>> descriptor to be passed with SCM_RIGHTS.
>>>>> Yes, that's exactly the use case we'd like to support. Though the
>>>>> difference in our mgmt software stack from libvirt is that any
>>>>> dynamic path in /dev (like /dev/fdset/ABC or /dev/vhost-vdpa-XYZ)
>>>>> can't be allowed to get passed through to the container running QEMU
>>>>> on the fly for security reasons. fd passing is allowed, though, with
>>>>> very strict security checks.
>>>>
>>>> Interesting, any reason for disallowing fd passing?
>>> For our mgmt software stack, QEMU is running in a secured container
>>> with its own namespace(s) with minimally well known and trusted
>>> devices from root ns exposed (only) at the time when QEMU is being
>>> started.  Direct fd passing via SCM_RIGHTS is allowed, but fdset
>>> device node exposure is not allowed and not even considered useful to
>>> us, as it adds an unwarranted attack surface to the QEMU's secured
>>> container unnecessarily. This has been the case and our security model
>>> for a while now w.r.t hot plugging vhost-net/tap and vhost-scsi
>>> devices, so will do for vhost-vdpa with vhostfd. It's not an open
>>> source project, though what I can share is that it's not a simple
>>> script that can be easily changed, and allow passing extra devices
>>> e.g. fdset especially on the fly is not even in consideration per
>>> suggested security guideline. I think we don't do anything special
>>> here as with other secured containers that disallow dynamic device
>>> injection on the fly.
>>>
>>>> I'm asking since it's the way that libvirt work and it seems to me we
>>>> don't get any complaints in the past.
>>> I guess it was because libvirt doesn't run QEMU in a container with
>>> very limited device exposure, otherwise this sort of constraints would
>>> pop up. Anyway the point and the way I see it is that passing vhostfd
>>> is proved to be working well and secure with other vhost devices, I
>>> don't see why vhost-vdpa is treated special here that would need to
>>> enforce the fdset usage. It's an edge case for libvirt maybe, but
>>> supporting QEMU's vhost-vdpa device to run in a securely contained
>>> environment with no dynamic device injection shouldn't be an odd or
>>> bizarre use case.
>>>
>>>
>>> Thanks,
>>> -Siwei
>>>
>>>>
>>>>> That's the main motivation for this direct vhostfd passing support
>>>>> (noted fdset doesn't need to be used along with /dev/fdset node).
>>>>>
>>>>> Having it said, I found there's also nuance in the
>>>>> vhostdev=/dev/fdset/XyZ interface besides the /dev node limitation:
>>>>> the fd to open has to be dup'ed from the original one passed via
>>>>> SCM_RIGHTS. This also has implication on security that any ioctl
>>>>> call from QEMU can't be audited through the original fd.
>>>>
>>>> I'm not sure I get this, but management layer can enforce a ioctl
>>>> whiltelist for safety.
>>>>
>>>> Thanks
>>>>
>>>>
>>>>> With this regard, I think vhostfd offers more flexibility than work
>>>>> around those qemu_open() specifics. Would these justify the use case
>>>>> of concern?
>>>>>
>>>>> Thanks,
>>>>> -Siwei
>>>>>
>>>>>>    It would still be good to add
>>>>>> the support.
>>>>>>
>>>>>>> On the other hand, the other vhost backends, e.g. tap (via
>>>>>>> vhost-net), vhost-scsi and vhost-vsock all accept vhostfd as
>>>>>>> parameter to instantiate device, although the /dev/fdset trick
>>>>>>> also works there. I think vhost-vdpa is not  unprecedented in this
>>>>>>> case?
>>>>>> Yes.
>>>>>>
>>>>>> Thanks
>>>>>>
>>>>>>> Thanks,
>>>>>>> -Siwei
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Thanks
>>>>>>>
>>>>>>> Signed-off-by: Si-Wei Liu<si-wei.liu@oracle.com>
>>>>>>> Acked-by: Eugenio Pérez<eperezma@redhat.com>
>>>>>>>
>>>>>>> ---
>>>>>>> v2:
>>>>>>>     - fixed typo in commit message
>>>>>>>     - s/fd's/file descriptors/
>>>>>>> ---
>>>>>>>    net/vhost-vdpa.c | 25 ++++++++++++++++++++-----
>>>>>>>    qapi/net.json    |  3 +++
>>>>>>>    qemu-options.hx  |  6 ++++--
>>>>>>>    3 files changed, 27 insertions(+), 7 deletions(-)
>>>>>>>
>>>>>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>>>>>> index 182b3a1..366b070 100644
>>>>>>> --- a/net/vhost-vdpa.c
>>>>>>> +++ b/net/vhost-vdpa.c
>>>>>>> @@ -683,14 +683,29 @@ int net_init_vhost_vdpa(const Netdev
>>>>>>> *netdev, const char *name,
>>>>>>>
>>>>>>>        assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>>>>>>>        opts = &netdev->u.vhost_vdpa;
>>>>>>> -    if (!opts->vhostdev) {
>>>>>>> -        error_setg(errp, "vdpa character device not specified
>>>>>>> with vhostdev");
>>>>>>> +    if (!opts->has_vhostdev && !opts->has_vhostfd) {
>>>>>>> +        error_setg(errp,
>>>>>>> +                   "vhost-vdpa: neither vhostdev= nor vhostfd=
>>>>>>> was specified");
>>>>>>>            return -1;
>>>>>>>        }
>>>>>>>
>>>>>>> -    vdpa_device_fd = qemu_open(opts->vhostdev, O_RDWR, errp);
>>>>>>> -    if (vdpa_device_fd == -1) {
>>>>>>> -        return -errno;
>>>>>>> +    if (opts->has_vhostdev && opts->has_vhostfd) {
>>>>>>> +        error_setg(errp,
>>>>>>> +                   "vhost-vdpa: vhostdev= and vhostfd= are
>>>>>>> mutually exclusive");
>>>>>>> +        return -1;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    if (opts->has_vhostdev) {
>>>>>>> +        vdpa_device_fd = qemu_open(opts->vhostdev, O_RDWR, errp);
>>>>>>> +        if (vdpa_device_fd == -1) {
>>>>>>> +            return -errno;
>>>>>>> +        }
>>>>>>> +    } else if (opts->has_vhostfd) {
>>>>>>> +        vdpa_device_fd = monitor_fd_param(monitor_cur(),
>>>>>>> opts->vhostfd, errp);
>>>>>>> +        if (vdpa_device_fd == -1) {
>>>>>>> +            error_prepend(errp, "vhost-vdpa: unable to parse
>>>>>>> vhostfd:"); + return -1; + } } r = 
>>>>>>> vhost_vdpa_get_features(vdpa_device_fd, &features, errp); diff 
>>>>>>> --git a/qapi/net.json b/qapi/net.json index dd088c0..926ecc8 
>>>>>>> 100644 --- a/qapi/net.json +++ b/qapi/net.json @@ -442,6 +442,8 
>>>>>>> @@ # @vhostdev: path of vhost-vdpa device # 
>>>>>>> (default:'/dev/vhost-vdpa-0') # +# @vhostfd: file descriptor of 
>>>>>>> an already opened vhost vdpa device +# # @queues: number of 
>>>>>>> queues to be created for multiqueue vhost-vdpa # (default: 1) # 
>>>>>>> @@ -456,6 +458,7 @@ { 'struct': 'NetdevVhostVDPAOptions', 
>>>>>>> 'data': { '*vhostdev': 'str', + '*vhostfd': 'str', '*queues': 
>>>>>>> 'int', '*x-svq': {'type': 'bool', 'features' : [ 'unstable'] } } 
>>>>>>> } diff --git a/qemu-options.hx b/qemu-options.hx index 
>>>>>>> 913c71e..c040f74 100644 --- a/qemu-options.hx +++ 
>>>>>>> b/qemu-options.hx @@ -2774,8 +2774,10 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>>>>>>>        "                configure a vhost-user network, backed by a
>>>>>>> chardev 'dev'\n"
>>>>>>>    #endif
>>>>>>>    #ifdef __linux__
>>>>>>> -    "-netdev vhost-vdpa,id=str,vhostdev=/path/to/dev\n"
>>>>>>> +    "-netdev
>>>>>>> vhost-vdpa,id=str[,vhostdev=/path/to/dev][,vhostfd=h]\n"
>>>>>>>        "                configure a vhost-vdpa network,Establish a
>>>>>>> vhost-vdpa netdev\n"
>>>>>>> +    "                use 'vhostdev=/path/to/dev' to open a vhost
>>>>>>> vdpa device\n"
>>>>>>> +    "                use 'vhostfd=h' to connect to an already
>>>>>>> opened vhost vdpa device\n"
>>>>>>>    #endif
>>>>>>>    #ifdef CONFIG_VMNET
>>>>>>>        "-netdev vmnet-host,id=str[,isolated=on|off][,net-uuid=uuid]\n"
>>>>>>> @@ -3280,7 +3282,7 @@ SRST
>>>>>>>                 -netdev type=vhost-user,id=net0,chardev=chr0 \
>>>>>>>                 -device virtio-net-pci,netdev=net0
>>>>>>>
>>>>>>> -``-netdev vhost-vdpa,vhostdev=/path/to/dev``
>>>>>>> +``-netdev vhost-vdpa[,vhostdev=/path/to/dev][,vhostfd=h]``
>>>>>>>        Establish a vhost-vdpa netdev.
>>>>>>>
>>>>>>>        vDPA device is a device that uses a datapath which complies
>>>>>>> with
>>>>>>> --
>>>>>>> 1.8.3.1
>>>>>>>
>>>>>>>

--------------IENgt8t6DfVQ98YShU4cI30S
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 10/27/2022 6:50 PM, Jason Wang
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CACGkMEujkyvGX4Vbq=z1J=o4pU6UkoXzE-oUNmscmDyt6GTqvQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Fri, Oct 28, 2022 at 5:56 AM Si-Wei Liu <a class="moz-txt-link-rfc2396E" href="mailto:si-wei.liu@oracle.com">&lt;si-wei.liu@oracle.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Hi Jason,

Sorry for top posting, but are you going to queue this patch? It looks
like the discussion has been settled and no further comment I got for 2
weeks for this patch.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yes, I've queued this.</pre>
    </blockquote>
    Excellent, thanks Jason. I see it gets pulled.<br>
    <br>
    -Siwei<br>
    <blockquote type="cite" cite="mid:CACGkMEujkyvGX4Vbq=z1J=o4pU6UkoXzE-oUNmscmDyt6GTqvQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Thanks

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Thanks,
-Siwei

On 10/13/2022 4:12 PM, Si-Wei Liu wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Jason,

On 10/12/2022 10:02 PM, Jason Wang wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
在 2022/10/12 13:59, Si-Wei Liu 写道:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">

On 10/11/2022 8:09 PM, Jason Wang wrote:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">On Tue, Oct 11, 2022 at 1:18 AM Si-Wei Liu<a class="moz-txt-link-rfc2396E" href="mailto:si-wei.liu@oracle.com">&lt;si-wei.liu@oracle.com&gt;</a>
wrote:
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">On 10/8/2022 10:43 PM, Jason Wang wrote:

On Sat, Oct 8, 2022 at 5:04 PM Si-Wei Liu<a class="moz-txt-link-rfc2396E" href="mailto:si-wei.liu@oracle.com">&lt;si-wei.liu@oracle.com&gt;</a>
wrote:

Similar to other vhost backends, vhostfd can be passed to vhost-vdpa
backend as another parameter to instantiate vhost-vdpa net client.
This would benefit the use case where only open file descriptors, as
opposed to raw vhost-vdpa device paths, are accessible from the QEMU
process.

(qemu) netdev_add type=vhost-vdpa,vhostfd=61,id=vhost-vdpa1

Adding Cindy.

This has been discussed before, we've already had
vhostdev=/dev/fdset/$fd which should be functional equivalent to what
has been proposed here. (And this is how libvirt works if I
understand
correctly).

Yes, I was aware of that discussion. However, our implementation
of the management software is a bit different from libvirt, in
which the paths in /dev/fdset/NNN can't be dynamically passed to
the container where QEMU is running. By using a specific vhostfd
property with existing code, it would allow our mgmt software
smooth adaption without having to add too much infra code to
support the /dev/fdset/NNN trick.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">I think fdset has extra flexibility in e.g hot-plug to allow the file
descriptor to be passed with SCM_RIGHTS.
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">Yes, that's exactly the use case we'd like to support. Though the
difference in our mgmt software stack from libvirt is that any
dynamic path in /dev (like /dev/fdset/ABC or /dev/vhost-vdpa-XYZ)
can't be allowed to get passed through to the container running QEMU
on the fly for security reasons. fd passing is allowed, though, with
very strict security checks.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">

Interesting, any reason for disallowing fd passing?
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">For our mgmt software stack, QEMU is running in a secured container
with its own namespace(s) with minimally well known and trusted
devices from root ns exposed (only) at the time when QEMU is being
started.  Direct fd passing via SCM_RIGHTS is allowed, but fdset
device node exposure is not allowed and not even considered useful to
us, as it adds an unwarranted attack surface to the QEMU's secured
container unnecessarily. This has been the case and our security model
for a while now w.r.t hot plugging vhost-net/tap and vhost-scsi
devices, so will do for vhost-vdpa with vhostfd. It's not an open
source project, though what I can share is that it's not a simple
script that can be easily changed, and allow passing extra devices
e.g. fdset especially on the fly is not even in consideration per
suggested security guideline. I think we don't do anything special
here as with other secured containers that disallow dynamic device
injection on the fly.

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">I'm asking since it's the way that libvirt work and it seems to me we
don't get any complaints in the past.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">I guess it was because libvirt doesn't run QEMU in a container with
very limited device exposure, otherwise this sort of constraints would
pop up. Anyway the point and the way I see it is that passing vhostfd
is proved to be working well and secure with other vhost devices, I
don't see why vhost-vdpa is treated special here that would need to
enforce the fdset usage. It's an edge case for libvirt maybe, but
supporting QEMU's vhost-vdpa device to run in a securely contained
environment with no dynamic device injection shouldn't be an odd or
bizarre use case.


Thanks,
-Siwei

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">That's the main motivation for this direct vhostfd passing support
(noted fdset doesn't need to be used along with /dev/fdset node).

Having it said, I found there's also nuance in the
vhostdev=/dev/fdset/XyZ interface besides the /dev node limitation:
the fd to open has to be dup'ed from the original one passed via
SCM_RIGHTS. This also has implication on security that any ioctl
call from QEMU can't be audited through the original fd.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">

I'm not sure I get this, but management layer can enforce a ioctl
whiltelist for safety.

Thanks


</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">With this regard, I think vhostfd offers more flexibility than work
around those qemu_open() specifics. Would these justify the use case
of concern?

Thanks,
-Siwei

</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">  It would still be good to add
the support.

</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">On the other hand, the other vhost backends, e.g. tap (via
vhost-net), vhost-scsi and vhost-vsock all accept vhostfd as
parameter to instantiate device, although the /dev/fdset trick
also works there. I think vhost-vdpa is not  unprecedented in this
case?
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">Yes.

Thanks

</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">Thanks,
-Siwei



Thanks

Signed-off-by: Si-Wei Liu<a class="moz-txt-link-rfc2396E" href="mailto:si-wei.liu@oracle.com">&lt;si-wei.liu@oracle.com&gt;</a>
Acked-by: Eugenio Pérez<a class="moz-txt-link-rfc2396E" href="mailto:eperezma@redhat.com">&lt;eperezma@redhat.com&gt;</a>

---
v2:
   - fixed typo in commit message
   - s/fd's/file descriptors/
---
  net/vhost-vdpa.c | 25 ++++++++++++++++++++-----
  qapi/net.json    |  3 +++
  qemu-options.hx  |  6 ++++--
  3 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 182b3a1..366b070 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -683,14 +683,29 @@ int net_init_vhost_vdpa(const Netdev
*netdev, const char *name,

      assert(netdev-&gt;type == NET_CLIENT_DRIVER_VHOST_VDPA);
      opts = &amp;netdev-&gt;u.vhost_vdpa;
-    if (!opts-&gt;vhostdev) {
-        error_setg(errp, &quot;vdpa character device not specified
with vhostdev&quot;);
+    if (!opts-&gt;has_vhostdev &amp;&amp; !opts-&gt;has_vhostfd) {
+        error_setg(errp,
+                   &quot;vhost-vdpa: neither vhostdev= nor vhostfd=
was specified&quot;);
          return -1;
      }

-    vdpa_device_fd = qemu_open(opts-&gt;vhostdev, O_RDWR, errp);
-    if (vdpa_device_fd == -1) {
-        return -errno;
+    if (opts-&gt;has_vhostdev &amp;&amp; opts-&gt;has_vhostfd) {
+        error_setg(errp,
+                   &quot;vhost-vdpa: vhostdev= and vhostfd= are
mutually exclusive&quot;);
+        return -1;
+    }
+
+    if (opts-&gt;has_vhostdev) {
+        vdpa_device_fd = qemu_open(opts-&gt;vhostdev, O_RDWR, errp);
+        if (vdpa_device_fd == -1) {
+            return -errno;
+        }
+    } else if (opts-&gt;has_vhostfd) {
+        vdpa_device_fd = monitor_fd_param(monitor_cur(),
opts-&gt;vhostfd, errp);
+        if (vdpa_device_fd == -1) {
+            error_prepend(errp, &quot;vhost-vdpa: unable to parse
vhostfd: <a class="moz-txt-link-rfc2396E" href="mailto:);+return-1;+}}r=vhost_vdpa_get_features(vdpa_device_fd,&amp;features,errp);diff--gita/qapi/net.jsonb/qapi/net.jsonindexdd088c0..926ecc8100644---a/qapi/net.json+++b/qapi/net.json@@-442,6+442,8@@#@vhostdev:pathofvhost-vdpadevice#(default:'/dev/vhost-vdpa-0')#+#@vhostfd:filedescriptorofanalreadyopenedvhostvdpadevice+##@queues:numberofqueuestobecreatedformultiqueuevhost-vdpa#(default:1)#@@-456,6+458,7@@{'struct':'NetdevVhostVDPAOptions','data':{'*vhostdev':'str',+'*vhostfd':'str','*queues':'int','*x-svq':{'type':'bool','features':['unstable']}}}diff--gita/qemu-options.hxb/qemu-options.hxindex913c71e..c040f74100644---a/qemu-options.hx+++b/qemu-options.hx@@-2774,8+2774,10@@DEF(">&quot;);
+            return -1;
+        }
      }

      r = vhost_vdpa_get_features(vdpa_device_fd, &amp;features, errp);
diff --git a/qapi/net.json b/qapi/net.json
index dd088c0..926ecc8 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -442,6 +442,8 @@
  # @vhostdev: path of vhost-vdpa device
  #            (default:'/dev/vhost-vdpa-0')
  #
+# @vhostfd: file descriptor of an already opened vhost vdpa device
+#
  # @queues: number of queues to be created for multiqueue vhost-vdpa
  #          (default: 1)
  #
@@ -456,6 +458,7 @@
  { 'struct': 'NetdevVhostVDPAOptions',
    'data': {
      '*vhostdev':     'str',
+    '*vhostfd':      'str',
      '*queues':       'int',
      '*x-svq':        {'type': 'bool', 'features' : [ 'unstable']
} } }

diff --git a/qemu-options.hx b/qemu-options.hx
index 913c71e..c040f74 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2774,8 +2774,10 @@ DEF(&quot;</a>netdev&quot;, HAS_ARG, QEMU_OPTION_netdev,
      &quot;                configure a vhost-user network, backed by a
chardev 'dev'\n&quot;
  #endif
  #ifdef __linux__
-    &quot;-netdev vhost-vdpa,id=str,vhostdev=/path/to/dev\n&quot;
+    &quot;-netdev
vhost-vdpa,id=str[,vhostdev=/path/to/dev][,vhostfd=h]\n&quot;
      &quot;                configure a vhost-vdpa network,Establish a
vhost-vdpa netdev\n&quot;
+    &quot;                use 'vhostdev=/path/to/dev' to open a vhost
vdpa device\n&quot;
+    &quot;                use 'vhostfd=h' to connect to an already
opened vhost vdpa device\n&quot;
  #endif
  #ifdef CONFIG_VMNET
      &quot;-netdev vmnet-host,id=str[,isolated=on|off][,net-uuid=uuid]\n&quot;
@@ -3280,7 +3282,7 @@ SRST
               -netdev type=vhost-user,id=net0,chardev=chr0 \
               -device virtio-net-pci,netdev=net0

-``-netdev vhost-vdpa,vhostdev=/path/to/dev``
+``-netdev vhost-vdpa[,vhostdev=/path/to/dev][,vhostfd=h]``
      Establish a vhost-vdpa netdev.

      vDPA device is a device that uses a datapath which complies
with
--
1.8.3.1


</pre>
                </blockquote>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------IENgt8t6DfVQ98YShU4cI30S--

