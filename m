Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EA55B876E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 13:44:40 +0200 (CEST)
Received: from localhost ([::1]:56616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYQoo-00025u-Px
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 07:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1oYQdm-0003Eb-0l
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:33:14 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:62536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1oYQdh-0005EP-CP
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 07:33:13 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28EAxCPI024214;
 Wed, 14 Sep 2022 11:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=ac3ZnMAra0JSsvFIoT2l59yUalFUU1om6QmNTDZxwd8=;
 b=M3ghskyL5BcydVTZvkpZYMEqQ/wvnOtmcprUTihCARu7C4tnEasMcYbmQXM66ikYAkT4
 6WQLr6S18rkvva7kKZ8yW/Hte0bMUuMAKiJPii/g0E9ZDrmvHY7EVW3gB4P/9toq7A3w
 KHpIijdw/HMTJep/Omn82eGQWfPPjPY4ySPwlMim0w11maewE4apHMBi3ZJ/K5gF18Ni
 XTw8A6w5UR08ID/5gyNsh2mTgV6FFKBdhf8ICV3xvG4c61qY4wcz61wNS5/vWbMoWAlw
 wpWTIZ6xoWvP0Hi4OlHX/4JGu7GjeCfpMf6OckRxM/7fPqebpDwT6lxFyAkgu+KwNckH 5A== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jjxypa04n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Sep 2022 11:32:28 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28E9fpeT013062; Wed, 14 Sep 2022 11:32:27 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3jjym4bqra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Sep 2022 11:32:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEKTVdMXep0k1XbMozPK0nNQk/6cqt+pY2uOrc1n8cYZku3+e0xAMmRw7T2pvFtHV/BbDun5WoycyIaWBT7uz6jr/eAiY6BxE3lLdXvqk2qIxZjqqaaxnNQplZ8X96S9Ue/88dd4uc1gFBhC3nbZ1kcASA+zAV2E1aw7Y1ISbUntwPfe6a90An35F90xrQCkJPG3c1hn4+QE09fubkpDnvzzXOnRjU5DFqtZQ9HZHecFswqDSjV0NJ5EUbdflqONC/upjIvVT3mcLBgZLAKM/U/AVb5Uu06f2+jY6glmXc2Kk7CZqLgYjrKmQAuvZjXiTookuS7fdNDo5wx7eKPobw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ac3ZnMAra0JSsvFIoT2l59yUalFUU1om6QmNTDZxwd8=;
 b=IpLbtBLwoWKQB/o29Ld2uhPJshzqxgphJ3OjWGFxde9DhUCEJNcNogRYpbhpC8k5BRt4y2r5SkHxQs5QglDmRZ20V2m1Lp/2NLlbEbl8qWtAcsgKWAT4NQEhO4SjNY+V0ivduDHhcZyYoT8xgI+GS+vz8NlZa+sCEheiwRmS451taPm3KPQUha68smM6OG07Yk8DVf4+dkITl258gC0UVstcL8YRm1mTWG/hTfc8qdkelRQhz240SDstTHQa24kv00CUKx8rNWAzfdkZfPEDkYeRk6P3Xk0ldF2TcFzSTEEysLuUnd6oK0wOypxSm+slX/ylzP96UBRENPbs3Ng7Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ac3ZnMAra0JSsvFIoT2l59yUalFUU1om6QmNTDZxwd8=;
 b=oi04+WhbkUKX1IMSgFitMs+qDQFI017ga75dazLhREmgjgHu3hKnzqeBQGh+Ewml/HUQFLkvMxed+SUjW0Zuxc1HSMt1gWcW1Lp3SvLvNegi8fEgB2SuM0CQv9+FLFIs+huCNf5IBeN4trusaPdTbM66Y2VFUx0KvHGBVNZLab0=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by SN4PR10MB5574.namprd10.prod.outlook.com (2603:10b6:806:205::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 14 Sep
 2022 11:32:24 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::f87e:a65f:758e:688b]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::f87e:a65f:758e:688b%5]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 11:32:24 +0000
Message-ID: <34969f96-b7c4-c9f8-2248-3e84a84148b2@oracle.com>
Date: Wed, 14 Sep 2022 12:32:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/3] vdpa: load vlan configuration at NIC startup
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>,
 Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Cindy Lu <lulu@redhat.com>,
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
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CACGkMEvW5ZUZEcx9COvwjAT5PUraoko8k1foBez=T1nmhjKpDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0320.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::19) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3287:EE_|SN4PR10MB5574:EE_
X-MS-Office365-Filtering-Correlation-Id: 19cb37fe-e738-49c3-952b-08da9644cb9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: czFpkIDI1id39yLaOD97a/fDtKTWZZyht16sT/2kTMhi5EZPHdRf8jZDINJw9mYClxnmnZ9aE49Rvgml9QdePKrcxNCp9t4HbIXK1Rd8gS4KolyTcD8HEqMwtSKD6Sh7PuEZ5tr892IAlRYDox4qpTdT73xMCmcC37DBnamL2wXLGa1FBP9/QoepPWHZ0a4Wz0EuUStUZAmzrhFQI64o0Y9OYkW+ZuUaXgJtZ/Ot4uYBgw/RK0LuBsGjhUmv0o09sfCldHPBl6X04CHTTakfPXmEBOLj7JnVS76gNBSjwUT94hsB3yg7YTq3t4QMZp17wcGLnUXevjEDibkYY96ixszfhKN9PN0uOI4302EeEvKvxaWL2Lvl9vxu9n34JJYNnCFPFnoZIISdoytLRGbnx5u5W/mDpT0tCUbrbAwpSXKUMwaBvmHFnpnXxPDmOBNpruKOKtJRLVcoHaYbJZ4u31/DmBrPPr0jzSswZbq4CLxVj2lnqG4irZMxajjLn3yqNvZStXqOp0cnx+DwnjEaZl2VeZKP0doXoDI8s5i6FzicnMiuW4/LNAq4FaE8B0XlfvIkKmjvCcFdbxTEugJhFJ4qwyJHm72K0TYMp3nG1/yNdYCK/du9HjnbP+GXTbxdXNCM1QvDOQzEw+7msFACBjO+7q8Cl9r6d9ayjRy0NXNdpG3PN8+FMHFj5Vlm+8KraNEotq8C3rr9J+oj1rN+Qu267TsWToj/ba/dd7J4IlLGT+2y0dbXgeyZZvgGNjVICp5YbMSebqA6sZOBl2iTlVaeltGj2B92tdrdDjZjHv0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199015)(316002)(110136005)(26005)(6512007)(186003)(54906003)(5660300002)(7416002)(41300700001)(53546011)(4326008)(66574015)(86362001)(31696002)(36756003)(6506007)(2616005)(66556008)(31686004)(38100700002)(36916002)(6486002)(8676002)(83380400001)(6666004)(66946007)(8936002)(478600001)(2906002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2ZRalQxbzF0QzVXOGZ2MXZzZDhHaGRQd0ZwcnBPcmZvK0s0emg0RzQ2UERD?=
 =?utf-8?B?VE0xSE5ORk5NTUUreFc1OWdXeVdIR0M1dkV0VHR1YXpyZzZjTk81d29PcGtu?=
 =?utf-8?B?V3lLUG0zZmtQZmgwNDRMTXF5ZjN0Tm1TbGI2NnVTL05WaDdVZjRVTTR1NkFX?=
 =?utf-8?B?MWNYR2RIYi9qVFhIWVVxZlh5bUNkT3ZKK05IdnU1TkNnYmJkaWlWVEZBaUdN?=
 =?utf-8?B?cWNjUzF3d0Uwbm1oNVVidkRRTi8vaTF5dURQZ0RDSHdlejZ6dnREaHZzMVI0?=
 =?utf-8?B?eHdPakN5TWJqTnlRNWpQRW5zMTRISk5GYzZxMm5YWTROVEhhNzlQaDM2eHc4?=
 =?utf-8?B?bTV2RWpDR1RjZjZJU3J1Q3BZMHdzYkhXQTNVc0tFZnd4RE82ekRyY0taV3Vn?=
 =?utf-8?B?WTcrWVJBdDJPdWp2Nk1jODJVN09HUVJ0YlgreHIyanpXdnhuRkZybTl0VVUr?=
 =?utf-8?B?SWFYV1kvMUliVXpCdkt3Q09tR2ZZRnN6Qms0TCtpK29veDBKN1FJWWxVdGdF?=
 =?utf-8?B?ZEhwREp0SkNMY3BweHhCYjlURHBSZGZWUnVrQmpUeDdBYU1ZNGh4dEpWWkp0?=
 =?utf-8?B?OU14c2xFMUd5ZUtMSEpWdlI2NkVMZmlHTm1adDNldkI0Y1FoakVSR3dGOEtB?=
 =?utf-8?B?ZktPVTVTMmRZTUw1M0V2UjIwckJ0TG1lelZrOC81bnA0SGlMQ3NYSkZZZU5Y?=
 =?utf-8?B?WkpSb2NIZGl5STVHS1pNQzIzUDl5aDhmY2hjV0tkQTRXSnBqMjlBcjllWkZq?=
 =?utf-8?B?RGVGeGlaU0hGOE0yNlhVZFFUdnNGWDJDWm9FV1M0Vk90dCtKbjRPQm5iUzZZ?=
 =?utf-8?B?TVhQWFlZRmNVWmpDM2pDcmlvK1BESGtmRzlCVVJwZi8zd05VV1QzMmppbm5a?=
 =?utf-8?B?cVV1NGhDRUdTQnMzWVpEN2xDNWdBbTR0Qy9Ea1RHWDRtMkY5MlNHcHlFUE54?=
 =?utf-8?B?NkUrWUlQYndOOVBJYlp5ZDJRaW5NZDhmYTY1Sm1QNzh1QnVWYURFS0l5cFIy?=
 =?utf-8?B?UWpYU0RGSU1TVS96M1NDTVZSQnRPMzYvMHV4dGY0R2Z5eHpBMVBDUlNOVnhN?=
 =?utf-8?B?TFJLVHhhdVp6ZGY3enJENUZ5eUsyS05MTWFOK3UwQTJSMEdHanBqOWxDREc1?=
 =?utf-8?B?R0JFVnpObXpRRmVDbmxDSnpqcU5aWnZqWExZcC9sSnk0Wkc1aXRWQ1p6MSsx?=
 =?utf-8?B?ZWFPbmUyeWRaN3BoZUpLK1hLV3RJVlMxQVlYZWUwZG9CNTFybHU3bFNYMzVz?=
 =?utf-8?B?UjB5RVFUcEJEdVF0NExCbklRclZpSzNjcHlmUzBkaTF3OFcxUy9vUWR3OGRK?=
 =?utf-8?B?enFlZDhaOFMvSDUrZHBROStrZVd3c0xNS0dIZjg3amIzUTMzZ2dQNDB0czBo?=
 =?utf-8?B?NUt3bm95M3Vhb1o5M1BrODJubkcvWlB3N3h4WUIrUFRDQWdrTDQxSzllUmd2?=
 =?utf-8?B?UkQxcGJKWlNQYU5sNllLZDRqUHZWbG4xV2pQNjFhbzZWaEJZK2o3ZldvMnBU?=
 =?utf-8?B?WVlxSGN0WnErNTNIL2xtSFA4UDZ2MXJjNTZWbzByWFVXdzVhb0dvcEFrRlo0?=
 =?utf-8?B?cUh3RnZBTmQwMWVhMjNROVdZNnNmNjJlVzNlL3EzM1JxOCttdENZdlV2eU1U?=
 =?utf-8?B?NHZzaCtreEoyNmVYRHNiWlkwekdpMi83VituQzFOdEpwWno1N3RwbWEzcVBr?=
 =?utf-8?B?bjNsZ0MxeG14Q09ldE4xN2VtdHpLMm9wUDJGLzFic0ZOQlM1bVljVVQ1MjFm?=
 =?utf-8?B?TkNlMno5TWVzZmQxNWRtS1R4a3UrNW5tUWRwYTJmZXkrL2dKNE5Iek9NTDNt?=
 =?utf-8?B?aDRFREJ4OWQyckJwTUQzZFhOT0pyVEp5NW5FV0Ztdkg5Yi9uOFZHUEs5clFr?=
 =?utf-8?B?aE1iNHBiSGxQdVI4VnpQM3J2cVdueThHYzJubHRrSDdRZnJIMmhGMC8rT3hK?=
 =?utf-8?B?NlFucmxkLzNPLzBDUWpNMTZ1MzlTVks0QnFsSHk0dmwwbzlCVGh6MlJiS0Uw?=
 =?utf-8?B?MUFvWEQ2RW1ITWFUZjFvcmlmUHFwZklkUlZrOXBwRUxjWWVMcElHRE5Zb3Ax?=
 =?utf-8?B?WGdOV3d6eXNNWU8vUndCc2tOa1V2MGpUaEFJM0wxVit1QU83cHIxNzQwY0o3?=
 =?utf-8?Q?XhZAFQq0Yx4XDAHM4Bv0npcYH?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19cb37fe-e738-49c3-952b-08da9644cb9d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 11:32:24.7047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D3NCgzydh5ISrrCZvhwJCf2Jr6Wh0wpgegrMJqvXkcMavlDNxUcSCDNTgpH5k8bMRZ37T+SFlO/+6FcJT5Ew2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5574
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-14_04,2022-09-14_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2208220000
 definitions=main-2209140056
X-Proofpoint-ORIG-GUID: 77hlCR0Symx1TtOPTuQeAIuJQiUkExDg
X-Proofpoint-GUID: 77hlCR0Symx1TtOPTuQeAIuJQiUkExDg
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



On 9/14/2022 3:20 AM, Jason Wang wrote:
> On Fri, Sep 9, 2022 at 4:02 PM Eugenio Perez Martin <eperezma@redhat.com> wrote:
>> On Fri, Sep 9, 2022 at 8:40 AM Jason Wang <jasowang@redhat.com> wrote:
>>> On Fri, Sep 9, 2022 at 2:38 PM Jason Wang <jasowang@redhat.com> wrote:
>>>> On Wed, Sep 7, 2022 at 12:36 AM Eugenio Pérez <eperezma@redhat.com> wrote:
>>>>> To have enabled vlans at device startup may happen in the destination of
>>>>> a live migration, so this configuration must be restored.
>>>>>
>>>>> At this moment the code is not accessible, since SVQ refuses to start if
>>>>> vlan feature is exposed by the device.
>>>>>
>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>> ---
>>>>>   net/vhost-vdpa.c | 46 ++++++++++++++++++++++++++++++++++++++++++++--
>>>>>   1 file changed, 44 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>>>> index 4bc3fd01a8..ecbfd08eb9 100644
>>>>> --- a/net/vhost-vdpa.c
>>>>> +++ b/net/vhost-vdpa.c
>>>>> @@ -100,6 +100,8 @@ static const uint64_t vdpa_svq_device_features =
>>>>>       BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
>>>>>       BIT_ULL(VIRTIO_NET_F_STANDBY);
>>>>>
>>>>> +#define MAX_VLAN    (1 << 12)   /* Per 802.1Q definition */
>>>>> +
>>>>>   VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
>>>>>   {
>>>>>       VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
>>>>> @@ -423,6 +425,47 @@ static int vhost_vdpa_net_load_mq(VhostVDPAState *s,
>>>>>       return *s->status != VIRTIO_NET_OK;
>>>>>   }
>>>>>
>>>>> +static int vhost_vdpa_net_load_single_vlan(VhostVDPAState *s,
>>>>> +                                           const VirtIONet *n,
>>>>> +                                           uint16_t vid)
>>>>> +{
>>>>> +    ssize_t dev_written = vhost_vdpa_net_load_cmd(s, VIRTIO_NET_CTRL_VLAN,
>>>>> +                                                  VIRTIO_NET_CTRL_VLAN_ADD,
>>>>> +                                                  &vid, sizeof(vid));
>>>>> +    if (unlikely(dev_written < 0)) {
>>>>> +        return dev_written;
>>>>> +    }
>>>>> +
>>>>> +    if (unlikely(*s->status != VIRTIO_NET_OK)) {
>>>>> +        return -EINVAL;
>>>>> +    }
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static int vhost_vdpa_net_load_vlan(VhostVDPAState *s,
>>>>> +                                    const VirtIONet *n)
>>>>> +{
>>>>> +    uint64_t features = n->parent_obj.guest_features;
>>>>> +
>>>>> +    if (!(features & BIT_ULL(VIRTIO_NET_F_CTRL_VLAN))) {
>>>>> +        return 0;
>>>>> +    }
>>>>> +
>>>>> +    for (int i = 0; i < MAX_VLAN >> 5; i++) {
>>>>> +        for (int j = 0; n->vlans[i] && j <= 0x1f; j++) {
>>>>> +            if (n->vlans[i] & (1U << j)) {
>>>>> +                int r = vhost_vdpa_net_load_single_vlan(s, n, (i << 5) + j);
>>>> This seems to cause a lot of latency if the driver has a lot of vlans.
>>>>
>>>> I wonder if it's simply to let all vlan traffic go by disabling
>>>> CTRL_VLAN feature at vDPA layer.
>> The guest will not be able to recover that vlan configuration.
> Spec said it's best effort and we actually don't do this for
> vhost-net/user for years and manage to survive.
I thought there's a border line between best effort and do nothing. ;-)

I think that the reason this could survive is really software 
implementation specific - say if the backend doesn't start with VLAN 
filtering disabled (meaning allow all VLAN traffic to pass) then it 
would become a problem. This won't be a problem for almost PF NICs but 
may be problematic for vDPA e.g. VF backed VDPAs.
>
>>> Another idea is to extend the spec to allow us to accept a bitmap of
>>> the vlan ids via a single command, then we will be fine.
>>>
>> I'm not sure if adding more ways to configure something is the answer,
>> but I'd be ok to implement it.
>>
>> Another idea is to allow the sending of many CVQ commands in parallel.
>> It shouldn't be very hard to achieve using exposed buffers as ring
>> buffers, and it will short down the start of the devices with many
>> features.
> In the extreme case, what if guests decide to filter all of the vlans?
> It means we need MAX_VLAN commands which may exceeds the size of the
> control virtqueue.
Indeed, that's a case where a single flat device state blob would be 
more efficient for hardware drivers to apply than individual control 
command messages do.

-Siwei
>
> Thanks
>
>> Thanks!
>>
>>> Thanks
>>>
>>>> Thanks
>>>>
>>>>> +                if (unlikely(r != 0)) {
>>>>> +                    return r;
>>>>> +                }
>>>>> +            }
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>>   static int vhost_vdpa_net_load(NetClientState *nc)
>>>>>   {
>>>>>       VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
>>>>> @@ -445,8 +488,7 @@ static int vhost_vdpa_net_load(NetClientState *nc)
>>>>>       if (unlikely(r)) {
>>>>>           return r;
>>>>>       }
>>>>> -
>>>>> -    return 0;
>>>>> +    return vhost_vdpa_net_load_vlan(s, n);
>>>>>   }
>>>>>
>>>>>   static NetClientInfo net_vhost_vdpa_cvq_info = {
>>>>> --
>>>>> 2.31.1
>>>>>


