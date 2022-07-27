Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8F258261B
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 14:09:24 +0200 (CEST)
Received: from localhost ([::1]:53586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGfqs-00083V-IZ
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 08:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGfo8-000698-Mi
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 08:06:32 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:15382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1oGfo4-0004rX-JA
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 08:06:32 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26R9v6nE009917;
 Wed, 27 Jul 2022 12:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=yjZXhvSzNqwn4QtkeKIp2kuy4LvyqJHPolhm6SkCXlY=;
 b=E3piFyjS8SsfZoAKAfqbnD4HpxwOxTWiwhWLNazdtdfMiI143XTV0j5bfCHjXJB7Tttm
 2kGXEaI6Npf1VHJy1mZXwLogIp3vl4xx+JQM6bgyZ3SViv3pteV5QvSQ9K58CfpTbZ6E
 4XoE8eTb841AOVWJRZWip9abInyMoikmMH4rVsdbnKp4gTtrh4vqE7tvTHDfAltpdW+4
 Qj2tJ2OyAzkpx/DKO3V2Za1G48I+ph0BMYWmaz3tqq9+WEoA6hQ1uWIPRR9gmN1g521U
 VYYHDZ1dyUdjOnGuY9HYU//nL9PBN2J9Gt/TOm4563QTIAZ7DCz6sPYD95ams3dJGr/5 Sw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9a4sd59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jul 2022 12:06:11 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26RB0r0O016583; Wed, 27 Jul 2022 12:06:10 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hh651uq46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jul 2022 12:06:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afS96SG8mqzabVBxPOCeiwbcjTu64ikzY7f8XT0r3nH6QUh84OE+QUsrAj0QHliFwGG+D0SrQc9DDAHxkS0Z6VDbiV9AG5h51Cjk6Oo3OffFs5LQD453ASZOESV8xNuqNnREQC6lRc+zqUSYIBjrxzSxg9OjTnfXx6FoJWRz/v2GvYpSlLPU/cYqabjn520aohMToH3+rg4NV6+NF3M+a6bm+f/kd1PYfDGNpACpsUHdbMk0lj0iQDyCPDEq+ickyZm6UNrTKSsFX+rQ7x25XU9v5rgMGMH60HjAilTh0g5mXa1mb0GJyVwWdcPLcVDdn/bvTGbPo2KaCbMLwXtpIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjZXhvSzNqwn4QtkeKIp2kuy4LvyqJHPolhm6SkCXlY=;
 b=mH9vWaGiOXA7JSr1BI4U2O5WHFBtV2v7mIgkGftQmoiHsIe+EFnM/C5h7FLQRAhVA51jDNznYYcYWMxWbwn9ybGTcI+ZbuZb0uCVUbSbnNsxVDL1zicDOSIG44Z2WIxt9b4gzeFJpntojfmBtLwEh7BFx1SjvaC5R8InAxCaw0tgbGVwqJcTHlSmTjMKRjf0QBIx8EcTxVufphU/0d7ZW83BG8EIqJcvF3wJ2GCwyOD4Zpi40FHzasoZq7130tw15pZVgPBADkKf3t6XSqZYi0uJB5zT5ckyZxvyLX6IfZAuDcnu2kt1iiOM9opYezvr0OtSgFC2J8mzgIIGi/r+zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjZXhvSzNqwn4QtkeKIp2kuy4LvyqJHPolhm6SkCXlY=;
 b=AVUn54S1N4Jiv54FZHeKSB/isoF9a1f4C/q/JjcnMOdWcaNLXXvcI+r29u2250tlO0sCKoVa3HVxOvolPsVKbnyb8n32Bea0cvGRI0gBX/gnrECdLjdzq+gY59rt0ySk6xpFu7d6tZ3gFDUOT5WtIHN9Q6NrdrcQDfX11vLetCI=
Received: from BN8PR10MB3234.namprd10.prod.outlook.com (2603:10b6:408:ca::24)
 by MW4PR10MB5861.namprd10.prod.outlook.com (2603:10b6:303:180::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Wed, 27 Jul
 2022 12:06:07 +0000
Received: from BN8PR10MB3234.namprd10.prod.outlook.com
 ([fe80::dc38:a513:bff1:828]) by BN8PR10MB3234.namprd10.prod.outlook.com
 ([fe80::dc38:a513:bff1:828%5]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 12:06:07 +0000
Message-ID: <47bb744e-0e34-722d-4130-f9b604be52f2@oracle.com>
Date: Wed, 27 Jul 2022 08:06:04 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V9 41/46] python/machine: QEMUMachine reopen_qmp_connection
Content-Language: en-US
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, Peng Liang <tcx4c70@gmail.com>
References: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
 <1658851843-236870-42-git-send-email-steven.sistare@oracle.com>
 <CAFn=p-bEO7wHG7ci7uveR_J9fJwXyPw_0k3mf-mpOseCdJhMWA@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAFn=p-bEO7wHG7ci7uveR_J9fJwXyPw_0k3mf-mpOseCdJhMWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR16CA0050.namprd16.prod.outlook.com
 (2603:10b6:208:234::19) To BN8PR10MB3234.namprd10.prod.outlook.com
 (2603:10b6:408:ca::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53b00938-f363-491d-501e-08da6fc862af
X-MS-TrafficTypeDiagnostic: MW4PR10MB5861:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: crYb+CoRzHX0gRB6y2LoA/NQxvmWRjvZZ6bv1uJUCO7Wmrv6Vv+d8PRf12d7GCOC5EC+6B/UhZseC/bpt6vOH3Cc6AI1AY2/YgAc1BeyWQKpKy/ITXc+RMzgfy+Bv//g798H9RuTi6aqPbu6H/hF7LzVVXEI0WUl56XIOQzfTKFIWRJ4URh47IYAsOWGmlVyhzkqMyNtROOCFcb/BNibe+fnRAo/SohA+3EgWbFoZT7PyKhZOIZnM+nKsMAeL50zfYatYeYL5hAd0YwxmnpNcFxpz1e6GuPlAqlMRV3ndcoD6rHp/gu1BHBRQDz4zUXHFup9j6I/nI4Uvodl5GZD88Ud35gmAPu/m6suwT+nEn81dBaaBMx8DoeFpSvdkQXGFJMAHGUV9Z56oGzG8kavjSbAXQ4qQ54i3NDhug5bHnY7XaV8sy2Y1hRfNJW5U+d5HNpwkFT+tYNYdaQFT66tESv8oeGi6PeJodHC3E9T1CCxtAUXEenqG9Y2jj2RwzB0qiAc5zGnhFNH6451Qe5BZF7yM6G4gzOrJaJHLK9nX1uNHfT5sLQQWSeAIo939An8QOeYIVdtb8z7Aq091P6lIXBkJLXhnbY10Ylun+jq2Sih8wQoW7kmWV6cGSq06c6dntZbduAw2LOAqA8uwTEyXuBRuCcx+zc/r0xJBZ4ZklpSb1KP0TRMT08CJLxm1FuVMT8mNp7y3asw28pfdIp3k9+hWeIVgYw+h2Jjrtf3oPGnLol7ZgDii7DEAejUELB5eAYGLpfYJws4FmhW8kiL18mRgSml/vBXWkMrYbZ1zGONjgJDBelrIaSiIfZ4EWsJ3pRxealnbPeag0gwdRhHKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR10MB3234.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(136003)(39860400002)(346002)(366004)(376002)(6512007)(186003)(83380400001)(4326008)(66476007)(6506007)(2616005)(54906003)(8676002)(66556008)(66946007)(2906002)(41300700001)(6666004)(6916009)(36756003)(31686004)(36916002)(53546011)(26005)(38100700002)(31696002)(86362001)(8936002)(478600001)(44832011)(316002)(7416002)(6486002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGNINm1UMkE3ZWdZajI5QzViRXMvakdhd0hGT3V3WExyUFBZVXdLR1lpNE5J?=
 =?utf-8?B?ZjZyY2tTRFRMYm5OSnZrWFM2LzNnWVRhL1NmK1NXSmVCTUdpRSt4Mzg5VnpR?=
 =?utf-8?B?cVFkcklndkwvTVpUVXBMQ2lmcEMxTmNrVURac0R3cW51TTNtaHJOYWpJU250?=
 =?utf-8?B?UjdwUzdJVlhzTmZ5dHZaNkhuV3BUY2F3bk1MR1hRb0tDQ3VWa0dVTllFR09k?=
 =?utf-8?B?YTE3d2JOV0RoNmJLdFU2ZU81Zk8wemdrTW0zQjZNa2grQUNLbkpVUkhDL1Vx?=
 =?utf-8?B?Qk5ES05oY2lMZkJwQ0RvWUdYMVVoc0lCNm0yRWtjM2E5bjN2VDA2dE5VT3NS?=
 =?utf-8?B?U2VtdFZJM05uaW1PUlNaTnd5Y0pnNUFwdGRnYzhGVS9XY0V3MzM1UVZoTzNW?=
 =?utf-8?B?d2xGNlFIa25DZUxkSEQ4MkFDK2RVNCtKQUhCSmFEd00rajJ2Q0IxcGRhc3pV?=
 =?utf-8?B?MjhLMzU2cytyV2t1SWFmOEc0WU1yMjJ6V1hPVzB0ZWJLaXFKWjNzZE8wTFB3?=
 =?utf-8?B?VEdDOXE3V1o5U2NqYyttM2w3M1lXUnNESWFXOENOU2tVVlBjT2ZxR3ZYS3pS?=
 =?utf-8?B?MURWQ0ZtWkMyNHVGRFA2cnFLSUtQS29VbGRBLzFONjIwU2ppc1hQcE03c0E2?=
 =?utf-8?B?eCtsd3BNOWZJa1JhdVZyZVMrTFJKVHoyTFZucWk4QTN1dWV0Qzc1VnBOSERI?=
 =?utf-8?B?QzFGTkg0NnFNWlhvOFBjWjZvQU5Ma01vQkJ5Vkh0SldldWlOOThpeVJTdXp0?=
 =?utf-8?B?S3lLUGc5WFZpbDRnVHJRSDlna2pPTXcvdFk2K01vdmNWaHFUYkNlUFdCdlpv?=
 =?utf-8?B?RTdvZG84eWdnRjhIUnpsQkRLVnB5Ky9KcHBqaTRvWW5RVjE0a0JraU1KbDdi?=
 =?utf-8?B?L3JPbWRDMmRxcU5BRTZ5b2V2VVhxeVpRdVNEdWlCcG8zU1p6YTA5TE10bW8w?=
 =?utf-8?B?cUU0R09tci93dHZ0bWNIYkRNZnNSdExZeXhod2J2WUdEQWdGSWJXc3MrNm5I?=
 =?utf-8?B?dXZLb3VPN3VQdWk4NmRSU3o0Rm9CeU5lRGZJalhZZzhNall5UGNXendWVURp?=
 =?utf-8?B?RG01SEpWblFkQ25zOHhQMUptM0NzV2dzUThwN0c5SXFUamw1dXhlUGNUQjFu?=
 =?utf-8?B?STFXQzdRWTBQMWR4NGVwYzNZS0tQWmF1dkpZVnRuMWw5RXJvTTY4ZWVWZ1pz?=
 =?utf-8?B?UTgvUExVbW5SdWU2eU10WVFPS0dYbmozTWhPZjQrZVhWVkVKSlBIdmJ6eUM4?=
 =?utf-8?B?dG9GM0x1bGNtTVRCZ1QyTy81TUdmejdERU04MzVTRmlTcEF4UllCN3doejhq?=
 =?utf-8?B?VnR2djV6M3RGc3RacFlvNHg5OHdlOGNlVkUrWWp5YldWVU5qWWFFcmY5Vzd1?=
 =?utf-8?B?cUpDYzdrdUtWZTAzNldCdE91UEhPMjE4SURZMDl2VDJyWktMS0FDSnl0UEdE?=
 =?utf-8?B?Szl5eEc0dWE2aFBOQStHQytiMFkrWmdXT0lnenA4dWdrUCtxZDB1OHprbXNm?=
 =?utf-8?B?OGF5UU1OazBaWXlmREk5L3d6elkxZTdBYUJ3c3ZGbDBPdk9pN0x6anU1eFVM?=
 =?utf-8?B?cEJBSG82V2xBV1ZsdDRua01aYzZ0RWtQUWdmV0dYTnVQbXg0djcrcEl0Wktu?=
 =?utf-8?B?QmlzTFM3RUR2RFNCd0ZrbkhYalJQc0lwQUN2dDV0ZHRpSEcvRFRTQTQwa1l0?=
 =?utf-8?B?YnYyNVg0U21SeUVpVGxJdWh5blRkWkVzY2NvcmhEMk5nWTFaKzN0L3pJWDhn?=
 =?utf-8?B?Szd4NEIzaDBsV0xTbmRsbndPNnJhWEsySmRFbHZ2eXJ5SXVrVUdITWgrNW0z?=
 =?utf-8?B?RDdYaWlBZXhMMVdZOWFxaGVJbE1vejBoeDl2R0lqKzZZKzgvdGJUdm9FR25r?=
 =?utf-8?B?bDUxMW94dmFRbTMwMW5RTHV6S0RoaXBDek5UbTVvY0FUSkd4aUlVMWYyR256?=
 =?utf-8?B?cTZKa0tMVFptcUZJMERKcE5VSytMdGFCWmVDUjZjSjkvK096Z0VOaXdJSlRE?=
 =?utf-8?B?dlYxSTdCQUE0VzdqSW1VSHhGQnRLNVA2OGY2aVdHd1FwcUpxWk8rQk9tV1BF?=
 =?utf-8?B?RXQ5Wi9Uc3Y5QUt5bkVjM2FkKzVaWFNOOXR2NVpiSDNCYmhpY1pRR1V6S0E2?=
 =?utf-8?B?Mk04a1p6c3gyaVdBZDdxbGNIUU90c2paVEx2ekxJSElmYUxQK1o1S1JaZ1hn?=
 =?utf-8?B?Z3c9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b00938-f363-491d-501e-08da6fc862af
X-MS-Exchange-CrossTenant-AuthSource: BN8PR10MB3234.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 12:06:06.8488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1cNZ4DY8FRVyDyS60cWylf5jrWNZrjP17Sy2eiP8DOAtXwsStDWjn/9nnh1GRyzc/GUCDCRSSOSLtX/Y+eNiDrig6FeQE2cl+fGNVTCGGrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5861
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-27_02,2022-07-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207270050
X-Proofpoint-ORIG-GUID: vA7qFnbS0P7scjuQ1D24a60TkNswdqRk
X-Proofpoint-GUID: vA7qFnbS0P7scjuQ1D24a60TkNswdqRk
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/26/2022 2:04 PM, John Snow wrote:
> On Tue, Jul 26, 2022 at 12:12 PM Steve Sistare
> <steven.sistare@oracle.com> wrote:
>>
>> Provide reopen_qmp_connection() to reopen a closed monitor connection.
>> This is needed by cpr, because qemu exec closes the monitor socket.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  python/qemu/machine/machine.py | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
>> index d05950e..60b934d 100644
>> --- a/python/qemu/machine/machine.py
>> +++ b/python/qemu/machine/machine.py
>> @@ -491,6 +491,15 @@ def _close_qmp_connection(self) -> None:
>>          finally:
>>              self._qmp_connection = None
>>
>> +    def reopen_qmp_connection(self):
> 
> def reopen_qmp_connection(self) -> None:
>     """Close and re-open the QMP connection."""

Will do.  Thanks very much John for the fast review.

- Steve

>     ...
> 
>> +        self._close_qmp_connection()
>> +        self._qmp_connection = QEMUMonitorProtocol(
>> +            self._monitor_address,
>> +            server=True,
>> +            nickname=self._name
>> +        )
>> +        self._qmp.accept(self._qmp_timer)
>> +
>>      def _early_cleanup(self) -> None:
>>          """
>>          Perform any cleanup that needs to happen before the VM exits.
>> --
>> 1.8.3.1
>>
> 
> With applied fixup:
> 
> Reviewed-by: John Snow <jsnow@redhat.com>
> 

