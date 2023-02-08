Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3F768E86C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 07:39:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPe6N-0003SC-EM; Wed, 08 Feb 2023 01:38:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pPe6K-0003Rv-2z
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 01:38:40 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pPe6H-0005Nk-TJ
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 01:38:39 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3180i122018583; Wed, 8 Feb 2023 06:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=cnnXPYf/BeojgOxubKqOCHYOPyxSuo9trSE9VlKbUz8=;
 b=ep3sad0H0Pxs9Z4qXthGkqgwU5NqM03n3utx3Tk1ku8R0s6bs8EPSAah/T8Ad8wH6m7o
 sn3Wzk5Ku2lmR4KRl6nhbOXDbLVXvw5IR5d4INxWE9CKjel16CnWnggGusVPBH7WZ6G1
 2A82i89TZEKY4sigmWsD8iMGL+RRDyLQeVQQbmRy4ZrOFrazUDeK32mZIJceop0zAHjI
 dRA0h0hBUtHybwkbLaDME6NgKxbXJn+CSmMyDwaG6ExGIlPuGY0IlHqf0XAd3bnBiVLl
 Pk2PVUC15RTjutLIvfBaZVy78bhJ8bcjSOPxU5bbq69yiSucCZTcocjDjP9mMqWap3lG eA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhdsdqe8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Feb 2023 06:38:32 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3185KnkE024997; Wed, 8 Feb 2023 06:38:31 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3njrbb9es9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Feb 2023 06:38:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBKcN5VKnk02bF/AzmnqOshQm62S+dWRLmjFqiPC2FfAynmOD/8wbqZw1Valx4HWB0xel20GZ3zLWw3/AQgmG5+5ooPJ3f6u8QueoMDzYnMVKIgZOPyWVOUU2S0PkF/MQYmnjS1msXX79nHifcZu2JZz0XGdwCyVOW5nGx7UAh+6D/zdDPcbV44Voxh86qgpHvbIrVM3DsW6gXhLctOZ3r+PiYf8BQDtli9NhdZzpRoTng4I7aD7NPek/VtPJBgTYKANfC6x6i4nN4o/71To5Gj5UEpejOSJo9rVGgOELSp23rfBsZfgblzQUsdw3UbBH7u8G8DX6iXBL0O2ckQ5gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cnnXPYf/BeojgOxubKqOCHYOPyxSuo9trSE9VlKbUz8=;
 b=Yw8xF0gz1Sc5QfjKtx8aPPHx/9XbK5i31XqNrczMz7k0oFUxHe9Ae/z8hUdbmlefdxlFT+2vgRBmFiencUxply9o541CEBkDU5lFOyVjfzUSFXzvmiIbt40H7jTeZ3YkTisMy1vEZLttfn5Oi8g1+3mxAslm6E9Irfzb80CqJr7tXR9QPsH+2Cw4WD/pj0Yszg9uD2Iz1cxogNP9Jr8W5n9arxpGmgezAp7gIThcuDzqWb+semOVCHk66B0eznMNlX/u1/kxZHO3s0oX6TJIS6ueRgc018QmOzSV5FY3Ah77PqjM4sV2Lj5kbS0TNqTwWD/ujk0V7BmLbk0LpidIGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cnnXPYf/BeojgOxubKqOCHYOPyxSuo9trSE9VlKbUz8=;
 b=BlwjeNlpb6uNlJ47C8Wmgng8TgvlAbWl5QWwXgjidxh5jXgRMLVEVyQmv/Qf6qZ2RFLsYVmxXNkSKI75k6B2ODZZjFR/hUxX5LQtI77geBPCDH4/qBc0wwSw78d07AXtSA14Tcj2pS2G65xxjyfa9nHO6HX9HG67RlpEUmfBPgY=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by PH0PR10MB5754.namprd10.prod.outlook.com (2603:10b6:510:148::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.16; Wed, 8 Feb
 2023 06:38:28 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::173d:13e2:13f9:efe6]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::173d:13e2:13f9:efe6%5]) with mapi id 15.20.6086.016; Wed, 8 Feb 2023
 06:38:28 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
CC: QEMU Devel Mailing List <qemu-devel@nongnu.org>, "clg@redhat.com"
 <clg@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>
Subject: Re: [PATCH v2 12/23] vfio-user: region read/write
Thread-Topic: [PATCH v2 12/23] vfio-user: region read/write
Thread-Index: AQHZNsSiXXrF8IfJH0+9Jgt+yMDbGq7CTvQAgAJTaYA=
Date: Wed, 8 Feb 2023 06:38:27 +0000
Message-ID: <C7E53D99-8F52-4EA2-9C01-5D38515D7B2C@oracle.com>
References: <cover.1675228037.git.john.g.johnson@oracle.com>
 <83ec17255d41c90eb3950364dd853b240398705b.1675228037.git.john.g.johnson@oracle.com>
 <20230206120724.065199c4.alex.williamson@redhat.com>
In-Reply-To: <20230206120724.065199c4.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR10MB3255:EE_|PH0PR10MB5754:EE_
x-ms-office365-filtering-correlation-id: eba60856-69c0-464e-2fa8-08db099f1632
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qjBqMrc/LDlPwfGFkJq4X0DDfK0vzQA/R9MP+1gBa10ONXizaqOwdvWynyAtHfWjLW5WHWd+i3s6VNNJ3HUVyBhpw7sowvl1y80FpDBRBou2P1dAVRvg/CxHbDsK7hqgJB6hWjeszUEGNNTSpkB5cnqTLqYNvjmH4O3TTvd/hrfUkspjNt7OtnxB36pyjJazfivQsIPFLZXsokzWnbHGL9X9mCPv3scYoN1oEnsCYnWvkJgqpTzUWbUuWpfoTlkll1xJB976fstCgRwTpkVSFSOSdZuH8MhkMSr1vvJzb+ZUgQTAiKF24bkLCz3V/kyRvPij6LQqU8yigq8vvKoL7uFNIOPiIWfzHGDl64gTgxwU+oAy7wfxsQgPbx7BAUPiqel5LmHCLm8/R9P9nq8xQbow9r5FPBRbXBrmsnRFWYWGXllg4SLZIxgUTHjwXj3cPQWtXuHIOON7pcxDsegpwRSOjk7BXwLay4v2BTqyFVZDD0JFl0Y+A0kF1gxOI6pjjRHtXU/sjDsSoiEmd9udMuEKV2zdoDb2pAbPyjlYIluC5Eqxy81fPqfxZIaZbBc9bo5EyxHXt7F1OU2GQP8hosIoZhpblzq78+Q8GK2vDUuNGU0DkBlQPd2QaJ6hcBEb3g/BvzYLTHd4TIwRWSwN8BICXvIcdVX2o25VlSWLGYBbNe6SdqHzPzDCWPG3HW5s96sVN/P5yLvunNNDTFQFyYkswT0a50CFoxiFsm1et48=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(39860400002)(376002)(136003)(366004)(451199018)(38100700002)(122000001)(86362001)(2906002)(33656002)(38070700005)(316002)(54906003)(41300700001)(36756003)(5660300002)(8936002)(76116006)(83380400001)(6916009)(4326008)(8676002)(66556008)(66476007)(66446008)(64756008)(6506007)(66946007)(53546011)(6486002)(66899018)(478600001)(26005)(6512007)(186003)(71200400001)(2616005)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFMxTmIwaGhzYXZzSmxyZjZxK2t2aFhzL0ZoSDJ3M29mRDRPQzUxcTN5TmVP?=
 =?utf-8?B?WmkzcktRSHo3S2JoRldYbDdQUTRzYlpPYUtiaHJ4OEhSRS9kOHhVczB0VEU2?=
 =?utf-8?B?WGVPWjNLOUswQWU1SUNaeTBoUFFEckIxOVdrSUtydk1OYkZkRjRFNmRxU0JL?=
 =?utf-8?B?UUdvL1FoSncxOTduR3hnR1lsQjBGWnNHaWV1cllPVzFVbUp0WEF4d0Q3WUpB?=
 =?utf-8?B?ZFBISXh2Q29hVDVjWDQzMDBiaDVrUXNlK2dsZC8rSkJ6TXFNeVBFTnZMQ0hF?=
 =?utf-8?B?WkM3UVhrQkFmeTR0elcvT3lOdnpRNEpjWTRBc1RiOXdnd2JKWHB6T2h1M3R1?=
 =?utf-8?B?a1lQSUhmd1cwTlVvUTNMc1hIdE01SlNiaEJYNWZHOTY4MTF4YjM5OUxveEZu?=
 =?utf-8?B?SWNtWHY5bHFTbDhjUXlaa2pCYlV3bys3djVmc3BsZVJ4OUpvVmZLM0thUVRL?=
 =?utf-8?B?YjVJaE5SeFo1V1BqNUxKYWRJOVFBVW8xSkZ1YVR3NWlNempkdHRCWmtrWnUz?=
 =?utf-8?B?SFV6aWhjdGlheUZJcEM4a1ZOaTUwNDkyT3Q5N0I0c2swYnpOQWdxTHVNSXV6?=
 =?utf-8?B?dWNGY0M5QXZOcnhSR2crTEFSL3hYRkNSMW9hQk9IWVB2dU1YVzZ4c3ZEemM2?=
 =?utf-8?B?VmpqVWtjN0JEeXl0WXhPTnBxS2s2aGJRdVBrcW9rd1NWdmdwVmthU05NalRB?=
 =?utf-8?B?N3pJdHJsOVJOZzdhOE5GeEdSeHd1WDJWYXVDbnVzckltVnNNZytyOXhpZHZ5?=
 =?utf-8?B?eEt1NWp5U0doOUxoL1ZJUDVTT0ZVVWRYZ1d4VDd0RmpaVzN1SVRrYUFHRDRK?=
 =?utf-8?B?cDdqck9FdTBsV29iVVpBUlRFcU03SkRhU0Z4OHRWcEtlbmhSYitCdFNDbjYr?=
 =?utf-8?B?cFZ0SFdBQjhKSmxsSXF2d3hUMlpqTXVtNDUxZ3dKTFRDcTdwY2FRSDlKSkNU?=
 =?utf-8?B?SlZkZnhKdXhEd2dHUVlWTFNaQW1tNC9PcEpXanlyaGY3bEVNNWUweXk2NEd2?=
 =?utf-8?B?TGVyelFIekRKaVhPMXZnaEhFS1U4YnR3Q1VIQ1YwRnh6VEhMR3RMNW5iVTFx?=
 =?utf-8?B?ZG16TnVOZjlaQVdML1pBT0lFcE43azFHOHNrbmZHTSszRlR4Nmh5emVac1Rm?=
 =?utf-8?B?WFAyMXVLTnYxaWZwbjVlZ3Z6VVVrRm5PSU1KczVjdGhTOUZQdldsVDExU1NP?=
 =?utf-8?B?TmdvQTlhUm9rdHB4V0NyOTNQUUpjN2VkK3V0VzFGb0tmYUYrOUVtUVF4Zk5p?=
 =?utf-8?B?cHI0Wmp3bkY0ZEczMXNtY3RBU2VEckhMRU1WT1prYWQ0YllwY0ZPN0N1R0ZC?=
 =?utf-8?B?eTRpamZvYjJVV2YxQzFZaDdHNHVCM3BwV1VaZEJlQVRmOVFnRXJWU01lS0FT?=
 =?utf-8?B?MGsyNWNKVTZXRjR3KzBKY0JxRVdHMUtDaXkwMmdkd283MUlKdWtOYWpIRmNX?=
 =?utf-8?B?RE9BZ3o0NWJjeE9qdUNDSi9qUTZqanBqdlRySjFPbnlTSlZEMXJCamlVdUZP?=
 =?utf-8?B?bDQvNGhKR21hemd3V3VmZUwwb3hOdnc1VEJUc3lPaDBJY3NNSkpKYzcrM3JS?=
 =?utf-8?B?b01SajJOeWN1a0ZVbEJqcXFsQjA2aDQ3elB6akdoNXF1dHVud2drTTFlMVFH?=
 =?utf-8?B?elB5NHN1TGZpTzdlR2MrNm52WWYvbGJBOVloVzh0MTNWR1J2bStJQmhuZ0Ur?=
 =?utf-8?B?ZHlGWmk5VENYQ01ubW45VmtZUmRiQktjcjB6cXEwTnR1YmNPU2VGMEVnQ1J3?=
 =?utf-8?B?Uk9FdnFWVHlHbExFNkFZd2hPZEFGS2hkSHgvZ3o4ZFRiUkRFQUVJa0wzUTdm?=
 =?utf-8?B?WGRNc093bWROQ1ozejV1ZHUwWHl2TC91STE2TmNveU5mV0k5ZStiOVRRNEdm?=
 =?utf-8?B?bFJESEh6YkJvUURKdVU3RStCcU5XZzlYZmxDVVkvQmVMeGYwZEY3WFdtRnBk?=
 =?utf-8?B?Z3hGWWNETUl4S3pKR2ZYQU90M3RKL2NKRzRVK0h6bmpoT0pGdVlONDB5dzND?=
 =?utf-8?B?SXMxMXRzWFNZRktVZmpPeTY4WXd3TUN3S0pPUW1TNDd2SUc2QXE0eFpwaG92?=
 =?utf-8?B?WFpwK2tKWVNjMTZGYUk3UFhSUy9GY2RLTWFVZXJ1ZnNJVzJpNkRYT1VCZkZU?=
 =?utf-8?B?MnUzQ3g1dm0rWHJ5OEozZVQyZ2NSWXJYdzhwM0hOM1h6bUlhVzlTc1lHY0NP?=
 =?utf-8?B?Wmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <69BCF533651AE845B50877FD0A64D77C@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: wRk/6c3190n5db3z8bGXS0aPMOn+hwBiEgbtVxD05cL17ETK5S+uLK4tL3M4gFy0eMICV1GiCGn3bmV2GFrr63Vii3Vr9yG2/ShLE4Bv9CNIWxXO3/WN37RMYF+LEP1C4jPBWnW4Ot6+64Zs9WbsVK8IrtOkc1FiY7hszgXZqxv8XqBWW0uB5KnKfyTTB05TY3gPr8DJcn3zvUHRcGHdhJEmCg6zjwmdgKpYoJh9nQsPv33S4mUcf7wcUB5njbopMfRfq6rS1Ws7Yhz4lxBOenLEBlEsbJYwJJ0VCHvXlfO3ez95IEaveb5Xd5+2a0khPfX7T1HvDiHuN95uLt78UU3ZWoHIaAEXRhn/7omAxkUVdzinkQn8AT1k7zdOm48al3+1GfDts+aOp5H99nkxdfK6Dv9R1BA8dyNpPOv0Kp1JUrHXnYfl+ACW9tm00TNYTQY3f730Qh0lVon+0zA7w9F9pSEaGmPG/5iftixQlAp4qTQHoJP3anU81ewFliNT1ZsVVY5DYP6AuSnqonXiDQMwHUtcz0B+2WBzEG8Cng/ZX/xqyZFWTB+W46mCg04L04GCUJtesABGg0ngHWoLjEd6PuC8hJPQW/UB9YwL1HqqK2HsmNsGiWL1B1XWP3o1xdvGKEaEZ9ryWhQCaai38Ic0hnVIKRgJ/6KvIQlPE7UThpY5+75jKdCxBcsbze8IrQ2MS6iftFMU+T09GfS7bB3Ptl7E9fSc0itjIrP2CrUnYdvQs2PjC2GAtAlIvfU3xt1hOcf3oqUqDJXYhlpPjaNBg1JfNYJL0qBALrIElMe3QYWsQY/CDq+yBFZAxT79
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eba60856-69c0-464e-2fa8-08db099f1632
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2023 06:38:27.9582 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IqE27cPBuQpmUyW/O+moDINBasDgA/GVuOwmPld003u/d+YlWkMFa4372nqNJMtc5WIeFtBnMIWynV40UPesmKO4LvaLZSwLNMBR/4axb78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5754
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_02,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302080059
X-Proofpoint-ORIG-GUID: Bz7KeegDuCUXXfou_58IpKdUVI7mb7ue
X-Proofpoint-GUID: Bz7KeegDuCUXXfou_58IpKdUVI7mb7ue
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

DQoNCj4gT24gRmViIDYsIDIwMjMsIGF0IDExOjA3IEFNLCBBbGV4IFdpbGxpYW1zb24gPGFsZXgu
d2lsbGlhbXNvbkByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIFdlZCwgIDEgRmViIDIwMjMg
MjE6NTU6NDggLTA4MDANCj4gSm9obiBKb2huc29uIDxqb2huLmcuam9obnNvbkBvcmFjbGUuY29t
PiB3cm90ZToNCj4gDQo+PiBBZGQgc3VwcG9ydCBmb3IgcG9zdGVkIHdyaXRlcyBvbiByZW1vdGUg
ZGV2aWNlcw0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBFbGVuYSBVZmltdHNldmEgPGVsZW5hLnVm
aW10c2V2YUBvcmFjbGUuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSm9obiBHIEpvaG5zb24gPGpv
aG4uZy5qb2huc29uQG9yYWNsZS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKYWdhbm5hdGhhbiBS
YW1hbiA8amFnLnJhbWFuQG9yYWNsZS5jb20+DQo+PiAtLS0NCj4+IGh3L3ZmaW8vdXNlci1wcm90
b2NvbC5oICAgICAgIHwgIDEyICsrKysrDQo+PiBody92ZmlvL3VzZXIuaCAgICAgICAgICAgICAg
ICB8ICAgMSArDQo+PiBpbmNsdWRlL2h3L3ZmaW8vdmZpby1jb21tb24uaCB8ICAgMyArLQ0KPj4g
aHcvdmZpby9jb21tb24uYyAgICAgICAgICAgICAgfCAgMjMgKysrKysrLS0tDQo+PiBody92Zmlv
L3BjaS5jICAgICAgICAgICAgICAgICB8ICAgNSArLQ0KPj4gaHcvdmZpby91c2VyLXBjaS5jICAg
ICAgICAgICAgfCAgIDUgKysNCj4+IGh3L3ZmaW8vdXNlci5jICAgICAgICAgICAgICAgIHwgMTEy
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gaHcvdmZpby90
cmFjZS1ldmVudHMgICAgICAgICAgfCAgIDEgKw0KPj4gOCBmaWxlcyBjaGFuZ2VkLCAxNTQgaW5z
ZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL2h3L3ZmaW8v
dXNlci1wcm90b2NvbC5oIGIvaHcvdmZpby91c2VyLXByb3RvY29sLmgNCj4+IGluZGV4IDZmNzBh
NDguLjY5ODc0MzUgMTAwNjQ0DQo+PiAtLS0gYS9ody92ZmlvL3VzZXItcHJvdG9jb2wuaA0KPj4g
KysrIGIvaHcvdmZpby91c2VyLXByb3RvY29sLmgNCj4+IEBAIC0xMzksNCArMTM5LDE2IEBAIHR5
cGVkZWYgc3RydWN0IHsNCj4+ICAgICB1aW50NjRfdCBvZmZzZXQ7DQo+PiB9IFZGSU9Vc2VyUmVn
aW9uSW5mbzsNCj4+IA0KPj4gKy8qDQo+PiArICogVkZJT19VU0VSX1JFR0lPTl9SRUFEDQo+PiAr
ICogVkZJT19VU0VSX1JFR0lPTl9XUklURQ0KPj4gKyAqLw0KPj4gK3R5cGVkZWYgc3RydWN0IHsN
Cj4+ICsgICAgVkZJT1VzZXJIZHIgaGRyOw0KPj4gKyAgICB1aW50NjRfdCBvZmZzZXQ7DQo+PiAr
ICAgIHVpbnQzMl90IHJlZ2lvbjsNCj4+ICsgICAgdWludDMyX3QgY291bnQ7DQo+PiArICAgIGNo
YXIgZGF0YVtdOw0KPj4gK30gVkZJT1VzZXJSZWdpb25SVzsNCj4+ICsNCj4+ICNlbmRpZiAvKiBW
RklPX1VTRVJfUFJPVE9DT0xfSCAqLw0KPj4gZGlmZiAtLWdpdCBhL2h3L3ZmaW8vdXNlci5oIGIv
aHcvdmZpby91c2VyLmgNCj4+IGluZGV4IGU2NDg1ZGMuLjMwMTJhODYgMTAwNjQ0DQo+PiAtLS0g
YS9ody92ZmlvL3VzZXIuaA0KPj4gKysrIGIvaHcvdmZpby91c2VyLmgNCj4+IEBAIC04NCw2ICs4
NCw3IEBAIHR5cGVkZWYgc3RydWN0IFZGSU9Vc2VyUHJveHkgew0KPj4gLyogVkZJT1Byb3h5IGZs
YWdzICovDQo+PiAjZGVmaW5lIFZGSU9fUFJPWFlfQ0xJRU5UICAgICAgICAweDENCj4+ICNkZWZp
bmUgVkZJT19QUk9YWV9GT1JDRV9RVUVVRUQgIDB4NA0KPj4gKyNkZWZpbmUgVkZJT19QUk9YWV9O
T19QT1NUICAgICAgIDB4OA0KPj4gDQo+PiBWRklPVXNlclByb3h5ICp2ZmlvX3VzZXJfY29ubmVj
dF9kZXYoU29ja2V0QWRkcmVzcyAqYWRkciwgRXJyb3IgKiplcnJwKTsNCj4+IHZvaWQgdmZpb191
c2VyX2Rpc2Nvbm5lY3QoVkZJT1VzZXJQcm94eSAqcHJveHkpOw0KPj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvaHcvdmZpby92ZmlvLWNvbW1vbi5oIGIvaW5jbHVkZS9ody92ZmlvL3ZmaW8tY29tbW9u
LmgNCj4+IGluZGV4IDlmYjRjODAuLmJiYzRiMTUgMTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRlL2h3
L3ZmaW8vdmZpby1jb21tb24uaA0KPj4gKysrIGIvaW5jbHVkZS9ody92ZmlvL3ZmaW8tY29tbW9u
LmgNCj4+IEBAIC01Nyw2ICs1Nyw3IEBAIHR5cGVkZWYgc3RydWN0IFZGSU9SZWdpb24gew0KPj4g
ICAgIFZGSU9NbWFwICptbWFwczsNCj4+ICAgICB1aW50OF90IG5yOyAvKiBjYWNoZSB0aGUgcmVn
aW9uIG51bWJlciBmb3IgZGVidWcgKi8NCj4+ICAgICBpbnQgZmQ7IC8qIGZkIHRvIG1tYXAoKSBy
ZWdpb24gKi8NCj4+ICsgICAgYm9vbCBwb3N0X3dyOyAvKiB3cml0ZXMgY2FuIGJlIHBvc3RlZCAq
Lw0KPj4gfSBWRklPUmVnaW9uOw0KPj4gDQo+PiB0eXBlZGVmIHN0cnVjdCBWRklPTWlncmF0aW9u
IHsNCj4+IEBAIC0xODAsNyArMTgxLDcgQEAgc3RydWN0IFZGSU9EZXZpY2VJTyB7DQo+PiAgICAg
aW50ICgqcmVnaW9uX3JlYWQpKFZGSU9EZXZpY2UgKnZkZXYsIHVpbnQ4X3QgbnIsIG9mZl90IG9m
ZiwgdWludDMyX3Qgc2l6ZSwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqZGF0YSk7
DQo+PiAgICAgaW50ICgqcmVnaW9uX3dyaXRlKShWRklPRGV2aWNlICp2ZGV2LCB1aW50OF90IG5y
LCBvZmZfdCBvZmYsIHVpbnQzMl90IHNpemUsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAg
dm9pZCAqZGF0YSk7DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqZGF0YSwgYm9v
bCBwb3N0KTsNCj4+IH07DQo+PiANCj4+IHN0cnVjdCBWRklPQ29udGFpbmVySU8gew0KPj4gZGlm
ZiAtLWdpdCBhL2h3L3ZmaW8vY29tbW9uLmMgYi9ody92ZmlvL2NvbW1vbi5jDQo+PiBpbmRleCBk
MjZiMzI1Li5kZTY0ZTUzIDEwMDY0NA0KPj4gLS0tIGEvaHcvdmZpby9jb21tb24uYw0KPj4gKysr
IGIvaHcvdmZpby9jb21tb24uYw0KPj4gQEAgLTIxNSw2ICsyMTUsNyBAQCB2b2lkIHZmaW9fcmVn
aW9uX3dyaXRlKHZvaWQgKm9wYXF1ZSwgaHdhZGRyIGFkZHIsDQo+PiAgICAgICAgIHVpbnQzMl90
IGR3b3JkOw0KPj4gICAgICAgICB1aW50NjRfdCBxd29yZDsNCj4+ICAgICB9IGJ1ZjsNCj4+ICsg
ICAgYm9vbCBwb3N0ID0gcmVnaW9uLT5wb3N0X3dyOw0KPj4gICAgIGludCByZXQ7DQo+PiANCj4+
ICAgICBzd2l0Y2ggKHNpemUpIHsNCj4+IEBAIC0yMzUsMTIgKzIzNiwxOSBAQCB2b2lkIHZmaW9f
cmVnaW9uX3dyaXRlKHZvaWQgKm9wYXF1ZSwgaHdhZGRyIGFkZHIsDQo+PiAgICAgICAgIGJyZWFr
Ow0KPj4gICAgIH0NCj4+IA0KPj4gLSAgICByZXQgPSB2YmFzZWRldi0+aW8tPnJlZ2lvbl93cml0
ZSh2YmFzZWRldiwgcmVnaW9uLT5uciwgYWRkciwgc2l6ZSwgJmJ1Zik7DQo+PiArICAgIC8qIHJl
YWQtYWZ0ZXItd3JpdGUgaGF6YXJkIGlmIGd1ZXN0IGNhbiBkaXJlY3RseSBhY2Nlc3MgcmVnaW9u
ICovDQo+PiArICAgIGlmIChyZWdpb24tPm5yX21tYXBzKSB7DQo+PiArICAgICAgICBwb3N0ID0g
ZmFsc2U7DQo+PiArICAgIH0NCj4+ICsgICAgcmV0ID0gdmJhc2VkZXYtPmlvLT5yZWdpb25fd3Jp
dGUodmJhc2VkZXYsIHJlZ2lvbi0+bnIsIGFkZHIsIHNpemUsICZidWYsDQo+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBvc3QpOw0KPj4gICAgIGlmIChyZXQgIT0gc2l6
ZSkgew0KPj4gKyAgICAgICAgY29uc3QgY2hhciAqZXJyID0gcmV0IDwgMCA/IHN0cmVycm9yKC1y
ZXQpIDogInNob3J0IHdyaXRlIjsNCj4+ICsNCj4+ICAgICAgICAgZXJyb3JfcmVwb3J0KCIlcygl
czpyZWdpb24lZCsweCUiSFdBRERSX1BSSXgiLCAweCUiUFJJeDY0DQo+PiAtICAgICAgICAgICAg
ICAgICAgICAgIiwlZCkgZmFpbGVkOiAlbSIsDQo+PiArICAgICAgICAgICAgICAgICAgICAgIiwl
ZCkgZmFpbGVkOiAlcyIsDQo+PiAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgdmJhc2Vk
ZXYtPm5hbWUsIHJlZ2lvbi0+bnIsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgYWRkciwgZGF0
YSwgc2l6ZSk7DQo+PiArICAgICAgICAgICAgICAgICAgICAgYWRkciwgZGF0YSwgc2l6ZSwgZXJy
KTsNCj4+ICAgICB9DQo+PiAgICAgdHJhY2VfdmZpb19yZWdpb25fd3JpdGUodmJhc2VkZXYtPm5h
bWUsIHJlZ2lvbi0+bnIsIGFkZHIsIGRhdGEsIHNpemUpOw0KPj4gDQo+PiBAQCAtMjcxLDkgKzI3
OSwxMSBAQCB1aW50NjRfdCB2ZmlvX3JlZ2lvbl9yZWFkKHZvaWQgKm9wYXF1ZSwNCj4+IA0KPj4g
ICAgIHJldCA9IHZiYXNlZGV2LT5pby0+cmVnaW9uX3JlYWQodmJhc2VkZXYsIHJlZ2lvbi0+bnIs
IGFkZHIsIHNpemUsICZidWYpOw0KPj4gICAgIGlmIChyZXQgIT0gc2l6ZSkgew0KPj4gLSAgICAg
ICAgZXJyb3JfcmVwb3J0KCIlcyglczpyZWdpb24lZCsweCUiSFdBRERSX1BSSXgiLCAlZCkgZmFp
bGVkOiAlbSIsDQo+PiArICAgICAgICBjb25zdCBjaGFyICplcnIgPSByZXQgPCAwID8gc3RyZXJy
b3IoLXJldCkgOiAic2hvcnQgcmVhZCI7DQo+PiArDQo+PiArICAgICAgICBlcnJvcl9yZXBvcnQo
IiVzKCVzOnJlZ2lvbiVkKzB4JSJIV0FERFJfUFJJeCIsICVkKSBmYWlsZWQ6ICVzIiwNCj4+ICAg
ICAgICAgICAgICAgICAgICAgIF9fZnVuY19fLCB2YmFzZWRldi0+bmFtZSwgcmVnaW9uLT5uciwN
Cj4+IC0gICAgICAgICAgICAgICAgICAgICBhZGRyLCBzaXplKTsNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICBhZGRyLCBzaXplLCBlcnIpOw0KPj4gICAgICAgICByZXR1cm4gKHVpbnQ2NF90KS0x
Ow0KPj4gICAgIH0NCj4+IA0KPj4gQEAgLTE1ODQsNiArMTU5NCw3IEBAIGludCB2ZmlvX3JlZ2lv
bl9zZXR1cChPYmplY3QgKm9iaiwgVkZJT0RldmljZSAqdmJhc2VkZXYsIFZGSU9SZWdpb24gKnJl
Z2lvbiwNCj4+ICAgICByZWdpb24tPnNpemUgPSBpbmZvLT5zaXplOw0KPj4gICAgIHJlZ2lvbi0+
ZmRfb2Zmc2V0ID0gaW5mby0+b2Zmc2V0Ow0KPj4gICAgIHJlZ2lvbi0+bnIgPSBpbmRleDsNCj4+
ICsgICAgcmVnaW9uLT5wb3N0X3dyID0gZmFsc2U7DQo+PiAgICAgaWYgKHZiYXNlZGV2LT5yZWdm
ZHMgIT0gTlVMTCkgew0KPj4gICAgICAgICByZWdpb24tPmZkID0gdmJhc2VkZXYtPnJlZ2Zkc1tp
bmRleF07DQo+PiAgICAgfSBlbHNlIHsNCj4+IEBAIC0yNzExLDcgKzI3MjIsNyBAQCBzdGF0aWMg
aW50IHZmaW9faW9fcmVnaW9uX3JlYWQoVkZJT0RldmljZSAqdmJhc2VkZXYsIHVpbnQ4X3QgaW5k
ZXgsIG9mZl90IG9mZiwNCj4+IH0NCj4+IA0KPj4gc3RhdGljIGludCB2ZmlvX2lvX3JlZ2lvbl93
cml0ZShWRklPRGV2aWNlICp2YmFzZWRldiwgdWludDhfdCBpbmRleCwgb2ZmX3Qgb2ZmLA0KPj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3Qgc2l6ZSwgdm9pZCAqZGF0
YSkNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IHNpemUsIHZv
aWQgKmRhdGEsIGJvb2wgcG9zdCkNCj4+IHsNCj4gDQo+IFRoaXMgaXMgYWxsIGEgYml0IGNvbmZ1
c2luZyBhcyBhIG5vbi1wb3N0ZWQgd3JpdGUgb24gYmFyZSBtZXRhbCB3b3VsZA0KPiByZXF1aXJl
IGEgZm9sbG93LXVwIHJlYWQgdG8gZmx1c2ggdGhlIHdyaXRlLCBidXQgaW4gdGhlIGtlcm5lbCBj
YXNlIHdlDQo+IHJlbHkgb24gYm90aCB0aGUgYnVzIHByb3RvY29scyBhbmQgdGhlIHVzZXJzcGFj
ZSBkcml2ZXIgdG8gcGVyZm9ybSBzdWNoDQo+IGFjdGlvbnMgdG8gZW5mb3JjZSBjb2hlcmVuY3ku
ICBUaGUgcmVhZC1hZnRlci13cml0ZSBoYXphcmQgY29tbWVudCBhYm92ZQ0KPiBzdWdnZXN0cyB0
aGUgaXNzdWUgaXMgc3BsaXQgYWNjZXNzIGJldHdlZW4gbW1hcCBhbmQgcmVhZC93cml0ZSBhY3Jv
c3MNCj4gdGhlIHJlZ2lvbiwgd2hlcmUgdGhlIG1tYXAgYWNjZXNzIGJ5cGFzc2VzIHRoZSBzb2Nr
ZXQgcHJvdG9jb2wuICBCdXQNCj4gaXNuJ3QgdGhpcyBhY3R1YWxseSBhY3Jvc3MgdGhlIHdob2xl
IGRldmljZT8gIEZvciBleGFtcGxlLCBQQ0kgZG9lc24ndA0KPiBjYXJlIHdoaWNoIEJBUiBhIHdy
aXRlIHRhcmdldHMsIHJlYWRzIHRvIGFub3RoZXIgQkFSIGNhbm5vdCBieXBhc3MgdGhlDQo+IHdy
aXRlLCBhaXVpLiAgSU9XLCBjb3VsZG4ndCBhIHdyaXRlIHRvIGEgQkFSIHRoYXQgZG9lc24ndCBz
dXBwb3J0IG1tYXANCj4gYWZmZWN0IHRoZSBiZWhhdmlvciBvZiBhIEJBUiB0aGF0IGRvZXMgc3Vw
cG9ydCBtbWFwLCBhbmQgdGhlcmVmb3JlDQo+IHRoZXJlIHNob3VsZCBiZSBubyBwb3N0ZWQgd3Jp
dGVzIGZvciB0aGUgZW50aXJlIGRldmljZSBpZiBhbnkgcmVnaW9uDQo+IHN1cHBvcnRzIG1tYXAg
YWNjZXNzPw0KPiANCg0KCVRoZSBwcm90b2NvbCBoYXMgc2VxdWVudGlhbCBvcmRlcmluZywgc28g
aXNzdWVzIGFyaXNlIG9ubHkgd2hlbg0KcmVhZHMgdG8gbWFwcGVkIHJlZ2lvbnMgcGFzcyB3cml0
ZXMgdGhhdCB3ZXJlIHNlbnQgYXN5bmNocm9ub3VzbHkuICBUaGUgY29kZQ0KaXMgZGVzaWduZWQg
dG8gaGFuZGxlIGNvbW1vbiBkcml2ZXIgb3JkZXJpbmcgb3BlcmF0aW9uczogcmVhZGluZyBjb25m
aWcgc3BhY2UNCih3aGljaCBjYW7igJl0IGJlIG1hcHBlZCwgc28gdGhleeKAmXJlIHNlcXVlbnRp
YWxseSBvcmRlcmVkIGJ5IHRoZSBwcm90b2NvbCkNCmFuZCByZWFkaW5nIGEgbmVhcmJ5IHJlZ2lz
dGVyIChpbiB0aGUgc2FtZSByZWdpb24pLiAgVGhlcmUgaXMgYSDigJluby1wb3N04oCZDQp2Zmlv
LXVzZXIgb3B0aW9uIGluIGNhc2UgdGhlIGRyaXZlciByZWxpZXMgb24gb3JkZXJpbmcgcmVhZHMg
dG8gb3RoZXINCihub24tY29uZmlnKSByZWdpb25zDQoNCglJIG1hZGUgdGhpcyB0aGUgZGVmYXVs
dCBzaW5jZSBvZiB0aGUgdGhlIHByaW1hcnkgY3VzdG9tZXJzIGlzIGFuDQpOVk1FIGRldmljZSBz
ZXJ2ZXIgdGhhdCBwb2xscyBhIG1hcHBlZCBkb29yYmVsbCByZWdpb24gYW5kIHdhbnRzIHBvc3Rl
ZA0Kd3JpdGVzLg0KDQoNCj4gSSB3b25kZXIgaWYgYSBiZXR0ZXIgYXBwcm9hY2ggd291bGRuJ3Qg
YmUgdG8gbWFrZSBhbGwgd3JpdGVzIG9wZXJhdGlvbnMNCj4gc3luY2hyb25vdXMgYW5kIGF2b2lk
IHJlYWQtYWZ0ZXItd3JpdGUgaGF6YXJkIGJ5IHBlcmZvcm1pbmcgd3JpdGVzDQo+IHRocm91Z2gg
dGhlIG1tYXAgd2hlbiBhdmFpbGFibGUsIGllLiBtYWtlIHVzZSBvZiB0aGUgc2FtZSBieXBhc3Mg
dG8NCj4gYXZvaWQgdGhlIGhhemFyZC4NCj4gDQoNCglJIGNhbiBmbGlwIHRoZSBkZWZhdWx0IHRv
IGJlIHN0cmljdCBQQ0ksIGFuZCBmb3JjZSB0aGUgTlZNRQ0KZm9sa3MgdG8gdXNlIGFuIG9wdGlv
biB0byBlbmFibGUgcGVyZm9ybWFuY2UuDQoNCg0KPiBJbiBhbnkgY2FzZSwgSSB0aGluayB0aGlz
IGRlc2VydmVzIG1vcmUgY29tbWVudHMsIGJvdGggd2h5IHZmaW8tdXNlcg0KPiBuZWVkcyBpdCBh
bmQgd2h5IHZmaW8ta2VybmVsIGRvZXNuJ3QsIGFuZCBpZGVhbGx5IHRoZSBpbml0aWFsDQo+IHJl
YWQvd3JpdGUgaW1wbGVtZW50YXRpb24gd291bGQgYmUgZW50aXJlbHkgc3luY2hyb25vdXMgd2l0
aCBwb3N0ZWQNCj4gd3JpdGUgc3VwcG9ydCBhZGRlZCBhcyBhIHNlcGFyYXRlIHBhdGNoIHdpdGgg
ZnVsbCBleHBsYW5hdGlvbiBhbmQNCj4ganVzdGlmaWNhdGlvbi4gIFRoYW5rcywNCj4gDQoNCglT
dXJlLiAgT3JkZXJpbmcgaXMgYWx3YXlzIGEgcGFpbiB0byByZWFzb24gYWJvdXQuDQoNCgkJCQkJ
CUpKDQoNCg==

