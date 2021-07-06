Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1D23BDC5D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 19:33:29 +0200 (CEST)
Received: from localhost ([::1]:60754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0owq-0000t9-9Q
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 13:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0ovQ-0008E6-CH
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 13:32:00 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:45908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0ovO-00033n-6K
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 13:32:00 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166HFjHi023061; Tue, 6 Jul 2021 17:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=Zo1pgI+lQZ37xIh7TIf9LA7WilV+S40DNmvzqmBYJfM=;
 b=RRMN+DZkRFNbbUSlgfU6Mh2gaYOFaN8REekB0kjzis8557ul/oMalf51EsK9qnkXS8+n
 B3BvuFjlB5vY/ewyecWPh2k4x8WqBUiOvX+TZTcSpjeWL3C0OzrCFJ90Kj1P2BdzTt3n
 SKRC1EbRNi6bFCj2bTQvL3JosbwRP24YVq2oTtF1zJrOtgJkpnXXFEV4yA6SWtClaFSV
 NWfPvM47OTva4s+rH0jkpCNPLkmzKRb4zWttGbedB6jkBP+DyCGIptI7tbDaoS+RzTAQ
 byttz4JAEBabE6y0pt+lOnWoU1tLoAzhtIPZVbos06bEoK4JHttyOPLuflORvyNQ1/dx /w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39kw5k35ca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 17:31:54 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166HGJla099647;
 Tue, 6 Jul 2021 17:31:53 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by aserp3020.oracle.com with ESMTP id 39jfq8xcmm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 17:31:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ui+sGmjdjJPu95HMveH0bVAE/oJmmvT8cQOiXq6UvIOPApdLItfR/XGdQqM/N9jor+wmHFtayEhQJZ+mOCjW5e74N8OVC7fHZqmwS8Gk925dl35XXZy7hF9lA9anpw5WVCUrnDOCacKyKUo66QbKG4cnydqeOYZnMCRLoo8S80tdCOwktLcG7a3IqfaGzDWiG1qWu/NvIVfDxgSe0QFM/pufC1V/buCxxdQeGiuXVMEZv20aeBgm+I61VI0cGkIUZLkWZ7G0LANYrxSj82AkYpxPE6W3XcU0wxxws6cmCx2xINvjfP6kfWSDyevg9SoFwnxlyTvtTohMgIVeWqIW7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zo1pgI+lQZ37xIh7TIf9LA7WilV+S40DNmvzqmBYJfM=;
 b=oNmeIM2gJSGIDyKN7z58TBWstTzMhZLWPshApUKGE2/i7s6s8eL+VTsKSwiMmG090Z7eLzkcVHaNiREN+u6116HrC78VxS4iTFdKwQZi8PEGYW8lBsZRSWMNNNSy7SInDjirHxB6rwQWC2S6vGCsi9mbdk3xPZhYw+EG72WymBTtiF9fhCtuL5wnBRdzEuLzfDQSZMwVFjt97yprDfZGz73+yXHy6Cyz5V/WgwAQ08zXN5DXqCK6f3wgTkUgdHHVMOkSF1yJwz1xvoUbPcm+rPD7BWjZpKCJ1fUgFV8QGTJMdVjh/NEImktmTRAQQvNjoZZgrIjCHcwN9xiBmo8a/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zo1pgI+lQZ37xIh7TIf9LA7WilV+S40DNmvzqmBYJfM=;
 b=mUIxAEjUCgLod80GpOxIN9ZZ54gZBjUdT2hjs1oDxBc6Xx5IbZFgW5j9LYpNfJQM/0OOXeqcW049g+hkgJwSDhIjwMbeDUi54RsVwrEC6ilY+H7A4g/XlTAA4MbpukfD2dHlLrcLioB605NXOJe+DmHrvtWfxBuUPVJS4nADhbg=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2421.namprd10.prod.outlook.com (2603:10b6:a02:b3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Tue, 6 Jul
 2021 17:31:51 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 17:31:51 +0000
Subject: Re: [PATCH V3 00/22] Live Update [reboot]
From: Steven Sistare <steven.sistare@oracle.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <YJwFkhlYISA9INwO@stefanha-x1.localdomain>
 <4d3dd5ff-5180-16df-ab48-11de610dd396@oracle.com>
 <YJ5kokhzyA5tCom3@stefanha-x1.localdomain>
 <29356c3a-0b3f-2773-4f9f-18ff4ed4d5bb@oracle.com> <YKOPnkefxgRZ8PoQ@work-vm>
 <a1d3dfea-d15e-35a3-a216-3ce65600f2d6@oracle.com> <YKQULUn5F+x1wrYI@work-vm>
 <38dc91ab-b96b-1cc3-bf8b-84ff77b334fd@oracle.com> <YKZdcSt0ltCBqVsz@work-vm>
 <5dc94efc-cb95-d7ff-cad3-391c90b3264f@oracle.com> <YMj8Fh2FAYJ5Pb/c@work-vm>
 <879d3412-8918-45fc-55dd-2e0db956e089@oracle.com>
Organization: Oracle Corporation
Message-ID: <c5c46930-a8f7-7216-3468-2ffe19241e57@oracle.com>
Date: Tue, 6 Jul 2021 13:31:47 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <879d3412-8918-45fc-55dd-2e0db956e089@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0117.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::32) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SJ0PR13CA0117.namprd13.prod.outlook.com (2603:10b6:a03:2c5::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.7 via Frontend
 Transport; Tue, 6 Jul 2021 17:31:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ba9b538-92bd-486c-3ea8-08d940a3f0d1
X-MS-TrafficTypeDiagnostic: BYAPR10MB2421:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB2421420CF0073DBDF612D78BF91B9@BYAPR10MB2421.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9F8JjRjujkiJoPQlUKRpdkgWwb8wwZ1N0TvvYbqv9UX7IgBH49ci6gEa9Md6PWzt1/AigHlpmGG7PCNxUP55DTC1URqzbdBCXSkKUUgECx6LhxBcIphL5Dpf8wnQAzYITynlz7/4ga4tYhMNI4Tqv4eBX4/swPozRx1hUqS4g50Ky8k49doGuxbJ3jUrB82BMoGRQufzFmBgkYTFBb2cdgJADCRNWMNelOQ+e/9S8FJ5gluCEnmh30AYg0pmhfD424CLQcOQ3VasBqfB6NroaheSo0w+PC15r4NjPmRECEKI8mYfWCV9mmZd8fRtAXFYQY0TUnkF8XYEgS9o3aycl4NXWb2FkJ+xNmrAmrCXtIhFOsA4psssxZrGkCWBBUoZhXPa7NsOrsQWKbjmlP6Tjj8nTO9CMwa0BAkEkN5abXOVPqNT2GyfATUswqqlOHwuL3MBNxvl9GKcCdQzhU8VJ3z3p1nBmaRWhEMHoacTLIzGtSsiCle/p9p5Lr++UNN+WyY5NVNfxCu8Qdrps7NG5GIN1f0ixa4x9R+TfiE5xfP+7LUT+RwKdI6ZcMIpP6lIUBxGMjwroAYEBhg28K2AIWLc5xrc37HTjHvi8XLf8Ha5toDvTERe9cVvrANKDxDQ8G1rpIlsYsRXO3tOv0WxvX6UTJsFnTbZEELR9/1drs5yrU7/KQEff0tgGFzlI7xRp3JeZIfVSrBJ7E9IDHlNObTHdZdSTb34GRYyiXakWQI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(376002)(39860400002)(366004)(346002)(2906002)(31696002)(15650500001)(53546011)(86362001)(5660300002)(66946007)(7416002)(66556008)(107886003)(66476007)(54906003)(186003)(2616005)(956004)(31686004)(36916002)(16576012)(44832011)(6916009)(26005)(4326008)(6486002)(83380400001)(316002)(478600001)(8936002)(38100700002)(36756003)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlVOSU1vZkpReWRXeUEvNU5QOGVJaEVTaXNNZ1VKWm1acGhidTNsSjhsdmVl?=
 =?utf-8?B?R2JYamdBTkY0NENreXBveFJTT0tqUHEvNDFLTVJqbVE4OEExa0VaYUtyMnEw?=
 =?utf-8?B?N2xyYjk0dFJiSFNEdzdLd2JqWk1GVDNxY3FzbUo1aDFtb1FYbTIxVGY2YWhE?=
 =?utf-8?B?MHZ3dVI0T2hnSCtKYXRTRE9HcjBDVTZYUGZFWHp6RjdZN1FVY1RCTmtjVjA5?=
 =?utf-8?B?Mzl5VjRabjdaeXM4d09NeGJLbWNZNk52N0ZSM1ZQV1F3NGpOemhNUlhzRzJB?=
 =?utf-8?B?ZVFCV1lXSmlSbEI2VHRQVzl6clo0d3J4SEpiakQxWC9EUXA1NG9TaGVHWFkr?=
 =?utf-8?B?cXdXYVIveUJsL3hlblRFbGNySEkzRlhyN1ZrTkJoaC94cUdwNHpLVUxJdnNX?=
 =?utf-8?B?NU5zSWxCc1BTaVlxV1hoK3EwWUVZRmQrOWZWUU1MQ0hMVFRzeHBOQm5vZTRk?=
 =?utf-8?B?RG53SkNsNm0xZy8xWUFjUE9FUVFEeUdPNUxMdzk1MW9JRGxLazNudTFmRjFz?=
 =?utf-8?B?SFVoK3MxS3VHckV1U0NuZ1dFSUtQMTF3bThiTVZPTkc3eHhrZ3NiemlUSVJ5?=
 =?utf-8?B?OXZtK0VxMGVEMm1wbkVFelBESm8xY0R6YVFDU3NKZldZT1UvREtSODRFR3pi?=
 =?utf-8?B?TWdxYkczNWU4c05rWWhFc3lQemZPa3J4OTZYUXZzY0NnOXFkVWI0V3FLakxN?=
 =?utf-8?B?YzBoZnFZZGtQakQzSmh0V1VGM2IyQ3U5YnFrYU81VGZpREhPY1N4ZmovUFdT?=
 =?utf-8?B?bXV3RS8yUHNZYUFIeHEwNjl0aGhDd3hNYmVXUHZuRnJSZGZQWnEzalA1T01s?=
 =?utf-8?B?QXVYK1ZHLytQeWp1OGVhd205RmFVMm1xV1dYOVl0SVpEdEtrUTkwTDhXSnZi?=
 =?utf-8?B?cWVYd0VwSmR6ZGg4L3FuaU1xZElaSzZJejdwNFp6dHU1K21PVStKME4vMzMx?=
 =?utf-8?B?WGVmVEhHRmFyL3BUdDU3S2poWjhUUkttVDhXTmdpaGlabEFVQ2IxTHpYRnRp?=
 =?utf-8?B?ZHlyOENqa2xSS3dFYnBEbjVmQlhJTUFxWWdFYndIaVh3dk85VEdJdXBma0Yy?=
 =?utf-8?B?U1BxZXdzMjNmN1JwYnYvSkx6cEY4YllueHAyM2RLYWV4dG9lRlNmQnVPY1Zn?=
 =?utf-8?B?Qm5keHZwUVNRWGxyN3loVlgxZDBMU1BEK1B0Y3lvRmJEaFk0MWFEMUJqS1Vt?=
 =?utf-8?B?Y1ZTMlpTVUZ1elNQZ3BZQ0xJZVdQWG9KMi9CcUdvTmJLWVk0SUlmR0RoaGJU?=
 =?utf-8?B?akJjZ1V3MkhhTm1lWlYrS0hzZFlhbldLOEZNWHhTcFNsdUtETWgwZDdJMmpo?=
 =?utf-8?B?SEpSZERiMzFCM2FwNE5pdXl5MDdjOGdqQmcyLzh1YVhKT01xbGJWL2R2TzY4?=
 =?utf-8?B?eFlQUGo1ZmRRWDFhNzA2cTV0ZENFRG5WdVAzaWFkZy81dWYyNFdCSXBrRmRX?=
 =?utf-8?B?eDRiNmtadmN6OFVyM0xycGw3R2ZUQ2wvRGxBeGZORHFJcllISGNKcSt0K3hs?=
 =?utf-8?B?NEJiL3J1SUxadlB6RnBkNGdkN1c3VVJlbFNHazlTQ1ZUUlVaTkRwT2RSM2hQ?=
 =?utf-8?B?S3B2TGVxTCtRT3VYQ3BMQW5qZVRKVUlZM1hGaWZHR0kvSFZBRERzT0dyMk5o?=
 =?utf-8?B?YVVnbU9jZFRxYlRYTVV0dThuRXVPdVpWNnh1WXZibmZpV1V2YXgwbU5zMTd3?=
 =?utf-8?B?TVV1MGVuaERwZ2xxMXBzS2JCeDE4SzBzSlpqNkJLK2dieHo1Zks3UXFHSkxH?=
 =?utf-8?Q?7mtQcn1N5kczYc2u13Fjh+3d8FNV1vs3xp/71Iz?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba9b538-92bd-486c-3ea8-08d940a3f0d1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 17:31:51.5006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+h/AZ2VkY/mwW8aG5vpCDWf/sfxdy4+soPHMscsqY3jU9bIVAf5thLRYuOqZDOcA7XtWtY0TbX3thKIN0A8gTMHYF8mMXOooP1Xwrd+rM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2421
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060082
X-Proofpoint-GUID: sU_wBFhTm--__jNszc0ezAeYnr3O44fD
X-Proofpoint-ORIG-GUID: sU_wBFhTm--__jNszc0ezAeYnr3O44fD
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/2021 11:05 AM, Steven Sistare wrote:
> On 6/15/2021 3:14 PM, Dr. David Alan Gilbert wrote:
>> * Steven Sistare (steven.sistare@oracle.com) wrote:
>>> On 5/20/2021 9:00 AM, Dr. David Alan Gilbert wrote:
>>>> Hi Steven,
>>>>   I'd like to split the discussion into reboot and restart,
>>>> so I can make sure I understand them individually.
>>>>
>>>> So reboot mode;
>>>> Can you explain which parts of this series are needed for reboot mode;
>>>> I've managed to do a kexec based reboot on qemu with the current qemu -
>>>> albeit with no vfio devices, my current understanding is that for doing
>>>> reboot with vfio we just need some way of getting migrate to send the
>>>> metadata associated with vfio devices if the guest is in S3.
>>>>
>>>> Is there something I'm missing and which you have in this series?
>>>
>>> You are correct, this series has little special code for reboot mode, but it does allow
>>> reboot and restart to be handled similarly, which simplifies the management layer because 
>>> the same calls are performed for each mode. 
>>>
>>> For vfio in reboot mode, prior to sending cprload, the manager sends the guest-suspend-ram
>>> command to the qemu guest agent. This flushes requests and brings the guest device to a 
>>> reset state, so there is no vfio metadata to save.  Reboot mode does not call vfio_cprsave.
>>>
>>> There are a few unique patches to support reboot mode.  One is qemu_ram_volatile, which
>>> is a sanity check that the writable ram blocks are backed by some form of shared memory.
>>> Plus there are a few fragments in the "cpr" patch that handle the suspended state that
>>> is induced by guest-suspend-ram.  See qemu_system_start_on_wake_request() and instances
>>> of RUN_STATE_SUSPENDED in migration/cpr.c
>>
>> Could you split the 'reboot' part of separately, then we can review
>> that and perhaps get it in first? It should be a relatively small patch
>> set - it'll get things moving in the right direction.
>>
>> The guest-suspend-ram stuff seems reasonable as an idea; lets just try
>> and avoid doing it all via environment variables though; make it proper
>> command line options.
> 
> How about I delete reboot mode and the mode argument instead.  Having two modes is causing no 
> end of confusion, and my primary business need is for restart mode.

I just posted V4 of the patch series, refactoring reboot mode into the first 4 patches.

- Steve

