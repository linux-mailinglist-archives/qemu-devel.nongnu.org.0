Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2DD68F630
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 18:55:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPoeW-0001rD-1N; Wed, 08 Feb 2023 12:54:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPoeT-0001r4-LU
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:54:37 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPoeR-0001Vs-03
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 12:54:37 -0500
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 318HmTP9025526; Wed, 8 Feb 2023 17:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=VIt8GPN0ZKTTwjwLuSyrxYhQwl2t1PMHTjLYqH21aT8=;
 b=JZj7YkenQefF0mleWR7ujX7BpSRBho11iduC6N5SOyW1u3wgG2s+499++jNOl/3b3hl9
 5PSWT3/nZdnCOxdsYaVnHw8B/BTNv629GywpPKeTEm9VeG+BlRIYvCEXZyXyeDdotrHc
 jqs1oxJ2BjDVIpbh0v3yhdJPptFNMkq0VKE1SgF+14GORnRCgluzbpYV95Ar2oNbLpN3
 itFlKyvA+9XooECWzw7DOVW5kl37AO30rE3Lv2iGDELyFKfbKUc9139HgI5NFCPFr9JN
 7wmqMxp9jOrSUI8n4L3L7Ibz1uA/VxveUShxg5ISRgwf+ZrDtkKziHXqjv6WniPsT8aV 2w== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhfdcgwet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Feb 2023 17:54:32 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 318Hb2Ai030840; Wed, 8 Feb 2023 17:54:31 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2044.outbound.protection.outlook.com [104.47.74.44])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3njrbc2915-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Feb 2023 17:54:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjl46ENzoqzfuM4qRa2p+BdJt4iu7zuza/Df8roalrrt83sCTmiYSdpbyCDNepyAiWcDx7wvjWs9yPDb4lQ2UQ3nd9mwMStQF3zujEf1922lVzThi+XgD6Fro/rlyuscFkHsrMjLhFBvsGRJryLNRQKWDzGG9/4tpDfNJptTDUJZhtxyMSeGWNRCP/T12s5Fa/YKM+T6jvpjnrKnAfEwrOvMpb3lx7Ghjhjo6AT8dYkH7bxrTBhElCa0FRFraRlGQe3tQhWkj2LUEvDJRoj5PqyQX56r/Pe1kb1zVRMeYEH0ITDhbxigDmKAVs7Mu6E8avdvaVednqr1DZgtqBW5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIt8GPN0ZKTTwjwLuSyrxYhQwl2t1PMHTjLYqH21aT8=;
 b=fW/xkIoPxJ6FQC33LsdVOC5+iLSrlAWX59V3Pih3g8m9z6LvrlGuKwVpFJBGk28MS/VPybokve+6/T84Nh8CVHTScLhYoFe7y91L1NcjjlbpLiY2GuhW7A9j7/18Q4jimiXEBFgSW8o8Xe6t3OqjUx3EIiGJcg9fgvw7ViqfEsap3sKKcSI5DEF8SZXYCVZDdPNeTyVUYvR0v5HCOUYTe4b1LG8ta5uk3OypK780TeBsJbfnSUwaev+GWacHerqJsOBo9RQK7SItnLwPNbgrxExTfvF+Vr3m1JVagnF52Yic8slKjx3kyniu3Ugj0YWc1epHk3CW4HubuWkU6W5m0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIt8GPN0ZKTTwjwLuSyrxYhQwl2t1PMHTjLYqH21aT8=;
 b=aMvKKe3OAsUqZblr9HCzc/U25UpxiWffgesXRNMFMRXSUmDKMSI0seYUAeEZ2As8EHM5IxhXddreEL28Z/b+GTVAUNWHOgkvBspjeMWvoVnebIQmnbdr9gE1RCOzhjQ/DsYs6JdUnfMceFif/hQkNLb3LgQKUwvgrEXZfqfX+uo=
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.11; Wed, 8 Feb
 2023 17:54:29 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c%9]) with mapi id 15.20.6086.017; Wed, 8 Feb 2023
 17:54:29 +0000
Message-ID: <f65bf20a-b81c-2ab2-5b40-8d4b714970a8@oracle.com>
Date: Wed, 8 Feb 2023 12:54:26 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V2] memory: flat section iterator
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>
References: <1675796609-235681-1-git-send-email-steven.sistare@oracle.com>
 <Y+KwNN9v81aLKct2@x1n> <d2cf4bae-1a45-d2ae-8f47-f4ce56cf21dd@oracle.com>
 <Y+LG7Ge3iSKho/oF@x1n>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <Y+LG7Ge3iSKho/oF@x1n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0286.namprd03.prod.outlook.com
 (2603:10b6:5:3ad::21) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|DS0PR10MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: b4617ac4-175d-4ca9-9a3b-08db09fd86a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NcjPa6UsRVJkWIA/CTwU/gctd2s6P/EpQZqpXBlak96zXapii5OyNFK1LJ9rS3pOGFki5vZKYLp001phrx+1BxAPdtyEsrZLvLa15s8Rzg/0SrsatdXEISY+LIMZM+q/mEs7dvpHDnfqEVS4j4lXRlBTPlKruyfmC9hWAt7j3qI/mMh8mcDS0dXO04bDluCK6JBSUiDMJfd8VTnVNbmfuTGnrgMKBV9QSET90DsVw8cMugwIdh/3TmqEJzgBoq2AA+SQGHBBowiZkogAs/kEt/VW6ozuvUazihLcjJ0uONcCAxl8sOQ7S2YYaRnODg3HwHOxgvgs4aqY1RcWgzoh8YHWA3aZkSCVhxQ8eLay6VLm1QUk7nawIcWKcEbQ6K6s9ulAXzphldZJ2plnzTUiGX3bNNq54TEYTtpRCmMrPnztFb3N8RCVcvbiLrPnHS4xFb/AqC0MLECP2BBV5OrwwC92md2uIXwzOM/Cu2OPkbvgi3YiYngrZK4W0qB20U6bvg2rq7qE6TfUfvormWiQOAUFWnwxkm0/Cso+cHoDAgqjlvZUHW5AqQKLWA80tLMGB7LdPQ78n+GNl3X+1W7Puiu3GOIRhglbMgCWmrB06FthwjOZaBdotQpzIlTSjVgdr7WdtvpXlt+4Oei3CFXSWUP9CDsh9I+U+Yut7ZrhDZ6PRTzHJSJIp8Kh5EWYbdhWQYh5ETN49E3iR7YqOGXcYa6KIEGZMf9ySPUk/uho4EW1lTvIM7ZqlgZtpS4AwhjZUDTz3M1EOpd9s4ef+aHSjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4684.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199018)(86362001)(38100700002)(8936002)(66476007)(316002)(54906003)(83380400001)(66946007)(2906002)(44832011)(66556008)(31696002)(8676002)(4326008)(6916009)(5660300002)(53546011)(6666004)(6506007)(41300700001)(186003)(26005)(6512007)(31686004)(36756003)(2616005)(6486002)(966005)(36916002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHdOSGREMGRWS0lpSWZ5eEIxZFRTbjkyR3pvWEhCK0Z2dmJEUDhSS25LZm5M?=
 =?utf-8?B?ZlFmdytvMUdGcE85QmtJVnIrZm5ySGhFVHJYUmhKMTZpK01KYm8ybTNFazBl?=
 =?utf-8?B?V29Xd05pdm5oMmROU1NpY2cyWXJSYTZkaGdaWDRvRlNsZXBaSWxIdVM2L2dS?=
 =?utf-8?B?TW5tcVY4TWNtM01QL0JGUmRvTjZBOUdWSXp4SE92SU9YSHpiRFJEU1pWSTVw?=
 =?utf-8?B?QXY0U2diSmRYNmFRRENGSXRQdnZpc0d3RklKRUIrVmFrVGMyOHAxRGtiSkZY?=
 =?utf-8?B?M1ZhMUJIRUs5clRRTU9BYWpRYVdFdWQ2NHZPUmtybnJOYTgwbHN0cDZZWjZQ?=
 =?utf-8?B?MTZ6ZHJiM1N1SHQvckxXUm16QVJXblhPc3U2TlQ4RzY1MU8zZWxYaEYzdXRl?=
 =?utf-8?B?bHZuR3dTSmo1aG15VUIzVGZ5NEZzZUpsYjkrMWVxcVY1dmxlRFl5U0Z1ckto?=
 =?utf-8?B?YVhNa01INjVIbldZWG5Idm9yK1kzK2V6V013QlQ3MW4zNXJHS25Da0RkTXlm?=
 =?utf-8?B?bnBZeDR2YTZvMzR2NlVxSFBQNyt4WE9BaTFITjZReE4rOFhkOEVKZ3hLL29K?=
 =?utf-8?B?anpoVDFRUEc3RGtoNFd4MlVtc3ZDeVJJazdQd3RPVHNrdDZBcnZsU1Z6SmlM?=
 =?utf-8?B?U3FER1lBbGJ6K0tWWmxucHZITVNiWWdKL2JWMWpmVlZpNjVzTEdWeDc1dHU4?=
 =?utf-8?B?UnJBMFh0Rjg4MFRZTzlzWDVsZXJTbjFxcm13a2tLRUZHZThVK3RrSHBaRFZX?=
 =?utf-8?B?Y3pSMmJuVHlqbnZFRnRJcDlXemtxMkZWNnUzRXdUaFVIWXF1dEVFenNFVWRQ?=
 =?utf-8?B?WFM0VXlzNlhMZXV1WmRia01vOEFtbVNMWDJERElMQ2pobFpmSVRBRXZrOG5q?=
 =?utf-8?B?MVhwelpsMjZkOW0yUXJMdnVyOHN2Z2ZLV1BNaGlMNWVlcEhhQWEwbStFbkZI?=
 =?utf-8?B?NitmS1NLZXAvSXdMVWVzZW9saXRIS3E4SWdGYmgxcy9jSDEwUExkWDU1RDlv?=
 =?utf-8?B?UWtCeXVORStDb2xhVDhPWkJBUGd4SFlSeS9Bd0p4enlGek13Y0ZpRmpqS0dT?=
 =?utf-8?B?RlFqRnI4czVkY2ZYTmx2NmtXOE9zamNBZUtmZG1JUW5QRHJXYXlrQ0ZOQTlT?=
 =?utf-8?B?Tmt2R21vQlVSNHB3bHRXc2dlc3BVQkZIQmxzR0I3aEMvZ0ZvTi9FOS8yWjly?=
 =?utf-8?B?azhQQktLUnFwclRJWWg2b1A2SXBsbWhscGhMMGlIZWtpdDhwWnVVWjc4WnpU?=
 =?utf-8?B?d0FHY1NjQkx4S1pBSlREekNLWlJkOHdnMEE0djVyQ3FUd2JQdmtJVXNUTmlD?=
 =?utf-8?B?aDFzdTVtTnduTDVXQnVjMFM3dEUvUlJrT29iZzNuVjM1NCszTjVvc0JINWxt?=
 =?utf-8?B?dTVzQ3JEc2hmNnl3eGNvSzJHV292dzNZbHhzUElIWjFoWmkvZE5VR1JFT0ZB?=
 =?utf-8?B?UzNpYnlnK0p1anpNcVRqVHgyQjYzUytKbU5iazRrYU1SUytBdmEzNDBzQjI4?=
 =?utf-8?B?a0x3cnROeXlDbTBzSFFXbTQ2TENTajVZVGFpK04wTEdMNGF1S2tsdnF5cG5P?=
 =?utf-8?B?RFQxajJxSlNMa1F1ZC9VQzliSjk3OGVGV2t1b2FqTVRIc2JuVkh1OXZ5a0Zq?=
 =?utf-8?B?N3k3WlgzakZlVlZEcUZ0eDEzUSs5eWo5S1NqTUJNL1lZMFNJcnVkOUlwTGpW?=
 =?utf-8?B?T0VMcnpYSG5hRlBPRXVDSDlsMlhtUGFWbFpwRzBNdGtob2pqVWROWWEyRFAw?=
 =?utf-8?B?YVVCMHZsSGxYVDY1dTFVMzR6allBTHhwTS9GQlRoV1R5QktpbnUrUEdkTDRs?=
 =?utf-8?B?UTBraDNkNmtkTkZ6YVZrYmUrU1NoM2t4aHJkSjNKckxRV2VGbGpoZW8razgr?=
 =?utf-8?B?YkZ4WngvNzdOeHNsV2tkbjJVWTkweU5GYnJZWi9MTXk5dzhrc2ZUNjloZjdX?=
 =?utf-8?B?cy81THN3Z0VnWnRrZzB4bUduUWJnS0xVRW1qU0ZYNFNhb3Jpc3dXOEMwWnBl?=
 =?utf-8?B?NkxEOWo2ZnhkNlVGQlM1MU8rNTdMYm1XUTVoWStkcmdtNmU5bmJsN09XNUdH?=
 =?utf-8?B?eVBGSjdyc2tWU016UWdQdWpWcTY4YTliNDNlbkpNSkpWVm5MWUtzSndjYVh5?=
 =?utf-8?B?TWFYeWlMVnMrODR1R0FTRW9GeUJjY0lKcEE4dWs3UnVGTzlFcGpzZ0RISDhh?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: thV9u6QaNCDlc30iHAd59UNVOymC8bKw+3maE/6JEG2wJ2f8JDToli54/9Zh5N4UrPS7qZrVsKCbCEvgFQReg93QdfZCOgNmkmcUl+tjX5dAQHVhomAmceaunJFSb96Lea92R6JOBwgKKkrEojjhWFz+V/xAEBAvGPVlBsfY2yjW3DAZLZJ8SZSLgkj7Sk063MDehb7JYcxK6AbSojp8f43n3EZgPoMFadA3XHXSBTN6k+qhHna6axbktOBLpl7pODGX3XLU7RPRYGXi9GS8otYVOZ/L7HQqZB90HE6Kp6BnLzoCcm5Cj8fZ+kBHrYOUCtO+f5qS2WxNWIRSjRJ64ffpJhvUtxdYdG5ejwe7D5+ygafA9MCrpUNF4sGULs4mx1Xfhq2DMeUg8m7gba/lV1jaVYl5cQzGhYi/P4z5xW9rq6RffEJyBXdPXW2mDBGw7HqlWHJxzlZBXPQLOmW9QeXRFds+iDuKhKpKUVzgoSjhdgrKpBgwq3v1VGx3GjSnc5VitHrgpzeuU0KrDydirtobsX2bW0y9gs/ZTu4R+vc29WM2isxlzwtzdxQyU9EWbPem5Gsjfcyfo5LSLpURNzYs6YvyBWgcFqG1G5c2Tz+wEJR18BgAxalAA5dQTLCGdf95G5scGBFt+3k0VN15uArmXf9Alq2r7olCrm2xh61OeydwDbg7pHKef1yBHMAmdkDUIXATU4Udenjo0U9WFk8/8iPNByRDY7NYGmCpNK7htyuVt1BNr+Zu0P6jBNa5h/qRigGkvsciNCYy9YGf/bcsjgYxNUTwTFif5e6B+FsQ+eNdAF6Q0ZlP9kNXzgRx
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4617ac4-175d-4ca9-9a3b-08db09fd86a6
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 17:54:29.4748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7o625ZZqaE+Bjm72HpYN+0gNIuBT98i6th3ePIovhWpJcRlEjTnpABLhiWvnijsormsfPjPtA1nDT68T5XVUHRqMLtsf8dCqrLNFp8/7wY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6974
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_08,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302080157
X-Proofpoint-GUID: TThiklIV6VuwfhHPi7CJ44CDtBw0Qmu8
X-Proofpoint-ORIG-GUID: TThiklIV6VuwfhHPi7CJ44CDtBw0Qmu8
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 2/7/2023 4:47 PM, Peter Xu wrote:
> On Tue, Feb 07, 2023 at 04:28:49PM -0500, Steven Sistare wrote:
>> On 2/7/2023 3:10 PM, Peter Xu wrote:
>>> On Tue, Feb 07, 2023 at 11:03:29AM -0800, Steve Sistare wrote:
>>>> Add an iterator over the sections of a flattened address space.
>>>> This will be needed by cpr to issue vfio ioctl's on the same memory
>>>> ranges that are already programmed.
>>>
>>> Should this better be proposed with the context of using it?  Or I don't
>>> know how to justify this new interface is needed.
>>>
>>> For example, any explanations on why memory region listeners cannot work?
>>
>> For context, the new interfaces is used in the patch
>>   "vfio-pci: recover from unmap-all-vaddr failure"
>> in the original live update series:
>>   https://lore.kernel.org/qemu-devel/1658851843-236870-1-git-send-email-steven.sistare@oracle.com/
>>
>> More succinctly, the memory region listeners already ran, and the vfio 
>> callbacks created vfio memory regions.  Now we want to perform live update,
>> and are in steady state, so no listeners are being called.  We need the
>> flat section iterator to reproduce the same addresses and extents that were
>> produced by the listeners, to make a state change on each distinct vfio
>> memory region.
> 
> Okay it makes sense, thanks.
> 
> I think it'll be the same as one memory_listener_register() followed by an
> unregister with region_add() hooked only, but maybe we should avoid
> fiddling with the global list of listeners when possible.

Indeed it is the same, thanks for the suggestion.  And this occurs infrequently,
so modifying the listener list has no impact.  

I withdraw this patch request.  Thank you all for reviewing it.

- Steve

> If you plan to keep posting it separately, would you add some information
> into the commit message?  With that enhanced, please feel free to add:
> 
> Acked-by: Peter Xu <peterx@redhat.com>
> 

