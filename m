Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD8952BB41
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 14:58:28 +0200 (CEST)
Received: from localhost ([::1]:56888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrJFy-0001hK-5n
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 08:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <parav@nvidia.com>) id 1nrJ6w-0000y7-IO
 for qemu-devel@nongnu.org; Wed, 18 May 2022 08:49:07 -0400
Received: from mail-dm6nam11on2081.outbound.protection.outlook.com
 ([40.107.223.81]:64576 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <parav@nvidia.com>) id 1nrJ6t-0003HY-R2
 for qemu-devel@nongnu.org; Wed, 18 May 2022 08:49:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PsnTfSo4lILA6L1PvcQClSDcgVJwoJ4eOmInPZPsc/fI6f6MzW72QqROM7Q8rrusfqFrPmSLwgwxLYomtK7K8Hf3cMhxqqiiHUBByXDcSLigVfKxcoa3FgGzFxWuWPQT7T2wHLHgIB4z6qXIA4zW0qOktRLDl4EajjY0vynNi/tXwApn903d+kY5ECzmZ9PAgQyGFVKW+tjtxls3kxbbU9j3cX68bmYtuyvQwW4tOzf2DKa9F4q43kAXHpmikDTZIIvB7C9oHpmAzRV5hW2wTJQmA1Wo8YEKoqNSTnI6tdlfEEYy7oze10+BahDqiuJWIU/uxZhSI+QCsRGpQzv25g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUUjYvg0TfqnqSJCvP+0HhFPOe9G8cRVLFpF/3+CbwI=;
 b=JDAJKUzH0TgUk7nAZfielzVczS/4jIfAsFnQbaeshh5eqcWBjB8uN/1tmk5j9lWAkWZv2cOMRuwrdhM2UiEgmVbPUFW9nQ7hl4/aP1k7Qf61p9BwqmELr9UeAKeG7OyqvT/Oj6/2Dr5Kwr2Ey2Zq2kEUTyPu8k2g2A27qo1TFEBfINILPslqV07GSMKGSbfbXBdF8UTw+Or7U8MQKaFLDSDu4+Ayuo/IidkJczbCQshCAoO3KkRnSqFVWIkQGLgmejIphTi1dN0j6uvY65kCakA7u0s1kj0OJtBdBUCy20K9tlkzvQFgrSHYUzHmvwp/AjTXDkAGGfMHBEUL8yiSOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUUjYvg0TfqnqSJCvP+0HhFPOe9G8cRVLFpF/3+CbwI=;
 b=thbc0BnOuvJRVAJMy1QRz16O+wukl5i+dk5kCNoZHoJrpiJOlngzGjPNq8HIZL3zUPOukUVHeng/wKy7q8tqR0l7Wxnz3ZBuwD8OcHcF87dkzRJCwnU/oRsQ7oSG6n+SfkkZAbYeoyXVJEgQ5dwbQNIkL7PbSt/ztl4pqnYo2l88VF0lRJvt9EK0Janz6GOgjKPtrZFAa4LdHNQIqpHCNQMdobgvV+R3CAVbHpVPO5j5C3g9u/gI0x06u+U5ofOj40TCJMGSYcWhjCh+GUhWQtHYW2KuGx7csdWQO4oUjb401Jjb9nY6ZOD1+NUtk7ilIUSTYK6TKIJ5rLBumieO7A==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by DM4PR12MB6616.namprd12.prod.outlook.com (2603:10b6:8:8e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Wed, 18 May
 2022 12:43:58 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::489d:7d33:3194:b854]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::489d:7d33:3194:b854%3]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 12:43:58 +0000
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>, Eugenio Perez Martin
 <eperezma@redhat.com>
CC: Gautam Dawar <gdawar@xilinx.com>, virtualization
 <virtualization@lists.linux-foundation.org>, qemu-level
 <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>,
 "virtio-networking@redhat.com" <virtio-networking@redhat.com>, Eli Cohen
 <elic@nvidia.com>, Laurent Vivier <lvivier@redhat.com>, Stefano Garzarella
 <sgarzare@redhat.com>
Subject: RE: About restoring the state in vhost-vdpa device
Thread-Topic: About restoring the state in vhost-vdpa device
Thread-Index: AQHYZW+JxbBQ1h+RIkS7iyhFOVHKbK0c5lPggAAyGwCAAAYJcIAEGq4AgAC/8WCAAHHjAIACL5tA
Date: Wed, 18 May 2022 12:43:58 +0000
Message-ID: <PH0PR12MB54813F22BC598ED8501DA1EBDCD19@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <CAJaqyWcbqzvtyHcU3t1TF7Mqm2_sBX57rN8S6hHB8NXxgi=tyQ@mail.gmail.com>
 <PH0PR12MB5481AF0B02B0FB00885FF2AEDCCA9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <BY5PR02MB698052EE53B707C6C04C3C8CB1CA9@BY5PR02MB6980.namprd02.prod.outlook.com>
 <PH0PR12MB54811C88B389ACB495BD5AB2DCCA9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CAJaqyWe2dQx1s7wQr8OLp-0eAQZJcCBuFwdxBA=sgeNm_u4N6A@mail.gmail.com>
 <PH0PR12MB54812F8306F5B9650BA10783DCCF9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <c235a37a-8a57-b4ae-6c2c-562d6e163450@redhat.com>
In-Reply-To: <c235a37a-8a57-b4ae-6c2c-562d6e163450@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 077a2049-f152-45d2-f795-08da38cc13d6
x-ms-traffictypediagnostic: DM4PR12MB6616:EE_
x-microsoft-antispam-prvs: <DM4PR12MB6616AC61B49F5FA24E777ECADCD19@DM4PR12MB6616.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: brO5ahf9q9O37otQ4Pzp9bYsWZREZ2CKIc0gxMKeXgvMCW5A6K0MkhLEkDaP3slVMUDKZCoTPyXnuYdO9J7dEgtKjPt31ArzqDW71/CuenKYjzC1iUpFi7DAR0nh0CHgpdT4tEHcUx8czGc/HM+JoJlYGZwzFPgziKGEBjxVNzuv3zkws7lCfb/0XPLvVCtxPvnGeraEBlQay2hb36qMVCVrx3vBPByWNCrN7A0bRUvTHj5RvwxM1ZWxScHf+pXlCtIsB5xrnNibPel5V3cdJHJDW4MT7jKtZoEB0wpjad5F8b+GOvrRHVfjH9vW4urxUpJHeajbC9OkNAXBg5yJFD09XFPCXtDRyBaKVo8UczJezuDbXayqB/vrntCgnBIkpLquPARXBNJYDiWOhJHwRCt4tVFlZSDHNMHNq8nFd1EssM75JhPvST3Hm3LVclFQUNXGgcnUhUO+BKpJeHOTnrdHlb8RLK6ZJ+5K0icX+6bNo6MnOV/4N3YDP7y1iAngR+uWHNaQZMMqsfjK9kiB24SVICwYVBR7dQzJErebIIu8sa0Hu2r1ja4z5nI8H/8mENzyKwgD/5M36UU5Asgz8bEZuRdFVHv8n1oqoJ2ap0jsgRVeoiQ1I+SfsudreXRkEEQFW0Tazu7E1IPM4gQCR6nIQIJ8b0uvVEbG5kKT0QSibi94Akdt81wpbkm84BkkntZXjLdD7rklXVYqUCrsCA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5481.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(66476007)(66446008)(66946007)(66556008)(71200400001)(64756008)(122000001)(76116006)(4326008)(6506007)(86362001)(110136005)(7696005)(8936002)(52536014)(508600001)(186003)(83380400001)(33656002)(5660300002)(55016003)(54906003)(2906002)(38070700005)(316002)(38100700002)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2lXcW1BVitKRVdINVNYNzcyL0dKZFBnVk1JVExiYSsyRTRMNTdnc1U1dE5C?=
 =?utf-8?B?dHgzbnlGcEpleDRmdWFvYmVROWhFREFYTHA0RGhCL0Z2M09VRjRIRzBHZUlW?=
 =?utf-8?B?bUFFai93U1NPRHFHNjZ2WENsT2ZHdWZ1M21IaGpIY3JMTDlWMkJWMnk5dEdV?=
 =?utf-8?B?S0RSWW1CZHB5ZnNlMXZIWTZqWFpJSTZPdXYwdE5MUmtrNU5ucWxtNitSTkxQ?=
 =?utf-8?B?VjhHamVnWXdIWEh5dlZMd2lrYkltaGZMdk1zQkp6Snpqd0RlTUFoeDl4V0ZB?=
 =?utf-8?B?Tlh2RkxHSmt6MFhGYVVlMWVSM3VzZDM3TlMwSFAxeno2OEZEOXA5RXAzaCtK?=
 =?utf-8?B?MmtsOUk5Q0x1elRRSU9HTmlCVGFENVViZEdiUk40ZXJrZjczSU5IQVh6TVVp?=
 =?utf-8?B?SDVVMDFuNDV1bENXOXQzVGt1THlGa0xRaHdpRXQzdUNVZEcxSXVtUmNKM09q?=
 =?utf-8?B?Wmtyc1FVL0NVTjg0Qk1ibmEybkNxK2w3M3M1NDdzYW1aS2huNzI1M3E5dWJz?=
 =?utf-8?B?OHFGOVAxeUVpSWpGaFB4OW4rbisxczlNMHhUMzN3Wlcyc0xpb1UvUnYvVTAw?=
 =?utf-8?B?Y01DY2Jta2ZEaXVuejNVTjByQ0FyTDFCQmFhRWEzMytvYUJrYzZkUUxYR1BG?=
 =?utf-8?B?VDB4SzViOUJmZ1p0WFFYQlRwSFR6ZTU0OVNscUd2U0dZSlhkQkNKSkF0T0Yv?=
 =?utf-8?B?YjEyalZjY3RMdG53TFc5NHpxa3RYd0RjRWIwdEFERGFJOER1blR0aXRIK2VV?=
 =?utf-8?B?blVNTEhDbkp4N3ZMcHo1MUlnSC9CNlo3WnJka3FwMW1qaEoydU9mM1RRNDds?=
 =?utf-8?B?dVV2UkpOR3VtWFJWQXNUTnhaak1UenczYmgxcm1pTVJtZUcwM1pycHlkWUY3?=
 =?utf-8?B?bGpHeUozaUlPYjJKc1huVGlvZ0RRSlRkZ3ljbHFMYkJGblZ2VTNSa1haa21h?=
 =?utf-8?B?NmUrTjc0S0NxWU5TWXozY3BydWJ4UjF5MG41V0NOVE1CZU1EVHkrQXcvczJY?=
 =?utf-8?B?SXFhMFZGODQwRDR5SWROclJ2aFhudGptditYQnJtWm5LQTN0ZnFkUitCdVpo?=
 =?utf-8?B?ZEY1dURieFZEWTVjUHdqTWdJY0dNc0hsOG1qYkgwVS9DY1ZoWkJ6VTk2L1FJ?=
 =?utf-8?B?UHJMOHpsWFBhTmQ4VCtWTC92ZTVPTzdxQ2lvN3lVSi9ka25leWttUGtZcGFa?=
 =?utf-8?B?VWFDd0E1NjRNWURrTm01VXVTZjF4NU0yK3ZIK0dncC9XeHBaZTBmcjIrQzdr?=
 =?utf-8?B?YU1MN0hPSGFsTEh5SWx3SjdiazZNSmF0L2R4VVRFdnZYMXhxTTdRWDBUQjhq?=
 =?utf-8?B?dDNEZmFHTGZsRDk3cktmU0cxSEJnTlNBQ0xtQ043NEh2VDBIUERFS3BhSmVU?=
 =?utf-8?B?QWh3TDBRaXRiVkFFQzdLb0N6bDMvWFZzRzZXS0dWamcyZjNFTU5XeW9HTGRx?=
 =?utf-8?B?QUpjS2xFclhsTFJwdFdwMjBDYnlEWGgrVDNrY25hMURSOVBQWUlLMHZtanF0?=
 =?utf-8?B?YkVoSUJLc3d6di9qZG9NYWVmL1VoWDZsMUpIeHljdDJQam1Yb05EWlZmL2tP?=
 =?utf-8?B?eGU3bWl6ckk4WkhrZEdpQjhJbW9kYWdEVEdPcEpDMDBhN25ORDZkcHVjWUQr?=
 =?utf-8?B?blNlWTJiMGR2UTlWcjkrdFk2dFNBT0FIUGV0bm82LzlGUGtEZE53MmcwMEg1?=
 =?utf-8?B?RGZNTnozVWkxZGdQbFpTVnAvR2p0aUEwVTYwbDdZTEdBbUhxaHF6R1ZXU200?=
 =?utf-8?B?RTQ0MkhRWjRNbE93Q0pOY3FnUXZRUGVHRFZBRW01clE5eFljNjJvV0dJRWpE?=
 =?utf-8?B?STNKdnlxSTBRcGpMRjVtQkM2Y2VoaWE5dlhzdytQWFM1N05pd1h4RDBpUHdU?=
 =?utf-8?B?Vk9SVmFGTlI4WTUzSDc5aUwzbG5YVng1ZER6RTI2eUhPeG9GUE9HVnhPZk1O?=
 =?utf-8?B?RzQvRk1DaWZqS09ZUmZVc1lJZndiWlpybHVYY2U3bC92cUkyNlVpSEJxZlBT?=
 =?utf-8?B?djhudzVFbDZpUm1qR2xrR3oxS0pid0t2anZXbUxXMnpWektnb1crcTBpNjBU?=
 =?utf-8?B?T3hNQzE1YUh4VXFBeWJVN0QrYWNxOVN2eU9EWTNQcGg3d2k5SWt4K0xlRDZE?=
 =?utf-8?B?NFEzbTd2ZENBZnBvZk1sRXRGMEFRZHJuMXd2N0dxZ2FBd05Vb0tLSi9MQkZS?=
 =?utf-8?B?c3BnRndYVjNUNWV6MlhKM1hLbHVET21NR2c1Wm0yaGJLTDEwMTBZSFZjc2JH?=
 =?utf-8?B?Mlh3S2RncGI3UnVWRXNRSjlUQ05QTmpXc0lORE1FMTZuV3pUM1RrWmZvblY2?=
 =?utf-8?B?V0tJUUd5ZHNhWUNEYnU4cGxKTnkrdFJvcGNLMVZJbW82KzV0WGZLblFsSkp4?=
 =?utf-8?Q?N6yGJww5s0C7XUE2Kl8O09gqhB672sASA8hXXxk4StKp7?=
x-ms-exchange-antispam-messagedata-1: XcxVDH+ZOn6lIA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 077a2049-f152-45d2-f795-08da38cc13d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 12:43:58.3373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HuzTYF8H/iYM995b7if3OKb7XpkIi484nxXkfNkCRDPVEwDxleL8JhCXgy1ZK51TRtKx5ezY2CtUHJwZkjzrfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6616
Received-SPF: softfail client-ip=40.107.223.81; envelope-from=parav@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

DQo+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+IFNlbnQ6IE1vbmRh
eSwgTWF5IDE2LCAyMDIyIDExOjA1IFBNDQo+ID4+IEFsdGhvdWdoIGl0J3MgYSBsb25nZXIgcm91
dGUsIEknZCB2ZXJ5IG11Y2ggcHJlZmVyIGFuIGluLWJhbmQgdmlydGlvDQo+ID4+IHdheSB0byBw
ZXJmb3JtIGl0IHJhdGhlciB0aGFuIGEgbGludXgvdmRwYSBzcGVjaWZpYy4gSXQncyBvbmUgb2Yg
dGhlDQo+ID4+IHJlYXNvbnMgSSBwcmVmZXIgdGhlIENWUSBiZWhhdmlvciBvdmVyIGEgdmRwYSBz
cGVjaWZpYyBpb2N0bC4NCj4gPj4NCj4gPiBXaGF0IGlzIHRoZSBpbi1iYW5kIG1ldGhvZCB0byBz
ZXQgbGFzdF9hdmFpbF9pZHg/DQo+ID4gSW4tYmFuZCB2aXJ0aW8gbWV0aG9kIGRvZXNuJ3QgZXhp
c3QuDQo+IA0KPiANCj4gUmlnaHQsIGJ1dCBpdCdzIHBhcnQgb2YgdGhlIHZob3N0IEFQSSB3aGlj
aCB3YXMgdGhlcmUgZm9yIG1vcmUgdGhhbiAxMCB5ZWFycy4NCj4gVGhpcyBzaG91bGQgYmUgc3Vw
cG9ydGVkIGJ5IGFsbCB0aGUgdkRQQSB2ZW5kb3JzLg0KU3VyZS4gTXkgcG9pbnQgdG8gRXVnZW5p
byB3YXMgdGhhdCB2ZHBhIGRvZXNu4oCZdCBoYXZlIHRvIGxpbWl0ZWQgYnkgdmlydGlvIHNwZWMu
DQpQbHVtYmluZyBleGlzdHMgdG8gbWFrZSB2ZHBhIHdvcmsgd2l0aG91dCB2aXJ0aW8gc3BlYy4N
CkFuZCBoZW5jZSwgYWRkaXRpb25hbCBpb2N0bCBjYW4gYmUgb2suDQoNCj4gPj4gbGF5ZXJzIG9m
IHRoZSBzdGFjayBuZWVkIHRvIG1haW50YWluIG1vcmUgc3RhdGUuDQo+ID4gTW9zdGx5IG5vdC4g
QSBjb21wbGV0ZSB2aXJ0aW8gZGV2aWNlIHN0YXRlIGFycml2ZWQgZnJvbSBzb3VyY2UgdmRwYSBk
ZXZpY2UNCj4gY2FuIGJlIGdpdmVuIHRvIGRlc3RpbmF0aW9uIHZkcGEgZGV2aWNlIHdpdGhvdXQg
YW55b25lIGVsc2UgbG9va2luZyBpbiB0aGUNCj4gbWlkZGxlLiBJZiB0aGlzIGZvcm1hdCBpcyBr
bm93bi93ZWxsIGRlZmluZWQuDQo+IA0KPiANCj4gVGhhdCdzIGZpbmUsIGFuZCBpdCBzZWVtcyB0
aGUgdmlydGlvIHNwZWMgaXMgYSBiZXR0ZXIgcGxhY2UgZm9yIHRoaXMsDQo+IHRoZW4gd2Ugd29u
J3QgZHVwbGljYXRlIGVmZm9ydHM/DQo+IA0KWWVzLiBmb3IgVkRQQSBrZXJuZWwsIHNldHRpbmcg
cGFyYW1ldGVycyBkb2VzbuKAmXQgbmVlZCB2aXJ0aW8gc3BlYyB1cGRhdGUuDQpJdCBpcyBzaW1p
bGFyIHRvIGF2YWlsIGluZGV4IHNldHRpbmcuDQoNCj4gDQo+ID4NCj4gPj4gIEZyb20gdGhlIGd1
ZXN0IHBvaW50IG9mIHZpZXcsIHRvIGVuYWJsZSBhbGwgdGhlIHF1ZXVlcyB3aXRoDQo+ID4+IFZI
T1NUX1ZEUEFfU0VUX1ZSSU5HX0VOQUJMRSBhbmQgZG9uJ3Qgc2VuZCBEUklWRVJfT0sgaXMgdGhl
DQo+IHNhbWUNCj4gPj4gYXMgc2VuZCBEUklWRVJfT0sgYW5kIG5vdCB0byBlbmFibGUgYW55IGRh
dGEgcXVldWUgd2l0aA0KPiA+PiBWSE9TVF9WRFBBX1NFVF9WUklOR19FTkFCTEUuDQo+ID4gRW5h
YmxpbmcgU0VUX1ZSSU5HX0VOQUJMRSBhZnRlciBEUklWRVJfT0sgaGFzIHR3byBiYXNpYyB0aGlu
Z3MNCj4gYnJva2VuLg0KPiANCj4gDQo+IEl0IGxvb2tzIHRvIG1lIHRoZSBzcGVjOg0KPiANCj4g
MSkgRm9yIFBDSSBpdCBkb2Vzbid0IGZvcmJpZCB0aGUgZHJpdmVyIHRvIHNldCBxdWV1ZV9lbmFi
bGUgdG8gMSBhZnRlcg0KPiBEUklWRVJfT0suDQpEZXZpY2UgaW5pdCBzZXF1ZW5jZSBzb3J0IG9m
IGhpbnRzIHRoYXQgdnEgc2V0dXAgc2hvdWxkIGJlIGRvbmUgYmVmb3JlIGRyaXZlcl9vayBpbiBi
ZWxvdyBzbmlwcGV0Lg0KDQoiUGVyZm9ybSBkZXZpY2Utc3BlY2lmaWMgc2V0dXAsIGluY2x1ZGlu
ZyBkaXNjb3Zlcnkgb2YgdmlydHF1ZXVlcyBmb3IgdGhlIGRldmljZSwgb3B0aW9uYWwgcGVyLWJ1
cyBzZXR1cCwNCnJlYWRpbmcgYW5kIHBvc3NpYmx5IHdyaXRpbmcgdGhlIGRldmljZeKAmXMgdmly
dGlvIGNvbmZpZ3VyYXRpb24gc3BhY2UsIGFuZCBwb3B1bGF0aW9uIG9mIHZpcnRxdWV1ZXMuIg0K
DQpGb3IgYSBtb21lbnQgZXZlbiBpZiB3ZSBhc3N1bWUsIHRoYXQgcXVldWUgY2FuIGJlIGVuYWJs
ZWQgYWZ0ZXIgZHJpdmVyX29rLCBpdCBlbmRzIHVwIGdvaW5nIHRvIGluY29ycmVjdCBxdWV1ZS4N
CkJlY2F1c2UgdGhlIHF1ZXVlIHdoZXJlIGl0IHN1cHBvc2VkIHRvIGdvLCBpdCBub3QgZW5hYmxl
ZCBhbmQgaXRzIHJzcyBpcyBub3Qgc2V0dXAuDQoNClNvIG9uIHJlc3RvcmUgZmxvdyBpdCBpcyBk
ZXNpcmVkIHRvIHNldCBuZWVkZWQgY29uZmlnIGJlZm9yZSBkb2luZyBkcml2ZXJfb2suDQoNCj4g
MikgRm9yIE1NSU8sIGl0IGV2ZW4gYWxsb3dzIHRoZSBkcml2ZXIgdG8gZGlzYWJsZSBhIHF1ZXVl
IGFmdGVyIERSSVZFUl9PSw0KPiANCj4gDQo+ID4gMS4gc3VwcGxpZWQgUlNTIGNvbmZpZyBhbmQg
VlEgY29uZmlnIGlzIG5vdCBob25vcmVkIGZvciBzZXZlcmFsIHRlbnMgb2YNCj4gaHVuZHJlZHMg
b2YgbWlsbGlzZWNvbmRzDQo+ID4gSXQgd2lsbCBiZSBwdXJlbHkgZGVwZW5kZW50IG9uIGhvdy93
aGVuIHRoaXMgaW9jdGwgYXJlIG1hZGUuDQo+ID4gRHVlIHRvIHRoaXMgYmVoYXZpb3IgcGFja2V0
IHN1cHBvc2VkIHRvIGFycml2ZSBpbiBYIFZRLCBhcnJpdmVzIGluIFkgVlEuDQo+IA0KPiANCj4g
SSBkb24ndCBnZXQgd2h5IHdlIGVuZCB1cCB3aXRoIHRoaXMgc2l0dWF0aW9uLg0KPiANCj4gMSkg
ZW5hYmxlIGN2cQ0KPiAyKSBzZXQgZHJpdmVyX29rDQo+IDMpIHNldCBSU1MNCj4gNCkgZW5hYmxl
IFRYL1JYDQo+IA0KPiB2cw0KPiANCj4gMSkgc2V0IFJTUw0KPiAyKSBlbmFibGUgY3ZxDQo+IDMp
IGVuYWJsZSBUWC9SWA0KPiA0KSBzZXQgZHJpdmVyX29rDQo+IA0KPiBJcyB0aGUgbGF0dGVyIGZh
c3Rlcj8NCj4gDQpZZXMsIGJlY2F1c2UgbGF0ZXIgc2VxdWVuY2UgaGFzIHRoZSBhYmlsaXR5IHRv
IHNldHVwIHN0ZWVyaW5nIGNvbmZpZyBvbmNlLg0KQXMgb3Bwb3NlZCB0byB0aGF0IGZpcnN0IHNl
cXVlbmNlIG5lZWRzIHRvIGluY3JlbWVudGFsbHkgdXBkYXRlIHRoZSByc3Mgc2V0dGluZyBvbiBl
dmVyeSBuZXcgcXVldWUgYWRkaXRpb24gb24gc3RlcCAjNC4NCg0KPiANCj4gPg0KPiA+IDIuIEVh
Y2ggVlEgZW5hYmxlbWVudCBvbmUgYXQgYSB0aW1lLCByZXF1aXJlcyBjb25zdGFudCBzdGVlcmlu
ZyB1cGRhdGUNCj4gZm9yIHRoZSBWUQ0KPiA+IFdoaWxlIHRoaXMgaW5mb3JtYXRpb24gaXMgc29t
ZXRoaW5nIGFscmVhZHkga25vd24uIFRyeWluZyB0byByZXVzZSBicmluZ3MgYQ0KPiBjYWxsYmFj
ayByZXN1bHQgaW4gdGhpcyBpbi1lZmZpY2llbmN5Lg0KPiA+IFNvIGJldHRlciB0byBzdGFydCB3
aXRoIG1vcmUgcmV1c2FibGUgQVBJcyB0aGF0IGZpdHMgdGhlIExNIGZsb3cuDQo+IA0KPiANCj4g
SSBhZ3JlZSwgYnV0IHRoZSBtZXRob2QgcHJvcG9zZWQgaW4gdGhlIG1haWwgc2VlbXMgdG8gYmUg
dGhlIG9ubHkgd2F5DQo+IHRoYXQgY2FuIHdvcmsgd2l0aCB0aGUgYWxsIHRoZSBtYWpvciB2RFBB
IHZlbmRvcnMuDQo+IA0KPiBFLmcgdGhlIG5ldyBBUEkgcmVxdWlyZXMgdGhlIGRldmljZSBoYXMg
dGhlIGFiaWxpdHkgdG8gcmVjZWl2ZSBkZXZpY2UNCj4gc3RhdGUgb3RoZXIgdGhhbiB0aGUgY29u
dHJvbCB2aXJ0cXVldWUgd2hpY2ggbWlnaHQgbm90IGJlIHN1cHBvcnRlZCB0aGUNCj4gaGFyZHdh
cmUuIChUaGUgZGV2aWNlIG1pZ2h0IGV4cGVjdHMgYSB0cmFwIGFuZCBlbXVsYXRlIG1vZGVsIHJh
dGhlciB0aGFuDQo+IHNhdmUgYW5kIHJlc3RvcmUpLg0KPiANCkhvdyBhIGdpdmVuIHZlbmRvciB0
byByZXR1cm4gdGhlIHZhbHVlcyBpcyBpbiB0aGUgdmVuZG9yIHNwZWNpZmljIHZkcGEgZHJpdmVy
LCBqdXN0IGxpa2UgYXZhaWxfaW5kZXggd2hpY2ggaXMgbm90IGNvbWluZyB0aHJvdWdoIHRoZSBD
VlEuDQoNCj4gIEZyb20gcWVtdSBwb2ludCBvZiB2aWV3LCBpdCBtaWdodCBuZWVkIHRvIHN1cHBv
cnQgYm90aCBtb2RlbHMuDQo+IA0KPiBJZiB0aGUgZGV2aWNlIGNhbid0IGRvIHNhdmUgYW5kIHJl
c3RvcmU6DQo+IA0KPiAxLjEpIGVuYWJsZSBjdnENCj4gMS4yKSBzZXQgZHJpdmVyX29rDQo+IDEu
Mykgc2V0IGRldmljZSBzdGF0ZSAoTVEsIFJTUykgdmlhIGNvbnRyb2wgdnENCj4gMS40KSBlbmFi
bGUgVFgvUlgNCj4gDQo+IElmIHRoZSBkZXZpY2UgY2FuIGRvIHNhdmUgYW5kIHJlc3RvcmU6DQo+
IA0KPiAyLjEpIHNldCBkZXZpY2Ugc3RhdGUgKG5ldyBBUEkgZm9yIHNldHRpbmcgTVEsUlNTKQ0K
PiAyLjIpIGVuYWJsZSBjdnENCj4gMi4zKSBlbmFibGUgVFg/UlgNCj4gMi40KSBzZXQgZHJpdmVy
X29rDQo+IA0KPiBXZSBjYW4gc3RhcnQgZnJvbSAxIHNpbmNlIGl0IHdvcmtzIGZvciBhbGwgZGV2
aWNlIGFuZCB0aGVuIGFkZGluZw0KPiBzdXBwb3J0IGZvciAyPw0KPiANCg0KSG93IGFib3V0Og0K
My4xKSBjcmVhdGUgY3ZxIGZvciB0aGUgc3VwcG9ydGVkIGRldmljZQ0KQ3ZxIG5vdCBleHBvc2Vk
IHRvIHVzZXIgc3BhY2UsIHN0YXlzIGluIHRoZSBrZXJuZWwuIFZkcGEgZHJpdmVyIGNyZWF0ZWQg
aXQuDQoNCjMuMikgc2V0IGRldmljZSBzdGF0ZSAoTVEsIFJTUykgY29tZXMgdmlhIHVzZXItPmtl
cm5lbCBpb2N0bCgpDQpWZHBhIGRyaXZlciBpbnRlcm5hbGx5IGRlY2lkZXMgd2hldGhlciB0byB1
c2UgY3ZxIG9yIHNvbWV0aGluZyBlbHNlIChsaWtlIGF2YWlsIGluZGV4KS4NCg0KMy4zKSBlbmFi
bGUgdHgvcngNCjMuNCkgc2V0IGRyaXZlcl9vaw0K

