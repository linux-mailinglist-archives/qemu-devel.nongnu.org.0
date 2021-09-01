Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C36E33FD933
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 14:04:47 +0200 (CEST)
Received: from localhost ([::1]:34792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOz0-0002HI-RU
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 08:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mLOlJ-00071w-HP
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:50:38 -0400
Received: from mail-bn7nam10on2134.outbound.protection.outlook.com
 ([40.107.92.134]:37985 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mLOlH-0002UE-QI
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 07:50:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ctdGBrsYtCMI37izm0oGIQwYJgrhPLl+7bN9R2EVT+CptPeDT2w5M5hIrX7Pqv2NAeFW5bJd+dtj1yETMSIypwsvG/k0qH0mca0X250pqQyllnxeCALgNDSRCzo7CVReGLbbA5aSj5El5IqcIiGCTk1mgWOuOQLp+f/BMvNUevkrMgvgfKLQiO5NvSOKk5FxmqtFnZWVYPnH+4+2+Ot1tpUFSYSjZwXYunqviWz9anAz8JFIyWbi1LMB5m0sPRm4qe6wBkrFAJzt7a7QagT17ODAVvrsVCMIg00uwdJdqiX6WY6sV9yqBF6YTK05PODlUZTwafFWIcDtI6nIPnsA3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/mtQpPRyRSXDcQb9s+MVq5Wx2sjN2nqOA6wfxYNVX0=;
 b=ZV2Zy7KZz9MsZOeKmZYGA239Hn5fmR/9hdUoeHQfUH6onQ9ebj+i434gF/mLXKAG+4is6OpZ+O56Ir5tmn+3OJZ5QsCV8buvTfAEeW2fevA+SwljY7PYmKUXrwzMoLCiDrPM1eCHHdZ7+6kvYQyrghlXcj/t+x6+6m3TDTJkpW4TuwJPcBdlJxfVSCbbNFn7f0RuCtqAjKBRhrJ3Nx3eOI+LDu+wgj/AjW6YZExR6ojv6leWa2P54/8wbbbhcH2vPyXZSqmwBOivMb148rIkNegXq1zsEIsFhr3SYfn4oJTNsa94MQK2/cXlIlOvGS50M0u873tIY4XvhXo+aTBWjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/mtQpPRyRSXDcQb9s+MVq5Wx2sjN2nqOA6wfxYNVX0=;
 b=m9Gn2mG0ERxo35sxo9FhKocUPL9B9lId5ulTLcB7r/7WKfVXgIA7xCpvCDjV8UFC9S3e4XIq6gQ3SRB2o3gGXJXfiKcrgkne1qN8gHfkzb78JpK/v6419BXEGJ2pJXXecJGi7UIM918I7vW95xiLrHiHntKnwQ8IJxZJmeMdwLx+hS4fkle6dDfmF0ZZ5RgCcoLlnZC+HkkPrMlojE/xVQ1c4C4y4fF+nDG0Pb982bduMDvPtDtoNNzwULYmsqrksyiqOJ1/yS6LkjiUa7UUT/X3DCGwZGQquVr0HxfnKGWtcqGD05a/380g/NDJ947j+7bBqipG34QAnLd3qJ88xA==
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4224.namprd03.prod.outlook.com (2603:10b6:805:ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 11:50:27 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 11:50:26 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL v3 0/8] Fuzzing Patches for 2021-09-01
Date: Wed,  1 Sep 2021 07:49:56 -0400
Message-Id: <20210901115004.34768-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0328.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::33) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL1PR13CA0328.namprd13.prod.outlook.com (2603:10b6:208:2c1::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.8 via Frontend
 Transport; Wed, 1 Sep 2021 11:50:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88c7a577-c41f-4583-d27e-08d96d3eb06e
X-MS-TrafficTypeDiagnostic: SN6PR03MB4224:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB42244E6D20D6B918643B219DBACD9@SN6PR03MB4224.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9T8hWeT9qMVn0vCii4LTNb4AuWh3DPl3PckV7jEp8JpGhm54mz3Ya3Jhd7Sg/sXgIVMq0FsWLjU548m5L/SI2tozNfG3TG1fP1vmaeRatYz5eSzYB9hdDInWmfMAKDiGAjW1kAbAKpH2Zqjm59Nfc+xVpll2R1KfhwCaxGWyj/hcyjoeeMJwtw/WK51NtjSe6a5fHOAFU7RYtexTYP8RuFekZ7SAwCk7ufYk11YVvq6E94hX2wJ7ISb5O1Pzq7P8urmBofl2XifA0MT9n6m/ddhrSaNkb35bq059Eq3O5Tl9zEXujngV02aYCXGsC/vg8b7HPyvmFEqI2/WhHVO98ToAu9DX2nIR8mb7suxU+EtxKCPcTu2dGM5ifINNaVN+cO91UUlDBtOlin4X2Q3H4FdQr8actNp2YwKfkVRxacDD95yG89Y9jfTvMGkLT1BDluO9M/0Ut5eBAPm5xxtiKIgs7ALhe5fkZHOhg75jPaXjwqfroOj+9yxPEsDoCulvC83LQicEDDO4mcSdNegi0M0gr6Hekd/7OrX2mIzEDx0AsjNKzl4/OgzH7wbKk11Z/R5tsNH49zAfPlfEACsXrIxt9U6VNUGX/ldbH4YChGpRAhGjnzF4ixgTx26g9PalPVnv/hjqx8J4ezKNnwIB7h9DUQFbjlLaXPqk9avwLM9IGMKsJ7gK3XSUTFz7po/UgVWW/ZZhlAlXfWGhQPJNCOeZCyuBMiusOlpNLQdktUZMO/xxQmjp0m4ZGWYCJEnND5KjViTaqjlk9rO313SwIVJgPSmE6loAkasd5wDiZmg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(75432002)(8936002)(38100700002)(38350700002)(6486002)(4326008)(52116002)(5660300002)(86362001)(36756003)(956004)(2616005)(966005)(2906002)(66476007)(66556008)(1076003)(83380400001)(186003)(316002)(6916009)(66946007)(6512007)(6506007)(8676002)(26005)(478600001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0hmeGdRelY5Nys4aUkrL0FReExPRTlzNkJUdXl1LzQvTU5KRWRmaG9rZmVr?=
 =?utf-8?B?UUl0L0JsQ1B5M3VzaE1kQTRDczZKRFZRTEtPbkZ5ZDhRd0cyd2FhblMraUlV?=
 =?utf-8?B?ci9LcnBmNER3K1BYWmRQS3FxOVBDekZma2NqekNyYmUyaEpuUjlCamdmTG54?=
 =?utf-8?B?NldTSjh4S3NnSkI3R2c5eE9tR1Z6UGVNWU5vOFpTOTRxKytHQUhPQjU3Rjhh?=
 =?utf-8?B?TEc0MjVkMS9YUEZLdmtyZ1g5ay9hUGFHRjV0S2J3eHJHS3Q4MjhlQVorUnA1?=
 =?utf-8?B?bDA4a0U1NlFpM1l6angya3N4Nk9mUkptckhOOXNydnhUTmpWQmVHZWNhQTh4?=
 =?utf-8?B?cW1CNG5RYjZOc2d1MHVvL2VONFptNW1SYVFsWE95d2ovZW5TRms5dzBGZWll?=
 =?utf-8?B?aFJSbk1DZ1NwQ3dCQW4vOGhENmwvcWpCamUvdWNiU2VNaFlocEt4a2Z4UlNU?=
 =?utf-8?B?NU84TVJGMHRDdmF2dEVqLys2b241UTNFRld6YWsyR3N2OUdDT2JZZVMzcHRD?=
 =?utf-8?B?bUl1Y0tKR1pCUGlpMUt1WUw1QTVLeTRTbnZBc2NmL2NtRm05QU5QY1MxWWpJ?=
 =?utf-8?B?aFlSakJ3a1p1bGxtNDJtUGZBZzhwR3RuTm5oNEpUQjNVSmhBR1NPSmgrRFBF?=
 =?utf-8?B?YnVPdkhwaEljTExlRHY2TjBQRnlpbXVleTRxcU1yN1FKUzdXWi9BeEdnRnFK?=
 =?utf-8?B?UGJ5N21tRGc4d1RQNlFWZjRLQitycVRua216dnAwK09naTl6eFJ5MmlSdldx?=
 =?utf-8?B?WXBucTZTaWQ3eVp0NXJVUmdnN1ZtNG56Q0RwamZaT1lVNzJoUnVHQkVuMnNB?=
 =?utf-8?B?QzY1ZW5BdFc5Q2JjZzZzK3VXOFpCRzIra2YrUXNaRTBWQ3F6N2diajkwSWRE?=
 =?utf-8?B?V1gwMjIyOXBwb0RRSkFwV2JCNTQyVmdkMFVCZmYyVlJlNHFXZSszMXNjUnYz?=
 =?utf-8?B?UHNWNEVkSklzTGQ3VU9rRVVrTjl5NnZJSStVNVozQy96dmdxbzc2cmkvRXVz?=
 =?utf-8?B?c3gwUXZMNVIvMVBJZjZBKzBGbCswa1lYaTdKUDVpeEtyUmc0bUFsQ3JlVVZl?=
 =?utf-8?B?TExzc3RiZWJWM1NRTlUxNWZwN3YxVjhoRjRKYWlXQ21SUnMrenZNeDhSd295?=
 =?utf-8?B?MWdib1pkaVRHY0tod21PUFNENjVYMHFpd0lOMEZSV3c2cCtRcDdPVDZhekNk?=
 =?utf-8?B?OFhCelRHeStoT0xPK0lCSzlJSFVvN2dSdWJtdUgvQVdGQTVrNXd0ZjBNZTRj?=
 =?utf-8?B?NlE3MSs2ZXRRTFNicFJMdnYvRWFpcUlFcXorOGRjaFZQMmJqT0M3ckVuZm00?=
 =?utf-8?B?bEtXWnphc0IxZjE4ZkYzV3dvTmpNRHMxVFk0VW9ERHZ3SzlBVnRTWWtoV1pa?=
 =?utf-8?B?aGl1Yk4yVHFVTjBSR3VuYUlOa0t1Smg3b05UMVFzcnFrdGEwdnE5MFFrWFF2?=
 =?utf-8?B?TlNvQXZLUGg1VEIvdG5EMXdGV2VKeUZvVnNqQ1IyVFhmMWN4OUtGM1pOT3Nm?=
 =?utf-8?B?cEVocW1FeXovWmhoUGxSMHQzQWV6WEtucEZ6blRwQXY4TWFxV0UzWnZFbGpW?=
 =?utf-8?B?NDhUSHlUYXpBZ1ZJeUtnMXZZN3l4Z0dXMGdNRk1jOEhCS1pYWGdHMVFPd1Zz?=
 =?utf-8?B?OEhlU2NHTE4rby9GYjVzTHR0UlNoald0aW1lRlNKSXBjd2RvaVlXZE5BOFdK?=
 =?utf-8?B?RGh1c3oxNk1YWndqb3NkaHBBMmd5UVJWNU9uc2piWTlLd25rU2tYT3Fid0lG?=
 =?utf-8?Q?DjWusMBNfAM2ZHMLFb8l86UDuP3H8myspigl3ls?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c7a577-c41f-4583-d27e-08d96d3eb06e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 11:50:26.6687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: db7n+C3Vr9Jku+8jeCM7XI99MruoaZgIp8MlGmzHBB4Vo1zx3GDnrcrFRFdbTyGZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4224
Received-SPF: pass client-ip=40.107.92.134; envelope-from=alxndr@bu.edu;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.238, HK_RANDOM_FROM=0.999, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: bonzini@redhat.com, peter.maydell@linaro.org,
 Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter,

The following changes since commit ec397e90d21269037280633b6058d1f280e27667:

  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20210901-2' into staging (2021-09-01 08:33:02 +0100)

are available in the Git repository at:

  https://gitlab.com/a1xndr/qemu/ tags/fuzz-pull-2021-09-01

for you to fetch changes up to 5d32fc3b60ffad175cab27dfaf07e0929a4f5755:

  MAINTAINERS: add fuzzing reviewer (2021-09-01 07:33:13 -0400)

Thank you

----------------------------------------------------------------
Fuzzing Patches for 2021-09-01
 * Add Darren and Qiuhao as reviewers
 * Make coverage-instrumentation and timeouts more granular
 * Fix a problem with impossible writes in the DMA callback, leading to
   false-positives
 * Attempt to fix oss-fuzz coverage builds, by dealing with a
   signal-related problem

----------------------------------------------------------------
Alexander Bulekov (6):
      fuzz: fix sparse memory access in the DMA callback
      fuzz: adjust timeout to allow for longer inputs
      fuzz: make object-name matching case-insensitive
      fuzz: add an instrumentation filter
      fuzz: use ITIMER_REAL for timeouts
      fuzz: unblock SIGALRM so the timeout works

Darren Kenny (1):
      MAINTAINERS: Add myself as a reviewer for Device Fuzzing

Qiuhao Li (1):
      MAINTAINERS: add fuzzing reviewer

 MAINTAINERS                                      |  2 ++
 configure                                        | 28 ++++++++++++++++++++++------
 scripts/oss-fuzz/instrumentation-filter-template | 15 +++++++++++++++
 tests/qtest/fuzz/generic_fuzz.c                  | 55 ++++++++++++++++++++++++++++++++++++++++++++-----------
 4 files changed, 83 insertions(+), 17 deletions(-)
 create mode 100644 scripts/oss-fuzz/instrumentation-filter-template

-- 
2.30.2


