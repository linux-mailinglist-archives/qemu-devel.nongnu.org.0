Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1FD6AE19D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:05:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZXwJ-00008L-HD; Tue, 07 Mar 2023 09:05:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pZXwF-00005R-FO
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:05:11 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pZXwD-00025K-9C
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:05:11 -0500
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32784JrK032103; Tue, 7 Mar 2023 14:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=iFsyNU6Jay82zgOwaH8gu8MEnImvkalxOOSi5uN0RgE=;
 b=pNSGYRS6EulCvr3c/I525HeNI53yU0Bm4/NJL4FwTSzpgf8KoQim2GrT59g9/KDeGjXD
 j/1ut9oLI9BuMSccmv5I93cCfbHUHh58N7f0kZJ/1voeuHRfDjCyBuaIxp3nU593+39G
 LkcgsG3au9rHUDpUHD45fZ9WF9ZKKv7iM992NVGkDQD7i35TaDSEb8LJZdlEqfwyOMhi
 8tD2zJKahogtTYW/wC0T33Rq8P7j8lPRsDvUcbaujxhZ91D4sN1aaR1K0yKyCu7L74U2
 TsSEJVJQZwnKLTZhs6GUdE6h64CUL3TF1UDpe4bQzALVlIV2YWHuzUYznrknZd7P0p5p eA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p418xwj8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 14:05:04 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 327DirV8023407; Tue, 7 Mar 2023 14:05:03 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4u0698br-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 14:05:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8dYcryqW6LpY0ZtomAP68ELy+B4XwR7/Myc1bZJdvcYrQRtm3N0E0f+XQ/A0Ei/jiKUS8l+MAGWIYnV9EzmW4s4ggieHeNLE742F80szZu03ynQao0/LpTI1m+G3YaKukFJxJt7twRqIZnyADqvB4Xa6dwFWKydM2rxjPegFVNgcE84zQ2Hza3uvggH12PhskdILnG36Hg5LcHDt9ga6r3OU5s84LCCzs4NMpyXEo3ihzawfoyo+/PopqrywG/vzl8ld9RqsiTfBwtVk/c/CAirnpvO4H8/zgRR3mjazxnzXvUJ2txmjdGUP291YkjqqsicAI2aHzRwxkBu2osVng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iFsyNU6Jay82zgOwaH8gu8MEnImvkalxOOSi5uN0RgE=;
 b=IPgsTTlCnIWIPmD4/SF2CEbd9BoE1a+Gn/2Shdvo4NoOQWoW2QHaq/ZLJQOfxW66RFix0HsKN2dHKjPnMMsO6vahHXvuIOENFxSlxzrL+ZSTkGPwKepbfvTozGrl/xdbKj9XFE5BaBQyeVZrZ141pgI/3SJSXCMpXTHbOKPea/wCPhuvkQPqRdXeAjixB/SHrg8CoGQTUTCWf+PIDIvI6WK1dzN7CSF4HL9x1RWgIydVAkUZhOU1ncScE7yX/3BDRWDIwZW0UWMudLPvitCoTiyMFqeZntvkl/GrFAN3wnbjpQ3QcnWlDLioUoz4q14PoWO5VYWcCbnhkGjuRXumww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFsyNU6Jay82zgOwaH8gu8MEnImvkalxOOSi5uN0RgE=;
 b=ENfYrBHL3XokYiNN8w4ExPT9K3Thz20Z6mO/D5g7JFXLDYyg60YU/NrtsRgVjsF55HEYBPOJO55EYeqVYC0DmenYB8hT8MMozYRxLyJj8Vlk2ZHfdLjBSA4EDYbMaAFCZ9/KLJKo/6qkkTBMmZI+YHijDrU/8W6QIkBBSMyXnKA=
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by DM4PR10MB5944.namprd10.prod.outlook.com (2603:10b6:8:aa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 14:05:01 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::5567:5290:8f6:4ecb]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::5567:5290:8f6:4ecb%9]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 14:05:01 +0000
Message-ID: <0f3dcc76-45b5-ad62-1c03-e2fcc58aa701@oracle.com>
Date: Tue, 7 Mar 2023 09:04:55 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V2] migration: fix populate_vfio_info
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, quintela@redhat.com
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <1675796553-235469-1-git-send-email-steven.sistare@oracle.com>
 <ZAcg39dY/kPK1Vjz@work-vm>
Content-Language: en-US
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <ZAcg39dY/kPK1Vjz@work-vm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0247.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::19) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|DM4PR10MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: 74879551-e8d2-436b-1c6d-08db1f14f15f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +GwyrqjEBHai8X42jJuPgL/NaZGyLG2V2sZITOZ1CTB35hzH4+AnlG5EEQ4b45oFh9TLDMGkh25OLFBbDCHLUICKBE/2/us0Vijvm7NXL4WPHc+3U/ll6xSTj1uZmAP7ZrCJOx16r6BVemrmKgcsTPvb+2Hzofj6wb4SYcKGMIp+Kn/6GB76KgSsA4HJM+8J3z4t9iVj3dGc1SjrKSrr7FZhxaOY1lpbbUepiIZjXaQtCMrzP0d0X1N5M5IRReZm0JKlAw3QgptkDRfFr81KLT1CvFC1XwrhqwEyAs++pR/4+PS2S1SyqnGHDxrHNWC6CCvjSzdAHy6SMPwsTvXHDrYJpB0Go3+99LycIqRlc1wJTCnR9hkOErR1xeLCxPjJjIa5IwQyaoK2WmOYAgKt/zNpLICd+dg72Rw4KOR+GLe14+AibP+e5EWXZHTYmOvBXBfFlbPX0taehkVXHLkEDQ8EcnmFuxJdkvqaT5nHg0SBvij6eVF+39e6e7M8y4yG7B1dQZgXrCEOfk3QXIlXpelQRi44SbbbHinp/bBo2CLc9lsU7yQZMH27Lxlf1CeTarrZClx9kcJdbOlBrd2xKbgu8/wlkHWpWdNfi3EDegIKorVIYlj0DuSMJww/qgie/lrhXrPr966rUXpoXqaF2kUbhsIbA2f+E5P0v6khpqyGHkk5hYHps1gnyU47W5eZfzVTMDOKM8jjc1uRyy6TaIwxZdr4yV2OoSvub+Ws2j8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4684.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(366004)(136003)(39860400002)(376002)(451199018)(6666004)(5660300002)(478600001)(86362001)(31696002)(186003)(36756003)(26005)(6486002)(2906002)(6512007)(6506007)(2616005)(53546011)(36916002)(44832011)(83380400001)(31686004)(66946007)(66556008)(66476007)(4326008)(8676002)(38100700002)(8936002)(41300700001)(316002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3R2RldGczdLSzdOU0p2UU5kdXQxa0ozamVkWTU5c1BWV2dlQitmTHZqYlJi?=
 =?utf-8?B?QnZKeHBIZEduRitZTVFvREV4a0dNSWVLRmZDbEN3SzgzckFqekw0MUNnVks0?=
 =?utf-8?B?M1NCQ0lQTmhjbmtreVlXamdaUVdXaHZ0TkNOdUdaTjI0cW1jakFzUmhHVlhO?=
 =?utf-8?B?NjVMelZaOGZLUmZRVUtQYVJkQXIxTVpTaGIramJucElFWU4zMkRoUzVOK2pw?=
 =?utf-8?B?Z0RkbHEyOUlSWWxwK2t5WVRTdE9Hb01naSt2TTdRMVRqa1lQMXpYNkl4SURw?=
 =?utf-8?B?SHp2cGNMbzZQWmc4OEYxbGtJYkRycUZ0eDNzVklpeGRBUS9HLzM0TVpvRVo1?=
 =?utf-8?B?c2pMMUN2MzNOT2hHQ1RLQmJyMHNoMnJ3Tzk0VitTc1VVK3BubWlIM3oyVzdn?=
 =?utf-8?B?b1JGSS9RSHdUNnVHWWRoMFBBWjRZMWJRWlRya21DZ1hCV2hhajRzSENwOE5y?=
 =?utf-8?B?VitsNzB2QmlFWDRqMlVMVlY4d1FhdUtpWWVOUFZtU0NNL1JDNzRCdHhZSUVL?=
 =?utf-8?B?dXVrZ0FGWjBqUUN2b2VLa0FTNFd5cy94VlVxYm8vL0RUL09FT2lCR2ROL0Vw?=
 =?utf-8?B?MEJXanJKRnhCbTROZW5EaktEaHJ6Y29wOTUzWHAvQnc0b1g1VHk4THE5NFdC?=
 =?utf-8?B?QzhEY2RvZlJubXRyY0FqYTkwcm1iV05MSCtEUVQzWUdrTFVHSWpSVU9wR1hD?=
 =?utf-8?B?Y3VKNkpVUFVQMlpPZnZoMy9zVGtPVFJEdStDREk5bUxUOUVwM0ZWNC84NWNW?=
 =?utf-8?B?RHZ2ZkFlR3E4ZUNUS0o3KzNSS0FwaDdTamNmV3VlNUE4Qm4rL1dib0xROVFP?=
 =?utf-8?B?TDlCRHBrRDVlSk1QTi9BQ3dLeGFLZGEyL1E2d0UxazlPQStnYThpMDl5Z2tk?=
 =?utf-8?B?ZFN5eWI0YzZ6Njd3UUVmM0kyZmY2OTM3TVM0TVR0S2dhYTJrK2M5c1ZSajU3?=
 =?utf-8?B?dEVYT09KVGd5Q1o5dmlMYjZzOS9IcU96NGYrUHo4Z3lhSDIyQ1NQeXRzajMv?=
 =?utf-8?B?NFphRk5EWW5ZajNPM21Fa3lLeEVLWmhnejFhVlpNZ1oxM0hHM1NDMU5aZVNm?=
 =?utf-8?B?NGtJSHhNZWtDdzZjZE5UQlRjdGtFYnhTMmRDUVc2Z0ZqREExdTdyTm9rbFI0?=
 =?utf-8?B?SUdydWlWOHdCZTdmN1kvSzlkWVBDQUdyc0MyOENlL0x3dFNMd05RVlIyU0pE?=
 =?utf-8?B?WkhKQ1psVjBrL0xmWHJ1RFVxUnNMOEcwZEFmclZHWEN4OUFhTkRwbFpnSEJG?=
 =?utf-8?B?MnFGbHpNc0hmc0tKUUhVdktPbzdQWCt5Z1FYdXpUdzVrQnRuanVYQ1Nua01o?=
 =?utf-8?B?LytxdlVGOFFjQkNraytjNEh5aVc1K1JrbnNyeFFFVmZ4V2hKZlI1UG9MYWVG?=
 =?utf-8?B?TUZrcCt5UmgrR00wWkYzSVJvMDczbDhtb3lEdXR1WEtaMC91N3VvODVKOTEw?=
 =?utf-8?B?M1FYOWRCTEdtOE9aNlRUM0ZURTQzVG9wWEVrcHg4N2w3RTJ3ZnExWkZ4am1M?=
 =?utf-8?B?ZEw4UXlZWWlKTCt4OVhOa2JPREczZWg2NmtjeWRtdUQvODFxSm90THJORW9X?=
 =?utf-8?B?Q09UTEV1WTkvb0xCbnRwbk8wcURxa2E0QWY2bVg4TWpTUkt5Z0VjR3FSbEZm?=
 =?utf-8?B?c3U0NkhZdGk0WHFHejZYSFNFeW5HeU1rbloxUWRWUzArSWl3dFRJVTZDa2F6?=
 =?utf-8?B?YWVNeXFDbDZJY0VpS1hjVUVTaWh2S09xWWZpcmN2UldLUzA5Q2NWalBqOW9h?=
 =?utf-8?B?b1UrRXEvMUtsbm1DRlJFNlp1cHBoeDlIYkdyRkprQnZMUlhCUDkxb093V28x?=
 =?utf-8?B?LzdnZXpmczlqeEVnVUI0cTB4U0ZYL01uZE03ZXpFcEZ5UmxKOEw4RGxaSHJi?=
 =?utf-8?B?WE52VVViOUFqSzV3MUdkdmw5OE5ZOUZqbGlNQXo2SVpqTkxtaXMrbStQWHBL?=
 =?utf-8?B?QlphYlpQeTBVRHFzNXJuUVlnV1h2cDNOMWR3UGRucU9DVituK0oyUGlDcDlL?=
 =?utf-8?B?QXgzaXBnRHZUTnYvRFhlRTUrZGx1eDJOR3BOc0VNSnRVLzBNYm03WnduZnFm?=
 =?utf-8?B?YlJhWE55WWMxSnJRcnpZckYxNGFJcTJiallqRFh1c0NXNi9zTjRXVUk4YzR4?=
 =?utf-8?B?Z2h0OGpOamN3cjFYT3JjYW9CdWpnTUl6Z1N2ZlUzdzJET0tiRzhvMVVyZ2ln?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: hlJqJlbjD2ONYuyLjq87XpRCvuJNL/o/eGbWLKbol+iDo2WhrqQd2YUE7OHEcIaoNmETSMmpGoVjIeGgvD4cFx1x1/xNxvT2cdguzeOQkgwWLAeFfnHMgZjnCI8gyZF32+lM8bA6mcsKbU69E/UgNtJ70qsjdELm/nD2SeAmk+cu/s4goog45S380f0QJPFYE83aW8py1NHakuWqra8bc0ytohHgGodih3c1ao0up5CTdSxSKIY4Lyx6HeWibkPcLFEyGIHeVOzyGL8fwKhKE9DVjAg0rvGFjy4EnkQ3U1dvGCZ41X5gA3QfYm97O5Js8bmeq5i60QFQ+0YQ1RC488PESsBi7msghI3OneFRn8ehmMKyPaSMJOtkEq0+ZXxRryXcSgl/Ztj64Rax/AqTzO4MfI6rYZf0Xq8Dk9t14gcWoLyZKifKOl19OmfJghHsX8zaB+cUn7Aialwzt1PNNYbedRuJeJeBiSh9P3u7fzTg1DR+DfnCLitHcHwwOYrnwfZMRSjNoWPOx1iF7NJ+SDxrfoX/3gm3WTCvWDDna+8mwTGggZSS2LJBWLyd560tBtABIrRIp9x0R+TlsvEw26ofb5wpuMFFE/6pORPylozZzhaaJwFn+Dn3UfGDoKXegmp1g8ZqLumlMnI4zv2PbAPCN0J7gTFCj0TpAbSruTypcLXb65yOsB98LlQVVLgx3DULPFSiAfdLXLKI3V9unWctr8/xGT5np+y29Ryw+doIVCizFBft8I/UyujfVeyOL1nv1GaYB2mOzSwe0Zq+Yw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74879551-e8d2-436b-1c6d-08db1f14f15f
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 14:05:01.4593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8pwnUGsOlZlEwqh/3cyi/2xfg3n+wDNrdIpQefohGU4cvftblWS9BWpnmsgl2tl2ZFBQu4o93hYVVpM0fa1sPpmKVAdsOCXgdpgV+V/SdTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5944
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_08,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070127
X-Proofpoint-GUID: tHEwg23ERP-ncU9i2vZsRBv_muwxJrf4
X-Proofpoint-ORIG-GUID: tHEwg23ERP-ncU9i2vZsRBv_muwxJrf4
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/7/2023 6:32 AM, Dr. David Alan Gilbert wrote:
> * Steve Sistare (steven.sistare@oracle.com) wrote:
>> Include CONFIG_DEVICES so that populate_vfio_info is instantiated for
>> CONFIG_VFIO.  Without it, the 'info migrate' command never returns
>> info about vfio.
>>
>> Fixes: 43bd0bf30f ("migration: Move populate_vfio_info() into a separate file")
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> ---
>>  migration/target.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/migration/target.c b/migration/target.c
>> index 907ebf0..00ca007 100644
>> --- a/migration/target.c
>> +++ b/migration/target.c
>> @@ -8,6 +8,7 @@
>>  #include "qemu/osdep.h"
>>  #include "qapi/qapi-types-migration.h"
>>  #include "migration.h"
>> +#include CONFIG_DEVICES
>>  
>>  #ifdef CONFIG_VFIO
>>  #include "hw/vfio/vfio-common.h"
>> @@ -17,7 +18,6 @@ void populate_vfio_info(MigrationInfo *info)
>>  {
>>  #ifdef CONFIG_VFIO
>>      if (vfio_mig_active()) {
>> -        info->has_vfio = true;
> 
> Why this removal?

The has_vfio member was removed by:
  720a252c2651 ("qapi migration: Elide redundant has_FOO in generated C")
The stale reference was not noticed at the time because the ifdef was never true.

- Steve

