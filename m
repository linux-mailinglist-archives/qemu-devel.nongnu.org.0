Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D756A4B54ED
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 16:37:18 +0100 (CET)
Received: from localhost ([::1]:55926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJdPi-0000Mr-08
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 10:37:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nJcv2-0002Rb-UY
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 10:05:37 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:6206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nJcuw-0008N1-H9
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 10:05:34 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21EEofwY031159; 
 Mon, 14 Feb 2022 15:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=xzZU2a47uYeh6oBr60mcSH3Ki6RO3W20R71z59gkPQE=;
 b=fIRgw4SnqiCpUUycGhiKLaS5MqLuumY8/jKsLpIVENSb9GIulo3ghryMj9ke/GTbdalI
 GxgRjyCV/KULDspX2YBGlJk3bgU9vXeSMUP0MqLfjVK+X9bvKlz0R4ZG4IW5GEu3qemC
 /QH8N57n0Sk30H5WaQVS1gv85DUNrpIqSlAFEaOJcah1rM4G8EfiRxe56xoZ4+NLlWNX
 8Rs3rhTlD3OS65u42t9US7ROSAhqPF3xF/t/59o3E1VIwfTSakXZBEuzLTSHEGTvGXca
 43glL5WrPHxXUVE3/tugbky1xHLKC4MntSUhKCVsHid763VHG3STsHDN01Bvvwrnk/j0 9A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e64sbvhfv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 15:05:13 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21EF0Tcp109118;
 Mon, 14 Feb 2022 15:05:12 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by userp3030.oracle.com with ESMTP id 3e620w42vr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 15:05:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdLC4rCfm0wfIdoCTspcAuBq7IfeH9QW9mNLvAx4HE9LDr7PzAfiG/mLTqWPQ4gSekQjTmCbxTU5xL7hJhBJxWnpwvtrIBR/djps1lCW1PPdgFUiiFprq0MkJUf3aTwEfSls/u0FLhLvjnbgo0EOfsD17SY5MryX5/bMns5oas9MJyYEEIRlyEOeZ4N/F+IkaX0YxeZYQvW7FjztJw/V2VMPcz78hFqOpaKKIviYXBQ79jRau6qxJ+JUCjggT3iUn0AY1Stq/hkIojG9iR5d3wg+LJPqiu7plzpyFxBykcpQWVZXD9MevN+2aj71O0EB+SIbbglN5hjpMNKMJDeBOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xzZU2a47uYeh6oBr60mcSH3Ki6RO3W20R71z59gkPQE=;
 b=IS4dt8cBcUmONL+SARvq8AzypKSXDSP4WsvqrSfnDy3SYCdfYbbpBwuBcowDhIa1+o87E4j9YjP5pspdy10iIH/1eWauxoFSdYrOGq/juBfdn9Y7aKdiny8021RNuOH+G4nNfBHD6XYouZX36n9f8r8BTfAE48TIZmkbW35U0i+xSvrrzSHoX1tRQxv6XKerlbu6gFV/eyviamHPMTSpM7IQiUj67Ux9NAn7uVaiI4iyJ55cKqKhh+FEDQU47BNPRSNZpk/hAsgz3+kySuYhZiip7VoVlzGQ/+j9KSymr9+CJfI9OzCx4S0HHA4EZD+0cutQ6lasL3LxM19mkL2xmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzZU2a47uYeh6oBr60mcSH3Ki6RO3W20R71z59gkPQE=;
 b=BZvVcOFiSpwBounvb4T/r7+eSpx7sOCqKxfmMzovfW/8c52oNZyDPxTcTeb3uEnv/S/H58GM3wPuJyzxd7dAMU0h3FkLBGXt91CBjrspE0hEZMBpIFEbijQ7gff9Jd4Jp+05d470mJ+/vi+OXLwtUqgzcZuuihPpg3WFgkcw8po=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BYAPR10MB3237.namprd10.prod.outlook.com (2603:10b6:a03:153::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 15:05:09 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::4910:964a:4156:242a]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::4910:964a:4156:242a%5]) with mapi id 15.20.4975.019; Mon, 14 Feb 2022
 15:05:09 +0000
Message-ID: <fa172a19-5db6-a844-27d7-8497d306024e@oracle.com>
Date: Mon, 14 Feb 2022 15:05:00 +0000
Subject: Re: [PATCH RFCv2 2/4] i386/pc: relocate 4g start to 1T where
 applicable
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-3-joao.m.martins@oracle.com>
 <20220214155318.3ce80da0@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220214155318.3ce80da0@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0401.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::29) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12f808da-4aa0-4207-295c-08d9efcb6448
X-MS-TrafficTypeDiagnostic: BYAPR10MB3237:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB3237885A912B4F0061E4AACABB339@BYAPR10MB3237.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gf3wMu02sGfKL8Ji7uX64jz613/YoILADaKp4sBeMZZf1F1JzXYy04Hqdown4oqj1onzMLe6G+XcvPJqoWJmaeO6sZD2t8hUVQgXHiu0F8LdlZMmpbC5o7GhL0eEcQjv1a0vaL18Ig/9nF7l6kwJZ726B5cdFnAKilni3qwt3mD+Hj0p1yNTi5A6ZPjPpN+ckOCLnQnbfWJbCv+/YXv09SH1zFNIUIjWtxsAKfFjETEkIo5fNas/xME9/HhWa/y9JN5lxgORkYLpWab3XT2Euq0DAMhZIKKdQcVeiB1Kk/K+brfuiKix6s0+S9RLsyOaAt214q/1J3MMuD+XaGUbRq8BYCK52HWzDnYix62xxWQP+rIQXnzQTzvfO3p5BDT+SP7a69WtIe8XXi0Ji6FioiC/lD9Q6pe6JQruBhebzXUT0QdPL0nNW2vYDMJV4H26z6yHsL2WNhCm/eDE3f+tGtfI1q6BK4NRlMkB4J/ZmAxpu5bXACySaibWEBEd1EbLqpMOYx6MBZfLWGNpmlnAPhccPkLnCdNR+RPSEhub2bmHUhdur+P7u/yxhUtO7mlg3FtRM/JsRctnnlvLE9kp2CGm0S5p/hKZSpCzKljNxIIvzHIa1U7fbkIaYwjv355auxxUfbN0nLG6rplMBnz/0G8tfWnR/6YetO0BAyUGiGqQl6WFWKfPODWot5K+NrRyWiDaxjY0MipC+OXu4cBwAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(6916009)(2906002)(54906003)(316002)(8676002)(66476007)(66946007)(66556008)(86362001)(38100700002)(31686004)(6666004)(8936002)(31696002)(5660300002)(2616005)(186003)(36756003)(26005)(6506007)(53546011)(6486002)(6512007)(508600001)(83380400001)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qlh4N0tYQ0dsdDhuV1N2RHFuM0ZBN3lyZ1VwSzV0L2VMU0w2K1JmQUptRUJK?=
 =?utf-8?B?SDVjbWpkaVFHY2JGaTdpRUlkVk54TDRzbUVabDdxZkFCWWtEa1F0UVRudmt6?=
 =?utf-8?B?NkhHVFo5VC9GNDZzZ2ZKVjQwQml4b1daSGdsd3dFRE8yS0N0NUIrZmg1Tk1h?=
 =?utf-8?B?bHozdEtabmtMRDVjUDdiaXlLQlJOUlBVQVhDSmxPZEhnZ1RiQTJUZHJ6anBs?=
 =?utf-8?B?SEthMDgzOFlhc0pkZkRUaGt4bFl6RXRFRnpuK0I2MStlbUlZc1dDQ3h0TDQv?=
 =?utf-8?B?bDY3cTB3aXdudWdGRDhjWXkyenMyMDg5QWNiN1JZVVkveFFuZERTMWdQVG9B?=
 =?utf-8?B?aXIyL0x5T3BiWXVRSWlsa0MzbjBmRWVZcFR3QXBWb3RuZmNyTGtCV0Njc2hx?=
 =?utf-8?B?YU9hcmNVWVNlZnZTbG5xcGlVYkora0dTWThSWUZ3QzYrbVBRS3FLN3dUc3VG?=
 =?utf-8?B?UDdhQlN0alJ1eVpjdm1kZ2g4QVhMMk00ZXZkbElhYktDNXE4WUl5WTRTMXZ1?=
 =?utf-8?B?N2tPbVY0Rm9lR1NxdTRRZFN4ZG94aVZsemVuK0tCRDVRTGhIZ2hKL2Fld09U?=
 =?utf-8?B?Nmp3bm9rdFVBWnAzMHdLbGVlUVNxVFNObmVyU3lvdXF0aTRQaHQ2QTNObDJU?=
 =?utf-8?B?blJFRE1odUxwa0luY1JyR0JGRUVRbytYM0ZIMnNEdnVla3MxMkJVOFVuZ25B?=
 =?utf-8?B?Um9pNGgwMkdDVGt1MmJUWThjU3h4KzllZFdVU2hPZElhQ3VIUlZjUml3MGJR?=
 =?utf-8?B?RUNiSk10Z0N3OGFOMmlVLyt4MCtualhSNCttcXdueDdReFBMSzhnaTZManZh?=
 =?utf-8?B?RXRQY3ZrVHkvcGo2K3JYQlMzb3JnaVJad1hDeXQxZDVRNjFBTmkzV1FzbWJR?=
 =?utf-8?B?bXRJVVJONUpITVdlYVhsZzZ1ZU5GYzFZS3E4cEVNK1ZZVzRBMURoOHUwc2dS?=
 =?utf-8?B?c0dVSEZkVjJGbTU5R2syekQwUGhyRmM4UEExaTA4QnNXNjQwVUdkd3BxQkkz?=
 =?utf-8?B?Ly9GRnJ2SVVNcjBsWHRsR2FqMUhoeG14eEF4SE9YTTZ2RjNwVjhiLy9WamVF?=
 =?utf-8?B?c1VpRUN0UkN5Vk9lTWtrdEtUNjVEMm92UllLQzBXU3JlS1ZxSVIraVN0M2Vz?=
 =?utf-8?B?ZDVwTFVpYTc3SDJkSGp1djlwYTR0WlJrMjQzd01WTFh6enBYZzlYNUxVVDNM?=
 =?utf-8?B?U1p6dFNvUlozWi9MVjNKcklGTERjci90Qnhsc2djNTY1YUF0WmxJY1lrYWxU?=
 =?utf-8?B?djJzMis1d2tNRGVBOHhFY3l4WTNwU1ErTFkvV0NWNXQ3TG9yVjA4bERhM3hJ?=
 =?utf-8?B?bkpyeXRVTUFBbDZaRXZQZklQZDJqT3FCTHdNYTdJMDIyaWJtQXZoc0N5a2Uz?=
 =?utf-8?B?K1lCU2txYlpUMWU2ZUZNMmx4OGpRMnVLNjBSTHhVK1hmbVVna2hlQ2k4RytM?=
 =?utf-8?B?bmx0Z3ZoWWlPS0RObkQyY2JaeDZTNkJSTzFlMm5FZkJLWTJDRm54RCtkSGIw?=
 =?utf-8?B?TkNIYXd4S0x5Rm9ZaWVSVlhGYkl5RW9qZFczYWlTQXVDTys2VE5OMU53MTFn?=
 =?utf-8?B?MHRMeUJ6TVN5TkZ6dDgybUJEZlQvNXk2MzB3dzh4NmdOaGFGTkpDdzZVSTU3?=
 =?utf-8?B?WE5lTFVrYlJSYnNXZnErM0RwYlZJUWhGeUNTSkVLT1V2V3dHNE9qWWkzWDBG?=
 =?utf-8?B?S3E3VDNFOWxuajRkQ1pZVFFjdjBMcWlxZTBZZTY3YjJUbjNSTExiUkEya2Nh?=
 =?utf-8?B?Yy9vZ0d1RzQ2aEpFMU5mNG1ucW5lV0VIUXZGcFVRWUlkUU51TU9CL0tORlF5?=
 =?utf-8?B?WTJXY3BmUGI0cFFFWVdZQnErNCsyL2tod01uODR2U2lSbXJXTHVaZWoxZDZZ?=
 =?utf-8?B?MDRidDFaeHdXZUNHaTRIYjd2ZWFnVk9QSTFWcUFzeE5IV3dObGQ5U0wzTkNs?=
 =?utf-8?B?azN3Q1BRZndZSGN5Zmh0alBFRWg5VWxlYjhIS3RIVXBCSC9hL3E1WGpsQlo0?=
 =?utf-8?B?MUVaeGduY2ttNStNT01rNEpoZW1OdDVTRzNEdDV0K1FpVzEwa05tRlB3a0Mz?=
 =?utf-8?B?STVUclJNeHNEVGJiV2NXM25FVjFiRTcrRnNFTVN3Q1hGTUVIYzJSVVhJbk40?=
 =?utf-8?B?ZGRLKzB1WUduY2pTMHRhZjRyaXI1bkhQRWpSa1FxT3pKd3FZQzI0akN2c1FG?=
 =?utf-8?B?SmtnQktBdXFEVXQrNWN0TkZwTEF2K2p0SzY2SzFmZFMvWS9Nak5WY1Bvcm5R?=
 =?utf-8?B?akJyUmRsSXhFUDhEN1N0NUpjamtRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f808da-4aa0-4207-295c-08d9efcb6448
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 15:05:09.2923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8v5M/4GD8ysitUHIyEjGpa4pYC6plpD461B0fIFZuMe89eXFlzbVFJexg0L40WlCt1RIruQORvh7/tQNAdJX+gbyjw18bjrNsZkXr+db8uk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3237
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10257
 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140092
X-Proofpoint-GUID: QZ9xl4FBOK1v6nB_GqINSZvg_GoBdrzu
X-Proofpoint-ORIG-GUID: QZ9xl4FBOK1v6nB_GqINSZvg_GoBdrzu
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/14/22 14:53, Igor Mammedov wrote:
> On Mon,  7 Feb 2022 20:24:20 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> It is assumed that the whole GPA space is available to be DMA
>> addressable, within a given address space limit, expect for a
>> tiny region before the 4G. Since Linux v5.4, VFIO validates
>> whether the selected GPA is indeed valid i.e. not reserved by
>> IOMMU on behalf of some specific devices or platform-defined
>> restrictions, and thus failing the ioctl(VFIO_DMA_MAP) with
>>  -EINVAL.
>>
>> AMD systems with an IOMMU are examples of such platforms and
>> particularly may only have these ranges as allowed:
>>
>> 	0000000000000000 - 00000000fedfffff (0      .. 3.982G)
>> 	00000000fef00000 - 000000fcffffffff (3.983G .. 1011.9G)
>> 	0000010000000000 - ffffffffffffffff (1Tb    .. 16Pb[*])
>>
>> We already account for the 4G hole, albeit if the guest is big
>> enough we will fail to allocate a guest with  >1010G due to the
>> ~12G hole at the 1Tb boundary, reserved for HyperTransport (HT).
>>
>> [*] there is another reserved region unrelated to HT that exists
>> in the 256T boundaru in Fam 17h according to Errata #1286,
>> documeted also in "Open-Source Register Reference for AMD Family
>> 17h Processors (PUB)"
>>
>> When creating the region above 4G, take into account that on AMD
>> platforms the HyperTransport range is reserved and hence it
>> cannot be used either as GPAs. On those cases rather than
>> establishing the start of ram-above-4g to be 4G, relocate instead
>> to 1Tb. See AMD IOMMU spec, section 2.1.2 "IOMMU Logical
>> Topology", for more information on the underlying restriction of
>> IOVAs.
>>
>> After accounting for the 1Tb hole on AMD hosts, mtree should
>> look like:
>>
>> 0000000000000000-000000007fffffff (prio 0, i/o):
>> 	 alias ram-below-4g @pc.ram 0000000000000000-000000007fffffff
>> 0000010000000000-000001ff7fffffff (prio 0, i/o):
>> 	alias ram-above-4g @pc.ram 0000000080000000-000000ffffffffff
>>
>> If the relocation is done, we also add the the reserved HT
>> e820 range as reserved.
>>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>  hw/i386/pc.c      | 66 +++++++++++++++++++++++++++++++++++++++++++++++
>>  target/i386/cpu.h |  4 +++
>>  2 files changed, 70 insertions(+)
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 7de0e87f4a3f..b060aedd38f3 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -802,6 +802,65 @@ void xen_load_linux(PCMachineState *pcms)
>>  #define PC_ROM_ALIGN       0x800
>>  #define PC_ROM_SIZE        (PC_ROM_MAX - PC_ROM_MIN_VGA)
>>  
>> +/*
>> + * AMD systems with an IOMMU have an additional hole close to the
>> + * 1Tb, which are special GPAs that cannot be DMA mapped. Depending
>> + * on kernel version, VFIO may or may not let you DMA map those ranges.
>> + * Starting Linux v5.4 we validate it, and can't create guests on AMD machines
>> + * with certain memory sizes. It's also wrong to use those IOVA ranges
>> + * in detriment of leading to IOMMU INVALID_DEVICE_REQUEST or worse.
>> + * The ranges reserved for Hyper-Transport are:
>> + *
>> + * FD_0000_0000h - FF_FFFF_FFFFh
>> + *
>> + * The ranges represent the following:
>> + *
>> + * Base Address   Top Address  Use
>> + *
>> + * FD_0000_0000h FD_F7FF_FFFFh Reserved interrupt address space
>> + * FD_F800_0000h FD_F8FF_FFFFh Interrupt/EOI IntCtl
>> + * FD_F900_0000h FD_F90F_FFFFh Legacy PIC IACK
>> + * FD_F910_0000h FD_F91F_FFFFh System Management
>> + * FD_F920_0000h FD_FAFF_FFFFh Reserved Page Tables
>> + * FD_FB00_0000h FD_FBFF_FFFFh Address Translation
>> + * FD_FC00_0000h FD_FDFF_FFFFh I/O Space
>> + * FD_FE00_0000h FD_FFFF_FFFFh Configuration
>> + * FE_0000_0000h FE_1FFF_FFFFh Extended Configuration/Device Messages
>> + * FE_2000_0000h FF_FFFF_FFFFh Reserved
>> + *
>> + * See AMD IOMMU spec, section 2.1.2 "IOMMU Logical Topology",
>> + * Table 3: Special Address Controls (GPA) for more information.
>> + */
>> +#define AMD_HT_START         0xfd00000000UL
>> +#define AMD_HT_END           0xffffffffffUL
>> +#define AMD_ABOVE_1TB_START  (AMD_HT_END + 1)
>> +#define AMD_HT_SIZE          (AMD_ABOVE_1TB_START - AMD_HT_START)
>> +
>> +static void relocate_4g(MachineState *machine, PCMachineState *pcms)
> 
> perhaps rename it to x86_update_above_4g_mem_start() ?
> 
Yeap.

>> +{
>> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>> +    ram_addr_t device_mem_size = 0;
>> +    uint32_t eax, vendor[3];
>> +
>> +    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
>> +    if (!IS_AMD_VENDOR(vendor)) {
>> +        return;
>> +    }
>> +
>> +    if (pcmc->has_reserved_memory &&
>> +       (machine->ram_size < machine->maxram_size)) {
>> +        device_mem_size = machine->maxram_size - machine->ram_size;
>> +    }
>> +
>> +    if ((x86ms->above_4g_mem_start + x86ms->above_4g_mem_size +
>> +         device_mem_size) < AMD_HT_START) {
> should it account for sgx as well?
> 
Yes, I missed that one.

> what if above sum ends up right before AMD_HT_START,
> and exit without adjusting above_4g_mem_start, but
> pci64 hole eventually will fall into HT range?
> Is it expected behaviour?
> 
No -- it should not be any reserved range really.

And I was at two minds on this one, whether to advertise *always*
the 1T hole, regardless of relocation. Or account the size
we advertise for the pci64 hole and make that part of the equation
above. Although that has the flaw that the firmware at admin request
may pick some ludricous number (limited by maxphysaddr).

>> +        return;
>> +    }
>> +
>> +    x86ms->above_4g_mem_start = AMD_ABOVE_1TB_START;
>> +}
>> +
>>  void pc_memory_init(PCMachineState *pcms,
>>                      MemoryRegion *system_memory,
>>                      MemoryRegion *rom_memory,
>> @@ -821,6 +880,8 @@ void pc_memory_init(PCMachineState *pcms,
>>  
>>      linux_boot = (machine->kernel_filename != NULL);
>>  
>> +    relocate_4g(machine, pcms);
>> +
>>      /*
>>       * Split single memory region and use aliases to address portions of it,
>>       * done for backwards compatibility with older qemus.
>> @@ -831,6 +892,11 @@ void pc_memory_init(PCMachineState *pcms,
>>                               0, x86ms->below_4g_mem_size);
>>      memory_region_add_subregion(system_memory, 0, ram_below_4g);
>>      e820_add_entry(0, x86ms->below_4g_mem_size, E820_RAM);
>> +
>> +    if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START) {
>> +        e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
>> +    }
> 
> btw: do we have to add reservation record for HT zone, why?
> 

This is what real hardware does fwiw :D

I understand that we you do the relocation, firmware /should/
pick the first address after RAM as start of pci64 hole, and hence
past the HT range.

But if felt that for correctness we would tell the guest that this
range cannot be used regardless. I take that perhaps you're thinking
that you omit the E820_RESERVED just like the 4G hole?

>>      if (x86ms->above_4g_mem_size > 0) {
>>          ram_above_4g = g_malloc(sizeof(*ram_above_4g));
>>          memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g",
>> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
>> index 9911d7c8711b..1acebc569b02 100644
>> --- a/target/i386/cpu.h
>> +++ b/target/i386/cpu.h
>> @@ -906,6 +906,10 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
>>  #define IS_AMD_CPU(env) ((env)->cpuid_vendor1 == CPUID_VENDOR_AMD_1 && \
>>                           (env)->cpuid_vendor2 == CPUID_VENDOR_AMD_2 && \
>>                           (env)->cpuid_vendor3 == CPUID_VENDOR_AMD_3)
>> +#define IS_AMD_VENDOR(vendor) ((vendor[0]) == CPUID_VENDOR_AMD_1 && \
>> +                         (vendor[1]) == CPUID_VENDOR_AMD_2 && \
>> +                         (vendor[2]) == CPUID_VENDOR_AMD_3)
>> +
>>  
>>  #define CPUID_MWAIT_IBE     (1U << 1) /* Interrupts can exit capability */
>>  #define CPUID_MWAIT_EMX     (1U << 0) /* enumeration supported */
> 

