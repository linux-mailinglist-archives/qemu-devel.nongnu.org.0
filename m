Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAA54EB466
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 22:03:32 +0200 (CEST)
Received: from localhost ([::1]:52404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZI3v-0000xv-BM
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 16:03:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nZHzi-0006yd-9T
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 15:59:10 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:21190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nZHze-0005Fn-0P
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 15:59:08 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22TJTTW9021185; 
 Tue, 29 Mar 2022 19:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=0n8HlE1wa12qk7BBQ3N/8Np8EPbBf5jqt9JeF0LgSXo=;
 b=hIVviVHZAciljszUEVgdn/6jILB7xAhBKlxwg5XeqxCCpTr+2lbFt6DexNlXno7quADE
 oDzlUVmZoxw4tG+IwBw6sgC7Z+rYDtj91cb7PwKLWnKlRXDk1EH1ZDI0hKWa9idcaUAX
 2rORFpD/73zKwFJE6xuMy5ld6LoFCv7ATwz1sTdATKnswH8Gezf3PW6SeUR64haKFTvH
 2/aQpsbjBf2BmAzrycEgNCDrow7Udgi2zRUY2nTpo8Ru3tzlguvgxbF2J8PbwRPVtjyT
 b/IEllXxLuyJwMpZk5a+PE3jHUhQkfD6uG4fHOBM81JMfbuW5bJoqL2+GSotV+zNaOjB Dw== 
Received: from aserp3030.oracle.com ([141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1terymve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Mar 2022 19:58:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22TJutpW092725;
 Tue, 29 Mar 2022 19:58:54 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by aserp3030.oracle.com with ESMTP id 3f1rv8dq7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Mar 2022 19:58:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pp2J/bhmPehbsHYy20jqqDStK5xlaJaM93FIzgra0XoitEAQFFOyfS1NIyTRYJGFOzjeBqRRV6+qHt31oH48DVIj7TGnRcqLtwHt5qpqzkyIy3GGDAOmwNJve/QoPQGSdaOHV9mod7M29XC1u6gi2MiIKpscQpgOa7hJ4hQkcACjJoD7JAuMLNCRWcq4kHvGpm0MlficyEwIGnptafTRpGuPtBbVC0vULe0dgilc5rAHqLkhpAhRGzs4llaRYoDh5KsSp8qcu0iWjHTu+e8+87jJi7YB2T5S7EYemHDdf7binsD3fyAjmEty7hHAVS3oglezehX3YVgZFdQ/GRztXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0n8HlE1wa12qk7BBQ3N/8Np8EPbBf5jqt9JeF0LgSXo=;
 b=Ou9rjgCupJIpwE1R28WwrUdjERr5P7z99LSbaI2wi6eCkMwo9kGnuVca0QLOFe+d7k+ZEkcn7DHrslSClZoU/J4+1X18WCGlyoNpRSrR9MG3bmLvwlkY2yxksLNGYdjTpnkSvY8mP2soXKUdeXF8WYtzBOTy4KaNhTw96egMoDXw3w3RGlKg0+aLqqRmtOGXdNROtqbvr7KsU0TEQ048x9N0QtRVtdKNUfF7EulSaji8yE7kcDY8bLmg0Wg4Dwo+61OLTelIfV1a+TcSagDqbG2ksk3sSAGsxKFMzD65/No7MWmTfT6/As94b4JUAtUus0wGf8JAZiBscipt6QGXZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0n8HlE1wa12qk7BBQ3N/8Np8EPbBf5jqt9JeF0LgSXo=;
 b=EGqHSBP+ekvbLoOKUz4iVboPoQRUvls7JcYWxcV9isNeqdFodx02UbmTwrJvVfASfFwIGvrM1ZR63+M9uY6vcaRw9fcR6c+ZcpjYlLOMDXUSkU+lAz3fqsjmI+zsWrWSkKTeoy3iGTtz5TLSCtFhguBP3TXtb8eRizAh2g9NTpw=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by PH0PR10MB4726.namprd10.prod.outlook.com (2603:10b6:510:3d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Tue, 29 Mar
 2022 19:58:52 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5123.016; Tue, 29 Mar 2022
 19:58:52 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v7 12/17] vfio-user: IOMMU support for remote device
Thread-Topic: [PATCH v7 12/17] vfio-user: IOMMU support for remote device
Thread-Index: AQHYQH1dtH36jxsvk0ChB2A9jkjfZazWUfCAgAAbLgCAAAnkAIAAVtQA
Date: Tue, 29 Mar 2022 19:58:51 +0000
Message-ID: <7022E4C4-D71A-4A6E-A5D8-222A9462654C@oracle.com>
References: <cover.1648234157.git.jag.raman@oracle.com>
 <2fdb90acd40a1f79d571d4e68c56e6b08aded60d.1648234157.git.jag.raman@oracle.com>
 <YkL9C+oMUSav9y95@stefanha-x1.localdomain>
 <AC3FD7EB-773E-4684-9A86-176EDDAC135D@oracle.com>
 <YkMcJDFVFu/fW/a5@stefanha-x1.localdomain>
In-Reply-To: <YkMcJDFVFu/fW/a5@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f506a549-2a6e-42b0-ccb1-08da11be8c3d
x-ms-traffictypediagnostic: PH0PR10MB4726:EE_
x-microsoft-antispam-prvs: <PH0PR10MB4726FC6A13A4FC2267214C1F901E9@PH0PR10MB4726.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B97MdfgIGNPk7bdlN3pLMmRTfWjxISSaHdNgD8I3jgbhD9iO0CsFmD2kPdnXGuPcSo7alyLYmWNuBkzaVBZbyUDgxAUIUgSYTGxpytfgWOdFOckqOhcENiwDEPQEgAtaIKvynUVtE4+MhKN/XTxfTEhDNPQAoNWVKlTEr+YYEtOswV9lFreIBDJnqxe3X45qAK+8yyis7UsN1GdZnwqKca0W6h/T5Px3gs3fTH60Qg2hUOg1+FNrKJR2BOmeF4M2iRj9nuMuRSZcsgNWOriTncfBcNHekRVlNlvl4Efw7If8U9nBlX95bOkeMhMvfxPbL0W7utY5O8oyRc8yUkOuiaEOkwxW15sRTnUikyqQQzCQ9hoyX3IIbHN0upA2E0z+A03oj2vXB127XeQ2NE2MFs5jBt/GXEXgtkihKbuju6Lmq9wBXrRxLSj5zTseaugRthm+j6yi7sSFN0lgyCnL4btdlaMn+SfF6kCrHQPaWvUAjRikcTxWnN3ZD+lMgUgAZwymh2cy88SvscT94DFijNbxThdTg+JOBk3OQt3eVrS82/lV5XnXDA/6GCm/Qzg3XDIPZp64LXToxj8FDHNdM8bMEAk5VtsNiAh52Omh/+VDH2WTFyAxDHwJ+qSSp9TK3i/YgBo0UixQbPKJqhTNMl/EDu2tE8vHpDHN4/N2u/J2TcsVRU/9tmfzyL54NPS8W9A7xmdXYYfotn54lypGJEQFHKhb/wDS157DamGhkMyaeBOoSZ428IGlWEzG+v0W
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(83380400001)(71200400001)(76116006)(6486002)(8676002)(186003)(6512007)(2906002)(36756003)(122000001)(66946007)(508600001)(91956017)(86362001)(6506007)(54906003)(2616005)(33656002)(6916009)(66446008)(38100700002)(38070700005)(316002)(53546011)(7416002)(8936002)(66556008)(66476007)(107886003)(64756008)(4326008)(44832011)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cTVib0Q1NGpvV1hWOGZ1WTcwWDM3TVFtN3A5ZHFoUzZQOTYrYk9Talozbysx?=
 =?utf-8?B?MTBDSVBTK01MbmNudFZvUWZwdndJL2xDVG85RHp6d29wN2NnRzd6UFB0MURt?=
 =?utf-8?B?N3pITEtEenVvcUh5RjErODRvNmJkWSs1QmtNUG5Tb2NzREF1dWpqb3p2RzVP?=
 =?utf-8?B?R0d0RlFUdzFPMVhoQjRHM1VRRWhDK2pRVWRWdmFMUmhRRnJzaXhPVTRqSUc0?=
 =?utf-8?B?UnpYbUcrUS9VbzRoL1VKSmV5aFpvMU5OeG1TaGl6RlhEdXNia3ZJTmNxczMy?=
 =?utf-8?B?cVVrcCtqb05hb001V3lzRWNpeWM5NFlEVHUwQ2dKNHV4N2tsOEU1ZmFlZ1hr?=
 =?utf-8?B?VzhsbU5CanBhZDVHbnBjWGhHM25EaHo5REhQWjkzTzdVVTM5cHA4bURSR2pC?=
 =?utf-8?B?cWtxb1BuK0RNRHA2amtVYm5EaFc3MWxVZWhlVFZrQ1p5TWZLY0JRYU1qUkc0?=
 =?utf-8?B?V1R6MFhHejhGOHE1bk1zWDF6TXlKNmdFSHNnMXozb3o5aC8rMTlXY1hrNFNW?=
 =?utf-8?B?YXpaZjdiUjBSS2pQTHQwbTNmS3N0ZS8wc2pNL3lyZjYvTU0rV2I0V3ZtcFRs?=
 =?utf-8?B?Wm1IZXpUdjBvSzdXWFJ5em5helBEQzdVc25VTkduUmhPSWxKY2lKYjQzMTF4?=
 =?utf-8?B?aVVETzI5Q2VLUHpUaDFPRkZnVExGcmoraVpjTk9aa1B1VFVtVVJhWjBjaG0x?=
 =?utf-8?B?YUdzZis3b1BVKysrSlIxU0xCRFVJaUVvUEN0cVpQL2dsOHkwZ0pweFdyQU9x?=
 =?utf-8?B?UnhqSXUydFNPT3dHYWxTNllkSVZWYkpVeUtuQmhVMlh5dkxZdExPVGRmZkhs?=
 =?utf-8?B?RUxKak9RUmRmd3ArV3pMeWFwVVhFUVk0TFNJTjNXZjNka2NwNm14cHdRbjly?=
 =?utf-8?B?dGRLN1dSMGZaemhPK3FWRGNoaWg1d2lTVVl5QTFJdVhCOUNUdGhTVmpZdHd0?=
 =?utf-8?B?eFQwS2RreHdVbWpmb05PaVBQak1lVHVCNGQ3cWlHUXlVaWNHdGlQUzg4djJJ?=
 =?utf-8?B?bjdPdHg0SXFIc1pNVHFhVTduamxYVlpRVHdhSmlVT1U1QjdzVnFJb2picGFX?=
 =?utf-8?B?K1Q2R1UzQTAvUmJkQlgwVE5WSGpjY0p5WGZUdDExSFpEbENtVGp5aDhWL1Jk?=
 =?utf-8?B?NFJ6TEdKcXZrT0E3RU9pSlkxdUhxQWlHVWEwU2FUM3FlcmtBeUJhM0ZqSDNY?=
 =?utf-8?B?SnprZmJ3WHRkNHNYdkNMdGVpRmxnOWZTY0VuVXo2VUtqd0pLTUJXSm5xUUFS?=
 =?utf-8?B?eEdTRWg4Qmp0L1FXa0RBejJDK1FKTGtBMmRzMFhERnpuQmM0dHp3K3BnQW1M?=
 =?utf-8?B?QS9oMVl0TFVuV1dSOFZCQmI0TXRtNmwrWmdXQzBCM0dXSTJ3VWVKQzAvemI0?=
 =?utf-8?B?WmlKWk1QVGs5am9XRjJ3bVhIK2crZXJJUlp3dUxlVmdLMTNCT3NVUVJ1M3c4?=
 =?utf-8?B?RDRNU2kvRDJZUlgrVEdvdk4xaWYzY3lRek1iaXF4bVhQdmFxeW1tMVQySG9k?=
 =?utf-8?B?bGhaUmRXZEF2UkdzbG1MY3p1Skl6eGdCYTNIdFA5Yzg5OEpGbGdhMDQ3MXRk?=
 =?utf-8?B?QkpESmorQ0VVcjlHSmtRYnpBN2J3bVVoQXpWQVpEMUlCUHJGTnJmZDVla3Vl?=
 =?utf-8?B?Y1hXN25DRzdRZFBzZTJieDJpZ0pyYXVIbnQxWlhwTTJEYmtxTG1lQk1sVndW?=
 =?utf-8?B?L2Z1ak1wQXhEcHB4N25pUjlmRTF6bFJvOTByOHNFTnZhcVdMYnh5b1hIZjdF?=
 =?utf-8?B?d2xtYkRQV2UrSjgyMm05NEpYNXU2Qm5ucmNGN2diNlhIZk0xVVl3NmF4S1hB?=
 =?utf-8?B?R1hXTEFNcnYwVDRKNGhydThzdHpxK0ZYUElTbm9pdjZPZ0NMc0R0aXBOb2lV?=
 =?utf-8?B?UU80NC9qSkR4QTBiZzhCZ1BVaW9RanZDbHVlRWlxZEZWMjdjNmtjTEhDK1V5?=
 =?utf-8?B?U29EQ2JXd0YrT1pwVDJINDE5bnZYQ2hDdk5wUGorbkdnbkNCQkRybU9JV3h1?=
 =?utf-8?B?T2RxODZtVFEySDFtczUrT3NtVW1nMTE2ZlV1dzA3Vldta1ZaS1BWWkZkLzhj?=
 =?utf-8?B?aWF3cEdHS3VHN0VzanRQNW92d1VxbGllK01qWnFKb1plUDlIZnQwN0hZMlFF?=
 =?utf-8?B?cGhJQ1ZZSnRsdzNvOXloMDNkME92a3BjOXAwdGRyVXJwWHZxQisybXB6L2VQ?=
 =?utf-8?B?K1pQVzFTd0ZwaVBFeGNiQWpReElNMWEwRjU1S0gxVHRVWW5PK2ZiOEsxUGgv?=
 =?utf-8?B?MUpSc1lJbVBDQXpZYmZDUUF1N3VsYVo4WTM1MXhNQkZ1T2dieXFSRnJrclVi?=
 =?utf-8?B?aHFad3FvMXhUMmRsZkpmb0RHQkVPVUFLckFtYW5mTm9udUNJNG8rVjFackdO?=
 =?utf-8?Q?lxYk9y6qp5IR5m64XMZvarPiguRaI53s4mdjV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF3A7D6CFBC31F4D97940BCE46BF2181@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f506a549-2a6e-42b0-ccb1-08da11be8c3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2022 19:58:51.9259 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kjft8Xn+yfsm6kSSZjCsvv73NiahJ71wh9tjZLbkPXt2GwYG86OK3vYrqVNOs5fFUUFKgip49R62WcCrSzZmQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4726
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10301
 signatures=695566
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 adultscore=0 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203290109
X-Proofpoint-GUID: O5Bju1aFrGs9EeiV4xZjVwz6oYgClUee
X-Proofpoint-ORIG-GUID: O5Bju1aFrGs9EeiV4xZjVwz6oYgClUee
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

DQoNCj4gT24gTWFyIDI5LCAyMDIyLCBhdCAxMDo0OCBBTSwgU3RlZmFuIEhham5vY3ppIDxzdGVm
YW5oYUByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIFR1ZSwgTWFyIDI5LCAyMDIyIGF0IDAy
OjEyOjQwUE0gKzAwMDAsIEphZyBSYW1hbiB3cm90ZToNCj4+PiBPbiBNYXIgMjksIDIwMjIsIGF0
IDg6MzUgQU0sIFN0ZWZhbiBIYWpub2N6aSA8c3RlZmFuaGFAcmVkaGF0LmNvbT4gd3JvdGU6DQo+
Pj4gT24gRnJpLCBNYXIgMjUsIDIwMjIgYXQgMDM6MTk6NDFQTSAtMDQwMCwgSmFnYW5uYXRoYW4g
UmFtYW4gd3JvdGU6DQo+Pj4+ICt2b2lkIHJlbW90ZV9pb21tdV9kZWxfZGV2aWNlKFBDSURldmlj
ZSAqcGNpX2RldikNCj4+Pj4gK3sNCj4+Pj4gKyAgICBpbnQgcGNpX2JkZjsNCj4+Pj4gKw0KPj4+
PiArICAgIGlmICghcmVtb3RlX2lvbW11X3RhYmxlLmVsZW1fYnlfYmRmIHx8ICFwY2lfZGV2KSB7
DQo+Pj4+ICsgICAgICAgIHJldHVybjsNCj4+Pj4gKyAgICB9DQo+Pj4+ICsNCj4+Pj4gKyAgICBw
Y2lfYmRmID0gUENJX0JVSUxEX0JERihwY2lfYnVzX251bShwY2lfZ2V0X2J1cyhwY2lfZGV2KSks
IHBjaV9kZXYtPmRldmZuKTsNCj4+Pj4gKw0KPj4+PiArICAgIHFlbXVfbXV0ZXhfbG9jaygmcmVt
b3RlX2lvbW11X3RhYmxlLmxvY2spOw0KPj4+PiArICAgIGdfaGFzaF90YWJsZV9yZW1vdmUocmVt
b3RlX2lvbW11X3RhYmxlLmVsZW1fYnlfYmRmLCBJTlQyVk9JRFAocGNpX2JkZikpOw0KPj4+PiAr
ICAgIHFlbXVfbXV0ZXhfdW5sb2NrKCZyZW1vdGVfaW9tbXVfdGFibGUubG9jayk7DQo+Pj4+ICt9
DQo+Pj4+ICsNCj4+Pj4gK3ZvaWQgcmVtb3RlX2NvbmZpZ3VyZV9pb21tdShQQ0lCdXMgKnBjaV9i
dXMpDQo+Pj4+ICt7DQo+Pj4+ICsgICAgaWYgKCFyZW1vdGVfaW9tbXVfdGFibGUuZWxlbV9ieV9i
ZGYpIHsNCj4+Pj4gKyAgICAgICAgcmVtb3RlX2lvbW11X3RhYmxlLmVsZW1fYnlfYmRmID0NCj4+
Pj4gKyAgICAgICAgICAgIGdfaGFzaF90YWJsZV9uZXdfZnVsbChOVUxMLCBOVUxMLCBOVUxMLCBy
ZW1vdGVfaW9tbXVfZGVsX2VsZW0pOw0KPj4+PiArICAgICAgICBxZW11X211dGV4X2luaXQoJnJl
bW90ZV9pb21tdV90YWJsZS5sb2NrKTsNCj4+Pj4gKyAgICB9DQo+Pj4+ICsNCj4+Pj4gKyAgICBw
Y2lfc2V0dXBfaW9tbXUocGNpX2J1cywgcmVtb3RlX2lvbW11X2ZpbmRfYWRkX2FzLCAmcmVtb3Rl
X2lvbW11X3RhYmxlKTsNCj4+PiANCj4+PiBXaHkgaXMgcmVtb3RlX2lvbW11X3RhYmxlIGdsb2Jh
bD8gSXQgY291bGQgYmUgcGVyLVBDSUJ1cyBhbmQgaW5kZXhlZCBieQ0KPj4+IGp1c3QgZGV2Zm4g
aW5zdGVhZCBvZiB0aGUgZnVsbCBCREYuDQo+PiANCj4+IEl04oCZcyBnbG9iYWwgYmVjYXVzZSBy
ZW1vdGVfaW9tbXVfZGVsX2RldmljZSgpIG5lZWRzIGl0IGZvciBjbGVhbnVwLg0KPiANCj4gQ2Fu
IHJlbW90ZV9pb21tdV9kZWxfZGV2aWNlKCkgdXNlIHBjaV9nZXRfYmlzKHBjaV9kZXYpLT5pcnFf
b3BhcXVlIHRvDQo+IGdldCB0aGUgcGVyLWJ1cyB0YWJsZT8NCg0KcGNpX2dldF9idXMocGNpX2Rl
diktPmlycV9vcGFxdWUgaXMgdXNlZCBmb3IgaW50ZXJydXB0cy4NCg0KUENJQnVzIGFscmVhZHkg
aGFzIGFuIGlvbW11X29wYXF1ZSwgd2hpY2ggaXMgYSBwcml2YXRlDQptZW1iZXIgb2YgdGhlIGJ1
cyBzdHJ1Y3R1cmUuIEl04oCZcyBwYXNzZWQgYXMgYW4gYXJndW1lbnQNCnRvIHRoZSBpb21tdV9m
bigpLg0KDQpXZSBjb3VsZCBhZGQgYSBnZXR0ZXIgZnVuY3Rpb24gdG8gcmV0cmlldmUgUENJQnVz
LT5pb21tdV9vcGFxdWUNCmluIHJlbW90ZV9pb21tdV9kZWxfZGV2aWNlKCkuIFRoYXQgd2F5IHdl
IGNvdWxkIGF2b2lkIHRoZSBnbG9iYWwgdmFyaWFibGUuDQoNClRoYW5rIHlvdSENCi0tDQpKYWcN
Cg0KPiANCj4gU3RlZmFuDQoNCg==

