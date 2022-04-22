Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B5250B9FA
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 16:21:10 +0200 (CEST)
Received: from localhost ([::1]:36450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhu9l-0005SY-Bu
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 10:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nhu71-0003rF-0z
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 10:18:21 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:57786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nhu6w-0000cb-Hx
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 10:18:17 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23MD0TEC019412; 
 Fri, 22 Apr 2022 14:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=IWb7ivRAim4v8U49J8qtfCkBMNMBDklKi1YU0MsMxtI=;
 b=vLxag40lyyj+Vg87Y5hV82I65qJv01TS1ZHTx1rk5HkjrN++Ix0xYaoYEVpYpGlmMF4q
 w8pZum7Gonfl3UrSK41GcShld91TEzvege4xxScM0svnDYTF6Uggf8UdDxJaHdaU0e1M
 qMFjx1EaoBp2DWhOCkqJpOV+QencyegkhbwrOtDwf7i6OTnEVM0s4wXk0yJfXbM0wRJ1
 2jlGgME5YdcroazcFLyA4FjkgcJ1efFDxrnoBPg8JoD0e69F+eCNxUdhBl70/U7+RMgI
 gjdJ9hg4OwiGQbB/JTsXiP/R+zJiDAbx+WQ1UHqFFzc6lEE8q0IRs+ODUKgvxZSFChT3 rw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffm7cxfff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Apr 2022 14:18:08 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23MEC2C9008629; Fri, 22 Apr 2022 14:18:07 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3ffm8arabr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Apr 2022 14:18:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z8YE/nwCNIQIowX25Uw2v1gTWgK5S0/SOX/1oiOhKlJP6Tp50d4FQYJkiDW689RiaTmGLijG633yC8GTmDnJLToYlOoOoMKwO9XN2DZYf7oDtNdfTxV3WVbWpwOpS9cYxqI1OKw2MSsgUnnayvZBvxdPLhgXtrpt4TkMLug8gN/NcspoteZypBhT6LO59PQC/1zNo5v4bSZmHx1ewCLGcElOwS4yJ2zzcaTJGr8gr9MqVzTWa1amTxswKAXxcptHnWxUj72p1ePS7YftDW6FZy6AHuF1JN8Vkg3UPQMNp7usww9p9VO/wcgQAbhoOBFGuPC5eizYX5gYoSkGTyCPlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWb7ivRAim4v8U49J8qtfCkBMNMBDklKi1YU0MsMxtI=;
 b=a86nbBISOtoxVjlASJIf2Aybb4o7UrPCjEY76atJ6rbSAfJL3YSOLT00b4qIoAvbDEOJviGTBQV7jbkJZNtO9UeSPDXoRmDaD5cY+ljMhHK5kDbO5w7negy1b3eKrcULu6m3pOieF8DTqH6AmEoknlfAEkJIz2NnabfFAdHZfTIreB2fBUzhZK04L9GD7DCuCQifqqSQ6dJp2cD+qSnkecBu8kRS65XX3U2AFfHCPsReuuzRhjmfJMr+tgWmkAgg9IysO9GyufSmNPMqDJBr9Syfa8XgV+SPtGNof7AMXX0jjXIq2OB5Na76uxNmlwc3AQegq4hOfJ7AVijeiyP+Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWb7ivRAim4v8U49J8qtfCkBMNMBDklKi1YU0MsMxtI=;
 b=fEynrCTBY7DEa9vglXnqG3bNRhMvKY3XTng774NSsDpiFIQjfpCJsH6+BQYKgG1H/PTq/WF4muvmCIbw2Nsmq4TGTGknZK1flvW6KD2bhoaf3dJSxWe9oeYBBbyPvc27GP/cCiVBI3mx4Lb5xjX4gOSuzuELeU1ijvQPi/N9Wio=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM6PR10MB3596.namprd10.prod.outlook.com (2603:10b6:5:150::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 22 Apr
 2022 14:18:06 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 14:18:05 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v8 10/17] vfio-user: run vfio-user context
Thread-Topic: [PATCH v8 10/17] vfio-user: run vfio-user context
Thread-Index: AQHYVC5ctuPlcUcl1kCQDV6z6tqbVqz6eHnogAAwOACAAL6by4AAl+eA
Date: Fri, 22 Apr 2022 14:18:05 +0000
Message-ID: <6E592C79-1217-40BC-80FE-A68126D234B3@oracle.com>
References: <cover.1650379269.git.jag.raman@oracle.com>
 <1f71b01f49b461a41130ac9d19355344c3752f7d.1650379269.git.jag.raman@oracle.com>
 <87zgkepjn5.fsf@pond.sub.org>
 <4781D386-AF48-43C9-ADC0-7DAF2DB52F11@oracle.com>
 <87ee1pn1i2.fsf@pond.sub.org>
In-Reply-To: <87ee1pn1i2.fsf@pond.sub.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5b84d76-e77a-4407-6b83-08da246aeb4a
x-ms-traffictypediagnostic: DM6PR10MB3596:EE_
x-microsoft-antispam-prvs: <DM6PR10MB35968F9DE12DBBB3716E882890F79@DM6PR10MB3596.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CX+Me9kDZlRaVjhqtK4cNuyo90tNbKCP531g583xkq+EfcLSntL6lcM+OXfD9zOt7kSmMyBzLsLfUZwAvQAX72ORbNb8y9+XyFRm1+kZnU5KzriVQyXqB9zIddkwaPL7ry28sDzGC5KSEci8ZIC6pEsh3AlPsLrA6/Lf8KtURm/BTjBj5n5sNyh1CB8eqnb6Nr4hF2dzDa/304x/j64jmi95ZCCKsuGsGCUWnUmUbBFVl2ehv8eCmSExWAN6HWFmafUkIjSm0MGtvHvvNf/gxY0nBh5MUO36wvikIZk/b/JZWCm1wt/M5+6wBSOcNUHqBBs6D/yvwvKpwMsXN0ub7etF+86jwbM4g1R5z/PdheBS5G9pd5e3cDqSPcFNFO6xYHDBfF15i1kBQFy5AAgpmwgHLZBwZ5wGbJc8+Ztu8F+/HDprweWksWdCtGGRmPgtG31vcN1d4VUbhuTjCMYsCmXpmk5IpklfCFCdsLVK7YW4vbeaKHCsBUEdznl8ll8W3z82vaAxf1fK6uWLHemIqON/eL4wS6gFvWxLrHuwpoJ23ROvlKZ6rhloBd0y4TEh9h23jdnSRXSejsF0P4IIK9IZs3b+0HnjCTqipMqkyaz15hsQXmWozy935R7gvporXmTWSuJbUqjSrx5Ldz92zne1OZeHjwn1tAQhkUmcXJnlbQFm1kY6kT1cBc9mQLzQUFuY0Vnq7Gpu0ErADrUbmdosIVl//MsHdpo9A7W55+E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(44832011)(36756003)(6486002)(508600001)(122000001)(6506007)(53546011)(7416002)(6512007)(2906002)(5660300002)(33656002)(6916009)(71200400001)(54906003)(64756008)(66446008)(66946007)(8936002)(107886003)(2616005)(91956017)(8676002)(76116006)(86362001)(316002)(66556008)(186003)(66476007)(83380400001)(38070700005)(38100700002)(4326008)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S28wTG1FMGJNL3RnSDhYbW83Vlc1bkZkdUlnMGdvd1hSVUNQQkU4S2dDamRN?=
 =?utf-8?B?V01xSVdXdXRxZmQyWUhrMzlZWEtCTGRBWE5TWUpYOGZPZFNBMkNCbG9FUXZC?=
 =?utf-8?B?TUNNZ1Blb2pPSm55YTZIN0xrQWFOaTdMeEVZc1F2ZCtjN1hxbXA3OTBKR2N1?=
 =?utf-8?B?WHA4OHlTekxBOExYZzJELy9JQmVVSTRUNXBYeXp4OWJGN29vaTNVeTVLYWN1?=
 =?utf-8?B?TXg2SnNJbk1Wc3hqN1B3akgxclRJN3RVdUNKUGQ1ODZFL2UyRGk1WmYwMmEx?=
 =?utf-8?B?SUd2SDJncG1Ob05iazlnNU8zS2xRTUU0ZnZNUGdDdVpyazA0SlB5ditJdEgy?=
 =?utf-8?B?VXN2bEloVnNJcjVHbGVHYVZtZW5Wb0RGa0JjR2dvbWJjcm14T0ZFZzdrZkpu?=
 =?utf-8?B?TVNpQ0YwcDA2WUtpejhMUXFyZ3AxakhSRlp6MjJWSXdDSm15TzZHRitZWWVW?=
 =?utf-8?B?R0JNNDhLbUt0d2NYV1VVQU1vUnh2RWtEbGhpcmNNbTBna1NNUFlEQjk5YWQv?=
 =?utf-8?B?dENTam5sbGtZZHpTdU9kLzFLSURDTDMzSHhXUWZjUTR6TUllSi9GRDA4R3RQ?=
 =?utf-8?B?L2F5aUhuTmtmOU4zNjdqRmh5MDhHOEJ4aEJ5RFVYZVVvamNkK0hyT3FucE8z?=
 =?utf-8?B?blV4RE05MXRXbWp0NXh5TmMyNkdYaUJOWmVseHBqNzVYY3U5WFRmeEJwcFNZ?=
 =?utf-8?B?cVMrQzhEUGVVODdEYmZ4K1JNdTBaWllQSGlnQ2hxYmhTMVpkOFVFMFVCb3J4?=
 =?utf-8?B?RFVkZnJyOEU2WGdtaXZ3bWl3NDRxQkxoK0JXYjlHWkJNaWFWdUk0Q2MzSGVD?=
 =?utf-8?B?WmlRcG00Ry9kelNtRUxXY0VNdDJrME9WYTFCZStmb2E3alNSVHJQR1pKQTNu?=
 =?utf-8?B?dG1XYVNvdjlRc1BzL1R2SDZtV282RkI1V2Y5SVVPZk1sZGdYZXpvNjNOaG9X?=
 =?utf-8?B?SGJEbmNqajhLcDhlMy9OYnBEeEJ6WkZpY09iVVRQaGZTcWZDMm1wbGF6MXF6?=
 =?utf-8?B?eU5UQ2lKSmFlNlUxNm5reEJXSlhnbEZpMVY4N3F3QlpYODdxSmt1d28wREpw?=
 =?utf-8?B?WStpYkpjY1VCRUY1MlJONXhoM2VGTjdhcW9HQ2o3WVQvN2piblR3UERFNkI2?=
 =?utf-8?B?MVZVMG5ZTkQraUxuVnlpUUo1djFqY3NjWGNiMnpvRkpRbmVOY1VUUjBxbkFy?=
 =?utf-8?B?U1VYYmhMczlGaGFZOGcvc0x3VkdoU2FhdWwweHVyblhhdTN1aGovRzNyV2Zv?=
 =?utf-8?B?Z0RvdVhneDBNUk1EWmJoMkt0anlmZU5nQWh4cFg2cHZaRERCSnZsOXhyNVg1?=
 =?utf-8?B?Z1QzT0xmTElmckM4aHBqYnFrQS9VOWFFV0Zyb25EbmF5TFBkRGJ4dG1LUUVK?=
 =?utf-8?B?WHd4SjZGdCtudlY4a25rVFJSa1p4S2tlcGI1KzZPd2M0eng1V29VbEFOK2Nu?=
 =?utf-8?B?eDhVWlJSYm1IZzFFREZKVTI1TWgzZmZsSGhqS2ozRkNHRy9pUXhsaTFta3F6?=
 =?utf-8?B?M3EyWjVSMklPUkgyRnQ1VnZITFVxbmdKZ1JVd1l5anZ3RzVGWGExcG00TkJa?=
 =?utf-8?B?NEZMN3QwTXZUd0VrL3JZSWx3NExHaVozZXNqdUF4LyswcDRXTHJGSkJPUVdK?=
 =?utf-8?B?R09qeTc0ekY0ZjlvdzdkV3NmT1o3ZG1HZ2grMk5XbEFhcnRZTlYzYmw0eUIw?=
 =?utf-8?B?bk1Ob3ZSeitUWGlvOU1hTlU3eTBFTkRIL2pRNllsYnhIbncvQk9uK0E0Wno0?=
 =?utf-8?B?V2VXbEg2U3YwZUVXMncwS055cWprYzNBZFdybmN0QXpKS1lYMGhtSEFTaWJK?=
 =?utf-8?B?RVVyQ0t4c3dFVHBtdC9lSjEwVHRwN0NHazk4blBhU3doQ2xYR2NHTG9QWlpz?=
 =?utf-8?B?ZnY1VG82VEpoNEUwVytLVUc0YTQ5RHlpZkt2R0htc3lLVzdJNzBabWdMSGJT?=
 =?utf-8?B?ZENGSXE4UEZpUkpOaXVuL3BncVg0WU9XdHZDUzFuclczTWpyMnZWNFErZ2Yw?=
 =?utf-8?B?U3JwYktKMHZxZnZxN1NwUzdDT1BuY1NFNTZGZVh3dzNHd3pUNExGYWFzSURq?=
 =?utf-8?B?dzF2bUJrbTlZaTZESmV2bEdVVG5DaVF0WEZaMTFrVWtWNHJvemhxdnhrNXI0?=
 =?utf-8?B?c1NqbXJleUtHbXl1dUdUanlHZmRpdHpURUFMWW80bTY5ZUI2WVNmWExmMWNz?=
 =?utf-8?B?Q2E4UUxVVWpucDZ4SVh4UEtHd1JRcVZlWE55Z3hiendTN2NZcVdMNFFrSXVW?=
 =?utf-8?B?SEh1Unp2YzlOeUpUTGY5dGpOMjF5Q0N5MzlLUTdWV1dFVVoxK3BtVktlbVVs?=
 =?utf-8?B?UmZpNStaU0M3QXB2NUtTV1Q4a3ZMOHBnZjFYYUVZeGJ3N05DLzVrcVk4TFkw?=
 =?utf-8?Q?Ll20GHhlMKiCx+a7BGsJUDqAPc8JT6pFzZA68?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <66B2919C4361184A836FA597723B77BF@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b84d76-e77a-4407-6b83-08da246aeb4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 14:18:05.8377 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zlF854Jrn7jxfs5sHd8wvEyl1i8QBXNuUNXt9iZA8Va9mLPkPi3947ld5qw0JBGAAULI6PW7aVyh5aGYIVa8qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3596
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-22_04:2022-04-22,
 2022-04-22 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204220063
X-Proofpoint-GUID: XaafBrRYEUdE28Lu33Wpqa71y1OHTlaz
X-Proofpoint-ORIG-GUID: XaafBrRYEUdE28Lu33Wpqa71y1OHTlaz
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
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "eblake@redhat.com" <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gQXByIDIyLCAyMDIyLCBhdCAxOjE0IEFNLCBNYXJrdXMgQXJtYnJ1c3RlciA8YXJt
YnJ1QHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gSmFnIFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xl
LmNvbT4gd3JpdGVzOg0KPiANCj4+PiBPbiBBcHIgMjEsIDIwMjIsIGF0IDEwOjU5IEFNLCBNYXJr
dXMgQXJtYnJ1c3RlciA8YXJtYnJ1QHJlZGhhdC5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IEphZ2Fu
bmF0aGFuIFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xlLmNvbT4gd3JpdGVzOg0KPj4+IA0KPj4+PiBT
ZXR1cCBhIGhhbmRsZXIgdG8gcnVuIHZmaW8tdXNlciBjb250ZXh0LiBUaGUgY29udGV4dCBpcyBk
cml2ZW4gYnkNCj4+Pj4gbWVzc2FnZXMgdG8gdGhlIGZpbGUgZGVzY3JpcHRvciBhc3NvY2lhdGVk
IHdpdGggaXQgLSBnZXQgdGhlIGZkIGZvcg0KPj4+PiB0aGUgY29udGV4dCBhbmQgaG9vayB1cCB0
aGUgaGFuZGxlciB3aXRoIGl0DQo+Pj4+IA0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBFbGVuYSBVZmlt
dHNldmEgPGVsZW5hLnVmaW10c2V2YUBvcmFjbGUuY29tPg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBK
b2huIEcgSm9obnNvbiA8am9obi5nLmpvaG5zb25Ab3JhY2xlLmNvbT4NCj4+Pj4gU2lnbmVkLW9m
Zi1ieTogSmFnYW5uYXRoYW4gUmFtYW4gPGphZy5yYW1hbkBvcmFjbGUuY29tPg0KPj4+PiBSZXZp
ZXdlZC1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPg0KPj4+PiAtLS0N
Cj4+Pj4gcWFwaS9taXNjLmpzb24gICAgICAgICAgICB8IDIzICsrKysrKysrKysNCj4+Pj4gaHcv
cmVtb3RlL3ZmaW8tdXNlci1vYmouYyB8IDk1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLQ0KPj4+PiAyIGZpbGVzIGNoYW5nZWQsIDExNyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pDQo+Pj4+IA0KPj4+PiBkaWZmIC0tZ2l0IGEvcWFwaS9taXNjLmpzb24gYi9xYXBp
L21pc2MuanNvbg0KPj4+PiBpbmRleCBiODNjYzM5MDI5Li5mM2NjNGE0ODU0IDEwMDY0NA0KPj4+
PiAtLS0gYS9xYXBpL21pc2MuanNvbg0KPj4+PiArKysgYi9xYXBpL21pc2MuanNvbg0KPj4+PiBA
QCAtNTUzLDMgKzU1MywyNiBAQA0KPj4+PiAjIw0KPj4+PiB7ICdldmVudCc6ICdSVENfQ0hBTkdF
JywNCj4+Pj4gICdkYXRhJzogeyAnb2Zmc2V0JzogJ2ludCcsICdxb20tcGF0aCc6ICdzdHInIH0g
fQ0KPj4+PiArDQo+Pj4+ICsjIw0KPj4+PiArIyBAVkZVX0NMSUVOVF9IQU5HVVA6DQo+Pj4+ICsj
DQo+Pj4+ICsjIEVtaXR0ZWQgd2hlbiB0aGUgY2xpZW50IG9mIGEgVFlQRV9WRklPX1VTRVJfU0VS
VkVSIGNsb3NlcyB0aGUNCj4+Pj4gKyMgY29tbXVuaWNhdGlvbiBjaGFubmVsDQo+Pj4+ICsjDQo+
Pj4+ICsjIEBpZDogSUQgb2YgdGhlIFRZUEVfVkZJT19VU0VSX1NFUlZFUiBvYmplY3QNCj4+Pj4g
KyMNCj4+Pj4gKyMgQGRldmljZTogSUQgb2YgYXR0YWNoZWQgUENJIGRldmljZQ0KPj4+IA0KPj4+
IElzIHRoaXMgdGhlIElEIHNldCB3aXRoIC1kZXZpY2UgaWQ9Li4uIGFuZCBzdWNoPw0KPj4gDQo+
PiBZZXMsIHRoYXQgaXMgY29ycmVjdC4gSXTigJlzIHRoZSBJRCBzZXQgd2l0aCB0aGUg4oCcLWRl
dmljZSBpZD3igKbigJ0gb3B0aW9uLw0KPiANCj4gV2hhdCBoYXBwZW5zIHdoZW4gdGhlIGRldmlj
ZSB3YXMgYWRkZWQgKndpdGhvdXQqIGlkPS4uLj8gIERldmljZVN0YXRlDQo+IG1lbWJlciBAaWQg
aXMgbnVsbCB0aGVuLg0KDQpJ4oCZbSBzb3JyeSwgdGhlIEBpZCBtZW1iZXIgaW4gdGhlIGV2ZW50
IGlzIHRoZSBzYW1lIGFzIERldmljZVN0YXRlLT5pZCwgYnV0DQppdOKAmXMgbm90IGRpcmVjdGx5
IGRlcml2ZWQgZnJvbSBpdC4gSXQgZGVyaXZlZCBmcm9tICBWZnVPYmplY3QtPmRldmljZSwgd2hp
Y2ggaXMNCmEgcHJvcGVydHkgb2YgVFlQRV9WRlVfT0JKRUNUIHRoYXQgdGhlIHVzZXIgc2V0cy4N
Cg0KVGhpcyB3aWxsIG5vdCBiZSBOVUxMLCBhcyAgVFlQRV9WRlVfT0JKRUNUIHdpbGwgbm90IGlu
aXRpYWxpemUgd2l0aG91dCBpdC4NCg0KPiANCj4gSSBmaWd1cmUgd2UgbmVlZCB0byBtYWtlIEBk
ZXZpY2Ugb3B0aW9uYWwgaGVyZSwgcHJlc2VudCBpZiB0aGUgZGV2aWNlDQo+IGhhcyBhbiBJRC4g
IEkgcmVjb21tZW5kIHRvIGFsc28gYWRkIGEgbWVtYmVyIEBxb20tcGF0aCwgbGlrZSB3ZSBkaWQg
Zm9yDQo+IE1FTU9SWV9ERVZJQ0VfU0laRV9DSEFOR0UgaW4gY29tbWl0IGQ4OWRkMjhmMGUyLg0K
DQpPSywgd2lsbCBhZGQgaXQuDQoNClRoYW5rIHlvdSENCi0tDQpKYWcNCg0KPiANCg0K

