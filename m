Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E7B6ACCC4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 19:36:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZFfo-0001Yb-Um; Mon, 06 Mar 2023 13:35:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1pZFfY-0001HW-74; Mon, 06 Mar 2023 13:34:45 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1pZFfV-0002pC-Q4; Mon, 06 Mar 2023 13:34:43 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326HSw1N027017; Mon, 6 Mar 2023 18:34:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=g+y2yqkybx6ompA4W0rzHFwnZYOL1cbTXnltCm3Iylk=;
 b=PBurOt5CdMGMhoOnPwJQgWGQwtwKXEYuwqccIMzF2wc6rDTFBP5hqFMuEFvk1ghREB69
 mpPx2h9zNdv//35AqjcqYlIkpR4mAk4xsKq1MPLa2/joF335gWSYQVVcoaITW1OrTyeS
 HvpYvbvEZLSjrFl2+IM4ILaPtz7PxS+8fF+WORH3518Xk9WWGWXpzxz/z0JmaJ1JA9Wk
 JsiZmEM755EN1v0Mq94gT+5RgEn3SkbbseBINTGr8k0HExf7wSYt9sRUDHfTy+yMHSxf
 ZiiWIcPHmXd88C+55HP+UbzNL2siXWX0FOFQle68lFQG8AwO3WHfuNTgsrpUlXCgGYRU lQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p4168knef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 18:34:34 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 326IQHDO025115; Mon, 6 Mar 2023 18:34:33 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4tthv6ma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 18:34:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V05EZTN8bS52tyk1lxI/zn/tKEJiT06c/59ZGutY2/5T42XbubdCMRDIZ+wU+QBdZlr6dH5T5YA1PbzK+n9N5Hb90ZmDTL4RbO5+UMKPUYR/WDIpJ7uHPoSvDV9M2MyfnPCSMuyLn7z6tTm3GA/4q1uu1HWr1GH8DUaM8TlmGC5yJbNQqInJn+tYOcMaznVxopSM4ZS2CGYS50GvYTwURM+z4kvalmuid6E4Vtv/o3YZZb/CtlaaWxKAzTJ5t6wxRoUTyVP04fSSrBWQDAJ3uPd6j+FCrKZYg342V19+NIMwXvDmmOeBojEADOlUTMO7L4S4WnFuIxq42Md4wGF6Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+y2yqkybx6ompA4W0rzHFwnZYOL1cbTXnltCm3Iylk=;
 b=Ti/U4RN9A1GxPhfPK1bf8DhQ+oxkrsiXwwg/ZTnRD1tlkdWr5eycxi3jlK6IcjHvXxXHSLomi42hM8IZBZMziIog64bA39Xs2LyPp7J8GqC23nqP4VoVFI1CovtbnZZxLzfuo/dvfnmak03lJItErB+fcJyPcyyrSmtJyNEBm0ck2avv9HVJKIBWbQNxazKcPgdGinN5Pvn0LdeFntmYXkqG6/cmIIe+TNSaGmjxPlFYOHTDzDX6y/f6aHBT9kwKPBkhgz+4XJgUqa7AyAXtCiR/3Zh15X3OKnca0yoi3K/VoLbWo2iSV7SwusurxOtc1gPDm6FZQbXKJJBH99ENTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+y2yqkybx6ompA4W0rzHFwnZYOL1cbTXnltCm3Iylk=;
 b=uXU/thcRiEPDUUZEZWOU7w1HAk12UdvU8SPsaf15D4N+zwCknM1I1IjvGHqfbM7jfReMFOtXBUEsqQ9R4RfV7O1CiCpy+tcZ+qrRFJlVGwXj4pMKL++HtoNuU5jYTLFhDLD0N/w0TRIeIBY6yFS9debvI509HdW4hNpwkDvJ5UA=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by IA1PR10MB7213.namprd10.prod.outlook.com (2603:10b6:208:3f2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Mon, 6 Mar
 2023 18:34:30 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::a0c1:677d:5394:bf43]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::a0c1:677d:5394:bf43%6]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 18:34:30 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Haibo Xu <haibo.xu@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Marc Zyngier <maz@kernel.org>
Subject: Re: [RFC PATCH 2/5] hw/intc/gicv3: add support for setting KVM vGIC
 maintenance IRQ
Thread-Topic: [RFC PATCH 2/5] hw/intc/gicv3: add support for setting KVM vGIC
 maintenance IRQ
Thread-Index: AQHZSsnJ7xQgBTUGnkaFPlM2rQXn9q7t0wSAgABL7oA=
Date: Mon, 6 Mar 2023 18:34:30 +0000
Message-ID: <7C16DAC4-ECB2-4663-A7B0-B657519BB169@oracle.com>
References: <20230227163718.62003-1-miguel.luis@oracle.com>
 <20230227163718.62003-3-miguel.luis@oracle.com>
 <CAFEAcA9ZzN0Xokh4kFcxtpv9hU512Km1EcaJHLG3JznVDF=Tew@mail.gmail.com>
In-Reply-To: <CAFEAcA9ZzN0Xokh4kFcxtpv9hU512Km1EcaJHLG3JznVDF=Tew@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB5433:EE_|IA1PR10MB7213:EE_
x-ms-office365-filtering-correlation-id: 42874342-62d8-4d02-61f7-08db1e716c81
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QIibv5awu9LxDky9VmmfE8WY8MMzYbhEcAbBwjFNPeS/0cHKPAS1pr3i6Z1tDvP7IjSM+mt35nXzKWhXXJQ87Nq0c6ZkG3VgoutpryF/P9pS81aoY9PrvUYLH0xm+z+ivZSJdDkP2R7diwL5zrwxC8JAGJTNXcEBbLwyXw9ayXyYgB61xERJ7HevQ3jfNm/iBWWhBdX6OXwuXgPXNn6edvNggepaySY3j54vNz6UVdh+5tksN5gV2xfQUL8eVpIwP7gJuy3kXYctrrh197rVBeFVf4nscIEtVeUqNbOpaY2mE14Rpo17wEhFsCUbP75dl0rAOSzvvCbh9b9TKScSpsBjj6r/9esqoMloVA0RwE59EOPjzkjdB3Fp2aUizcgTiRSQpsndj9XZ7Bnpdn87KYXLuYBlWH24z8uX4v9GTc2f7AXQBVnev5nHZiwegoW3mK7x1FtnKFKrdZ2u7zDzNFKPWG+AuPUCe/AW2QLUklIjQ3NrMSeutRUXLiFieKSyh+7r5aCTIBLp+/InPuYclgIT+/e8jWNOdfGF04F67c7vUSNGOE964OJ+/ZK9PbDepmvArNny+SfEK5amwZiWxsIXTGtwAtZhcdXuEbTS5vMHMgr+S+TPvW2UwlgA9/DT2djFMkmME1zKZRiCTR03fHaQeCHGGzyrWejFFUzg2CbRuMAnagpHrp8oLInuimUL1BPm2hBisEARTihRO6/7c9oX/Ksp214d8yUQPRE1UHg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5433.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(396003)(136003)(346002)(39860400002)(376002)(451199018)(122000001)(38070700005)(33656002)(54906003)(83380400001)(478600001)(5660300002)(38100700002)(41300700001)(316002)(6916009)(4326008)(66556008)(66946007)(8676002)(91956017)(66446008)(64756008)(76116006)(66476007)(8936002)(53546011)(6506007)(6512007)(36756003)(2616005)(2906002)(6486002)(44832011)(86362001)(71200400001)(186003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTFrWVlUTGxvMEdLVFdFamtLRUREbFFsZnVnRkFDdStZaWEyU2ZCQk14VEQy?=
 =?utf-8?B?QWFMdUpGWWtRaEdtZ2drUlU4U2FJRUR2MXZxV21BZ2lBK25uRHVqUUl1TFZs?=
 =?utf-8?B?YWh5VkRGOWY2Y0VNaFVPbUtuTEI1WXZpdHVFbDZlNllKcW9lZmljdFdIMGNp?=
 =?utf-8?B?NTdKWlZBbFpVdlpZZ1Z6a2RsV1QreWk1YkNZbU8yNkJndWFlemF1VHRRMG94?=
 =?utf-8?B?Z2xKSmlyTEp0a3R2bnloaUtYVDVxc3QyMUxqdXZ1c2xUSTF0MkNSQU1sZGs3?=
 =?utf-8?B?SGVIUzFQNFk0ZDk4S0dPK3loVzFQcUlmNWQvSUdmRWV6RTMzMzk4YktHRmcw?=
 =?utf-8?B?YWNIUkxRZml1ZU52dG8vL1NjZ1lTb0RSOEdkbUswTjd6ZWFsOWFpTGRSMy9r?=
 =?utf-8?B?TlhoRFpSdGZrMSs0UTJMSjk2MlNHMERwK3hHalFaOTFNK3k4WDl0Q2oxd3M2?=
 =?utf-8?B?eExhS3FQOUJOcmZFeEk1YzFybVFlcmZabG1pMUdHNUlCOXhMcU1PZFVVRFl6?=
 =?utf-8?B?L09XVTNKYWNoRGFJM2p3cWYwV3lRY3FaZG96ZnA1dVNET1Z1blRoaGJFYVJr?=
 =?utf-8?B?STBJQmtMeERRVXRjOFdWb0IwZHNDeXpxZHVTSGxGa3pCT09uRFVEKzhXa1FT?=
 =?utf-8?B?dnlpTGxwSHViNjNSS0Z1WjNlNXBJNURoem5laHc3REVFcHdkT3I3K0ZYbXVL?=
 =?utf-8?B?UjFCd3NuUTdCMldqK2lvZk1kbUdleDdHNnl4V3lQZzdhdms1a2JXOStLR2Mv?=
 =?utf-8?B?dUUxYmh5dnQxdlJXMHJxamNzQ25HdHNZYWtVZ2s3MmpmQzBxckdmTVVoZ0JS?=
 =?utf-8?B?SVZXN0xYSmpjUUVhMXlGdXRHbDFTV0ltdEhTVUprWE5vYzZOdE5TSGdZZDQ1?=
 =?utf-8?B?Y015cGxMM2ZnNDdUWkI3QXZ3QmpNQnFKekg0VlZjcmJ0RGxQRnI4Q0xVZE9C?=
 =?utf-8?B?WVhFd1ZZUTVsNmg3VkFuaSszaExjY1RheGg0ZFdTUU4xNDZYQ1pGbUlISHVC?=
 =?utf-8?B?ZjgxdjZzbzJBeXVyTS94OFk5WlJRNWt3U0hZVzBjV3ZHRkF0aXpLaXhJc1NH?=
 =?utf-8?B?UWpZQ3UzVzNQVHFDRktnY2V6Y1Q4emhDVlFyK09NZllQdUkvU2tocE1IaFJk?=
 =?utf-8?B?Qm52KzF4NEdLMWIrR0Ntek5JUGhtUUhmK1NxcHkrTU5ibmFyTEkrMElJUXJq?=
 =?utf-8?B?QTdEMm9MelJVcnRucnpvQzR2TDNhVjFXSmdIWTJRTk5VWGRuQVZncW5jdks2?=
 =?utf-8?B?bXQ1M2IzWnpVT2tjbTVDb2k1ZDM2Mm9KRXRkbE1CbnUvRkp1SFI0VGZYYWlV?=
 =?utf-8?B?dDcvWkoyMEkxenlNV0p3WFBtWGp1alRZVUtMcGVHSEtkeUNZY2lGcjFaS3NJ?=
 =?utf-8?B?OEk3clE2d0xoZWgydW9FcGpIS1pCUEJmQUdJdFJMMWZYbkVKUTYzYjJ6VGpF?=
 =?utf-8?B?QzFFWUZwZ2lHbFVTM1JSdFpxYTJzVURieExSZnFkekdNSnhOKzE3NWpoVldQ?=
 =?utf-8?B?Vmxxd1B3bXJqL1h1VEZtdlJhUEM0S2JSYWM3UENTWHJ6M3gwa2UrQ0xwNnJ5?=
 =?utf-8?B?TnJ2MUNhNzRhRnNWWWdHOWU5aEdGbHNScVQ4N2Y3Z09ITk9FZ2VGZG1hMWF3?=
 =?utf-8?B?QjB1MGFVa3dSYjZaM3lvV2xyS3lxRDlhbGU1VStTZDViTHhidUx0UlBTbU5r?=
 =?utf-8?B?dzMxTnJVUThMY3ppSTRXcTRDbzAxSUNycEFtbmJDSFNnOWdPRXZBUlJZaVdY?=
 =?utf-8?B?ZGZXVDZVL1YyTFk5WHhzVGRSamVTWXZHbzIzLzgxNzBHTmVVNHhnNzB0T0l1?=
 =?utf-8?B?ZFhHeXlSRjkyaEp6WFIwdEZzN3VaUkx6OXFXVFo3MTlQZ3o3ZHlraDc2Y0Yr?=
 =?utf-8?B?ZXhsTzArY2xOWHhCTzEwZmZPOFFKNm1EbWFKa0hGQ2VqNkN6Y1NiQU5DaHlN?=
 =?utf-8?B?eUM2ZkNMTWkzR0cxbTBhYm1GUlFWVGY2Mit2OXR4bTVseWFjdEpsb2syUU9Y?=
 =?utf-8?B?amFmdExvbGtScjJlYTFkMS8wd3RZWDZhVVJQYS9nZnRIZEhIeXJ5ZkY3Z0pP?=
 =?utf-8?B?amlsdzA3VlV1UFhTbTJzbWZIcUtGUGRxbWlBVXRKSldmakRkWEUxRjNDRWZI?=
 =?utf-8?B?MUE2N1dWdElUdWRmUjh4dm9mZERGR1lkb0xISVI5SEsrYXdyUVlaWkVEQXVY?=
 =?utf-8?Q?XU0I/2yDAE9s/KmbAfgbOFo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B6F4EF228A3E2408480492EF995211F@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Sr38S5g3pnmp1nTUFT1saUT0vJdPhIcY/UYo0qgIovW3Mx+6zXK/VA0acp6D4zdmhrTkYeBNd8LhCYSR1zRzK4y64wPDNTtpX4vOeudeV6GnVopzOgIBGtvCmoS93Z8E2//582bWQm4I4IDXIYVtiR11q+3oH+dXA40P4ul/4185y5E3L1RYpDb5DSnVhvJFHG5prEswqDzlB1q67SDJFgyIv7i8d/A6Xxh+rTl264HhLjyv5F95JbbUA3o7ZQWWIkSc07xT4b4EwDhDWNrHDrExSKBIB9C+8rFARSsK2Zq4ldo7f4BHeEptWK8h8KC500b9rR75QVGtZk5m1F1u8uzyQbnbysaGHy0fuMIFhq7vY0qTM7Db8XSyxXo/BZsrEymKfjiirdFbEUTwKxTu+6R7EGVZLEIKDdhb8SSCvwNFiHlvBgZoSHtbw7XTotgR0lJceMc8LFV7FhOjyi9F+zQxbiN7uCxJmFonvwUiv3Dj8fpSKyzwSq9J7fKiCRWnJpe1s5+Ow02myJu0nkkbLEMcNojdU9HVO8/fBHeJfR3pNE8hit6gXFr9xkY3vxkdXm3AgHZA/FUQar36gislCizLg72G6ZV+W+LyTE3RrnsjPTvG8iZshHkcSa1oDQBhu0qVLSMGJ4iNw3H4pEdzeDgCb5AbsyFOvnL2pmiWWU6Jxiodvx9/dCyuo+wPonOKB3lPHuKtscevh8Z5D5qYy8P5IjoPLKMQaHlAwss55gixMC+8lWEhXCCyp2jA4Q47KCUCNsJLrsUtlp18ApsWmz2LEc8neKVv7J4r748KiJoDu3UHO0YXnyXH+UcWPG1liOoAhk8z18zw49/AtV1OZA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42874342-62d8-4d02-61f7-08db1e716c81
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2023 18:34:30.2988 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aaY4KnCoVT5KpagkQ3uzrg2LW91R4U32MQzr6RsaDRuTqL+0dyasMggdiTiX4lg9iIS/WkICSeSxTMJHGsSBmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7213
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_12,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303060164
X-Proofpoint-GUID: w58IrSZwB-edhI2VErFb0UsnEiwwlrHy
X-Proofpoint-ORIG-GUID: w58IrSZwB-edhI2VErFb0UsnEiwwlrHy
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=miguel.luis@oracle.com; helo=mx0b-00069f02.pphosted.com
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

SGkgUGV0ZXIsDQoNCj4gT24gNiBNYXIgMjAyMywgYXQgMTM6MDIsIFBldGVyIE1heWRlbGwgPHBl
dGVyLm1heWRlbGxAbGluYXJvLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBNb24sIDI3IEZlYiAyMDIz
IGF0IDE2OjM3LCBNaWd1ZWwgTHVpcyA8bWlndWVsLmx1aXNAb3JhY2xlLmNvbT4gd3JvdGU6DQo+
PiANCj4+IEZyb206IEhhaWJvIFh1IDxoYWliby54dUBsaW5hcm8ub3JnPg0KPj4gDQo+PiBVc2Ug
dGhlIFZHSUMgbWFpbnRlbmFuY2UgSVJRIGlmIFZIRSBpcyByZXF1ZXN0ZWQuIEFzIHBlciB0aGUg
QVJNIEdJQw0KPj4gQXJjaGl0ZWN0dXJlIFNwZWNpZmljYXRpb24gZm9yIEdJQ3YzIGFuZCBHSUN2
NCBBcm0gc3Ryb25nbHkgcmVjb21tZW5kcyB0aGF0DQo+PiBtYWludGVuYW5jZSBpbnRlcnJ1cHRz
IGFyZSBjb25maWd1cmVkIHRvIHVzZSBJTlRJRCAyNSBtYXRjaGluZyB0aGUNCj4+IFNlcnZlciBC
YXNlIFN5c3RlbSBBcmNoaXRlY3R1cmUgKFNCU0EpIHJlY29tZW5kYXRpb24uDQo+IA0KPiBXaGF0
IGRvZXMgdGhpcyBtZWFuIGZvciBRRU1VLCB0aG91Z2g/IElmIHRoZSBpc3N1ZSBpcw0KPiAiS1ZN
IGRvZXNuJ3Qgc3VwcG9ydCB0aGUgbWFpbnRlbmFuY2UgaW50ZXJydXB0IGJlaW5nIGFueXRoaW5n
DQo+IG90aGVyIHRoYW4gSU5USUQgMjUiIHRoZW4gd2Ugc2hvdWxkIHNheSBzbyAoYW5kIGhhdmUg
b3VyIGNvZGUNCj4gZXJyb3Igb3V0IGlmIHRoZSBib2FyZCB0cmllcyB0byB1c2Ugc29tZSBvdGhl
ciB2YWx1ZSkuDQoNCkZyb20gdGhlIHByZXZpb3VzIHdvcmsgSSB3b25kZXJlZCB3aGVyZSBkaWQg
dGhlIDI1IHdvdWxkIGNvbWUgZnJvbSBhbmQgSSdtIGluDQp0b3RhbCBhZ3JlZW1lbnQgdGhhdCB0
aGlzIG5lZWRzIGEgYmV0dGVyIGFuZCBtZWFuaW5nZnVsIGNvbW1pdCBtZXNzYWdlLg0KDQo+IElm
IHRoZQ0KPiBpc3N1ZSBpcyAidGhlICpob3N0KiBoYXMgdG8gYmUgdXNpbmcgdGhlIHJpZ2h0IElO
VElEIiB0aGVuIEkNCj4gd291bGQgaG9wZSB0aGF0IEtWTSBzaW1wbHkgZG9lc24ndCBleHBvc2Ug
dGhlIGNhcGFiaWxpdHkgaWYNCj4gdGhlIGhvc3QgaC93IHdvbid0IGxldCBpdCB3b3JrIGNvcnJl
Y3RseS4gSWYgS1ZNIGNhbiBoYXBwaWx5DQo+IHVzZSBhbnkgbWFpbnRlbmFuY2UgaW50ZXJydXB0
IElEIHRoYXQgdGhlIGJvYXJkIG1vZGVsIHdhbnRzLA0KPiB0aGVuIHdlIHNob3VsZCBtYWtlIHRo
YXQgd29yaywgcmF0aGVyIHRoYW4gaGFyZGNvZGluZyAyNSBpbnRvDQo+IG91ciBnaWN2MyBjb2Rl
Lg0KPiANCg0KSSBhZ3JlZS4NCg0KPj4gZGlmZiAtLWdpdCBhL2h3L2FybS92aXJ0LmMgYi9ody9h
cm0vdmlydC5jDQo+PiBpbmRleCBiODcxMzUwODU2Li4zNzcxODFlMDA5IDEwMDY0NA0KPj4gLS0t
IGEvaHcvYXJtL3ZpcnQuYw0KPj4gKysrIGIvaHcvYXJtL3ZpcnQuYw0KPj4gQEAgLTc1OSw2ICs3
NTksMTEgQEAgc3RhdGljIHZvaWQgY3JlYXRlX2dpYyhWaXJ0TWFjaGluZVN0YXRlICp2bXMsIE1l
bW9yeVJlZ2lvbiAqbWVtKQ0KPj4gICAgICAgICAgICAgcWRldl9wcm9wX3NldF91aW50MzIodm1z
LT5naWMsICJyZWRpc3QtcmVnaW9uLWNvdW50WzFdIiwNCj4+ICAgICAgICAgICAgICAgICBNSU4o
c21wX2NwdXMgLSByZWRpc3QwX2NvdW50LCByZWRpc3QxX2NhcGFjaXR5KSk7DQo+PiAgICAgICAg
IH0NCj4+ICsNCj4+ICsgICAgICAgIGlmIChrdm1faXJxY2hpcF9pbl9rZXJuZWwoKSkgew0KPj4g
KyAgICAgICAgICAgIHFkZXZfcHJvcF9zZXRfYml0KHZtcy0+Z2ljLCAiaGFzLXZpcnR1YWxpemF0
aW9uLWV4dGVuc2lvbnMiLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZtcy0+
dmlydCk7DQo+PiArICAgICAgICB9DQo+PiAgICAgfSBlbHNlIHsNCj4+ICAgICAgICAgaWYgKCFr
dm1faXJxY2hpcF9pbl9rZXJuZWwoKSkgew0KPj4gICAgICAgICAgICAgcWRldl9wcm9wX3NldF9i
aXQodm1zLT5naWMsICJoYXMtdmlydHVhbGl6YXRpb24tZXh0ZW5zaW9ucyIsDQo+PiBkaWZmIC0t
Z2l0IGEvaHcvaW50Yy9hcm1fZ2ljdjNfY29tbW9uLmMgYi9ody9pbnRjL2FybV9naWN2M19jb21t
b24uYw0KPj4gaW5kZXggMzUxODQzZGI0YS4uZTJhNmZmMWI0OSAxMDA2NDQNCj4+IC0tLSBhL2h3
L2ludGMvYXJtX2dpY3YzX2NvbW1vbi5jDQo+PiArKysgYi9ody9pbnRjL2FybV9naWN2M19jb21t
b24uYw0KPj4gQEAgLTU2Myw2ICs1NjMsNyBAQCBzdGF0aWMgUHJvcGVydHkgYXJtX2dpY3YzX2Nv
bW1vbl9wcm9wZXJ0aWVzW10gPSB7DQo+PiAgICAgREVGSU5FX1BST1BfVUlOVDMyKCJyZXZpc2lv
biIsIEdJQ3YzU3RhdGUsIHJldmlzaW9uLCAzKSwNCj4+ICAgICBERUZJTkVfUFJPUF9CT09MKCJo
YXMtbHBpIiwgR0lDdjNTdGF0ZSwgbHBpX2VuYWJsZSwgMCksDQo+PiAgICAgREVGSU5FX1BST1Bf
Qk9PTCgiaGFzLXNlY3VyaXR5LWV4dGVuc2lvbnMiLCBHSUN2M1N0YXRlLCBzZWN1cml0eV9leHRu
LCAwKSwNCj4+ICsgICAgREVGSU5FX1BST1BfQk9PTCgiaGFzLXZpcnR1YWxpemF0aW9uLWV4dGVu
c2lvbnMiLCBHSUN2M1N0YXRlLCB2aXJ0X2V4dG4sIDApLA0KPj4gICAgIC8qDQo+PiAgICAgICog
Q29tcGF0aWJpbGl0eSBwcm9wZXJ0eTogZm9yY2UgOCBiaXRzIG9mIHBoeXNpY2FsIHByaW9yaXR5
LCBldmVuDQo+PiAgICAgICogaWYgdGhlIENQVSBiZWluZyBlbXVsYXRlZCBzaG91bGQgaGF2ZSBm
ZXdlci4NCj4+IGRpZmYgLS1naXQgYS9ody9pbnRjL2FybV9naWN2M19rdm0uYyBiL2h3L2ludGMv
YXJtX2dpY3YzX2t2bS5jDQo+PiBpbmRleCAzY2E2NDNlY2JhLi5jZTkyNDc1M2JiIDEwMDY0NA0K
Pj4gLS0tIGEvaHcvaW50Yy9hcm1fZ2ljdjNfa3ZtLmMNCj4+ICsrKyBiL2h3L2ludGMvYXJtX2dp
Y3YzX2t2bS5jDQo+PiBAQCAtMjIsNiArMjIsNyBAQA0KPj4gI2luY2x1ZGUgInFlbXUvb3NkZXAu
aCINCj4+ICNpbmNsdWRlICJxYXBpL2Vycm9yLmgiDQo+PiAjaW5jbHVkZSAiaHcvaW50Yy9hcm1f
Z2ljdjNfY29tbW9uLmgiDQo+PiArI2luY2x1ZGUgImh3L2FybS92aXJ0LmgiDQo+PiAjaW5jbHVk
ZSAicWVtdS9lcnJvci1yZXBvcnQuaCINCj4+ICNpbmNsdWRlICJxZW11L21vZHVsZS5oIg0KPj4g
I2luY2x1ZGUgInN5c2VtdS9rdm0uaCINCj4+IEBAIC04MDMsNiArODA0LDMwIEBAIHN0YXRpYyB2
b2lkIGt2bV9hcm1fZ2ljdjNfcmVhbGl6ZShEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnAp
DQo+PiAgICAgICAgIHJldHVybjsNCj4+ICAgICB9DQo+PiANCj4+ICsNCj4+ICsgICAgaWYgKHMt
PnZpcnRfZXh0bikgew0KPj4gKyAgICAgICAgLyoNCj4+ICsgICAgICAgICAqIEFybSBzdHJvbmds
eSByZWNvbW1lbmRzIHRoYXQgbWFpbnRlbmFuY2UgaW50ZXJydXB0cyBhcmUgY29uZmlndXJlZA0K
Pj4gKyAgICAgICAgICogdG8gdXNlIElOVElEIDI1LiBGb3IgbW9yZSBpbmZvcm1hdGlvbiwgc2Vl
IFNlcnZlciBCYXNlIFN5c3RlbQ0KPj4gKyAgICAgICAgICogQXJjaGl0ZWN0dXJlIChTQlNBKQ0K
Pj4gKyAgICAgICAgICovDQo+PiArICAgICAgICB1aW50MzJfdCBtYWludF9pcnEgPSBQUEkoQVJD
SF9HSUNfTUFJTlRfSVJRKTsNCj4+ICsNCj4+ICsgICAgICAgIHN0cnVjdCBrdm1fZGV2aWNlX2F0
dHIga2RldmF0dHIgPSB7DQo+PiArICAgICAgICAgICAgLmdyb3VwID0gS1ZNX0RFVl9BUk1fVkdJ
Q19HUlBfTUFJTlRfSVJRLA0KPj4gKyAgICAgICAgICAgIC5hZGRyID0gKHVpbnQ2NF90KSZtYWlu
dF9pcnENCj4+ICsgICAgICAgIH07DQo+PiArDQo+PiArICAgICAgICBpZiAoIWt2bV9kZXZpY2Vf
aW9jdGwocy0+ZGV2X2ZkLCBLVk1fR0VUX0RFVklDRV9BVFRSLCAma2RldmF0dHIpKSB7DQo+PiAr
ICAgICAgICAgICAgZXJyb3Jfc2V0ZyhlcnJwLCAiVkdJQ3YzIHNldHRpbmcgbWFpbnRlbmFuY2Ug
SVJRIGFyZSBub3QgIg0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAic3VwcG9ydGVk
IGJ5IHRoaXMgaG9zdCBrZXJuZWwiKTsNCj4+ICsgICAgICAgICAgICByZXR1cm47DQo+PiArICAg
ICAgICB9DQo+PiArDQo+PiArICAgICAgICBrdm1fZGV2aWNlX2lvY3RsKHMtPmRldl9mZCwgS1ZN
X1NFVF9ERVZJQ0VfQVRUUiwgJmtkZXZhdHRyKTsNCj4+ICsgICAgfQ0KPiANCj4gU28gaWYgSSB1
bmRlcnN0YW5kIHRoaXMgY29ycmVjdGx5LCB0aGUgcmVxdWlyZW1lbnQgaGVyZSBpcyBiYXNpY2Fs
bHkNCj4gInRlbGwgdGhlIGtlcm5lbCB3aGljaCBJUlEgbGluZSBpcyBiZWluZyB1c2VkIGJ5IHRo
ZSBib2FyZCBjb2RlDQo+IGZvciB0aGUgbWFpbnRlbmFuY2UgaW50ZXJydXB0IiwgcmlnaHQ/DQoN
CkZyb20gdGhlIHByZXZpb3VzIHN0YXRlbWVudCBJIHVuZGVyc3Rvb2QgaXQgd291bGQgYmUgYmV0
dGVyIHRvIGNvbnNpZGVyIHRoZQ0KYm9hcmQgY29kZS4gU28sIHllcy4NCg0KPiBJdCBzZWVtcyB0
byBtZSB0aGF0IHRoZQ0KPiBzdHJhaWdodGZvcndhcmQgd2F5IHRvIGRvIHRoYXQgaXMgdG8gaGF2
ZSBhbiBpbnRlZ2VyIFFPTSBwcm9wZXJ0eSBvbg0KPiB0aGUgR0lDdjMgZGV2aWNlIGxpa2UgIm1h
aW50ZW5hbmNlLWludGVycnVwdC1pZCIsIGFuZCBtYWtlIHRoZQ0KPiBib2FyZCBjb2RlIHNldCBp
dCAod2hldGhlciB1c2luZyBLVk0gb3Igbm90KS4NCg0KVGhhbmtzLCBJ4oCZbGwgbG9vayBpbnRv
IGl0Lg0KDQo+IFRoZSBUQ0cgaW1wbGVtZW50YXRpb24NCj4gZG9lc24ndCBjYXJlLCBhbmQgdGhl
IEtWTSBpbXBsZW1lbnRhdGlvbiBjYW4gc2V0IGl0IHVwIGluDQo+IGt2bV9hcm1fZ2ljdjNfcmVh
bGl6ZSgpLiBUaGVuIHlvdSBkb24ndCBuZWVkIHRvIHNwZWNpZmljYWxseSB0ZWxsDQo+IHRoZSBH
SUMgZGV2aWNlIHRoYXQgdGhlIGd1ZXN0IGlzIHVzaW5nIHRoZSB2aXJ0dWFsaXphdGlvbiBleHRl
bnNpb25zLg0KPiANCg0KWWVzLCB0aGF0IHNlZW1zIGJldHRlciBzdWl0ZWQuDQoNClRoYW5rIHlv
dSwNCk1pZ3VlbA0KDQo+IHRoYW5rcw0KPiAtLSBQTU0NCg0K

