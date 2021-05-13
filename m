Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B5237FEF9
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 22:25:02 +0200 (CEST)
Received: from localhost ([::1]:60178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhHtF-00015X-MD
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 16:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lhHpe-00035s-Dr
 for qemu-devel@nongnu.org; Thu, 13 May 2021 16:21:18 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:59110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lhHpY-0001AI-V0
 for qemu-devel@nongnu.org; Thu, 13 May 2021 16:21:18 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14DKHDOI002040; Thu, 13 May 2021 20:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=4bRTwrmwbJIE7gQuKGLVjuiPTsv1KCpJ98WOeZoyCBA=;
 b=acvSm32SHXxH+CqGJXLOfLtRrGf5WJppLf89GPxnmSkaomVlyhso79b+Jk3PoXzstsFA
 Z2ADyGnCpphdH+1gfzl7AEkus8aw3O0/+roFRhzYVc+TRu+bt87qOhNU+jFrxT93n5+H
 93GtFy2lHSUoLUjM5J7r/zT2OUCz8G9VqxMFzYgFhnDRKjZWXueez+3bEqwBf4VqRs4B
 3tm6bVLLA76uphuLWeQm9w1lZtblXXSt4qLn7EEeXnjYikS15gw38kblNuACsFst9OFM
 DMC5xG0/pJkcgASye7k5BhWPBF6DlyTP1c3siWuFQBc6GrXuQPe0XYtmwtBqVL8gohzy Bg== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 38gpqmgdk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 May 2021 20:21:09 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14DKKQ3h024441;
 Thu, 13 May 2021 20:21:09 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by aserp3020.oracle.com with ESMTP id 38gppcbngv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 May 2021 20:21:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqiEIRciJ2ZPUIwbSkwqMIC6LwvRNpOlwSqP4hsODDU2l2b5ORRBTK7jPNx1yW2jW0CrWx91AR/eY/1652l4wFCwXUAoPSAG5VNoGHiyBeQzA+XmkgIMDUgTZh0QmhicjLZYriHczW0SE3TnI9yaxIgTaWQSkSU/o0ebE66lTTx/S3Y68jgm+JXSxWhVc9y1K2ujoXAtAwEfEHIPqoLnZ4dMUNjAHNJ7v24dDm+t0XNMkQFwfyz6pVFIicUIzaSoqIhIZNtY7sS0XIN7zMvu/5+Z15GxB8w8S3c/NjzW+Wbqrw7epbf6FvO7ImfjmHE15VR++Klsbv+59GDCv6j+cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bRTwrmwbJIE7gQuKGLVjuiPTsv1KCpJ98WOeZoyCBA=;
 b=O5cLdLBNd7WOycq8Qohj+nC45jVPqoQvoRod2GBp6QKH3rfur7BnabRZgwxAARoNiZoyUce/bL/ZFAHBM+lCnXjoV4OJSV+oW3oBnOlnCeGU5l3JzAGOz8kTd0VWlb4wnUFNoNdT0saXmGxY1AeK3TIIGH3j4sqIMsMClBzs4Cfo1+SMa5q1bC8JHVrXdcSUIHLPHAbF+mLxeMkKptHXDdcHiqEKtdAtf/m3THFPhDe1QBShsy6ithFIEGHhaX3nbly3PyGu9V8FB77LWPFCM8JSYWf4WUTpeCD7On3QGeS1x8k1kW6QD00ga3mOLFR6UDp8g0joFV5/PtDMg2CCrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bRTwrmwbJIE7gQuKGLVjuiPTsv1KCpJ98WOeZoyCBA=;
 b=LyMA11O2CcTQ7/Q390BPKK6XdnT2jOKnLidJS4JXeDGnQmeSqyHzfQUUq0ixO1ROTUruNLtJQHJX/c/U7lHg/lojTuybyZsF5aA/PKuad9y7vPyvqgfSCsp8xk0Ds3/DPS8s+PMhCiSYg6CLfjSc5b56iEQJ2phsjuNbS0dC0DE=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB3014.namprd10.prod.outlook.com (2603:10b6:a03:87::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 13 May
 2021 20:21:06 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4108.031; Thu, 13 May 2021
 20:21:06 +0000
Subject: Re: [PATCH V3 07/22] cpr
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <1620390320-301716-8-git-send-email-steven.sistare@oracle.com>
 <YJv/9uOKbYmhAyQp@stefanha-x1.localdomain>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <008ac3a4-a187-3e9f-d82d-8279e82805b1@oracle.com>
Date: Thu, 13 May 2021 16:21:02 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <YJv/9uOKbYmhAyQp@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: SN7PR04CA0091.namprd04.prod.outlook.com
 (2603:10b6:806:122::6) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SN7PR04CA0091.namprd04.prod.outlook.com (2603:10b6:806:122::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Thu, 13 May 2021 20:21:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0020eb4-1006-4ae2-ed06-08d9164ca311
X-MS-TrafficTypeDiagnostic: BYAPR10MB3014:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB30142A3FA736ACE5240534EFF9519@BYAPR10MB3014.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FInTB595s7P4EDWUfHqNc8ztMI+cT3f2s17oK9FPA26BaDst0rqlplAM9/OOXhCf04kdAE+haDxgjsN+0L1xANGLt9S1AE2pVcg6j6VvgQhtMUKjC/gTuwregwt0yZKdbho8NS0myxWdStRVhqVuAWF6E0anVblV8nU8KaEvVHZToxXbtNbEKFJJjUC7JMMqMJLkxhbvddkSsOK44BZstb/vXC0JkObbULCY4Aay3QAv+fjatSbGAAP5G7yxRlx2o2twp6GaXSUzMEQSvr6mhLw7CnKp1YjZsdoX6jizX5x4hgqpy0rgXCouMoXiqVGQGBw8YM6kaSEN4+SFniUcDGgT3M6yf9EXbn9buFrEUtnKxXMVgh0sSq/e/HLyDrR0BeN47buEiOO7p0wU5tKQaptSNoEGqmnTPKkWygJvpBz6fQPBr3eDTsm1PuYVxo0MRkBYdwy0dRtRIaoKwKePzjxPq65J2OOmY1w3WXkx1xKdx+c+Wj7EH5QkGOsF4t8LHPDreXGii5pihH/kfA7kZb7hbdslxTS46P0YDRpbLEV0FzlKLarpHlXG9VVvwkamT+Ec3WfHDHcKgpQ98+3qLXEl7m9d/EELnm3m8Lne8gMj1+sGuORHmRhP8u68SMvPizDjuwRb6eK5wLoG0MtwPXPwEOINfEzV5c1hi9yFo0ourUg072YRgjfffcaDDfbK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(376002)(366004)(396003)(136003)(66556008)(4326008)(8676002)(66946007)(86362001)(6916009)(16576012)(6486002)(31696002)(36756003)(66476007)(54906003)(53546011)(478600001)(36916002)(2906002)(5660300002)(316002)(107886003)(26005)(31686004)(83380400001)(186003)(16526019)(8936002)(38100700002)(7416002)(44832011)(2616005)(956004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?Jy2J0kVdrxNYhCLosVQf2/n3VUztvR7nGXHGgvCYoIvzsxFnnOYkqVBK?=
 =?Windows-1252?Q?NZIwFoWAWH99jTI+uHDB7QTOXD8QcapXy7vhgtut5MB9TmDtjXNF3ae2?=
 =?Windows-1252?Q?c4842PWMsQpcvmo5bSlF9pDh3RLq2dAsg9Pz10jKw44fcf2J3yMJLyf8?=
 =?Windows-1252?Q?7ekjt84WHULJPnggq5wC6HBXqLEfZi6wwETrEWqfrRQnBrMM238ZIhE5?=
 =?Windows-1252?Q?mZRCXIxIW6QXE8h0yYeF6iOiinNEoPCxF7VRD8fTsKvEl8zOVcNA9oQD?=
 =?Windows-1252?Q?5HqRFTqnOxbw3z3ikuts2PY8RpPqZOuGav5B5jk3fnLk8xMT2D0zsAU+?=
 =?Windows-1252?Q?4K9kHBuJWZQDFL/RA27k0MoSavO//vJpSyBM4LVJkWzjdW8w1FmwKCRJ?=
 =?Windows-1252?Q?lEmls7xYXp3+a0M6aZq2+kXwbiqsXfIzuK0G5lY8TkWOQo0fohqmNW8q?=
 =?Windows-1252?Q?mqMBdWGUaS7I3yWdSVPggs/WSDBKXnFwFZfe4DhHNLGYraGcclq6wuQT?=
 =?Windows-1252?Q?kCuW31LypTjngGHnZI3io3aiehG+awcFJ7g/Dr8ZTOEY5Q+IGUlcCstH?=
 =?Windows-1252?Q?l3HGIWRQ8fJo95BjleyMCpPM1F7kEM/kMnhKnZyeqmREqvhJl9Q3EFQy?=
 =?Windows-1252?Q?gDyJO4GPdVlkQtpC5gwyHFTDDgGBjpkY7bQEQHwYGzpDN/f9acw1m3dj?=
 =?Windows-1252?Q?fkuKr+2T2jWJR+8GiKvTBRBJwaw369BZhW+r/UAsM6CO6llXwiavDrAu?=
 =?Windows-1252?Q?b+3/A+Xe8kTw8C6W8ONCGwx83FHJYm277JtMLjEJo6fAyCGzMcTJ+lEr?=
 =?Windows-1252?Q?JiWO9Qh4gZYEQ4uOAQ83sUegB69ZHDkHwruL7o4VBWYmvWV92imNkZkI?=
 =?Windows-1252?Q?FFxahkW5vJWQ17ZAbAoQoFlWtTtawHvml8BECVL7CRco2BCvKN8eQb8q?=
 =?Windows-1252?Q?xtjiNZR/zgA4n2SH9bPuFm1zVsIP71DfTqQLMFya+73/+8X8kLh0slCd?=
 =?Windows-1252?Q?MeeIdTeVrRiL9DPIJNjSrL0abFRL11Ip6YThVRspPoB7kVJENBxHpCdA?=
 =?Windows-1252?Q?QWpZM8W2FIFCXdtCBRAiSBSm7DWh51V+Q1PgjUG2QlDj1PwYX4yHtfUP?=
 =?Windows-1252?Q?rrtsYc4SBKWKoLgdoJaTEu3/r5dkCuAtoU3kc0NkB7L1Ww7gPBbZVv5e?=
 =?Windows-1252?Q?CWxf2wc6+7fx8X610+ECLphUyrclcdtKBGaxFZJwspxYw1vImOo3KWZn?=
 =?Windows-1252?Q?E8VArSmC+HAvvzIcSio7gtJtkNhMAfx+PaFBRmsXr/69lTsrb+f0bXaW?=
 =?Windows-1252?Q?YRjSeVjKqXUksMFDK3SOQ2Q7RGJH0NqKvD8g7wapwN1/Q7stzihM3bDD?=
 =?Windows-1252?Q?ApsWcEzZWJgZbHBD47FmeQMHUNj7WURtIjxFP3XpZoKjID2KPnE4+eXL?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0020eb4-1006-4ae2-ed06-08d9164ca311
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2021 20:21:06.0721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZcDzrqXKt9qDLJWH5n2YsKOvvFQZhOGgbdAg7V9uGXwm8rWXt5+0vE/9c/FACzVyh3LOstAjUwJJ9PqJhrvI4N8DGCcKCxrsGKwz1EB7+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3014
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9983
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105130143
X-Proofpoint-GUID: 7__Hp1xwP0Wq7mkxVz9iOAZSNznWNTrj
X-Proofpoint-ORIG-GUID: 7__Hp1xwP0Wq7mkxVz9iOAZSNznWNTrj
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/2021 12:19 PM, Stefan Hajnoczi wrote:
> On Fri, May 07, 2021 at 05:25:05AM -0700, Steve Sistare wrote:
>> To use the restart mode, qemu must be started with the memfd-alloc machine
>> option.  The memfd's are saved to the environment and kept open across exec,
>> after which they are found from the environment and re-mmap'd.  Hence guest
>> ram is preserved in place, albeit with new virtual addresses in the qemu
>> process.  The caller resumes the guest by calling cprload, which loads
>> state from the file.  If the VM was running at cprsave time, then VM
>> execution resumes.  cprsave supports any type of guest image and block
>> device, but the caller must not modify guest block devices between cprsave
>> and cprload.
> 
> Does QEMU's existing -object memory-backend-file on tmpfs or hugetlbfs
> achieve the same thing?

Not quite.  Various secondary anonymous memory objects are allocated via ram_block_add
and must be preserved, such as these on x86_64.  
  vga.vram
  pc.ram
  pc.bios
  pc.rom
  vga.rom
  rom@etc/acpi/tables
  rom@etc/table-loader
  rom@etc/acpi/rsdp

Even the read-only areas must be preserved rather than recreated from files in the updated
qemu, as their contents may have changed.

- Steve

