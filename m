Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5386AA632
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 01:23:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYFeu-00013Q-Rv; Fri, 03 Mar 2023 19:21:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pYFes-0000w5-4f
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 19:21:54 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pYFep-0003E3-FO
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 19:21:53 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 323LZefR004343; Sat, 4 Mar 2023 00:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=V149jvh2SU/eZ+b+qKlOmb/wP6bKH8Jd9WnwvG3LXUQ=;
 b=2NapgbyiuRnxmDtD2Kw4HzzZetY3SSk6/RaGf7hVkxAcdv8HAn0+nOZ3MXk01EvD4xuO
 u0XNbgfMOMWy2u7m7LFCTlZJnyGbaujNqAorQpo8DFOzClxMKQESQqu5/SjZJbbiOJZy
 /NErwbzdBsQpWUOKwnsuy5JpUZ5cKhR4NoPu0G5+NZuDBJ5f0QT3g53VoYw7v4rXlGN/
 I0sGRsYqSFK4CK/1Wq9KNrNEcP0kFcLv0F8bsHUj3ioSFkWMaLjv42FH7Y3Xy1KvJs+R
 Ng+xZmIJKzoX+INBtQjoVDa10fot+UYr5m2mR2uAlumty01vp4lMRdttIoe1qfOMvwHJ bw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nybb2rnth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 04 Mar 2023 00:21:43 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 323LmIDW032935; Sat, 4 Mar 2023 00:21:43 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8sc63u4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 04 Mar 2023 00:21:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OrXLgzClsjPcuNtErGDnq24OPnXWXZJyPrxtv38zDY80EbJb/hzVJZjYAGL5vzy7lQarY8eHFVJzjuqL7Emrepm27E9xTMYADfkJlZ+qfL8Z99AxtdO8ysT5AH3QZsLNdc7sAEyztr4jey0wftYqVtBO1GPRSLMlBpaBi8fCKwvj4lQIm4QfybwlhE8K4OIDT8CGGwTdyOhTP/gV+pnIIb2ir7LeYnKRF1XB8t6GS8ga2x7GZ9x7z+N/sdmZTQF/yIG5a4rhbGkyiL+zeALrqrRbT1kvIkm85mpo3zx5xO/J1sjCx3BsORPxeBl5T1ZOvn0y4VNcOfvUFM9wsXS0RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V149jvh2SU/eZ+b+qKlOmb/wP6bKH8Jd9WnwvG3LXUQ=;
 b=KWN1ifB8RI0JGyckvVFfQeISt4H7DCLzY9aCCAshJh3eMWqWpjlDpJ/SeUpJinKfWvTxCsWkyZlJvHuKVxX0nSaIV2JfVWuyBZNPcwCVFdv2OU6kslo79GAx3CKO+d4d0CVcgZhUatNVqD6fQtIzUod4BeRV+dWeijZ9iKtyebMgTUbmFARv9/ShELv8PP3aoaECqJf7Dx2eTAm4GV8yipGZtEqxQd8X0Fhb35ZsWxl8R2MjRBKNqkupAbtenVYoRlCjEYZdKWpgLd3wNCcxwWTwqet5EgqdtgVroPLBrW/OSWkNAJb742nQ5XmFPyhlinO8sQGIUGYdWZ+h9XGilQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V149jvh2SU/eZ+b+qKlOmb/wP6bKH8Jd9WnwvG3LXUQ=;
 b=s6jkbWWXnirhdQ8njDR03WlyZvLzWeqYjaI8DHj/QpuJ5SbZs5Z08A//8uZxpnBGt0h4xYKxQJHkiwj0pqEtmjzyRhXZkN/r77ZMouMe/UeebLPUmgLdCa4Q9vlco4SIm1x8/NS2x4GDvNw4+kkD3hJvYXBpROwC8bkYhSdht8A=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MW4PR10MB5680.namprd10.prod.outlook.com (2603:10b6:303:18e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Sat, 4 Mar
 2023 00:21:37 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.022; Sat, 4 Mar 2023
 00:21:37 +0000
Message-ID: <273e72f8-a74d-ccd2-fa07-eacfb281dbb4@oracle.com>
Date: Sat, 4 Mar 2023 00:21:29 +0000
Subject: Re: [PATCH v2 10/20] vfio/common: Record DMA mapped IOVA ranges
Content-Language: en-US
From: Joao Martins <joao.m.martins@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-11-avihaih@nvidia.com>
 <20230222151039.1de95db4.alex.williamson@redhat.com>
 <83238759-4808-1e41-824b-865c330a431a@oracle.com>
 <20230223140527.096dc42b.alex.williamson@redhat.com>
 <a53767f9-b630-8f2e-0523-bd47d4539c61@oracle.com>
 <20230223145018.3c46a966.alex.williamson@redhat.com>
 <617b396a-d5e2-8c10-9717-1cc6fc9d43dd@oracle.com>
 <20230228133653.2f911490.alex.williamson@redhat.com>
 <114233e8-bdb8-21f5-ade9-0163658feb84@oracle.com>
 <20230302114248.41b6c21b.alex.williamson@redhat.com>
 <c1e5fa47-7028-5e24-2158-2e64aa44006a@oracle.com>
 <9e219add-ec7c-4408-902f-fce8c5c64020@oracle.com>
 <20230303100551.435e8cd3.alex.williamson@redhat.com>
 <87b39028-4b65-36bb-6b41-9d8ac56164a9@oracle.com>
 <20230303124025.64c35d87.alex.williamson@redhat.com>
 <de73073a-821d-4c31-a8a7-80c054ca5f3a@oracle.com>
 <20230303164740.00c2e352.alex.williamson@redhat.com>
 <a071ee26-e370-9045-3c92-46f44953409a@oracle.com>
In-Reply-To: <a071ee26-e370-9045-3c92-46f44953409a@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0064.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::28) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|MW4PR10MB5680:EE_
X-MS-Office365-Filtering-Correlation-Id: ba0bc283-7298-4fc3-c684-08db1c466ae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tTubn3xk89JBAtBOFJh/r3I0dLU5+skNQ4ejFY93b+d2stSlimwXWM13c9HWh7BTi2oBv3wLgQ2+LtqxIL5xRVRXDeFsyJ/p9i5sUQwJXaPwOki9tkMl2srCUob/8XaU4ZBqXYhnnlW2pNn8lEKbmNg7BjlyltWSgyPThPyxG///00FRG70T6DbI66Ml4rcRFa+/i9jnUH2E0UJQN+ar2AsUcby/EtvZV4TniirnBKltvbdV/V3G/SGsS9lmdG8VKO1uXeGVb9B7TqgY8YWWA4qD03Pes/gCWSP59J0wdUvYR9aaG6twaKcJmEHVWW+ikyYaQjzY/hrTqviewXf60ryqDZolrnvgaZmd7NVP/GLOZCaCnAUXDkq6peIrz24Lc4PkaMfxPJ94WvMbv3RgeW4LvaKd2K/jrdQclOw6bgx6XurAOL+hVYihKpMQOYDuZz/xp0JRqAVRYhVJfIp4OkiNtevWG4sE3VnDLhVOlA07PSHzpP30JyxkFWjJc5fC8/16iR28oQs3qVRXM3xjnYFg5+JVp778rt1L+8JDMyVQ4l3UHQtpfLqg/n39ghU8dGNjPbcU0Z252jg+m5Q6oUT4Ak7JG4mneoeeqhQ7sgg9T8xcp0TnSSdSXVbXn31f8Yskwu4fzB52PMxRSj2gmDJ+KcGwKD98Jc1Fj4YTNjYWnAuucVTIjtWzIJOPAOj5ZKKFCEAqEezvqdV5FLk9cw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(366004)(376002)(136003)(346002)(396003)(451199018)(38100700002)(31686004)(2906002)(54906003)(6486002)(8936002)(316002)(86362001)(478600001)(7416002)(31696002)(5660300002)(36756003)(53546011)(6666004)(6506007)(41300700001)(6916009)(4326008)(2616005)(186003)(8676002)(66946007)(66556008)(66476007)(83380400001)(6512007)(26005)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlpEZGNWRkwrRmxHUlBMSEJJR1BKL0pudGhYbzQ0bW5EcXB3aURuSXVJRElE?=
 =?utf-8?B?QVBWYzU0RlFMZjVweG82U3FZdmRPQUJqUTdqN2dLb0dKUThWYnBSS0dUMHF1?=
 =?utf-8?B?eWZrYTNocWlhWWw1bFBwWjFnQXZBYlM3RTRTYUcyODFFUndPOWxBbTc3emNK?=
 =?utf-8?B?UWdqUEtqSmQ5amZaQ1V5ajZCelJqZDk1WTRyZk5VbkxWT0MvSGs3elREQy9M?=
 =?utf-8?B?OWJ4Rk1Jb2t6RTE4blVhQUx0VjBKeVpkbmlOUEFsTWFUTEtJSTZmT1pwby9H?=
 =?utf-8?B?Mms1Z3NyNE50WnJjcG84Zi9iOVBXaVA4dE44MFk2RVhzbE9qblJzN0JLZVVO?=
 =?utf-8?B?Y1B2UnlXdGlrY05oNFo1cGdIZVhmVFI1ZlVoazl1cVRFMzBMcUptcmt0WE9O?=
 =?utf-8?B?ekNkUkljVmpxUjYvMWNZSGQzaWxmbmIwaWNrOHZIeGhoMExtWVhZaFQ5cnRo?=
 =?utf-8?B?Q2kyWEZCNW9YUnNiSFZ6NVZjQVhUZmp2bkJlWUpCdnFiRXZVcTBtTnpCNXRC?=
 =?utf-8?B?TCtoZy9PTXVUbzRSQXcvT1hWNHpFaGlNZmFJVGR2WERCTmpNZ3NUYTFFUXBz?=
 =?utf-8?B?cUpmMmk4RWZuVjRuTEp3NUdMQU40M0RxeXJtNi9waEU2L0NnMHlNQkoxZ2xV?=
 =?utf-8?B?NWNwclIrZmpjZ3ZQdlJ3aWdtMWE5aU16MDJ1SGhQeUxYeE1XS2x4bWxsQmw2?=
 =?utf-8?B?Nnl2WGFxNTVvaUJsTUVKMmxYZ2NJRFNRL094TjZTZGF1L2E4dlNlSkdXY1Fj?=
 =?utf-8?B?WG81NmR0bFJxVVNjVmhCNGpMaU93ckFLZ2xhM05yRWY4SDZRcEtBOVpyZnRy?=
 =?utf-8?B?V2pDSUwrMk5kLzZkMHk4Qk5DaEhkRVR4MlFXWGtqa2xKQnhQNE1NUDJGT0dP?=
 =?utf-8?B?UnZnam1LdGprOU96VVNkZlRBTElDQVhZWDlzNFdyWGR1SDdVRU1GSzZ3SFJO?=
 =?utf-8?B?TEIyalFzSUZQMTlELzJGbmNQcGNFaUU1VnRMN2M2Z01aejF3UzBORyszV1RF?=
 =?utf-8?B?VHhmOVVpbHpLd1ZPR1Y3Q2dDcFp6K1dzR0JZemZyRG8rNm9nbWQ5V011Vjcw?=
 =?utf-8?B?NFM5NGkxL3pQcFJFNU54Y3RSRVpkZzRXeWplZW9nVHNva3pmK0htWktmdUkw?=
 =?utf-8?B?TEpSQ2hlWWl4MmFqRjgrVDRrRGYzc041eXdPRjNTdmFLa3psWXhRckNqVjRG?=
 =?utf-8?B?L3k3M3ZnMjFGT0pSZHIxUExaWFRpV3M1dWlDckFiZ0lielI0dnp4ek5UZTFN?=
 =?utf-8?B?MzFGVFRhUnF6YmpTRHlkVndRVXVlaG45SXB1b29hM200ZlZ6M1hKczRtWlVp?=
 =?utf-8?B?RXVOZkw1UHlKM0lZL3Fka05jWjU2Rkpnbms4M3BYNTZxaDBKeGFDenFUV0R3?=
 =?utf-8?B?QnBlQjZlRmIvR2ZzbUtRU29PZEE2UEl3RG5JSmVlTTNGdXVvajNIbWhSSXRy?=
 =?utf-8?B?V0dad2VmbllOYlZiWnAzUW5adDBMYWdHdHNkOXBHWUVOMSt0a0I1bjFNOExO?=
 =?utf-8?B?bWhsUk1Cajg2NDFPaUEwbVdQT2pLYUMyc3htb1NuMnF2NkhjR3ViUEMrQ09u?=
 =?utf-8?B?ZnAvWDB5VUZpZXhiekM5YkNJaWl3VDBZU0hBaytCMmI4Zzd6TTF6cEY3ZmU0?=
 =?utf-8?B?UXFvSTNlSHJMVDFjN2x2b1ZUV0FxSkdlSkgwcVkrT1ZTdk5QcW83eWt1N2ZO?=
 =?utf-8?B?Zm00bXBoZWNaaXovNE5aZmlpOEVnb1F6NXYzazkzUkNVMFB3UFdNWHNXeVRI?=
 =?utf-8?B?VnFvaUlOTEdJTWtoVnRUeVYwMGJjUGdjRFZsSURQc2pISnowc3NUT094d1hE?=
 =?utf-8?B?ZElXMHRQTG4vQWVrNWMxOEU3ekowSWNSVFFMMS9OOXA4ZEJvV1REZlRQNnRZ?=
 =?utf-8?B?OUNJNTl2bG43VWdiUmFaM3IrN3hxMVVOQlRXR2RVL0VpN1pvQnUwdGsxdnAx?=
 =?utf-8?B?eVZrMVQwVGk5NjhGN0FIU1dPRTgzZ3FrL0hEUURPeVJGeXNKQjEzSU0xWEJP?=
 =?utf-8?B?c2c4bDhGRTlRQ3c2ZU9DWFJrdGdUdE9FMElrU0FiQ2hFSjlHMlpqMk50a2xs?=
 =?utf-8?B?Yk1ONzA0NUl1OW9CQlNEdTBOZTZFQmsvdXVSSmhNRUFQVndLUXFhQi8zbmtC?=
 =?utf-8?B?S2VYSVFVeG1wWmZRai9COFVyRUxXTE13S0k2NnF6Nk1Kd0hxQkdBa1J1NWJ6?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: nva6N6uzO8Awza6d186jxlugEs6VngcFCMbnxK27QbZ8YHHVoR6OX77gHd3nw/PGIzc4duy4ebZ6DXRE9cgImEX+N0LaBe+Y7nvYUQG3PtJfgeTcqf8ZyCWcji1lEJQ9MFAVWlJld+N1a8YKGIM2stak1W1n3T7idzJJId21c3pcaxVLQBd7RfSn8uoeFmvQq14ZHfBE4o7p6e5ZVMQAokx1m4tdrfWoltRXrvDRGm+rDXVE2eqaKTlMUWKqR2fyJX4QIkt0U9HFzUAECQAOhb6gK/kyEzMzXziLastgBoaWYQ3dQn5bZg3Ekj/UOxwFgxh8nVmW3k9JYTC09e2gHd8vudpa6bSnv1jic6m2hr+wVbb3a68896CvioCUiA4HXHwiAgTdbUobKjh/YGMibyNkY4c2FhtVEAWNjiFZw5ST05I6nmX57k0be5Lfw66D5aONuCxn0wRE+HZ8NkkDuh6GRYE0zXhfXol9i3HkjOiH/H3bu3KT/sWIF5Hdhx1r25eQ4jwJaaTrCVB91zcrBZed2y6SXow+zmNp7HGkcIPX+FIlMeboLtuXXHeATapOVhhbVhsZqQdllW06NlGXRK1bYnzm5xsztzRhFr06F4lZVN+PEsSxjqNOgiow/SSo/JVY+c+7qvuzX9yLFdenYdeQh3+BbisRM2cVf04/eZxrtxxti85ZELLusW2UNMGwZ7712iAWtM+/9vwVHmrjaJmUS2NJ6DmcnmqudoQwZTCIodi+RgpdtAQ4z7isx0mciGIQLOhHyJenJshRmFZ1PNqOcDJyl5UDQJ5U0RmZtZTcPMioPK6IZtVoAJdRVDCq+mbOiVMzPkvKTTx7Zb/hFVHDhhu3bva4i/EfmWuA7WTUlGni/2U3BQ2ziHNC5jyfS044iQG1Y0MOSKR7BP/iWg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba0bc283-7298-4fc3-c684-08db1c466ae4
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2023 00:21:37.3003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xWXdyeMYJ0HKUhUccvVjhhHugMpacmlGPeLNfw1lutLKSDTkO65CvW0ZfWL/pig8pGj8qoP9Ct+4GWhRVa2cEORaP2QEnzp1O43p+m26Bng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5680
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_06,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 spamscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303030204
X-Proofpoint-GUID: LoCOKa6yw3JSfafCcPaJalgPw1lRJdKF
X-Proofpoint-ORIG-GUID: LoCOKa6yw3JSfafCcPaJalgPw1lRJdKF
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

On 03/03/2023 23:57, Joao Martins wrote:
> On 03/03/2023 23:47, Alex Williamson wrote:
>> On Fri, 3 Mar 2023 20:16:19 +0000
>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>
>>> On 03/03/2023 19:40, Alex Williamson wrote:
>>>> On Fri, 3 Mar 2023 19:14:50 +0000
>>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>>>   
>>>>> On 03/03/2023 17:05, Alex Williamson wrote:  
>>>>>> On Fri, 3 Mar 2023 16:58:55 +0000
>>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>>>>>     
>>>>>>> On 03/03/2023 00:19, Joao Martins wrote:    
>>>>>>>> On 02/03/2023 18:42, Alex Williamson wrote:      
>>>>>>>>> On Thu, 2 Mar 2023 00:07:35 +0000
>>>>>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:      
>>>>>>>>>> @@ -426,6 +427,11 @@ void vfio_unblock_multiple_devices_migration(void)
>>>>>>>>>>      multiple_devices_migration_blocker = NULL;
>>>>>>>>>>  }
>>>>>>>>>>
>>>>>>>>>> +static bool vfio_have_giommu(VFIOContainer *container)
>>>>>>>>>> +{
>>>>>>>>>> +    return !QLIST_EMPTY(&container->giommu_list);
>>>>>>>>>> +}      
>>>>>>>>>
>>>>>>>>> I think it's the case, but can you confirm we build the giommu_list
>>>>>>>>> regardless of whether the vIOMMU is actually enabled?
>>>>>>>>>      
>>>>>>>> I think that is only non-empty when we have the first IOVA mappings e.g. on
>>>>>>>> IOMMU passthrough mode *I think* it's empty. Let me confirm.
>>>>>>>>       
>>>>>>> Yeap, it's empty.
>>>>>>>    
>>>>>>>> Otherwise I'll have to find a TYPE_IOMMU_MEMORY_REGION object to determine if
>>>>>>>> the VM was configured with a vIOMMU or not. That is to create the LM blocker.
>>>>>>>>       
>>>>>>> I am trying this way, with something like this, but neither
>>>>>>> x86_iommu_get_default() nor below is really working out yet. A little afraid of
>>>>>>> having to add the live migration blocker on each machine_init_done hook, unless
>>>>>>> t here's a more obvious way. vfio_realize should be at a much later stage, so I
>>>>>>> am surprised how an IOMMU object doesn't exist at that time.    
>>>>>>
>>>>>> Can we just test whether the container address space is system_memory?    
>>>>>
>>>>> IIUC, it doesn't work (see below snippet).
>>>>>
>>>>> The problem is that you start as a regular VFIO guest, and when the guest boot
>>>>> is when new mappings get established/invalidated and propagated into listeners
>>>>> (vfio_listener_region_add) and they morph into having a giommu. And that's when
>>>>> you can figure out in higher layers that 'you have a vIOMMU' as that's when the
>>>>> address space gets changed? That is without being specific to a particular IOMMU
>>>>> model. Maybe region_add is where to add, but then it then depends on the guest.  
>>>>
>>>> This doesn't seem right to me, look for instance at
>>>> pci_device_iommu_address_space() which returns address_space_memory
>>>> when there is no vIOMMU.  If devices share an address space, they can
>>>> share a container.  When a vIOMMU is present (not even enabled), each
>>>> device gets it's own container due to the fact that it's in its own
>>>> address space (modulo devices within the same address space due to
>>>> aliasing).  
>>>
>>> You're obviously right, I was reading this whole thing wrong. This works as far
>>> as I tested with an iommu=pt guest (and without an vIOMMU).
>>>
>>> I am gonna shape this up, and hopefully submit v3 during over night.
>>>
>>> @@ -416,9 +416,26 @@ void vfio_unblock_multiple_devices_migration(void)
>>>      multiple_devices_migration_blocker = NULL;
>>>  }
>>>
>>> -static bool vfio_have_giommu(VFIOContainer *container)
>>> +static VFIOAddressSpace *vfio_get_address_space(AddressSpace *as);
>>> +
>>> +int vfio_block_giommu_migration(VFIODevice *vbasedev, Error **errp)
>>>  {
>>> -    return !QLIST_EMPTY(&container->giommu_list);
>>> +    int ret;
>>> +
>>> +    if (vbasedev->type == VFIO_DEVICE_TYPE_PCI &&
>>> +       !vfio_has_iommu(vbasedev)) {
>>> +       return 0;
>>> +    }
>>> +
>>> +    error_setg(&giommu_migration_blocker,
>>> +               "Migration is currently not supported with vIOMMU enabled");
>>> +    ret = migrate_add_blocker(giommu_migration_blocker, errp);
>>> +    if (ret < 0) {
>>> +        error_free(giommu_migration_blocker);
>>> +        giommu_migration_blocker = NULL;
>>> +    }
>>> +
>>> +    return ret;
>>>  }
>>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>>> index 939dcc3d4a9e..f4cf0b41a157 100644
>>> --- a/hw/vfio/pci.c
>>> +++ b/hw/vfio/pci.c
>>> @@ -2843,6 +2843,15 @@ static void vfio_unregister_req_notifier(VFIOPCIDevice *vdev)
>>>      vdev->req_enabled = false;
>>>  }
>>>
>>> +bool vfio_has_iommu(VFIODevice *vbasedev)
>>> +{
>>> +    VFIOPCIDevice *vdev = container_of(vbasedev, VFIOPCIDevice, vbasedev);
>>> +    PCIDevice *pdev = &vdev->pdev;
>>> +    AddressSpace *as = &address_space_memory;
>>> +
>>> +    return !(pci_device_iommu_address_space(pdev) == as);
>>> +}
>>
>>
>> Shouldn't this be something non-PCI specific like:
>>
>>     return vbasedev->group->container->space != &address_space_memory;
>>
> 
> Yes, much better, I've applied the following (partial diff below):
> 
I've also structured this similar to the other blocker wrt to multiple vfio devices.

	Joao

