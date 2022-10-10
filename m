Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E85C05FA2D0
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 19:44:22 +0200 (CEST)
Received: from localhost ([::1]:38018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohwpB-00053Y-PN
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 13:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1ohwQ3-0006lx-S5
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:18:25 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:17548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1ohwPw-0003WP-26
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:18:22 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29AHDjUq001694;
 Mon, 10 Oct 2022 17:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=FFNUWd2L1DJNujF8nW0eHj/sFLSPP71tzKYffEXoU7Y=;
 b=g0tPFXQ7MJet7B753haM3zp0O2c4I8lg+rBItoQvOuCC9GEwn+hAol0ySwJi2KUtyN37
 KbUgMiXiwHx8gi1Xy04sRxVnJR0FhmILEaeZ+NFL4FMqbfQCecd0WesR6o9LHtngar+/
 adXi86PCUPdcWHcev8SIPX41eEOXUr6bE2iYK8PpmBLGjFjfsykTMVPA7NNXuKMBTJw3
 bqTAhPLmgthxd5Or8IQWqBSkepfFr63pYI06VXQNKjhh5lLyrmnD4788blcWgOVqZWRI
 mDSpS8K0rivULRQnQuF10MdBSijY075kF3E52tgJRoxv9GcINmKrwMg29T6yMD5OjK3m cQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k3002vban-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Oct 2022 17:18:11 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29AFhjRt002909; Mon, 10 Oct 2022 17:18:10 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3k2yn2v218-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Oct 2022 17:18:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zb/ZW/c6CaByBHgO6Cku5NmDplRQpCZisgAtxrOfhRhOW+/GqvORxICbzjCUvrurNdEc45oygQ/NxB6lAzVC9damth9SBgU2m9st3mn+QW+VAHdYDblw5OmldlLwUVrturl7EAM/vywUAazUnONOXkPGYavVootlH822f2DG0ttjz+k2jcnvjNJ59rWhp+1W7DLdzDmjyVvkmbcZ1Oz/QkEQVn61reWCv3oNyhFxtxdQv2p7NmRRAEeA1D4iOrgvMKm2pneT39tm+ygvvYngM9DH6BiONufcyc5DOt5STUkteWqV9ahtiHSlqPBeqyGAN7xh+7SZWvjieNamaNb1kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFNUWd2L1DJNujF8nW0eHj/sFLSPP71tzKYffEXoU7Y=;
 b=D4D/882F8zFCJCdnq20A6h1zrQ/UjbJdssEPGCrb+v3FpYioVhvo/8G/uo/M7UZ57wCRkFkasTfpsZRjnVFWP9qCkYl6RzRFritgFKXZX/27DxgjJvmc/49EV+4LTRkP+J1Zl+cu3Rpn4Oq2i8UIrgysu+U0Wu7k1KUACOklARzF1l8H1eYYJ3+B3RJuAqaYXCnZ2+7BvzjgkOVZcd6I/g7Q3IluKqbXbzv/7rzdqGQz4mXQkQhirs0wx/b95kbNV3eUTyTUNIHaZc0iYaLBRqlFHNwMA1n7B/WQNh6NIGkEcEYvN7FpwCJ2RkcvFKXfeZQDJTmOccK/4U9W5quTzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFNUWd2L1DJNujF8nW0eHj/sFLSPP71tzKYffEXoU7Y=;
 b=Xs7tEAPlAxFIbPn9Xaeu++VaVQ3jMJXT9exFDsYJzYmwuWkRs+Ktxr0h5dfNdSo/FJoKVJB6hcdb9tYFTpt0yGyZ85F4zgiCLFSy2lnik14PahfasWbCCqBQERj3OWs48XirUJ/BubPKo7MJKGwtVuzN0yjtL32hQXmH1lyiVog=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by DS0PR10MB6920.namprd10.prod.outlook.com (2603:10b6:8:136::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Mon, 10 Oct
 2022 17:18:07 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::bd57:f68a:ddd2:7edc]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::bd57:f68a:ddd2:7edc%7]) with mapi id 15.20.5709.015; Mon, 10 Oct 2022
 17:18:07 +0000
Content-Type: multipart/alternative;
 boundary="------------WiluSqeO5athS02UcdvaaOO8"
Message-ID: <fff559ab-ce66-5830-f5da-e0d9e61adf59@oracle.com>
Date: Mon, 10 Oct 2022 10:18:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] vhost-vdpa: allow passing opened vhostfd to vhost-vdpa
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 eperezma@redhat.com, Cindy Lu <lulu@redhat.com>
References: <1665215938-24473-1-git-send-email-si-wei.liu@oracle.com>
 <CACGkMEuc3Kwjt8r7HsU_-s-AVsAiMXddYZ0Um0sAhN6igaMn7Q@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CACGkMEuc3Kwjt8r7HsU_-s-AVsAiMXddYZ0Um0sAhN6igaMn7Q@mail.gmail.com>
X-ClientProxiedBy: DS7PR03CA0079.namprd03.prod.outlook.com
 (2603:10b6:5:3bb::24) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|DS0PR10MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ddace9a-7abf-4667-3281-08daaae3662c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bVxi9IU5bcVN4o9e73b5Tf59y+hA7/K05Bt2r9zJcI91nuwtZO6byTwydqgrcX98ob0hLum879ajSBrEPszk9CLEU45qijjsbHOidvArcT7jduE3s5BPIQF7vtuD85OJCQo0huW9+VvQwO0GV58fNjLbpLoVCo5D9MH6/0zc7QcbYjBFfUvf4c61RolzfmXAhY7dMnxOA+eWJFZqZuYQuxMojtIsJXZhOkg+qirTQVycIATjbF/5qKq/xKdmGpwYVYETTJDkmUfo9VicEG/Ad+CeMDe/jviTXBMy52MtWJQsn1K+ZCewIduSIW+NZ8y3Xsgg1HdUQ8cioMawuO4ykwSmvVj3WT6pZnycJkAHxj0fL3JTxd1jcC2+Vv7kwgql62qB1bV10vssBN+iTx707dMeX+lm2/iuMi3cE8cc9s5CYauujDqh8QeDyhm0Vz/mejV1KNU4PtnTZd/LTL6Ur2YQYz/+lLfmPyjiaNKxTD4d+TLa6hxAo+AjmgLZuVN7364ajngYnH3Qnn36vtyg95hVNz2paA2XhzLev3s9r4stIGxuJWLbKR3oyHrTX9Esg9lsiw2nup0DK4kNx8vgNJ/TTJHBxaGBXG85hyCs0QMVQr6PoCBgBX0TUcq0By0fbjoucjdwS0xCAkfDeI4zoeYhB1lB7q3dXtCwftP+jmvnW1L9cohGHbDbFeODR9TdXI10yovKletKFXmy49AuFl32mE4ZeuycuLZYdr3cx7rywthYeDlrP83GoY27Ktyg9vCeWXw9xYSozQU48gW81+xjkt5AOF4ltnEGasfhEbM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6535.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199015)(31686004)(36756003)(66476007)(2906002)(6916009)(86362001)(66946007)(66556008)(31696002)(8936002)(6486002)(38100700002)(4326008)(6512007)(66574015)(8676002)(5660300002)(316002)(83380400001)(478600001)(53546011)(6666004)(6506007)(186003)(33964004)(41300700001)(26005)(36916002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzhRd0dvQitYNHpObVhYOG5GbGNLem5SRVNrTm0yaGVRcWJqaXNrUjFqc2NX?=
 =?utf-8?B?ZG15ZzVnb0hMRkUrN1RRa21rVVk1ME1kazNPa2ZhamsrWWcvRW5yUXBDSldW?=
 =?utf-8?B?WEZxbCs1NFFrVEtueDlFeWQ3RnUzSWlDeWp3c3NvT3VTTkFDaWx0VFErZUpk?=
 =?utf-8?B?QlBYaE5HenpsaGxMSjRtQ2JOd2dGK1RiREhyRms2dzRpWmhFZW9aZDllTElm?=
 =?utf-8?B?MVVnMFgwUGpsOVBOV0xQaDFRU201NmR0dklRYlpkYjVFWHFFMVR0aXllbDU3?=
 =?utf-8?B?OTVTWFpUSmdBVTlWQ2FxK0RkVVZGTnJIMTJsajdrMTI4NmpjSDl3ckN3TVl1?=
 =?utf-8?B?eURtVTdwREc3eS9oZWVtbVVZV2NhemRxMy9CdUUvN0xuY2g5aDlvQ2dvRUNK?=
 =?utf-8?B?bVVPVmFzYnQrc01Bdk00elpYeTRFU3Q3NHExVzRwVzRqZ1RsbHkwZC96N1RD?=
 =?utf-8?B?MFY5ZUtmZTBFaDRmaEV3aGs3c2tKZ21KNUoxY0M1UWdOdXBLbUp1U0ZsOXZr?=
 =?utf-8?B?SEtCaXRhMms2ZjN3SlhxTFZOWi90U001UGNLc0VheE9LZmNrMHg2YlVWVEpy?=
 =?utf-8?B?R1JobnFUaWFoTXN2Zm1UZ2ZPUnZJcVZBSnhHZXlaa3poell3bVdzd1NsMGlQ?=
 =?utf-8?B?NHducGl1aFJrSlRQWjl4WkRKYTM2L3ZkbEllVFBjSlhwZldpMERaa0t5d0Zh?=
 =?utf-8?B?NHBUU2hvWnVlY0pWMFNYNXNrNE50UDc4eFhnd3RKUmFOSzlEeXdEdVM2WWI4?=
 =?utf-8?B?RCtjVlpEK1NETGlBc0ZBTUJSL1RDc0hEVWF2SDRCcmRqQ3IvdGZhQjFYR0NE?=
 =?utf-8?B?c0xRNitkb1FPUnNPT0pmSk9qZjMxVS9xaDRKaXR4SElTLzVjSjYrNWFmMU1B?=
 =?utf-8?B?cFpBL243bVdjaGlmNWdXZTVPbGdFdGM4dGZma1V4bWw2TmRnbm1vZ1FXUlVX?=
 =?utf-8?B?VHAvRnpDY01FU0FENENzc2U2ZXhTWEVMUlV4c2FraytTWkhVMlRHLzFTTUVS?=
 =?utf-8?B?Vld5a0s2NEZDU09kc3BzL2NJcy9vaHVVbDA2akF2a3FqWVcrNlhPbXJWNW1K?=
 =?utf-8?B?bVZDWVVXU1NNSWlGdDhGbDNxclNZVHhDaGVSREpBR2dTTnBvVmd4Z0tzTXl1?=
 =?utf-8?B?TUNHT0IycHlOTkZVazhwWXduaUhLakxrMUJmVGlFdnRhSDNrRjZ4QStDQ21T?=
 =?utf-8?B?bmJkYTRiOWpvTGxKV0x2WHE1S3RUakVhNzZnczFlZmFidjdQRkphOVVnVmpD?=
 =?utf-8?B?RFN0NDAzbVNWYm95TUdHWXdjSy96WFowZVBBWjVaRXRieW1kRGhwNW1ZMFVx?=
 =?utf-8?B?c3VzMW5yOHVMWnhnaDJmNmdaZFJCcTRnNHJ4dHVpL3FnNWI4SGhpc0Z3SHZj?=
 =?utf-8?B?elp3ZU5zSGZjMnJUWTZBMnhXNFRzMUw1OVJtTzBBbjZ6Z3FudW95VVk5azVu?=
 =?utf-8?B?S3RNWXV6STBEQ0k0elZYQ1lIdEdIUE9HYVljQW5RalQxUTZ0ZXhwM3hGYmtn?=
 =?utf-8?B?cWNRcDJGRGN4R1E4ZWVWSnpzanVBRmdtV05zS1NNdUxKRlRENDNsSUVvSkpl?=
 =?utf-8?B?UWllVTZ5YkJ2RFN2SHoyYmdYbmp1Tjc1V3FMbEpWQS93UHhVZ05yNG1Qai9q?=
 =?utf-8?B?VzJYb1dXbWJaUWpOY3I3OXhubXF4LzVzem02ZkdjdFJENkl5dW9xZ0RUQUda?=
 =?utf-8?B?QkF0U1g0aVVnZUJrUDJTbGNRNi81MEM4dVd5aWRkVUhCNkJ1ZXBZUWMwOVo5?=
 =?utf-8?B?WFJnNTB3cDdHMDBSRnlML1IvR00rbDJmUTRUTUZuMmZaMUV1eXRjUGp0TXhx?=
 =?utf-8?B?WFZpT3haQm5rQmF5TjRnQ2pYV3Q0TEhtMFJGbHhDSkhSVW04SXUyekgwdzFL?=
 =?utf-8?B?L25zWnZKZlVDbDFjVTlBVmZuS1ZBUVlDdDltSkRrVUQzN1U5WDBKbXdmUnNY?=
 =?utf-8?B?TUxYQmRrZVlRT2hJSW4zMGY2WXBiZjdRcXpleWt5dUU0M055S0t0bjVWbVJB?=
 =?utf-8?B?ckllb0dCUzRPNE1hclFOVWZIc2k1Qnhxb2lEMi9mNllKRGpvQWh3NU5Tek1M?=
 =?utf-8?B?RTBlam13WlY4ejBScjZNN3JTYncxaWpsci9HQmt3TlAxcU82cExYdFAwKzRr?=
 =?utf-8?Q?vD2IA1g5sLfRIdOZgXlgtgHfA?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ddace9a-7abf-4667-3281-08daaae3662c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 17:18:07.6691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QSAgqx2tXFwh2VPLJkbctkOYfApxqyMSSqsX7qFxlCoZcQYUlkn3WIY2jt5RlgF6PNBjPMTQa2dTre/16xK5WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6920
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-10_10,2022-10-10_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210100103
X-Proofpoint-ORIG-GUID: oW6nQYtWk-Uk0jO2sNCI7xYLENRQ7De_
X-Proofpoint-GUID: oW6nQYtWk-Uk0jO2sNCI7xYLENRQ7De_
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-2.007, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

--------------WiluSqeO5athS02UcdvaaOO8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/8/2022 10:43 PM, Jason Wang wrote:
> On Sat, Oct 8, 2022 at 5:04 PM Si-Wei Liu<si-wei.liu@oracle.com>  wrote:
>> Similar to other vhost backends, vhostfd can be passed to vhost-vdpa
>> backend as another parameter to instantiate vhost-vdpa net client.
>> This would benefit the use case where only open file descriptors, as
>> opposed to raw vhost-vdpa device paths, are accessible from the QEMU
>> process.
>>
>> (qemu) netdev_add type=vhost-vdpa,vhostfd=61,id=vhost-vdpa1
> Adding Cindy.
>
> This has been discussed before, we've already had
> vhostdev=/dev/fdset/$fd which should be functional equivalent to what
> has been proposed here. (And this is how libvirt works if I understand
> correctly).
Yes, I was aware of that discussion. However, our implementation of the 
management software is a bit different from libvirt, in which the paths 
in /dev/fdset/NNN can't be dynamically passed to the container where 
QEMU is running. By using a specific vhostfd property with existing 
code, it would allow our mgmt software smooth adaption without having to 
add too much infra code to support the /dev/fdset/NNN trick.

On the other hand, the other vhost backends, e.g. tap (via vhost-net), 
vhost-scsi and vhost-vsock all accept vhostfd as parameter to 
instantiate device, although the /dev/fdset trick also works there. I 
think vhost-vdpa is not  unprecedented in this case?

Thanks,
-Siwei


>
> Thanks
>
>> Signed-off-by: Si-Wei Liu<si-wei.liu@oracle.com>
>> Acked-by: Eugenio Pérez<eperezma@redhat.com>
>>
>> ---
>> v2:
>>    - fixed typo in commit message
>>    - s/fd's/file descriptors/
>> ---
>>   net/vhost-vdpa.c | 25 ++++++++++++++++++++-----
>>   qapi/net.json    |  3 +++
>>   qemu-options.hx  |  6 ++++--
>>   3 files changed, 27 insertions(+), 7 deletions(-)
>>
>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>> index 182b3a1..366b070 100644
>> --- a/net/vhost-vdpa.c
>> +++ b/net/vhost-vdpa.c
>> @@ -683,14 +683,29 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>
>>       assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>>       opts = &netdev->u.vhost_vdpa;
>> -    if (!opts->vhostdev) {
>> -        error_setg(errp, "vdpa character device not specified with vhostdev");
>> +    if (!opts->has_vhostdev && !opts->has_vhostfd) {
>> +        error_setg(errp,
>> +                   "vhost-vdpa: neither vhostdev= nor vhostfd= was specified");
>>           return -1;
>>       }
>>
>> -    vdpa_device_fd = qemu_open(opts->vhostdev, O_RDWR, errp);
>> -    if (vdpa_device_fd == -1) {
>> -        return -errno;
>> +    if (opts->has_vhostdev && opts->has_vhostfd) {
>> +        error_setg(errp,
>> +                   "vhost-vdpa: vhostdev= and vhostfd= are mutually exclusive");
>> +        return -1;
>> +    }
>> +
>> +    if (opts->has_vhostdev) {
>> +        vdpa_device_fd = qemu_open(opts->vhostdev, O_RDWR, errp);
>> +        if (vdpa_device_fd == -1) {
>> +            return -errno;
>> +        }
>> +    } else if (opts->has_vhostfd) {
>> +        vdpa_device_fd = monitor_fd_param(monitor_cur(), opts->vhostfd, errp);
>> +        if (vdpa_device_fd == -1) {
>> +            error_prepend(errp, "vhost-vdpa: unable to parse vhostfd: ");
>> +            return -1;
>> +        }
>>       }
>>
>>       r = vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
>> diff --git a/qapi/net.json b/qapi/net.json
>> index dd088c0..926ecc8 100644
>> --- a/qapi/net.json
>> +++ b/qapi/net.json
>> @@ -442,6 +442,8 @@
>>   # @vhostdev: path of vhost-vdpa device
>>   #            (default:'/dev/vhost-vdpa-0')
>>   #
>> +# @vhostfd: file descriptor of an already opened vhost vdpa device
>> +#
>>   # @queues: number of queues to be created for multiqueue vhost-vdpa
>>   #          (default: 1)
>>   #
>> @@ -456,6 +458,7 @@
>>   { 'struct': 'NetdevVhostVDPAOptions',
>>     'data': {
>>       '*vhostdev':     'str',
>> +    '*vhostfd':      'str',
>>       '*queues':       'int',
>>       '*x-svq':        {'type': 'bool', 'features' : [ 'unstable'] } } }
>>
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 913c71e..c040f74 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -2774,8 +2774,10 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>>       "                configure a vhost-user network, backed by a chardev 'dev'\n"
>>   #endif
>>   #ifdef __linux__
>> -    "-netdev vhost-vdpa,id=str,vhostdev=/path/to/dev\n"
>> +    "-netdev vhost-vdpa,id=str[,vhostdev=/path/to/dev][,vhostfd=h]\n"
>>       "                configure a vhost-vdpa network,Establish a vhost-vdpa netdev\n"
>> +    "                use 'vhostdev=/path/to/dev' to open a vhost vdpa device\n"
>> +    "                use 'vhostfd=h' to connect to an already opened vhost vdpa device\n"
>>   #endif
>>   #ifdef CONFIG_VMNET
>>       "-netdev vmnet-host,id=str[,isolated=on|off][,net-uuid=uuid]\n"
>> @@ -3280,7 +3282,7 @@ SRST
>>                -netdev type=vhost-user,id=net0,chardev=chr0 \
>>                -device virtio-net-pci,netdev=net0
>>
>> -``-netdev vhost-vdpa,vhostdev=/path/to/dev``
>> +``-netdev vhost-vdpa[,vhostdev=/path/to/dev][,vhostfd=h]``
>>       Establish a vhost-vdpa netdev.
>>
>>       vDPA device is a device that uses a datapath which complies with
>> --
>> 1.8.3.1
>>

--------------WiluSqeO5athS02UcdvaaOO8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 10/8/2022 10:43 PM, Jason Wang
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CACGkMEuc3Kwjt8r7HsU_-s-AVsAiMXddYZ0Um0sAhN6igaMn7Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Sat, Oct 8, 2022 at 5:04 PM Si-Wei Liu <a class="moz-txt-link-rfc2396E" href="mailto:si-wei.liu@oracle.com">&lt;si-wei.liu@oracle.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Similar to other vhost backends, vhostfd can be passed to vhost-vdpa
backend as another parameter to instantiate vhost-vdpa net client.
This would benefit the use case where only open file descriptors, as
opposed to raw vhost-vdpa device paths, are accessible from the QEMU
process.

(qemu) netdev_add type=vhost-vdpa,vhostfd=61,id=vhost-vdpa1
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Adding Cindy.

This has been discussed before, we've already had
vhostdev=/dev/fdset/$fd which should be functional equivalent to what
has been proposed here. (And this is how libvirt works if I understand
correctly).</pre>
    </blockquote>
    Yes, I was aware of that discussion. However, our implementation of
    the management software is a bit different from libvirt, in which
    the paths in /dev/fdset/NNN can't be dynamically passed to the
    container where QEMU is running. By using a specific vhostfd
    property with existing code, it would allow our mgmt software smooth
    adaption without having to add too much infra code to support the
    /dev/fdset/NNN trick.<br>
    <br>
    On the other hand, the other vhost backends, e.g. tap (via
    vhost-net), vhost-scsi and vhost-vsock all accept vhostfd as
    parameter to instantiate device, although the /dev/fdset trick also
    works there. I think vhost-vdpa is not&nbsp; unprecedented in this case?<br>
    <br>
    Thanks,<br>
    -Siwei<br>
    <br>
    <br>
    <blockquote type="cite" cite="mid:CACGkMEuc3Kwjt8r7HsU_-s-AVsAiMXddYZ0Um0sAhN6igaMn7Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Thanks

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Signed-off-by: Si-Wei Liu <a class="moz-txt-link-rfc2396E" href="mailto:si-wei.liu@oracle.com">&lt;si-wei.liu@oracle.com&gt;</a>
Acked-by: Eugenio Pérez <a class="moz-txt-link-rfc2396E" href="mailto:eperezma@redhat.com">&lt;eperezma@redhat.com&gt;</a>

---
v2:
  - fixed typo in commit message
  - s/fd's/file descriptors/
---
 net/vhost-vdpa.c | 25 ++++++++++++++++++++-----
 qapi/net.json    |  3 +++
 qemu-options.hx  |  6 ++++--
 3 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 182b3a1..366b070 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -683,14 +683,29 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,

     assert(netdev-&gt;type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &amp;netdev-&gt;u.vhost_vdpa;
-    if (!opts-&gt;vhostdev) {
-        error_setg(errp, &quot;vdpa character device not specified with vhostdev&quot;);
+    if (!opts-&gt;has_vhostdev &amp;&amp; !opts-&gt;has_vhostfd) {
+        error_setg(errp,
+                   &quot;vhost-vdpa: neither vhostdev= nor vhostfd= was specified&quot;);
         return -1;
     }

-    vdpa_device_fd = qemu_open(opts-&gt;vhostdev, O_RDWR, errp);
-    if (vdpa_device_fd == -1) {
-        return -errno;
+    if (opts-&gt;has_vhostdev &amp;&amp; opts-&gt;has_vhostfd) {
+        error_setg(errp,
+                   &quot;vhost-vdpa: vhostdev= and vhostfd= are mutually exclusive&quot;);
+        return -1;
+    }
+
+    if (opts-&gt;has_vhostdev) {
+        vdpa_device_fd = qemu_open(opts-&gt;vhostdev, O_RDWR, errp);
+        if (vdpa_device_fd == -1) {
+            return -errno;
+        }
+    } else if (opts-&gt;has_vhostfd) {
+        vdpa_device_fd = monitor_fd_param(monitor_cur(), opts-&gt;vhostfd, errp);
+        if (vdpa_device_fd == -1) {
+            error_prepend(errp, &quot;vhost-vdpa: unable to parse vhostfd: &quot;);
+            return -1;
+        }
     }

     r = vhost_vdpa_get_features(vdpa_device_fd, &amp;features, errp);
diff --git a/qapi/net.json b/qapi/net.json
index dd088c0..926ecc8 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -442,6 +442,8 @@
 # @vhostdev: path of vhost-vdpa device
 #            (default:'/dev/vhost-vdpa-0')
 #
+# @vhostfd: file descriptor of an already opened vhost vdpa device
+#
 # @queues: number of queues to be created for multiqueue vhost-vdpa
 #          (default: 1)
 #
@@ -456,6 +458,7 @@
 { 'struct': 'NetdevVhostVDPAOptions',
   'data': {
     '*vhostdev':     'str',
+    '*vhostfd':      'str',
     '*queues':       'int',
     '*x-svq':        {'type': 'bool', 'features' : [ 'unstable'] } } }

diff --git a/qemu-options.hx b/qemu-options.hx
index 913c71e..c040f74 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2774,8 +2774,10 @@ DEF(&quot;netdev&quot;, HAS_ARG, QEMU_OPTION_netdev,
     &quot;                configure a vhost-user network, backed by a chardev 'dev'\n&quot;
 #endif
 #ifdef __linux__
-    &quot;-netdev vhost-vdpa,id=str,vhostdev=/path/to/dev\n&quot;
+    &quot;-netdev vhost-vdpa,id=str[,vhostdev=/path/to/dev][,vhostfd=h]\n&quot;
     &quot;                configure a vhost-vdpa network,Establish a vhost-vdpa netdev\n&quot;
+    &quot;                use 'vhostdev=/path/to/dev' to open a vhost vdpa device\n&quot;
+    &quot;                use 'vhostfd=h' to connect to an already opened vhost vdpa device\n&quot;
 #endif
 #ifdef CONFIG_VMNET
     &quot;-netdev vmnet-host,id=str[,isolated=on|off][,net-uuid=uuid]\n&quot;
@@ -3280,7 +3282,7 @@ SRST
              -netdev type=vhost-user,id=net0,chardev=chr0 \
              -device virtio-net-pci,netdev=net0

-``-netdev vhost-vdpa,vhostdev=/path/to/dev``
+``-netdev vhost-vdpa[,vhostdev=/path/to/dev][,vhostfd=h]``
     Establish a vhost-vdpa netdev.

     vDPA device is a device that uses a datapath which complies with
--
1.8.3.1

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------WiluSqeO5athS02UcdvaaOO8--

