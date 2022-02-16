Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB10E4B7D0A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 03:12:22 +0100 (CET)
Received: from localhost ([::1]:44662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK9np-0003sw-Ef
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 21:12:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nK9lW-000362-Ps
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 21:09:59 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:56662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nK9lU-0002ph-Hk
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 21:09:58 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FN8hbQ028765; 
 Wed, 16 Feb 2022 02:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=LZlh3e6RTeVWzOvA8BHQ/zCd8rPhuJbhZd/I9W8ocB8=;
 b=syitlYg2Zh9jXn74nkrhfooFyw8wtvZ4xeWXcbjW5EOLf5IoWxhYImJ31+WL4TqtAQdW
 C8nJXV7E/oZdbKchMOVXJchBAokHLTa7M03B56HUG7yIG4GcXe9qBSM3P6FAZqPUcsgx
 In/rNCshJzF4ojFsgHbYkMOLxsmODVn1Ga7tt+0iajafi9moOrm1Pyn12S8hfric9jzt
 vyIawObnNKM/nzzcS1xW/WOIWa9ZI4/gIdYZ6wrpiByEOE023qVPD3nbxcCi4Gvx07qk
 8FYiRvpUCpAHKE5jXMsmaHB2HJdUJ9sWVNTzunFiCDOnKJMlsyTxKncoTypRX6rNXlvV TA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8nkdg7t7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 02:09:43 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21G21EK2185490;
 Wed, 16 Feb 2022 02:09:42 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by userp3030.oracle.com with ESMTP id 3e8nkxjg8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 02:09:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OvwX74xGbjN5EfCHLCLeg8TP60vY7hfDwMyGccfaCrsQyrUdzCv+c3sGqHHlgxMTkmBgllpfW0f9Kg+uLcfDoVNr9Nx+lCr4lApQrNJ65AiBQuye2lJnlQ4JY3/CBdGk1WhdEz7IBIwhcoeJxl0Ict0A+NmDmpC9ZnWxdDrz6pVRQ2wbwB5TAo2gN4mAEehLNyhsimMrQhUcQ8UoCWbMQNQQ2eNW42SoO6y4gpdRybC0VH0Tlxuy8yyaqgQJONsJBjzv2w1sxcQ0OTe6lkbHfjYT+vPYETzJxQQ1Vaasxu3YU9pOEMl6W/pUf6rKMEPfUwz1LX+eBpjog1WneXhMfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZlh3e6RTeVWzOvA8BHQ/zCd8rPhuJbhZd/I9W8ocB8=;
 b=IBru3/qWwkxVrQ6tM6mM0Vk3kjdCzdahSFnUx8tH16nRvlS2/ssl5mgUUT4NveUHI04YY19MLLvZiWvdguq6nADYdJ7TGPSmsWKGxxMFAOOFxiqOXzJhnzvPQyIgIbeDiyUz09tFFDEUew2c8lG2r4weJAS8ZcwqlBKkDvmVUKPoRTEuRWV/+vpwu/soDfXSbSYdMQ+eyS06T2wbscwZTg+BjgIDwAejiWAkgfYQZaaj9W1i4smDEGyl7UXCsZlsr/9l2G+jBnA/kjZvCyjzUCDelXK8xQ2vUEv7TYbqB/Il9V/cwsZE0+l0T9kfVW9+nQR4OgQ5fpbIHEsy2DhilQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZlh3e6RTeVWzOvA8BHQ/zCd8rPhuJbhZd/I9W8ocB8=;
 b=Vo1JYq+DVWti2W0YYBZ877NXo/0FbyrdxeYfvHsB0QHCJ0GWtZsgbszlBs7sYX5TXAkF6xWB1ZxzhY7HITkPgpYNgf0EBW3+jplC8TIza9KWj4iVsyq+hR6NcLAPPYOfDUn8/hANSxtBSd42696pSheHuitOJXxL6+5khvbdbdI=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by SN6PR10MB2813.namprd10.prod.outlook.com (2603:10b6:805:cc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Wed, 16 Feb
 2022 02:09:39 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::8c4f:1ada:aaf9:312]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::8c4f:1ada:aaf9:312%6]) with mapi id 15.20.4995.015; Wed, 16 Feb 2022
 02:09:39 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Thanos Makatos <thanos.makatos@nutanix.com>
Subject: Re: [RFC v4 08/21] vfio-user: define socket receive functions
Thread-Topic: [RFC v4 08/21] vfio-user: define socket receive functions
Thread-Index: AQHYA/12hpHBWFGS8E+PGV+BaY4N36yU2dSAgAAU6gCAAL3IgA==
Date: Wed, 16 Feb 2022 02:09:39 +0000
Message-ID: <EE50CF72-3E55-4685-83E9-92FD45252A5F@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
 <a89cfd3195740dfb313d1947c0c7de583e4d0f46.1641584317.git.john.g.johnson@oracle.com>
 <DM8PR02MB8005963C1D2E796FB7420FBC8B349@DM8PR02MB8005.namprd02.prod.outlook.com>
 <DM8PR02MB80052AF463504BB4BBA397F48B349@DM8PR02MB8005.namprd02.prod.outlook.com>
In-Reply-To: <DM8PR02MB80052AF463504BB4BBA397F48B349@DM8PR02MB8005.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a089771d-85be-41de-de53-08d9f0f163a8
x-ms-traffictypediagnostic: SN6PR10MB2813:EE_
x-microsoft-antispam-prvs: <SN6PR10MB28135212D21CEE6D7D1F6553B6359@SN6PR10MB2813.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RdHKggVvY9r7aMYbN+p4R51rp52oKM4dr76+wP/sU37ox+NQQI1t95j3sZu2LWRUBAai3O9Qgj4WIU2ikvbOKQqk560kNRG8FQ0T5NmfCViqpRcFQ5e0rcu+CdgI5pkDdL5FaN8DbM2jPWfUeRK07ifSmsXnBT2pbgzVLioISbR3E9N3JMmStVyeGCzgRAw8JCdPyWYieR/jnGlvRWJo877JM/grdbtG/ue0w4o2vRsSPOKdr6tT9qWegKmfvcr/ZUgYlBqD7ut1uyrq4kym8OAQR+0vKWLdrwYJTs1PhQm7/i50DnAPMsrx+D4NtUXKNWyMPOopYFrmAlVFeJHwnVgIZoo2exe5LoxfSCFcQISIGUmdagsYSljO6270b9yt68EkfbrnLvVz/Q2aNkLWMxY3/ATYIPg0cU0ZYak58n5UsUtS7LJj0sZkvdffx5NRbQZ1Nn4kteh/LFLQSZYwO4Fd76dZT3i6cfpKHoUrRpUokPGImIc76n1p6w8XTUKo3MmtHlVwR0gcSexzLmtFpp6/UybkJvm25cZLmMw2VTuYSPdXokPfsQ+UxRTIYq7SDwHi840U/Z2fdeDT+qxzq5hfObJNhv7bJmyKbCuph3ya/CbtztvSUti/R7AjABN1GxmL3KstP8ZETPUngQFP4D2GbowkEqRdxB5lnfjGyAOBdZjRdQLBeoLOUxsfI0TPr92I4JrX/z3jD8To4iy1m6fMUUtX/tsQfG2aGB5vMEz4YgVXwc6VzLT4XqJZOy4H
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(38100700002)(186003)(33656002)(26005)(71200400001)(2616005)(53546011)(122000001)(38070700005)(6512007)(66476007)(2906002)(5660300002)(8936002)(6486002)(4326008)(86362001)(36756003)(8676002)(4744005)(66556008)(508600001)(6916009)(76116006)(296002)(66946007)(316002)(64756008)(66446008)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHhTWjJSU25yeTMzd0xNMlVIM2xUa2NsYWdSLzd6dWVpOStkOWhvMjFwd0Ey?=
 =?utf-8?B?SW56aGNGdkpHT2ZqeU9UbEJ2VFAzbnpTUVRQb0RiMktVYlJOUmZUb3lLQ3Fk?=
 =?utf-8?B?NFloUWRpbHcxRkdCcXNyRGQrRXUrV2RQYUtXR2dqV0dsSVFwcXdzS3lHKzNS?=
 =?utf-8?B?N1dhMVlxZlR6QWtBdnZCNHpONmxxN00vOVJpK3NtaHdmNS9mUis5NGtKcmhD?=
 =?utf-8?B?WkxrL3ZxeTVhSUt1TjVzOW52V3UyYzBnOHRCdTBlZmNNMVQwYmtIT0tSYzRi?=
 =?utf-8?B?TzhocDBzRjMxSERKR3NFTlZGSWpVRnVEUHlBUnpqR2V2MkxOZnZZNlQvRU0v?=
 =?utf-8?B?ek9acTdFWTlJR0hqbVJ1V29sV00wd2RlZzRxOExjV2k4VVVVYmU2ajhBVUho?=
 =?utf-8?B?N2xONEVZMkE1ZU9LL0xLMEJDWGN2RDc2MnlyK0YxM2gxRDdHYzZ0ZTg4dGV0?=
 =?utf-8?B?UVNjR3R4Y1V4UDJMdkF2dVREaTNDRGRFYm9BSDJVZ2JSZ3Y5NFJOSUNmZXE5?=
 =?utf-8?B?bzdnNFlKQWMxNEVsaW9kcjlsMDFZWDcvWHRMWjdva3BURzJvT25sK09May91?=
 =?utf-8?B?SHdKb05mcjhBS2lONXhUaHZBNTl1YW5ZdzUvbkpPLzlDeXJmanVsTHdHbmdw?=
 =?utf-8?B?MER4bTQwN3NBU3pqN0RuTGYzRUttLzRBdCtWT05lUUJLSk1TTDArMjBIMk9J?=
 =?utf-8?B?RFVwOW1xYm9GNDl6aXZQdWhSK1VRc045VUllMEVUNmdENDBHdG1TZ1BTai9p?=
 =?utf-8?B?aXBKakp1ZTNaRTlXVGpLSnljbnBick9EVlZvaHR6ODh4MUNiSUxwWTBseHFr?=
 =?utf-8?B?QXpQelp4N0xsRUxaNFZDYjV1dGxjMko4bkpPdnUxVjJlTUFiQnJqK3pzWEFQ?=
 =?utf-8?B?VkEzQVNtV2xxNzFGWDBUL0EzNlBqMkljdFRkOEpXaXhZdGZnMytQam8zSVJI?=
 =?utf-8?B?WjB1dzRtQjdyNE5BTWsrYTFQWHJIcEtVdVlEbkZLN0dnTGFEbHh5V01YL0Zi?=
 =?utf-8?B?YXIxNVNNMXdaTmZERkRsZXZpcjdkQ2JEUTFta1VORzlOcnJPZ0l6aVkrUmVF?=
 =?utf-8?B?ZlRCSkZMWmhBK0RoWERmZENFMG5DL2xyN3M1bFJHRktTbmVZb1hsRkMyekY5?=
 =?utf-8?B?MnVJcUxzdzVUbFg2OUZDcmpkSkxzbk84cHh0UUpRNklEUUFMdEZ4a3NpUWYw?=
 =?utf-8?B?TDc1d2ZsRWRBRk00YllOVHRhTXRGY0tNaWxGSmYzUWRNaHE2em5NU3QzemRv?=
 =?utf-8?B?RmZkbmNBMkJPRTd0eDJsN3RhR0ZDdFlCMklEUVNKNUlzTHhEam1rblZYR09Q?=
 =?utf-8?B?K0JKcDE1dkZWTVFzcTBJUDlvaVZRNWxCOHcrZWZQbEkrV3VlSk9MQjNYdkdm?=
 =?utf-8?B?QytCODFXdVlyUGpTSU54Y3ZCWG14bVAvNkkvSjhMaUloQjJRVys0TmFaKzU2?=
 =?utf-8?B?OTBIcWtNaVJFbWgxaGxwRVlSdnAzUDFxbHFERFRMZW5kbDJ6R3N4V0pORnM5?=
 =?utf-8?B?N00vbUFkdzMxa2FvQitTbk5xNlI2a3cyVTZuc1lVUjFmZnhzRXcvZjJlQnhW?=
 =?utf-8?B?YUxIUDRqSnJsSHBuS0E3WDNRYUUyb1JDalJkb0tiU0F4b1U5cW14K0RtOXp5?=
 =?utf-8?B?Kzc3NGNFNG92L1lTNEpZSHlReFlwNS9XTDZOWFhZdDBNT0g2cU1MVWx1ZG5R?=
 =?utf-8?B?MFcyWi8wb21oUTdzdHoweFdvdGpHMWllT09JYUp4RW5jNkRIOEp6R254V0x4?=
 =?utf-8?B?OTJmWFlsUURReTdiK2tjSlJFYkxHRUthVkc3ZytEcWxQMkh0NHNlRVArekI1?=
 =?utf-8?B?S1ZRMjZQRnJteWhTN0pWbm5aT1FEcW1nbXZkR0NtSWQ3R3dnY1hGbE9PU2pa?=
 =?utf-8?B?aUlLaHZPT0h1Ky82WUFUSVVJY20zNEw2a1U2bzd2NTlIRkpVaHNTNXhCckpX?=
 =?utf-8?B?NCs3cjNPOFQyY3RRcENpdkZicVJ4Uk9tak0rdzhWRHNxakRoRkhIUUl0Z2Vw?=
 =?utf-8?B?bzBCVk9scU5GMzJLRVJ6NFdYRnNuTTRLMCtiRmdlSmllN24xQnd6Vk9MNjMz?=
 =?utf-8?B?TXo3cEpHZ0oxbnVWaXJHQ2Fzemh3UXIzNjc2NmhoSTZlU0FrUjFOMEdsLzVG?=
 =?utf-8?B?Q3UvaU9BUEw0TnliS21UL0diR1dQYzI1M0VLR3hweTVCQW1tQVpZNEJqa0Ey?=
 =?utf-8?B?cGl0c0ZxclN6Y0JTMmlIejFWZ29iWGcwbXhCdlJNbXBZWVh3b0JzUUczVmN3?=
 =?utf-8?Q?/9aDhgk4uCr4HkQlW4QfDIvtY331Drgu1lToY3b18A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <34502A3C9ADEE949B3BC328EF77BDFF1@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a089771d-85be-41de-de53-08d9f0f163a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2022 02:09:39.8494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mLzdgO3IxvwndWDsfD6VMSw9ZZrlllqUMF6UroXzWIyG0higSyjpr2goAF43t8eI6UTf6msWy0uJ8w63UTnMxDpxMqsFvW5pXJGBwkJmy9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2813
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10259
 signatures=675924
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 mlxlogscore=865 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202160008
X-Proofpoint-ORIG-GUID: SWzHfFL3VAencNervpbYNLjRXJVOhrhN
X-Proofpoint-GUID: SWzHfFL3VAencNervpbYNLjRXJVOhrhN
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRmViIDE1LCAyMDIyLCBhdCA2OjUwIEFNLCBUaGFub3MgTWFrYXRvcyA8dGhhbm9z
Lm1ha2F0b3NAbnV0YW5peC5jb20+IHdyb3RlOg0KPiANCj4+PiANCj4gDQo+IE9uIHNlY29uZCB0
aG91Z2h0LCBzaG91bGQgd2UgZHVtcCB0aGUgZW50aXJlIGhlYWRlciBpbiBjYXNlIG9mIHN1Y2gg
ZXJyb3JzPyBJZiBub3QgYnkgZGVmYXVsdCB0aGVuIGF0IGxlYXN0IGluIGRlYnVnIGJ1aWxkcz8N
Cg0KDQoJSSB3YXMgdGhpbmtpbmcgb2YgYWRkaW5nIHFlbXUgdHJhY2Vwb2ludHMgaW4gdGhlIHJl
Y3YgYW5kIHNlbmQgcGF0aHMNCmZvciB5b3VyIG90aGVyIGRlYnVnIHJmZS4gIE1heWJlIEnigJls
bCBhZGQgb25lIHNldCBmb3IgdGhlIG5vcm1hbCBwYXRoIHRoYXQNCnByaW50cyBhbiBhYmJyZXZp
YXRlZCBoZWFkZXIsIGFuZCBhbm90aGVyIHNldCBmb3IgdGhlIGVycm9yIGNhc2UgdGhhdCBwcmlu
dHMNCnRoZSB3aG9sZSBoZWFkZXIuICBXb3VsZCB0aGF0IHdvcms/DQoNCgkJCQkJCQkJSkoNCg0K
DQo=

