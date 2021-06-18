Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5943AC94F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 13:02:50 +0200 (CEST)
Received: from localhost ([::1]:58522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luCGt-0004iM-Kt
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 07:02:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1luCE4-0003xL-FT
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:59:52 -0400
Received: from mail-mw2nam10on2054.outbound.protection.outlook.com
 ([40.107.94.54]:40353 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1luCE1-0006zM-7D
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:59:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2ULX0qlKXEtA4IlbOTdsAkHkiQuSH3MMZPJe3JzxJLhMWkZwcCHtr+LqBFgRLHsKZvyUswBKJH+kKJLa2HZkg7UG0zHpXt9kccADokq/ZyAMA9m9lcm2hkoq2WIiZkz0ybScOGDGh2OGcDkH8CVxGR35v0czWlaZ7DvSYiM1yB7PEQv9xXwTTY4pvMQzkqBNpF/pH60zj87yMnuDsVoTfR6VxP/5tKlffPx/bqcp3ta/9TQWc/+JtABcfgZcR0keUohiiSupTDEOqHU1mnSMIXeQtedWiNt8V8OqpFmSvahTBbdIdkEPGRQfXnCL9pBSegTDBYZtvl5zJokDMGBTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLUR2zhzynhzTnZwAXcQdNCttchvCiPS9SnExNqokzs=;
 b=BNPm5WkGcmpRUgrkYNKtVqUxbV0e2Hr3A6Q5mW/T+6ZK/gjl5QUeDFwwAJhp/aJQ0K1fadX6uqQ8tauZu21UAQP9dJhPstnJmOZ+69pULP5GIGuYjG5StA9/GCMc8CiAwd/3u1x8+AGO3LYZ8eqLnsmb/yCv+sXmyWCIZAIlXUtKZxiY1ituCvml5ykJum4LqOzG8Jt5fiBdN/72GYvtC3Gv2yfqsCZKn3QaO6fC4sahcbOE+e2PhWFZz6YEqLjfcJaUVoZ4g9W9YadbeuQnxz3FwQjI5ftlrKicOlSW+Tp9scXHqTrY2cv0lx2ulqZuZw7ttsTggh9NOuMJBIjtJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLUR2zhzynhzTnZwAXcQdNCttchvCiPS9SnExNqokzs=;
 b=ZwIwnGTMqEMyMZSdzeK7u/f4g0y+dbWWu76Ygn3w/N9ppUpW++zGo2FzS0tC+L74xP84nC2YxaDMEyYRrgqrA1mBqAtj7ksszkoc1h5IGvdTezQNjnHp6wpC1DmqMTB85Z3aB97Kt9Xr2v3/5LtYvyuG0CSvj/flXZJEr1sP0w7/1aFx/TJJYRkbAXaGcfqShvs6aAmzGxAU7piGcdPHzGtkHFTNWBstiD1B4G1CzIteXq45SZvkLG1ljD6uueeOrJAEdcU7Yt01NPMvUlrIA75OTovXX3FK6Xu39N26b46WADco3AiX2QRvDbR3WxpBTXF+Uo27D7oD3N2o0cyfPA==
Received: from MW4PR03CA0317.namprd03.prod.outlook.com (2603:10b6:303:dd::22)
 by BN8PR12MB3315.namprd12.prod.outlook.com (2603:10b6:408:41::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 18 Jun
 2021 10:44:41 +0000
Received: from CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::40) by MW4PR03CA0317.outlook.office365.com
 (2603:10b6:303:dd::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend
 Transport; Fri, 18 Jun 2021 10:44:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT010.mail.protection.outlook.com (10.13.175.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4242.16 via Frontend Transport; Fri, 18 Jun 2021 10:44:40 +0000
Received: from [10.40.102.21] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 18 Jun
 2021 10:44:36 +0000
Subject: Re: [PATCH v1 1/1] vfio/migration: Correct device state from vmstate
 change for savevm case.
To: <alex.williamson@redhat.com>, <dgilbert@redhat.com>
References: <1623177441-27496-1-git-send-email-kwankhede@nvidia.com>
From: Kirti Wankhede <kwankhede@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <00b57c95-98aa-3543-8d4a-369ae5efea00@nvidia.com>
Date: Fri, 18 Jun 2021 16:14:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1623177441-27496-1-git-send-email-kwankhede@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abc9babe-eaff-4cca-3222-08d9324613a0
X-MS-TrafficTypeDiagnostic: BN8PR12MB3315:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3315ED4EEF9669F16095C8CEDC0D9@BN8PR12MB3315.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jWZFQ2ieRQkTjc46nzspR9/8Ppi7Hsq2qe2C8CIXNyE6JtuwylMf5DlZwf0m+dbItzMPS92v/d3hbAxzqRB+dDfJzvlCH2uNcvva1sb/THsbg+5MWmiW8Lk+8yov+kvTtlTJ8IJ4NXoqs1XUZbWiZe11bockXDacH21HMCasoNsf3Zs4rtJHrCAEAWfqP8/fRodWkCBfIhlGSYN0twEyJVeQpkT4LKm28uiQdRScoGEELvLMSHtydU8HBKKlEI1GsG23nuU61dCERpT0WeVHNuwCuaMWAMYBUuerTwk7qmarnPGnlzKIQ6mXEXiDFG5IKvJ8SRY50CZ8tU1zAiguXnroamPVJ5p3cs70WoJn76q4MT8PIn3xktm8BQ0WzHhZTEgFORg/emZpilA9jd8lBaKaVF0C4yTvhmp18SHJ3OWZS6AJhN45FBqoduVxZBhTjVtmwiSsClsDLCXLMoyKevXuxvsx7Jaedm5uadcX5xByFt/SWc7Q1VZPVg404N+LyhZFvIpNWzR/15cd+jrTG/Dm9v8n191NJ5dT+GQbR/pl28pDequ4dxAQrxujzEnkqN28wkKa0S8I+5N2HMA4AeRPMZKqZh5FutwqlE3+mKcHXO97KVeD0kFS8Wh8gXlUd+AQ20tBufKXmLMjApFhqf2vEtqU53ATM8xtDNmt5DqteeD98ta+2fp3tKSjA2Sa
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966006)(36840700001)(47076005)(26005)(83380400001)(53546011)(36860700001)(31686004)(86362001)(36906005)(426003)(356005)(186003)(336012)(107886003)(5660300002)(7636003)(16526019)(16576012)(54906003)(8936002)(31696002)(478600001)(82310400003)(82740400003)(316002)(70586007)(2616005)(70206006)(8676002)(36756003)(6666004)(2906002)(4326008)(110136005)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 10:44:40.6971 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abc9babe-eaff-4cca-3222-08d9324613a0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3315
Received-SPF: softfail client-ip=40.107.94.54;
 envelope-from=kwankhede@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.254, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: mgurtovoy@nvidia.com, yishaih@nvidia.com, cjia@nvidia.com,
 cohuck@redhat.com, qemu-devel@nongnu.org, dnigam@nvidia.com,
 Jason Gunthorpe <jgg@nvidia.com>, targupta@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CCing more Nvidia folks who are testing this patch.

Gentle Ping for review.

Thanks,
Kirti


On 6/9/2021 12:07 AM, Kirti Wankhede wrote:
> Set _SAVING flag for device state from vmstate change handler when it gets
> called from savevm.
> 
> Currently State transition savevm/suspend is seen as:
>      _RUNNING -> _STOP -> Stop-and-copy -> _STOP
> 
> State transition savevm/suspend should be:
>      _RUNNING -> Stop-and-copy -> _STOP
> 
> State transition from _RUNNING to _STOP occurs from vfio_vmstate_change()
> where when vmstate changes from running to !running, _RUNNING flag is reset
> but at the same time when vfio_vmstate_change() is called for
> RUN_STATE_SAVE_VM, _SAVING bit should be set.
> 
> Reported by: Yishai Hadas <yishaih@nvidia.com>
> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> ---
>   hw/vfio/migration.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 384576cfc051..33242b2313b9 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -725,7 +725,16 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
>            * _RUNNING bit
>            */
>           mask = ~VFIO_DEVICE_STATE_RUNNING;
> -        value = 0;
> +
> +        /*
> +         * When VM state transition to stop for savevm command, device should
> +         * start saving data.
> +         */
> +        if (state == RUN_STATE_SAVE_VM) {
> +            value = VFIO_DEVICE_STATE_SAVING;
> +        } else {
> +            value = 0;
> +        }
>       }
>   
>       ret = vfio_migration_set_state(vbasedev, mask, value);
> 

