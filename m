Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 761293124B8
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 15:39:23 +0100 (CET)
Received: from localhost ([::1]:46320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8lDe-0000Ie-H0
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 09:39:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tashen@ebay.com>) id 1l8fk7-0004x2-By
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 03:48:31 -0500
Received: from esa5.hc2186-20.iphmx.com ([68.232.131.185]:59585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tashen@ebay.com>) id 1l8fk3-0000v3-H4
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 03:48:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=ebay.com; i=@ebay.com; q=dns/txt; s=ebaycorp;
 t=1612687708; x=1644223708;
 h=from:to:subject:date:message-id:mime-version;
 bh=wLxgtPWWhJdRpQ4uXeETD6Wxc4v04i+yrVMTJjPDdb4=;
 b=ueF4O7M3gRz+1nS3kurKzUY4eJhAp+7iTyTVPeXzvzov2ouNlAVGKNCF
 9i62aeQV3orNDnZ+1UNXOvC5QVuaaDQ2KXzkEHifmho0ADm63Y1ttbbr3
 tdl/B/153OtsXp/giHsjLalCAHunqJ273O2V9GukcHU7LFvdIlkfmG0fM s=;
X-IronPort-RemoteIP: 216.113.162.88
X-IronPort-MID: 117666525
X-IronPort-Reputation: 5.2
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: Vontu_to_CES_Outbound
X-IronPort-MailFlowPolicy: $Vontu_to_CES_Outbound
X-EBay-Corp: Yes
X-IPAS-Result: =?us-ascii?q?A2AFAQCNqB9gmFiicdhJGRwBAQEBAQEHAQESAQEEBAEBg?=
 =?us-ascii?q?g+BIzBRfYFLhDdSgnYDhTmIMyWBCIJ5mEgLAQEBAQEBAQEBCAEtAgQBAYRkg?=
 =?us-ascii?q?WomOBMCAwEBAQMCAwEBAQEGAQEBAQEGBAETAQEBAQEBAQGGNwyCOCKDLwERa?=
 =?us-ascii?q?AFKAgQwJwQ1gwQBgX6BBwEBmEsBAYZgAYEoEQEsAiMBQAEBCxsBbIoIgTKFW?=
 =?us-ascii?q?YMxA4FUgTiGfgGCUIQ1gUI+gREnDBCCIYhKNIIsBIFVLIEuE1+BPWmQPIM4h?=
 =?us-ascii?q?z4tgw6aUgqCepwDAx+jIpQyoXYCBAIEBQIOAQEGgW2BenAVZQGCP08XAg2OL?=
 =?us-ascii?q?Q4JjieBKwIGCgEBAwl8iggBMWIBAQ?=
IronPort-PHdr: =?us-ascii?q?9a23=3AonOuSx2EAeC8ZIoTsmDT+DRfVm0co7zxezQtwd?=
 =?us-ascii?q?8ZseMVLvad9pjvdHbS+e9qxAeQG9mCurQY2qGJ6OjJYi8p2d65qncMcZhBBV?=
 =?us-ascii?q?cuqP49uEgeOvODElDxN/XwbiY3T4xoXV5h+GynYwAOQJ6tL1LdrWev4jEMBx?=
 =?us-ascii?q?7xKRR6JvjvGo7Vks+7y/2+94fcbglVgDexe7x/IRG5oQjTuMQdnJdvJLs2xh?=
 =?us-ascii?q?bVuHVDZv5YxXlvJVKdnhb84tm/8Zt++ClOuPwv6tBNX7zic6s3UbJXAjImM3?=
 =?us-ascii?q?so5MLwrhnMURGP5noHXWoIlBdDHhXI4wv7Xpf1tSv6q/Z91SyHNsD4Ubw4RT?=
 =?us-ascii?q?Kv5LptRRT1iikIKiQ5/XnXhMJukaxbvByvqR9xzI7VfI6aO+FzcbnBcdMfX2?=
 =?us-ascii?q?dNQtxcWi5HD4ihb4UPFe0BPeNAooXzulUOrQWxBQ+0COjy1DFHnHj20aMn2O?=
 =?us-ascii?q?kmDQHJxhcgH9IQv3TSt9j6KrwdXvq1zaXS0TrDaPZW1C775YPVfR8vveuCUq?=
 =?us-ascii?q?hsccrN10YvDQXFg02epIHrIz+Y1usAvmaV4uRgVeyhhHIrpx1+rzWvx8oihI?=
 =?us-ascii?q?bEiIwaxF3H9St0wII4KN62RkJmf9KqH5Rduz+GO4V2RM4pXm9muCE/yrIcuJ?=
 =?us-ascii?q?67ejAHx4o8yBHFa/2LaZSH4hXmVOuXPDx2h2pldaqhixqv8EWs0PDwWtS63V?=
 =?us-ascii?q?pQsyZIk8fAumoO2hHQ8sSLV/hw8lu71TqS1Q3e6vtILV4pmabFMZIt3LE9m5?=
 =?us-ascii?q?sLvUjdHyL6hEv7gaqLekk44eel6uHqb7Xjq5KTLYB5jwTzProylsG5HO82KB?=
 =?us-ascii?q?IBX3KB9uS5zLDj+Er5T6hUgfAuianZtYzaJdwcpq6kHw9ZyoYj5Ai7DzehyN?=
 =?us-ascii?q?kYmWcHLElcdBKGl4jmIU3OIPf9Dfumn1igjDlmy+raMb3mGJXNNmLPn6n6cr?=
 =?us-ascii?q?ln609Q0hY8zdda555MC7EBJuz8WlPpudDGExM0Mha4z/v6BNhzzI8SRGOCDr?=
 =?us-ascii?q?GDPK7RslKE/ucvLPONZI8Rtjb9Mf8l5/v2gH8lg1AdZqmp0oURaH2jAPtpOF?=
 =?us-ascii?q?+WYHr2jtgdFmcKuxIyTPb2h12aTT5Te3GyUrol5j4lDYKmEJ7PSZ2zj7yfwi?=
 =?us-ascii?q?i7GoZbZmZBClCKHnfocZiEV+0LaCKILc8y2gADAPK4Roo8kB2jqgL+47xgKO?=
 =?us-ascii?q?XS52sfr52pnIxs6ujO0B0/6zFwJ8Ka1W6LUidzhGxeFBEs26Uq63d9x1HHmZ?=
 =?us-ascii?q?RxhLYQQcBa/PNEVC83P5fNied9DoahCUr6Yt6VRQP+EZ2dCjYrQ4dpmYVcal?=
 =?us-ascii?q?thG9ikkhHI1jarBLlQjbGQGZgo6fuFgir3IMByzWuA07Mu3BEqQcpKYGuhgK?=
 =?us-ascii?q?M3tw3eHJXAnEjRkaG2Pb8d0yjA+CbmryKOsUhUXRQ2XfDDWnYSNU3Rq9v/+w?=
 =?us-ascii?q?XFVbD9QbgiOxFKnMiFLKYCY9b1jFJAEfHkPtmWY2+4l2qqQxiSwbbZYYDjai?=
 =?us-ascii?q?MW2yCOBQ=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.81,159,1610438400"; 
 d="scan'208,217";a="117666525"
Received: from lvs-dlpoutbound.corp.ebay.com (HELO
 lvs-ipatom-003.corp.ebay.com) ([216.113.162.88])
 by esa5.hc2186-20.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 00:48:24 -0800
X-ATOM: Processed_By_ATOM
Received: from mail-dm6nam08lp2046.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.46])
 by atom.corp.ebay.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 00:48:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DtjE5Nv5ApiCE5wmwFuR780drynvaMIS9D1SY+aFAH5lA7BluuK7GMRfmy1AGnJHurzrQ9LHHnwMADh6n1h/i3ZTo0DpdG/S05XbiblG7z3qKNr45+rLhGHNO0SesjlW4uCMj8BL8KLkUcbhJnL28yqvjV+YXPOwrEPDFDhpGr8vgFmxWdzB5fqnwPdloh+yA3hqZ494wYuNX2NAbICuywL9Nhn8LrqfQbl3xXoDI3LMG36FDe/55sxPqYRFYXz791lkpeafIg+FDvooBClbyKL3ti2/J0wgGAFn1BWh608UuRJXg8A2LN6ZTWihFdKSow2xlKJkl75yCQMr+6hWFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLxgtPWWhJdRpQ4uXeETD6Wxc4v04i+yrVMTJjPDdb4=;
 b=S8A0ZVD1Z1r8jRd2eneHMpuLojKEdSQM3aj8XuRyOK7/3rLXbU37x/g5BHbiNvfjboHIy8Co02XJOrWRwQpZIUId1zO8bOxELUnhQUR09U3K3V5gjRi6oGY0VlmSY4p+CDYUBgr7Sb3FCTjhd6DQHrGcqUpzXgF76d2JDYmDE6tU4Vaw/3XL4f+YCCNQ+qzHlTWFU8Fkd1JhqQ4QJj0AaIvxliNGYJ4CDo1Uua4c6o6Hy513A4peD9hii09ap/rtlGgKxLu+6/wLbdxPKJl0lx7OjwzGo3EeUmq8PQWWS/Cq/Fo+xfAOSnp/evXgOzo7416FJyL1x0KrhQw7p+lX9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebay.com; dmarc=pass action=none header.from=ebay.com;
 dkim=pass header.d=ebay.com; arc=none
Received: from DM6PR07MB5324.namprd07.prod.outlook.com (2603:10b6:5:4a::20) by
 DM6PR07MB6041.namprd07.prod.outlook.com (2603:10b6:5:15e::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.30; Sun, 7 Feb 2021 08:48:20 +0000
Received: from DM6PR07MB5324.namprd07.prod.outlook.com
 ([fe80::e86e:fc8:d666:ae3e]) by DM6PR07MB5324.namprd07.prod.outlook.com
 ([fe80::e86e:fc8:d666:ae3e%7]) with mapi id 15.20.3825.020; Sun, 7 Feb 2021
 08:48:20 +0000
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: A issue about qemu for rbd attach
Thread-Topic: A issue about qemu for rbd attach
Thread-Index: AQHW/S38hhtdl8wrcUis7Lc70gGi1w==
Date: Sun, 7 Feb 2021 08:48:19 +0000
Message-ID: <D3D9D656-4054-4207-8370-2BD8387C4FF4@ebay.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.45.21011103
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=ebay.com;
x-originating-ip: [180.175.212.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 64e1a1ac-5b64-487c-8940-08d8cb451eb1
x-ms-traffictypediagnostic: DM6PR07MB6041:
x-microsoft-antispam-prvs: <DM6PR07MB6041625272BB11BC6E421A40AFB09@DM6PR07MB6041.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /DOAczBVbSlpIPl1CBIMk2glv/jbFGUAm2iiJDvXFEKJ8jmVzaaAYZ5IGz7yP/THzcPYwN7zZpbahhF91vPPYH5t3hFYE9ii5mtQ+8pelzbzrFy/CyuvXvAw5rMgwm7Jsdje06gW3kIlptdZDnWvFgKS8Zl53XJkdOkkDDVxiYYTZmY88LuNOnYqzLjsvOLU2TmA62KJixjDgw50s4T2qo3J2ZQ1CYjJPfpPY5E7wQSUJOawTBljqHdE2kcOe8j5J6pxhZq1yZNFNDmQEe30RMooXGRk5KgQtXI2Xv+uZGCq2BIF7qniGPtLifdJ/30Tr9txw9U2eiM4SkHj6FIt6hedG9ENIMiA9FlOqoTVJmHKn0yGIQjlTfcAql0PvHUItFy2WoCujQWe1bhKaeVJeZ7Gss5RQUUJXRDFZbqK/rYJBQ9NE4Of7wmGhYGgVACA532laIEWGLvDb51gXC2AoNuxL8H6xoHTwVZ7dsjkohNzds0Xwf2nchy3Te02u5F9vxt0Rbmc6TuClEtSqTke9EEaL8Y2JxJzGGHefwNIUNidDkBOf4hZNSMgc7Zo+MnWW5agpToC+GOkLt+INQx49A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR07MB5324.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(6506007)(33656002)(26005)(5660300002)(316002)(36756003)(186003)(6512007)(86362001)(6486002)(71200400001)(2616005)(64756008)(66556008)(66476007)(66946007)(6916009)(10290500003)(66446008)(478600001)(8936002)(2906002)(8676002)(76116006)(91956017)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?SDArUk56amdLdkE1T0dtU0VNTVhaY2NKajVxdStvYVR0YjZTdEJyNFdTRWln?=
 =?utf-8?B?YjJpZDd0bTc4UDZvbCtnNkk5ZDBCdWNYNlRwL2VMem1icXRweXpOcnhwTUlv?=
 =?utf-8?B?R2x4TzljQ0xpTk05RHM0RGhXVGgzRy9rNnFucVV3ZkZyTEZmVEc0K2xEQk1W?=
 =?utf-8?B?L3NHZFdmYXllclZudHBvSmRMOU03aDIyM3kxNCtKUUI1VU0rWS9GNFo0Rjhu?=
 =?utf-8?B?ZVUyRU5BUDV4aFhoUlY3N0x3NmV0RTJ1TUl1V3NQWFVYYzQ3ZTYrdks4SGlC?=
 =?utf-8?B?d21TUkNKUk9aallBQy9ydlVmR1JUb3JDa0VBSmcyREZlY1preUtCbVorRVZs?=
 =?utf-8?B?TFd4Z2phVFJYKzhRZDlVcllZQVB4ZjBQSEN5UXJBMUV5amZlYWY4R0lyZWxw?=
 =?utf-8?B?OEsxSS9PbmxhRjQzODhGRnc1Q2JhOU8xalV6Snhra0NYb0hCYURML2MreFU3?=
 =?utf-8?B?ckZaQWxZT3FrRWNMempLdnBCVW5OTnBPZmV0NDFneC9KVzZBTzkyMjNvMTVI?=
 =?utf-8?B?RjB0RFJpZGcyOUIrSVMxM1BWU2VXZTFVUCt0dWlabEdEbmtYK0RWaU1zZEFa?=
 =?utf-8?B?b2NGVWtQY1BZNVZSODJzRERNRG9TdlVoWGNiVjJydTU3VlNOaWhPQmtYYkty?=
 =?utf-8?B?ZDRBWjNrY1Q2a3lZYnd1a1lQbTlLa3lVbFh4UVpHU012QXIxbHhiSEJ5OElY?=
 =?utf-8?B?OHdjWVl1VDUyUi9UQ0toamI1b09VNzQzMFlxOUJnKzhHQnQvSXMyUlg1SUdS?=
 =?utf-8?B?RE10VlEwNXg0eTRTYm0wZngwd1daRnMrL1k0NjZEb1VMM2ViRTFKM3M2RVYv?=
 =?utf-8?B?cnRBNFBYQ2RiZVhESVg3OHZ2Z3pneElPSkxjSzBYNkRFRGJ3MEhuNllqNFpT?=
 =?utf-8?B?K2EvaW15b09uTGprbE83SHpDN0Z6d29OOW1qTXdPSGEybU1VOXlQYTVFSnBk?=
 =?utf-8?B?QTZEcXNlQy9FR1NGVGVTSUF3NUFlcW5yYnVLM2g4eGE5Yk1PSXRQQXZRVjc3?=
 =?utf-8?B?aDlLeUhRRnk4Z1ovcmZLTjlaYUxjalZCV0RuNUlCRFR4Z2ZQYkVVZkJwV2h0?=
 =?utf-8?B?YjZvbThoVG5xVU5mc294dzYrdkV2VkdlLzB5cFRvMlBVYmhKVWN4Kys5V3Bl?=
 =?utf-8?B?VHRRMFl3RTFBa2NYcDdtNmpQTllCWlNQb2M0bzJ1cEMvd253bXJoRlJDQ1B2?=
 =?utf-8?B?Q1ZuUXNXeTVmUkFpMUFneUdySHNjRkdvZHA0MnFuOEFwTUVORkFUMUZvUmN3?=
 =?utf-8?B?STVvalEzdEZvUlNhYUNxR3phQnZ4RGFkV2hwMkMxUU9sN2NxY3RENVFIa1kr?=
 =?utf-8?B?Mk0ydDV5ajl0M0orTSt2VkV1V3llRnF6cFd5MzN2NzYyRjMyckcrOWlOOFNu?=
 =?utf-8?B?UFNWaTJtQTRBMllaL3IrSGpjTTRhS0dRWDFEMFRVSGdGTm5jdmROTU1yRlU4?=
 =?utf-8?B?bHBiRDhETDVDVkQ4SVQwK0RyTmpEOXJZdUplenBoR05LeWpSVmp0U0Z6RjJR?=
 =?utf-8?B?dUp6YnE5T1FXRVAwaXZIVVBrSmJ3NG56YmJ0NmxjaWlHZXpiNCtCU0M3a0R5?=
 =?utf-8?B?UnpCakswenUvQ0tySXpHVFFsajRneFhmaXZ4d2NheFBmOE4zek9YYVhtRTFp?=
 =?utf-8?B?N2drWWdSUDZWalVzSUFUcG5oRmlDSjJnUWVKSFVlZWdOanV0U1ppaURGeGpY?=
 =?utf-8?B?WVUxa1Z2RFdhdHM0WDNzamVFWVRnRFhrM1Z5ZGFmcjBjZkUzaytSUlJWb0tG?=
 =?utf-8?B?TmJveWxYTnJIODRoTE5WekRBMmwwdGtKR21YcHZlRlo0eHBId2tEeHZtdEwx?=
 =?utf-8?B?MTFMRWRTSkxNZVp1dUdkdz09?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_D3D9D6564054420783702BD8387C4FF4ebaycom_"
MIME-Version: 1.0
X-OriginatorOrg: ebay.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR07MB5324.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e1a1ac-5b64-487c-8940-08d8cb451eb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2021 08:48:20.0129 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46326bff-9928-41a0-baca-17c16c94ea99
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /XGLA0Fz7X3oQd4XpnY0zCXZjQcL4CGo+m7BaFBuTbvjTrN8fqsaoZoAaovc0zGI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6041
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=68.232.131.185; envelope-from=tashen@ebay.com;
 helo=esa5.hc2186-20.iphmx.com
X-Spam_score_int: -202
X-Spam_score: -20.3
X-Spam_bar: --------------------
X-Spam_report: (-20.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.353,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 07 Feb 2021 09:37:45 -0500
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  "Shen, Tao" <tashen@ebay.com>
From:  "Shen, Tao" via <qemu-devel@nongnu.org>

--_000_D3D9D6564054420783702BD8387C4FF4ebaycom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgcWVtdSBkZXZlbG9wZXIsDQpJIGhhdmUgYSBxdWVzdGlvbiB0aGF0IGRvZXMgcXVtZSBzdXBw
b3J0IGNuYW1lIGFzIGhvc3QgdG8gYXR0YWNoIHJiZCBkZXZpY2U/DQpXaGVuIEkgd2FudCB0byBk
byB0aGF0LCBpdCByZXR1cm4gYSBlcnJvcjoNCi8jIHZpcnNoIGF0dGFjaC1kZXZpY2UgdmlydGxl
dC0yMjhmYTBhYy1kNTNhLXRlc3Mtbm9kZS1jN253dyBkaXNrX3ZkZS55YW1sDQplcnJvcjogRmFp
bGVkIHRvIGF0dGFjaCBkZXZpY2UgZnJvbSBkaXNrX3ZkZS55YW1sDQplcnJvcjogaW50ZXJuYWwg
ZXJyb3I6IHVuYWJsZSB0byBleGVjdXRlIFFFTVUgY29tbWFuZCAnZGV2aWNlX2FkZCc6IFByb3Bl
cnR5ICd2aXJ0aW8tYmxrLWRldmljZS5kcml2ZScgY2FuJ3QgZmluZCB2YWx1ZSAnZHJpdmUtdmly
dGlvLWRpc2syMCcNCg0KLyMgY2F0IGRpc2tfdmRlLnlhbWwNCjxkaXNrIHR5cGU9J25ldHdvcmsn
IGRldmljZT0nZGlzayc+DQogIDxkcml2ZXIgbmFtZT0ncWVtdScgdHlwZT0ncmF3JyBjYWNoZT0n
bm9uZScgaW89J25hdGl2ZScvPg0KICA8YXV0aCB1c2VybmFtZT0nY2luZGVyJz4NCiAgICA8c2Vj
cmV0IHR5cGU9J2NlcGgnIHV1aWQ9J2M1ZWY5MjA2LWM0MGEtNGIwNC03YmQ5LWI3NmYzNGIwMTAz
YScvPg0KICA8L2F1dGg+DQogIDxzb3VyY2UgcHJvdG9jb2w9J3JiZCcgbmFtZT0ndm9sdW1lcy92
b2x1bWUtNGQ2ZWQ5MjItNTdjMS00ZDFlLThlZWItMWQwMGQ0MTg0YmMwJz4NCiAgICA8aG9zdCBu
YW1lPSdsdnMwMmNlcGhtb24wMS5zZHMuZWJheS5jb20nIHBvcnQ9JzY3ODknLz4NCiAgICA8aG9z
dCBuYW1lPSdsdnMwMmNlcGhtb24wMi5zZHMuZWJheS5jb20nIHBvcnQ9JzY3ODknLz4NCiAgICA8
aG9zdCBuYW1lPSdsdnMwMmNlcGhtb24wMy5zZHMuZWJheS5jb20nIHBvcnQ9JzY3ODknLz4NCiAg
ICA8aG9zdCBuYW1lPSdsdnMwMmNlcGhtb24wNC5zZHMuZWJheS5jb20nIHBvcnQ9JzY3ODknLz4N
CiAgICA8aG9zdCBuYW1lPSdsdnMwMmNlcGhtb24wNS5zZHMuZWJheS5jb20nIHBvcnQ9JzY3ODkn
Lz4NCiAgPC9zb3VyY2U+DQogIDx0YXJnZXQgZGV2PSd2ZHUnIGJ1cz0ndmlydGlvJy8+DQogIDxp
b3R1bmU+DQogICAgPHRvdGFsX2J5dGVzX3NlYz4xNTcyODY0MDA8L3RvdGFsX2J5dGVzX3NlYz4N
CiAgICA8dG90YWxfaW9wc19zZWM+MzAwPC90b3RhbF9pb3BzX3NlYz4NCiAgPC9pb3R1bmU+DQog
IDxzZXJpYWw+cHZjLWNmMzg3MDFkLTZmNmYtNDYzOC05NmM1LTVjZmJlMTZkNjA2ODwvc2VyaWFs
Pg0KICA8YWRkcmVzcyB0eXBlPSdwY2knIGRvbWFpbj0nMHgwMDAwJyBidXM9JzB4MDAnIHNsb3Q9
JzB4MTgnIGZ1bmN0aW9uPScweDAnLz4NCjwvZGlzaz4NCkNvdWxkIHlvdSB0ZWxsIG1lIHdoZXRo
ZXIgcWVtdSBzdXBvb3J0IHRoaXM/IElmIHllcywgd2hpY2ggdmVyc2lvbj8gSUYgbm8sIGRvIHlv
dSBhbnkgcGxhbiBmb3IgdGhpcz8NCg0KVGhhbmtzLA0KVGFvDQo=

--_000_D3D9D6564054420783702BD8387C4FF4ebaycom_
Content-Type: text/html; charset="utf-8"
Content-ID: <241E2998F751874EB12C9D213647B902@namprd07.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6RGVuZ1hpYW47DQoJcGFub3NlLTE6
MiAxIDYgMCAzIDEgMSAxIDEgMTt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7
DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZh
bWlseToiXEBEZW5nWGlhbiI7DQoJcGFub3NlLTE6MiAxIDYgMCAzIDEgMSAxIDEgMTt9DQovKiBT
dHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05v
cm1hbA0KCXttYXJnaW46MGNtOw0KCWZvbnQtc2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IkNh
bGlicmkiLHNhbnMtc2VyaWY7fQ0KcHJlDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgltc28t
c3R5bGUtbGluazoiSFRNTCBQcmVmb3JtYXR0ZWQgQ2hhciI7DQoJbWFyZ2luOjBjbTsNCgltYXJn
aW4tYm90dG9tOi4wMDAxcHQ7DQoJZm9udC1zaXplOjEwLjBwdDsNCglmb250LWZhbWlseToiQ291
cmllciBOZXciO30NCnNwYW4uRW1haWxTdHlsZTE3DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFs
LWNvbXBvc2U7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7DQoJY29sb3I6d2lu
ZG93dGV4dDt9DQpzcGFuLkhUTUxQcmVmb3JtYXR0ZWRDaGFyDQoJe21zby1zdHlsZS1uYW1lOiJI
VE1MIFByZWZvcm1hdHRlZCBDaGFyIjsNCgltc28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJbXNvLXN0
eWxlLWxpbms6IkhUTUwgUHJlZm9ybWF0dGVkIjsNCglmb250LWZhbWlseToiQ291cmllciBOZXci
O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5Ow0KCWZvbnQt
c2l6ZToxMi4wcHQ7DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMtc2VyaWY7fQ0KQHBhZ2Ug
V29yZFNlY3Rpb24xDQoJe3NpemU6NjEyLjBwdCA3OTIuMHB0Ow0KCW1hcmdpbjo3Mi4wcHQgNzIu
MHB0IDcyLjBwdCA3Mi4wcHQ7fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9u
MTt9DQotLT48L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iZW4tQ04iIGxpbms9IiMwNTYz
QzEiIHZsaW5rPSIjOTU0RjcyIiBzdHlsZT0id29yZC13cmFwOmJyZWFrLXdvcmQiPg0KPGRpdiBj
bGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJm
b250LXNpemU6MTEuMHB0Ij5IaSBxZW11IGRldmVsb3Blciw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+
DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SSBo
YXZlIGEgcXVlc3Rpb24gdGhhdCBkb2VzIHF1bWUgc3VwcG9ydCBjbmFtZSBhcyBob3N0IHRvIGF0
dGFjaCByYmQgZGV2aWNlPzxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5XaGVuIEkgd2FudCB0byBkbyB0aGF0
LCBpdCByZXR1cm4gYSBlcnJvcjo8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIiBzdHlsZT0ibXNvLW1hcmdpbi10b3AtYWx0OjMuMHB0O21hcmdpbi1yaWdodDowY207
bWFyZ2luLWJvdHRvbTozLjBwdDttYXJnaW4tbGVmdDowY20iPg0KPHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZTo5LjBwdDtmb250LWZhbWlseTomcXVvdDtDb3VyaWVyIE5ldyZxdW90Oztjb2xvcjojMUQx
QzFEIj4vIyB2aXJzaCBhdHRhY2gtZGV2aWNlIHZpcnRsZXQtMjI4ZmEwYWMtZDUzYS10ZXNzLW5v
ZGUtYzdud3cgZGlza192ZGUueWFtbDxicj4NCmVycm9yOiBGYWlsZWQgdG8gYXR0YWNoIGRldmlj
ZSBmcm9tIGRpc2tfdmRlLnlhbWw8YnI+DQplcnJvcjogaW50ZXJuYWwgZXJyb3I6IHVuYWJsZSB0
byBleGVjdXRlIFFFTVUgY29tbWFuZCAnZGV2aWNlX2FkZCc6IFByb3BlcnR5ICd2aXJ0aW8tYmxr
LWRldmljZS5kcml2ZScgY2FuJ3QgZmluZCB2YWx1ZSAnZHJpdmUtdmlydGlvLWRpc2syMCc8bzpw
PjwvbzpwPjwvc3Bhbj48L3A+DQo8cHJlIHN0eWxlPSJtc28tbWFyZ2luLXRvcC1hbHQ6My4wcHQ7
bWFyZ2luLXJpZ2h0OjBjbTttYXJnaW4tYm90dG9tOjMuMHB0O21hcmdpbi1sZWZ0OjBjbSI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZTo5LjBwdDtjb2xvcjojMUQxQzFEIj4vIyBjYXQgZGlza192ZGUu
eWFtbDxicj4mbHQ7ZGlzayB0eXBlPSduZXR3b3JrJyBkZXZpY2U9J2Rpc2snJmd0Ozxicj4mbmJz
cDsgJmx0O2RyaXZlciBuYW1lPSdxZW11JyB0eXBlPSdyYXcnIGNhY2hlPSdub25lJyBpbz0nbmF0
aXZlJy8mZ3Q7PGJyPiZuYnNwOyAmbHQ7YXV0aCB1c2VybmFtZT0nY2luZGVyJyZndDs8YnI+Jm5i
c3A7Jm5ic3A7Jm5ic3A7ICZsdDtzZWNyZXQgdHlwZT0nY2VwaCcgdXVpZD0nYzVlZjkyMDYtYzQw
YS00YjA0LTdiZDktYjc2ZjM0YjAxMDNhJy8mZ3Q7PGJyPiZuYnNwOyAmbHQ7L2F1dGgmZ3Q7PGJy
PiZuYnNwOyAmbHQ7c291cmNlIHByb3RvY29sPSdyYmQnIG5hbWU9J3ZvbHVtZXMvdm9sdW1lLTRk
NmVkOTIyLTU3YzEtNGQxZS04ZWViLTFkMDBkNDE4NGJjMCcmZ3Q7PGJyPiZuYnNwOyZuYnNwOyZu
YnNwOyAmbHQ7aG9zdCBuYW1lPSdsdnMwMmNlcGhtb24wMS5zZHMuZWJheS5jb20nIHBvcnQ9JzY3
ODknLyZndDs8YnI+Jm5ic3A7Jm5ic3A7Jm5ic3A7ICZsdDtob3N0IG5hbWU9J2x2czAyY2VwaG1v
bjAyLnNkcy5lYmF5LmNvbScgcG9ydD0nNjc4OScvJmd0Ozxicj4mbmJzcDsmbmJzcDsmbmJzcDsg
Jmx0O2hvc3QgbmFtZT0nbHZzMDJjZXBobW9uMDMuc2RzLmViYXkuY29tJyBwb3J0PSc2Nzg5Jy8m
Z3Q7PGJyPiZuYnNwOyZuYnNwOyZuYnNwOyAmbHQ7aG9zdCBuYW1lPSdsdnMwMmNlcGhtb24wNC5z
ZHMuZWJheS5jb20nIHBvcnQ9JzY3ODknLyZndDs8YnI+Jm5ic3A7Jm5ic3A7Jm5ic3A7ICZsdDto
b3N0IG5hbWU9J2x2czAyY2VwaG1vbjA1LnNkcy5lYmF5LmNvbScgcG9ydD0nNjc4OScvJmd0Ozxi
cj4mbmJzcDsgJmx0Oy9zb3VyY2UmZ3Q7PGJyPiZuYnNwOyAmbHQ7dGFyZ2V0IGRldj0ndmR1JyBi
dXM9J3ZpcnRpbycvJmd0Ozxicj4mbmJzcDsgJmx0O2lvdHVuZSZndDs8YnI+Jm5ic3A7Jm5ic3A7
Jm5ic3A7ICZsdDt0b3RhbF9ieXRlc19zZWMmZ3Q7MTU3Mjg2NDAwJmx0Oy90b3RhbF9ieXRlc19z
ZWMmZ3Q7PGJyPiZuYnNwOyZuYnNwOyZuYnNwOyAmbHQ7dG90YWxfaW9wc19zZWMmZ3Q7MzAwJmx0
Oy90b3RhbF9pb3BzX3NlYyZndDs8YnI+Jm5ic3A7ICZsdDsvaW90dW5lJmd0Ozxicj4mbmJzcDsg
Jmx0O3NlcmlhbCZndDtwdmMtY2YzODcwMWQtNmY2Zi00NjM4LTk2YzUtNWNmYmUxNmQ2MDY4Jmx0
Oy9zZXJpYWwmZ3Q7PGJyPiZuYnNwOyAmbHQ7YWRkcmVzcyB0eXBlPSdwY2knIGRvbWFpbj0nMHgw
MDAwJyBidXM9JzB4MDAnIHNsb3Q9JzB4MTgnIGZ1bmN0aW9uPScweDAnLyZndDs8YnI+Jmx0Oy9k
aXNrJmd0OzxvOnA+PC9vOnA+PC9zcGFuPjwvcHJlPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkNvdWxkIHlvdSB0ZWxsIG1lIHdoZXRoZXIgcWVt
dSBzdXBvb3J0IHRoaXM/IElmIHllcywgd2hpY2ggdmVyc2lvbj8gSUYgbm8sIGRvIHlvdSBhbnkg
cGxhbiBmb3IgdGhpcz88bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFs
Ij48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQi
PlRoYW5rcyw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+VGFvPG86cD48L286cD48L3NwYW4+PC9wPg0KPC9k
aXY+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_D3D9D6564054420783702BD8387C4FF4ebaycom_--

