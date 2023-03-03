Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ACC6AA5FB
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 00:58:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYFHF-0005wH-1d; Fri, 03 Mar 2023 18:57:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pYFHB-0005vo-BL
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 18:57:25 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pYFH8-0005Xo-Dc
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 18:57:25 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 323MvWwC008147; Fri, 3 Mar 2023 23:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=i5tu98TFNIKsFylYYHV2FWk3yQO+NtCmajIm9dJrTbI=;
 b=cCIZ8Ym/z2sYavYcKR/pLw7JmfEYF17RjnmevpcVLK4Df09b7YIzaOzeG8jJQnJKfUpv
 9O9TQ2vD+lgnu1nAvIjMeR40lWWIPgXpFpAeESmQFMdWMhZXZBrsPJt7s1oEhgAIT5bx
 swj17XthbQO8+Kk4vnDVp7IAzxbv91vAxHLnlL2nPXNYj8iwzZbumi7x3bf6AScMkHtR
 jArstohfqPfNUF97RiXJd016xjAl2zK4kVVXWwmIyjIcAquDzqLsUcAOTA9IkYcB1GSp
 ggUTRq9DdhI3gjHYMhFZ7GM6JP5PDqSQBIYhvScno4pE4cqT5g6sER5iBaFfqDjj6TOn SQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nyb9arjj5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Mar 2023 23:57:17 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 323N6ji2034806; Fri, 3 Mar 2023 23:57:15 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8sj91k8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Mar 2023 23:57:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BcUtbxFgd/VXgOacUgZ3PH/RItpXRMQ4ZpX9ogJ2j/+nxUMy/Mse3ehbyuvFSVnHRpTByvNoOJT8Omh928YUynh61gL99XZUHMMor4GfVLy9uWegQX4/l0KobEe0LK78CEu2Osx9+HH2inczBVecghE4V/A+ReDDdttZFE8DAGwlzjjrGqDZtJER6DYg2WGkQJ1yesaTpMZP0KYwVVKcI3KIhsSx9/OKtJCu09N0h/ZyCNi/jW/9soIDAH6Cd3vw/jJa4pHKyAa4XUvqfCdBQ6VAiQkWmpenaper2QiZL3+YSSzjsrG/Np8Rl/nIsv+PRlc3zzbc8CFskgEM48HydA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5tu98TFNIKsFylYYHV2FWk3yQO+NtCmajIm9dJrTbI=;
 b=YWwzKddvbILSxpdalCdxCg+3vd/LgBxQP2eQ27WTrZop78Qb0dOPeuNNd15RoqM3vOFpLk3Ka40521ekR2YY+haXjKcrFNGrYergwFB1XMyqMafSa1QiTMo7ezBuN2i4pTuV9Aegp5KNN/SMNOH4KnCc0a+VN3ecK+IS5LreP38iwBFZ51Jmeb3wUkM9uV8ZZ597qqKXXHzq+frySPBourosdoYZo+fiuW1vSoB6NV+0BCBLNlTdl+B/27IHQmH+LoP/bXiGSqr7HUfCVIPC2jz7cPvUCQhwlzkAgG4S+/2WGPN0T4Xud7LvmPE2TEbt6fIYSe2Jlv0GFWG1tsCzKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5tu98TFNIKsFylYYHV2FWk3yQO+NtCmajIm9dJrTbI=;
 b=k+r1YuObTbXuMN1sf+R4ucP4H4O5tS7z0guExEetiSj2r81t7cu4IlaRKzw2GhUaqluksPG5uVVG9bhVg9nJltqCs14QGXCEeBAttYmzrT+Fk5EkIVn27BWcyL69cmruId0v4Q6eafLoUZCS6rjcgwujziMesZkQnw2op+2Yavo=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by CY5PR10MB5913.namprd10.prod.outlook.com (2603:10b6:930:2f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 23:57:12 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.022; Fri, 3 Mar 2023
 23:57:12 +0000
Message-ID: <a071ee26-e370-9045-3c92-46f44953409a@oracle.com>
Date: Fri, 3 Mar 2023 23:57:03 +0000
Subject: Re: [PATCH v2 10/20] vfio/common: Record DMA mapped IOVA ranges
Content-Language: en-US
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
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20230303164740.00c2e352.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0340.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::21) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|CY5PR10MB5913:EE_
X-MS-Office365-Filtering-Correlation-Id: 08f1d502-7cc9-4cc5-f1f8-08db1c4301e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nMeexyeRywtkZBg2UePmi9yhInbMe0kH9gG/Gp8b936olivn0kbGYyMGF/f31RWfNbVGwTQYMLgPcIRCxpRrF5TaY6c+4ZyH13oYpTFv/NePq3ZHJLmU6WETg+oYu3sLpspKvEIzvuBugVFbQiRgpf6RYqPEgm9YgUYyjlzx59X0AezJPP6/ax3GzK/nbhrTra7QJI5x7V4E3f1b7DWjmYEXqt8yx/w/yaMtoSKMqmr0YMBbfD4v5U0ve14Ucrqe2N+44bTVrew7gAVAIEepEbNKJEVGIVFge6iGHWDB5ySj9CF6JYhp1RgljYko3lXvXPJUzGGAqdK/mxcWJm0FSyUYoOjV9mokvroDFpXf4GuglfZHwBdzKFSQ6Tw6N7sYKaDhIwS5BHtlT1a8rY6RAgEqS8bUaDqpiDcQJVzX7+XHcvd2xmQnfxmz6FTbpVMVjQKqfozd5FWMCSAoJW/6p+WUKrngmaPJJhvXgiqzVFjgClZrl+2AYKkMFZLy3yF1r77gS0LnF14+GF8sNipZ5+dQJcxxOSTsypYaB8Tylzc/hP8mGcw4ikGlAV7qEnOjSsOo/kQ7pyhBosEUbzwf693p9XgqufhOYUurtvd0Z4TyZ+xzloznohHbaxohxNBHj928ckGVUM/LivfsatCsbUqHmTk49AD+2UG5xMQhjD1LAcnVbbRjc5eaEu50CIRVQuPen53bufk2SQWnv1dt5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199018)(54906003)(6486002)(86362001)(36756003)(31696002)(83380400001)(31686004)(186003)(66476007)(2906002)(5660300002)(4326008)(66946007)(41300700001)(8676002)(6916009)(2616005)(478600001)(6506007)(6512007)(66556008)(53546011)(26005)(6666004)(7416002)(38100700002)(8936002)(316002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkswOVlFYXhoRXZnTFgxU1p3eDhMb0t4MXRhcWszMklyajVtSGNCNkpyWVJE?=
 =?utf-8?B?U2pGbG8wdCtpY0QrclNlc3ozWkFoUVlaa2VkYWRYZU01WERqVks1UVNVTDAw?=
 =?utf-8?B?Zm5TZm9abEFJdG5VcTVxcGRTQVZ1SUhMazRkQUd2ekgwNk9UMEpxWUlLVFhj?=
 =?utf-8?B?Z3I2TExpaUtaR1QvZTRQZWtCTXpvN2lObytra1JuL3BLelMxM0ZGcStIVDBh?=
 =?utf-8?B?YWhGVndsWG0xWlg1NHZLeUxQOEVzTUN1Q1ZCa2J5NDZjYWk4SVk4alJWZW4w?=
 =?utf-8?B?TC81a1ZHN3liU3R3YzNvS1BzT3cvUXVrQ0JSYzdUaXRlaEZ0WVFKdE9GaTJj?=
 =?utf-8?B?dldMUlh6eTU5Y3d6OXhPQVM0S29zTnR0LzVZeVo5SzV4TTRzZTlJSTJ4Sngv?=
 =?utf-8?B?ZVgybHdkMGtQZ040cTZzL1prWHJZVXJYSVVhbnh5UndlR0FjblFqaGJjdXZk?=
 =?utf-8?B?c0hLeForcEhTWCtQTlU0WGVSWWpNSEovSEZkVVJKY2I3d2JudC8zY3M0V2hU?=
 =?utf-8?B?ZlhpTE9DWmswYTdlTUZTVWNJOXZma0Z2KythVzJWOU9mVlNJdExFN3o0M282?=
 =?utf-8?B?Qms2RktobkY0cUdXc0tYcDVVSFROK2l2Vks0Z25FbjBIQmFXaHA1K21Md0lW?=
 =?utf-8?B?K2pmVDVvNmpod0tGdlA5V0NpcUZXdzQyQ1dEbHRFODlqUllNQzJUMFVqYnZZ?=
 =?utf-8?B?ZkZsS3daZGRNTS9uU01pYngyUURidGtQVDhZcmxPNnlsM2NyYmNjL1MzNzRC?=
 =?utf-8?B?TVI1ZU9BbE0zL2J1NENUN24vSnJSZ3FZYXlEblF1VHBvMVBDZmNnT003ZVR3?=
 =?utf-8?B?Y25xUEZVUEk0SWhOaVMzY0xVekY3c2JiR2lsTnlzRFVuVzBMMkh4eWRadEhP?=
 =?utf-8?B?TmhlSkZNRFFVQkJpbjl6VksrMzNOTFd0bzJoZmFaeHB2Z3V0MUErK0diRU1y?=
 =?utf-8?B?ZVNVUmNLbWU0TmJrdFArdmVmcXhIYVlUZkcvcEZGMmtlVlQrQk9ONytWWW93?=
 =?utf-8?B?dCt4bXRxbWRBdFFPR2tjV0JFUzFLQzh5SG5YeVQ4NzJIZzRzU1BOSjZ2bE1J?=
 =?utf-8?B?bFZPbmNnYllUa1dVbHhtUlhOa1lzUEd2bmJWSk0vQ1JTcXhtaXdEcWd2NVBz?=
 =?utf-8?B?VUxQb0cwb1RCdlR1S3RKaGkwcTBKTkJkdjl2VEpNNmJpVDdjWTJPaGNpOVlE?=
 =?utf-8?B?TXNDTzFmbm90VGtIK0pDWHZwYjRWb3FkWmRZdmpEeFhxQnErd2ZIRnRnbEFY?=
 =?utf-8?B?SlJHbTIrdUxpUlBhL0hIZ0RBRyt3cmRiK2FMb2V6cXYzbFk1bkpPc2VjQXJh?=
 =?utf-8?B?OEIvSG43YXlzMDIwbVhkbFhnTjNrNTJucER6UHdKNVBCSWRNS0tWWHNETnV2?=
 =?utf-8?B?K25GWE1zaFdqVWcxWmpBSjd2Wmp0TG83MHBucEMxejR2VnN1eXNkME05VWlw?=
 =?utf-8?B?azc1YmRYNGtQOEZ5UGdZdFhTc1doOTZ0Y2R6SFB5dlBpeTluOTc3a29tdWsx?=
 =?utf-8?B?R3hCVEpJdjNDZ3BNMk9UMERtdi9lK1ZzS0tldzZsN0hxNkFFR1Q2d29UVkZa?=
 =?utf-8?B?MnpydkNLbXNTR0lOOWNFWjVVNGtEeGlZcmVpek5oNzQ4Vmx3K283cmhaYXRC?=
 =?utf-8?B?a2IvSEtQb3hBdVpsYW9IY0E0Uy9IQnlKVFBBVFZYSXlVZFdxM0g1QWxLdTRq?=
 =?utf-8?B?cE9sRzdUdEFxTmJBcndIV2pOV0FYVUlvOU5SWkQ5eXRTbW5VOGpLTk9MWEU3?=
 =?utf-8?B?WXlHM0J5SGZzM0FEU3d3M203L3M5UVZWVDl1WTlCUVAvaiszTCtaY2ZnUGNp?=
 =?utf-8?B?SlR5MWRpZTlHVVpFZ0M0Qy9XMk5CenN6d3QvS21kYXc3U0RMN1ZjR3pkK0VP?=
 =?utf-8?B?UEpZTmREVVBIOVoybmpIaFQwaGU3V2huN0JBNTAwTzB5eVhza1R3QU1KQzU5?=
 =?utf-8?B?VkhIL0FpK20yQm1lSFRnOWpmVVV2dGxqZVhHWW5CQXNVWEw4T0hKNkhxU1Zn?=
 =?utf-8?B?WENBSnFhd0c4RkJLYXJkbXA5ZEJnZnpIb3FDbHljLzJrOWEvcklUN2VIbmlz?=
 =?utf-8?B?VW9veUNzb2RPRnRnS3dKOWE0K3h1cU8vY3FUb1N6Nys2dm8zeDVjb004Z1gx?=
 =?utf-8?B?aHRLVmF5NlZTN0pmL3BRTlpyRFFHWmFFQXBVVkt4aEFuWHZyRG5Yd0NVV2V1?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: w3yT9NOLITMvmH4HBTH4W2AAPp6/jucADo/LrlDSPFXsyfc/ZWUJWwwIgIRD7lnousx5IwV0VWc5JObpqFy8HvnSHyY/AFZuqsjaoIvVbwBwXgXl0Ci3fW5gdN4ouA6SlnDRNqNO6cpYu3XLsj4SHk9h2y5Lj8vvUS8+xmJwNZqwzIojoLLkBbdjDEqMO1BU2PAVlkjLLMOzslwnHssx+PxuypYPC0AQkA56TMHeClSWs+NZZjKC4td7VHJQ7Ts6Mln9QA2kNZf+CJdFbpT9W/cqi7TnRtp4jCacy2uVFxmBlKJCiaj/EZHiGPXi9WgyGSkCGToTJ09ODxsM/9XV7KlR7d4KUnpwHzWrvZSEVH7J2eKGNKq/AQEjRjcsqFfHRCE2w1VZgbY3XioqkLREpMR3wqajt8sNhkjeZOmQk2iFCgj4enpGmjY/4cwjAjJ9ILku6/mNqw8BtVBSFYL9VKDjQ7woh4B6lWwBfwebVy0og6YjRZjtngLznwjImiLnX34bxOuV0AxaPc3KQ+LLvKiYojrN0MJw+TCPhN1u7D2svjwj/oBPAsz4bcyPgJ8zxCGooXpa7KiM7TPodA0WIYi671HntFhZ/2HlrxtIE8l0Xz1LhxT6iCHxzwqR9Y4pu+ROuMefL9jpSjCqoUrwsCfRlBwbpU6+mXMUxU4xeMVd0iINERcGRAGjIOMj6moBAacHJ+iukuUqahmhtozyslZ07MvkfpuLQGqYCrVE7pQangWXkZhR+nPzUPmZRnfZ5TGyCEksNKfpOx/TH3FuAdqodytMa461kqqWbgrkTg0lPjEnSueKoXoSNeMgT0o8OT43ZQj8l/iEkZOtGxFqTS8VZwwy0IyMfU+uwvTI6I1vbEFzbYFPDlRXNtmpPGEbcbaX7PudEiRB311F81OO6w==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f1d502-7cc9-4cc5-f1f8-08db1c4301e2
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 23:57:12.5594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HE3MAAkQ40GjmCx+wptEQqxqEjrdBjCOGyZvm0csTDAtJCJdvplbVCkmytaxJQb1dzrb2jDQN3aZegTtYkn+LD2lC0nTGDlQv29L+P7PW+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5913
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_06,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303030202
X-Proofpoint-GUID: _XcBfwMhh_mMW1qXzn4jfRUcIKnflFGw
X-Proofpoint-ORIG-GUID: _XcBfwMhh_mMW1qXzn4jfRUcIKnflFGw
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

On 03/03/2023 23:47, Alex Williamson wrote:
> On Fri, 3 Mar 2023 20:16:19 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> On 03/03/2023 19:40, Alex Williamson wrote:
>>> On Fri, 3 Mar 2023 19:14:50 +0000
>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>>   
>>>> On 03/03/2023 17:05, Alex Williamson wrote:  
>>>>> On Fri, 3 Mar 2023 16:58:55 +0000
>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>>>>     
>>>>>> On 03/03/2023 00:19, Joao Martins wrote:    
>>>>>>> On 02/03/2023 18:42, Alex Williamson wrote:      
>>>>>>>> On Thu, 2 Mar 2023 00:07:35 +0000
>>>>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:      
>>>>>>>>> @@ -426,6 +427,11 @@ void vfio_unblock_multiple_devices_migration(void)
>>>>>>>>>      multiple_devices_migration_blocker = NULL;
>>>>>>>>>  }
>>>>>>>>>
>>>>>>>>> +static bool vfio_have_giommu(VFIOContainer *container)
>>>>>>>>> +{
>>>>>>>>> +    return !QLIST_EMPTY(&container->giommu_list);
>>>>>>>>> +}      
>>>>>>>>
>>>>>>>> I think it's the case, but can you confirm we build the giommu_list
>>>>>>>> regardless of whether the vIOMMU is actually enabled?
>>>>>>>>      
>>>>>>> I think that is only non-empty when we have the first IOVA mappings e.g. on
>>>>>>> IOMMU passthrough mode *I think* it's empty. Let me confirm.
>>>>>>>       
>>>>>> Yeap, it's empty.
>>>>>>    
>>>>>>> Otherwise I'll have to find a TYPE_IOMMU_MEMORY_REGION object to determine if
>>>>>>> the VM was configured with a vIOMMU or not. That is to create the LM blocker.
>>>>>>>       
>>>>>> I am trying this way, with something like this, but neither
>>>>>> x86_iommu_get_default() nor below is really working out yet. A little afraid of
>>>>>> having to add the live migration blocker on each machine_init_done hook, unless
>>>>>> t here's a more obvious way. vfio_realize should be at a much later stage, so I
>>>>>> am surprised how an IOMMU object doesn't exist at that time.    
>>>>>
>>>>> Can we just test whether the container address space is system_memory?    
>>>>
>>>> IIUC, it doesn't work (see below snippet).
>>>>
>>>> The problem is that you start as a regular VFIO guest, and when the guest boot
>>>> is when new mappings get established/invalidated and propagated into listeners
>>>> (vfio_listener_region_add) and they morph into having a giommu. And that's when
>>>> you can figure out in higher layers that 'you have a vIOMMU' as that's when the
>>>> address space gets changed? That is without being specific to a particular IOMMU
>>>> model. Maybe region_add is where to add, but then it then depends on the guest.  
>>>
>>> This doesn't seem right to me, look for instance at
>>> pci_device_iommu_address_space() which returns address_space_memory
>>> when there is no vIOMMU.  If devices share an address space, they can
>>> share a container.  When a vIOMMU is present (not even enabled), each
>>> device gets it's own container due to the fact that it's in its own
>>> address space (modulo devices within the same address space due to
>>> aliasing).  
>>
>> You're obviously right, I was reading this whole thing wrong. This works as far
>> as I tested with an iommu=pt guest (and without an vIOMMU).
>>
>> I am gonna shape this up, and hopefully submit v3 during over night.
>>
>> @@ -416,9 +416,26 @@ void vfio_unblock_multiple_devices_migration(void)
>>      multiple_devices_migration_blocker = NULL;
>>  }
>>
>> -static bool vfio_have_giommu(VFIOContainer *container)
>> +static VFIOAddressSpace *vfio_get_address_space(AddressSpace *as);
>> +
>> +int vfio_block_giommu_migration(VFIODevice *vbasedev, Error **errp)
>>  {
>> -    return !QLIST_EMPTY(&container->giommu_list);
>> +    int ret;
>> +
>> +    if (vbasedev->type == VFIO_DEVICE_TYPE_PCI &&
>> +       !vfio_has_iommu(vbasedev)) {
>> +       return 0;
>> +    }
>> +
>> +    error_setg(&giommu_migration_blocker,
>> +               "Migration is currently not supported with vIOMMU enabled");
>> +    ret = migrate_add_blocker(giommu_migration_blocker, errp);
>> +    if (ret < 0) {
>> +        error_free(giommu_migration_blocker);
>> +        giommu_migration_blocker = NULL;
>> +    }
>> +
>> +    return ret;
>>  }
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index 939dcc3d4a9e..f4cf0b41a157 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -2843,6 +2843,15 @@ static void vfio_unregister_req_notifier(VFIOPCIDevice *vdev)
>>      vdev->req_enabled = false;
>>  }
>>
>> +bool vfio_has_iommu(VFIODevice *vbasedev)
>> +{
>> +    VFIOPCIDevice *vdev = container_of(vbasedev, VFIOPCIDevice, vbasedev);
>> +    PCIDevice *pdev = &vdev->pdev;
>> +    AddressSpace *as = &address_space_memory;
>> +
>> +    return !(pci_device_iommu_address_space(pdev) == as);
>> +}
> 
> 
> Shouldn't this be something non-PCI specific like:
> 
>     return vbasedev->group->container->space != &address_space_memory;
> 

Yes, much better, I've applied the following (partial diff below):

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 6cd0100bbe09..60af3c3018dc 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -421,8 +421,7 @@ int vfio_block_giommu_migration(VFIODevice *vbasedev, Error
**errp)
 {
     int ret;

-    if (vbasedev->type == VFIO_DEVICE_TYPE_PCI &&
-       !vfio_has_iommu(vbasedev)) {
+    if (vbasedev->group->container->space->as == &address_space_memory) {
        return 0;
     }


