Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B3D6A223D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 20:17:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVdYc-0005xn-Ul; Fri, 24 Feb 2023 14:16:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pVdYN-0005xD-ES
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:16:27 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pVdYI-0006sw-4o
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 14:16:20 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31OHhwng020006; Fri, 24 Feb 2023 19:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=Qk4JTT51OkkyxwpA8URiDzYLs+VnFKI3rZYpXN+zh3I=;
 b=Z1XxVPWHHjxRfRGwN0YuKfWOpWZobyt7HC8/vby+tsdbuyRXco7b6VGhQMskWeM1agkA
 n+MQ+wBcR9HsDyuLj8SiDuq46Y1i3y36zZkn9H5cfXeOnbdb8nSs9rf1voDAQrNTsBj2
 Lt4Pm22WVkdMoiIhzi0PVfv82cQGS1hgLcq1jIzOA01p9plEfXBASsmtl8cLxbJZwfwE
 Ofw2bNgh7t05g+0x11LFzY+Hss0AZKU5hSAnSeGc+vU574+3j7im7byvLiV27APGg2fn
 QuTOmld+fd0D72WvtQkQbVNdx82+9fZfOxaf71CBbKVYMWdlSu+rYmz8p1Zz/h+jltaa EA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntp9tx20d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Feb 2023 19:16:14 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31OHif7h030292; Fri, 24 Feb 2023 19:16:13 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ntn49w1dt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Feb 2023 19:16:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gUBHFuwHg/sPeSYbawGXweib8cOS0h/qp9+AQ9VgHJ6quT7ndceQ22tTnwBMwgngOJad6P1kkZtukmhJFgQV1j36l6RQ4dsigqnN4/9kTJ+stsSTfURjhlhmIEdUphvXMN9DhRpYWWRTo3fZJJz45Pbkr6tEzDR8ewsMTWuu1xIFqFFTfpVquVLbI/HeyZXGSgMvrNFwVwkSYL6878/cZMcQmZP2x90Lmx+KfP8jF3Cp4TWMC+wj8aAThHC8fOUKr6SJuprtg3g6udUid0tb8OSRwierYIOCMEcxn5lroWwNJpOrlDb2wvkc9tHqlmNhlandkSaujsNOZWP2lz1dDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qk4JTT51OkkyxwpA8URiDzYLs+VnFKI3rZYpXN+zh3I=;
 b=Z3mWbTm3Fuih815MXPHErlJiVuFaCVhuDwHXNKdFFDXN4Q2VdaSqTVYS168uN0Wf2JL52SU4LqI+HS4ndHbmoXIGqrVrEVFRcZGiZsQvbqy5YzJ8kMwMVkyoqoT9eXtcyj11azSo0bibaboTGfRILowIjej8RZaxg4Yc3o12IcbaBsxCf9nr2N60TAiYzVaq8G2AB7u6cBa/A/YuwzO/pMYb3yfXoO2YhEC8/OFpQ5ze6fQFYE4vOt9NS4XEOuFHkh8I5iWhtWhAEnGH5Rd8wjZZEaTt6yj3HqmDD/E5kaERUAXJEhjOA83FARIGontnnWCQuZs0NcGgpURLdnFbBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qk4JTT51OkkyxwpA8URiDzYLs+VnFKI3rZYpXN+zh3I=;
 b=puDGYtQEw6mqhHxzJ7G6yfw0A6AAsI6R6Pvnu+c/j/FfDNIr7XgfR8OR43uJP3ymeaTXScfWWfQzvTL0T2dFziIlFylme+WlgWciKa6BG5Oiyz8F4XCV3+8WHX8fPHJBphzK02VJY5xp1UDuyqrSUsehnabKDQx67ZvbAjfUyzM=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BN0PR10MB5173.namprd10.prod.outlook.com (2603:10b6:408:127::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.11; Fri, 24 Feb
 2023 19:16:11 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.011; Fri, 24 Feb 2023
 19:16:11 +0000
Message-ID: <7e9e33b3-ccc0-6137-1e80-80ae7562d0f6@oracle.com>
Date: Fri, 24 Feb 2023 19:16:03 +0000
Subject: Re: [PATCH v2 17/20] vfio/common: Support device dirty page tracking
 with vIOMMU
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
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
 Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-18-avihaih@nvidia.com>
 <20230222163439.68ad5e63.alex.williamson@redhat.com>
 <Y/bKoUBe17YNhGEA@nvidia.com>
 <20230223130633.4bd07948.alex.williamson@redhat.com>
 <Y/fS2rX+JvYVC9jR@nvidia.com>
 <20230223153309.298af6e1.alex.williamson@redhat.com>
 <Y/f2CJXGLLAtFezU@nvidia.com>
 <3419a4d1-041f-f4f3-1d7d-ab3608bb54ac@oracle.com>
 <c66d2d8e-f042-964a-a797-a3d07c260a3b@oracle.com>
 <20230224085634.149e3ad2.alex.williamson@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20230224085634.149e3ad2.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0177.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::20) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|BN0PR10MB5173:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d3152d9-fcb9-44e9-0819-08db169b96c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DbFtALe6kr+WTIZ2N13SmsrmkqwAzOriRk5cQJbJH9P37Lfzx8aInsSXYuqJSFrXMVHFb8YEW3CPndNadrV8u7+NrlYbntqR4qtY5QiIaqPomcs7GBxPVa/FT99ApUvfuevK38TcL5PiIqdacg66LR30tAFI59GvxLOYoA6ISe+ikJQ44J4+Y1lNr6g6os8SWtUwafA40aqGli449GXcF6zqxi5h5ezHVD60S324qNtU8ZFvdbv6oFu0YTvQ5Aaom80gTKoAg8mjhnboftS3vnWNY/UHBjnsACHys4E4uNJ13JRI0NK8DL1lK7zKgbWttZpNdPUAGNgUtBsydOIftNf39R8Thh/BxF9UewGE/a9nUxLPq+nXpN9tOzRkRibxU8FpM7twVxiIHhptFbtpPBXGmVlujcmiPEsXT+EO0ez0Q8/FRb2gjMf1uH49hl6GBbbDDpirQE8v17A+Gv9yG/bkRrpNN46dzIkwBtRtom9BFfFJV5NTULxwzdnNDqfOiTHWLu4pybPOJwBDUzIFFTD/TJMnNtkZNEJRoyZVvN5EM+Cp6M35W7ohb6mslRYsv5zjgdTEDR8gNY4AVeGO9Y8hyPnfiW929DyaCx4vShKR5B3oXLsCDFoFw2UCBqc3bxgKJ1inoFtYnK8B1qZrGQHnhnCuf4ucVQ3vPivxepkmcnnsKX9ynhHZgbPlTaK9Ph+FVYAeC4VOzuOIVYOjTzA1CD+rGxttllE2oPUBfHE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(39860400002)(366004)(346002)(376002)(451199018)(36756003)(2906002)(38100700002)(110136005)(316002)(54906003)(8676002)(66946007)(31696002)(83380400001)(66556008)(4326008)(66476007)(6512007)(26005)(53546011)(186003)(6666004)(6506007)(478600001)(86362001)(6486002)(31686004)(2616005)(41300700001)(5660300002)(8936002)(7416002)(14143004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEZwdW1qRzJTNGc2bHEzUDZVUkg4ZnZ5bXpRbkRmM045UEJsRnBGZXJVSjNC?=
 =?utf-8?B?ZTlydG1FTTM4cUtlaGQzUERXTkJaVHoxOWREdXROVm03L2JzcmNMdTZZUjI3?=
 =?utf-8?B?bURnWk9QQmlBOTFnNjhoeUptajZGYVBPTHdCVEVBUW4wL0R3SUNpUXo0TGJD?=
 =?utf-8?B?V3NhbEdEY1I2ZU1PMTNncFR6Qk5CRE8wcjZDRkpsQVhQa3lrQlYzbEVIY1l0?=
 =?utf-8?B?NDBRWWE5Sy85eXB4R0xrNjJUUnd1c0JGeFVOcm11Z0VTQlQ3eDlqS3dNTm1I?=
 =?utf-8?B?N240Zk5TWkZjOEFwbkFJNUpCY3Eva3MzMlFOSWZmK2JiQzM5dW5URWhoaWRJ?=
 =?utf-8?B?cGxaaVduUVNPTTBMRGlDZ1NpRWJFdS9TblAwVURmS285TEVtN2swOHpRN1hh?=
 =?utf-8?B?b2dzeHNYalAzL3RJOVBXYm05TExMazlBZlpmY1hBanlBVWY0SU9jcDlZbGh6?=
 =?utf-8?B?UG0wZDd1VDR3RUNkUmp3bzg4WmU2OEJrcXhPQWk1MmhtckgzL1M2UisvQUpv?=
 =?utf-8?B?ZU9LekI3WDlvTFFodlNRL3czaHZySW1kNmRoZEI1VmR5Yzc5cnNaTXgxQWtZ?=
 =?utf-8?B?VVFIUkJ3N3IvU1dQY04vWXE4bTIvb2UvVm5pWHYwK1h6S3dSZGFPLzlSalor?=
 =?utf-8?B?NFUyNlR4NFg3WnpaU2JaQndRVlBDbDFtTTkybzQwY2xYWWVrZWkvWEFLZDVJ?=
 =?utf-8?B?REp4Y0JYbHZzdzdIN25DYmh5Y2RpVktsdVJRZXk5Z1pKUXRxSUorRzhoUU9R?=
 =?utf-8?B?NXkwN1JENURQcE5Gazh5NTU4MzJaOE02TzdCUlhWVlpmaWNSYTBtc3hvMFF5?=
 =?utf-8?B?eHhJZmFwREFqTFk5VlNYNENHSFRuVUtVQ3FaTFF4SDVsN1VKS09SVzF4aUtM?=
 =?utf-8?B?QU5Jc085eFpEbUdYU0Y2S2NtQ29BcUVMRlN1NmhBbk1MRmI1WS9qVGVjU1Q1?=
 =?utf-8?B?N0VuU3VFdGpWQk0yWlkvN3JSSlpwS2N0ZENkNFR2SW9Ibm9qOW1GNWsvemRx?=
 =?utf-8?B?ck9FT3JaSmZvZnh5WHpyc0RMcTF3YXJiNCsvOVhqTUZwQ3ZVdFpTeklZUUR6?=
 =?utf-8?B?aHIxZTEwMHRVcW9CQXduK1hEanpqOHF1MWtSMFVqaWJ0OWJZZ2JSemhuZm9h?=
 =?utf-8?B?aEZPQnIwcnlVUUxRV2pIcE1sV0x3Ums1YWR1RXErVGtOeGRiT0V6bXNiZC8w?=
 =?utf-8?B?UUY2SWxmZUplK3U1Z0kycjZaOGZPaWp2NkVBUGdVOEFjTC85VFQ4amp2ckYx?=
 =?utf-8?B?cHpWL3ZvL2hCczVmUnVIMGEwTjRCdzJnSVcwREZ4dEVEOXoyN0NobkVHRXpt?=
 =?utf-8?B?bTZwQ3lyYkk5bU9nTmVhSExXL2U4TCtiWTVybHVnYzZGNkFlUU9mME44bHVv?=
 =?utf-8?B?ZjQyNFZJcW5mMUJTT2oxczNoT1NBcEwwQmFXVHk2TzJmOXV1QlpwYVkwSDRU?=
 =?utf-8?B?cFBQU2FCajFuUEhVZ1g0SHF4dFVwNkxBZ2thYmg5TXBvZDhJN0NrOGVnU2tR?=
 =?utf-8?B?ZGtHbXVrbFBhRVpyRXI2c0tqK3N3RjVPc1BDZkFHZzc2OTlBSTExYlR2ZUJR?=
 =?utf-8?B?blNzK1k0Mk5XVHV2UVZ6bGFDM0pPWUxDUGQrMEpaM1E1TjdpbVJNOGd0SnVM?=
 =?utf-8?B?NVR5UkIzZDhWSWEzclFyVnJxQWJzdW1jTmhxQmVLZ3NkNGMxRmZHSm1uOGgv?=
 =?utf-8?B?c3VQdFd0MUNmdEtjd0NCcFd0MzV4OHVUZzJ6THZYWjgzQjgwRjFKR2RHcUNa?=
 =?utf-8?B?dGp4R0dVcUFtR3g4QnU0bTdFU1IwNkFzdXhMSFdjdXY1a1UwbUduaTIvdkZw?=
 =?utf-8?B?QVFsWGVkSHRBbXJGeXhaZmZqcHBiZGRmMHdaZlJGbmFOa1IycXpiWUpBczRu?=
 =?utf-8?B?aWJScEIrRzUyR0pTUGcwOXlXQmRudThlRGhzZFkwdUhiZndFckI4NEtHcWFJ?=
 =?utf-8?B?Z1cxaVNoUGh5eit3cUxzUEp2OGViWDBiOEU2bm12T0JocHdtZUpqR1RYbnRO?=
 =?utf-8?B?WWdpaDlTaGpRdGVscWdGdUxDelRwU0ZHYmJZelBDYkV2RThyYTUxQUpzUHNl?=
 =?utf-8?B?cHFkZ0VQQ3E1WDhtOHZ5eHQrNjFqMTBFRzNYc3loQkRIOStBaXpTbmVNUkdz?=
 =?utf-8?B?djZaSVYrcW5GWFdIRFFZUE8wb3lrNmE3RTQ3N0N4bTBDTGJpUDdPeEZ0alF0?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: rWRm6N8wgAjxIUgSiCIT7QrBErOpFQXZZmD6E/6lhKoFrR5LbzKcivTUXgx3FvUJDnHw7/zSByV/dJMVCSYWTWRl4x1MwW34w7ZnH9eQgqnw5W2uj2ql6S9ugEk1BJtokn/4bNXmWPq95/HujR8uyuvgqFx81gUWadRr954QiVeq7qzBr++Hi3uGl5S+0piVaubpQtexIBgx9ZsHVDKH0+8FYI7yLdoXSEaH+Hkx2i00dpxnSeYn9IcrZ/E8htpLrYa/7g7JpMI/6FLl0PbhTUccK0YJZOT0f6nQebSoxyCzfUzj2dMaNNDaH9GCzq3RSidsP0LrlluE3a2e4BEiyfoefmEulyzqQB013tWxj/B14TMm31NFVPMvboXoo7pP6blbRDt5SWlWVkmhzu97van+Q9asq2Nb66PwXov5dbxaujAL3dqpEnevDhIU4FQhrLP9X+JGCjfV4mT2DoCrhJRSXAiSlupeDFuqWi7dntfDajbiOHbNfZCcb8AZ/wn9S++225RNZz1WN81YrBuMqabRiHSl12js+LVP166JsxSQoAzV9FSOVrCeBVlmuAPxR9wBQJ4un8L4IjJTCBwkLFOBlDfHCans9gIPGhlgIV73QnwCYz6jZ9yXQr4vqvwBDwZJ4Sk0kkiMNt2EFW01Nj+6FRIQ39VhVlNX53TGRWzEJJxW6cPEq8jEz9w07juaMPyamwQ5m/Go1IANHU06ZDFVDbWH3zBpyT4gNbfRezbHnJk6wlRUYgsuOKuYiBMWHbVBkFwhnTVmsU17Pi17n6W+7JzGIzHmWDN1BROQvZAOkP++6sYgV1dU2lXR1S0dclLzdfi909Wk08Hmo6FVPE7Q/KgIjMhJ82R1kRp7VxJ1WZZSwo0Kjnk0YBYkG4BY6SmgEWifqsQF7zIWrjfRSA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3152d9-fcb9-44e9-0819-08db169b96c6
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 19:16:11.1014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FtCOHpm7thsBDqvWJnROpY8uoDlnqyktvsq2WiDv9hYaizy6d1wyH1CVQfQ9UQpvDd82GLRDEx+cUTuKSmJZIT4a/fqMx6eEEVdaKXTCMKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5173
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_14,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302240153
X-Proofpoint-GUID: PWtNhGFVvybhY492fgCT5MkOj3ncXmsp
X-Proofpoint-ORIG-GUID: PWtNhGFVvybhY492fgCT5MkOj3ncXmsp
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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

On 24/02/2023 15:56, Alex Williamson wrote:
> On Fri, 24 Feb 2023 12:53:26 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> On 24/02/2023 11:25, Joao Martins wrote:
>>> On 23/02/2023 23:26, Jason Gunthorpe wrote:  
>>>> On Thu, Feb 23, 2023 at 03:33:09PM -0700, Alex Williamson wrote:  
>>>>> On Thu, 23 Feb 2023 16:55:54 -0400
>>>>> Jason Gunthorpe <jgg@nvidia.com> wrote:  
>>>>>> On Thu, Feb 23, 2023 at 01:06:33PM -0700, Alex Williamson wrote:
>>>>>> Or even better figure out how to get interrupt remapping without IOMMU
>>>>>> support :\  
>>>>>
>>>>> -machine q35,default_bus_bypass_iommu=on,kernel-irqchip=split \
>>>>> -device intel-iommu,caching-mode=on,intremap=on  
>>>>
>>>> Joao?
>>>>
>>>> If this works lets just block migration if the vIOMMU is turned on..  
>>>
>>> At a first glance, this looked like my regular iommu incantation.
>>>
>>> But reading the code this ::bypass_iommu (new to me) apparently tells that
>>> vIOMMU is bypassed or not for the PCI devices all the way to avoiding
>>> enumerating in the IVRS/DMAR ACPI tables. And I see VFIO double-checks whether
>>> PCI device is within the IOMMU address space (or bypassed) prior to DMA maps and
>>> such.
>>>
>>> You can see from the other email that all of the other options in my head were
>>> either bit inconvenient or risky. I wasn't aware of this option for what is
>>> worth -- much simpler, should work!
>>>  
>>
>> I say *should*, but on a second thought interrupt remapping may still be
>> required to one of these devices that are IOMMU-bypassed. Say to put affinities
>> to vcpus above 255? I was trying this out with more than 255 vcpus with a couple
>> VFs and at a first glance these VFs fail to probe (these are CX6 VFs).
>>
>> It is a working setup without the parameter, but now adding a
>> default_bus_bypass_iommu=on fails to init VFs:
>>
>> [   32.412733] mlx5_core 0000:00:02.0: Rate limit: 127 rates are supported,
>> range: 0Mbps to 97656Mbps
>> [   32.416242] mlx5_core 0000:00:02.0: mlx5_load:1204:(pid 3361): Failed to
>> alloc IRQs
>> [   33.227852] mlx5_core 0000:00:02.0: probe_one:1684:(pid 3361): mlx5_init_one
>> failed with error code -19
>> [   33.242182] mlx5_core 0000:00:03.0: firmware version: 22.31.1660
>> [   33.415876] mlx5_core 0000:00:03.0: Rate limit: 127 rates are supported,
>> range: 0Mbps to 97656Mbps
>> [   33.448016] mlx5_core 0000:00:03.0: mlx5_load:1204:(pid 3361): Failed to
>> alloc IRQs
>> [   34.207532] mlx5_core 0000:00:03.0: probe_one:1684:(pid 3361): mlx5_init_one
>> failed with error code -19
>>
>> I haven't dived yet into why it fails.
> 
> Hmm, I was thinking this would only affect DMA, but on second thought
> I think the DRHD also describes the interrupt remapping hardware and
> while interrupt remapping is an optional feature of the DRHD, DMA
> remapping is always supported afaict.  I saw IR vectors in
> /proc/interrupts and thought it worked, but indeed an assigned device
> is having trouble getting vectors.
> 

AMD/IVRS might be a little different.

I also tried disabling dma-translation from IOMMU feature as I had mentioned in
another email, and that renders the same result as default_bus_bypass_iommu.

So it's either this KVM pv-op (which is not really interrupt remapping and it's
x86 specific) or full vIOMMU. The PV op[*] has the natural disadvantage of
requiring a compatible guest kernel.

[*] See, KVM_FEATURE_MSI_EXT_DEST_ID.

>>
>>> And avoiding vIOMMU simplifies the whole patchset too, if it's OK to add a live
>>> migration blocker if `bypass_iommu` is off for any PCI device.
>>>   
>>
>> Still we could have for starters a live migration blocker until we revisit the
>> vIOMMU case ... should we deem that the default_bus_bypass_iommu=on or the
>> others I suggested as non-options?
> 
> I'm very uncomfortable presuming a vIOMMU usage model, especially when
> it leads to potentially untracked DMA if our assumptions are violated.

We can track DMA that got dirtied, but it doesn't mean that said DMA is mapped.
I don't think VFIO ties those two in? Like you can ask to track certain ranges,
but if it's in IOMMU then device gets target abort. Start dirty tracking,
doesn't imply that you allow such DMA

with vIOMMU it's just anything that falls outside the IOMMU mapped ranges (or
identity map) get always marked as dirty if it wasn't armed in the device dirty
tracker. It's a best effort basis -- as I don't think supporting vIOMMU has a
ton of options without a more significant compromise. If the vIOMMU is in
passthrough mode, then things work just as if no-vIOMMU is there. Avihai's code
reflects that.

Considering your earlier suggestion that we only start dirty tracking and record
ranges *when*  dirty tracking start operation happens ... then this gets further
simplified. We also have to take into account that we can't have guarantees that
we can change ranges under tracking to be dynamic.

For improving vIOMMU case we either track the MAX_IOVA or we compose an
artifical range based the max-iova of current vIOMMU maps.

> We could use a MemoryListener on the IOVA space to record a high level
> mark, but we'd need to continue to monitor that mark while we're in
> pre-copy and I don't think anyone would agree that a migratable VM can
> suddenly become unmigratable due to a random IOVA allocation would be
> supportable.  That leads me to think that a machine option to limit the
> vIOMMU address space, and testing that against the device prior to
> declaring migration support of the device is possibly our best option.
> 
> Is that feasible?  Do all the vIOMMU models have a means to limit the
> IOVA space? 

I can say that *at least* AMD and Intel support that. Intel supports either 39
or 48 address-width modes (only those two values as I understand). AMD
supposedly has a more granular management of VASize and PASize.

I have no idea on smmuv3 or virtio-iommu.

But isn't this is actually what Avihai does in the series, but minus the device
part? The address-width is fetched directly from the vIOMMU model, via the
IOMMU_ATTR_MAX_IOVA, and one of the options is to compose a range based on max
vIOMMU range.

> How does QEMU learn a limit for a given device? 

IOMMU_ATTR_MAX_IOVA for vIOMMU

For device this is not described in ACPI or any place that I know :/ without
getting into VF specifics

> We
> probably need to think about whether there are devices that can even
> support the guest physical memory ranges when we start relocating RAM
> to arbitrary addresses (ex. hypertransport). 

In theory we require one-bit more in device DMA engine. so instead of max 39bits
we require 40bits for a 1T guest. GPUs and modern NICs are 64-bit DMA address
capable devices, but it's a bit hard to learn this as it's device specific.

> Can we infer anything
> from the vCPU virtual address space or is that still an unreasonable
> range to track for devices?  Thanks,
> 
We sort of rely on that for iommu=pt or no-vIOMMU case where vCPU address space
matches that of IOVA space, but that not sure how much you would from vCPU
address space that vIOMMU mapping doesn't give you already

