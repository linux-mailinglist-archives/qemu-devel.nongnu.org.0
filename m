Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F36133D531
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 14:51:55 +0100 (CET)
Received: from localhost ([::1]:52396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMA70-0004mw-AN
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 09:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <targupta@nvidia.com>)
 id 1lMA5N-0003md-RU
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:50:13 -0400
Received: from mail-co1nam11on2072.outbound.protection.outlook.com
 ([40.107.220.72]:35288 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <targupta@nvidia.com>)
 id 1lMA5K-000750-Ke
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 09:50:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5PifMo+yfdnSIrVCbpJzX1cJuo4UXATEHjscVdt6HjF1DFbiECV2/Z1FASzONBnFVgK79t7foAylwpTEr9iwwmC2uwnHpFXKIvcmebPHwimcIwYVdMQmYshLfApb4K3K8hHS8uEM8aIVs4CAk5LaXmuzPDQsxew+FX/IhZhsGl0ltl2VXPoDC2YldfKglTravm56dLWtuYLyUNwUlnGKsLSEJp3WE6jWXwMAsTOl5DDZKLrCBB+LsugkK10hRjWeKYwV5F5KUgNzbI7kEaIKYuCYnGCP4UTqGfnxIK6MNvvvDsc65Fylwu6ZN/uH+nUxiP0pqSKKkxFbTnz57/Bpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/bq3UDHMoRdj5sGJR8WWJc3N4YODuLm9EfyXVpYMp0=;
 b=TfCycdVxedF7uDIT2dnyHj02o//UUxB1k4t+ZygcvG9stjWMB7xKYdJVJl5zAPq9nSRW15JfCQPpdgp0bMjXGFxUgJkknInMZlXRvm2DuO3zueFG1vy2w8xXFo6gIh2KK+godWE3evNBDikVAq6Lwn6jNvabTFBh/2oEQ7ahbVUON4qrkYOJ8xZaPL3wyQe+8nbZsljfdTVT/6WVdlEBcxNTDDTR1Jcby5mtDDgBvH8LZdyrTuuXtK/OCNkKOuz+VvqYi2/jyVHLSOH8RDvERwhXqZ6hIrCQQu6eipIcGjJyDXmoQvp5Cmx/qxlME0jIkNqZaaN64E0gUGICKYS7tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/bq3UDHMoRdj5sGJR8WWJc3N4YODuLm9EfyXVpYMp0=;
 b=ZKZ0aas6Cc5Y9Wcuj1HVWa4mNv+SzgjV4tj90uiI3scOO8H157iX9d8hs1qFkQ30eaiepZgLmOfTrwwAAAsSLZ2jouYtvXXfBhYERJ1MdejYuTiYvlcPfiKBFb+sDOVz5C7F2bw0OBXwYFH/N9E3TADfORnAaU04ZrsniHdwTFySh5rec45zj4+bSRqkcC8pUUXKj/fHE73L8Us+kD6eUJ6SPvg4TcuWRFsm/cRdvnpC0pA+1awmyIysvW0C1EU+GzqLJokN4AhiSUYsE0Ftbm9GIJYR6in+gIc4hPiNzXtNLqlHaupTKexxkx6FhMF1SS1dmgZct7IqB5JpcqWvAA==
Received: from BN8PR04CA0026.namprd04.prod.outlook.com (2603:10b6:408:70::39)
 by MN2PR12MB4127.namprd12.prod.outlook.com (2603:10b6:208:1d1::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 13:35:02 +0000
Received: from BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::7d) by BN8PR04CA0026.outlook.office365.com
 (2603:10b6:408:70::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend
 Transport; Tue, 16 Mar 2021 13:35:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT045.mail.protection.outlook.com (10.13.177.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3933.31 via Frontend Transport; Tue, 16 Mar 2021 13:35:01 +0000
Received: from [10.40.102.167] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 16 Mar
 2021 13:34:56 +0000
Subject: Re: [PATCH v2 1/1] docs/devel: Add VFIO device migration documentation
To: "Tian, Kevin" <kevin.tian@intel.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "cohuck@redhat.com" <cohuck@redhat.com>
References: <20210310192009.53848-1-targupta@nvidia.com>
 <BN6PR11MB1875F23CA1AE08034F96DC898C6F9@BN6PR11MB1875.namprd11.prod.outlook.com>
From: "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>
Message-ID: <9f16901d-30e8-3e65-cca2-c0f1becc562f@nvidia.com>
Date: Tue, 16 Mar 2021 19:04:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <BN6PR11MB1875F23CA1AE08034F96DC898C6F9@BN6PR11MB1875.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d001731-e7bc-439a-edf7-08d8e8804d03
X-MS-TrafficTypeDiagnostic: MN2PR12MB4127:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4127A9F62B77317BC174E586B86B9@MN2PR12MB4127.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /EgVZqAAlqQE+VTGTX22MHbewKZKrQsrPoYHPOfY3Ackzyx/L8h2QZvwJ1AudzdQLCm9oNDHOmqRTiOwDM+Aks1nRC4GbgEwY9JJPEBFoK2niMo0rC395AKlsJ36smXS3L4DSjc3yrBkoG94jQov//W00PG6gKMAaOWrjzXYcisz0xvxmp9PaY1qhzUMHGNCFMcmh4UYARJeT8VqHpMleb4HIz5DP/1QCzXugPoeHx0GR6s2NqjB6QCdNSxJLhcl0TjmacA3OXRYLY1WXsp9eJ8C22whprB/pOiR4YcAwVZZ4qENO+wYkUWBN+T3t/leD6QkuOmng7Qqbfy8Bl2Lmzic0/Xj25xesukpDfDM6FjzVFmGHvoKd+y1jcqIiJrme6iLwN+Bt6MMTJ3xEXa0gnoU7gT0r+gf9L+NyLyPSmNdNCS8/Ab+J5AwVPIDVqqkduEKUHvOmX7avp+nS8NLI7cSqUUxZ09075m2yeOop8TszlQuk+YUeh3lYSRko9fgFOqdRPCKj0hnsCyIxCYnFxQtT/7Cw0OnE3DFaIdEbdmzjlJUSJv+O5/sCxzDXQr1Mmn8SvSagcKFzxgr5Y1qDbSwy1iGvrtkgnI9NobI0u/V+hWaEC+7dhi5E9iCEnqU3vA6Uiud8hTfjPcnGocAKScjDcMhL97mYMjITijrkFwimC/YxuEId2uB71muaQ/yr9DT9u282jYjVAxu7zbVsa3WRIRlbp/BuEVpcco9OpQ=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966006)(36840700001)(110136005)(186003)(2616005)(70206006)(356005)(53546011)(8676002)(34020700004)(426003)(70586007)(86362001)(82310400003)(316002)(16526019)(5660300002)(31696002)(6666004)(36906005)(36860700001)(31686004)(4326008)(107886003)(36756003)(478600001)(54906003)(47076005)(83380400001)(82740400003)(7636003)(16576012)(26005)(7416002)(2906002)(8936002)(336012)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 13:35:01.6177 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d001731-e7bc-439a-edf7-08d8e8804d03
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4127
Received-SPF: softfail client-ip=40.107.220.72;
 envelope-from=targupta@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: "berrange@redhat.com" <berrange@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "Zhao,
 Yan Y" <yan.y.zhao@intel.com>, "lushenming@huawei.com" <lushenming@huawei.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, "dnigam@nvidia.com" <dnigam@nvidia.com>,
 "cjia@nvidia.com" <cjia@nvidia.com>, "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 3/12/2021 8:43 AM, Tian, Kevin wrote:
> 
>> From: Tarun Gupta <targupta@nvidia.com>
>> Sent: Thursday, March 11, 2021 3:20 AM
>>
>> Document interfaces used for VFIO device migration. Added flow of state
>> changes
>> during live migration with VFIO device. Tested by building docs with the new
>> vfio-migration.rst file.
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
>>   docs/devel/vfio-migration.rst | 135 ++++++++++++++++++++++++++++++++++
>>   3 files changed, 137 insertions(+)
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
>> index 0000000000..6196fb132c
>> --- /dev/null
>> +++ b/docs/devel/vfio-migration.rst
>> @@ -0,0 +1,135 @@
>> +=====================
>> +VFIO device Migration
>> +=====================
>> +
>> +VFIO devices use an iterative approach for migration because certain VFIO
>> +devices (e.g. GPU) have large amount of data to be transfered. The iterative
>> +pre-copy phase of migration allows for the guest to continue whilst the VFIO
>> +device state is transferred to the destination, this helps to reduce the total
>> +downtime of the VM. VFIO devices can choose to skip the pre-copy phase of
>> +migration by returning pending_bytes as zero during the pre-copy phase.
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
>> +* A ``save_live_pending`` function that reads pending_bytes from the
>> vendor
>> +  driver, which indicates the amount of data that the vendor driver has yet
>> to
>> +  save for the VFIO device.
>> +
>> +* A ``save_live_iterate`` function that reads the VFIO device's data from the
>> +  vendor driver through the migration region during iterative phase.
>> +
>> +* A ``save_live_complete_precopy`` function that resets _RUNNING flag
>> from the
>> +  VFIO device state, saves the device config space, if any, and iteratively
> 
> and if any,

I didn't get this. I intended to say that it will save the device config 
space only if it is present.
So, used "saves device config space, if any".

> 
>> +  copies the remaining data for the VFIO device untill the vendor driver
>> +  indicates that no data remains (pending bytes is zero).
>> +
>> +* A ``load_state`` function that loads the config section and the data
>> +  sections that are generated by the save functions above
>> +
>> +* ``cleanup`` functions for both save and load that perform any migration
>> +  related cleanup, including unmapping the migration region
>> +
>> +A VM state change handler is registered to change the VFIO device state
>> when
>> +the VM state changes.
>> +
>> +Similarly, a migration state change notifier is registered to get a
>> +notification on migration state change. These states are translated to VFIO
>> +device state and conveyed to vendor driver.
>> +
>> +System memory dirty pages tracking
>> +----------------------------------
>> +
>> +A ``log_sync`` memory listener callback marks those system memory pages
>> +as dirty which are used for DMA by the VFIO device. The dirty pages bitmap
>> is
>> +queried per container. All pages pinned by the vendor driver through
>> +vfio_pin_pages() external API have to be marked as dirty during migration.
> 
> why mention kernel internal functions in an userspace doc?

I'll remove the mention of vfio_pin_pages() and just mention "external API".

> 
>> +When there are CPU writes, CPU dirty page tracking can identify dirtied
>> pages,
>> +but any page pinned by the vendor driver can also be written by device.
>> There
>> +is currently no device which has hardware support for dirty page tracking.
> 
> no device or IOMMU support

Right, will update it.

> 
>> So
>> +all pages which are pinned by vendor driver are considered as dirty.
> 
> Similarly, why do we care about how the kernel identifies whether a page is
> dirty. It could be dirtied due to pinning, or due to IOMMU dirty bit, or due
> to IOMMU page fault. Here we'd better just focus on user-tangible effect,
> e.g. a large/non-converging dirty map might be returned then how to handle
> such situation...

Since VFIO migration feature is not just implemented in userspace but 
also involves implementation in kernel space as well, have documented 
here what is implemented as of now.

> 
>> +
>> +By default, dirty pages are tracked when the device is in pre-copy as well as
>> +stop-and-copy phase. So, a page pinned by the vendor driver using
>> +vfio_pin_pages() will be copied to destination in both the phases. Copying
>> +dirty pages in pre-copy phase helps QEMU to predict if it can achieve its
>> +downtime tolerances.
> 
> worthy of some elaboration on the last sentence.

How about below?
"Copying dirty pages in pre-copy phase helps QEMU to predict if it can 
achieve its downtime tolerances. If QEMU during pre-copy phase keeps 
finding dirty pages continuously,then it understands that even in 
stop-and-copy phase, it is likely to find dirty pages and can predict 
the downtime accordingly."

> 
>> +
>> +QEMU also provides a per device opt-out option ``pre-copy-dirty-page-
>> tracking``
>> +to disable dirty page tracking during pre-copy phase. If it is set to off, all
> 
> IIUC dirty page tracking is always enabled in vfio_save_setup. What this option
> does is to skip sync-ing dirty bitmap in vfio_listerner_log_sync.

I'll update it as below?

"QEMU also provides a per device opt-out option 
``pre-copy-dirty-page-tracking`` which disables querying dirty bitmap 
during pre-copy phase.
If it is set to off, all dirty pages will be copied to destination in 
stop-and-copy phase only."

> 
>> +pinned pages will be copied to destination in stop-and-copy phase only.
>> +
>> +System memory dirty pages tracking when vIOMMU is enabled
>> +---------------------------------------------------------
>> +
>> +With vIOMMU, an IO virtual address range can get unmapped while in pre-
>> copy
>> +phase of migration. In that case, the unmap ioctl returns any pinned pages
>> in
>> +that range and QEMU reports corresponding guest physical pages dirty.
> 
> pinned pages -> dirty pages

Currently, all pinned pages are dirty pages.
But, agreed that dirty pages might be more accurate here, will update it.

Thanks,
Tarun

> 
>> During
>> +stop-and-copy phase, an IOMMU notifier is used to get a callback for
>> mapped
>> +pages and then dirty pages bitmap is fetched from VFIO IOMMU modules
>> for those
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
>> +  On migration completion, vCPU stops and
>> calls .save_live_complete_precopy for
>> +   each active device. The VFIO device is then transitioned into _SAVING
>> state
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
>> +Postcopy migration is not supported for VFIO devices.
>> --
>> 2.27.0
> 
> Thanks
> Kevin
> 

