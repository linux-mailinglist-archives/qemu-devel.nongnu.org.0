Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E805FD95D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 14:43:29 +0200 (CEST)
Received: from localhost ([::1]:56456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oixYe-0006jT-3I
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 08:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oixIU-0002gJ-7G; Thu, 13 Oct 2022 08:26:46 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:42046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oixHy-00024s-Ar; Thu, 13 Oct 2022 08:26:40 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29DCK3cV020269;
 Thu, 13 Oct 2022 12:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 from : subject : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=5Glu6RhpgigIQQSAXoRBijfYzZbt9unTRfD8Kwdi6lI=;
 b=R/yz7SZ2UaqeY5Zy0a2Di5NSQaWaTgN7ZACz31kmwKEauHDmCoGVz68XKBa1FLFEGKIx
 +qO9zNXBt6HRkXSpmu2HS59WVFo3G8fm6An07wHEGmrKbkfI9jmc9JR4Wv0ZQ0hnGn+d
 +PdEUDVSUJtWA6xWps4GiLSeieMChWKGUiIFbTtVqLMnx0HeMbNSszAtJ+IX0sUZ2F0w
 ohkVFqP2ZAM3MTPr4eV2A31ydnwE7nDFFACxvcynJGOlNDofQ8bNQ9gESyyU4+IYystG
 yLNm5r+/WNTM7CAij7eDd+TnVBqa/xJ91FRiBTHeAK/uZ67it5BAE1GYi9tnL1nPhioB 3w== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k31rtn053-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Oct 2022 12:25:56 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29DAc5rJ010947; Thu, 13 Oct 2022 12:25:55 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3k2yncg0s1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Oct 2022 12:25:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/ZfiYK1RL9J5OJePKfxbhdpmo5hR2VWFXsVPGVtZUbdyMr9oN767Zgr9nI8xiuhDrJTDoGTYeEepR1wlfxswHGu14kMACM8sPyP6/hvSzO1ylBZeyr+btC8RQJqJ0yw+M8c6qNu9Jem35ymiHObOarjLn5EkZqch50f2qN2leZj/6F6tvtiCnQNWCFAByyuZLbxQkbakYQJC3dT0E5yk5Toubvww6/U0S6tQ3ZhQ/3rlvM7GyRMq9Fy4d30P0zxd9xSsfh4v5CnYdngwqgqKKwLv96S27YNZNDCGqKv+HwS9Tat4szC8KKwnem4iyFQCFW1oWnQ72JgQxcJ6L/l9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Glu6RhpgigIQQSAXoRBijfYzZbt9unTRfD8Kwdi6lI=;
 b=CaOul56CzTYuFoHy5mK7oU5NBiAXuAWO939SBzy9DOskSXTmj+pZmdvpKp2A5B2mzvOfQ3OR/Tgq33gO8J1pinHT2S941XBSV3OMY+9FoKhFjMsa6aS1/IIG3C989ulYA8qCpVWayiGRPqP5zi/wvHdVM80M4Hfe1S1GXd7cPYuMk+ytU38bJNE8etp000QZ7tTsN3f0Mf4U1O1b/zUSFvnHYRva6YZzcFopUxXSATctlhmcWbghuHNF6QbtZz8R7DbOCu9U4AthAL6BSvgZ2KqITO6EIZ+IqhEBu2QI8CcRJYhIQ5EFfmed5Y/1oLGZJxniXiWTxbBF+KFH6cYlFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Glu6RhpgigIQQSAXoRBijfYzZbt9unTRfD8Kwdi6lI=;
 b=F0933IUZKP1tY0A8SIMh8eeop95sKIPwtAYCQaaSdQzpuwpRDmkiOFO8gUNe+ZlEwV58/zH5p97FO2voZARsKcuXGHS95Ch+LClMd9Vrs0JhuzUU5L0f3DnRIr1U6dfxVaWwIQ2+ooFgMqDk/zSrh+pd+bGN9h8C4HfshneQBZY=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by CH3PR10MB6716.namprd10.prod.outlook.com (2603:10b6:610:146::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Thu, 13 Oct
 2022 12:25:52 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::29f3:99bc:a5f0:10ec]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::29f3:99bc:a5f0:10ec%2]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 12:25:52 +0000
Message-ID: <bf945182-5c73-b1cc-13b2-5594bc21823f@oracle.com>
Date: Thu, 13 Oct 2022 13:25:10 +0100
From: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [RFC 7/7] migration: call qemu_savevm_state_pending_exact() with
 the guest stopped
To: Juan Quintela <quintela@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <lvivier@redhat.com>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Avihai Horon <avihaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 qemu-devel@nongnu.org
References: <20221003031600.20084-1-quintela@redhat.com>
 <20221003031600.20084-8-quintela@redhat.com>
Content-Language: en-US
In-Reply-To: <20221003031600.20084-8-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0491.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::16) To DS7PR10MB4846.namprd10.prod.outlook.com
 (2603:10b6:5:38c::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|CH3PR10MB6716:EE_
X-MS-Office365-Filtering-Correlation-Id: a8cd0134-693b-47ba-3411-08daad15fd84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jiy5xqakWCTw0mUHl/Yqd9x1z2U+H6JvEJdhDC/MdY+CLWEjl3HeKN4lu9UfI9yuIXixChPhJ01DJKKCfxFaJgEBzZbG5rV4FkcEth+FNMikb0VEUTee1fAJ0eZTWi4y9+ARWRAgvoQpHrLzmkQDvNeur2y3qcPinl7G7IUP3Y82/vrPO3nyILYL1701DnDjUPGtTyKiEeUh1hbwFcOhmwb7OtCF3FN1eqdU86g17Na01xwMKbXsTzs0t5D7UdJzB6UZm1yJTg8vCLQNVMsoYsp3adOBF4IpEiGS27B1RmzuFMFZLGztzWn/tC0B/f3uqhnwLb/6PrphIcVGKYny8d7uoJS6D6gZyfFNM0girRM7pnKJGW/fv1fuPedjNYE6wn2aOA1SD+lcpiDybMW0lFtZ6zZ2ZEk//deyWh5vGdly31MrCgUVzJ5+xfGzLlzzB98Uai/Lxla4l96e3eaU57yjpojg9x0GBL7nKuULaypv2xgTYunS7CUlk6BPXERVzemF1OELIPQNJolOTtiodu4p3fUtDmUUano9ouEOYMUl5d8eT5dOEjHaWot7TIF+dfD3gF7Un/mJ2j7VjwPgkFWLW/grAzZCgzxbGDhhC3yT33JQqNS5NHmzXnSwCrOLP320JoIdmQlGADO0l2Tiu+2VOWfkuZjkzz7a5nN4bjVzxzuqn+irAIlbmO/J6W5XQCyJX6Qqbj6eC1DsBCG2InvZxsRj106FRiB7qOxVJx6SDewC7sXSUoSWSIgCqNR30APshUbt2VJAmorlchdl/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199015)(36756003)(8936002)(31696002)(38100700002)(31686004)(86362001)(83380400001)(478600001)(2906002)(6512007)(6666004)(316002)(6486002)(6506007)(66476007)(66556008)(26005)(54906003)(6916009)(5660300002)(186003)(8676002)(2616005)(53546011)(7416002)(66946007)(4326008)(41300700001)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aENoczBrOWhGNE56bWdrV29ha3VYN0pXL2ZpQkhmdmUyUG8vS0lPK0xWbHpO?=
 =?utf-8?B?YzZCVWI4eU9rdldyTXh3a0hQTHJhR2ZkM2hIRW1XZkZUZjdleWJheEZhc0ZM?=
 =?utf-8?B?ak5ibDliNjlmL3YxUjFBcHFBOUE2SmVMV0NKdWdkQ1BuVVRsQk1zR0FCQ3ow?=
 =?utf-8?B?Tzc0K3FDTlRocTJreWIralg0M241dGlQK2NDNGVzeXBEUnZmUUFHR2QybHRy?=
 =?utf-8?B?TVNNVmdPSGJsSG5ZbVdYMUdFUzVmdzd6UjFDQks1N2xNUHl0bWx2TG9aQklk?=
 =?utf-8?B?d1dDSVBNM2tKVEtzTGlHcnZGa1pDVWpSbExuMUVvWXZtWXlzVWJqb1hwMFRZ?=
 =?utf-8?B?cFZqdEY3UGpoR1JHR3d3RmxQeDBOR1F5a3lNYjFmaGg0a3lSbmJxamZUaG83?=
 =?utf-8?B?OUhqdUhBUzlBVmlWTlhnT2UyeWhubGVRN2FqWDFidUQzZUU5NXBtTExNV0R1?=
 =?utf-8?B?MVNKMGhWa1R5STNENHFvTC92MVluSWVza1VUYm45dlF1dkYzcmtpbzUrdW5q?=
 =?utf-8?B?cUMvL0hJZXg1cHdZdXJGT05haHNuOXJvcDVuSHN2cWlDZWUrRVM4MDh5dGVx?=
 =?utf-8?B?ekMzMWhmSG5KeUJNTVVvdVNhdlRUSzlhRkV0eUxJa25FTEhtSkhYaVVGYmtO?=
 =?utf-8?B?S1dqWm5hM1J2RE95VjlsSG5JRWFiZUhXSjEwdDNiNFJtaWRjWE1PTyswZVhO?=
 =?utf-8?B?VjNWbnF4ZTd0M29iZGovcWozYTdqejZkT0NoWUpzVnNyckY3amkyT0tsQUxo?=
 =?utf-8?B?dEU3Y0VPZE1GWm9xK2tZUWRtT25zNFR4V25adWdXb3JhKzd6U3ExdGZwT293?=
 =?utf-8?B?d3VEcllJRHJqTkF1QVhOdENKVmZFY2wxYkRnRDB1L3B6NFR1ODdQUnlTK2Fh?=
 =?utf-8?B?UEVkV05CR2FvZUg2YWU0blgyakRXc016QkxFcGJyUy9PRnlsNlVHaE55cHRi?=
 =?utf-8?B?OG10MXJHWUNBVXlFOVRsdUUzRUFseHV1SktsbDcvM3ZyZzZTT2MxaVd1S0VY?=
 =?utf-8?B?VWJrR25EUVJHY1UwWSthemFtdGprMHo0L3NybkRxc1RuOHpKTDQwQ2J5YlVa?=
 =?utf-8?B?Z2svb3c3Mm9EWWdBU2p1a3NIKzU3Y1U1V2p4dnZCZ0tDbEpaS2ZqdTRiUzh4?=
 =?utf-8?B?bEtlNjVidHh4Slkwa3pLKzZ3VFZNSTEvRGRyQmhLbWpFaHNuNmdvd1IyQlRB?=
 =?utf-8?B?VlI5b21tNko2Q1J4N0dhaWw2VURLMXdoSnNzdVczbUVmSVl5djgwN0paaGl3?=
 =?utf-8?B?L3kySlhycllDM3pWTldRTFhjRUd2SlFvTENrcGNpK1dLMFo3MlgxcDJMbXVQ?=
 =?utf-8?B?Vm9BMm15a01mZEVoRUxUcmtnTWxDYjZxbG45S0JUMGVKV2VxT1JYbDBPQlZo?=
 =?utf-8?B?a2tyUVVVVnN0ODQxMDhPVWMrQW91ek1XSFR4L3lIamNjSzBhb3FiMFVvL05i?=
 =?utf-8?B?SlgwbHNvVDZPWXp4YjEzWUhZbzFqYlIrQzByNHhPQ0g2N0NFM1VCcmtld2U1?=
 =?utf-8?B?SDY4cVBhM2REbjNzSHVqem0vN3l6TWpjZUp0MEVidVhvNys2V2ZmTEtveEp4?=
 =?utf-8?B?Y1FuQnpyRzhZa3pEWWxaUlhSWWhxRnpmOEFTTlk3bU8vdXU5azRIeG4wL0Nq?=
 =?utf-8?B?eDUwWUI0RFNONHNDQnRiUlVOREp1K1ptRnRYR2RNek9nN21FdVR5WUkvVnJX?=
 =?utf-8?B?eUdyMjVlRmM4OGVxdUZJeWg3a05EbFdPeTNNdWxRNkQyQ0VDWWxDYS95TmtI?=
 =?utf-8?B?SFRqby9oUUVnbWt0T2RyU2toOXErVlR3cWNEbXNrRjN6czRBK3hkOWkzc1o5?=
 =?utf-8?B?Z3VCYXoveVEwZm1Kc2dVcFVWMm9OSFAvcm1Mbmd1SWtaSitOYWROb0cxSHNY?=
 =?utf-8?B?ZFNXMUl1blgxbzBLcDRwaW0wWjRxekpIVW5jZVEyUFB2TzdxV0pYWGNyaEJM?=
 =?utf-8?B?bGErVmxrdnRDVXFaWEhUNnlpb1pOb0ZQTkZBa2lHcE9UOUY5bUlVUnJrd2V0?=
 =?utf-8?B?ZU5GWEJrMUJ3UGFQdFhiVFlvbTFKV3pnOEJBQUlibUdpcUJqL1RGYXhiMHZ0?=
 =?utf-8?B?VE1kLy80bi9oUFFrY0tjdElQZThxVjZlZGxHbVNZVkc5WlN1eWg0ZjJZSDlz?=
 =?utf-8?B?S1FSdERma1gzVUdLbHIvMWFsQkM0MitrenZ3dVJQRWE4WE44S3dUTnRTRTFG?=
 =?utf-8?B?a1E9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8cd0134-693b-47ba-3411-08daad15fd84
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4846.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 12:25:51.8838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dmAYhfgyUbRxLHs/vr2CdIQqYaL3QPZ7NZFi1FJfQuHvhudK6kshpsq8BnrNRLh0vyJJaAYQLdAOpWz65C+/Zo+5c5Xd2quGyIyEWZdTksA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6716
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-13_08,2022-10-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 malwarescore=0 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210130073
X-Proofpoint-GUID: egkx_irpGW-e0LfyBTSEVI-4rJtynSSi
X-Proofpoint-ORIG-GUID: egkx_irpGW-e0LfyBTSEVI-4rJtynSSi
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Avihai, +Jason

On 03/10/2022 04:16, Juan Quintela wrote:
> HACK ahead.
> 
> There are devices that require the guest to be stopped to tell us what
> is the size of its state. 

"... and have transferred said device state" if we are talking current vfio.

We can't query size of the data_fd right now

It would need a @data_size in addition to @data_fd in
vfio_device_feature_mig_state, or getting fseek supported over the fd

> So we need to stop the vm "before" we
> cal the functions.
> 
> It is a hack because:
> - we are "starting" the guest again to stop it in migration_complete()
>   I know, I know, but it is not trivial to get all the information
>   easily to migration_complete(), so this hack.
> 

Could you expand on that? Naively, I was assuming that by 'all information' the
locally stored counters in migration_iteration_run() that aren't present in
MigrateState?

> - auto_converge test fails with this hack.  I think that it is related
>   to previous problem.  We start the guest when it is supposed to be
>   stopped for convergence reasons.
> 
> - All experiments that I did to do the proper thing failed with having
>   the iothread_locked() or try to unlock() it when not locked.
> 
> - several of the pending functions are using the iothread lock
>   themselves, so I need to split it to have two versions (one for the
>   _estimate() case with the iothread lock), and another for the
>   _exact() case without the iothread_lock().  I want comments about
>   this approach before I try to continue on this direction.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/migration.c        | 13 +++++++++++++
>  tests/qtest/migration-test.c |  3 ++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 35e512887a..7374884818 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3742,7 +3742,20 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>      trace_migrate_pending_estimate(pending_size, s->threshold_size, pend_pre, pend_post);
>  
>      if (pend_pre <= s->threshold_size) {
> +        int old_state = s->state;
> +        qemu_mutex_lock_iothread();
> +        // is this really necessary?  it works for me both ways.
> +        qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, NULL);
> +        s->vm_was_running = runstate_is_running();
> +        vm_stop_force_state(RUN_STATE_FINISH_MIGRATE);
> +        qemu_mutex_unlock_iothread();
>          qemu_savevm_state_pending_exact(&pend_pre, &pend_post);
> +        qemu_mutex_lock_iothread();
> +        runstate_set(old_state);
> +        if (s->vm_was_running) {
> +            vm_start();
> +        }
> +        qemu_mutex_unlock_iothread();

Couldn't we just have an extra patch that just stores pend_pre and pending_size
in MigrateState, which would allow all this check to be moved into
migration_completion(). Or maybe that wasn't an option for some other reason?

Additionally what about having a migration helper function that
vfio_save_complete_precopy() callback needs to use into to check if the
expected-device state size meets the threshold/downtime as it is saving the
device state and otherwise fail earlier accordingly when saving beyond the
threshold?

It would allow supporting both the (current UAPI) case where you need to
transfer the state to get device state size (so checking against threshold_size
pending_pre constantly would allow to not violate the SLA) as well as any other
UAPI improvement to fseek()/data_size that lets you fail even earlier.

Seems like at least it keeps some of the rules (both under iothread lock) as
this patch

