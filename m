Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F36943C82AF
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:26:26 +0200 (CEST)
Received: from localhost ([::1]:33916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3c5y-0004oS-1Q
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1m3c44-0003Yj-I6
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:24:28 -0400
Received: from mail-mw2nam10on2061e.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::61e]:32928
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1m3c42-0002wo-5G
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:24:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOHR+dNtAbAVKTpvBmLZAF8lxx33qBTCmRNFa94xTEJdkoTbGIFx+kw0uFkFIb+/kcc4TAQeMmOiyPAkkLQq/LNVvJildU5/F+AGGkBT7h3jcmOJUcWkvfewgppRdbQJWnGn520GgxK12nrD0YY0aCJuHocM+CL60kTWbNNp6+VBOiwfyFwphBmz9+3yVfQpWuQ+bBffM38bBmximShyZUMaS0etgRV0ZV6YqmkmqYssIni9Q90svTfnsMVJAESzN9qGxb0JrGJ8rndII64E3xKBDRr4L2e+Yy2MhHilnoHZTyAsKvqzzagJf9eR8E29KgnkWmNX2vpqjUb1MTxt8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoS9WdCf+VprPX3byV4LjgVjigF2anXFiaGxVV+o1nQ=;
 b=MisRHi8WlB9ltf042CIXJv1YcI0gdrsKwgXpT2lfO9QQVQD5aI/qk2CCkbzPo+yRzhHrQRjtpj7vJBGnrhWfQ/IB9iLmdNNJoN9RaY5oMPCxeiEDaMZrI9uyeEo9eY2h3nHoeM6jnVAsZRcFqc9eDaCtHw5KKUKmCucYA5e7ZqYxF0X94ChfoPifYSNpWo8dm6WlbJAEJOyYxdExFGQqz4td7S1Bg/SKe1mj6l96hnVmGZw9mLYKM/F1oQ394GBqxFT5QU0g0Ib1NInzxa8zSoe6ZxlcA+dHY3EFgFlpriSmr+xLdaSAeAqQ/T9iQPS5JFJ9BxHPkB3gtM04qafr0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoS9WdCf+VprPX3byV4LjgVjigF2anXFiaGxVV+o1nQ=;
 b=koWn9slI/6XdJvPy4RKiBllvlfyZ4Wc6BwQd0Cna1NkrkECs12zaiOJoNad9AQNyLcFj1gBoKvNgG5H/sjF9wm9GRQ8aw+DjAt1/UIPL1+b2xp9YYt/NHKKppBpxJwRfQ5WY/cqBI5uaalJgnjAFoB2dXPAQciM5qk3Bv0cl8I3ylfupv9FjEyWYxM3j88zELeoSgFy1euKOu+wEWRTYhWBL3enuCBt2G4R2pCvMrw4cCE/chj0kmwfqyFc7H0sYJFuObFGc+vZB8qmqB22GEKtFaMDkKRonKDMuADQoMVJVv7IUjjJ0ksFUUEKxC0qlZ5ZigziRZXiilO1c2C6Y9w==
Received: from MW4PR04CA0264.namprd04.prod.outlook.com (2603:10b6:303:88::29)
 by CH2PR12MB3893.namprd12.prod.outlook.com (2603:10b6:610:21::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 10:19:21 +0000
Received: from CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::e8) by MW4PR04CA0264.outlook.office365.com
 (2603:10b6:303:88::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Wed, 14 Jul 2021 10:19:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT059.mail.protection.outlook.com (10.13.174.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4331.21 via Frontend Transport; Wed, 14 Jul 2021 10:19:20 +0000
Received: from [10.40.102.146] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 14 Jul
 2021 10:19:17 +0000
Subject: Re: [PATCH v1 1/1] vfio: Make migration support non experimental by
 default.
To: Claudio Fontana <cfontana@suse.de>, Tarun Gupta <targupta@nvidia.com>,
 <alex.williamson@redhat.com>, <qemu-devel@nongnu.org>
References: <20210308160949.4290-1-targupta@nvidia.com>
 <e8ad19da-0064-2edc-e7c6-6114031ea0f8@suse.de>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <a68d1ead-cca6-ff5e-033e-15865941500b@nvidia.com>
Date: Wed, 14 Jul 2021 15:49:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e8ad19da-0064-2edc-e7c6-6114031ea0f8@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47b43d05-17da-44d2-f617-08d946b0d884
X-MS-TrafficTypeDiagnostic: CH2PR12MB3893:
X-Microsoft-Antispam-PRVS: <CH2PR12MB389351C42954AD3A18940B8DDC139@CH2PR12MB3893.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /E4ldAYU873YXjjDxfMW1VW3H/aEilhaU0Bfyg4ACpQqO4/I6Cx1oKUAgEMZAs0PyA+Jp8xpuB+ssgGxQoBCCdzh8aK96hYdjIjZuAiMmTow5YlOnNuN8bOtsZN0+xiIhL3toI8FT3E87c9ES+K88iCqbNLc4HqitV3JoPuwSAmynsmRcKnSVQj0JdCpnjtzvqoCSyYv8lqW8Mf85W6GKdlffq9cX05kfEN3s+Zw9W8abHM7T/N3lwL5uUzxKIw/vEM/9QZ9zUyJ6Acn7MgMus3n9kTVIzX6PSHB1GmbtdWj6CAHUqMsjLCJQ3xGU+nh+0d3jAuoNsKI9kKmuenShhi6ivdPorTV2ppdloU66VXogjqxa/wHUz8KSIE99CkdMLjqDtoAfgOk2Fy0ucEafVMZXnCSWvGndrwynDBC9fyJGIYUmx0xZNh2+dvIDLkJglmU4PJiktpFpF3knD03xZ190OCbhDa13h9dAxluJodpbe+DUvgGJq8RZW0Qm/26dbvBrBHJmCqcC0/4cNW0gMyuQvHpnZHF3VSPLR7xzHT+z35Ke4vtpOj3LQb3cq0/vcgPvBrGKyYqpnkqsDV6SEddYu9COjeDiAt7usl5oc7AXo0NabGZ3nwkNhJptvLpil0cHY+n5jRG55QjY81qZowgG14pQc5mk/qmiaVB9n/rkB7yOj3x15S7km3nES6TuNbnIk8qwGk8ALnc1godrTwf+NNKgX1szxyrfbrWUuTSW0v+D5atk12FFoo4gpeiYs85gYcF43JPNxf4007qVducfASNpt21QwZWA0MlJqhwo2IvnL/uka1Y/4Kdb8c139/iyFiAaI30h3PKIr9a2vR/SVf3AhZ8MHabNjJovSs=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(46966006)(36840700001)(186003)(70586007)(54906003)(2616005)(316002)(426003)(31686004)(966005)(36756003)(31696002)(36906005)(336012)(26005)(83380400001)(45080400002)(70206006)(6666004)(2906002)(82740400003)(82310400003)(34020700004)(86362001)(36860700001)(478600001)(8936002)(356005)(5660300002)(53546011)(4326008)(47076005)(7636003)(16576012)(110136005)(8676002)(16526019)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 10:19:20.9397 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b43d05-17da-44d2-f617-08d946b0d884
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3893
Received-SPF: softfail client-ip=2a01:111:f400:7e89::61e;
 envelope-from=kwankhede@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.368, SPF_HELO_PASS=-0.001,
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
Cc: cjia@nvidia.com, quintela@redhat.com, cohuck@redhat.com,
 dgilbert@redhat.com, lushenming@huawei.com, dnigam@nvidia.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/10/2021 1:14 PM, Claudio Fontana wrote:
> On 3/8/21 5:09 PM, Tarun Gupta wrote:
>> VFIO migration support in QEMU is experimental as of now, which was done to
>> provide soak time and resolve concerns regarding bit-stream.
>> But, with the patches discussed in
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.mail-archive.com%2Fqemu-devel%40nongnu.org%2Fmsg784931.html&amp;data=04%7C01%7Ckwankhede%40nvidia.com%7C98194e8a856f4e6b611c08d943769ab5%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637614998961553398%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=A2EY9LEqGE0BSrT25h2WtWonb5oi0O%2B6%2BQmvhVf8Wd4%3D&amp;reserved=0 , we have
>> corrected ordering of saving PCI config space and bit-stream.
>>
>> So, this patch proposes to make vfio migration support in QEMU to be enabled
>> by default. Tested by successfully migrating mdev device.
>>
>> Signed-off-by: Tarun Gupta <targupta@nvidia.com>
>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
>> ---
>>   hw/vfio/pci.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>> index f74be78209..15e26f460b 100644
>> --- a/hw/vfio/pci.c
>> +++ b/hw/vfio/pci.c
>> @@ -3199,7 +3199,7 @@ static Property vfio_pci_dev_properties[] = {
>>       DEFINE_PROP_BIT("x-igd-opregion", VFIOPCIDevice, features,
>>                       VFIO_FEATURE_ENABLE_IGD_OPREGION_BIT, false),
>>       DEFINE_PROP_BOOL("x-enable-migration", VFIOPCIDevice,
>> -                     vbasedev.enable_migration, false),
>> +                     vbasedev.enable_migration, true),
>>       DEFINE_PROP_BOOL("x-no-mmap", VFIOPCIDevice, vbasedev.no_mmap, false),
>>       DEFINE_PROP_BOOL("x-balloon-allowed", VFIOPCIDevice,
>>                        vbasedev.ram_block_discard_allowed, false),
>>
> 
> Hello,
> 
> has plain snapshot been tested?

Yes.

> If I issue the HMP command "savevm", and then "loadvm", will things work fine?

Yes

Thanks,
Kirti

