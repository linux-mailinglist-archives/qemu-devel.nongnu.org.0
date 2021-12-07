Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6761646B4A5
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 08:52:42 +0100 (CET)
Received: from localhost ([::1]:49674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muVHF-0007hk-6d
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 02:52:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1muVDg-00054J-LF
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:49:00 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:26500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1muVDd-0005e0-Ra
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 02:49:00 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B74tbN3016268; 
 Tue, 7 Dec 2021 07:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Pb8bPoMOR6Khb2gZ9cTbOIC9JAsrj3zQAWYL/vE8bgQ=;
 b=TYgfgByVEj4MFkaE0loMST4q1TjrVJeiytdSQRe0ZjLJdFllWv9V9eUGkBlyv2hslpfi
 nb2YyKVo3XBqtqmZN+BI+/Syt/7n7hRaVcMwEY+XRAVpbEM7cU3sxnu6zS3YR18TFvmL
 kC4c/CpNNrJQfeLiqYeMiIJfPg80QvH2aAWhDNJq8u0XTvZQxwN5leMZ2K37kVatsez9
 smHBiJBDG7gGQy6OL1tk/LlC1XPHuLlLyQKCjGkDWBX6sVr6KyjNjccHM5WtndARq/eQ
 xXDcnXQ+R1ftzqmhPzOVZSvyrqnIMVUNidS2AYOqmB496xBW6h/w4N1wlYc7fMjPE0MH 3g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3csctwmjq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Dec 2021 07:48:55 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B77edR5007936;
 Tue, 7 Dec 2021 07:48:54 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by userp3020.oracle.com with ESMTP id 3cr1snjewx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Dec 2021 07:48:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3ipLw73HPNREq8ycHJpN48wKazkLV/oVTXIJkUaiGaIjHA8ftJxfhCbPeZkbYF14k3u96ygzujPjNLhi0HUI545wPMv7evkWCF/H0nthQu0+FrjiYQz8Uu4DSSNXR8y7nOZs3/dgab31+SsuKZ4jKB66LicB/SnqrIWE4UcgO9y4zA0Qb9Y7O3F6uEUiBIgqh01b03E6J6uxtEsoDnIq7YxbjZMHKO1CVH/ijynELPKGoiSmp6CsDr/xne2wo5TU46Rfu7NTxpmJRvgamsZjKbkwHFSewsYFgJpo3NLzfN2URk2ldy+CImGMEFs3NhlCFrCZPpQSwfpUsSy5LFXZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pb8bPoMOR6Khb2gZ9cTbOIC9JAsrj3zQAWYL/vE8bgQ=;
 b=BMS4fEmhjMXvO77/oia0jcPmWnzl6++sSXRoGyySE7KRJswPPV+q/KZQOps7sO3Htg5P9Qi6m2oTykcsGeerohnysU2H2YuuSWW94/ytMVHAcynoz7aL5H6JAaQPn84Pm+xrZI5VoIr055EgNMb95ZXTSo43GyfFdAkiOVe5+iw1ukBFkSo2W16mKuvbsa4cpy5ror5j9uaJWRA0WlRPmGzN40EptZVf2j7p/XgCNcKU2gsWF5WFT9hzy9GPNIE4FqtmWiuAKa8/t2xpczAyP/FIAb6clTW18iyHaFPuxWDEt5OmzSyrXMBMBbAiVRaK3qpsxuf7ys6CyDRukv2B6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pb8bPoMOR6Khb2gZ9cTbOIC9JAsrj3zQAWYL/vE8bgQ=;
 b=anr+tG7n2IoDR/dIvZc7qZ/YueMOlvAVAye4ESear8Jpd9d4DefHDbz0YbIRMwdzts5cnBZKzELDBbMevS+x4O6ndUPaDvjujVRYJRFldnl5AsoQnwLI6kSt1IRJdUBD/1S1PEAR4ynF0/kS+mJ/rZtW5P3u5L16M5yeRk/5nyc=
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BY5PR10MB4225.namprd10.prod.outlook.com (2603:10b6:a03:20f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Tue, 7 Dec
 2021 07:48:52 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::3c06:36a6:bab9:fffd]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::3c06:36a6:bab9:fffd%2]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 07:48:52 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC v3 05/19] Add validation ops vector
Thread-Topic: [RFC v3 05/19] Add validation ops vector
Thread-Index: AQHX0bosVKlwO+lUakmB15tUotLjU6wLifaAgBtQVYA=
Date: Tue, 7 Dec 2021 07:48:52 +0000
Message-ID: <AEEFBAEC-A0BA-4FD2-8647-068FFADB51D3@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
 <327df73b51de7a11657aea61295d735fdd0427fb.1636057885.git.john.g.johnson@oracle.com>
 <20211119154219.65a02f15.alex.williamson@redhat.com>
In-Reply-To: <20211119154219.65a02f15.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 244176a6-1178-44fc-25ac-08d9b956033a
x-ms-traffictypediagnostic: BY5PR10MB4225:EE_
x-microsoft-antispam-prvs: <BY5PR10MB422583D2073E5CF30D916903B66E9@BY5PR10MB4225.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0P9OxbZbwZBhXrRgj9dUdru1gSCFpx8KCmYOZ9+2UEt0Vrlv2sgq25XfDWhS79OGr4Aa1/4GhOjFHqzIrAH3okx1rpFmbv9AJwOE8qpCtSiJ6wSinIEk6/i3/kFUYhMoGLVDWJkXS0RKxCN8O5MVS7/eylq3XoRwPGWXR9Lkuw5uRa+Q/q6HM60Z1Ngqvz+uABISRn+fvX/KHR5K1z2pdKlcG8J7JsMB3EpK2IrFWiD8c/F4/WaXOwQhwmlt/HzQBaGRtTjPJgvwvZeKg/NAq78bYU1BeWWgBzpB3ZWfUXTvV0McZi8FuH5DETUvpM6y+WwKTQG/cucIq0pp4tM2PwVuvuEvtZyaaHJ+JhvQgEEcipPbb6FnhzzqFnyuWqQzNMC3/Cxr7QUEyll1IRRqABKXDRDxGQ23rK9DC+HARHLjsuWn6h9x6UjU0aUwrKyPxgAClGaBGN6Hm8DKpdXPyrAbDXinO/UU3XUNPk+7ej33pEO635Eysj4Oc4nhloa6HilEuNzxpKce0hiAY0curO7QOAjn1ZIGZUwEh619luqC/rniuk6Z0EiNWmcviTcf9CO+Pux91AZehI9eV29wpOpQvW1JhWJkZUv+cGiw1T1jQwagS8MjI/NVOjGf/MQTqfyJNLht8CcUmMaBKhoQJJB530tM1mT56kT5GisXkr1j/trY+JNwTBZV7tZOCAlns8YSjSdAdbN9dvBcGUo8/uQGSVHvNv34K5aHT+07DrHOaF/QPDyA6I+Idg5q/Bc2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(71200400001)(6512007)(8676002)(66556008)(66476007)(64756008)(66946007)(316002)(33656002)(6916009)(66446008)(53546011)(6486002)(186003)(83380400001)(38100700002)(76116006)(5660300002)(2616005)(36756003)(4326008)(8936002)(26005)(122000001)(6506007)(508600001)(2906002)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zm43aCtETVdNcTVZMkhVWFpDT05KOHZtV0R3a1VNYy9Xc1J5WmRJMFBjbVBl?=
 =?utf-8?B?eEhIMDFNaEtuMFVCUk5pZFhNOE0ybjNBdUQyY1dTZ2tyaFJ3ZzFvSTBCQ2FS?=
 =?utf-8?B?MUpLV0VEbjdCbnVkaUkxWjhydWJkUTNIS0Z4NHlMc1ZOZ2U0QWZRZWlZZzBW?=
 =?utf-8?B?S2IvS0NLeUlseUJCVHpoNTk4SHFhQ01vREtEeHY4aG5YRzAzMS9sdHBRWGR4?=
 =?utf-8?B?akl6RXR6Q3FRUDZNWDMxQ0JRTUtCT2R0a04zSk1KMnNhS0tYN05oai8rdDZY?=
 =?utf-8?B?cTZSNnRnV2RzT0Y2UWVUVkV2M0F0a1EwN3VnbnEySlNZb2xBK3dNS29xbU42?=
 =?utf-8?B?Y3JGdmU2OCttd0xrVGJqaWV4d1F5T0Q0K2dmUk0wTW91aElzSVlBaC9QRXh5?=
 =?utf-8?B?SWwvNFJmd2dJTU9TMVRVaStEYWp6WVVwWlhWeHRWZU5kd2Zneml1TkhrMUJV?=
 =?utf-8?B?L1VYcXNyZDlPZGNLeC9IV0ZGczIza3ZoM2o4WmdsN2REWTNuQVE4RGd2UW54?=
 =?utf-8?B?Y0w1Sm1TemY3aDVOSng1SVU5Z0ppTldLeWo0dUxUV1A4Q3VtdzdOYkMzTU5P?=
 =?utf-8?B?Y0c4NjdjeVduL0RKUTRCTHBpWGR6UHN6OG5DVGtUbXdrdnVhaGk4Snh2Vnda?=
 =?utf-8?B?OXl5UXByVjIrTnkyU0xKT01mdyt4R1hwbnpYZExXN3Q2eHRpTXRGWG9pVFp6?=
 =?utf-8?B?YXR0MEQzMlpXdDNjelNZeFo5TUFBeE5VOThINElOMUIxTTZvdTlWZVI3cGNs?=
 =?utf-8?B?aUo1KytZQ0p1cHNvMm4zbEdxdjc1VzV2ay9MSy9iZGsxRS9SM1VQWTJvUXYx?=
 =?utf-8?B?MDd6ZGx5V3pkZmtrMTViRnovM1ZRL0M3YnBrYXQ2QW5zNDZ0WUQ1ajQ5RWo0?=
 =?utf-8?B?ZDRINndRTUZQektGREJQckRVSjFURGxRdWd1SjZZSTJuMEdXM3NnM2dOWlpw?=
 =?utf-8?B?ZTNHNmZnb3FZQXQweEpTUGdUdkYvY0ZlL2lCeFRFUnU5K2RpaG9aSDIwQUhM?=
 =?utf-8?B?a2NqTTcrYndyTE9tRSthb3AxNGkyZUY3MldCSUFjdVVkMUNaV09HUUhwMVlj?=
 =?utf-8?B?UGNwdEVLOXMwb0tpYXlYZnlwWDE2QlpJMERZV3J3RFBtR1lac1ordkIxOVRx?=
 =?utf-8?B?UlVpeWY4Q3E5NlBhSlBxWUV0MU9hOGY4UG95YUZrZnh4dm1SeDhUaVIvUzRV?=
 =?utf-8?B?em1zNlFRVHVha2NEYmovdk5hUkU3RDhBRC9VeGVINU5ENEw3YjFLOG1MRGY2?=
 =?utf-8?B?L1N1OUlqcTNmSDE1dXNETC9kYTNzSkpJcVo4bGZYSmdQaW9NSEhRcllqMCsv?=
 =?utf-8?B?QnFlcEpYVWV3WWxmT3IvMEJ1UFNwTEx3bEkrL2M1SVUwQzZMMXFZc1BhZHFU?=
 =?utf-8?B?TkVnbWZveWtwMUpqVzFUbFhqRVlUdG81TzRhVDZKM0RqMGl6djVVUnloS1k0?=
 =?utf-8?B?UXZnR1pRT3V6ZVVFcHlKNW51YUtFMkF3cUQ5Tm9nOXpyZ3VMNE5XY1VsaW1G?=
 =?utf-8?B?LzUxZytVMDVIY2VnSjc2VEM5bjNWOXh3VTN6WDNwL09ZcGVQOXZtUy9oSEY1?=
 =?utf-8?B?MmEvY3R6NkdxWUZ0Z3RLZkorQUxrNEIrd2QraDR3c1BzMUVEcFd5Zi9RdTFE?=
 =?utf-8?B?Y0dGeVIrVkJ3Y3lHMzZLeElSUlF4QUJhNlhKZzBpSTUyL3pHY2RsT3Z2eXJN?=
 =?utf-8?B?ZWl4SVpBTm5jZ2Y4WE1JTUd5ejJwTDVmWVlzeFhYUHhtTno3U282YWoyVWVP?=
 =?utf-8?B?a1VrNFF6TzJyOUIxcG5zTjdzWEhEQlFPYStkd1pGZjFwWmFHQk1aYXBpT0or?=
 =?utf-8?B?VjJSSXo1ZDV4UHh1ekk3RHh0U0ZjUTlqS0ZPRlljeHBOeGpINTFKOUhXaXNo?=
 =?utf-8?B?MGs3RHRxRE5XMkVGN2w4TG5DWmpzR0RLRzdGWHdhSjdwUTRZTkxsbWlFRThC?=
 =?utf-8?B?MHBhcW5meGZzZzBybG45aDFwTWlkYnNCSkgxczBsVTY4VnF1NFd4UGltakdG?=
 =?utf-8?B?R1IrNGgrY2d1T3hyWmZsVlhLTFNCelZ1RTVVaGozMVl3T1NUbHdpdzFVdE01?=
 =?utf-8?B?UDdZam05UmZUN2dkbllWRm9NeCthNFk0KzNlZnR6MlVrNURCMGgwbURZTmsw?=
 =?utf-8?B?YkdadTlxaTI0ZDBzUWxXZWlnY2pwLzZKclhtcDhsM2QweUgzUjROMWZabng4?=
 =?utf-8?B?b3gwZW5pS28wL2YxYTU3eEVodEEvR0tacjNDOENUMkhDSHppTElGVVk1bWNZ?=
 =?utf-8?Q?MiygeahqZdVJXvdMU3uS4b98Q59nQ6eUSnDLdxNXQA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5DF62752FD06C04BB6D8284D8C6C9F6C@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 244176a6-1178-44fc-25ac-08d9b956033a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 07:48:52.1166 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NcWwmyGY6v5b4CsTcRfYTRTE5DdKuvHm7CGeSsSR8ioM6uAnDWuaVlqaJtE5m8pfTEZxkJvHbSjIVpJGTHAzG1SDdZHsrmkiVf6tVpyW8j4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4225
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10190
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112070044
X-Proofpoint-ORIG-GUID: 2-qDTpIcoZP8r-BY_Sak4N07BeqmqucO
X-Proofpoint-GUID: 2-qDTpIcoZP8r-BY_Sak4N07BeqmqucO
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Devel Mailing List <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gTm92IDE5LCAyMDIxLCBhdCAyOjQyIFBNLCBBbGV4IFdpbGxpYW1zb24gPGFsZXgu
d2lsbGlhbXNvbkByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IA0KPiBBZGQgYSBwcmVmaXggb24g
U3ViamVjdDogcGxlYXNlLiAgU2FtZSBmb3IgcHJldmlvdXMgaW4gc2VyaWVzLg0KPiANCg0KCW9r
DQoNCj4gT24gTW9uLCAgOCBOb3YgMjAyMSAxNjo0NjozMyAtMDgwMA0KPiBKb2huIEpvaG5zb24g
PGpvaG4uZy5qb2huc29uQG9yYWNsZS5jb20+IHdyb3RlOg0KPiANCj4+IFZhbGlkYXRlcyBjYXNl
cyB3aGVyZSB0aGUgcmV0dXJuIHZhbHVlcyBhcmVuJ3QgZnVsbHkgdHJ1c3RlZA0KPj4gKHByZXAg
d29yayBmb3IgdmZpby11c2VyLCB3aGVyZSB0aGUgcmV0dXJuIHZhbHVlcyBmcm9tIHRoZQ0KPj4g
cmVtb3RlIHByb2Nlc3MgYXJlbid0IHRydXN0ZWQpDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEpv
aG4gRyBKb2huc29uIDxqb2huLmcuam9obnNvbkBvcmFjbGUuY29tPg0KPj4gLS0tDQo+PiBpbmNs
dWRlL2h3L3ZmaW8vdmZpby1jb21tb24uaCB8IDIxICsrKysrKysrKysrKysrDQo+PiBody92Zmlv
L3BjaS5jICAgICAgICAgICAgICAgICB8IDY3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4+IDIgZmlsZXMgY2hhbmdlZCwgODggaW5zZXJ0aW9ucygrKQ0KPj4g
DQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody92ZmlvL3ZmaW8tY29tbW9uLmggYi9pbmNsdWRl
L2h3L3ZmaW8vdmZpby1jb21tb24uaA0KPj4gaW5kZXggNDNmYTk0OC4uYzBkYmJmYiAxMDA2NDQN
Cj4+IC0tLSBhL2luY2x1ZGUvaHcvdmZpby92ZmlvLWNvbW1vbi5oDQo+PiArKysgYi9pbmNsdWRl
L2h3L3ZmaW8vdmZpby1jb21tb24uaA0KPj4gQEAgLTEyNSw2ICsxMjUsNyBAQCB0eXBlZGVmIHN0
cnVjdCBWRklPSG9zdERNQVdpbmRvdyB7DQo+PiANCj4+IHR5cGVkZWYgc3RydWN0IFZGSU9EZXZp
Y2VPcHMgVkZJT0RldmljZU9wczsNCj4+IHR5cGVkZWYgc3RydWN0IFZGSU9EZXZJTyBWRklPRGV2
SU87DQo+PiArdHlwZWRlZiBzdHJ1Y3QgVkZJT1ZhbGlkT3BzIFZGSU9WYWxpZE9wczsNCj4+IA0K
Pj4gdHlwZWRlZiBzdHJ1Y3QgVkZJT0RldmljZSB7DQo+PiAgICAgUUxJU1RfRU5UUlkoVkZJT0Rl
dmljZSkgbmV4dDsNCj4+IEBAIC0xNDEsNiArMTQyLDcgQEAgdHlwZWRlZiBzdHJ1Y3QgVkZJT0Rl
dmljZSB7DQo+PiAgICAgYm9vbCBlbmFibGVfbWlncmF0aW9uOw0KPj4gICAgIFZGSU9EZXZpY2VP
cHMgKm9wczsNCj4+ICAgICBWRklPRGV2SU8gKmlvX29wczsNCj4+ICsgICAgVkZJT1ZhbGlkT3Bz
ICp2YWxpZF9vcHM7DQo+PiAgICAgdW5zaWduZWQgaW50IG51bV9pcnFzOw0KPj4gICAgIHVuc2ln
bmVkIGludCBudW1fcmVnaW9uczsNCj4+ICAgICB1bnNpZ25lZCBpbnQgZmxhZ3M7DQo+PiBAQCAt
MjE0LDYgKzIxNiwyNSBAQCBzdHJ1Y3QgVkZJT0NvbnRJTyB7DQo+PiBleHRlcm4gVkZJT0RldklP
IHZmaW9fZGV2X2lvX2lvY3RsOw0KPj4gZXh0ZXJuIFZGSU9Db250SU8gdmZpb19jb250X2lvX2lv
Y3RsOw0KPj4gDQo+PiArLyoNCj4+ICsgKiBUaGlzIG9wcyB2ZWN0b3IgYWxsb3dzIGZvciBidXMt
c3BlY2lmaWMgdmVyaWZpY2F0aW9uDQo+PiArICogcm91dGluZXMgaW4gY2FzZXMgd2hlcmUgdGhl
IHNlcnZlciBtYXkgbm90IGJlIGZ1bGx5DQo+PiArICogdHJ1c3RlZC4NCj4+ICsgKi8NCj4+ICtz
dHJ1Y3QgVkZJT1ZhbGlkT3BzIHsNCj4+ICsgICAgaW50ICgqdmFsaWRhdGVfZ2V0X2luZm8pKFZG
SU9EZXZpY2UgKnZkZXYsIHN0cnVjdCB2ZmlvX2RldmljZV9pbmZvICppbmZvKTsNCj4+ICsgICAg
aW50ICgqdmFsaWRhdGVfZ2V0X3JlZ2lvbl9pbmZvKShWRklPRGV2aWNlICp2ZGV2LA0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2ZmlvX3JlZ2lvbl9pbmZv
ICppbmZvLCBpbnQgKmZkKTsNCj4+ICsgICAgaW50ICgqdmFsaWRhdGVfZ2V0X2lycV9pbmZvKShW
RklPRGV2aWNlICp2ZGV2LCBzdHJ1Y3QgdmZpb19pcnFfaW5mbyAqaW5mbyk7DQo+PiArfTsNCj4+
ICsNCj4+ICsjZGVmaW5lIFZERVZfVkFMSURfSU5GTyh2ZGV2LCBpbmZvKSBcDQo+PiArICAgICgo
dmRldiktPnZhbGlkX29wcy0+dmFsaWRhdGVfZ2V0X2luZm8oKHZkZXYpLCAoaW5mbykpKQ0KPj4g
KyNkZWZpbmUgVkRFVl9WQUxJRF9SRUdJT05fSU5GTyh2ZGV2LCBpbmZvLCBmZCkgXA0KPj4gKyAg
ICAoKHZkZXYpLT52YWxpZF9vcHMtPnZhbGlkYXRlX2dldF9yZWdpb25faW5mbygodmRldiksIChp
bmZvKSwgKGZkKSkpDQo+PiArI2RlZmluZSBWREVWX1ZBTElEX0lSUV9JTkZPKHZkZXYsIGlycSkg
XA0KPj4gKyAgICAoKHZkZXYpLT52YWxpZF9vcHMtPnZhbGlkYXRlX2dldF9pcnFfaW5mbygodmRl
diksIChpcnEpKSkNCj4+ICsNCj4+ICNlbmRpZiAvKiBDT05GSUdfTElOVVggKi8NCj4+IA0KPj4g
dHlwZWRlZiBzdHJ1Y3QgVkZJT0dyb3VwIHsNCj4+IGRpZmYgLS1naXQgYS9ody92ZmlvL3BjaS5j
IGIvaHcvdmZpby9wY2kuYw0KPj4gaW5kZXggMjhmMjFmOC4uNmUyY2UzNSAxMDA2NDQNCj4+IC0t
LSBhL2h3L3ZmaW8vcGNpLmMNCj4+ICsrKyBiL2h3L3ZmaW8vcGNpLmMNCj4+IEBAIC0zMzcxLDMg
KzMzNzEsNzAgQEAgc3RhdGljIHZvaWQgcmVnaXN0ZXJfdmZpb19wY2lfZGV2X3R5cGUodm9pZCkN
Cj4+IH0NCj4+IA0KPj4gdHlwZV9pbml0KHJlZ2lzdGVyX3ZmaW9fcGNpX2Rldl90eXBlKQ0KPj4g
Kw0KPj4gKw0KPj4gKy8qDQo+PiArICogUENJIHZhbGlkYXRpb24gb3BzIC0gdXNlZCB3aGVuIHJl
dHVybiB2YWx1ZXMgbmVlZA0KPj4gKyAqIHZhbGlkYXRpb24gYmVmb3JlIHVzZQ0KPj4gKyAqLw0K
Pj4gKw0KPj4gK3N0YXRpYyBpbnQgdmZpb19wY2lfdmFsaWRfaW5mbyhWRklPRGV2aWNlICp2YmFz
ZWRldiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZmaW9fZGV2
aWNlX2luZm8gKmluZm8pDQo+PiArew0KPj4gKyAgICAvKiBtdXN0IGJlIFBDSSAqLw0KPj4gKyAg
ICBpZiAoKGluZm8tPmZsYWdzICYgVkZJT19ERVZJQ0VfRkxBR1NfUENJKSA9PSAwKSB7DQo+PiAr
ICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+ICsgICAgfQ0KPj4gKyAgICAvKiBvbmx5IG90aGVy
IHZhbGlkIGZsYWcgaXMgcmVzZXQgKi8NCj4+ICsgICAgaWYgKGluZm8tPmZsYWdzICYgfihWRklP
X0RFVklDRV9GTEFHU19QQ0kgfCBWRklPX0RFVklDRV9GTEFHU19SRVNFVCkpIHsNCj4+ICsgICAg
ICAgIHJldHVybiAtRUlOVkFMOw0KPj4gKyAgICB9DQo+IA0KPiBUaGlzIG1lYW5zIFFFTVUgdmZp
by1wY2kgYnJlYWtzIG9uIGFueSBleHRlbnNpb24gb2YgdGhlIGZsYWdzIGZpZWxkLg0KPiANCj4+
ICsgICAgLyogYWNjb3VudCBmb3IgZXh0cmEgbWlncmF0aW9uIHJlZ2lvbiAqLw0KPj4gKyAgICBp
ZiAoaW5mby0+bnVtX3JlZ2lvbnMgPiBWRklPX1BDSV9OVU1fUkVHSU9OUyArIDEpIHsNCj4+ICsg
ICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4gKyAgICB9DQo+IA0KPiBUaGlzIGlzIGFsc28gaW52
YWxpZCwgdGhlcmUgY2FuIGJlIGRldmljZSBzcGVjaWZpYyByZWdpb25zIGJleW9uZA0KPiBtaWdy
YXRpb24uDQo+IA0KPj4gKyAgICBpZiAoaW5mby0+bnVtX2lycXMgPiBWRklPX1BDSV9OVU1fSVJR
Uykgew0KPj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+PiArICAgIH0NCj4gDQo+IEFuZCBk
ZXZpY2Ugc3BlY2lmaWMgSVJRcy4NCj4gDQo+PiArICAgIHJldHVybiAwOw0KPj4gK30NCj4+ICsN
Cj4+ICtzdGF0aWMgaW50IHZmaW9fcGNpX3ZhbGlkX3JlZ2lvbl9pbmZvKFZGSU9EZXZpY2UgKnZi
YXNlZGV2LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCB2ZmlvX3JlZ2lvbl9pbmZvICppbmZvLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGludCAqZmQpDQo+PiArew0KPj4gKyAgICBpZiAoaW5mby0+Zmxh
Z3MgJiB+KFZGSU9fUkVHSU9OX0lORk9fRkxBR19SRUFEIHwNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICBWRklPX1JFR0lPTl9JTkZPX0ZMQUdfV1JJVEUgfA0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgIFZGSU9fUkVHSU9OX0lORk9fRkxBR19NTUFQIHwNCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICBWRklPX1JFR0lPTl9JTkZPX0ZMQUdfQ0FQUykpIHsNCj4+ICsgICAgICAgIHJl
dHVybiAtRUlOVkFMOw0KPj4gKyAgICB9DQo+IA0KPiBTaW1pbGFybHksIHRoaXMgYWxsb3dzIHpl
cm8gZnV0dXJlIGV4dGVuc2lvbnMuICBOb3RpY2UgZm9yIGluc3RhbmNlIGhvdw0KPiB0aGUgQ0FQ
UyBmbGFnIHdhcyBhZGRlZCBsYXRlciBhcyBhIGJhY2t3YXJkcyBjb21wYXRpYmxlIGV4dGVuc2lv
bi4NCj4gDQo+PiArICAgIGlmIChpbmZvLT5pbmRleCA+IHZiYXNlZGV2LT5udW1fcmVnaW9ucykg
ew0KPj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+PiArICAgIH0NCj4+ICsgICAgLyogY2Fw
X29mZnNldCBpbiB2YWxpZCBhcmVhICovDQo+PiArICAgIGlmICgoaW5mby0+ZmxhZ3MgJiBWRklP
X1JFR0lPTl9JTkZPX0ZMQUdfQ0FQUykgJiYNCj4+ICsgICAgICAgIChpbmZvLT5jYXBfb2Zmc2V0
IDwgc2l6ZW9mKCppbmZvKSB8fCBpbmZvLT5jYXBfb2Zmc2V0ID4gaW5mby0+YXJnc3opKSB7DQo+
PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+ICsgICAgfQ0KPj4gKyAgICByZXR1cm4gMDsN
Cj4+ICt9DQo+PiArDQo+PiArc3RhdGljIGludCB2ZmlvX3BjaV92YWxpZF9pcnFfaW5mbyhWRklP
RGV2aWNlICp2YmFzZWRldiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgdmZpb19pcnFfaW5mbyAqaW5mbykNCj4+ICt7DQo+PiArICAgIGlmIChpbmZvLT5mbGFn
cyAmIH4oVkZJT19JUlFfSU5GT19FVkVOVEZEIHwgVkZJT19JUlFfSU5GT19NQVNLQUJMRSB8DQo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgVkZJT19JUlFfSU5GT19BVVRPTUFTS0VEIHwgVkZJ
T19JUlFfSU5GT19OT1JFU0laRSkpIHsNCj4+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4g
KyAgICB9DQo+IA0KPiBTaW1pbGFybHksIG5hay4gIFRoYW5rcywNCj4gDQoNCg0KCVRoZSB2ZXJp
ZmljYXRpb24gcm91dGluZXMgYXJlIHRvIHNhbml0aXplIHRoZSBkYXRhIHJldHVybmVkIHdoZW4g
d2UNCmRvbuKAmXQgdHJ1c3QgdGhlIHNlcnZlci4gIFRoZSBrZXJuZWwgZHJpdmVyIHJldHVybiB2
YWx1ZXMgYXJlIG5vdCB2ZXJpZmllZCwgYXMNCnRoZSBrZXJuZWwgaGFzIG11Y2ggYmV0dGVyIHdh
eXMgb2YgY29ycnVwdGluZyB0aGUgY2xpZW50LiAgV2hlbiBuZXcgZmxhZ3MNCmFyZSBhZGRlZCwg
dGhlIHRoZXnigJlkIGJlIGFkZGVkIGhlcmUsIHRvby4NCg0KCUkgY2FuIHB1c2ggdGhlbSBkb3du
IGludG8gdGhlIHRoZSB2ZmlvLXVzZXIgY29kZSwgYnV0IHRoYXQgZm9yY2VzDQp0aGUgdmZpby1j
b2RlIHRvIGNoYW5nZSB2ZXJzaW9ucyBvciBhZGQgY2FwYWJpbGl0aWVzIHdoZW5ldmVyIGEgbmV3
IGZsYWcgaXMNCmFkZGVkLg0KDQoJCQkJCQkJCUpKDQoNCg0K

