Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FF149EDEA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 23:03:56 +0100 (CET)
Received: from localhost ([::1]:43862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDCrz-0000hj-FG
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 17:03:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nDCqX-0008MQ-5r
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 17:02:25 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:3848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nDCqT-0006TG-2n
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 17:02:23 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20RL7b7H029555; 
 Thu, 27 Jan 2022 22:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=2IUbmtD8R9O2dr4LcJLa9FdTlJPcR2JiJi1LZoXBYa0=;
 b=S9EXBjeiqEpejpqeQ5nTkpf0scjx84x9C+yQ37cZl6oXrqkFMxnOAZ+aJx51PBME5jax
 HDM4A1QBIw2Gx2GfZ0tpDeNErvKbseg5sglgTel5pymzh9HT4n4w+xgw0X2DxDSSfaLy
 FRsxbiS/b0/Da0uTOqZ4xj724+XWhi86fOL2k20zPOqUpa5ZtXUsUrDr8+OGCKSbUno5
 SHa1IfseV58Ni+RCmXgs6/3/pTOfMuTj8HJSN/pxaEm44mxq5sQG9ngsFXELteVQMxzN
 vN5QKqDOqza6iX7gc6mcQ445rYvKHB/j97EQbkjq7u4X/F9JIKN6sk7C4KsB2zQEKGUP 2g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3duvqusgwd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 22:02:15 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20RLjPWm060004;
 Thu, 27 Jan 2022 22:02:13 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by aserp3030.oracle.com with ESMTP id 3dr7ymp529-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 22:02:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2zNEaJNe/lXJaHcKH6kW08+GcBxNPBU7KIAQTP5hY56Ng8XPXygNiNu6Oxx327ZycmFwN4QA/Xhw1Mu8nKlSrqNW8RSCsgql3rGVOVVM/N4FEAc9O6Tl16X9asE7RJ6C0bV7hAxu6r2bPrcEo5ji6WTvxovm5GZ7pvu4F7hAVaxB1ELbbWcjx+pxOSFOM8tXVqH8HM5XyQ6p2kpj4l9nJscNQTEZFda+oygaJnDFmNicxeB2RZbh8fHO2MHCWDg1NphCIKSpylSqKjXa/sc5e9g0APruCx/qdcPl+7OlZjpY6jvxilb9OW+ZZCkei9p+CscSmtLPrcTs1xnbQlnQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IUbmtD8R9O2dr4LcJLa9FdTlJPcR2JiJi1LZoXBYa0=;
 b=C4CPYTHUV7ZuagvLDSth/kzaJy3X2n0lbWkvEIifRY9Nv7ZljC0TJC8C7CTh4z+yKQYY+XecCArL6wnmu67BWP/0YI6Oz9G/ooj6/6gxkEV/iJjD74KeJu2xxnpXwNTWxPBEszvQ0aQE/8nhKoC6mLNsZGXRHJWHyMswWqjkUzGznKG39FeJbxloyFH1HqeNgUSiqG5pqVKBxwZB3QlmNrU+eRRScaRZrOhCfxc33HMV/7kdQ7aVZXmL5/6mH0k+mYSNZZ2jqSXc9klHA9vsOudwu+hKGzsTYXP83c+xgi8TEG+yzkvPMGohfhSCDXVWpGds1oDzCYMZ7+WNmEvMPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IUbmtD8R9O2dr4LcJLa9FdTlJPcR2JiJi1LZoXBYa0=;
 b=LiaF7TzQH5NBBsEbJxLiaa6HNFRrAlS8j2/FOSpwKk9WQA9pkhMIXRtuB6clxrejAkzvnYmWdiNR4FDLsprv1oliXh3lWV5Bm47XDjPF3UrSjnTkuBui4tbY48X/2fgaxkbKpWAGk5RdnvRmI07yHA3FrlKexfsZjnQexRNNaPk=
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19)
 by BL0PR10MB2817.namprd10.prod.outlook.com (2603:10b6:208:77::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Thu, 27 Jan
 2022 22:02:11 +0000
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::5c:8815:b55d:7dce]) by SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::5c:8815:b55d:7dce%4]) with mapi id 15.20.4909.019; Thu, 27 Jan 2022
 22:02:11 +0000
Message-ID: <1f544cb3-7434-3480-63fc-ff317327ea78@oracle.com>
Date: Thu, 27 Jan 2022 16:02:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v14 06/10] ACPI ERST: build the ACPI ERST table
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
References: <1643214514-2839-1-git-send-email-eric.devolder@oracle.com>
 <1643214514-2839-7-git-send-email-eric.devolder@oracle.com>
 <alpine.OSX.2.20.2201271401250.42000@athabasca.local>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <alpine.OSX.2.20.2201271401250.42000@athabasca.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN2PR01CA0024.prod.exchangelabs.com (2603:10b6:804:2::34)
 To SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49f2071e-75ea-4b3f-26ae-08d9e1e0ab06
X-MS-TrafficTypeDiagnostic: BL0PR10MB2817:EE_
X-Microsoft-Antispam-PRVS: <BL0PR10MB28178C10F33687B743082DF997219@BL0PR10MB2817.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8yALSgFiDuoo7N26Mbtk4QnE+m7Stz2z43CLycEDupP+BP7nMJ4mQdfOpPdqq0F9ESWJeZeq+wm2VWDghzOT498+YrSEId0o1fjIiMCNjxJ/KFMqGRH7BiRSYKCPpckjYTuV2jqrBwbtePvLv3iJiYi3xlD2qNub/Kg+nQxKfKVHdc3vSgjo+pu80sumNTU71ZFsFgUzEpcK33o+co+Tt/SEpYcXyTOk+WCad6zSeqUGfAeS+/49tmPFQLYbWuaiZlvpDsYxnZD/YxBVJTZEaRdbhiso/9Neoq24Nnxsj9jfCQ+uvGOUaY9T6mQVMboNtC9cSKAMVBANaBSRYmidfhkND00OqWF8jgU7WVC0etzl+6SlZOwqjrQMEpDnmFasinThcXj/824n2uG6pYdKEVgRDCeNOihBSwP+MSmoQM3weWztcbNPNaHliUDbSF+Q3pe+Vtai5EqYA1CtLrTLfOTRDioWCeD1PMxdGQu4NkC3Z55C5rc50LdRWY6YncefC7FInuG024/xKgdyEsA9i7Mvt+S7iOWgKdsWUA17+CzH5RYghR/uAa0WMw56BSn1YbWsWail1w3fvGvewTwU2LH1GS6uCZj29DdVsJb8KpB6rpwQavZcord40o0GMnvLPPlCs2f4St3eb90C8BZUJ+6XeDJASGz0ubcyXWRDkdCq+OOi5tIP7L5TBiT4Z3Ya1p/R069YivjkkA0LboIxl30Z7Xmrhf8iY3e8g1lFmgQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4542.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31686004)(2616005)(6506007)(66556008)(36756003)(83380400001)(31696002)(107886003)(53546011)(186003)(66946007)(30864003)(508600001)(6666004)(6916009)(6512007)(4326008)(5660300002)(38100700002)(6486002)(316002)(86362001)(8676002)(2906002)(66476007)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emdobUswYXljS080M1Y1bm1WYTBNZmlEVlZMUG9sbWFUN2xWb2xSVzlFY0Vk?=
 =?utf-8?B?NlhJL3pMWEdQSkVCVGZUUFZDMzFHRzFFdDNtY1cvMFRSaFM4c2tDYXhxUXpO?=
 =?utf-8?B?U01wUnNxQitkdVRicXZzOE1oc3hWSGpHR3FTUzNsZ2hTQS9aRE5DWUc5OHlh?=
 =?utf-8?B?SjBocE8yZkpFMkFDYk9MdmlxMVR6aUcyRStsVDBXdDNsVW9Zbmo0N0FZRTVM?=
 =?utf-8?B?WjEyUks0ejloT21yK0RsZzBEdFVwUE1aOU5iVXJlZXQ4Tm1HOXlaeDB1Zngr?=
 =?utf-8?B?Tjhnd3krTUw0MzRVKzNHcHZCdnRFd2lIcDBQSmFLbUpPVlp3MFdrb1VwU2Fm?=
 =?utf-8?B?WW15UXpjQVMyeCtRU0VEM2UvOU4ycW5na2krMWZFR0dsUUxVbFdNYnhUbzZy?=
 =?utf-8?B?K0xTcXhRUm1pUkxxd2tXR25TS0x4S2tkOTJLZjVVd2VBQ1NZZTZVRHB5UHB1?=
 =?utf-8?B?UUtVVkp6WXhIbEVTK3dsQU9Zc3FGQVp3YkNiWWl4RDNiTlI0WUo5bTNOemhW?=
 =?utf-8?B?NE5XZ2N6YzZydCtMMDJHcjFRTnloTHV2bGZuQWFWZXZnMjhoZDRKRUdUTWJ4?=
 =?utf-8?B?b2V3MFBJcmtESUpjbWZ1a2FkTmJmRzJaRS9tYURQNEFhcGY2NWd0bENUc0U3?=
 =?utf-8?B?N2w4TnQ4dFRVaXJ4ZGM3d2dyd1gxYmNiZGl2aTIzZkdPSVFEV1lKdmRrcnlC?=
 =?utf-8?B?VXBadGllWDFoNXJSS3k0ZStQOXl2bVM1Mm8vWEhUN0xWUHZzODdieXV1eTVU?=
 =?utf-8?B?c0xibmxOMzhtNzZJYjBVKzNtdnBaM29NQll6bnZxcXloYi9Wc2JGRU5ieEVt?=
 =?utf-8?B?aEtlbHdGRGZnNElPTWtGZkFtTXMxbC93QXhjWGZSc0VUSTViNEVnRU5URXR4?=
 =?utf-8?B?UHJMekNPK09MbUFNVjhIUlpSeGZtSXg3OXh1QmtJbWJZWkRUMVVPZU5CV3JM?=
 =?utf-8?B?VTQ0VWRuemdoOW9nbVFkOTNBcFdUQTZ6WUlSbkhqSk00YmZlY3lGcy9USEhY?=
 =?utf-8?B?RVNMTUpOdXdEZHhnK2FFbGhEeW9BaGo2TEluMWY2TjRlbUlmY3d1b1BQb2VR?=
 =?utf-8?B?N05kRGdoMGszeUpHakQ0azdTdUxoL0tVOFdxeEx5VXczY0g4UDQ1TGdiQUVF?=
 =?utf-8?B?WSs5bmlyVmxzbEZHWUZTY0RKMGZqT3l6ZER2dTRxcm5IT09GZi9DZnVubnBj?=
 =?utf-8?B?R0VoTHpQWFBvaWFyMGRlYzIvYk13eGtoalpOSUFUcXlvUnB0Z3laR0NPS1BZ?=
 =?utf-8?B?Mm12T2ZuNlFxUnRBQXgyRGF1OGtKb0JTRWxjSW1MZzBLNmtSWncrVTB2cjA3?=
 =?utf-8?B?U3JoSkMwQW90UmZjbWdGNkthNGZ6QW4yRXljL0JQOGNkYkYxd2drYXNkaE5P?=
 =?utf-8?B?NTFVZEVhbk1IQWZ3VmRIOFBsemtUN3V1MkN0N0dMeTBEYWE0OFFvVDRsVkZN?=
 =?utf-8?B?ZldHQWJkbktxWVh4V2FIOUVta1RHN3dFOFdWOVNMMFhjRWNyRWFRVVE2MHYy?=
 =?utf-8?B?UkI0TVJDdmRzQ3k3bVNzeExHUW44b05UdGN0SllEdDZvamFQOGhRbjB3aUNE?=
 =?utf-8?B?V0t3TjU0c29nTTZ1eFNGTXBWeHpaRUxLL1lJY1M4cDhxYjFIWEk2WmROdmFU?=
 =?utf-8?B?d0plcUY2UTMzR3ZlU3l5OVFldHhsZkk1V3FsaGJGNUw0bnV2dUYyMnIrNlUz?=
 =?utf-8?B?c3BMODBGYjFCVzZmbDRORFhsS0ZUVEJQNkhQRDlTUERCSGdKdHlZcnZkbFQz?=
 =?utf-8?B?SkNXZTBzajVqUGxGRTlBaTJLZERESVFpTnFYUFV6T3dlYVF0MlRxWVZWaXJF?=
 =?utf-8?B?Y1VXN2c2U2c2VUJmOUc3azFsMG44TzJET2s1dU8vVHlPK3FsbkJOTkRXSEE0?=
 =?utf-8?B?eGhPOEIwOHd5YWhla3BoWjJBSFg4bUMrVUw3QWIzbk1OL3Q0RkRpLzVoZmJ0?=
 =?utf-8?B?NW52NHNTaVJiR0h6WHU0djR0OUVUeUh5VFhVS0x5Q0dIMDlYQ0NaaURYcFZN?=
 =?utf-8?B?NysxUEV1WTh1Wm92YWpBeERzaFNzZFZ5VGlaSW1kRytSSWp1Y1dFdFJSNWZo?=
 =?utf-8?B?ZjQvUHNyR2ZnQWRSYWFUanhXL0NyZU9PekNqMGdBZ2lmV0hCYXcwbm9wbnhW?=
 =?utf-8?B?YXI0dzQzL2pPSDVMak5kNi9tL0VQNlpoays5L0NwQS9iem4wOTZHeEVFNFlh?=
 =?utf-8?B?RzVTZlVZcGpJN2xNbXFUcklqQ0RmVmlBam9IdUFQVU4vbEp5TmcvVEJFKzZt?=
 =?utf-8?B?aHRIem9PeklERTM1VGErUkJkWVhHakRXSzhwbTI0QUxuN0lKZTN0ZGppT3BF?=
 =?utf-8?Q?LamxPB9ZBo0lxAyCha?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f2071e-75ea-4b3f-26ae-08d9e1e0ab06
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4542.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 22:02:11.0847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lx5tqc9xz20//KSclC7mmxR79hdHTv0WyFoFeefOmBr2ZDsbWntER9qEpRRkvkjeIoeVb3NdMX+5/WZNSOyI0d1P6+qWNnTLefCoIn1BVRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB2817
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10240
 signatures=669575
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201270125
X-Proofpoint-GUID: RwUqk4wTr4bakVP093OViqKTRHQdE310
X-Proofpoint-ORIG-GUID: RwUqk4wTr4bakVP093OViqKTRHQdE310
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ani,
Thanks for the RB! Inline responses below.
eric

On 1/27/22 02:36, Ani Sinha wrote:
> 
> 
> On Wed, 26 Jan 2022, Eric DeVolder wrote:
> 
>> This builds the ACPI ERST table to inform OSPM how to communicate
>> with the acpi-erst device.
> 
> There might be more optimizations possible but I think we have messaged
> this code enough. We can further rework the code if needed in subsequent
> patches once this is pushed.
> 
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> 
> with some minor comments,
> 
> Reviewed-by: Ani Sinha <ani@anisinha.ca>
> 
>>   hw/acpi/erst.c | 225 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 225 insertions(+)
>>
>> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
>> index fe9ba51..5d5a639 100644
>> --- a/hw/acpi/erst.c
>> +++ b/hw/acpi/erst.c
>> @@ -59,6 +59,27 @@
>>   #define STATUS_RECORD_STORE_EMPTY     0x04
>>   #define STATUS_RECORD_NOT_FOUND       0x05
>>
>> +/* ACPI 4.0: Table 17-19 Serialization Instructions */
>> +#define INST_READ_REGISTER                 0x00
>> +#define INST_READ_REGISTER_VALUE           0x01
>> +#define INST_WRITE_REGISTER                0x02
>> +#define INST_WRITE_REGISTER_VALUE          0x03
>> +#define INST_NOOP                          0x04
>> +#define INST_LOAD_VAR1                     0x05
>> +#define INST_LOAD_VAR2                     0x06
>> +#define INST_STORE_VAR1                    0x07
>> +#define INST_ADD                           0x08
>> +#define INST_SUBTRACT                      0x09
>> +#define INST_ADD_VALUE                     0x0A
>> +#define INST_SUBTRACT_VALUE                0x0B
>> +#define INST_STALL                         0x0C
>> +#define INST_STALL_WHILE_TRUE              0x0D
>> +#define INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E
>> +#define INST_GOTO                          0x0F
>> +#define INST_SET_SRC_ADDRESS_BASE          0x10
>> +#define INST_SET_DST_ADDRESS_BASE          0x11
>> +#define INST_MOVE_DATA                     0x12
>> +
>>   /* UEFI 2.1: Appendix N Common Platform Error Record */
>>   #define UEFI_CPER_RECORD_MIN_SIZE 128U
>>   #define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
>> @@ -172,6 +193,210 @@ typedef struct {
>>
>>   /*******************************************************************/
>>   /*******************************************************************/
>> +typedef struct {
>> +    GArray *table_data;
>> +    pcibus_t bar;
>> +    uint8_t instruction;
>> +    uint8_t flags;
>> +    uint8_t register_bit_width;
>> +    pcibus_t register_offset;
>> +} BuildSerializationInstructionEntry;
>> +
>> +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
>> +static void build_serialization_instruction(
>> +    BuildSerializationInstructionEntry *e,
>> +    uint8_t serialization_action,
>> +    uint64_t value)
>> +{
>> +    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
>> +    struct AcpiGenericAddress gas;
>> +    uint64_t mask;
>> +
>> +    /* Serialization Action */
>> +    build_append_int_noprefix(e->table_data, serialization_action, 1);
>> +    /* Instruction */
>> +    build_append_int_noprefix(e->table_data, e->instruction, 1);
>> +    /* Flags */
>> +    build_append_int_noprefix(e->table_data, e->flags, 1);
>> +    /* Reserved */
>> +    build_append_int_noprefix(e->table_data, 0, 1);
>> +    /* Register Region */
>> +    gas.space_id = AML_SYSTEM_MEMORY;
>> +    gas.bit_width = e->register_bit_width;
>> +    gas.bit_offset = 0;
>> +    gas.access_width = ctz32(e->register_bit_width) - 2;
> 
> Should this be casted as unit8_t?
OK, done.

> 
>> +    gas.address = (uint64_t)(e->bar + e->register_offset);
>> +    build_append_gas_from_struct(e->table_data, &gas);
>> +    /* Value */
>> +    build_append_int_noprefix(e->table_data, value, 8);
>> +    /* Mask */
>> +    mask = (1ULL << (e->register_bit_width - 1) << 1) - 1;
>> +    build_append_int_noprefix(e->table_data, mask, 8);
>> +}
>> +
>> +/* ACPI 4.0: 17.4.1 Serialization Action Table */
>> +void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
>> +    const char *oem_id, const char *oem_table_id)
>> +{
>> +    /*
>> +     * Serialization Action Table
>> +     * The serialization action table must be generated first
>> +     * so that its size can be known in order to populate the
>> +     * Instruction Entry Count field.
>> +     */
>> +    GArray *table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
>> +    pcibus_t bar0 = pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
>> +    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
>> +                        .oem_table_id = oem_table_id };
>> +    /* Contexts for the different ways ACTION and VALUE are accessed */
>> +    BuildSerializationInstructionEntry rd_value_32_val = {
>> +        .table_data = table_instruction_data,
>> +        .bar = bar0,
>> +        .instruction = INST_READ_REGISTER_VALUE,
>> +        .flags = 0,
>> +        .register_bit_width = 32,
>> +        .register_offset = ERST_VALUE_OFFSET,
>> +    };
>> +    BuildSerializationInstructionEntry rd_value_32 = {
>> +        .table_data = table_instruction_data,
>> +        .bar = bar0,
>> +        .instruction = INST_READ_REGISTER,
>> +        .flags = 0,
>> +        .register_bit_width = 32,
>> +        .register_offset = ERST_VALUE_OFFSET,
>> +    };
>> +    BuildSerializationInstructionEntry rd_value_64 = {
>> +        .table_data = table_instruction_data,
>> +        .bar = bar0,
>> +        .instruction = INST_READ_REGISTER,
>> +        .flags = 0,
>> +        .register_bit_width = 64,
>> +        .register_offset = ERST_VALUE_OFFSET,
>> +    };
>> +    BuildSerializationInstructionEntry wr_value_32_val = {
>> +        .table_data = table_instruction_data,
>> +        .bar = bar0,
>> +        .instruction = INST_WRITE_REGISTER_VALUE,
>> +        .flags = 0,
>> +        .register_bit_width = 32,
>> +        .register_offset = ERST_VALUE_OFFSET,
>> +    };
>> +    BuildSerializationInstructionEntry wr_value_32 = {
>> +        .table_data = table_instruction_data,
>> +        .bar = bar0,
>> +        .instruction = INST_WRITE_REGISTER,
>> +        .flags = 0,
>> +        .register_bit_width = 32,
>> +        .register_offset = ERST_VALUE_OFFSET,
>> +    };
>> +    BuildSerializationInstructionEntry wr_value_64 = {
>> +        .table_data = table_instruction_data,
>> +        .bar = bar0,
>> +        .instruction = INST_WRITE_REGISTER,
>> +        .flags = 0,
>> +        .register_bit_width = 64,
>> +        .register_offset = ERST_VALUE_OFFSET,
>> +    };
>> +    BuildSerializationInstructionEntry wr_action = {
>> +        .table_data = table_instruction_data,
>> +        .bar = bar0,
>> +        .instruction = INST_WRITE_REGISTER_VALUE,
>> +        .flags = 0,
>> +        .register_bit_width = 32,
>> +        .register_offset = ERST_ACTION_OFFSET,
>> +    };
> 
> We can probably write a macro to simply generating these structs. I see
> .bar and .flags are the same in all structs. The .bit_width can be a param
> into the macro etc.
Agree, however the request was to NOT hide the use of local variables in
macros, so while .flags is always 0, .instruction, .register_bit_width and .register_offset
would be parameters, that leaves .table_data and .bar which just need the local
variables. Is the following acceptable (which hides the use of the local variables)?

#define SERIALIZATIONINSTRUCTIONCTX(name, \
     inst, bit_width, offset) \
     BuildSerializationInstructionEntry name = { \
         .table_data = table_instruction_data, \
         .bar = bar0, \
         .instruction = inst, \
         .flags = 0, \
         .register_bit_width = bit_width, \
         .register_offset = offset, \
     }
     SERIALIZATIONINSTRUCTIONCTX(rd_value_32_val,
         INST_READ_REGISTER_VALUE, 32, ERST_VALUE_OFFSET);
     SERIALIZATIONINSTRUCTIONCTX(rd_value_32,
         INST_READ_REGISTER, 32, ERST_VALUE_OFFSET);
     SERIALIZATIONINSTRUCTIONCTX(rd_value_64,
         INST_READ_REGISTER, 64, ERST_VALUE_OFFSET);
     SERIALIZATIONINSTRUCTIONCTX(wr_value_32_val,
         INST_WRITE_REGISTER_VALUE, 32, ERST_VALUE_OFFSET);
     SERIALIZATIONINSTRUCTIONCTX(wr_value_32,
         INST_WRITE_REGISTER, 32, ERST_VALUE_OFFSET);
     SERIALIZATIONINSTRUCTIONCTX(wr_value_64,
         INST_WRITE_REGISTER, 64, ERST_VALUE_OFFSET);
     SERIALIZATIONINSTRUCTIONCTX(wr_action,
         INST_WRITE_REGISTER_VALUE, 32, ERST_ACTION_OFFSET);

These are the 7 accessors needed.

> 
>> +    unsigned action;
>> +
>> +    trace_acpi_erst_pci_bar_0(bar0);
>> +
>> +    /* Serialization Instruction Entries */
>> +    action = ACTION_BEGIN_WRITE_OPERATION;
>> +    build_serialization_instruction(&wr_action, action, action);
>> +
>> +    action = ACTION_BEGIN_READ_OPERATION;
>> +    build_serialization_instruction(&wr_action, action, action);
>> +
>> +    action = ACTION_BEGIN_CLEAR_OPERATION;
>> +    build_serialization_instruction(&wr_action, action, action);
>> +
>> +    action = ACTION_END_OPERATION;
>> +    build_serialization_instruction(&wr_action, action, action);
>> +
>> +    action = ACTION_SET_RECORD_OFFSET;
>> +    build_serialization_instruction(&wr_value_32, action, 0);
>> +    build_serialization_instruction(&wr_action, action, action);
>> +
>> +    action = ACTION_EXECUTE_OPERATION;
>> +    build_serialization_instruction(&wr_value_32_val, action,
>> +        ERST_EXECUTE_OPERATION_MAGIC);
>> +    build_serialization_instruction(&wr_action, action, action);
>> +
>> +    action = ACTION_CHECK_BUSY_STATUS;
>> +    build_serialization_instruction(&wr_action, action, action);
>> +    build_serialization_instruction(&rd_value_32_val, action, 0x01);
>> +
>> +    action = ACTION_GET_COMMAND_STATUS;
>> +    build_serialization_instruction(&wr_action, action, action);
>> +    build_serialization_instruction(&rd_value_32, action, 0);
>> +
>> +    action = ACTION_GET_RECORD_IDENTIFIER;
>> +    build_serialization_instruction(&wr_action, action, action);
>> +    build_serialization_instruction(&rd_value_64, action, 0);
>> +
>> +    action = ACTION_SET_RECORD_IDENTIFIER;
>> +    build_serialization_instruction(&wr_value_64, action, 0);
>> +    build_serialization_instruction(&wr_action, action, action);
>> +
>> +    action = ACTION_GET_RECORD_COUNT;
>> +    build_serialization_instruction(&wr_action, action, action);
>> +    build_serialization_instruction(&rd_value_32, action, 0);
>> +
>> +    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
>> +    build_serialization_instruction(&wr_action, action, action);
>> +
>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
>> +    build_serialization_instruction(&wr_action, action, action);
>> +    build_serialization_instruction(&rd_value_64, action, 0);
>> +
>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
>> +    build_serialization_instruction(&wr_action, action, action);
>> +    build_serialization_instruction(&rd_value_64, action, 0);
>> +
>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
>> +    build_serialization_instruction(&wr_action, action, action);
>> +    build_serialization_instruction(&rd_value_32, action, 0);
>> +
>> +    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
>> +    build_serialization_instruction(&wr_action, action, action);
>> +    build_serialization_instruction(&rd_value_64, action, 0);
>> +
>> +    /* Serialization Header */
>> +    acpi_table_begin(&table, table_data);
>> +
>> +    /* Serialization Header Size */
>> +    build_append_int_noprefix(table_data, 48, 4);
>> +
>> +    /* Reserved */
>> +    build_append_int_noprefix(table_data,  0, 4);
>> +
>> +    /*
>> +     * Instruction Entry Count
>> +     * Each instruction entry is 32 bytes
>> +     */
>> +    g_assert((table_instruction_data->len) % 32 == 0);
>> +    build_append_int_noprefix(table_data,
>> +        (table_instruction_data->len / 32), 4);
>> +
>> +    /* Serialization Instruction Entries */
>> +    g_array_append_vals(table_data, table_instruction_data->data,
>> +        table_instruction_data->len);
>> +    g_array_free(table_instruction_data, TRUE);
>> +
>> +    acpi_table_end(linker, &table);
>> +}
>> +
>> +/*******************************************************************/
>> +/*******************************************************************/
>>   static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned index)
>>   {
>>       uint8_t *rc = NULL;
>> --
>> 1.8.3.1
>>
>>

