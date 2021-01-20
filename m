Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 435C42FD22D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:09:24 +0100 (CET)
Received: from localhost ([::1]:58602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2EAl-0000aM-2j
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:09:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l2E6y-0007Kk-GC
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:05:29 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:46504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1l2E6t-0007bU-Ik
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:05:27 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KDxnDO106842;
 Wed, 20 Jan 2021 14:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=lYHjsFS7qb7eQuLLonnzjhr6HukGpGhk29JDFa9hAjk=;
 b=itj85UcchkWE07lP2ZlUOaQ0n7ng7CcTWfxozV0MbhYeCzmVgphWHOe1L2EUY0grS6p2
 MkEW086mtMRrAOLUeVGXDaxxpKmoY/EUh70uGIqitU0xdOKjmE7rF5WpTH7mxPmCfshu
 H3tCZ6gx3CMzfMsmVKQOrwCk/QJCx9D5dkr8p4wXrRoj5+i+zYsnegpruM7upq1OKJuT
 pF+1tRhN5qHACMfJ0egAqyLYxHNQYf0hPputn+BcBLGzuka59dXoUlELTt37YZ0reH9Z
 +926XFcdI3UGYQbiat5p2TcfnLBFeRITnkhaUbjVGy1V9yJE9vNl7i6djrPo4d0COn2k Ww== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 3668qaaka6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 14:05:18 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KDseHG126625;
 Wed, 20 Jan 2021 14:05:17 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by aserp3030.oracle.com with ESMTP id 3668qv97j8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 14:05:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQgoS3UkmqJagX+U3rj31tAfkaIXBgLCeLEIj/IPsiVegv0836iZMcw3LY9LHBIhriK73/V8wt+eX1QbzWwVbxa41OBUUUVVtNpSXzxHRZrLoejvv1g2k+4s1UIOMOB/yRDnCZzicGBuykYcOjm7VvPDlsFO8Y8smZVgaYTDUQhQzaQmwpdN+9iUny6KxjbQA0LdUdlb056ywgIo51UFLPqEgPlzstImhJvPyotetifKcM1W0hddrfQ+f4ZXzo0+nXj6jYz6LkuuSgBiA/QCN3JXArOiLhdPd7fS8JZq89MEUZ3R+mNDrxdAYmc7CItGH+p4xEdGfl29h4mho83XfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYHjsFS7qb7eQuLLonnzjhr6HukGpGhk29JDFa9hAjk=;
 b=k42lAOoXr3HSQgBVDPnIaNHhjkB8fgZIPDs+nj0rGyoih4JQBPKqRUhJQePTZ+BOggb+2GoxWH7oQCrbUrpjuq7Y+BEcEtyFQuLYRADbait3q3O/uEg5kQ6kI7qzegX2zgxHNn95lLc9KPcpnfXBdjq9a76I/d00aVezfnk4UJpmUXOP7B7ZEv0h90zDLDxDJirPq/hnyS/HrrC7S/lj+wwkqPY4PhTVTrpXdAQm209K6lMdhzsQjGegsBbwczOwQ9APeoUENZwY0G0oCLz97+Ax5eVxY/tb9yf5AZDV6mzCLhgklvYrLdfH+mixD5DOiSDZA8EPGG7F+/WPKLfjkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYHjsFS7qb7eQuLLonnzjhr6HukGpGhk29JDFa9hAjk=;
 b=yELaI5IqU52T4Wd5SXCEwFzT8nI4SNNvfEJdOxvMuz7Y1d7BhX06XzFBhxW2t4LcM6Xv5PBpuyJFc7fSwOY9eQCaCiCufQfV7Q2PnnOU58dWeB86bdCOU/Zqfj4f969xuEfJ+mOB+55qYY5By+ddMh97Wk4HKiMaZZRL648E4Zo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32) by MWHPR10MB1967.namprd10.prod.outlook.com
 (2603:10b6:300:10b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.13; Wed, 20 Jan
 2021 14:05:15 +0000
Received: from MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba]) by MWHPR1001MB2285.namprd10.prod.outlook.com
 ([fe80::f48a:d4cb:d74c:48ba%6]) with mapi id 15.20.3742.014; Wed, 20 Jan 2021
 14:05:14 +0000
Subject: Re: [PATCH 2/4] hw/misc/pvpanic: add PCI interface support
To: Gerd Hoffmann <kraxel@redhat.com>, Yan Vugenfirer <yvugenfi@redhat.com>
References: <1610735646-13313-1-git-send-email-mihai.carabas@oracle.com>
 <1610735646-13313-3-git-send-email-mihai.carabas@oracle.com>
 <FC7156A5-361B-4009-983A-91118F29995A@redhat.com>
 <20210120134339.h42o3j7utjveeiey@sirius.home.kraxel.org>
From: Mihai Carabas <mihai.carabas@oracle.com>
Message-ID: <a2b5326d-1dd4-7799-bdfb-e62f9beab3b7@oracle.com>
Date: Wed, 20 Jan 2021 16:05:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210120134339.h42o3j7utjveeiey@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: ro
X-Originating-IP: [141.85.241.41]
X-ClientProxiedBy: LO4P123CA0445.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::18) To MWHPR1001MB2285.namprd10.prod.outlook.com
 (2603:10b6:301:2e::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.17.0.254] (141.85.241.41) by
 LO4P123CA0445.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a9::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.12 via Frontend Transport; Wed, 20 Jan 2021 14:05:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da277524-fa0a-43f0-305f-08d8bd4c6871
X-MS-TrafficTypeDiagnostic: MWHPR10MB1967:
X-Microsoft-Antispam-PRVS: <MWHPR10MB19671857B2CED5606A45A4C688A20@MWHPR10MB1967.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E2mMcc9L/qM3wLEVlQ5h6hk+xj7m/cGvgcv/vMqfO+dsT0Sa7iQhkz8jOe0hqSuuGrP2sDzoJdnaG6zXBnkcF20+zI5v9YyQBlqhFwn50oa8rRrqrWwsWJn0srrpYN0Xzzx/ygFnEworvEXLTFXnTQf9p7RnrdgepmOKF7+pgoe4WzonB+JRKd+Np8iZeQc4YCGId+vv2b0224LE4SrDhwBZDfUumrA4u1SsHZ7GZR/IP/KH/UFo1CJsxBpzb93socMoWC/AZfwM06zXMm8uIlWn7Hxq6pVBQWogfDfm7LX/2eLs2AUd6DUKhMWXedDP6mvyZmIzqHQBLyNJP2Hsc7gG7oA0Mn8Q/+YEA2zrQqQnr2wlM1cXfZCBIB/b1G7DGy1nch3Kh41VRWJ1Iw/aQF6+UWbK54J06dksJ15Rp4kf3S3EMT31tLYCPp9VP8oAJnPTAK1HZFfdiuHdPLOcEygi5fE//M7PPtIsQ24+Y6A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2285.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(346002)(136003)(366004)(39860400002)(2906002)(66556008)(5660300002)(508600001)(31686004)(6486002)(8676002)(66946007)(6666004)(2616005)(4326008)(86362001)(66476007)(26005)(8936002)(186003)(44832011)(4744005)(16526019)(36756003)(16576012)(956004)(316002)(31696002)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VGVXSk9nV0VuUnQ4UjJ3YlJ5VDc0ZU10Ukp4UjNqanNkMEM0V0N5anpxYkY1?=
 =?utf-8?B?eS8rZ0d2OUV2OTVBby9aaUs0ZTdqRU4yV0NobXdOVzFUeHE5QllTb0hQck5j?=
 =?utf-8?B?MkcwNXVaeFA5bXFNYzJHNTQ0c2RDbUI0azFXVU9QMnFTeVZPTmI2bXVBRk9Z?=
 =?utf-8?B?Y2ZGeXkxc3FLcXNIc0QvRDV4NHROZ0ZidjIyS28waitOL3ZvSWx3VjF6bHI3?=
 =?utf-8?B?T2JQMCtESVdrUmlFOEtzd3U3NmJKRU9ybk41b1pmWG94YlN4ampCRUd3UUlS?=
 =?utf-8?B?d2Y3OWZEZmhmM1RIVVh1YS9RaGJTd2g2em5McVc3N0M4ZWcvOVJwOWUwMjA0?=
 =?utf-8?B?dEZQUG9oSXU1M09TanRJVVF6NHJDMFNtYklFQjhCeDIrdldpRlptdEdrQ3Zx?=
 =?utf-8?B?cXVod1NNTHVWNktSVTdUWnhKa0w1OXlYZ1V0citVcC95SktSZzBzTDVBSndv?=
 =?utf-8?B?aWthOE5oeUl3aEFxRFh6NkxSUU5RYlpGRC9WSmxzSHZ0OWdENkdPS0RTZHVC?=
 =?utf-8?B?RzQzTUFNa2tpTjQyZmFPNlh6N1NpT2FUOG1oUmkzMUFrUHZuVHpoOTlhU0ds?=
 =?utf-8?B?SXd3ekNhWTVYaGJvbC9IaE9HSmNpU2FtWms3WmpneC9GMlA5UFE5WFlySzdE?=
 =?utf-8?B?QkRORUhkb3dOUTBEcHo4anlUZ3dsYlpaWkt1SXlyaUxsVzZzVXdHQjluaC8x?=
 =?utf-8?B?eVN0NDk1ZFlJcU5Cd2Mxb0x1QXZnV1U4emZtRjVhQzh1VGNhTG45aDdoUW9W?=
 =?utf-8?B?MURNeUdRODl0Ukd6ejJXNGxPbkxCZmp0UDVJTzJmZDdCSTRnV1JzVkwrNVR5?=
 =?utf-8?B?d1NHVllnQzBzb0Q2b0NVbWpXOU8yNXNMQnZpMmdxSlptUVBkRW14VGt0WWN1?=
 =?utf-8?B?VVlnQTEyL0hsbGtwRTQrNDE2N2lXVVNNbGowUlZ4cVZuUEZUR29KWjdhQ29Y?=
 =?utf-8?B?Q3R4OE4xbnV1ai8wN0U5eFplLy9MalQvWGN4c3hQZmVNaC9WQkpIRnRFeHBW?=
 =?utf-8?B?OWNBZC8rSzlxZVlOcTEwTlpEc0tXRE1iU0toc0R5Y2xJMWNHUHhKSjdqenN1?=
 =?utf-8?B?ZStJck9TY2ROVGZEbHJKNXpoSmJxUmlhNy84amZPRjdlMU1XYnlTZmQxMTNB?=
 =?utf-8?B?ZkcvNU96eXNsdW54RmpMSEh1WXdOZTVMdEs5NEpKQ1FDWnZhSGNaaW1aaHcr?=
 =?utf-8?B?d0RpYWQ2ZnhJeHdjQUZIekxyL0R6VUJ3b3hnQlRYdXlKWnl0ODZ3NlZOM2dF?=
 =?utf-8?B?Y0wvdUhTeFpIay9uM3FTK3N6UHpTRFNYN0lFSnFML0RKTURNeEhLbjlJUGd1?=
 =?utf-8?Q?xQTLWFgcgkGBpneawhLdpcP2YsoH4xEmoy?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da277524-fa0a-43f0-305f-08d8bd4c6871
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2285.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 14:05:14.1706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLN802fdR/xclvUrbtRf4rQrKiT086RwnTS02gYQwLd6V8nDIMHOoDMWTJZXx1MK1PdswnKdPcehg7C6D7bpq66CvtDqhkzaBh6O0irQc8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1967
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200082
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200082
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=mihai.carabas@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, QEMU Devel Mailing List <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

La 20.01.2021 15:43, Gerd Hoffmann a scris:
>    Hi,
>
>>> +    pc->realize = pvpanic_pci_realizefn;
>>> +    pc->vendor_id = PCI_VENDOR_ID_REDHAT;
>>> +    pc->device_id = PCI_DEVICE_ID_REDHAT_PVPANIC;
>> Please fill out subsystem and subsystem vendor IDs as well:
>> pc->subsystem_vendor_id
>> pc->subsystem_id
> Not needed, when left blank they are set to the default
> qemu subsystem id (1af4:1100) by the pci core.

Thank you!

@Peter: You can grab v4 if this is not needed.


