Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6C358FAF8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 12:53:43 +0200 (CEST)
Received: from localhost ([::1]:53694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM5os-0005en-Ku
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 06:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oM5lq-0002d5-OH
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 06:50:34 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:5084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oM5lj-0002GF-As
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 06:50:33 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27B95qgb032442;
 Thu, 11 Aug 2022 10:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 from : subject : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=MZaLuSjoCsKp7RN8JOjxrVElpIs+f4w0WzPkpIS17oQ=;
 b=FG1QKSq7VDZ7bpF9wrwvAea6chIVCL5rUbdkYFIkK8Kz/kuoUQRv+Y9j9+s8Q4iSd3Hc
 8o+3IIbed5vJVKTUcQrMCX5VWo3uSJiuMB/vfZQ1B+vltuG3M+hzwfsDtUW47nAxDw49
 zsCLsm3Efg0Z86OBHLWUXpcnQB//zAffcp3v3/k2xjL+4zToAvyF6ACHUaPMPSpHCgRM
 i4LhwYwThthrjT3gMKFCnQxivmsmQhsxDoPYPDtR8lg/xSoly7SM7uijxNbp3kkqGWwL
 HtDlJmPvUlV0QrNxmHQj6Lld0DS+21gGl8QSdUvLHRJ8urnoUFaSVOM5Eq46V7Xz4Iwq sQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3huwqdvdkt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 10:50:16 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27B99TWc040690; Thu, 11 Aug 2022 10:50:16 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3huwqgrbyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 10:50:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lNHzdv/uD3aStXuJsBQjk1jh5b4Moz6rctC6UirbtmWmRticPBvO+9RDQSFQPdX5YjmjyGL9buuuSMyo177Ef3+8aEQjGKiUaJ92q/Wms3OkhH7mcWNjos/UXY6rtHuNgIvcpBTBDHyFvCf64Fwc3amji++o4Bpk5GTyNUfNJD8zbo1e4ClWxNWHZbP5Fq8vwdoU9thLS4kGpe4KxfVbOgM/LaS6itDWCBmLRHuFhMgmf5TwGO5CdFZ81dZOMEk3NGwmWsa+57mZ326PP0+c+wi6vH2tqQhjU7gwlq5eXiiAGLsBe8zaBl5TWKsW6gS1Ip2EmHNlwNGbOzyk1+dRKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZaLuSjoCsKp7RN8JOjxrVElpIs+f4w0WzPkpIS17oQ=;
 b=ZjkcbMZNM5LaKbCpBpEaZNe61gRVSlvcu7x6Hn2GnIOlz8S3JV9hhicAkXf1HjTciAacSdrRtXd9q2L+feuBxaFtG1azfk/6QGg7s99pQKeLrR6hA1f0/YISya/SKSfu6irXPEsNlrbLYZZzyr73o57x0hlXKyo07H87fRp4kf9lCutGdguNYX1v53ydVU3o5+80iDIdCvmRm2f2ZZR+7zzYYU93HVGmqx+WHZ8pkU8JDalr5F8J7jNEA3Q7Nwmfw81mt7tjb/PgXR4q7YSUtmIdHSu3h22TVvUa0pgn3rcYmSJjBtaWjkz7OxWKUwe+QXDX99JXrFBOSVlHx32o3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZaLuSjoCsKp7RN8JOjxrVElpIs+f4w0WzPkpIS17oQ=;
 b=AZ/lKn5HN+Wnz06eXSZu+3lUl4j73oSsFIbzLgPRalNeN8467rZz35jB/OARqEO3RGKTgbJqUKt9t9urPWE7C8MtiRLADu1D6zjdXT0o2Oro+VhlIXKWb3zAUzxGFiYUT3AVQIKgTwSEXBHmC6pmet6ZxgOHmONh1geJkxNkE7A=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by DM6PR10MB3948.namprd10.prod.outlook.com (2603:10b6:5:1d0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 11 Aug
 2022 10:50:13 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::89:b21d:7dc4:24d9]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::89:b21d:7dc4:24d9%9]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 10:50:13 +0000
Message-ID: <c1190e87-c532-a1c4-d107-1495cff34208@oracle.com>
Date: Thu, 11 Aug 2022 11:50:05 +0100
From: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH RFC 0/7] hostmem: NUMA-aware memory preallocation using
 ThreadContext
To: David Hildenbrand <david@redhat.com>
Cc: Michal Privoznik <mprivozn@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Mark Kanda <mark.kanda@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <20220721120732.118133-1-david@redhat.com>
 <f8ab5723-07ba-f418-3011-e7850324adc1@oracle.com>
 <31107841-f033-5e40-2333-9c258a631027@redhat.com>
Content-Language: en-US
In-Reply-To: <31107841-f033-5e40-2333-9c258a631027@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0111.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::8) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6bedd2a5-5abc-4943-95ce-08da7b8744fe
X-MS-TrafficTypeDiagnostic: DM6PR10MB3948:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jdGF2rWoRbnloDM1MOhZ3vFuKbkAZwmF7pdtyKarRpGiEqQm9bp96CY092gpDXFNKYscGkKUUNLhYlRzvEti/F3XSfALiD+S6GJBBWy808rObI92aPCZzEk6YS56+xWcKZ9qZ+jlP8dil5MDb6NmuCn9f3uroxNwV1kG8jLirxnRn4Ku2w9IJAhaJNiB36z+flOT6DmE7aU/ah47vUu5TF6e9p35pYkWBSRqUEeoxwG5ss3E4a8zDsTTSGvRSfyRGTk/GZAdH/bP1r8iLnq8Kru/kmFMxMcf0/QnYdnlUeR2AJYk9h+2b4UowmIKJsFIPFLnrsXv/MO/7h8JHvvkVm6S68n1SGVYo1TeZjzdGsgCOoj3T6SUJzMI6sLmj1GTUq4bdwIxhFS6uGjXbKDEOqx7lQSBLyhIJMZlHm4youOHQoFUaMOOgRybEVGY5CW8bl0PCw3sOiVFqthtd8u4iOiC66tBUljNq2rOlF0gOTgzaV+xpd8Wwbysr2kZ5ZwkIT5GDYy+Q8/RUUv1wMIO1wWHoDssjw2JMNbXjKBxFPploZDkSB6Nx7SWpzFct9kN/RbN5+uVh6eslncOcydqyYSvnRZa1cfPu61TRBZ0n9iCI2Dc0Fygsxi2n1DNaxFcZP7qc7IdOkOWWlM8V6D88AhPwZHQw90rHXTgMfKNxfSdKumWcAji1ug89PA5Uxe6rJD4FDcTewGXyJPGAwNvaAxDHdXi66GRJAdGuTxQIM4VtWf+k8WmYG3urNfXCtw4mSLHuqcTao0C5qu9kBLozogTUImt3Qtxq9ZcMXR0kbs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(376002)(39860400002)(136003)(346002)(396003)(36756003)(38100700002)(86362001)(53546011)(6506007)(2616005)(83380400001)(6512007)(31686004)(26005)(6666004)(31696002)(186003)(8676002)(478600001)(316002)(54906003)(6916009)(41300700001)(6486002)(7416002)(66556008)(4326008)(5660300002)(8936002)(66476007)(66946007)(2906002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmkzY0FoVnMzSnNpVE4zTzlRYnZkMTBTT2FHdHZBb2FzL0QwQlgyd0xTam5x?=
 =?utf-8?B?K3BwczdTM2tIVFlIcjJuL2xDQ1REeElrYklyNEMrMXZOUDFxZ3FuMGtrNmIr?=
 =?utf-8?B?eHpmTHVqTWJMWEJXZ2x1M1hMR0g5Wk93Sm41TTJxV1M0a2pBd3E5ZjUyS2U1?=
 =?utf-8?B?TVQzR3FjMWY4TkJIa3I2ZElOb0h4K1g2WXRGV3dLTU5ZZGdydkhWd2hqQk1m?=
 =?utf-8?B?ZHpRd3JPdy9UU0QrQ2RmRHpBdnR0Q3RWYXF6cXE0QWJwcmJzRW4vejF1VWsv?=
 =?utf-8?B?NDdjUWpWd0FMeFBuZ0s3TGtIWnZ3aXlzUEhSOFB6SXQvb1ZsSEpXcmFKbkhW?=
 =?utf-8?B?WUt2OFd2UTRNblFSYmlNWSsreVJKUldWSHFzbnJGWWx5OUF4RGZTRWR1d1oy?=
 =?utf-8?B?NHVxcXZ4YVg4aCs1VXlDMzQ5bVFwa0Nzc3JmQzNJcWkwZ09VV0xrQlhtVUZ5?=
 =?utf-8?B?d1FoSXpsam1UR3YyUXlvUkQ1by9UWEg2ODYvM2VaRkJkaGx3OVVSQUpaREIz?=
 =?utf-8?B?TjJpMkt6QmpaallndmIrUHJMeFhRMVFRaFdrRThMbG55WllVZzF2OFVUcDY0?=
 =?utf-8?B?VHZuTEd6cXJoOVpEbFQ2MjNpbUNVSENRdTUvU2FZVzlXME9aT2FVbkhlM21o?=
 =?utf-8?B?YSthcnBmNTA0QXNZcDZWejRQR1NHdFVKY3U2a0JSSGpxLzJwTjZ3dmFKYmI1?=
 =?utf-8?B?R0VGaytieW03K2RUUSsvN3prT2xiTWcyZkNCTGZrMjF0Z0dOYklDY2s2UEVn?=
 =?utf-8?B?MHFEUDN0cGltUkNRQVZad0lOZzZXRzA1TzB3UStMSGZPem1RcXplbWZRbGdS?=
 =?utf-8?B?c2dxVFAzWmxJS2NXaEN1WXNtMllpUXBQbDI3RjZpWEVwSEhGQVdOdUhxVStr?=
 =?utf-8?B?cjBPN1hqMW44SmNjWU1naWw0VWtaWXN6L0NKVm4yZlRHSzEyMGtFQXdsblFi?=
 =?utf-8?B?MjYyRkpCdVFFVnU0SWQxaTZMQy9QaWl0N1lHajkxU0dYQjlDQ0Z1Tjg3bm5u?=
 =?utf-8?B?a0g3b3NjcTEwRDRWN2FOa2dacmJ0bmpQZ1d3aGplaC9zMS9hQWpaMWJNaTRp?=
 =?utf-8?B?Tk5KMnVCVEdkQ3daUzh1cFVicm5PTzVOQjVMcDdPYWM4NDQ2ZS9NcklvVVZ3?=
 =?utf-8?B?NHVHMFh3dDlHZURzbWVUVVM5OUZQZWR6YUg1VjVYL09ucHUrdWhOQ0xMbHhX?=
 =?utf-8?B?M1pxSDVnbVFQWEw5UjJUNWl3R3U4bUFydHFLMkthQW45ZXd3VEJwQmJEaUpn?=
 =?utf-8?B?c2xqLzBrL3d5bkN1c0dJVHNZcld3L1dMZDl5YldqakcrRHludHdpOGhOSDRK?=
 =?utf-8?B?UmRqOTZJTTdUc29oRkJiWDdyYk9hZEJwODlzbmVzcE55eVh3MjFBenYxbzhB?=
 =?utf-8?B?dHY1Z3JqcW9oRHRsNldLRDh5UTVTeUlvRnZPanlnMjdGalEyRnluWkVJckNz?=
 =?utf-8?B?ZXJVc2IweVZSVGkxRzJPalQ4NW4wMGU3ZXFxdWlrUkk5SjlvSmdlTWF5bGFp?=
 =?utf-8?B?TmI3KzBCMFhhWHhkOXhuNWEyZ3ZJc001NGQ2dHM2a0RsLzNsaGUrU3JMRWI4?=
 =?utf-8?B?T1cyNmdNaENEQXgwNzNDeFJzZmYvRDcyTUlKQ2FZckhhcEpuYWtOclJnOXZp?=
 =?utf-8?B?S2VpcmJDaStIRU9laFUrZk5oY0lLMGF4eURWY2lLSko5czdNSUZNaThyNlov?=
 =?utf-8?B?MmlyL2FGNTFsUGhWTnl4QXZaMEt0SG9TcWVaNEFKSmVhUFJwdUFOY1V5Mmpz?=
 =?utf-8?B?SSs2TTdEVEZDbEVHS0RHdFZycFZxYlNLN0RvVXBtcnJSNkorZGNmRXdnUzZG?=
 =?utf-8?B?U2JKZ1RUbStnREpKZm9XMG5iR2dDQjFaTTQvZFBsZzFXbjBKL1cwWDFiU1RZ?=
 =?utf-8?B?WWtJOEdUelkzdmdqS1l1UkR5dndPc24zKytzSDZGam4vUXJuTlVoSEZpV3pt?=
 =?utf-8?B?QW0vOENPSjk2d2E4TEpCVC9XZ0l6azJFYlRoZjB6OC9DZVcrWFI1MVorVjdB?=
 =?utf-8?B?OFczZmlBZWdFMUo2V3dEeDFhZFU5R05odVRsTUlRK204bGlrZzVnOVRDTkxV?=
 =?utf-8?B?WFhDM01Nc3JWWkIwRGthM2l4bGpBNXlIKzBSaUt0RFpaU3VJSjBTMkZrN1ps?=
 =?utf-8?B?cnVFb2RqNHRlSmVjaVpqK3RGT2hVUGpuOXpkSFJ4Y2JEU2VTdGY3RFNBNWJX?=
 =?utf-8?B?OWc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bedd2a5-5abc-4943-95ce-08da7b8744fe
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 10:50:13.5777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oe1zIVemHW+Urcbo5CmxhmD3pFCsqCZg22axUbLqBzL2BBT3ShhdF2WI5Sc2wfMrVVskLtlkQK9J/cthimUioL889hVeHNVxKid3OFOez3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3948
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208110031
X-Proofpoint-GUID: 2F9WeLPT8bO9BAjAJR7zYNvQNJdcbwB7
X-Proofpoint-ORIG-GUID: 2F9WeLPT8bO9BAjAJR7zYNvQNJdcbwB7
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 8/9/22 19:06, David Hildenbrand wrote:
> On 09.08.22 12:56, Joao Martins wrote:
>> On 7/21/22 13:07, David Hildenbrand wrote:
>>> This is a follow-up on "util: NUMA aware memory preallocation" [1] by
>>> Michal.
>>>
>>> Setting the CPU affinity of threads from inside QEMU usually isn't
>>> easily possible, because we don't want QEMU -- once started and running
>>> guest code -- to be able to mess up the system. QEMU disallows relevant
>>> syscalls using seccomp, such that any such invocation will fail.
>>>
>>> Especially for memory preallocation in memory backends, the CPU affinity
>>> can significantly increase guest startup time, for example, when running
>>> large VMs backed by huge/gigantic pages, because of NUMA effects. For
>>> NUMA-aware preallocation, we have to set the CPU affinity, however:
>>>
>>> (1) Once preallocation threads are created during preallocation, management
>>>     tools cannot intercept anymore to change the affinity. These threads
>>>     are created automatically on demand.
>>> (2) QEMU cannot easily set the CPU affinity itself.
>>> (3) The CPU affinity derived from the NUMA bindings of the memory backend
>>>     might not necessarily be exactly the CPUs we actually want to use
>>>     (e.g., CPU-less NUMA nodes, CPUs that are pinned/used for other VMs).
>>>
>>> There is an easy "workaround". If we have a thread with the right CPU
>>> affinity, we can simply create new threads on demand via that prepared
>>> context. So, all we have to do is setup and create such a context ahead
>>> of time, to then configure preallocation to create new threads via that
>>> environment.
>>>
>>> So, let's introduce a user-creatable "thread-context" object that
>>> essentially consists of a context thread used to create new threads.
>>> QEMU can either try setting the CPU affinity itself ("cpu-affinity",
>>> "node-affinity" property), or upper layers can extract the thread id
>>> ("thread-id" property) to configure it externally.
>>>
>>> Make memory-backends consume a thread-context object
>>> (via the "prealloc-context" property) and use it when preallocating to
>>> create new threads with the desired CPU affinity. Further, to make it
>>> easier to use, allow creation of "thread-context" objects, including
>>> setting the CPU affinity directly from QEMU, *before* enabling the
>>> sandbox option.
>>>
>>>
>>> Quick test on a system with 2 NUMA nodes:
>>>
>>> Without CPU affinity:
>>>     time qemu-system-x86_64 \
>>>         -object memory-backend-memfd,id=md1,hugetlb=on,hugetlbsize=2M,size=64G,prealloc-threads=12,prealloc=on,host-nodes=0,policy=bind \
>>>         -nographic -monitor stdio
>>>
>>>     real    0m5.383s
>>>     real    0m3.499s
>>>     real    0m5.129s
>>>     real    0m4.232s
>>>     real    0m5.220s
>>>     real    0m4.288s
>>>     real    0m3.582s
>>>     real    0m4.305s
>>>     real    0m5.421s
>>>     real    0m4.502s
>>>
>>>     -> It heavily depends on the scheduler CPU selection
>>>
>>> With CPU affinity:
>>>     time qemu-system-x86_64 \
>>>         -object thread-context,id=tc1,node-affinity=0 \
>>>         -object memory-backend-memfd,id=md1,hugetlb=on,hugetlbsize=2M,size=64G,prealloc-threads=12,prealloc=on,host-nodes=0,policy=bind,prealloc-context=tc1 \
>>>         -sandbox enable=on,resourcecontrol=deny \
>>>         -nographic -monitor stdio
>>>
>>>     real    0m1.959s
>>>     real    0m1.942s
>>>     real    0m1.943s
>>>     real    0m1.941s
>>>     real    0m1.948s
>>>     real    0m1.964s
>>>     real    0m1.949s
>>>     real    0m1.948s
>>>     real    0m1.941s
>>>     real    0m1.937s
>>>
>>> On reasonably large VMs, the speedup can be quite significant.
>>>
>> Really awesome work!
> 
> Thanks!
> 
>>
>> I am not sure I picked up this well while reading the series, but it seems to me that
>> prealloc is still serialized on per memory-backend when solely configured by command-line
>> right?
> 
> I think it's serialized in any case, even when preallocation is
> triggered manually using prealloc=on. I might be wrong, but any kind of
> object creation or property changes should be serialized by the BQL.
> 
> In theory, we can "easily" preallocate in our helper --
> qemu_prealloc_mem() -- concurrently when we don't have to bother about
> handling SIGBUS -- that is, when the kernel supports
> MADV_POPULATE_WRITE. Without MADV_POPULATE_WRITE on older kernels, we'll
> serialize in there as well.
> 
/me nods matches my understanding

>>
>> Meaning when we start prealloc we wait until the memory-backend thread-context action is
>> completed (per-memory-backend) even if other to-be-configured memory-backends will use a
>> thread-context on a separate set of pinned CPUs on another node ... and wouldn't in theory
>> "need" to wait until the former prealloc finishes?
> 
> Yes. This series only takes care of NUMA-aware preallocation, but
> doesn't preallocate multiple memory backends in parallel.
> 
> In theory, it would be quite easy to preallocate concurrently: simply
> create the memory backend objects passed on the QEMU cmdline
> concurrently from multiple threads.
> 
Right

> In practice, we have to be careful I think with the BQL. But it doesn't
> sound horribly complicated to achieve that. We can perform all
> synchronized under the BQL and only trigger actual expensive
> preallocation (-> qemu_prealloc_mem()) , which we know is MT-safe, with
> released BQL.
> 
Right.

The small bit to take care (AFAIU from the code) is to defer waiting for all the memset
threads to finish. The problem in command line at least is that you attempt at memsetting,
but then wait for all the threads to finish. And because the context
passed to memset is allocated over the stack we must wait as we would lose that
state. So it's mainly moving the tracking to be global and defer the time
that we wait to join all threads. With MADV_POPULATE_WRITE we know we are OK but I
wonder if sigbus could be made to work too like only registering only once, and the
sigbus handler would look for the thread based on the address range it is handling,
having the just-MCEd address. And we only unregister the sigbus handler also once after
all prealloc threads are finished.

Via QMP, I am not sure BQL is the only "problem", there might be some monitor lock there
too or some sort of request handling serialization that only one thread processes QMP
requests and dispatches them. Simply releasing BQL prior to prealloc doesn't do much,
but though it may help doing other work while that is happening.

>>
>> Unless as you alluded in one of the last patches: we can pass these thread-contexts with
>> prealloc=off (and prealloc-context=NNN) while qemu is paused (-S) and have different QMP
>> clients set prealloc=on, and thus prealloc would happen concurrently per node?
> 
> I think we will serialize in any case when modifying properties. Can you
> give it a shot and see if it would work as of now? I doubt it, but I
> might be wrong.
> 

Over a quick experiment with two monitors each
attempting at prealloc each node in parallel, well it takes the same 7secs (on a small
2-node 128G test) regardless. Your expectation looks indeed correct.

>>
>> We were thinking to extend it to leverage per socket bandwidth essentially to parallel
>> this even further (we saw improvements with something like that but haven't tried this
>> series yet). Likely this is already possible with your work and I didn't pick up on it,
>> hence just making sure this is the case :)
> 
> With this series, you can essentially tell QEMU which physical CPUs to
> use for preallocating a given memory backend. But memory backends are
> not created+preallocated concurrently yet.
> 
Yeap, thanks for the context/info.

