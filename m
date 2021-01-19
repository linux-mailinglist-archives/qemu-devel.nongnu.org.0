Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 803992FC209
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 22:17:08 +0100 (CET)
Received: from localhost ([::1]:33372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1yN9-0006LO-It
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 16:17:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xeU-0002to-3c
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:30:58 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:59766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l1xeQ-0000bR-Fp
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 15:30:57 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKNUEx002798;
 Tue, 19 Jan 2021 20:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2020-01-29;
 bh=3sGAVL8m/hAh20lK0YKGfuSl0TEqHloVDaB+a7vZvTY=;
 b=Ex/gc8/qo7qjk8CGUxEv399QUkfmpcaDxzW+f50EG4yC10pekl+sddgT8xnf6g6eYBkD
 42WkPL3AR7WNO/7N+GAKPDkyw465tCZPd5CQTAvfwoqHqxexusMV3wgNGiZw+8iMrhkT
 sy6u+ijkuLysOkCceoiOOnU4A45gxD5kTaqTnR5XQPLJiFIFmXs3bDgWiAKCbs4Boppi
 OxRUiqDdKFM1Mcj5kfeqp4sVM1yLh34nXptIycOB2e7FPFmMGaqCT9QG75YCf4BG53uY
 14MQDNgByhneRGoznezqVLIytttxznnfW3KVYCmrrlg2OzdwRdxLJe/T02XucfwLpZjG yw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 363xyhtb18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:30:47 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JKPjdt175920;
 Tue, 19 Jan 2021 20:28:46 GMT
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2059.outbound.protection.outlook.com [104.47.37.59])
 by aserp3020.oracle.com with ESMTP id 3661er93u7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 20:28:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fem90WBB135fymHFpIx8GIZ/ME0AmrxyrFWUNr/VjPs/+CfCbDPbYHdkYlEGMY3KHa9xU8ayqvcCVCrEA/tx+fRAcH7DVDOB5a15Df6g3WTVZpKe95oZZxU/NgkzfNkz2bNhe6Rptn8OO3CSWHVqRyW7TTESEbnvofU+YEIrteYCN512V4u27cxq0OL+Ft9ipRUYm306jfHlaI4VfJ/pne+/6jriXailbvJQJsuFfrIXD4A84x1uLKNqWSlx3VHmPtcV5qrZ//lzKGpaob70Hv+3GJ+6UMZlBWC11sW0o+jyZqt3Cok6vveQeY+xhEoknW4jIPsnELivUwcnQS0SWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3sGAVL8m/hAh20lK0YKGfuSl0TEqHloVDaB+a7vZvTY=;
 b=IT0Xw3OEw1NFeEUGumsfkU10JJve2rVOAcpK5nmi+Js2J4H2GCF6Gd+W8UNbi1SV5gneeyMh7gCeeGI6S1rO1KVLbc8pmL+OTYa9MDhzDez4hPhVjQ+keTTPk88EwwLJkqIp1FhYhiJLZTeoKufqworPVsaSe71oeL83hE9h7bpW2GbBZyYxQ3mlwtJbDQSdWaiLd+H9yvzbTWeQYvdXgQFg76kA127RcSbqa0iuDN+UtDBq4SWQfem6/a4MyP80NlfJdXOg6WOUTwTLmpaqcCf1mXuvU1MdtmCtxzQtr/E1nPzB6RzN7O83EKzKlUEBUTAZOfmGu22re3hvecSyrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3sGAVL8m/hAh20lK0YKGfuSl0TEqHloVDaB+a7vZvTY=;
 b=zBeFyLmnNNtJntiq/O84BiQlzY/2d/9/QZ0dLCnBfp5CW3A2zCORckbXWESeMQ/2YotG7ARvFVKfKwkvz7PMQZTPtLz2wn86yOSwIiGU9AWJUcc40B92PwqE62qE9aHDjid14ET9HGsdIeawmpb0H9XoWPfRjD/DspDYhcdplMA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by BYAPR10MB3349.namprd10.prod.outlook.com (2603:10b6:a03:155::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 20:28:43 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::5cf0:3e26:c005:341b%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 20:28:43 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v20 00/20] Initial support for multi-process Qemu
Date: Tue, 19 Jan 2021 15:28:17 -0500
Message-Id: <cover.1611081587.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [209.17.40.38]
X-ClientProxiedBy: DM6PR01CA0007.prod.exchangelabs.com (2603:10b6:5:296::12)
 To BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.38) by
 DM6PR01CA0007.prod.exchangelabs.com (2603:10b6:5:296::12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 19 Jan 2021 20:28:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2817b49e-ff50-4ea2-8632-08d8bcb8d087
X-MS-TrafficTypeDiagnostic: BYAPR10MB3349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB334996719F6D5B0F912A3AF190A30@BYAPR10MB3349.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1a0aW0jAEApZUFrUfj0WNT4lXgvXSpqotgaOjoE3vpxEBfv11EdBESdMSB3YfyUrgHkh6GHXhDcnwTxtQQJHUR1AFbu9bQSh+oH2x0YP5XoeUEg6JUrQTj4t3VKpbXn/Wj7HqS6DlB/JFHvIMnK7g1iC/NICGHLKMToT0XikX90fXAAAlUiaVoHlZQ6LYioZpQ3Y0Rw9pNXW5788qt4RV9FLDqTKLR4Ld0wXmPxw2DK3iW9xNtzLxjTy6pIDmH18hpex7D+KRANbBT+oyznw3s2c5rBBO9/YOqqRCrjWJDkOUSvyP5cLbA7EE5050saU3PkS+XMkhnpbXYajP7+ad0rPQ0K9XGQGrqizCzSIb6uo0EIA5b8c5gCynGpT++I8pRrHu6mlKm1APbx5V4Kkg9zdxct2Xh0CXYFqPtVUDSHjovXq3bucSYLM09y/oKxuF14c8AHnD9OG7eMcSHTZyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(366004)(136003)(346002)(376002)(7696005)(52116002)(2906002)(6486002)(5660300002)(7416002)(36756003)(66476007)(66556008)(478600001)(6916009)(966005)(956004)(2616005)(4326008)(66946007)(26005)(186003)(16526019)(8676002)(86362001)(8936002)(107886003)(316002)(6666004)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ejR5SlA0SU5lbU5RTm5XOEdqcmRBZTlTbGxaQ2tLMWZ1TWRYdXY2cGl6V2tG?=
 =?utf-8?B?VmJMNzJESEJiNW1ocDRMNnpKZFBkK1JEeUZJS3hUTmZhaTNtVmcvVEp5VEU0?=
 =?utf-8?B?MnRPb0p3Y21vamtvVGo3NnFvS3hwaSt0bzNYUUJHckZVWE8wVzBuSmc4NzM0?=
 =?utf-8?B?SjdxWWZuVE9aT0FGYmlaYlNGS2VkbitCL0dQWFA3cW9ZQThaOTg2dDBERWxo?=
 =?utf-8?B?MGxZdzRnZVdzcTlmcjJBaVl3TkcrdUZESnFaT2lvR09RcVQ5cktrSTdLazFt?=
 =?utf-8?B?UHI4T3JwSFN3SFVCNnF2Y0NzM0tkYjlqQU4xVjFGUjVIUE5jeUMrUWs1MVNI?=
 =?utf-8?B?dEthZCtpaGVuQXZBeFdoRzc4a3M3UW5ya0U4MmNvbXN3b0VUYjJFSk5EeitL?=
 =?utf-8?B?YS9OOElTbWZ0bkxmbmhHZmxvckUvYjg2QnozTU1CQjAzaWk3MGZlWUVQanB2?=
 =?utf-8?B?MG1NRWJHdEdSTnlwZTQ4cDR4SDYzRHgrUUxrc0pLUGIwQ2E0czZ4VTA3ajg2?=
 =?utf-8?B?ZDdIYW1zN3paK0dYUWFpdmhkUzcrUmVPTTZUa1I1dFJUNVVCL2Z3azRNQ3Jz?=
 =?utf-8?B?ODFPSHFQeWhvZURXOFd1SVppSHhiV0I4SFBJQzBUSTAxT20zMVVIQVJib1Zv?=
 =?utf-8?B?dDhicTVuMHU2ek1aMDBkMEZXRmNKaFBwMktWZTFGNCtIRUY0NVl0c05oV3lz?=
 =?utf-8?B?NnppL3lQaE52eitpZHNnSmErYU5HelVFd3pNckx3QzE2VzZhY0NBME9pK0d5?=
 =?utf-8?B?M2ZSMkJzdFVZbDJNOXEvNmU2UEY4VUl2REpkbmZNRVpiOGd2eGNaSGp4NFBr?=
 =?utf-8?B?UG1jbWVZRmdpVDZycEx6bjJhamorQkRaNmtYQlo3TjcvOGJFN0E2S2FWeDQx?=
 =?utf-8?B?Ykw3RE9tSWVpQy9Gdi9SWmJ0QlZvaytVVEZ3eDVXcll1YzlkbWs5bUJzbHkr?=
 =?utf-8?B?OFRydXhLSnhEaDY4RnhUNDBHRjZDNW1Ja3M5Tk1IeHZDZldQVzk0QVByVWRj?=
 =?utf-8?B?UjFPeW1xQlVGcXhHRzBBL1IzOWxpZnpXR1M0Rk9ISXJwMVZDTFVpSmJEU3RH?=
 =?utf-8?B?M2pKV0IvQmg0MjBDOEpMcDV1UHNReWZSaUdiM1hFcndvdkdhZjRybmIyOEpH?=
 =?utf-8?B?cVg1S1dlTnFmMVdZZ0NMNXZVbXpXS1VYWEs3Y0tqRHQ0RWdNR1hkVVd0NlpK?=
 =?utf-8?B?ajREWmJhN3BDM1lzREUzZ0o2TzRCWFU1SFVrWXJaTlFOWE5rVVFNNVZONCtK?=
 =?utf-8?B?ZFB6dTgrdEJHcmVuSHVBMU9Hb0xINGJLLzlYYlhFd1pwclZvci84TjczaFpk?=
 =?utf-8?Q?zkijoVCckAj7uvFdnaXBrv9HaI37bmohm5?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2817b49e-ff50-4ea2-8632-08d8bcb8d087
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 20:28:43.3301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qy9ysk8EKsoTNuZQzr6ojiKolpDsjOs4LDuMxRQA+E2vbqk9WM1z4q/fwPLOZcGUggUrvptSwp3u5OG4c0BNNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3349
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9869
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501 spamscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190113
Received-SPF: pass client-ip=156.151.31.86; envelope-from=jag.raman@oracle.com;
 helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is the v20 of the patchset. This version has the following changes:

[PATCH v18 08/20] io: add qio_channel_readv_full_all_eof &
                qio_channel_readv_full_all helpers
  - Considers fds as part of the "data" for both
    qio_channel_readv_full_all_eof() &
    qio_channel_readv_full_all().
  - Addresses some of the error scenarios
    which were not addressed in the previous revisions

To touch upon the history of this project, we posted the Proof Of Concept
patches before the BoF session in 2018. Subsequently, we have posted 19
versions on the qemu-devel mailing list. You can find them by following
the links below ([1] - [19]). Following people contributed to the design and
implementation of this project:
Jagannathan Raman <jag.raman@oracle.com>
Elena Ufimtseva <elena.ufimtseva@oracle.com>
John G Johnson <john.g.johnson@oracle.com>
Stefan Hajnoczi <stefanha@redhat.com>
Konrad Wilk <konrad.wilk@oracle.com>
Kanth Ghatraju <kanth.ghatraju@oracle.com>

We would like to thank you for your feedback in the
design and implementation of this project. Qemu wiki page:
https://wiki.qemu.org/Features/MultiProcessQEMU

For the full concept writeup about QEMU multi-process, please
refer to docs/devel/qemu-multiprocess.rst. Also, see
docs/qemu-multiprocess.txt for usage information.

Thank you for reviewing this series!

[POC]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg566538.html
[1]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg602285.html
[2]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg624877.html
[3]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg642000.html
[4]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg655118.html
[5]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg682429.html
[6]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg697484.html
[7]: https://patchew.org/QEMU/cover.1593273671.git.elena.ufimtseva@oracle.com/
[8]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg727007.html
[9]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg734275.html
[10]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg747638.html
[11]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg750972.html
[12]: https://patchew.org/QEMU/cover.1606853298.git.jag.raman@oracle.com/
[13]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg766825.html
[14]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg768376.html
[15]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg769178.html
[16]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg771455.html
[17]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg772512.html
[18]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg772602.html
[19]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg772980.html

Elena Ufimtseva (8):
  multi-process: add configure and usage information
  io: add qio_channel_writev_full_all helper
  io: add qio_channel_readv_full_all_eof & qio_channel_readv_full_all
    helpers
  multi-process: define MPQemuMsg format and transmission functions
  multi-process: introduce proxy object
  multi-process: add proxy communication functions
  multi-process: Forward PCI config space acceses to the remote process
  multi-process: perform device reset in the remote process

Jagannathan Raman (11):
  memory: alloc RAM from file at offset
  multi-process: Add config option for multi-process QEMU
  multi-process: setup PCI host bridge for remote device
  multi-process: setup a machine object for remote device process
  multi-process: Initialize message handler in remote device
  multi-process: Associate fd of a PCIDevice with its object
  multi-process: setup memory manager for remote device
  multi-process: PCI BAR read/write handling for proxy & remote
    endpoints
  multi-process: Synchronize remote memory
  multi-process: create IOHUB object to handle irq
  multi-process: Retrieve PCI info from remote process

John G Johnson (1):
  multi-process: add the concept description to
    docs/devel/qemu-multiprocess

 docs/devel/index.rst                      |   1 +
 docs/devel/multi-process.rst              | 966 ++++++++++++++++++++++++++++++
 docs/multi-process.rst                    |  64 ++
 configure                                 |  10 +
 meson.build                               |   5 +-
 hw/remote/trace.h                         |   1 +
 include/exec/memory.h                     |   2 +
 include/exec/ram_addr.h                   |   2 +-
 include/hw/pci-host/remote.h              |  30 +
 include/hw/pci/pci_ids.h                  |   3 +
 include/hw/remote/iohub.h                 |  42 ++
 include/hw/remote/machine.h               |  38 ++
 include/hw/remote/memory.h                |  19 +
 include/hw/remote/mpqemu-link.h           |  99 +++
 include/hw/remote/proxy-memory-listener.h |  28 +
 include/hw/remote/proxy.h                 |  48 ++
 include/io/channel.h                      |  78 +++
 include/qemu/mmap-alloc.h                 |   4 +-
 include/sysemu/iothread.h                 |   6 +
 backends/hostmem-memfd.c                  |   2 +-
 hw/misc/ivshmem.c                         |   3 +-
 hw/pci-host/remote.c                      |  75 +++
 hw/remote/iohub.c                         | 119 ++++
 hw/remote/machine.c                       |  80 +++
 hw/remote/memory.c                        |  65 ++
 hw/remote/message.c                       | 230 +++++++
 hw/remote/mpqemu-link.c                   | 267 +++++++++
 hw/remote/proxy-memory-listener.c         | 227 +++++++
 hw/remote/proxy.c                         | 379 ++++++++++++
 hw/remote/remote-obj.c                    | 203 +++++++
 io/channel.c                              | 121 +++-
 iothread.c                                |   6 +
 softmmu/memory.c                          |   3 +-
 softmmu/physmem.c                         |  11 +-
 util/mmap-alloc.c                         |   7 +-
 util/oslib-posix.c                        |   2 +-
 Kconfig.host                              |   4 +
 MAINTAINERS                               |  24 +
 hw/Kconfig                                |   1 +
 hw/meson.build                            |   1 +
 hw/pci-host/Kconfig                       |   3 +
 hw/pci-host/meson.build                   |   1 +
 hw/remote/Kconfig                         |   4 +
 hw/remote/meson.build                     |  13 +
 hw/remote/trace-events                    |   4 +
 45 files changed, 3265 insertions(+), 36 deletions(-)
 create mode 100644 docs/devel/multi-process.rst
 create mode 100644 docs/multi-process.rst
 create mode 100644 hw/remote/trace.h
 create mode 100644 include/hw/pci-host/remote.h
 create mode 100644 include/hw/remote/iohub.h
 create mode 100644 include/hw/remote/machine.h
 create mode 100644 include/hw/remote/memory.h
 create mode 100644 include/hw/remote/mpqemu-link.h
 create mode 100644 include/hw/remote/proxy-memory-listener.h
 create mode 100644 include/hw/remote/proxy.h
 create mode 100644 hw/pci-host/remote.c
 create mode 100644 hw/remote/iohub.c
 create mode 100644 hw/remote/machine.c
 create mode 100644 hw/remote/memory.c
 create mode 100644 hw/remote/message.c
 create mode 100644 hw/remote/mpqemu-link.c
 create mode 100644 hw/remote/proxy-memory-listener.c
 create mode 100644 hw/remote/proxy.c
 create mode 100644 hw/remote/remote-obj.c
 create mode 100644 hw/remote/Kconfig
 create mode 100644 hw/remote/meson.build
 create mode 100644 hw/remote/trace-events

-- 
1.8.3.1


