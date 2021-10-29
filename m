Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4050243FEA8
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 16:45:53 +0200 (CEST)
Received: from localhost ([::1]:42578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgT8h-0008GT-0X
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 10:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mgT5v-0006Mz-29
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 10:42:59 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:35812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mgT5r-0007HJ-Eu
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 10:42:58 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19TE8w02020576; 
 Fri, 29 Oct 2021 14:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=/Dzo/bIOVxNwns9UC9N65TRP3hJeFr56xffMxmTsyL8=;
 b=BwqDbxVdWMGzg7oI/NrpHk3ma0cpaBB3cWOuYS4w4Rrx+3nwK93W1ZP9RR/oolCrS0sp
 GTxREJ/OsW2bhG162Iacquiue+1y/5C/6lHe/Yyouazyl3G8O3Awxc3bIljMawDNi9AS
 ZFUF0BjRcJj4+1gm+jVoB1jI03SyHrLi+dYmLwLqjX05HFYAMO+e0ZC8ySkI8gCOWTJE
 jKhOxo08EYYGKHid4mLytOJzlfKfrIcvuGbMv0rKx5YRMoe9CGG52lAs7806hVNwDDLj
 Cf2mtgglaNaVvVcFYuYpSnklh88K78RAXKJk6WO+82/sa37+VohS3RTj0KhM8wYFSXtW Bg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3byjkf8kv6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Oct 2021 14:42:52 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19TEbUvE067924;
 Fri, 29 Oct 2021 14:42:51 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2040.outbound.protection.outlook.com [104.47.56.40])
 by aserp3030.oracle.com with ESMTP id 3bx4gd7323-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Oct 2021 14:42:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czMBxQM+PraxPaEPXZoEBOmQQEX5InrJ2zGKX7E7tolIgo8xGsB85+QmqS0v/kMjRJrPa1pVeYJZVLlX5sBBn82dpICCH7ePAs/6HOxVFvLWwnUEcMMFS3VnPusbJRAkg+8VnHoUMMGXU4boh3VU21yqfjOIwLGG3C5TwqKffOpjA3Kyx40WYp9LIAvuKP3SXagMy0KUrbdtFMWyGJTOoinWnspGSkchCnQxvE3NL2i6ar8bnYKpVUa9A3gBa69e8NGnp8HbyIFLgEJCangJn94cgqmqoc78UnoRwxAu/SKQv/A3MyD0bAdBkmwYJG66/tcX8jaOm8XRnXNZuUqu+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Dzo/bIOVxNwns9UC9N65TRP3hJeFr56xffMxmTsyL8=;
 b=QZvTq1aQNkDgVlrjtRifk0w9S2A1sfBB0JXTjxNLpTl8I+PeP4wH6ckTLZRNrcJLkjOMIrK7SKer93tr4PiXoJL2wUZZz4zNBM9PkmbyL5TvzqGlQbKB1UcOXCWn/B/bkf61hsDb8+RWitNotVnXwp/xM0Huo1EEQCaYuQyQ2jRPN4kbeCWyZJpbKcovsXX0ww/zgcqk/EJy6WgnFtdvGYG6g4Mm9TpOfHg7+3GWtKBat4KKSPo6ZjGpCJSQfxUIpyKy579W5YC52CdOK5UHFGjCoFD7vXA4ekUZauzrEAeDbJ4rhCR5/BwRvduuel1iu7JnZ5A43E++v0IrR058Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Dzo/bIOVxNwns9UC9N65TRP3hJeFr56xffMxmTsyL8=;
 b=DFjdKXdVea4JyFLJVaHfQQIR0LGnPO21TEZrUwkpGOSr9q/JsCCy9/GSyzK5V689Osc64VJjThRxczuT6QyCWmizcGms5u7fr+ubbOzB/51NPjKnKUqqhO/p/agGafHqsSLsFdYmC8r60AJNpyXHfx63qfQHCdnrPBgk8tG/FtA=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BL0PR10MB2964.namprd10.prod.outlook.com (2603:10b6:208:79::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 14:42:49 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca%3]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 14:42:49 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 03/12] vfio-user: define vfio-user-server object
Thread-Topic: [PATCH v3 03/12] vfio-user: define vfio-user-server object
Thread-Index: AQHXvmCIyfMSLQxwMEiNDunHjET7kKvnFRgAgAMUogA=
Date: Fri, 29 Oct 2021 14:42:49 +0000
Message-ID: <6346833B-469B-487B-8382-62EA03BA56C2@oracle.com>
References: <cover.1633929457.git.jag.raman@oracle.com>
 <13dba991f1de91711e5c3cad9a332d6e7c5eee7b.1633929457.git.jag.raman@oracle.com>
 <YXly2vSh/bhgr0i/@stefanha-x1.localdomain>
In-Reply-To: <YXly2vSh/bhgr0i/@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5833f36f-b0c0-4f07-bb9a-08d99aea6168
x-ms-traffictypediagnostic: BL0PR10MB2964:
x-microsoft-antispam-prvs: <BL0PR10MB2964507D612735267821604190879@BL0PR10MB2964.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hpT1EtMgzgRC4h4aN5gRL+ITyT3CYN7SYP4IOIOB2Si7fD6WB6AL1MQCGat9aG4woH8XAG6WJq+xoc5VYF2ydZYE3lrZOc6DwQO3nOJzZMZkbxiazdPWsTXBmNDQriSc7o2PeD8JDsROmX9Op74PEPxE8ibw9QaHSfhsitlpaV7OjwluVP2MwxxxO5yW5ti1A3NPXtx3HEn8Y29jkPOBVNtT2YMLXiJqZsSwqrWjeNUphZhQnF7wAluUbtcMFX8t7JXlZ8m1cQDTCtAlieHyNQcwBVfjMVjCzlj2gBRwBVbCctLj2dvsEvNjfDsqfOnCcLJnu+lP1MYge7z6y4GCmBLdH/Ba99iXj9RerwZj/G/9Ch+mdh5AtoUU88RHAOYJpTS0QH6msw0LhFGEITSmVf6jMpIe6sKffNHjR790+8LHauQyvOITp0lHDSkuFkJqA3ycU0BqCZqgkAx/0qauZUbIRiYgBZDXlCgc7A5YLjLVdFLaifHHYvsUTuN3SxBFUwFBLNgLX3qsmVwc6ALPhTLzvo9SEjX+I9fHV+JfPat5GPWkPe3DydORSME+/MBDZu6MqUBpJhC77bandlnmTaE1lY4Bv7MXywaW8vEASqbrzshNePmDAV5d/J75bqL1L7x9AyrYleGYWwPyghaIWMIOjpRYOpp9XKoGxS4tdZ8N8skuh0Kk7Xj6P52VTX9VwCIjYogqbIZNFbHxg4FNoRg9efN15JavIgmrKWk7QsaL5lqKrZmdfI7Rv0A9fqyW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(122000001)(38100700002)(5660300002)(8676002)(6486002)(33656002)(44832011)(8936002)(2616005)(4326008)(71200400001)(508600001)(66946007)(76116006)(6512007)(66476007)(86362001)(316002)(186003)(66556008)(64756008)(66446008)(53546011)(6916009)(7416002)(54906003)(91956017)(38070700005)(2906002)(36756003)(6506007)(83380400001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1BXVlFrUVJLdUkycHZRcHRJLzZhRHRwREczdVQrK2xGUWVWTnI2aDlqT0t2?=
 =?utf-8?B?MWVYZVVVN0c4SG96WWphWlFzdXFVV0lOcmhxdUpEK3FCSWRjcFQzanFMcGky?=
 =?utf-8?B?bUdrWlpTQzQveXlTMVBNSEc4RmdlYVl5MkRqTkJ1MGRSK0M2RE1PeC9HV0wz?=
 =?utf-8?B?NTVucmlhcGh6blhIY2RodzFzZkdDbm9EKzhud2VpT0krR2YrT3F2VHJxeHUz?=
 =?utf-8?B?b1l0ODJDZEVjd0N4dk5QVVdwbFpxYlJyelVjWXNLYXV5NkJkenlWOEdQKzYy?=
 =?utf-8?B?ejUrak9VaHorc2padkViRnFGMmZzMm1uUjBMWmNreVNkY3puSWo1V1UwYTMr?=
 =?utf-8?B?MW1ITW45Y2hwa2tTU2xUdW9lZTVGSERiOGQwK2crQWRFYjEyWFJkRTFodlhC?=
 =?utf-8?B?VzJaK3p1ZjlIMVMyeE1mVURlSVFxRkJxU29uMUJGUFRabG84VDB2OWpvRDdJ?=
 =?utf-8?B?bVJEb2RYZHZFYkhEbmVhTWFGejN3NU1LV25GR2ZXVWpFVzlPcWZpZFNtSEFK?=
 =?utf-8?B?Ny9sN0k2MGFlYitIQjVXYTVEV3RkYlJEaWtSLzQrVEdnYWFIUmVHMW1seGxy?=
 =?utf-8?B?b05sYzZJRzFqUmgrdDJqUzg4eDRRZzcyMWJoTmlLbk5sTzFidFVWNnQ1K29E?=
 =?utf-8?B?NkY1ekNSeWZia25JREswYkdsdTAzVGMzZVZoaEUwVjA3bTc4RUlOZ1hZMm8x?=
 =?utf-8?B?d0pTZVhMWWxlbHNOcXNSeCtESit5SzQ2UStja3BKVWtFRVNtakcwVHhTZmUx?=
 =?utf-8?B?Wm8wTkQ0WE1kTjZTMnlMa3RVdklQaVVjcUhVZTRRTDU5T2hWTS9GeVlQTnBv?=
 =?utf-8?B?RStrc0JMWjdHUHpuWFNyZklvdGNKZDNJZkRjaldwWDZwek5ieXRLNFNScjdF?=
 =?utf-8?B?RnFKWFlmRmhWanNrQ2dMcmV3bTdENGtyVTh4ZXdBWDdrTDQrL3NxcnhJQnVZ?=
 =?utf-8?B?d3lyS0kzc0FtUzdaSjFJTzBERDk3dFBmK05xeVljeXFtdHBMd2hYcnoxVGxu?=
 =?utf-8?B?UzQ5T3cyRDFSWHBPNVBaamdGYXZzMXMwZ244eWxDWmY4VnYvamFxRjJ3VElw?=
 =?utf-8?B?dWVEUE1PdXE4clcyY1ZObjJYTzFMZGpCYzVsbzMvWlpucC9HUnRtSlFIaTlt?=
 =?utf-8?B?WFBFSUdXWEg2STFhZ3UwSllvWEx1bTkvTjVkcXdlbW5hN1p0NlVyaFlhSnhZ?=
 =?utf-8?B?a3RSWWdBYUFPUzI2V1FSczBtYlk1Y0lwemdIcVBnYUhYUlV2eFNCclRjdFhJ?=
 =?utf-8?B?RVB0d1FEa0VMTEF4akk0TUMweTcyMHJ3dTlmOGpVeW1iWFMrcnhlRmdmRjRN?=
 =?utf-8?B?MGRRVm5Vb2NXd1JlT1JUT0Q2ako2U004WW4rcDhIOHJFU3JNWkxsUDNjY3N2?=
 =?utf-8?B?RWJVdlJ0RmloSmZDdnhSbGh5UVlpU1pJU0djWHFWaGdiYkgwc3NIQlRGK2lK?=
 =?utf-8?B?elhZR2hpeE1zclRRaXAway9tV0c5M09VRThMQVp3cFhJUnpLUUhXaExBbyt4?=
 =?utf-8?B?eXg1UDZUdElaUU9wT0R2MWhvZEp2WldZZzAwQkQrS21kQzNDT2FIbHNvMWRz?=
 =?utf-8?B?WXZWdnFkM3BvclQ0UlBLeDhlb2o0dDhiK3lOZVh2dWd3d1NIcHdDUWJ1UXBy?=
 =?utf-8?B?a1BCbkZaL1lMSHRVbWNJeWNiZ04wMzhnUkN5UjFyd0U0ZzBsTW44cVVMYnJW?=
 =?utf-8?B?Rm5DeDlBdGNGSGMzYVRBKzFyV1VjTHlKTkxSYXYwUUpsQ2JLVFRPZS9aRm4w?=
 =?utf-8?B?UEZvTjRhNlRQYlFuMkNqMHpvQWJVKy9OaGdUODVRWnl0cHEzaGZJZUJUcjNh?=
 =?utf-8?B?cktEbmpNUFFOVlJtWUpCMXZRODNTdVBNdHNjekQvdjhkaWt0TmVrUlYyL3dF?=
 =?utf-8?B?SVUvenlWc2FTWmxqOVNrTnc3SUxaSkVQcDQ1akZGb0VYY2tEZEIwcXYyUmI4?=
 =?utf-8?B?Ni9MeGJxS2xGTkhJSlZkUSs3MDBueWxjNUIzUW9LK3ZoZkRieTJBekxKcDhE?=
 =?utf-8?B?emlUYUxQYnlHSXpRa1oxNU9kQVVINGdvY0ZZeHB1OTFYV1VONUo5RzhtVDN5?=
 =?utf-8?B?Mm0ra2EyTXhlT3dyMVpqeEMyc1RVYUxsdFpwM05PR09vUEN2Mm1mSTlhdGdY?=
 =?utf-8?B?ank2bFFHaC9rc21VbHU1S0ErWmNrRmxBV3FxOURkdTlFS2w4dlNxeG9vTE4v?=
 =?utf-8?B?ZGd5b2kzalpxcG5MUG53NHcwdEEyRThBRTJhKzhoYlNrdDJOWXAzL3pjRW5a?=
 =?utf-8?B?NHppeXo0WnpSeFk4Z1RRSy8ya2xnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE06311A45CD64489258B752DC80997A@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5833f36f-b0c0-4f07-bb9a-08d99aea6168
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2021 14:42:49.5595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +CWwgAnuAOZCeTpHM0XENRvxTB9wijTfI4XxUSGxK/S8c/YuxvWQH5c6x79jbXca5japv6wkXbLlNa+TtHGqKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB2964
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10151
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2110290085
X-Proofpoint-ORIG-GUID: IwmDiaX-C4yQMN55V6NUnP2uFlkzK0nS
X-Proofpoint-GUID: IwmDiaX-C4yQMN55V6NUnP2uFlkzK0nS
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "philmd@redhat.com" <philmd@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gT2N0IDI3LCAyMDIxLCBhdCAxMTo0MCBBTSwgU3RlZmFuIEhham5vY3ppIDxzdGVm
YW5oYUByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgT2N0IDExLCAyMDIxIGF0IDAx
OjMxOjA4QU0gLTA0MDAsIEphZ2FubmF0aGFuIFJhbWFuIHdyb3RlOg0KPj4gZGlmZiAtLWdpdCBh
L3FhcGkvcW9tLmpzb24gYi9xYXBpL3FvbS5qc29uDQo+PiBpbmRleCAwMjIyYmI0NTA2Li45N2Rl
NzljYzM2IDEwMDY0NA0KPj4gLS0tIGEvcWFwaS9xb20uanNvbg0KPj4gKysrIGIvcWFwaS9xb20u
anNvbg0KPj4gQEAgLTcwNSw2ICs3MDUsMjAgQEANCj4+IHsgJ3N0cnVjdCc6ICdSZW1vdGVPYmpl
Y3RQcm9wZXJ0aWVzJywNCj4+ICAgJ2RhdGEnOiB7ICdmZCc6ICdzdHInLCAnZGV2aWQnOiAnc3Ry
JyB9IH0NCj4+IA0KPj4gKyMjDQo+PiArIyBAVmZpb1VzZXJTZXJ2ZXJQcm9wZXJ0aWVzOg0KPj4g
KyMNCj4+ICsjIFByb3BlcnRpZXMgZm9yIHZmaW8tdXNlci1zZXJ2ZXIgb2JqZWN0cy4NCj4+ICsj
DQo+PiArIyBAc29ja2V0OiBzb2NrZXQgdG8gYmUgdXNlZCBieSB0aGUgbGlidmZpb3VzZXIgbGli
cmFyeQ0KPj4gKyMNCj4+ICsjIEBkZXZpY2U6IHRoZSBpZCBvZiB0aGUgZGV2aWNlIHRvIGJlIGVt
dWxhdGVkIGF0IHRoZSBzZXJ2ZXINCj4+ICsjDQo+PiArIyBTaW5jZTogNi4wDQo+IA0KPiA2LjIN
Cj4gDQo+PiArIyMNCj4+ICt7ICdzdHJ1Y3QnOiAnVmZpb1VzZXJTZXJ2ZXJQcm9wZXJ0aWVzJywN
Cj4+ICsgICdkYXRhJzogeyAnc29ja2V0JzogJ1NvY2tldEFkZHJlc3MnLCAnZGV2aWNlJzogJ3N0
cicgfSB9DQo+PiArDQo+PiAjIw0KPj4gIyBAUm5nUHJvcGVydGllczoNCj4+ICMNCj4+IEBAIC04
MzAsNyArODQ0LDggQEANCj4+ICAgICAndGxzLWNyZWRzLXBzaycsDQo+PiAgICAgJ3Rscy1jcmVk
cy14NTA5JywNCj4+ICAgICAndGxzLWNpcGhlci1zdWl0ZXMnLA0KPj4gLSAgICAneC1yZW1vdGUt
b2JqZWN0Jw0KPj4gKyAgICAneC1yZW1vdGUtb2JqZWN0JywNCj4+ICsgICAgJ3ZmaW8tdXNlci1z
ZXJ2ZXInDQo+IA0KPiBTaG91bGQgaXQgaGF2ZSB0aGUgZXhwZXJpbWVudGFsIHByZWZpeCAoJ3gt
Jykgb3IgaXMgdGhlIFFBUEkgaW50ZXJmYWNlDQo+IHN0YWJsZT8gSSB0aGluayBzb21lIHRoaW5n
cyB0byB0aGluayBhYm91dCBhcmUgd2hldGhlciBhIHNpbmdsZSBwcm9jZXNzDQo+IGNhbiBob3N0
IG11bHRpcGxlIGRldmljZSBzZXJ2ZXJzLCB3aGV0aGVyIGhvdHBsdWcgaXMgcG9zc2libGUsIGV0
Yy4gSWYNCj4gdGhlIGludGVyZmFjZSBpcyBzdGFibGUgdGhlbiBpdCBtdXN0IGJlIGFibGUgdG8g
YWNjb21vZGF0ZSBmdXR1cmUNCj4gZmVhdHVyZXMgKGF0IGxlYXN0IG9uZXMgd2UgY2FuIGFudGlj
aXBhdGUgcmlnaHQgbm93IDopKS4NCg0KV2UgZGlkIHRlc3Qgb3V0IGhvdHBsdWcgc3VwcG9ydC4N
Cg0KV2XigJlsbCBnZXQgYmFjayB0byB5b3Ugb24gdGhlIG11bHRpcGxlIGRldmljZSBzZXJ2ZXJz
IHNjZW5hcmlvLg0KDQo+IA0KPj4gICBdIH0NCj4+IA0KPj4gIyMNCj4+IEBAIC04ODcsNyArOTAy
LDggQEANCj4+ICAgICAgICd0bHMtY3JlZHMtcHNrJzogICAgICAgICAgICAgICdUbHNDcmVkc1Bz
a1Byb3BlcnRpZXMnLA0KPj4gICAgICAgJ3Rscy1jcmVkcy14NTA5JzogICAgICAgICAgICAgJ1Rs
c0NyZWRzWDUwOVByb3BlcnRpZXMnLA0KPj4gICAgICAgJ3Rscy1jaXBoZXItc3VpdGVzJzogICAg
ICAgICAgJ1Rsc0NyZWRzUHJvcGVydGllcycsDQo+PiAtICAgICAgJ3gtcmVtb3RlLW9iamVjdCc6
ICAgICAgICAgICAgJ1JlbW90ZU9iamVjdFByb3BlcnRpZXMnDQo+PiArICAgICAgJ3gtcmVtb3Rl
LW9iamVjdCc6ICAgICAgICAgICAgJ1JlbW90ZU9iamVjdFByb3BlcnRpZXMnLA0KPj4gKyAgICAg
ICd2ZmlvLXVzZXItc2VydmVyJzogICAgICAgICAgICdWZmlvVXNlclNlcnZlclByb3BlcnRpZXMn
DQo+PiAgIH0gfQ0KPj4gDQo+PiAjIw0KPj4gZGlmZiAtLWdpdCBhL2h3L3JlbW90ZS92ZmlvLXVz
ZXItb2JqLmMgYi9ody9yZW1vdGUvdmZpby11c2VyLW9iai5jDQo+PiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMC4uYzJhMzAwZjBmZg0KPj4gLS0tIC9kZXYvbnVsbA0K
Pj4gKysrIGIvaHcvcmVtb3RlL3ZmaW8tdXNlci1vYmouYw0KPj4gQEAgLTAsMCArMSwxNzMgQEAN
Cj4+ICsvKioNCj4+ICsgKiBRRU1VIHZmaW8tdXNlci1zZXJ2ZXIgc2VydmVyIG9iamVjdA0KPj4g
KyAqDQo+PiArICogQ29weXJpZ2h0IMKpIDIwMjEgT3JhY2xlIGFuZC9vciBpdHMgYWZmaWxpYXRl
cy4NCj4+ICsgKg0KPj4gKyAqIFRoaXMgd29yayBpcyBsaWNlbnNlZCB1bmRlciB0aGUgdGVybXMg
b2YgdGhlIEdOVSBHUEwtdjIsIHZlcnNpb24gMiBvciBsYXRlci4NCj4+ICsgKg0KPj4gKyAqIFNl
ZSB0aGUgQ09QWUlORyBmaWxlIGluIHRoZSB0b3AtbGV2ZWwgZGlyZWN0b3J5Lg0KPj4gKyAqDQo+
PiArICovDQo+PiArDQo+PiArLyoqDQo+PiArICogVXNhZ2U6IGFkZCBvcHRpb25zOg0KPj4gKyAq
ICAgICAtbWFjaGluZSB4LXJlbW90ZQ0KPj4gKyAqICAgICAtZGV2aWNlIDxQQ0ktZGV2aWNlPixp
ZD08cGNpLWRldi1pZD4NCj4+ICsgKiAgICAgLW9iamVjdCB2ZmlvLXVzZXItc2VydmVyLGlkPTxp
ZD4sdHlwZT11bml4LHBhdGg9PHNvY2tldC1wYXRoPiwNCj4gDQo+IEkgZXhwZWN0ZWQgc29ja2V0
LnR5cGU9IGFuZCBzb2NrZXQucGF0aD0gYmFzZWQgb24gdGhlIFFBUEkgc2NoZW1hLiBJcw0KPiB0
aGlzIGNvbW1hbmQtbGluZSBleGFtcGxlIGNvcnJlY3Q/DQoNCldoZW4gSSB0cmllZCB0aGUg4oCc
c29ja2V0LnBhdGjigJ0gYXBwcm9hY2gsIFFFTVUgd2FzIG5vdCBhYmxlIHRvIHBhcnNlIHRoZQ0K
YXJndW1lbnRzLiBTbyBJIGhhZCB0byBicmVhayBpdCBkb3duIHRvIGEgc2VyaWVzIG9mIGluZGl2
aWR1YWwgbWVtYmVycy4NCg0KSWYg4oCcc29ja2V0LnBhdGjigJ0gaXMgdGhlIGV4cGVjdGVkIHdh
eSwgSeKAmWxsIHNlZSB3aHkgdGhlIHBhcnNlciBpcyBub3Qgd29ya2luZw0KYXMgZXhwZWN0ZWQu
IA0KDQo+IA0KPj4gKyAqICAgICAgICAgICAgIGRldmljZT08cGNpLWRldi1pZD4NCj4+ICsgKg0K
Pj4gKyAqIE5vdGUgdGhhdCB2ZmlvLXVzZXItc2VydmVyIG9iamVjdCBtdXN0IGJlIHVzZWQgd2l0
aCB4LXJlbW90ZSBtYWNoaW5lIG9ubHkuDQo+PiArICogVGhpcyBzZXJ2ZXIgY291bGQgb25seSBz
dXBwb3J0IFBDSSBkZXZpY2VzIGZvciBub3cuDQo+PiArICoNCj4+ICsgKiB0eXBlIC0gU29ja2V0
QWRkcmVzcyB0eXBlIC0gcHJlc2VudGx5ICJ1bml4IiBhbG9uZSBpcyBzdXBwb3J0ZWQuIFJlcXVp
cmVkDQo+PiArICogICAgICAgIG9wdGlvbg0KPj4gKyAqDQo+PiArICogcGF0aCAtIG5hbWVkIHVu
aXggc29ja2V0LCBpdCB3aWxsIGJlIGNyZWF0ZWQgYnkgdGhlIHNlcnZlci4gSXQgaXMNCj4+ICsg
KiAgICAgICAgYSByZXF1aXJlZCBvcHRpb24NCj4+ICsgKg0KPj4gKyAqIGRldmljZSAtIGlkIG9m
IGEgZGV2aWNlIG9uIHRoZSBzZXJ2ZXIsIGEgcmVxdWlyZWQgb3B0aW9uLiBQQ0kgZGV2aWNlcw0K
Pj4gKyAqICAgICAgICAgIGFsb25lIGFyZSBzdXBwb3J0ZWQgcHJlc2VudGx5Lg0KPj4gKyAqLw0K
Pj4gKw0KPj4gKyNpbmNsdWRlICJxZW11L29zZGVwLmgiDQo+PiArI2luY2x1ZGUgInFlbXUtY29t
bW9uLmgiDQo+PiArDQo+PiArI2luY2x1ZGUgInFvbS9vYmplY3QuaCINCj4+ICsjaW5jbHVkZSAi
cW9tL29iamVjdF9pbnRlcmZhY2VzLmgiDQo+PiArI2luY2x1ZGUgInFlbXUvZXJyb3ItcmVwb3J0
LmgiDQo+PiArI2luY2x1ZGUgInRyYWNlLmgiDQo+PiArI2luY2x1ZGUgInN5c2VtdS9ydW5zdGF0
ZS5oIg0KPj4gKyNpbmNsdWRlICJody9ib2FyZHMuaCINCj4+ICsjaW5jbHVkZSAiaHcvcmVtb3Rl
L21hY2hpbmUuaCINCj4+ICsjaW5jbHVkZSAicWFwaS9lcnJvci5oIg0KPj4gKyNpbmNsdWRlICJx
YXBpL3FhcGktdmlzaXQtc29ja2V0cy5oIg0KPj4gKw0KPj4gKyNkZWZpbmUgVFlQRV9WRlVfT0JK
RUNUICJ2ZmlvLXVzZXItc2VydmVyIg0KPj4gK09CSkVDVF9ERUNMQVJFX1RZUEUoVmZ1T2JqZWN0
LCBWZnVPYmplY3RDbGFzcywgVkZVX09CSkVDVCkNCj4+ICsNCj4+ICtzdHJ1Y3QgVmZ1T2JqZWN0
Q2xhc3Mgew0KPj4gKyAgICBPYmplY3RDbGFzcyBwYXJlbnRfY2xhc3M7DQo+PiArDQo+PiArICAg
IHVuc2lnbmVkIGludCBucl9kZXZzOw0KPj4gKw0KPj4gKyAgICAvKiBNYXhpbXVtIG51bWJlciBv
ZiBkZXZpY2VzIHRoZSBzZXJ2ZXIgY291bGQgc3VwcG9ydCAqLw0KPj4gKyAgICB1bnNpZ25lZCBp
bnQgbWF4X2RldnM7DQo+PiArfTsNCj4+ICsNCj4+ICtzdHJ1Y3QgVmZ1T2JqZWN0IHsNCj4+ICsg
ICAgLyogcHJpdmF0ZSAqLw0KPj4gKyAgICBPYmplY3QgcGFyZW50Ow0KPj4gKw0KPj4gKyAgICBT
b2NrZXRBZGRyZXNzICpzb2NrZXQ7DQo+PiArDQo+PiArICAgIGNoYXIgKmRldmljZTsNCj4+ICt9
Ow0KPj4gKw0KPj4gK3N0YXRpYyB2b2lkIHZmdV9vYmplY3Rfc2V0X3NvY2tldChPYmplY3QgKm9i
aiwgVmlzaXRvciAqdiwgY29uc3QgY2hhciAqbmFtZSwNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdm9pZCAqb3BhcXVlLCBFcnJvciAqKmVycnApDQo+PiArew0KPj4gKyAg
ICBWZnVPYmplY3QgKm8gPSBWRlVfT0JKRUNUKG9iaik7DQo+PiArDQo+PiArICAgIGdfZnJlZShv
LT5zb2NrZXQpOw0KPiANCj4gcWFwaV9mcmVlX1NvY2tldEFkZHJlc3Moby0+c29ja2V0KT8NCg0K
T0ssIHdpbGwgdXNlIHRoYXQuDQoNCkRpZG7igJl0IGtub3cgdGhlIHZpc2l0b3JzIGFsc28gZGVm
aW5lIGEgZnVuY3Rpb24gZm9yIGZyZWXigJlpbmcuIFRoYW5rIHlvdSENCg0KPiANCj4+ICsNCj4+
ICsgICAgby0+c29ja2V0ID0gTlVMTDsNCj4+ICsNCj4+ICsgICAgdmlzaXRfdHlwZV9Tb2NrZXRB
ZGRyZXNzKHYsIG5hbWUsICZvLT5zb2NrZXQsIGVycnApOw0KPj4gKw0KPj4gKyAgICBpZiAoby0+
c29ja2V0LT50eXBlICE9IFNPQ0tFVF9BRERSRVNTX1RZUEVfVU5JWCkgew0KPj4gKyAgICAgICAg
ZXJyb3Jfc2V0ZygmZXJyb3JfYWJvcnQsICJ2ZnU6IFVuc3VwcG9ydGVkIHNvY2tldCB0eXBlIC0g
JXMiLA0KPj4gKyAgICAgICAgICAgICAgICAgICBvLT5zb2NrZXQtPnUucV91bml4LnBhdGgpOw0K
PiANCj4gby0+c29ja2V0IG11c3QgYmUgZnJlZWQgYW5kIHNldCBpdCB0byBOVUxMIGFnYWluLCBv
dGhlcndpc2Ugc2V0dGluZyB0aGUNCj4gcHJvcGVydHkgYXBwZWFycyB0byBmYWlsIGJ1dCB0aGUg
U29ja2V0QWRkcmVzcyBhY3R1YWxseSByZXRhaW5zIHRoZQ0KPiBpbnZhbGlkIHZhbHVlLg0KDQpP
SywgZ290IGl0Lg0KDQo+IA0KPj4gKyAgICAgICAgcmV0dXJuOw0KPj4gKyAgICB9DQo+PiArDQo+
PiArICAgIHRyYWNlX3ZmdV9wcm9wKCJzb2NrZXQiLCBvLT5zb2NrZXQtPnUucV91bml4LnBhdGgp
Ow0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCB2ZnVfb2JqZWN0X3NldF9kZXZpY2UoT2Jq
ZWN0ICpvYmosIGNvbnN0IGNoYXIgKnN0ciwgRXJyb3IgKiplcnJwKQ0KPj4gK3sNCj4+ICsgICAg
VmZ1T2JqZWN0ICpvID0gVkZVX09CSkVDVChvYmopOw0KPj4gKw0KPj4gKyAgICBnX2ZyZWUoby0+
ZGV2aWNlKTsNCj4+ICsNCj4+ICsgICAgby0+ZGV2aWNlID0gZ19zdHJkdXAoc3RyKTsNCj4+ICsN
Cj4+ICsgICAgdHJhY2VfdmZ1X3Byb3AoImRldmljZSIsIHN0cik7DQo+PiArfQ0KPj4gKw0KPj4g
K3N0YXRpYyB2b2lkIHZmdV9vYmplY3RfaW5pdChPYmplY3QgKm9iaikNCj4+ICt7DQo+PiArICAg
IFZmdU9iamVjdENsYXNzICprID0gVkZVX09CSkVDVF9HRVRfQ0xBU1Mob2JqKTsNCj4+ICsNCj4+
ICsgICAgaWYgKCFvYmplY3RfZHluYW1pY19jYXN0KE9CSkVDVChjdXJyZW50X21hY2hpbmUpLCBU
WVBFX1JFTU9URV9NQUNISU5FKSkgew0KPj4gKyAgICAgICAgZXJyb3Jfc2V0ZygmZXJyb3JfYWJv
cnQsICJ2ZnU6ICVzIG9ubHkgY29tcGF0aWJsZSB3aXRoICVzIG1hY2hpbmUiLA0KPj4gKyAgICAg
ICAgICAgICAgICAgICBUWVBFX1ZGVV9PQkpFQ1QsIFRZUEVfUkVNT1RFX01BQ0hJTkUpOw0KPj4g
KyAgICAgICAgcmV0dXJuOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIGlmIChrLT5ucl9kZXZz
ID49IGstPm1heF9kZXZzKSB7DQo+PiArICAgICAgICBlcnJvcl9zZXRnKCZlcnJvcl9hYm9ydCwN
Cj4+ICsgICAgICAgICAgICAgICAgICAgIlJlYWNoZWQgbWF4aW11bSBudW1iZXIgb2YgdmZpby11
c2VyLXNlcnZlciBkZXZpY2VzOiAldSIsDQo+PiArICAgICAgICAgICAgICAgICAgIGstPm1heF9k
ZXZzKTsNCj4+ICsgICAgICAgIHJldHVybjsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBrLT5u
cl9kZXZzKys7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyB2b2lkIHZmdV9vYmplY3RfZmluYWxp
emUoT2JqZWN0ICpvYmopDQo+PiArew0KPj4gKyAgICBWZnVPYmplY3RDbGFzcyAqayA9IFZGVV9P
QkpFQ1RfR0VUX0NMQVNTKG9iaik7DQo+PiArICAgIFZmdU9iamVjdCAqbyA9IFZGVV9PQkpFQ1Qo
b2JqKTsNCj4+ICsNCj4+ICsgICAgay0+bnJfZGV2cy0tOw0KPj4gKw0KPj4gKyAgICBnX2ZyZWUo
by0+c29ja2V0KTsNCj4gDQo+IHFhcGlfZnJlZV9Tb2NrZXRBZGRyZXNzKG8tPnNvY2tldCk/DQo+
IA0KPj4gKw0KPj4gKyAgICBnX2ZyZWUoby0+ZGV2aWNlKTsNCj4+ICsNCj4+ICsgICAgaWYgKGst
Pm5yX2RldnMgPT0gMCkgew0KPj4gKyAgICAgICAgcWVtdV9zeXN0ZW1fc2h1dGRvd25fcmVxdWVz
dChTSFVURE9XTl9DQVVTRV9HVUVTVF9TSFVURE9XTik7DQo+PiArICAgIH0NCj4gDQo+IFRoaXMg
d29uJ3Qgd29yayBmb3IgYWxsIHVzZSBjYXNlcy4gVGhlIHVzZXIgbWF5IHdpc2ggdG8gY3JlYXRl
L2RlbGV0ZQ0KPiB2aG9zdC11c2VyIHNlcnZlcnMgYXQgcnVudGltZSB3aXRob3V0IHRlcm1pbmF0
aW5nIHRoZSBwcm9jZXNzIHdoZW4gdGhlcmUNCj4gYXJlIG5vbmUgbGVmdC4gQW4gYm9vbGVhbiBv
cHRpb24gY2FuIGJlIGFkZGVkIGluIHRoZSBmdXR1cmUgdG8gY29udHJvbA0KPiB0aGlzIGJlaGF2
aW9yLCBzbyBpdCdzIG9rYXkgdG8gbGVhdmUgdGhpcyBhcyBpcy4NCg0KVGhhbmsgeW91LCB3ZeKA
mWxsIG1ha2UgYSBub3RlIG9mIHRoaXMuIEnigJlsbCBhZGQgYSBUT0RPIGNvbW1lbnQgaGVyZSB0
byBlbnN1cmUgd2UNCmRvbuKAmXQgbG9zZSB0aGlzIHRob3VnaHQuDQoNCi0tDQpKYWc=

