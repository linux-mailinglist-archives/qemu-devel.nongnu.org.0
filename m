Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF405F79F5
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 16:51:43 +0200 (CEST)
Received: from localhost ([::1]:40710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogohR-0002zD-HQ
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 10:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ogmbr-0005xw-Uw; Fri, 07 Oct 2022 08:37:47 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:20928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ogmbn-0004J4-N2; Fri, 07 Oct 2022 08:37:45 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 297BwtUP003431;
 Fri, 7 Oct 2022 12:37:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=V5IwUkK3W3ZLSlhGARSz1fKHyA++/55O6X+mvkb2qqM=;
 b=JOaBzns/SZYTRDWf7Jq9+4PkHOYvq3VXv2dYnTafhGoIdLi/xbzDK7R/mSslpWopE/oA
 etEh11ZPjvLcLM9P6GvwEFDVhF7nhad5e937EjJNbPa5NXWxTVgg06U2C95rAroqelbE
 mgxhK9ChdwOxTuV2bm6v18uY8VqlQVb53hIW2lRTxL3jwO+3vH/aRg9+X1Tvp0VkLnJ3
 BSZk4X9tt3/8e/jTMaJAo+6KopSIZPeA/qFviLN2BWZXtRT1iSBIU6Qv/G4saW22sYmH
 4jBAltVC8T+I6Dx2Ws9abDhQ2CplZElL/mQAYPqeTMWtyW/vs2imR+lCIbXJvY5GFptu gA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k15up69a1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Oct 2022 12:37:39 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 297CGwca002798; Fri, 7 Oct 2022 12:37:38 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jxc0d4p1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Oct 2022 12:37:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q4RSiuS4S07TpLWOD6zmzye00ShduY1kVxugg48H0M31eH52Sh9QolGk6H2hg0rEB9iqxrE5aL/kDNn/63TneJVcVoN1JDD79r3RCjFUF4jqqf+GEkR2r3qenZYmdnS/Q3QLqGnMdyAwFeBCgvfHOfFW5jIJwLGwkQD2BB5uXLo0d6wppvV3ptCisNJM1/WiFeOJSlUlgqssvMqfwN91S/NxFt9bzJciGy/hIy1ZBP28INVX3cAxnvlKd3JrAElv6JDcGrfOHL2xhOUHbWKFbU3lgH+YlRPDYIdX8XMmYWSMZOsQRp+EroIATpjjdVHzL9Ym05HC4hphGkPeDQmO9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5IwUkK3W3ZLSlhGARSz1fKHyA++/55O6X+mvkb2qqM=;
 b=QEGW7aB80s1jLd7VVVCldQULx0oVAPsYRFKjTPpzuEzunSJmAsx7PQa8rrfYcX3clabfOrHiTqWCDAYkVgZOaDf+8syo2kELf6bybzu8emgP3FU2aVAOlquLpwfNuOwIRveyVKqZ9obAyPvylxAJ/1X7cI0mv3xoh+pYrrVN61w6YH9ZZurfBmcBVmXimZuNPVjr6D80dVTJzwSNxZ0EwZOLfFCGdeiFfNVMTpQWCa/4cWWvnGDeLaNODMhMj2aZrPpI+wxYHI30sCHoBUSA22+tpqFBQ10V81qSzMUV6tehdH2Nd74Jzu8krJCRYt6C3ppxM5th7G2CGiqxvAHNbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5IwUkK3W3ZLSlhGARSz1fKHyA++/55O6X+mvkb2qqM=;
 b=m2g3M8yZ/Vk99skx0u2ed5StMmWHHLoR+EwWeN5fX8yF4l35Jom2CKiyTR62mcrTuAE5AdYPGxCvUHeDjiaG/JAezuNkCZZHpzFaii0kQLA1jh2ggEmZcsXMkGvvj86qBNnPs45sMJ1CX0U1k34pIwmSuZP9nyn6v1iVbrqW/jE=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by SJ0PR10MB4431.namprd10.prod.outlook.com (2603:10b6:a03:2dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Fri, 7 Oct
 2022 12:37:36 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::4c04:3c29:4a50:d882]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::4c04:3c29:4a50:d882%6]) with mapi id 15.20.5709.015; Fri, 7 Oct 2022
 12:37:36 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: Ani Sinha <ani@anisinha.ca>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "mst@redhat.com" <mst@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>, "shannon.zhaosl@gmail.com"
 <shannon.zhaosl@gmail.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>
Subject: Re: [External] : Re: [RFC PATCH 2/4] acpi: fadt: support revision 6.0
 of the ACPI specification
Thread-Topic: [External] : Re: [RFC PATCH 2/4] acpi: fadt: support revision
 6.0 of the ACPI specification
Thread-Index: AQHY2Z7fBUqmnCI0W06jBgoLWvfb4q4CVn6AgACJagA=
Date: Fri, 7 Oct 2022 12:37:35 +0000
Message-ID: <655F321B-3E2A-406D-B276-8F18010125D8@oracle.com>
References: <20221006161450.69912-1-miguel.luis@oracle.com>
 <20221006161450.69912-3-miguel.luis@oracle.com>
 <9ad43c7f-7b79-a397-9a4f-61abb3b7fa53@anisinha.ca>
In-Reply-To: <9ad43c7f-7b79-a397-9a4f-61abb3b7fa53@anisinha.ca>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB5433:EE_|SJ0PR10MB4431:EE_
x-ms-office365-filtering-correlation-id: b6a2561e-6f26-486b-1a06-08daa860b6a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R7UqY0Crz71KGGmmmUdROnOB0fwf0/OEAKGVlCf7odZfakBv7eAbgZRpUp4Bp4rI/eAAaV2/SqU/PAF7VoAr5dGYzQ7V2S3mA47fJaoZ9tarT+vACrlMKL8FB3WmZb22BODacY8DbaZWMgMmaARxmtXynb1THJ9kk2oNX/zxdX8pxv5ntFO3vsC+S/NoavX5bFhTdRgndFVrN2i+EE056GWdG+mFtOAR4g1pAuWTpfH4jauW1Xle+WbIH+b1FZ8oDzvCIJF1mEEq0FM0dbprz4lOa+Mkzceqnr80EL3eKH+gVlRy2HZIlZ5V+Ai1ZezBUYRxKg/pexXKcnjjGHDXX0K74aFyXPW7XPaoObTnmW6uvXS3sVa7inXHLMbd9QzPP6zqEDGKz/PyiWW0oEQYcqFrP9y8kzMp04WNUM86Al1zK+NbmqHqwXzA6VXh/nIrBWZfdqeh5YOEHozfxUhmIqpjZXKvkfCa769ZIcoFBiidp0a68VVy8I3Vs/7FYpOTDiDKZj/f1DbTcnvnhjaQLOifCO0fO0PCzzzQKKCNpoaL0vbpkHMrwu2sZ9tCARhTpUiFWu3zqGVdQNs5mbopwESgZKmZJ/XK9nxZtbJeIHcHxtfwMA82KSVSXshGRhljLzt5vAXHpOxqMmAkmX1IPyBf8rTVRDb1EKirRwgLCihnx8L+ugQGIO8dkAVEP1mJOn2wPKuD9FMQ3oLRY2TKKjrfZCb4pAbirzHWME8WZgRGU976u1Lyo11MsD+bbQVcyb3SxWyW2Kx4FRQXLBSJ6ocjBeu8r9XzHHTalWUio+I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5433.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199015)(186003)(38100700002)(2616005)(33656002)(38070700005)(122000001)(86362001)(91956017)(66476007)(66556008)(4326008)(478600001)(6916009)(8936002)(44832011)(41300700001)(71200400001)(83380400001)(316002)(8676002)(6486002)(54906003)(64756008)(5660300002)(6512007)(2906002)(53546011)(76116006)(6506007)(66946007)(66446008)(36756003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WlRhQS9zRGp2QS9GZlJxL0FPd3FTMUNNejlzMCsxcnpXRmRMbmsyVjRXUlJj?=
 =?utf-8?B?Q1plRHNEMXZNMHVlaFl5TTVUNVZ2MWlmMEh0Y09EbVdCbkJpUDh6aFdNY1Ro?=
 =?utf-8?B?a2IrTEhzNXJSa1NySDVpL3dKZUVDQ1JJUUsyc1dOcVU0cXdGR2oxT3VMTU9t?=
 =?utf-8?B?a1JLVVBCeTdrUk1Xc05iMDlSUC9FUmNRNmp3cm5pbWl6Z2piWTRMdUYyNHVn?=
 =?utf-8?B?cmlqaTBwbVpKemFKc1F2dWZpSi8wcUJhb3FQNzRLd0phelN2YmxoZlRIdjdX?=
 =?utf-8?B?b241czRqNVAyK3FuaW5sRjdwM0piZUZYUWd0UmVHenZvUUNGOEVMVlhMbkk0?=
 =?utf-8?B?ZGxrTWhrcXVXV2NVWTB6LzZKbXlOa3pxNDlBU1c5K0RqR0I2Yk1HR3dPUk9i?=
 =?utf-8?B?QVJTSlBtclF1dWtJUkdNSHFuMmpvbnlFb3R6TlVyL1kyQk1oZldjdXhIZ0R6?=
 =?utf-8?B?UDNuVWNLV3ljR0YzTC9DZTV0RGY0bllrNm93anQ2NjIxWFo0c0xIVCtCbGVq?=
 =?utf-8?B?MXhaZFdWQjh0UmxQdHRXTitZUXVGM1lmU3FGT20yQVd4ZFlrZDJWd0lVVDhP?=
 =?utf-8?B?Y212NlhCVEdlNEdFTHQ0and4Qi94cndZd1BRRE82OFh0MUF2MiswdnlNR3F1?=
 =?utf-8?B?VTJ6NDJJcWZRTkRGaGpNUnBGaDZjeUJNbmNBaDZsV1dFSXZnRXJpd1RhbXcw?=
 =?utf-8?B?bDBOdE1NcUJNK29YY0RaSGNwTVBlSEN0UVhUeHJ2bjZaeDZWZkpROTh6QVBN?=
 =?utf-8?B?dmZScjJKLzJGeWFXRjl6VUpmNHNURWV0UGhzcG5PaHNFdWw1Wk4rdlFFN0VR?=
 =?utf-8?B?aGNYTlVtWnp4cnkvbjBVZlIrSTFXTTh4bDFEeDY4aFJ0MDcxZVlVY1VYUTlS?=
 =?utf-8?B?aWRnbm82TC9XKy95RXJ3T1lqOWRUUHYwbmtUVUp0cmVqN2FWeEFUdVh3L2Rj?=
 =?utf-8?B?RHlFQjJjbHMxakxIWHZxeUNvQVZsVytOSG42aEsyVVVjTmFRdVU4UGl1Zml4?=
 =?utf-8?B?QTUrb3ZSREZvZDY2NTN4VlFIaVJuMjgwOHV1cTY2OWtCbTF1V25udlpyOE1z?=
 =?utf-8?B?WlVTTFhObGtFSFN3NDNRbTF3b1grTy8xR2pTUmRoS0xQanNBSHYyNStoNXhu?=
 =?utf-8?B?ZnRBNW40YSsxdVRzTnZCc0t5a3hLYkYwN3R1eWRLcWRtNTFtd08vLzQ4SGMr?=
 =?utf-8?B?NnpVYzRnSDBGUFNCOWd1bDE4MXQvc0RoRGRMVnNVeUMxN29NUVFPTjY3dlVI?=
 =?utf-8?B?Qjl5TUl1SzlGaGZIWEl5TVg1aWpqZTM5UzRwZWhQSHZiQ3I5NkpBSCtWREE5?=
 =?utf-8?B?MEhJZWV3dUZzb1M1dk41M0Vxd09Ka1VhakQyMmhRTFpHQXF2emhyQWxvSFBG?=
 =?utf-8?B?UDhpaWhZLzNuSWxsWUVYZlJGTU4wWVZ3VkEzdzRCNmtWcTAvaEdSRkZTdzVL?=
 =?utf-8?B?Nks0RnJ3N0JDRitXV2xoUGFaUXN6VUMwWFZocktlYVFIRE95YkdMT3lNSUdl?=
 =?utf-8?B?Q1M4Y2JuWU1mS1FpeGo1VmcwbkZxTC9uWUhHZUVnV3QwK2VYQ3ptQ0FwWW9L?=
 =?utf-8?B?UTlWWHVFNmpJWkg2Vnd1SzFrdjlSemlldjdCdytSMitiVUw3YWxLT2xEbGQr?=
 =?utf-8?B?Z0VYeWxNUi95ZGVxSS9jZjZUeGJuUEQwdUwzWURnMDZweENBMGhzcGRtUTVw?=
 =?utf-8?B?NUpIdHY4dGdyU2tVM0xIdHplZFBpdGJWWWFxUUszcmNBcjRQeUZvUUZEWGhC?=
 =?utf-8?B?a0FOOEZJdHBjcWp2M08wbEliMzI1SzdxRUZZWnlYWDB5ZzVUTW10ZnVZS1ZB?=
 =?utf-8?B?RzlOSkd4cWVwc2V0WXo3SXl5NkprRjFzWUlBWHR0alhlcGFSZ1BqK0RzYkJ3?=
 =?utf-8?B?RGRHNEZVYlo0LzVpMTZFeFhSUS9NT0FaQnpYUnRJVXViTFY3REM1Z1ZuNUJk?=
 =?utf-8?B?YUVSaWZxTXFlSmZJWFUySWxUNEF2c2VHSXVZeG5sVFN0RCtoV21RUTR4aWwx?=
 =?utf-8?B?bzNDdTRab3d1VEFjek5paU9VencvS1QwSFhkemRZQ1FoZHNmTElFWGdNS2Rh?=
 =?utf-8?B?d1k3Q2lsSHE5bThqVzQ5VmNiazFXZkRIVFhLNG84dGNUNW5ocDRrUlRpbGhu?=
 =?utf-8?B?ckZSa2dmcWpyNDdtVG55WXZFZFp1VFlnZ2ozS2xRczl2Mnhmem5vZFlSdjhL?=
 =?utf-8?Q?W7mosVxDhtnyUqT/l7yNGv0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <493FADC27F568A449E8FFDF23B5840F3@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a2561e-6f26-486b-1a06-08daa860b6a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 12:37:35.9994 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PP9CSWZmm3CGZrRSiRBVbLIWS1B2DtnWa50Y0jzndKOF98hKeWejRVRDTJfRZca9b/y9mYjhbSybGpKpA/fJ0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4431
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 mlxscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210070075
X-Proofpoint-GUID: L-soTY4wTiJ5_3LoTtPr7HRwwalc_1RO
X-Proofpoint-ORIG-GUID: L-soTY4wTiJ5_3LoTtPr7HRwwalc_1RO
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=miguel.luis@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgQW5pLA0KDQo+IE9uIDcgT2N0IDIwMjIsIGF0IDA0OjI1LCBBbmkgU2luaGEgPGFuaUBhbmlz
aW5oYS5jYT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIFRodSwgNiBPY3QgMjAyMiwgTWlndWVs
IEx1aXMgd3JvdGU6DQo+IA0KPj4gVXBkYXRlIHRoZSBGaXhlZCBBQ1BJIERlc2NyaXB0aW9uIFRh
YmxlIChGQURUKSB0byByZXZpc2lvbiA2LjAgb2YgdGhlIEFDUEkNCj4+IHNwZWNpZmljYXRpb24g
YWRkaW5nIHRoZSBmaWVsZCAiSHlwZXJ2aXNvciBWZW5kb3IgSWRlbnRpdHkiIHRoYXQgd2FzIG1p
c3NpbmcuDQo+PiANCj4+IFRoaXMgZmllbGQncyBkZXNjcmlwdGlvbiBzdGF0ZXMgdGhlIGZvbGxv
d2luZzogIjY0LWJpdCBpZGVudGlmaWVyIG9mIGh5cGVydmlzb3INCj4+IHZlbmRvci4gQWxsIGJ5
dGVzIGluIHRoaXMgZmllbGQgYXJlIGNvbnNpZGVyZWQgcGFydCBvZiB0aGUgdmVuZG9yIGlkZW50
aXR5Lg0KPj4gVGhlc2UgaWRlbnRpZmllcnMgYXJlIGRlZmluZWQgaW5kZXBlbmRlbnRseSBieSB0
aGUgdmVuZG9ycyB0aGVtc2VsdmVzLA0KPj4gdXN1YWxseSBmb2xsb3dpbmcgdGhlIG5hbWUgb2Yg
dGhlIGh5cGVydmlzb3IgcHJvZHVjdC4gVmVyc2lvbiBpbmZvcm1hdGlvbg0KPj4gc2hvdWxkIE5P
VCBiZSBpbmNsdWRlZCBpbiB0aGlzIGZpZWxkIC0gdGhpcyBzaGFsbCBzaW1wbHkgZGVub3RlIHRo
ZSB2ZW5kb3Incw0KPj4gbmFtZSBvciBpZGVudGlmaWVyLiBWZXJzaW9uIGluZm9ybWF0aW9uIGNh
biBiZSBjb21tdW5pY2F0ZWQgdGhyb3VnaCBhDQo+PiBzdXBwbGVtZW50YWwgdmVuZG9yLXNwZWNp
ZmljIGh5cGVydmlzb3IgQVBJLiBGaXJtd2FyZSBpbXBsZW1lbnRlcnMgd291bGQNCj4+IHBsYWNl
IHplcm8gYnl0ZXMgaW50byB0aGlzIGZpZWxkLCBkZW5vdGluZyB0aGF0IG5vIGh5cGVydmlzb3Ig
aXMgcHJlc2VudCBpbg0KPj4gdGhlIGFjdHVhbCBmaXJtd2FyZS4iDQo+PiANCj4+IEhlcmV1cG9u
LCB3aGF0IHNob3VsZCBhIHZhbGlkIGlkZW50aWZpZXIgb2YgYW4gSHlwZXJ2aXNvciBWZW5kb3Ig
SUQgYmUgYW5kDQo+PiB3aGVyZSBzaG91bGQgUUVNVSBwcm92aWRlIHRoYXQgaW5mb3JtYXRpb24/
DQo+PiANCj4+IE9uIHRoaXMgUkZDIHRoZXJlJ3MgdGhlIHN1Z2dlc3Rpb24gb2YgaGF2aW5nIHRo
aXMgaW5mb3JtYXRpb24gaW4gc3luYyBieSB0aGUNCj4+IGN1cnJlbnQgYWNjZWxlcmF0aW9uIG5h
bWUuIFRoaXMgYWxzbyBzZWVtcyB0byBpbXBseSB0aGF0IFFFTVUsIHdoaWNoIGdlbmVyYXRlcw0K
Pj4gdGhlIEZBRFQgdGFibGUsIGFuZCB0aGUgRkFEVCBjb25zdW1lciBuZWVkIHRvIGJlIGluIHN5
bmMgd2l0aCB0aGUgdmFsdWVzIG9mIHRoaXMNCj4+IGZpZWxkLg0KPj4gDQo+PiBTaWduZWQtb2Zm
LWJ5OiBNaWd1ZWwgTHVpcyA8bWlndWVsLmx1aXNAb3JhY2xlLmNvbT4NCj4+IC0tLQ0KPj4gaHcv
YWNwaS9hbWwtYnVpbGQuYyAgICAgIHwgMTQgKysrKysrKysrKystLS0NCj4+IGh3L2FybS92aXJ0
LWFjcGktYnVpbGQuYyB8IDEwICsrKysrLS0tLS0NCj4+IDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5z
ZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL2h3L2FjcGkv
YW1sLWJ1aWxkLmMgYi9ody9hY3BpL2FtbC1idWlsZC5jDQo+PiBpbmRleCBlNmJmYWM5NWM3Li41
MjU4YzRhYzY0IDEwMDY0NA0KPj4gLS0tIGEvaHcvYWNwaS9hbWwtYnVpbGQuYw0KPj4gKysrIGIv
aHcvYWNwaS9hbWwtYnVpbGQuYw0KPj4gQEAgLTMxLDYgKzMxLDcgQEANCj4+ICNpbmNsdWRlICJo
dy9wY2kvcGNpX2J1cy5oIg0KPj4gI2luY2x1ZGUgImh3L3BjaS9wY2lfYnJpZGdlLmgiDQo+PiAj
aW5jbHVkZSAicWVtdS9jdXRpbHMuaCINCj4+ICsjaW5jbHVkZSAicWVtdS9hY2NlbC5oIg0KPj4g
DQo+PiBzdGF0aWMgR0FycmF5ICpidWlsZF9hbGxvY19hcnJheSh2b2lkKQ0KPj4gew0KPj4gQEAg
LTIwNzAsNyArMjA3MSw3IEBAIHZvaWQgYnVpbGRfcHB0dChHQXJyYXkgKnRhYmxlX2RhdGEsIEJJ
T1NMaW5rZXIgKmxpbmtlciwgTWFjaGluZVN0YXRlICptcywNCj4+ICAgICBhY3BpX3RhYmxlX2Vu
ZChsaW5rZXIsICZ0YWJsZSk7DQo+PiB9DQo+PiANCj4+IC0vKiBidWlsZCByZXYxL3JldjMvcmV2
NS4xIEZBRFQgKi8NCj4+ICsvKiBidWlsZCByZXYxL3JldjMvcmV2NS4xL3JldjYuMCBGQURUICov
DQo+PiB2b2lkIGJ1aWxkX2ZhZHQoR0FycmF5ICp0YmwsIEJJT1NMaW5rZXIgKmxpbmtlciwgY29u
c3QgQWNwaUZhZHREYXRhICpmLA0KPj4gICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm9lbV9p
ZCwgY29uc3QgY2hhciAqb2VtX3RhYmxlX2lkKQ0KPj4gew0KPj4gQEAgLTIxOTMsOCArMjE5NCwx
NSBAQCB2b2lkIGJ1aWxkX2ZhZHQoR0FycmF5ICp0YmwsIEJJT1NMaW5rZXIgKmxpbmtlciwgY29u
c3QgQWNwaUZhZHREYXRhICpmLA0KPj4gICAgIC8qIFNMRUVQX1NUQVRVU19SRUcgKi8NCj4+ICAg
ICBidWlsZF9hcHBlbmRfZ2FzX2Zyb21fc3RydWN0KHRibCwgJmYtPnNsZWVwX3N0cyk7DQo+PiAN
Cj4+IC0gICAgLyogVE9ETzogZXh0cmEgZmllbGRzIG5lZWQgdG8gYmUgYWRkZWQgdG8gc3VwcG9y
dCByZXZpc2lvbnMgYWJvdmUgcmV2NSAqLw0KPj4gLSAgICBhc3NlcnQoZi0+cmV2ID09IDUpOw0K
Pj4gKyAgICBpZiAoZi0+cmV2IDw9IDUpIHsNCj4gDQo+IDw9IGRvZXMgbm90IG1ha2Ugc2Vuc2Uu
IEl0IHNob3VsZCBiZSBmLT5yZXYgPT0gNS4NCj4gVGhlIHByZXZpb3VzIGNvZGUgY29tcGFyZXMg
Zi0+cmV2IDw9IDQgc2luY2UgaXQgbmVlZHMgdG8gY292ZXIgcmV2aXNpb25zDQo+IDIsIDMgYW5k
IDQuDQo+IA0KDQpJbmRlZWQsIHRoYXTigJlzIHJpZ2h0LiBJIHdpbGwgZml4Lg0KDQo+PiArICAg
ICAgICBnb3RvIGRvbmU7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgLyogSHlwZXJ2aXNvciBW
ZW5kb3IgSWRlbnRpdHkgKi8NCj4+ICsgICAgYnVpbGRfYXBwZW5kX3BhZGRlZF9zdHIodGJsLCBj
dXJyZW50X2FjY2VsX25hbWUoKSwgOCwgJ1wwJyk7DQo+IA0KPiBJIGRvIG5vdCB0aGluayB0aGUg
dmVuZG9yIGlkZW50aXR5IHNob3VsZCBjaGFuZ2UgYmFzZWQgb24gdGhlIGFjY2VsZXJhdG9yLg0K
PiBUaGUgYWNjZWxlcmF0b3IgUUVNVSB1c2VzIHNob3VsZCBiZSBoaWRkZW4gZnJvbSB0aGUgZ3Vl
c3QgT1MgYXMgZmFyIGFzDQo+IHBvc3NpYmxlLiBJIHdvdWxkIHN1Z2dlc3QgYSBzdHJpbmcgbGlr
ZSAiUUVNVSIgZm9yIHZlbmRvciBJRC4NCj4gDQoNClRoYW5rIHlvdSBmb3IgdGhlIHN1Z2dlc3Rp
b24gQW5pLiBJIHdpbGwgc3BpbiB0aGUgbmV4dCB2ZXJzaW9uIHdpdGggaXQuDQoNClRoYW5rcywN
Ck1pZ3VlbA0KDQo+PiArDQo+PiArICAgIC8qIFRPRE86IGV4dHJhIGZpZWxkcyBuZWVkIHRvIGJl
IGFkZGVkIHRvIHN1cHBvcnQgcmV2aXNpb25zIGFib3ZlIHJldjYgKi8NCj4+ICsgICAgYXNzZXJ0
KGYtPnJldiA9PSA2KTsNCj4+IA0KPj4gZG9uZToNCj4+ICAgICBhY3BpX3RhYmxlX2VuZChsaW5r
ZXIsICZ0YWJsZSk7DQo+PiBkaWZmIC0tZ2l0IGEvaHcvYXJtL3ZpcnQtYWNwaS1idWlsZC5jIGIv
aHcvYXJtL3ZpcnQtYWNwaS1idWlsZC5jDQo+PiBpbmRleCA5YjNhZWUwMWJmLi43MmJiNmY2MWE1
IDEwMDY0NA0KPj4gLS0tIGEvaHcvYXJtL3ZpcnQtYWNwaS1idWlsZC5jDQo+PiArKysgYi9ody9h
cm0vdmlydC1hY3BpLWJ1aWxkLmMNCj4+IEBAIC04MDksMTMgKzgwOSwxMyBAQCBidWlsZF9tYWR0
KEdBcnJheSAqdGFibGVfZGF0YSwgQklPU0xpbmtlciAqbGlua2VyLCBWaXJ0TWFjaGluZVN0YXRl
ICp2bXMpDQo+PiB9DQo+PiANCj4+IC8qIEZBRFQgKi8NCj4+IC1zdGF0aWMgdm9pZCBidWlsZF9m
YWR0X3JldjUoR0FycmF5ICp0YWJsZV9kYXRhLCBCSU9TTGlua2VyICpsaW5rZXIsDQo+PiArc3Rh
dGljIHZvaWQgYnVpbGRfZmFkdF9yZXY2KEdBcnJheSAqdGFibGVfZGF0YSwgQklPU0xpbmtlciAq
bGlua2VyLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIFZpcnRNYWNoaW5lU3RhdGUg
KnZtcywgdW5zaWduZWQgZHNkdF90Ymxfb2Zmc2V0KQ0KPj4gew0KPj4gLSAgICAvKiBBQ1BJIHY1
LjEgKi8NCj4+ICsgICAgLyogQUNQSSB2Ni4wICovDQo+PiAgICAgQWNwaUZhZHREYXRhIGZhZHQg
PSB7DQo+PiAtICAgICAgICAucmV2ID0gNSwNCj4+IC0gICAgICAgIC5taW5vcl92ZXIgPSAxLA0K
Pj4gKyAgICAgICAgLnJldiA9IDYsDQo+PiArICAgICAgICAubWlub3JfdmVyID0gMCwNCj4+ICAg
ICAgICAgLmZsYWdzID0gMSA8PCBBQ1BJX0ZBRFRfRl9IV19SRURVQ0VEX0FDUEksDQo+PiAgICAg
ICAgIC54ZHNkdF90Ymxfb2Zmc2V0ID0gJmRzZHRfdGJsX29mZnNldCwNCj4+ICAgICB9Ow0KPj4g
QEAgLTk0NSw3ICs5NDUsNyBAQCB2b2lkIHZpcnRfYWNwaV9idWlsZChWaXJ0TWFjaGluZVN0YXRl
ICp2bXMsIEFjcGlCdWlsZFRhYmxlcyAqdGFibGVzKQ0KPj4gDQo+PiAgICAgLyogRkFEVCBNQURU
IFBQVFQgR1REVCBNQ0ZHIFNQQ1IgREJHMiBwb2ludGVkIHRvIGJ5IFJTRFQgKi8NCj4+ICAgICBh
Y3BpX2FkZF90YWJsZSh0YWJsZV9vZmZzZXRzLCB0YWJsZXNfYmxvYik7DQo+PiAtICAgIGJ1aWxk
X2ZhZHRfcmV2NSh0YWJsZXNfYmxvYiwgdGFibGVzLT5saW5rZXIsIHZtcywgZHNkdCk7DQo+PiAr
ICAgIGJ1aWxkX2ZhZHRfcmV2Nih0YWJsZXNfYmxvYiwgdGFibGVzLT5saW5rZXIsIHZtcywgZHNk
dCk7DQo+PiANCj4+ICAgICBhY3BpX2FkZF90YWJsZSh0YWJsZV9vZmZzZXRzLCB0YWJsZXNfYmxv
Yik7DQo+PiAgICAgYnVpbGRfbWFkdCh0YWJsZXNfYmxvYiwgdGFibGVzLT5saW5rZXIsIHZtcyk7
DQo+PiAtLQ0KPj4gMi4zNy4zDQo+PiANCj4+IA0KDQo=

