Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F1247B931
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 05:33:32 +0100 (CET)
Received: from localhost ([::1]:50174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzWqB-0000TR-8b
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 23:33:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mzWox-0008E7-Bj
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 23:32:15 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:2928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mzWou-0003Gr-JV
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 23:32:15 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BKLn0r3024555; 
 Tue, 21 Dec 2021 04:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=jyC2Fnl+70so7/YvJoQAtwyKgPY3INIbu2G2uBZxpj4=;
 b=aEtUErZ2PFzjDdl+pbDEnFuAPrem09yJw6zWQhXxefatOZJtmS6Pf/ZLUAGElTYR/ITM
 BUgOPOUqB5U+qw8BIZ9bDji925cJi+vkvTLotHJDUGkIgISBnisbkwdR9ufGHHKTFtNI
 dBWxUsACHEb0sMhyzIP1rtGM40npjcL4Se/8QQEzr1ljD/WBVHP6pnpOHODzeqpUSPnT
 eOD8h7yTHxq8g1HB0kImcxGJEpfWnXUr+uBy8X65Xje5SFpQ75DJolzLAzwhpCwQSfi6
 Hc2eEHTQAVwYk8Tk4XyVfc4+aJbhgbmOlZmFHR8MSkG7BDADYA55iXhue53qCQ45XzSq Fw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d2q6ej9qb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Dec 2021 04:32:09 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BL4UheN011836;
 Tue, 21 Dec 2021 04:32:08 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by aserp3030.oracle.com with ESMTP id 3d15pcqwdd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Dec 2021 04:32:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4dTj7jAXHipC2Gpfdrr9a/c7KI3CJlBywk367360FHyXO9Ns7HVfkWAi6MAsz7ByrmQppD+JX9SsmM+9Hfz+pqxqlM4Xv6tJyQj6mhQFXyLzLQublYdkVSl76hlh42dnu6UpBT7c/I5Utk+Roj8+M2/o8j9MHUtgC5f+1dJxyyqsnI5/57jfMwtsF7E4tZgSVUg12GKffe+ULwyZceQYli+DxRLCsXWaG1A4sZnXSotVcjtzkmsdQZnDwHKYU4AK90A2YqpO3OD0H1UJf7oCc4t/H4d2Tas9GvP9n7274RGQouuNsPGWcdhEvoRHs7utsx8V+OccB2v5dOmA/sMYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyC2Fnl+70so7/YvJoQAtwyKgPY3INIbu2G2uBZxpj4=;
 b=Qu8x3/nbbCDOdZa3u9QLP4jtNiDq55m84xqpSyABxgahJTTgkPHoXunRFdS3W4QR0zdqDGV1GBKNNDj5sqfxfzB6KhVO104r/LaJlfVR49KvvFTXgdYpUvH7zcP+Ukb3XsijkZkHevxnNLLNo3J4mbNbKygMaYDOhZPpjTer05Ltc8V+psTMT2Cbl/Qx8VxJYjO3hhZ5vFwzc01aU+dLE9Ig6uT+R30Wu8lWqoZ/V1wRzrQG6FBW0fpBfGDTZCgBW5z9Kd+CZ7rrIUANSwMpUk8YxmAQK7Y78vNzdLcwHa68UYOpoAIMEVT7pU3uf6rKzuEPTggPA9LecSLQx5Q/JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyC2Fnl+70so7/YvJoQAtwyKgPY3INIbu2G2uBZxpj4=;
 b=jNFq5smWuo4bDf8huDRAlQexZWwB55Bbj4WIUch/2PkTQKYAuLMrkADSjho3eBxHicPdY+wiAnDcqfw+EdNlkHN0bu/pkfbD+Gjd9YZlGu/J3wPO2YdSyHvAylxSijP9d4L5RRH40C76HF2oWN9/vrq6IJqHyuekZc7yFeJwwPo=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3776.namprd10.prod.outlook.com (2603:10b6:208:1b5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Tue, 21 Dec
 2021 04:32:06 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%6]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 04:32:06 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4 11/14] vfio-user: IOMMU support for remote device
Thread-Topic: [PATCH v4 11/14] vfio-user: IOMMU support for remote device
Thread-Index: AQHX8YAr+zejmwtWn0Wfzyk3oNsVOaw1MriAgAHrx4CABFyPAIAA6VoA
Date: Tue, 21 Dec 2021 04:32:05 +0000
Message-ID: <D9E0A4CC-83E9-460F-BBB9-D5DABBA9ED19@oracle.com>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <acae079dec4261d762311b86a0e699ba9ad79737.1639549843.git.jag.raman@oracle.com>
 <YbtP2eaBnptogQDf@stefanha-x1.localdomain>
 <A2ABC44E-0EDA-4FDB-B3A4-64CE1AA84560@oracle.com>
 <YcCVBLdd/WtLR49h@stefanha-x1.localdomain>
In-Reply-To: <YcCVBLdd/WtLR49h@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c302f38-40f2-4277-c2c3-08d9c43ad804
x-ms-traffictypediagnostic: MN2PR10MB3776:EE_
x-microsoft-antispam-prvs: <MN2PR10MB3776B0473A159F197CD5EC38907C9@MN2PR10MB3776.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AWEDcXByb+TNXlbY26Cfu+pWpQVbpcx8htSJHCvPP/XiTMkmjdPTgNEajMgO/62DvEDXrS0C68nP0oULtT34PH8JF8YQ+AlC03IuD5nI8iSFitSF+ZbJ0aQ6APjHqYUGAoLFeZFzAZuTN2kRnkYgEWUbWNfEcG5Z0ScfNwBlloZ7rrQiWED0vebKHMrNi9sMyuml2qiPNQRofQoYvzGywXsK842X0KxH5ceZLTax3PI3psU1GKWwIiTxCxKisKXYgRuysdoZMePtGWR5ri2ssB5e6ptgpmdKoHHKfu/LRyyB/FNUjavQjZkTpnMp5LVDWsIPPBDmifKYfZ0geO36gVsbrPBgqn7K0EAA/nqg493Q7Gqcoh4v8f7Bz05OgEkWWV8yV1uoztI/6HfYTAqs9dKNLEjM/AA72KSAOxlWUlggLXEn/6DmRjOOrwrPTLiKl3OcDAzdStWEDUym1cLPfje/WQXjEr9c7xPYRXyV1DWTc3X6WcY9C22Oo0QjBsDpLMPLPriCYj66LGhQV4PbxxC2XUQvP1DuwMNVizPkRYfNwYztZMPifJ3anBRxuC0brhgw8kiIyHaocQ2CSxk1xN/EBOFtWWZB9pbq2XfAenMvWlRqGO5E/V9KVUrO5moeiP+HusUJy4qHGqSyxMIcLTV6jbj4LcWyUl13Yz64FgCV4vikjIbyyOJaBKtZZviS3BK4fJIobCFIYOcXMfqG4hDw/f7dPnolwMQu9RRNJXcF0OakP7T6ZG5wiSzCR8JV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(6506007)(6486002)(76116006)(6916009)(316002)(5660300002)(44832011)(122000001)(66556008)(38100700002)(91956017)(66476007)(64756008)(66946007)(36756003)(2616005)(33656002)(38070700005)(86362001)(4326008)(83380400001)(71200400001)(8676002)(7416002)(186003)(66446008)(6512007)(8936002)(508600001)(2906002)(54906003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmJ3NFhxSHFTOHRZWXVnMkppVlVnbnR2MG9rSktwNTk5TUs0N0ZPOGw5dzI3?=
 =?utf-8?B?T2JFZGZRMkl0b29BVW5XRG5wMVdzT3pJc0c2cHlOeUJtR0ZHV01uUkoxMjQ1?=
 =?utf-8?B?d0UyWm9JSzdUam1sYVVXamRKN2k3WnBsRWxFZnoyb0pUVTZaeDVtcnR0VlpR?=
 =?utf-8?B?QUVyQUtSQzVUdC9XZmU5M0g2aTk4amo4REx3U2duSk1SWkQrdjYwbjZrbzlM?=
 =?utf-8?B?bE9BVTIxZURjS01BWXlyZDYvNzNQRFpOZk5URGZIQ1YyYnFvUXZTS0N3RjVJ?=
 =?utf-8?B?SElYL0FZZ1VyVFFlQlc1SWY3OERtZFB6WTc0RkovdzVtVWNZS0FmRVpHd3dp?=
 =?utf-8?B?OGR2TzhUZEwvTU56WFZVaHhjOWFQem1RV3RBd0I2SU9ycEJLR2dORUFkbnBY?=
 =?utf-8?B?cW1mMDMxdmh2c1h1MnFFaHlpMzVTSjdITE1jKzloTjBWbmFQek9sS3RmK0Vo?=
 =?utf-8?B?SzFEa2RDbHI5T1dpdEhqLzQrTTJDM1VubW9kSlQwUFRLbWVTSkpvYW5OcGRD?=
 =?utf-8?B?RUY5U0RnMVdiOWFBRG5jMldpWEpCb2FEZDlBbG5rUHJPRERaS3hYbG9Lc0k5?=
 =?utf-8?B?MnIvSEY3SWhWY09JYmlFeVJNRW9WbDFseU14OTNDbUFVNXZJakhYQXdWU0ow?=
 =?utf-8?B?a2huSjZETVNQeWhsc2t6MzhjblpsWWtnSnQ4ZHYweHVZeVNCR29RUVpyRVlw?=
 =?utf-8?B?OHhHbU00MVJyNlZ1TmxNMTNhQzROYmgxRnpXeGoxSlh2dDQ0Qm9sTzZ4TVRJ?=
 =?utf-8?B?cXB1RU9JYlNac2xSTCtZdS8vb3h5QkRoSkY1YzJlNXAwTlZTRFRQMjJ6blIr?=
 =?utf-8?B?Q0lVeGlTZ1FybmRDMnRzUzRHaE5mUmVpUDB0NDVVMytYdS9Ib1h6NVB1VjZj?=
 =?utf-8?B?RjJ6OVpKQjU0NVVTT3FmempGalVkUjdpcFNpNTA2TEtTSU5PczJhNzBkMXRO?=
 =?utf-8?B?N3F1b2lrTVR2S25PUnIrbGVvNU1rc2NiUER2d1ZZZU0wMGt0cDcwY05BSlc0?=
 =?utf-8?B?ZVhaRS80QXUyU1Vqd1E0TXRGekY0ZWR3MmhFTEtaTUsvcDJObm9GU014MVBk?=
 =?utf-8?B?RGJ5ODVtVGdZclR1K1dubk1YTGxvUjNHcElLa2xLTEtYK2lOZmxDRUYwUW13?=
 =?utf-8?B?ZVFvenJDc2JobmdEaW93M2RZQW5DSXhtTm1BTHdKNkZiZ1VLeU14TXIrWjVn?=
 =?utf-8?B?S1RQbmNQSVhsSUZCenNzZUo4K0Z1UTJHZjBYN3I0R2Y4Mm9KelRWY1lPWW4v?=
 =?utf-8?B?U2UvNUlNTGNUSjBOSEpBMUJmMWhDSFZEb2gvVFp6MVFvNzJscnpjei9Pajll?=
 =?utf-8?B?SFYyanpDSnVZdWJ6TXdtOFBoc3lxMHNIZERpRUxId0lSRmpHWDdrQVpid3dL?=
 =?utf-8?B?NXl6d3ZKZ3JLcTJzVk9NajJ2RDRKemdGTTZ1TXFULzRta1RQVVorazFESHJQ?=
 =?utf-8?B?RWdEL211QXNRUW1RdnFCYlNGTmdNWjVRbjBSOSt1WGNrK01zazdqdEdWNkNU?=
 =?utf-8?B?QTUreXRrd1BHK2NBN1llVzYrZVZGUkF1K3kranYwZk9aclBYeDBTYmp5ekIy?=
 =?utf-8?B?Yk9RS0hCOTVyMFFma1dNQkx5Mi9ZWHBXUWptc3BXYkU4T3A2T2tHYk9lZ3Jn?=
 =?utf-8?B?M1k1VUsxQVI4d0QrejAxeldGU24zZFQ5TDZ2V3czV3hLdC9vZ2NNRnJPT1RF?=
 =?utf-8?B?UXVxRElOZzVRZHlZZHRKOU5ZSjVqbEszUE1BdlZ0QTdsalNMMkNaWjR2bW10?=
 =?utf-8?B?Nkk0QlNQMkEwQVA1NmJpUU1GWjRmeUplVkZSeUlhdVJoeEVvZTNnb2F4cXpt?=
 =?utf-8?B?NUFsam40U0djQTRPZzV1YUxSYjMzSzVQeEpCZ3lSRnlVam0vSm45R1VCWnBW?=
 =?utf-8?B?TGZ3T0U2ZUtSYzVNcUM5RC84OHhRZzJCYy8xUC9WMTNoQUV6VkZSQWpodmt5?=
 =?utf-8?B?K1ZWSWhZdFA5OFFlVkJKUGVLbytQcFJGZ1JHc3VrTzN2eUdwZmNuWGtmR3Np?=
 =?utf-8?B?Qi9qUWM1Nml6OGU3cFVWZ3hSY2VraEFCQkZtN3Q0Mk5ZemFDR2xNc0lVcW5u?=
 =?utf-8?B?d0U2ZjRWdzhGaHViMVI1R1J3UGNxdDd1N29OenpGeFNLL3FkYVdvS2NDbUFK?=
 =?utf-8?B?OEk2N2M0NFc3S3BOU0kvZXNKNEVVSlZaYitwbzBjdHJnYlNsOWFzd2V5Y1hV?=
 =?utf-8?B?ZWxDL3pyczRLNXk2My8ranNCK0IxZE1XV21CUEFWcGs2bGFVa3BQdFpUTWg2?=
 =?utf-8?B?bllBRTNXL080OWZ1dHFJYkNuYjZBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5FD9CD096EEC2042B99F9BDF1E5B0EAD@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c302f38-40f2-4277-c2c3-08d9c43ad804
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2021 04:32:05.9723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p0C8XWj2lmSJ53ps7SwjCH5q41nTwTH9/GWOLtv238O2Q7bQMOp+ykwdu/JhWtKAd+lGDuT2q6VJDnZb76eKvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3776
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10204
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 mlxscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112210020
X-Proofpoint-GUID: K8GYJ0-gBsSwdHcTq_VmLRnDPuDDj7hp
X-Proofpoint-ORIG-GUID: K8GYJ0-gBsSwdHcTq_VmLRnDPuDDj7hp
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "bleal@redhat.com" <bleal@redhat.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "wainersm@redhat.com" <wainersm@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 "crosa@redhat.com" <crosa@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRGVjIDIwLCAyMDIxLCBhdCA5OjM2IEFNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gRnJpLCBEZWMgMTcsIDIwMjEgYXQgMDg6
MDA6MzVQTSArMDAwMCwgSmFnIFJhbWFuIHdyb3RlOg0KPj4+IE9uIERlYyAxNiwgMjAyMSwgYXQg
OTo0MCBBTSwgU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPiB3cm90ZToNCj4+
PiANCj4+PiBPbiBXZWQsIERlYyAxNSwgMjAyMSBhdCAxMDozNTozNUFNIC0wNTAwLCBKYWdhbm5h
dGhhbiBSYW1hbiB3cm90ZToNCj4+Pj4gQXNzaWduIHNlcGFyYXRlIGFkZHJlc3Mgc3BhY2UgZm9y
IGVhY2ggZGV2aWNlIGluIHRoZSByZW1vdGUgcHJvY2Vzc2VzLg0KPj4+IA0KPj4+IElmIEkgdW5k
ZXJzdGFuZCBjb3JyZWN0bHkgdGhpcyBpc24ndCByZWFsbHkgYW4gSU9NTVUuIEl0J3MgYWJ1c2lu
ZyB0aGUNCj4+PiBJT01NVSBBUElzIHRvIGNyZWF0ZSBpc29sYXRlZCBhZGRyZXNzIHNwYWNlcyBm
b3IgZWFjaCBkZXZpY2UuIFRoaXMgd2F5DQo+Pj4gbWVtb3J5IHJlZ2lvbnMgYWRkZWQgYnkgdGhl
IHZmaW8tdXNlciBjbGllbnQgZG8gbm90IGNvbmZsaWN0IHdoZW4gdGhlcmUNCj4+PiBhcmUgbXVs
dGlwbGUgdmZpby11c2VyIHNlcnZlcnMuDQo+PiANCj4+IExpa2UgeW91IGFscmVhZHkgZmlndXJl
ZCBvdXQsIGhhdmluZyBpc29sYXRlZCBETUEgYWRkcmVzcyBzcGFjZSBhbG9uZSBpcyBub3QNCj4+
IHN1ZmZpY2llbnQgZm9yIHRoaXMgYXBwbGljYXRpb24sIHdlIGFsc28gbmVlZGVkIHRvIGlzb2xh
dGUgdGhlIHN5c21lbS9SQU0gYWRkcmVzcw0KPj4gc3BhY2UuIEFzIHN1Y2gsIHRoZSBhdmFpbGFi
bGUgSU9NTVUgQVBJcyBhbG9uZSB3ZXJlIG5vdCBzdWZmaWNpZW50LCBzbyB3ZSBoYWQNCj4+IHRv
IGltcHJvdmlzZS4NCj4+IA0KPj4+IA0KPj4+IENhbGxpbmcgcGNpX3Jvb3RfYnVzX25ldygpIGFu
ZCBrZWVwaW5nIG9uZSBQQ0kgYnVzIHBlciBWZnVPYmplY3QgbWlnaHQNCj4+PiBiZSBhIGNsZWFu
ZXIgYXBwcm9hY2g6DQo+Pj4gLSBMZXRzIHlvdSBpc29sYXRlIGJvdGggUENJIE1lbW9yeSBTcGFj
ZSBhbmQgSU8gU3BhY2UuDQo+Pj4gLSBJc29sYXRlcyB0aGUgUENJRGV2aWNlcyBhbmQgdGhlaXIg
YWRkcmVzc2VzIG9uIHRoZSBidXMuDQo+Pj4gLSBJc29sYXRlcyBpcnFzLg0KPj4+IC0gTm8gbW9y
ZSBuZWVkIHRvIGFidXNlIHRoZSBJT01NVSBBUEkuDQo+PiANCj4+IEkgYmVsaWV2ZSB3ZSB3b3Vs
ZCBzdGlsbCBuZWVkIHRvIGhhdmUgYW4gSU9NTVUuIEl04oCZcyBiZWNhdXNlLCBkZXZpY2VzIHVz
ZSB0aGUNCj4+IHBjaV9kbWFfcmVhZCgpL193cml0ZSgpIGZ1bmN0aW9ucy4gVGhlc2UgZnVuY3Rp
b25zIGxvb2sgdXAgdGhlIGFkZHJlc3MgaW4gRE1BDQo+PiBhZGRyZXNzIHNwYWNlICh2aWEgcGNp
X2dldF9hZGRyZXNzX3NwYWNlKCkgLT4gUENJRGV2aWNlLT5idXNfbWFzdGVyX2FzIC0+DQo+PiBQ
Q0lEZXZpY2UtPmJ1c19tYXN0ZXJfZW5hYmxlX3JlZ2lvbiAtPiBQQ0lEZXZpY2UtPmJ1c19tYXN0
ZXJfY29udGFpbmVyX3JlZ2lvbikuDQo+PiBidXNfbWFzdGVyX2VuYWJsZV9yZWdpb24gYW5kIGJ1
c19tYXN0ZXJfY29udGFpbmVyX3JlZ2lvbiBhcmUgZWZmZWN0aXZlbHkgYWxpYXNlcw0KPj4gdG8g
dGhlIERNQSBhZGRyZXNzIHNwYWNlIC0gd2l0aG91dCBhbiBJT01NVSwgdGhlIGRtYV9hcyB3b3Vs
ZCBiZSB0aGUgc2hhcmVkDQo+PiBnbG9iYWwgc3lzbWVtL1JBTSBzcGFjZSAoYWRkcmVzc19zcGFj
ZV9tZW0sIHBsZWFzZSBzZWUgcGNpX2luaXRfYnVzX21hc3RlcigpKQ0KPiANCj4gR29vZCBwb2lu
dCwgdGhhdCBjb2RlIGFzc3VtZXMgdGhlcmUgaXMgYSBnbG9iYWwgYWRkcmVzcyBzcGFjZS4gQ3Jl
YXRpbmcNCj4gYSBmYWtlIElPTU1VIHdvcmtzIGFyb3VuZCB0aGF0IGFzc3VtcHRpb24gYnV0IGl0
IHNlZW1zIGNsZWFuZXIgdG8NCj4gZWxpbWluYXRlIGl0Og0KPiANCj4gIEFkZHJlc3NTcGFjZSAq
cGNpX2RldmljZV9pb21tdV9hZGRyZXNzX3NwYWNlKFBDSURldmljZSAqZGV2KQ0KPiAgew0KPiAg
ICAgIC4uLg0KPiAgICAgIGlmICghcGNpX2J1c19ieXBhc3NfaW9tbXUoYnVzKSAmJiBpb21tdV9i
dXMgJiYgaW9tbXVfYnVzLT5pb21tdV9mbikgew0KPiAgICAgICAgICByZXR1cm4gaW9tbXVfYnVz
LT5pb21tdV9mbihidXMsIGlvbW11X2J1cy0+aW9tbXVfb3BhcXVlLCBkZXZmbik7DQo+ICAgICAg
fQ0KPiAgICAgIHJldHVybiAmYWRkcmVzc19zcGFjZV9tZW1vcnk7DQo+ICAgICAgICAgICAgICBe
Xl5eXl5eXl5eXl5eXl5eXl5eXg0KPiANCj4gV2hlbiBjcmVhdGluZyBhIFBDSSByb290IGJ1cyBh
biBBZGRyZXNzU3BhY2UgYXJndW1lbnQgY291bGQgYmUgcHJvdmlkZWQsDQo+IGp1c3QgbGlrZSBp
dCBhbHJlYWR5IGRvZXMgZm9yIHRoZSBhZGRyZXNzX3NwYWNlX21lbW9yeSBhbmQNCj4gYWRkcmVz
c19zcGFjZV9pbyBNZW1vcnlSZWdpb25zLiBUaGVuIHRoZSBoYXJkY29kZWQgcmV0dXJuIGNhbiBi
ZQ0KPiBjaGFuZ2VkIHRvIHNvbWV0aGluZyBsaWtlOg0KPiANCj4gIHJldHVybiBidXMtPmRtYV9h
ZGRyZXNzX3NwYWNlOw0KDQpUaGlzIGFwcHJvYWNoIHNob3VsZCB3b3JrIHdoZW4gd2UgYXJlIHVz
aW5nIHNlcGFyYXRlIFBDSUJ1cyBmb3IgZWFjaCBQQ0lEZXZpY2UuDQoNCj4gDQo+Pj4+IEBAIC0z
MzIsNiArMzM2LDEyIEBAIHN0YXRpYyB2b2lkIHZmdV9vYmplY3RfcmVnaXN0ZXJfYmFycyh2ZnVf
Y3R4X3QgKnZmdV9jdHgsIFBDSURldmljZSAqcGRldikNCj4+Pj4gICAgICAgICAgICAgICAgICAg
ICAgICAgdmZ1X29iamVjdF9iYXJfaGFuZGxlcnNbaV0sDQo+Pj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgIFZGVV9SRUdJT05fRkxBR19SVywgTlVMTCwgMCwgLTEsIDApOw0KPj4+PiANCj4+Pj4g
KyAgICAgICAgaWYgKChvLT5wY2lfZGV2LT5pb19yZWdpb25zW2ldLnR5cGUgJiBQQ0lfQkFTRV9B
RERSRVNTX1NQQUNFKSA9PSAwKSB7DQo+Pj4+ICsgICAgICAgICAgICBtZW1vcnlfcmVnaW9uX3Vu
cmVmKG8tPnBjaV9kZXYtPmlvX3JlZ2lvbnNbaV0uYWRkcmVzc19zcGFjZSk7DQo+Pj4+ICsgICAg
ICAgICAgICBvLT5wY2lfZGV2LT5pb19yZWdpb25zW2ldLmFkZHJlc3Nfc3BhY2UgPQ0KPj4+PiAr
ICAgICAgICAgICAgICAgIHJlbW90ZV9pb21tdV9nZXRfcmFtKG8tPnBjaV9kZXYpOw0KPj4+PiAr
ICAgICAgICB9DQo+Pj4gDQo+Pj4gVGhpcyBsb29rcyBoYWNreS4gSWYgeW91IGNyZWF0ZSBhIHNl
cGFyYXRlIFBDSUhvc3QgZm9yIGVhY2ggZGV2aWNlDQo+Pj4gaW5zdGVhZCB0aGVuIHRoZSBCQVJz
IHdpbGwgYmUgY3JlYXRlZCBpbiB0aGUgTWVtb3J5UmVnaW9uIChjb25mdXNpbmdseQ0KPj4+IG5h
bWVkICJhZGRyZXNzX3NwYWNlIiBpbiB0aGUgUENJIGNvZGUpIG9mIHlvdXIgY2hvb3NpbmcuDQo+
PiANCj4+IEkgd2FzIGFsc28gbm90IHZlcnkgY29tZm9ydGFibGUgd2l0aCB0aGlzIC0gYWRkZWQg
aXQgdmVyeSBncnVkZ2luZ2x5IG91dCBvZg0KPj4gbmVjZXNzaXR5LiBUaGFuayBnb2QgdGhpcyBj
YW4gZ28gYXdheSB3aXRoIHNlcGFyYXRlIGJ1cyBmb3IgZWFjaCBkZXZpY2UuDQo+IA0KPiBJIHRh
bGtlZCB0byBLZXZpbiBXb2xmIGFib3V0IGhhdmluZyBzZXBhcmF0ZSBidXNzZXMuIHFkZXYgY3Vy
cmVudGx5DQo+IHJlcXVpcmVzIGVhY2ggRGV2aWNlU3RhdGUgdG8gaGF2ZSBhIHBhcmVudCBidXMg
YW5kIGVhY2ggYnVzIG11c3QgaGF2ZSBhDQo+IHBhcmVudCBEZXZpY2VTdGF0ZS4gVGhlcmUgaXMg
b25seSBvbmUgZXhjZXB0aW9uOiBhIHNwZWNpYWwgY2hlY2sgdGhhdA0KPiBhbGxvd3MgdGhlIGds
b2JhbCBzeXN0ZW0gYnVzIChzeXNidXNfZ2V0X2RlZmF1bHQoKSkgdG8gYmUgY3JlYXRlZA0KPiB3
aXRob3V0IGEgcGFyZW50IERldmljZVN0YXRlLg0KPiANCj4gVGhpcyByZXN0cmljdGlvbiBwcm9i
YWJseSBuZWVkcyB0byBiZSBsb29zZW5lZCBpbiBvcmRlciB0byBzdXBwb3J0IGFuDQo+IGlzb2xh
dGVkIFBDSUhvc3QgZm9yIGVhY2ggdmZpby11c2VyIHNlcnZlci4gVGhlIGNoYWxsZW5nZSBpcyB0
aGF0DQo+IHFkZXZfZmluZF9yZWN1cnNpdmUoKSBhbmQgbW9uaXRvciBjb21tYW5kcyBsaWtlIGRl
dmljZV9hZGQgY3VycmVudGx5DQo+IG9ubHkgc2VhcmNoIHRoZSBnbG9iYWwgc3lzdGVtIGJ1cy4g
TWF5YmUgbmV3IHN5bnRheCBpcyBuZWVkZWQgZm9yIHRoZQ0KPiBtdWx0aXBsZSByb290IGJ1cyBj
YXNlIG9yIHRoZSBiZWhhdmlvciBvZiBleGlzdGluZyBtb25pdG9yIGNvbW1hbmRzDQo+IG5lZWRz
IHRvIGJlIHVuZGVyc3Rvb2QgYW5kIGV4dGVuZGVkIHdpdGhvdXQgYnJlYWtpbmcgYW55dGhpbmcu
DQoNCkxlbW1lIGNoZWNrIGlmIGl04oCZcyBwb3NzaWJsZSB0byBjcmVhdGUgbXVsdGlwbGUgUENJ
QnVzZXMgd2l0aGluIHRoZSBnbG9iYWwNCnN5c3RlbSBidXMsIHNvbWV0aGluZyBzaW1pbGFyIHRv
IHdoYXQgUENJIGV4cGFuc2lvbiBjYXJkcyBhcmUgZG9pbmcuIFRoYXQNCndvdWxkIGhlbHAgYXZv
aWQgdGhlIGNvbXBsZXhpdGllcyB5b3UganVzdCBtZW50aW9uZWQuDQo+IA0KPj4+IA0KPj4+IEFs
c28sIHdoeSBpcyBQQ0kgTWVtb3J5IFNwYWNlIGlzb2xhdGVkIHZpYSBWRlVJT01NVSBidXQgUENJ
IElPIFNwYWNlIGlzDQo+Pj4gbm90Pw0KPj4gDQo+PiBJZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5
LCB0aGUgSU8gYWRkcmVzcyBzcGFjZSB0cmFuc2xhdGVzIHN5c21lbSBhZGRyZXNzIHRvDQo+PiBk
aXJlY3QgZGV2aWNlIGFjY2VzcyAoc3VjaCBhcyBJMkMpLiBPbmNlIHdlIGFyZSBpbnNpZGUgYSBk
ZXZpY2UsIHdlIGFscmVhZHkNCj4+IGhhdmUgYWNjZXNzIHRvIGFsbCBwYXJ0cyBvZiB0aGUgZGV2
aWNlICh1bmxpa2UgUkFNIHdoaWNoIHNpdHMgb3V0c2lkZSB0aGUgZGV2aWNlKS4NCj4+IFNvIGRp
ZG7igJl0IHRoaW5rIGRldmljZSB3b3VsZCBnbyB2aWEgSU9NTVUgdG8gYWNjZXNzIElPLiBBbHNv
IGRpZG7igJl0IHNlZSBhbnkNCj4+IG90aGVyIElPTU1VIHRyYW5zbGF0aW5nIElPIGFkZHJlc3Mg
c3BhY2UgYWNjZXNzZXMuDQo+IA0KPiBJIHJldmlld2VkIGhvdyBCQVJzIGFyZSBjb25maWd1cmVk
IHdpdGggVkZJTzoNCj4gDQo+IDEuIFdoZW4gdGhlIGd1ZXN0IHdyaXRlcyB0byB0aGUgdmZpby1w
Y2kgUENJRGV2aWNlJ3MgQ29uZmlndXJhdGlvbiBTcGFjZQ0KPiAgIHRoZSB3cml0ZSBpcyBmb3J3
YXJkZWQgdG8gdGhlIFZGSU8gZGV2aWNlIChpLmUuIHZmaW8tdXNlciBvciBWRklPDQo+ICAga2Vy
bmVsIGlvY3RsKS4NCj4gDQo+IDIuIFRoZSB2ZmlvLXVzZXIgc2VydmVyIHJlY2VpdmVzIHRoZSBD
b25maWd1cmF0aW9uIFNwYWNlIHdyaXRlIGFuZA0KPiAgIGZvcndhcmRzIGl0IHRvIHBjaV9kZXYg
KHRoZSBQQ0lEZXZpY2Ugd2UncmUgc2VydmluZyB1cCkuIEJBUiBtYXBwaW5ncw0KPiAgIGFyZSB1
cGRhdGVkIGluIHRoZSB2ZmlvLXVzZXIgc2VydmVyIHNvIHRoZSBCQVIgTWVtb3J5UmVnaW9ucyBh
cmUNCj4gICBtYXBwZWQvdW5tYXBwZWQgYXQgdGhlIGxvY2F0aW9ucyBnaXZlbiBieSB0aGUgZ3Vl
c3QuDQo+IA0KPiBUaGlzIGFwcGxpZXMgZm9yIGJvdGggTWVtb3J5IGFuZCBJTyBTcGFjZSBhY2Nl
c3Nlcy4NCj4gDQo+IEJlY2F1c2UgdGhpcyBwYXRjaCBzZXJpZXMgZG9lcyBub3QgaXNvbGF0ZSBJ
TyBTcGFjZSBiZXR3ZWVuIFZmdU9iamVjdA0KPiBpbnN0YW5jZXMgdGhlIE1lbW9yeVJlZ2lvbnMg
d2lsbCBjb2xsaWRlIHdoZW4gdHdvIGd1ZXN0cyBtYXAgSU8gU3BhY2UNCj4gQkFScyBvZiBkaWZm
ZXJlbnQgZGV2aWNlcyBhdCB0aGUgc2FtZSBJTyBTcGFjZSBhZGRyZXNzLiBJbiBvdGhlciB3b3Jk
cywNCj4gdmZ1X29iamVjdF9iYXJfcncoKSB1c2VzIHRoZSBnbG9iYWwgYWRkcmVzc19zcGFjZV9p
byBhbmQgdGhhdCBtZWFucw0KPiBjb2xsaXNpb25zIGNhbiBvY2N1ci4NCg0KSSBhZ3JlZSB0aGF0
IGNvbGxpc2lvbiBjb3VsZCBvY2N1ciBmcm9tIHRoZSBDUFUgZW5kLiBCdXQgSSdtIG5vdCBpZiBJ
T01NVQ0KbmVlZHMgdG8gdHJhbnNsYXRlIElPIHNwYWNlLg0KDQpUaGFuayB5b3UhDQotLQ0KSmFn
DQoNCj4gDQo+IFN0ZWZhbg0KDQo=

