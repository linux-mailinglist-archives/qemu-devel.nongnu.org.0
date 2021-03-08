Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54224330B3E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 11:33:08 +0100 (CET)
Received: from localhost ([::1]:54024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJDCF-00039m-Bp
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 05:33:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJD9f-0001sk-Cz; Mon, 08 Mar 2021 05:30:28 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:40018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJD9b-0006G0-Ov; Mon, 08 Mar 2021 05:30:26 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 128ANtGj104340;
 Mon, 8 Mar 2021 10:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2020-01-29;
 bh=3ROAqPqZEcSIVJBROqMnY+jwC0PqpORgs3RWF822v4U=;
 b=NBYRwQXcZUTdvBNpN9wpeiChl3VbXg/sE+y7KN1wbJXYM1toKgYLdVUqNPN4q5BRrw+E
 hBc2tynHGL+CSBpVqdn+u9E8l4iW7oye7Q+RFYBNVxXCej7HZQU0i5YU3x61iM5MDIXo
 sOl8wmMPS1Vf8E3Kxs6whVz6L6BNCTAKDIfFnz4fsh4vYu0KfsDS3zulQIWotqpqbF9/
 UbdsnzLo42P/gp5HKQX8J457RgSx6TlwDQser7E9OImgcxBGAJFNDIRIojfigSB7v+K/
 ZYd7KEC6gxP+UMqXNEUHAhYjM+CSGT285z0BkPlpw0njHNNQGxpqkhpkqRYR43Yfstvz kQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 37415r3506-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Mar 2021 10:30:18 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 128APRiV029444;
 Mon, 8 Mar 2021 10:30:17 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
 by aserp3020.oracle.com with ESMTP id 374kmwtge2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Mar 2021 10:30:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jtRIE3VDpt6NEE1P5aZNJHDYbTP84aFUSql0CQOozAiSFtMOFXRWuPGonmii77e4oQlqXz3iGJ/NTbrqg/4XPn8nsDyvq/OXslVA+ta/DGZBDZLjcI1wMNx1rvgQsYsr3kYEMzu8IN5cq7Irf1Z7L4I1rt368zQKhFRBnfmINC/OTUfLRPbwv/c04kw455YQ3fX/5g9I5vlx2cIbKIxECDzHuiC+LOL4yxOYaXEO9ggPCOfKNs15m99f7ePEAI7HGaN9yWn/wEAklbKu6q5WPLDwuwQOhmUuunffvukwZP3yCCdCtT8PYLotnWQciZuwv5RYYoMSWnyR/AEk4QTwWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ROAqPqZEcSIVJBROqMnY+jwC0PqpORgs3RWF822v4U=;
 b=e33ULBcK85n7D+JXGTo/Ap4EWeF0bj8KjUPT2hfeh1lLkQu2gIbCL7A1DoCm3NuHELG7pgFlbgWWNynpZ6oO7zLR4R94y90uliE7adBdNSnrnIxIky/r2tkv8lk4helgC6LmZeEWqt78YugM1nG/gaQV7DmosDx5WFvuiY2BzpScFKfGrSGZFij53gx871kEuhLeLz6X6l3FruqoP5WGHchfRp3h6ShBiBbwhsvt5RykMHNn8Me1EimUNovy6SUW4+tuBKZsUcsctaIrHPmWvsyuKU5jyTaDgS5+M0VWjBqWW8OY9Ry+gsQGhjg/cOEpoYJk2zJAbuq8Uiy5hTld4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ROAqPqZEcSIVJBROqMnY+jwC0PqpORgs3RWF822v4U=;
 b=cWZ/Zt9DnJHNQpvUwlzSlv7hR60HjfK7KXErYoxzmC0b8UOf+XN68q4ey3nOAnBwOikpinIXx/MkPdoee8HbGBnGbDoUNRsXsEX58W4bzWPBSiXPVzChSPxZR5m4sA8zGJQW1JnA/p1gzu9a7Ip+1BoOTQVJdpHewjKhxjjvBUs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM6PR10MB3705.namprd10.prod.outlook.com (2603:10b6:5:155::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.26; Mon, 8 Mar
 2021 10:30:15 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3890.038; Mon, 8 Mar 2021
 10:30:15 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/2] replace pflash DPRINTF with trace events, fix type
Date: Mon,  8 Mar 2021 10:30:07 +0000
Message-Id: <20210308103009.3295532-1-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO4P123CA0269.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::22) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO4P123CA0269.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:194::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 10:30:14 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id d47d1e62;
 Mon, 8 Mar 2021 10:30:09 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d0a52fe-c165-4678-d3a1-08d8e21d2962
X-MS-TrafficTypeDiagnostic: DM6PR10MB3705:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR10MB3705A3A1B67CD25B55D0E2CD88939@DM6PR10MB3705.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iCb1ivwTX8RmfYucHkIgUAncoFOeiWrVUvsfyvsQY8WqE1bjqwzbQ9cC8tY1G/1VfjR4/cK7KCk7rkhiqQ4hb1xv6GL9T+1dl8pI0Wh8Uh8nmXP+LwSfn5kJo7uKzA28sFOC1BgqauxnNrk9zabV7q3JyhAkirFrxR+nJVsVdll/y6sn4pLxaEegySbmhzcNRomQZJg06I+za/0TL02KRIe8+2/JXfm9YuTHFGp5c9rFvkeM7GyE47kdluPxBcx5lsHmnWi78RhfiWKlleFz68K0ujLkCfsTcKBLEZKjJ8OtkNHMe761sd08UOCsiFNcZIXnfAIsWdWC5ze01xVWO9be53a7NK67/fugE0Bn90iKzNbQSPuufKFgMa8VsC6iKegiwkfPI90hN0D/40TluHhOPpzRqtku6+1qFTqdwYuue3Crv/bA0af6Xil2k8WUXBMw9fuDUFFAKL0o/FVXDtS5trLQXaTmBkpkhFR6I7z6SLFl2zNWn2N411n1n819jrrgiQmaRPtGO0/7UAJMFg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(366004)(136003)(376002)(39860400002)(2616005)(1076003)(66556008)(4326008)(8676002)(66476007)(478600001)(66946007)(316002)(36756003)(44832011)(86362001)(5660300002)(186003)(107886003)(2906002)(6916009)(54906003)(52116002)(8936002)(83380400001)(4744005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OEtSZitJbjMwcDBFNGFXelk0Ti9TcDhGb0ZjQjRMcjE2L3FvWDBFcGNuS2NP?=
 =?utf-8?B?K2tSVXhuZFI3MWdjNVJoU0VWajhOZmRDUWpiOUE5ZVVlTjRCSFdOeDl3YklD?=
 =?utf-8?B?dVZtTDl0bmlTK0xwczU4VVhoSmJSZVNlWVZUdklpdHdYRkEzUmNLbFcwTUN4?=
 =?utf-8?B?M0NKRFhZdFhrVjNkUU9HUnNIZnpwbWdsbzM5TmlkS0FHOE1VNCtTYWR5bGpo?=
 =?utf-8?B?bkVFaWxsN0l6NE5tcWl1MW9RTVdmWFgzQlBYdEUzeWtWSkZoSjlTeEI1RVA5?=
 =?utf-8?B?d3dYM2c1dEdYVDZramhnbU9CbUtZcHlmLzVOMkNmdFFsdktvZGtjcGU3L1pK?=
 =?utf-8?B?UFFwU2lQOG9NMlVRdjB4MFdXaUMxbStVLy90NmExNnFpaGE1Z3VSMXk4Umg3?=
 =?utf-8?B?WU5ra3BlN0VyNEdVbWs4dStWQTZra1dubmk3WndOSjNvK0RZb2YwNkJ1enJz?=
 =?utf-8?B?aFNkMG14Yy9RMDJCTjhSb3JHcmVzYWJuRWxJUWs4bEh1eUpUcnUzSjBYZTBp?=
 =?utf-8?B?bVhTNWpCR1hlWlhZSnozd1crWFdTUy9NWHptNTQ2ckpsTGNZMEZtWUdId2hZ?=
 =?utf-8?B?N2JsUHh4a25qZzVXbVU2Q3dEWHptUHIwcUpIekU4NFZxY05uMTdEKy9RbzNp?=
 =?utf-8?B?RHIzQjFibmZpbFZYTW5DSXFBMXJaQnBMWWdzK3owU0pWaEFCSC92a1Q4U3U1?=
 =?utf-8?B?RVh0UXZUZytFSUIvcm9OMTVReFFZVkxQZ0ZyTjFnaDFObktPMlZLMGp4STBK?=
 =?utf-8?B?QUV4OVVhU295dGVyOEI4STFxWFNrZVRBQjZMUXJlTk5ES1IxMDExVEtlc1Nj?=
 =?utf-8?B?Ujc4V1lKbDJWVGFWaEJoR1NRZ0YrWXVKbEJxanpzQmZWSXlOVnFIak1sa3lH?=
 =?utf-8?B?Q1lCbTVJR3N4b0xXSFFNak5ROHUrTmE0UmlDVThGS1U5cU5tZ01CVFY0a2Fh?=
 =?utf-8?B?aXpBdjVBbmNKNGtrYk04dXZXTXZVSFhxNW45L2E1YXRkTFkwS1pYRVBqUDlH?=
 =?utf-8?B?NVVmdTJ2b1p2c1FVMExMcU1mL2FUTmpGREpIdVRtOVhGY0pRTTBXdVJ1bzlm?=
 =?utf-8?B?RzZMN2tEbEZoazQrc2NyR2NSSEMrVksra3AzazZRb3BOWVIwbTh1OTNtRlVU?=
 =?utf-8?B?eU1WZVNPMDF0Wk1xMWRFZW5kYXlZby9KU2c5Qk05LzVseVRUclN2MW5YWmJM?=
 =?utf-8?B?eGhsWVZrNUlRWVdZTmM0K0N0T0Y2K1JVMUZoVzU1eXE1d3JNTW5tbWs3UEFj?=
 =?utf-8?B?aU1Za2l5L2JWVTJzdVB3NmRWNm5oZGVXalllcmE3TmVYdWlLVzh0ZjE4dlc0?=
 =?utf-8?B?ZkxKbWpiY3ZSaExxWXc0UHBSNk5CdjlTeXB6Y01taEdmVldvSnVrL25XL01P?=
 =?utf-8?B?NHJBeG9pV3FrTEF2T0RXUTUyU3lURW1DRE1GZFdjc2krNlB2ZnpPOTVzRnZN?=
 =?utf-8?B?Y1NRMEgrNE01dFg1ZnNCMXZkakl0MXk4WExlbUZ6QjQ3VWhndExYVCtydlNi?=
 =?utf-8?B?ZURxck5pY0R1ZGY3K0Z4TkdHSGlseWxXdGs4T0pyNFBuYXVrWFBLeXhSU1Ez?=
 =?utf-8?B?bStHeGMvcDZRbG54MlpaRXhmQk55cm5BZXB0ZzFMYnMySVc4TWhzc05zYjIy?=
 =?utf-8?B?STJUT0tYbWNTUVQ0aE1kSkRvcEtlaDViRFFxNk1mZzB0QmZLbnJNem02d0NU?=
 =?utf-8?B?YURPNUw0WEhpUGllaEwyT3FOL0NIZ1Z2SlM1cXhSbC9FNVZSUmx6bHZUei9t?=
 =?utf-8?B?QnhGOWs4Z05IUThhNlprS0dnMGJjZHZ4SkdqcWd2RFVteWw1TXpYSGt5Vktv?=
 =?utf-8?B?WTJMRndQamV0MlNkMEFHQT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0a52fe-c165-4678-d3a1-08d8e21d2962
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 10:30:15.1825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MmQ/qLLwzPhOwpHZdSj1QMZS1EUskUbOQxfKoBNMt+WJaFuhqQu2LFlBXNftBRgtVeg9r9JEdaDQE+1k+MzogKcv5lmdXIy7wZIsH5yhdp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3705
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9916
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=617 phishscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103080054
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9916
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 lowpriorityscore=0
 impostorscore=0 mlxlogscore=868 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103080054
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=david.edmondson@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Given that the "sub-region" approach to shrinking the flash mapping
size on ARM isn't progressing (I'm looking at Philippe's mmap based
approach instead), this pair of changes are the already reviewed
changes from the original changeset.

David Edmondson (2):
  hw/pflash_cfi*: Replace DPRINTF with trace events
  hw/pflash_cfi01: Correct the type of PFlashCFI01.ro

 hw/block/pflash_cfi01.c | 82 +++++++++++++++++------------------------
 hw/block/pflash_cfi02.c | 75 +++++++++++++++----------------------
 hw/block/trace-events   | 39 +++++++++++++++-----
 3 files changed, 93 insertions(+), 103 deletions(-)

-- 
2.30.0


