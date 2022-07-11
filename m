Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D3156FE42
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 12:07:08 +0200 (CEST)
Received: from localhost ([::1]:44450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAqJn-00033z-3g
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 06:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oAqF7-0007rL-4J
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 06:02:20 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:61308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oAqF4-0006EL-5W
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 06:02:16 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26B7YQmH012045;
 Mon, 11 Jul 2022 10:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=d2IJw6tR53Cir7anQ9IFwwefToI2mayY5/DZo8Eszgg=;
 b=SQpgulZCA/Hv/qYUb610tXncEiKGC0hu6UHxQaVGBqXtFzqMrcDXfHrKosQCi7BuSwNu
 KYHsHifI30joDjV4a0hIzsBIaVwTavcBM7DwUSKgayBM27Ba1qze0tod2fbqWRzw5+O7
 UFf7RdDdxX9WaCfHU/PIsTlxstayA3k6/q4ZgEqJdU3QMh7Mcq8BLizK3bUwLszLLsTb
 Rk1zepUhkCE+3ZHWBxkT6fwWGjK1yECVZ8DKhJIgTHo2Lrr3wcXein/JGO5C0eNBVaTK
 N/xPi7ox8q6EAAIz5Bdr/EUu9lGjrFUMLhvBxgpU6b76WqFzXUQlanYZ9MPE+uxxQv4e Iw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71sgjxfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jul 2022 10:02:00 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26BA1GGV018421; Mon, 11 Jul 2022 10:01:58 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h7041rv7j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jul 2022 10:01:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWIKLkM/3rWpI2rvM/AkL+4tZ/pLL1RGGWvppDGSobmIittbQMxpMCQcGSgUEX39KcG4Pj7kX2pk2GB+Mj1jQ8weu1EoSJFHLJq7/1nD/1h3S4ftWsJVvR7uk3lJSUe+G/J+JqQDEnqFZrqSXGebm2fn5L5eW3RmVpybPhEUDg3j0q3sXyXMo0Sknr9IUnx7sfEZ4n9YxbbAuNPfkhU5RlrycoHWL/9qMlSLy1GaqhyYpAX6kPB4krCcw0Rj2tsxUwXvcunbsKtXQZpLniDPVUxshQBtFCisfEAhIyeHaTf5aTUXRmr2ra2A2sQEnfq5z3huozq70Iqo8gnNBLL2XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2IJw6tR53Cir7anQ9IFwwefToI2mayY5/DZo8Eszgg=;
 b=O7k/TDkRtaBdXIkhZafjGaCyAqY3qkQcASqZKtOWm5MGNKfJGqSfjHZOmk2+JeT+RJBwYIuaukRzzoAXJ0dZGRMieUZn64oxuLwn+/A3jvmgPuj3Wce7wwwaJU0lGxm1UHlGdk/xg9fWG+FvbbiWpvhkbRJQ5NvF9Mn3IZG2MuYoqwxh1YjzUJJe5U4Pio1GnrYHIMjpvVj2KuO0jnFLCpjJ6JLBKqgyjNy9GVDEoOkmFDMD9c/VpYWitwMhhaDTXIIB8tMb4qafvgmiCwnP7JB/KJt0vFRUEOrj7mmCIEMlL2ULV7ChUW7rztobyUbyy999cA+nt/XjrOfWEI4owg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2IJw6tR53Cir7anQ9IFwwefToI2mayY5/DZo8Eszgg=;
 b=Ztlck6/W/VPW0emzDX9/jG4z0uS21zdAeT75UoLnCfvIVLLpFJX0qoUGTzKJNHwqQLuIfApR0xTzUsU6dSTRZ0KsV+hyxCazpXog8HUF7Y/OAEi9FxKvvbBoQ14XeZ8FawFWh6LwfO1BNo64mVIXHtYiF/H+waWQb7zmVRvT5ZQ=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MWHPR1001MB2368.namprd10.prod.outlook.com (2603:10b6:301:2f::38)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Mon, 11 Jul
 2022 10:01:56 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 10:01:56 +0000
Message-ID: <0eefb382-4ac6-4335-ca61-035babb95a88@oracle.com>
Date: Mon, 11 Jul 2022 11:01:49 +0100
Subject: Re: [PATCH v6 03/10] i386/pc: pass pci_hole64_size to pc_memory_init()
Content-Language: en-US
To: B <shentey@gmail.com>, Igor Mammedov <imammedo@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 qemu-devel@nongnu.org
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-4-joao.m.martins@oracle.com>
 <FA725D44-6D1C-4A6A-9D83-FF9482DB4593@gmail.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <FA725D44-6D1C-4A6A-9D83-FF9482DB4593@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0221.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::17) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fda062e2-ff99-4947-5b52-08da6324631a
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2368:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0gVRHSoGboNV6YlwaFkT88zO4EcyOCQ4bH2HfvFI0V8hOB7FzWCkXk74+tqqjprZkbpdTWqsVzG+iUh3hkH/5hUFcjqMd8alBOC1qyHzl3MOv0iJO3TWrdtEqpb6h30ePLF54vrjQb3FmNvuLlG/iTk+klMgckjzHzV7VRouD4cVe65ZIyILxlEJlGM/6zLBjA4eaS95cmqqqLospy9iE3rTDYJz6lKEOwTTbWl7ijPQHaf6fnRnjDlAo1fG1ybFC6nSWqPxXTRcRrO3s7kJX8E3MtXlax2v+dIXqBGo4s0wTXSZUa9Lk1//15jHL6V/sSnmAEFD6N/hKHmaklNxZCy5SwD9zgS2Cy6xnJuf9jIewepUioaXzicWkIIcIPHRo0fw1ta43Kz43oC6Pt5CHyAAF30nj3XUTXS0P1wBOMzjbkLL/AWOdpTrz9HPZy1S1FCFNqE2rpt9ujJYWFPId1g9PhdvD9bkIAS+bdbyEGqrqELARl2tanmrQ9kAZ/4LxI77UtQHML+RYK0xJr1eAwoWZ0OMuRDJh+CxtvvagoWfRjKjZAvU9OtZ+KP27eV8kUofHbZ18m9MyFUabEZRikAeHRDkQCn8/OG/rP87nQAOZ8wzN8VgBlRac3wo70fVn7l6h6zD98sS9NomRxrmR6BJD9I/N2PTC0Gmu0U5LjiH6gjNRUQuhnufJ+prcoGtke31EvpXVBdK0JqKgy4WqAFk+vpDV4KS0BhB5aWA12nAkNO5WyoSYYTUYrufpwEpyW2aHeSVr24vNUDtFqdZtAJnrLRt11ch7wiE/BdWZznqwWmH+TL7SOWE6cQep15b
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(376002)(39860400002)(396003)(346002)(4326008)(8936002)(36756003)(31686004)(6506007)(41300700001)(54906003)(38100700002)(6666004)(110136005)(2616005)(26005)(6512007)(66476007)(66556008)(8676002)(316002)(2906002)(66946007)(7416002)(53546011)(6486002)(478600001)(5660300002)(186003)(86362001)(31696002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVViVjdUb0E1VU40OTV0NEExNlgxdFUwWFk3UHRESnZnUXVyTHMwbXAwYkhh?=
 =?utf-8?B?ck1TVGRDaGNVdERRVXREekl5cEQ2MHBVR0l3MGZjRnNicERsSmZRSGhqdUY2?=
 =?utf-8?B?UEx1RHl5dVRTLzIxSUZVK0paYTFtaGFhWlpUbE9aUEt5QUM0MzhITE43THBF?=
 =?utf-8?B?eWhoSUxBdWdSampmN2NlZ2dpNWRpcnZxd3poWCtadDB4NmpIZm1CVHdSQ1dP?=
 =?utf-8?B?MmkzV0Q2YTJzQjlRV1llanZnR09TSk40Q2xaMnh4eWJWekl1Z0hPSEowZHhH?=
 =?utf-8?B?MGg5WW5FN1ZjbWpXdkdCMllERWd4dW1oRlpiTjI2MW1EWmkvVkF2a3FJN1Er?=
 =?utf-8?B?WWhYMFhjMWpSZnV5dU1ZVXF1RWpVMUttYk9TZ1BYNG9aanI4bHNiWkcvSVJV?=
 =?utf-8?B?RFdPc1F6eFZoVDh3eHlyYVhZYnNGN3RVUzR2eVlyTEtqWGZnTGxMWTFTckRB?=
 =?utf-8?B?Zk5iWVR3RGk1SU5YaXlLampkNWZBV2xTS24zK285OEJHQ0lwSVU5KzlKRUo4?=
 =?utf-8?B?amZrQVNqT2hnbkFSZmxvOVF3ZWwvNCs0NFZ3bkFkSm94T3RiZDVkTzhTY0d1?=
 =?utf-8?B?ais5WkxFVTRvUkRzcHR6NTNHQ2lQUzJDNllxTnhKY3ZhVmc1bm9CcVpybGdz?=
 =?utf-8?B?dDVPandnaUU3Y0hzRmtDOEF2ckZ4ajUvYndlUlJ3emZiaHNoaXgzMTBGRnZ3?=
 =?utf-8?B?SjNHajhXYW5qRmpPZUNuSWZXQ1ZDcVlyYjNWVHVUMGNncGdqTzRBVjE1R0Iz?=
 =?utf-8?B?MDI3aUQ3d1BZK0tiRkhRYitnWHY0bDN2b1hSQUpnOWs1ZVNZZ3F3NUd3MUw4?=
 =?utf-8?B?QXk2L2hXUlpJUkhYamJ6cS9WYy95RlZLblltWDRpNXhHcG9URitob3FxVFlS?=
 =?utf-8?B?ODJnWmo5Q29NTHU3UWxycmFtQUMwdU5EVy9rVFVZcWVySXVTbFBNSDBpbjla?=
 =?utf-8?B?d3laejJSYlpXYVdybkx0WUpkdERCU2N0RUFHN1dFSmNCanNVMGR2MUp4S2lP?=
 =?utf-8?B?RlF3YSt5YisySmdtWDJMbnJWdHpTV2VCWURvN3l1YlRFUjFHVlEvS05ZZ2xF?=
 =?utf-8?B?V1FVWHFSS2NUekRTWk5UdVBoVE1ja0I1ai80NzZRK1pDbFJLRlFHT0lFdy9N?=
 =?utf-8?B?L0c0UGZoRHlPV0tXTjlhc3Z0bExjWk1UZzdzZnBpbG0zcUx1SXhid3VHVm1X?=
 =?utf-8?B?ZWh5M0dTelZ6SC82bnBkK2ZhSnp3dDQvVlcxc05RdkFmc0dWRVBQWHFGOUh1?=
 =?utf-8?B?TnMvRVZiQWxTK256d2dDYUNMcU8xR0t5TEpmbUtySlg4Y2hsZWx1V21keGY2?=
 =?utf-8?B?RHpoUUVka0pNaFI2U1M1cktPWjkzN1FEU0hHdzZ6ellXT3EvRnhnTzBGSXpY?=
 =?utf-8?B?Uk1GZ0l5NlhhQzRqOGRReGdxd2dsUkpDVjVONWQ1MU5iaXVZbTZMSjZoRXZR?=
 =?utf-8?B?SnZ1eWg3ODZ5U0hSV2xSZ25FTDB1enVoRjVneU9XbTA1VmNVaFRqS3NydzlH?=
 =?utf-8?B?RktQUEx4bW82VmhqbnFMY0R4VERRemtFUkQ4SUxyNE1tL2lKQU04OGw1MjF3?=
 =?utf-8?B?NFNNNERIQVVnaGFjRERjZndpaThLbXFSVlBtMkc5OHJZNjRqRlMycUo4OGY5?=
 =?utf-8?B?LzNoRTBYRExrcmdHTHFIV1Z4RjdocFJUbjNUK05JYUR1MXFsdFgrY2RXSW4x?=
 =?utf-8?B?c2w2RkVyaEVzeXRtYmZUTEY3NDBPSk9UQWorTG1kRjMxdXdtdkoyY0k1NDhV?=
 =?utf-8?B?d250SlZZSnRyalJMSGlzNmFMd0xhUXprL1pTam9wZ1hyOEZ5ZlY0ZXI1TnNG?=
 =?utf-8?B?MnpUcEhlcWpiN0ZlN1lMbWdhWnNJUVNjUFRTQVB6M0EvWlJsT2Z3YWZiN01N?=
 =?utf-8?B?aHlGY3FrazRvc05iVWZvMEYzcDFtR2llWnFZWGdLbnA3NmxST3IxdHU3NE4r?=
 =?utf-8?B?Y3ljbUtocHBFRXY1dnIwbnRBMnBxdkYyVlFnM2NBdXFKQ0tIdncybzVKSGNO?=
 =?utf-8?B?WlRWM00wUGswdEpqYktnUFlvVTMxa2VGL1hQejdFMk1EQWF3NkJ0emFmT3VN?=
 =?utf-8?B?eFBnMytJOHR4cE9LUmgxS1ZhQ0hUNE1lb29Hdkk1QWdPTS9mdWhQM05mQ25w?=
 =?utf-8?B?bEtMRDlzN2l3Y3FzTnR4OUVkR1JZTjdseU9sME5aY0kwVjk5ZzNYZ0l2QUZq?=
 =?utf-8?B?cVE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fda062e2-ff99-4947-5b52-08da6324631a
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 10:01:56.0865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uRE6nA6Ipw5nDPr+RCs2FCFWBZn7nSc7i6jXNHj8yjoFLy34CA3rJo+RXumT2wze34CBwYSftP+gpSv6MrCCRv01+csd0ORksDxLzjwlAfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2368
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-11_15:2022-07-08,
 2022-07-11 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 mlxscore=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207110043
X-Proofpoint-GUID: 9U_Yi78ynk9zXTowDtemtaz5FrheESgS
X-Proofpoint-ORIG-GUID: 9U_Yi78ynk9zXTowDtemtaz5FrheESgS
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 7/9/22 21:51, B wrote:
> Am 1. Juli 2022 16:10:07 UTC schrieb Joao Martins <joao.m.martins@oracle.com>:
>> Use the pre-initialized pci-host qdev and fetch the
>> pci-hole64-size into pc_memory_init() newly added argument.
>> piix needs a bit of care given all the !pci_enabled()
>> and that the pci_hole64_size is private to i440fx.
> 
> It exposes this value as the property PCI_HOST_PROP_PCI_HOLE64_SIZE. 

Indeed.

> Reusing it allows for not touching i440fx in this patch at all.
> 
> For code symmetry reasons the analogue property could be used for Q35 as well.
> 
Presumably you want me to change into below while deleting i440fx_pci_hole64_size()
from this patch (see snip below). IMHO, gotta say that in q35 the code symmetry
doesn't buy much readability here, albeit it does remove any need for that other
helper in i440fx.

@Igor let me know if you agree with the change and whether I can keep the Reviewed-by.

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 504ddd0deece..cc0855066d06 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -167,7 +167,9 @@ static void pc_init1(MachineState *machine,
         memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
         rom_memory = pci_memory;
         i440fx_host = qdev_new(host_type);
-        hole64_size = i440fx_pci_hole64_size(i440fx_host);
+        hole64_size = object_property_get_uint(OBJECT(i440fx_host),
+                                               PCI_HOST_PROP_PCI_HOLE64_SIZE,
+                                               &error_abort);
     } else {
         pci_memory = NULL;
         rom_memory = system_memory;
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 4b747c59c19a..466f3ef3c918 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -208,7 +208,9 @@ static void pc_q35_init(MachineState *machine)
     q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));

     if (pcmc->pci_enabled) {
-        pci_hole64_size = q35_host->mch.pci_hole64_size;
+        pci_hole64_size = object_property_get_uint(OBJECT(q35_host),
+                                                   PCI_HOST_PROP_PCI_HOLE64_SIZE,
+                                                   &error_abort);
     }

     /* allocate ram and load rom/bios */
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index 15680da7d709..d5426ef4a53c 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -237,13 +237,6 @@ static void i440fx_realize(PCIDevice *dev, Error **errp)
     }
 }

-uint64_t i440fx_pci_hole64_size(DeviceState *i440fx_dev)
-{
-        I440FXState *i440fx = I440FX_PCI_HOST_BRIDGE(i440fx_dev);
-
-        return i440fx->pci_hole64_size;
-}
-
 PCIBus *i440fx_init(const char *pci_type,
                     DeviceState *dev,
                     MemoryRegion *address_space_mem,

