Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B71A6A9FF5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 20:16:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYAs6-0006Wz-VS; Fri, 03 Mar 2023 14:15:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pYAs4-0006Wl-NA
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 14:15:12 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pYAs1-0002Xg-KE
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 14:15:12 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 323J3SUk014625; Fri, 3 Mar 2023 19:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=JNpwucOrEep1DOiVvPfaNnKkl8qDwaB1XPfN0/SGtdw=;
 b=PBPwmtMV6s756oSCByHkTuVGfyYsaSJJoCjyXqgZ+YJj6MkyhjkCs4OWzs2tD/VHdGak
 XehZ3Ftb2IKKX2N6UffIuOPoIrvs6A8jxZQuTqGQ3biVenmpiSFFIGfLdQpLA3vH9oaU
 EN23VIseAZ56Hu1Y38gKrh5e6WdYQuxanPCob68ABuFEAJhEOqTUeK2XLiKYU3UeJuFW
 DDBF/5HgFfPz9DS9ljRsYy6fiFQ6jqmFA7C+2uhpEpSP4f3ooz2CMIJqQBX51+ys4tA9
 jsSvIFWMohONM6cwTF12UsR03tRoWIgRru3FRi5s75Jvg8KCog8omB8FIVWVdS8z99Sy Lw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nybb2q5he-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Mar 2023 19:15:02 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 323HstFA033004; Fri, 3 Mar 2023 19:15:01 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8sbvnsd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Mar 2023 19:15:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JuP3aqy/x+GxzBYKVQT6ldYBE1W3odkIFYeDRrocI0YNmtWe2BKzkVglhvkEZN4YK5oPRggojNnxQjRP54maupzf2MJNahVstuJ4mj/7OVX991fJhTfbiF3TADfD2Cy+FBIy7m9+0Eeuw+GBctzvp3HSHw9OG7XpFhybYHqXoEbqznYDGCWHPM9dkGnwhRfjxsN4pteyQ5D4iwAIDlsT3fQKS3HR2dKRRU2VsPq2souqzCbEDoEX/4939LJdrB6b+aoT93HnBpxzh8WqITEWohLsatH9xBH1Eeu/QajfimR36NyTwMx9aaTprS4HIdrdX4m1VVyc5XPThgZF+01Vww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNpwucOrEep1DOiVvPfaNnKkl8qDwaB1XPfN0/SGtdw=;
 b=L+SO1IOWYYpZaJE2FxQpOP89qoW/dhday69JxoGzYRpj/I8AW2D0IgAsF3EfScUeYW/9Ax5VK0XNVZaxfn4XmStgQuFB4O1J+TGijv5duqmy6GR+0Ud76qCZfV7da9fJ1IYbwY60agZGp4Z/30rtlhziKL2h2yn6oesKnlgrOynkUVEGlHeb5GyPUhaD9TxSyDdw/IhKZQbhLfhaP4lQKfrq6AqN4HnltYogJj+B45K/XWkiIkcleo3mWt7RJcEs8DHhJXCzkbqkkkgD614fJcAJOnGjnvmimWnLJtrDT6qBm1PO1J0UWvM8fBn9CuhJ26Ua/WqNjERzNeyHixHluw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNpwucOrEep1DOiVvPfaNnKkl8qDwaB1XPfN0/SGtdw=;
 b=rE4ODcquNDPEN4E+7OM10jyE9ZZDU8oJ/B7pVPKJ4A1UmjqfkBq7UAP8wBMnyDY7Eqirw2i50tFy5eWvoB8FGOh6vvJ7JcuxdpJvC/jnj7qX7HQbawF99a9V3tyYVMsQe7R4aGIJv5QQ6pkEgIJ4L7uDh5prIWj4rajTL9CCr3k=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by CY8PR10MB7316.namprd10.prod.outlook.com (2603:10b6:930:7a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.16; Fri, 3 Mar
 2023 19:14:59 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.022; Fri, 3 Mar 2023
 19:14:59 +0000
Message-ID: <87b39028-4b65-36bb-6b41-9d8ac56164a9@oracle.com>
Date: Fri, 3 Mar 2023 19:14:50 +0000
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
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20230303100551.435e8cd3.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::11) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|CY8PR10MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dff018d-0542-4edd-2290-08db1c1b94b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e9Uaul9m9551TkTm6eQUn/UQd8JJ5WjWmmuUs1vcxZKfiTt/Qa5ijfdOgQas8VE49AkpoNxqz2aWOo80oHAx54SkOjblYvWPi6fF4RuCpzDjvSbNXLKRHxEsUANwhyP5mEAgGkjxNX2gExq3APxUVQq5scx8jIkyZZqp9Fu/awhZIEpTO8VbKJbC7bIEQ8kumMyoz8hTMl21mIMTKdK8Fe47acpm2Y2GJea91XjX6ZIVOflwXxC0xfleL1XD1vimOkeJRDtdlt1PW66unr91UjVV/hPJ/avvlPDC3x7OmKJC2E6SOPr+rs9/vw2xKP3GPOgvp6U61QoULUDG3lvSFJRaXpB4P5ETCDAZ25xGVG3D6XBwOdc1YQMbbhRpA3QF/xddlGnJJEVZak1fck96288XmMw2IAGfEmnyhCN9ThBpxO17+FMwQDpQP5s+6ZzkLoieNz1g18f8HItU+0Az7cvw78BUnqWaB9W4dF7WzXENpibWzmZef1HqIAIvhpevcgbX1cQo35ZGyQqQ24WwxZ4uFqUxmy9TpAzwkl/J3Yd/7c8lzaAIsp1jzEnpybBg+6EvhP01j4Ikj7enhuJ5vyAR62ds62d2acZEdjuaKIWOsFMGcAmeDbe0pFOBRD99y07ujK6yL9pnDLy7BBdLYNi2rflyWbBRc+wQlbT2NqqlppxLWzBxfp5krbcIBT1TqEsa4jrld67j3j3qGL7a+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(366004)(396003)(376002)(136003)(346002)(451199018)(6486002)(36756003)(31686004)(86362001)(31696002)(5660300002)(4326008)(66556008)(66476007)(41300700001)(7416002)(6916009)(2906002)(8676002)(38100700002)(8936002)(6666004)(478600001)(316002)(66946007)(2616005)(6512007)(6506007)(54906003)(186003)(53546011)(83380400001)(26005)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDZvYXNHTDZpcUt5NENCUlUyWFJPY0VJekQ3QzFPeVlobmpBcTdjc3RTNVBF?=
 =?utf-8?B?WUxodVEvajM4OVc2blJ0VitMN1M1MExoQlhLdnNsWTBRRUt6SnBhRm5yR0o0?=
 =?utf-8?B?bDJSdHZrYjhCbzRlQUJOZWp2eElCUXJJeTVIRnpXNTBMOHhLdXJkUVRWbUJ2?=
 =?utf-8?B?cGhqdUlwOGJuR2lBaDRKNmxTSlQwc0EwcFl6OXpTUXpZU1hSNDk5aVE2VzFk?=
 =?utf-8?B?a29SNkJTM3lqK3lXSzk5VTBoNk9jOGUxeUxPM1Q3NUM3T29ieG5zTXdCdG5N?=
 =?utf-8?B?a01WK2wvNXpvNE5zREhTbm9BV1BmdlFRRXhXOVEvMnNNcWUxUVZFWHF0MVhj?=
 =?utf-8?B?cTJSWmRNanNFdTBreVA2dHFaZHpYMXZGQXdQdExaVEFSeVBSNWVzSittVC91?=
 =?utf-8?B?dCttbEQ5SEM1SytLN3BnRzkxbGd6ZHNsU0g5a2I3RFpwZjFhU3BSTmkySWZv?=
 =?utf-8?B?ZkkyZXZrM0ZOaGY4L0RxUjVYQVNCdGwwYzdpbGR2djc0Si82VFAwbGtSTWYv?=
 =?utf-8?B?SkthM0UvR1RtVnN0NnFqNWdUTGJFQ1djZVUxLy9ldlk1WVR2dnV5MjBvYUdH?=
 =?utf-8?B?RXBJRCtoK09BSnBrRDdMblBwc01FZzRueHc4K2pmR25JUUJPQnQ4VVdZdlgy?=
 =?utf-8?B?R2E4YUFWMzR1RXFkT0Y2Uys3aE1JTlc5dXgzakg5alJqVDR1eFJiend4NnpM?=
 =?utf-8?B?MFJWTjJXNjljeUl3N09TWVFJZW1PUmNXeVR0M0VQMFRWSDhadnlkYWp3aUM0?=
 =?utf-8?B?S0FSRkY3VEZkdVprMFpQZ1VmUFJEMFZqUE0xeHZ0RGhIMHBvTXpEUDRwamJQ?=
 =?utf-8?B?RkxyeWRYczQvT2k4UitNdnlCRldFVjJrSjhwMjQ0aGJEVFhzdHlBOFdDcnUx?=
 =?utf-8?B?UmJ3M3EvTVhkMDlxWFgvdTdyREMvRHJnb1ovaVJnN2g3VWptV3ppUmlHMTVO?=
 =?utf-8?B?T2d6UnJCZGd6ZDVDOVEwSzhsdFU4N1ZyNURRUGVJdFNMekhhNlVMdVM3ODcv?=
 =?utf-8?B?MVNIbTR4cEhTSnhUYzFlSFRDejFTZzNtSXNVQWFsbTVibktsVXllY3VJQmhv?=
 =?utf-8?B?R1YzV1loSXFsd1BwVzVScEtPaUpUTUFxcERjNktoVkdlcGpVOFV5ZHp4WVR5?=
 =?utf-8?B?SitoQzBzZS8vMzVCMlFyRUxDRkJKMjNZdWJlUFNHRkVsSHNaYlFoamJZNGJD?=
 =?utf-8?B?eWZOS3ZlUlVHcHVDRkZJSlF0NTBzZURzd25LUURIcTBCL243WFhvK2swV0t4?=
 =?utf-8?B?cysxTDNWK0dtdDNZa2syK1o1RnJoYi9LMXVkZ3hzL2loQzBEc3BWZllFWVF2?=
 =?utf-8?B?ZzVDT3VtSHQ3QWNpc2ZCUWlITUdEaWVYRThsM1drU1VRYXFBUlNUbnFFZzVp?=
 =?utf-8?B?eXEzYUFBZXhUUmFQZW5aR2VLRnpCQ2hjVlVjSmZMSVJ4UzRpOFRpR0E3ZWJj?=
 =?utf-8?B?bHN6VEhVZkZkMUJ1Ym1JSExhbG1xNUN4VVdRY1pMcFVHNmcza3lJZE1iWStB?=
 =?utf-8?B?Z2hqd0lTMjZUd0xrMGYyNWh5QU1xbVNGdE1HT2tWZVJZUU9JRFZPUC92Nlk5?=
 =?utf-8?B?NXdIV3VNM0l1bnRZemRhUDVWSW9DUk5Bem1DNmt4ZDZGRGZoMFBrbnFsRmJJ?=
 =?utf-8?B?MExFNU9KVU0yaEFzelhUSE14b2ZIODdoM0tkVVBsQzlnMzZpaXgvOTJZWGoz?=
 =?utf-8?B?dXNibHJGV09sREs2aFYxc29LWUhaZStvYzJ3MUJHcnR6OFFvenh5M3doTFoy?=
 =?utf-8?B?bnVDZ2duQ1hZWWl6RkpoZ1h2dTYwdlBNL0tSVWpkUzhKVDhOK25iNFAvbHd2?=
 =?utf-8?B?RysrZEQvcWFhTEF6aTRibUNDTWJUMW1OSStFdDhORVgwNUFRTjFndlMxakhv?=
 =?utf-8?B?N3VmVFRrT1hUR3VTRVpsZjFpS1ZZTmZUS05NRzFSVVYzU3NRZVlJbGpwbW9Y?=
 =?utf-8?B?TGh5cmdWSGVkaEhnd1FyZ1ROU1RWaXc4Y1h6cGlvaGZtYjVOYy9INnNRcmhH?=
 =?utf-8?B?Q0dGUkRWN0s0YTYyT0VJNnYxMnByMTViaFliTzVxR2pXU25abFRGejN4WUFi?=
 =?utf-8?B?cno2T1NpTU1LS3I5VGNHYWx3aWJWVGpVdWRGQ3lKcmJITXBLbmsvVVVsU2F4?=
 =?utf-8?B?UTBsUmkrZ0JnSkNCOW9tOEgrM2cybGtOOHNHV0ZMN3NibjQzaDBSYTZXUngr?=
 =?utf-8?B?Y0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: j8On/ZHnN2Lq/zbNia7FJU/Agj28qfSeGy1pPdceh/5d2A9GqJNdvRG05uPe3gQqnrsGxI3j1O3XcssnMon6CGjbIaUNjGaH/Uj2CE+677e+FxqqJAe5zP/8Nizfpo/6W/MfWPKsf1/hVVAoRxIw6ObOvTis03IjGGugxDJghumcm+P7H0X9gNyOaI6a48suitZlYxRNkCJ97dWYh4YZIv5w4ZUclX4CKVRMbEoV7fvBTBQg9dtCqEn5AlkwuVwkFYsCurKq7EuYQXvw9TeY1NR/rMuN7l86u/q2NDLm7zZbUCEL8WAu9Weh1RhG9bJXA8oXdJoWH6y3KrcoG0HxPt3RdHzyWTxCORz3xylpmmnPoMRa5iODI+fKOdtNWhyjOAwX1md1TMovKO9b0IQOk3NwdOEEYKmnnXa1sEQiEjQG8sknGctv/IxqbHxBPvbPtOtYD+P+ZGAJnqNqIHWYAhuIMCD2rTQU0VczfyqzaOFODJqcUusUXMFcoUwe/q/JGSgdeHFxWX1A/4BPYmqaqBq493UP54Y+aZYPTIyJew0XbwItX2Oo6w8rKIqWwRns+SvfRaLVQSGY+zcd6amgi5zKJoQs+0HPYMm2rF/xTwzyjLpvn7Xy5WTev68FUYP2Hk+UMqLQ2aEn5A2i1I9xb66C8LOAiGHePKOIE1w5+Bq5vBqNpZEI08WtsNhNJiCvmVqjbT2tqICSw5yvw8e1Hm7oUJNXKuB+RU3sWPsnq4OCRjcVbfGjU+s1hb4IlEu3CTxSFZXMf3HKceAqUxXUk6FwmypFJfmxXCwX3aVMefm9z8g10a0KN3olOJhEr7vt03WMQgVA5aW2Q9N4btTsaO5EM2G272QZhKvTu3ZadGKe4KNNSeUncG2gMTLoTBDF0hMCJcwEK8+J9gMKpiHwBw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dff018d-0542-4edd-2290-08db1c1b94b0
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 19:14:58.9665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XFkma/87+UcVWRqRzhTsTHHW4pdQeko7F69BWrWdTDNX4N3SHC8tSqaR7mp8332njgY6D7pZkII8qZkqA+pxlkemFI7jx2HiQUxP5Tc5AY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7316
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_05,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 spamscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303030164
X-Proofpoint-GUID: zxw2bzVcFveTYijVBkLd2mJiG0o7Xxyc
X-Proofpoint-ORIG-GUID: zxw2bzVcFveTYijVBkLd2mJiG0o7Xxyc
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

On 03/03/2023 17:05, Alex Williamson wrote:
> On Fri, 3 Mar 2023 16:58:55 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> On 03/03/2023 00:19, Joao Martins wrote:
>>> On 02/03/2023 18:42, Alex Williamson wrote:  
>>>> On Thu, 2 Mar 2023 00:07:35 +0000
>>>> Joao Martins <joao.m.martins@oracle.com> wrote:  
>>>>> @@ -426,6 +427,11 @@ void vfio_unblock_multiple_devices_migration(void)
>>>>>      multiple_devices_migration_blocker = NULL;
>>>>>  }
>>>>>
>>>>> +static bool vfio_have_giommu(VFIOContainer *container)
>>>>> +{
>>>>> +    return !QLIST_EMPTY(&container->giommu_list);
>>>>> +}  
>>>>
>>>> I think it's the case, but can you confirm we build the giommu_list
>>>> regardless of whether the vIOMMU is actually enabled?
>>>>  
>>> I think that is only non-empty when we have the first IOVA mappings e.g. on
>>> IOMMU passthrough mode *I think* it's empty. Let me confirm.
>>>   
>> Yeap, it's empty.
>>
>>> Otherwise I'll have to find a TYPE_IOMMU_MEMORY_REGION object to determine if
>>> the VM was configured with a vIOMMU or not. That is to create the LM blocker.
>>>   
>> I am trying this way, with something like this, but neither
>> x86_iommu_get_default() nor below is really working out yet. A little afraid of
>> having to add the live migration blocker on each machine_init_done hook, unless
>> t here's a more obvious way. vfio_realize should be at a much later stage, so I
>> am surprised how an IOMMU object doesn't exist at that time.
> 
> Can we just test whether the container address space is system_memory?

IIUC, it doesn't work (see below snippet).

The problem is that you start as a regular VFIO guest, and when the guest boot
is when new mappings get established/invalidated and propagated into listeners
(vfio_listener_region_add) and they morph into having a giommu. And that's when
you can figure out in higher layers that 'you have a vIOMMU' as that's when the
address space gets changed? That is without being specific to a particular IOMMU
model. Maybe region_add is where to add, but then it then depends on the guest.

I was going to attempt at vtd_machine_done_notify_one() ?

@@ -416,9 +416,25 @@ void vfio_unblock_multiple_devices_migration(void)
     multiple_devices_migration_blocker = NULL;
 }

-static bool vfio_have_giommu(VFIOContainer *container)
+static VFIOAddressSpace *vfio_get_address_space(AddressSpace *as);
+
+int vfio_block_giommu_migration(Error **errp)
 {
-    return !QLIST_EMPTY(&container->giommu_list);
+    int ret;
+
+    if (vfio_get_address_space(&address_space_memory)) {
+        return 0;
+    }
+
+    error_setg(&giommu_migration_blocker,
+               "Migration is currently not supported with vIOMMU enabled");
+    ret = migrate_add_blocker(giommu_migration_blocker, errp);
+    if (ret < 0) {
+        error_free(giommu_migration_blocker);
+        giommu_migration_blocker = NULL;
+    }
+
+    return ret;
 }

