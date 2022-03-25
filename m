Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B329C4E7A9A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 21:06:02 +0100 (CET)
Received: from localhost ([::1]:41606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXqC9-00036n-ER
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 16:06:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nXq5w-0006lZ-Tu
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:59:37 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:13928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nXq5s-0000pT-6H
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:59:35 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PHN3Eo010793; 
 Fri, 25 Mar 2022 19:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=92g/dZG4O010Jy+cduPhhiY6OAi20JZwfaFj1V1OCAk=;
 b=CN6wNXRdtgQ3mBoMXLp76oalAI1Q9IvmbpeNypvhPE7FSKZ8ARPcT9eCivQruZ9BHVaU
 4oe5MeNAY5paBNDHMESBS+t1Ft7EOz67nj2uaeC8jE6mlJ8Dplm6nRHIR0/XBU85c5kF
 jJLrIXhG2gPTXR0uvraqpRjRxcL/gdalKLNG9um4lsHYtA4ZkszU0xgfH8JFzYiuv8a1
 RjXbT2P4DqLlesSUJzZV1qWDHfyES3NkJUmVx0BjMUqWInfDkhy8TVCEaU7dHMwcpnmk
 ymWL0YjygZ0yfbE45IUdlJfwDJAw3/ABq1xPQmo1jGX4irKxqHMAGL3xSVRB4Mn7xaea AA== 
Received: from aserp3030.oracle.com ([141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew6ssg6fk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:59:16 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22PJxFYh063126;
 Fri, 25 Mar 2022 19:59:15 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by aserp3030.oracle.com with ESMTP id 3ew5793x7m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:59:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzW9QkRLTKgZPkXu/WyrIaiFlT6FidIYv0gR5a4ZHWWwx6h8wM8yjz8mvrAJE0m/jHTE7HvbxqtfLZfkUdlFGgqhqYf8JKLM3yfXnKasUfGAUGolaRBzhji3FOvqK+l7pRMQegOM7bQTm6ytpYwxM27NXn5a9GoNQs/uQIuAZk4g8fs5HzzKbtPWQXrXGkyCBxWEEC9ciarKm1qPtK/z7U6udG7lTZyqSMkt2RsbvlxPeV+NVC0SG6cvaUPiVyIqDG63USOOtc9Be0+T3uUNnClh8uQ3qGUi2qDWpssFSfnHnad49nTdnNesNiD01+B2TtQcsceID+pXdUmO40nBPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92g/dZG4O010Jy+cduPhhiY6OAi20JZwfaFj1V1OCAk=;
 b=NfkJdE3deRo0sr7E7+o2QRT59KW1MJLbYcQcLe3YYF4ROzTwdzh5usjNZnN9waDDE8uQtAHEQOMpzTb+trd12kiqVg2SWa0HKOsSAAy6YzFuhmenU2+nKVZYUGMHNsbfCizjpERdVQIxa+PzdnQt+pABDwpMu+UhwUdQQfmr4WODpUdpAQqpcVLMlkgCDum7/uhLLLDHlMA0NvywAV5xh3gmZ+b9OjGQhvSko8fMZ2DTDUFec1qD8GkwLa4BotHS8vSoYqStj/AT853zkMtx2GmMbXCr+jxUWJyn9zx2g1vb3MuNNWuelgnbW3NKwxYxiHWPCKbtnOoJm2lzL0IKNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92g/dZG4O010Jy+cduPhhiY6OAi20JZwfaFj1V1OCAk=;
 b=zXxsI7oQtsk+GMBW+T5p0qGLuTh15asP+NSBmG5QiAYMN9Rzci6dugOTG58dHbxE0uay46+OSU9b+wj3jh05n3/rjbZjl+kY9mkAzVAMLY1o9C1xs7FkajykJk01qma9auS1IUfIQCgxrOdyNjIBP4Izw0ygjIZnp88pg8wWOgc=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by SJ0PR10MB5693.namprd10.prod.outlook.com (2603:10b6:a03:3ec::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Fri, 25 Mar
 2022 19:59:13 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96%6]) with mapi id 15.20.5102.018; Fri, 25 Mar 2022
 19:59:13 +0000
Message-ID: <dde0ce95-a1e9-a662-66b6-1c17c77878fd@oracle.com>
Date: Fri, 25 Mar 2022 12:59:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] vdpa: Avoid reset when stop device
Content-Language: en-US
To: Michael Qiu <qiudayu@archeros.com>, Jason Wang <jasowang@redhat.com>,
 08005325@163.com, Eugenio Perez Martin <eperezma@redhat.com>
References: <1648024966-5170-1-git-send-email-08005325@163.com>
 <CACGkMEsjQp+gjHV23ntJ2oTBCdt-1TT0GGn-PFDjOvETz6sQ7A@mail.gmail.com>
 <df7c9a87-b2bd-7758-a6b6-bd834a7336fe@oracle.com>
 <6fbf82a9-39ce-f179-5e4b-384123ca542c@archeros.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <6fbf82a9-39ce-f179-5e4b-384123ca542c@archeros.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0100.namprd05.prod.outlook.com
 (2603:10b6:a03:334::15) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4dc3a7ff-bf55-4a5a-d4af-08da0e99eefa
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5693:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB569318324679350CFBD2DAD9B11A9@SJ0PR10MB5693.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c155u7VwsqCDr1EAVW2wDqM2IGjimZcUFAvZROQMAPflcV6RaQejmp5sNwFw8Fb950HglpAE0FCAbcAdhDdKpkr81lngkUVzKoK/fgyB5yh/1/paSz4yysHj3JRXcLpqdD1Ruwy5hjR6YtWU5qBCh8te0tAxs8tle2/by4VklA+/Cl308OQrvdTeZqXHVT2LzIGxFs83f8geYkxmWpTNiDy4mx6qVUWBdz7KjgSxWyqk1HGS5QhI/vEsr0qUDuud9y5dDaa4diHvsMZakY0uw2ljSwwGXJXZurv6a1ITVC9wm2E87YGb6Gws9L6+dkHxt+G68INcu36U+Irlqbem2CtWpAdHvDq8mwdCTfkMGpR8IzNAzYvrE+B0oR+DTxHZHYfy8xA39wDMEjTgHU0ivCPUhye7EI2Y3hwu+DM64cc06bN6w+OvYyjzNA6qhL8KmUMokwv8OJVeUvxSVtGMMehJDdaKREY/qvmT2fj/ggBJpT+NK4z8BUmJrEYDKtqes1TJJNuF5lZ+IBEUTpbR4xOhS8cWi1pjLySDsTlRrhwW1u1Ribjse9gUnJ6ia0a3RQiG7fZ6UGynv0LeLOFvGh2HPqFJolxO4ILtlCKJ5QSRCM8eG1kEAM7skRHFyeoG9iRF+FeASP+11y24mN2UULtVYhhpPAyPtWJ+u6hisyE/rObcfTVLOBo3IkNTQQApm9aEUoZjNzx+iSRrvov4ZF9oC9jgTngM5Xx4Ro0P5Pc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36916002)(6666004)(2616005)(6486002)(31696002)(86362001)(110136005)(2906002)(54906003)(316002)(8676002)(508600001)(26005)(186003)(5660300002)(83380400001)(53546011)(66946007)(38100700002)(6506007)(4326008)(31686004)(66476007)(36756003)(66556008)(6512007)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzBvclo1UndOZ09WbFpuRjFwNFc1MW1BUHJ0cDBFa0kxWGkxdFZNK3Y4bEs2?=
 =?utf-8?B?YzRGcm9YQXVWcUQvZkFDaSs5Wk5PUW92ODAzamNTR1FRckNPeEgwQThHZ0ov?=
 =?utf-8?B?Mk5jNXJyNmUrWENKV3E2bUF0cktlNUM4YzB3ZnZMRU1LSkRyVkZNVkxJdzNH?=
 =?utf-8?B?aEI1NzdGQkI2MSttVll1OTVIVTJ3Qk1BalVwSjBRbGJ6T0Z1bU1VRFJjRVdx?=
 =?utf-8?B?cmtOaGs1a056ZW9JLzZlTUlUYTNhWXI2dGxBQTdYWi9PMytrZnBLTWJNLzVh?=
 =?utf-8?B?elQvL3BmbXVyRVQvUWh1QmhKVFJsRktTeTRIOUMyZmdKQitxYmdFNDhsM2Qr?=
 =?utf-8?B?RGhDQzVYQUJJY1NSRGJUYk5hWUZJM0hkNVk0eHVTcExGRWFXdjFoMGMzN1o3?=
 =?utf-8?B?dlZUKzNrWWh0b2lVMzlXc2cwSDgzUmZtNW1Md1JURGw3WVM4T21adEhrTEtU?=
 =?utf-8?B?dXJpcmkxUHY4UHgwMW9WMlpXcTV3UFdPV1RMUU1EbGtZck9leFVBK1ZCSkhO?=
 =?utf-8?B?d1hiczFHdjYxQndLVmx3NzB3L3VoN2QzRmNVSlJ2cHVzdWsxcXJSZFlpRXBF?=
 =?utf-8?B?bzFsa3hzTU9TbWxIU0dwS29uR2E5aVFiWlJ2TTFqQ1JtQ0VKaFNWb2dDeE5T?=
 =?utf-8?B?aEJudThMRXhuVDhGNThhUTFORFZYOTYrRmQ0b3EwVW1FS1ZZUUFLcFlCY2x6?=
 =?utf-8?B?RnpsMk5mS3ByeVdqWExNa2NyS2lhU0U4Smo1Yjl6TFp0Qm41T09vNWZJbVFz?=
 =?utf-8?B?dmliRjJxY0l0RXc4ejNkWTJYdENRaGt2THNNUkVkemFpRzFBNXdOWDNnYWNM?=
 =?utf-8?B?YmRibnI3L21URHhkQ0JRVC9kZkpxeXQ0c3B3YVpyYlduUkgvWHlQeTR1R3J1?=
 =?utf-8?B?Z0pQc3N0Nkp6OXhTS3dWRlNPc0dJRTdDa2puRDNJWEcxTGRLV3BHMGczZFlk?=
 =?utf-8?B?bjN5bHJ4SURuRXhjQUlQbW9meFpFUFhxYm43RjVCSHg0OTcxWUdQa005MElK?=
 =?utf-8?B?Z2hhbmFYRDhmM2pHZ0E5STBjTVl2d2lyeFVvRVhyZ29HMDZOMmJuUU5wMXZD?=
 =?utf-8?B?bHNVYnF1L3R6dzhDbG1GMENvZnhWYUN4ZlVtakM4blc0OW1GVXo1VDlKMXlK?=
 =?utf-8?B?U2ZVcVpEbjRwSTQ1MDRqQmFpTzNvVmMzd1k4bk04SXJuYkNPUUpWWFlHajg3?=
 =?utf-8?B?SmVad3dwWm9YU2NkLzF3MjlKc1B5cGsycElyYmozYUZrOXdEQmJEK0sxNW44?=
 =?utf-8?B?NW5GTHlVNC9RbjUrYjQveHkyMTlNTDJ6S1VVVzA4SnlaQ256NGR5Q2pNU0M0?=
 =?utf-8?B?UnMzVFpRVTIrcVJwVE90YU0vT0JKMUFJeWVZR2ZJTHFTUS9BazZ6MU01MmxD?=
 =?utf-8?B?bk5iQW5rSmNXVnBqMi9EMHdBdXdQRmpnQ2g1b0hLTW1PK3NsZUFLWml3ZXNr?=
 =?utf-8?B?UzgvTDlWdDVFbmRHVDA5VzkybEdMMXFvMnBwOGxaNU0rZlNEL3FrSFhQSkF6?=
 =?utf-8?B?d3lZOStFaHNGQ2xjZUhCVnZWUUJORzN3OXY1QlB5dEpYNVlBTnZuN3NWYk1K?=
 =?utf-8?B?NzRnMlo2NzBpQzllVTVSRWplWG1PMDFvb1I5QWZ3UGNJZi9lYk9DaGRXaFRw?=
 =?utf-8?B?V3dLK2RaQTFVaTNjdkd5TWxnZjArZy9hQTJrYUF6V1ZSQ0FKRkx0MWV1UGJS?=
 =?utf-8?B?c3EwaDFxbEJ2K2w0aUJjUU1WMk1ubzI2UUxzU25DeE9xcmJZRXNmaCt4VEcz?=
 =?utf-8?B?MWN1bnJFbGRSeTNZZ0F3SnU3U1Z2NWx2clkweDVta3BVdVE1ZkRNR0FEdjk4?=
 =?utf-8?B?U256Uk5SNXoweTdJeUtPc1N4aUhLOUUvc0ppRFYzZXh2UGF4ZWMxbFRJaUF4?=
 =?utf-8?B?bDQ0aHpiVm9PMGlNUVFEdm9QUnRNVlVKWXJKbTFBRFJOSFZzK1h4WHZXemVL?=
 =?utf-8?B?V3dlT3RoN2NoRUM1bFdvanRwU2wrNHA1a0JyNHFUUDVTeUFHY2x0VmFjNDlT?=
 =?utf-8?B?dk10ekdacmNLeFNqU0JpbVJkYldhZzRHUndIMHVQdCs5VTFZYjFjTVQ0NS8w?=
 =?utf-8?B?UzNDVkpNaktJRElsem9TcThOcHZlZUxkdXg1eVhvVi9ibndjY0c0azhIdlFx?=
 =?utf-8?B?cFRxN0Ntc1oxM0EvVUtVV1M1WlFNZkhOUlN2azYrS3pzdmdNTk1UakxjK05V?=
 =?utf-8?B?Z0VoSG5BUDdPMk5obXJzK2VVTHZwYUYxbi9sUVkrclQzd1haUHl4U3lqT3dK?=
 =?utf-8?B?MW5QaEU3MFcvMUxuRTlURndmZXJ0Y3hXWmcvR042SEhVTjlscHVLa2NuSUh5?=
 =?utf-8?B?YjZSUngwTEV3eWJRZlgvQWY4WjdiMVFMd0pzSmRIbFZsRG1oV3RGdz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc3a7ff-bf55-4a5a-d4af-08da0e99eefa
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 19:59:13.0734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wDhT+Ny0UsC42JJlAq42wIcemKDJ8aX5BYKsfMkVKwDtreobgN9YpFzTuXCIWGvfE5YJUpzz2cn+r/Sfm6F6OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5693
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10297
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203250110
X-Proofpoint-ORIG-GUID: 5O5HGVB-4_MqDzigS93li1_buGNUJdwH
X-Proofpoint-GUID: 5O5HGVB-4_MqDzigS93li1_buGNUJdwH
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Zhu Lingshan <lingshan.zhu@intel.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/25/2022 12:18 AM, Michael Qiu wrote:
>
>
> On 2022/3/25 14:32, Si-Wei Liu Wrote:
>>
>>
>> On 3/23/2022 2:20 AM, Jason Wang wrote:
>>> Adding Eugenio,  and Ling Shan.
>>>
>>> On Wed, Mar 23, 2022 at 4:58 PM <08005325@163.com> wrote:
>>>> From: Michael Qiu <qiudayu@archeros.com>
>>>>
>>>> Currently, when VM poweroff, it will trigger vdpa
>>>> device(such as mlx bluefield2 VF) reset twice, this leads
>>>> to below issue:
>>>>
>>>> vhost VQ 2 ring restore failed: -22: Invalid argument (22)
>>>>
>>>> This because in vhost_dev_stop(), qemu tries to stop the device,
>>>> then stop the queue: vhost_virtqueue_stop().
>>>> In vhost_dev_stop(), it resets the device, which clear some flags
>>>> in low level driver, and the driver finds
>>>> that the VQ is invalied, this is the root cause.
>>>>
>>>> Actually, device reset will be called within func release()
>>>>
>>>> To solve the issue, vdpa should set vring unready, and
>>>> remove reset ops in device stop: vhost_dev_start(hdev, false).
>>> This is an interesting issue. Do you see a real issue except for the
>>> above warnings.
>>>
>>> The reason we "abuse" reset is that we don't have a stop uAPI for
>>> vhost. We plan to add a status bit to stop the whole device in the
>>> virtio spec, but considering it may take a while maybe we can first
>>> introduce a new uAPI/ioctl for that.
>> Yep. What was missing here is a vdpa specific uAPI for per-virtqueue 
>> stop/suspend rather than spec level amendment to stop the whole 
>> device (including both vq and config space). For now we can have vDPA 
>> specific means to control the vq, something vDPA hardware vendor must 
>> support for live migration, e.g. datapath switching to shadow vq. I 
>> believe the spec amendment may follow to define a bit for virtio 
>> feature negotiation later on if needed (FWIW virtio-vdpa already does 
>> set_vq_ready(..., 0) to stop the vq).
>>
>> However, there's a flaw in this patch, see below.
>>>
>>> Note that the stop doesn't just work for virtqueue but others like,
>>> e.g config space. But considering we don't have config interrupt
>>> support right now, we're probably fine.
>>>
>>> Checking the driver, it looks to me only the IFCVF's set_vq_ready() is
>>> problematic, Ling Shan, please have a check. And we probably need a
>>> workaround for vp_vdpa as well.
>>>
>>> Anyhow, this seems to be better than reset. So for 7.1:
>>>
>>> Acked-by: Jason Wang <jasowang@redhat.com>
>>>
>>>> Signed-off-by: Michael Qiu<qiudayu@archeros.com>
>>>> ---
>>>>   hw/virtio/vhost-vdpa.c | 8 ++++----
>>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>>> index c5ed7a3..d858b4f 100644
>>>> --- a/hw/virtio/vhost-vdpa.c
>>>> +++ b/hw/virtio/vhost-vdpa.c
>>>> @@ -719,14 +719,14 @@ static int vhost_vdpa_get_vq_index(struct 
>>>> vhost_dev *dev, int idx)
>>>>       return idx;
>>>>   }
>>>>
>>>> -static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
>>>> +static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, 
>>>> unsigned int ready)
>>>>   {
>>>>       int i;
>>>>       trace_vhost_vdpa_set_vring_ready(dev);
>>>>       for (i = 0; i < dev->nvqs; ++i) {
>>>>           struct vhost_vring_state state = {
>>>>               .index = dev->vq_index + i,
>>>> -            .num = 1,
>>>> +            .num = ready,
>>>>           };
>>>>           vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
>>>>       }
>>>> @@ -1088,8 +1088,9 @@ static int vhost_vdpa_dev_start(struct 
>>>> vhost_dev *dev, bool started)
>>>>           if (unlikely(!ok)) {
>>>>               return -1;
>>>>           }
>>>> -        vhost_vdpa_set_vring_ready(dev);
>>>> +        vhost_vdpa_set_vring_ready(dev, 1);
>>>>       } else {
>>>> +        vhost_vdpa_set_vring_ready(dev, 0);
>>>>           ok = vhost_vdpa_svqs_stop(dev);
>>>>           if (unlikely(!ok)) {
>>>>               return -1;
>>>> @@ -1105,7 +1106,6 @@ static int vhost_vdpa_dev_start(struct 
>>>> vhost_dev *dev, bool started)
>>>>           memory_listener_register(&v->listener, 
>>>> &address_space_memory);
>>>>           return vhost_vdpa_add_status(dev, 
>>>> VIRTIO_CONFIG_S_DRIVER_OK);
>>>>       } else {
>>>> -        vhost_vdpa_reset_device(dev);
>> Unfortunately, the reset can't be be removed from here as this code 
>> path usually involves virtio reset or status change for e.g. invoked 
>> via virtio_net_set_status(... , 0). Ideally we should use the 
>> VhostOps.vhost_reset_device() to reset the vhost-vdpa device where 
>> status change is involved after vhost_dev_stop() is done, but this 
>> distinction is not there yet as of today in all of the virtio devices 
>> except vhost_user_scsi.
>>
>> Alternatively we may be able to do something like below, stop the 
>> virtqueue in vhost_vdpa_get_vring_base() in the 
>> vhost_virtqueue_stop() context. Only until the hardware vq is 
>> stopped, svq can stop and unmap then vhost-vdpa would reset the 
>> device status. It kinda works, but not in a perfect way...
As I indicated above, this is an less ideal way to address the issue you 
came across about, without losing functionality or introducing 
regression to the code. Ideally it'd be best to get fixed in a clean 
way, though that would a little more effort in code refactoring. 
Personally I feel that the error message you saw is somewhat benign and 
don't think it caused any real problem. Did you see trouble if living 
with the bogus error message for the moment?

>>
>> --- a/hw/virtio/vhost-vdpa.c
>> +++ b/hw/virtio/vhost-vdpa.c
>> @@ -564,14 +564,14 @@ static int vhost_vdpa_get_vq_index(struct 
>> vhost_dev *dev, int idx)
>>       return idx;
>>   }
>>
>> -static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
>> +static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, int 
>> enable)
>>   {
>>       int i;
>>       trace_vhost_vdpa_set_vring_ready(dev);
>>       for (i = 0; i < dev->nvqs; ++i) {
>>           struct vhost_vring_state state = {
>>               .index = dev->vq_index + i,
>> -            .num = 1,
>> +            .num = enable,
>>           };
>>           vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
>>       }
>> @@ -641,7 +641,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev 
>> *dev, bool started)
>>
>>       if (started) {
>>           vhost_vdpa_host_notifiers_init(dev);
>> -        vhost_vdpa_set_vring_ready(dev);
>> +        vhost_vdpa_set_vring_ready(dev, 1);
>>       } else {
>>           vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
>>       }
>> @@ -708,6 +708,9 @@ static int vhost_vdpa_get_vring_base(struct 
>> vhost_dev *dev,
>>   {
>>       int ret;
>>
>> +    /* Deactivate the queue (best effort) */
>> +    vhost_vdpa_set_vring_ready(dev, 0);
>> +
>
> I don't think it's a good idea to change the state in "get" function,
>
> get means "read" not "write".
Well, if you look at the context of vhost_vdpa_get_vring_base(), the 
only caller is vhost_virtqueue_stop(). Without stopping the hardware 
ahead, it doesn't make sense to effectively get a used_index snapshot 
for resuming/restarting the vq. It might be more obvious and sensible to 
see that were to introduce another Vhost op to suspend the vq right 
before the get_vring_base() call, though I wouldn't bother doing it.

>
>>       ret = vhost_vdpa_call(dev, VHOST_GET_VRING_BASE, ring);
>>       trace_vhost_vdpa_get_vring_base(dev, ring->index, ring->num);
>>       return ret;
>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>> index 437347a..2e917d8 100644
>> --- a/hw/virtio/vhost.c
>> +++ b/hw/virtio/vhost.c
>> @@ -1832,15 +1832,15 @@ void vhost_dev_stop(struct vhost_dev *hdev, 
>> VirtIODevice *vdev)
>>       /* should only be called after backend is connected */
>>       assert(hdev->vhost_ops);
>>
>> -    if (hdev->vhost_ops->vhost_dev_start) {
>> -        hdev->vhost_ops->vhost_dev_start(hdev, false);
>> -    }
>>       for (i = 0; i < hdev->nvqs; ++i) {
>>           vhost_virtqueue_stop(hdev,
>>                                vdev,
>>                                hdev->vqs + i,
>>                                hdev->vq_index + i);
>>       }
>> +    if (hdev->vhost_ops->vhost_dev_start) {
>> +        hdev->vhost_ops->vhost_dev_start(hdev, false);
>> +    }
>>
>
> This first idea comes to me is just like this, but at last I don't 
> choose this solution.
>
> When we start a device, first we start the virtqueue then 
> vhost_ops->vhost_dev_start.
>
> So in stop stage, in my opinion, we should just do the opposite, do as 
> the orignal code do. Change the sequential is a dangerous action.
I don't see any danger yet, would you please elaborate the specific 
problem you see? I think this sequence is as expected:

1. suspend each individual vq i.e. stop processing upcoming request, and 
possibly complete inflight requests  -> get_vring_base()
2. tear down virtio resources from VMM for e.g. unmap guest memory 
mappings, remove host notifiers, and et al
3. reset device -> vhost_vdpa_reset_device()

Regards,
-Siwei

>
> Thanks,
> Michael
>>       if (vhost_dev_has_iommu(hdev)) {
>>           if (hdev->vhost_ops->vhost_set_iotlb_callback) {
>>
>> Regards,
>> -Siwei
>>
>>>>           vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>>>> VIRTIO_CONFIG_S_DRIVER);
>>>>           memory_listener_unregister(&v->listener);
>>>> -- 
>>>> 1.8.3.1
>>>>
>>>
>>
>>


