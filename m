Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E71968DD52
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 16:51:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPQF3-00068P-3n; Tue, 07 Feb 2023 10:50:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pPQF0-00067c-JD; Tue, 07 Feb 2023 10:50:42 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pPQEy-0007mU-A2; Tue, 07 Feb 2023 10:50:42 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317FCXmv009810; Tue, 7 Feb 2023 15:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=IHVWsht8uy5EhONgqxdObGui6ZmWe3DiCjZNbJWF5dM=;
 b=lb+utWx6T/lWb+C0dK+VGkOpj3+yX6DkJvJXPUdMCdgSRgOPF3nca33p8mWJoKUkwgRT
 R31BJpoSQgCvqhiFBwSePF4LY3fn8xcVd8pPdhrulCplGYB+CMIGm6z5TI/2V0wwMBFt
 FEc8KmDEBxv8bl1ImhGSmliOA77ol7xVojqYKdCWv9glqmc66emjEaGRyWIRe8znQvE9
 P19rqkhd3FG8vvpSNMTgmCPezO1SEDCQoxPlHKY6Smpn2TFZx9nXET+XnKqoDCwu6i8U
 3CwDs+TNGn/Bcvv3ikAuG0Kv93nb/VcLGE4Tv/ZIBCtIMKNQhS5Sh8RDSOa37HtR4F8p JQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nkeny1g5g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Feb 2023 15:50:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FmDthgn2x+NRZtymrdu4hAsM0XvAaAD9xI8P3F4gGhFIQ1GNr1PzI2QVDN0rKb2EH83zvcuO9jif0Wr8uZA1vCclgrf+D+7wKobewWwts3+NLcnW0x3/kmyjbVq2u12WpfSSv2LhT0yNYPovKzVa2DFX7HBipWO/plQ8qRvDLyGHMpPRgXCBbUauj8swPMATsQlpwxXziRdT+tkkthWLVQ6I62ejGbNjkdd4HHo3Phe5EMgh9ZoX0C+yeTXM44zSP3UQBqxUNSBKH6XH6fkpKcKtanSHJDPkJ9891al4kY3IcWWMV638kkEoCvnmgeVPLTwE8hAoAXmciJlrPOMbPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHVWsht8uy5EhONgqxdObGui6ZmWe3DiCjZNbJWF5dM=;
 b=DEP711AY/e7Cwz81acNd5v3aOtIBI23FSHgMKwKgVIswZ+0yvTM7/nNNXEB75VJqkZiRT6/QTa/rev50mjzU3ONCS3Mc1zg1T0agdaC7Jqpdc7JhnadFnsAvLzrGb0SNB2s42w4GWBhh2KeBgwlkrzluvt/loy9xomUmw0oqmBKcU+/wkgGdI31biyTf3kA3Ddy7S/uJxb/cbb/fzz8PssMNu/5EiOMz1DC4B4I/73aJDCvsN417qeBakVRtoKIcpFekfi6Ts1i0ebYTMkdksG763dv+gluUWPiZ4vFSKfmCiKQe1m7SztAFcZMUz8HQL4KD9qmREaAJFW7XI7ZmHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by CH0PR02MB8210.namprd02.prod.outlook.com
 (2603:10b6:610:f3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35; Tue, 7 Feb
 2023 15:49:07 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::ad4a:7f4:772b:2a86]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::ad4a:7f4:772b:2a86%8]) with mapi id 15.20.6064.027; Tue, 7 Feb 2023
 15:49:07 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Thomas Huth <thuth@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, "Matheus
 Bernardino (QUIC)" <quic_mathbern@quicinc.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "anjo@rev.ng" <anjo@rev.ng>, Brian Cain <bcain@quicinc.com>, "Antonio
 Caggiano (QUIC)" <quic_acaggian@quicinc.com>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Alessandro Di Federico <ale@rev.ng>
Subject: RE: [PATCH] Hexagon (meson.build): define min bison version
Thread-Topic: [PATCH] Hexagon (meson.build): define min bison version
Thread-Index: AQHZOwPRV8hzKvphEkiDeBaX8XN6y67DkjUAgAAD1YCAAArr8A==
Date: Tue, 7 Feb 2023 15:49:07 +0000
Message-ID: <SN4PR0201MB880806A66F0497F72D0DCC5FDEDB9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <a6763f9f7b89ea310ab86f9a2b311a05254a1acd.1675779233.git.quic_mathbern@quicinc.com>
 <53dd2acc-0eb7-5e49-e803-2625f0841880@linaro.org>
 <0c85ac6c-0787-ba6f-3e19-5dbbc1619fac@redhat.com>
In-Reply-To: <0c85ac6c-0787-ba6f-3e19-5dbbc1619fac@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|CH0PR02MB8210:EE_
x-ms-office365-filtering-correlation-id: 588a0887-8814-4db0-818c-08db0922d8bf
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VOZSEtRvWPqWDuIybT5YLEz/Wu7zsAf0G5OYSGyKxhTrxBaMGADzNNDYUdyFowwhq+bYQWxjmpQ8yTFXZlfL7qxPSgMhYJzG9YFt2YBqBzcrRzascr3s3gJ+/n37ezdHl8QYDUZWLsrVIdgWOzIPHj1kq+hW/r3ezkDrGxR+AMXcsgpss+7RnN3pG4I88RCAFLVn2kP4WPVoAs/9Su6SXRNIsCGwFAbIPUjTA2Cus+sl/S3wihciy2PUeMd7xMeb2nK1KI7zA4rZenC8bAUqia+/n724v+RR3JLdwqJN0VPBYcaxAC4sBfCbdESmv9N6CwIfkqUv+HGyby9Q/QgliuThbd9mzW2CV+RNffxATXC8kM0OOF19O/gwAD2HF0ou1QLkV7MjOHmmvfYTHWwZafNdH90kBFAtB+eM2txkDsH2YpjvILoxQICMnkbbKmZje7nWEOhgHnUNjYcVKWtY3lPCPNKvaEkhPJQiRHngZItR56LEKWg/WXkEMbRX3dUmPharVjDD8SA94P/3YZXuCYhTz0CxpQoQDGgMe1keknL7O0ZXuSEycsCoUkOA66UUSj6ts5q3/SFcLuPL6K/u93b8CNMAeb0/AXitjTHnFG5JtsVlL1woMQPL4FyG+g8U9hvFRENK4FpBLV09aDA8t2RAgwFHfm3JZ7IRDhuzNUbzJ9TTdBMgsaX6BeW9NL45J2zAE78BwO98N7bFbynxwQcC0VTyLWZF/DDyr1WpNes=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199018)(33656002)(38070700005)(86362001)(122000001)(38100700002)(66446008)(66946007)(8676002)(66476007)(316002)(76116006)(64756008)(7696005)(4326008)(66556008)(478600001)(110136005)(5660300002)(54906003)(8936002)(52536014)(41300700001)(2906002)(55016003)(9686003)(26005)(6506007)(186003)(53546011)(83380400001)(71200400001)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RURwTXl6akJJd08wOWFxd3JSbCtia1d5eVczTjdwR0tBMVQ3OFoxek4rWmRr?=
 =?utf-8?B?djhkVDlUWksveC91NkpJakFZQXhHQUw1Z2IrUVdrS3pubG5BbFdyQzRQZUg4?=
 =?utf-8?B?UzNQZTREQUdEVkRqLzBEVG94ZDVwb0VjMzk1TUg0T0pndEpNWWkrTGJNWmNX?=
 =?utf-8?B?QzU1TG9jeVNuQ0dlSndnZFhwK0ZGQ3dIUzZONm9wTnF2bUlmUC9LVlBCbG1m?=
 =?utf-8?B?dlkreXpiUTBLWFM0UXhLSFNMSVVmZ252bmtDRU1oaExVWGZvOFhNRGUrdlBP?=
 =?utf-8?B?QVJ1MUlDTVZBU2RsaFdaUThjMmJsRWZjazlVeFh2ZFZuUkY3T1dYOW8xQlVn?=
 =?utf-8?B?c3BLK0FMWnh1VjNiZ2J4aTkrUEFXWlRQeTJucHAvYWF3RUloU2sxbTc0T21S?=
 =?utf-8?B?UTl6WTdKY2FqQVB4dHgwaFA1SnVYVXlzR3ZiS2x0cTY4YVBIb254WExPOVpJ?=
 =?utf-8?B?REdYZXgxYndRMDlsS3ZRdm5KdGQya0xWaS9NS3VwTDAxTE1SWGVNYTBUMzZF?=
 =?utf-8?B?UmJSeFY1ankyc2JKUFFFTXpndFovQmllL096TzFySGVnbHZZZzlFbFNsRk5n?=
 =?utf-8?B?M0hoY1R5WER0VXJIT2tvTlkweXNONG82M1ROYlpqS0xJK0kzUXVZOXYvVkZj?=
 =?utf-8?B?QVlzQUN3d0VOVGhVYlQxRm9URVNVMU9Bb2tjTkdSbDBLMmpLR0tLNWZteUtE?=
 =?utf-8?B?Q0VDRFdEWTRiMlNqZUtCWWk5WFU3TFFQZzEwaDRNNGU1NUZhWjErdW5UUmFD?=
 =?utf-8?B?bCsrZFpWdWhTVnpyUFBnb1R6MTdFenhqZmUvS25ReUcxaEhRcnRMYU1TMUFl?=
 =?utf-8?B?VURIZXV4YWJFdVUwVHF0T2dhU3V1NjdkdmlHZ0R1cSs3YU5oeHhtZ01PaHJZ?=
 =?utf-8?B?b2NhMFF4UEFrZTNYTkUraFF2b0JZeFQwZlBmdEYvVlV3ZVI1dDdBc2Y2SWI0?=
 =?utf-8?B?K2ZUUjdYaHlldjJHa0J1RzZ0M2hLbml4WlhKdWhqejR3amVRQ1JOVUgxZTZQ?=
 =?utf-8?B?eHZzeWN2NzlhZUdwckppdUJMVzI4NEZDd3I5QnNWcW40WGEvL0txN1pCajBE?=
 =?utf-8?B?ZDV6VVFmdHYwRmdKV3VOZU8zTXdEZ0VNc1RTalFSN1N4cnFOT292V3BmSm0w?=
 =?utf-8?B?QXNJemxSZWhXWDVVL3BERk1IVDhTQlNGSTYvb0o2eTBQRjZnVHIrRmcyUFhl?=
 =?utf-8?B?K2FtK3R5UFdGajEzY2t3WXZOUDNycXFVNlBqeDNmeFl5VlpGSDl3QTNVeW5R?=
 =?utf-8?B?Q3NpZGtJU1BMVGMwTWFmRGJ4UFBtanNWeFRHU3d5bHpxNTBMSXU2WkU1WTBT?=
 =?utf-8?B?dTBPNFJDdUMvR2RNVTAvdVZhOUp4QzJYNStyeVVhUjhxd0dwVzl3ZERBZFc3?=
 =?utf-8?B?c1pVT3ZOL0dvRUNqeW95TnRZM2VSM2xBcGNSQU9pSTB1bjI0VXdCdWN2ZW1s?=
 =?utf-8?B?TExRN2ZFbHRjSFJ0L1lud2ZUL3ljOHY0bjNVK3ZwR0JISHdkem1tb0duMm54?=
 =?utf-8?B?MGErWFFXNlV1MU11S3ErRG9OdXdwYmtiMFBCK2ZXUFF0T3F3WGZXR3NUWEpv?=
 =?utf-8?B?dzJLQUtTV0Zkbzlsb2Ztem00Q0VXNHRGaGsvMjhMczZ0YmdGWFZCVEpyM093?=
 =?utf-8?B?ekx6VnJOTWVIM3k2TFZYU211dUtiRU0wRk9wdGRZNkROTlZvWTk2c1I2bmp4?=
 =?utf-8?B?RWJIYzVXMEVjcTdtN0ZqbzlzdDJLUTFRQktNQjJPNXVHajNpNTJ2ejcwTzB5?=
 =?utf-8?B?MWk0bTM5ZXg1TnptWDJBM0l4VmZ2dE9VOVhoM0JzbVUzUVVhTjFYbzhnT0ZE?=
 =?utf-8?B?cktvMzNsMG45b2VtenZweXNnSlZDQ0VVQUlNaGlIaHFKUXlRM1FsY3hoaHNR?=
 =?utf-8?B?d1F2SnhXMy9PMk9yazNYUkJTZ0FJYmR2MXJJd29ZVllscVY4VWkwbStYVmFa?=
 =?utf-8?B?cExEYllqM2dRc3RGRmJEVTAwN1R6Q2ZZNXZCWksrVHkvc3hpZnZVdG1JdUJC?=
 =?utf-8?B?NVlFRzBtL2JRUEdRL1dtNDJOOHdIQ3BKUEQya3hXT1FLS2xHZVFZbERvZC94?=
 =?utf-8?B?cUQzZlJiYmtSRDJGSHFTcjQySmx3Y054NWxwVEZhM2taWFIxOU1vUktwRHRV?=
 =?utf-8?Q?hRVtQTg0p6tKMdPqDEJaUjU4D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ov63lyYDglTkNaEEJuhtZHYAbtC0Pl5C4vlesF/epbNljl8WoH1TbQVMFjKYqOtCcLiNdbzvud9Bagsv28HfYAN1MulH5D/dPsqgXvGwkzJ8PJCccHU7yBAg8cctYie3TZIoceSG5+OmUAvcY/qkHEFmEeDj2tN1WtI8V3sr/daqP8/r31uCQcWnv/ByeyaJ+hcrPf9/J2q/karJTzIqqwwrjWtJpZ7UyZKtc2x0ZZKNuTZAaddIBD9nDBcxCfYCONkj/6Yhm/WJUWZBDpLwPyW/70zMf4WTOx+OpSOCflR0I6+FGhfvrCuJcHwBVPZ1seNlB+t5WS3b14slLK4WnNiOV5RCGwJHlWzHK3TCrg60qEOJja43qrtuaCmS8gZqfl3u8iMCE5XtaGAJPCkuw34vc9anzIgSIuOlNaR8wUibk+dG5FVLrN+sy/Hc2/zBSZVwy+m7/umujpd5wF2qFXWrfGbbwt7aAgHXlQTbf+iakkkNqbAFa05d1pIcmFPEdbBWao6m8BP5uoCTdnVCfzYNQG0gs7stSTGYbM2GEdvfYyyblfDEtwIVkCpNq5sfXHKxcEQPsKonYhSNdiopeByklSv/eo+H9gEA89LdvpjxgWRFBwVrP/nDNOmc0VW68UoACZXK0xTeWdyXnDTialjolDX5zmHSTkd09rFQGtk/s/90vJkvmGK9FW3lLO4MXleGdXAIg8nxFL/kTfsU9kt7JKFiAfkAFz2Uy6Gg3ize1WnK3o4e+L/58BXpAUoa/s53ujI+FA1oBCZvFHAPXgjB1UUoPeNqT6fcS+ts+xpfOXh2jxtJDdRhh4RseUC/jMhFlFW+EJx/XDx1Noirow==
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 588a0887-8814-4db0-818c-08db0922d8bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2023 15:49:07.2711 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N6g81lBd4Nt9lfMNnZeh98KC9qlUzC1oLqmVsBthQR+2uUPBVJAxz7iavglVWZ8mTxDold5A1bNV8qqBmKe4Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8210
X-Proofpoint-GUID: RDR9I7jc-XplpXtrhIzqbF-5iNdIBQKH
X-Proofpoint-ORIG-GUID: RDR9I7jc-XplpXtrhIzqbF-5iNdIBQKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 clxscore=1011 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=975
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070141
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGhvbWFzIEh1dGggPHRo
dXRoQHJlZGhhdC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIEZlYnJ1YXJ5IDcsIDIwMjMgOTowOCBB
TQ0KPiBUbzogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPjsgTWF0
aGV1cyBCZXJuYXJkaW5vDQo+IChRVUlDKSA8cXVpY19tYXRoYmVybkBxdWljaW5jLmNvbT47IHFl
bXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzogYW5qb0ByZXYubmc7IFRheWxvciBTaW1wc29uIDx0
c2ltcHNvbkBxdWljaW5jLmNvbT47IEJyaWFuIENhaW4NCj4gPGJjYWluQHF1aWNpbmMuY29tPjsg
QW50b25pbyBDYWdnaWFubyAoUVVJQykNCj4gPHF1aWNfYWNhZ2dpYW5AcXVpY2luYy5jb20+OyBE
YW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQuY29tPjsNCj4gUGFvbG8gQm9uemlu
aSA8cGJvbnppbmlAcmVkaGF0LmNvbT47IFFFTVUgVHJpdmlhbCA8cWVtdS0NCj4gdHJpdmlhbEBu
b25nbnUub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBIZXhhZ29uIChtZXNvbi5idWlsZCk6
IGRlZmluZSBtaW4gYmlzb24gdmVyc2lvbg0KPiANCj4gT24gMDcvMDIvMjAyMyAxNS41NCwgUGhp
bGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+ID4gQ2MnaW5nIFBhb2xvL0RhbmllbC9UaG9t
YXMNCj4gPg0KPiA+IE9uIDcvMi8yMyAxNTo1MiwgTWF0aGV1cyBUYXZhcmVzIEJlcm5hcmRpbm8g
d3JvdGU6DQo+ID4+IEhleGFnb24ncyBpZGVmLXBhcnNlciBtYWNoaW5lcnkgdXNlcyBzb21lIGJp
c29uIGZlYXR1cmVzIHRoYXQgYXJlIG5vdA0KPiA+PiBhdmFpbGFibGUgYXQgb2xkZXIgdmVyc2lv
bnMuIFRoZSBtb3N0IHByZWVtaW5lbnQgZXhhbXBsZSAoYXMgaXQgY2FuDQo+ID4+IGJlIHVzZWQg
YXMgYSBzZW50aW5lbCkgaXMgIiVkZWZpbmUgcGFyc2UuZXJyb3IgdmVyYm9zZSIuIFRoaXMgd2Fz
DQo+ID4+IGludHJvZHVjZWQgaW4gdmVyc2lvbiAzLjAgb2YgdGhlIHRvb2wsIHdoaWNoIGlzIGFi
bGUgdG8gY29tcGlsZQ0KPiA+PiBxZW11LWhleGFnb24ganVzdCBmaW5lLiBIb3dldmVyLCBjb21w
aWxhdGlvbiBmYWlscyB3aXRoIHRoZSBwcmV2aW91cw0KPiA+PiBtaW5vciBiaXNvbiByZWxlYXNl
LCB2Mi43LiBTbyBsZXQncyBhc3NlcnQgdGhlIG1pbmltdW0gdmVyc2lvbiBhdA0KPiA+PiBtZXNv
bi5idWlsZCB0byBnaXZlIGEgbW9yZSBjb21wcmVoZW5zaXZlIGVycm9yIG1lc3NhZ2UgZm9yIHRo
b3NlDQo+ID4+IHRyeWluZyB0byBjb21waWxlIFFFTVUuDQo+ID4+DQo+ID4+IFsxXToNCj4gPj4g
aHR0cHM6Ly93d3cuZ251Lm9yZy9zb2Z0d2FyZS9iaXNvbi9tYW51YWwvaHRtbF9ub2RlL18wMDI1
ZGVmaW5lLQ0KPiBTdW1tYQ0KPiA+PiByeS5odG1sI2luZGV4LV8wMDI1ZGVmaW5lLXBhcnNlXzAw
MmVlcnJvcg0KPiA+Pg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBNYXRoZXVzIFRhdmFyZXMg
QmVybmFyZGlubw0KPiA8cXVpY19tYXRoYmVybkBxdWljaW5jLmNvbT4NCj4gPj4gLS0tDQo+ID4+
ICAgdGFyZ2V0L2hleGFnb24vbWVzb24uYnVpbGQgfCAyICstDQo+ID4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQg
YS90YXJnZXQvaGV4YWdvbi9tZXNvbi5idWlsZCBiL3RhcmdldC9oZXhhZ29uL21lc29uLmJ1aWxk
DQo+ID4+IGluZGV4IGM5ZDMxZDA5NWMuLjQyYjAzYzgxZTYgMTAwNjQ0DQo+ID4+IC0tLSBhL3Rh
cmdldC9oZXhhZ29uL21lc29uLmJ1aWxkDQo+ID4+ICsrKyBiL3RhcmdldC9oZXhhZ29uL21lc29u
LmJ1aWxkDQo+ID4+IEBAIC0xODMsNyArMTgzLDcgQEAgaWYgaWRlZl9wYXJzZXJfZW5hYmxlZCBh
bmQgJ2hleGFnb24tbGludXgtdXNlcicNCj4gPj4gaW4gdGFyZ2V0X2RpcnMNCj4gPj4gICAgICAg
KQ0KPiA+PiAgICAgICBiaXNvbiA9IGdlbmVyYXRvcigNCj4gPj4gLSAgICAgICAgZmluZF9wcm9n
cmFtKCdiaXNvbicpLA0KPiA+PiArICAgICAgICBmaW5kX3Byb2dyYW0oJ2Jpc29uJywgdmVyc2lv
bjogJz49My4wJyksDQo+ID4+ICAgICAgICAgICBvdXRwdXQ6IFsnQEJBU0VOQU1FQC50YWIuYycs
ICdAQkFTRU5BTUVALnRhYi5oJ10sDQo+ID4+ICAgICAgICAgICBhcmd1bWVudHM6IFsnQElOUFVU
QCcsICctLWRlZmluZXM9QE9VVFBVVDFAJywgJy0tDQo+IG91dHB1dD1AT1VUUFVUMEAnXQ0KPiA+
PiAgICAgICApDQo+IA0KPiBMb29rcyByZWFzb25hYmxlLCB0aHVzOg0KPiANCj4gUmV2aWV3ZWQt
Ynk6IFRob21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPg0KPiANCj4gT3V0IG9mIGN1cmlvc2l0
eTogV2hlcmUgZGlkIHlvdSBlbmNvdW50ZXIgdGhpcyBwcm9ibGVtPyBBZnRlciBoYXZpbmcgYSBx
dWljaw0KPiBsb29rIGF0IGh0dHBzOi8vcmVwb2xvZ3kub3JnL3Byb2plY3QvYmlzb24vdmVyc2lv
bnMgaXQgc2VlbXMgdG8gbWUgdGhhdCBhbGwNCj4gb3VyIHN1cHBvcnRlZCBPUyBkaXN0cm9zIHNo
b3VsZCBhbHJlYWR5IHNoaXAgYmlzb24gMy4wIG9yIG5ld2VyLi4uDQo+IA0KPiAgIFRob21hcw0K
DQpDQydpbmcgQWxlc3NhbmRybw0KDQpSZXZpZXdlZC1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1w
c29uQHF1aWNpbmMuY29tPg0K

