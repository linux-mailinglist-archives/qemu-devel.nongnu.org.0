Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B160350FEB
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 09:14:44 +0200 (CEST)
Received: from localhost ([::1]:57740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRrXO-00082j-Ri
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 03:14:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <targupta@nvidia.com>)
 id 1lRrW8-00071E-9Y
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 03:13:24 -0400
Received: from mail-mw2nam10on2078.outbound.protection.outlook.com
 ([40.107.94.78]:15712 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <targupta@nvidia.com>)
 id 1lRrW5-0003JD-2g
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 03:13:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9EMeQl5W58FOi04adOkMLLTSfRktt5w1w6f8dDYhnvOqfxzeRjRYFCzQVIEbg1LMvuMkDDx52k8J7451nHLKtLEPgUOA1X5QUlOgCkQTALTg2swX+gWyzSBXo2ZYiRfZLl35ZtjwYxRuDCUi71YrS3E+8f+gAEuc8eQ6/LpqYpvrePku3Hfvrd253aoZdumYe59fFYrCaeT+HJIu52UrfMov1+1t+qYUx+4Kv3+NSaSDA3Pcp8xS+B4WO5Sa1LZH0zqMRCNDmEiUv/pSlQMpEo3XppLoJPCrCcjSokgtM9qPm5ouCP4Gk84NLvYvNqe7ZTtRJQvGyPYoZRa/i+3vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMJs0alOnTGErZ+WbAiv0Jhcw6URdxunGVGqhyAp1P8=;
 b=BicV1DhjrtoY0DeBku1fyZIN8YZSn4Nz7Bi5GPtGXrYYoRQqo1lIv+PivJC7SOtiHdKuo484GZshp4gjVttEap+8zBg0BrJtlfkrF8m98sfxQBqSmnnmP+VNOBXcm/8z3JnbV8B3Wn318pLs3pB7GUxz5eE6KMbfUNh0oatMZpWxeiWa9m8oE8hH0Z/XMC51yEH5CHYHaSYAPJnA2StmJFsq6pkjAE8eIJBqi+KKFt72ZST6jT1W6+Mtt9f9V+PBYzZyYOgLBTb7ny0UtN6sbkXUZRiiCucP7F2Nztf3hZSEkJAi/iJ4oJvijcL3weCrULvlE/avq9r9KOTFT04Ybw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMJs0alOnTGErZ+WbAiv0Jhcw6URdxunGVGqhyAp1P8=;
 b=TC5XY1SdElPiY5kiRWJNB9I7tk8bTxU37Mx54cC9C3NoEK+lJMAh5eZs5v8YXdOZUytyapXYZi2O/R9M2iMdrZePMtQx1xFxvr5O4Sb2etRRHI7cZSTSMXn1t2cEA/hnHP6+VOQDl3e0b/LSYywBKTFSRwBm1ekToThhQfkNYAaswA8clGYHbVCYUbz901GSFKfh5CnB6ltRPzSk+mCw8YzGappjSe1QG3eSHcH8NZnkWsxOzQG4oeIxuWTrCI7sPwVv4xDxPfdJLONn9f3BFkpipGCRac3a7i10woaiZ9VfWY3Mco1Sjlj6PWC2Js6ONn9yl6EfyH94MpUmr9JYew==
Received: from MWHPR21CA0055.namprd21.prod.outlook.com (2603:10b6:300:db::17)
 by DM6PR12MB2955.namprd12.prod.outlook.com (2603:10b6:5:181::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Thu, 1 Apr
 2021 06:58:14 +0000
Received: from CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:db:cafe::71) by MWHPR21CA0055.outlook.office365.com
 (2603:10b6:300:db::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.1 via Frontend
 Transport; Thu, 1 Apr 2021 06:58:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT043.mail.protection.outlook.com (10.13.174.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3999.28 via Frontend Transport; Thu, 1 Apr 2021 06:58:13 +0000
Received: from [10.40.100.74] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Apr
 2021 06:58:08 +0000
Subject: Re: [PATCH v3 1/1] docs/devel: Add VFIO device migration documentation
To: Shenming Lu <lushenming@huawei.com>, <qemu-devel@nongnu.org>,
 <kwankhede@nvidia.com>, <alex.williamson@redhat.com>, <cohuck@redhat.com>,
 <kevin.tian@intel.com>
References: <20210326131850.149337-1-targupta@nvidia.com>
 <f9e5076b-ada5-88fc-c738-db51330e96b4@huawei.com>
From: "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>
Message-ID: <420730cc-1fef-accf-ea92-612e0678924a@nvidia.com>
Date: Thu, 1 Apr 2021 12:28:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <f9e5076b-ada5-88fc-c738-db51330e96b4@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 413dd64d-7c9e-4cd4-704e-08d8f4db84da
X-MS-TrafficTypeDiagnostic: DM6PR12MB2955:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2955AEB2470C9C4D6D055E82B87B9@DM6PR12MB2955.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MNK/BvtRPnOKq9fNmGSzopRtVK+ybqE0Nr3xw87bJ5nZ269hIrqpFXpb9+GekSv3LiufqSj0prA+nG7oGK7Vzhb9hbqnhX6lP6mu7D8IZIo0GTTrE1YH+noIoK4CVGjyrtepCs1lWJE9i9eBuhQ/wM6gh/ywgEVxNjAkPhK4zsPNUenM8Bs1yiPaVw6iP4GgNjGnFx82Bwl+jsGHvbW7k6VHiHyK/ZuDwjXYcqFYNDfZqKbewvCsW0AuBUfGjVbwnL8VVmj037a8clLGzwh63uWrF+NSZPTaOVJnZuz9Mr5zETFW/+wo16/PUOreilm5lGOsjQrX1j0KbKCEXbD+eQ+UeJuaNzc3K+rUZ5APhFKz2HUI1jAi/ppfWviICpJwYpsAmqDNkV6YaVtXIRzxETF+cnjS6PFS9QGIV/if/IsefAL3VGz8xEJaxO+1UE5p3mZnAPxntmZzBZgjL86HJrVjtxbPmTX/EFXkUcuodOcU0QMulPKoVYa5VzgKGK9pdSfx67rSFOeh1QELI6ekMxlnAJpQPHz57wW5/zj/K6BiKs6S6ypL9XvL+JaAK3HnYzsOx8GhKgk7+UbY9JDBeP1geNxHr0KUKYqIonXwFvd+25Jzb3+pGIX71hFwxemM/PcCaTimYZd9gIgcc0mck3vwcCmUo6Pk2G+HUh91zKKLzS87ZB13TdfU1WuNzJD5
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(396003)(376002)(46966006)(36840700001)(7636003)(2616005)(16576012)(316002)(426003)(186003)(4326008)(83380400001)(53546011)(36756003)(7416002)(26005)(107886003)(82740400003)(86362001)(70586007)(8936002)(16526019)(82310400003)(110136005)(54906003)(356005)(2906002)(8676002)(478600001)(31686004)(47076005)(36860700001)(36906005)(31696002)(6666004)(336012)(70206006)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 06:58:13.5489 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 413dd64d-7c9e-4cd4-704e-08d8f4db84da
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2955
Received-SPF: softfail client-ip=40.107.94.78;
 envelope-from=targupta@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: yan.y.zhao@intel.com, quintela@redhat.com, berrange@redhat.com,
 dgilbert@redhat.com, dnigam@nvidia.com, cjia@nvidia.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/27/2021 11:34 AM, Shenming Lu wrote:
> On 2021/3/26 21:18, Tarun Gupta wrote:
>> Document interfaces used for VFIO device migration. Added flow of state changes
>> during live migration with VFIO device. Tested by building docs with the new
>> vfio-migration.rst file.
>>
>> v3:
>> - Add introductory line about VM migration in general.
>> - Remove occurcences of vfio_pin_pages() to describe pinning.
>> - Incorporated comments from v2
>>
>> v2:
>> - Included the new vfio-migration.rst file in index.rst
>> - Updated dirty page tracking section, also added details about
>>    'pre-copy-dirty-page-tracking' opt-out option.
>> - Incorporated comments around wording of doc.
>>
>> Signed-off-by: Tarun Gupta <targupta@nvidia.com>
>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
>> ---
>>   MAINTAINERS                   |   1 +
>>   docs/devel/index.rst          |   1 +
>>   docs/devel/vfio-migration.rst | 143 ++++++++++++++++++++++++++++++++++
>>   3 files changed, 145 insertions(+)
>>   create mode 100644 docs/devel/vfio-migration.rst
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 738786146d..a2a80eee59 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1801,6 +1801,7 @@ M: Alex Williamson <alex.williamson@redhat.com>
>>   S: Supported
>>   F: hw/vfio/*
>>   F: include/hw/vfio/
>> +F: docs/devel/vfio-migration.rst
>>
>>   vfio-ccw
>>   M: Cornelia Huck <cohuck@redhat.com>
>> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
>> index ae664da00c..5330f1ca1d 100644
>> --- a/docs/devel/index.rst
>> +++ b/docs/devel/index.rst
>> @@ -39,3 +39,4 @@ Contents:
>>      qom
>>      block-coroutine-wrapper
>>      multi-process
>> +   vfio-migration
>> diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
>> new file mode 100644
>> index 0000000000..24cb55991a
>> --- /dev/null
>> +++ b/docs/devel/vfio-migration.rst
>> @@ -0,0 +1,143 @@
>> +=====================
>> +VFIO device Migration
>> +=====================
>> +
>> +Migration of virtual machine involves saving the state for each device that
>> +the guest is running on source host and restoring this saved state on the
>> +destination host. This document details how saving and restoring of VFIO
>> +devices is done in QEMU.
>> +
>> +Migration of VFIO devices consists of two phases: the optional pre-copy phase,
>> +and the stop-and-copy phase. The pre-copy phase is iterative and allows to
>> +accommodate VFIO devices that have a large amount of data that needs to be
>> +transferred. The iterative pre-copy phase of migration allows for the guest to
>> +continue whilst the VFIO device state is transferred to the destination, this
>> +helps to reduce the total downtime of the VM. VFIO devices can choose to skip
>> +the pre-copy phase of migration by returning pending_bytes as zero during the
>> +pre-copy phase.
>> +
>> +A detailed description of the UAPI for VFIO device migration can be found in
>> +the comment for the ``vfio_device_migration_info`` structure in the header
>> +file linux-headers/linux/vfio.h.
>> +
>> +VFIO device hooks for iterative approach:
>> +
>> +* A ``save_setup`` function that sets up the migration region, sets _SAVING
>> +  flag in the VFIO device state and informs the VFIO IOMMU module to start
>> +  dirty page tracking.
>> +
>> +* A ``load_setup`` function that sets up the migration region on the
>> +  destination and sets _RESUMING flag in the VFIO device state.
>> +
>> +* A ``save_live_pending`` function that reads pending_bytes from the vendor
>> +  driver, which indicates the amount of data that the vendor driver has yet to
>> +  save for the VFIO device.
>> +
>> +* A ``save_live_iterate`` function that reads the VFIO device's data from the
>> +  vendor driver through the migration region during iterative phase.
>> +
>> +* A ``save_live_complete_precopy`` function that resets _RUNNING flag from the
>> +  VFIO device state, saves the device config space, if any, and iteratively
>> +  copies the remaining data for the VFIO device until the vendor driver
>> +  indicates that no data remains (pending bytes is zero).
> 
> Hi Tarun,
> 
> We have moved the saving of the config space to the ``save_state`` function
> added in commit d329f5032e1, do we need to add this change here? :-)
> 

Thanks Shenming, I'll update it accordingly in the next version.

Thanks,
Tarun

> Thanks,
> Shenming
> 
>> +
>> +* A ``load_state`` function that loads the config section and the data
>> +  sections that are generated by the save functions above
>> +
>> +* ``cleanup`` functions for both save and load that perform any migration
>> +  related cleanup, including unmapping the migration region
>> +
>> +A VM state change handler is registered to change the VFIO device state when
>> +the VM state changes.
>> +
>> +Similarly, a migration state change notifier is registered to get a
>> +notification on migration state change. These states are translated to the
>> +corresponding VFIO device state and conveyed to the vendor driver.
>> +
>> +System memory dirty pages tracking
>> +----------------------------------
>> +
>> +A ``log_sync`` memory listener callback marks those system memory pages
>> +as dirty which are used for DMA by the VFIO device. The dirty pages bitmap is
>> +queried per container. All pages pinned by the vendor driver through external
>> +APIs have to be marked as dirty during migration. When there are CPU writes,
>> +CPU dirty page tracking can identify dirtied pages, but any page pinned by the
>> +vendor driver can also be written by device. There is currently no device or
>> +IOMMU support for dirty page tracking in hardware.
>> +
>> +By default, dirty pages are tracked when the device is in pre-copy as well as
>> +stop-and-copy phase. So, a page pinned by vendor driver will be copied to
>> +destination in both the phases. Copying dirty pages in pre-copy phase helps
>> +QEMU to predict if it can achieve its downtime tolerances. If QEMU during
>> +pre-copy phase keeps finding dirty pages continuously, then it understands
>> +that even in stop-and-copy phase, it is likely to find dirty pages and can
>> +predict the downtime accordingly
>> +
>> +QEMU also provides per device opt-out option ``pre-copy-dirty-page-tracking``
>> +which disables querying dirty bitmap during pre-copy phase. If it is set to
>> +off, all dirty pages will be copied to destination in stop-and-copy phase only
>> +
>> +System memory dirty pages tracking when vIOMMU is enabled
>> +---------------------------------------------------------
>> +
>> +With vIOMMU, an IO virtual address range can get unmapped while in pre-copy
>> +phase of migration. In that case, the unmap ioctl returns any dirty pages in
>> +that range and QEMU reports corresponding guest physical pages dirty. During
>> +stop-and-copy phase, an IOMMU notifier is used to get a callback for mapped
>> +pages and then dirty pages bitmap is fetched from VFIO IOMMU modules for those
>> +mapped ranges.
>> +
>> +Flow of state changes during Live migration
>> +===========================================
>> +
>> +Below is the flow of state change during live migration.
>> +The values in the brackets represent the VM state, the migration state, and
>> +the VFIO device state, respectively.
>> +
>> +Live migration save path
>> +------------------------
>> +
>> +::
>> +
>> +                        QEMU normal running state
>> +                        (RUNNING, _NONE, _RUNNING)
>> +                                  |
>> +                     migrate_init spawns migration_thread
>> +                Migration thread then calls each device's .save_setup()
>> +                    (RUNNING, _SETUP, _RUNNING|_SAVING)
>> +                                  |
>> +                    (RUNNING, _ACTIVE, _RUNNING|_SAVING)
>> +             If device is active, get pending_bytes by .save_live_pending()
>> +          If total pending_bytes >= threshold_size, call .save_live_iterate()
>> +                  Data of VFIO device for pre-copy phase is copied
>> +        Iterate till total pending bytes converge and are less than threshold
>> +                                  |
>> +  On migration completion, vCPU stops and calls .save_live_complete_precopy for
>> +   each active device. The VFIO device is then transitioned into _SAVING state
>> +                   (FINISH_MIGRATE, _DEVICE, _SAVING)
>> +                                  |
>> +     For the VFIO device, iterate in .save_live_complete_precopy until
>> +                         pending data is 0
>> +                   (FINISH_MIGRATE, _DEVICE, _STOPPED)
>> +                                  |
>> +                 (FINISH_MIGRATE, _COMPLETED, _STOPPED)
>> +             Migraton thread schedules cleanup bottom half and exits
>> +
>> +Live migration resume path
>> +--------------------------
>> +
>> +::
>> +
>> +              Incoming migration calls .load_setup for each device
>> +                       (RESTORE_VM, _ACTIVE, _STOPPED)
>> +                                 |
>> +       For each device, .load_state is called for that device section data
>> +                       (RESTORE_VM, _ACTIVE, _RESUMING)
>> +                                 |
>> +    At the end, .load_cleanup is called for each device and vCPUs are started
>> +                       (RUNNING, _NONE, _RUNNING)
>> +
>> +Postcopy
>> +========
>> +
>> +Postcopy migration is currently not supported for VFIO devices.
>>

