Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 808E56645A4
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:10:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFGnH-0003ij-Sx; Tue, 10 Jan 2023 10:44:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pFGnE-0003hJ-4f
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 10:44:04 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pFGn8-00016G-SF
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 10:44:03 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30AFdVhQ013765; Tue, 10 Jan 2023 15:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=4PozRXw66Rz/8wCRh6Pt7KhCpYDDYOsqNozsSGi4cyI=;
 b=Ak1dJw7sSJCTN1YA4ma+dOrGuQrAwIJgwRqZjtxN7tvfquBbvNZ3kGL37BNb02M78Xzq
 AnJe5HYbf6TXogCHvCT0HyPGprWj7CzlVVTu1sxnNXA3SHLmJ2S1bAaUiwiasZx7+Vua
 dJNg52XPrM1jRulZNdG4jcqHlml73RHzQeQ25+1OZ420peanIF2dKgIkH02A6xxPd35q
 q0cu/V3GCL/HDeuwvpz77OSVfNcnNel98aUI+Q/i+vL+v3Cp9rVN1myPnprTmA64DsCK
 Nj8KArrUrp4xkOpZkmfoPGORKpaR4Wi/6W05f2nwb3cv61Dw+bG0loezpgKrOuhin8ey 5Q== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n14nf8uj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Jan 2023 15:43:51 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 30AFNgJ5003559; Tue, 10 Jan 2023 15:43:51 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3n1ame0x2q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Jan 2023 15:43:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0jT0OG5h6/Sc6gMvlCP2bqaqaOoyOgBmsDGkOiL/1lV6tklTbvUxAwyC70vlbOR9tWJ+njNABI0SsyvOO2SoTxRD3+UyR13URriohoxHxhKtxJdvMZ6gsi0hT+66JQnT2TyYQZ/8vl6EhOGxQpzEm/SyXiqW0mq5L4BB/y3uDzjIGumqvZSNKBlUynp73d8BrQHr/9cVPCOJXBKKA/Te+JZmLi8f5Bii5uJXYJDCZNhudQvKlIOBiNLkqLx2RinKKt3zfA7FCuALTIZUnZ/AoD0e1zIls+qSodXZ3LpJTe6axtLRzA7RiMKKaKRe0pN6V0jtA5uNO+iPZfVQWE6bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PozRXw66Rz/8wCRh6Pt7KhCpYDDYOsqNozsSGi4cyI=;
 b=fno/6q36+ztDdJDhi3OmehibHTzWidvuLxUFlqEiv1/vXLEeTKEKgOGYv601AUJGAyMIA1KhioHELg6UcZqvBTqzjlX9ZrSdiezrl1S01U/ZoztMdSwSYRd2YL8lK/xZ0wI200FLAtOn7700eO/TQUcwu5cbf+aPOe5iK4GYwpbh4erXd52Ja4BBLi/kcxMDzT+uch0NPMaUmgXr5zm+RnacvdZ3nIE2HmOORO9bycNmSSfIf/zTpTbPaDhPvDu35J50fJi2XXyO6VqoHvUvHlUCDcCSAIfPnmVTqmDjk6Z1gS/rWW344KMMi3pb1rTmtG6sAgCWfPX+E/8c3tmPow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PozRXw66Rz/8wCRh6Pt7KhCpYDDYOsqNozsSGi4cyI=;
 b=Mcuqv8szOFajzRJ0bpn0AhO3QtA6XACVyR4t+QsZbd8tZ+PYlK+dR3ZyEneIVjVKbCijo+IhpUKd1OkGgxb8KEr8+sE2fwUAByQUxDQKKBHjHmVgEZGfcbmr1IclUflpCh48vIZvQfpb5eQMd5EzHPH+TRv5aVcO7T7/7mJh7kY=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MN2PR10MB4350.namprd10.prod.outlook.com (2603:10b6:208:1da::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.10; Tue, 10 Jan
 2023 15:43:48 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b6bd:f4a8:b96f:cf5]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b6bd:f4a8:b96f:cf5%7]) with mapi id 15.20.6002.011; Tue, 10 Jan 2023
 15:43:48 +0000
Message-ID: <d67bb9ad-852f-e38e-d6dd-28de54d7774f@oracle.com>
Date: Tue, 10 Jan 2023 15:43:36 +0000
Subject: Re: [RFC PATCH v1 00/15] Xen PV backend support for KVM/Xen guests
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 qemu-devel@nongnu.org
References: <20230110122042.1562155-1-dwmw2@infradead.org>
 <20230110123754.1564465-1-dwmw2@infradead.org>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20230110123754.1564465-1-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P250CA0019.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::24) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|MN2PR10MB4350:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d897f00-8490-45ef-2a3a-08daf3217711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m6pH1h8Hswa5ak+rZUuL8+TeVO5AzHi9JaUjnIUr1Dp8l/nmkoy7Hr4YtpW60j76vIm8JNMXiJeybGCRLlCPjSUPqLNmpm4L26WTiqoIEOHvJoz8/3E23nCKJyceU7c1JQ27bMD62jJE7l4EHNRf5Oj6xupbVjIrEhtPsjShZUMC0ccIy5PZmfGRYPQvxlCEht/yv3gYb4Q5aBdpv7HGaq8nl5VmWnq5aJclSMBlvoFClpGuswC8KUjCBcAzaD2DZQciCe6b79qwwnYkw0XO2uB8AV8VpuqrM4ANFv4sq1WvTjIj/cfHYgbPh/+cCj1DGjrEThG5c6NQZuyg4MHjadiZh9AKyrK4uh4NivQY1D1bqAuP9bBOxVXdBt7rCcrM87ob3izw9ALX1dZ85b0PCTx9iYib5IUUVveb4omyubwOo4ig44MRGCrP7C0MNzKy5ffFyubFVAG3SyYvJ8VwbVFWsDG2hUYb9MAB/kqL/sNyv5ypyA6QsJNaZpnsjokgkC9nsvV8FwYwEzaGK+S1L75hzdq7kQ52ZN0+dnvvE0C0+w9nez0bbVEJvYQApCveX8x/Bj3M8uJtrpHqUjypH3bpFZ0qoSgY4QV5zDpFXLvjw4M7eKL2c/wKmr4djzkuTL5fgqYAdl8fYzueBYBEauX3bN+fCJ2lIjbGpt5WzPkD2m8XJJKb+l5q3kHgH2MTYCb2o4vqCCi5PFLii40rSK8BuKKMzUTyDoEsfAVVN5E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(376002)(39860400002)(346002)(396003)(451199015)(36756003)(66899015)(31686004)(86362001)(83380400001)(54906003)(8676002)(31696002)(66946007)(41300700001)(4326008)(66556008)(66476007)(38100700002)(6916009)(53546011)(478600001)(6486002)(966005)(186003)(6506007)(26005)(6666004)(2906002)(8936002)(7416002)(316002)(5660300002)(2616005)(6512007)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGhVRlVCRUNIaVlMcnk2L3Z4cVc3ZHB0RHBUTUw2SHk1anRGWnI5SUliQWg3?=
 =?utf-8?B?b2xpL1ZDWGg0eUw5Nk13ejdmbWg4K2xhVm9nTDgySmFISkxqdHBhT2x0ZkF5?=
 =?utf-8?B?aWNhVG01cHpxVkZXWmo5T0J1M3lreW95bzZpVGFvampJZjRzWGRkVmlOMlFV?=
 =?utf-8?B?NmM1ZDFXbFN3aUVKSGw0ejh3K1lyQjZIUm1RVFpOd2Z5RFNJUlVDelloMlkw?=
 =?utf-8?B?MVJ5NmRrNWtjT25rSzZtd0EzeUlYaHJpVUFKVFJlQkZmZzY4MzZISWE2dXJE?=
 =?utf-8?B?cUpEVFo4b1pvQ2dOZlVtUm1yR3lQbnJKYXozcDdKS09obkZxMHNKdGFXTjdW?=
 =?utf-8?B?L2Y3RnpET25OeDdEemJSOHg0d2o2N2ROTHdpazJPb29VVm9kdlFTYmhiTDE5?=
 =?utf-8?B?cVRtTDg4S1VPalVtYi9UUWpOL2NZbkJIaVdreStqVk4yczhIWnNqQjVsa0ZD?=
 =?utf-8?B?U2w1TWp3Q1AvMzVOOXBDWEYxOEFsSUtZYWJyY1lCN3ZWdWM1TUJlelJiWHF3?=
 =?utf-8?B?cnhFdXB6QVplWTRsZ0JYazR3bkR2ZnpsRHp0bXZsQmk2dFZjUnpMTkEyeHN1?=
 =?utf-8?B?RkxTTmRZaUhiQXdHQW4rN0FoNVg0TUhYYnBNL0lWaks2TnR0M3l2THZjUmhm?=
 =?utf-8?B?eWhWRWNIYVNjNFNHd01YTC9EL3p4d0puRGE3bldRVFA0RXZBT0xSYkFuNE5t?=
 =?utf-8?B?c3d3UUtKNklxdEdiVStRWk9ZazhsV1VIdG5VOStIcHhCZlpjTU5ZaUxnaGxC?=
 =?utf-8?B?L2NBSnEySldyUVFtWTQ4NFRtcFNzZ2xXR2tDV2psenB6Q3IxeDRPcDFXTUJu?=
 =?utf-8?B?bFNEUFFFbksxc1VlTm9WR2l5NnF0TjE1ZDlCRkMrWm9RSXcrVk8yUW8xUzlk?=
 =?utf-8?B?Rlp3QWplNzE3Lzd0VGdUTFdBZC84bGNGNUJUL1N0TzhucFZ1MDhqT2p2OTcw?=
 =?utf-8?B?MmlScXNEOHNQQVkxdUl3eUE3ckNNT2t2VkJWNk1TcnI5RUZiYVFmaW1KVmkr?=
 =?utf-8?B?cVNURDdVL3loYzJlejZScDF2aTJqckRFSC9wWXpwMFc2RGN6NkNZNUR5UlEx?=
 =?utf-8?B?UnJpV3F2TkRLQ0dkQkE0c3M4T2xKS1djdG9QWWJjRGJpcGQ5NURyeUN1QWNI?=
 =?utf-8?B?eC9EbVZITWMwRnljRmI2dkV1eUZoNisrSEpwb2pZYy9UazJTdDkvZXVuaXY5?=
 =?utf-8?B?UldOUnlid0YrTWJldnlnWVhCT3R0ZWcremYwaW9EaFJJZ3Q4UU9zcmZxZFUy?=
 =?utf-8?B?TjR6RS9vWWlNZTNwajY1eThQWXQvLzFxV25wcXJIbUNaY3luS0JpNDByOGVP?=
 =?utf-8?B?dDViSkIwNWhLYml1SXc3VWZjaHk0Uyt1VGFnV1F1cjdNeDFFME45SGFCRjI3?=
 =?utf-8?B?bUc2ZUtBOWo4cHNMaE1ETjROdWlHZG0vUWtxTjdSaWZzYjlFTGhIWmhtS2do?=
 =?utf-8?B?WkN2ZFFkbnB5NFVnaFV1b296Z3NQNTRkVGVCbWt0V1plbU1SZk1hL1hVdGZ1?=
 =?utf-8?B?TEhXeG5HWHBVdzRySUR0eFBBUmZnR2lLMDcvOVJjcUxlVUlGdjUwcXVXUVJU?=
 =?utf-8?B?WTBjeWlET1RiOUtsVGNKaWFPVkFPa0hkbGE0dld4Rzd1ZHdGTnNYMVhEVnJn?=
 =?utf-8?B?VGk5TEFDSHF1SmxMaldSZ0ZzZmZ0VU1BRHpnKzgzckpqYTE5TFUwV0Q1dmls?=
 =?utf-8?B?Nnk4RWFZbjFoTExSZjBEZkRWQXkxanI4cE1RdEVHSXNUZC8zRDR0OU94R1ZJ?=
 =?utf-8?B?MDRGQTFSaktLckZ6dEU3amVqbUJHRWowVWNUbWh5NTFmS2JGczVjV3hmVTRE?=
 =?utf-8?B?S0JDNjhrRWhUMGlrSm0zL08wK0JJOHVJZFY2aDFMUEVicXlZdm1KSmFGc2pC?=
 =?utf-8?B?a243WWgrL3RreHgvTnZVcHhubW1sYWd5ekJIYStjZVlJQStaMkVOS3pBYzV3?=
 =?utf-8?B?QTFxL2lWY0tqb21rejVndGhLQ1ozTWppVUx4d0xTdVV5TktyemFucENGMnJP?=
 =?utf-8?B?Zk9NakRmNnliTGJMN1BvdjcwR3lFbmZLeHROMFNXcGZiUHBHNXZHT2h4eFVE?=
 =?utf-8?B?d0pOZ1VJVU80ZDNtOEpVT3FpUlYxL0h2SVZleWNLU3BWQ3ZvemZsaXRZKzNU?=
 =?utf-8?B?ZFVySEt2bTcvdVRxZWF3ZmhXNWhOR1NwMTRLSkZLeG1uYXByamR3d1l6b2Rp?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: IJMSzfnHQ65DS8/vBxXeybIFS3lL4kcE0BTX6G/b/krUQhBwX3yB6i0Rmc9IMPvLTbrFJVijk0+GhpEJfRPw3njxrn/7vDsiaWpBP9FPBe6Yh2H8uN2k2wnugR1Tm2dxt5V+sxlIVbQR0m/ziG7a//EZmPsNf7KWnXvfriADIzae26gVLmYqr5UN3OCh9U2E3ds9eYY386QkqJxnQ2/Byq7+T/6ngOfVbrge2gCN+7F6XxImBfLuY8fIryiZ45PaD3m0Yj243+EudCHB+FiVSnOxKUQSwej/yiEyMIlb9hPfBp2wReMqq1SewtXQWwIn9FAWJ7X5DTrDJkN3Rk1ES63NoOQy3ybxcmWGxF37F2IY2Ng6SWkFC/sJ5LNawmBvxxF6iZt3A2fagSmT7vNPyqQb1y88J5858ah2tbZBuzly4+nl9ETxGexasFl6HH4k29LHVTACRO/GxPIke7LP8/HA0oezBMy9mODMFVzaWf+kePEb32wqhWnanpQwYLx/P0twE3v4xTgu4eACnI1ndPP3x+fOVuWppCdi+OvgI0sM+99AQCR/QYCHNuZMB11t525fpsP8uOoUWxF1nDPOTlgA8Kv4s+oZXE3R1uYCNG1d5iNfiCwp9hLZR1K0sQsUGj10DdDO49AaRkLspJltJ92TBhdgwApniEoK5UQtVJFekRYnLusGzilTj3t+JV6EC1E08+M+oYJx41Q6BOxayW4IkXJtI94Foggc8yXogsYDZyDksXNZ4sJXt0WMWIERn14kfxiBFU4nCR+aMYfgd9SGN+1DQu7hB9+edS5hwa5smBNAcqFK65iMOA0pjIbhTNSo6C6UkEcKT1UOoubV4Ci6qf+ydzc6RWZTwH5UfCUXVR7AQfA1NMQfEQj8LbG+2sx4ytDytE47NQ84l262qQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d897f00-8490-45ef-2a3a-08daf3217711
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 15:43:48.6555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0U4gVkfrxj7PDDUJcIHZioF8abhJ+ykrIRJkNZHmJpaScI0TOogn/Ay9ngcP2sCE2C1m2xv6KoJL9vVcnlmoDS1q5Yb29zdXFpBzalJ6e0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4350
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_06,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=951 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301100097
X-Proofpoint-ORIG-GUID: 1FsXm4SRpOejuJ3mCFBfZobwpd0w2Xz3
X-Proofpoint-GUID: 1FsXm4SRpOejuJ3mCFBfZobwpd0w2Xz3
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 10/01/2023 12:37, David Woodhouse wrote:
> Some parts of it are relatively straightforward; others less so. In
> particular, it looks really hard to provide a contiguous virtual mapping
> of multiple potentially discontiguous pages granted by the guest. To
> fix that we might actually need the guest memory blocks to be backed
> by real files (perhaps deleted or shmem) in order that they can be mapped
> again in at a different virtual address. 

I wonder if we really need to go to that extent.

As far as Qemu emulated-Xen is concerned, gref is mostly a different lookup
mechanism a GPA i.e. an index on a table (that the VMM knows about) that
references a GPA. Perhaps if it's simpler to teach the backends to deal with
discontiguous grefs (if there's such a case today even).

The only user of multi-gref mapping is the block xen driver ... and only for
mapping the shared ring if I understood correctly. But even there you could
probably twist it... considering that the multi-gref ring is contiguous is guest
address space, thus the gref -> HVA conversion ius contiguous too (?). So that
way you could still return a single HVA (provided that map-grant implementation
validates the backing frame contiguosity).

> So for now we'll limit the
> back ends to mapping a single grant ref at a time.
> 
Which is not a practical limitation right now. One grant ref is actually fine
for the everything else that is not the block shared-ring.  Xen devices in Qemu
seem to be using the legacy backend interface, and thus (un)mapping one grant at
a time, or otherwise copying grefs.

> https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv-kvm-backends-1
> 
Cool stuff! A lot better than the RFC redirection layer

> David Woodhouse (14):
>       hw/xen: Remove old version of Xen headers

This patch looks more appropriate to your earlier v6 (?)

