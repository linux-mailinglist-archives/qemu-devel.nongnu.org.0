Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7369854A3BC
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 03:40:30 +0200 (CEST)
Received: from localhost ([::1]:45590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0vXh-0001Cb-1J
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 21:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1o0vWI-00007R-SF
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 21:39:03 -0400
Received: from mail-bn7nam10on2061.outbound.protection.outlook.com
 ([40.107.92.61]:23617 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yajunw@nvidia.com>) id 1o0vWC-0004hs-UG
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 21:39:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLN21ech3MJweHDC92hYVdykKvQEbqwC16uWQ6n1w/rLvOnJ4XoIven6bRrNXq9LJN7N/R9cLICAuYH2n6eN3Ls1XAB3tOyX6Zi7gQPZUpYP5tD/thSInAY8GVef9AFIFQlzl0Cipdi/xcCWkixxh7GmvCqkVnZTACIwFw+HJs0ifQ9YDcLRX1AonXKwp2gba1FTKq4yfXDGJdqY+81i+jd+xtqEE3FMWEcx8NLpH++Mqn6HdtzTsJ6ESR6JTE+ZXLVL0VhGLl5g6X+tXGPhtEE2JWPLjGq0dc8A+BhdfKQconbS1F1T+bpmRnB7afTrYEyC+91XWCwwRCb16aF5wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvArmET9seb0CZwO9lTlKIX2CtkP85D4ben+o6KVufI=;
 b=AV3geuGigGqKdpNV8DWzR8CB5kRvOnipUBU0W93TroWPwZcUownpXvQ0tK34RVmK5/RZcKVuD9vo+JZNucnWkXRoXsETNFZ6gv7b2YpGuDGtOug0u6SI/lIgQLUNRRXCd4H3Y55AxXQWo/ihG0Rz/ZnESaGTG9GWg+rCfDMXDI58j6ptM0NYMpYRWXRVwefMg9hbH8IiW5/IKC4JFXdlka4YwdmnR/ylFF7LjdhkHcchujJVTb50X08uKxZJ3pSrYsBOUV3Qx8R/2JBFNahWoYKrV2OGRFPhL5jHkAarxnF65Z4X/FXKp/7TcyS85mvJueJ1LAYUXEePVgNS6COjxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wvArmET9seb0CZwO9lTlKIX2CtkP85D4ben+o6KVufI=;
 b=cSy/0A4bGdCKpHE5QkbK8CiDbvhyLLvULc4tLsyY2iS1RzVZLDuU34YAn2Sw/+mCxfElmXPCiU6VicJvImycrqOdxwE6h2w0if9tA0254kHByEtEWB6Civ3T79hve7NoDUbp1Ev6NzL7/saeCd3bQ1cGxnNBMB9ndLbyf6S33eFJI9PLioIuts5b9cdf4nx9EvucOlJSuSnjNnxEn3WIU61V+BHJgwi/sH/htWGQt5JfHJAHhHyGP69omUWdCSS95OhgYamxE52sXDwwDEKlrkHN9tGpQGmYDEmQhNsvwavWwGRWtSlvuxOHWU/MqAbXvb0eXw6Me2Zstt8AtTqXOw==
Received: from DM4PR12MB5168.namprd12.prod.outlook.com (2603:10b6:5:397::8) by
 MN2PR12MB2878.namprd12.prod.outlook.com (2603:10b6:208:aa::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.16; Tue, 14 Jun 2022 01:33:50 +0000
Received: from DM4PR12MB5168.namprd12.prod.outlook.com
 ([fe80::e17c:de37:8fd7:6262]) by DM4PR12MB5168.namprd12.prod.outlook.com
 ([fe80::e17c:de37:8fd7:6262%9]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 01:33:50 +0000
From: Yajun Wu <yajunw@nvidia.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, "mst@redhat.com"
 <mst@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Parav Pandit
 <parav@nvidia.com>
Subject: RE: [PATCH] virtio/vhost-user: Fix wrong vhost notifier GPtrArray size
Thread-Topic: [PATCH] virtio/vhost-user: Fix wrong vhost notifier GPtrArray
 size
Thread-Index: AQHYcLOQ906rIhR/QUSHTINJ9hv9Fa0wvWiAgB1+KyA=
Date: Tue, 14 Jun 2022 01:33:50 +0000
Message-ID: <DM4PR12MB516883266752C2A5B063304EB6AA9@DM4PR12MB5168.namprd12.prod.outlook.com>
References: <20220526034851.683258-1-yajunw@nvidia.com>
 <874k1c22i3.fsf@linaro.org>
In-Reply-To: <874k1c22i3.fsf@linaro.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f59bbd9b-5178-4855-f0f5-08da4da5ef40
x-ms-traffictypediagnostic: MN2PR12MB2878:EE_
x-microsoft-antispam-prvs: <MN2PR12MB2878E0401181DFBC3DDABE3EB6AA9@MN2PR12MB2878.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MpDJ96vOqGr8TrUgeTzlPx5iHCNi5UnZbSnpNwZOJ85a9qgmDV3p3KWn2hXMPzgV6AQkc2/CsV7l6MrbOUNIjsGpSLkmjOwP9tYx+RllScvM7VH2iJMaejj+TJSOY6DDX5ESMxdQwRlcF8xSC+E/WGayM5IcxN3IMPcI+oYH81uqa2aBqUNn+dg2LZecghRdrunJYhAoxEuq3dMvWrdIJP8ueufPKGFkNjNQisTbYGmiIwt1PVlcJPq53u5KIaESvE3pVGBzUl8sScPLIGX06X0zC/Hh50YaFqXNXotO9qnhQWNW268iS0kzqxWDaOQgtHGnRm3+Lfjqc6UVvq/vw3mgcQKbGHNFSLnY7+TCzB2RLdwdgkqSYsirNa1+ste7hOmnKJLGxiiGoXqw0HeZodWfsAkUa/NxzHW8Ingmor5mlesJhDEPH+Jn+Gqg6VkP+rhEz4EByJDLjnmM0dDFAnv8pO2D6GS6RAoI1uMOpRPhACQkcjdIe/i+/9u4AodWZVEcRpOjueQnQ8cqB9w1OEZnm6zlhm4IvV37xbjtOyk8s1oIFJmOJ2SnISUhBV9QhO8HrHRrWRmv3v2y1HZmjZrEcJ0YtqGv0ntSEjqYhmUfYH1GcoLevCRWXovD+gXqfhjFih290ePad6vKl+zHpBJXCne5fJt+c1J20Od9ev0kYIs5+luwRsQUQRLtHGGE48O15jj/m0rrU/9KK/UKEA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5168.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(9686003)(26005)(83380400001)(52536014)(76116006)(66946007)(508600001)(66574015)(107886003)(53546011)(7696005)(6506007)(8936002)(71200400001)(186003)(38100700002)(110136005)(316002)(54906003)(86362001)(55016003)(66476007)(64756008)(33656002)(38070700005)(66446008)(4326008)(66556008)(2906002)(122000001)(8676002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YjBTK0huN2o5UGtJaS9zdlp6cXR1SlRUaE52ZHkvcFFtYll3VGVGL3huRDBH?=
 =?utf-8?B?SVJmTk5WN2pUY2hUUks1eWo2RGFsQjZsSmU1Nkl4N3RCSWRmbVZ6SDM1Qm5o?=
 =?utf-8?B?aGVvSG4wdTg5TXJINDJhR3lhUUJscXNJWm9ZMVJrTS9tN29NUDB6YVFkQlRa?=
 =?utf-8?B?YmpHTlliSGxrVTBNMGZZSmlWdS82eXFTc29CQjJDM2xnRkVJNU5tUU9QQnIv?=
 =?utf-8?B?VXFhV0YzclVkcVRtU1llcHJMUFN5WFIvUnVUSUFuaEM1RFdXMStNMGpSZ05n?=
 =?utf-8?B?TTZpcG5RVThaMXJBMEp5d2t2VFFrRU5wUWNLdWhHNXRjQUlNc2RIa096UXlw?=
 =?utf-8?B?UlpnaEtHU1NHNGwxOEJueUpQeVg1bC9TbDQyclFkUUtvMlovckRtNktQUjU4?=
 =?utf-8?B?ZTVDMmgvVkc5NUc2VnNGYkFSaHZZWlYvckYrRkhSYm9mUlh6VzR3SCtQWWt5?=
 =?utf-8?B?djNNUU9UMnlXczJrWVFvZ1VrUm1Pa2hRU3oyTkxDenc2cll5eXp2WVB0OFRi?=
 =?utf-8?B?blM5NnFOYXhaSCtaVXJxdFZ0UkR0ZFVSRFBPNVk1aVFkOG5LRDdYeWpLMDdD?=
 =?utf-8?B?c0JaMlljZmZ3dWpMSjRLTlJwcmJvcVRFV0VnaXcrQWY2T0NvRnVxWHVRb2Qw?=
 =?utf-8?B?M0FuYXM5NGpNd0xWQWRWUHVIeGFFL0E5bDlIRkcxNGJrWFlxakwvWjVsbVJx?=
 =?utf-8?B?K0wwNUpjNEkzMkxsbExWWnR4TnpuU1dzYXRlUWlOazluWDJXSTB1Y055SFM4?=
 =?utf-8?B?WjNSUEV2TlppRFZKMXI3b09iWFdjU0Y0YWtzNU4zR0pVU0taTVdOZDdPMEUv?=
 =?utf-8?B?OUhqRWlXVWViS3IwMERWUVRqdzN6VEhWZzdzZUpOV1dhOEpsRDgvTml4c0Vn?=
 =?utf-8?B?SkpsckFmd21MRjZCdTFzVldqT0VXaUg3QlZLbGJBbHQ2RXFSbnYyYWN2NGlr?=
 =?utf-8?B?UTlmamVTRWxSeWFvRkI0Tmw1alVpUzRNRkE1ODB1YkV6RkNWZEJYVGM1SExJ?=
 =?utf-8?B?NzI3UTByUDlGbEJNWVorbjV4enpITEZwQTJqZUE1c0NYRUd4dXp0QktVNURI?=
 =?utf-8?B?c2ZHV3RDenRydHBPM2x1ZmE0UWRZekI3RU1IM2EvTFdmdXVkSDVXaW1QSW9v?=
 =?utf-8?B?Y28wYTQ1RTZVazZKMW9WTllOby9VUmZRWVArQVBURE0yQUZYYXN3WDUvL200?=
 =?utf-8?B?WkNVK0lCQWROaCsxa1ZaSXdKSFhpOWpreU9CRTMwQzN2SE81Qm9KZElIc3ls?=
 =?utf-8?B?RExuRFErcEg2MWNXK0tES2p3VHZRbWoySUoxUHFvWXVvbkJEQ0ZyT3BuSjdW?=
 =?utf-8?B?cXgrdElWaDdqR3IraXcxMUFwRUlXL3czTEM5Z3RlWGh4aUt5K3JqYjZRMGNO?=
 =?utf-8?B?cnVSMG9EdlNscXhNNHo5SXpXbmxpSk1Nb3EvblNyM09EUG5ETnVVeGk2VVk5?=
 =?utf-8?B?LzFRZG9IWUdpR2U5YnVKOUJNWVkybGJOcjVVMlB4NlJ2OW02RDgyamlYaUk3?=
 =?utf-8?B?ZUtIWnVDOURpd05lNSswdWpOMTlHWVVSY2dHK3NLbUtoWFFPNjFNTmhJY2dq?=
 =?utf-8?B?amw0ckhNMmhkSmZYREwzd0VvVTM0UXhYVDdDelFNOGRBUmMzTHMzVnlHWUNo?=
 =?utf-8?B?VVJMQ3pvMUgvd0VMZWMwOFZCNGdvOXBsbVlHTzZIUzYzN3N6aGo5ZEdlVnFF?=
 =?utf-8?B?VVJKQ1UzNXlPYjRvNXNVNHM2QWs5TVorbTlaWVZhZTZHMWZlV2xtdVQrMFVE?=
 =?utf-8?B?Y2RNLzR1cjNUWktqckRpanEvYTJuS3JqYzM1LzNoT1NPZjM0SjJlSjZKR241?=
 =?utf-8?B?YXM4TEg2MExQNHhIODZIdUN4a3RGa2dYcG91QktHaWwrQlBKNVo1aUp0cnFQ?=
 =?utf-8?B?RnV1SktYS0ZaeTlCRGhPSzdXWEhsM1dtS3E2KzloWWxSNGcyZjBoem51NEFo?=
 =?utf-8?B?SnFrQkZjTXpHQWIreGNXUi9uaHJ0Rm1JM0VDbDdITjhnTlBxVVNGT2J4ZHRj?=
 =?utf-8?B?TnFhalEvNHE0RGlJWXYzaXQ3VXFac0RoTlA4RGl4Q0I3dU9KSm1aZFlIdy9K?=
 =?utf-8?B?dHNIQkJmZjFsMDZybTlyak9Nc3UwamVGUld5eGpBNDMrSFBvaXk2MGNLbEgv?=
 =?utf-8?B?SVFCeTFpZk1UZXRmTTkzYXA2ZjdTYXJpd3JPZEpqQzNqMWdic0d2NTFXTUFx?=
 =?utf-8?B?bVdnMFJWSFRZamQ5Mzc4cWtvZDJyaXdwOWNSSXRTQTIxcitOejQ0RTB3bHNI?=
 =?utf-8?B?ZEdiY1o4RUFGQTBJcHJObUdkaWlicCtTNHc4SEFwbzJMN0IwRlEwTU96Qk50?=
 =?utf-8?B?M0tQNm9TRVlVWjdYYjZFUEpCLy8vYk1uYXNRVno0MUxwR3JnQzhpUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5168.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f59bbd9b-5178-4855-f0f5-08da4da5ef40
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 01:33:50.4986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gdkBRDTK+aO2LZC9SOU93OTDZQoKoqUiQcsTnXFpDsScEK4DdHZJpk3M2qM7XpR6XUMNXdu3Ke4rcaB6Iby8cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2878
Received-SPF: softfail client-ip=40.107.92.61; envelope-from=yajunw@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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

SGkgTWljaGFlbCwNCg0KVXNlciBzcGFjZSB2aG9zdCBjbGllbnRzIGFyZSBicm9rZW4gZm9yIGZl
dyB3ZWVrcyBub3cgd2l0aG91dCB0aGlzIGZpeC4NCldpdGggQWxleCdzIHJldmlldywgY2FuIHlv
dSBwbGVhc2UgbWVyZ2UgaXQgaWYgdGhlcmUgYXJlIG5vIGZ1cnRoZXIgY29tbWVudHM/DQoNClRo
YW5rcy4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFsZXggQmVubsOpZSA8
YWxleC5iZW5uZWVAbGluYXJvLm9yZz4gDQpTZW50OiBUaHVyc2RheSwgTWF5IDI2LCAyMDIyIDM6
MDkgUE0NClRvOiBZYWp1biBXdSA8eWFqdW53QG52aWRpYS5jb20+DQpDYzogcWVtdS1kZXZlbEBu
b25nbnUub3JnOyBtc3RAcmVkaGF0LmNvbTsgUGFyYXYgUGFuZGl0IDxwYXJhdkBudmlkaWEuY29t
Pg0KU3ViamVjdDogUmU6IFtQQVRDSF0gdmlydGlvL3Zob3N0LXVzZXI6IEZpeCB3cm9uZyB2aG9z
dCBub3RpZmllciBHUHRyQXJyYXkgc2l6ZQ0KDQpFeHRlcm5hbCBlbWFpbDogVXNlIGNhdXRpb24g
b3BlbmluZyBsaW5rcyBvciBhdHRhY2htZW50cw0KDQoNCllhanVuIFd1IDx5YWp1bndAbnZpZGlh
LmNvbT4gd3JpdGVzOg0KDQo+IEluIGZldGNoX29yX2NyZWF0ZV9ub3RpZmllciwgaWR4IGJlZ2lu
cyB3aXRoIDAuIFNvIHRoZSBHUHRyQXJyYXkgc2l6ZSANCj4gc2hvdWxkIGJlIGlkeCArIDEgYW5k
IGdfcHRyX2FycmF5X3NldF9zaXplIHNob3VsZCBiZSBjYWxsZWQgd2l0aCBpZHggKyAxLg0KPg0K
PiBUaGlzIHdyb25nIEdQdHJBcnJheSBzaXplIGNhdXNlcyBmZXRjaF9vcl9jcmVhdGVfbm90aWZp
ZXIgcmV0dXJuIGFuIA0KPiBpbnZhbGlkIGFkZHJlc3MuIFBhc3NpbmcgdGhpcyBpbnZhbGlkIHBv
aW50ZXIgdG8gDQo+IHZob3N0X3VzZXJfaG9zdF9ub3RpZmllcl9yZW1vdmUgY2F1c2VzIGFzc2Vy
dCBmYWlsOg0KPg0KPiAgICAgcWVtdS9pbmNsdWRlL3FlbXUvaW50MTI4Lmg6Mjc6IGludDEyOF9n
ZXQ2NDogQXNzZXJ0aW9uIGByID09IGEnIGZhaWxlZC4NCj4gICAgICAgc2h1dHRpbmcgZG93biwg
cmVhc29uPWNyYXNoZWQNCj4NCj4gQmFja2VuZHMgbGlrZSBkcGRrLXZkcGEgd2hpY2ggc2VuZHMg
b3V0IHZob3N0IG5vdGlmaWVyIHJlcXVlc3RzIGFsbW9zdCANCj4gYWx3YXlzIGhpdCBxZW11IGNy
YXNoLg0KDQpNeSBiYWQuIEkgd2FzIGxvb2tpbmcgZm9yIHdheXMgdG8gZXhlcmNpc2UgdGhpcyBj
b2RlIGJ1dCB0aGUgaW50ZXJuYWwgdGVzdHMgZGlkbid0IGRvIGl0LiBJIGd1ZXNzIEkgc2hvdWxk
IGxvb2sgYXQgZ2V0dGluZyBhIHRlc3Qgc2V0dXAgZm9yIGRwZGsuIEFueXdheToNCg0KUmV2aWV3
ZWQtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4NCg0KDQo+DQo+IEZp
eGVzOiA1MDNlMzU1NDY1ICgidmlydGlvL3Zob3N0LXVzZXI6IGR5bmFtaWNhbGx5IGFzc2lnbiAN
Cj4gVmhvc3RVc2VySG9zdE5vdGlmaWVycyIpDQo+IFNpZ25lZC1vZmYtYnk6IFlhanVuIFd1IDx5
YWp1bndAbnZpZGlhLmNvbT4NCj4gQWNrZWQtYnk6IFBhcmF2IFBhbmRpdCA8cGFyYXZAbnZpZGlh
LmNvbT4NCj4gQ2hhbmdlLUlkOiBJODdlMGY3NTkxY2E5YTU5ZDIxMDg3OWIyNjA3MDRhMmQ5ZTlk
NmJjZA0KPiAtLS0NCj4gIGh3L3ZpcnRpby92aG9zdC11c2VyLmMgfCAyICstDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBh
L2h3L3ZpcnRpby92aG9zdC11c2VyLmMgYi9ody92aXJ0aW8vdmhvc3QtdXNlci5jIGluZGV4IA0K
PiBiMDQwYzFhZDJiLi5kYmM2OTBkMTZjIDEwMDY0NA0KPiAtLS0gYS9ody92aXJ0aW8vdmhvc3Qt
dXNlci5jDQo+ICsrKyBiL2h3L3ZpcnRpby92aG9zdC11c2VyLmMNCj4gQEAgLTE1MjUsNyArMTUy
NSw3IEBAIHN0YXRpYyBWaG9zdFVzZXJIb3N0Tm90aWZpZXIgDQo+ICpmZXRjaF9vcl9jcmVhdGVf
bm90aWZpZXIoVmhvc3RVc2VyU3RhdGUgKnUsICB7DQo+ICAgICAgVmhvc3RVc2VySG9zdE5vdGlm
aWVyICpuID0gTlVMTDsNCj4gICAgICBpZiAoaWR4ID49IHUtPm5vdGlmaWVycy0+bGVuKSB7DQo+
IC0gICAgICAgIGdfcHRyX2FycmF5X3NldF9zaXplKHUtPm5vdGlmaWVycywgaWR4KTsNCj4gKyAg
ICAgICAgZ19wdHJfYXJyYXlfc2V0X3NpemUodS0+bm90aWZpZXJzLCBpZHggKyAxKTsNCj4gICAg
ICB9DQo+DQo+ICAgICAgbiA9IGdfcHRyX2FycmF5X2luZGV4KHUtPm5vdGlmaWVycywgaWR4KTsN
Cg0KDQotLQ0KQWxleCBCZW5uw6llDQo=

