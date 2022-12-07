Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1F26455C1
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 09:49:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2q6O-00034k-Fx; Wed, 07 Dec 2022 03:48:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1p2q6K-000340-PJ; Wed, 07 Dec 2022 03:48:24 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1p2q6G-0000EJ-Sz; Wed, 07 Dec 2022 03:48:24 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B77KNaR009282; Wed, 7 Dec 2022 08:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=BXg9asLgYbAGAjCFd6HfvGKlq6ckfxeTPyqpyXnPbok=;
 b=LBJ8eOoruyo+IxFo6vysnMgvu2ljx1xRTtA8E0oSbVUcR71aDqOt17glcfRaINsjksd8
 1MWJIcOeB+WE5auJ/Mdz2tnj4AyAJqQdylhnPwlscNUcEN04g7mOEivP5igxg3Yo6KSc
 MaMdM5/bnZ/AaGIxKwMlMOuB7kseGqf1HEnutMUIcystxiGT0HBhWBHMrmSWTmVE8Aje
 Ma8PXCPgG64lGC3moS4dFc+IcFGbqTjECFTKW4rNIiRT7bVwh+StsAkgds4M/YukPkJc
 GQy6fNRy+iKeSqOHij//j5d3iJ78pvNpH1ZO5ISc6bqsOt51eYFObcvSxsIadQG2cV0C OA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3m7ybgsx3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Dec 2022 08:47:52 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2B78jE74008226; Wed, 7 Dec 2022 08:47:52 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3maa4pf9nv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Dec 2022 08:47:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfhTuXEL9OmMxiMIDrxWYNeQWTK6bpZNgXQAOB0TtB7SeNXfFcG3rR9SnPh6Tz/L7HlJIlW+tIrpJ9XP+Dka1GUPkp5Xym+eI4Ey3p/P64EdO5fV1TTsymVhCWXtpthrqIvLTdAP67CWWhzD5PQxPIg42ukPBqxwYHTMU6ms6V/9d8h0dgdcK62JJ8RNqbRje4AbpCkgImZByO9PPd1r2RVU9F+StLikQS4xM14WzJ15i35fqjLCbUyQlUX71MPMSTK2xqp/kYe7YOQYsqLmqeMrgG+Tk3WnPSrQ5MHXpVX4BfMXVFnoXrGQexmXTRy5hKnIkmlXPTPNX7tiuzhg1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXg9asLgYbAGAjCFd6HfvGKlq6ckfxeTPyqpyXnPbok=;
 b=CJ/jGj+wrC6aiSCqrWS2wWFPfDFMFoNmUPM+sAWgjZ38h4fMbwBjY5SjmsBYiYvwxsNDlpkchNXeLolAjouRPW29isPOggrn22UiSMkDF/bFBKaMQukrxEmuTLoqlRSHsg9ZrrdUoBvigaj5gFLbdkHuIuAAyVFKof/AyxAL4FGo/MrbziZZf/5jTnQQ3mTcCpBHvpJJOm/XpHQH7GjFitraf/wHHhVLNJYR54NUElyf+VoCAVM9DwBMZ6L8dXctd45+nlHgveOdz4UgR49DkwSP1k1vCBTe4TShhXDDAsGKjrng1xGZrrWSkfw57Bofy/OZh4PZXEacePpM9aiY5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXg9asLgYbAGAjCFd6HfvGKlq6ckfxeTPyqpyXnPbok=;
 b=BSbItBN9bDzFS7GPdLrzbwfjQS8cW3ye08rxtk/2BfNeeL4mzgqEnDOpuxxM+zhRUcrxqzv4X5F9BkuywUehnbYQhBoKh5FkqbGeOMKmhS11vMYm/iGDMUaIc3YMMa0NQjTUql57SQvYYO+4430ySY2GjfYjPS3DTxTMhuiJIWY=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH8PR10MB6477.namprd10.prod.outlook.com (2603:10b6:510:22f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 08:47:47 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::4c84:639a:c88b:4c89]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::4c84:639a:c88b:4c89%9]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 08:47:47 +0000
Content-Type: multipart/alternative;
 boundary="------------fzfP30XsZTQIc0NWBqD4AHuR"
Message-ID: <fa6b712c-f785-8fc6-27a7-47f1386d51e2@oracle.com>
Date: Wed, 7 Dec 2022 03:47:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v15 1/6] qmp: add QMP command x-query-virtio
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, lvivier@redhat.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, mst@redhat.com,
 qemu_oss@crudebyte.com, kraxel@redhat.com, si-wei.liu@oracle.com,
 joao.m.martins@oracle.com, eblake@redhat.com, qemu-block@nongnu.org,
 david@redhat.com, arei.gonglei@huawei.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org,
 dgilbert@redhat.com, eric.auger@redhat.com, stefanha@redhat.com,
 boris.ostrovsky@oracle.com, kwolf@redhat.com,
 mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
References: <1660220684-24909-1-git-send-email-jonah.palmer@oracle.com>
 <1660220684-24909-2-git-send-email-jonah.palmer@oracle.com>
 <6c7189cd-b6dc-e954-f39e-b90ccb6e0361@linaro.org>
 <31d76035-3b8c-c9a1-4fd3-d3cc6af5f69c@oracle.com>
 <6c917ccc-c458-3545-de73-6f9aee132b45@linaro.org>
 <87bkolrfu6.fsf@pond.sub.org>
From: Jonah Palmer <jonah.palmer@oracle.com>
In-Reply-To: <87bkolrfu6.fsf@pond.sub.org>
X-ClientProxiedBy: BL1PR13CA0110.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::25) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4664:EE_|PH8PR10MB6477:EE_
X-MS-Office365-Filtering-Correlation-Id: 9064bd6b-9779-467c-9af7-08dad82fb70d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iRwFuS0tD35/3CyYeWk/bDcsE2rqrWXgUXDEiP4bO+7GPb/MP42O4rx7K3MHCX28b4vlACzSfCEjC8lP3gNCAJ6ZTP3sigb2Gnzrbpr35uWRhZCmfcJmdKcAV3N18o+ypawr0YmqrWzmYvYRC+JkGWwDSwiGQucEUrEUTiNT6M097LKQT/C3cF8HkvjY4YHNI441iz7tMvSGzs/AsOcSE4dkYM4fLcT7AhRGTcBTBdE9ykPFmRtZh40cdUA4WnefQeTv1IFw6CuZ9IlTbspYtrWcjd9RkKuJ9h4J1kWrcwftW4HahuzP8CDkQg+m7miXxEWrzr8mHxuWmbQBAYol8OJSqWXBU3prHQCIHo3xW7SPpB4nFWQNvcEgo1MvX7z+raWOCbqO/ukA9Vjj/inaub6nLuo4VCsxE4MmvHYYxEtm4HxNyc0K99bPsBFIKJcv4WdDTgJi+o2ZLcKoN7i3OFhr/qLzJVzlsVKCtBcWW0NpUR0sUtDRfn8JdpsL6AolsbNChyVUolSJRUr5kbgjroMMaeodKknQvoXyorWUOgqIpK7xnw6OJB30zFU7Qq8sAPawQ/MoIyb5PQDwO3trfAXdfCG2Ye0nhHex3bIm92xYikJS8PrGEtwudB+pOyC4kGyjFgXXoI+OYXgrgI79xEi4Tz97WRy+0OhNn8jUe1USLApczsC10u3M1F8hST72lmA6fijG2nc4vtfxZaVEcMfPoWa74pHZ7LKsL91Eu+MJQ2mx71TDhwbKTiFrf/X98liIXsbzmoCUJKraAlJzZJrwn7mtE/ayo+LaT8aGX00=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(396003)(376002)(136003)(366004)(451199015)(66946007)(2906002)(38100700002)(7416002)(8936002)(31686004)(44832011)(30864003)(316002)(4326008)(36756003)(8676002)(86362001)(66476007)(66556008)(166002)(66574015)(41300700001)(2616005)(5660300002)(186003)(33964004)(53546011)(6666004)(110136005)(6506007)(26005)(6512007)(83380400001)(6486002)(31696002)(478600001)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWJMUFFHTWtSZG1ZUWVXeHJlcTN0dzh3ZUFLd1IrbjI5MWl4N3FpSlJXUzUz?=
 =?utf-8?B?MzMzK2RtY2xsQTVJQS93WmRjWTNaS1V6QWZNR1NEeThvenI4Z1kveU9qbmty?=
 =?utf-8?B?WjF2NlE0aWRtYkNBQisyQjRTcDRlL0k3MjErNCs0ZDR4ckZPc245amNoRzJj?=
 =?utf-8?B?c1AwT3RkTWJrSkxSOEVMR3YrazJ3ZFBobHpHdEwvaUpVK05TU3U1c294dEQy?=
 =?utf-8?B?anR5QnhEQi9YYkppN2RGdFF1MGNaMHV6bE95aVlodXFDR3hPL2J3YjNvNmQ1?=
 =?utf-8?B?c0QxSTNlSEZ0bC9XMlNiTklLb092L3RVNkhVUkZNVDNMNFczMkRKTUt2dFpu?=
 =?utf-8?B?MG5RdUIrRDE4ZnMzVmZaakVwOWx0WUhUK3lKY3FiVEFmZkg2KzU4ZTh0dzVM?=
 =?utf-8?B?MUpwVVRmNG0wamRLRjI0akFHNWF5MlFTaU1COURuMmkvMVV0bE9DREJOL2w5?=
 =?utf-8?B?QVI0MU0vMzdvMitpbmJZdzNIKzVXRkFpZ1hZQjNHeVFmVFRrVzJFaXRNME5z?=
 =?utf-8?B?UlJpSnN4THR1TVA4VmpKQU5vbDVmcjRhSXNJVGhPUWk1VGVQeG82b0YwM20x?=
 =?utf-8?B?aGR5Tmlac0t6L3pqYXRZdkFvd3p5UHB6WC90ZU8rU0RIUXlidXhzcVNCdEVi?=
 =?utf-8?B?U1YzRWtKRHpqQWpDNDdHTFJQK2t3L1RkSGRvUmJHRi9tMS9Jc2NsbWd2S0hQ?=
 =?utf-8?B?dU5TTUJUKzg3eHl5OHYzMnRwMG9tbUpaeW12RGNIZnM5NnFRaXJEOUMxWW1K?=
 =?utf-8?B?WFF2ZnFrRDNPMmliZTB1RGE4dFc2bVg2MGVSSmFKeFlJb09BTG45bnlPN0ho?=
 =?utf-8?B?KzlhS1FzeFdpYkRqcklabUxjak1NTFVmenlSaFFNYVU4VWE0VHczR0p5ZHpt?=
 =?utf-8?B?QkFVNDBsQlpGWVAvYXprQnRRSkJBU08yeGMzUW9yTzlvQUs3RHhZWWkwbUho?=
 =?utf-8?B?eElEWCtWWituNHBnY0xDa2dDVy9zYTRiaDZtSFZ3OUt2bkxRamFuQjB0VDRx?=
 =?utf-8?B?RDZkNkFEVTJwWmRMYnIrOXltQ1d1YTY5Y1BnQ1NXSE5KbGQ2WEFET2gwMnRJ?=
 =?utf-8?B?Z2lkZ2RvTUs4cTJ0enEyTXhUSFRNSUs3aGVFTEJIcTV2OUh0UW1qaUJ5bHM2?=
 =?utf-8?B?c1c1TTlrRDRIcGNYSUxXZExoQ2xZTHZIK0VEZno0a1VpVHhoQTRodklTMlZW?=
 =?utf-8?B?c3ptTWJWNCs5V1drc281Q2FobWRnSkNib0FsR0p0VFJSam9NTzRIK2pUYlZr?=
 =?utf-8?B?OEppVkkrZUQ3UEhBZkErL0JybHV5SmIzc0NPOXk5SnBldkY0dnZ5ci9MWnQ4?=
 =?utf-8?B?Q2NKTHl5Sjh6MzN4aXhGTzhJaWk2Vy9aM3dLd3R1UGUvc1R4L01XdE5RanZE?=
 =?utf-8?B?Z29obE9GWlRkNU04Vm44ajJxZzBrOXIxdUtadTJ6UVZmd1V2QjIwaUVrMktq?=
 =?utf-8?B?Zytwa0QzRDI0SUM0VGZLeFZ6SDArZXY4WnQxbFJPQUgwS1R6Q2k1U29YT1N6?=
 =?utf-8?B?WlE0ekxQdXRneEs0dGs5MmVjSnRWRVM2WXBRQkhyeGJjSG5zSWhzNDBETWpt?=
 =?utf-8?B?VjYrUFU2TWNvdFhEM0QrK1Q5L1M4ZXFKUXhxNUFhT1BObmhxc3Q1N3RVbmFp?=
 =?utf-8?B?dG5EM2JweXVYaytKU1hBMnB1Zm1FQllma0EzQy9sYVo3cTVtTjhsdndleWV6?=
 =?utf-8?B?ZkpGK21uMVAyYis3aGVCaTgzMmdMUVBmMk13VDkvYTNrLzJJcTZYNkYwUGNt?=
 =?utf-8?B?RTdmT1ZPZzlRdWFMS3FRSUJHZUttWGFwbXl0YmYxOTZwZnB2aEZZOWg1NjFS?=
 =?utf-8?B?QlNoczVxM2NoSHZ4YmhDSzJDYXp2SG9sZWtEMWcrUFVVZndrSkdxQWh6UWVi?=
 =?utf-8?B?WVlnNXZHcmhGV2ZqK242bDFpZThqZXVPT0pzb0dxK01PMjN2d2pvbUVWWEdQ?=
 =?utf-8?B?TElSR3NwRWlhT2xXRWZjRXRneGU0cjMrMWNKMDR1QWpZQUlYUmhTZ1ovelN4?=
 =?utf-8?B?bThsSXhrR2VCRWVTMGRDRHBBTVk0cy9qRkdCaGxjYjcrSG1FbkZQaWt4ZG1M?=
 =?utf-8?B?VytFNjdTbExHajloMlZ5Y1FHRzViTERlOWpnbEpGSWhweUJoOTBMTW9FK1hy?=
 =?utf-8?Q?Ukvm1Ag28fcylBmr4QG8h6FPk?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?UXBtcTZEakRWY1pNMzhTbG0rdzRLaHFTRm94d0phSkt2SnVRbVBoYVg5TFU1?=
 =?utf-8?B?ZktsOGpYdmFzUkp3MksyWXpzSW14N05NK0ZrSlhWZ2ppRmpiZU1VK2xPMWZ0?=
 =?utf-8?B?djVxb3RtU1p5alpRM3doYU5vcmJTUEc4WGljK2lLNWNGQVR5Vm5NR2lkTVJH?=
 =?utf-8?B?a2NFRlpOcHVHaFdtQ3ByRnNHT3ZhQXhvTEJuTXZ6QStabWxKS1A1TGVtNlVL?=
 =?utf-8?B?RDdkQ1RKTlJyYlQyNHRhUTRDTFg4SjlSS1c3dGRTRlRkeFhJdkg2QldEV044?=
 =?utf-8?B?ZlZwUDUvVHNJQkRQczA2bEZaM2I1N21jZmVVTWo4M1lWMU5ZV2g1VXpnT0sz?=
 =?utf-8?B?QVlid2lhQ1ppVTRxbStyb1VDUWNJRC9aRzFrbVREQmJ4VGp6Wm1YZWJLRXM0?=
 =?utf-8?B?WHQxa0NNZ3VZejNNWlJKL0VNeDUrT0g2NTRiaGIrWEE1K2tCTDkvb1Vub3Q5?=
 =?utf-8?B?UHhYK2loNmFnQ0I0YWhSbDlwU2l4SUNkUGdnakY4UlhSL2hCN282bWpXTVdp?=
 =?utf-8?B?TjZuNVZpYjIvYzQwVE03WHlJZjdPVW1tUlNWQUhhYVh0Rlo5QXVtdWhSMXF5?=
 =?utf-8?B?UVJ3L3h1cWNZMkY5WmNCUFc1Mk5Td3dMUS9qL0g0WUR1UFRFMkJ2NkZNdXVz?=
 =?utf-8?B?dVJXUk8wVGd5TzlOSDczS29pQ3pZZ3Ntd1VvejM3eWN5TDlLQXIvb3o5MVo0?=
 =?utf-8?B?WkdFRW1nbjVBQnMyVlNpQkZuMm5JdGZ4SndyM3RsVFFkeWFYVlBKdHJoK1U5?=
 =?utf-8?B?V0pPMFhwVElqZVlXUkh4Uk84Z3UvVC9nUEJGU0RsVXd4cWFmblQwN1huYVRw?=
 =?utf-8?B?ZVFiRStjcDBxaGZkdnlyZjkwendRbm5Kb2lVQnBrY1d5NG5wNEZEMVdrL3Mz?=
 =?utf-8?B?Ky9UbkpVNWdzRXVXd2VyVnE2bDdLREJGVEpnTzEwbGQ3clhidjFudGxGVnUr?=
 =?utf-8?B?V0o3dzdEamNFeDlLcWo2SFVtYktsTjI0U293bjRWVzRjWC9Wb29NOW9RV1lm?=
 =?utf-8?B?QXB6dXREbDRTYTUwSWY0anVRc0VwcG1lR1RvbDIwbDlQUWhqaDhGL2dKSVNp?=
 =?utf-8?B?ZVhEUFpIUE9OSkJKMytxdDlqdzNraWd2MkE4Q253bFRvSzFzVUJkZURPREpP?=
 =?utf-8?B?Y2tjdGZIMC9pVDZiVyt3U0t4ZzJVZHdzZlhLNnF0L1RrRmk3MUh3YWZCaE1O?=
 =?utf-8?B?Uk16NHJaRmxlZVoxWUd0R0JxUlVVZkQyNURtazVLWGRKdGc3WjRIRkV4THhY?=
 =?utf-8?B?ZWMvL2p0bEZjUkE0UkJCbDJ3bGNLaGY3SjdXZ3FZcVVlVUZsaVRjSjBaSzQw?=
 =?utf-8?B?ckdON2VKQUZUUmg4MGNQaDZkUWJGNmxZSDMvR1dSbjNtbDh3SnppMUJJNkpu?=
 =?utf-8?B?TzhYSzNNQkNwMm8vbzlaMzN0NkVWejI5QkJ6aW01UEk0bE9GamROOFBKeTRD?=
 =?utf-8?B?ZFVleERqU0docUp1NnZiY0xHS2Ira0NZSTJYUU9WYUdVNzh5bUJTMWU1aUhx?=
 =?utf-8?B?NFZVQWZWdm1ieEw2MjhqZHdUN3c5OGxNb0hXK01yVkxFdWV3NVQrb0NXUkZu?=
 =?utf-8?B?ZEdZOU82aUo1UjA3bUxvajJlYVY4a2JkK1hCeE5pVzZOaWNIa29yMTRXTkxu?=
 =?utf-8?B?cEZIcHNya2NFMW16SmN1elg2RjgvWUplZ05iWHdwTVcrV0k2ZGNseUZ0N24y?=
 =?utf-8?B?VVh0TWVUb2lDdG5DK2JnajFXa055M0E3NFhqbUpiYTVJd2Ztc1lEYURNMGFZ?=
 =?utf-8?B?dkV6REdDOFMwVHRqRWVjdzdEb1Nac0xGUUFoZm1WOFlPNXpESjJteTU0dUJB?=
 =?utf-8?B?ZFZXNDNHVmEvRTNMemM4b2FrbVlrSFI1OEF5Q0pTNDFtVDZ5Sm12aGcyR0pt?=
 =?utf-8?Q?xXSBJeMNUA7ak?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9064bd6b-9779-467c-9af7-08dad82fb70d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 08:47:47.5510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MpCzarnqk2qGP0xTsijgNwgRjwSOR0knDqwBCHh65YbqwrsB9w28r5XoUxPMPcHh8i+d0OaOuftOYYUr6zNhsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6477
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_04,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212070072
X-Proofpoint-ORIG-GUID: zL_TjHVP5X6abSOdPRO2RcgakunBzF1X
X-Proofpoint-GUID: zL_TjHVP5X6abSOdPRO2RcgakunBzF1X
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.27, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--------------fzfP30XsZTQIc0NWBqD4AHuR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/2/22 10:21, Markus Armbruster wrote:
> Philippe Mathieu-Daudé<philmd@linaro.org>  writes:
>
>> On 2/12/22 13:23, Jonah Palmer wrote:
>>> On 11/30/22 11:16, Philippe Mathieu-Daudé wrote:
>>>> Hi,
>>>>
>>>> On 11/8/22 14:24, Jonah Palmer wrote:
>>>>> From: Laurent Vivier<lvivier@redhat.com>
>>>>>
>>>>> This new command lists all the instances of VirtIODevices with
>>>>> their canonical QOM path and name.
>>>>>
>>>>> [Jonah: @virtio_list duplicates information that already exists in
>>>>>    the QOM composition tree. However, extracting necessary information
>>>>>    from this tree seems to be a bit convoluted.
>>>>>
>>>>>    Instead, we still create our own list of realized virtio devices
>>>>>    but use @qmp_qom_get with the device's canonical QOM path to confirm
>>>>>    that the device exists and is realized. If the device exists but
>>>>>    is actually not realized, then we remove it from our list (for
>>>>>    synchronicity to the QOM composition tree).
> How could this happen?
>
>>>>>    Also, the QMP command @x-query-virtio is redundant as @qom-list
>>>>>    and @qom-get are sufficient to search '/machine/' for realized
>>>>>    virtio devices. However, @x-query-virtio is much more convenient
>>>>>    in listing realized virtio devices.]
>>>>>
>>>>> Signed-off-by: Laurent Vivier<lvivier@redhat.com>
>>>>> Signed-off-by: Jonah Palmer<jonah.palmer@oracle.com>
>>>>> ---
>>>>>    hw/virtio/meson.build      |  2 ++
>>>>>    hw/virtio/virtio-stub.c    | 14 ++++++++
>>>>>    hw/virtio/virtio.c         | 44 ++++++++++++++++++++++++
>>>>>    include/hw/virtio/virtio.h |  1 +
>>>>>    qapi/meson.build           |  1 +
>>>>>    qapi/qapi-schema.json      |  1 +
>>>>>    qapi/virtio.json           | 68 ++++++++++++++++++++++++++++++++++++++
>>>>>    tests/qtest/qmp-cmd-test.c |  1 +
>>>>>    8 files changed, 132 insertions(+)
>>>>>    create mode 100644 hw/virtio/virtio-stub.c
>>>>>    create mode 100644 qapi/virtio.json
>>>>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>>>>> index 5d607aeaa0..bdfa82e9c0 100644
>>>>> --- a/hw/virtio/virtio.c
>>>>> +++ b/hw/virtio/virtio.c
>>>>> @@ -13,12 +13,18 @@
>>>>>      #include "qemu/osdep.h"
>>>>>    #include "qapi/error.h"
>>>>> +#include "qapi/qmp/qdict.h"
>>>>> +#include "qapi/qapi-commands-virtio.h"
>>>>> +#include "qapi/qapi-commands-qom.h"
>>>>> +#include "qapi/qapi-visit-virtio.h"
>>>>> +#include "qapi/qmp/qjson.h"
>>>>>    #include "cpu.h"
>>>>>    #include "trace.h"
>>>>>    #include "qemu/error-report.h"
>>>>>    #include "qemu/log.h"
>>>>>    #include "qemu/main-loop.h"
>>>>>    #include "qemu/module.h"
>>>>> +#include "qom/object_interfaces.h"
>>>>>    #include "hw/virtio/virtio.h"
>>>>>    #include "migration/qemu-file-types.h"
>>>>>    #include "qemu/atomic.h"
>>>>> @@ -29,6 +35,9 @@
>>>>>    #include "sysemu/runstate.h"
>>>>>    #include "standard-headers/linux/virtio_ids.h"
>>>>>    +/* QAPI list of realized VirtIODevices */
>>>>> +static QTAILQ_HEAD(, VirtIODevice) virtio_list;
>>>>> +
>>>>>    /*
>>>>>     * The alignment to use between consumer and producer parts of vring.
>>>>>     * x86 pagesize again. This is the default, used by transports like PCI
>>>>> @@ -3698,6 +3707,7 @@ static void virtio_device_realize(DeviceState *dev, Error **errp)
>>>>>        vdev->listener.commit = virtio_memory_listener_commit;
>>>>>        vdev->listener.name = "virtio";
>>>>>        memory_listener_register(&vdev->listener, vdev->dma_as);
>>>>> +    QTAILQ_INSERT_TAIL(&virtio_list, vdev, next);
>>>>>    }
>>>>>      static void virtio_device_unrealize(DeviceState *dev)
>>>>> @@ -3712,6 +3722,7 @@ static void virtio_device_unrealize(DeviceState *dev)
>>>>>            vdc->unrealize(dev);
>>>>>        }
>>>>>    +    QTAILQ_REMOVE(&virtio_list, vdev, next);
>>>>>        g_free(vdev->bus_name);
>>>>>        vdev->bus_name = NULL;
>>>>>    }
>>>>> @@ -3885,6 +3896,8 @@ static void virtio_device_class_init(ObjectClass *klass, void *data)
>>>>>        vdc->stop_ioeventfd = virtio_device_stop_ioeventfd_impl;
>>>>>          vdc->legacy_features |= VIRTIO_LEGACY_FEATURES;
>>>>> +
>>>>> +    QTAILQ_INIT(&virtio_list);
>>>>>    }
>>>>>      bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
>>>>> @@ -3895,6 +3908,37 @@ bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
>>>>>        return virtio_bus_ioeventfd_enabled(vbus);
>>>>>    }
>>>>>    +VirtioInfoList *qmp_x_query_virtio(Error **errp)
>>>>> +{
>>>>> +    VirtioInfoList *list = NULL;
>>>>> +    VirtioInfoList *node;
>>>>> +    VirtIODevice *vdev;
>>>>> +
>>>>> +    QTAILQ_FOREACH(vdev, &virtio_list, next) {
>>>>> +        DeviceState *dev = DEVICE(vdev);
>>>>> +        Error *err = NULL;
>>>>> +        QObject *obj = qmp_qom_get(dev->canonical_path, "realized", &err);
>>>>> +
>>>>> +        if (err == NULL) {
>>>>> +            GString *is_realized = qobject_to_json_pretty(obj, true);
>>>>> +            /* virtio device is NOT realized, remove it from list */
>>>> Why not check dev->realized instead of calling qmp_qom_get() & qobject_to_json_pretty()?
>>> This check queries the QOM composition tree to check that the device actually exists and is
>>> realized. In other words, we just want to confirm with the QOM composition tree for the device.
> Again, how could this happen?
>
> If @virtio_list isn't reliable, why have it in the first place?

Honestly, I'm not sure how this even could happen, since the @virtio_list is managed at the realization
and unrealization of a virtio device. Given this, I do feel as though the list is reliable, although
this might just benaïve of me to say. After giving this a second look, the @virtio_list is 
only really needed to provide a nice list of all realized virtio devices 
on the system, along with their full canonical paths. If the user can 
find the canonical path of a virtio device by searching the QOM 
composition tree, and assuming we can get a @VirtioDevice object (in 
code) from this canonical path, then the rest of the QMP/HMP features of 
these patches could be done by solely by searching the QOM composition 
tree. However, I think having this list of realized virtio devices as a 
subset of the QOM composition tree is worth its weight, since the user 
no longer has to search the entire tree to find virtio devices and piece 
together their canonical paths. Of course, if we're somehow able to 
generate a similar list in code by searching the QOM composition tree, 
then there would be no need for this @virtio_list. However, it's really 
not clear how, or if, such a list could be generated by parsing the QOM 
composition tree.

>>> This was done to have some kind of synchronicity between @virtio_list and the QOM composition
>>> tree, since the list duplicates information that already exists in the tree.
>>> This check was recommended in v10 and added in v11 of this patch series.
>> Thanks, I found Markus comments:
>>
>> v10:
>> https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/87ee6ogbiw.fsf@dusky.pond.sub.org/__;!!ACWV5N9M2RV99hQ!LqeLFhE8PtTTg_qKRuP9Kgz5pyTNZLhYeRzp4a2oS8c3D5W8-irZoBW0L_Lf1ozm3qYidYhuVrjxjsAw$  
> My recommendation there was to *delete* virtio_list and search the QOM
> composition tree instead:
>
>      @virtio_list duplicates information that exists in the QOM composition
>      tree.  It needs to stay in sync.  You could search the composition tree
>      instead.
>
> The QOM composition tree is the source of truth.
>
> This above is about the command's implementation, and ...
>
>> v11:
>> https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/87ee4abtdu.fsf@pond.sub.org/__;!!ACWV5N9M2RV99hQ!LqeLFhE8PtTTg_qKRuP9Kgz5pyTNZLhYeRzp4a2oS8c3D5W8-irZoBW0L_Lf1ozm3qYidYhuVmVCuHjV$  
>>
>> Having the justification from v11 in the code rather than the commit
>> description could help.
> ... this part is about why the command could be useful.
>
> [...]
>
--------------fzfP30XsZTQIc0NWBqD4AHuR
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/2/22 10:21, Markus Armbruster
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87bkolrfu6.fsf@pond.sub.org">
      <pre class="moz-quote-pre" wrap="">Philippe Mathieu-Daudé <a class="moz-txt-link-rfc2396E" href="mailto:philmd@linaro.org">&lt;philmd@linaro.org&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 2/12/22 13:23, Jonah Palmer wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On 11/30/22 11:16, Philippe Mathieu-Daudé wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Hi,

On 11/8/22 14:24, Jonah Palmer wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">From: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>

This new command lists all the instances of VirtIODevices with
their canonical QOM path and name.

[Jonah: @virtio_list duplicates information that already exists in
&nbsp; the QOM composition tree. However, extracting necessary information
&nbsp; from this tree seems to be a bit convoluted.

&nbsp; Instead, we still create our own list of realized virtio devices
&nbsp; but use @qmp_qom_get with the device's canonical QOM path to confirm
&nbsp; that the device exists and is realized. If the device exists but
&nbsp; is actually not realized, then we remove it from our list (for
&nbsp; synchronicity to the QOM composition tree).
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
How could this happen?

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">
&nbsp; Also, the QMP command @x-query-virtio is redundant as @qom-list
&nbsp; and @qom-get are sufficient to search '/machine/' for realized
&nbsp; virtio devices. However, @x-query-virtio is much more convenient
&nbsp; in listing realized virtio devices.]

Signed-off-by: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>
Signed-off-by: Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a>
---
&nbsp; hw/virtio/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 ++
&nbsp; hw/virtio/virtio-stub.c&nbsp;&nbsp;&nbsp; | 14 ++++++++
&nbsp; hw/virtio/virtio.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 44 ++++++++++++++++++++++++
&nbsp; include/hw/virtio/virtio.h |&nbsp; 1 +
&nbsp; qapi/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +
&nbsp; qapi/qapi-schema.json&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +
&nbsp; qapi/virtio.json&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 68 ++++++++++++++++++++++++++++++++++++++
&nbsp; tests/qtest/qmp-cmd-test.c |&nbsp; 1 +
&nbsp; 8 files changed, 132 insertions(+)
&nbsp; create mode 100644 hw/virtio/virtio-stub.c
&nbsp; create mode 100644 qapi/virtio.json
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 5d607aeaa0..bdfa82e9c0 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -13,12 +13,18 @@
&nbsp; &nbsp; #include &quot;qemu/osdep.h&quot;
&nbsp; #include &quot;qapi/error.h&quot;
+#include &quot;qapi/qmp/qdict.h&quot;
+#include &quot;qapi/qapi-commands-virtio.h&quot;
+#include &quot;qapi/qapi-commands-qom.h&quot;
+#include &quot;qapi/qapi-visit-virtio.h&quot;
+#include &quot;qapi/qmp/qjson.h&quot;
&nbsp; #include &quot;cpu.h&quot;
&nbsp; #include &quot;trace.h&quot;
&nbsp; #include &quot;qemu/error-report.h&quot;
&nbsp; #include &quot;qemu/log.h&quot;
&nbsp; #include &quot;qemu/main-loop.h&quot;
&nbsp; #include &quot;qemu/module.h&quot;
+#include &quot;qom/object_interfaces.h&quot;
&nbsp; #include &quot;hw/virtio/virtio.h&quot;
&nbsp; #include &quot;migration/qemu-file-types.h&quot;
&nbsp; #include &quot;qemu/atomic.h&quot;
@@ -29,6 +35,9 @@
&nbsp; #include &quot;sysemu/runstate.h&quot;
&nbsp; #include &quot;standard-headers/linux/virtio_ids.h&quot;
&nbsp; +/* QAPI list of realized VirtIODevices */
+static QTAILQ_HEAD(, VirtIODevice) virtio_list;
+
&nbsp; /*
&nbsp;&nbsp; * The alignment to use between consumer and producer parts of vring.
&nbsp;&nbsp; * x86 pagesize again. This is the default, used by transports like PCI
@@ -3698,6 +3707,7 @@ static void virtio_device_realize(DeviceState *dev, Error **errp)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vdev-&gt;listener.commit = virtio_memory_listener_commit;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vdev-&gt;listener.name = &quot;virtio&quot;;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memory_listener_register(&amp;vdev-&gt;listener, vdev-&gt;dma_as);
+&nbsp;&nbsp;&nbsp; QTAILQ_INSERT_TAIL(&amp;virtio_list, vdev, next);
&nbsp; }
&nbsp; &nbsp; static void virtio_device_unrealize(DeviceState *dev)
@@ -3712,6 +3722,7 @@ static void virtio_device_unrealize(DeviceState *dev)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vdc-&gt;unrealize(dev);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
&nbsp; +&nbsp;&nbsp;&nbsp; QTAILQ_REMOVE(&amp;virtio_list, vdev, next);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_free(vdev-&gt;bus_name);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vdev-&gt;bus_name = NULL;
&nbsp; }
@@ -3885,6 +3896,8 @@ static void virtio_device_class_init(ObjectClass *klass, void *data)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vdc-&gt;stop_ioeventfd = virtio_device_stop_ioeventfd_impl;
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vdc-&gt;legacy_features |= VIRTIO_LEGACY_FEATURES;
+
+&nbsp;&nbsp;&nbsp; QTAILQ_INIT(&amp;virtio_list);
&nbsp; }
&nbsp; &nbsp; bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
@@ -3895,6 +3908,37 @@ bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return virtio_bus_ioeventfd_enabled(vbus);
&nbsp; }
&nbsp; +VirtioInfoList *qmp_x_query_virtio(Error **errp)
+{
+&nbsp;&nbsp;&nbsp; VirtioInfoList *list = NULL;
+&nbsp;&nbsp;&nbsp; VirtioInfoList *node;
+&nbsp;&nbsp;&nbsp; VirtIODevice *vdev;
+
+&nbsp;&nbsp;&nbsp; QTAILQ_FOREACH(vdev, &amp;virtio_list, next) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DeviceState *dev = DEVICE(vdev);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Error *err = NULL;
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; QObject *obj = qmp_qom_get(dev-&gt;canonical_path, &quot;realized&quot;, &amp;err);
+
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err == NULL) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GString *is_realized = qobject_to_json_pretty(obj, true);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* virtio device is NOT realized, remove it from list */
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
Why not check dev-&gt;realized instead of calling qmp_qom_get() &amp; qobject_to_json_pretty()?
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
This check queries the QOM composition tree to check that the device actually exists and is
realized. In other words, we just want to confirm with the QOM composition tree for the device.
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Again, how could this happen?

If @virtio_list isn't reliable, why have it in the first place?
</pre>
    </blockquote>
    <pre>Honestly, I'm not sure how this even could happen, since the @virtio_list is managed at the realization
and unrealization of a virtio device. Given this, I do feel as though the list is reliable, although
this might just be <span><span><span class="kqEaA z8gr9e">naïve of me to say.

After giving this a second look, the @virtio_list is only really needed to provide a nice list of all
realized virtio devices on the system, along with their full canonical paths. If the user can find
the canonical path of a virtio device by searching the QOM composition tree, and assuming we can get
a @VirtioDevice object (in code) from this canonical path, then the rest of the QMP/HMP features of
these patches could be done by solely by searching the QOM composition tree.

However, I think having this list of realized virtio devices as a subset of the QOM composition tree
is worth its weight, since the user no longer has to search the entire tree to find virtio devices
and piece together their canonical paths.

Of course, if we're somehow able to generate a similar list in code by searching the QOM composition
tree, then there would be no need for this @virtio_list. However, it's really not clear how, or if,
such a list could be generated by parsing the QOM composition tree.
</span></span></span></pre>
    <blockquote type="cite" cite="mid:87bkolrfu6.fsf@pond.sub.org">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">This was done to have some kind of synchronicity between @virtio_list and the QOM composition
tree, since the list duplicates information that already exists in the tree.
This check was recommended in v10 and added in v11 of this patch series.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Thanks, I found Markus comments:

v10:
<a class="moz-txt-link-freetext" href="https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/87ee6ogbiw.fsf@dusky.pond.sub.org/__;!!ACWV5N9M2RV99hQ!LqeLFhE8PtTTg_qKRuP9Kgz5pyTNZLhYeRzp4a2oS8c3D5W8-irZoBW0L_Lf1ozm3qYidYhuVrjxjsAw$">https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/87ee6ogbiw.fsf@dusky.pond.sub.org/__;!!ACWV5N9M2RV99hQ!LqeLFhE8PtTTg_qKRuP9Kgz5pyTNZLhYeRzp4a2oS8c3D5W8-irZoBW0L_Lf1ozm3qYidYhuVrjxjsAw$</a> 
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
My recommendation there was to *delete* virtio_list and search the QOM
composition tree instead:

    @virtio_list duplicates information that exists in the QOM composition
    tree.  It needs to stay in sync.  You could search the composition tree
    instead. 

The QOM composition tree is the source of truth.

This above is about the command's implementation, and ...

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">v11:
<a class="moz-txt-link-freetext" href="https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/87ee4abtdu.fsf@pond.sub.org/__;!!ACWV5N9M2RV99hQ!LqeLFhE8PtTTg_qKRuP9Kgz5pyTNZLhYeRzp4a2oS8c3D5W8-irZoBW0L_Lf1ozm3qYidYhuVmVCuHjV$">https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/87ee4abtdu.fsf@pond.sub.org/__;!!ACWV5N9M2RV99hQ!LqeLFhE8PtTTg_qKRuP9Kgz5pyTNZLhYeRzp4a2oS8c3D5W8-irZoBW0L_Lf1ozm3qYidYhuVmVCuHjV$</a> 

Having the justification from v11 in the code rather than the commit
description could help.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
... this part is about why the command could be useful.

[...]

</pre>
    </blockquote>
  </body>
</html>

--------------fzfP30XsZTQIc0NWBqD4AHuR--

