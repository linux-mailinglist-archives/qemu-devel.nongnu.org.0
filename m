Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85FE52D38F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 15:07:35 +0200 (CEST)
Received: from localhost ([::1]:47448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrfsM-0008R4-Jn
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 09:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nrfqj-0006so-Jj
 for qemu-devel@nongnu.org; Thu, 19 May 2022 09:05:53 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:34668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nrfqf-0001so-DS
 for qemu-devel@nongnu.org; Thu, 19 May 2022 09:05:51 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JD1lQk009140;
 Thu, 19 May 2022 13:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=AqrhfqGzS0QGBnse5ELOyASNT8yT/hysh99CdKzD/OY=;
 b=Do7C/nCcfAXClrwiheZT74E0uWaE2947dCr8iX9sRpBM1bDoQl/2tl3wKt1CoTAHreZr
 2SW7DRu617FP69HQOTQJeGsCXvp25Di7ZJkLlKRk3ISfjvtiT5BLQNolBd1z0dWLkt0j
 2coO1vICFVrPbLjoEFllp6Qw4gh4th82rPiWu7NP0SKlVSlmO1thfsUdsFZ+7iVQ2fgB
 67ytYVv40P86/pfdo/HRH+cFcv9FYG8akVpAjgr36LHLRHMdzYTCk4b92oRnP9uvuFnH
 pJC/umQHHvUePRHMU7bk7EzUn2KucWqSbtC0UGdpvMZmCGI+P0MX93Hh87ETYkUUif+Y qw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g2310v6ex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 May 2022 13:05:40 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24JD0K88010670; Thu, 19 May 2022 13:05:39 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3g22vatfjg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 May 2022 13:05:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ipr7tk+NVHRQlUzGjcAShzHzbEfrCb5BE6i6GHTdPK06dHao7snIwPlDr5BlDyu6NJU5QtkV6GMLa9HWxod72vuoIEFrAUpFDsOrdyvnAdU6HxrPbNRB5wNm+DdmsPmzWz4h5A/QvDNt0Dm1+FuQiR20b55BYLX8nrGfi1vXuoQ0lL6OOr2zjxNYI6SBO91CWivSolZKTUHaNaxYeOpAaY/0UDGdHXG4LIOZnDVcslZm/1b7xh0jbFA0MaVXEE2MU6TODltrnUTY5KgkGXvIEJKrfU2YSWL6Nqhp1EeDYVZS9MmQ0/ZSvuN/RsIKwy/fQPw/EPwV0csuS6xi8CHFHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqrhfqGzS0QGBnse5ELOyASNT8yT/hysh99CdKzD/OY=;
 b=mVJFfN0E05wMndOJ8pTJuiqLHQRZe4bfdHkokNRZSlTIWEwl9YQIRLPmfNJl1A1AgyJ/CElZgvdNreM/9/La9JYglC9jRgtWWB9zXmF7FdntJMTJCE3SOqCSuLLykhujhOcex6J0urlUCLS+wWiICA3+nGlhl1Bs70uybd94u0ASOj/rWiJM8vdOOC1kcS4yNFmqdTo5et10M+BVA3s+NvYCxw8PBd8YNjYmjRS88Y0JfM8pr2czR4GngCEeUpMWvunShsi2Bg7DmuOrlfDIlT9F8qty37kbF7+z7cP8U1hf8titAV+Rk+dO1ypcF5kmkFxF7yVuG6ZzyfvhokbSFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqrhfqGzS0QGBnse5ELOyASNT8yT/hysh99CdKzD/OY=;
 b=kZTeWhekSXNWW9suwIvMf/AzPMFPnxCzhMR/w7lO9gt8CR32HERpI8KPn8+OIFCMjFJkin+hs4AMp6JG1EJ/vLuyf/JkjlR7x9a7LuQvwsNMR8o98xvppQXMby84ExqJ/5GmJ2NPYfhaaU17fE0nbWpkFepxbZZwWnRm+oZbwdA=
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19)
 by BLAPR10MB5124.namprd10.prod.outlook.com (2603:10b6:208:325::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Thu, 19 May
 2022 13:05:37 +0000
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::2cad:be53:725f:ba00]) by SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::2cad:be53:725f:ba00%3]) with mapi id 15.20.5273.015; Thu, 19 May 2022
 13:05:37 +0000
Message-ID: <2b64c7b3-a18c-b764-3854-cb14a7432f88@oracle.com>
Date: Thu, 19 May 2022 08:05:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] acpi/erst: fix fallthrough code upon validation failure
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220513141005.1929422-1-ani@anisinha.ca>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20220513141005.1929422-1-ani@anisinha.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR18CA0010.namprd18.prod.outlook.com
 (2603:10b6:806:f3::9) To SJ0PR10MB4542.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf7f1ebf-99ef-4aac-362b-08da39984462
X-MS-TrafficTypeDiagnostic: BLAPR10MB5124:EE_
X-Microsoft-Antispam-PRVS: <BLAPR10MB5124B05A44B23B83FE0F576A97D09@BLAPR10MB5124.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uMnOzxRhfBz8RdkgMp5/DXFCdWHTyOsBP8rQD09w4LfqH8moX0OgPRmPilw34yOczvLWF+md3BAnuHbGwQ9s9le74T/J69R1Ci8pyJHuxix/tgD0pz+x5iXv3bK2Ku9ZJYSO3giI+dtFZjP1A2fOri25zbyDdVnWIXKNqzCCQhHx2d8J4qfLAe/Vu+6HmluhksL3ltrhDfFKzDwz5/FI8LWoXEBBIUPQ5vvVhL+jkfp3sF1PF/cUgxYsp9wYy4NAm3E1qBl/44l9fm/zPwwlD/PYH25SgyDPg+8enClqM4epb42xCb2Ytl/Qrao0CxYHafSoMK3P69Y3NwHwA3A7QpxRtGv5U46eWULo6x3hdUTqI9MztiZAI6NtrpmtIIQoVLDwX83FWOF/lSYPalsoGNkrSISECmM+GgXwMIMgjIB4AkWslnZh6y8FP1D+LGi135avqa0N3c55x3kxaZp9Uv4wpenoBdFiGCm6mOdio2s7+7icuHIt8T5nTRCqqMPYYmLkQVTSDJN8OJMigkVPfJVZptZZgmFwJFk2vqsr39k999oLtncopV30+RVAZaQqCIFuN39BXPo1U757I6a6NP7Vox5qXg9tMBhp5hrCCvRoAz3/sswEd+aTw4UooTXdZI73SIr41F3ItTmBTCGkvAbknBRzZyV5QzVVK55OpCimqUUUgGr0jx84ZFBoNHOGioy21sn3ScU/SccQeVDLddvqbQfIaqEjX7p0nq25X3w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4542.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(508600001)(66476007)(53546011)(4326008)(5660300002)(66556008)(66946007)(186003)(2616005)(31686004)(83380400001)(316002)(110136005)(36756003)(6486002)(8936002)(6506007)(6512007)(8676002)(38100700002)(86362001)(6666004)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHlzMDhmSExpVW81cXhQc2xGT1FvMVdwemYrV2xhUDRPdEQxS1hQSW55aWxT?=
 =?utf-8?B?eUJhUFlIcnJYT1lJK2NrL1NUNjBlVFp6S1l1MkV5bTB4RnRiOWRuTHBSeHcw?=
 =?utf-8?B?ak5NRHJUUlJ0VTg5REpIQXlkL1oxNVNkQ1o4MmwrNVVVVnlWZG1aRHVVcEha?=
 =?utf-8?B?blgrZ0lTaVJzejdqZU9ZZ21kcmJDSWRhd0pYclJXbloyMkhwbHd3OXdCTzhy?=
 =?utf-8?B?QW9TUGpPd0Y0OHlyYmEvcDZKaHFTaWg4djBZL1k1cjZaREprcnBkRlh5WG5D?=
 =?utf-8?B?cHVMMzA2U1lBYlhXSTFVRTl0YUpzVENvVlp5c2xud1I5clpDb0VIOXJsMlU2?=
 =?utf-8?B?ZGJ3WXlUUThQbWJMK2N0Nm5rQkFnQmV1NWF2VEdTZzJlcTVLQXBTd0czallS?=
 =?utf-8?B?K0FsejltS1g3SFpHdWw4M1RxZmlEZHRtNGo1YVc0NjdlOTN0cmgwRk03a0Nm?=
 =?utf-8?B?bmxLVndrLzRlWFEyUE1QVGVVQXN2MGNJNzhkVXZ2SitWenVuVUFPNC9WcDNl?=
 =?utf-8?B?NG9qY2Jxdk9pQ1o3UUxJdmpMcjJFMEVrdHNiOUZ6ZFloRUZPK2VBQTR4UTg5?=
 =?utf-8?B?MGtOQWpya2RnZktDWEVtYTNQTTNSTkhaQzQ0Q2E5Rkw5eUpzbCsxMWVKWjlN?=
 =?utf-8?B?QXg0eUJFdUZ5aktDOFN0WS9yRy9qMlZQWlJMaXE2bGVpejNIV2VzcERpRFpa?=
 =?utf-8?B?bGhvdXJnZGVrdW12NHlpWkdEa1NuckpwUUVXUWhiTkI4MnRZRXpMczZ4T3JJ?=
 =?utf-8?B?N1pTN1dWRVhzYlNEOWVRNUQ2M1FwOWVRVDJndUFGSWFEdFJIRzBCNkxCV0d5?=
 =?utf-8?B?ak41TGJYbEhjenVEcEVRcTlST3V1aU4xeFhFQkdrNTFFOEFheHlTYXlWTUV3?=
 =?utf-8?B?c0l0WTA3Z0tNZVpUSmZNOTRBRW1UQ0c0YXV3WGZJOWlJU3Q1VVRLUEltcTEv?=
 =?utf-8?B?emNKNitPMXpFWWlsdkRvME1hZmloUkQ4ODJ1R0JWYkI2eHF6aGMreE50VTJ1?=
 =?utf-8?B?OEhFejYwaHVteklHQ3AzNE5DMGJHK0F2T3NESFp4cUsrYmNWbVdXT1RjRnB4?=
 =?utf-8?B?eVBYSFVucEpoZk9uOEVJZWZSblhrN0xmbloyNUV2bXVPREJ2NkVhRWlBM3d5?=
 =?utf-8?B?cVVFemVnMy9iYnhydThrMlN4MjNrRWJkM0JQVjQwWjdVc0Q3UGhlMWlESXZl?=
 =?utf-8?B?b2VpeTFiWWFZakVWNzA2dmxMa0tIZDdOQ2JZejc3c3dLalBtZitFU0M1Mktj?=
 =?utf-8?B?WFVXdm91Ynd1S3NPU2wyMjFMSTk3UEVPSjNiakxDeDFhaWZVc2xWS3V4aXBB?=
 =?utf-8?B?QjVBL0c3ZFd3QWwrZHFONTJqenJTclFBK0NUbVgzTDhlZ0dxNEtrck1SYzRE?=
 =?utf-8?B?TWFldkpIRDV1QTBVbjlHbk5VWE9WZWN2ZTh6ZDl6TFN5WEJIS3hoV1BtQUlB?=
 =?utf-8?B?c1kzYlRRS3BoNFpZY1RqS0pONkQ4MHd4R0s3bTdGYjkxVWhxTVUwdHF5c1RB?=
 =?utf-8?B?YTNERkJITThjak1qZytyRlhXZVFiQXgxQTBtK0h3NmtMcFJ0aDN4ZjN4blBj?=
 =?utf-8?B?WjNyMWUyTGN1OHM1dWZ0R2xTQ0t0SkZSWHpHVWZjWFpSRVJTazkyaGZob0tU?=
 =?utf-8?B?UXpQeG5TOVFQV2ZTaXJzMnpmVjkzVTZFK2FFOVcxSVQ3RHptdkRycW9YWXBh?=
 =?utf-8?B?WFk5NmJ2dWUrdFZZUEtBYVJHeVpJR2ZzTml5aEkwRlpla0dRNU5IUkFQb1F6?=
 =?utf-8?B?NXdaVWxiMm01NkgzN0RQVEs5QjNZdWRXU20yK0tjN1RyTDJGY3VYUFl5a2w1?=
 =?utf-8?B?N1RHcy9WdG1TdXVBTkdvdjRseXM2RWY1TjdLSWRHOUkxTmhXd0k0ZnhidWx5?=
 =?utf-8?B?SzdyaVdxUjVVUWF6dnFKSXhMc1JXNUFrREMvWEVjd2tmRTdsMzFJb1ZTMUVB?=
 =?utf-8?B?QndJR1VrTHg3L2xmR2tFNGFoRTlMWC9TbWpJa05OcHVzQVVjWmFWVWpGSUlS?=
 =?utf-8?B?ZDdUSGhNSGprUnJOQ1V5MWtnTFFUM2N0VWtkUVZnVkJlK1BOeDBkSzZ6UkFE?=
 =?utf-8?B?YTM3K21wV0Z3SERQb1dzYlM0VWJrREwvWVRVYk0xZVBQb000dlFZMUl2RjZt?=
 =?utf-8?B?L0FKUGJMc0FxZU5uK2w1SXNSblNXTnRoM0NhT2JQc3BRUkpJOEE5UURETGpz?=
 =?utf-8?B?c25TdWZtemw0TGI3K3E2bmxPVmY3K2YzTWhpTnFtdFl6UEFFTVNvSU9mL1M2?=
 =?utf-8?B?dWNsbjBiSVkxb0JFY2xvVm10NnZpb0J3WU42cjduSDJCdjZGWmlIZ0w2TFNa?=
 =?utf-8?B?REF3T0Q0ZkIrSWJZTmtUWmpFNjVnc2FTK0Q2ZjNRTGtqS203Zm1ZdXhlaUxs?=
 =?utf-8?Q?lnWZZZS6A9JVDvEsfbRfrRLgWUOGJy+2B2FiM?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7f1ebf-99ef-4aac-362b-08da39984462
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4542.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 13:05:37.4091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDZ5G9NTXqzgn2izl5d/Ea+KYUkiIwhYUGzzH/t7K5HJxm4lc42tnRTCyjIl9bfra+WmnuBIiHMYILuOjijvYFnxSQhdyo2arzM8cnm3Yl4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5124
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-19_03:2022-05-19,
 2022-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205190074
X-Proofpoint-ORIG-GUID: Nk5edGeqdpqq374Uhx2ATyCJ7gRg2pIA
X-Proofpoint-GUID: Nk5edGeqdpqq374Uhx2ATyCJ7gRg2pIA
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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



On 5/13/22 09:10, Ani Sinha wrote:
> At any step when any validation fail in check_erst_backend_storage(), there is
> no need to continue further through other validation checks. Further, by
> continuing even when record_size is 0, we run the risk of triggering a divide
> by zero error if we continued with other validation checks. Hence, we should
> simply return from this function upon validation failure.
> 
> CC: Peter Maydell <peter.maydell@linaro.org>
> CC: Eric DeVolder <eric.devolder@oracle.com>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>

Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>

My apologies, I've been away for the past week.
Thank you for taking the time to correct this issue!
eric

> ---
>   hw/acpi/erst.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> index de509c2b48..df856b2669 100644
> --- a/hw/acpi/erst.c
> +++ b/hw/acpi/erst.c
> @@ -440,6 +440,7 @@ static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
>           (record_size >= 4096) /* PAGE_SIZE */
>           )) {
>           error_setg(errp, "ERST record_size %u is invalid", record_size);
> +        return;
>       }
>   
>       /* Validity check header */
> @@ -450,6 +451,7 @@ static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
>           (le16_to_cpu(header->reserved) == 0)
>           )) {
>           error_setg(errp, "ERST backend storage header is invalid");
> +        return;
>       }
>   
>       /* Check storage_size against record_size */
> @@ -457,6 +459,7 @@ static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
>            (record_size > s->storage_size)) {
>           error_setg(errp, "ACPI ERST requires storage size be multiple of "
>               "record size (%uKiB)", record_size);
> +        return;
>       }
>   
>       /* Compute offset of first and last record storage slot */
> 

