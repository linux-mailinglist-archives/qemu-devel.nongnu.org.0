Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972EE6953F2
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 23:37:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRhRU-00016x-2D; Mon, 13 Feb 2023 17:37:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1pRhRR-0000xY-OF
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 17:36:57 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1pRhRN-0005IQ-EU
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 17:36:57 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DMO3Ze020878; Mon, 13 Feb 2023 22:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=I9bF0z+2f63RUmiZA5WTvQXtI7/UTxI0rY2WlKQyO/8=;
 b=BaAb5Pz1w/B5C59Ev4aGNy23/Bq1kl9IIkFyBwOmbR4MD8wUwUYjRORm8xSRl9Y+zFIn
 sa5hMr3zdAk/5avWZKiZeqLvmCXVh88aRJjF+Za/4sxycDmvc3xfet529pITpONfEpSd
 /4wqOUbMKVAPkUYNfX7wfog/uwnJreRJWLfw6kp4GtKESUMcNYFeBoLuqkcnNoKUy4a5
 JP1j1RTdtUsk7GUiCPWZg3LCp9ThDwtvnqgBz2w0GTv+oa7YK4jGRX7//PDkQUVLy+Vo
 VuV7dYT9mAyAUL7IGM0sOJFYQd8PyPsGp/LfR6qjRE+MTpC+30m0WdeCUC1ihCALebnp 4g== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np3jtv18h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 22:36:42 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31DKmUht011575; Mon, 13 Feb 2023 22:36:40 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3np1f4rpjg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 22:36:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EtBRdzv+DcuJeln35xOgOKWqLyxO9XzGT7QqrHOAD6BzvxU+wvtXMrElrWV/radTtCt2g0EyYFivlPT1qmdaaOi0nyb5XiIqZ5AzgkQcA1BDIt/OHomIxziN4qAwRa+qXKm+XKb24/WTkICe6pX3omT3ncT8W62fpWC8SLxoOnNR00+XzeHDn1s2XK0CjQNns6qmXe9zlAANod7ySXyyYS27KKuMBmlo7uWGmr/Yj8Uvdyqfnn1YtkydE7rE68JEOm0goDuV11K/yiI3wefJ4p2zS9Aw6U/FuI5bmcmpilqOEyYn+DW/dc59kLTdst8mi4syV9K7flYtMeZYPeLxVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I9bF0z+2f63RUmiZA5WTvQXtI7/UTxI0rY2WlKQyO/8=;
 b=J3alazl70nYm2ZtnM7fKZVUljnpbd1Mojt0nhCASGwK09h7PGLXgOPzLmqOt5uk3giw+nZFl5hspGns/5w+qCFb9j7DvpwYr+jNIW3Ov2xC75BCE2X/r59Pq6+AlM5nU0XKjVh6QYB3RQXaCKWV04lNQKs37Iu0QIg2bbbVGTVQIm3kUb0JZQbsxEEV8gcNPYXKHuuj9US4nza5/GLky8E0KpkTUVl2uBAkyM/B+VwnTuLCUB+m63Uqr53q3t2IRDZ4aDIEG5ffZgL5pa2Koxtggjnm5A/jET0XHIzi5qYt4mizRrR+nPp8V88+aJuX9UfN3fs9EYFWgNGleEaoY2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I9bF0z+2f63RUmiZA5WTvQXtI7/UTxI0rY2WlKQyO/8=;
 b=LVbIofzRe0SSm3vQ3l6Oe7xHS4uz49apkvsv/tOOV9M9wcMlxMIQ3imN4ybQJeTdf/oOWJb39pUUtpUh1Lxt8cynVrFI48nLOSpe9D6WHMV6xYrHNBLj7sXaeohCRmN+AxPUVkjKOmyFC69YdnhFuJGQt990u4563sTQRkUrCXs=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by SN4PR10MB5558.namprd10.prod.outlook.com (2603:10b6:806:201::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.9; Mon, 13 Feb
 2023 22:36:38 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::25da:8594:cf75:8ef3]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::25da:8594:cf75:8ef3%9]) with mapi id 15.20.6111.010; Mon, 13 Feb 2023
 22:36:38 +0000
Message-ID: <ae993c38-4f6c-7ea0-d5c3-445921bdbd08@oracle.com>
Date: Mon, 13 Feb 2023 14:36:33 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC v2 11/13] vdpa: add vdpa net migration state notifier
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Eli Cohen <eli@mellanox.com>, qemu-devel@nongnu.org,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com,
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-12-eperezma@redhat.com>
 <d434e204-6847-f34f-258a-9ae1cf6328ce@oracle.com>
 <CAJaqyWf5mNxjeAskVjLTFu08LpPxiHffhrtknKB75aUAEayEcQ@mail.gmail.com>
 <ab75ec37-763b-2055-01e9-10e87ef6e956@oracle.com>
 <CAJaqyWfvCFHjTu72YtVbrzprBx+=Ywuxgtgbv6rAEpQddj5z_g@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAJaqyWfvCFHjTu72YtVbrzprBx+=Ywuxgtgbv6rAEpQddj5z_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:5:3b9::33) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|SN4PR10MB5558:EE_
X-MS-Office365-Filtering-Correlation-Id: 03b2aab8-ba4b-4253-6da5-08db0e12c4f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BLzcNKvJXUoePY6rKUiF1i27YnryBPxKnkS1YhV8/2zwba/bo0X2YbKHezeMl754eQfXg8rR1dlltGQ6eiuZmxOl0oH3eqDARUAhfo+SG/vC4TdUWnFNXDEknLpJx9WLyIYMJiQTg6gEOzKlRbnuMRt5/OUc/KAXDv6mZTw89RNkaW+D7Wo5Cu9Oercs9D1y7JGRQMJpQY78PvzBtYpxSZBrteqbzC6aGH4vPwwzFvHzN2AV0kqRi8+0tr9VPfM1O4t+kIwsiqP2gbHrYl6jmcvfa/ds7FyhCUYx98dYNAWF0RPjuTa9sxIO+sUWZgNeK/mJCEDQcW6WDx4rMi0QYzds5dCnqNMxSbY52nY9AF2tNu376eydpV2mc2j7bfP6p5kEMTphWmYdkPwqeMFBWp7cosvSXAVLAw4nTFnJKrgIeuI+LkKoB7PH8SoyV/ckNPi5pFeqY23OtL5hmlFn9YPHrLPI10W3KmO88d28vUp0zHVcL0BcbKsbAwU3oyIrU7mkV76IeVJ+RQbO72q3K3RbGVbE10jz/sW/4+7excFLFk4Re+9l5JLhkh/x8GKuqm45OWrrzYlzO9X5uVy1joweeBw8/SQ6l8CQXF/17JAednhO7faF/8xHElhywko8BKxRY1XGdyPRlAXfR+zobn/60S62NoRpO47mjEVzP4nPttSLEmx03uWyXm8mQIiYwnck31ZpfqLfvwYA6TnQbsSyMPVgpMUeM/iGVEraDQI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6535.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(396003)(376002)(366004)(136003)(451199018)(6512007)(26005)(186003)(6486002)(478600001)(6666004)(31686004)(36916002)(4326008)(8676002)(2616005)(66556008)(6916009)(66476007)(53546011)(6506007)(54906003)(83380400001)(316002)(66946007)(8936002)(41300700001)(5660300002)(66899018)(7416002)(30864003)(2906002)(38100700002)(36756003)(86362001)(31696002)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHh2bzljUWtjSVlFb0lNVTNjZjEwSnRzWmNaYlUxOGlRSjhUS1JzYTZTdGFn?=
 =?utf-8?B?L0NsZ2lub3plbVZBeFdLS0ZoUG5uTTdYUWhaRHZqTUMwcC9zK2xSbTZKakNi?=
 =?utf-8?B?OGpVMHIycUJBVlV4eWVLZVJXcEcwM04zUXRBdldMVWtadVZhMU9iN2l4emhv?=
 =?utf-8?B?QzZDT25FUjlRaTBNR0tBR0hvMWdOeE9TS09iUk5qYXVCRmhGaTJVakM1S0Vs?=
 =?utf-8?B?OHpiSHpJS2IyT3VpaE0wZ2YvbTZkajRrdVRkV3ByUW9JOUJwdFpSQmlHdHRK?=
 =?utf-8?B?RGNWTm9PRE9ZOHB3WFpoNHBHTVJkd1A3WTYzcHpyREJ2RGJTS2VtbE5rbXln?=
 =?utf-8?B?RjhFdFQ5eE11cFFLV3l3Qm01Vjl4SGR4OEtuTGs1akV1cFowcVdjUzBTVlRM?=
 =?utf-8?B?VU53L1o5MElySTJpSnBLUFNqK2crQWJMbVl0TDNLWHQ0eVBWMGlVbnNBODgv?=
 =?utf-8?B?Z2RNdFVWdVZKV1Z5RWdmdkIvb1dVY3pBMmNYc3V5SUZzQXpId0RUVFRCaGht?=
 =?utf-8?B?eVNhOGQ5dzl2bDdMdjIxWERHNTZ3Z09DMVFVaTIvWm1Eekg0WlNRRlpLVklM?=
 =?utf-8?B?WXg0UnpNNEo5SWc2WThNaXdMSHRId29yNHpDWkNnOFdrTWpabjBtU1I2ZkhZ?=
 =?utf-8?B?U1FiWlhOT0E5TGdVZWVoVFV6MS83bVhKS3V1NWpManNELzdLNk5QSDRYTDlR?=
 =?utf-8?B?OFZxUmVpY1hsOHhOVE00OThZeDM5bDN2Y1MyWFBtRkhSVnFQUGdrT0I1blM5?=
 =?utf-8?B?ZFRJblBuZXJZQ2JneXlxY3pIV2twL1VqUElROU9QakhvRnBkTmV3eWdRUnU3?=
 =?utf-8?B?cVNjb3pKM0hTQkYzRFFWYW9uMmMwSVh2VE1VNGRnb2hpZHJRU3pJT2RpUVlt?=
 =?utf-8?B?SEwrOFBLaERQdHQrR2dKVUE3QjRqeEowaEphTmhJa29SVkhvQzlFRU8xejlU?=
 =?utf-8?B?cEtYSlovZ25aZnNCckhaTjdkYnBFZzJMS1drRlZpanVPOExxN1M0ZjhlMlNX?=
 =?utf-8?B?T1ZjOSs0REJUVCtHMWhWbGtrZVUwTVhWK05oR0htZDhDenZWTlppbFdiMVE4?=
 =?utf-8?B?THArTTZaTk00M09IeWJwamp0Nnd0VzZOb1FaN1Y3VUk5a3RnMmE4MXdNZWEw?=
 =?utf-8?B?WkpxOEFNeDhyMnl0SVhJN3d0QW10eDRuVm5vWElrQlQxOERFL0xyYyszQnRs?=
 =?utf-8?B?SVAxdHVjVEthOXB6ZitkWTk5dmtrZWtlYUJ5UFJQTnVFTkRocXBMUm5aYjdy?=
 =?utf-8?B?ZGR4aUlNc3lRMXV3Q0FRckFwQTl4d3dRNW1LODZGVngyQ0RaWG1HbjRGM3pq?=
 =?utf-8?B?QVhmcXBSWXY1WGxrRUxjVXMwMzBLWm4zUXNUM1g2cStWeVFmM3Z5R1QxQm5q?=
 =?utf-8?B?TDBRVGtxaEk2RVJHZDRCMWFtNzFrUVRUbzQybDdFdFh3ZmZwam1vWWdxSGVD?=
 =?utf-8?B?ODJjKzcxUG12RUVreTFHUERleGJjT0o5VFdFc3kydzNma1J5a2dlYTQyeG1n?=
 =?utf-8?B?SzZFVDBEcWpldWVDdVNSNVJiRXE0N2kzb2dlTjR2Q0h3cmNhcms3TzBZTmhO?=
 =?utf-8?B?Nk1HTDIyMW84Zmd1TzNCVjhsMlVDRnRvaFFGc3dXL1hvVDRXUVJsQzd6TjY2?=
 =?utf-8?B?a3U1NDBuSW1Qd0Nvc3UyRFF0SHUybWt4NXJxcGluYVlWNkNMdGFjRmI1dWx0?=
 =?utf-8?B?N0J6KzV6OU5nTWkwN2JnTHZRK3BWd1p0ZUpNZFJ4c09WN3lxQzBHY0NxUkNo?=
 =?utf-8?B?NGdVc0JqZWpUSHliWmpLMFI5RWd6ejRCS3BhYWtRYm1jcmdaSGUvVS9mOVlG?=
 =?utf-8?B?NGNOenFuN1RERHZ0Rlp2bEJ6NEdyNkt5ZHIwUktrUVlWZDRTODQ0MFNRV3Vw?=
 =?utf-8?B?R0NlUk9WRUxrM2NmWHIvVUYzdWd4bmhvU1JZdXVva1V2ckpNWThIanFpUlF2?=
 =?utf-8?B?M2h5NmN1VDVVT2hYdGZXeEJwWHVUT3JMZURIblJIZjBUUElqaGlBM0w4ZUVX?=
 =?utf-8?B?YmRjbzgybHJNY1lrdVZkSzVKY21zWk9INVdhYTFDRE0rbGNkYVhYejg1SDdt?=
 =?utf-8?B?MVlmejB1QnpUY0NNSm5kWllaK1c1LzFrSG4zNlVZcmtsUlpRU3VJZlZPMWpX?=
 =?utf-8?Q?7jp6mpYC/+z7lQw1X1cQDGuWL?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?cGNMY2xUNzR1aC9NNENCSWkrZ3lmZndNb2Y0aExZaWtoWlU3TTkwdGFnWXh5?=
 =?utf-8?B?VDVySDhhU2l1RFZWSTRNNlk2a3oxNXphVndyakRyWGN0K0l6OG1oMFBrUGla?=
 =?utf-8?B?WFoveW1VRTVDVGJCU3pSL2tuQXdxOVljeEVYempuZDNETVVOOU9hcVNYcThP?=
 =?utf-8?B?ZU43ZWJPYWFIb0FXbm5xMEJ4aml0VEl0SWdWcVY2M3VHZzhmOHBtODRmZVRq?=
 =?utf-8?B?REZwajVlTzdSU21rTkZKUEFiY0Z0MUp6TnFMeDBhRy9aanZ3dTRRMUdoYTdZ?=
 =?utf-8?B?YkJaL3hFVTlDN0ZsSU5GdEpiMkRpYWxSM3hjQkw2dWJveUdzY2hnR29OeVpQ?=
 =?utf-8?B?Tzh1YVdZMlRBQ1NuMWR2aWVRanFlM1BwRHpwTnZKUm40dTY2aWlFcGxEQ0dC?=
 =?utf-8?B?R2hLWGtPblE1bFExL2xtdFJvRm9tUGtlMkFxRERwMU1ndXFRYjVRdEszbjlI?=
 =?utf-8?B?SlVDLzdFdjdDMHVNVDN6aXBrZ3NIQVFiMVl3eE8wSmwzdmJmdzhxQy9idlUr?=
 =?utf-8?B?UTl6bGdOc1pKTkNyUXpLTkUzRjFOZ3FER0pHSHlISng2Z2svL1RnTXg3bHd2?=
 =?utf-8?B?dFNlYjkxbk1YdjFQYUJzL29ocTRhOGFpVG1yU3BoK1JtUjM2Vzh4aUZqOVRP?=
 =?utf-8?B?ZGNjOGV5ZGs4a2tFc3hnUmZ3bExvV3R3UnpPRnc2cHEvQ3lnNXppaEI5S0NF?=
 =?utf-8?B?WW1ESkJzR1Q4cCtLSHlYR0xKRk92ZGpMWGxqai80cnJxYjJWNXU1QjlEY0Iv?=
 =?utf-8?B?c2FmMGI3YkdpQzJ2RW1wTi9ja21hK3JlMTQ4QzhSekY0UUhTREYxWVpJU2FZ?=
 =?utf-8?B?bmZHL0VjVDVUVVMrWUlTclFiZ0x0VlQxUksrN1VoZ0NHYk9kdVZ1US9qeHlv?=
 =?utf-8?B?eGhocVpPbU1FdEFWNmx5UUswZk96cFFZcE9JQmxEcTY4NnBhUURmKzAvSFhN?=
 =?utf-8?B?WWxYd1dLZ2E1TGgxWDRaa3hDUEE1c0VMNmhpVjl3WTlaRlBZS2FHd0U0U1hE?=
 =?utf-8?B?eEpMSVlTaEN0NWhVN1FReXNWTGd0QzJKYXUwOHoyWGhBZW1NNmpKZy9VcGda?=
 =?utf-8?B?QjZSaDMvdkloYXZVR1JJdTArVDljdjJTN2VlV08zeGpEd0Z0MDArdzJEZXp3?=
 =?utf-8?B?TENOb2ZPRWtQNk4xUzNjQ3g0QkJRZ0hNQTZ4YVJ1eGR6UWhQNUs1K1Q1QXhY?=
 =?utf-8?B?VzU0bWo4REZTbEFxZ3RoNkk2SnNIR0pUN1pRVXlSM1B3M2R4L2pHRVdJM1U0?=
 =?utf-8?B?aHY5aTVRME90c09pRlZkTjNvZWlUbTdGNWJxQWptVEFQZEgvUT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b2aab8-ba4b-4253-6da5-08db0e12c4f4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 22:36:38.1016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJR8vlc/kBqYi4tJv1yl9o2b1+dvNxQ1zG99qsI6CjFkUAzFt+noLjjY8jbD7Brrk5klXy8NVSPRncNTbscLFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5558
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_12,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0
 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302130197
X-Proofpoint-ORIG-GUID: _wHDVsocusxxlaVEKk5oQS00h7sVFDSP
X-Proofpoint-GUID: _wHDVsocusxxlaVEKk5oQS00h7sVFDSP
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 2/13/2023 1:47 AM, Eugenio Perez Martin wrote:
> On Sat, Feb 4, 2023 at 3:04 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>
>> On 2/2/2023 7:28 AM, Eugenio Perez Martin wrote:
>>> On Thu, Feb 2, 2023 at 2:53 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>>>
>>>> On 1/12/2023 9:24 AM, Eugenio Pérez wrote:
>>>>> This allows net to restart the device backend to configure SVQ on it.
>>>>>
>>>>> Ideally, these changes should not be net specific. However, the vdpa net
>>>>> backend is the one with enough knowledge to configure everything because
>>>>> of some reasons:
>>>>> * Queues might need to be shadowed or not depending on its kind (control
>>>>>      vs data).
>>>>> * Queues need to share the same map translations (iova tree).
>>>>>
>>>>> Because of that it is cleaner to restart the whole net backend and
>>>>> configure again as expected, similar to how vhost-kernel moves between
>>>>> userspace and passthrough.
>>>>>
>>>>> If more kinds of devices need dynamic switching to SVQ we can create a
>>>>> callback struct like VhostOps and move most of the code there.
>>>>> VhostOps cannot be reused since all vdpa backend share them, and to
>>>>> personalize just for networking would be too heavy.
>>>>>
>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>> ---
>>>>>     net/vhost-vdpa.c | 84 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>     1 file changed, 84 insertions(+)
>>>>>
>>>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>>>> index 5d7ad6e4d7..f38532b1df 100644
>>>>> --- a/net/vhost-vdpa.c
>>>>> +++ b/net/vhost-vdpa.c
>>>>> @@ -26,6 +26,8 @@
>>>>>     #include <err.h>
>>>>>     #include "standard-headers/linux/virtio_net.h"
>>>>>     #include "monitor/monitor.h"
>>>>> +#include "migration/migration.h"
>>>>> +#include "migration/misc.h"
>>>>>     #include "migration/blocker.h"
>>>>>     #include "hw/virtio/vhost.h"
>>>>>
>>>>> @@ -33,6 +35,7 @@
>>>>>     typedef struct VhostVDPAState {
>>>>>         NetClientState nc;
>>>>>         struct vhost_vdpa vhost_vdpa;
>>>>> +    Notifier migration_state;
>>>>>         Error *migration_blocker;
>>>>>         VHostNetState *vhost_net;
>>>>>
>>>>> @@ -243,10 +246,86 @@ static VhostVDPAState *vhost_vdpa_net_first_nc_vdpa(VhostVDPAState *s)
>>>>>         return DO_UPCAST(VhostVDPAState, nc, nc0);
>>>>>     }
>>>>>
>>>>> +static void vhost_vdpa_net_log_global_enable(VhostVDPAState *s, bool enable)
>>>>> +{
>>>>> +    struct vhost_vdpa *v = &s->vhost_vdpa;
>>>>> +    VirtIONet *n;
>>>>> +    VirtIODevice *vdev;
>>>>> +    int data_queue_pairs, cvq, r;
>>>>> +    NetClientState *peer;
>>>>> +
>>>>> +    /* We are only called on the first data vqs and only if x-svq is not set */
>>>>> +    if (s->vhost_vdpa.shadow_vqs_enabled == enable) {
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    vdev = v->dev->vdev;
>>>>> +    n = VIRTIO_NET(vdev);
>>>>> +    if (!n->vhost_started) {
>>>>> +        return;
>>>>> +    }
>>>>> +
>>>>> +    if (enable) {
>>>>> +        ioctl(v->device_fd, VHOST_VDPA_SUSPEND);
>>>>> +    }
>>>>> +    data_queue_pairs = n->multiqueue ? n->max_queue_pairs : 1;
>>>>> +    cvq = virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
>>>>> +                                  n->max_ncs - n->max_queue_pairs : 0;
>>>>> +    vhost_net_stop(vdev, n->nic->ncs, data_queue_pairs, cvq);
>>>>> +
>>>>> +    peer = s->nc.peer;
>>>>> +    for (int i = 0; i < data_queue_pairs + cvq; i++) {
>>>>> +        VhostVDPAState *vdpa_state;
>>>>> +        NetClientState *nc;
>>>>> +
>>>>> +        if (i < data_queue_pairs) {
>>>>> +            nc = qemu_get_peer(peer, i);
>>>>> +        } else {
>>>>> +            nc = qemu_get_peer(peer, n->max_queue_pairs);
>>>>> +        }
>>>>> +
>>>>> +        vdpa_state = DO_UPCAST(VhostVDPAState, nc, nc);
>>>>> +        vdpa_state->vhost_vdpa.shadow_data = enable;
>>>>> +
>>>>> +        if (i < data_queue_pairs) {
>>>>> +            /* Do not override CVQ shadow_vqs_enabled */
>>>>> +            vdpa_state->vhost_vdpa.shadow_vqs_enabled = enable;
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    r = vhost_net_start(vdev, n->nic->ncs, data_queue_pairs, cvq);
>>>> As the first revision, this method (vhost_net_stop followed by
>>>> vhost_net_start) should be fine for software vhost-vdpa backend for e.g.
>>>> vp_vdpa and vdpa_sim_net. However, I would like to get your attention
>>>> that this method implies substantial blackout time for mode switching on
>>>> real hardware - get a full cycle of device reset of getting memory
>>>> mappings torn down, unpin & repin same set of pages, and set up new
>>>> mapping would take very significant amount of time, especially for a
>>>> large VM. Maybe we can do:
>>>>
>>> Right, I think this is something that deserves optimization in the future.
>>>
>>> Note that we must replace the mappings anyway, with all passthrough
>>> queues stopped.
>> Yes, unmap and remap is needed indeed. I haven't checked, does shadow vq
>> keep mapping to the same GPA where passthrough data virtqueues were
>> associated with across switch (so that the mode switch is transparent to
>> the guest)?
> I don't get this question, SVQ switching is already transparent to the guest.
Never mind, you seem to have answered the question in the reply here and 
below. I was thinking of possibility to do incremental in-place update 
for a given IOVA range with one single call (for the on-chip IOMMU 
case), instead of separate unmap() and map() calls. Things like 
.set_map_replace(vdpa, asid, iova_start, size, iotlb_new_maps) as I ever 
mentioned.

>
>> For platform IOMMU the mapping and remapping cost is
>> inevitable, though I wonder for the on-chip IOMMU case could it take
>> some fast path to just replace IOVA in place without destroying and
>> setting up all mapping entries, if the same GPA is going to be used for
>> the data rings (copy Eli for his input).
>>
>>>    This is because SVQ vrings are not in the guest space.
>>> The pin can be skipped though, I think that's a low hand fruit here.
>> Yes, that's right. For a large VM pining overhead usually overweighs the
>> mapping cost. It would be a great amount of time saving if pin can be
>> skipped.
>>
> That is doable using dma_map/unmap apis instead of set_map (or
> comparing in set_map) and allocation GPA translations in advance.
Is there a way for a driver to use both dma_map()/unmap() and set_map() 
APIs at the same time? Seems not possible for the moment. And batching 
is currently unsupported on dma_map()/unmap().

Not sure how mapping could be decoupled from pinning as the current uAPI 
(VHOST_IOTLB_UPDATE and VHOST_IOTLB_INVALIDATE) have both, i.e. it's not 
easy to tear them apart. If we agree pinning is not needed, perhaps we 
could add a new uAPI to just remap the IOVA ranges for data VQ 
addresses, and get around any code path involving page pinning. Under 
the hood at the driver API level, in case of general platform IOMMU, 
iommu_unmap() and iommu_map() can be used; in case of on-chip IOMMU, 
vdpa kernel would just call the new driver API .set_map_replace() to 
update the relevant IOVA mappings in place, without having to rebuild 
the entire iova tree.

>
>>> If any, we can track guest's IOVA and add SVQ vrings in a hole. If
>>> guest's IOVA layout changes, we can translate it then to a new
>>> location. That way we only need one map operation in the worst case.
>>> I'm omitting the lookup time here, but I still should be worth it.
>>>
>>> But as you mention I think it is not worth complicating this series
>>> and we can think about it on top.
>> Yes, agreed. I'll just let you aware of the need of this optimization
>> for real hardware device.
>>
>>>    We can start building it on top of
>>> your suggestions for sure.
>>>
>>>> 1) replace reset with the RESUME feature that was just added to the
>>>> vhost-vdpa ioctls in kernel
>>> We cannot change vring addresses just with a SUSPEND / RESUME.
>> I wonder if we can make SUSPEND (via some flag or new backend feature is
>> fine) accept updating internal state like the vring addresses, while
>> defer applying it to the device until RESUME? That way we don't lose a
>> lot of other states that otherwise would need to re-instantiate at large
>> with _F_RING_RESET or device reset.
>>
> If that helps, that can be done for sure.
>
> As another idea, we could do the reverse and allow _F_RING_RESET to
> not to forget the parameters unless they're explicitly overriden.
Hmmm, this might need spec extension as that's not the current 
expectation for _F_RING_RESET so far as I understand. Once ring is 
reset, all parameters associated with the ring are forgotten.

> I think I prefer your idea in  SUSPEND / RESUME cycle, but just wanted
> to put that possibility on the table if that makes more sense.
Yea may be via a new per-vq suspend feature: _F_RING_STOP.

>
>>> We could do it with the VIRTIO_F_RING_RESET feature though. Would it
>>> be advantageous to the device?
>>>
>>>> 2) add new vdpa ioctls to allow iova range rebound to new virtual
>>>> address for QEMU's shadow vq or back to device's vq
>>> Actually, if the device supports ASID we can allocate ASID 1 to that
>>> purpose. At this moment only CVQ vrings and control buffers are there
>>> when the device is passthrough.
>> Yep, we can get SVQ mapping pre-cooked in another ASID before dismantle
>> the mapping for the passthrough VQ. This will help the general IOMMU case.
>>
>>> But this doesn't solve the problem if we need to send all SVQ
>>> translation to the device on-chip IOMMU, doesn't it? We must clear all
>>> of it and send the new one to the device anyway.
>>>
>>>> 3) use a light-weighted sequence of suspend+rebind+resume to switch mode
>>>> on the fly instead of getting through the whole reset+restart cycle
>>>>
>>> I think this is the same as 1, isn't it?
>> I mean do all three together: 1,2 in kernel and 3 in QEMU.
>>
> Ok I missed that in my first read, thanks!
>
> But I feel 2 should be easier to do in qemu.
>
> I don't really know how this helps in the general IOMMU case, I'm
> assuming the IOMMU does not support PASID or similar tricks. Is that
> because of the vhost_iotlb population or is there anything else I'm
> missing?
A new uAPI (more precisely, iotlb message) is needed to get around of 
page pinning at least. Or if not specifically tied to onchip IOMMU, we 
can make it two separate uAPIs for UNMAP and MAP, respectively.

>
>>>> I suspect the same idea could even be used to address high live
>>>> migration downtime seen on hardware vdpa device. What do you think?
>>>>
>>> I think this is a great start for sure! Some questions:
>>> a) Is the time on reprogramming on-chip IOMMU comparable to program
>>> regular IOMMU?
>> I would think this largely depends on the hardware implementation of
>> on-chip IOMMU, the performance characteristics of which is very device
>> specific. Some times driver software implementation and API for on-chip
>> MMU also matters. Which would require vendor specific work to optimize
>> based on the specific use case.
>>
> Got it.
>
>>>    If it is the case it should be easier to find vdpa
>>> devices with support for _F_RESET soon.
>>> b) Not to merge on master, but it is possible to add an artificial
>>> delay on vdpa_sim that simulates the properties of the delay of IOMMU?
>>> In that line, have you observed if it is linear with the size of the
>>> memory, with the number of maps, other factors..?
>> As I said this is very device specific and hard to quantify, but I agree
>> it's a good idea to simulate the delay and measure the effect. For the
>> on-chip MMU device I'm looking, large proportion of the time was spent
>> on software side in allocating a range of memory for hosting mapping
>> entries (don't know how to quantify this part but the allocation time is
>> not a constant nor linear to the size of memory), walking all iotlb
>> entries passed down from vdpa layer and building corresponding memory
>> key objects for a range of pages. For each iotlb entry the time to build
>> memory mapping looks grow linearly with the size of memory. Not sure if
>> there's room to improve, I'll let the owner to clarify.
>>
> So I think all of these are great ideas.
>
> If we state the pin & unpin huts latency in the switching I think the
> easiest way to start is:
> * To start with qemu and send all the map / unmap in a batch
By map / unmap, you are referring to the uAPIs (VHOST_IOTLB_UPDATE and 
VHOST_IOTLB_INVALIDATE), not the driver level .dma_map/unmap() kernel 
APIs, right? yes it's always good to commit all map / unmap transactions 
at once in a batch.

> * Avoid the pin / unpin in the kernel using a smarter algorithm for
> that, not unpinning regions that it is going to pin again.
This seems to change the uAPI behavior underneath. Maybe cleaner to get 
it done with new uAPI.

Regards,
-Siwei

>
> What do you think?
>
> Thanks!
>
>> Thanks,
>> -Siwei
>>
>>
>>
>>
>>
>>> Thanks!
>>>
>>>> Thanks,
>>>> -Siwei
>>>>
>>>>> +    if (unlikely(r < 0)) {
>>>>> +        error_report("unable to start vhost net: %s(%d)", g_strerror(-r), -r);
>>>>> +    }
>>>>> +}
>>>>> +
>>>>> +static void vdpa_net_migration_state_notifier(Notifier *notifier, void *data)
>>>>> +{
>>>>> +    MigrationState *migration = data;
>>>>> +    VhostVDPAState *s = container_of(notifier, VhostVDPAState,
>>>>> +                                     migration_state);
>>>>> +
>>>>> +    switch (migration->state) {
>>>>> +    case MIGRATION_STATUS_SETUP:
>>>>> +        vhost_vdpa_net_log_global_enable(s, true);
>>>>> +        return;
>>>>> +
>>>>> +    case MIGRATION_STATUS_CANCELLING:
>>>>> +    case MIGRATION_STATUS_CANCELLED:
>>>>> +    case MIGRATION_STATUS_FAILED:
>>>>> +        vhost_vdpa_net_log_global_enable(s, false);
>>>>> +        return;
>>>>> +    };
>>>>> +}
>>>>> +
>>>>>     static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
>>>>>     {
>>>>>         struct vhost_vdpa *v = &s->vhost_vdpa;
>>>>>
>>>>> +    if (v->feature_log) {
>>>>> +        add_migration_state_change_notifier(&s->migration_state);
>>>>> +    }
>>>>> +
>>>>>         if (v->shadow_vqs_enabled) {
>>>>>             v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
>>>>>                                                v->iova_range.last);
>>>>> @@ -280,6 +359,10 @@ static void vhost_vdpa_net_client_stop(NetClientState *nc)
>>>>>
>>>>>         assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>>>>>
>>>>> +    if (s->vhost_vdpa.index == 0 && s->vhost_vdpa.feature_log) {
>>>>> +        remove_migration_state_change_notifier(&s->migration_state);
>>>>> +    }
>>>>> +
>>>>>         dev = s->vhost_vdpa.dev;
>>>>>         if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
>>>>>             g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
>>>>> @@ -767,6 +850,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>>>>>         s->vhost_vdpa.device_fd = vdpa_device_fd;
>>>>>         s->vhost_vdpa.index = queue_pair_index;
>>>>>         s->always_svq = svq;
>>>>> +    s->migration_state.notify = vdpa_net_migration_state_notifier;
>>>>>         s->vhost_vdpa.shadow_vqs_enabled = svq;
>>>>>         s->vhost_vdpa.iova_range = iova_range;
>>>>>         s->vhost_vdpa.shadow_data = svq;


