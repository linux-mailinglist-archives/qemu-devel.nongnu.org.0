Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2563C57920C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 06:37:40 +0200 (CEST)
Received: from localhost ([::1]:43344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDezK-00024Z-Lt
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 00:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1oDewC-0007zj-0G; Tue, 19 Jul 2022 00:34:24 -0400
Received: from mga05.intel.com ([192.55.52.43]:32157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1oDew8-00062l-97; Tue, 19 Jul 2022 00:34:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658205260; x=1689741260;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hTHl66TFnbdvZXJvD2EAiHzbPrVAJ/bTjW9V8rnCPro=;
 b=CI8EvZNWXDPw3858+2JRunIgFNRSD71xqqjuZhAaHT12czKV8V2a9i4t
 pelEtLPnF06A8mjb9B8V0MV0VRb8dhewkvhjKmACNn+l4xhkHwM0rnkn0
 ckWlRWkY7WulFnFwWNStB4A1zbeNvFWFJc55uf4/drXfpGBc9/afMxCXd
 FheEI1zowDpEXDd19cTKLh2t8jAKYyZPnPK4/HAwT2WGYY/H3cqGJJ6Ak
 QE35BBOeZojtl3PYgOZMb2lGkpndYxgdZDTTjAKv2Qr1LTaqC9f0TyZkt
 os78HAkOH5HavYqWAs2949aCIVkiXhEkvU9jOIle9e4EoTTBreofvJlh6 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="372692631"
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; d="scan'208";a="372692631"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 21:34:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,282,1650956400"; d="scan'208";a="601447854"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga007.fm.intel.com with ESMTP; 18 Jul 2022 21:34:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 18 Jul 2022 21:34:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 18 Jul 2022 21:34:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 18 Jul 2022 21:34:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmlYcJ/ea93CUw6jWkuioO21e4yyBg99XnslIBxoEwqP+pjh6ysjuErxpOFWD5qwyF2XLeBSlowMCR8MAbDBC7AoksMynsQr9Nw6V8BZ/SHGauSBzwNp4GIs7vPupjGg/HrV0IoKOypHjwkbPYDZM29SID2kf5ArtqkeuS+6U7i3/cMOwP5Y1GqyJfsxVKD9SjnclpstTa4XuzWuisr/beWfs8+FHk6m/xksjck1t49FUOknT0VNqfjXDPKeIjL3oE0xacIVl1//JElFgYJZ6Vxpd3ifkMMXXS4kSkHTdI8obsG9CnGPhy0yxxHA1EL7PChiPSnQ+fom/d30Mr740g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+IoU6NriX5+zdS5obMFjlMAUsRbdnxhgP/x+W7kWIU=;
 b=hz9Sg6iWN/SS76+alGxBPJUznRP4ikiiojMYbaUNGRd/sQqSDWosvtYnxXC4067jK8Dnvk2TppEirje/zkgVNyxrV4ifqdaZrAOodWGqFiPkCDqrkcmGlB+sZ9StbtADuHIwCDR5H33V2mzJSfBAazdtPz9JRPLX6xvSYMfJ4Qzori07T8XSmWwe8BOVrdnGp2hOT3cgDsoPXb+4/MVcXZO3RYNzSKO/FSwM9z1WdgoApo87OW/NNziMiOdQXyygVVPOreDyxNOuTz12y8FC81dNHpiwTsbOEtO12MXAJkyWf3Cx3eL4fDUG+Xk+YVhjYTm48qTczqAlBHa0kHqmYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5469.namprd11.prod.outlook.com (2603:10b6:5:399::13)
 by SN6PR11MB3023.namprd11.prod.outlook.com (2603:10b6:805:d3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Tue, 19 Jul
 2022 04:34:09 +0000
Received: from DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::2475:12f6:2488:263d]) by DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::2475:12f6:2488:263d%8]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 04:34:09 +0000
Message-ID: <a7922177-4b0b-9f40-1d0b-4301b74bdf74@intel.com>
Date: Tue, 19 Jul 2022 12:33:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH 1/8] hmat acpi: Don't require initiator value in -numa
Content-Language: en-US
To: Brice Goglin <Brice.Goglin@inria.fr>, Hesham Almatary
 <hesham.almatary@huawei.com>, "jonathan.cameron@huawei.com"
 <jonathan.cameron@huawei.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "yangyicong@huawei.com" <yangyicong@huawei.com>,
 "chenxiang66@hisilicon.com" <chenxiang66@hisilicon.com>,
 "linuxarm@huawei.com" <linuxarm@huawei.com>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "peter.maydell@linaro.org" <peter.maydell@linaro.org>, 
 "imammedo@redhat.com" <imammedo@redhat.com>, "wangyanan55@huawei.com"
 <wangyanan55@huawei.com>, "marcel.apfelbaum@gmail.com"
 <marcel.apfelbaum@gmail.com>, "eduardo@habkost.net" <eduardo@habkost.net>,
 "mst@redhat.com" <mst@redhat.com>
References: <20220711104436.8363-1-hesham.almatary@huawei.com>
 <20220711104436.8363-2-hesham.almatary@huawei.com>
 <7781de83-9658-3002-6599-40979f93a456@intel.com>
 <6296f904-1d89-1ca8-0a7a-df302eac8ccf@inria.fr>
From: "Liu, Jingqi" <jingqi.liu@intel.com>
In-Reply-To: <6296f904-1d89-1ca8-0a7a-df302eac8ccf@inria.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0005.APCP153.PROD.OUTLOOK.COM (2603:1096::15) To
 DM4PR11MB5469.namprd11.prod.outlook.com (2603:10b6:5:399::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 79aa6dfc-0d1b-4fc3-294d-08da693fec37
X-MS-TrafficTypeDiagnostic: SN6PR11MB3023:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sMbkpn3FPVqLmalUc8tCDv69fFqNkOAwOKzqWTOv4Prn7uInB+JSx6RM81hiaFpUF6Gfpm4vaWXzYujVmzfXEZGvFIo1dm9LaUnRhXaWPV5TH6l7R0MjVU4sFEZ9BhtkUNzwePNuQSgGfMrpCkqUXsE3M2Eg0wAC5lItDQY1J2ECCV2JYjUabfIqR4vOJ2Xn2/bOlXjqhLcKoueSrrovtG+MhtQ7CNwlcGLRNqdmQCvI8/Lxkl+Elnl77Lo5rlJhuG4pdBb3oWudO+awx4bzjrnXhEVP/FiOIa4brWfFoGQUb17L43B5+ttgzA4naNYcKZ72TaBb4rXCDvC9yb6/C15Ps36cSt5OXgLcaSXa3Q13r2dPr+f/UepoxJQQ9xIGe1TLpHsd12PQmZOx2FTO4DitEleOjTzmgVX/rtDKebrmIcoAVr+pYOib8K1OKp+2HSKSRrVznJwP/dJbVBcjG8QmTepQxIYQ5ehzRXR4T9aFJmO/96FKVdETcibI6tipMNGDAl13v7oV8G19EYN2f6lfVxMhbIa1/yRwVRqec2GAgJk2V1Dr9Lls2sIJYUq/ROoe98Zg02Ru7I42KSZ86FvOBE8ivAHIkx5AJk7PzntqnwUmBlFncoHO60xAMSWg0DdWAeK0foy9aIKvD2AwhV7x6gKSO/gN0XZZkYHjfdXxq4/5niSdU1sMg2LzmpMWYHJ43CvFFIftqc0w/MQUiQJ3sHDy23jb0VR4Iv8UVWx3yJuS1+jccgaWouqy33xix/q0Y8H8vPHaphS4QjbPahcy3pJSxSfZ8LV0Fhp+m41zR0hDwSwEVKwbjFhwz/gM0c124pbxHHDGuWFjEK2PZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5469.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(136003)(39860400002)(376002)(366004)(346002)(2616005)(6512007)(5660300002)(86362001)(478600001)(6486002)(8936002)(41300700001)(6506007)(6666004)(53546011)(2906002)(26005)(31696002)(82960400001)(7416002)(36756003)(186003)(110136005)(83380400001)(66574015)(66556008)(66946007)(4326008)(316002)(66476007)(8676002)(31686004)(54906003)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWhDeE1kbTNHQ3kvV0FoK1pFWUV6RzZXVkJ4aGJvWnpwUmpIUVF4dmFTZXFl?=
 =?utf-8?B?L3dRSThIRFYvbmxXdGVuSHNMNW5FU2FQNU1TNVJYUm5pb2s0RSs3VklCUDdV?=
 =?utf-8?B?dWc4dlorbTRPZW9SYlB0K2lEZVA4N2IzQkp0ckNJd0JaK0pEVGVkZnB2ZjBF?=
 =?utf-8?B?eHFLRmF5ZVRSdXJZWGowelI1UjBNNlJMSFlTYlplSnRRVjFVSkh0RlFISTUr?=
 =?utf-8?B?Z3VHYks3dHJpTytuQ2l5NEdRVnlrblJMMXVKU3ZRTlBUR0hlR2swSGtHR1Vi?=
 =?utf-8?B?MnN1aE5iNjIzNmo0MXJlWDY3ZjJENnZxdzMra1Z1V0VqRG1tZWtGWVJ4YjQ0?=
 =?utf-8?B?YkJ5VXNCZk9rRXJTZzYzTm5EWkgvRFNVREhzWWJMQnJnNk90a3FtNmdTZTBs?=
 =?utf-8?B?YTZINWJlYzl3M25xZzZqS0FxRkJSN3dVQ24wNXBaRlhCMkJRYTZKZkhVUVRy?=
 =?utf-8?B?Uzd3WFd4T29EMUZBSHo3Q2dXdUxFQXVOVXJPL0N5TUQ5M3ZPQ2Vock12NHpH?=
 =?utf-8?B?OEtuVzZ2STQwZVVxWWJieXFTaGZSTmkwcFhqWU1Kb2VPbUJSUi85Yk42c3Ay?=
 =?utf-8?B?ak95cjlSL2I2OTkrTm5ZMVM0RjEvL3RLbE1ubWdveGo1NkJnY2NaTEFWanNw?=
 =?utf-8?B?cnYrYUhKMktBejEwNkIrOXdCa0pZMkVjeXpIWm91a2xzaVllbnhRYjZzSkJm?=
 =?utf-8?B?RllHNWtVMnV2dVhGZkVSMUl2MXNtS2ROVURtY2FBMkJxU0VYU3kzQ3Y1NFp4?=
 =?utf-8?B?Um5LbklvWDJUQ0t5R1h5TnBJaWNyTDU4YUxhWlpXYjVzNWlQU0MxTFl0OTBl?=
 =?utf-8?B?MHhuZkZYU1BOWjl3dWV0V0tRYUczTHM4WEt2SmJ6ZEQ5NXhVWnIzUXAxZVVH?=
 =?utf-8?B?dm9vU0FwVUFCdzRRc1hTSEZvT2pkNk5GdE54UWMySlg5cG9SL1RkT1FYUHc4?=
 =?utf-8?B?S2I5ZXRqc2RENHBSRytaOWxKbzR1M3lIbWo1MU1HVmxHbXVteDBDVmRpUTlN?=
 =?utf-8?B?QStWT0FkdmtYeWUyUGcyRXcxdzVxYU1GQXVZbnE5U3VsS29qQjBuVzRHNUNj?=
 =?utf-8?B?TGFaSEE5RU1EQTBVdVlOZGF3OGJ0eW1TTTY1L1FPS25KTnBYazVYbUovd0JT?=
 =?utf-8?B?aTQ1c0RPVllDQng5dnFLYWtOSUxZOGNUb0dlcHJEaGtjVHd4dTZEU2xpUkRI?=
 =?utf-8?B?c2VCK0NSSnZxdmp1SlhmKzNTdTN0c1NPY3hMS01IV1doSkdYTkpGZkJrVnM2?=
 =?utf-8?B?WmVPazBPcmxYUE9zczFCbEdKb0w1STdyWmFTZXRiZTlvRDZtOHZGQ3BkQkN0?=
 =?utf-8?B?aXVvUCtoTUhGU2ROOWZXOHZpWkw5MEtsQklsc3V6cVJVRG9FUWhQYTM2c1BB?=
 =?utf-8?B?b2RtdDk3dElYNWdERlY0ZGdZSVVZQ0x0dHZhSXovUXh1VmdKY3ErVytGKy94?=
 =?utf-8?B?Z0JRcitjeDJHQXlCM203eVdUeEVoQ0x6MjNDdkx5S29yTDZIWEREQU14Q0xT?=
 =?utf-8?B?Tk1RWW9PYzh4L2lDeUFIU2Y3dXNkYndZczJQNnM3ajQvNlRkU3U3dlJBZE1L?=
 =?utf-8?B?SnA4OEszRlNCZGNJWDlXaGRpbTU1RlBEVkZhM1dPbGJaMDJXYzRKRHFnamZY?=
 =?utf-8?B?NVVGWDRBVUlzbnZiT1Ywc1lkWWlNc2RxL0lybG8xVE1seGt6Z24xSEZmdTlO?=
 =?utf-8?B?SFpaYkF5bG1ETTROUXpJcVhQTTlDMVZaUVVlNHIyamJmZ0RPQkJJSFRZUEhl?=
 =?utf-8?B?ckx5Z0pLTEVtcUo2aGRwV3Z1YzZySDF0TnppemhzWDZTQ2ZsbkkzZ3FBSzQr?=
 =?utf-8?B?NG11QjdOYjdhdnpwZjQ5M2U4VlNuMDFHMzZrSWxnN25IS1ZyUytselNQZFU4?=
 =?utf-8?B?ZW1rVmVqcXg5ZjM1V0c2MlNGSDdoZWswOWRlWUJjWXNWVERLNVdjdVNvYkYx?=
 =?utf-8?B?OG1YclNrVUFxVXlqOHF1QkF4SDJRcTVuQldmUVRGVVVmUzZrbFlVSXgwWm1J?=
 =?utf-8?B?QldUSi9QdFYwRkF2TUExbTRaVGdxNklScXdGMi82NUtqK0htNWZzb1JDTG0x?=
 =?utf-8?B?Z0dGaDBoaCtpdTFveUF1d1pRZFRVQ2JPM2FFMWYwQmRBQWcwVUpXN2kwYkJT?=
 =?utf-8?Q?7ESTqvEoW9h2GGJ6w0b3TVENH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79aa6dfc-0d1b-4fc3-294d-08da693fec37
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5469.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 04:34:09.6521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XWzvtS9jDbZj6uEawzjnWjYiEyMSIOsCypS67Ha/enHTN5iBUgjKoUVf2eO3Y77lniNID4om07RRd07REt9vvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3023
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.43; envelope-from=jingqi.liu@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 7/18/2022 1:43 PM, Brice Goglin wrote:
>
> Le 18/07/2022 à 05:17, Liu, Jingqi a écrit :
>>
>> On 7/11/2022 6:44 PM, Hesham Almatary via wrote:
>>> From: Brice Goglin <Brice.Goglin@inria.fr>
>>>
>>> The "Memory Proximity Domain Attributes" structure of the ACPI HMAT
>>> has a "Processor Proximity Domain Valid" flag that is currently
>>> always set because Qemu -numa requires an initiator=X value
>>> when hmat=on. Unsetting this flag allows to create more complex
>>> memory topologies by having multiple best initiators for a single
>>> memory target.
>>
>> Do you mean the memory-only numa node requires an initiator=X value ?
>>
>> It would be better if you can explicitly provide cases in the 
>> description
>>
>> for creating more complex memory topologies without initiator=X.
>
>
> Hello
>
> I wrote this text so I am going to reply. All nodes currently require 
> an initiator= attribute. For CPU-node, that's usually OK. However it 
> forces all nodes to have a best initiator that is exactly one single 
> node. This prevents creating a topology where some memory has for best 
> initiator the sum of 2 nodes for instance. There's an example below in 
> the description. A real-world example would be a Xeon server with SNC 
> enabled: there are 2 DDR per socket, one per SNC, but a single NVDIMM 
> per socket covering both SNC. That NVDIMM node cannot have a single 
> initiator value since its best initiator is both SNC. That's similar 
> to the example below in the description

Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>

Got it. Thanks for your detailed example. It looks reasonable.

Jingqi

>
> Brice
>
>
>
>>
>> Thanks,
>>
>> Jingqi
>>
>>> This patch allows -numa without initiator=X when hmat=on by keeping
>>> the default value MAX_NODES in numa_state->nodes[i].initiator.
>>> All places reading numa_state->nodes[i].initiator already check
>>> whether it's different from MAX_NODES before using it.
>>>
>>> Tested with
>>> qemu-system-x86_64 -accel kvm \
>>>   -machine pc,hmat=on \
>>>   -drive if=pflash,format=raw,file=./OVMF.fd \
>>>   -drive media=disk,format=qcow2,file=efi.qcow2 \
>>>   -smp 4 \
>>>   -m 3G \
>>>   -object memory-backend-ram,size=1G,id=ram0 \
>>>   -object memory-backend-ram,size=1G,id=ram1 \
>>>   -object memory-backend-ram,size=1G,id=ram2 \
>>>   -numa node,nodeid=0,memdev=ram0,cpus=0-1 \
>>>   -numa node,nodeid=1,memdev=ram1,cpus=2-3 \
>>>   -numa node,nodeid=2,memdev=ram2 \
>>>   -numa 
>>> hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=10 
>>> \
>>>   -numa 
>>> hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=10485760 
>>> \
>>>   -numa 
>>> hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=20 
>>> \
>>>   -numa 
>>> hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=5242880 
>>> \
>>>   -numa 
>>> hmat-lb,initiator=0,target=2,hierarchy=memory,data-type=access-latency,latency=30 
>>> \
>>>   -numa 
>>> hmat-lb,initiator=0,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=1048576 
>>> \
>>>   -numa 
>>> hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-latency,latency=20 
>>> \
>>>   -numa 
>>> hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=5242880 
>>> \
>>>   -numa 
>>> hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-latency,latency=10 
>>> \
>>>   -numa 
>>> hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=10485760 
>>> \
>>>   -numa 
>>> hmat-lb,initiator=1,target=2,hierarchy=memory,data-type=access-latency,latency=30 
>>> \
>>>   -numa 
>>> hmat-lb,initiator=1,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=1048576
>>> which reports NUMA node2 at same distance from both node0 and node1 
>>> as seen in lstopo:
>>> Machine (2966MB total) + Package P#0
>>>    NUMANode P#2 (979MB)
>>>    Group0
>>>      NUMANode P#0 (980MB)
>>>      Core P#0 + PU P#0
>>>      Core P#1 + PU P#1
>>>    Group0
>>>      NUMANode P#1 (1007MB)
>>>      Core P#2 + PU P#2
>>>      Core P#3 + PU P#3
>>>
>>> Before this patch, we had to add ",initiator=X" to "-numa 
>>> node,nodeid=2,memdev=ram2".
>>> The lstopo output difference between initiator=1 and no initiator is:
>>> @@ -1,10 +1,10 @@
>>>   Machine (2966MB total) + Package P#0
>>> +  NUMANode P#2 (979MB)
>>>     Group0
>>>       NUMANode P#0 (980MB)
>>>       Core P#0 + PU P#0
>>>       Core P#1 + PU P#1
>>>     Group0
>>>       NUMANode P#1 (1007MB)
>>> -    NUMANode P#2 (979MB)
>>>       Core P#2 + PU P#2
>>>       Core P#3 + PU P#3
>>>
>>> Corresponding changes in the HMAT MPDA structure:
>>> @@ -49,10 +49,10 @@
>>>   [078h 0120   2]               Structure Type : 0000 [Memory 
>>> Proximity Domain Attributes]
>>>   [07Ah 0122   2]                     Reserved : 0000
>>>   [07Ch 0124   4]                       Length : 00000028
>>> -[080h 0128   2]        Flags (decoded below) : 0001
>>> -            Processor Proximity Domain Valid : 1
>>> +[080h 0128   2]        Flags (decoded below) : 0000
>>> +            Processor Proximity Domain Valid : 0
>>>   [082h 0130   2]                    Reserved1 : 0000
>>> -[084h 0132   4] Attached Initiator Proximity Domain : 00000001
>>> +[084h 0132   4] Attached Initiator Proximity Domain : 00000080
>>>   [088h 0136   4]      Memory Proximity Domain : 00000002
>>>   [08Ch 0140   4]                    Reserved2 : 00000000
>>>   [090h 0144   8]                    Reserved3 : 0000000000000000
>>>
>>> Final HMAT SLLB structures:
>>> [0A0h 0160   2]               Structure Type : 0001 [System Locality 
>>> Latency and Bandwidth Information]
>>> [0A2h 0162   2]                     Reserved : 0000
>>> [0A4h 0164   4]                       Length : 00000040
>>> [0A8h 0168   1]        Flags (decoded below) : 00
>>>                              Memory Hierarchy : 0
>>> [0A9h 0169   1]                    Data Type : 00
>>> [0AAh 0170   2]                    Reserved1 : 0000
>>> [0ACh 0172   4] Initiator Proximity Domains # : 00000002
>>> [0B0h 0176   4]   Target Proximity Domains # : 00000003
>>> [0B4h 0180   4]                    Reserved2 : 00000000
>>> [0B8h 0184   8]              Entry Base Unit : 0000000000002710
>>> [0C0h 0192   4] Initiator Proximity Domain List : 00000000
>>> [0C4h 0196   4] Initiator Proximity Domain List : 00000001
>>> [0C8h 0200   4] Target Proximity Domain List : 00000000
>>> [0CCh 0204   4] Target Proximity Domain List : 00000001
>>> [0D0h 0208   4] Target Proximity Domain List : 00000002
>>> [0D4h 0212   2]                        Entry : 0001
>>> [0D6h 0214   2]                        Entry : 0002
>>> [0D8h 0216   2]                        Entry : 0003
>>> [0DAh 0218   2]                        Entry : 0002
>>> [0DCh 0220   2]                        Entry : 0001
>>> [0DEh 0222   2]                        Entry : 0003
>>>
>>> [0E0h 0224   2]               Structure Type : 0001 [System Locality 
>>> Latency and Bandwidth Information]
>>> [0E2h 0226   2]                     Reserved : 0000
>>> [0E4h 0228   4]                       Length : 00000040
>>> [0E8h 0232   1]        Flags (decoded below) : 00
>>>                              Memory Hierarchy : 0
>>> [0E9h 0233   1]                    Data Type : 03
>>> [0EAh 0234   2]                    Reserved1 : 0000
>>> [0ECh 0236   4] Initiator Proximity Domains # : 00000002
>>> [0F0h 0240   4]   Target Proximity Domains # : 00000003
>>> [0F4h 0244   4]                    Reserved2 : 00000000
>>> [0F8h 0248   8]              Entry Base Unit : 0000000000000001
>>> [100h 0256   4] Initiator Proximity Domain List : 00000000
>>> [104h 0260   4] Initiator Proximity Domain List : 00000001
>>> [108h 0264   4] Target Proximity Domain List : 00000000
>>> [10Ch 0268   4] Target Proximity Domain List : 00000001
>>> [110h 0272   4] Target Proximity Domain List : 00000002
>>> [114h 0276   2]                        Entry : 000A
>>> [116h 0278   2]                        Entry : 0005
>>> [118h 0280   2]                        Entry : 0001
>>> [11Ah 0282   2]                        Entry : 0005
>>> [11Ch 0284   2]                        Entry : 000A
>>> [11Eh 0286   2]                        Entry : 0001
>>>
>>> Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
>>> ---
>>>   hw/core/machine.c | 4 +---
>>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>>
>>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>>> index a673302cce..d4d7e77401 100644
>>> --- a/hw/core/machine.c
>>> +++ b/hw/core/machine.c
>>> @@ -1173,9 +1173,7 @@ static void numa_validate_initiator(NumaState 
>>> *numa_state)
>>>         for (i = 0; i < numa_state->num_nodes; i++) {
>>>           if (numa_info[i].initiator == MAX_NODES) {
>>> -            error_report("The initiator of NUMA node %d is missing, 
>>> use "
>>> -                         "'-numa node,initiator' option to declare 
>>> it", i);
>>> -            exit(1);
>>> +            continue;
>>>           }
>>>             if (!numa_info[numa_info[i].initiator].present) {

