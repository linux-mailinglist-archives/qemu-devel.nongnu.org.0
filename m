Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE48B389454
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 19:02:52 +0200 (CEST)
Received: from localhost ([::1]:53196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljPar-0001UZ-TY
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 13:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1ljPIr-0000eU-N8
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:44:15 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:38690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1ljPIi-0001fX-EW
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:44:13 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14JGetua019403; Wed, 19 May 2021 16:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=oVn3UL/B6x755HwUhaqzZsbTyo2PzYpT0I2T2DMPjNc=;
 b=AtDel94a2qfmY6aWvCRd8q31JTC5L2qhVZDP88AboilHtI19Y3KbcWEjesT9q3ra+pV8
 CQ0B6cUTrEGMsIvGyhuOLiJX9OQRPK/nPFqCHmyNb2tYAaijkxmKBTn7stHEpvdNZrt5
 TyqKl++9hvApXHXwLsfQAx8xbW744BZlsjm1R2L5OLyEjtHLlzzjK88YyRuUH3xOZsgb
 Wt3bFg2qxc9cdwG1J5QnyUAPIpKWGt5YwpxNhgvhgXSC2UE9h3koOpwJ1sCqh2CsvtM0
 4haXVjYGrrgax99KgEk9WORUSfUigxbXPk/HTOW0PFBpBhlHAboHUO8e7fDNTVeJAWJb vg== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 38n4ukr1k6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 16:43:53 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14JGeajU128533;
 Wed, 19 May 2021 16:43:52 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
 by aserp3020.oracle.com with ESMTP id 38mecjrpst-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 16:43:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KkI4PeK2AKWSRefZntFJqP8xFilz9PC2/zGws6fxwGmuyDL34RFvxCYMZ1rFBwSCGQXjN9tA5aIVycWxSg40w+MNx+1HKPd8PjE+Fai7yCYkdIUVeRw7+igCrbsBuqxEJ0KN0GpiCiEno/ma0gVryyS2e4bsSb77YONRsaiFoKZAA5PUXWgiPaH1FmT+C6uLnTC1c8mIQoZUjA3njotLuPtVshuvNF0TGqtiaGE4bnNmW/NRrxmbcVDQKjYmBR3uCBvpcqrOQWDc5AoVfcyBVto8whPK3usV7+wSsFcv2WPYTfuUsWcMSKyGN3wXjzAP5GrOLz9PjqBWCYRqZTS4nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVn3UL/B6x755HwUhaqzZsbTyo2PzYpT0I2T2DMPjNc=;
 b=B9cuH62y8xIWp5Rpj19vZ0/Xng6mx+MJZ4ZTfKFKDA5VnGFjgk9ruft86h2+Zk4ZKSnk6qs5/cC2Ou0X7cUtuhum4G3faS/Fg8KqHNX/WpTQX4K+CMnQUH8wU1ta5t6TnHkynhUs/mfpFvjoPu1l2asKT7u0c6mRTSqimAyXHh5eR0tWBnC2StacATDVS4D3iwq3ut3rHs1JwW11/EknhsnBkiDHOf4gyau3ahAa3peAsjY4SA76A6SVXsC1/uDeXGjFyrt4iTk1RYxDxoFhjjCb1xb9xN1jfX5u11EwapkQ9DQk/CK7VDjJ983WdeBylEixAf3/tq5RkEC3zUOppA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVn3UL/B6x755HwUhaqzZsbTyo2PzYpT0I2T2DMPjNc=;
 b=J5CcYN+vkNB3uFMqmTc2qOlvlwrzvu201HV9akSTGBb9TtT1Y2+FUQlgxK/LqbjqIqHHvuOLO7mYPEE2FaKYPHLop7g0LCEaqHuC3fCnkwxxUq8P+QWAHfbFH+J7cPZEOSPlLb9LI6Oe8FBqXFA6OImrtGKf5Lc5dulYZXne/jA=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB3480.namprd10.prod.outlook.com (2603:10b6:a03:119::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 16:43:49 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 16:43:49 +0000
Subject: Re: [PATCH V3 00/22] Live Update
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <5bcabed6-82cd-3b84-9999-dd5ab2198a14@oracle.com>
Date: Wed, 19 May 2021 12:43:45 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: SN4PR0201CA0061.namprd02.prod.outlook.com
 (2603:10b6:803:20::23) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SN4PR0201CA0061.namprd02.prod.outlook.com (2603:10b6:803:20::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.33 via Frontend
 Transport; Wed, 19 May 2021 16:43:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a54eee3-4c25-4a54-c7d1-08d91ae546ef
X-MS-TrafficTypeDiagnostic: BYAPR10MB3480:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB34806A96196E8885983B9BBAF92B9@BYAPR10MB3480.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PMjMFo6/ZsODOGYu/uFjxdpyPDHa3w6hthTSQzLMIf1JP+7qgiCds+N199Kk285vgPnxIiNUAn8iJ6/9Zf8Pi8EjwJ/tn0t0SJiTx5jUu8J2y+y1rwRIuiwYHQ0kvF1mVv4qsdNkGGDDNzt23xHoZC+XizprXg+Cc+u2j2ZP/S6hsECln8fQSd/tQk79krHOj8ESuAWqiyzA4oVtO6L9ZPM0GoCosXLWsRcdyF3vwU0v93k0B2enGPY9xvBTx/OZHamYrbaKvBICHLUaDpUvmxDcIqFpk8g4sHkyKOLhtHGus0DZKlUtTqvfAeUJQNlehgDtvQJ37zqIKyAkrBG+LDQIkJjpWO6mi6veeKtS1pPteb4CigVgtvRCJJbZAQQgH1BDrisRzAutPJZ+2UvRq3d1aJBA5EwTq4mnBjITnXUYf/k1asX4PJU1k9oH4OtGomcrjwt2gKopBk9TNmyjiyVq4xrxqsogRNb8pzFV+2Z2CcSSD9kH+41dGbtHZefOKehGgL81F+1PnhjC7cnRZi6le1AQKKAK8U9RbbYHtmat2ILw5+wqkyojtNcQ5/rgt2BckPHQme66sEe+q97//FpKi/6r2tJo5VdWPc6u1NmuviQzT65vv52xGwXLuKp+D9SJ2853vEnbil9vfMIqvj1tAE+sHouR/bdWyFy8pwplg0Gfrjmt5TSywKPm8lCh49F3cMEXmw4CuIp/3hguiaSh9FHpeeTO7+eEx8DG9QuYw9GCH3zbYSOWoy9cBhxjUMkBdxHrme3gY6taoQFQVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(956004)(31696002)(83380400001)(86362001)(16526019)(2616005)(2906002)(53546011)(186003)(15650500001)(54906003)(66476007)(31686004)(66946007)(66556008)(44832011)(110136005)(498600001)(26005)(36916002)(966005)(5660300002)(7416002)(8936002)(8676002)(6486002)(107886003)(38100700002)(4326008)(36756003)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cWFPVFh1K05UNmhrM0RPZWZjeGpBMmFDUUtrV2hzcDZ5UTRYTVd1cTcrVkZL?=
 =?utf-8?B?L3pqRzNxMU4rV21ZYm9HMDJZK0twUExXZmd5YWxwY3Z0eFBvMWI5MHBIRFlO?=
 =?utf-8?B?cTE4K1luazZibU9HaDd4aHk4L3JWVTV5N281Vmh2MzBVVkhtbklSbmY2eG11?=
 =?utf-8?B?RE41aXFJRTRmQW1TTVoyQ1h4bDd2a3pGbFdnVk5NQUJjVHV3RVJzQkJCNmRW?=
 =?utf-8?B?Yms3cVBNWXY2aFBsTEV3bDllV1k2ekxybGs1NFA5UHMrYWhWdEpoQ0VvcDNP?=
 =?utf-8?B?OUNhZytPS1BtdHFURlpqUGxrUUNYZnUzODFNdC9ZV1M0WEdZcnROLzNZY0VC?=
 =?utf-8?B?ZWdyVXVwenFMaXd5WFZGY2hjcmQ1b2R4ZVVvSGxERGQzdCtDbjZNWTZ5Yngy?=
 =?utf-8?B?R0lwVm41SGVidHkxU09STGE1MmUrV09oZW55a3kwcm5Ia1RMY0R6Y0ZyQjFT?=
 =?utf-8?B?Y09XV2VQaUdrdW5DM3pHVHdZZGFsMDg5a05EVWU2MHNIazVUbEpoZnlZdUVM?=
 =?utf-8?B?QU1UV3hBUmpTK0FsNE95bnhvdGlrdTJuRGpHWnMwWjJIWVZzRjV5dW9sZTIz?=
 =?utf-8?B?UEFHYS94WFRSOFVIQTVzWTFXdDBEZTlZTURmdyt3ZVFMY0hvaWM2b29XKzVp?=
 =?utf-8?B?TDBmc2ZBaDlWZEMrWkloQkxsR2JOeXNjbHhBcUpPYVpJT0NZV1BTWEphNnZl?=
 =?utf-8?B?RWF0VTNSZVRLVkFxK2kvcmlQNnBkNWwrUmxBM1puOHVvcm05cmpnRjdLbWh2?=
 =?utf-8?B?VE9qYzAvZkZLT1RMeDlpUmphT3pVcHV5UmplemRUT0NDaU1lWmI5WFYyS1RP?=
 =?utf-8?B?UUZ0OUtEZjc4L1o3Q09mYjkwaktPcngvdXp6RG9OL3l1UUJoMStsMkNtRkp5?=
 =?utf-8?B?TUg4UEswTFlLZU4zbjVYMWc3MDVsNHkxRE9GVjcrOXFleFo0RlJ3SlExK3F3?=
 =?utf-8?B?Y2pGZStSQ3M3SDJ3Y0ltV0pvVHlGM0hSOUdqNUFtb0dSd2VHZ3BqWlJTNGU3?=
 =?utf-8?B?WHp0Ri9mMFBUU3FqMmx5V0lOUm15bGZ1NUQvZjRxVE5WL2RlQjR6YzhzQWF2?=
 =?utf-8?B?ZXNOdW1mVExlbGYyekNER1g1V0tRYnlaWmoxcnpLZjJYYjZwaUNTckZSVTRO?=
 =?utf-8?B?QVpQZjYwREFpcWJUL0JUUUsvMkM1VFhWUHA2VXVFTE5XVE0xUEJndXlNRmZv?=
 =?utf-8?B?VmJmMDBwajBQbEo5cmNtaWtJbTgyd1lWOFBJOU5OSEttbjR2Ri9XUVN4MVk4?=
 =?utf-8?B?OHBQa2ZrUGxhbGdTajBpSW9BQmNkRzRLWmg2MG1yUDdRWTJGUk9NYU1MTzlH?=
 =?utf-8?B?SGZDRHhJRjBtS2RyeGJRaWMraXQ4T3dtdVF4bk81c294akhRSzRqTG5NREY0?=
 =?utf-8?B?bXYrWDFaZlI4Q3ZxWGdqQ1R1alRBdXRmcDNLMm42Rm1nSG1ZcUdiOWZQTk5U?=
 =?utf-8?B?ZFRzb3F4M1RnMGtDOThpZjVldk9pV2xPOVNFNU9lcDVuYlZLeFJkTmdtNENB?=
 =?utf-8?B?T2VyZmtRSzgrNVlSVU5lVGRwTWxuRGxBUlI5clJHdmZzd3VtOXNCZDc3QzU2?=
 =?utf-8?B?d1RhTVREWU42alhzUENLbnljQ3k3N1Zxa1oxc0N3SjBNdDh4Zk1vRVdRTlF5?=
 =?utf-8?B?bXNEY1VPUE0vYlZRUVRvU3FrTndoL1NpdUlxQU14K1pqSG8vYis4ZHluVlVm?=
 =?utf-8?B?TTU4cTh3SUZ5bXNFTDhNTExRaWRReWhDSnhlemhKZ1I4bzVDNjNZc0xDWmZz?=
 =?utf-8?Q?R9q+7McR6AprGkfu9Sj7zXy+R70ENlEEOzLpM+9?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a54eee3-4c25-4a54-c7d1-08d91ae546ef
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 16:43:49.1277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mETDI6UCuyGLD7k3sB+lg1Cldd6OQPRgh3FiXwCGgAjeOzCP0FcPHGT3midVDALFRK24H1MWOnBYrXW6fbZ2uRJSXpPj/7hDd4/mnppusXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3480
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9989
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105190101
X-Proofpoint-GUID: a6H_imB9JU9EBC5nr8ofxSxxLPrbPeTB
X-Proofpoint-ORIG-GUID: a6H_imB9JU9EBC5nr8ofxSxxLPrbPeTB
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael, Marcel,
  I hope you have time to review the pci and vfio-pci related patches in this
series.  They are an essential part of the live update functionality.  The
first 2 patches are straightforward, just exposing functions for use in vfio.
The last 2 patches are more substantial.

  - pci: export functions for cpr
  - vfio-pci: refactor for cpr
  - vfio-pci: cpr part 1
  - vfio-pci: cpr part 2

- Steve

On 5/7/2021 8:24 AM, Steve Sistare wrote:
> Provide the cprsave and cprload commands for live update.  These save and
> restore VM state, with minimal guest pause time, so that qemu may be updated
> to a new version in between.
> 
> cprsave stops the VM and saves vmstate to an ordinary file.  It supports two
> modes: restart and reboot.  For restart, cprsave exec's the qemu binary (or
> /usr/bin/qemu-exec if it exists) with the same argv.  qemu restarts in a
> paused state and waits for the cprload command.
> 
> To use the restart mode, qemu must be started with the memfd-alloc option,
> which allocates guest ram using memfd_create.  The memfd's are saved to
> the environment and kept open across exec, after which they are found from
> the environment and re-mmap'd.  Hence guest ram is preserved in place,
> albeit with new virtual addresses in the qemu process.  The caller resumes
> the guest by calling cprload, which loads state from the file.  If the VM
> was running at cprsave time, then VM execution resumes.  cprsave supports
> any type of guest image and block device, but the caller must not modify
> guest block devices between cprsave and cprload.
> 
> The restart mode supports vfio devices by preserving the vfio container,
> group, device, and event descriptors across the qemu re-exec, and by
> updating DMA mapping virtual addresses using VFIO_DMA_UNMAP_FLAG_VADDR and
> VFIO_DMA_MAP_FLAG_VADDR as defined in https://lore.kernel.org/kvm/1611939252-7240-1-git-send-email-steven.sistare@oracle.com/
> and integrated in Linux kernel 5.12.
> 
> For the reboot mode, cprsave saves state and exits qemu, and the caller is
> allowed to update the host kernel and system software and reboot.  The
> caller resumes the guest by running qemu with the same arguments as the
> original process and calling cprload.  To use this mode, guest ram must be
> mapped to a persistent shared memory file such as /dev/dax0.0, or /dev/shm
> PKRAM as proposed in https://lore.kernel.org/lkml/1617140178-8773-1-git-send-email-anthony.yznaga@oracle.com.
> 
> The reboot mode supports vfio devices if the caller suspends the guest
> instead of stopping the VM, such as by issuing guest-suspend-ram to the
> qemu guest agent.  The guest drivers' suspend methods flush outstanding
> requests and re-initialize the devices, and thus there is no device state
> to save and restore.
> 
> The first patches add helper functions:
> 
>   - as_flat_walk
>   - qemu_ram_volatile
>   - oslib: qemu_clr_cloexec
>   - util: env var helpers
>   - machine: memfd-alloc option
>   - vl: add helper to request re-exec
> 
> The next patches implement cprsave and cprload:
> 
>   - cpr
>   - cpr: QMP interfaces
>   - cpr: HMP interfaces
> 
> The next patches add vfio support for the restart mode:
> 
>   - pci: export functions for cpr
>   - vfio-pci: refactor for cpr
>   - vfio-pci: cpr part 1
>   - vfio-pci: cpr part 2
> 
> The next patches preserve various descriptor-based backend devices across
> a cprsave restart:
> 
>   - vhost: reset vhost devices upon cprsave
>   - hostmem-memfd: cpr support
>   - chardev: cpr framework
>   - chardev: cpr for simple devices
>   - chardev: cpr for pty
>   - chardev: cpr for sockets
>   - cpr: only-cpr-capable option
>   - cpr: maintainers
>   - simplify savevm
> 
> Here is an example of updating qemu from v4.2.0 to v4.2.1 using 
> "cprload restart".  The software update is performed while the guest is
> running to minimize downtime.
> 
> window 1				| window 2
> 					|
> # qemu-system-x86_64 ... 		|
> QEMU 4.2.0 monitor - type 'help' ...	|
> (qemu) info status			|
> VM status: running			|
> 					| # yum update qemu
> (qemu) cprsave /tmp/qemu.sav restart	|
> QEMU 4.2.1 monitor - type 'help' ...	|
> (qemu) info status			|
> VM status: paused (prelaunch)		|
> (qemu) cprload /tmp/qemu.sav		|
> (qemu) info status			|
> VM status: running			|
> 
> 
> Here is an example of updating the host kernel using "cprload reboot"
> 
> window 1					| window 2
> 						|
> # qemu-system-x86_64 ...mem-path=/dev/dax0.0 ...|
> QEMU 4.2.1 monitor - type 'help' ...		|
> (qemu) info status				|
> VM status: running				|
> 						| # yum update kernel-uek
> (qemu) cprsave /tmp/qemu.sav restart		|
> 						|
> # systemctl kexec				|
> kexec_core: Starting new kernel			|
> ...						|
> 						|
> # qemu-system-x86_64 ...mem-path=/dev/dax0.0 ...|
> QEMU 4.2.1 monitor - type 'help' ...		|
> (qemu) info status				|
> VM status: paused (prelaunch)			|
> (qemu) cprload /tmp/qemu.sav			|
> (qemu) info status				|
> VM status: running				|
> 
> Changes from V1 to V2:
>   - revert vmstate infrastructure changes
>   - refactor cpr functions into new files
>   - delete MADV_DOEXEC and use memfd + VFIO_DMA_UNMAP_FLAG_SUSPEND to 
>     preserve memory.
>   - add framework to filter chardev's that support cpr
>   - save and restore vfio eventfd's
>   - modify cprinfo QMP interface
>   - incorporate misc review feedback
>   - remove unrelated and unneeded patches
>   - refactor all patches into a shorter and easier to review series
> 
> Changes from V2 to V3:
>   - rebase to qemu 6.0.0
>   - use final definition of vfio ioctls (VFIO_DMA_UNMAP_FLAG_VADDR etc)
>   - change memfd-alloc to a machine option
>   - use existing channel socket function instead of defining new ones
>   - close monitor socket during cpr
>   - support memory-backend-memfd
>   - fix a few unreported bugs
> 
> Steve Sistare (18):
>   as_flat_walk
>   qemu_ram_volatile
>   oslib: qemu_clr_cloexec
>   util: env var helpers
>   machine: memfd-alloc option
>   vl: add helper to request re-exec
>   cpr
>   pci: export functions for cpr
>   vfio-pci: refactor for cpr
>   vfio-pci: cpr part 1
>   vfio-pci: cpr part 2
>   hostmem-memfd: cpr support
>   chardev: cpr framework
>   chardev: cpr for simple devices
>   chardev: cpr for pty
>   cpr: only-cpr-capable option
>   cpr: maintainers
>   simplify savevm
> 
> Mark Kanda, Steve Sistare (4):
>   cpr: QMP interfaces
>   cpr: HMP interfaces
>   vhost: reset vhost devices upon cprsave
>   chardev: cpr for sockets
> 
>  MAINTAINERS                   |  11 +++
>  backends/hostmem-memfd.c      |  21 +++--
>  chardev/char-mux.c            |   1 +
>  chardev/char-null.c           |   1 +
>  chardev/char-pty.c            |  15 ++-
>  chardev/char-serial.c         |   1 +
>  chardev/char-socket.c         |  35 +++++++
>  chardev/char-stdio.c          |   8 ++
>  chardev/char.c                |  41 +++++++-
>  gdbstub.c                     |   1 +
>  hmp-commands.hx               |  44 +++++++++
>  hw/core/machine.c             |  19 ++++
>  hw/pci/msi.c                  |   4 +
>  hw/pci/msix.c                 |  20 ++--
>  hw/pci/pci.c                  |   7 +-
>  hw/vfio/common.c              |  68 +++++++++++++-
>  hw/vfio/cpr.c                 | 131 ++++++++++++++++++++++++++
>  hw/vfio/meson.build           |   1 +
>  hw/vfio/pci.c                 | 214 ++++++++++++++++++++++++++++++++++++++----
>  hw/vfio/trace-events          |   1 +
>  hw/virtio/vhost.c             |  11 +++
>  include/chardev/char.h        |   6 ++
>  include/exec/memory.h         |  25 +++++
>  include/hw/boards.h           |   1 +
>  include/hw/pci/msix.h         |   5 +
>  include/hw/pci/pci.h          |   2 +
>  include/hw/vfio/vfio-common.h |   8 ++
>  include/hw/virtio/vhost.h     |   1 +
>  include/migration/cpr.h       |  17 ++++
>  include/monitor/hmp.h         |   3 +
>  include/qemu/env.h            |  23 +++++
>  include/qemu/osdep.h          |   1 +
>  include/sysemu/runstate.h     |   2 +
>  include/sysemu/sysemu.h       |   2 +
>  linux-headers/linux/vfio.h    |  27 ++++++
>  migration/cpr.c               | 200 +++++++++++++++++++++++++++++++++++++++
>  migration/meson.build         |   1 +
>  migration/migration.c         |   5 +
>  migration/savevm.c            |  21 ++---
>  migration/savevm.h            |   2 +
>  monitor/hmp-cmds.c            |  48 ++++++++++
>  monitor/hmp.c                 |   3 +
>  monitor/qmp-cmds.c            |  31 ++++++
>  monitor/qmp.c                 |   3 +
>  qapi/char.json                |   5 +-
>  qapi/cpr.json                 |  76 +++++++++++++++
>  qapi/meson.build              |   1 +
>  qapi/qapi-schema.json         |   1 +
>  qemu-options.hx               |  39 +++++++-
>  softmmu/globals.c             |   2 +
>  softmmu/memory.c              |  48 ++++++++++
>  softmmu/physmem.c             |  49 ++++++++--
>  softmmu/runstate.c            |  49 +++++++++-
>  softmmu/vl.c                  |  21 ++++-
>  stubs/cpr.c                   |   3 +
>  stubs/meson.build             |   1 +
>  trace-events                  |   1 +
>  util/env.c                    |  99 +++++++++++++++++++
>  util/meson.build              |   1 +
>  util/oslib-posix.c            |   9 ++
>  util/oslib-win32.c            |   4 +
>  util/qemu-config.c            |   4 +
>  62 files changed, 1431 insertions(+), 74 deletions(-)
>  create mode 100644 hw/vfio/cpr.c
>  create mode 100644 include/migration/cpr.h
>  create mode 100644 include/qemu/env.h
>  create mode 100644 migration/cpr.c
>  create mode 100644 qapi/cpr.json
>  create mode 100644 stubs/cpr.c
>  create mode 100644 util/env.c
> 

