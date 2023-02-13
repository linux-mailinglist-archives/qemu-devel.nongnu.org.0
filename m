Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C080693E83
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 07:52:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRSgG-0005ks-Om; Mon, 13 Feb 2023 01:51:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1pRSg5-0005iR-Sz
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 01:51:05 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1pRSfz-0006Uv-Tj
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 01:51:05 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31D1iJGC026033; Mon, 13 Feb 2023 06:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=k7CEHN+MdKpCGd/V9BSbt93UHPN1YRDHyAnXO/weJSQ=;
 b=kzc/l32Kz+HjJBPy3e9QS5kBSIQdB1UKZD5l2hiUcLpy0vjcpkytr5lXlZCnvv0hqg2/
 jwDXqeqBFJzROFQ4WfS1qqUlxHLl+OIoi7gXnd4Bqj8IpPdHEO6XC/U1kwC8DOqFYsUg
 bBABo8jHVOvWh34/63piNp/iCTDJkgJ2Pxai/MtuAzd+EAqcnkJwIyfNsoD0azv2dv8k
 3NzvvzzGvsGxd5L0goNxnbOL+7VuxpHyTf6BMio2HvXH3RV1h5TM0CjT9DhwhkMkwm4C
 p8gbFYWcG5cmqCzKqBLY7wSvSisWOkUlLxo6TR3eHTTR7zltSi5C8iAZ/bgcqM/qiv74 OQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np1m0t46y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 06:50:39 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31D6IPFK032783; Mon, 13 Feb 2023 06:50:38 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3np1f3q0md-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 06:50:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e92k2RBkoG87VjKIDv73CkEJnx99iAbIeTZYeDBxUWfry+jCinasoWhBSi8ccxngmLLUiIjskp0ntkXwwYbUjZxnCLXBsaRAcBSWxyZdP8Ge081npC7yg3McOoLC6DZc2yHTmNFC2gpJAlQON2OKWN18x06BRSVtrzUPwAIjuivygWKayfx/g7kqx0x2oexq0hY5VCPTCapd6lp+LFbBv2xMgShHOmjdBdbzELgQM8RA/xT29l6fC2c25+AP+6du68xpygqsCsd4PYBcZiq4at78q3wQ0EQMzituvW3Q1msP4cwjOAddSSiayDW1eYmYPSGaMXgym0XN/ErC1iA4DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7CEHN+MdKpCGd/V9BSbt93UHPN1YRDHyAnXO/weJSQ=;
 b=P0tb1bZqxgUug12839zCu863OEJxH4npthH9Mogg+kjknAMbQD7OBu/xNFrs72vAgi2O/ctRgGrFv34iApcGa5d9gy3YzlCn/4EArm9e+ZxekORFQp9pYP7up0FeE2mov3MAX9uiiSjzD43lQsaCjA59PSuE40Q62Kz9QbCiYx0q2vcJMU6PLDbs8ZKmzMVSvJfgDcFb7aHd1sJzspY3oYa4csMXCMg6Zd+V9jYHVVPdHpR03YIQHYIvoS8C9GiJS+kXYJ1Iw4OTrLoZNXhhTbk7y3WsZu8tb2cpJ1WIxL+R29pgdo0unNf8IdSVwoZWmDGugqaFHDwlO9sBozW08A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7CEHN+MdKpCGd/V9BSbt93UHPN1YRDHyAnXO/weJSQ=;
 b=ZnU30ges56E4J4hSDwSV1cujGRjNqK75Sqt01FFr02OOhSS19EesMlZC4ZsLlFa9JAgRatQmszhFVk97fbTsH4SugO0NNZDtpbz3ZX4UZLDYEaVDxW6jIvcgD9lyt4kngpjNuBKHknXa0raGkqgQ9IYGjKOXuaJDlrwop7HiM20=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by MN2PR10MB4272.namprd10.prod.outlook.com (2603:10b6:208:1dc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.10; Mon, 13 Feb
 2023 06:50:36 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::25da:8594:cf75:8ef3]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::25da:8594:cf75:8ef3%9]) with mapi id 15.20.6111.010; Mon, 13 Feb 2023
 06:50:35 +0000
Message-ID: <a71b4dfc-67ea-ef8b-023b-8e18638bd8b2@oracle.com>
Date: Sun, 12 Feb 2023 22:50:30 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 01/13] vdpa net: move iova tree creation from init to
 start
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>,
 alvaro.karsz@solid-run.com, Zhu Lingshan <lingshan.zhu@intel.com>,
 Lei Yang <leiyang@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>,
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, longpeng2@huawei.com,
 virtualization@lists.linux-foundation.org,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20230208094253.702672-1-eperezma@redhat.com>
 <20230208094253.702672-2-eperezma@redhat.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20230208094253.702672-2-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR07CA0111.namprd07.prod.outlook.com
 (2603:10b6:5:330::12) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|MN2PR10MB4272:EE_
X-MS-Office365-Filtering-Correlation-Id: e6039284-4c75-4656-11be-08db0d8e9bf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PI6cskVVsMtGkrS4BfpRVo2RHEcRgWX7WOfiLU0BSxWdpKJe3piGc2tKr0dkiqUhEjL5NArTwOgF/WPKLkBr1kMlpZfEaHpPor99pHQvbnX1d+C/NehXg73DwH38/eeQyOQcQ6BsN8vs2xQxxjUTNoSqKoFtvdlI/nTvOQ0USb0rG4mz2TEhWx2DZ4Rm19vYas/b0fWQIB+J6JI/9Y7fFH5ezY9Y/7NqomOqUY3qNZ2UA9yQpq1ZGtzV0RghtYNTdroUEf+fPEJyY64H8nC6wD+IY7gVHmUkWajGs4agWJ2pxcN5VaYzJqeM6pdc6qONWGsCyuIAQkmevnqKD5z9ud4L8oPFcvgVsPvpi6ypfa+FJ+4HfffNqXKvnr+Y+6Z24xcHW1oUVO5xhHO2KK+osA8SsnrmW8CtR7/sck9WO2xLfR4JETKSIcFEjtudKBYeDmmx7El6mMh2AGhUYsfSF4UNJTbsxyWSM6U35ktdqAttthI6u+amfn0WyRmbtW0FDkugVV4ISouug4D8br4RoHUBCer0/LTR+K+AOki04zwISRqhoGEbRNNqf/tuEGV/YvAJyGJVDLv4bir2JJI3RxMq4w0Xg7mlEoaYD9t5Q/1hE5qw/pX27WiWKp98L0Be4OqheCd+RDTJKhRZ/wRypc3nQDtHA1QD7KpsxnGmZUuI5ZWszk0FQqrF6CMYGkicGlOuwDBVpSv8cClHonvo7KLJb9hud1p/m4oy83MebqI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6535.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199018)(38100700002)(86362001)(31696002)(36756003)(2906002)(41300700001)(66476007)(4326008)(8676002)(5660300002)(7416002)(8936002)(66556008)(36916002)(2616005)(66946007)(6512007)(6506007)(26005)(186003)(53546011)(83380400001)(66574015)(6666004)(54906003)(316002)(478600001)(6486002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWV0cktjOTQwY1Y5N3RnSWYxZm4rb3ByWDluNDRvMkZpUDg1MStobkxWcTlq?=
 =?utf-8?B?VDFxK0FRT0dSTXhiTHBuWjFWcE14bmUrTWR1ZTIzbzF6S3A5VDEzZStSTnJ2?=
 =?utf-8?B?N1V2L0NTZGVsanFkeC9kWU5hVDJlcCtFYU5JSVJrSEN5aExFVVlPU2Q5UHpM?=
 =?utf-8?B?eC95NnpLMUFRdGZDNWVENlcrQWZOYU83Qmh2c1hld2hyd2d1dEwvTHR3WTBT?=
 =?utf-8?B?Njlsek01UUxYNi9FWXlDV0ZKdGlSTm1oNXlPcTFTdGZMV2czcVpzZlZVTTFW?=
 =?utf-8?B?eGtYK2hycEp5aWU1UEtMUnd0ZXVMa0JWM2p2ckxSRTM2dVY1ZndYOHNmLzFq?=
 =?utf-8?B?U3lIMUloN0dmNzBXSS9mbjR3bFZyN243TXB4UDNzM29JUWxKQ3pQank5cy9m?=
 =?utf-8?B?MGJaOTMvYm5lQk54bWx1ZXhKNll2TGpkMGlheWh3UU1yV1NIbFM3VnViT2tP?=
 =?utf-8?B?SnE0K3hhZDVGQ2oyR0prNy9ZWWtaaVJtVk1lTVAvRmtRZlZkM3hJTWZ6MUJk?=
 =?utf-8?B?UytTQTdDUUVsTSszODZkK1prWUJ0Q21YZjJ6N3FZc04xUllST21QbGJTZDdK?=
 =?utf-8?B?M0lLZmJYbU9zLzFJblIwTUJJV1Z0OUVlRkVlUXNEMGliWThmTUhXZmNuTTN4?=
 =?utf-8?B?SW9KcnJCR3M3dTRGL0gyMGEyRU1CV2UvTVVIbU8vRDZJQUNLcENNZytqdDNX?=
 =?utf-8?B?dU95K0pkZ2Y5RnBWbUowQVJSRkV0VkMySTdTSytsRDd3VUYxYkZ4d0daNmVJ?=
 =?utf-8?B?Vk1tNnltd25DK25BZTR4d05lOHBOVDIxWUs2clhEQ2ljWSt4ZGRONm5YKzh5?=
 =?utf-8?B?VzhxVHlNaGI4QnNCYTJBTFIxTkR5Q0ZqRldudno3enRvRm5rY29KTkNrb01Y?=
 =?utf-8?B?eTloTExwM29XRi9CUnlENElaRjdTQjJjZEJGajZEM21nUFlwcndoeEY0emp0?=
 =?utf-8?B?VkpaWFZEUEIyTWR4bHNMRjZZdWdIQlhUQ3FaUGlUaHBWeUpzdEt6My9nd1hG?=
 =?utf-8?B?cmtLM1dXZ3BSNnVkRE5DbkwxVmx3SUg1MUxMQXM1R2t0V0QzSHN0cEJaTnRC?=
 =?utf-8?B?NEkyUkw1U1lOZU50YlVjTFlXd1FZZ3RtaXMySW8rMjVxUzFLOVkvNVNGWVFE?=
 =?utf-8?B?TGwvdk1aTjR0d2FBanJ6cEhDWThFaFlkandBRVZ3VUgyUkxxamNWRk1kVDU3?=
 =?utf-8?B?SWIxVEx4Z0JwWjZVK1loZW9YQzkrUTQ3T0JqRldubWxqNGpPN0lQTzNxTjNw?=
 =?utf-8?B?M01aSm5LWkpzTnN5anlsNU5lU3BXOFNTNDBzODZnUFlTTDk3UjBvWGZZdXJL?=
 =?utf-8?B?VHlHaFhTb1BGVWx6ZEQzRnRic1RxMzdvVjQ0MzRleEMxeDFpSzdDOTU2bnhX?=
 =?utf-8?B?d2IzazBTRVRKOUgxQmxUd1V3b2pYTW5teDNMdmlyZWt6TTBKbTQ3OHRQcnQv?=
 =?utf-8?B?TmNLUFNpblpXNFpUZmhiTkVZZVN3elh6M1hWVUlaZjdDK2t5eW1Mdm42VHVi?=
 =?utf-8?B?dWN2TFJLRGx5YUNZVFJmS1FhNW1COEZIaGExbGJ5UHB6WjYreUdMOEFvZlFD?=
 =?utf-8?B?TTNwQVNOVVFUT0trMzF2dDIxRk8wZlk4MThmL1lIKzMweWtZd281RWRVYXcx?=
 =?utf-8?B?b29CSmdreFhtL2ZHUDE2UTVtNWRCWk5FYzdwZzJrdTZFRUtoR3VweTJuSFh3?=
 =?utf-8?B?bGhSNm85SE4xa0Z2Y3lPUWNZNC9GZUZ3YmFoRFRnZG8zN0JrS1M4d0ZFRG10?=
 =?utf-8?B?WXpkelEyM3MwbStsKzdldjBlOWp6bW1rOWVaem1DaU80TzhZSlJqTjBOREto?=
 =?utf-8?B?ZndoZGJvWmUvaFkxcXZPa1V6K0lHL1dqUTg1V3J2SjBzdVJEbHB0czJCQkVn?=
 =?utf-8?B?Y3R6aVArME9nckNDWGozcG1DSDlrWXFuS3BvYUdzMllsNEI3MmY1bzlqZVRT?=
 =?utf-8?B?QUFROXlVUzY0NFczT2dVNVVlbDEyTG5BbHpuSDJUQmxzZS9pVFJGL3N0MDcy?=
 =?utf-8?B?V3pvOE5JUXRGd0c3RlNjSDdmZlU5cGFVV0RJRVNQK29jQkdod0dUS3lFMFIw?=
 =?utf-8?B?bU5uazdrMDFOTDh4aWtZQVNMUVM1OU01ZlBVNmJrdDB2ZURhTVpHa1FvTUVN?=
 =?utf-8?Q?EIwdrhXFHP2r8jzKkbEqpPahd?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?VWErREJyZUdyaWo3WDRIOVkyMTlZR1ZJZHJEVnJtekJzRHFQbFdGRGQ2cGJG?=
 =?utf-8?B?eFBxMDZWSDJmMzQ1ZVFYRjZSd1dGbHY3Y0pXUnVkbkwzbkRlNm5WaFdLRHoz?=
 =?utf-8?B?Q1V2WEZTdjc0Y05takRzbElYTnoyM3dMcVR4WDA0Q0w0WFROc1NNY0lUYzFS?=
 =?utf-8?B?dnNVZTJmZmRSKy9VRjFSbWF2ckZ3QitrSDkyTmU0enN1TE03UHFpd0lGQzJj?=
 =?utf-8?B?NGhXV3lPcGpHeEF2bWlKQ25IUlFUS1FmS2RqUU9Edk5qYjZrTm1ISEROZmxu?=
 =?utf-8?B?bkNuZ1A2NlgxL2Q3WklMQXBDZHVYbnZ3dXlBc0RaSmh2UFZRMnk5NFZEakVj?=
 =?utf-8?B?dFRCdStzbUpTd1RwOFFvb1VyaS8xTzRWT2R6ZUZNc0V6NTU2Yzc0SnkrYWN1?=
 =?utf-8?B?TnkzTkZ3c2ljeDhIbXVXN0lqWlMrV3FHWWJQM1J6OTBKMkZUWE50TElwMnJt?=
 =?utf-8?B?VXFsSEFUZnBEYVQyWE1seWtaVDFmS2tYMGl4V3d1UStGdHRvRDJZbWVVNHVP?=
 =?utf-8?B?b2FxdUV1Q2Y1b2FxSjNmY2IrdkdNWlVaTW1ONTBsaE1UZ2FyVWYvWDhsT1hs?=
 =?utf-8?B?dXNlRFZoK2x1enp5WURlZkJ3bGVlYVZYN2RjUk9VUm5pU2VQN2ZNc05leVpM?=
 =?utf-8?B?aUEydUhNbUxYU2E3TTgwZTlrNE5IR2tlVXZJUDVTd0VHRk5taEFtTzI5NkFa?=
 =?utf-8?B?WmxiT1NKZHRrYzJDNndNdFlGSC85VGtxckNKclNuajJObitTREtiVGg0N3Fa?=
 =?utf-8?B?VVlSWExMTmNwQjFEV0JWTEhJQ1I5RjRhemFSMnJNZ1FlQlRaWCtFdnh4SjdZ?=
 =?utf-8?B?RUJGMkVsajVHWXlqbFNOZzJXRWNnSGVEWlo2SThyRFI3aG03MHJYRUJQdmVi?=
 =?utf-8?B?a3hkUmluS0ZZSUY4cS9YV3RBT01kejhnNkRHdVZmSWVRUmpHTHAzbnU1WGYw?=
 =?utf-8?B?Nk5PTWdqRDI2TWVweFJpNDBiNHRzbHdaNlROQ3FBcW9DMVlISnZieXRYckFR?=
 =?utf-8?B?eWtTR04veU9Rak54c2x1d2pPN1AzK3JIWGxlZ3l5RDhVS3FYbG1yaW5RN0xz?=
 =?utf-8?B?akJaaVJCdTJ6N3hhUFlBNExNbDVrSks2cFhKaUg1OXNXQzFZUC83bTZIaXUw?=
 =?utf-8?B?UDFhWG11SHp0SG9LMVVrRTJmTzQ3MjNUTXQ4YmwrWjd0TkNDekZoNUVGOXNS?=
 =?utf-8?B?eEtHSk9uZWU1UE9sY0hzdTk2alA4NkdtYXJ4TC92SnNKSVdzV1NhNjBYUTBW?=
 =?utf-8?B?clFvNi9NVSs4blczeER6S2daODNYZVNXWFRUTGY5VXI2UnAwK2lBYndnU3Jr?=
 =?utf-8?B?ZkllUHByZVBNclJvdVJsLzEzNGhBNkE3eExCUmNwM1lUeTNRdzkrZ1hxemJH?=
 =?utf-8?Q?nccZFssKPnmjX3YtdYulZ4P3v1NPt60o=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6039284-4c75-4656-11be-08db0d8e9bf2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 06:50:35.8697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RTaf1ZleUZB1Rvcd5TMwFGYtqXm5dFhUBUnqQtkI0AWTOMZvpYfybu75Obzn3N/Wv1DnLLPlwwyMgXsCETCHjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4272
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_02,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302130060
X-Proofpoint-GUID: Wn9wEnvM67nPcudbZ_fQC0JB935BIkAa
X-Proofpoint-ORIG-GUID: Wn9wEnvM67nPcudbZ_fQC0JB935BIkAa
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.348, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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



On 2/8/2023 1:42 AM, Eugenio Pérez wrote:
> Only create iova_tree if and when it is needed.
>
> The cleanup keeps being responsible of last VQ but this change allows it
> to merge both cleanup functions.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> Acked-by: Jason Wang <jasowang@redhat.com>
> ---
>   net/vhost-vdpa.c | 99 ++++++++++++++++++++++++++++++++++--------------
>   1 file changed, 71 insertions(+), 28 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index de5ed8ff22..a9e6c8f28e 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -178,13 +178,9 @@ err_init:
>   static void vhost_vdpa_cleanup(NetClientState *nc)
>   {
>       VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
> -    struct vhost_dev *dev = &s->vhost_net->dev;
>   
>       qemu_vfree(s->cvq_cmd_out_buffer);
>       qemu_vfree(s->status);
> -    if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
> -        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
> -    }
>       if (s->vhost_net) {
>           vhost_net_cleanup(s->vhost_net);
>           g_free(s->vhost_net);
> @@ -234,10 +230,64 @@ static ssize_t vhost_vdpa_receive(NetClientState *nc, const uint8_t *buf,
>       return size;
>   }
>   
> +/** From any vdpa net client, get the netclient of first queue pair */
> +static VhostVDPAState *vhost_vdpa_net_first_nc_vdpa(VhostVDPAState *s)
> +{
> +    NICState *nic = qemu_get_nic(s->nc.peer);
> +    NetClientState *nc0 = qemu_get_peer(nic->ncs, 0);
> +
> +    return DO_UPCAST(VhostVDPAState, nc, nc0);
> +}
> +
> +static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
> +{
> +    struct vhost_vdpa *v = &s->vhost_vdpa;
> +
> +    if (v->shadow_vqs_enabled) {
> +        v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
> +                                           v->iova_range.last);
> +    }
> +}
> +
> +static int vhost_vdpa_net_data_start(NetClientState *nc)
> +{
> +    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
> +    struct vhost_vdpa *v = &s->vhost_vdpa;
> +
> +    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
> +
> +    if (v->index == 0) {
> +        vhost_vdpa_net_data_start_first(s);
> +        return 0;
> +    }
> +
> +    if (v->shadow_vqs_enabled) {
> +        VhostVDPAState *s0 = vhost_vdpa_net_first_nc_vdpa(s);
> +        v->iova_tree = s0->vhost_vdpa.iova_tree;
> +    }
> +
> +    return 0;
> +}
> +
> +static void vhost_vdpa_net_client_stop(NetClientState *nc)
> +{
> +    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
> +    struct vhost_dev *dev;
> +
> +    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
> +
> +    dev = s->vhost_vdpa.dev;
> +    if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
> +        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
> +    }
> +}
> +
>   static NetClientInfo net_vhost_vdpa_info = {
>           .type = NET_CLIENT_DRIVER_VHOST_VDPA,
>           .size = sizeof(VhostVDPAState),
>           .receive = vhost_vdpa_receive,
> +        .start = vhost_vdpa_net_data_start,
> +        .stop = vhost_vdpa_net_client_stop,
>           .cleanup = vhost_vdpa_cleanup,
>           .has_vnet_hdr = vhost_vdpa_has_vnet_hdr,
>           .has_ufo = vhost_vdpa_has_ufo,
> @@ -351,7 +401,7 @@ dma_map_err:
>   
>   static int vhost_vdpa_net_cvq_start(NetClientState *nc)
>   {
> -    VhostVDPAState *s;
> +    VhostVDPAState *s, *s0;
>       struct vhost_vdpa *v;
>       uint64_t backend_features;
>       int64_t cvq_group;
> @@ -425,6 +475,15 @@ out:
>           return 0;
>       }
>   
> +    s0 = vhost_vdpa_net_first_nc_vdpa(s);
> +    if (s0->vhost_vdpa.iova_tree) {
> +        /* SVQ is already configured for all virtqueues */
> +        v->iova_tree = s0->vhost_vdpa.iova_tree;
> +    } else {
> +        v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
> +                                           v->iova_range.last);
I wonder how this case could happen, vhost_vdpa_net_data_start_first() 
should've allocated an iova tree on the first data vq. Is zero data vq 
ever possible on net vhost-vdpa?

Thanks,
-Siwei
> +    }
> +
>       r = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer,
>                                  vhost_vdpa_net_cvq_cmd_page_len(), false);
>       if (unlikely(r < 0)) {
> @@ -449,15 +508,9 @@ static void vhost_vdpa_net_cvq_stop(NetClientState *nc)
>       if (s->vhost_vdpa.shadow_vqs_enabled) {
>           vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer);
>           vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->status);
> -        if (!s->always_svq) {
> -            /*
> -             * If only the CVQ is shadowed we can delete this safely.
> -             * If all the VQs are shadows this will be needed by the time the
> -             * device is started again to register SVQ vrings and similar.
> -             */
> -            g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
> -        }
>       }
> +
> +    vhost_vdpa_net_client_stop(nc);
>   }
>   
>   static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s, size_t out_len,
> @@ -667,8 +720,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>                                          int nvqs,
>                                          bool is_datapath,
>                                          bool svq,
> -                                       struct vhost_vdpa_iova_range iova_range,
> -                                       VhostIOVATree *iova_tree)
> +                                       struct vhost_vdpa_iova_range iova_range)
>   {
>       NetClientState *nc = NULL;
>       VhostVDPAState *s;
> @@ -690,7 +742,6 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>       s->vhost_vdpa.shadow_vqs_enabled = svq;
>       s->vhost_vdpa.iova_range = iova_range;
>       s->vhost_vdpa.shadow_data = svq;
> -    s->vhost_vdpa.iova_tree = iova_tree;
>       if (!is_datapath) {
>           s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
>                                               vhost_vdpa_net_cvq_cmd_page_len());
> @@ -760,7 +811,6 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>       uint64_t features;
>       int vdpa_device_fd;
>       g_autofree NetClientState **ncs = NULL;
> -    g_autoptr(VhostIOVATree) iova_tree = NULL;
>       struct vhost_vdpa_iova_range iova_range;
>       NetClientState *nc;
>       int queue_pairs, r, i = 0, has_cvq = 0;
> @@ -812,12 +862,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>           goto err;
>       }
>   
> -    if (opts->x_svq) {
> -        if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
> -            goto err_svq;
> -        }
> -
> -        iova_tree = vhost_iova_tree_new(iova_range.first, iova_range.last);
> +    if (opts->x_svq && !vhost_vdpa_net_valid_svq_features(features, errp)) {
> +        goto err;
>       }
>   
>       ncs = g_malloc0(sizeof(*ncs) * queue_pairs);
> @@ -825,7 +871,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>       for (i = 0; i < queue_pairs; i++) {
>           ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>                                        vdpa_device_fd, i, 2, true, opts->x_svq,
> -                                     iova_range, iova_tree);
> +                                     iova_range);
>           if (!ncs[i])
>               goto err;
>       }
> @@ -833,13 +879,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>       if (has_cvq) {
>           nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>                                    vdpa_device_fd, i, 1, false,
> -                                 opts->x_svq, iova_range, iova_tree);
> +                                 opts->x_svq, iova_range);
>           if (!nc)
>               goto err;
>       }
>   
> -    /* iova_tree ownership belongs to last NetClientState */
> -    g_steal_pointer(&iova_tree);
>       return 0;
>   
>   err:
> @@ -849,7 +893,6 @@ err:
>           }
>       }
>   
> -err_svq:
>       qemu_close(vdpa_device_fd);
>   
>       return -1;


