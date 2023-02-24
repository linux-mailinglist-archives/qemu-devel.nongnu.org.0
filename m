Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5946A1C7E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 13:54:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVXa9-0007Yl-3U; Fri, 24 Feb 2023 07:53:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pVXa6-0007Y8-JW
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 07:53:46 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pVXa4-0003iN-Cw
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 07:53:46 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31O1na2a016237; Fri, 24 Feb 2023 12:53:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=tzM7MPGJdp0LapMBt+Kn26hCajaGE5e8onPxRZtduPw=;
 b=xXH/fFdKDK8nvUJfykewy1wZphwM9kcaLaGiwBFnqPKo1+AdosHLFhENyhLDtXavFQdW
 Cyn+JmbpdbyDABmv62HdrjWpfsSiJOnifIKuzuELEbHPSzla3mqVkOGUznKYqSPLSKlt
 GLVMvXYdpPzOFEokZHw/2aE0FT9muvjC07Wyip2zyBEZ7rwzROaZAbXxS3ei89auluOR
 YdKG7ng4HZVf8ASWwbTtAXw80ENKQZTaPjvuJBl7FopNOtM6NQHPSMOkirn5inXAsrBR
 TYYowxkDdzEeYYcK/R2+w26oypB1uhlElDG+Rg2b0rfku4SduBK9BwUcKK7B3tcivkXy Hg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntpjacx17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Feb 2023 12:53:39 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31OBBqJS031541; Fri, 24 Feb 2023 12:53:38 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ntn49jqbf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Feb 2023 12:53:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdIXpT7u6NDIcN4MmjIs02o87MOKR9QQFaaefUw2+7UQpOpBVrWnp9ljKL8AZFnV41GhFE2oYFzJI+VqBUarQ2byd69mDMWbRhgYc2Bh7DlTXi7OROZSWznVLvupQOlS2U+8NspfuhvjNOd4pKmQJLZnqNC866S3Ndavrk7D2hdvf2POI8pYTrRqEJm07ZZJuGau9rtld2sFeAGy5Eoyw08DAJrIKYZMo8TwmxWF1sGtUnVkSt9K9FdxVFqRsvx9mn12MAg7aNIFUpY4l4UA5YJ4ay3mGN7RER0T+7wniDQoMAEvismWfm15aSA46sSHOqE3YYakQBb638gWTaBFcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzM7MPGJdp0LapMBt+Kn26hCajaGE5e8onPxRZtduPw=;
 b=d13qizvC/t8IWKUGq9BGlkfC4+juHXxdWaiGzwnQ0b1/Tc84WzVuVm5ZMgonlBDCOSdZfbamkit3fe+9o+JpPqArL4jdYlqDbW9bqTZi7GT3s7S+WI9R64ycCFHkiesKVpbzMeGGmxPdTGydAV2j6KF/vU0g8q/iAJf6+/paQeXlrU6vnlZxf+XN4vQBAA0ahwv5G89U18CgL/pN18BQ8PtbWw2Otv8isX0cCV67NkPWxD0UdXjr9A2JVM220rvFIaOCwadSrfw/e8iqK3AvjddH7PL31xGmnJQv9AxKVWADyX/uIrst9wd5vKXBN17zICd+ZfpkHvoG+DCyPhVDoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzM7MPGJdp0LapMBt+Kn26hCajaGE5e8onPxRZtduPw=;
 b=AQ5AoqmnhbNvZMG5vwAMqp4orLCTX3ku+w2b25Wbvbn5IYHfi2zmNvkfxgnOnVfhYzpcnxoNmcQbXRJLRu61TZuTPN594HSzlsmZeEZiXj8JSnLlqGhCO5qxnwNe/7KE/QVhYkzSIa7wztlZoyQ0EB+ntMzhUSeh1Eou8GqvCHo=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by DS7PR10MB5389.namprd10.prod.outlook.com (2603:10b6:5:3a7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.11; Fri, 24 Feb
 2023 12:53:35 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.011; Fri, 24 Feb 2023
 12:53:35 +0000
Message-ID: <c66d2d8e-f042-964a-a797-a3d07c260a3b@oracle.com>
Date: Fri, 24 Feb 2023 12:53:26 +0000
Subject: Re: [PATCH v2 17/20] vfio/common: Support device dirty page tracking
 with vIOMMU
Content-Language: en-US
From: Joao Martins <joao.m.martins@oracle.com>
To: Jason Gunthorpe <jgg@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>
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
In-Reply-To: <3419a4d1-041f-f4f3-1d7d-ab3608bb54ac@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0200.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::7) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|DS7PR10MB5389:EE_
X-MS-Office365-Filtering-Correlation-Id: d5ac52a3-86f7-4872-7361-08db16662414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dLJ231oJ403+ucwZylTqOKuN/Nh3e4ODzNpV45PZhg3hc+AylBAsAg75pU+TUU97sfaqBHbX08Dt2H2XS9d5SH/408mQr5Ugu/RvcyKcsODUU8Y23EvjystByTpccAfZYF/avf3uK0yQLSgThPw8GcKpz3Ax3V0ADcPhoQRmA2pcYRnnxCERb2QB5hetczZ4ujRMJkD0nV2Ehkfh5smveGH4aZyyHSftwkkPQBqTMu+JorBfL2cpoJqkNaavtY/4AaM6b8ceGWPWczuSsQLlaeKacZRDixOnu8HP5fhF8f58zwtvyw6UxHHAwJgTeYSAw4eZYooJANMjkt+mUkXhKnQrjG6I9kOiutIIwuZKMoYDa1KHqNvhgn1cMmG3eqOyG8MtIBbI8mfNRW2++O7gWiXT7Yj7YK8Nv+T/r92H7Dldnm966lxIr1fP3taPxPLzvZw6awwZthyo5JXe3lLGzNRkJaICFnVDqHaFoePL26f2ovXpOn60TlpkFMhmsPGM47t6N6yDlZ2G4Lie5VIJQBYG5tBRHdf5wjCc8pmY956vArYfn3xUwhfmsPvaKU5nIvSTOYsW2PsRT5TZeV7Ll1TLIt1o05tPF3Z65GFMUVdC7564tWSBUIMH4kb1IUHdQz2h6wnBAPThT3NK3hryaw0el5bqMmgh3R9QaRxtezoyHf9x0aSYaF6XhqazLLzJ3UQqD9pCpTuGA3Q8VVhNQDmUIHcayWb3OlHzY+5aq7A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(136003)(366004)(396003)(376002)(451199018)(31686004)(31696002)(36756003)(86362001)(41300700001)(8936002)(7416002)(5660300002)(2906002)(83380400001)(38100700002)(478600001)(66946007)(110136005)(66476007)(66556008)(6486002)(186003)(53546011)(6512007)(26005)(6666004)(2616005)(54906003)(4326008)(8676002)(316002)(6506007)(14143004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWZpOEFZNmJoNWVBQVVPK1QwU1JESWZ0Unh4c1k3SytwcjJpOHVDY1NWa0FI?=
 =?utf-8?B?OTE5cEJ2MkVoYzI2cmJRekFZdTFId1B4QnBqaTdKd21yQVdaVlIvRmYxWE1H?=
 =?utf-8?B?dnF4Tkw0eUhqT3JSVmdVODZrTHRMMFM4dEpBOStvWk1mNjJVUTF0aGtoM2Ny?=
 =?utf-8?B?aTJCVUJwekUrWkF1aEFKMmFxSld5UElNcVhxSnRWeTd4ci9TczhVSy9HbjYy?=
 =?utf-8?B?bWxIbStqK3JuZ2NRVTVnRThMQkxGOVppRUN2dE42SllGN21XRWZKSXBKcWlE?=
 =?utf-8?B?MTVuK1RnUGtkYXVzNDV3MklLZ1FGdG9NRWdURzljZUZibDlObFAzUFR0TjVH?=
 =?utf-8?B?RDhOYmlvS25jZ3ZXNU9iWmMzdHdtT2JQSnVpMnZTNzB6ZU5UOXhUeGlaN211?=
 =?utf-8?B?THhTclFOWGlXeFJyQkFWVnRYYStKUk1NV05qRks2bS94T3BaN21rVUpnQm5w?=
 =?utf-8?B?RGtzUWNnZWllSTNVYkY3SkNrOXlwVzh5Z0M1MEpjQTd4Tk85ZTFPbXFlR0lk?=
 =?utf-8?B?aVpyN3gyNGZrREZrb1BPVHREUU5VSkg0ME5GTHEyb3BndnY3Tko0SSs3UWZV?=
 =?utf-8?B?K01JSlUwelB0N0kwcG04QU5JQ0I4bGtQemtXbWR4dWcwd21zeGkwR2R3ZGpm?=
 =?utf-8?B?ajZZdkpWLzBxZndhTUhoN3ZOU3VjZ1pMeldMa3ZSL0FYMlhxRm5xcWFFWHJB?=
 =?utf-8?B?YWErUkJZbXZOb3BWUmxqRFJLOS9vSkxqV0pEd0F5ZzgzK1BqSkZ4M3loOWxG?=
 =?utf-8?B?R1UwSlhqVTNuYmJwWnBRenhlU0RUM0dOZXBlVzV6R056cG9rcmdOZ21IeWpV?=
 =?utf-8?B?Z2Z3SmdaNFNCWmdyb2FYMWx6NXc2UTNTYTlsb1N2V0RDNXpzRWIzOUFyOThF?=
 =?utf-8?B?Yno3dVBSSSs5MFUrcGh3ZWp6YjhKb2dnaXVMSWU5UUs5UCtTTzVaaXVPK3Jv?=
 =?utf-8?B?WEx6SHhkaGRlcEVkTlRic3Z5LzFzMjg1ay9hWWVxcVRWaUxhT3JLNW9HVXJj?=
 =?utf-8?B?d2UvNFQrNlVCaUtsSGdCN1NnU3BOenVQQjcvWFpXY1h6UlZsUkxkNjdHQzgx?=
 =?utf-8?B?QmFjSW02bWR1QVhhVU8xWUJNUGRhMUtZdldOOExIbzB1dXVpWjR2bTl3akZF?=
 =?utf-8?B?clRIa0l6S1QxY0lPVWkxQ2UyWW5rTGJxYlpLL3ZEdmZNMEVCT3hRRVJDUXI2?=
 =?utf-8?B?T3kwZWp3aVl0UzhjSFl6RytnRVlGckRRUEZnQTF1SEZ1WmtRY0NxVXl5My92?=
 =?utf-8?B?cWRVSkRETzM3ejB4aC9FMnkvOEd3NFhLRitEZDFvc0tmNnRIc0h2ZEx0bnE3?=
 =?utf-8?B?T0QzVExwWmdLZUZ2ei9zOWp6U1NoeTJITklHSkVWZEIvQ0RQejcxMk9IYkQ3?=
 =?utf-8?B?OG1HSGFaVWp6VzdaelhpY0JYVCs2dUVwNUpFU3U5bE5NZTNjVytBOWtSOTU4?=
 =?utf-8?B?RG9Ycy9pUUtQNE9BL2QyclhXR09UcFZmdlZjZ0c0dU0raWNJMEI1Mnhtd3E3?=
 =?utf-8?B?bFFzY3NGMktnNURrNXJJenpwOVprT0dqMTQ0YzBUOExzVE94azlGRkdIeG14?=
 =?utf-8?B?UitpMjRBb0RaYmdYeGYwclZqVC9pWkx2amNVU1R1T2dpQTVhNVp3U0JmMlps?=
 =?utf-8?B?NVAvbHhpUEp4Nkt2WU5QblFQVmh0L1BtTFlTc0psV2RleC9pL2ZjU0o4OVFn?=
 =?utf-8?B?dHYxNkNOWXM4TFhmQW0wY0FJN1V3Tm9JMm1kV1ArajMybWc5T0NBRXJXUExh?=
 =?utf-8?B?aFhuMHBnMDc1c3prdGFub0hMRXRXU2QvaUs3YUlRQzRDeFNlemRuVzcwZXhM?=
 =?utf-8?B?OWVYWWNCalVuS1pMSTg1aVRwV1IxK2FmRS90SVlmQUc4RDRQeTlFNHhxM1lu?=
 =?utf-8?B?cW9LaTZWSnMrUkxodFpsOW9tRDI2TUdJeVVBV0prdm5oSlZwVGJ0L1hoSS9r?=
 =?utf-8?B?akVTR0xQNlp0YVRiaStXdllDam1pZ0FaSnM1SlVEZjBuZmRFNDZLeDNJTk5p?=
 =?utf-8?B?YXNkanlmUExwWVJZQUVJTVI4aVNlRDYyaksrcDY3Sk8yWG1vWkJoNW9Cd1dU?=
 =?utf-8?B?Slo4cXNSdmUvUm1Ka2Mva2krWDRuN2UyYjQwdVdlRHBDcC9mUmxvOXY3STFx?=
 =?utf-8?B?dW52amlxUnpCRHZsb21yNzVuNU9vc0w2Z1c3Z3FMc04yM01ld29RbmxjcUg5?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: /fRqb0VTCQUKOiDgoWDLDaSb0NRgdgK/3Do0Fceegn06ogEKTWuDJTc/oqXE+3uV6MhFIQLORmYE98Nirh47zc+VbSsoxJ3QOeZxMcZzocoHATFuv9e9fbp7JuhrMZbFwmGwEgyJVI9Xq8KaXwS8A6RWnbEh1AyUsScLKHlBBZPh2YGDwvEvYE47Of4VsWn0B9su2cjqb8ziihs1hwOG7c+mPJ2987hgXI3p78d0yI1M0t1LVIfoJoAQPY8/oIVxOArUqNapKrqp8hSmH2EIqVZ9UyK9dFWMN6K1Y2qbSUcAoEtRnhGhKkfroB/AFreP7ic3Wo5niXk0ZaSNf45N8NRgkctM0XT9lzLJLNLVpDrxqyLnCPW7LirxUM6Q194juygYLhFd88QQsW3zc+7mTAUQK6V6IbrWZbuRUv1Z8t6+guiOJvp9zh2iFv36mKg3FjpwHT6xm+Tgec8ogeG4zHAnzV6xTtnnrFkForh28dyEzOLSUPIL1d08WYj+BD55Om5WTWnRepZS54HRE4iTcbHbo1rGVV5I02L2NidgvPNaRyXtzGoHSA/cEhqDwwr9sStywbnDH+Hm9xK4/M1Pjz6nMFwnQGNXf7Y/2R+juTo22OQvLrCv75gw2XKRv7WtTqkRoJf5jA/7QIxLUVCXiokH2osDt2muzddUePPkjdQ//OlkQQx25gIKkpX6OmqxRIJU8bWeQOUaptS49rl6qw3/Y2vDX03Eg5wrxiviKfFfqwSQiCGO9AvzgFlE/V5jOvUnEb8KJ20M7zcoNSIyTMLJQgCerm45wDv03OMLMSQN7TyXfiKtArjKTQejhBewpLFVetJ82ovgZ0G5CZgXOOQgqW0qpI59gZypwnna4E23o50E9XvHyPeHK6GSVLDuccK/7UWYImiLj9JzdQYAkg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ac52a3-86f7-4872-7361-08db16662414
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 12:53:35.3351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 19+4cbxKvVJlP9zeZq7cvtmKmhNnth+WIuc9NtnIq2i+gIKs7cipLsLYqp3l6b5FqSA+6HINuT2a1La/7/188U4XUON+Pz2qbhwQGJ1vcO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5389
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-24_08,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=986
 phishscore=0
 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302240103
X-Proofpoint-ORIG-GUID: 0ZHwKZ4IVaUtwneiT4lYEzzuBtDKKwPJ
X-Proofpoint-GUID: 0ZHwKZ4IVaUtwneiT4lYEzzuBtDKKwPJ
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

On 24/02/2023 11:25, Joao Martins wrote:
> On 23/02/2023 23:26, Jason Gunthorpe wrote:
>> On Thu, Feb 23, 2023 at 03:33:09PM -0700, Alex Williamson wrote:
>>> On Thu, 23 Feb 2023 16:55:54 -0400
>>> Jason Gunthorpe <jgg@nvidia.com> wrote:
>>>> On Thu, Feb 23, 2023 at 01:06:33PM -0700, Alex Williamson wrote:
>>>> Or even better figure out how to get interrupt remapping without IOMMU
>>>> support :\
>>>
>>> -machine q35,default_bus_bypass_iommu=on,kernel-irqchip=split \
>>> -device intel-iommu,caching-mode=on,intremap=on
>>
>> Joao?
>>
>> If this works lets just block migration if the vIOMMU is turned on..
> 
> At a first glance, this looked like my regular iommu incantation.
> 
> But reading the code this ::bypass_iommu (new to me) apparently tells that
> vIOMMU is bypassed or not for the PCI devices all the way to avoiding
> enumerating in the IVRS/DMAR ACPI tables. And I see VFIO double-checks whether
> PCI device is within the IOMMU address space (or bypassed) prior to DMA maps and
> such.
> 
> You can see from the other email that all of the other options in my head were
> either bit inconvenient or risky. I wasn't aware of this option for what is
> worth -- much simpler, should work!
>

I say *should*, but on a second thought interrupt remapping may still be
required to one of these devices that are IOMMU-bypassed. Say to put affinities
to vcpus above 255? I was trying this out with more than 255 vcpus with a couple
VFs and at a first glance these VFs fail to probe (these are CX6 VFs).

It is a working setup without the parameter, but now adding a
default_bus_bypass_iommu=on fails to init VFs:

[   32.412733] mlx5_core 0000:00:02.0: Rate limit: 127 rates are supported,
range: 0Mbps to 97656Mbps
[   32.416242] mlx5_core 0000:00:02.0: mlx5_load:1204:(pid 3361): Failed to
alloc IRQs
[   33.227852] mlx5_core 0000:00:02.0: probe_one:1684:(pid 3361): mlx5_init_one
failed with error code -19
[   33.242182] mlx5_core 0000:00:03.0: firmware version: 22.31.1660
[   33.415876] mlx5_core 0000:00:03.0: Rate limit: 127 rates are supported,
range: 0Mbps to 97656Mbps
[   33.448016] mlx5_core 0000:00:03.0: mlx5_load:1204:(pid 3361): Failed to
alloc IRQs
[   34.207532] mlx5_core 0000:00:03.0: probe_one:1684:(pid 3361): mlx5_init_one
failed with error code -19

I haven't dived yet into why it fails.

> And avoiding vIOMMU simplifies the whole patchset too, if it's OK to add a live
> migration blocker if `bypass_iommu` is off for any PCI device.
> 

Still we could have for starters a live migration blocker until we revisit the
vIOMMU case ... should we deem that the default_bus_bypass_iommu=on or the
others I suggested as non-options?

