Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D209362C070
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 15:07:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovJ3P-0007Cl-JA; Wed, 16 Nov 2022 09:06:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jadon.mcdowell@optum.com>)
 id 1ovIIf-0002Ps-Q3; Wed, 16 Nov 2022 08:17:57 -0500
Received: from sp-internet-ext-ply.uhc.com ([198.203.175.175])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jadon.mcdowell@optum.com>)
 id 1ovIId-0007Yi-2i; Wed, 16 Nov 2022 08:17:57 -0500
Received: from irmelrep01.uhc.com (HELO sp-internet-ext-ply.uhc.com)
 ([10.178.155.159])
 by mail20616.uhc.com with ESMTP; 16 Nov 2022 07:17:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=optum.com; i=@optum.com; q=dns/txt;
 s=dk.sep2016.2048; t=1668604665;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version; bh=JZA6CPq1hsQ1X/HL8253dk7v48r+TCAhtI6BWHTKPcM=;
 b=P8eQfG5wmyfEttJw+zOnt4HeM7sxlcZJpVQwWYHFq0nclv8/ziRp4E6k
 6vAbCGnaI9aU22gA5hEetqKTWLjvp1FZPImtP2VZyOxiSRlGzUwHZjP88
 eKmgw0TgXXCucqZAYsn/o8B0RXrt7Bm78vgJ/33SE1kHNo3EIexAUvUj1
 SaDGp+AqNy7gT9mxUazqGsZlphNIKegriaTBYADEqqrSZRvIazhn4u8YW
 u6C0P32JL2dO0Vvqfd/HPKH19pgJgkYVSiD0MmVZW2iFvgUQ7nPIVliOV
 rOq1ePtk5vyv/SdtsgGKRFlKArjIgrWsC/McTllp8fMArcZNomy8FKf4v A==;
X-REMOTEHOST: apswp2221.ms.ds.uhc.com
X-REMOTEIP: 10.176.137.150
X-CONF-FOOTER: True
Received: from apswp2221.ms.ds.uhc.com ([10.176.137.150])
 by ovarp0633.uhc.com with ESMTP; 16 Nov 2022 07:17:40 -0600
Received: from apswp2230.ms.ds.uhc.com (10.122.34.147) by
 apswp2221.ms.ds.uhc.com (10.176.137.150) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 16 Nov 2022 07:17:39 -0600
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.125.116.7) by
 apswp2230.ms.ds.uhc.com (10.122.34.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 16 Nov 2022 07:17:39 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NkETSNJdLUw51K6jIw1+NGIu9vQaiJ4+9p3FqupZ6/LkopjxgJ81ptOPsVI9t2+dLXqhHw0045AbdSU+KhTHAjtR7kTbKrjf+xoTV8uisW/OOZXti+NQdxpgcECkA3dnoIDUbu7px/YqJ7DuolI/ifJe18p0LWhg7rocuDCcAJ3+ygQaRI7EjeG3uheWcTUkpDss+6l4cUfAmFTMF0i8P9B9E0363vqKlQrmNCFtLRUpfkYp00swxhDY6E1bg3qWv1psoscjDwImKnjPh4YFw4pAT01VkVj5b71LHNtnI1IcOcdDMdAZZ5EHoWjNC67GYBdz5oET1PWdx9qEScwxyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dygbwW1lIKShCjbBZmaXHvfv/TW0jqW948V3AsQXlE0=;
 b=UHDWVonYq7HfIRptllhAyR4KHN3WWoPWkIkOK5x1Q21cvaR7gjrJFD4Oa8S2wGtog/vytUUMBLXZzjvEIG4RwPNhBdfMVIDFhjXrITVLUi+zpMK9DWL3z9v+ysmbqD5iq0f9rhJbHpUXafALtrOSyQD9Xs55x/UG92BXOggfV2WS1qre6kcLnDo3O4nfNriR0+EH5C0VuyXfCmA5eTBsMimO9jEVindh5qXxWSYwQv6GRBM9KKaxGvjjYUGVNp31jQKBoQfy7SWjW/nm7QPveOZ9cEqA1wtKiqz+A3KEbIm3/5tHVN6XyNa+b8CZYndm9LzIFpzKvBN2+ujYWWX8vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=optum.com; dmarc=pass action=none header.from=optum.com;
 dkim=pass header.d=optum.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=uhgazure.onmicrosoft.com; s=selector1-uhgazure-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dygbwW1lIKShCjbBZmaXHvfv/TW0jqW948V3AsQXlE0=;
 b=djN5kEAw2NiW+a4ZRMCQMmBZKUjnufalD1XLEFGT86K5rZZMEGWPQdHydkGgTDeVsMOVSTx7folU+ga+TEnUK/YHlz99+jkpxZJpJfmAKTeGLjAG/ScKYk/vuo5H+Vk+tM5hcQzl+RK7RyZZb2c6uBufPGycrCSeSeO8LkuALB0=
Received: from PH0PR22MB3210.namprd22.prod.outlook.com (2603:10b6:510:111::5)
 by PH7PR22MB3137.namprd22.prod.outlook.com (2603:10b6:510:13d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Wed, 16 Nov
 2022 13:17:38 +0000
Received: from PH0PR22MB3210.namprd22.prod.outlook.com
 ([fe80::8f24:d4c9:6dc3:a0d9]) by PH0PR22MB3210.namprd22.prod.outlook.com
 ([fe80::8f24:d4c9:6dc3:a0d9%5]) with mapi id 15.20.5813.019; Wed, 16 Nov 2022
 13:17:38 +0000
From: Jadon <jadon.mcdowell@optum.com>
To: Pierre Morel <pmorel@linux.ibm.com>, =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?=
 <clg@kaod.org>, "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "borntraeger@de.ibm.com"
 <borntraeger@de.ibm.com>, "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "david@redhat.com" <david@redhat.com>, "thuth@redhat.com" <thuth@redhat.com>, 
 "cohuck@redhat.com" <cohuck@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "eblake@redhat.com" <eblake@redhat.com>, "armbru@redhat.com"
 <armbru@redhat.com>, "seiden@linux.ibm.com" <seiden@linux.ibm.com>,
 "nrb@linux.ibm.com" <nrb@linux.ibm.com>, "scgl@linux.ibm.com"
 <scgl@linux.ibm.com>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>,
 "berrange@redhat.com" <berrange@redhat.com>
Subject: Thank you! s390x/cpu topology
Thread-Topic: Thank you! s390x/cpu topology
Thread-Index: AQHY+b3MaiLyh249okqns56MMsv0xg==
Date: Wed, 16 Nov 2022 13:17:38 +0000
Message-ID: <PH0PR22MB321097F1C9AC0513B50F885E91079@PH0PR22MB3210.namprd22.prod.outlook.com>
References: <20221103170150.20789-1-pmorel@linux.ibm.com>
 <20221103170150.20789-10-pmorel@linux.ibm.com>
 <b5540c7e-3c06-565a-6571-55c167ec347b@kaod.org>
 <757660a9-97e7-5529-dcf2-a575c19cee28@linux.ibm.com>
 <PH0PR22MB3210864C22AD57E5B32F626991079@PH0PR22MB3210.namprd22.prod.outlook.com>
In-Reply-To: <PH0PR22MB3210864C22AD57E5B32F626991079@PH0PR22MB3210.namprd22.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a8a73c85-e524-44a6-bd58-7df7ef87be8f_ActionId=a97f7b55-76a3-4311-b189-5c690a59ea48;
 MSIP_Label_a8a73c85-e524-44a6-bd58-7df7ef87be8f_ContentBits=0;
 MSIP_Label_a8a73c85-e524-44a6-bd58-7df7ef87be8f_Enabled=true;
 MSIP_Label_a8a73c85-e524-44a6-bd58-7df7ef87be8f_Method=Standard;
 MSIP_Label_a8a73c85-e524-44a6-bd58-7df7ef87be8f_Name=Internal
 Label;
 MSIP_Label_a8a73c85-e524-44a6-bd58-7df7ef87be8f_SetDate=2022-11-16T12:55:51Z;
 MSIP_Label_a8a73c85-e524-44a6-bd58-7df7ef87be8f_SiteId=db05faca-c82a-4b9d-b9c5-0f64b6755421;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=optum.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR22MB3210:EE_|PH7PR22MB3137:EE_
x-ms-office365-filtering-correlation-id: 84ec8059-5d85-411f-d7d7-08dac7d4eed8
x-corpex-transportrule: EXO-Outbound X-header
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: de7aSTzyOxzvP9H77NJWego3icHk/5VpD1wbvAvmsR3xoz3WLGKcHpcjasnNXS3Fe2VqN8B871nR6bD9zXvs4QZ65W0jltDyfXW3+j//B+jP0ZUfrOPtVelQwDjbDJ8aKLyRUcIqRKMC/Op9FKZAUx0//UBs/dZReksywOdT0NqkOhwvLZrnq17+eVbsEBLG0wi8VvL2p4DykAotRUwvIuA7iNsy17MHiPxh7OH8n7G6lKexkdjUblBCyW39GZRCaG+yXp0HTEtKOXfY1eP+9CcfGlKfo+Iw+FMqG+MzES1oUexuu5Eut1IDZia/N98Jilre4EZ77M2vdHjFBC2DI4oyO4FvfmP09FfjYqSW3HZ7xnBAzTMM/eq921U0nNCYR7H+AiLPD9w5YxBPCv8MKSCeo1zv9Zd7WwNccEQ8U9qsEOoeM5w8oXIKpGR/QCdPYl4Hq9KZwMcEKJ1zi/U48sBrBTjoAvtpRz4+6IGT+FzSkIu4g/m+JkzMfsVK1wIHte6orw1QLQx/W2XMLwfNwuufVepz1GvtZWqfk0HElMQqSLOvrIRQ9zlMnBSWkit462gTfTvzgApWyslHdDdvgHaeuPNTYKmlZxFsYVpYa9FFrOGeV9IWQhc2QDXvyzc0Ko3u5cOc7Pn1wVOxzqD/opAUTTG8fbLZOBmhMipw5iiwRkKnSuVq602SarZqipXhNEYKu6415Z4l3+4R0uIDAEY5aG2FlCOwZrmwvUZN5UupMLkRTaansziPSFyvAg3ro31EJbkMnNlU9URfIWx168tuQwctBfo/loBMq+hJyhU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR22MB3210.namprd22.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(451199015)(99936003)(55016003)(40140700001)(921005)(8676002)(82960400001)(38070700005)(86362001)(38100700002)(122000001)(66476007)(66446008)(66556008)(66946007)(64756008)(71200400001)(316002)(76116006)(33656002)(2906002)(41300700001)(110136005)(7416002)(8936002)(5660300002)(52536014)(83380400001)(478600001)(4744005)(7696005)(186003)(26005)(9686003)(6506007)(2940100002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UEV3SUtZVlh4bis3dnB3bk8xc3VmYmlBOEtYQ2ZsNVFqQ0J6a0tiNitwdGRh?=
 =?utf-8?B?QU1tOWE4MkxXdlNXMjgwbFJlNnJkUlpmcUVoVW5rZzRsQmIvSGtUWDhSbkhE?=
 =?utf-8?B?REFKMFVuS1UrNjdzSFU4aUpybUY1M1VJSjg1TzI2N1M1NXE0TWQ2eVVPajRC?=
 =?utf-8?B?VVVpNXhJcHRWQmRRanM1eDVzSk1oZzFRVFVaSnAvdlhTbXpBYzFyYXZteHlx?=
 =?utf-8?B?T1VRQ2lZWGh2RjU5bzZuTmZGSmlzeXlvQkI1RXVLL2VnR3J1cUhNQXFnNGcr?=
 =?utf-8?B?M21rMnhmSGMzVGcrT01OTXV0SGo1cUZCOWs3MWFpR3BIekY5Z25vd29Ycmx2?=
 =?utf-8?B?NFVlQXdUTjRwTTlmV0xpOUJpUUJNSDN1Yjc2TXVEUzR0Tk9hRG5MTlU0STU4?=
 =?utf-8?B?ZDFhSlp3UGIraVFBWUwySjB0ZDh3SHI3VU5zUC9hdHJ1M1E0VzFxOG1LZzU1?=
 =?utf-8?B?Nzd0c2EzOEpucGE5Mi8yN0ZuK0ZlMyttc0dXVzIwUmVCcFp2cU40ZHhjaWxt?=
 =?utf-8?B?YzhaYzE3VkxWTGxtZTdhT0c1NFQwQkJHM0pudnhkVmhtck5rWjZhOUFsSVh0?=
 =?utf-8?B?ZVZyNllwRDFoWmdZVVR6WjhNUW9ubExkUVdweVlJeHhnS0xiMW9jeVRBRDRn?=
 =?utf-8?B?ZVRGRUZNOHgwYWN2OVN0MW5sZkxMNjhIemp3eWJNZXdMV0RvdDI1NVRVQ3px?=
 =?utf-8?B?Y2JmQm9rUGh4aElOSGN0bkx2K2NiWTluc0FCdXp3RFFvamEyVmlUSTEyZHRN?=
 =?utf-8?B?VWMxL2lVTFU5OXVaVTNBcHNWOVA4TXRJMFFxdFEwR0FMVWhERHc5eUhnbXFw?=
 =?utf-8?B?Y2R0bjNBVm1jU3BaR1FDN0tkOFBYWnhOMFE0L3JZdnVQNmNTb2R4ZGNURXZG?=
 =?utf-8?B?S1RXcyticWQzNE80eUJQRXIwUk9td2JIT29ZRzR0U0s2Um9XemdIUnROdFIr?=
 =?utf-8?B?ZWhGcFFBaU9qb2NCM1JJTGxlaHV6Mkc2dCsrRFRXdEx3emwxcVlMck9SWVRV?=
 =?utf-8?B?ejlGSERLYUZGZ3MzSW95Nk5EOTExV296dk12d09YWldxK3F3M0pBMjJjOEtm?=
 =?utf-8?B?YWw3NCt1K3ZtTjNhRktRZk1zQlg2aDdPSjI5cjRKaGVkRHMzb252d1lHZ3JK?=
 =?utf-8?B?WXNBRDFKSkNPeFFHZkhEdkxaT2JVeW94QVdQdTdXb0NzS1BxVmtYd1hBaTc1?=
 =?utf-8?B?T2xRWFUwSXphRHg1eHhSbkZnMGU2SHJSZHNhazk3bkN3YXp0WVBxSGs2bFli?=
 =?utf-8?B?TERyTW84ckprVFAxOW9OVXQ1R2dNeEd5VmNmSVJ4Y1NqM1YwTEU4a3B5bnRx?=
 =?utf-8?B?NXBhaENDSzY2ZjlwejBPcHB5YThyVTNJOThFTzgwWXQzVHJTOTg2bXNlWndx?=
 =?utf-8?B?MEtXM1Y2L0ZRUndCOTJwU053NWxmS0VaL2RFNW5vYTA1akliQm1wVy9FRWls?=
 =?utf-8?B?SDNmNUZiTDk0VUorUkhPamlNQzUzakRmeFZVNWMyckZGbFN0UXFYbFNhTjVZ?=
 =?utf-8?B?bmVnc3Y1Y0RUKzlsalFpMklJRm5OTmFZQUIwaGRoVFdDY0QzRzdOZWZyS0Yx?=
 =?utf-8?B?RXlTbXo0cEo3azY4aVVtRDJlbkdMSU85VW1pQkRWZnY3RFNGMkpWZ1p4TEps?=
 =?utf-8?B?NGQ4ZkExa0FZVFoyeThzeUxWSnVLN0xGbUc3RUhSR212Q2tIamZSc09mNVJS?=
 =?utf-8?B?MjVlU01MdjM5YncyRlJ6aW40WTRFd3NrZUhnNk1oT0RMVVRnaXBSa3FwRjFq?=
 =?utf-8?B?dVVkRFBXMjVsYlY4K1RObWJ4N3pwbk1RQ1ErRk5UcERvaDdxTkVjUitqTUYy?=
 =?utf-8?B?N2Q0RHNRZHEzU0NWbnY1Zjl4YWtpWjF4NXcyVGJxM0NyalNkTEFDaXZub2cz?=
 =?utf-8?B?V3FQUlRjVkpJekhGSGhMSm5pNjM5RnBmUks5WXVwaTFRZk1rdHVsNmx6WWFI?=
 =?utf-8?B?SjZOREdKVWMwWjJ1UEYzdUtBRk9ORjFJMnIzNUhlVHF3RFRZekhUcEJiTEVh?=
 =?utf-8?B?UmJNM3BEL1hVK1p0em9kM04vTWwwRXhQbHUwTURpT0ROcGkyeUMvQkc3c3Ri?=
 =?utf-8?B?ZDZ2UXhvZEZWVUNSNXB0RCtXVWdHdHVuUU84TFIvOE85aWVtb0kzaGxuK0hr?=
 =?utf-8?B?RkU1Rnd2Tmk5cHhacFhjZHRRS24wbDVIbkM0Y1lnWG5vUWlENU9LU1ZqR2tr?=
 =?utf-8?B?QkE9PQ==?=
Content-Type: multipart/related;
 boundary="_004_PH0PR22MB321097F1C9AC0513B50F885E91079PH0PR22MB3210namp_";
 type="multipart/alternative"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR22MB3210.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ec8059-5d85-411f-d7d7-08dac7d4eed8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2022 13:17:38.0216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: db05faca-c82a-4b9d-b9c5-0f64b6755421
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WQoLtMZM0HJ3OltYJyjOmNzOGW0E66dB/3t614is/V3F+lKvgLvg08h7cLcCZhPARCU5+GGw3PS7PtnDhHmoKvFjtwzKaxZfYF2kDT0qJI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR22MB3137
X-OriginatorOrg: optum.com
X-IP-VFilter-R: R
Received-SPF: pass client-ip=198.203.175.175;
 envelope-from=jadon.mcdowell@optum.com; helo=sp-internet-ext-ply.uhc.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 16 Nov 2022 09:06:11 -0500
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

--_004_PH0PR22MB321097F1C9AC0513B50F885E91079PH0PR22MB3210namp_
Content-Type: multipart/alternative;
	boundary="_000_PH0PR22MB321097F1C9AC0513B50F885E91079PH0PR22MB3210namp_"

--_000_PH0PR22MB321097F1C9AC0513B50F885E91079PH0PR22MB3210namp_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

RnJpZW5kcywNCg0KSSBhbSBidXQgYSBzbWFsbCBieXN0YW5kZXIgYXMgSSB3YXRjaCBpbiBhd2Ug
YXQgdGhlIGluY3JlZGlibGUgd29yayBlYWNoIG9mIHlvdSBkbyB0byBhZHZhbmNlIHRoZSBLZXJu
ZWwgYW5kIExpbnV4Lg0KV2hhdCB5b3UgYXJlIHdvcmtpbmcgb24gaXMgc28gaW1wb3J0YW50LiBZ
b3VyIGlkZWFzLCBhbmQgaG93IHlvdSBleHByZXNzIHRoZW0gaW50byB0aGUgY29kZSB5b3Ugd3Jp
dGUsIGJlY29tZSB0aGUgZm91bmRhdGlvbiBmb3IgYSBiZXR0ZXIgd29ybGQuDQpJIGNhbiB0ZWxs
IHlvdSB0aGF0IHlvdXIgc3VwcG9ydCBmb3IgczM5MHggYXJjaGl0ZWN0dXJlIGlzIHF1aXRlIG1l
YW5pbmdmdWwgdG8gbXkgY29tcGFueSBhcyB3ZSB3b3JrIHRvIGltcHJvdmUgYWNjZXNzLCBjb3N0
LCBhbmQgcG9zaXRpdmUgb3V0Y29tZXMgaW4gaGVhbHRoY2FyZS4NCldlIHVzZSBtYW55IHMzOTB4
IExpbnV4IHNlcnZlcnMgYW5kIFZNcyBmb3IgY3JpdGljYWwgc3lzdGVtcy4NCg0KVGhhbmsgeW91
IGZvciBldmVyeXRoaW5nIHlvdSBkby4gTWFueSBvZiB1cyBhdCBtYW55IGNvbXBhbmllcyBkZWVw
bHkgYXBwcmVjaWF0ZSB5b3UuDQoNCldpdGggc2luY2VyZSByZXNwZWN0LA0KDQotSmFkb24NCg0K
SmFkb24gTWNEb3dlbGwgfCBbb3B0dW0lMjBsb2dvJTIwZ2lmJTIwMjAwcHhdDQpEaXJlY3RvciAm
IFNlbmlvciBQcmluY2lwYWwgRW5naW5lZXIsIFRMQ1ANCkVudGVycHJpc2UgSG9zdGluZyBTZXJ2
aWNlczogSFBDIEluZnJhc3RydWN0dXJlIERlbGl2ZXJ5DQpNb2JpbGU6IDYxMi05NDAtOTI2OCB8
IGphZG9uLm1jZG93ZWxsQG9wdHVtLmNvbTxtYWlsdG86amFkb24ubWNkb3dlbGxAb3B0dW0uY29t
Pg0KDQoNClRoaXMgZS1tYWlsLCBpbmNsdWRpbmcgYXR0YWNobWVudHMsIG1heSBpbmNsdWRlIGNv
bmZpZGVudGlhbCBhbmQvb3INCnByb3ByaWV0YXJ5IGluZm9ybWF0aW9uLCBhbmQgbWF5IGJlIHVz
ZWQgb25seSBieSB0aGUgcGVyc29uIG9yIGVudGl0eQ0KdG8gd2hpY2ggaXQgaXMgYWRkcmVzc2Vk
LiBJZiB0aGUgcmVhZGVyIG9mIHRoaXMgZS1tYWlsIGlzIG5vdCB0aGUgaW50ZW5kZWQNCnJlY2lw
aWVudCBvciBpbnRlbmRlZCByZWNpcGllbnTigJlzIGF1dGhvcml6ZWQgYWdlbnQsIHRoZSByZWFk
ZXIgaXMgaGVyZWJ5DQpub3RpZmllZCB0aGF0IGFueSBkaXNzZW1pbmF0aW9uLCBkaXN0cmlidXRp
b24gb3IgY29weWluZyBvZiB0aGlzIGUtbWFpbCBpcw0KcHJvaGliaXRlZC4gSWYgeW91IGhhdmUg
cmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlDQpzZW5kZXIg
YnkgcmVwbHlpbmcgdG8gdGhpcyBtZXNzYWdlIGFuZCBkZWxldGUgdGhpcyBlLW1haWwgaW1tZWRp
YXRlbHkuCg==

--_000_PH0PR22MB321097F1C9AC0513B50F885E91079PH0PR22MB3210namp_
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6dj0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTp2bWwiIHhtbG5zOm89InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOm9mZmljZSIgeG1sbnM6dz0idXJuOnNjaGVt
YXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6d29yZCIgeG1sbnM6eD0idXJuOnNjaGVtYXMtbWljcm9z
b2Z0LWNvbTpvZmZpY2U6ZXhjZWwiIHhtbG5zOmR0PSJ1dWlkOkMyRjQxMDEwLTY1QjMtMTFkMS1B
MjlGLTAwQUEwMEMxNDg4MiIgeG1sbnM6bT0iaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS9v
ZmZpY2UvMjAwNC8xMi9vbW1sIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvVFIvUkVDLWh0bWw0
MCI+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0idGV4
dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxtZXRhIG5hbWU9IkdlbmVyYXRvciIgY29udGVudD0i
TWljcm9zb2Z0IFdvcmQgMTUgKGZpbHRlcmVkIG1lZGl1bSkiPg0KPCEtLVtpZiAhbXNvXT48c3R5
bGU+dlw6KiB7YmVoYXZpb3I6dXJsKCNkZWZhdWx0I1ZNTCk7fQ0Kb1w6KiB7YmVoYXZpb3I6dXJs
KCNkZWZhdWx0I1ZNTCk7fQ0Kd1w6KiB7YmVoYXZpb3I6dXJsKCNkZWZhdWx0I1ZNTCk7fQ0KLnNo
YXBlIHtiZWhhdmlvcjp1cmwoI2RlZmF1bHQjVk1MKTt9DQo8L3N0eWxlPjwhW2VuZGlmXS0tPjxz
dHlsZT48IS0tDQovKiBGb250IERlZmluaXRpb25zICovDQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFt
aWx5OiJDYW1icmlhIE1hdGgiOw0KCXBhbm9zZS0xOjIgNCA1IDMgNSA0IDYgMyAyIDQ7fQ0KQGZv
bnQtZmFjZQ0KCXtmb250LWZhbWlseTpDYWxpYnJpOw0KCXBhbm9zZS0xOjIgMTUgNSAyIDIgMiA0
IDMgMiA0O30NCi8qIFN0eWxlIERlZmluaXRpb25zICovDQpwLk1zb05vcm1hbCwgbGkuTXNvTm9y
bWFsLCBkaXYuTXNvTm9ybWFsDQoJe21hcmdpbjowaW47DQoJZm9udC1zaXplOjExLjBwdDsNCglm
b250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjt9DQphOmxpbmssIHNwYW4uTXNvSHlwZXJs
aW5rDQoJe21zby1zdHlsZS1wcmlvcml0eTo5OTsNCgljb2xvcjojMDU2M0MxOw0KCXRleHQtZGVj
b3JhdGlvbjp1bmRlcmxpbmU7fQ0KcC5Nc29QbGFpblRleHQsIGxpLk1zb1BsYWluVGV4dCwgZGl2
Lk1zb1BsYWluVGV4dA0KCXttc28tc3R5bGUtcHJpb3JpdHk6OTk7DQoJbXNvLXN0eWxlLWxpbms6
IlBsYWluIFRleHQgQ2hhciI7DQoJbWFyZ2luOjBpbjsNCglmb250LXNpemU6MTEuMHB0Ow0KCWZv
bnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCnNwYW4uUGxhaW5UZXh0Q2hhcg0KCXtt
c28tc3R5bGUtbmFtZToiUGxhaW4gVGV4dCBDaGFyIjsNCgltc28tc3R5bGUtcHJpb3JpdHk6OTk7
DQoJbXNvLXN0eWxlLWxpbms6IlBsYWluIFRleHQiOw0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixz
YW5zLXNlcmlmO30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5
Ow0KCWZvbnQtc2l6ZToxMC4wcHQ7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3NpemU6OC41aW4g
MTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYuV29yZFNlY3Rp
b24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+PCEtLVtpZiBndGUgbXNvIDld
Pjx4bWw+DQo8bzpzaGFwZWRlZmF1bHRzIHY6ZXh0PSJlZGl0IiBzcGlkbWF4PSIxMDI2IiAvPg0K
PC94bWw+PCFbZW5kaWZdLS0+PCEtLVtpZiBndGUgbXNvIDldPjx4bWw+DQo8bzpzaGFwZWxheW91
dCB2OmV4dD0iZWRpdCI+DQo8bzppZG1hcCB2OmV4dD0iZWRpdCIgZGF0YT0iMSIgLz4NCjwvbzpz
aGFwZWxheW91dD48L3htbD48IVtlbmRpZl0tLT4NCjwvaGVhZD4NCjxib2R5IGxhbmc9IkVOLVVT
IiBsaW5rPSIjMDU2M0MxIiB2bGluaz0iIzk1NEY3MiIgc3R5bGU9IndvcmQtd3JhcDpicmVhay13
b3JkIj4NCjxkaXYgY2xhc3M9IldvcmRTZWN0aW9uMSI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+RnJpZW5kcyw8bzpwPjwv
bzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1z
aXplOjEyLjBwdDtjb2xvcjpibGFjayI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6Ymxh
Y2siPkkgYW0gYnV0IGEgc21hbGwgYnlzdGFuZGVyIGFzIEkgd2F0Y2ggaW4gYXdlIGF0IHRoZSBp
bmNyZWRpYmxlIHdvcmsgZWFjaCBvZiB5b3UgZG8gdG8gYWR2YW5jZSB0aGUgS2VybmVsIGFuZCBM
aW51eC48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBz
dHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+V2hhdCB5b3UgYXJlIHdvcmtpbmcg
b24gaXMgc28gaW1wb3J0YW50LiBZb3VyIGlkZWFzLCBhbmQgaG93IHlvdSBleHByZXNzIHRoZW0g
aW50byB0aGUgY29kZSB5b3Ugd3JpdGUsIGJlY29tZSB0aGUgZm91bmRhdGlvbiBmb3IgYSBiZXR0
ZXIgd29ybGQuPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNw
YW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPkkgY2FuIHRlbGwgeW91IHRo
YXQgeW91ciBzdXBwb3J0IGZvciBzMzkweCBhcmNoaXRlY3R1cmUgaXMgcXVpdGUgbWVhbmluZ2Z1
bCB0byBteSBjb21wYW55IGFzIHdlIHdvcmsgdG8gaW1wcm92ZSBhY2Nlc3MsIGNvc3QsIGFuZCBw
b3NpdGl2ZSBvdXRjb21lcyBpbiBoZWFsdGhjYXJlLg0KPG86cD48L286cD48L3NwYW4+PC9wPg0K
PHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6
YmxhY2siPldlIHVzZSBtYW55IHMzOTB4IExpbnV4IHNlcnZlcnMgYW5kIFZNcyBmb3IgY3JpdGlj
YWwgc3lzdGVtcy48bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFjayI+PG86cD4mbmJzcDs8L286
cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6
ZToxMi4wcHQ7Y29sb3I6YmxhY2siPlRoYW5rIHlvdSBmb3IgZXZlcnl0aGluZyB5b3UgZG8uIE1h
bnkgb2YgdXMgYXQgbWFueSBjb21wYW5pZXMgZGVlcGx5IGFwcHJlY2lhdGUgeW91LjxvOnA+PC9v
OnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNp
emU6MTIuMHB0O2NvbG9yOmJsYWNrIj48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpibGFj
ayI+V2l0aCBzaW5jZXJlIHJlc3BlY3QsPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPjxv
OnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNrIj4tSmFkb248bzpwPjwvbzpwPjwvc3Bh
bj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBw
dDtjb2xvcjpibGFjayI+PG86cD4mbmJzcDs8L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6YmxhY2siPkphZG9u
IE1jRG93ZWxsPC9zcGFuPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTQuMHB0O2NvbG9yOmJsYWNr
Ij4mbmJzcDs8L3NwYW4+PGI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxNC4wcHQ7Y29sb3I6I0NE
NUMxMiI+fDwvc3Bhbj48L2I+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMi4wcHQ7Y29sb3I6Ymxh
Y2siPiZuYnNwOzwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEwLjBwdDtjb2xvcjojMTcz
NzVFIj48aW1nIHdpZHRoPSI3NyIgaGVpZ2h0PSIyMyIgc3R5bGU9IndpZHRoOi44aW47aGVpZ2h0
Oi4yNDE2aW4iIGlkPSJQaWN0dXJlX3gwMDIwXzEiIHNyYz0iY2lkOmltYWdlMDAxLnBuZ0AwMUQ4
Rjk4Qi44MEU4N0QwMCIgYWx0PSJvcHR1bSUyMGxvZ28lMjBnaWYlMjAyMDBweCI+PC9zcGFuPjxv
OnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6
ZTo5LjBwdDtjb2xvcjojNUY1RjVGIj5EaXJlY3RvciAmYW1wOyBTZW5pb3IgUHJpbmNpcGFsIEVu
Z2luZWVyLCBUTENQPG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTo5LjBwdDtjb2xvcjojNUY1RjVGIj5FbnRlcnByaXNlIEhv
c3RpbmcgU2VydmljZXM6IEhQQyBJbmZyYXN0cnVjdHVyZSBEZWxpdmVyeTxvOnA+PC9vOnA+PC9z
cGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6OS4w
cHQ7Y29sb3I6IzVGNUY1RiI+TW9iaWxlOiA2MTItOTQwLTkyNjggfA0KPC9zcGFuPjxzcGFuIHN0
eWxlPSJmb250LXNpemU6OS4wcHQ7Y29sb3I6I0I5NTgwOSI+PGEgaHJlZj0ibWFpbHRvOmphZG9u
Lm1jZG93ZWxsQG9wdHVtLmNvbSI+amFkb24ubWNkb3dlbGxAb3B0dW0uY29tPC9hPjwvc3Bhbj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjguMHB0O2ZvbnQtZmFtaWx5OiZxdW90O0FyaWFsJnF1b3Q7
LHNhbnMtc2VyaWY7Y29sb3I6IzQxOEQ4RCI+PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAgY2xh
c3M9Ik1zb1BsYWluVGV4dCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8L2Rpdj4NCjxwPjxicj4N
ClRoaXMgZS1tYWlsLCBpbmNsdWRpbmcgYXR0YWNobWVudHMsIG1heSBpbmNsdWRlIGNvbmZpZGVu
dGlhbCBhbmQvb3I8YnI+DQpwcm9wcmlldGFyeSBpbmZvcm1hdGlvbiwgYW5kIG1heSBiZSB1c2Vk
IG9ubHkgYnkgdGhlIHBlcnNvbiBvciBlbnRpdHk8YnI+DQp0byB3aGljaCBpdCBpcyBhZGRyZXNz
ZWQuIElmIHRoZSByZWFkZXIgb2YgdGhpcyBlLW1haWwgaXMgbm90IHRoZSBpbnRlbmRlZDxicj4N
CnJlY2lwaWVudCBvciBpbnRlbmRlZCByZWNpcGllbnTigJlzIGF1dGhvcml6ZWQgYWdlbnQsIHRo
ZSByZWFkZXIgaXMgaGVyZWJ5PGJyPg0Kbm90aWZpZWQgdGhhdCBhbnkgZGlzc2VtaW5hdGlvbiwg
ZGlzdHJpYnV0aW9uIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgaXM8YnI+DQpwcm9oaWJpdGVk
LiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlm
eSB0aGU8YnI+DQpzZW5kZXIgYnkgcmVwbHlpbmcgdG8gdGhpcyBtZXNzYWdlIGFuZCBkZWxldGUg
dGhpcyBlLW1haWwgaW1tZWRpYXRlbHkuPC9wPjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_PH0PR22MB321097F1C9AC0513B50F885E91079PH0PR22MB3210namp_--

--_004_PH0PR22MB321097F1C9AC0513B50F885E91079PH0PR22MB3210namp_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=3172;
	creation-date="Wed, 16 Nov 2022 13:17:37 GMT";
	modification-date="Wed, 16 Nov 2022 13:17:37 GMT"
Content-ID: <image001.png@01D8F98B.80E87D00>
Content-Transfer-Encoding: base64

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

--_004_PH0PR22MB321097F1C9AC0513B50F885E91079PH0PR22MB3210namp_--


