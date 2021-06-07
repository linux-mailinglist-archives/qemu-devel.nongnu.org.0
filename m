Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBCC39E43E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 18:41:34 +0200 (CEST)
Received: from localhost ([::1]:52310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqIJh-0005jN-D4
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 12:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lqIIp-00052W-63
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:40:39 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:36474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lqIIm-0001VI-I4
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:40:38 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 157GXIeq024641; Mon, 7 Jun 2021 16:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=Y8SudiQdGUjO748wfYcCsUQJBLhxNhb/5GFARQ2vvD4=;
 b=Io0uCy80sXEXpjFHYN+WvTBPUuzWQveuWpA8eUJsvynb/U9HNndB27Tqn9dqnmFOwGp8
 lwCL27AH+KfRAWNrsRpwKgYkukC1vhHbvQ8rQeZirIy4prkaldUVwdkUVBMfsS+blTIu
 oym9O7/mA1iL8zq8SCYcdI1as/M0vWI1we3WFfMbhNkrU4Fenwl9DvwcFLeiOrHqCIi6
 iMPniuZG01k6VOtgO3z/TPtQb1EepFSN/lSw5fkfQU5BXDcPMXWf0n4n9K5hiXEfaGEy
 HTDTZ0i3pV1fyr/igv/U/fuBUwoI288cyzLOXVncRPKuaQ55EWjPUKaxNbzeMIe8EkBZ Ag== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3916m08ahk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Jun 2021 16:40:29 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 157GeRR9096235;
 Mon, 7 Jun 2021 16:40:27 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by userp3020.oracle.com with ESMTP id 390k1q79jv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Jun 2021 16:40:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDlhVRKmpQ24ZuKxp4QReNTj9C8jKPR+QJy7+wB+334wKtVtDaHtEdXYZjydANwaqiqf1zwCbG/UBSYhylMyi8Pnwp92G5Nrm0R5dZzdeJZPmmmrLooK7SQmAJgezhodE/CwSZG/xSrgfO2UH2UBJ3FMSqTYaSkfrgT0a0fDyjl/iIgZqf7NlLdFHQSE4UMKCEuZBc2zhYi8rD0ec2Kk4Xk8T/LORjlQxWoKka6IPivP499neaU0AS+h+Bz1mgDFZJE/L3IAGrCJgFJXuo9Y20U0Wq2eolEjEx5WwzmKnTI5uwR/T7iewq/4kRkzihAlseetJX0B4gct00IKgQXgnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8SudiQdGUjO748wfYcCsUQJBLhxNhb/5GFARQ2vvD4=;
 b=P0E1VJLNAXFamrQ0t14n+xByFt5A1KGoR9Mw6CdbPr3yLnb72YAAQeTqt/qwInxUQfgL5C7YBSYhMguQgEmJsyblH64Gg2So8r8WySGroBrbr/TQllJZopUqrfWi3gWVKzgOa0Q3IuVtBiHKshYmzMO9QHvHt/Kbg7i6Thdz1qJ6IiLWqiNlOYJDVOdXznyT6GGNSpQdajrckQaQyeJOVbwvxwH1rBwZ0N/1nSbU3OVwrrrZSPeTYYDGUsPJfRBYno2AM37aXG2C/CT1RgJhV6LwJr71BJPsZnHijbeXX1RCqUoA0mJhQ1K5k6B3+oSLDbzaNV3Tu8Nx/IcShWtlqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8SudiQdGUjO748wfYcCsUQJBLhxNhb/5GFARQ2vvD4=;
 b=q8K0P01nEH8up9ZS6tSM6MQWpY28TWH3UvzetwAMXLLngJ/6l6Xh1YKtUHoPh9R9rjejlZTUfujpB2VYgybGPXRR36BfAZR1jzB71P0qgg4olSftMS9cNMzQXeJLEfxQDnT/uGwqpgr7QEPuBBIeuTpKx8HAI3EGoi8QzSqoDMY=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB3430.namprd10.prod.outlook.com (2603:10b6:a03:8f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Mon, 7 Jun
 2021 16:40:25 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 16:40:25 +0000
Subject: Re: [PATCH V3 00/22] Live Update [restart] : exec
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <29356c3a-0b3f-2773-4f9f-18ff4ed4d5bb@oracle.com>
 <YKOPnkefxgRZ8PoQ@work-vm> <a1d3dfea-d15e-35a3-a216-3ce65600f2d6@oracle.com>
 <YKQULUn5F+x1wrYI@work-vm> <38dc91ab-b96b-1cc3-bf8b-84ff77b334fd@oracle.com>
 <YKZgZELudL9HobEe@work-vm> <37713c98-5f2a-6cff-d3c4-9e1c60cc4107@oracle.com>
 <YKuCbujlfOCEYUP3@work-vm> <9a1564dd-bed9-8518-8d5b-3ca9f0243643@oracle.com>
 <YLkvShM1MMLh6NpG@work-vm> <YLk/MoR2Wa20/gU/@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <b8d0689d-7a54-de55-7cac-695812265d9f@oracle.com>
Date: Mon, 7 Jun 2021 12:40:21 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <YLk/MoR2Wa20/gU/@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: SN4PR0201CA0072.namprd02.prod.outlook.com
 (2603:10b6:803:20::34) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SN4PR0201CA0072.namprd02.prod.outlook.com (2603:10b6:803:20::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24 via Frontend
 Transport; Mon, 7 Jun 2021 16:40:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 851c67ac-ce68-47f7-dc0c-08d929d2f34d
X-MS-TrafficTypeDiagnostic: BYAPR10MB3430:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB34300F7AFE8580BCB26CA9E4F9389@BYAPR10MB3430.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SGU34cp6ZmxzaQEYdHOLyFL0Qf8f+jcLbZmPVeQcVg11Rx60nvtEd4AqKwn1jJwAGcehHDlkxU6gJ3X5PQhwN3J8nQ4zq4Z4Ev6nDKVJGkFERokielhtZ2vM1tKm9WTzedWwDOkC6lDS46jh6bCY09QS0iCzjljVGu+mM3te4BLjlwwPkiuXPZT1eQFcQnuBdnkC/ZoyhNGyU50F+Ah19HM9Qvrc/xmfjTzKH9sPKrAxsdF3B76k0PDfI1Sctp4jhvQPG+Ck6nx0VS0Gdd3cezsUo05gtD1KpvjNiNlFBE8XVgQAZfswz1xWmAL2LBtOnOHSgQI4aNz18vejFOKlU9jnxTfgjNdovyU2OXreyHnK2IEiOWgexZtbzQhRwMtynCVp76aRapZAMbL9Jv3XB9jP7y9wzoClPPvy9U4sctr9YfmKDmFMyHzO5BDSec9xvUVOe6UqpuCw1yoL5ycY2W/EIfLL57XKZF1Vo6NROCa6QFv+U7Hg82P5zLGZSGeNWFCTM7OBgYLe8DPM7ulyDAZjVRwU/4aSk2dFFvS5188QVSCAuzF6PK2YvQlpGWZS/f5pBUOepUs3gwExTJFZvDbFgY3mUT5rPEhJmTD0xOkrnQMdFzhEuNedm7nZxjUZ2kuI8E9k67EfQXA1LLa79U74vvviktwYb19VHJAH8oLwMR3u6AoK7KjwIvQDCm7a
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(346002)(39860400002)(366004)(136003)(110136005)(66946007)(5660300002)(66556008)(66476007)(83380400001)(31696002)(54906003)(38100700002)(44832011)(6486002)(2616005)(956004)(16576012)(86362001)(316002)(31686004)(8676002)(8936002)(478600001)(107886003)(15650500001)(36756003)(7416002)(2906002)(53546011)(16526019)(36916002)(26005)(186003)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WS83SmdLTGJRVFZsMzVuNjdhZW5FREs4bkV3R2FleW9NVzJkcktYby9ybFh2?=
 =?utf-8?B?N1ZseSs2S3UvZWlVYzduWVB0VlMvKzNWSHgrU0FzdHBNRDVFbEZTbFIxRzJs?=
 =?utf-8?B?cVNONHlMdU5HcXgzemdMdEVwTSttNTFRQzJ2K00rWWQwYWxyN1o5eUtUdCtD?=
 =?utf-8?B?VnBzTTNINUtKZHlUTDRKR2VlODE3SFVtYzVlOWxNTDJxTjM5SGpDdmxja05O?=
 =?utf-8?B?dWJFZkJWOXFGbTJuaE5IQVBNeEdqbTVERjNhaEpBTXpZQzk0UVgrZVVYYjRr?=
 =?utf-8?B?dUhJVGJpU0p1SU9TZWhnU3Izcmt1NHU3MUUydVFEOG9KNi9EcUFaTTYyQ0M1?=
 =?utf-8?B?WkNzU3h2MmR4QVRVTUtOeUNicHJsZGpPc2k2M3VhS2Z6RFpqaDdXWm5nR1ZR?=
 =?utf-8?B?SkxyV2k5YTlWNW80NjRpS1c5aWdXYkZsc0hXU1BxS1NuWW1nVG85MTk5d2E4?=
 =?utf-8?B?SDZ2Z0MzNDYraDc5OVd2c0pYL3g4anEvYk90ZEZoTDd6RjNwQUFodmZvN1Z1?=
 =?utf-8?B?dHpRWVpzc1VZQ2FvU0FPTmhFRkZ1SW1PbTZmbW1MZjVVZ25TU1RxL1dTcTJQ?=
 =?utf-8?B?UUJ0UjJBZEdtNXQrZ3RUeUFaM0FlT1VRVW5HaUVyQm1EaXptaGNmMXNYVmNy?=
 =?utf-8?B?MS9IZWJiaUg3eVgrR0hHcEk1SVZ6emN3OHVTQmozTVRqMzVjbHNqcWxWUEUx?=
 =?utf-8?B?TjVXRi9LVERBbUFPZU15OFI1aEhFMGFScUJvTTQxc1VERWl1Si9DU2dWSFpk?=
 =?utf-8?B?QXlRcW9PcTRtZzhzSk5MWWdYdjdtUW9vekIyODJOSCsyN0NJMDRPZ2NzRDQ1?=
 =?utf-8?B?emI2dXFKN2JLKzIwVS94UlNMMlNkaEFZWE5pVXJPTks5QWtYcXdsZUF3N2hH?=
 =?utf-8?B?bWJ5OXc0cWxLS0dMcVlDWnpuOStGdVVVMHVPT25hRCtpV2l6cGJ6ajMrS2Zh?=
 =?utf-8?B?YVRCeXM1dmJqUkhJbXRZYVEyRFF1a1lkK0ZiZ29KbW9yZExEclR5N0dSbUJw?=
 =?utf-8?B?Zy9FeWU3MGI2Y0hXTFRYVytndnA3dDVXTC9UellUK3BVSWh1SHNNalJmR3Zy?=
 =?utf-8?B?TkdER2o1bm9hRnJob1lQeVRzb2FobWo4enVPRGZmZlNRUUY0YTB1Unk3cTRx?=
 =?utf-8?B?OTlLZjhzSkVoVE5EWkpmMjNiKyttcFB0R24yT0xCL0xxRWJpUE9nREJLWURI?=
 =?utf-8?B?SzRFTHcyTEZnWHJiSndqVVlzTlhseW5ML0daQ05yVWtVMmFwUTJSQjllVVZB?=
 =?utf-8?B?eWZFNDRUTTBNa0p3ditaMjFicjF2Z3JGcEVKY3NZQzQ3aVMwWk1YVWhSdHhM?=
 =?utf-8?B?VE1idTUyVHhWZ250MmJhUDhiTzVqUDFJV0Qray84L1dEd2UvY2xuTENNN0U2?=
 =?utf-8?B?eWsvM2Y2ekkzcFhXeklmWmtEdnNvOEdIOUtIQ1FqZFJ5d0orVkdWazVoMkZZ?=
 =?utf-8?B?ZGxRWEg1VHdhdnpkMGFUakdyeGN1dXpGUGp3eUZnU0loSTBBWXA0KzVEQS92?=
 =?utf-8?B?Q3MxMHBRK1RPSm9OVGZ4eWlERFF1djF3cWx3a2NESE96UFFpQU9kanhLdkZt?=
 =?utf-8?B?QXR6M1RzWERqeFM3b1A5R0EzNUFDd2o0bEJSWWhqc2NPUmFGU2hiVjJqbFFG?=
 =?utf-8?B?OVN2alkyWlQ0eFNJdlgvRDUwMDVNR2VjVVdKcm1zZkJDK3Q4OEhwN3ZmRWsx?=
 =?utf-8?B?SEtFbEt0STZuZzc5UFZLOVZLRk1CWGtkUGFhRGZCdG14MWFWeGtrNnpmQXZO?=
 =?utf-8?Q?WE8i6MiT23nwrCAE+W7A/uAlI+Yj2prIDZP9ksQ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 851c67ac-ce68-47f7-dc0c-08d929d2f34d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 16:40:25.3741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CdK2wkS9TKd1Gy4JlDznl6+Rv5scMVzglVhNlkADZyGoQRWedzretv6rL+32bKc1NBg3RjQS0CqWE74U2TWshCxbPPF9AW5OM4Zly46cSkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3430
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10008
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106070117
X-Proofpoint-ORIG-GUID: i9Z8Sfo-qemLq4dM3s7A7xN4ECNDHS2Y
X-Proofpoint-GUID: i9Z8Sfo-qemLq4dM3s7A7xN4ECNDHS2Y
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
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

On 6/3/2021 4:44 PM, Daniel P. Berrangé wrote:
> On Thu, Jun 03, 2021 at 08:36:42PM +0100, Dr. David Alan Gilbert wrote:
>> * Steven Sistare (steven.sistare@oracle.com) wrote:
>>> On 5/24/2021 6:39 AM, Dr. David Alan Gilbert wrote:
>>>> * Steven Sistare (steven.sistare@oracle.com) wrote:
>>>>> On 5/20/2021 9:13 AM, Dr. David Alan Gilbert wrote:
>>>>>> On the 'restart' branch of questions; can you explain,
>>>>>> other than the passing of the fd's, why the outgoing side of
>>>>>> qemu's 'migrate exec:' doesn't work for you?
>>>>>
>>>>> I'm not sure what I should describe.  Can you be more specific?
>>>>> Do you mean: can we add the cpr specific bits to the migrate exec code?
>>>>
>>>> Yes; if possible I'd prefer to just keep the one exec mechanism.
>>>> It has an advantage of letting you specify the new command line; that
>>>> avoids the problems I'd pointed out with needing to change the command
>>>> line if a hotplug had happened.  It also means we only need one chunk of
>>>> exec code.
>>>
>>> How/where would you specify a new command line?  Are you picturing the usual migration
>>> setup where you start a second qemu with its own arguments, plus a migrate_incoming
>>> option or command?  That does not work for live update restart; the old qemu must exec
>>> the new qemu.  Or something else?
>>
>> The existing migration path allows an exec - originally intended to exec
>> something like a compressor or a store to file rather than a real
>> migration; i.e. you can do:
>>
>>   migrate "exec:gzip > mig"
>>
>> and that will save the migration stream to a compressed file called mig.
>> Now, I *think* we can already do:
>>
>>   migrate "exec:path-to-qemu command line parameters -incoming 'hmmmmm'"
>> (That's probably cleaner via the QMP interface).
>>
>> I'm not quite sure what I want in the incoming there, but that is
>> already the source execing the destination qemu - although I think we'd
>> probably need to check if that's actually via an intermediary.
> 
> I don't think you can dirctly exec  qemu in that way, because the
> source QEMU migration code is going to wait for completion of the
> QEMU you exec'd and that'll never come on success. So you'll end
> up with both QEMU's running forever. If you pass the daemonize
> option to the new QEMU then it will immediately detach itself,
> and the source QEMU will think the migration command has finished
> or failed.
> 
> I think you can probably do it if you use a wrapper script though.
> The wrapper would have to fork QEMU in the backend, and then the
> wrapper would have to monitor the new QEMU to see when the incoming
> migration has finished/aborted, at which point the wrapper can
> exit, so the source QEMU sees a successful cleanup of the exec'd
> command. </hand waving>

cpr restart does not work for any scheme that involves the old qemu process co-existing with
the new qemu process.  To preserve descriptors and anonymous memory, cpr restart requires 
that old qemu directly execs new qemu.  Not fork-exec.  Same pid.

So responding to Dave's comment, "keep the one exec mechanism", that is not possible.
We still need the qemu_exec_requested mechanism to cause a direct exec after state is
saved.

>>> We could shoehorn cpr restart into the migrate exec path by defining a new migration 
>>> capability that the client would set before issuing the migrate command.  However, the
>>> implementation code would be sprinkled with conditionals to suppress migrate-only bits
>>> and call cpr-only bits.  IMO that would be less maintainable than having a separate
>>> cprsave function.  Currently cprsave does not duplicate any migration functionality.
>>> cprsave calls qemu_save_device_state() which is used by xen.
>>
>> To me it feels like cprsave in particular is replicating more code.
>>
>> It's also jumping through hoops in places to avoid changing the
>> commandline;  that's going to cause more pain for a lot of people - not
>> just because it's hacks all over for that, but because a lot of people
>> are actually going to need to change the commandline even in a cpr like
>> case (e.g. due to hotplug or changing something else about the
>> environment, like auth data or route to storage or networking that
>> changed).
> 
> Management apps that already support migration, will almost certainly
> know how to start up a new QEMU with a different command line that
> takes account of hotplugged/unplugged devices. IOW avoiding changing
> the command line only really addresses the simple case, and the hard
> case is likely already solved for purposes of handling regular live
> migration. 

Agreed, with the caveat that for cpr, the management app must communicate the new arguments
to the qemu-exec trampoline, rather than passing the args on the command line to a new 
qemu process.

>> There are hooks for early parameter parsing, so if we need to add extra
>> commandline args we can; but for example the case of QEMU_START_FREEZE
>> to add -S just isn't needed as soon as you let go of the idea of needing
>> an identical commandline.

I'll delete QEMU_START_FREEZE.  

I still need to preserve argv_main and pass it to the qemu-exec trampoline, though, as 
the args contain identifying information that the management app needs to modify the 
arguments based the the instances's hot plug history.

Or, here is another possibility.  We could redefine cprsave to leave the VM in a
stopped state, and add a cprstart command to be called subsequently that performs 
the exec.  It takes a single string argument: a command plus arguments to exec.  
The command may be qemu or a trampoline like qemu-exec.  I like that the trampoline
name is no longer hardcoded.  The management app can derive new qemu args for the
instances as it would with migration, and pass them to the command, instead of passing
them to qemu-exec via some side channel.  cprload finishes the job and does not change.
I already like this scheme better.

- Steve

