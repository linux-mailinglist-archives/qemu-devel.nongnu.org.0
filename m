Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECEF539D58
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 08:44:26 +0200 (CEST)
Received: from localhost ([::1]:53162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwI5g-0006B1-Pa
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 02:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nwHz7-0004eo-37
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 02:37:37 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:46542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nwHz3-0007OZ-Fx
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 02:37:35 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24VNxRl0020767;
 Wed, 1 Jun 2022 06:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=L2u0TA9Da8HOB+ulLfPlqsUwriIrKT8zroh86WGE1s8=;
 b=TfuAKGKFebLnGON7DA0PccQDGQWo1r1iT1JhozdCejRWz3IvIZkwkAJZkQfYBFmVpLaR
 vVq4fmU5ur1gNe3mwVl1mJ/DzSkAzVxjEotLfYlzUMNIjg30Ch+V6T1piM6WK28ZfvnC
 R/WHydhehz02u7Ao8XlA0WSwdLlJw16kC3Vb2o8oQA0C/qH6dz7wZOsoVQvXv7zskn6v
 1rD+0Tg60oV1v/xWA4Zf0k4+wIVUmlzYOBwIsMoW0nOBIytnjXUQD/plS5OBlqeiVWGU
 /o65n0UqBvdWEr6zuwD0fDBHi8WMv9S+D0hOSjyCDCb0gNYquqNBlFuoIej/Qz9CyNDT Yw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gbcaupyt6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 01 Jun 2022 06:37:26 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2516amqG010034; Wed, 1 Jun 2022 06:37:24 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gc8kkc4re-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 01 Jun 2022 06:37:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUxxmcUQ1caeGMoeMu7SBdebp8k2ARZq30ZS+WTMztJA8nYcEI4pzyvBprZ55/dCHTtV4a7G7ozD5eeEvVXItpNnUcyd3h3oVQQWsHGI0qa7UhZCg4Yt32hq+1Kx2XfxhUngB1NmVPhvz9RlLP+hDg/e2FvIceBCXxfWNlx98PPKCxxb9BHIBfjuCvgwE08M/4KanVLzPa5yUZGsKFX6Dy6DDPPK01oGof6l4Ikj+spuT7FPDhQTUV/PdGls76r0bPn7qtFjzNYHwdIHq37WqXuAL+0azFdKPuLzuTXEcPhAMSi5bMjlKvMKGTpy22UP1fMSHNJzG2S0bGDR/kZnZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2u0TA9Da8HOB+ulLfPlqsUwriIrKT8zroh86WGE1s8=;
 b=O0TIR/qsyc/7xcizAdctmj3hHcn77vymHoAUCbHQG2qnavvYjgFzgCx5xrfN6FjAMIxTgvABtb9xdQDoKjNFbJbcXBUeGoSzTh94HoCk/54pIqII2PiwFEOb5dwsH3VwgkW5GYYQP+gzQka4TRFV0Dp8wvAbk+ElY9WXQjrXW0izqRVv29bJ9Wj14Whgim4sV5eQqHljD3aKTg+Xe8B0x1rUTjnz1cFz9BU+LaO4SwzL2JazA+90i4tg0V1Ua5JomMFKge1pq5/+iq9z1pbA+SCbF6AptT64ic0uGGL/f/MtwNlC4s6B3D8nWZ2nW68Y7qDpNv+S3T3JJLMisbreeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2u0TA9Da8HOB+ulLfPlqsUwriIrKT8zroh86WGE1s8=;
 b=zWSC985CwGDIE0Qi4oVAza4iF/IZMQslTA4ukdzLgKApR6d1tOEimtRlG/i3ZKWYWPgizYbpc9dZbkg4RdpOTjnoZkqFZFJB3RqPALD/J/yoCCTkGDKpYrQNLwCPBei81+rZ1r9dUq0NeefHa9VGgIDvWP6aXvuYEKvDb8pJjxA=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by MN2PR10MB4320.namprd10.prod.outlook.com (2603:10b6:208:1d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 1 Jun
 2022 06:37:23 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::dc4c:1040:132e:ee9e]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::dc4c:1040:132e:ee9e%6]) with mapi id 15.20.5293.019; Wed, 1 Jun 2022
 06:37:23 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>, QEMU Devel Mailing List
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v10 13/14] vfio-user: handle device interrupts
Thread-Topic: [PATCH v10 13/14] vfio-user: handle device interrupts
Thread-Index: AQHYb4NRXLWNm4XEYEK4fQNV8ypz460vr36AgAlwOYCAAFZJAIAADqgAgAAL2QCAAJSQAA==
Date: Wed, 1 Jun 2022 06:37:23 +0000
Message-ID: <E29AF321-4F2C-40B9-A1E1-ED6B455A0EEF@oracle.com>
References: <cover.1653404595.git.jag.raman@oracle.com>
 <2a492c16e0464f70f7be1fd9c04172f4f18d14ca.1653404595.git.jag.raman@oracle.com>
 <Yo5DBb8i5SMbDKnq@stefanha-x1.localdomain>
 <E6AB9FA3-6580-44C6-93FA-AFC19477C296@oracle.com>
 <20220531141046.04b448e5.alex.williamson@redhat.com>
 <CAJSP0QU13=fLTVEjE1JbkOef5im4Dwb8x3xhpYYd7KPRJjav_Q@mail.gmail.com>
 <20220531154538.6d002124.alex.williamson@redhat.com>
In-Reply-To: <20220531154538.6d002124.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b8a4a0f-ebd0-459f-a93e-08da43992f82
x-ms-traffictypediagnostic: MN2PR10MB4320:EE_
x-microsoft-antispam-prvs: <MN2PR10MB43209DACA00BF9FB23DD3159B6DF9@MN2PR10MB4320.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dSt7d5VmNZht/HBzVQkbjYgmCRJCRnefgLQcjGs4aTRYE/qMxVz/E9LYQgJZiFC9tUNuUiSyZzrYQgZPnaxcrflZlMvageQzjI14t2eIbivX1nF5AS4pvLTCW60m+1Phboa1WFo/YrZH8WFfwkJSjuzTbl9PMI/jH+NqZTI3jziORj+1xnBzBP651NqAQ5XloMlmxFDCgYI068dtEtzv8xyxEx5GKJq0fBUiNJB7uG75uZcJlJNuiSIJK/sZqIHXMd/YDOM9jfU+FK+b6qXH/dxN7iiLFdliATEnTBYpmaYjhN/lRuM4e2oi3OIqwkUu2iUXVqKZH/Jd9igZS5Sxso2GDWiwxO8JSc2gkNq/HfnVaB2HOerrS6i/F+BfuLEDayMGdIVNJFZU3BIzV+TK7sFihlJ5i+NJ2GePQuKn4jyzBG7TKhsfqSZrMnRJrH5s5BOTGGcKY1EHR5PY/cW7RjvYOiBS8c18vPoJ1mrylVPDbK6HCl8tR+KJU84suNykGNCAtMBXGWizrz2iEO+VnyfbuAXQnTkaKLjhchUoBby32h0xqn/7oQtIt88VPw5zF+j2LPixTO7/ne1vIf+QKkFElCUJCug0oD7LA+LoryVBXzhaXv2Mgft9MBL8vsG4uFEVpA3ZQfUyVPxa5cqIbBpK3TCuwdhhzKonYdn+mw7oKJcdmpY4pHJ51iucVbrbn26KZW4cXly/XUyXYF/cAc5mhoDfr9Dv/dEcviEIY6k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(122000001)(6506007)(38070700005)(8676002)(83380400001)(71200400001)(6486002)(2906002)(26005)(6512007)(53546011)(316002)(110136005)(66476007)(66946007)(66556008)(64756008)(66446008)(36756003)(38100700002)(5660300002)(33656002)(2616005)(8936002)(186003)(86362001)(76116006)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFpVb0YvTzB6M2NzQVFhK09RV1NKUmlpcUhvK3QwTU41QUVLdWlyTWhtbjhr?=
 =?utf-8?B?c3Zzam9KNDVVWEtRTzk4eWlIQjVhMk5sU2dWWG9oQXhYMTBIZUFGckFLZ084?=
 =?utf-8?B?ZzFadWhJaHhNYUVyQS9tbFI1UmNYcWdsbk13RldvK0prbHRvRFYyUFhlL0pp?=
 =?utf-8?B?TkhlM01qR2lyTVBzZmRselZjbWF3ZTQvWUU3U2QyWDJyVVNEMlBOaGgrbEhS?=
 =?utf-8?B?aDBpaWRpWU5sUHdIbUdONkl5U1ArNkdBMTNkWUtjUEw4cWxFbzZRQlNZZUpT?=
 =?utf-8?B?RHZXUEhnVmZicW5iYjJEWmhzZERsdXN0Yk5QaXFnV2tLU0tiMDVpb2xjUjFL?=
 =?utf-8?B?Qm85L1JyNWlKSUZmWUhzVG00VTV1aE1vdlJnY2xNRkZ6V21vREFvUmZnUFc2?=
 =?utf-8?B?alozdDFldWJqVS9qa3Vac25ETUZQUGRNT04wK001Z1VhNm9VdDV3VDArd2Nx?=
 =?utf-8?B?Mm1IczFKYUI2WEFZMWdNbkxCQ0hGNjZZTmh2MFFIT3p5bk1jTWZ1L1dPSHhI?=
 =?utf-8?B?OTF1dTZpNjRIZThhRWdwNzhZSFJVY0lyYWJ0SGRMNHJrQzA3NC8wbmRoUVpk?=
 =?utf-8?B?L0tDVFFpZERCbnJOY3o5ODd5K3hPN0dSbXZmM3VyVDBBWHlKVGhBQkc4QW1D?=
 =?utf-8?B?STdkOWVUSVdteVFrSEFpanQvYVRyMW9lSjJmV2tYUFRRRnpSZS8zenN2RHli?=
 =?utf-8?B?bXdDQlY1S3N1Q1daY1FsaFpIUkRLTkJUMjZJamdZNEFCVGpJOU9CVnFzVys5?=
 =?utf-8?B?TmFwS1RzSDdFcmo2bFU5ckxoY2ZXbDhhS0c1NTU0eGxYU0V1T1lBdEJSY0Vl?=
 =?utf-8?B?dW5WNmN1QWk4L01xMDd4NHEwSTNZT2kwQkhvU2haWUdkSHBBT0xwTEt5dDNE?=
 =?utf-8?B?d09LRjVpMTRiMEVtRlArT09mSm5RTGtOZnhaZW51VUxndTB1YTYvSHBqQmIy?=
 =?utf-8?B?dS81eE8wYm52eUp3MGFqaU1ZUzRRNGIzbmEram1oQVgrUmYvT242TDdCZnM2?=
 =?utf-8?B?VUJsOUVPNFBCa1RRN2dCYVVEdVcwcmlwZW9jalhpdjBuazU5VzhvZFBiZms2?=
 =?utf-8?B?emZ1ZE9lUlRYbGtwRVE0MmZvWFBkZkU2K3d4YkZSelRoZzVqbmVPL2cyUWdo?=
 =?utf-8?B?NlZyMXY1bjZ6Rkc5VzM0Mm5LcmVuN0lmQmxDTEcvdjcyUmo5TnV6UGxrTU1w?=
 =?utf-8?B?c1BTT1E4MG1KUlcwVmRXaVQzK3Vvc1RLc2VTVXpBZ2VmaFhEUDkreTMzbWNL?=
 =?utf-8?B?Wjg2dGE5aml6QzgxT04wN0d3a1F3VWZJclZ6SU9BdGxvOGNGbTBnR3JRYy8w?=
 =?utf-8?B?c1RXa0VkOEp4Q0dxNzkyMXB5THpjRGtrNmd0d0JtOUp5YkZOMm14ZStndkN3?=
 =?utf-8?B?QStwTDcxMXdWSlNMWXMrZUVvK2srZnIrY2ZncVhXRDd2YWFjeEJ3QzNjWkVi?=
 =?utf-8?B?Tzd4YVZBbzd5cExjL0tBWjA0d3JTQnZVMFV1WmJ5YmNkcGNrWDk3dWFYTnhr?=
 =?utf-8?B?R3Via01FN0YxSS9WVHd3WmVHSjdGSjNlaUo2aWplVi9RTXdXMG51T1VqMmVO?=
 =?utf-8?B?R3Y4elBtNUlUdFg0UlQ2aFNtRmFReFVNeHg2YTYrcFlITlJEV2Q1N3dONFFv?=
 =?utf-8?B?SzBObDVlUDhLQ21nME5hRTNUZjJ2MnpVUWlyOVZTUzBoSjdiTDRBcnJoamZ5?=
 =?utf-8?B?UEt4ZDQrMHR0VUJyUUpBOERIU0VuSTRpY05xekpscTNEK1AvU2ZseVFBN05v?=
 =?utf-8?B?RWdzV3hoSmcxdjlmdCtiblhNa283NU1laU84eGI0MDhHUEZJT2ZkWEFhd2Nj?=
 =?utf-8?B?WHppTTQ2TjV5aDgvN2d3SG14OWlkUWcxbGZCOXF2a0RBbGJZVmxUQVZ6RE9t?=
 =?utf-8?B?aXpMc3lUbE5oZStUaUxTaEFjZmRFczMyZ01oWWVvSElzTmlpMjNxSkh6eFhE?=
 =?utf-8?B?UTFMN0dpV2RmL3lveDlpZUx0VHFlWkZ2WVNiVWhqRmdIMGxBY05VOU1xRjR2?=
 =?utf-8?B?UHFpeDQ4MkhyNmlCTlppTldoZ05BVHUzQkxMendka1luSjhJRWxaaXRvUUNM?=
 =?utf-8?B?V280WTVFT1hYaXExa0I2Nm5xak1weHU1TW5ROENxU3IxbnJYaTI2eTJZYnIx?=
 =?utf-8?B?U3V0VlpuWFdmK2REUURFVTR2THVhZ2NsVU1aNXpkMmd3NSt1YlFQOFFBOVAy?=
 =?utf-8?B?a20vanIxOGRQeHR2Mkl5SmFwMGdzS2E4ajdRTCtBdXBYdUZaVzVoTnRqWnVG?=
 =?utf-8?B?N1ZNYnNqNjh5V0x6aVpVZGtzcXZUVnViOFQrOEZNTEI4cDNvYW5EcExSOGxX?=
 =?utf-8?B?Kyt2MkhGZzVCVVhXdEE2RlRCTmxGVmRWc0NPNHJFRXc0clUrWDlsQXJqbUtE?=
 =?utf-8?Q?crqeXd5QlVMcMqd0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2507D9A67084C04C829F9A57C9529C8F@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b8a4a0f-ebd0-459f-a93e-08da43992f82
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2022 06:37:23.2183 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /YCsr9l9d9hLYCfS4X2ZxnmcYx5orpz7hYQUCEOdXyujEb+Pu+UNVDHvUpga90RFpnLwZYLh8UgjjVDcOYkPzdw3pd+3OOOaL1mfROS8p+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4320
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-01_02:2022-05-30,
 2022-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206010030
X-Proofpoint-ORIG-GUID: n0jH5jJXXMX4cWR-_amS9vqFenf4ePIM
X-Proofpoint-GUID: n0jH5jJXXMX4cWR-_amS9vqFenf4ePIM
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

DQoNCj4gT24gTWF5IDMxLCAyMDIyLCBhdCAyOjQ1IFBNLCBBbGV4IFdpbGxpYW1zb24gPGFsZXgu
d2lsbGlhbXNvbkByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIFR1ZSwgMzEgTWF5IDIwMjIg
MjI6MDM6MTQgKzAxMDANCj4gU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUBnbWFpbC5jb20+IHdy
b3RlOg0KPiANCj4+IE9uIFR1ZSwgMzEgTWF5IDIwMjIgYXQgMjE6MTEsIEFsZXggV2lsbGlhbXNv
bg0KPj4gPGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiBU
dWUsIDMxIE1heSAyMDIyIDE1OjAxOjU3ICswMDAwDQo+Pj4gSmFnIFJhbWFuIDxqYWcucmFtYW5A
b3JhY2xlLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4+PiBPbiBNYXkgMjUsIDIwMjIsIGF0IDEwOjUz
IEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPj4+Pj4g
DQo+Pj4+PiBPbiBUdWUsIE1heSAyNCwgMjAyMiBhdCAxMTozMDozMkFNIC0wNDAwLCBKYWdhbm5h
dGhhbiBSYW1hbiB3cm90ZTogIA0KPj4+Pj4+IEZvcndhcmQgcmVtb3RlIGRldmljZSdzIGludGVy
cnVwdHMgdG8gdGhlIGd1ZXN0DQo+Pj4+Pj4gDQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRWxlbmEg
VWZpbXRzZXZhIDxlbGVuYS51ZmltdHNldmFAb3JhY2xlLmNvbT4NCj4+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBKb2huIEcgSm9obnNvbiA8am9obi5nLmpvaG5zb25Ab3JhY2xlLmNvbT4NCj4+Pj4+PiBT
aWduZWQtb2ZmLWJ5OiBKYWdhbm5hdGhhbiBSYW1hbiA8amFnLnJhbWFuQG9yYWNsZS5jb20+DQo+
Pj4+Pj4gLS0tDQo+Pj4+Pj4gaW5jbHVkZS9ody9wY2kvcGNpLmggICAgICAgICAgICAgIHwgIDEz
ICsrKysNCj4+Pj4+PiBpbmNsdWRlL2h3L3JlbW90ZS92ZmlvLXVzZXItb2JqLmggfCAgIDYgKysN
Cj4+Pj4+PiBody9wY2kvbXNpLmMgICAgICAgICAgICAgICAgICAgICAgfCAgMTYgKystLQ0KPj4+
Pj4+IGh3L3BjaS9tc2l4LmMgICAgICAgICAgICAgICAgICAgICB8ICAxMCArKy0NCj4+Pj4+PiBo
dy9wY2kvcGNpLmMgICAgICAgICAgICAgICAgICAgICAgfCAgMTMgKysrKw0KPj4+Pj4+IGh3L3Jl
bW90ZS9tYWNoaW5lLmMgICAgICAgICAgICAgICB8ICAxNCArKystDQo+Pj4+Pj4gaHcvcmVtb3Rl
L3ZmaW8tdXNlci1vYmouYyAgICAgICAgIHwgMTIzICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKw0KPj4+Pj4+IHN0dWJzL3ZmaW8tdXNlci1vYmouYyAgICAgICAgICAgICB8ICAgNiArKw0K
Pj4+Pj4+IE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArDQo+Pj4+Pj4g
aHcvcmVtb3RlL3RyYWNlLWV2ZW50cyAgICAgICAgICAgIHwgICAxICsNCj4+Pj4+PiBzdHVicy9t
ZXNvbi5idWlsZCAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPj4+Pj4+IDExIGZpbGVzIGNoYW5n
ZWQsIDE5MyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCj4+Pj4+PiBjcmVhdGUgbW9k
ZSAxMDA2NDQgaW5jbHVkZS9ody9yZW1vdGUvdmZpby11c2VyLW9iai5oDQo+Pj4+Pj4gY3JlYXRl
IG1vZGUgMTAwNjQ0IHN0dWJzL3ZmaW8tdXNlci1vYmouYyAgDQo+Pj4+PiANCj4+Pj4+IEl0IHdv
dWxkIGJlIGdyZWF0IGlmIE1pY2hhZWwgVHNpcmtpbiBhbmQgQWxleCBXaWxsaWFtc29uIHdvdWxk
IHJldmlldw0KPj4+Pj4gdGhpcy4gIA0KPj4+PiANCj4+Pj4gSGkgTWljaGFlbCBhbmQgQWxleCwN
Cj4+Pj4gDQo+Pj4+IERvIHlvdSBoYXZlIGFueSB0aG91Z2h0cyBvbiB0aGlzIHBhdGNoPyAgDQo+
Pj4gDQo+Pj4gVWx0aW1hdGVseSB0aGlzIGlzIGp1c3QgaG93IHRvIGluc2VydCBjYWxsYmFja3Mg
dG8gcmVwbGFjZSB0aGUgZGVmYXVsdA0KPj4+IE1TSS9YIHRyaWdnZXJzIHNvIHlvdSBjYW4gc2Vu
ZCBhIHZlY3RvciMgb3ZlciB0aGUgd2lyZSBmb3IgYSByZW1vdGUNCj4+PiBtYWNoaW5lLCByaWdo
dD8gIEknbGwgbGV0IHRoZSBjb2RlIG93bmVycywgTWljaGFlbCBhbmQgTWFyY2VsLCBjb21tZW50
DQo+Pj4gaWYgdGhleSBoYXZlIGdyYW5kIHZpc2lvbiBob3cgdG8gYXJjaGl0ZWN0IHRoaXMgZGlm
ZmVyZW50bHkuICBUaGFua3MsICANCj4+IA0KPj4gQW4gZWFybGllciB2ZXJzaW9uIG9mIHRoZSBw
YXRjaCBpbnRlcmNlcHRlZCBNU0ktWCBhdCB0aGUgbXNpeF9ub3RpZnkoKQ0KPj4gbGV2ZWwsIHJl
cGxhY2luZyB0aGUgZW50aXJlIGZ1bmN0aW9uLiBUaGlzIHBhdGNoIHJlcGxhY2VzDQo+PiBtc2l4
X2dldF9tZXNzYWdlKCkgYW5kIG1zaV9zZW5kX21lc3NhZ2UoKSwgbGVhdmluZyB0aGUgbWFza2lu
ZyBsb2dpYw0KPj4gaW4gcGxhY2UuDQo+PiANCj4+IEkgaGF2ZW4ndCBzZWVuIHRoZSBsYXRlc3Qg
dmZpby11c2VyIGNsaWVudCBpbXBsZW1lbnRhdGlvbiBmb3IgUUVNVSwNCj4+IGJ1dCBpZiB0aGUg
aWRlYSBpcyB0byBhbGxvdyB0aGUgZ3Vlc3QgdG8gZGlyZWN0bHkgY29udHJvbCB0aGUNCj4+IHZm
aW8tdXNlciBkZXZpY2UncyBNU0ktWCB0YWJsZSdzIG1hc2sgYml0cywgdGhlbiBJIHRoaW5rIHRo
aXMgaXMgYQ0KPj4gZGlmZmVyZW50IGRlc2lnbiBmcm9tIFZGSU8ga2VybmVsIHdoZXJlIG1hc2tp
bmcgaXMgZW11bGF0ZWQgYnkgUUVNVQ0KPj4gYW5kIG5vdCBwYXNzZWQgdGhyb3VnaCB0byB0aGUg
UENJIGRldmljZS4NCj4gDQo+IEVzc2VudGlhbGx5IHdoYXQncyBoYXBwZW5pbmcgaGVyZSBpcyBh
biBpbXBsZW1lbnRhdGlvbiBvZiBhbiBpbnRlcnJ1cHQNCj4gaGFuZGxlciBjYWxsYmFjayBpbiB0
aGUgcmVtb3RlIFFFTVUgaW5zdGFuY2UuICBUaGUgZGVmYXVsdCBoYW5kbGVyIGlzDQo+IHRvIHNp
bXBseSB3cml0ZSB0aGUgTVNJIG1lc3NhZ2UgZGF0YSBhdCB0aGUgTVNJIG1lc3NhZ2UgYWRkcmVz
cyBvZiB0aGUNCj4gdkNQVSwgdmZpby11c2VyIHJlcGxhY2VzIHRoYXQgd2l0aCBoaWphY2tpbmcg
dGhlIE1TSSBtZXNzYWdlIGl0c2VsZiB0bw0KPiBzaW1wbHkgcmVwb3J0IHRoZSB2ZWN0b3IjIHNv
IHRoYXQgdGhlICJoYW5kbGVyIiwgaWUuIHRyaWdnZXIsIGNhbg0KPiBmb3J3YXJkIGl0IHRvIHRo
ZSBjbGllbnQuICBUaGF0J3MgdmVyeSBhbmFsb2dvdXMgdG8gdGhlIGtlcm5lbA0KPiBpbXBsZW1l
bnRhdGlvbi4NCj4gDQo+IFRoZSBlcXVpdmFsZW50IG1hc2tpbmcgd2UgaGF2ZSB0b2RheSB3aXRo
IHZmaW8ga2VybmVsIHdvdWxkIGhhcHBlbiBvbg0KPiB0aGUgY2xpZW50IHNpZGUsIHdoZXJlIHRo
ZSBNU0kvWCBjb2RlIG1pZ2h0IGluc3RlYWQgc2V0IGEgcGVuZGluZyBiaXQNCj4gaWYgdGhlIHZl
Y3RvciBpcyBtYXNrZWQgb24gdGhlIGNsaWVudC4gIExpa2V3aXNlIHRoZSBwb3NzaWJpbGl0eQ0K
PiByZW1haW5zLCBqdXN0IGFzIGl0IGRvZXMgb24gdGhlIGtlcm5lbCBzaWRlLCB0aGF0IHRoZSBn
dWVzdCBtYXNraW5nIGENCj4gdmVjdG9yIGNvdWxkIGJlIHJlbGF5ZWQgb3ZlciBpb2N0bC9zb2Nr
ZXQgdG8gc2V0IHRoZSBlcXVpdmFsZW50IG1hc2sgb24NCj4gdGhlIGhvc3QvcmVtb3RlLg0KPiAN
Cj4gSSBkb24ndCBzZWUgYSBmdW5kYW1lbnRhbCBkZXNpZ24gZGlmZmVyZW5jZSBoZXJlLCBidXQg
cGxlYXNlIHBvaW50IG91dA0KPiBpZiBJJ20gbWlzc2luZyBzb21ldGhpbmcuICBUaGFua3MsDQo+
IA0KDQoNCg0KCUkgZG9u4oCZdCB0aGluayB5b3XigJl2ZSBtaXNzZWQgYW55dGhpbmcuICBXZSB3
ZXJlIHRyeWluZyB0byBzdGF5DQpjbG9zZSB0byB0aGUga2VybmVsIGltcGxlbWVudGF0aW9uLg0K
DQoJRG8geW91IGhhdmUgYW55IGNvbW1lbnRzIG9uIHRoZSBjbGllbnQgc2lkZSBpbXBsZW1lbnRh
dGlvbiBJDQpzZW50IG9uIDUvNT8NCg0KCQkJCQkJCUpKDQoNCg0KDQoNCg==

