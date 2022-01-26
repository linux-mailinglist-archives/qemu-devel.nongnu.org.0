Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9D949CDC0
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 16:17:34 +0100 (CET)
Received: from localhost ([::1]:48738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCk3A-0005LT-Uz
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 10:17:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nCjyt-0003Mj-Kt
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 10:13:07 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:24534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nCjyr-0008AB-05
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 10:13:07 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20QEM16d020073; 
 Wed, 26 Jan 2022 15:12:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=sSFmUNFGl7bvI4m5nFs86sHU3yJNJIpgyUKC17NH65A=;
 b=ivdihTH5OFrK5y1tS2B58UUOFRBiIDwDYy9uSPhteFuCKyCSuZE5vbzbMom8TI3Lt4kV
 lfHY8A1QtkcddO4MaunDF3vTvx9nHBVA25UDZdDPJCOuOoShUob5Cu0KwbbXVJRVZnlX
 lezvLNce3nomsUUs6jFyqWrBop8grBngiPSUeHJhvu2FLbd8DNWVLbzABdgO5eusHka7
 Czndcyyg+19uNMuUwb3AW43ylWpmxswE6M0dqkXa9cs0mJ5hyqRmtCvYWQN9h/DHB1+S
 A+9+t2kGeVc/RCY1CpBnz0kCEMV0dLdJAljpDvjA8T7Lvj3MBE8ZknF2hQeCxt/MzTeY WA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsy7axf47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 15:12:49 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20QFAT9N114968;
 Wed, 26 Jan 2022 15:12:48 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by userp3020.oracle.com with ESMTP id 3drbcr9ysk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 15:12:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zs46bl3uWwIL3++jKfk0mcJQj/R1kFGybqnhCbDdhlCZtEET1TIStdNaaE9jGTTBpuOAF2RDa/pRomwO+XlMI1VHuD/FTsoyMa/R4eBrNhpxquG2m2DoAltiGxhmOvPD9QX4wrOpyOigGW+N/XlcrGQw4/qdepNLzUVk0MtSGLXAjpuFXpTckUB0BYRPF3cz1vSindIv/q9uvFbfNs3Vg2767z0GJ9nndD2jP7EgKKCHTG4JyKBouO4HfpbX8ubGbyAiEglN1kgcVjXA0qy72KCSNOlPNEwSij3l0ZCT8+MWGTc5ve0dJNuF8d/1q0AVydcl/ohcq47HtKEr/DRiWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSFmUNFGl7bvI4m5nFs86sHU3yJNJIpgyUKC17NH65A=;
 b=Njtl90Exikzc3HHr2M16W5rUr/lWOYEZ4VtGtMmq+qxjdDYRRPYKJSSj/+PKk4UacH05tEOKDrmhkwD9p+ldIy3S75sNiCwn+72zK9LeTkVSMQuIrXo868IYETA/D5zeg9/+hjQNXET97Vi3nXd4rJPA2LYt37bmfG0rOIOWp9UFT29nxBkzeyYBsW8PFrOVy06az1rzpqaSWsrt6Z3RfFbDnuOpbP+5UDXV3reRGjagL9E1lyUM/1al7IFDCgCFl0i1dmaKGt0+VG/FCa9gFtrIgJCJRLOiuSJ7JMw4vMDLzJQR505qsVg9onGvX7LcOR7Otv+e/neQpZOmZh8AVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSFmUNFGl7bvI4m5nFs86sHU3yJNJIpgyUKC17NH65A=;
 b=EmivvmyKWqjSx+DcfRswPlVo0Tp56O39kV1MZalltdhHMRlVDZbQdcr5OdEujy9t52HEfh4lEQY3NItojY4naNCogUNFHop69nHdGddKVqLzSRsvTSdEg0Bh43zjVLqNZWb64d0ZTNpF56wV6gmZp0Il8DpaAOxEsxESqmFcj34=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by CY4PR10MB1656.namprd10.prod.outlook.com (2603:10b6:910:8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Wed, 26 Jan
 2022 15:12:46 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4909.019; Wed, 26 Jan 2022
 15:12:45 +0000
From: Jag Raman <jag.raman@oracle.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 18/18] vfio-user: avocado tests for vfio-user
Thread-Topic: [PATCH v5 18/18] vfio-user: avocado tests for vfio-user
Thread-Index: AQHYDX2TLm/KmYDO/ECpkUQiVa2pPqx0vnGAgAC06gA=
Date: Wed, 26 Jan 2022 15:12:45 +0000
Message-ID: <6B599408-9DE0-4D81-A018-47320992687B@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <f7280fecf94e4d77498af62b11f26a2a5043e5b4.1642626515.git.jag.raman@oracle.com>
 <4308fbe3-042b-6311-5cc7-8c51710aef86@amsat.org>
In-Reply-To: <4308fbe3-042b-6311-5cc7-8c51710aef86@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 06a1cb14-ce2e-45d4-0d7d-08d9e0de4ed6
x-ms-traffictypediagnostic: CY4PR10MB1656:EE_
x-microsoft-antispam-prvs: <CY4PR10MB1656297B5B814EE5197FE5D190209@CY4PR10MB1656.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dXVDYsp7mYhNalzgK5k8H+xqVpE0gmvNeDlBa7OXVowZgd0v91D4fR9k+NdZUPJYxtMnhY3GXlHZ1tf4zit3qC8poxtp8KOL8qxxdBc5IbH2ydbmXSaMcQ/Fw/2/ni66sfvDvv825pq5KxuHqfrgX8xAZT0mrSfQfO84JWvz037Ashtdi+vW0xRZFwg5WbR2/oeGWgsKX8NDNCQk3Fb0p0/XxzX75BMJdI1lHZ3HcgAclVqU797WPe7UhHUe5kD4r95TY1x82HSZlp7UlvQgMqhgeFV3MGRAsBS2zU/EbeeXo0zFaEtN61qrcq3ZcHB06UoXpNZRHUBWxnOik0OCnV7Eo5jWtDMdLbEx5+JwphILaDRUmkRzH6Wl8k2RpyW70TEAsdILoAslftttVcPmOkCal1McI2cMa/qHuwz9xsUcjpur7nTy6UjvK83LBC6/Lt1JGGYKRV9XJN2nvmzOkZWgmC2km2ri4+8ly17W2xNkZiPmVGE6D1/qFnuTUcQOKFZylOAzWukNhWALw2IjboqZWQ6mx/xw2+krTaZwqO5N9p67+DK9+AvIcCho9aJqNOuwVrjV771RsIwANR192tOnaJtl8n2xzIbvbWR8ZKwz9LuYmav0G56RXFsJk9BhNaqsvJ/BBKUqtI3xXWlhAvqOKJdBLsrjg9oQ1yQOIR7WJmP9mwASDTaSpUYfqwgdvUu4zzyzMZ3R9ss7YFMQwXalHs1dQ8JSy/iUM00KRMU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(107886003)(8676002)(508600001)(33656002)(6486002)(66946007)(54906003)(186003)(5660300002)(122000001)(91956017)(8936002)(44832011)(38100700002)(76116006)(2616005)(66556008)(66446008)(66476007)(36756003)(2906002)(64756008)(6512007)(4326008)(53546011)(6506007)(6916009)(7416002)(38070700005)(86362001)(316002)(71200400001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3hEdzltUWF4S3VGVlk2UXRLejlmWGV3RzhRNWI5MWdIRjNTZWIyOEJoMUpX?=
 =?utf-8?B?SzdkaHY0K3h4TzQ5TTVGcW10d1NkLzFtRmd4RzEyaEwwcU1SdGZBTUpDZnVi?=
 =?utf-8?B?c2E1UGVyZk0zVFZxbDh5VmpvQ2xydXJHamlYUnBSNjNPdUZ4Y21JZ1g0U1JN?=
 =?utf-8?B?cXRlTUNTY2RzWXM5anFkaGJ3V016WkY0YXh3ajZNRjlWU3Z5anpuNDk4QW5Y?=
 =?utf-8?B?KzgvTk1paFBUK3RZRmphM1VXTTFqQUU3YTI4Yk4zRUFVcktCVXhXeng1cW42?=
 =?utf-8?B?MVYzSnpDc1JraUE5dTluTjFNYlFISGVWOUpnWVNHSG9uNnlRZUNxR3RJdnh3?=
 =?utf-8?B?NnYrSXk2ajNuQWl0UGlndlZrZjBOTzNVWEpjemtPemZqUFBNMjJuVFFvVkN3?=
 =?utf-8?B?WTQrY1l2Y0ZEQTJ1TFNkaUwrNGp1Zm1oNGNtbis3NTJEUytPUHVaNlBJL0Nu?=
 =?utf-8?B?SWo5c3RoaXlxUU5rWWI0eXJTNWVqbmw2K2RzelplQ29rTVBlL2JhZW9QMFhk?=
 =?utf-8?B?YjN3MFByR09QbHIycjdEQ0dMTDlubkhaWUZiZzBMZ3NWOWZNQ3RlMW4wSy8r?=
 =?utf-8?B?WTdNTnEwcnM1TWxTVk0xR3RoODliMEpDZWI4MHRFR1N0N1hyenJIMXVuQ2VH?=
 =?utf-8?B?Z0l4eWNJR1REVWtrT2ZXUTRaVWsydXNMVjZ1TkZEZUMzaTBCQlRjbFN6UWY2?=
 =?utf-8?B?WC9XQ3d5LzhGZU1TdGkwdmdpbXFPdlRMdHZsUlUzRnhDY1hCU1lhNk5HQm9Q?=
 =?utf-8?B?U0dUSWNHWTR1ZTlhOGxycWQ4Q2lZZHNDS2kvZnpoZDdEdUs1eVN0YkQyejlW?=
 =?utf-8?B?T0MrN1pERGZvRGVUUUlRNVRFWTZ4Rlh2WFJtK3pDYXIzWW5DTmpzM1JKZ3kv?=
 =?utf-8?B?T0xlaC9vL3NZSFYxTVZCZkQwOGxQOTJzMTZ4MU51UmZtUkVqMUV4aVJId1Iw?=
 =?utf-8?B?RWhOTWJuNFJiMkNpaVRWc2t4d1VMZnpCdDlQb2d4emg1cFNnc0s1Ly9rb1p4?=
 =?utf-8?B?U1prZ1ZPMkMrd2o4TlV2STd5cDVEeDdNSDJid3dqQjdYL0tHeG9tT1NqM3RN?=
 =?utf-8?B?eWtlNFZ6aEZpUkk1RHZLWE9CK0QzQ0RYd0hObjBlSnlVYmVrRlBVa2FVRHBK?=
 =?utf-8?B?eE5zcHpFQis5NGJOMGlQRWFZMHhSUlN3Z2tmaldMQzZ5MHRlNFJ0SkR3SlRy?=
 =?utf-8?B?UW1Ga1dOUTFuTnpUanV1eGU4eEtSMEluekRYSmpMSldPSVpCLzN0NEtIQm9h?=
 =?utf-8?B?ZHlRRTAyRVNCUElRbXAxMzMxS05iMzNGLzJMQXJxQlJYUG43cUptL3V3NVlI?=
 =?utf-8?B?ajV6MDlHcm5vQ3NXdVhDZEh6WXNRUnpuTVJGM0Q1eU5KL1NYZU1SbHduLzhG?=
 =?utf-8?B?ekRlSGRmSVhWamFQR0g3MXFLeFFJNVVDWUpycDNnbGxkalY0Z3F1SHRHOHV1?=
 =?utf-8?B?K2JJVnRTNkR2N1VSUm1LMWVwSllQQ0xBZ0Y1NnFCb1hRRGpWL1pYclcwRmN3?=
 =?utf-8?B?UWpBSlRtMStPOUhyTDB6c0hlYm5ZMVFoWlhhcHN1bmpKQUM5aXB2WU5TUmZM?=
 =?utf-8?B?WEVZRWFrblRZbWtkaC94SVpXVlBtcE15clN6cjRieURXN3BJd2JaVGZUS0tU?=
 =?utf-8?B?K0VyYWUrTWhMV2U5Q0dNKzZwTHM0Qmdra29EbVhBdTJWV08xUEdVdGdRemJj?=
 =?utf-8?B?ZnF1K3FvSkM0b1lNVjRkSWt3eUFPWWdhY2x2QnVjN3VPR0tpR2lsOUNqaUor?=
 =?utf-8?B?S2c3bnlGbUJKOVVGSVFPOXNJY3dHejhVbUMweGoxbm16UW5OcmFpVjZQZlVT?=
 =?utf-8?B?OHFYRjl0aXZVTHc5T3o0OTIwOWUxZXcwNVFmWDlSQkMyQjR1aXFYR2FyeS8y?=
 =?utf-8?B?aXBSN1lwY1Z3ckdUd0FxNS9LdUdzOFBtaEQ3RkI1QVFrdWFPWEs0dEYwVlZh?=
 =?utf-8?B?SEs0Wk1VRkh5UUlBUm5YN3Q4MWs5RXdheXd3Tm9WRjQrUEpVRUVmUGZ0TGF5?=
 =?utf-8?B?STBrVTNTTitWMzJvUmhCSnpYalNIRVcvZUx2QTV0anpNNVdPM3dtK20yaEhK?=
 =?utf-8?B?RGNSd3lmR0hyQUFUeWluUUxSYStISFNRbEwwU0lQeFp4SVZ5d2pOZVhzTkIx?=
 =?utf-8?B?SnlqU3AvbGU1WlhkdmxxT3NqSUMvNTNWWkFpYjR6VDFOYkpsNXo4eFkxT2J4?=
 =?utf-8?B?ckZUSXRMbVhqYVYwNVh0V0svMlBrVzUyRVZnZFFnMk45YVNRdGl5SzRyZHUr?=
 =?utf-8?B?KzdEdmNoVEh5UEFNL2FEaFVCMnpnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <00E3C92DEDE32E41BFFF0542E301E072@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06a1cb14-ce2e-45d4-0d7d-08d9e0de4ed6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 15:12:45.8398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Er3zd++cfaNloLOkaejyXGmlb6StBgl9tFXjhxToruj0BLtq5b497r20bQMo4JaekshHIb/QMekJjvpR0cRqkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1656
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10238
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 malwarescore=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260094
X-Proofpoint-GUID: R9o_OkZ9B83fBgTiwzhwyCgVqBpo0yHL
X-Proofpoint-ORIG-GUID: R9o_OkZ9B83fBgTiwzhwyCgVqBpo0yHL
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
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gSmFuIDI1LCAyMDIyLCBhdCAxMToyNSBQTSwgUGhpbGlwcGUgTWF0aGlldS1EYXVk
w6kgPGY0YnVnQGFtc2F0Lm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBKYWdhbm5hdGhhbiwNCj4gDQo+
IE9uIDE5LzEvMjIgMjI6NDIsIEphZ2FubmF0aGFuIFJhbWFuIHdyb3RlOg0KPj4gQXZvY2FkbyB0
ZXN0cyBmb3IgbGlidmZpby11c2VyIGluIFFFTVUgLSB0ZXN0cyBzdGFydHVwLA0KPj4gaG90cGx1
ZyBhbmQgbWlncmF0aW9uIG9mIHRoZSBzZXJ2ZXIgb2JqZWN0DQo+PiBTaWduZWQtb2ZmLWJ5OiBF
bGVuYSBVZmltdHNldmEgPGVsZW5hLnVmaW10c2V2YUBvcmFjbGUuY29tPg0KPj4gU2lnbmVkLW9m
Zi1ieTogSm9obiBHIEpvaG5zb24gPGpvaG4uZy5qb2huc29uQG9yYWNsZS5jb20+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBKYWdhbm5hdGhhbiBSYW1hbiA8amFnLnJhbWFuQG9yYWNsZS5jb20+DQo+PiAt
LS0NCj4+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICB8ICAgMSArDQo+PiAgdGVzdHMvYXZv
Y2Fkby92ZmlvLXVzZXIucHkgfCAyMjUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKw0KPj4gIDIgZmlsZXMgY2hhbmdlZCwgMjI2IGluc2VydGlvbnMoKykNCj4+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgdGVzdHMvYXZvY2Fkby92ZmlvLXVzZXIucHkNCj4gDQo+PiArY2xhc3MgVmZp
b1VzZXIoUWVtdVN5c3RlbVRlc3QpOg0KPj4gKyAgICAiIiINCj4+ICsgICAgOmF2b2NhZG86IHRh
Z3M9dmZpb3VzZXINCj4+ICsgICAgIiIiDQo+PiArICAgIEtFUk5FTF9DT01NT05fQ09NTUFORF9M
SU5FID0gJ3ByaW50ay50aW1lPTAgJw0KPj4gKyAgICB0aW1lb3V0ID0gMjANCj4+ICsNCj4+ICsg
ICAgQHN0YXRpY21ldGhvZA0KPj4gKyAgICBkZWYgbWlncmF0aW9uX2ZpbmlzaGVkKHZtKToNCj4+
ICsgICAgICAgIHJlcyA9IHZtLmNvbW1hbmQoJ3F1ZXJ5LW1pZ3JhdGUnKQ0KPj4gKyAgICAgICAg
aWYgJ3N0YXR1cycgaW4gcmVzOg0KPj4gKyAgICAgICAgICAgIHJldHVybiByZXNbJ3N0YXR1cydd
IGluICgnY29tcGxldGVkJywgJ2ZhaWxlZCcpDQo+IA0KPiBEbyB3ZSBuZWVkIHRvIGNoZWNrIGZv
ciBmYWlsZWQgbWlncmF0aW9uIGluIGRvX3Rlc3RfbWlncmF0ZSgpPw0KDQpPSywgd2lsbCBkby4N
Cg0KPiANCj4+ICsgICAgICAgIGVsc2U6DQo+PiArICAgICAgICAgICAgcmV0dXJuIEZhbHNlDQo+
IA0KPiBbLi4uXQ0KPiANCj4+ICsgICAgZGVmIGxhdW5jaF9zZXJ2ZXJfaG90cGx1ZyhzZWxmLCBz
b2NrZXQpOg0KPj4gKyAgICAgICAgc2VydmVyX3ZtID0gc2VsZi5nZXRfdm0oKQ0KPj4gKyAgICAg
ICAgc2VydmVyX3ZtLmFkZF9hcmdzKCctbWFjaGluZScsICd4LXJlbW90ZScpDQo+PiArICAgICAg
ICBzZXJ2ZXJfdm0uYWRkX2FyZ3MoJy1ub2RlZmF1bHRzJykNCj4+ICsgICAgICAgIHNlcnZlcl92
bS5hZGRfYXJncygnLWRldmljZScsICdsc2k1M2M4OTVhLGlkPWxzaTEnKQ0KPj4gKyAgICAgICAg
c2VydmVyX3ZtLmxhdW5jaCgpDQo+PiArICAgICAgICBzZXJ2ZXJfdm0uY29tbWFuZCgnaHVtYW4t
bW9uaXRvci1jb21tYW5kJywNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbW1hbmRf
bGluZT0nb2JqZWN0X2FkZCB4LXZmaW8tdXNlci1zZXJ2ZXIsJw0KPiANCj4gV2h5IG5vdCB1c2Ug
cW1wKCdvYmplY3QtYWRkJywgLi4uKSBkaXJlY3RseT8NCg0KT0ssIHdpbGwgdXNlIHFtcCBkaXJl
Y3RseS4NCg0KVGhhbmsgeW91IQ0KLS0NCkphZw0KDQo+IA0KPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICdpZD12Zmlvb2JqLHNvY2tldC50eXBlPXVuaXgsJw0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICdzb2NrZXQucGF0aD0nK3Nv
Y2tldCsnLGRldmljZT1sc2kxJykNCj4+ICsgICAgICAgIHJldHVybiBzZXJ2ZXJfdm0NCj4gDQo+
IE90aGVyd2lzZSBMR1RNLg0KDQo=

