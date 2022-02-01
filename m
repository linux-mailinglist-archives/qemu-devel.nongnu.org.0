Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 279204A6A61
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 03:56:55 +0100 (CET)
Received: from localhost ([::1]:49242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF5pF-0007ca-Od
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 21:56:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nF0dW-0008EX-UL
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:24:27 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:39210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nF0dT-0002Su-Ma
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:24:26 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 211KTIi5008584; 
 Tue, 1 Feb 2022 21:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=H6XjtmDE41ZTI+Mr08PQCmJ8gDEQkeCMs7ov2PWZd/M=;
 b=TrllQnkUM9oHynXtO4FltnmzGV7mpUm28uK09kRBlnETp710uHGw8hSNpUpLV8lnch6X
 h7DM7NMtup07/T2+zOkVj35R4mgFc7S7nd8nRsTOSph8tQtZdy0JZBiwF9rsWOAn5FFh
 xYlKLPNWtbxUos3JwfpDVNV5m/0H4V/DsnAzgIzBm2lcxkO73D7SmF8MAY8gjtJTXi/q
 fhxitS8cuc/ZNz8XCtD7ebw2LlylT4euJjRjOF/xym1aVCPQkjg07RMWKLymIld1BQfg
 Qr3PRpvSXfNS138GcpSCI2ivmchq+1OFGN0kCngVdO2LDyDM3KNs7J3Gder8SaeX/5N2 qA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dxjatvb3f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Feb 2022 21:24:12 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 211LBBER104110;
 Tue, 1 Feb 2022 21:24:11 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by aserp3020.oracle.com with ESMTP id 3dvwd6wnv8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Feb 2022 21:24:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nftc1Vkr9VDhW2x824Al2BTzGzcfplpBug5OPzPlG3R2oxYkI5PPxnY7pv2AH5z4jbFfXc8p6B4vIRbhgA1M8LE80uBItCjdCEJz4e7xGxox36owLwBk/65MZ51vQnK/lFrVhDvpGPzJPXL6s3Ityizkapm+RfdSYnDlvvgc7h5VD8dbgsL5jZ8a+n6IR/rM5LB4uYt5tAWdfz4PulkZTWozREHhFZAeVHiBgUKR/vGxsF6+Whf2PbbD8MxpNh9x83MpbTtM6ddPvc92fdFL23i5icx/tOPE3bi+FU0LiRrVsgFILAj6EJjf89AiiHJLflZC7f8Aqz4k6CLZ9Tybgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6XjtmDE41ZTI+Mr08PQCmJ8gDEQkeCMs7ov2PWZd/M=;
 b=ZXxlU4X8GvBQvKGSEu1PU1rmYs8lpdVA20FLSuQgGcwuFkL9o0e1yOLMamAYc3q2c9oGrYqZ9yEG88hbDYAAIc1bp7oDAjYTcdMJO+5FaBu0XWlQjTmJw+3xVrFg++oPZ2Fz52z2L/jjSpB28PzEuiYRvzOZBFa4noXXluQIotWJtMxQQ1q8zwVoQcPM941gTvQ7o4eWUdBY09wsQYNeU/Yt7SEUoB5m3oujdgiUgWKeNNsGlNs5Pe3TKAYm8lvL11CcCypxpPn13TBFh/N9tjJszvWDZJlfbABZv5gASn8eFK8JW2I9Ow0aCB+DPr6+tiaEpshZgv8/LfvtpMM9sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6XjtmDE41ZTI+Mr08PQCmJ8gDEQkeCMs7ov2PWZd/M=;
 b=0M4hYq6HjJbSelKYaJL2Rb4N4IAI3sJFKMCpariPJt/eUbww0uxRnJNRXZSBwEsEYhp6bjgdt3OdZYwQDrNCQ8+hbi3svhLnAF8Ba1AQzHVRNoKYO7hOxOXml+SUkqsDn0iK3RF8/NvGv2JgdPnFG4SuE+T3FrI/dwhMV6W1EIc=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by CH2PR10MB4215.namprd10.prod.outlook.com (2603:10b6:610:7e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Tue, 1 Feb
 2022 21:24:09 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::940f:c52d:e3e8:7ce2]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::940f:c52d:e3e8:7ce2%4]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 21:24:08 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v5 03/18] pci: isolated address space for PCI bus
Thread-Topic: [PATCH v5 03/18] pci: isolated address space for PCI bus
Thread-Index: AQHYDX1z2h/nyOzV1UqlYAx4HMB2U6xrCcSAgAD94YCACBLhAIAAtVOAgABH8QCAAK30AIAAEm2AgAC9D4CAANfhgIAAx9cAgAUr2oCAASDzgIAAYuuAgABkcYA=
Date: Tue, 1 Feb 2022 21:24:08 +0000
Message-ID: <9BD98DD7-CC28-49E1-8150-BDECF0324FFA@oracle.com>
References: <1CACFB08-1BBC-4ECC-9C0B-6F377018D795@oracle.com>
 <YfBDqMuO/l/gWzL8@work-vm> <AE47B5D2-6515-4BD3-B541-23E5274174AC@oracle.com>
 <YfEYHBhrsdF9Edpp@stefanha-x1.localdomain> <YfGqCJeTD9bmkZx6@work-vm>
 <20220126161120-mutt-send-email-mst@kernel.org>
 <YfJYFbBVQzho7mGp@stefanha-x1.localdomain>
 <20220127142253.21ab0025.alex.williamson@redhat.com>
 <YfO00O4sT2UgaW31@stefanha-x1.localdomain>
 <20220131091623.6739464e.alex.williamson@redhat.com>
 <Yfj9u26F6/RdlhoB@stefanha-x1.localdomain>
 <20220201082437.7dd940eb.alex.williamson@redhat.com>
In-Reply-To: <20220201082437.7dd940eb.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31f237ff-b4fd-440c-ad73-08d9e5c92ef9
x-ms-traffictypediagnostic: CH2PR10MB4215:EE_
x-microsoft-antispam-prvs: <CH2PR10MB421504D6E1D1CEA97B6EA35990269@CH2PR10MB4215.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bBiAP9lkHZE4YmOv1Qh8QcPPnFqcCXI/rn41VhqOgrt7+xT2ITCYzZDsL0CeKeUF7oo4cnQvg1ilAVH405AGoveRy+58NUwjB09/6STafJY9C3A2pppvpvu0ReXgzf0mMnu3cMESI2gqIfqEV2gJiTqWJ8Pxk2/Di7fx1dx/BlRo58lOhtMHWfA3k6f+2JioPaeitbbCjSrxNt52yoXmZ+PH+MYDRIXBmOdPh1BCzrjLBcdEjkUVLRyymt5QMWeeSEm/DTIj0XWEh3cCHmnX6Ck3e7+j6xFHQDb1Aq5232w/BtzbcI6lWm4cIIXj4W5oXH75+hCFsbVTWdK6lslM24q1XS1sCI6mfDGNv8XwA9bh5Z3bSy5bm/81gK6xdbpvWX8oZfl6BY6IlTSPJdtOybIXpkLDTtHDsx2q+8Akq15bdCqj9U6mvSlunhPLP6Ng04GRWVbOkfUXMWq+wyqvB5LDcIwvc5PTRZRY8O6uKRDsPNMLhVaeVO90O1UrqQAHioMbqipt0CkO8jfM9ZdeXKCFbO/dgnMn6PpaDiJf7MgKZHXN1j2UIT7BtOr4/VlKOKwcg22OBZgk4+nFW4R/kDIfeiIwWOt0iChv/Efcxli1OvZ9OkDfTUjn24OPaaByYppYizLxsqVnPH6SqNXDqYvSQt0nY4UP0C9zT1RDMU2dqsS26o2Lodz2+jUoo/1pQPfg2APuu44uTiPfccgWaeaxSNE9mNwN3b7nokU8xy16qqrZeqkyB31zc/vVaZ9e
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(53546011)(316002)(76116006)(36756003)(86362001)(38100700002)(66946007)(6916009)(54906003)(71200400001)(6486002)(5660300002)(508600001)(8676002)(8936002)(4326008)(66476007)(66556008)(64756008)(66446008)(7416002)(6512007)(91956017)(44832011)(33656002)(186003)(122000001)(2906002)(2616005)(38070700005)(83380400001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGY2Q24xajlIR3NxZVBseEJSdVBldjIydy9zODduUkJuNm04d2FMck5WRFM5?=
 =?utf-8?B?aHkrQmd2Y2QxR0E1eFN6UWw3c0ErQm0xNGg2dFZTNFhzMVBRVXpmeTg5dkdY?=
 =?utf-8?B?ZStKWDl5ZVVtSStjU1ZieVBWZFZoUlNrcjVQdDgranBDMFZhcSs0SjdZWjM1?=
 =?utf-8?B?a2ZlRS9Cc2dESEpvZXkrZCtna01PaDFlemxJL1dOZzd6d1FreGE1WWNlalFB?=
 =?utf-8?B?VG5IVy9QbFcwL25UOU0ySGZwNFJCRHdPekxMZTMxbTJVQ2VFL3N1MUFsM1lS?=
 =?utf-8?B?QmtsUEFTWERhK0lxYkxNSjdVb0tCY2JYd01qaFpzME11M1hlNTQ1WW5QbUdn?=
 =?utf-8?B?MFVpdzJYS2x4Z1QvcllvSlp3ck5iSTIwWFYrOWdoY1YvTDdONml0TWdVVExJ?=
 =?utf-8?B?UmpvbG0wdGtYSHkrcG1qa0RGWW41aGlLTXQzRXc3YnNabmdZRXJvUXE1MUl5?=
 =?utf-8?B?N0xQOXZ5aCswRlVpOVpIZXQwL2tIZVFiaHcrNFZsYkFreGk0d1FEMmJYNU1v?=
 =?utf-8?B?L0xHRG84ZVVsMXhKa05yWVowcnNyZ2xpdHJJMENZWlRjb0toeXRxYkhsYkNO?=
 =?utf-8?B?MzZvSmJhWURFWTZEZVZFMkR0OWNCaXFjUXF0VHRObms5SzlWZS9YVTRMV0dO?=
 =?utf-8?B?TVJNWThuWTJzQVpsWW9OcFFnK1JCbDZmdDBzOTBRSksrRkZNRllBSmhTdlFF?=
 =?utf-8?B?VElDTnJ1VHE1ZmczMWZaT1JIaDhzczhUVm95SW1KME5WYjZWMlJsaEhIcDFC?=
 =?utf-8?B?anJQNnhGSVRIM3pJTWJLQ24wSCt4Q1UyMElvakJlb2RnekdtMGsrL2dlckFK?=
 =?utf-8?B?Uk10MzBmWFNPVlJheHFvb0poeG1selE5ODEwdkhJdlV2WGhxMUpYYWhMSDUw?=
 =?utf-8?B?bFBkQVp4Ymc0MHBuYUc1c1NnaUZ4YURXaTJjVURaR0p2SHFvMmxXMzBXaTEv?=
 =?utf-8?B?QVdPY2JXRS9kWkRZNGtVckVHaGdqZnJiWUtQZjlEK05sMkg5RE4vbVVwNkxG?=
 =?utf-8?B?aEcvcUpoMTd0SExkb1l6OGhpeGNkYmJpekJoQkhBa2xZckoyY1YxMUdDeTNv?=
 =?utf-8?B?S2NKMDhtK0xyQ2hQaExkVFF5RGxETklzQXBBVE1mYWFLYjhmbVRNdDZES092?=
 =?utf-8?B?Smhhc1VXSEtqVmNHQ3hpbnNPVmpaTnp3NUVqNzFtc3F1VERKR1JSQ2V2ajRC?=
 =?utf-8?B?c2tsQjg0MnZYdmdYT2VTZ21LdjkzV25RU2JhM1gzS0VPYmJRbnZGSVpHQmpi?=
 =?utf-8?B?eW9KSU9ZN1hiTVMvcjFiMldRUmE4SHdhSmpiS2h4N21LdkU2eUN3ZEs1Tyt5?=
 =?utf-8?B?dEJHNlJURGxZdk40alcvZEV5VVFKekRZNUFRbEZwZkt1cnpJWEEyaGRseEUx?=
 =?utf-8?B?QUo2RWRvRTl6Q0lWOUFRUmhseHhDRkR3cDdwM0JhTkRjS1FORTEyeTZyTmNq?=
 =?utf-8?B?TXhEd1ZLSlhoV2d2cyt0ZGFCQzN6YlYxZUk5Q29mUk0xR1Qybng5MjVvY3Vu?=
 =?utf-8?B?OTZ0MkRCdkhYeVJldzMvcUE3YjRuNXpzRERMVHV1cjI0ZU5hT0toMzhkQWVI?=
 =?utf-8?B?TEZEL0YzWmpGVHprZ0JyOHJCaEZEeVFQUHBJL2NKaE5GbjRVZitIcGI1aXo4?=
 =?utf-8?B?SHlMS1Z3VkpXR1ZoOVUzS001UDFlcklOSHY1QlhQYm9LVUU4bkIxb1g1RXk4?=
 =?utf-8?B?NUhXeFVJb1htN0RSWUpsb1ZTSTBHVzBRM0J1MjZpeUpaZEIzc0VWSE51cmtj?=
 =?utf-8?B?aEQraDRXWFcreFM5c0dlaG9ja0ZNa1ZlV2tzSktzZUZKZzNrRUd0SnJpQndr?=
 =?utf-8?B?VlVrWHJuZFNiOXNGUjVMYmZxSEVLWFNZdk45Z1R4d0RPSGMrbk11UzBkYWFI?=
 =?utf-8?B?cWFoV2IxWmIweDQwUTJyTzNCUWFQdUxkTDBIWTZZZ1hXdWdkd0VKQ2prT29P?=
 =?utf-8?B?SHZOVG9IYkJhMW9acitXaEVFSWtjWGVab0djVzdsNm8wWjh0QUVJTlZ1MHFq?=
 =?utf-8?B?ZURYZlY1UlN6NFlnWGtKSEgzMEMzbW03QXlYd2JNWUx5eUFkTWZlS1Yxd0lr?=
 =?utf-8?B?NTF6eDByd3hUaUxFY2dtVEppN2ZHbUhlVE1abnEya0hhS29LZEROdjlXak51?=
 =?utf-8?B?c21adGpIYzJqbmZIdHhmMlQvZkJMcVdnMVdXZDVEazVXUGNBMFpyQ0FESUE4?=
 =?utf-8?B?NzVPY1ljeDRMU2tpc1pZRWY0UVZJYjIxcEtIVW5nUXFUYnYxZGVxZmJEVUtw?=
 =?utf-8?B?Qlc3L09KNXJ0b01aekgxYVh3S2J3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <24469B55AE0DCE46ABBB53211F073F1D@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f237ff-b4fd-440c-ad73-08d9e5c92ef9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2022 21:24:08.8000 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qpg14eStja4VTkbOeIggb/MhTz91JY81ID8IzTrUQzLCd3kzkyPLG5LgcqjkZeB+ZO7Lbe2xRyjDvltxP1imEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4215
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10245
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202010117
X-Proofpoint-GUID: LBR1E8XP0Inw5TwhYbksPuB-w6zw73HB
X-Proofpoint-ORIG-GUID: LBR1E8XP0Inw5TwhYbksPuB-w6zw73HB
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, John Johnson <john.g.johnson@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Eric Blake <eblake@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRmViIDEsIDIwMjIsIGF0IDEwOjI0IEFNLCBBbGV4IFdpbGxpYW1zb24gPGFsZXgu
d2lsbGlhbXNvbkByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIFR1ZSwgMSBGZWIgMjAyMiAw
OTozMDozNSArMDAwMA0KPiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+IHdy
b3RlOg0KPiANCj4+IE9uIE1vbiwgSmFuIDMxLCAyMDIyIGF0IDA5OjE2OjIzQU0gLTA3MDAsIEFs
ZXggV2lsbGlhbXNvbiB3cm90ZToNCj4+PiBPbiBGcmksIDI4IEphbiAyMDIyIDA5OjE4OjA4ICsw
MDAwDQo+Pj4gU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPiB3cm90ZToNCj4+
PiANCj4+Pj4gT24gVGh1LCBKYW4gMjcsIDIwMjIgYXQgMDI6MjI6NTNQTSAtMDcwMCwgQWxleCBX
aWxsaWFtc29uIHdyb3RlOiAgDQo+Pj4+PiBJZiB0aGUgZ29hbCBoZXJlIGlzIHRvIHJlc3RyaWN0
IERNQSBiZXR3ZWVuIGRldmljZXMsIGllLiBwZWVyLXRvLXBlZXINCj4+Pj4+IChwMnApLCB3aHkg
YXJlIHdlIHRyeWluZyB0byByZS1pbnZlbnQgd2hhdCBhbiBJT01NVSBhbHJlYWR5IGRvZXM/ICAg
IA0KPj4+PiANCj4+Pj4gVGhlIGlzc3VlIERhdmUgcmFpc2VkIGlzIHRoYXQgdmZpby11c2VyIHNl
cnZlcnMgcnVuIGluIHNlcGFyYXRlDQo+Pj4+IHByb2Nlc3NzZXMgZnJvbSBRRU1VIHdpdGggc2hh
cmVkIG1lbW9yeSBhY2Nlc3MgdG8gUkFNIGJ1dCBubyBkaXJlY3QNCj4+Pj4gYWNjZXNzIHRvIG5v
bi1SQU0gTWVtb3J5UmVnaW9ucy4gVGhlIHZpcnRpb2ZzIERBWCBXaW5kb3cgQkFSIGlzIG9uZQ0K
Pj4+PiBleGFtcGxlIG9mIGEgbm9uLVJBTSBNZW1vcnlSZWdpb24gdGhhdCBjYW4gYmUgdGhlIHNv
dXJjZS90YXJnZXQgb2YgRE1BDQo+Pj4+IHJlcXVlc3RzLg0KPj4+PiANCj4+Pj4gSSBkb24ndCB0
aGluayBJT01NVXMgc29sdmUgdGhpcyBwcm9ibGVtIGJ1dCBsdWNraWx5IHRoZSB2ZmlvLXVzZXIN
Cj4+Pj4gcHJvdG9jb2wgYWxyZWFkeSBoYXMgbWVzc2FnZXMgdGhhdCB2ZmlvLXVzZXIgc2VydmVy
cyBjYW4gdXNlIGFzIGENCj4+Pj4gZmFsbGJhY2sgd2hlbiBETUEgY2Fubm90IGJlIGNvbXBsZXRl
ZCB0aHJvdWdoIHRoZSBzaGFyZWQgbWVtb3J5IFJBTQ0KPj4+PiBhY2Nlc3Nlcy4NCj4+Pj4gDQo+
Pj4+PiBJbg0KPj4+Pj4gZmFjdCwgaXQgc2VlbXMgbGlrZSBhbiBJT01NVSBkb2VzIHRoaXMgYmV0
dGVyIGluIHByb3ZpZGluZyBhbiBJT1ZBDQo+Pj4+PiBhZGRyZXNzIHNwYWNlIHBlciBCREYuICBJ
cyB0aGUgZHluYW1pYyBtYXBwaW5nIG92ZXJoZWFkIHRvbyBtdWNoPyAgV2hhdA0KPj4+Pj4gcGh5
c2ljYWwgaGFyZHdhcmUgcHJvcGVydGllcyBvciBzcGVjaWZpY2F0aW9ucyBjb3VsZCB3ZSBsZXZl
cmFnZSB0bw0KPj4+Pj4gcmVzdHJpY3QgcDJwIG1hcHBpbmdzIHRvIGEgZGV2aWNlPyAgU2hvdWxk
IGl0IGJlIGdvdmVybmVkIGJ5IG1hY2hpbmUNCj4+Pj4+IHR5cGUgdG8gcHJvdmlkZSBjb25zaXN0
ZW5jeSBiZXR3ZWVuIGRldmljZXM/ICBTaG91bGQgZWFjaCAiaXNvbGF0ZWQiDQo+Pj4+PiBidXMg
YmUgaW4gYSBzZXBhcmF0ZSByb290IGNvbXBsZXg/ICBUaGFua3MsICAgIA0KPj4+PiANCj4+Pj4g
VGhlcmUgaXMgYSBzZXBhcmF0ZSBpc3N1ZSBpbiB0aGlzIHBhdGNoIHNlcmllcyByZWdhcmRpbmcg
aXNvbGF0aW5nIHRoZQ0KPj4+PiBhZGRyZXNzIHNwYWNlIHdoZXJlIEJBUiBhY2Nlc3NlcyBhcmUg
bWFkZSAoaS5lLiB0aGUgZ2xvYmFsDQo+Pj4+IGFkZHJlc3Nfc3BhY2VfbWVtb3J5L2lvKS4gV2hl
biBvbmUgcHJvY2VzcyBob3N0cyBtdWx0aXBsZSB2ZmlvLXVzZXINCj4+Pj4gc2VydmVyIGluc3Rh
bmNlcyAoZS5nLiBhIHNvZnR3YXJlLWRlZmluZWQgbmV0d29yayBzd2l0Y2ggd2l0aCBtdWx0aXBs
ZQ0KPj4+PiBldGhlcm5ldCBkZXZpY2VzKSB0aGVuIGVhY2ggaW5zdGFuY2UgbmVlZHMgaXNvbGF0
ZWQgbWVtb3J5IGFuZCBpbyBhZGRyZXNzDQo+Pj4+IHNwYWNlcyBzbyB0aGF0IHZmaW8tdXNlciBj
bGllbnRzIGRvbid0IGNhdXNlIGNvbGxpc2lvbnMgd2hlbiB0aGV5IG1hcA0KPj4+PiBCQVJzIHRv
IHRoZSBzYW1lIGFkZHJlc3MuDQo+Pj4+IA0KPj4+PiBJIHRoaW5rIHRoZSB0aGUgc2VwYXJhdGUg
cm9vdCBjb21wbGV4IGlkZWEgaXMgYSBnb29kIHNvbHV0aW9uLiBUaGlzDQo+Pj4+IHBhdGNoIHNl
cmllcyB0YWtlcyBhIGRpZmZlcmVudCBhcHByb2FjaCBieSBhZGRpbmcgdGhlIGNvbmNlcHQgb2YN
Cj4+Pj4gaXNvbGF0ZWQgYWRkcmVzcyBzcGFjZXMgaW50byBody9wY2kvLiAgDQo+Pj4gDQo+Pj4g
VGhpcyBhbGwgc3RpbGwgc2VlbXMgcHJldHR5IHNrZXRjaHksIEJBUnMgY2Fubm90IG92ZXJsYXAg
d2l0aGluIHRoZQ0KPj4+IHNhbWUgdkNQVSBhZGRyZXNzIHNwYWNlLCBwZXJoYXBzIHdpdGggdGhl
IGV4Y2VwdGlvbiBvZiB3aGVuIHRoZXkncmUNCj4+PiBiZWluZyBzaXplZCwgYnV0IERNQSBzaG91
bGQgYmUgZGlzYWJsZWQgZHVyaW5nIHNpemluZy4NCj4+PiANCj4+PiBEZXZpY2VzIHdpdGhpbiB0
aGUgc2FtZSBWTSBjb250ZXh0IHdpdGggaWRlbnRpY2FsIEJBUnMgd291bGQgbmVlZCB0bw0KPj4+
IG9wZXJhdGUgaW4gZGlmZmVyZW50IGFkZHJlc3Mgc3BhY2VzLiAgRm9yIGV4YW1wbGUgYSB0cmFu
c2xhdGlvbiBvZmZzZXQNCj4+PiBpbiB0aGUgdkNQVSBhZGRyZXNzIHNwYWNlIHdvdWxkIGFsbG93
IHVuaXF1ZSBhZGRyZXNzaW5nIHRvIHRoZSBkZXZpY2VzLA0KPj4+IHBlcmhhcHMgdXNpbmcgdGhl
IHRyYW5zbGF0aW9uIG9mZnNldCBiaXRzIHRvIGFkZHJlc3MgYSByb290IGNvbXBsZXggYW5kDQo+
Pj4gbWFza2luZyB0aG9zZSBiaXRzIGZvciBkb3duc3RyZWFtIHRyYW5zYWN0aW9ucy4NCj4+PiAN
Cj4+PiBJbiBnZW5lcmFsLCB0aGUgZGV2aWNlIHNpbXBseSBvcGVyYXRlcyBpbiBhbiBhZGRyZXNz
IHNwYWNlLCBpZS4gYW4NCj4+PiBJT1ZBLiAgV2hlbiBhIG1hcHBpbmcgaXMgbWFkZSB3aXRoaW4g
dGhhdCBhZGRyZXNzIHNwYWNlLCB3ZSBwZXJmb3JtIGENCj4+PiB0cmFuc2xhdGlvbiBhcyBuZWNl
c3NhcnkgdG8gZ2VuZXJhdGUgYSBndWVzdCBwaHlzaWNhbCBhZGRyZXNzLiAgVGhlDQo+Pj4gSU9W
QSBpdHNlbGYgaXMgb25seSBtZWFuaW5nZnVsIHdpdGhpbiB0aGUgY29udGV4dCBvZiB0aGUgYWRk
cmVzcyBzcGFjZSwNCj4+PiB0aGVyZSBpcyBubyByZXF1aXJlbWVudCBvciBleHBlY3RhdGlvbiBm
b3IgaXQgdG8gYmUgZ2xvYmFsbHkgdW5pcXVlLg0KPj4+IA0KPj4+IElmIHRoZSB2ZmlvLXVzZXIg
c2VydmVyIGlzIG1ha2luZyBzb21lIHNvcnQgb2YgcmVxdWlyZW1lbnQgdGhhdCBJT1ZBcw0KPj4+
IGFyZSB1bmlxdWUgYWNyb3NzIGFsbCBkZXZpY2VzLCB0aGF0IHNlZW1zIHZlcnksIHZlcnkgd3Jv
bmcuICBUaGFua3MsICANCj4+IA0KPj4gWWVzLCBCQVJzIGFuZCBJT1ZBcyBkb24ndCBuZWVkIHRv
IGJlIHVuaXF1ZSBhY3Jvc3MgYWxsIGRldmljZXMuDQo+PiANCj4+IFRoZSBpc3N1ZSBpcyB0aGF0
IHRoZXJlIGNhbiBiZSBhcyBtYW55IGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2VzIGFzDQo+
PiB0aGVyZSBhcmUgdmZpby11c2VyIGNsaWVudHMgY29ubmVjdGVkLCBzbyBwZXItY2xpZW50IGlz
b2xhdGVkIGFkZHJlc3MNCj4+IHNwYWNlcyBhcmUgcmVxdWlyZWQuIFRoaXMgcGF0Y2ggc2VyaWVz
IGhhcyBhIHNvbHV0aW9uIHRvIHRoYXQgcHJvYmxlbQ0KPj4gd2l0aCB0aGUgbmV3IHBjaV9pc29s
X2FzX21lbS9pbygpIEFQSS4NCj4gDQo+IFNvcnJ5LCB0aGlzIHN0aWxsIGRvZXNuJ3QgZm9sbG93
IGZvciBtZS4gIEEgc2VydmVyIHRoYXQgaG9zdHMgbXVsdGlwbGUNCj4gZGV2aWNlcyBhY3Jvc3Mg
bWFueSBWTXMgKEknbSBub3Qgc3VyZSBpZiB5b3UncmUgcmVmZXJyaW5nIHRvIHRoZSBkZXZpY2UN
Cj4gb3IgdGhlIFZNIGFzIGEgY2xpZW50KSBuZWVkcyB0byBkZWFsIHdpdGggZGlmZmVyZW50IGFk
ZHJlc3Mgc3BhY2VzIHBlcg0KPiBkZXZpY2UuICBUaGUgc2VydmVyIG5lZWRzIHRvIGJlIGFibGUg
dG8gdW5pcXVlbHkgaWRlbnRpZnkgZXZlcnkgRE1BLA0KPiB3aGljaCBtdXN0IGJlIHBhcnQgb2Yg
dGhlIGludGVyZmFjZSBwcm90b2NvbC4gIEJ1dCBJIGRvbid0IHNlZSBob3cgdGhhdA0KPiBpbXBv
c2VzIGEgcmVxdWlyZW1lbnQgb2YgYW4gaXNvbGF0ZWQgYWRkcmVzcyBzcGFjZS4gIElmIHdlIHdh
bnQgdGhlDQo+IGRldmljZSBpc29sYXRlZCBiZWNhdXNlIHdlIGRvbid0IHRydXN0IHRoZSBzZXJ2
ZXIsIHRoYXQncyB3aGVyZSBhbiBJT01NVQ0KPiBwcm92aWRlcyBwZXIgZGV2aWNlIGlzb2xhdGlv
bi4gIFdoYXQgaXMgdGhlIHJlc3RyaWN0aW9uIG9mIHRoZQ0KPiBwZXItY2xpZW50IGlzb2xhdGVk
IGFkZHJlc3Mgc3BhY2UgYW5kIHdoeSBkbyB3ZSBuZWVkIGl0PyAgVGhlIHNlcnZlcg0KPiBuZWVk
aW5nIHRvIHN1cHBvcnQgbXVsdGlwbGUgY2xpZW50cyBpcyBub3QgYSBzdWZmaWNpZW50IGFuc3dl
ciB0bw0KPiBpbXBvc2UgbmV3IFBDSSBidXMgdHlwZXMgd2l0aCBhbiBpbXBsaWNpdCByZXN0cmlj
dGlvbiBvbiB0aGUgVk0uDQoNCkhpIEFsZXgsDQoNCkkgYmVsaWV2ZSB0aGVyZSBhcmUgdHdvIHNl
cGFyYXRlIHByb2JsZW1zIHdpdGggcnVubmluZyBQQ0kgZGV2aWNlcyBpbg0KdGhlIHZmaW8tdXNl
ciBzZXJ2ZXIuIFRoZSBmaXJzdCBvbmUgaXMgY29uY2VybmluZyBtZW1vcnkgaXNvbGF0aW9uIGFu
ZA0Kc2Vjb25kIG9uZSBpcyB2ZWN0b3Jpbmcgb2YgQkFSIGFjY2Vzc2VzIChhcyBleHBsYWluZWQg
YmVsb3cpLg0KDQpJbiBvdXIgcHJldmlvdXMgcGF0Y2hlcyAodjMpLCB3ZSB1c2VkIGFuIElPTU1V
IHRvIGlzb2xhdGUgbWVtb3J5DQpzcGFjZXMuIEJ1dCB3ZSBzdGlsbCBoYWQgdHJvdWJsZSB3aXRo
IHRoZSB2ZWN0b3JpbmcuIFNvIHdlIGltcGxlbWVudGVkDQpzZXBhcmF0ZSBhZGRyZXNzIHNwYWNl
cyBmb3IgZWFjaCBQQ0lCdXMgdG8gdGFja2xlIGJvdGggcHJvYmxlbXMNCnNpbXVsdGFuZW91c2x5
LCBiYXNlZCBvbiB0aGUgZmVlZGJhY2sgd2UgZ290Lg0KDQpUaGUgZm9sbG93aW5nIGdpdmVzIGFu
IG92ZXJ2aWV3IG9mIGlzc3VlcyBjb25jZXJuaW5nIHZlY3RvcmluZyBvZg0KQkFSIGFjY2Vzc2Vz
Lg0KDQpUaGUgZGV2aWNl4oCZcyBCQVIgcmVnaW9ucyBhcmUgbWFwcGVkIGludG8gdGhlIGd1ZXN0
IHBoeXNpY2FsIGFkZHJlc3MNCnNwYWNlLiBUaGUgZ3Vlc3Qgd3JpdGVzIHRoZSBndWVzdCBQQSBv
ZiBlYWNoIEJBUiBpbnRvIHRoZSBkZXZpY2XigJlzIEJBUg0KcmVnaXN0ZXJzLiBUbyBhY2Nlc3Mg
dGhlIEJBUiByZWdpb25zIG9mIHRoZSBkZXZpY2UsIFFFTVUgdXNlcw0KYWRkcmVzc19zcGFjZV9y
dygpIHdoaWNoIHZlY3RvcnMgdGhlIHBoeXNpY2FsIGFkZHJlc3MgYWNjZXNzIHRvIHRoZQ0KZGV2
aWNlIEJBUiByZWdpb24gaGFuZGxlcnMuDQoNClRoZSBQQ0lCdXMgZGF0YSBzdHJ1Y3R1cmUgYWxy
ZWFkeSBoYXMgYWRkcmVzc19zcGFjZV9tZW0gYW5kDQphZGRyZXNzX3NwYWNlX2lvIHRvIGNvbnRh
aW4gdGhlIEJBUiByZWdpb25zIG9mIGRldmljZXMgYXR0YWNoZWQNCnRvIGl0LiBJIHVuZGVyc3Rh
bmQgdGhhdCB0aGVzZSB0d28gUENJQnVzIG1lbWJlcnMgZm9ybSB0aGUNClBDSSBhZGRyZXNzIHNw
YWNlLg0KDQpUeXBpY2FsbHksIHRoZSBtYWNoaW5lcyBtYXAgdGhlIFBDSSBhZGRyZXNzIHNwYWNl
IGludG8gdGhlIHN5c3RlbSBhZGRyZXNzDQpzcGFjZS4gRm9yIGV4YW1wbGUsIHBjX3BjaV9hc19t
YXBwaW5nX2luaXQoKSBkb2VzIHRoaXMgZm9yIOKAmHBjJyBtYWNoaW5lIHR5cGVzLg0KQXMgc3Vj
aCwgdGhlcmUgaXMgYSAxOjEgbWFwcGluZyBiZXR3ZWVuIHN5c3RlbSBhZGRyZXNzIHNwYWNlIGFu
ZCBQQ0kgYWRkcmVzcw0Kc3BhY2Ugb2YgdGhlIHJvb3QgYnVzLiBTaW5jZSBhbGwgdGhlIFBDSSBk
ZXZpY2VzIGluIHRoZSBtYWNoaW5lIGFyZSBhc3NpZ25lZCB0bw0KdGhlIHNhbWUgVk0sIHdlIGNv
dWxkIG1hcCB0aGUgUENJIGFkZHJlc3Mgc3BhY2Ugb2YgYWxsIFBDSSBidXNlcyB0byB0aGUgc2Ft
ZQ0Kc3lzdGVtIGFkZHJlc3Mgc3BhY2UuDQoNCldoZXJlYXMgaW4gdGhlIGNhc2Ugb2YgdmZpby11
c2VyLCB0aGUgZGV2aWNlcyBydW5uaW5nIGluIHRoZSBzZXJ2ZXIgY291bGQNCmJlbG9uZyB0byBk
aWZmZXJlbnQgVk1zLiBUaGVyZWZvcmUsIGFsb25nIHdpdGggdGhlIHBoeXNpY2FsIGFkZHJlc3Ms
IHdlIHdvdWxkDQpuZWVkIHRvIGtub3cgdGhlIGFkZHJlc3Mgc3BhY2UgdGhhdCB0aGUgZGV2aWNl
IGJlbG9uZ3MgZm9yDQphZGRyZXNzX3NwYWNlX3J3KCkgdG8gc3VjY2Vzc2Z1bGx5IHZlY3RvciBC
QVIgYWNjZXNzZXMgaW50byB0aGUgUENJIGRldmljZS4NCg0KVGhhbmsgeW91IQ0KLS0NCkphZw0K
DQo+IA0KPj4gV2hhdCBJIGZpbmQgc3RyYW5nZSBhYm91dCB0aGlzIGFwcHJvYWNoIGlzIHRoYXQg
ZXhwb3J0ZWQgUENJIGRldmljZXMgYXJlDQo+PiBvbiBQQ0kgcm9vdCBwb3J0cyB0aGF0IGFyZSBj
b25uZWN0ZWQgdG8gdGhlIG1hY2hpbmUncyBtYWluIFBDSSBidXMuIFRoZQ0KPj4gUENJIGRldmlj
ZXMgZG9uJ3QgaW50ZXJhY3Qgd2l0aCB0aGUgbWFpbiBidXMncyBJT1ZBIHNwYWNlLCBndWVzdA0K
Pj4gcGh5c2ljYWwgbWVtb3J5IHNwYWNlLCBvciBpbnRlcnJ1cHRzLiBJdCBzZWVtcyBoYWNreSB0
byBncmFmdCBpc29sYXRlZA0KPj4gZGV2aWNlcyBvbnRvIGEgcGFyZW50IGJ1cyB0aGF0IHByb3Zp
ZGVzIG5vdGhpbmcgdG8gaXRzIGNoaWxkcmVuLiBJDQo+PiB3b25kZXIgaWYgaXQgd291bGQgYmUg
Y2xlYW5lciBmb3IgZXZlcnkgdmZpby11c2VyIHNlcnZlciB0byBoYXZlIGl0cyBvd24NCj4+IFBD
SUhvc3QuIFRoZW4gaXQgbWF5IGJlIHBvc3NpYmxlIHRvIGRyb3AgdGhlIG5ldyBwY2lfaXNvbF9h
c19tZW0vaW8oKQ0KPj4gQVBJLg0KPiANCj4gVGhpcyBpcyBnZXR0aW5nIGEgYml0IHJpZGljdWxv
dXMsIGlmIHZmaW8tdXNlciBkZXZpY2VzIHJlcXVpcmUgdGhpcw0KPiBkZWdyZWUgb2YgbWFuaXB1
bGF0aW9uIG9mIHRoZSBWTSB0b3BvbG9neSBpbnRvIHRoaW5ncyB0aGF0IGRvbid0IGV4aXN0DQo+
IG9uIGJhcmUgbWV0YWwsIHdlJ3ZlIGRvbmUgc29tZXRoaW5nIHZlcnkgd3JvbmcuICBUaGFua3Ms
DQo+IA0KPiBBbGV4DQo+IA0KDQo=

