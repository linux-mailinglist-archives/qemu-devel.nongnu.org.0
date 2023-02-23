Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E766A11D5
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 22:20:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVJ04-0001Pr-RP; Thu, 23 Feb 2023 16:19:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pVIzy-0001PK-Q7
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:19:31 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pVIzw-00089O-Kv
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:19:30 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31NGxc8A023470; Thu, 23 Feb 2023 21:19:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=g+XiBFktBQ+ZDz5EqgAtbEwMO/u9NXkiu5BzLFLehbY=;
 b=jdsSFPtxVyUnKIwcOYk6SSGF031QNokH8oLVTUg/epK2dY/s1CwJGFqtBCeRghdkO7kv
 YHzejqq3XihxOWf8u6qcbr3A984rgmeFe2R6QwVm9626y2ma/aWG37sSx4h6Aph0MJY0
 nQwHqisfEjCfVIXHEDSEZvaj/IOj5IGRKFiufrwDMqxuc8WLIjXDa+kZ3jaBZQY7Z50T
 B0po4fKGV5nGuH90KcTi2GLfxg9S1T8fW40KwXc1MIJBL7vJmwkuASmHUJeTeDBzrarM
 egja0hiTZaDDN0WSCIrlf8ovWyik/bPTjGtBCFnqHPD0u85Ozw/r7QhYnnlg1H3gQgT4 9A== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntpjabmb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Feb 2023 21:19:23 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31NK6DwC031832; Thu, 23 Feb 2023 21:19:22 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ntn48qkj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Feb 2023 21:19:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPGtk5Wq1VBnMOs4bpmzjZ+iaFLsSXZI14BxqWGGdaTsQQq57YkGn8ThK8QbhAIV9eoMDi1l2doLFNl+g6tqnTjAPwJPNfZ50Pnjo395TqG+Pfj0GXcW9E4+d5uxfgCsCSIMS/f9vhkmgKRahrZ21QXMynS0FxZb7ekNCbTZ7cMDGCuZpLRoNjgYrGm872t6QwrajxEPjS10HIaF7nx7RR4v4HvWKhCG5ydTyfBPRzCEtPzxYIp3K7FotCGLXBP5CgXjChlQgJZv9+e+0E2PIaQMNfYohJ7dwKa8iDR050OeMGikhTM9L770PffdNpxuRZxNZA3GWAE7fcD5ZBpCqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+XiBFktBQ+ZDz5EqgAtbEwMO/u9NXkiu5BzLFLehbY=;
 b=OMa6XfOhEMJvrZhYOp92EwapwKzVKenrnntl2eUT0qvhi8L+XcblhS2UBzLWKxqRPA0PghlN6aNv23VKnMsA+o5AEhzuH9ZEttfcHdcVpC6thwPXXy8RnqIu080EGq/PjrvZ0IFeNPGJjsm3o+r9xsPm7jrtT9HLfArRB8yz89Wsa6TixpqrSyCkxZqhJ3Yri+BpddSosFBfQLoh/IxjzOj5UMK8oOHasAfEfDQtokdpAjWgrPBfrzEqDzSCvaEMIpkJSA+HoRzHrQDZCgTe+oozKyRDLObvw7WNIlY7JWjguylOkSOi0nFySNcofLjNi5E1+uG78s7w0JnVcgsvtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+XiBFktBQ+ZDz5EqgAtbEwMO/u9NXkiu5BzLFLehbY=;
 b=RlzY5DZOpohEu0h30lYTNoY+rwFJzWxdlLbfsTxhDS97JFwExauKROUMN14Uhu/rQLdxUZ6LE3hiYa3tnUnsLiiCC1gs6s/KPYqrmp+Zyr7OnZL5bix2cfC7C4YZh9GK/07oVnmh5Yhh8NMKzu0LflLJNvdTqB2iXpIU/s9m7Uc=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by SJ2PR10MB6962.namprd10.prod.outlook.com (2603:10b6:a03:4d1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.16; Thu, 23 Feb
 2023 21:19:20 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 21:19:19 +0000
Message-ID: <a53767f9-b630-8f2e-0523-bd47d4539c61@oracle.com>
Date: Thu, 23 Feb 2023 21:19:12 +0000
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
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20230223140527.096dc42b.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0391.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::19) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|SJ2PR10MB6962:EE_
X-MS-Office365-Filtering-Correlation-Id: a43570ad-a67c-42af-cbef-08db15e3a062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1CD+QQuuq0NoDAkfmPFieS59sS0WTRKpLgSkLjZu4h67xZlsEeZku9E1f8Ir6ln56iILoEaIbEsHDvttC3GJQJxQ5kPMnGy69QaA1BoWmSMsMtOoUrUpLcU4TjBA8hIfHsEpL46k7uVsyTJ8NAnpLcwedS3pI2Og1qERpqpiOU2F+0A9tuync3fb9NBe17+rC0H1Wtx6n476+KaCrF0b1dDbrofXk3kAjRBeN2tx2ZwAVgCWwhOhYmafBTpxGfVuzj+238OdoTmIcVQr+Lxo9PFPjFFD8/PFZRmwdewx3DmIfO45/1RnZUQZW9zM4PJguaICPt/2kb9U9TS6z/MFLhbKmVBX6B1yqiRVPsLNhjhsVGMsXiGsr6dBVQYGsvCh50HXq8hXb39C6Ge0txG1HUiJj6csW8JjyEJjcCD4joNEULMcDvndaF30+n/aNMAUuaVL5SS037WzLhaYo2E2jKHYBetas2Mgdj9uyuscEsbrOdwL/cSBrzWT0PWC7shVZCa0A/f2+nx/DmjTPgDaPFSCM39UUrMXCulp+psfL82jCQlNeqwJzY40Cy4fFGKM83lWhi4/No6VajKwH094qZ6+Y8ZCFkXjDO1DEfV6S7hU+mWCFDz4yZdDGokSMKZiiHkLKzDehBoXG/A83iB+D5CVgrsLCEu0K7glAuq35wYuuqMHH+8QeazPpQGz2jvoqyxOFxD0/QVLwwAcNZ/ARw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(366004)(376002)(396003)(136003)(39860400002)(451199018)(6916009)(478600001)(66476007)(5660300002)(6486002)(8676002)(54906003)(66946007)(6512007)(8936002)(83380400001)(41300700001)(2616005)(316002)(4326008)(36756003)(6506007)(6666004)(26005)(66556008)(53546011)(186003)(31696002)(7416002)(2906002)(86362001)(38100700002)(66899018)(31686004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Si9MSVZBczZOK0QzWk5ubGdCN3hNY05CSUQxK0tlWHZUd1k5Z0lWWDBpRS9m?=
 =?utf-8?B?RDBub1lEWngveHhxUDdIMWk4Y3hGaEJ6dXRyL2dpMVdlcyt6VnJGemE3aU9H?=
 =?utf-8?B?QThDZ3hVbUhyOVNiTkNPdTNPS2t0b3lkOFNaUW5XaHk0Z0FqVjVDcnJPZnNX?=
 =?utf-8?B?dE56Y0dRMldoM2c0dkhDd0QyYmZPT3JTdE04anZ5MEs3U0x1clR1OVQxQXEv?=
 =?utf-8?B?MUV1QUx4cVJFbE1TSGtTa2VWdHBzVEgralBpWDdyVHl4TXV4cGQzMkY0NlFj?=
 =?utf-8?B?ZFFoeFNFaFF5VG5VYlFUeldYMHdHb2dGVlZCT3JTUkdzQkR6V2FQemJQVW4v?=
 =?utf-8?B?cmJxTjJYdTZYOURZQlhVWmVoRTlYMlI5WmpvOTJWM2ZZN1VNN1JOcXM3bHp5?=
 =?utf-8?B?Wmcvazk3eVNrZ3ZpSFJtS29BQTArNDZ6MUQ5ME1xVVRncnlqVFQxUkJ2QUhV?=
 =?utf-8?B?ajhkLzIxTW1GM29qZTlYdXlZcHNmUEE1M2dWNFFacUt3RXZCei9tdFl1Qkcv?=
 =?utf-8?B?Qy8rQXBtUTNpc2RlSzNtVGdkbmpmcnZBRUh5bmtkNUQ0RThRQzJCaDJkalZW?=
 =?utf-8?B?WFRnSmd4aFpqZ0Rhcy8rZU5pTFI3V2pSWjZFbnZXVFhmTzFWeGVSY2JlOTlC?=
 =?utf-8?B?eTZPYkVFeUZVN3o3TWt0SVJSNnNFWjlja0xYcHNONzhZc3QyUUdtbThHZnpz?=
 =?utf-8?B?QjR1K1k5YmtRa3lOekdFc3RwVHhyY0FqTWJBREV4SFFwdDFtV2h0NDljTlpD?=
 =?utf-8?B?NWFWWEZPVDkvVlhqYko0NFJ2MEdpRlVsZWM1MnRXd2ZPLzhSbWpyNFZrbFpp?=
 =?utf-8?B?RDNvMEIwZzdZMmwzMDlaN1dCYVRhNkxTWmpKdExlMDltMWxCczE5azV1bHBG?=
 =?utf-8?B?Q0xLSWFPRkQyUDlGaGJEMzZKM1dxUy82TFM3SnhuSzZTRFlLbjFQQVEwNnN2?=
 =?utf-8?B?OWtBcFV0SjZDMExuWk1hc09TRVFXOEYrQzJEcFB0TnpKR2pnaFRqQU5SOTVT?=
 =?utf-8?B?S0dVL0dwUFRqL3dJLzRWOG1DbGU1QnFvT0xUeGxqei9SY2RSc0NES1lZUE9S?=
 =?utf-8?B?RHI1U3E4WWY4d2VST0NzdzEzbXdDdUZqeGZ1YjZndWdtUEtNMzRlWFZ5eEM0?=
 =?utf-8?B?R1lPcWhWL0dQS0ptZkVLb3ZWYVo0cTdDK25ON0Z3WlhKcEYrMzR2MkVKQTZi?=
 =?utf-8?B?NTFJM2s5OTZwZWZCWTA2L3RlOFhGd0kzenU2UXpEZC93SktUWG1PWVJwTEtk?=
 =?utf-8?B?YzhtUUczcXBxSWV5MlpSamRIOUlyNitZTWtBU1N6L2Z1N2hzUUt2dzhLTXZm?=
 =?utf-8?B?SndRS21kN2FNbE9YbjQzcjVnVS9kcjhNM29XcTlaT2JyMVJDNlgxaGkyb3pJ?=
 =?utf-8?B?MTdoRTFPdFgvZkszL1h2S1A3aC9sL0dnblNZWUxnaS9vUDdGSVVNTks4bExJ?=
 =?utf-8?B?d1lwNlBkenNXWDdHYm1TajAxOVdic3NkdEd3L291TDRacW1OSlVwUGxGbkwx?=
 =?utf-8?B?WnFGLzRIZitoTUZMRHBrdmZMYWZtMkNXTS9haWhLU1dEV2hiV0NkVGREdC9p?=
 =?utf-8?B?WWFyL0VscGFEbTdIR0dKQ2dicm5EalpBRDArTlBOc1ZHOVZiMUF1akJ1L256?=
 =?utf-8?B?a3dEajZXUk5mSllKQ1NpcjIrVXVya2Zoei9KWFhFUzRnc284aW8xcVkydkZU?=
 =?utf-8?B?VlhmUkZ2RkdHTmFRblRTbkxsVUY2YVQxcjFUT2ZmYmQyenNxZVlVSFpwSEdS?=
 =?utf-8?B?NmFlL2lCNTIvNnU2dmJzQkZMY1F3SGRTdkRsdXRvbWxyVWw0QTF1RHNlbHp3?=
 =?utf-8?B?U3NwcmNHUHJXNStJcXJQNVQvWXU5SnlDRHhnZWJDZHFYVHppaHRzK0czTnFG?=
 =?utf-8?B?V1pkWitXTGpZS3FQRGhIdDU1US9kenkxYUtqVG05REc0M05OcHZoeXBQaENU?=
 =?utf-8?B?VDFxUTZVR010VExhMXc0WlVENkl4SDVsYXVnZmZiUExWclo1TzNqMEduNjhY?=
 =?utf-8?B?UUZuSE9Sa2VhdkorL0N3bG0wTnpzWk1FaEg3Nmhwd1dBYk14dmRLVjRGc1A3?=
 =?utf-8?B?ZXhURklvZC9hbkdBNm05NVZtMit5K21SeGg2QlQ0MWN3emd1ajgxRVNNNFY0?=
 =?utf-8?B?MCtqUkIxVUdBNXZnNDVxSXc3ZW5wTDMrNENFQ0IwbkZrczlWUGV1bFY3ZTdv?=
 =?utf-8?B?SlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 9OoYPg0nTK+pQIuDe4hlj6OUr56RvE30+yzeCmEqjH6nTSgBQUtA8w+JrpzwHx3pML5ypvAXzBckVR32IRIC5TayVV5d0zdFoFvf9mf7mOAMaLziNiRt542AcQkJQ+ah49ahKctXPVcdSSFKyLIcAG0pTXZQ1g+5jwaWe6jrViTtZdl1VETzAEH15pAUGgwmRsxtuzvBrwGq8gUQc3zNyRDV47OPE553Y2SR0B6si5DhJLN9I/M6nQf1PRAQHz8I/PfUbWAl3htawRmuMncejwaeLTXb3PlvaYokxZjaPbLztOtAWVQbDR2meOn/s0KqkIi7ajCygl6zum6o2peqmsUqdyQyAQ8weB6cG7kL8ZTBXj7JzLQTUBw7VTBkcSyVqj8gYqm+0XGja89AVX65f6q8St2OxYeLli3Z+CWGM2vDvn/GjWOI3cDq5V0dob4hoX32Q/++6orm/6vfPW4BQ3SLhIoTNuLYCQwAJaO6LcL16OvKa81a0W9LMuQAIW0zv0ff62l3YJFgY/K2a93aGtpwn7ZmtAdrYSarNAK9xXm7V4V+m9aWg9xIM+gRaJsq0gAU7ZWkbrUkhsLuk/FxIerhzI0IJ462Wr4h8LJDnnz9Fej+o063PfMiN39T/8qaCtbekIVVd4kVtFwGAGWqNsFF+1kjYcDZ3RpH03bg2Pbt13+yXotye5BybX65UHbvcajDriKgtKnbbpUnCQ9bAXHo8LjWeEbomymhI2L3M4wdc8xo2LwmqRf1ZT2Xj6uA1gGgNzVPjSr4GbTL/GwfE0165w0K4ACBTEfpynT5jF0eI+buO9j/YZ+oiRAccn6BU+ylFWr264KBGC/WuLZ5jIM9wgyojyboBGlGyZxta5TpLZUDxFhiz9DBYt/WEtIfEcNpSCXvBpcMdouEVPtjvA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a43570ad-a67c-42af-cbef-08db15e3a062
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 21:19:19.7676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XbKL36/LaKO8FuYa/VBg0fn3jr6J+9FX0PO3XjLrxhnUFo6/kWsrjGFtxSiHxwTXnXgHtwHH0IF4HijqCTAbNSiiF8e2Iq5ncx4znQ5R3Zs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB6962
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_13,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230175
X-Proofpoint-ORIG-GUID: jQLlt77gkiP0YCmutVAdBPUrqKa4so7O
X-Proofpoint-GUID: jQLlt77gkiP0YCmutVAdBPUrqKa4so7O
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

On 23/02/2023 21:05, Alex Williamson wrote:
> On Thu, 23 Feb 2023 10:37:10 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
>> On 22/02/2023 22:10, Alex Williamson wrote:
>>> On Wed, 22 Feb 2023 19:49:05 +0200
>>> Avihai Horon <avihaih@nvidia.com> wrote:  
>>>> From: Joao Martins <joao.m.martins@oracle.com>
>>>> @@ -612,6 +665,16 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
>>>>          .iova = iova,
>>>>          .size = size,
>>>>      };
>>>> +    int ret;
>>>> +
>>>> +    ret = vfio_record_mapping(container, iova, size, readonly);
>>>> +    if (ret) {
>>>> +        error_report("vfio: Failed to record mapping, iova: 0x%" HWADDR_PRIx
>>>> +                     ", size: 0x" RAM_ADDR_FMT ", ret: %d (%s)",
>>>> +                     iova, size, ret, strerror(-ret));
>>>> +
>>>> +        return ret;
>>>> +    }  
>>>
>>> Is there no way to replay the mappings when a migration is started?
>>> This seems like a horrible latency and bloat trade-off for the
>>> possibility that the VM might migrate and the device might support
>>> these features.  Our performance with vIOMMU is already terrible, I
>>> can't help but believe this makes it worse.  Thanks,
>>>   
>>
>> It is a nop if the vIOMMU is being used (entries in container->giommu_list) as
>> that uses a max-iova based IOVA range. So this is really for iommu identity
>> mapping and no-VIOMMU.
> 
> Ok, yes, there are no mappings recorded for any containers that have a
> non-empty giommu_list.
> 
>> We could replay them if they were tracked/stored anywhere.
> 
> Rather than piggybacking on vfio_memory_listener, why not simply
> register a new MemoryListener when migration is started?  That will
> replay all the existing ranges and allow tracking to happen separate
> from mapping, and only when needed.
> 

The problem with that is that *starting* dirty tracking needs to have all the
range, we aren't supposed to start each range separately. So on a memory
listener callback you don't have introspection when you are dealing with the
last range, do we?

>> I suppose we could move the vfio_devices_all_device_dirty_tracking() into this
>> patch and then conditionally call this vfio_{record,erase}_mapping() in case we
>> are passing through a device that doesn't have live-migration support? Would
>> that address the impact you're concerned wrt to non-live-migrateable devices?
>>
>> On the other hand, the PCI device hotplug hypothetical even makes this a bit
>> complicated as we can still attempt to hotplug a device before migration is even
>> attempted. Meaning that we start with live-migrateable devices, and we added the
>> tracking, up to hotpluging a device without such support (adding a blocker)
>> leaving the mappings there with no further use. So it felt simpler to just track
>> always and avoid any mappings recording if the vIOMMU is in active use?
> 
> My preference would be that there's no runtime overhead for migration
> support until a migration is initiated.  I currently don't see why we
> can't achieve that by dynamically adding a new MemoryListener around
> migration for that purpose.  Do you?  Thanks,

I definitely agree with the general sentiment of being more dynamic, but perhaps
I am not seeing how.

