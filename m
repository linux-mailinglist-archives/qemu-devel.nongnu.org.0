Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5407349C218
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 04:29:00 +0100 (CET)
Received: from localhost ([::1]:47554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCYzS-0006vK-Uo
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 22:28:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nCYxV-0005KI-DL
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 22:26:58 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:52658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nCYxS-0000WI-U1
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 22:26:57 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20PMn9RY009994; 
 Wed, 26 Jan 2022 03:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=/kZlMNoFg+UQrwuywZYxiJ8GWx89G4ly5dxBkJ9DSEk=;
 b=RS1R0B5PHdnApAtb3dx48xYe8/aU2MExX1YvZ5D8l1DwEmv/GHk3MA7KIVfpEJevGkzi
 31ykjvXjWRV4cX6n5MHSR0FElaV9pW9uljnKUItFCELHADsnYSHeYm9+EOwTq0tJmveg
 0QlayMZWDABRWF8HZvT8IlMN1HTWCUEx9CorwbuVggXjqHaW7ssz8yHY4dJsKKmdvWlr
 EafT0m5rk9pbfYAAed2TndELNVNeDtuMFDbe1u/kF1m3309FvL+CFHSzd0SSx1IesREU
 MLhn5oxQi76kNixonzYXA8v6IJFIGhi0pIeAt1Uv7Qz9QGgw9sVRkBTlBwNY4nmjPSMy rA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsxvfmvcp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 03:26:48 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20Q3Gbkg127799;
 Wed, 26 Jan 2022 03:26:47 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by userp3020.oracle.com with ESMTP id 3drbcq8tx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 03:26:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLhqBNvoREj3sTWh90G6RaCncWlS0jLVnsjMS+bQj92vmmCisf/KL4E8A0+h+7AHC+0WXt9A5qKRPdQKnaqXaStJHkHG8TlHwtwtsYfg99skUHNDHESnogzhAKb0zTRj+23qk91VSydySh5AbkbnQ5Z7kW/PU4ZJiqplpt3Yov9GpM1PFZiEBCk83ozcfFrPHEg5ytN5Eeo5Km5JdZjUgIbpsVqzD+dY1ebdWp9OBJ44n9NDuVBwsAglDbAGtwE1f4MCe/DDCKAcG1OmFx1wZdz7QqE1bgptgHYoCIDwsxAy97l4QAz3jSTyOzR8NI8nU0FVPwOmBK4bxTUuInqgtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/kZlMNoFg+UQrwuywZYxiJ8GWx89G4ly5dxBkJ9DSEk=;
 b=mGgeEIV/oxZ7fiGvAosO5RHbdngc9w5Knx5WdTDHbfDXOZ4FI1enged6JIjiIZGmg8r8iMJgpsZgtbNvkvME97AEjiA4tBvZetSfRI2WG9PMkP24qEtWBaF4N0X4GO+jFGQcd3s7FZAqOTxgW0i02NvVxeDoOYJN20FtGhmmzzIRCE55MEEJ4gi9sHX1LK6Tg2xzkGcazm9DFmLaxqq652j8M2l02znw6Vjf8tIH7OTSjTEZ0YI+PlT2DVAHoULfnBEW9INR6GYU+EDFU0WjFXTvHqcIKVHmCkmGymxrEWPbq6KJJ5aIIMZi09+XQoFaVV8BzVJYxut3W/7mAnxslQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kZlMNoFg+UQrwuywZYxiJ8GWx89G4ly5dxBkJ9DSEk=;
 b=U+WGqqI5k6LcR/JPd5dntVZ/qQkF9cR4/sWZs8BuA5GYrU1l4Zibc5R6EVLbwNawkOVuOFSoJcEuI5ct3nUj284WGIH7h/ak3FhZqcuZuwS7KCp82V3wdr5GXncs474TNw814RwY/tSCdWYS+iFOe5fYVzNU5n83xR7FqSXPOLY=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB4269.namprd10.prod.outlook.com (2603:10b6:208:1d1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Wed, 26 Jan
 2022 03:26:44 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4909.017; Wed, 26 Jan 2022
 03:26:44 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v5 12/18] vfio-user: run vfio-user context
Thread-Topic: [PATCH v5 12/18] vfio-user: run vfio-user context
Thread-Index: AQHYDX2GRMUnMTQ7kU6eV8ZVH9y3xaxz4FCAgADNyYA=
Date: Wed, 26 Jan 2022 03:26:44 +0000
Message-ID: <332A50C9-0CC3-4AE7-B869-1220A8C0937B@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <63ef44664629ffd07d3bffe60351e808965dd13e.1642626515.git.jag.raman@oracle.com>
 <YfAS0+7qg8Db3roP@stefanha-x1.localdomain>
In-Reply-To: <YfAS0+7qg8Db3roP@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2831f71-a9cf-4b06-6414-08d9e07bada1
x-ms-traffictypediagnostic: MN2PR10MB4269:EE_
x-microsoft-antispam-prvs: <MN2PR10MB42697168FE7D0E4829BE9E8290209@MN2PR10MB4269.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EesOiVC+pWm4+Bk4kXWB2Koamc526uVpnL4vyO6YE+yPjYHsZwlj7mr2J4kGjv661DW7lgDjVB1vyJogUOi9t3OC9k0toa8KDkddS8ht9hRb6SuOBAk3y7UiaWVzXu4waV63bbDG3XheASE0h/imo6BYEkP3zD+epdMpM+59DHvLE9ifNo5Ui1EpQ0gogsNzJTYZtSLjBC9PDObZ8Xm9fDe4BsEtu2ez8pY5wNQwE4TBU2cBjyATCSUWzMDm+zG5sEnXbXCJX5/APQOzvHWtMtsy4LmL33IxYi75mvH8YtHqzyA9uE1eMWLdlWUuvt2CHUAccTTBIioQId8Kh5CZi9ypBNo+6dkS/MHAzHw4zGH1BtwXouRfouZv3/fzqrLAmG7xbk8/ywOxqlWo9TwS+9VLKXhZ3LWPCzwlPKbjk5CqI9SGTHreiBC6fv2sjxJcUyAzqX4i4N703ddkSrkCsH8TqbDj+k5yCgj4wbE6mzEmeBfKE5o9UIntg87qBs7zDnnUBApoOKMruNR0fUM8WDh04GqHW0hJPIQX+MgHlQvoE4/RFUs1CLpB5g1RBla0UAwFusFO7rdoUI/H5gKzzpz5yAzQAjYK2p7hpKny2rySs1T88mwArNgMp73t41Ap7NF1LfdMuydmO6U6qmnIUVC832OpO1lvDpLVYCAHQoCeOIxwbEAqZamQ9Dc0MsaSHtB5Ovy7fGd4krs+u9Sx0R02+ON7OStaaz8udQqbOe0vOiB9/AUy3F0lNNkih9dwB5kF5Z82bajNpzRvBYC6Leuvwu8qxaqb0obp0gr8imA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2616005)(7416002)(44832011)(86362001)(33656002)(186003)(6512007)(6486002)(316002)(54906003)(107886003)(36756003)(6916009)(66446008)(5660300002)(2906002)(4326008)(71200400001)(53546011)(6506007)(66946007)(508600001)(64756008)(83380400001)(66476007)(8936002)(66556008)(76116006)(91956017)(38100700002)(122000001)(8676002)(38070700005)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?JnOavTSq8oAPgaA594e9VDeGofqsztTJP3jtyRgkDh4njoE0Rdf4wU2XMY?=
 =?iso-8859-1?Q?Oj6259eFbAjNrpnsepDZ1ZkpkPZHK8W//y6y1mhynQErJ9dxyLlF59rcBs?=
 =?iso-8859-1?Q?5Ykr7154nflvol5PbCN9Z8jML/q4QqSnXLYBYpgLyGCEIpnzhOoEX24Xd/?=
 =?iso-8859-1?Q?COQ65RQH6DB6oajB0moCYz9uDyQ1tqzOQIsLt5a5zBCNmLmJ4SmfYR331j?=
 =?iso-8859-1?Q?EzI53DWYzSha2h0c6LzP8BgXREaUfpOuLDRPxrDRSq2hsLiCFgPHkMdMBB?=
 =?iso-8859-1?Q?IZIoKxM1VnY1YJwPwWOKMdDDcb443zepnfxjiJR91qXrBSijEOno1ioI+W?=
 =?iso-8859-1?Q?BFc0o27JRNRhDukvTeWB1cE9npbdu/QXgaNB5iUmrFjcMypkKt1wA8edze?=
 =?iso-8859-1?Q?8rC/8l9JUSBcRTNU8P5kXfpgVTDvt9r8w2idsGvckFs/+uRWM6FPFLnAhr?=
 =?iso-8859-1?Q?rW6lZCB+4aDa9ileUun9OzvRiW0tPwFi0C05jgilc0haWbSNZxUCobmnDw?=
 =?iso-8859-1?Q?OEdMpE9qjvGpbdnyrRI4co1gkaYkwEpxVbdQWJL52Wye5R7fqyZOofc0Gt?=
 =?iso-8859-1?Q?0BJ8TkwJiu7gYYDspLj+Y56qGpqnpZqO0A2PRqyQGU+B+d0ktGEtCdeBzP?=
 =?iso-8859-1?Q?fvHAqx2cFSFt3KGfFH6aFSg0QKNTWvDqs1aNDUl/rvov0fwZyfTkDmWZ0t?=
 =?iso-8859-1?Q?fV9BM1jdVK2mVeazUoJIFbOwVPARMyOxfIrdL8loRQIGOAdXlGjIzZoqdb?=
 =?iso-8859-1?Q?ds1wFP86huTiRZSDwcbJ2df/bcPgdAlFsDWlJQL5SvYfYs5esmKvc9cSAy?=
 =?iso-8859-1?Q?ex8BckXCZoyxF5hZWAWMjFcd+L/45s2NNyI251K6Xrouh7ff3buAA/R9i9?=
 =?iso-8859-1?Q?VO/QOtrja31683NWkuIWDxK0aaSHsOqgijGr/HxJze2VStT9eD2ou6kRLt?=
 =?iso-8859-1?Q?7RLw/XXHhQIXNoIUODOH1P1/IVGUZlqkf3mTzg3NKdvre7f+iADnAaPAIW?=
 =?iso-8859-1?Q?v1hbHTn0S2ntQscZj7gZ/PRim6Jkf18zsFUmsnSdliWyY7KIG+ks4jt0Wg?=
 =?iso-8859-1?Q?jniAMkBw3eD/TU8MsCJSmAeqQvPBHH++p9h2CGv/DzrL5ArA5qRGf09Yph?=
 =?iso-8859-1?Q?ye/Yjpmmh1/H2oq2QKOxanPT7x+0gzJChmtwz5eAQSM2Uyu46wiM+l/R/g?=
 =?iso-8859-1?Q?i7V+78LXfC5UUIYY/BrNQASgLRQyqz7Tam7UQ/+jWqmNbb3EQaaQqLQZsu?=
 =?iso-8859-1?Q?XIuMWtZbSNikQDZK1Mo5arsVeo6uGe7DTJY1E4asvxcZVvMTvp0bl2v/t7?=
 =?iso-8859-1?Q?skj7VnrxSmosSBG8qtjDlgn97lXaX5I356yS/gzVGu/uhOaQtG5tT6DTb6?=
 =?iso-8859-1?Q?5CVSCiS72DkGgZA/5f+CrmrNCRnL6hZeJNFa3/xMDM78qe2PQcSjtZNZZ5?=
 =?iso-8859-1?Q?Ztc49dBtCkKIzZOMzvL9cEWEL4TWQ0tF8kxX5hgRzRV1wXE5v7H7GhnHG4?=
 =?iso-8859-1?Q?CDS9bfQdX1nGPXmwS3g8ZZu8g6xMeReuSGqsx/Qckiu6a/F72eBfqPZAav?=
 =?iso-8859-1?Q?T1zRW7g0czCtUtNiBzdwdMe0kUfXtXsamCb7+eSImeXwxzO8TgZzkDxmTi?=
 =?iso-8859-1?Q?OQLRqLXDAk6GFGaOQhoxKiB4oZOSP0xfdKtGZuPBskGAcYGYXzqCJGA82W?=
 =?iso-8859-1?Q?5XFPoXMm+8a1TA5HmQwWi+hPRv7RSR5Or0oes3DNGZS7bJD9FRJfm3Pfw1?=
 =?iso-8859-1?Q?kdLQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <37B398A1A7C58A40BE1E822E012AE741@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2831f71-a9cf-4b06-6414-08d9e07bada1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 03:26:44.7645 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 47donYtdaqRitC2jeC83rY0AvEC/JQ6R2B4BCthCMR31HkvrZ82DrVJm6Hxi60Fv/u04spZUPGop1Em2So9aEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4269
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10238
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 malwarescore=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260014
X-Proofpoint-GUID: OxUpALnd1LXkptLh7pLIw2bVSMn_6Wog
X-Proofpoint-ORIG-GUID: OxUpALnd1LXkptLh7pLIw2bVSMn_6Wog
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "mst@redhat.com" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jan 25, 2022, at 10:10 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
>=20
> On Wed, Jan 19, 2022 at 04:42:01PM -0500, Jagannathan Raman wrote:
>> Setup a handler to run vfio-user context. The context is driven by
>> messages to the file descriptor associated with it - get the fd for
>> the context and hook up the handler with it
>>=20
>> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
>> ---
>> qapi/misc.json            | 23 ++++++++++
>> hw/remote/vfio-user-obj.c | 90 ++++++++++++++++++++++++++++++++++++++-
>> 2 files changed, 112 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/qapi/misc.json b/qapi/misc.json
>> index e8054f415b..f0791d3311 100644
>> --- a/qapi/misc.json
>> +++ b/qapi/misc.json
>> @@ -527,3 +527,26 @@
>>  'data': { '*option': 'str' },
>>  'returns': ['CommandLineOptionInfo'],
>>  'allow-preconfig': true }
>> +
>> +##
>> +# @VFU_CLIENT_HANGUP:
>> +#
>> +# Emitted when the client of a TYPE_VFIO_USER_SERVER closes the
>> +# communication channel
>> +#
>> +# @device: ID of attached PCI device
>> +#
>> +# @path: path of the socket
>=20
> This assumes a UNIX domain socket path was given. It doesn't work well
> with file descriptor passing. The x-vfio-user-server is an object with
> a unique QEMU Object Model path (the last path component is its id). You
> can get the id like this:
>=20
>  object_get_canonical_path_component(OBJECT(o))

I was also wondering how to get the object ID. Thank you for the pointer!

>=20
> I suggest dropping @path and including the server object's id instead.

OK, will do.

>=20
>> +#
>> +# Since: 6.3
>> +#
>> +# Example:
>> +#
>> +# <- { "event": "VFU_CLIENT_HANGUP",
>> +#      "data": { "device": "lsi1",
>> +#                "path": "/tmp/vfu1-sock" },
>> +#      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
>> +#
>> +##
>> +{ 'event': 'VFU_CLIENT_HANGUP',
>> +  'data': { 'device': 'str', 'path': 'str' } }
>> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
>> index 10db78eb8d..91d49a221f 100644
>> --- a/hw/remote/vfio-user-obj.c
>> +++ b/hw/remote/vfio-user-obj.c
>> @@ -27,6 +27,9 @@
>>  *
>>  * device - id of a device on the server, a required option. PCI devices
>>  *          alone are supported presently.
>> + *
>> + * notes - x-vfio-user-server could block IO and monitor during the
>> + *         initialization phase.
>>  */
>>=20
>> #include "qemu/osdep.h"
>> @@ -41,11 +44,14 @@
>> #include "hw/remote/machine.h"
>> #include "qapi/error.h"
>> #include "qapi/qapi-visit-sockets.h"
>> +#include "qapi/qapi-events-misc.h"
>> #include "qemu/notify.h"
>> +#include "qemu/thread.h"
>> #include "sysemu/sysemu.h"
>> #include "libvfio-user.h"
>> #include "hw/qdev-core.h"
>> #include "hw/pci/pci.h"
>> +#include "qemu/timer.h"
>>=20
>> #define TYPE_VFU_OBJECT "x-vfio-user-server"
>> OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
>> @@ -95,6 +101,8 @@ struct VfuObject {
>>     PCIDevice *pci_dev;
>>=20
>>     Error *unplug_blocker;
>> +
>> +    int vfu_poll_fd;
>> };
>>=20
>> static void vfu_object_init_ctx(VfuObject *o, Error **errp);
>> @@ -144,6 +152,68 @@ static void vfu_object_set_device(Object *obj, cons=
t char *str, Error **errp)
>>     vfu_object_init_ctx(o, errp);
>> }
>>=20
>> +static void vfu_object_ctx_run(void *opaque)
>> +{
>> +    VfuObject *o =3D opaque;
>> +    int ret =3D -1;
>> +
>> +    while (ret !=3D 0) {
>> +        ret =3D vfu_run_ctx(o->vfu_ctx);
>> +        if (ret < 0) {
>> +            if (errno =3D=3D EINTR) {
>> +                continue;
>> +            } else if (errno =3D=3D ENOTCONN) {
>> +                qapi_event_send_vfu_client_hangup(o->device,
>> +                                                  o->socket->u.q_unix.p=
ath);
>> +                qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
>=20
> Do we also stop monitoring o->vfu_poll_fd when object-del is used to
> delete the x-vfio-user-server object?

Yes, we should to stop monitoring the o->vfu_poll_fd during object-del. Wil=
l do so.

--
Jag


