Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFF23458B8
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 08:31:54 +0100 (CET)
Received: from localhost ([::1]:39702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lObW5-0003h3-GS
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 03:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1lObUZ-0002z8-QB; Tue, 23 Mar 2021 03:30:21 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:53670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1lObUT-0007w2-0F; Tue, 23 Mar 2021 03:30:19 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12N7P8ib186730;
 Tue, 23 Mar 2021 07:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=sVbb6OT0EO4vhOX7pplZ3QvkDqSidmZEI3Rp2/EArxE=;
 b=rlMv1EUlpycaWkGWOLnWH8khY5co/RClKea/TJywrJvZnZhd05xRFKMODC27W8p1q1uc
 JhqFm1+edxw7cF/q7b9jFdJZa5PTN4375K11Cg2GC7NhFwkg/E5RR9plzL4nQfEX3/fk
 3IXY1d+QspkqzUeFkptSYv3BtHd703OsjjvkqQrnp9CrGSgxa5RoDG1O0qtJEtxTdYzf
 vT6Gl0RPvv/m/IIX2k4zsnUv8YEOTJCR06F6wDuNo09w+p6T6OL6BHBduhR0LbI2f1xU
 l+B9YXLQbhfDjYp83Y9fGG15KxFOElAWfEowCITRjfgWlu/XQwYaKjK59hjilUet/nLM /A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 37d8fr5vy7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 07:29:51 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12N7P7Y9165904;
 Tue, 23 Mar 2021 07:29:50 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by aserp3030.oracle.com with ESMTP id 37dtmp5awj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 07:29:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibhQDvLz5lPSN49jcdRR4Gk1IiiAuoUJQv90mm5mKLzEe9xmVdoGxssMbiAY9+BHxKmNABznU+6IjcntBuVQVBvfS+JO4crgNKjBZlaW9cJ8Xg4Sr+auDVULVKJPNkj2C74VA/3URdEXwJ60pUn3n0Z3/jM1XIRjwqoT5/8tYej0rcV4VWJeLaljwx6BNDyKf9Hh0ynGbdKZrOCS86F+sVkUDU6a1C2yKqhzKbTW5ynvGD5SLylc1tpZ3kQxO3yeOXkXhSnoDDB+BE7XyXkCB8FqWFET0poDhVoNnB25PLkuhKmWZTNK4EPYVAeJagVl44/5mMFROjUldBEjT4jiPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVbb6OT0EO4vhOX7pplZ3QvkDqSidmZEI3Rp2/EArxE=;
 b=bOH0NhezYh9pynWHDVB4e4dnyaQPDN8iBWQiUHFCG7Y7OIOYB07D2tNekF3aHpxuJGfciwapSve1o/BzHCjs10bWLPSGoo5L2WSebWFDKVbHKuL/aE8xTqtSwwecmtrV2kI17ZxpiDYSQWwHS54wfYIImJZDXMhlr9wVL3DEJbyGLZiuT7pl+4P5ITCK6nbjyA8ZKvVhGpBQjliFNywtRQ4Tn6ln4EpbgpdeS8tzSVbCw9/4fMD/l3kbGZ1I2MW1BMNxE43VJ4YH67Jy6nLfzc6xcTVQOZbn7QYd8JgjQKa3f7yDFKBSkjv0YgBJNzkrvxlsJ95gwfUP2FKHY4l8ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVbb6OT0EO4vhOX7pplZ3QvkDqSidmZEI3Rp2/EArxE=;
 b=m7/fWS76h6l7JQGLTAIMAO9cVH9O0520ra7OScjt0WjCMK3DfO2rxMWjJAS7K9pJO/flYrIKEiwLVB7wq6vE+V87gOrsmeS0//ye2eRqgMykVPtC99In5lcq7sZv2KDM7TfiyxSlyrW2MyF4HSxVXusw36Dn927CEMH9NE4p90s=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB5451.namprd10.prod.outlook.com (2603:10b6:510:e5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.23; Tue, 23 Mar
 2021 07:29:48 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::6819:aaf:9a92:c1db]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::6819:aaf:9a92:c1db%2]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 07:29:48 +0000
Subject: Re: [RFC v5 1/6] qmp: add QMP command x-debug-query-virtio
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <1616084984-11263-1-git-send-email-jonah.palmer@oracle.com>
 <1616084984-11263-2-git-send-email-jonah.palmer@oracle.com>
 <9d9c53a2-8fa1-f8f8-0ae8-59eff979cffe@redhat.com>
From: Jonah Palmer <jonah.palmer@oracle.com>
Message-ID: <030206fb-496f-305d-4630-25e378c5dd6d@oracle.com>
Date: Tue, 23 Mar 2021 03:29:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <9d9c53a2-8fa1-f8f8-0ae8-59eff979cffe@redhat.com>
Content-Type: multipart/alternative;
 boundary="------------90E43320EC9EE756EDD68773"
Content-Language: en-US
X-Originating-IP: [24.147.51.11]
X-ClientProxiedBy: BN9PR03CA0224.namprd03.prod.outlook.com
 (2603:10b6:408:f8::19) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jonpalme-lnx.us.oracle.com (24.147.51.11) by
 BN9PR03CA0224.namprd03.prod.outlook.com (2603:10b6:408:f8::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 07:29:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d75df87-d495-40a8-09cf-08d8edcd7053
X-MS-TrafficTypeDiagnostic: PH0PR10MB5451:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB5451710A03D6C29DD45C4EBFE8649@PH0PR10MB5451.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ILyJ9ZszMbIpXkmWFsW6k9/Rhv/uF0ZyMN5MqedtwFVIli8vQX1fQp+gzuoruACmjYuSMx/z6g7fMMSsIpWJQd3S3bzA/tAZyUnWVzDOQZ1xxjZ4u+3tju+utCzVVa8cQh6LV0MPdW9BGinGUkdzVi2ITd0bRzN/Bu4DdkaKUX+JLGikJIiuti0//T0QDRnmAMTZkc7XeOdCbjxqyrld5ikcpy+uXaN2XpsoLQcsQ6sse5YsDf05FE3NwnaozYPHw37/D3rE1dBpoxbZdmowK5bup+QXSMbSEndTR3cttbaAS3S6p6sIqN62wvIc/DduREEMJtFndkMMQNn5ojNMVjaVdsklwgaEbHSeRLY0bCdGQhorUKgFgS2X7U8mM4vqrYc63wx2799fxysBS6owWD8BHVjPvPJNUslU2TcCKhQxMojkvS/eo3zy9IXh4RxMUFZfhkbcu/I8Tkq/1Yl592U6WO0qT4nWduIsRPgRQmmbMM1BRPr75pnXOuNlBG9Hd+xyFAw96RlOxntP9eqF3kxHAwIWoSu0Uzwt1dYLBQZq/yA6b/DPXB9a9rEQi5/yWjwREXuBPzwPVCgT5ny/iTneIHFJhp1knawI2/JuXGeDZZWrCWWQlA8pVDMN043FbrbW6safMaQN5tRLSGAf6kKP/IUpJGyLH5rJNF5TlpxFxsoq7WDoR3zh7rP+lN9HKFI03/Cr7FvDydYLs6GD12a2W7crMWbpg4jouSOllpg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(39860400002)(136003)(346002)(396003)(33964004)(53546011)(107886003)(66476007)(66946007)(66556008)(6666004)(2616005)(7416002)(7696005)(4326008)(26005)(44832011)(316002)(31686004)(956004)(86362001)(8676002)(83380400001)(5660300002)(36756003)(478600001)(8936002)(2906002)(16526019)(38100700001)(31696002)(186003)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dEQ3N3dnR2libXI3bmdCWlZDSllBUkFRQUIwSnU1cG82cVZTNlpCS2FNNm53?=
 =?utf-8?B?Sks2akVsVlE4ekIrUTFWWk53RUFNUk4ycWx2SkQ4RkxEZjA1QmJxU01WN0dU?=
 =?utf-8?B?anl6VVBoUnV0MTNJamlMQm5pQnVCendnVnN3ZDRvMDlzNnMzUitIR2o4L0Zo?=
 =?utf-8?B?MEZZYXV5bUJ1b1Q4WXdsL2JMTENKVWJXSXYweDd6UENFYk1xbFBYTitLZlhL?=
 =?utf-8?B?cWlhTmd0ZzBKWkpIZFdjRHphNGtkQWZLeFlodlZPaWZoWmgxTW5VdmtCakRo?=
 =?utf-8?B?VXova2hMTnJ5U3JwUWQzaUFtM1Y1bkFWVVZoTmFxK2Y3QU51R1V2MGJJeTQz?=
 =?utf-8?B?eG1CZVg3cXE0a01rU0M1L2dBVVAyVS8wR2Zha1N3Y0pNWGlSMDlPK2VoMURk?=
 =?utf-8?B?NHFZZ0plT3ZmUy9vNlNWWVQxY2MyQ1VGanFOZVV6WXo2N3dUY0xHZm5sTW5n?=
 =?utf-8?B?V3FFYmxrWEpoZ2tKZVFrQVJ5QlQ5LzV2SFRGRmFWYVhJNmZ2c0lFN1Y4aXgz?=
 =?utf-8?B?ajBQd25KUHUydm1Sdm9PUDJMdFVELzMwL1Q2UFlYWEl4Y2kvanVTMzQwZFVT?=
 =?utf-8?B?MCs4RXR2c3AzS3hkdGZRcFFCU1NNK0ZrZXprTTNNWE9JdW1wdFlDalRRVTMw?=
 =?utf-8?B?YWpDM3VRa1ZyU0tiWlo5bVEzQzFBeGIwNlkrRkNVVEpLSjlTcnYxZFRhT0pO?=
 =?utf-8?B?OER3OW1HQWRNeU80YURidjRLK3dYK0tWdFFDMDJCblFOQXEydFMxVGpuUEFO?=
 =?utf-8?B?YSs4c1dFVHpGTmVlUnRqR2d1V1ZWNm42T3Y0bEwwRmVnSTJhQitUVk1KMXFG?=
 =?utf-8?B?ZVk3dzREY0pNdE5zdSt4Mk9BWU1ROG5SdmIxVUk5bEV4MjhtU08zbW9OOFlt?=
 =?utf-8?B?OStVSGtVMmQ2MFZSdnNjV0cvQ0MydXZSZzY5M0xHSk12dTNPUFpLdDk3amN6?=
 =?utf-8?B?ZEZSMHFyR1FHSGpMOStsWFZhQUdFS01BQmowMy9RNHUrRkFUNDA0RVdYL0RD?=
 =?utf-8?B?Vmd6MDlqeFVWQnhuU0F1NjRlMXArcXdaRjVrSU8xY1NPY2duN05TTWJHZVpT?=
 =?utf-8?B?VFZPeWNtRkZjMVY0dXd2Zk1SWVh4dmV3czY0YStqZ0YyTkc3RFBFaE1sUXR1?=
 =?utf-8?B?Wkl2b0ozc1NqVGR0Zi9icDF0RWNxN1VrQmV6d3hOejBUVzNsVjBWRlNKdnJ1?=
 =?utf-8?B?YjR6Q3dGdGdSMW5pTkRkbkt1NlFFZzFlMTczWXFteXBsZ2NNeC8xc1Z2Y0t2?=
 =?utf-8?B?dnUrdHhoU2djT3c5Q2JTajMzOGttM2ZOL25IUmcvS21mVlUwOUliMmJuRTRv?=
 =?utf-8?B?c0NNdGc2c1pTOGNxUXJQS0psek5UMy9ySFB4T1NGNUZrZmNwdlh4bnN3NmtI?=
 =?utf-8?B?dUFsNUtHZTNMYzhLNlRvZVZGWXIvNnBxNGJDNStUcEM4ZDdxVGJNMDVSNzd0?=
 =?utf-8?B?cG8vZUZsWU0wQ2o3RU1QZlo3UjN2VzBHTTcvdW1hSFhBc3NSVlUrakRHcksv?=
 =?utf-8?B?TEJCczh5NUZvVFh3TUxtck40ajQzOGdmY2swV0VxU2UxVnV1NUhhVnY3Ni9S?=
 =?utf-8?B?c29EQ0dSdGw5d0lFdThROFZVaXR4OUhtOVgxWkxSSC96QXVDVE81UmpjTERl?=
 =?utf-8?B?UjFWWVlzU2M2ZDBYcGhmQmtONFdZTnVobFFTblVnU0oxMEd5MkRDSzU1ZDVN?=
 =?utf-8?B?SUE5MFZQbGFRYStXUWRxQmQ4OVorUUwwQmVzWTV5cXlFbHlvdjQyV0Q4dkMz?=
 =?utf-8?Q?t4ptHquS2FiTe37KRGxrScHVAYMpBvoawReCenP?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d75df87-d495-40a8-09cf-08d8edcd7053
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 07:29:48.3306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPEKnKl2fzY58vF/TBeuGWUa0hahIRPmujFYanlG2NisOphFrHuIFjh4ZcAU+KDQUReWZWYsf3cuffSZpq4Hfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5451
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9931
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103230051
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9931
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103230051
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=jonah.palmer@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, mst@redhat.com, jasowang@redhat.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, qemu-block@nongnu.org,
 david@redhat.com, armbru@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, amit@kernel.org, michael.roth@amd.com, dgilbert@redhat.com,
 eric.auger@redhat.com, dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, kwolf@redhat.com,
 laurent@vivier.eu, mreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------90E43320EC9EE756EDD68773
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/18/21 4:46 PM, Eric Blake wrote:
> On 3/18/21 11:29 AM, Jonah Palmer wrote:
>> From: Laurent Vivier <lvivier@redhat.com>
>>
>> This new command lists all the instances of VirtIODevice with
>> their path and virtio type
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
>> ---
> We've missed soft freeze for 6.0, and this feels like a new feature;
> therefore...
>
>> +++ b/hw/virtio/virtio.c
>>   
>> +VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
>> +{
>> +    VirtioInfoList *list = NULL;
>> +    VirtioInfoList *node;
>> +    VirtIODevice *vdev;
>> +
>> +    QTAILQ_FOREACH(vdev, &virtio_list, next) {
>> +        DeviceState *dev = DEVICE(vdev);
>> +        node = g_new0(VirtioInfoList, 1);
>> +        node->value = g_new(VirtioInfo, 1);
>> +        node->value->path = g_strdup(dev->canonical_path);
>> +        node->value->type = qapi_enum_parse(&VirtioType_lookup, vdev->name,
>> +                                            VIRTIO_TYPE_UNKNOWN, NULL);
>> +        node->next = list;
>> +        list = node;
> This should be updated to use QAPI_LIST_PREPEND rather than open coding.

Ok! I'll update this.

>
>> +    }
>> +
>> +    return list;
>> +}
>> +
>>   static const TypeInfo virtio_device_info = {
>>       .name = TYPE_VIRTIO_DEVICE,
>>       .parent = TYPE_DEVICE,
>> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
>> index b7ece7a..2470e09 100644
>> --- a/include/hw/virtio/virtio.h
>> +++ b/qapi/virtio.json
>> @@ -0,0 +1,68 @@
>> +##
>> +# = Virtio devices
>> +##
>> +
>> +##
>> +# @VirtioType:
>> +#
>> +# An enumeration of Virtio device types.
>> +#
>> +# Since: 6.0
> ...this now needs to reference 6.1.

And these!

>
>> +##
>> +{ 'enum': 'VirtioType',
>> +  'data': [ 'unknown', 'virtio-9p', 'virtio-blk', 'virtio-serial',
>> +            'virtio-gpu', 'virtio-input', 'virtio-net', 'virtio-scsi',
>> +            'vhost-user-fs', 'vhost-vsock', 'virtio-balloon', 'virtio-crypto',
>> +            'virtio-iommu', 'virtio-pmem', 'virtio-rng' ]
>> +}
>> +
>> +##
>> +# @VirtioInfo:
>> +#
>> +# Information about a given VirtIODevice
>> +#
>> +# @path: VirtIO device canonical path.
>> +#
>> +# @type: VirtIO device type.
>> +#
>> +# Since: 6.0
> and throughout the series (I'll quit pointing it out)
>
>> +##
>> +# @x-debug-query-virtio:
>> +#
>> +# Return the list of all VirtIO devices
>> +#
>> +# Returns: list of @VirtioInfo
>> +#
>> +# Since: 6.0
>> +#
>> +# Example:
>> +#
>> +# -> { "execute": "x-debug-query-virtio" }
> That said, adding an 'x-' experimental feature is NOT locking us down,
> so if some maintainer still wants to include this in -rc1 on the grounds
> that it will help debugging other things, rather than pushing it out to
> 6.1 as a new feature, then keeping things as 6.0 is tolerable in that
> border-line case.  (If it misses -rc1, then I will become more adamant
> that it does not belong in 6.0)

Right, this patch is not at all urgent for 6.0. I just wanted to send this out to get
a review.

Best,
Jonah

>

--------------90E43320EC9EE756EDD68773
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/18/21 4:46 PM, Eric Blake wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:9d9c53a2-8fa1-f8f8-0ae8-59eff979cffe@redhat.com">
      <pre class="moz-quote-pre" wrap="">On 3/18/21 11:29 AM, Jonah Palmer wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>

This new command lists all the instances of VirtIODevice with
their path and virtio type

Signed-off-by: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>
Reviewed-by: Eric Blake <a class="moz-txt-link-rfc2396E" href="mailto:eblake@redhat.com">&lt;eblake@redhat.com&gt;</a>
Signed-off-by: Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a>
---
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
We've missed soft freeze for 6.0, and this feels like a new feature;
therefore...

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+++ b/hw/virtio/virtio.c
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 
+VirtioInfoList *qmp_x_debug_query_virtio(Error **errp)
+{
+    VirtioInfoList *list = NULL;
+    VirtioInfoList *node;
+    VirtIODevice *vdev;
+
+    QTAILQ_FOREACH(vdev, &amp;virtio_list, next) {
+        DeviceState *dev = DEVICE(vdev);
+        node = g_new0(VirtioInfoList, 1);
+        node-&gt;value = g_new(VirtioInfo, 1);
+        node-&gt;value-&gt;path = g_strdup(dev-&gt;canonical_path);
+        node-&gt;value-&gt;type = qapi_enum_parse(&amp;VirtioType_lookup, vdev-&gt;name,
+                                            VIRTIO_TYPE_UNKNOWN, NULL);
+        node-&gt;next = list;
+        list = node;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This should be updated to use QAPI_LIST_PREPEND rather than open coding.</pre>
    </blockquote>
    <pre>Ok! I'll update this.
</pre>
    <blockquote type="cite" cite="mid:9d9c53a2-8fa1-f8f8-0ae8-59eff979cffe@redhat.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+    }
+
+    return list;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index b7ece7a..2470e09 100644
--- a/include/hw/virtio/virtio.h
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+++ b/qapi/virtio.json
@@ -0,0 +1,68 @@
+##
+# = Virtio devices
+##
+
+##
+# @VirtioType:
+#
+# An enumeration of Virtio device types.
+#
+# Since: 6.0
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
...this now needs to reference 6.1.</pre>
    </blockquote>
    <pre>And these!
</pre>
    <blockquote type="cite" cite="mid:9d9c53a2-8fa1-f8f8-0ae8-59eff979cffe@redhat.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+##
+{ 'enum': 'VirtioType',
+  'data': [ 'unknown', 'virtio-9p', 'virtio-blk', 'virtio-serial',
+            'virtio-gpu', 'virtio-input', 'virtio-net', 'virtio-scsi',
+            'vhost-user-fs', 'vhost-vsock', 'virtio-balloon', 'virtio-crypto',
+            'virtio-iommu', 'virtio-pmem', 'virtio-rng' ]
+}
+
+##
+# @VirtioInfo:
+#
+# Information about a given VirtIODevice
+#
+# @path: VirtIO device canonical path.
+#
+# @type: VirtIO device type.
+#
+# Since: 6.0
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
and throughout the series (I'll quit pointing it out)

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+##
+# @x-debug-query-virtio:
+#
+# Return the list of all VirtIO devices
+#
+# Returns: list of @VirtioInfo
+#
+# Since: 6.0
+#
+# Example:
+#
+# -&gt; { &quot;execute&quot;: &quot;x-debug-query-virtio&quot; }
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
That said, adding an 'x-' experimental feature is NOT locking us down,
so if some maintainer still wants to include this in -rc1 on the grounds
that it will help debugging other things, rather than pushing it out to
6.1 as a new feature, then keeping things as 6.0 is tolerable in that
border-line case.  (If it misses -rc1, then I will become more adamant
that it does not belong in 6.0)</pre>
    </blockquote>
    <pre>Right, this patch is not at all urgent for 6.0. I just wanted to send this out to get
a review. 

Best,
Jonah
</pre>
    <blockquote type="cite" cite="mid:9d9c53a2-8fa1-f8f8-0ae8-59eff979cffe@redhat.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
    </blockquote>
  </body>
</html>

--------------90E43320EC9EE756EDD68773--

