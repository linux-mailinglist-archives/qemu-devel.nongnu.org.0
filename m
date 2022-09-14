Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EC15B8C2E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 17:47:20 +0200 (CEST)
Received: from localhost ([::1]:38186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYUbf-00041n-Lt
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 11:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1oYUYX-0002T2-DR
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 11:44:05 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:32382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1oYUYR-0000Qx-63
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 11:44:05 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28EDb94c002535;
 Wed, 14 Sep 2022 15:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=hcGLl/bJZUxyyS24nrCu3sWCKcFAtememEv21cFwxN0=;
 b=VRcLqjLCT+wqiuXhzP8tk+opjxtDwQ7vZDB0Y1qzMksJvkufJ1d2h9hzFPMPAwi4OXZk
 8Bnioh4vfvz+twO9gqWRjvT7OJVyzJWf/8++leR6/ijMkHlQTLUxoGFlLuPQxV7VlW2Q
 ePas9CJf3YatBCnrj8ZMtsdJg2Iqf8u2YmufFWKvOMy3tLeezZlHF1oIhFaJRjJDJReH
 Bydu/LquEoUsXU/kXhV0m8Gv8F4iaeqTo9jXm5wV9ZVpY6LDZfPhmTa2Y0jHDrgJcWQ/
 iGwWA2PF8SwHwSfc1l0Y1lcUiMw1LKWvw289LRRa0RjcM7u+Lo0ItPoL5C50vUc+vaJu 4w== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jjxypaq7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Sep 2022 15:43:29 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28EDZbCa035532; Wed, 14 Sep 2022 15:43:27 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jjyehaswd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Sep 2022 15:43:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APcSjTfrf5LxqoAwKYkLucB/SLCEkhXgezuUH98g11ONF51eyF8jJhYWwm4qVjyzMsoFsiT/fUdgLGzVdXxJMijGEaBKMC//zKt35ESgF+2xCNoWAL38/Hn70u/T3J3JGQnH+Vs3ePEDZKGldZB/NB1ZFkbJIhCGB1WKEa04y2W2SI3js2h0XaKH5+Rr5CBwscaoqupPhzwinConAEVH+Q4UTHMrfyNlIyaHf+ARh4fMcdAdM1sIu0kdZNEtDXPfAWlSASptR3nbZEQWti8E1QFiLOHSykbaJsJwbbywEgFDyRnB0sqVT5XlkKQoWke1nlHXgyLZiXhYDl5205puug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcGLl/bJZUxyyS24nrCu3sWCKcFAtememEv21cFwxN0=;
 b=EXAGS0Ozjg8hvyHanAAWM4QLqyChfaM+G2AnDPYnwC5hgAmc1+q4T6hzzfr3xR9Q81+CFltp3FDFqcQcAsRnKZDbU7FpQt2rLP4kKM1L6argguP9mz7+uT0HuPv50mZt85cUNhbuBisqFwrIv+xPrIOpEPFlsKbtluVj/wd6wdmBhDHoaWUZuDjRnWUQDsrGjGaDcufv16itOA8XVt1+6PmoIXE0UR1AdfqeR64oPQByZZDEZ0S/RjtUZFRaSR4FibsBZVsdUmPj+11D+uBFb1+zg8+3stsGCBqImdKXTM7yRBU8W/LosoTs/R+6jWwGDR6rMXl1VAg2ryeRymVfbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcGLl/bJZUxyyS24nrCu3sWCKcFAtememEv21cFwxN0=;
 b=a1DbB2fWrwVSOS8KJwPOGuc/8iCquZ0Qhse5m90JLvia+GUpzbr45aqQXH4sjrBupKl8MoGGApXMX4ZPsppjWCUHtp+ctl5rfeIt/luAfDe2C/mvXT+8d2xSR3A2KVzqlJRN7A13vxmRywk/IJnlgf9R0fMOn6dzqQG8pMdCRHY=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by PH0PR10MB4648.namprd10.prod.outlook.com (2603:10b6:510:30::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 15:43:25 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::f87e:a65f:758e:688b]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::f87e:a65f:758e:688b%5]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 15:43:25 +0000
Message-ID: <411586c9-22a2-1bd5-fbcd-a7658fd00446@oracle.com>
Date: Wed, 14 Sep 2022 16:43:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/3] vdpa: load vlan configuration at NIC startup
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Harpreet Singh Anand
 <hanand@xilinx.com>, Cindy Lu <lulu@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
References: <20220906163621.1144675-1-eperezma@redhat.com>
 <20220906163621.1144675-3-eperezma@redhat.com>
 <CACGkMEvnVavevtxWa49Yew+Nnkx_Wfmgf1JLVXCBe=zkpvdHnQ@mail.gmail.com>
 <CACGkMEswG2nmTve+p2MU9ue5CuwAu69CpeOUzYnu_BVfZE56JA@mail.gmail.com>
 <CAJaqyWf=NfkL_2uXVapJ6qCLziBc2jg+jMyR+cBQu+yDG6eg5w@mail.gmail.com>
 <CACGkMEvW5ZUZEcx9COvwjAT5PUraoko8k1foBez=T1nmhjKpDw@mail.gmail.com>
 <34969f96-b7c4-c9f8-2248-3e84a84148b2@oracle.com>
 <CAJaqyWfZBHSTwY+WRDbwS+Sw0NsXsmpfhgpOtmLNM3dUWzrd7w@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAJaqyWfZBHSTwY+WRDbwS+Sw0NsXsmpfhgpOtmLNM3dUWzrd7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM3PR05CA0134.eurprd05.prod.outlook.com
 (2603:10a6:207:3::12) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3287:EE_|PH0PR10MB4648:EE_
X-MS-Office365-Filtering-Correlation-Id: 59f91b63-c222-4b06-8dfa-08da9667dc7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hU+DU08yZBhzjgEuvYGC3gg9g+9fsovnHMu2HgaUW68LH1XKEdSJlkgr7ML/FqZf6dymxcnd8vTzP21Kyy2WXUgi5b+rf6miibnQLNB4SCy0UJa9Sne+N6/cAx+kXuLHJSfrVujDjhWwELN87bf0DvS3YCfBrorvQT1M6l/wf2OVOoBy06GAEAAdqXx46MlhY6jExYfROJNyJMSMxU+2cli08+w3HOKBEfLQ+dwDpUrUH9SYtAXoPPYUDp6RKKiFQ+8xhD5kGIzv5IG6isIzGI2pbg7UFUK3aycjNmywnfoX7R3iQi45e633IrkURZgkZKLvJiSNVXjCWOdn9maIzhz6TtXDWMQp8vOiKjkzpw0XHN1BPrUtr31xOqYcQmhT2io5oaiey/495icsbt8DsSdfZm0iXiVmEQwa0pNbkh8jKRBMc2Tww4kHARx6v+Q8FGE9SpwqgloJcNLIZ/jzNblu50C1qMMXRMbO/TA1flZFepJahmNJTsS/Jxm6snrV5xL397139Shgzq44tq8z2JkvLTcOFkoaCqBQxaX3DUakfcOpDOBkMVtb/1HEuJzWe70rCEf2yIocpsqBlRa4aAapkW0l1/VuTtvZ5l0AmI3nDC09JdEZ8I6AHjDf1kBYwqXmbqN4nFGq5p4t2d0QRJfb0hEZfajgtAAFD37ZWC/x0S6Le1LLF+mS9UmcErxwsjhSxj6L5NCqkhiA/Nw8jYs1LsV3vt0EeyjgvVbr/qdnB5L6LXtJzAzKsVJ4Olk/ZqNAoRVQtEPeA/4YZaQwCkjw7v2I5f8D8RVre20kBrM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(346002)(366004)(396003)(136003)(376002)(451199015)(31696002)(66946007)(8676002)(31686004)(186003)(66476007)(5660300002)(478600001)(66556008)(54906003)(38100700002)(7416002)(86362001)(8936002)(26005)(6666004)(6916009)(6512007)(41300700001)(6486002)(2906002)(6506007)(2616005)(53546011)(36916002)(66574015)(4326008)(83380400001)(316002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmJqWTNNbW5uSENlUkZJN00vQ2YzSW04QTNsazl5OEZDT0FLd3FLbFVQcm0w?=
 =?utf-8?B?ZmtLaTU1NjV2UVZtUk5tL0xtK3NTOGRSdllpdzFuUEtSVWJiemF6NVd4MHVF?=
 =?utf-8?B?cXYyck1rMVBtQmdZL0dnUHBHcWpjTlYyanpJbStsb01TenU5UW9IaTM4NDc3?=
 =?utf-8?B?ZUJmSWtDeWUzRlU1V2NrVHFha2FrT3JOZlE5Q2gzUE5McTdCdDloLzhad0x4?=
 =?utf-8?B?ZUs0WTkvU3JsK1c2VTF6QjJKWWt6cjBpZmxqVDZwdWVNMDZBRTFxNjh3Q2tQ?=
 =?utf-8?B?YWNFWkJETVVIU3NEQ2tKbGY2ZHlsVDVNVlZMRVZyT3NGK0w3UU5yTDBZT1pt?=
 =?utf-8?B?d1F2MytnR1pXVlBwQ0JaMW8rY083VThhZmhqSTIycjFEaEhJWHlyYUkzRWVw?=
 =?utf-8?B?NTJzaWF1M1NaMWNsMTByb1JUOXB3ZFRId3ZnYUYxN3hveG5ORzFWYVE1KzFY?=
 =?utf-8?B?cjh1K1lJWjNqYmJMdVpsYXlTQWU3bE9BZUJOMlJNR1h3YTB1UTN4cnQ0dHBO?=
 =?utf-8?B?YjF3QzZmTXE2RG1qZlkrd213Z0FyK1dOVEp0K2EvenUvaFNqRFVFSm85TXp2?=
 =?utf-8?B?cmJZRGxmU1M3cmp5bWtyMlVNT3l1bmNnUWZYSFg1dGpLZEEwYlZjK2ExTmw0?=
 =?utf-8?B?aEFEZkJ4Y0NyT2ZCQkcvS083Mzh0Tm9iQmZoVTd4Y1JCejBRNnV6YTV6RUF3?=
 =?utf-8?B?bWVLMTg2U2pDaVJuazhnQlc5YlBXQUNqa0kzdFJrQ29WanhPZEtaZldWRVpO?=
 =?utf-8?B?WDQwZStTTUtZeWxqbGxwSkRadTJIclhMOUxCSzQvNWRuRnNzeHBCN2c1aU11?=
 =?utf-8?B?c2xhSU9jQ3d0ZmxSempYSjBUSnUwajJJSk82TTZkV2x0cjQvelhwcTA2NytC?=
 =?utf-8?B?SGxzOTRCRmF4RFVRVGNKdTdSdDFxeldmSUxxVStORm9lOG03bUJCTXhrYkRl?=
 =?utf-8?B?cU1veFpwWVJENDVnUG5PeDdjMjQxUEhrUWFMcVBqaGFmRWtIY0hnUWl2dElq?=
 =?utf-8?B?MHdZNmdYV2FGaEVSbGJjZWhBMmpEY3h0dldITXNxNWFlOUhFcnRRRHVCRnVR?=
 =?utf-8?B?anowV1AvNUM0SmlEWGZqUmx6Qkt2bUZBZFJHREl3SEhUTUJ3alV6ci9ybFNu?=
 =?utf-8?B?a2RsRVJVejNQaWU0K2lCY1JmWk4yc0xkZWN0U1hWcVNEU3l5WjJtSGxNekdx?=
 =?utf-8?B?Z0dLMXc2U3NRTmxFN3Ixcm9zYVBUYkt3Zjd0VDRtZW0ydm12TjN3OVJKbzB4?=
 =?utf-8?B?OU9ueGZpT1Rja29weTUvTk53eUpKdUx5QXBBdkZxN3Y1TEU1eGc3Ti93L1hZ?=
 =?utf-8?B?WDc4NFFBSklNV3dWVzdid3JXMkpzMmZqMW1yZldDYVpVZnFTVVJsVjBOeDZn?=
 =?utf-8?B?ZkU0cFJEUXlmUUdGaXpiV2N6SVh5MlNXZmVtU3crSElNa2xBMjFxbHpIQUNK?=
 =?utf-8?B?aCs1dUg5VTBFWTNRVVc3WUZoU28ySDZzRVJkSUF0QlRQR3hWOXJ0ZVp2Y0Qw?=
 =?utf-8?B?akNSSGxTWjVBa29FRlpTdm9XZ0RTblNQbjJhem4vZG9pSWJ2SWgyZThnNGZM?=
 =?utf-8?B?VGlHOFVUb09KRHExNm1IcFUxVnNEUktuRFdaNUlHZXBjMUsvdkxoM0JOMHlS?=
 =?utf-8?B?d2tFV1FaT0VNbTc2T0FGMlBvSjBJVTVzbTJ3UFplTEw4NUlBaVFPdFNWKzl4?=
 =?utf-8?B?L2NYV01HTE9RR1c2TGdNdkdzOWZYbUo1NHpURWdKbVh2Yy9Qb2xqTm9ZdERa?=
 =?utf-8?B?Tk43RG1sQ3hzNGdUc2FUbERNN09xaUE0VHRETmptaXFXMTVvRUlRNHJUTThZ?=
 =?utf-8?B?RTJON2xreEdKRDZtYjdPK21oRmlqMG1KRkpDZUR2dlQ5TUxKS3JUSm82cHBY?=
 =?utf-8?B?dmN0OERCNzZLNis5aTlUYVMvc2hKdmZCaE5DQmhOaGU1VEdNTVFzdGluRDNk?=
 =?utf-8?B?Qjg0MGQrOGptQmdob1QzSVlXbndiY0dPeHQrZ0k2SDJReG4vY3pvelV1TlBi?=
 =?utf-8?B?clFjbGxCTS9Wc2JrL1V4MHFTNHV2akJOanNTYUVzZkF5bUhxU3FXMEk4S1JH?=
 =?utf-8?B?T3lDYnFPNWRjVkltYTdmdGluMk9QdGdKZzNBUGlpTklneExCRkNpMHFJMVFs?=
 =?utf-8?Q?OTGu+tFcktDk6JiIgT6E5zve5?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f91b63-c222-4b06-8dfa-08da9667dc7a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 15:43:25.3663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85T6BooYcNfaGvBoG+Fe6yZBQUVyIzd2jLcDSB87DhCOInLkpKcCkfHhlOoADly1017LEr9pQPiOOIPrcW/H1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4648
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-14_06,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209140076
X-Proofpoint-ORIG-GUID: o046d0UQyOu56Qsidt5B8u-iCAkvIks2
X-Proofpoint-GUID: o046d0UQyOu56Qsidt5B8u-iCAkvIks2
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.583,
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



On 9/14/2022 2:57 PM, Eugenio Perez Martin wrote:
> On Wed, Sep 14, 2022 at 1:33 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>
>> On 9/14/2022 3:20 AM, Jason Wang wrote:
>>> On Fri, Sep 9, 2022 at 4:02 PM Eugenio Perez Martin <eperezma@redhat.com> wrote:
>>>> On Fri, Sep 9, 2022 at 8:40 AM Jason Wang <jasowang@redhat.com> wrote:
>>>>> On Fri, Sep 9, 2022 at 2:38 PM Jason Wang <jasowang@redhat.com> wrote:
>>>>>> On Wed, Sep 7, 2022 at 12:36 AM Eugenio Pérez <eperezma@redhat.com> wrote:
>>>>>>> To have enabled vlans at device startup may happen in the destination of
>>>>>>> a live migration, so this configuration must be restored.
>>>>>>>
>>>>>>> At this moment the code is not accessible, since SVQ refuses to start if
>>>>>>> vlan feature is exposed by the device.
>>>>>>>
>>>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>>>> ---
>>>>>>>    net/vhost-vdpa.c | 46 ++++++++++++++++++++++++++++++++++++++++++++--
>>>>>>>    1 file changed, 44 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>>>>>> index 4bc3fd01a8..ecbfd08eb9 100644
>>>>>>> --- a/net/vhost-vdpa.c
>>>>>>> +++ b/net/vhost-vdpa.c
>>>>>>> @@ -100,6 +100,8 @@ static const uint64_t vdpa_svq_device_features =
>>>>>>>        BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
>>>>>>>        BIT_ULL(VIRTIO_NET_F_STANDBY);
>>>>>>>
>>>>>>> +#define MAX_VLAN    (1 << 12)   /* Per 802.1Q definition */
>>>>>>> +
>>>>>>>    VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
>>>>>>>    {
>>>>>>>        VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
>>>>>>> @@ -423,6 +425,47 @@ static int vhost_vdpa_net_load_mq(VhostVDPAState *s,
>>>>>>>        return *s->status != VIRTIO_NET_OK;
>>>>>>>    }
>>>>>>>
>>>>>>> +static int vhost_vdpa_net_load_single_vlan(VhostVDPAState *s,
>>>>>>> +                                           const VirtIONet *n,
>>>>>>> +                                           uint16_t vid)
>>>>>>> +{
>>>>>>> +    ssize_t dev_written = vhost_vdpa_net_load_cmd(s, VIRTIO_NET_CTRL_VLAN,
>>>>>>> +                                                  VIRTIO_NET_CTRL_VLAN_ADD,
>>>>>>> +                                                  &vid, sizeof(vid));
>>>>>>> +    if (unlikely(dev_written < 0)) {
>>>>>>> +        return dev_written;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    if (unlikely(*s->status != VIRTIO_NET_OK)) {
>>>>>>> +        return -EINVAL;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static int vhost_vdpa_net_load_vlan(VhostVDPAState *s,
>>>>>>> +                                    const VirtIONet *n)
>>>>>>> +{
>>>>>>> +    uint64_t features = n->parent_obj.guest_features;
>>>>>>> +
>>>>>>> +    if (!(features & BIT_ULL(VIRTIO_NET_F_CTRL_VLAN))) {
>>>>>>> +        return 0;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    for (int i = 0; i < MAX_VLAN >> 5; i++) {
>>>>>>> +        for (int j = 0; n->vlans[i] && j <= 0x1f; j++) {
>>>>>>> +            if (n->vlans[i] & (1U << j)) {
>>>>>>> +                int r = vhost_vdpa_net_load_single_vlan(s, n, (i << 5) + j);
>>>>>> This seems to cause a lot of latency if the driver has a lot of vlans.
>>>>>>
>>>>>> I wonder if it's simply to let all vlan traffic go by disabling
>>>>>> CTRL_VLAN feature at vDPA layer.
>>>> The guest will not be able to recover that vlan configuration.
>>> Spec said it's best effort and we actually don't do this for
>>> vhost-net/user for years and manage to survive.
>> I thought there's a border line between best effort and do nothing. ;-)
>>
> I also think it is worth at least trying to migrate it for sure. For
> MAC there may be too many entries, but VLAN should be totally
> manageable (and the information is already there, the bitmap is
> actually being migrated).
The vlan bitmap is migrated, though you'd still need to add vlan filter 
one by one through ctrl vq commands, correct? AFAIK you can add one 
filter for one single vlan ID at a time via VIRTIO_NET_CTRL_VLAN_ADD.

>
>> I think that the reason this could survive is really software
>> implementation specific - say if the backend doesn't start with VLAN
>> filtering disabled (meaning allow all VLAN traffic to pass) then it
>> would become a problem. This won't be a problem for almost PF NICs but
>> may be problematic for vDPA e.g. VF backed VDPAs.
> I'd say the driver would expect all vlan filters to be cleared after a
> reset, isn't it?
If I understand the intended behavior (from QEMU implementation) 
correctly, when VIRTIO_NET_F_CTRL_VLAN is negotiated it would start with 
all VLANs filtered (meaning only untagged traffic can be received and 
traffic with VLAN tag would get dropped). However, if 
VIRTIO_NET_F_CTRL_VLAN is not negotiated, all traffic including untagged 
and tagged can be received.

>   The spec doesn't explicitly say anything about that
> as far as I see.
Here the spec is totally ruled by the (software artifact of) 
implementation rather than what a real device is expected to work with 
VLAN rx filters. Are we sure we'd stick to this flawed device 
implementation? The guest driver seems to be agnostic with this broken 
spec behavior so far, and I am afraid it's an overkill to add another 
feature bit or ctrl command to VLAN filter in clean way.

>
>>>>> Another idea is to extend the spec to allow us to accept a bitmap of
>>>>> the vlan ids via a single command, then we will be fine.
>>>>>
>>>> I'm not sure if adding more ways to configure something is the answer,
>>>> but I'd be ok to implement it.
>>>>
>>>> Another idea is to allow the sending of many CVQ commands in parallel.
>>>> It shouldn't be very hard to achieve using exposed buffers as ring
>>>> buffers, and it will short down the start of the devices with many
>>>> features.
>>> In the extreme case, what if guests decide to filter all of the vlans?
>>> It means we need MAX_VLAN commands which may exceeds the size of the
>>> control virtqueue.
>> Indeed, that's a case where a single flat device state blob would be
>> more efficient for hardware drivers to apply than individual control
>> command messages do.
>>
> If we're going that route, being able to set a bitmap for vlan
> filtering (Jason's proposal) seems to solve more issues in the same
> shot, doesn't it?
If I understand correctly about Jason's proposal, it's a spec extension 
already to add multiple VLAN IDs in a row. This seems not much different 
than the device state blob for the resume API idea I just presented in 
the KVM forum (which also needs to extend the spec in another way)?

struct virtio_mig_cfg_net_ctrl_vlan {
     struct virtio_mig_state_header hdr;
     le32 vlans[128];
};

What is additional benefit that makes it able to solve more issues?

  -Siwei

>
> Thanks!
>


