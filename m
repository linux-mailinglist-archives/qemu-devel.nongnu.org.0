Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BF250E758
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 19:31:47 +0200 (CEST)
Received: from localhost ([::1]:57060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj2Ys-0000Na-E5
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 13:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nj2Xp-00087G-OB
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 13:30:41 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:27588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nj2Xm-0001pu-R4
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 13:30:41 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23PFe3em022232;
 Mon, 25 Apr 2022 17:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=t/kRZym3dIrM5HzudRs+anX+eAxKI/tJhrm/WsFb5nQ=;
 b=TjhW2aICvzy6BTADnY2kEKSjjSA2fRMe/hSw9ode6+etXsa/uU4ACM4+KI8ls0c0wNpx
 7GInYi1tvtwYRhQS776aJLVhNLWDs2YGbjXlmj9cpZPON9epCznjEfN0RnqOPQlfU+TL
 P2UUp/OgrYhfK6V1VxpRN47uSlqxxBIgjq/9pCgnk7CWMsBLKvUG8krxRnwFMZbB+eEH
 23SdIBDkx3k4S3Ol+KFVA4vWLUOZxWjy4TV06HiBz6CgvS57e9r18n+NQZ+sozlAjP2N
 oCQJq//WnwueO/gAjD02hpR7jo0PItd0ICgNYo8ux/6Y7Vh5gyC9o66hGXQgKsAPua4Q tQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmaw4c01a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Apr 2022 17:30:23 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23PHG7Ys034198; Mon, 25 Apr 2022 17:30:22 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fm7w2kamq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Apr 2022 17:30:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KGfDpwBDbFXtHb4m93MpS0UzbFfmQfXeBjZiLvIRutuaBKP3WKGVX+u9rM3nOawf58+kX2tGVq9p7JpXb/5Rb7AdYBCHTuIu0d6AYrWw6XbdwElnHROlW8T2Mkj/cwmozkd7mV2tibZSUxr3Y+vshH5cr638Onv+OqvCSQyCreXqfRqM8zjDgv/cYnaF2QmO2H4PiBmKL7o8r5MM0wNWBmnpzHwBOnRc1+j8JhYfZelepLdz9/7bQyKPCMK2hGwXQwsFPqc6dD2hkjy80gjAm7zp/RqQSUCoPbR1/8P0un9Xc6TT0LsAVs2n4G5GUVxqTbzFheaMUt68KvTo2s9YpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/kRZym3dIrM5HzudRs+anX+eAxKI/tJhrm/WsFb5nQ=;
 b=m9OqeJEfjzpCkMwum8FyDQBjqpyGCX1jEigO4s5GP28Xwom9sQSx9nRPexRPX6Ns7yij6UoAxkD/KTQQEG8ZJk1Qiyjir2NJVqWCDULrnmr5rNSgXjWUjChNvVTBDb4AlU1dPdVkBIlvtx9crTmfytwTiSEI+Q94xhdk+7POwfY9gx16H7CBF60hfAkVaMfi/NhXEDAqAks2poM1dK2Z9iYcMUad0x/DLBCxBn8+UAjLSVViA+gpe2etyGU0bEkFv+h5qLDgLD8xriqgkfcgDVfXMTDdSNHql8eiBPe09KsSCnNuoCbwjgviy3GLR14J9P46uU1F34wk72mzEjBbyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/kRZym3dIrM5HzudRs+anX+eAxKI/tJhrm/WsFb5nQ=;
 b=SMRQJPV9Lkk7FjSrLAY60ARrxFM4E1CTPUKbPQDPPSUv49V9zYqkuiowaBOmci+Fs1jNc+alv0QwkW68Gm0QyzH8ApIPbIJ2in1AxR+CewAI40uyKshiqNdPWBP5a7sdiZpfJHu31KO2Ttck6S4G0WzvadnHr+Rj3BjHWxihHuw=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3727.namprd10.prod.outlook.com (2603:10b6:208:110::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Mon, 25 Apr
 2022 17:30:19 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 17:30:19 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v8 12/17] vfio-user: IOMMU support for remote device
Thread-Topic: [PATCH v8 12/17] vfio-user: IOMMU support for remote device
Thread-Index: AQHYVC5hP+b0lxyaWEa1TGZcvM2cNKz4p3SAgAfAwgCAAIOvgA==
Date: Mon, 25 Apr 2022 17:30:19 +0000
Message-ID: <4A2BD588-33D6-41B2-88E4-22C7766CCD8B@oracle.com>
References: <cover.1650379269.git.jag.raman@oracle.com>
 <2a42664b61cef7cdd44688679b60a8c6c397b075.1650379269.git.jag.raman@oracle.com>
 <9D4970CA-122E-4F1C-8598-D841A4A7E78D@oracle.com>
 <YmZsMnoJ6ZZkEP5g@stefanha-x1.localdomain>
In-Reply-To: <YmZsMnoJ6ZZkEP5g@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3fe762d0-3f58-4694-5e0d-08da26e14520
x-ms-traffictypediagnostic: MN2PR10MB3727:EE_
x-microsoft-antispam-prvs: <MN2PR10MB37278AB6BDFC18939F9649AB90F89@MN2PR10MB3727.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MmIyJADXmErZ5QRCDRhNQQrlc+ZPsqgfQk5NUbLF0RDZLyWQUzemJI/ZVpTSJF+xlLtctzANFl7j8FJXwDCQ085LOMdjuup3em4J5M4lAIYHJHoNlaFpKOeM1bfuvAE4umrlfe26JlEil26Ogj4xARb+DN7RjjNlmjNBYr2LxtL4BnSFOVHJvcorFz7fl+Yu9D7hQanAnez88RIf3Ahyq7Sw5ESOVGvRYQR/Hx/kGAAYVZB4D1nmYkdz9kRnHLGSzCANqsHXR1gvqSmj74ok2gBnitKnyIl5R2eMMQRFww3Wz8cWQVsk0CPCWVhpSg2O7kW3ONHme9cxEqdCM3J6/F6lFeX9ueACpoKLElspz//rLAuMQ16VeGg+J/LHA/uNkytHSy/CpeMGqom4JBRtWHvkKQA1dImM8K7wlxkR9F5h784qyk4AvcAaY9JsqTTjhNdoiZf1ZrluAg6Xu5tUb6gy2PgCpPg0cLUn/yCL42lUHxBzjUftVPRNfr7ngMc4aXZJRviRV6uYQVJwLboYo+Z+OhUr5V1ViVtXebOkVOj7xnDdJGtkjGl5m+5JCaixxlLQ1ry77UmXundNdop/TI1856G8bzR4NN3PIgRB9vQcUtEY5FLRR28EZ/Asuq5nRS067TiNwiuAg2mkxEijnHWQF3nDujIG1osktMpmfo3xx09uw3+fOihNgOlubJv35rfv9zH6SBHMB0ObKCrA7mqsMa6iR3qZUBHzYvXDjNYafCrtF8GqbL68GjWZIhrH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(122000001)(5660300002)(8676002)(33656002)(4326008)(316002)(54906003)(71200400001)(6486002)(508600001)(38070700005)(64756008)(66446008)(76116006)(38100700002)(91956017)(66556008)(66476007)(66946007)(6916009)(6506007)(7416002)(53546011)(86362001)(8936002)(2616005)(6512007)(44832011)(2906002)(36756003)(83380400001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2NzYjgvZ0RDTEt6SlBqeUpzR0YwdzJpTktYQVlxaEx1Z24wWHg5NHBGak1w?=
 =?utf-8?B?QkFPT0w1NFFwcFo0cU5Jc3NxMFhyVEl0MUVRRXlET2phM0dDejRqOHBIRlNi?=
 =?utf-8?B?c3lxc3BzZ3BVRTBqOFlVdzlrTDIreEwyaXdFSmduUG9rZEFCRFRtUE5DSkdD?=
 =?utf-8?B?SHAwaHBLb2NhK3RIVENneWZnaXpjTllsdllKc1lTMkhmY1ZOUlljci9aWWxq?=
 =?utf-8?B?QnVmNkMzRVg5MmJhdnMrTnFRd2hTMk82TTZxZm1mOEx0d3ZKRE10VzBFT0JY?=
 =?utf-8?B?bFgrL284K0pQNk9QWWFsdHpqeXBHNW53TGFBdmREc3BGb0QvbG9WeFoxWjdV?=
 =?utf-8?B?TzhyL2RGK290Ti9pbkRrT0JoNkszcW0wUG8rUFhVSVpET1V4S3NUc2lsWHUv?=
 =?utf-8?B?aGNIaEk0aWo3eU5adTZGMFpxcVhuUFRRMTBtbVp2b1dLUFJPQVFTWEtxREE0?=
 =?utf-8?B?Rkp0Um8zQzJMcmtualgzOWJjMm9xY0I2T044N1VhTFR2ZjBoUnVvL3h4ZWZ4?=
 =?utf-8?B?aFF2Y1QxVUc0SjhrOFh0NW1TY2psbjRtcDRrZi92SFlWd2NCbzBXZkdjZTN5?=
 =?utf-8?B?dGNJQ1hRZ1JydVh2bW01dldydkU4VTVmd0RTbGY3UEJ1YzFhUWtpMnNwZ3hn?=
 =?utf-8?B?T0tqRy90YmgxR0k1K1Frby9FMEcxczhob2ZNeXJtRkFFZnUwV3ZaTVhFcm0x?=
 =?utf-8?B?SWtRQi90eDQwc3I3MDVSL3ZyWDFFWnZIa0JwRk1KdkJ3R0E5cXdGNVV0SUNv?=
 =?utf-8?B?cHF3ZXh5eURERk1VWXcvVm5iK01ZY2pCeVJuSzFBb1paZ04zVTBwR1BtOWZN?=
 =?utf-8?B?bVpLRG9NR1dxK0hwRmFrMW5xOTRuR0owVTJiMVZ5NWIybkM2TUhNRnphVWg2?=
 =?utf-8?B?dkNsaUJCUnlGRTlUVzBzSjUwYndYSHNFUE43dGFLRGFtVnZ1dDVzek4rTTl0?=
 =?utf-8?B?allTVmMyWTNHdE5pYU1SaDFsOC9iVXBYdnJXdkdTY0Z0cmk2aXlVK25GTGs2?=
 =?utf-8?B?U3hTV1h4NGh2dGlLUzZ0aUpDZjNsTVhDWFJNNFFEeW4yMEhWNDZOR3p6M2Y3?=
 =?utf-8?B?a2ZwZnFHYW5BODJpSTRmTTU1RWFCR09Ha3o1dm9SQ21DT3lWbHJkWDlIWEVH?=
 =?utf-8?B?WkhxdEloWnJoUktmcnpmZ0tHTHNLTFBndSttOWFxWVhFalBKelBpTG1zV05i?=
 =?utf-8?B?MnYxTzEzL1YxaG8rZGZ1cis5am12N3Ztb0hGZ1pvMDZ1Tlk4eGljUUJ2Vlll?=
 =?utf-8?B?SWhselFhUGJ5TkpmVGFBbTR4OXNDTHo4eUFMbU1FVlhhaGtqWnZlc0hDMlVq?=
 =?utf-8?B?amtZbTg4OFJNWjNVNStSUkhqYytjMW82aGRYOVpXWUU3NDY5a0tETnc2L0hD?=
 =?utf-8?B?YUV3bmdPUUNnYlV0TmM3anowaDc2TnlDWTFkUlFmWXhaNDJBZlBXdVFteTIx?=
 =?utf-8?B?TkNXdGZzaWpiSG1wSjNib3FrbzkvMWJzQXliM2ZiMEMrQVNYRGJhNFE4eDBu?=
 =?utf-8?B?Y1g4N3oxUTlqaGk2QUw0cHN4ZFFCNVVNaXVXem1DZ1pIYi9pdEZQVkdTSHZJ?=
 =?utf-8?B?NjV5bTlRZmQ4K3BucFNmUjEzV3hvRzRsbWJGbHI3OXNKc2RHNW8zOHNtMVc4?=
 =?utf-8?B?VG5YYU5NNjBhRmlvTmN6QjJzZWVvMVRGUWdQQTZQR2tRU1EyYmFucElyZkUz?=
 =?utf-8?B?RmRxZXQ1N0ZhREtIL0YrR0VFSTBlcDg5U1hmTVQ4Wkk0d1pHY3Y0UzJ1YXRo?=
 =?utf-8?B?N0REQlpTVnpCVmJWNWtzQmg1QUFvVnVVc1JhT003V1VOS3UrN0JZUDNEaldj?=
 =?utf-8?B?SEVXWUpwcng2T3QzTURPcko0WHhHeldqZzBUWlRpNTJESXJJblY0Q2MrWTc4?=
 =?utf-8?B?SDBDaWw4b2NKdERvS2Y1dnZudldsRGZoTlhQbUM1b21sSEkrenQycUJDTTJo?=
 =?utf-8?B?ZWY2NW1VNEJUZnZDc1FoWThNZjlKc1pGVFlKcGNJcHBRcVpTNlgwRWFNRkxR?=
 =?utf-8?B?MWVKcEFaNCt5dGxaSUhvNmVxNEN5T1JZWGRkWlBqcFlpUUR4aTVqdEY0c2tE?=
 =?utf-8?B?Z0VwL0lLTHRmTytBVTlhUGZqa3k1QmNuRkhSKzh5elBRYU52eWJWL0hxcWZs?=
 =?utf-8?B?MmlCajVPZFZzKzFmWmhZYXV3dTZpYXo5L1RUeE50NFFZRkVCK0NDUmVsVlJQ?=
 =?utf-8?B?YzNpYjlhakNhRkhLQ1Zzc2NkckhoZ1QxMHVlS243a2YwSEhPLzRQMVNpL0Rj?=
 =?utf-8?B?K0Y0bGgzQ1VMMWZrTnppaGRHTWZZWFRIaEU2TzNnNEJHZDNRNWc0cXlZcHd0?=
 =?utf-8?B?ZkQvMTVWVyt0TmhvM0JvRVRQcnphWHAzWHJzdGp4bTErTkxEbHM4dUpidzZE?=
 =?utf-8?Q?juGTCHUAew2XkFUvJR8+FMuVg6gqNseOhjEnr?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <602245F7ECFE8144BA8FA81A0E3F26FE@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe762d0-3f58-4694-5e0d-08da26e14520
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 17:30:19.4967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q7kiTy2aldh9z4pAX9d9UWOgSRUe0FSbPBy2xGoKl3+QcHsGUgyFcfLw1kt1PAPgdU9W8HhVsS1uhvCLuYXXZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3727
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-25_07:2022-04-25,
 2022-04-25 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204250077
X-Proofpoint-GUID: ZhgAw-5xB1Sxv9Vdd834OVGDJz7TBQ_5
X-Proofpoint-ORIG-GUID: ZhgAw-5xB1Sxv9Vdd834OVGDJz7TBQ_5
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Thomas Huth <thuth@redhat.com>,
 John Johnson <john.g.johnson@oracle.com>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Levon <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gQXByIDI1LCAyMDIyLCBhdCA1OjM4IEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBBcHIgMjAsIDIwMjIgYXQgMTE6
MTU6MTZBTSArMDAwMCwgSmFnIFJhbWFuIHdyb3RlOg0KPj4gDQo+PiANCj4+PiBPbiBBcHIgMTks
IDIwMjIsIGF0IDQ6NDUgUE0sIEphZyBSYW1hbiA8amFnLnJhbWFuQG9yYWNsZS5jb20+IHdyb3Rl
Og0KPj4+IA0KPj4+IEFzc2lnbiBzZXBhcmF0ZSBhZGRyZXNzIHNwYWNlIGZvciBlYWNoIGRldmlj
ZSBpbiB0aGUgcmVtb3RlIHByb2Nlc3Nlcy4NCj4+PiANCj4+PiBTaWduZWQtb2ZmLWJ5OiBFbGVu
YSBVZmltdHNldmEgPGVsZW5hLnVmaW10c2V2YUBvcmFjbGUuY29tPg0KPj4+IFNpZ25lZC1vZmYt
Ynk6IEpvaG4gRyBKb2huc29uIDxqb2huLmcuam9obnNvbkBvcmFjbGUuY29tPg0KPj4+IFNpZ25l
ZC1vZmYtYnk6IEphZ2FubmF0aGFuIFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xlLmNvbT4NCj4+PiAt
LS0NCj4+PiBpbmNsdWRlL2h3L3JlbW90ZS9pb21tdS5oIHwgIDQwICsrKysrKysrKysrKysNCj4+
PiBody9yZW1vdGUvaW9tbXUuYyAgICAgICAgIHwgMTE0ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+Pj4gaHcvcmVtb3RlL21hY2hpbmUuYyAgICAgICB8ICAxMyArKysr
LQ0KPj4+IE1BSU5UQUlORVJTICAgICAgICAgICAgICAgfCAgIDIgKw0KPj4+IGh3L3JlbW90ZS9t
ZXNvbi5idWlsZCAgICAgfCAgIDEgKw0KPj4+IDUgZmlsZXMgY2hhbmdlZCwgMTY5IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkNCj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9ody9y
ZW1vdGUvaW9tbXUuaA0KPj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBody9yZW1vdGUvaW9tbXUuYw0K
Pj4+IA0KPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3JlbW90ZS9pb21tdS5oIGIvaW5jbHVk
ZS9ody9yZW1vdGUvaW9tbXUuaA0KPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+Pj4gaW5kZXgg
MDAwMDAwMDAwMC4uMzNiNjhhOGY0Yg0KPj4+IC0tLSAvZGV2L251bGwNCj4+PiArKysgYi9pbmNs
dWRlL2h3L3JlbW90ZS9pb21tdS5oDQo+Pj4gQEAgLTAsMCArMSw0MCBAQA0KPj4+ICsvKioNCj4+
PiArICogQ29weXJpZ2h0IMKpIDIwMjIgT3JhY2xlIGFuZC9vciBpdHMgYWZmaWxpYXRlcy4NCj4+
PiArICoNCj4+PiArICogVGhpcyB3b3JrIGlzIGxpY2Vuc2VkIHVuZGVyIHRoZSB0ZXJtcyBvZiB0
aGUgR05VIEdQTCwgdmVyc2lvbiAyIG9yIGxhdGVyLg0KPj4+ICsgKiBTZWUgdGhlIENPUFlJTkcg
ZmlsZSBpbiB0aGUgdG9wLWxldmVsIGRpcmVjdG9yeS4NCj4+PiArICoNCj4+PiArICovDQo+Pj4g
Kw0KPj4+ICsjaWZuZGVmIFJFTU9URV9JT01NVV9IDQo+Pj4gKyNkZWZpbmUgUkVNT1RFX0lPTU1V
X0gNCj4+PiArDQo+Pj4gKyNpbmNsdWRlICJody9wY2kvcGNpX2J1cy5oIg0KPj4+ICsjaW5jbHVk
ZSAiaHcvcGNpL3BjaS5oIg0KPj4+ICsNCj4+PiArI2lmbmRlZiBJTlQyVk9JRFANCj4+PiArI2Rl
ZmluZSBJTlQyVk9JRFAoaSkgKHZvaWQgKikodWludHB0cl90KShpKQ0KPj4+ICsjZW5kaWYNCj4+
PiArDQo+Pj4gK3R5cGVkZWYgc3RydWN0IFJlbW90ZUlvbW11RWxlbSB7DQo+Pj4gKyAgICBNZW1v
cnlSZWdpb24gKm1yOw0KPj4+ICsNCj4+PiArICAgIEFkZHJlc3NTcGFjZSBhczsNCj4+PiArfSBS
ZW1vdGVJb21tdUVsZW07DQo+Pj4gKw0KPj4+ICsjZGVmaW5lIFRZUEVfUkVNT1RFX0lPTU1VICJ4
LXJlbW90ZS1pb21tdSINCj4+PiArT0JKRUNUX0RFQ0xBUkVfU0lNUExFX1RZUEUoUmVtb3RlSW9t
bXUsIFJFTU9URV9JT01NVSkNCj4+PiArDQo+Pj4gK3N0cnVjdCBSZW1vdGVJb21tdSB7DQo+Pj4g
KyAgICBPYmplY3QgcGFyZW50Ow0KPj4+ICsNCj4+PiArICAgIEdIYXNoVGFibGUgKmVsZW1fYnlf
ZGV2Zm47DQo+Pj4gKw0KPj4+ICsgICAgUWVtdU11dGV4IGxvY2s7DQo+Pj4gK307DQo+Pj4gKw0K
Pj4+ICt2b2lkIHJlbW90ZV9pb21tdV9zZXR1cChQQ0lCdXMgKnBjaV9idXMpOw0KPj4+ICsNCj4+
PiArdm9pZCByZW1vdGVfaW9tbXVfdW5wbHVnX2RldihQQ0lEZXZpY2UgKnBjaV9kZXYpOw0KPj4+
ICsNCj4+PiArI2VuZGlmDQo+Pj4gZGlmZiAtLWdpdCBhL2h3L3JlbW90ZS9pb21tdS5jIGIvaHcv
cmVtb3RlL2lvbW11LmMNCj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4+IGluZGV4IDAwMDAw
MDAwMDAuLjE2YzZiMDgzNGUNCj4+PiAtLS0gL2Rldi9udWxsDQo+Pj4gKysrIGIvaHcvcmVtb3Rl
L2lvbW11LmMNCj4+PiBAQCAtMCwwICsxLDExNCBAQA0KPj4+ICsvKioNCj4+PiArICogSU9NTVUg
Zm9yIHJlbW90ZSBkZXZpY2UNCj4+PiArICoNCj4+PiArICogQ29weXJpZ2h0IMKpIDIwMjIgT3Jh
Y2xlIGFuZC9vciBpdHMgYWZmaWxpYXRlcy4NCj4+PiArICoNCj4+PiArICogVGhpcyB3b3JrIGlz
IGxpY2Vuc2VkIHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdQTCwgdmVyc2lvbiAyIG9yIGxh
dGVyLg0KPj4+ICsgKiBTZWUgdGhlIENPUFlJTkcgZmlsZSBpbiB0aGUgdG9wLWxldmVsIGRpcmVj
dG9yeS4NCj4+PiArICoNCj4+PiArICovDQo+Pj4gKw0KPj4+ICsjaW5jbHVkZSAicWVtdS9vc2Rl
cC5oIg0KPj4+ICsjaW5jbHVkZSAicWVtdS1jb21tb24uaCINCj4+PiArDQo+Pj4gKyNpbmNsdWRl
ICJody9yZW1vdGUvaW9tbXUuaCINCj4+PiArI2luY2x1ZGUgImh3L3BjaS9wY2lfYnVzLmgiDQo+
Pj4gKyNpbmNsdWRlICJody9wY2kvcGNpLmgiDQo+Pj4gKyNpbmNsdWRlICJleGVjL21lbW9yeS5o
Ig0KPj4+ICsjaW5jbHVkZSAiZXhlYy9hZGRyZXNzLXNwYWNlcy5oIg0KPj4+ICsjaW5jbHVkZSAi
dHJhY2UuaCINCj4+PiArDQo+Pj4gK3N0YXRpYyBBZGRyZXNzU3BhY2UgKnJlbW90ZV9pb21tdV9m
aW5kX2FkZF9hcyhQQ0lCdXMgKnBjaV9idXMsDQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpvcGFxdWUsIGludCBkZXZmbikNCj4+PiArew0K
Pj4+ICsgICAgUmVtb3RlSW9tbXUgKmlvbW11ID0gb3BhcXVlOw0KPj4+ICsgICAgUmVtb3RlSW9t
bXVFbGVtICplbGVtID0gTlVMTDsNCj4+PiArDQo+Pj4gKyAgICBxZW11X211dGV4X2xvY2soJmlv
bW11LT5sb2NrKTsNCj4+PiArDQo+Pj4gKyAgICBlbGVtID0gZ19oYXNoX3RhYmxlX2xvb2t1cChp
b21tdS0+ZWxlbV9ieV9kZXZmbiwgSU5UMlZPSURQKGRldmZuKSk7DQo+Pj4gKw0KPj4+ICsgICAg
aWYgKCFlbGVtKSB7DQo+Pj4gKyAgICAgICAgZWxlbSA9IGdfbWFsbG9jMChzaXplb2YoUmVtb3Rl
SW9tbXVFbGVtKSk7DQo+Pj4gKyAgICAgICAgZ19oYXNoX3RhYmxlX2luc2VydChpb21tdS0+ZWxl
bV9ieV9kZXZmbiwgSU5UMlZPSURQKGRldmZuKSwgZWxlbSk7DQo+Pj4gKyAgICB9DQo+Pj4gKw0K
Pj4+ICsgICAgaWYgKCFlbGVtLT5tcikgew0KPj4+ICsgICAgICAgIGVsZW0tPm1yID0gTUVNT1JZ
X1JFR0lPTihvYmplY3RfbmV3KFRZUEVfTUVNT1JZX1JFR0lPTikpOw0KPj4+ICsgICAgICAgIG1l
bW9yeV9yZWdpb25fc2V0X3NpemUoZWxlbS0+bXIsIFVJTlQ2NF9NQVgpOw0KPj4+ICsgICAgICAg
IGFkZHJlc3Nfc3BhY2VfaW5pdCgmZWxlbS0+YXMsIGVsZW0tPm1yLCBOVUxMKTsNCj4+IA0KPj4g
SGksDQo+PiANCj4+IEnigJlkIGxpa2UgdG8gYWRkIGEgbm90ZSBoZXJlLg0KPj4gDQo+PiBXZSB0
cmllZCB0byBhZGQgImVsZW0tPm1y4oCdIGFzIGEgY2hpbGQgb2YgUENJRGV2aWNlLiBUaGF0IHdh
eSwgd2hlbiBQQ0lEZXZpY2UgaXMNCj4+IHVucGx1Z2dlZCwgdGhlIGNoaWxkIGlzIGFsc28gZmlu
YWxpemVkLg0KPiANCj4gRG8geW91IG1lYW4gdmlhIGEgbWVtb3J5X3JlZ2lvbl9pbml0KCktZmFt
aWx5IGZ1bmN0aW9uIHdoZXJlIGEgcGFyZW50DQo+IG9iamVjdCBpcyBnaXZlbj8gT3IgZG8geW91
IG1lYW4gYnkgYWRkaW5nIGEgUU9NIGNoaWxkIHByb3BlcnR5Pw0KDQpJIG1lYW4gYnkgYWRkaW5n
IOKAnGVsZW0tPm1y4oCdIGFzIGEgUU9NIGNoaWxkIHByb3BlcnR5IG9mIFBDSURldmljZS4NCg0K
PiANCj4+IEhvd2V2ZXIsIHRoZXJlIHdhcyBzb21lIGlzc3VlIHdpdGggaG90cGx1Zy4gRHVyaW5n
IHRoZSBob3RwbHVnLCB0aGVyZeKAmXMgYSB3aW5kb3cNCj4+IGR1cmluZyBpbml0aWFsaXphdGlv
biB3aGVyZSB3ZSBjb3VsZG7igJl0IGxvb2t1cCB0aGUgUENJRGV2aWNlIGJ5IOKAnGRldmZu4oCd
Lg0KPj4gDQo+PiBkb19wY2lfcmVnaXN0ZXJfZGV2aWNlKCkgLT4gcGNpX2luaXRfYnVzX21hc3Rl
cigpIC0+IHBjaV9kZXZpY2VfaW9tbXVfYWRkcmVzc19zcGFjZSgpDQo+PiBoYXBwZW5zIGJlZm9y
ZSBkb19wY2lfcmVnaXN0ZXJfZGV2aWNlKCkgLT4g4oCcYnVzLT5kZXZpY2VzW2RldmZuXSA9IHBj
aV9kZXbigJ0uIEFzIHN1Y2gsDQo+PiBwY2lfZmluZF9kZXZpY2UoKSBkb2VzbuKAmXQgd29yayBh
dCB0aGlzIHRpbWUuDQo+IA0KPiBJIGRvbid0IGZvbGxvdy4gV2hhdCBjYWxscyBwY2lfZmluZF9k
ZXZpY2UoKT8NCg0KVG8gYWRkIHRoZSBNZW1vcnlSZWdpb24gYXMgYSBjaGlsZCBvZiBQQ0lEZXZp
Y2UsIHJlbW90ZV9pb21tdV9maW5kX2FkZF9hcygpDQp3b3VsZCBuZWVkIHRvIGxvb2t1cCB0aGUg
UENJRGV2aWNlIHVzaW5nIGRldmZuLiBUaGUgZnVuY3Rpb24gdGhhdCBsb29rcyB1cA0KUENJRGV2
aWNlIGJ5IGRldmZuIGlzIHBjaV9maW5kX2RldmljZSgpLg0KDQpUaGUgYWJvdmUgbm90ZSBleHBs
YWlucyB3aHkgd2UgZGlkbuKAmXQgbG9va3VwIHRoZSBQQ0lEZXZpY2UgdXNpbmcgcGNpX2ZpbmRf
ZGV2aWNlKCkNCmFuZCB0aGVuIGFkZGluZyB0aGUgTWVtb3J5UmVnaW9uIGFzIGl0cyBjaGlsZC4N
Cg0KVGhhbmsgeW91IQ0KLS0NCkphZw0KDQo+IA0KPiBTdGVmYW4NCg0K

