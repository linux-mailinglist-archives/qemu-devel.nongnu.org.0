Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B401A53EEA3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 21:32:10 +0200 (CEST)
Received: from localhost ([::1]:41404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyISP-0001QT-BO
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 15:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nyIQ2-0000Uw-E1
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 15:29:42 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:52300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nyIPy-00055G-6y
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 15:29:42 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 256HqxZQ028290;
 Mon, 6 Jun 2022 19:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=uwgF3pM/R1lGsEFECJTFUJldsuWc23NZ/UYsKp1mNzM=;
 b=M5fTPDn4PwV/FKLmCHDYgNHhGOLDChOU8cxmZtaVTx3FqonF0i6HeeuELDp7wHqbj4vF
 ihwPH5ZywM+GP8L+/CExem0F7kLGg436E7WKaGKJixoyWSon8XY6x3Dnqj/QGEDJOx2J
 7J8bYrLgDEHRWhaVK2jyoimVtNniDvFGKYvWurwPxYzHa7FgG03rH1zFiUyxgkeOC/8n
 tcpI3qPKdzsI1iEOjY8JPRelmtenVTzrzlgP9A+UTqdyeH3vIlANaJUwH6jAUK+bzQFj
 ZEX9HayZTk/hb3y3qaKbxEevtP2mqmJBSMMze2AALZptuq0lpKiLhKJq8/p4hwUt9O4V tA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gfyxsc289-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Jun 2022 19:29:20 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 256JKb7S015034; Mon, 6 Jun 2022 19:29:19 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gfwu1t613-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Jun 2022 19:29:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkklviNs8mOOQVqbuslNnoiZe58AJIz1hfi6kvehx3QDQsv1eEOehnyAU/2jkHeIgGxw+kOg4wXnhkigZLjkyo8ckbb9LTeG8GaZ1PnlWF7sIdrkne9CmpFyPwIqAxz2geV/UFyn5WMiYF7vlv+az81iD7to5sHu465YY74KNdy5zKV7iMvnLmV35ZAHOiWGhU+aiUHFjBQ2NDnMhFQ/owDtXTgnPedRiP7mUZnZuNec6YAHPgGHSgwGFUc3Joy9f5F86d4v9aL7kuhM6Ss/xpRfSP4DU/boel5LXLvyei9Qwr7m0IkkXaw3y/e/tCtBAbenoj9HrApDuu2nM8khXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwgF3pM/R1lGsEFECJTFUJldsuWc23NZ/UYsKp1mNzM=;
 b=ctv0HuP/v38XC3yIPXu2/po/wUsb6XV525VDZcIMRtjPjk+zEzrSsCGEOj/yezLWactc7f9aZ3cGiwsvm8nelQcXBC8Z2+O8Z0HBHO9NwpJDk+PtKTylDI2ksY6EYz+sSxljlXD12CKZUJkOJLksm2aN4SMivoW+tnsGZr7DRqZKkU04ZozxzLA6RmcPd2XnvqPfduqTt1DSp2U9nr/4kCxdphvtL04quhZt8+8ut+0LxuIi3+sm4M+op3oyzZZhBPhWwYYeQTpa2uRuCmFFuk2zP84C5mkWvi1kOzso0umG3uDj6Jf1q/T7BYZpQC1VIUPfrIt07hQHwRqHE7H5yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwgF3pM/R1lGsEFECJTFUJldsuWc23NZ/UYsKp1mNzM=;
 b=Qq3fAFl7gf9ex6+LEELCGi7RWvMS+wqjQKjEfEyHcG31flFNgGCEufcx65KAoMa9QDZmpV3/KJosyqPOy3i4oHHh0LfOVgbPFTo+UVOYKBlatzDaztrahttOk7Ha/2Yj9+VSWY1916Dy+1amjGgeV9MDSESsSbTwaq692eYhEjA=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB1949.namprd10.prod.outlook.com (2603:10b6:300:10c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.17; Mon, 6 Jun
 2022 19:29:16 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 19:29:15 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Alexander Duyck <alexander.duyck@gmail.com>
CC: qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, "f4bug@amsat.org" <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "thuth@redhat.com" <thuth@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "eduardo@habkost.net" <eduardo@habkost.net>, "marcel.apfelbaum@gmail.com"
 <marcel.apfelbaum@gmail.com>, "eblake@redhat.com" <eblake@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, "imammedo@redhat.com"
 <imammedo@redhat.com>, Peter Xu <peterx@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>, Kanth Ghatraju
 <kanth.ghatraju@oracle.com>
Subject: Re: [PATCH v10 13/14] vfio-user: handle device interrupts
Thread-Topic: [PATCH v10 13/14] vfio-user: handle device interrupts
Thread-Index: AQHYb4NRI47IPGjvqEq+Oet+ENycma1CyIKAgAAP34A=
Date: Mon, 6 Jun 2022 19:29:15 +0000
Message-ID: <7F3721E6-A29D-4B74-872C-6648BC6E97E7@oracle.com>
References: <cover.1653404595.git.jag.raman@oracle.com>
 <2a492c16e0464f70f7be1fd9c04172f4f18d14ca.1653404595.git.jag.raman@oracle.com>
 <CAKgT0UdnSjUqubFT2pjB1KiVcE42ScPjBMSvV8cNf=S=1U7n=g@mail.gmail.com>
In-Reply-To: <CAKgT0UdnSjUqubFT2pjB1KiVcE42ScPjBMSvV8cNf=S=1U7n=g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c43f0959-49dd-45c8-1ca9-08da47f2d809
x-ms-traffictypediagnostic: MWHPR10MB1949:EE_
x-microsoft-antispam-prvs: <MWHPR10MB19498078E2C6D75A0A15DDB890A29@MWHPR10MB1949.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iqSK+GZwM0Srf27tY4sbKY3ncA9loOBwzhSu39N/giIivxFooIB4KuZxl3wOL73d85sJra9LVHX2tygjFTHEeU7fbOE5Q6cYRgYS/DDM8J4a7X01CYrXhFyUngZzCBmcH1II39MoERdnWaANOGnSIiMshmatiQkPtQ6gs2ajHSMK1WYh4n7w1EqOpaIPx+k6NQ1q4yf2KL04tS98KLBwGyhq6z/h2jqac2zkGsIMUwfFZxuIBF3r+ECC/wHL2h2CGUwtantav8kfsd8NNO5LiB4zrDIPv7lFDCQCgeefG2sMb4tCcdZBh3OmA0VU3uYHgU6+o+OqCYKVhBL1wDh4x5GkKhswBZE2dlq+VOyFKYnxDwbj5zH2vOecR9vdtccYLVeoEl9KcbxgMn1hNhc2FtT+Y+AgEoVJZUCVyMJz5hnyguQRkejpO0ohAdmYUeiVOizYXakhRWVngpg24oIAhWWyUNZbDA6uGLCB/2hbDks/08vXp71zkre+FRZrXj+yZZbZDWwtHXC3STKXHAIHeUZeRiiujvC3hm6npg0kLfnsZEcHUU4At47wakztZvayj1qmrl/4iWID40zWN7jZMfxlM4ZNQ8soShzGSLOg6dqbM2Na6thB7PRIA/idyXQs9QHiQ48t0IS3HKLhgI2U7dqgudtxzOZrhaO6JcG918DTGz1C7CbHYKqa5HP7paPRg7sp29s79QFhWGufaeN4qqCRNsUYtC1l1XMllmh/ySs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(53546011)(6506007)(2906002)(6512007)(26005)(71200400001)(33656002)(6486002)(508600001)(86362001)(54906003)(316002)(38100700002)(6916009)(44832011)(36756003)(38070700005)(66446008)(66946007)(66556008)(66476007)(76116006)(122000001)(91956017)(7416002)(186003)(8936002)(2616005)(83380400001)(107886003)(8676002)(64756008)(5660300002)(4326008)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1FDV0pteEtmeFRWN3JwbExVOXpKYzRObEh2aUxsSUpzVUVZRnJjcUV1TzJM?=
 =?utf-8?B?RE9IaGRPc085SGI5ZllMYVE1QjBqVDZXUW85VjhxTU43RDl6ZUtvNURPd2RN?=
 =?utf-8?B?cWZ6THVPTXRJU1dUMkVoNmJlclBER0dzUzMwV1pvOTNGSVZUQ3J2djM2WkV5?=
 =?utf-8?B?RUZoQkV3YmN5R3ZPb0ExbkFpOVcxSU1DSlhUTDNUUm5kRjdoMTJXNThHcVc5?=
 =?utf-8?B?Z2hRdHF1TVcvaXlacjFLN3RXcmVWSEdrM1didldUWTVKMjIwaTkzT3J3Y1Y2?=
 =?utf-8?B?Z0lPbTNJQXl1aHBUSThGdjVydHpEWmZ1QmVaSlJzbE1qdU9RNDdKWC9FQlZK?=
 =?utf-8?B?OW9YTmdWMmhNUzBLNVIrQjFWUTZkaGVnU1pONkhheXB6dGFFaWVVUDZ2bU5m?=
 =?utf-8?B?dXVjelFJYUk2cks2QmorVlEzUmxsUlhJZjEzR3JkbGk2QWp2SE1RbE16SE9t?=
 =?utf-8?B?SXIydUlzZzI5KzFSRmpjWUEzM21LcXl5TEpGSFQrVCtqWFpiWUZyNmRlZSt6?=
 =?utf-8?B?NG5YdlpUVVRsays2cjZsWExEVEh0RzVpNm5hZkVsRzViTHFReTdqYUZhVVAw?=
 =?utf-8?B?b3BwYlZDQkpnd0x5UFdKMEhJTW9KQUlGTDI0dnRSNmMxWnQ3eUlaOUYzUFpG?=
 =?utf-8?B?c25US0JIb0hZblRSZDhTZ2hoT2cxbTB1ckx6dFZhd2Y0enR4V2VMRnVVK2VQ?=
 =?utf-8?B?U2Vkbk1wKzh3WWMyN3laK3dzb09QVlJ6YnpMYk5KZ1kzc3FOSnJJT3dPaXM1?=
 =?utf-8?B?L3lsNThrb2ZJK3c5YXNSdnpVOXpNRHJORUEyTWlBaEpNS0o0OXFyOVhObm1q?=
 =?utf-8?B?eDhuekZ4dmFBRm8rSCsyZkRTMGl5RUc1QVo5a1o5Qlc2ekx2TTZPeUxQTnVQ?=
 =?utf-8?B?bmdSMWhWNzVvOUpmK1o4UHIvSlpoNVVKVVNodE9LbmJYZXdNa3VBMUpSNG8r?=
 =?utf-8?B?QVNUdC9MTG10OGNSKytpN3JTNjI5ZW1wQ1cxcUdDMHFNUHpsTlBPUFRTTUgv?=
 =?utf-8?B?REoyd1U0bVNtMHRXUlFGVHdteGE0RnRNNnQ4a2ZvYmtoeU9zclIvdXF1c2pD?=
 =?utf-8?B?SlhDdTVkcWY3OUxIRkozRjRBbDJEOFRLVndZc2o5czZqWjdQeUo4WS9vb1pP?=
 =?utf-8?B?YXoyQ2h1T1ZhNlg0TXBDMmxhRWQ0SW85ckQ2Mzd6N2szbmhFQ1pFTy8rcVJh?=
 =?utf-8?B?NUwyNllWTEVKZDlWSldETTBrWTZSVm1uZDhibDEvWXN2TlhzQWdJb0dORFdK?=
 =?utf-8?B?d0Y3aTVkSmJONXhWM2h6d0ZkdDFYT2RJaEU3TzZObXd4eWVlaURlMC9WbVVS?=
 =?utf-8?B?bmlwWi83MEc0ajE5L3dxTTFhS0xNc3cvV3BTci9Ca2tmdnJGRUpERUszRHBU?=
 =?utf-8?B?RXAzdWY5STBiU0g5aUZVOC9uQ2wyQXZiVUg2aTlLOFB2TW5tZEFaSWhsZDdL?=
 =?utf-8?B?ZHoxUXFieXdwSVJaeHVycFF5bEpyTnlBNW84S0Rycmluc0MrS0xrMnNvYWZD?=
 =?utf-8?B?VUdLQTk4cHF6SzYxa2I5ekJFMkRlcEJIR1RNNGRjenVFRTNSQ0ZXZWtTNVdQ?=
 =?utf-8?B?M1R1TVhtRnhNZWV5ZU14b0NaMXIwUHpRQS9sOWUzaWU4ZVJJWk1OQkswNWYr?=
 =?utf-8?B?NDFTUks1UVJsQWx0S3dYKytVYlFVOGtxOFNtVnBtQndSV09PQWM5aE43MnIx?=
 =?utf-8?B?QzBPZ3A5OFIzM2Q0YkhMV0xJakhPcUdRYkMwRTc0dEM0Tk9mbm43M1BISjJG?=
 =?utf-8?B?dFlnSjZKN3BvWWkxMEJEZUllOTAvOWpiT0ZKQ083ekxDc2FiOUdkQjMwTDlw?=
 =?utf-8?B?dE55TjQ2UkdsZHNFR0szMmw0bFJkWnNOUnpTOGZ5Z1dHaWthOFVVaHlHUHRu?=
 =?utf-8?B?RnJjZS9tMlNQeWlwbStmTExWT1BRcW9Ub1hwWElYMkdqbHlOcEF2RDRycThk?=
 =?utf-8?B?bEtRenhaSUt0N0Rrb2RqaGpHNWFaQ3l5Uk1vVjI1WEkxM0o2ZWo2MVA1cW9S?=
 =?utf-8?B?VnR4Y0FuaHRqaWdHTWhIN0gzRWo5K283cFpDVXlJeWNBbXdxSnJuZFFuQmlX?=
 =?utf-8?B?NFpvZGNoSEtLeDlmRTlvSTRYVzBveTNUYmpjWFdkVFRZcnJ6SjhzbE90b3lj?=
 =?utf-8?B?OEJTVVNTcmxHeS9JVUJpUm8zdU9xUVVSQTMxL3k1T3p3elU4dHpVbDlSOGIx?=
 =?utf-8?B?VVgvL0ZZcGVvQmJ3aytJWUtsSHlhcDRKeVM3UFRmb25XSXB0QVg5OERLRkYw?=
 =?utf-8?B?anVFSnJRMFgwYmpVb2E0WUUyN3dBSnR5RjdUclFIOUt2OTRQV0VJM1ZpcXJL?=
 =?utf-8?B?NUd2OU1yY2dLSjR2aXdQb1BXc2VySklTV3NXR29jVG5FV1Q5djB3dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <19C795E7B935B6458246181DCEA17278@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c43f0959-49dd-45c8-1ca9-08da47f2d809
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2022 19:29:15.8323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GYd0ep1Ne+wwhEboKvNKYiUEq3V0mpuNSW151vJijZv5pv9RbMggRQVyIlilRQfHJ9OR4paZgrMYel9TEvih2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1949
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-06_06:2022-06-02,
 2022-06-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 spamscore=0
 phishscore=0 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206060078
X-Proofpoint-ORIG-GUID: uxH7aRku5iZy6hP4rJX027bRRMhRLBWH
X-Proofpoint-GUID: uxH7aRku5iZy6hP4rJX027bRRMhRLBWH
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gSnVuIDYsIDIwMjIsIGF0IDI6MzIgUE0sIEFsZXhhbmRlciBEdXljayA8YWxleGFu
ZGVyLmR1eWNrQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBUdWUsIE1heSAyNCwgMjAyMiBh
dCA5OjExIEFNIEphZ2FubmF0aGFuIFJhbWFuIDxqYWcucmFtYW5Ab3JhY2xlLmNvbT4gd3JvdGU6
DQo+PiANCj4+IEZvcndhcmQgcmVtb3RlIGRldmljZSdzIGludGVycnVwdHMgdG8gdGhlIGd1ZXN0
DQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEVsZW5hIFVmaW10c2V2YSA8ZWxlbmEudWZpbXRzZXZh
QG9yYWNsZS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKb2huIEcgSm9obnNvbiA8am9obi5nLmpv
aG5zb25Ab3JhY2xlLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEphZ2FubmF0aGFuIFJhbWFuIDxq
YWcucmFtYW5Ab3JhY2xlLmNvbT4NCj4+IC0tLQ0KPj4gaW5jbHVkZS9ody9wY2kvcGNpLmggICAg
ICAgICAgICAgIHwgIDEzICsrKysNCj4+IGluY2x1ZGUvaHcvcmVtb3RlL3ZmaW8tdXNlci1vYmou
aCB8ICAgNiArKw0KPj4gaHcvcGNpL21zaS5jICAgICAgICAgICAgICAgICAgICAgIHwgIDE2ICsr
LS0NCj4+IGh3L3BjaS9tc2l4LmMgICAgICAgICAgICAgICAgICAgICB8ICAxMCArKy0NCj4+IGh3
L3BjaS9wY2kuYyAgICAgICAgICAgICAgICAgICAgICB8ICAxMyArKysrDQo+PiBody9yZW1vdGUv
bWFjaGluZS5jICAgICAgICAgICAgICAgfCAgMTQgKysrLQ0KPj4gaHcvcmVtb3RlL3ZmaW8tdXNl
ci1vYmouYyAgICAgICAgIHwgMTIzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4g
c3R1YnMvdmZpby11c2VyLW9iai5jICAgICAgICAgICAgIHwgICA2ICsrDQo+PiBNQUlOVEFJTkVS
UyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPj4gaHcvcmVtb3RlL3RyYWNlLWV2ZW50
cyAgICAgICAgICAgIHwgICAxICsNCj4+IHN0dWJzL21lc29uLmJ1aWxkICAgICAgICAgICAgICAg
ICB8ICAgMSArDQo+PiAxMSBmaWxlcyBjaGFuZ2VkLCAxOTMgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pDQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9ody9yZW1vdGUvdmZpby11
c2VyLW9iai5oDQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgc3R1YnMvdmZpby11c2VyLW9iai5jDQo+
PiANCj4gDQo+IFNvIEkgaGFkIGEgcXVlc3Rpb24gYWJvdXQgYSBmZXcgYml0cyBiZWxvdy4gU3Bl
Y2lmaWNhbGx5IEkgcmFuIGludG8NCj4gaXNzdWVzIHdoZW4gSSBoYWQgc2V0dXAgdHdvIGRldmlj
ZXMgdG8gYmUgYXNzaWduZWQgdG8gdGhlIHNhbWUgVk0gdmlhDQo+IHR3byB2ZmlvLXVzZXItcGNp
L3gtdmZpby11c2VyLXNlcnZlciBpbnRlcmZhY2VzLg0KDQpUaGFua3MgZm9yIHRoZSBoZWFkcyB1
cCwgQWxleGFuZGVyIQ0KDQo+IA0KPiBXaGF0IEkgYW0gaGl0dGluZyBpcyBhbiBhc3NlcnQoaXJx
X251bSA8IGJ1cy0+bmlycSkgaW4NCj4gcGNpX2J1c19jaGFuZ2VfaXJxX2xldmVsIGluIHRoZSBz
ZXJ2ZXIuDQoNClRoYXQgaXMgaXNzdWUgaXMgYmVjYXVzZSB3ZSBhcmUgb25seSBpbml0aWFsaXpp
bmcgb25seSBvbmUNCklSUSBmb3IgdGhlIFBDSSBidXMgLSBidXQgaXQgc2hvdWxkIGJlIG1vcmUu
IFdlIHdpbGwgdXBkYXRlDQppdCBhbmQgd2hlbiB0aGUgYnVzIGluaXRpYWxpemVzIGludGVycnVw
dHMgYW5kIGdldCBiYWNrIHRvIHlvdS4NCg0KV2Ugb25seSB0ZXN0ZWQgTVNJL3ggZGV2aWNlcyBm
b3IgdGhlIG11bHRpLWRldmljZSBjb25maWcuIFdlDQpzaG91bGQgYWxzbyB0ZXN0IElOVHggLSBj
b3VsZCB5b3UgcGxlYXNlIGNvbmZpcm0gd2hpY2ggZGV2aWNlDQp5b3XigJlyZSB1c2luZyBzbyB3
ZSBjb3VsZCB2ZXJpZnkgdGhhdCBpdCB3b3JrcyBiZWZvcmUgcG9zdGluZw0KdGhlIG5leHQgcmV2
aXNpb24uDQoNClRoYW5rIHlvdSENCi0tDQpKYWcNCg0KPiANCj4+IGRpZmYgLS1naXQgYS9ody9y
ZW1vdGUvbWFjaGluZS5jIGIvaHcvcmVtb3RlL21hY2hpbmUuYw0KPj4gaW5kZXggNjQ1YjU0MzQz
ZC4uNzVkNTUwZGFhZSAxMDA2NDQNCj4+IC0tLSBhL2h3L3JlbW90ZS9tYWNoaW5lLmMNCj4+ICsr
KyBiL2h3L3JlbW90ZS9tYWNoaW5lLmMNCj4+IEBAIC0yMyw2ICsyMyw4IEBADQo+PiAjaW5jbHVk
ZSAiaHcvcmVtb3RlL2lvbW11LmgiDQo+PiAjaW5jbHVkZSAiaHcvcWRldi1jb3JlLmgiDQo+PiAj
aW5jbHVkZSAiaHcvcmVtb3RlL2lvbW11LmgiDQo+PiArI2luY2x1ZGUgImh3L3JlbW90ZS92Zmlv
LXVzZXItb2JqLmgiDQo+PiArI2luY2x1ZGUgImh3L3BjaS9tc2kuaCINCj4+IA0KPj4gc3RhdGlj
IHZvaWQgcmVtb3RlX21hY2hpbmVfaW5pdChNYWNoaW5lU3RhdGUgKm1hY2hpbmUpDQo+PiB7DQo+
PiBAQCAtNTQsMTIgKzU2LDE2IEBAIHN0YXRpYyB2b2lkIHJlbW90ZV9tYWNoaW5lX2luaXQoTWFj
aGluZVN0YXRlICptYWNoaW5lKQ0KPj4gDQo+PiAgICAgaWYgKHMtPnZmaW9fdXNlcikgew0KPj4g
ICAgICAgICByZW1vdGVfaW9tbXVfc2V0dXAocGNpX2hvc3QtPmJ1cyk7DQo+PiAtICAgIH0NCj4+
IA0KPj4gLSAgICByZW1vdGVfaW9odWJfaW5pdCgmcy0+aW9odWIpOw0KPj4gKyAgICAgICAgbXNp
X25vbmJyb2tlbiA9IHRydWU7DQo+PiArDQo+PiArICAgICAgICB2ZnVfb2JqZWN0X3NldF9idXNf
aXJxKHBjaV9ob3N0LT5idXMpOw0KPj4gKyAgICB9IGVsc2Ugew0KPj4gKyAgICAgICAgcmVtb3Rl
X2lvaHViX2luaXQoJnMtPmlvaHViKTsNCj4+IA0KPj4gLSAgICBwY2lfYnVzX2lycXMocGNpX2hv
c3QtPmJ1cywgcmVtb3RlX2lvaHViX3NldF9pcnEsIHJlbW90ZV9pb2h1Yl9tYXBfaXJxLA0KPj4g
LSAgICAgICAgICAgICAgICAgJnMtPmlvaHViLCBSRU1PVEVfSU9IVUJfTkJfUElSUVMpOw0KPj4g
KyAgICAgICAgcGNpX2J1c19pcnFzKHBjaV9ob3N0LT5idXMsIHJlbW90ZV9pb2h1Yl9zZXRfaXJx
LCByZW1vdGVfaW9odWJfbWFwX2lycSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAmcy0+aW9o
dWIsIFJFTU9URV9JT0hVQl9OQl9QSVJRUyk7DQo+PiArICAgIH0NCj4+IA0KPj4gICAgIHFidXNf
c2V0X2hvdHBsdWdfaGFuZGxlcihCVVMocGNpX2hvc3QtPmJ1cyksIE9CSkVDVChzKSk7DQo+PiB9
DQo+IA0KPiBJZiBJIGFtIHJlYWRpbmcgdGhlIGNvZGUgcmlnaHQgdGhpcyBsaW1pdHMgdXMgdG8g
b25lIGxlZ2FjeSBpbnRlcnJ1cHQNCj4gaW4gdGhlIHZmaW9fdXNlciBjYXNlLCBpcnEgMCwgY29y
cmVjdD8gSXMgdGhpcyBpbnRlbnRpb25hbD8gSnVzdA0KPiB3YW50ZWQgdG8gdmVyaWZ5IGFzIHRo
aXMgc2VlbXMgdG8gbGltaXQgdXMgdG8gc3VwcG9ydGluZyBvbmx5IG9uZQ0KPiBkZXZpY2UgYmFz
ZWQgb24gdGhlIG1hcHBpbmcgYmVsb3cuDQo+IA0KPj4gZGlmZiAtLWdpdCBhL2h3L3JlbW90ZS92
ZmlvLXVzZXItb2JqLmMgYi9ody9yZW1vdGUvdmZpby11c2VyLW9iai5jDQo+PiBpbmRleCBlZTI4
YTkzNzgyLi5lZWIxNjVhODA1IDEwMDY0NA0KPj4gLS0tIGEvaHcvcmVtb3RlL3ZmaW8tdXNlci1v
YmouYw0KPj4gKysrIGIvaHcvcmVtb3RlL3ZmaW8tdXNlci1vYmouYw0KPj4gQEAgLTUzLDYgKzUz
LDkgQEANCj4+ICNpbmNsdWRlICJody9wY2kvcGNpLmgiDQo+PiAjaW5jbHVkZSAicWVtdS90aW1l
ci5oIg0KPj4gI2luY2x1ZGUgImV4ZWMvbWVtb3J5LmgiDQo+PiArI2luY2x1ZGUgImh3L3BjaS9t
c2kuaCINCj4+ICsjaW5jbHVkZSAiaHcvcGNpL21zaXguaCINCj4+ICsjaW5jbHVkZSAiaHcvcmVt
b3RlL3ZmaW8tdXNlci1vYmouaCINCj4+IA0KPj4gI2RlZmluZSBUWVBFX1ZGVV9PQkpFQ1QgIngt
dmZpby11c2VyLXNlcnZlciINCj4+IE9CSkVDVF9ERUNMQVJFX1RZUEUoVmZ1T2JqZWN0LCBWZnVP
YmplY3RDbGFzcywgVkZVX09CSkVDVCkNCj4+IEBAIC05Niw2ICs5OSwxMCBAQCBzdHJ1Y3QgVmZ1
T2JqZWN0IHsNCj4+ICAgICBFcnJvciAqdW5wbHVnX2Jsb2NrZXI7DQo+PiANCj4+ICAgICBpbnQg
dmZ1X3BvbGxfZmQ7DQo+PiArDQo+PiArICAgIE1TSVRyaWdnZXJGdW5jICpkZWZhdWx0X21zaV90
cmlnZ2VyOw0KPj4gKyAgICBNU0lQcmVwYXJlTWVzc2FnZUZ1bmMgKmRlZmF1bHRfbXNpX3ByZXBh
cmVfbWVzc2FnZTsNCj4+ICsgICAgTVNJeFByZXBhcmVNZXNzYWdlRnVuYyAqZGVmYXVsdF9tc2l4
X3ByZXBhcmVfbWVzc2FnZTsNCj4+IH07DQo+PiANCj4+IHN0YXRpYyB2b2lkIHZmdV9vYmplY3Rf
aW5pdF9jdHgoVmZ1T2JqZWN0ICpvLCBFcnJvciAqKmVycnApOw0KPj4gQEAgLTUyMCw2ICs1Mjcs
MTExIEBAIHN0YXRpYyB2b2lkIHZmdV9vYmplY3RfcmVnaXN0ZXJfYmFycyh2ZnVfY3R4X3QgKnZm
dV9jdHgsIFBDSURldmljZSAqcGRldikNCj4+ICAgICB9DQo+PiB9DQo+PiANCj4+ICtzdGF0aWMg
aW50IHZmdV9vYmplY3RfbWFwX2lycShQQ0lEZXZpY2UgKnBjaV9kZXYsIGludCBpbnR4KQ0KPj4g
K3sNCj4+ICsgICAgaW50IHBjaV9iZGYgPSBQQ0lfQlVJTERfQkRGKHBjaV9idXNfbnVtKHBjaV9n
ZXRfYnVzKHBjaV9kZXYpKSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBj
aV9kZXYtPmRldmZuKTsNCj4+ICsNCj4+ICsgICAgcmV0dXJuIHBjaV9iZGY7DQo+PiArfQ0KPj4g
Kw0KPiANCj4gVGhpcyBiaXQgZW5kcyB1cCBtYXBwaW5nIGl0IHNvIHRoYXQgdGhlIEJERiBlbmRz
IHVwIHNldHRpbmcgdGhlIElSUQ0KPiBudW1iZXIuIFNvIGZvciBleGFtcGxlIGRldmljZSAwLCBm
dW5jdGlvbiAwIHdpbGwgYmUgSVJRIDAsIGFuZCBkZXZpY2UNCj4gMSwgZnVuY3Rpb24gMCB3aWxs
IGJlIElSUSA4LiBKdXN0IHdvbmRlcmluZyB3aHkgaXQgaXMgaW1wbGVtZW50ZWQgdGhpcw0KPiB3
YXkgaWYgd2Ugb25seSBpbnRlbmQgdG8gc3VwcG9ydCBvbmUgZGV2aWNlLiBBbHNvIEkgYW0gd29u
ZGVyaW5nIGlmIHdlDQo+IHNob3VsZCBzdXBwb3J0IHNvbWUgc29ydCBvZiBJUlEgc2hhcmluZz8N
Cj4gDQo+PiArc3RhdGljIGludCB2ZnVfb2JqZWN0X3NldHVwX2lycXMoVmZ1T2JqZWN0ICpvLCBQ
Q0lEZXZpY2UgKnBjaV9kZXYpDQo+PiArew0KPj4gKyAgICB2ZnVfY3R4X3QgKnZmdV9jdHggPSBv
LT52ZnVfY3R4Ow0KPj4gKyAgICBpbnQgcmV0Ow0KPj4gKw0KPj4gKyAgICByZXQgPSB2ZnVfc2V0
dXBfZGV2aWNlX25yX2lycXModmZ1X2N0eCwgVkZVX0RFVl9JTlRYX0lSUSwgMSk7DQo+PiArICAg
IGlmIChyZXQgPCAwKSB7DQo+PiArICAgICAgICByZXR1cm4gcmV0Ow0KPj4gKyAgICB9DQo+PiAr
DQo+PiArICAgIGlmIChtc2l4X25yX3ZlY3RvcnNfYWxsb2NhdGVkKHBjaV9kZXYpKSB7DQo+PiAr
ICAgICAgICByZXQgPSB2ZnVfc2V0dXBfZGV2aWNlX25yX2lycXModmZ1X2N0eCwgVkZVX0RFVl9N
U0lYX0lSUSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtc2l4
X25yX3ZlY3RvcnNfYWxsb2NhdGVkKHBjaV9kZXYpKTsNCj4+ICsgICAgfSBlbHNlIGlmIChtc2lf
bnJfdmVjdG9yc19hbGxvY2F0ZWQocGNpX2RldikpIHsNCj4+ICsgICAgICAgIHJldCA9IHZmdV9z
ZXR1cF9kZXZpY2VfbnJfaXJxcyh2ZnVfY3R4LCBWRlVfREVWX01TSV9JUlEsDQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXNpX25yX3ZlY3RvcnNfYWxsb2NhdGVk
KHBjaV9kZXYpKTsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBpZiAocmV0IDwgMCkgew0KPj4g
KyAgICAgICAgcmV0dXJuIHJldDsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICB2ZnVfb2JqZWN0
X3NldHVwX21zaV9jYnMobyk7DQo+PiArDQo+PiArICAgIHBjaV9kZXYtPmlycV9vcGFxdWUgPSB2
ZnVfY3R4Ow0KPj4gKw0KPj4gKyAgICByZXR1cm4gMDsNCj4+ICt9DQo+PiArDQo+PiArdm9pZCB2
ZnVfb2JqZWN0X3NldF9idXNfaXJxKFBDSUJ1cyAqcGNpX2J1cykNCj4+ICt7DQo+PiArICAgIHBj
aV9idXNfaXJxcyhwY2lfYnVzLCB2ZnVfb2JqZWN0X3NldF9pcnEsIHZmdV9vYmplY3RfbWFwX2ly
cSwgcGNpX2J1cywgMSk7DQo+PiArfQ0KPj4gKw0KPj4gLyoNCj4+ICAqIFRZUEVfVkZVX09CSkVD
VCBkZXBlbmRzIG9uIHRoZSBhdmFpbGFiaWxpdHkgb2YgdGhlICdzb2NrZXQnIGFuZCAnZGV2aWNl
Jw0KPj4gICogcHJvcGVydGllcy4gSXQgYWxzbyBkZXBlbmRzIG9uIGRldmljZXMgaW5zdGFudGlh
dGVkIGluIFFFTVUuIFRoZXNlDQo+IA0KPiBTbyB0aGlzIGlzIHRoZSBjb2RlIHRoYXQgd2FzIGNh
bGxlZCBlYXJsaWVyIHRoYXQgaXMgYmVpbmcgdXNlZCB0bw0KPiBhc3NpZ24gMSBpbnRlcnJ1cHQg
dG8gdGhlIGJ1cy4gSSBhbSBqdXN0IHdvbmRlcmluZyBpZiB0aGF0IGlzDQo+IGludGVudGlvbmFs
IGFuZCBpZiB0aGUgZXhwZWN0ZWQgYmVoYXZpb3IgaXMgdG8gb25seSBzdXBwb3J0IG9uZSBkZXZp
Y2UNCj4gcGVyIHNlcnZlciBmb3Igbm93Pw0KDQo=

