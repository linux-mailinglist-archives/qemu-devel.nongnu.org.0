Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3B26A066D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:39:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8z1-0000kk-6O; Thu, 23 Feb 2023 05:37:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pV8yi-0000iF-Pv
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:37:33 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pV8ye-0006o0-Op
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:37:31 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31NAFMSe021446; Thu, 23 Feb 2023 10:37:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=kyAEbAEUiz5ZUYe/e0DtzaNXN578pcaIlrTy8oTIkS0=;
 b=twM6SrHsdOSnNGwSRVLy8Tq1Eagc/Ku0ZMBavYS8unfy/PitKnXP8JcuKTiiP2XrZOkG
 OUoCxqGpJEXCpdRMmLt4t1j7kYj6bHY5P0/XQsZV/UkzQ0mdoi6qlzx56bks6UX2Jy1D
 EK1ACbvZDF3EONtfJcBZC+4O/iCZ5QcmumQwIquOLreB2jMeFHNnBf+uZiQ3i5iByQiM
 OWwmUXZP+bu5yY2sU1jkKo0QaXblPLOAK7E2F7UONlRnzBs+DE40jNNRcJzbEtpOXxu2
 1GxTQYz+8HXSIs3fXUiU7cVu5nt925zfAyCt1B/3eEC5tCYNYkJUAuzTE6y4P9eqMFJo yQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntpjaa3k2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Feb 2023 10:37:21 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31N9oEP2031338; Thu, 23 Feb 2023 10:37:20 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ntn47tyb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Feb 2023 10:37:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gH/nMC3b4GEidgovhoZsz1QF+gHu4kDtFy3knsi86ifjiCchVjv7aWba7bwCnJfW38wubnRJS+Gls61LY0D6CW3/iMRxdideIgdQhflxbgZZVoTH/HBRkxruQRXZXUhbP+F0YCLnhxPIZ9BXCvY7uutziVSFiVhN9Xl6dKiv2UN1LVLdN10ddAFfq4qeIa3zCAfcdYOR72mfYIcUdVOmI4+ahahFuHfwZmaOM2OIWbSLIj/AsW6ZHeIjIHVh+kNiORF0pRd+yIYf7TvYEPb+J3SrqgcyDaVeONSEQHY0cKQLKWS6v1TXHfx/tGOpiqn5XK0M4/cgj9ZhaSTMyNUcqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyAEbAEUiz5ZUYe/e0DtzaNXN578pcaIlrTy8oTIkS0=;
 b=JUeVrhjZO4GlX0tkWfEFun+dLaYWxOP3TRieOtwZtD1EfcWRz0/2y9TM+pPaikyAu0F6DiQcIPflwV9cLgioB9AZzZuIdgks8xT1uKEdWlxhbCf9qktLt4yvLWt62XR35YBnAFuD3sf5svasquU7f30LJyIyTAK1enPw5+AXwYaPGaGxSpdXuZM1/gtCfZrS+wRvNvxFDQuZ5fdskMovbxRQRiC1q312v+Y+ra9lNy9kU5my2BP01E5GxpDvFDTcLdfo+UUfjnokCJ0ISHuzsenKnoGid23lK+Q6P1B9CtnQn2vVnBqCgHw7mR7ktd0KE8kGxC2xUWFpWjN/KJnckA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyAEbAEUiz5ZUYe/e0DtzaNXN578pcaIlrTy8oTIkS0=;
 b=h0NESZAaXZJbFKjWTaOeGEFiF0lSgK/UA5fYHv0LT5D90+Oj5kZYu55k6YnkUYQOqfkfFvC70ZFWSFu37V64XfdbSuKaDeLRDHvpuMBAMh4Ctk+ztIjiCSdN9HWAmnTQxWfTOYCDKs/6TI+A47JlqeiR27VP8vVfuThCbHHR6zg=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by SJ0PR10MB4445.namprd10.prod.outlook.com (2603:10b6:a03:2ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.7; Thu, 23 Feb
 2023 10:37:18 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 10:37:18 +0000
Message-ID: <83238759-4808-1e41-824b-865c330a431a@oracle.com>
Date: Thu, 23 Feb 2023 10:37:10 +0000
Subject: Re: [PATCH v2 10/20] vfio/common: Record DMA mapped IOVA ranges
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>,
 Avihai Horon <avihaih@nvidia.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
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
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20230222151039.1de95db4.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0017.eurprd03.prod.outlook.com
 (2603:10a6:208:14::30) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|SJ0PR10MB4445:EE_
X-MS-Office365-Filtering-Correlation-Id: fa5c4f25-24a8-476b-1c20-08db1589efa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uEv0IoBu4ra81LGkYIUExRuvzNP5b0oVJekZuNLtnKSg7xMZbqwlRgZykWUq9nWJ3cJhvyVSOWfDBaSigFvIdiOe0/J4/9mRaDF5N0uWmYyVQ5Aud2jrpayK6O04hTSECoRBvN/OM5qHKRGCH8DZTkdTifOWzS6CDqdty9Y/YEv1kdXiu3qafeyFrPzOy/sXmmJ7JEJk557zjMBxggPtnTQZvHcHhz6vgmF2FHBoaCwfvbp9viCx36Jksrlov52r13ZXjhPfSn5ZAS5piO9p/UsHif6SJQcJvb1CFiaQsDB8Z7+t8+ftGZVukhilAZoWw1+/1tC2rFn3pDQJOrXAT6c1V1IUpM11VJ07nIXTledVnJbwKTRLnE4dmAmobLB9uwaXIkBL50L2s7t7P5aMigWUMJRZsZ7BDIU2BdVqgAjrgpeMpVE3Qe4U2peNxRrYZvimKq2ga62ZGD6AUhlulHJ7og/H2t+HREhsKLL+yKzhRjnrSHj+rIkh1zaXR74TmAuoVWPAEE9mJLDkv/wlwIeVdgT73pYLCz5T1N67CWe8IoZB4txmLZ4waXpgqDw0wss9JzTnCZhbS87Kz0ObmmJ6pWlXprjUcM6UqFFt2mAJJZScvEHE0hqHgHr/K/+EGKZWCkKgz2ivAQVGfHkQLokpVLZR1LfZUjwCkGMl6T1o3fwsTJq8he1aXgNuMoKct/2SUcdDwZHxtnipDL+NjQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199018)(66556008)(66476007)(54906003)(110136005)(83380400001)(66946007)(316002)(8676002)(8936002)(5660300002)(4326008)(41300700001)(6666004)(6506007)(478600001)(2616005)(53546011)(26005)(186003)(6512007)(6486002)(36756003)(31696002)(86362001)(2906002)(7416002)(38100700002)(31686004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXByK2RxdFU3akd4MitKMDlhRms1SURzRG5BWEpoS1NFcU1GRW5JSzZXOVhk?=
 =?utf-8?B?U20yTHpON2xZWE1Uai83WUZ6bTJJbmVGd3lFOExpRXhSVDFNeEpPTW9PU1B3?=
 =?utf-8?B?YXZhem1BcDBCWEdBTDlGRFFxMHprdWI3MVFJdUgxMVRUbUNGbFRsY1lNMk1C?=
 =?utf-8?B?ZE1mRlFQUnR0ZnpDUzgxQXdtVU9HT1IrY2d1a0VERy9JcE43cU9BeWZEMi9H?=
 =?utf-8?B?dXg3bGdJVEVaMmhSR2pYaHhCQ1ExTXU0UzZDQ1RXY1lyczRWUjZEbnhUVFhX?=
 =?utf-8?B?eUxjajMzd2FCTDBQU2J3b0V6a3dyQUx3aVVSNUh6V2F5T2Nxd3lKQUJRb0ZM?=
 =?utf-8?B?RmxHbHRrQkY3MUllZ0RpVndoUjVkMERMUXJhem1jMDJtZ0lBek9DM2JBM21K?=
 =?utf-8?B?MjhsVEoxZHpkdkhTZGE1N3hjcVZ4d2JpbWZzKzZaZklSN2pxVVFibVE0MkEr?=
 =?utf-8?B?MU9Vd3ZTRXU4cVJid2FPVFYvZUc5S2NuVTFHMVlKRS9HeEo1VFl6RnZvd3Vy?=
 =?utf-8?B?M2hnaDZOUDEwRTVmRW5SM1hqVTFoQ2VjOEd5KzhZZk0rT3dINTQ3emhteHVK?=
 =?utf-8?B?bkFTTWhUaC9iejlld0FxSVowcE8wTHhuSmkzVVZIcnpYTjV0ZFR5T1VvTHZq?=
 =?utf-8?B?UEpnOU9IQ01xaGFqMVVOK3dlMDI4YXZEc2w5RzRBSytidzl4dUQxV1NuUVNX?=
 =?utf-8?B?Mk93WWVpak12TklEMVFsV0xqNytQVG5xbER4c29VUVovRWpsQ2VYd1BnamxY?=
 =?utf-8?B?MlNLZ25kd3NkNko1STBQYVV4bTVUcTlRS0xIRmNDL2dDQjl1bEcvM0RScHJi?=
 =?utf-8?B?VFREY05tNFZzQkIzQk84ejJNQmVrM3RvN0dzdnBPaGgvamtqN3JNcmxNMnpm?=
 =?utf-8?B?YUtSQzI3LzVVUzFVSzErMHVvaTVBUHVYa3dkbEIyQi9qSUFRY3NpZ0Z1dU5U?=
 =?utf-8?B?YnBvNEhmb0I0ODdRTGVnNUs3Yk1KdmVFSkV2eEFmR2plVzJPUjdqYklaa1BU?=
 =?utf-8?B?SUlBYWhIU1E1QVl1ZGEwMnNheHVFVHVHT1k3U0ExdkNTS09GNDRkYlp5VDZw?=
 =?utf-8?B?cUREZ3pQWEt4c1E5bmR6cjl2aUd6SlhHRjgwV003MFhSRjVqc0lIZnRiNEVS?=
 =?utf-8?B?bHpEZWpwdkowSklxcW1EK3c3Nms2OXlvQnhBdEwySFNTOVpBbzluY0xHTDNj?=
 =?utf-8?B?MzMxeFBhSHd4OUhUcW03Q3ZXbzIyU0pHT1MwL0dVOEtVckpobVRLZnNQMXZZ?=
 =?utf-8?B?TnFqenlPYTVjcDFxekw0Y1hYTEs0KzlZZEU5QXAyZGR5ZzZXU0oxdk5RRmxz?=
 =?utf-8?B?ak1UKytReHNRZ01WdDkvTzBGWWxWVms5a28xRStpWW5lRUhJTVAvRy9id2Ey?=
 =?utf-8?B?WmFjZmxMcHRVL0tTc3l0U3V4MTdLQktRNEVZZktZSVpQRDdaZ0ZwZ2RmN1Bp?=
 =?utf-8?B?d1V4RXUrcEJpdmZzeEpxY2luYWdJODlCNlRta0o4VjlhOEl5S2IxMGp4ODlZ?=
 =?utf-8?B?VHFYTTcwQlJmRlZ3V2hVSlJJWUNOM0ZyalVBN3BaMkFtRUljMmJyYjFPN1Mx?=
 =?utf-8?B?dDBJVWUyLy9sT3QrblozVmNqdXNsRk1ubXdEcS9rd1ZYeW1NNjJpdGhjeUhU?=
 =?utf-8?B?Tm1rTFVSSXAxdER1QmVTS3BLelZWdDM5M2NmY05weG5KZmVHaUhWZ0t3a1k4?=
 =?utf-8?B?Nk1JOS95SE81UkluTjBlZE4rV0xUV1VJeTUxa011NXo0aGt3blp2OWpVWmpa?=
 =?utf-8?B?RTBXblZzVzN6WWxmMUlJaG5MM0UwTDYxSTRLN3pwMlMvUWV1RHZzS0hNbWdm?=
 =?utf-8?B?dDRMeE02Z0VIOUtBbEJ1TGJxRlBvZ0I4R1RRK3JwaWlvL3AvZ0hSOTgzYlow?=
 =?utf-8?B?UEZaTmVoQklyVEUzKzRJNUVmUUh2U1RRSG9XdVhYNlVBNHVmWmpzVVZVaXBk?=
 =?utf-8?B?L29MNkd3RE5XWm9FQnpFYmpEUWRHWGhYc1cwY1h2SnpscjlTWm5hWktFRC9y?=
 =?utf-8?B?bGVvVisrZFNMMWx2QmtCTkptdmIyYXRUZHkvUGlxUzlybDdNbUp4bTNRcllu?=
 =?utf-8?B?ZmZIUDA4aUkwaG85dW9jUnZLOGtMQlM0SzZqb2pnWTRUZVlOTWNuT1VzQ2ly?=
 =?utf-8?B?L0dkT3JDbVpXUStkcXcrcThXNTg4MC9NNGxFS3hkYXl0QkdPOC9mbGFPTFkv?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 2AFuUt5+ex2pJ+4uQj69BcZ7HLSyQa4kh44btVUBSaej/On3VdB7+k7FuVe6zFkEkzmv1bc+r5Owiw1tvwY8EiVaIxzrAx6cZL0zVYmJ3dBi+1XWTYWkwZO5+IhzD3q3qRC69xskx7NxOxGTXmZ3pKnXERTFMQKyDqVDBG0mO3KSOY+EXRRKgw78BaqSBn+05uBKfYdT8tNoCWWhGXwi3BqVaED+B2QWKkfyDd/EsdzWZIp3WXNPjpUXCctHKlCBsmRE13CDI6q7hqPC4Tq7FkKADEvn+sHUaRXBFxFLHs6NFKVnjkSxhXjbiHWEF4qhxlqTatyy5LXnna/0eG5CnqTH9VBZLlJsriVQJz14YMWnxdQp/DM2CEe6zxthgMV8WcuOWmYdPZ4QofQq91CPe0oNSiV0BWwuM/1HBVPdzuow3CPj/I3kh+DsKCCs3JfdEyxzjBMe4e1q3UAdWXoQntPLpomTnUTInAGPKC7r9HeFql4bX+eDPebi4m5CXy85f0sY218u9AL2ZeSg/kzHX6yHtnNPdTRqiqeCF8SS7tTKDPqdp5jHMcZFkfzX0xvZ2f47Kai0cZPhQAu0ZBbaK1zdlMoKfDgnPnPZqkySubGq/rFvhJ3OL2bePvNylseqWJrFv1d1PhePbLqS0BvPXfktninD0ie2Sav4YVufKKf0ilMuHUragM0g3d5oFa6WR8rfL2x6lLHMR+tQa9HiObBU6RqxkXnrYGYa85llOayWSFcwdWmJVQHiJjYzsr9ptEBySnLCdPE5PbbfjACRoaZF+8zH8Ojq29apmiJy1vo9WLGU9UoRbg2/lqucX9hhWXPuV9lEBizassAtn7wG/haIH6eEgfJv8btxHzSUKQleuVnfWsA0mRpsnwWg+DcJqcGASp9oeNQw/YFY17QqQA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa5c4f25-24a8-476b-1c20-08db1589efa6
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 10:37:18.0591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d9Y0hHLyWQu7Ji73Pe5lHwarq/McgqTdSFj3g0WmIa51R1hKz3Hnhhv7SUZ5cfUM6EFLq4BSXkLm0r3zS3gNcEDiPUKQzAH3ZtX+zwbVriA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4445
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_06,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=915 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302230089
X-Proofpoint-ORIG-GUID: cTdWLbQad02WIxoLz8BhNVXKeyt2cxsh
X-Proofpoint-GUID: cTdWLbQad02WIxoLz8BhNVXKeyt2cxsh
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

On 22/02/2023 22:10, Alex Williamson wrote:
> On Wed, 22 Feb 2023 19:49:05 +0200
> Avihai Horon <avihaih@nvidia.com> wrote:
>> From: Joao Martins <joao.m.martins@oracle.com>
>> @@ -612,6 +665,16 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
>>          .iova = iova,
>>          .size = size,
>>      };
>> +    int ret;
>> +
>> +    ret = vfio_record_mapping(container, iova, size, readonly);
>> +    if (ret) {
>> +        error_report("vfio: Failed to record mapping, iova: 0x%" HWADDR_PRIx
>> +                     ", size: 0x" RAM_ADDR_FMT ", ret: %d (%s)",
>> +                     iova, size, ret, strerror(-ret));
>> +
>> +        return ret;
>> +    }
> 
> Is there no way to replay the mappings when a migration is started?
> This seems like a horrible latency and bloat trade-off for the
> possibility that the VM might migrate and the device might support
> these features.  Our performance with vIOMMU is already terrible, I
> can't help but believe this makes it worse.  Thanks,
> 

It is a nop if the vIOMMU is being used (entries in container->giommu_list) as
that uses a max-iova based IOVA range. So this is really for iommu identity
mapping and no-VIOMMU. We could replay them if they were tracked/stored anywhere.

I suppose we could move the vfio_devices_all_device_dirty_tracking() into this
patch and then conditionally call this vfio_{record,erase}_mapping() in case we
are passing through a device that doesn't have live-migration support? Would
that address the impact you're concerned wrt to non-live-migrateable devices?

On the other hand, the PCI device hotplug hypothetical even makes this a bit
complicated as we can still attempt to hotplug a device before migration is even
attempted. Meaning that we start with live-migrateable devices, and we added the
tracking, up to hotpluging a device without such support (adding a blocker)
leaving the mappings there with no further use. So it felt simpler to just track
always and avoid any mappings recording if the vIOMMU is in active use?

