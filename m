Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB883521E2
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 23:48:26 +0200 (CEST)
Received: from localhost ([::1]:34224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS5Av-0003aI-CY
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 17:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joe.jin@oracle.com>)
 id 1lS59q-0003Ab-EU
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 17:47:18 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:41996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joe.jin@oracle.com>)
 id 1lS59l-0007yR-FK
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 17:47:18 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 131LTqFp099492;
 Thu, 1 Apr 2021 21:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=b0XJXJ/VKZFYSFmSAoXB9ywoUZI0lpMVUcaxNxZdif0=;
 b=SR318D2B8eCrf+dsn0DFiygWfl5onZD+TTieUMsY1W1cqOGJ6KE7wGYRP2VnyQt+8rCt
 OS6iOltmyslvxmDgM6ypkp3JGGt6kY4N/Abw6/7iKL/HDJ7xDU7aBA+Opv2q/GQuN5vW
 E2V/t2feWVkzdsxwuP0ASlvVA00rdMDPuBC3YE7sAce7+jRQyqaOZg+vCdyD4YVxV4EX
 Iyh7d4s7R+29fIqbnvX8UqjDoj2udZtG3CHcsAwET9y5iL4qr+icqFv7ERb0/ZF2B9z6
 3f8qQtm9uwiQ1LiBSIZRDrhBpu3CRDRrLTduR9DrvbzHkTuxJjW0S6n4Cc5skRzLZkvk iw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 37n2akk9jd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 01 Apr 2021 21:47:11 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 131LTmln008828;
 Thu, 1 Apr 2021 21:47:11 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by aserp3030.oracle.com with ESMTP id 37n2astcc1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 01 Apr 2021 21:47:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oylc+UjCYypuU9BKQ88bIb0X8AgOqcmuKgxnwzW9n23FcUtcSt5JkXflj8KwIDdzEK+fy4ArX2LNiPqdlQZsnpF+BsOGbq24+PjZkfgbO2zbFFurwZ/Bs3tD9cZcu/FRF6cEWi9Jz7UoC9NyiXRf9AovtTOWSByLTd4cvEdvQrU8QYShXp8AZFzyh9aOMiT457VRBJfFcRykJCMmGFFF09TmIPmEW9Agife1sBxZ+CwGp1q7uj53+RG6vKBW3GdVjjM5Ryp6cQI6DVDD3n+AsrtQ9PPL3d6ZfyYN33I17ItVS334ORQ2DPizus8GQSqDqTyW+kgv0PhshYqy/TyEhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0XJXJ/VKZFYSFmSAoXB9ywoUZI0lpMVUcaxNxZdif0=;
 b=LSzj9aOmNroepgQ3iDLPfM9FVbfGHUY9REF33wrEgyAu5a16cBjD7sUQEbGKFFDQ5qTSEqjhZKqAr+S9kZPzrsbv9LJYlBtB1x0U8SAFeuN+9f1y/YNAxGDUKBUXd9/wddwUKi60F5xJjk1kbBE7sJpO23MFX/HLOFHy0DvWspRCy1okYY8+aA18Ppj24Bqq7cgsvkFZ15RPV5qpFwXp4aW+RNTKTydFRnUlZonJmT1n05mOGHH4xKhzD/f1wwX91LNqRi0Cweotgh7EeKWHiJywFAOLe1QxvneHXFD8Ntzw13jooFC8pU9MSI3dNYkLLOdcWJEV91fZj+QI4dGoEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0XJXJ/VKZFYSFmSAoXB9ywoUZI0lpMVUcaxNxZdif0=;
 b=h73IYpbzer5ItdRLZy0i3UTgvdpqqJLetdRZVGPDUy+s/0aNDCqHensoIFOs1J9Lpdc/bKHCuhng2G80aAPA0ppT+SERFgN6oTQZXgF9Sacz/+q7yfwCd/1sLd7bx7sSxFXcG1gyXhI32Hp07vLlsRskQtRO2kmBEM1N4mlv6xQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3160.namprd10.prod.outlook.com (2603:10b6:a03:151::20)
 by BY5PR10MB3969.namprd10.prod.outlook.com (2603:10b6:a03:1f8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 1 Apr
 2021 21:47:08 +0000
Received: from BYAPR10MB3160.namprd10.prod.outlook.com
 ([fe80::4929:75f8:9882:df9c]) by BYAPR10MB3160.namprd10.prod.outlook.com
 ([fe80::4929:75f8:9882:df9c%7]) with mapi id 15.20.3999.028; Thu, 1 Apr 2021
 21:47:08 +0000
Subject: Re: [RFC PATCH] block: always update auto_backing_file to full path
To: Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <ce32e1c2-c652-e83b-a6f4-c9773099cf9a@oracle.com>
 <237ac4ab-6210-832a-7068-7f2a2c90594d@redhat.com>
From: Joe Jin <joe.jin@oracle.com>
Message-ID: <1f1d2ba3-6e2c-80c6-4007-b0051e8e9237@oracle.com>
Date: Thu, 1 Apr 2021 14:47:05 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
In-Reply-To: <237ac4ab-6210-832a-7068-7f2a2c90594d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2601:646:c601:8dd0:71a0:f2d1:fd77:4dfb]
X-ClientProxiedBy: SA9PR13CA0064.namprd13.prod.outlook.com
 (2603:10b6:806:23::9) To BYAPR10MB3160.namprd10.prod.outlook.com
 (2603:10b6:a03:151::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2601:646:c601:8dd0:71a0:f2d1:fd77:4dfb]
 (2601:646:c601:8dd0:71a0:f2d1:fd77:4dfb) by
 SA9PR13CA0064.namprd13.prod.outlook.com (2603:10b6:806:23::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.18 via Frontend Transport; Thu, 1 Apr 2021 21:47:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d1ced33-cf50-406d-5d7c-08d8f557b2e2
X-MS-TrafficTypeDiagnostic: BY5PR10MB3969:
X-Microsoft-Antispam-PRVS: <BY5PR10MB3969A9CF72160ADD3B2D92ED807B9@BY5PR10MB3969.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1SY83n8ldIdpStJYvJEiaUQHErR6KaNNsrregkRKSAlghKuF9UNEKR4buCNKtZOsFzNqnBYxa9/Dl38QEZf8o0j9+yKulPPg5AYtbHwUMm8BhuSUptsXVarDFDwmBeyC4GCTw7CH7hyrerAJeWoEVuJWHmx9ewOuXU9+iWoOlqMQJDm4yeyJcjEYV5FOW+fPOspd1FcTZBdqYcmDuKEwNfRN1sJyj5+prXurk747f+8rcsIenr6IwC02KUeuIh9rOcAm3C18kGbvH0ecfZSXl0nM1r/4VA9PHOgx6kgvzLWT38KZ+boY3lRyjux3tAfpIof5WiqSnNqLtfEQjeh60ucsONoylqTuqU9vKLnV84vb84hhNai4LEKRvCbZpQEfT4s5pXgfgrvKwSy9OMYnN9SmBybZmwxAbNpfCMGezxQO9RaLkgDWh8jpJih0gI3eITSpeghqnHCTyfrxUNWKZDKQlax6sC+vl81wzxGjjPsS8z82vS/mMh54hSe2ApQMgecC+o1+M+pZLa+jSVhLDr//oixk9ZGrikOkjxdk5b+MMVaRAc7ZrTwSEvMEo4iaLw1TprDwN7ENeiovdKlH8CAKxvN8Qr6RZQ3m9SsH02s490mKPyjvhhuuNTx4IJCIQzF9hU/BQzF+AefeZcc/WzLTf39/iyi1WnT0/hQ2JefdWsMb0f7awEu/1OK69lMNePDdLfuQE9pGTm5GY6ghmzjy1Qjc+9mjh7kgmvg6Wjk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3160.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(346002)(39860400002)(396003)(31696002)(478600001)(2616005)(44832011)(6486002)(66556008)(316002)(83380400001)(2906002)(86362001)(66476007)(16526019)(186003)(5660300002)(15650500001)(8936002)(8676002)(38100700001)(66946007)(110136005)(31686004)(53546011)(36756003)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QkYxcC9XR3VLcUhCaUhmdGNRSzVBclIyMDY0aTlUMFVvTGNpbkwwd1AwcEF6?=
 =?utf-8?B?MHFuaDY0T3oxempJL2NxMk52dlVsVmNBTXFaaStJbUY3dWlGR2h3MkREV0tS?=
 =?utf-8?B?eXlQWXNkVjFLZnNITVRWbFdjVm5xODdzWlBheFZPL1hheHRoUk8zSGhFMTMz?=
 =?utf-8?B?MUdrMjR1USsvZmhXckt2V2hxU1F2S3J6ZXdOTHVHZFh5RlBpL2dRUzk0SGFJ?=
 =?utf-8?B?bUZIRW5HTDNMMUViUklYUzNJdkpnTnpqMTM0b25qWnRHaWtkR1IvNm95Tm9v?=
 =?utf-8?B?WDczc2RoMSt5OWhqcXZOWi8zTG1jVlN3Qm15MGdCUTJzZlk2RDZ2dnZSRVZN?=
 =?utf-8?B?a01aZEtuSFhNUHdReC9OYUU4S1ZtdzU5YVYzT0xVaFF6NGJUM08yZndzU2FK?=
 =?utf-8?B?YWNRK1pPUFdvR3hxUU9GSFVwQndpUDNteG14Y21xRlhJMzB6cVJQRlBaVm03?=
 =?utf-8?B?MFA5UldIb1dPZzJsQ0JCdy9PRGo1Rmhoemo4NzVab21iZXpocDJDK3JWbytR?=
 =?utf-8?B?bTU3RG95MUlubHdibTBGaTNjQ0FKMnVXTUoySSt4MU8wZFRKbjJBd3lpN1lY?=
 =?utf-8?B?MUdlZnYyT21ydGRoQ3dNNStEVEVZb3NqdTlvSlhnWVJuN0U4alhXOHNZQjlP?=
 =?utf-8?B?enZka0xHVzR5RWtmRXFPbVR1WURnZzZweldOdGF1UEpsM3JJUytrUVJHc2VR?=
 =?utf-8?B?VVZxY1FVNFNXK1NSSHI0WlN3THJSYVRzVFcrVzM2RUpMWklqSDdLRXBjWjh2?=
 =?utf-8?B?UnRTQWlZdlpCcFU2OHRPMVkvd1p2dDJrSDhKNmk1eUNHd1J0ZUxpL2JQVlMr?=
 =?utf-8?B?OUptbWdMeEtqUmhObWFIQWllSkVUK2xIZzdwZ3ZEbEZkWkNzb0R6Y2J2Skhu?=
 =?utf-8?B?anZXeWN6ZmR4cEtGUnk5NzI5d09mdzJKM1c1WmNzN3VncTNicGZLR1lVczY5?=
 =?utf-8?B?Rkt2eU1qS1dNRk8zNXEyWklRMXRSRDdKSzg2YW9XcTBudlQrSjQ1WmRkMzBB?=
 =?utf-8?B?bFdFazNwYUFyQXkxR3d0c1RHbXBuNitrWHZrVnpOVmNIaXJPTERSQis2clBm?=
 =?utf-8?B?TkloN1FoN3ViQk12UW01VTUvQ3Y0Q3FpbXZ3dUJZUzBSSVpHZklUOUhVWGtL?=
 =?utf-8?B?b3NHUG9saTA1c0RSakVqQ0lBWkhsdm9kQWMwNjRjcWU3NkRxTDQ4eVoveC8z?=
 =?utf-8?B?ODRoTGxTem13UW51RmtiUzZuN3FBSVFYTXE5ekd5bElPMlFuYTZDM3JjY05k?=
 =?utf-8?B?bFFyd3hoYVdROGNHblZMbzlJWkt1SEpIRWlIVm9UZXFrT2hiYm5tWUtNZlFa?=
 =?utf-8?B?QlZjc21HTDkvTms3WWpkYzRadUNyWVBBdVova016cFNrUS9teHhlVU1obDln?=
 =?utf-8?B?d0JYQVozb2IrRlRLaTBSZ0diVUJQbmpYWDhjdUR1WVJiTlh1UmkzWFJNMFBn?=
 =?utf-8?B?RGJibCtqWlFlUzNuRkpSbVJDTFlUOHZKRzA3NFBuMG9Nd2F3NUJhdTRMMHBW?=
 =?utf-8?B?RVFXbVhpbi90S3JDY0t2eElQNkFGL29MbS96ZTM2bkNYc1pKV3dha0NFYUQ1?=
 =?utf-8?B?YjRUc1c1Vms5UExueStwR3Q0U1JoTmtMaHVFUytEK1A1ZnVnUWYxM3FkMmN0?=
 =?utf-8?B?aDVwNnF4M1cxTTVsNnA2YWcvaTNPaEk4ckpXYXJrQTgyMlNWU0hnM0ZwMHF1?=
 =?utf-8?B?cEZGa0xlQi9peFZPTjZkVkpjOHFDTnNFaDV4Mm52RzJkWDV0eWhFNTNxNTMw?=
 =?utf-8?B?T0FkTGN1NUlGNnBsUWM1aFhudk5UMGNERXpBR0ZWaW8wMWFTQytpRUdiU2ZB?=
 =?utf-8?B?ckxJZ2Q4NEZ5TzArM2ZuRkpmdWpqU01CbldTWUt3Vm1yVnBFOUlwQXViaDQ5?=
 =?utf-8?Q?UAlGx5eheA/JW?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d1ced33-cf50-406d-5d7c-08d8f557b2e2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3160.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 21:47:08.5744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R+Nids+ucu5fBiubNpJC3vFXzLYqgtVHlG9muuWEU/fDw4jqI05gtPmBluezfDjVMNueWx6MxTeXnPUEbEH14g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3969
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9941
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103310000 definitions=main-2104010138
X-Proofpoint-ORIG-GUID: JIb3Wb7K1_h1yuOaavnvbB4n0LaWM2ZC
X-Proofpoint-GUID: JIb3Wb7K1_h1yuOaavnvbB4n0LaWM2ZC
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9941
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 impostorscore=0 phishscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103310000
 definitions=main-2104010138
Received-SPF: pass client-ip=141.146.126.78; envelope-from=joe.jin@oracle.com;
 helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Max,

Thanks very much for your replies.

On 4/1/21 2:57 AM, Max Reitz wrote:
> On 01.04.21 06:22, Joe Jin wrote:
>> Some time after created snapshot, auto_backing_file only has filename,
>> this confused overridden check, update it to full path if it is not.
>>
>> Signed-off-by: Joe Jin <joe.jin@oracle.com>
>> ---
>>   block.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>
> Do you have a test for this?
My issue is my guest image is on NFS, I could created snapshot from ovirt but I could not delete it, tried to commit it by virsh and it complained qemu internal error:
# virsh blockcommit snap-test sda --active --verbose --pivot
error: internal error: qemu block name 'json:{"backing": {"driver": "qcow2", "file": {"driver": "file", "filename": "/rhev/data-center/mnt/nfs_server:_nfsexport/fee77d23-1291-4bdb-9157-12ff6cd5ee96/images/66bb625e-7458-478d-a238-b012f87062b8/919a4cda-bf11-4bb7-a2e3-d9e4515ed646"}}, "driver": "qcow2", "file": {"driver": "file", "filename": "/rhev/data-center/mnt/nfs_server:_nfsexport/fee77d23-1291-4bdb-9157-12ff6cd5ee96/images/66bb625e-7458-478d-a238-b012f87062b8/24d28fcd-67e3-49d2-8860-2110f3a5e796"}}' doesn't match expected '/rhev/data-center/mnt/nfs_server:_nfsexport/fee77d23-1291-4bdb-9157-12ff6cd5ee96/images/66bb625e-7458-478d-a238-b012f87062b8/24d28fcd-67e3-49d2-8860-2110f3a5e796'
Tracked qemu block and I found when issue happened, bdrv_backing_overridden() was tried to compare absolute path(bs->backing->bs->filename) with relative path(bs->auto_backing_file) but they are same filename, then it triggered generated json filename.
Regarding auto_backing_file, it updated by qcow2_do_open(), and read the backing file name from image:
    /* read the backing file name */                                                      
    if (header.backing_file_offset != 0) {                                                
        len = header.backing_file_size;                                                   
        if (len > MIN(1023, s->cluster_size - header.backing_file_offset) ||              
            len >= sizeof(bs->backing_file)) {                                            
            error_setg(errp, "Backing file name too long");                               
            ret = -EINVAL;                                                                
            goto fail;                                                                    
        }                                                                                 
        ret = bdrv_pread(bs->file, header.backing_file_offset,                            
                         bs->auto_backing_file, len);                                     
        if (ret < 0) {                                                                    
            error_setg_errno(errp, -ret, "Could not read backing file name");             
            goto fail;                                                                    
        }                                                                                 
        bs->auto_backing_file[len] = '\0';                                                
        pstrcpy(bs->backing_file, sizeof(bs->backing_file),                               
                bs->auto_backing_file);                                                   
        s->image_backing_file = g_strdup(bs->auto_backing_file);                          
    }                                                                                     

Updated auto_backing_file to absolute path, I could successfully delete snapshot from ovirt, or execute blockcommit by virsh.

>
> The thing is, I’m not sure about this solution, and I think having a test would help me understand better.
> bs->auto_backing_file is meant to track what filename a BDS would have if we opened bs->backing_file.  To this end, we generally set it to whatever bs->backing_file is and then refresh it when we actually do open a BDS from it.
>
> So it seems strange to blindly modify it somewhere that doesn’t have to do with any of these things.
>
> Now, when opening a backing file from bs->backing_file, we first do make it an absolute filename via bdrv_get_full_backing_filename().  So it kind of seems prudent to replicate that elsewhere, but I’m not sure where exactly.  I would think the best place would be whenever auto_backing_file is set to be equal to backing_file (which is generally in the image format drivers, when they read the backing file string from the image metadata), but that might break the strcmp() in bdrv_open_backing_file()...
>
> I don’t think bdrv_refresh_filename() is the right place, though, because I’m afraid that this might modify filenames we’ve already retrieved from the actual backing BDS, or something.
>
> For example, with this patch applied, iotest 024 fails.
Yes after applied my patch, I can reproduced the failure, it caused by bdrv_make_absolute_filename() returned relative path, not sure if this is bdrv_make_absolute_filename() bug?
Added path_is_absolute(backing_filename) check before update auto_backing_file, test passed:
+        backing_filename = bdrv_make_absolute_filename(bs, bs->auto_backing_file, &local_err);
+        if (!local_err && backing_filename && path_is_absolute(backing_filename)) {
+            pstrcpy(bs->auto_backing_file, sizeof(bs->auto_backing_file),
+                     backing_filename);

>
>> diff --git a/block.c b/block.c
>> index c5b887cec1..8f9a027dee 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -6969,6 +6969,19 @@ void bdrv_refresh_filename(BlockDriverState *bs)
>>           return;
>>       }
>>   +    /* auto_backing_file only has filename, update it to the full path */
>> +    if (bs->backing && bs->auto_backing_file[0] != '/') {
>> +        char *backing_filename = NULL;
>> +        Error *local_err = NULL;
>> +
>> +        backing_filename = bdrv_make_absolute_filename(bs,
>> +                                     bs->auto_backing_file, &local_err);
>> +        if (!local_err && backing_filename) {
>> +            pstrcpy(bs->auto_backing_file, sizeof(bs->auto_backing_file),
>> +                     backing_filename);
>> +            g_free(backing_filename);
>> +        }
>> +    }
>
> All spaces here are 0xa0 (non-breaking space), which is kind of broken and makes it difficult to apply this patch.
Sorry about this, I may use git send-email to send it.

>
> Furthermore, if local_err != NULL, we’d need to free it.

Thanks for reminder, will take care of this.

Thanks,
Joe
>
> Max
>
>>       backing_overridden = bdrv_backing_overridden(bs);
>>         if (bs->open_flags & BDRV_O_NO_IO) {
>>
>


