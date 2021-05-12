Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 488B037B556
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 07:11:09 +0200 (CEST)
Received: from localhost ([::1]:58614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgh9I-0003WK-Bp
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 01:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1lgh75-0001t2-Kb
 for qemu-devel@nongnu.org; Wed, 12 May 2021 01:08:51 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:26014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1lgh70-0005U7-Hc
 for qemu-devel@nongnu.org; Wed, 12 May 2021 01:08:51 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14C57L9a008788; Wed, 12 May 2021 05:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=5PV3LduqVbunEiqftMDp3Zil5JQ+RiM7zvGutWckypk=;
 b=G4N/YK0w1ZQmTuMbOCo+OIj9alwplEJFs2C5Drmxj3SMCZwpXJO9gfT+K/m6OuJW2Tj8
 2VfSwzWtvsWfO02WUJKPlIb1K2hV/b0Oo+Lmmv1gq0SlEKS7AOUP+Ae/zrTT4QAutqam
 KzweFfXqaX0hGlsFKDftJURviQ3zmq0nD9RDSkH6NsKc7jkd57bg8/RRAfdFJEhYdBYQ
 GN+/yEinyDq5V3M747Xu5l4M941kUwt/nP5umRkEW8w0lscYoBY0Vjko4xfoPo4EjFS6
 g1qENefwiQ4X4mksR9FQKJ4/daEWtsS/Difx8uv19+TJUmb+9oPZi/NtvdNsziPjUl0f qQ== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 38f5ag8j4q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 May 2021 05:08:32 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14C58VVI148047;
 Wed, 12 May 2021 05:08:31 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by aserp3020.oracle.com with ESMTP id 38djfakqb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 May 2021 05:08:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4uIGZYVEWvD328Gcl4jTZEt0gkVmNvbdXorEX8e7kk/Ni5z7YhxhiM5tkjwubzSPEPWANx3EZR9E3COlVmytsWDjg0ylJQ+kKuJpDjOTKHDd7Z5tHVAuTXBUrE4+XKBXYKGZ65i99na0Dk1cAqPccZ1fz29cmkFYZQa3EIX9b4o47ycKE4o9QkYjkw9yOZUTQmySVYWo8uI3q15MAzAhHjUA3mELFgihjnVsI3K2KHbQgT3n4IvHLHwgWM/zz122QCZuSeg5GAzLHQGakiL09IYfevgDDdV2I7G/NM1rpREC2KSWwGTH4qovj6zfMrRKG+sgqYUETAHuiTXRH0Ojg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PV3LduqVbunEiqftMDp3Zil5JQ+RiM7zvGutWckypk=;
 b=jyFwJ4dGJd4apSRfFmvL4NQTeKJjBALHjw+gawLSGABdRzVzmsIPd12BrG0aqce3tsMlIpibFf8bLSVer4Rur1jtgweE+YFtpiah1CzGNEy2QiWaeETkoYgttfJmO1NjcrtjfDEGHJNNMDHR/l37sp3UR9ASsmGWF02VlBKwLzSQe8GNonH/uQ8val7AEJjEuPjeseyAv+XZPBrgrgry7PTArdqSYe5deMBItSXTi2Gm/CokqI17P0fsATdYe7o5oY9U4OM6HYpSvaINRyJ6vbDGs57cwn1vnbEgM/cyPcX5nTNRzQy0zhudkL8SVGnUhyyZb7l6IhLLjTPA5MRryQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PV3LduqVbunEiqftMDp3Zil5JQ+RiM7zvGutWckypk=;
 b=s9llD311NrE1HuuZ/4n/IsvyhoiVYHZNvkISR0q9OMWJwYo7QWap6udrqKuEXHnloZY7exTuAGLGLvS/Z55cNdsahYoEXUzXGGKmnTjCocf4tQPcf/vtnrPRhY5IKDTCFI4tDgwsdHVpZ8H3ntII+vuyGeEjNYE1ntKygBW3arI=
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 (2603:10b6:301:30::26) by MWHPR1001MB2176.namprd10.prod.outlook.com
 (2603:10b6:301:30::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.29; Wed, 12 May
 2021 05:08:29 +0000
Received: from MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::d938:e3c8:d6b2:50c2]) by MWHPR1001MB2349.namprd10.prod.outlook.com
 ([fe80::d938:e3c8:d6b2:50c2%7]) with mapi id 15.20.4108.030; Wed, 12 May 2021
 05:08:29 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: John Levon <levon@movementarian.org>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v8] introduce vfio-user protocol specification
Thread-Topic: [PATCH v8] introduce vfio-user protocol specification
Thread-Index: AQHXMSmlm4KTwcnsx0uSwLnLUIe/z6rdGNWAgABbqYCAAgLeAA==
Date: Wed, 12 May 2021 05:08:29 +0000
Message-ID: <59CFBE8E-3B92-4918-B68F-096CB25F84A6@oracle.com>
References: <20210414114122.236193-1-thanos.makatos@nutanix.com>
 <YJlmARxX5ZADZD5w@stefanha-x1.localdomain>
 <20210510222541.GA1916565@li1368-133.members.linode.com>
In-Reply-To: <20210510222541.GA1916565@li1368-133.members.linode.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.6)
authentication-results: movementarian.org; dkim=none (message not signed)
 header.d=none;movementarian.org; dmarc=none action=none
 header.from=oracle.com;
x-originating-ip: [73.71.20.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 727e6311-695c-44f8-81b1-08d91503fb21
x-ms-traffictypediagnostic: MWHPR1001MB2176:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1001MB2176833F33E892AC3628C2BCB6529@MWHPR1001MB2176.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1gVUeCJqQ6CNbhAScvSIlrKph4dos9pdvkTMNW7TU1k5oGPfLEqkNWwJlsSuXD1LkuI7rd9c/7fWoaI+M3f0Yos1Rqo11mwgEF4v/sfW5snyDeKlZWsUwPFuPcAYL5SaDOb8uKQWoyrb8HECDlw2QR3h5WVhrWRrWZRwS8kI9jLQ+YJsIoABh63LCyj3MwXff0FCmhBZiM0vFjeBodnU5+r/g/eQjsn3UpdWEsODJZXh0J/SDwHcGVLZhvuKi7vk0LPlBx4YYVrX4WQBqvTmN0YnYQ/m8Dk6lIYFd7WyRl2L51a3CuEVAAJXUOoEN3befqUqWzTsr5y23vRH98iWl32+WeWcdTqrVGG6gBX0RapaGiBKOxXFOKCyRBeJsfYf6/opq5T16moHHa0DYgQ7gd56gT/aP7IaWeQka5cmmQQ5vVems+F3tx8ZZEBZkzP5YCEHeAhEOV6vt5DJKtxG+70EXwa4JZkKMtA6wCQ7h5FthfY0UjlXYyBS3XTRWWtNynpQNl8Uoq4Qz8mG3nlZfvze2wRywqMu24Axhrppvo5k78hje/e0HiVPkc6WQiJsuxnf9wWQlzPClvaIXaKhi+rklWR+oBdOSIoJybS22+g8fdj777yYaKW6babvVZUQSa3bS6HPSDhImvDMS2Tbl/k30IisLxpFr4JsZfSqeKE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2349.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(396003)(376002)(39860400002)(136003)(7416002)(5660300002)(2616005)(316002)(6486002)(36756003)(186003)(54906003)(110136005)(8676002)(4326008)(6512007)(76116006)(33656002)(91956017)(86362001)(83380400001)(2906002)(53546011)(6506007)(38100700002)(64756008)(8936002)(66556008)(66476007)(478600001)(71200400001)(66446008)(66946007)(26005)(122000001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?dDlMWkJPYWZLemNVVzFsb0I3WjVGVVkySUwzUzRhYkx0TnBjRkw5MUNlSW4v?=
 =?utf-8?B?TXNqS1I2MnduS0dHZEFMWGthbVgrMGk2dHVXUGtLUDJQLzFwSlllbnJGWFRy?=
 =?utf-8?B?U3FtcmpwbnQ3YjNLRXFaYzRsbTFrTkJnZkNaU0laWHVqQTF4KzZiMGp4VDcx?=
 =?utf-8?B?S0c0V0Y3TEljaUhJNWdEYVNncUovaEd3VWl5cTJkdnhzbDJHNXk1NUduaVBj?=
 =?utf-8?B?REdGcWpWRXR0dVAyd0Y2NUt6bkhSOHI1a2VzTjJNSmVMUXcrWXNZU2ZpRHl5?=
 =?utf-8?B?cDRySTJ2KzN0M0Zkc1NjV0RBOTZYUVNXWXhMS2x5WUFqblJtekxhZ3puaFY4?=
 =?utf-8?B?NlZ0Sk5neVU2aWtUNE1hbW5DR0N1eGtBQXdUTVpyM1VCeWRvOFpIV1pKc3BU?=
 =?utf-8?B?enNPbG9POHVTYUw0cWF1cVp2eUZWUzM0QjVnYlp5UXVpWWtyTDR0RjZMQnhP?=
 =?utf-8?B?K3d1dnFYMmpwcjJJN09ySlI1aisyQWhNelZ3NTRvRGVUckRLL1dsd2ZHVGRh?=
 =?utf-8?B?cGNBYlZzRjN2N0J6RllBSzlNSXhaUmE5NnZkeTQ1Q1ZHQ01xMTF6eEFEV3NS?=
 =?utf-8?B?TVVWRmc3ZkV2SlpwelpYMFAzdGNMdnFnM25kUmJhQjlNWlEvYXk0TnpQRzRQ?=
 =?utf-8?B?SC8va041Q202STNMRzJ3dnlTczZUQ25kVkk4dEhmUkF3cFRIUEFBcGJ3eElG?=
 =?utf-8?B?dlVqbWh1ZWs4d0dUb2dFTFBIUHh6SUVyYnVTNk9sTkZ6NUZ5cEUzeTdhYkJk?=
 =?utf-8?B?TjBrRjBMU09HNjdIQXFSSlFCZm5yTWxkUnNzM3c2YjZvdGFjRWxvMHNtb3lz?=
 =?utf-8?B?ZVdaKzF4WXJyZUdQSmxBWXVoSEt5UGFxd0w0NFBzTmM5L1lYT2x2dU5lQXFX?=
 =?utf-8?B?RU9lTWtVUWN5aTBRRjU0cGV2UWdHTEdZbEZUNGs5MGUvQVpuY1RCZlJCMW9E?=
 =?utf-8?B?TUN1d2JNSHk5RXlkenN0NGxCQjBGb255S0lkdENlTWdBa2hBVG1HTUxwK2c3?=
 =?utf-8?B?VlFqd1BoYi9CRm1nTnJJbUpCSFdyb0JNOTlSd0pPSUdjcXBJa2t5ZURna2lV?=
 =?utf-8?B?UU80d2ZCSllXaDZFTFhMc3ZKTEVpbWhWZHFMblRjTW1FZDk0c1J1SFNxWEh2?=
 =?utf-8?B?NGpLNW9nbzBvQTBzTG9qYVQwbkFJZzd0MWMrVnI2dW5DZlh3dXpmd0IvMW85?=
 =?utf-8?B?Z2tXa211amlEd2pLMnlwcjNJT3lkUmZSKzgzZmY1VEdFWG5RS3N3S29ReTVJ?=
 =?utf-8?B?U29yNGlKMXNSUnpuOWt1SnozV0R2QVJlM2hTU2VPb1F5RVp5d2hEb3hobFB1?=
 =?utf-8?B?alBLTGtsR1l5U2haVENiOGtONXdzSzluSDZDL3BuMk5janFRaENnS3RjMHVH?=
 =?utf-8?B?K0t1RDRJdDVCYUlIOFBBNGRRN0VpZ0RGQ3lBcUhiRzhpNmNiNnVHQVVQdWFi?=
 =?utf-8?B?a1FZYzNqbnc2NUFSeml6K0tiRVNUVEZhS3F4NjZKOU5BY2cwREZaREUweUov?=
 =?utf-8?B?ZGU5SnpCcnlQK0xLdTFYTzZPNXRsT3l4YTlyeVo3YXROM054VDdnZmNCejg1?=
 =?utf-8?B?MzRMRGI4b2haZTIzdGc4Qi9JRzN2VG9wdXptaFlEUnN5TTY1cmo3MDNHTjl5?=
 =?utf-8?B?VEZwcGY0aU9nTHVqU1FRa0FnZEpNcFlVMTBsS1ZDc0p1WERKMXZDM3RvVHlj?=
 =?utf-8?B?ekRiNzVoUVNvT1JoL2YrcGpSZUt0TFhHOWFTMm43bGxLSGpXdVo0cE1obExt?=
 =?utf-8?Q?lZFH4rRa1uKYbyGyyzWTUnt3XhaPIGR133Xsmfw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D05E33BFF068A40AB4E552A688D148A@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2349.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 727e6311-695c-44f8-81b1-08d91503fb21
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2021 05:08:29.0449 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mzFMAv4aTZ7WS+Yq5PykL2TGSSto2B/tYXTfsK1qgxSd1HvtbFbIOGUkBQ88SqjcwMPqL/NQ1fixCgw6r7vwkZz+ThYzCwjxS4kXLCkBFdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2176
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9981
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 mlxlogscore=999
 adultscore=0 phishscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105120035
X-Proofpoint-GUID: B6KJUu6s5sowOvQEJ0XiW-I5hcsL6ZBC
X-Proofpoint-ORIG-GUID: B6KJUu6s5sowOvQEJ0XiW-I5hcsL6ZBC
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "Walker, Benjamin" <benjamin.walker@intel.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Christophe de Dinechin <cdupontd@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Jag Raman <jag.raman@oracle.com>, "Harris, James R" <james.r.harris@intel.com>,
 John Levon <john.levon@nutanix.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Konrad Wilk <konrad.wilk@oracle.com>,
 "yuvalkashtan@gmail.com" <yuvalkashtan@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "eafanasova@gmail.com" <eafanasova@gmail.com>,
 "ismael@linux.com" <ismael@linux.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Liu, Changpeng" <changpeng.liu@intel.com>,
 "tomassetti.andrea@gmail.com" <tomassetti.andrea@gmail.com>,
 "mpiszczek@ddn.com" <mpiszczek@ddn.com>, Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, "Zhang,
 Tina" <tina.zhang@intel.com>, "Lu, 
 Xiuchun" <xiuchun.lu@intel.com>, Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gTWF5IDEwLCAyMDIxLCBhdCAzOjI1IFBNLCBKb2huIExldm9uIDxsZXZvbkBtb3Zl
bWVudGFyaWFuLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBNb24sIE1heSAxMCwgMjAyMSBhdCAwNTo1
NzozN1BNICswMTAwLCBTdGVmYW4gSGFqbm9jemkgd3JvdGU6DQo+IA0KPiANCj4+PiArVkZJT19V
U0VSX1ZNX0lOVEVSUlVQVA0KPj4+ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4gKw0KPj4+
ICtNZXNzYWdlIGZvcm1hdA0KPj4+ICteXl5eXl5eXl5eXl5eXg0KPj4+ICsNCj4+PiArKy0tLS0t
LS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KPj4+ICt8IE5hbWUgICAgICAg
ICAgIHwgVmFsdWUgICAgICAgICAgICAgICAgICB8DQo+Pj4gKys9PT09PT09PT09PT09PT09Kz09
PT09PT09PT09PT09PT09PT09PT09PSsNCj4+PiArfCBNZXNzYWdlIElEICAgICB8IDxJRD4gICAg
ICAgICAgICAgICAgICAgfA0KPj4+ICsrLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0rDQo+Pj4gK3wgQ29tbWFuZCAgICAgICAgfCAxMyAgICAgICAgICAgICAgICAgICAg
IHwNCj4+PiArKy0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KPj4+
ICt8IE1lc3NhZ2Ugc2l6ZSAgIHwgMjAgICAgICAgICAgICAgICAgICAgICB8DQo+Pj4gKystLS0t
LS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4+PiArfCBGbGFncyAgICAg
ICAgICB8IFJlcGx5IGJpdCBzZXQgaW4gcmVwbHkgfA0KPj4+ICsrLS0tLS0tLS0tLS0tLS0tLSst
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+Pj4gK3wgRXJyb3IgICAgICAgICAgfCAwL2Vycm5v
ICAgICAgICAgICAgICAgIHwNCj4+PiArKy0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tKw0KPj4+ICt8IEludGVycnVwdCBpbmZvIHwgPGludGVycnVwdD4gICAgICAgICAg
ICB8DQo+Pj4gKystLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4+
PiArDQo+Pj4gK1RoaXMgY29tbWFuZCBtZXNzYWdlIGlzIHNlbnQgZnJvbSB0aGUgc2VydmVyIHRv
IHRoZSBjbGllbnQgdG8gc2lnbmFsIHRoZSBkZXZpY2UNCj4+PiAraGFzIHJhaXNlZCBhbiBpbnRl
cnJ1cHQuDQo+PiANCj4+IEV4Y2VwdCBpZiB0aGUgY2xpZW50IHNldCB1cCBpcnEgZXZlbnRmZHM/
DQo+IA0KPiBDbGFyaWZpZWQuDQo+IA0KPj4+ICtJbnRlcnJ1cHQgaW5mbyBmb3JtYXQNCj4+PiAr
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eDQo+Pj4gKw0KPj4+ICsrLS0tLS0tLS0tLS0rLS0tLS0tLS0r
LS0tLS0tKw0KPj4+ICt8IE5hbWUgICAgICB8IE9mZnNldCB8IFNpemUgfA0KPj4+ICsrPT09PT09
PT09PT0rPT09PT09PT0rPT09PT09Kw0KPj4+ICt8IFN1Yi1pbmRleCB8IDE2ICAgICB8IDQgICAg
fA0KPj4+ICsrLS0tLS0tLS0tLS0rLS0tLS0tLS0rLS0tLS0tKw0KPj4+ICsNCj4+PiArKiAqU3Vi
LWluZGV4KiBpcyByZWxhdGl2ZSB0byB0aGUgSVJRIGluZGV4LCBlLmcuLCB0aGUgdmVjdG9yIG51
bWJlciB1c2VkIGluIFBDSQ0KPj4+ICsgIE1TSS9YIHR5cGUgaW50ZXJydXB0cy4NCj4+IA0KPj4g
SG1tLi4udGhpcyBpcyB3ZWlyZC4gVGhlIHNlcnZlciB0ZWxscyB0aGUgY2xpZW50IHRvIHJhaXNl
IGFuIE1TSS1YDQo+PiBpbnRlcnJ1cHQgYnV0IGRvZXMgbm90IGluY2x1ZGUgdGhlIE1TSSBtZXNz
YWdlIHRoYXQgcmVzaWRlcyBpbiB0aGUgTVNJLVgNCj4+IHRhYmxlIEJBUiBkZXZpY2UgcmVnaW9u
PyBPciBzaG91bGQgTVNJLVggaW50ZXJydXB0cyBiZSBkZWxpdmVyZWQgdG8gdGhlDQo+PiBjbGll
bnQgdmlhIFZGSU9fVVNFUl9ETUFfV1JJVEUgaW5zdGVhZD8NCj4+IA0KPj4gKEJhc2ljYWxseSBp
dCdzIG5vdCBjbGVhciB0byBtZSBob3cgTVNJLVggaW50ZXJydXB0cyB3b3VsZCB3b3JrIHdpdGgN
Cj4+IHZmaW8tdXNlci4gUmVhZGluZyBob3cgdGhleSB3b3JrIGluIGtlcm5lbCBWRklPIG1pZ2h0
IGxldCBtZSBpbmZlciBpdCwNCj4+IGJ1dCBpdCdzIHByb2JhYmx5IHdvcnRoIGV4cGxhaW5pbmcg
dGhpcyBjbGVhcmx5IGluIHRoZSBzcGVjLikNCj4gDQo+IEl0IGRvZXNuJ3QuIFdlIGRvbid0IGhh
dmUgYW4gaW1wbGVtZW50YXRpb24sIGFuZCB0aGUgcWVtdSBwYXRjaGVzIGRvbid0IGdldCB0aGlz
DQo+IHJpZ2h0IGVpdGhlciAtIGl0IHRyZWF0cyB0aGUgc3ViLWluZGV4IGFzIHRoZSBJUlEgaW5k
ZXggQUtBIElSUSB0eXBlLg0KPiANCj4gSSdkIGJlIGluY2xpbmVkIHRvIGp1c3QgcmVtb3ZlIHRo
aXMgZm9yIG5vdywgdW50aWwgd2UgaGF2ZSBhbiBpbXBsZW1lbnRhdGlvbi4NCj4gVGhvdWdodHM/
DQo+IA0KDQoJVkZJTyB3aWxsIHNldCB1cCAyIGV2ZW50ZmRzIGZvciBlYWNoIGVuYWJsZWQgTVNJ
L1ggdmVjdG9yLiAgT25lIGlzDQp0ZXJtaW5hdGVkIGluIEtWTSBmb3IgZGlyZWN0IGluamVjdGlv
biBpbnRvIHRoZSBndWVzdC4gIFRoZSBvdGhlciB0ZXJtaW5hdGVzDQpiYWNrIGluIFFFTVUsIGFu
ZCB0cmlnZ2VycyBNU0kvWCBTVyBlbXVsYXRpb24uICBXaGVuIGluZm9ybWluZyB0aGUga2VybmVs
IG9mDQp3aGljaCBGRHMgdG8gdXNlLCBWRklPIHByZWZlcnMgdGhlIEtWTSBGRCwgdGhlIFFNRVUg
b25lIGlzIG9ubHkgdXNlZCBpZiB0aGUNCktWTSBvbmUgY2Fu4oCZdCBiZSBjcmVhdGVkIChvciBp
cyBkaXNhYmxlZCBieSBjb21tYW5kIGxpbmUgb3B0aW9uKQ0KDQoJVkZJT19VU0VSX0lOVEVSUlVQ
VCB3b3VsZCBuZWVkIGFuIHZlY3RvciBudW1iZXIgaW4gdGhlIHJlcXVlc3QuICBJDQpub3RpY2Vk
IHRoaXMgd2hlbiBJIGRpZCB0aGUgY2xpZW50LCBidXQgZGVsYXllZCBpdCBiZWNhdXNlIG9mIHdo
YXQgSm9obkwgc2FpZA0KaW4gYW5vdGhlciBlbWFpbDogVkZJT19VU0VSX0lOVEVSUlVQVCBpcyBv
bmx5IGJlIG5lZWRlZCBpZiB0aGUgY2xpZW50IGFuZCBzZXJ2ZXINCmFyZSBpbiBkaWZmZXJlbnQg
Vk1zIGFuZCBjYW7igJl0IHVzZSBldmVudGZkcy4NCg0KCUnigJltIGZpbmUgd2l0aCByZW1vdmlu
ZyBpdCBmb3IgMS4wLCBzaW5jZSB3ZSBkb27igJl0IHN1cHBvcnQgY3Jvc3MtVk0NCmVtdWxhdGlv
biB5ZXQuDQoNCgkJCQkJCQkJSkoNCg0K

