Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7925F308AD9
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:06:57 +0100 (CET)
Received: from localhost ([::1]:36490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XEW-0004zb-Fn
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5Wwx-0007tm-Dt
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:48:49 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:60278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5Wwu-0006Ac-AI
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:48:47 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGNxUE130058;
 Fri, 29 Jan 2021 16:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2020-01-29;
 bh=d/SY73UXAdsJETLr6+3GJCBL1PXBTVmORAh5P8drCKQ=;
 b=iAeRPdMazHbmmhwAulKMGeGRv215XgZFZz6pzQGnRQpyDzZY5pFMTrxMGpmKpuOMoEMl
 TzgdhMg7hnYE7Dv1MhCnOoX8ezmoSmhHKOV4d8dch7mVnJSGQ4IpKcaLCZO/H8yoOUDS
 7hEj0uGKdsRp+RspDeE3L7SXMvLHGfrTdYLxOjEEfrvnLXtV8SqtVAy7Hqi9TepOoT/u
 UEGZC5bXH1dKYLEctwK8NE/aQxIr/E4UISseggg/HPiNW/aRHDMnqnsLOmDufNDmonuu
 6G/amv/GzJVRv7OnqBvvBORA2tlWhGb6K/TqdQiyG1nahuzbpArlMc90kKXfB2xku0gW Wg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 368b7ra9py-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:48:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGOibJ083858;
 Fri, 29 Jan 2021 16:46:30 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
 by aserp3020.oracle.com with ESMTP id 36ceug420y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:46:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlGUfx/WhjyrMKSqELcWhNo80DhFg8c2OF9p5etOguLQOW/kWHndGj64lTP+rDOar73h8svROkm53ZBr7ZBwTQrStss9qbJpgYeHIz9AoM1RtYKnUzncLgaYAWdwSzV1LhkKp75c79tUQ7TvgKOp33+e0tl3oilnxgmDxxAg8tLgh2KmYJhNSjnfVFD+zLSL3Vqxi19IQW1QFe1Wq98kSvtyIQlIwqE4L9ZYFb4+L8bXcgbrUrYXnVi/9TFSNtETRMBYphBvnHwRl5SISgJ/qmDDJorXAl7vdmzqu846MXjlhSXDqFygyx02eqtRRqQDh94QXzi0z8XJqV4PJPrS7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/SY73UXAdsJETLr6+3GJCBL1PXBTVmORAh5P8drCKQ=;
 b=G8myQFNH6Q/1hZxuirGNdoPCMh8zF9ciiTsT6Tqw7CUj1UzwxhEklV8kTW2OYR70bmJU8yvVgLJLtJy1RnmrOubfGNrSU4Pz+RoQOPf9xEVaJwPAq5CvkEtZPgotuz4Xlu+eaowkdG1aoe9bp8WSCSREZL0k9vNZYLwd+ql/HWXDYYAPlu2OQxFe+4h0/eD8wypOOA8yd7xtT1xZoVwbgYD7nj6vivhwp7I6PCap39sJeQ2ynTj+KYHXMQx05/KBBYEx7gM2x8gfOl/PYW+c15NMEv0nEMD2VspBSXaYJLFS0oyLKvlXQyrPx1g/0n9doDY757Rwg7oaEMe47DM1uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/SY73UXAdsJETLr6+3GJCBL1PXBTVmORAh5P8drCKQ=;
 b=TOPVa5IFlckS6gHl0d6fNsUuzOdNJaqCdXuuAVughMBv744leanWnrezJPyLKAuanykwYu5oN3Sdr0T3DXZqfNScmlbhKYtplmJp6Q3hJV/S8D5d3Y6ySoPQoSUmlQ/4ROusKlZV+wUSF7Pl4YnwUlQlWRfbCG1lUE/v2cs+vBg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 29 Jan
 2021 16:46:27 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3805.020; Fri, 29 Jan 2021
 16:46:27 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v21 00/20] Initial support for multi-process Qemu
Date: Fri, 29 Jan 2021 11:46:01 -0500
Message-Id: <cover.1611938319.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [209.17.40.45]
X-ClientProxiedBy: BYAPR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:74::30) To BYAPR10MB2744.namprd10.prod.outlook.com
 (2603:10b6:a02:ae::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.45) by
 BYAPR05CA0053.namprd05.prod.outlook.com (2603:10b6:a03:74::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.8 via Frontend Transport; Fri, 29 Jan 2021 16:46:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7efbb0b-1669-4ad3-7cd0-08d8c4756bae
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4686:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4686A44C7B5908339C6775AF90B99@SJ0PR10MB4686.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ik47lwVK10/C/XJirmN8o734NHkMDVm3akpNadRwRxrPf0SJFurFz1INZ4HXy1JQZH7ZaJUhSuc1f6iM9n8BdBg199w0n3y34MdON7B0TV4db6ee2ImdJmEfR2DB0Rs/+dJkux/8oWwOLNWJHY0gEHjM2wd4jzQK0QTrkaCSARscEVBFQrQ2YozRNQ4TieBZAuj2uBOMJr9hbPDnT0VmwvjkPE4VX6xnl1XJwdoAryDNdqF/PMdZc4pTx09DG9r29YK1d0RvcS6SoONcG6tgNW33eVcARhT8mCUkM1Z1JMwIwYfeVDd/F7p0OrrdjNo0TjEf1cY+vto6l3iWNE/utLZQPSc1lNZQSyPQSlC5sv7iqg/jCTcT8qG4t7eaObIMTHaQfuCkPd+9vlbx8ve3jvgky4p9narpdZs+mKj8EeBOizwa0TnQUHLd6oL06f52RMix4tobzZBUkgyEwkXgUHv2WaMwAMkc6Va/7sbjxVbZxeqPBQAwxWBuOr9tUFFMkDvPAMXIYrX7ug3COrgNgdPF6OHxmb0jyq+/36qc9aRrFZrZiiS097uaoqzCCS4JmKFns1ugdnsjahFrkit/43aIj8D3B0LgJOR5e6IGqV8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(366004)(376002)(39860400002)(5660300002)(52116002)(966005)(478600001)(6916009)(7696005)(36756003)(4326008)(83380400001)(8676002)(316002)(66946007)(66476007)(66556008)(956004)(2616005)(26005)(2906002)(6486002)(107886003)(86362001)(8936002)(6666004)(7416002)(16526019)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Nzk5elo1bkN0MWxYNzdJNkVNRWluT091KzFPVWJRSlJMQVJCRVkxVjhKY0ZU?=
 =?utf-8?B?aTRJSXR1ZXpGbUd3Zjc1a0ZWcTgrdFdpeXo5U0R5eC9lUXlzTHBSc1Q4WmNS?=
 =?utf-8?B?T1BObVl1aUtZeEVsdUhFMDAvY2FLY01jR2cwVWtYVndRTlVsRUtoR2VkWmNK?=
 =?utf-8?B?K3BYTjJLbXhRSDUwTytOSm5GZzRaclVBQWJTd0JGWjFLbUtFZXpFa25iNWd6?=
 =?utf-8?B?T2E1aTFaNG1ZcFA3SDBzZmhSdmVFQS93RHdDajFhYW9MSldMdlJya3E1L3RY?=
 =?utf-8?B?M3NYWUZPUnlaK0FVZFNrS2x5SzNZZlFTVExkdWdveWo0OW9ueEF2SEdkYUow?=
 =?utf-8?B?azFVUkpVNHk1czcrRW00ajBQN25UZkphcE84bFZaMGdZNTNwOHo3L3ZDNkNv?=
 =?utf-8?B?elNtcnlIeFJTVmZ4T2ZZWnlJVUJTMXUxM0dqSC9WbkhDc3V0TGtBUkgrUzFZ?=
 =?utf-8?B?RnV0QlNBTStuWXp5emp5NnhtMWxrSjZNbkhLcHFGTDVwR21ONUVTekFabi82?=
 =?utf-8?B?VDBnTGRVM2lGWnZNUTE5OVkxSTZLNGt5aUVXZlZLRmNHeitpc0xqZkdHdWI1?=
 =?utf-8?B?azlLNVNvSzZ3OTNoWlVKaWJiTGcybzNyQkFuUk95bitTSk1BZ2NUazJSSTdI?=
 =?utf-8?B?RWZ3NjJ0RjVxSm5GTnNyZHNDRUNwcU0rZG5nSFlWMnZxUnV0VHRRN2poUEZN?=
 =?utf-8?B?T2pybmpRQ3M1TkNXSnpyeTZVV2VzalJvN2JSeHlJTjZXWnpMT0NzNkhCUzFl?=
 =?utf-8?B?MFgvV2pxd2xUc0srcFN3ZitCWmpadjNUdVJsbFBkWUdoVjJZdzg5d05oSmZN?=
 =?utf-8?B?YUhhY3R3OHlzelJSb2NSVzRXcjdldHVqbmFEeDl5UmY0cmRIOHFXYmJpaHNL?=
 =?utf-8?B?VXNNa29BMVNTK1lTeGtmU2gzNDdJMWNGaGpnajF1dlhHTGFMZndHeGkyd3lp?=
 =?utf-8?B?bTd5R2hkMHk0MU5iR3VRRmIwYVkvVnl5a2lNbXl4M01XWnJBL1R5b0M5N1kz?=
 =?utf-8?B?NGVzT3lFbEhpZmR1QVlRQWVDaVdJVE1QMjFJWHd5Vi9CWmZwUElLZzIrWVMy?=
 =?utf-8?B?WDE3bzhJZVRZamVGMDdKYnRMUDBlMTRZTUUwKzhTZ2ovbWVnbUUxTWdjUC9C?=
 =?utf-8?B?VXFHS3h1cjRnY1NpS1JSaVF4OGZNSndEdzdrTXd1VVpzNDB0MjhHdFYyNGFy?=
 =?utf-8?B?RFhYSURwYkhxNk1sdWRzV0l2Y05Ub0QxQTVyZlVhS1Jmdjdqd2pGNDVJRU5x?=
 =?utf-8?B?dU9qZTZOUGtzNkxyM2M5RHhCSTlRNGpsclRESno5aUg3c0dnY2dud0xiakha?=
 =?utf-8?B?ZGVzaUhaSzErc0VRTjFxVVRoK2swOVNURVNkUWlaL1poY1hONXRwUDM0Y1ZU?=
 =?utf-8?B?Vkc1VEpTd1JOR3ZVQmRhWmJuVWNjYlZaTkdxVWtLNllEVVJrRjZjUnhXZE1J?=
 =?utf-8?Q?oyo7PBiD?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7efbb0b-1669-4ad3-7cd0-08d8c4756bae
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:46:27.1779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qBdp5hH1l/0Qolh7juPSZqW2CvE5G3undhZ8hqPtYFJ7xs5mmDJR0wKqWWYby81PhlN9hLrfyHwDs2xIrs9GBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4686
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101290081
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101290081
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

This is the v21 of the patchset. This version has the following changes:

[PATCH v18 08/20] io: add qio_channel_readv_full_all_eof &
               qio_channel_readv_full_all helpers
  - Separates out the error handling for (len = 0) & (len < 0)
  - (len = 0) does not necessarily mean EOF. It could also be
    a case where only FDs are read, without any data with more data
    possibly on the way. Addresses this scenario as well, as was
    pointed out in the feedback from last time.

To touch upon the history of this project, we posted the Proof Of Concept
patches before the BoF session in 2018. Subsequently, we have posted 20
versions on the qemu-devel mailing list. You can find them by following
the links below ([1] - [20]). Following people contributed to the design and
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
[20]: https://patchew.org/QEMU/cover.1611081587.git.jag.raman@oracle.com/

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
 io/channel.c                              | 116 +++-
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
 45 files changed, 3261 insertions(+), 35 deletions(-)
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


