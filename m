Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 284764C71AC
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 17:25:26 +0100 (CET)
Received: from localhost ([::1]:59088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOipx-0001fi-8p
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 11:25:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nOioF-0000CK-Cb
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 11:23:39 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:31266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nOioC-0007nG-Fl
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 11:23:38 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21SFdPp4008207; 
 Mon, 28 Feb 2022 16:23:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=voSn4uKeyHYEGIYPQIZVidONJnD1QQtFBZtC90TWl+U=;
 b=KAvK8gWolNXxIFzxnStW8/G5GUd6v+VCCUCIQrwtZjxf1lwCOqfLgRVU7CHK2BJa1QxI
 OLAfWEdWkpV2hfXtrUAH8bklB0ZdpgIKp4nMVRYhCT8bFcCGeXPyXbduJ9oRRXGHZC7m
 X2Ji8aMTJ7ySBD84LyVPdOYWG05PibOpA1HRvyRDyhTzAXh6H6EnTLkEsyIk3R0HXVSa
 I7M6B4fp1F9MoP/joj0IZ+JthsL/qZCXJU7GO0xOrNPYY9On/8e/BKprxo1pYha6Is3m
 qAXTyUm+uTK7NbsvCFr7CbFANVPfRicmQbS9C3sH3JoR9C+WUqOnBTeBnm9SQg7DW81D +w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3efb02mu9n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 16:23:22 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21SG6k8R160628;
 Mon, 28 Feb 2022 16:23:21 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by aserp3020.oracle.com with ESMTP id 3efc136wb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 16:23:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KpgpCXs8NsQL+e/uDiz2uQv+U8nfnUNV2Kt+pH0VP1xzjFTvS5C+lUMre3UWHhyAUvGgp4Elk5n4F/QVY1i4e5ybm//xYBL0b+mKnIjmNwKDN896WSLJB5wXQQzeOnRkibciTCGHHLviOuS6DvidlqrKPyQusKTjTbcorCAhN9nwXacbpmAJe13YN53HbWbuqbn+FelDztvHXmQiQepHUY+NNNFZOCbBf3DO10Ps1WIpskisKqggvTEE0/6UBguop9sKZhzsma0//ZJQj5jwL5/yXBOzJWsHROmCWqkF3WhVtW8kF0KZIst61Sr2215q7C3gna/TUNMGd/3vgyalCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voSn4uKeyHYEGIYPQIZVidONJnD1QQtFBZtC90TWl+U=;
 b=goFmkh1+28rPKwvi4JcgSpczKdJ16B4gd64pYvsQbHf1g9gC3yGpTWkxFN+KZJM08MDH0zdsbIu/mqjyXey3YUG0XKPi8r8e2JazQJzW4oVuACI11qff3tMSU29gdvLBaIEjPypuFRDA7KzMiGLBRPZDfZuXEqTMBxe8C81x2uRBh7HFG3kK1ww8SgLhvd3Qrs6NQC0NzeQBiaf9NPUHD/vcTFLFigprZHGAeqffpy83w0wQAykFFh7Awo3AqjwnlNY8QQqjbI/v2IDtC6ZJxhPqZK//eh9PxnNWjRFTEgSxFn/DPzjykRz8uOJDaEYDpAO7YfDhC2htUg2+LM/meg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voSn4uKeyHYEGIYPQIZVidONJnD1QQtFBZtC90TWl+U=;
 b=FO74Fnrq0SPSgcgjjgrCvaIuJzxVOmTO3sS8zumUZ/FxbQ74gRMFWl9luP/MywVHFWxqo3yGujd9LQ2mDYlZp5tvduv5rfPNXny7U/OP6wCeu3uAhe0Z0DCNKqb6/XdqOBaCr/yNDAC8BkQENzLJNWmjUze257bYDp93IC1lhPQ=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB1966.namprd10.prod.outlook.com (2603:10b6:300:10d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 16:23:18 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%4]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 16:23:18 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v6 03/19] qdev: unplug blocker for devices
Thread-Topic: [PATCH v6 03/19] qdev: unplug blocker for devices
Thread-Index: AQHYI8rlxaVvdL/3Hk+KEC3FbT8qX6yeJ32AgAsP6YA=
Date: Mon, 28 Feb 2022 16:23:18 +0000
Message-ID: <F110D666-049A-4F82-A5AB-044BD61843CC@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <5acc81b16d52949a47cbcbfcc2eacc0e4f3a5687.1645079934.git.jag.raman@oracle.com>
 <YhOvYR463nBTfQFM@stefanha-x1.localdomain>
In-Reply-To: <YhOvYR463nBTfQFM@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7040242-1e03-4a93-5c10-08d9fad6a14d
x-ms-traffictypediagnostic: MWHPR10MB1966:EE_
x-microsoft-antispam-prvs: <MWHPR10MB19660C1AD865F5B602F2D0B690019@MWHPR10MB1966.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XsGEqwd/KwJVVjE9V6Cfp3l43P53sa56NmbgeIXtcmpdIaKqvvk9/kh7MIDR+Tlja4OyVboZFBTmqDHbRzFmj6yoSG0K0UZyYiTwgW61iIW//4W+zcRO+S1EZUR0nI8ElaKxbFCW1/mOLnf9jcX3jcQFAo2OCQvZdEdcY5Rru1WiUYZfUmQqOsX9WZNUlpakzEdIGQ5lAlU/FU8+Hgiqmnuqeo+OgHhS0AU0WxYp3SJ6dsZbKeoFTG+ACLH0n8JewwUx9PoJc2eGaP01NP1DaU4OOmcZL+K/x5sauBjAVoEtqCx13nEwyaH7jaxy+GCv5eYjNwYQzKE9OoI81JdWb/KqWNx0jM54C6zKpubfaH7Iu9Huc0X8GVU6FGNkr6t5b2joIL9zf6QgNmR9teTKc/8VzisUa2C8hFh7QL23CZq/K7q0jXzS0ExVM8meMwkBJLLFR77Yr23AHtEHr1fAQa6CzZdX4VDPuyaCc0hY+a5OokGjJWQnpY1jYhpGroz+LEeJ7ao3aWGPYPXLOvyYDqR8YBk6YIg/iwMrPxJjID6L+guH+Qc7j92C+d9QI+OLI+uNS4ypA/GLyJsq1RGDOydc9dy1NYNrDvT1vKj74UkfQwwKM04xRvfaO0Kv1ednwwpeKw+MfzWJlxp9/kUSXTXQUcbkJkTUdgPHR2kWh1PC7bwOc/qfhx8D+yYbTr134H4o1zGkj7YIw9IlDekbSyUus+q/z1DMKBBvO/djaWZ9NDggm4N1SW0xKWc6H8uo/OWM5HpZ1OR1WVqAWcH6VV7UQIltGU9txNZh074RGVZ0BZ0wRFeth8Yl2JHMbCc3T6hqyPv07VaMo8bTyunREw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(966005)(508600001)(6486002)(71200400001)(36756003)(53546011)(6506007)(6916009)(54906003)(316002)(91956017)(122000001)(66446008)(66476007)(64756008)(8676002)(4326008)(66556008)(8936002)(76116006)(38100700002)(33656002)(66946007)(6512007)(107886003)(38070700005)(186003)(44832011)(86362001)(7416002)(2616005)(2906002)(5660300002)(83380400001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2toTkswTU1WelJZTTNaSEUyWnBjQ0xNdDhUYk9pTXN3bmJiQTVldm9PZTMr?=
 =?utf-8?B?ZUlsNi82YVFRcnNFTzZMTFhMRWJYN0lUQndFOTNrYnMyeVhja0pmQTZ3NFFJ?=
 =?utf-8?B?TnFneDM2WEdveGgzVkwvRkl0YjVnOGpsWnViQjhWSEZmV2RqeHR2ZUNLeVlQ?=
 =?utf-8?B?ZWpwcVZiRzFLd0FRK0VUTVVva3I5VW1jd1VGQkJueERzSS9Xc25UUG9JV2xy?=
 =?utf-8?B?MUZNM1I3cnVicDFCNWh0Q1IzTmJER3NzSG9XYlpWc21CNUFtanBJdUtXWDRk?=
 =?utf-8?B?SitLaS8xTDhZSW5TQ0ZPTjdXT1drbldlTmh6alNMU0NRcFlFRzExMjhYZ09B?=
 =?utf-8?B?TC82bFltQzEySkJqMmV6ZUFTK1JFMHRONkNGNjh3N3h4by9ubWVCeHJHSVdm?=
 =?utf-8?B?MkgyY09GME5VRFJMNXpOaTB5cmV1N1YrQk0zazVLekNneWZ4L25wU0d4a0to?=
 =?utf-8?B?U1k3dFY4WElNWHhxRTVLVGxTK2ZuckpLMmxnL1RIUXkzSGM5bXJNU2JvUjRV?=
 =?utf-8?B?NXJvazN3bHV6T2JmYUZpZ0ZRcEw3c1cydXlPL2xhWEo5bWdQc2tWVjZiM3dG?=
 =?utf-8?B?WDVRVHA2UGpHZXJ6d2pQdm1MVlM3RitzemN3dmN3QVhySHArM1p3eW9rSVdn?=
 =?utf-8?B?NWFkdjJ0Sy9TcUZoL29BWXFwSkxzQ1dnbElkdFFkc05YalpWTVlRQkNpVENp?=
 =?utf-8?B?Wld6N1J5VE81cittZS9acDBTV0h3MGdxZXpnc2NGR3VBQjJjOHdVSHQwM3JJ?=
 =?utf-8?B?QkZFeGJTZ2E0NEhna3ppYi9CNmpLRDEya3pBOFFuLy9jdnRPUDhuQkFnQ2Vl?=
 =?utf-8?B?N1BZTnZ4Vm1QcThxeDdndEVvZ0lYQy8xNG9CQmdTNFowT3p2bmZrOHhOVTJi?=
 =?utf-8?B?OWdYMHluWWdycjJLV3Iwbm9QS3VndXVtY21JRDNhQk81OXhndXVINjUzZkNS?=
 =?utf-8?B?cTFPZkVqeHVpYTVXUnpnL1pNYzcyZUhyK3dYS2ZGTmhRZjJROTQ3MzVxU21Z?=
 =?utf-8?B?M1NneTVBK1ZrYm1JUFNEbDBqMnltczhlLzFDL3FJM0hCN0JuWlhPZTlFYTly?=
 =?utf-8?B?blQwS0RwVXhsU2ZtdmNGUWwvNGc1YXUrbXZwNE95UFNMcXBzL1IrU3kwTkg3?=
 =?utf-8?B?UFErc1dCZ0R3N0RNVUppd1VTcmJmRmhHQWlaZUZDcEp5QmlVNTZtbzFQNXMw?=
 =?utf-8?B?dEtTWHRBSTloOEdndnorOURzRlA4WGtvK21jaGlNbnhFWGZmOWJ5Z2FoVFJy?=
 =?utf-8?B?RnNLZjVDamViRmZTS2tyajFNRk80RTRUZEZnN0hSNnNCN1AvOVNEUW5pT0pH?=
 =?utf-8?B?UmVDbDJrRllOenFyZ3daVmlTa3J6Sk13dHBFSGFvQnJRV2s0UFR0OCtYMDFj?=
 =?utf-8?B?Mk5xSGxMVkZRd1NZWDRBSzFCMjBEeUFUMDRPNWQrL3NReTlra2FRdDg5dVVw?=
 =?utf-8?B?dUh6TlRnaVNlU3VBZmJTNGhUVnptdDZQVHFianVXOEZiQzdLOGY0R1pOSDQ5?=
 =?utf-8?B?R0xqYlh0VGdJRXk4S3NRWUdmQXF1R3JQS3U2eFUrK2wydTBwN0E4ajEzaWVC?=
 =?utf-8?B?S0piV1NRRFVrTVI2enJHVmQyRDljdkNLb3l3NEpLSGdkMUdlb0dQdGxSRHRw?=
 =?utf-8?B?ZG4xZ3ZjMXRCTUt6emptZTh2VWprZHJXNVY5eTB4dVhWd0FrZU8rdDNLNmlX?=
 =?utf-8?B?WisvUFZBekExYzlqSnBPa2p1OUJkYUZlaHcrc2pzUHhYek1mRUkrN09LTDZU?=
 =?utf-8?B?WmwyWXBqUW1QVm9zQ25lV2IvNkdjdmFobEZ6YWVJczU3a2JaNEpCbDdweHVR?=
 =?utf-8?B?bm5NN3UwcGF3ZXJSVGFRMjVnR2FHbEFtdzdqVHdFN1BOb0hZeGZ5dkVVVkU5?=
 =?utf-8?B?L0hKMlNId20yeE1MMzRsQmpicG1PYlgrVFh1bzVVb2lWT1V2akdkYzBDUUhO?=
 =?utf-8?B?eHE5TE0wNUM4MDMvNFVqeFAxUGNObXFPTkxxalcwVzdaZmZ6NVZRdkREOEZm?=
 =?utf-8?B?ekt3b01MYi90OW16RTMvbEh4dGJjVVZDc2oyQytiS2c4MHB6WmNHKzErOHk1?=
 =?utf-8?B?NVJXVnJMa1RqYm5rR2tKQVdOTFBYN1gyRGdtMlozVTl6b2MrMWU1ZkVBVEtz?=
 =?utf-8?B?andpbitSNTdzbHRxdUtiVW85LzVjbDlMaG5wRnVSVEdxdlBwSUdIVnRNRFJh?=
 =?utf-8?B?UEZkZFlZWnA0UHhRWkxVRzFJWUJITEM0Z0dPdkpLTXpkRVgwcHpCbG9HU1l6?=
 =?utf-8?B?UXZENTVKZ2V3NmRiL29qNEF3RDNnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <10BEDEA90E957941907F45AF854A9E0E@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7040242-1e03-4a93-5c10-08d9fad6a14d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 16:23:18.5001 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4DLVTS0tg9nERL650EN9Lip3lEV8b/2lcBwZJucZWKFyJ2BZfhHCl9aRAGVuE778275+V514e6R9MC7NjIxUng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1966
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10272
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202280086
X-Proofpoint-GUID: ByrF6IL6u_mmKFoIjs-P158OsCCOyZtv
X-Proofpoint-ORIG-GUID: ByrF6IL6u_mmKFoIjs-P158OsCCOyZtv
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRmViIDIxLCAyMDIyLCBhdCAxMDoyNyBBTSwgU3RlZmFuIEhham5vY3ppIDxzdGVm
YW5oYUByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIFRodSwgRmViIDE3LCAyMDIyIGF0IDAy
OjQ4OjUwQU0gLTA1MDAsIEphZ2FubmF0aGFuIFJhbWFuIHdyb3RlOg0KPj4gQWRkIGJsb2NrZXIg
dG8gcHJldmVudCBob3QtdW5wbHVnIG9mIGRldmljZXMNCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTog
RWxlbmEgVWZpbXRzZXZhIDxlbGVuYS51ZmltdHNldmFAb3JhY2xlLmNvbT4NCj4+IFNpZ25lZC1v
ZmYtYnk6IEpvaG4gRyBKb2huc29uIDxqb2huLmcuam9obnNvbkBvcmFjbGUuY29tPg0KPj4gU2ln
bmVkLW9mZi1ieTogSmFnYW5uYXRoYW4gUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUuY29tPg0KPj4g
LS0tDQo+PiBpbmNsdWRlL2h3L3FkZXYtY29yZS5oIHwgMzUgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4+IHNvZnRtbXUvcWRldi1tb25pdG9yLmMgfCAyNiArKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPj4gMiBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspDQo+
PiANCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3FkZXYtY29yZS5oIGIvaW5jbHVkZS9ody9x
ZGV2LWNvcmUuaA0KPj4gaW5kZXggOTJjM2Q2NTIwOC4uNGIxZDc3ZjQ0YSAxMDA2NDQNCj4+IC0t
LSBhL2luY2x1ZGUvaHcvcWRldi1jb3JlLmgNCj4+ICsrKyBiL2luY2x1ZGUvaHcvcWRldi1jb3Jl
LmgNCj4+IEBAIC0xOTMsNiArMTkzLDcgQEAgc3RydWN0IERldmljZVN0YXRlIHsNCj4+ICAgICBp
bnQgaW5zdGFuY2VfaWRfYWxpYXM7DQo+PiAgICAgaW50IGFsaWFzX3JlcXVpcmVkX2Zvcl92ZXJz
aW9uOw0KPj4gICAgIFJlc2V0dGFibGVTdGF0ZSByZXNldDsNCj4+ICsgICAgR1NMaXN0ICp1bnBs
dWdfYmxvY2tlcnM7DQo+PiB9Ow0KPj4gDQo+PiBzdHJ1Y3QgRGV2aWNlTGlzdGVuZXIgew0KPj4g
QEAgLTQxOSw2ICs0MjAsNDAgQEAgdm9pZCBxZGV2X3NpbXBsZV9kZXZpY2VfdW5wbHVnX2NiKEhv
dHBsdWdIYW5kbGVyICpob3RwbHVnX2RldiwNCj4+IHZvaWQgcWRldl9tYWNoaW5lX2NyZWF0aW9u
X2RvbmUodm9pZCk7DQo+PiBib29sIHFkZXZfbWFjaGluZV9tb2RpZmllZCh2b2lkKTsNCj4+IA0K
Pj4gKy8qKg0KPj4gKyAqIERldmljZSBVbnBsdWcgYmxvY2tlcjogcHJldmVudHMgYSBkZXZpY2Ug
ZnJvbSBiZWluZyB1bnBsdWdnZWQuIEl0IGNvdWxkDQo+ICAgICAgXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eDQo+IA0KPiBUaGlzIGxvb2tzIHN0cmFuZ2UuIGd0a2RvYyB3aWxsIHByb2JhYmx5IHRyZWF0
IGl0IGFzIHRoZSBkb2MgY29tbWVudCBmb3INCj4gcWRldl9hZGRfdW5wbHVnX2Jsb2NrZXIoKSwg
d2hpY2ggaXMgYWN0dWFsbHkgZGVmaW5lZCBiZWxvdy4gSSBzdWdnZXN0DQo+IG5vdCB0cnlpbmcg
dG8gZGVmaW5lIGEgbmV3IHNlY3Rpb24gaW4gdGhlIGRvY3VtZW50YXRpb24gYW5kIGluc3RlYWQg
anVzdA0KPiBmb2N1c3Npbmcgb24gZG9jIGNvbW1lbnRzIGZvciBxZGV2X2FkZF91bnBsdWdfYmxv
Y2soKSBhbmQgb3RoZXINCj4gZnVuY3Rpb25zLg0KDQpTb3JyeSBJIGFzc3VtZWQgdGhhdCB3ZSBu
ZWVkZWQgYW4gZXh0cmEg4oCYKuKAmSBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoZQ0KY29tbWVudC4g
SSBnb3QgdGhpcyBpZGVhIHdoZW4gY2hlY2tpbmcgb3V0IGJsb2NrLmMgYW5kIGJsb2NrZGV2LmMN
CndoaWxlIHdvcmtpbmcgb24gdGhlIG1pZ3JhdGlvbiBwYXRjaC4NCg0KSeKAmWxsIGZvbGxvdyB0
aGUg4oCcQ29tbWVudCBzdHlsZeKAnSBzZWN0aW9uIGluIOKAnGRvY3MvZGV2ZWwvc3R5bGUucnN0
Ig0KDQo+IA0KPiBUaGUgZ3RrZG9jIHdheSBvZiBkZWZpbmluZyBzZWN0aW9ucyBpcyBjb3ZlcmVk
IGhlcmUgYnV0IGl0J3MgYWxtb3N0DQo+IG5ldmVyIHVzZWQgaW4gUUVNVToNCj4gaHR0cHM6Ly9k
ZXZlbG9wZXItb2xkLmdub21lLm9yZy9ndGstZG9jLW1hbnVhbC9zdGFibGUvZG9jdW1lbnRpbmdf
c2VjdGlvbnMuaHRtbC5lbg0KPiANCj4+ICsgKiBiZSB1c2VkIHRvIGluZGljYXRlIHRoYXQgYW5v
dGhlciBvYmplY3QgZGVwZW5kcyBvbiB0aGUgZGV2aWNlLg0KPj4gKyAqDQo+PiArICogcWRldl9h
ZGRfdW5wbHVnX2Jsb2NrZXI6IEFkZHMgYW4gdW5wbHVnIGJsb2NrZXIgdG8gYSBkZXZpY2UNCj4+
ICsgKg0KPj4gKyAqIEBkZXY6IERldmljZSB0byBiZSBibG9ja2VkIGZyb20gdW5wbHVnDQo+PiAr
ICogQHJlYXNvbjogUmVhc29uIGZvciBibG9ja2luZw0KPj4gKyAqDQo+PiArICovDQo+PiArdm9p
ZCBxZGV2X2FkZF91bnBsdWdfYmxvY2tlcihEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqcmVhc29u
KTsNCj4gDQo+IERvZXMgdGhlIGNhbGxlciBoYXZlIHRvIGNhbGwgcWRldl9kZWxfdW5wbHVnX2Js
b2NrZXIoKSBsYXRlcj8NCj4gDQo+IEFuIGFzc2VydCghZGV2LT51bnBsdWdfYmxvY2tlcnMpIHdv
dWxkIGJlIG5pY2Ugd2hlbiBEZXZpY2VTdGF0ZSBpcw0KPiBkZXN0cm95ZWQuIFRoYXQgd2F5IGxl
YWtzIHdpbGwgYmUgY2F1Z2h0Lg0KDQpNYWtlcyBzZW5zZSwgd2lsbCBhZGQuDQoNCj4gDQo+PiAr
DQo+PiArLyoqDQo+PiArICogcWRldl9kZWxfdW5wbHVnX2Jsb2NrZXI6IFJlbW92ZXMgYW4gdW5w
bHVnIGJsb2NrZXIgZnJvbSBhIGRldmljZQ0KPj4gKyAqDQo+PiArICogQGRldjogRGV2aWNlIHRv
IGJlIHVuYmxvY2tlZA0KPj4gKyAqIEByZWFzb246IFBvaW50ZXIgdG8gdGhlIEVycm9yIHVzZWQg
d2l0aCBxZGV2X2FkZF91bnBsdWdfYmxvY2tlci4NCj4+ICsgKiAgICAgICAgICBVc2VkIGFzIGEg
aGFuZGxlIHRvIGxvb2t1cCB0aGUgYmxvY2tlciBmb3IgZGVsZXRpb24uDQo+PiArICoNCj4+ICsg
Ki8NCj4+ICt2b2lkIHFkZXZfZGVsX3VucGx1Z19ibG9ja2VyKERldmljZVN0YXRlICpkZXYsIEVy
cm9yICpyZWFzb24pOw0KPj4gKw0KPj4gKy8qKg0KPj4gKyAqIHFkZXZfdW5wbHVnX2Jsb2NrZWQ6
IENvbmZpcm1zIGlmIGEgZGV2aWNlIGlzIGJsb2NrZWQgZnJvbSB1bnBsdWcNCj4+ICsgKg0KPj4g
KyAqIEBkZXY6IERldmljZSB0byBiZSB0ZXN0ZWQNCj4+ICsgKiBAcmVhc29uOiBSZXR1cm5zIG9u
ZSBvZiB0aGUgcmVhc29ucyB3aHkgdGhlIGRldmljZSBpcyBibG9ja2VkLA0KPj4gKyAqICAgICAg
ICAgIGlmIGFueQ0KPj4gKyAqDQo+PiArICogUmV0dXJuczogdHJ1ZSBpZiBkZXZpY2UgaXMgYmxv
Y2tlZCBmcm9tIHVucGx1ZywgZmFsc2Ugb3RoZXJ3aXNlDQo+PiArICoNCj4+ICsgKi8NCj4+ICti
b29sIHFkZXZfdW5wbHVnX2Jsb2NrZWQoRGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKiplcnJwKTsN
Cj4+ICsNCj4+IC8qKg0KPj4gICogR3Bpb1BvbGFyaXR5OiBQb2xhcml0eSBvZiBhIEdQSU8gbGlu
ZQ0KPj4gICoNCj4+IGRpZmYgLS1naXQgYS9zb2Z0bW11L3FkZXYtbW9uaXRvci5jIGIvc29mdG1t
dS9xZGV2LW1vbml0b3IuYw0KPj4gaW5kZXggMDFmMzgzNGRiNS4uNjlkOWNmM2YyNSAxMDA2NDQN
Cj4+IC0tLSBhL3NvZnRtbXUvcWRldi1tb25pdG9yLmMNCj4+ICsrKyBiL3NvZnRtbXUvcWRldi1t
b25pdG9yLmMNCj4+IEBAIC05NDUsMTAgKzk0NSwzNiBAQCB2b2lkIHFtcF9kZXZpY2VfZGVsKGNv
bnN0IGNoYXIgKmlkLCBFcnJvciAqKmVycnApDQo+PiAgICAgICAgICAgICByZXR1cm47DQo+PiAg
ICAgICAgIH0NCj4+IA0KPj4gKyAgICAgICAgaWYgKHFkZXZfdW5wbHVnX2Jsb2NrZWQoZGV2LCBl
cnJwKSkgew0KPj4gKyAgICAgICAgICAgIHJldHVybjsNCj4+ICsgICAgICAgIH0NCj4+ICsNCj4+
ICAgICAgICAgcWRldl91bnBsdWcoZGV2LCBlcnJwKTsNCj4+ICAgICB9DQo+PiB9DQo+PiANCj4+
ICt2b2lkIHFkZXZfYWRkX3VucGx1Z19ibG9ja2VyKERldmljZVN0YXRlICpkZXYsIEVycm9yICpy
ZWFzb24pDQo+IA0KPiBUaGVzZSBmdW5jdGlvbnMgYmVsb25nIGluIGh3L2NvcmUvcWRldi5jIGJl
Y2F1c2UgdGhleSBhcmUgcGFydCBvZiB0aGUNCj4gRGV2aWNlU3RhdGUgQVBJLCBub3QgcWRldiBt
b25pdG9yIGNvbW1hbmRzPw0KDQpCb3RoIGh3L2NvcmUvcWRldi5jIGFuZCBzb2Z0bW11L3FkZXYt
bW9uaXRvci5jIHNlZW0gdG8gbWFuYWdlIHRoZQ0KRGV2aWNlU3RhdGUuDQoNCnNvZnRtbXUvcWRl
di1tb25pdG9yLmMgc2VlbXMgdG8gbWFuYWdlIGRldmljZSBhZGRpdGlvbiBhbmQNCnJlbW92YWwg
dXNpbmcgcWRldl9kZXZpY2VfYWRkKCkgYW5kIHFkZXZfdW5wbHVnKCkuIEkgbm90aWNlZA0KdGhh
dCBzb21lIGZ1bmN0aW9ucyBpbiB0aGlzIGZpbGUgY2hhbmdlIERldmljZVN0YXRlLiBGb3IgZXhh
bXBsZSwNCnFkZXZfZGV2aWNlX2FkZCgpIHNldHMgRGV2aWNlU3RhdGUtPm9wdHMsIHFkZXZfc2V0
X2lkKCkgc2V0cw0KRGV2aWNlU3RhdGUtPmlkLiBHaXZlbiB0aGUgYWJvdmUgdHdvIHJlYXNvbnMs
IEkgdGhvdWdodCBpdCB0aGUNCnVucGx1ZyBibG9ja2VycyBjb3VsZCBiZSBiZXR0ZXIgcGxhY2Ug
aGVyZS4NCg0KU2luY2UgaHcvY29yZS9xZGV2LmMgbWFrZXMgdGhlIG1ham9yaXR5IG9mIGNoYW5n
ZXMgdG8gdGhlDQpEZXZpY2VTdGF0ZSwgbW92aW5nIHRoZSB1bnBsdWcgYmxvY2tlcnMgb3ZlciB0
aGVyZSBtYWtlcw0Kc2Vuc2UgdG8gbWUuDQoNClRoYW5rIHlvdSENCi0tDQpKYWcNCg0KPiANCj4+
ICt7DQo+PiArICAgIGRldi0+dW5wbHVnX2Jsb2NrZXJzID0gZ19zbGlzdF9wcmVwZW5kKGRldi0+
dW5wbHVnX2Jsb2NrZXJzLCByZWFzb24pOw0KPj4gK30NCj4+ICsNCj4+ICt2b2lkIHFkZXZfZGVs
X3VucGx1Z19ibG9ja2VyKERldmljZVN0YXRlICpkZXYsIEVycm9yICpyZWFzb24pDQo+PiArew0K
Pj4gKyAgICBkZXYtPnVucGx1Z19ibG9ja2VycyA9IGdfc2xpc3RfcmVtb3ZlKGRldi0+dW5wbHVn
X2Jsb2NrZXJzLCByZWFzb24pOw0KPj4gK30NCj4+ICsNCj4+ICtib29sIHFkZXZfdW5wbHVnX2Js
b2NrZWQoRGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKiplcnJwKQ0KPj4gK3sNCj4+ICsgICAgRVJS
UF9HVUFSRCgpOw0KPj4gKw0KPj4gKyAgICBpZiAoZGV2LT51bnBsdWdfYmxvY2tlcnMpIHsNCj4+
ICsgICAgICAgIGVycm9yX3Byb3BhZ2F0ZShlcnJwLCBlcnJvcl9jb3B5KGRldi0+dW5wbHVnX2Js
b2NrZXJzLT5kYXRhKSk7DQo+PiArICAgICAgICByZXR1cm4gdHJ1ZTsNCj4+ICsgICAgfQ0KPj4g
Kw0KPj4gKyAgICByZXR1cm4gZmFsc2U7DQo+PiArfQ0KPj4gKw0KPj4gdm9pZCBobXBfZGV2aWNl
X2FkZChNb25pdG9yICptb24sIGNvbnN0IFFEaWN0ICpxZGljdCkNCj4+IHsNCj4+ICAgICBFcnJv
ciAqZXJyID0gTlVMTDsNCj4+IC0tIA0KPj4gMi4yMC4xDQo+PiANCg0K

