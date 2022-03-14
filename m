Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A67934D7AA5
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 07:06:21 +0100 (CET)
Received: from localhost ([::1]:42652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTdqW-00027Q-8b
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 02:06:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nTdox-0001Qq-PV
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 02:04:43 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:49874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nTdou-0007mU-U7
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 02:04:43 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22E0rDrV031067; 
 Mon, 14 Mar 2022 06:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=GwhcZDBDRWlahZMdFtKDS1ARWMDgdO/C5YJ9EpzKVnc=;
 b=qbOakQCfFor1dQUghUyX9LUFSCzcD8ng4qVsYhEzG7ghRMhKvnCCmQa0fPwYbJ2dj2AL
 T5S6gjgnfrAbfsfYHJ9OsjcIExc54nJI5H+2AksHIFKb8Nxf5hqH+/6IQ2JB/g64Sf3o
 mUAwavZViJxS8nAZYLrgmTSPqRuLg8Ir3DtMQ27dX+uYLoli7GovwM4cf/U17XNiQU0/
 nmdZxO8zyYGQMRuGlGtxlmyDa/mFIV6allrffQa21HTlD/RvW81kMJB79IQGvJrXMATv
 igM2i6M5hxERJ7Ia3oJQxF3RDc8MEDn/FcTagGjKiMXuF+azvIgjfRVyR4JMERwGbodU cg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3erkd9thfv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 06:04:29 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22E60xSF168056;
 Mon, 14 Mar 2022 06:04:26 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by userp3020.oracle.com with ESMTP id 3ermyh2xu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 06:04:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dyVTisIfBOhPGx1GOmfiYXKf+Vgh5fhfpYWIu4Geh3pNgqjrJu7/Yq95lso/LljAfxxegPhLXaB1DUFHszpLneBayfLLY6kS3eO4FtzrrMAgUm13fo7WQXY/OqvPa29cgCv1az7kInNaR6jAmOxUxWQrjb6FO8/4/DZEcGiPt4mrv6tpW+8710pT+d9P/dZDUB25//qlB/eqEMGoz1njjxLthgr6w+DRlzfDS1893jI9+5biCou3PIlUEny1jaL7TIV2TmRYyEWImju+ff1x85hZtIcfP9L7F7TCQ8CV82aQ9TCHQ3vmUg7/0mZkacZGdMuV9CNFhoZPIwsQREBU/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwhcZDBDRWlahZMdFtKDS1ARWMDgdO/C5YJ9EpzKVnc=;
 b=hO9SY668YzbvL/mUayl8lrwCK/pJIOhEkmcxCbU8BNEfho+TL6Bb7FzeDRjzxXaiif3V2GdMDCtfh9uiow3e4cmcjXe5S3m7xuSTsFj2+FYutR87W2Okg1DLQ19P7SVhWE6VvGFfGBZQHgfKxNe9v4bbbw+7bYGzfkBMSdvuPtGsqh/ZzWFitF+PxI77q/dlKejmBWkjzx6KFg0FvyQ4E+vNvuvySCDqlEYjvY5IdPiQXUbU7ZBl6X7i3uJZXUnF4HVfUURH1r/VCnByQmqGYz7RKSrzbIAP57N8gUrnctBDbMQnlexBJlMNft+Ozfu6S3ldJtAYs45lQpPAa36ORQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwhcZDBDRWlahZMdFtKDS1ARWMDgdO/C5YJ9EpzKVnc=;
 b=KSPG7K4pboX4eLNRiTrSzbA1ZtFXc+DGoUbLubVPcj13SdyHzNVoLIBUJvY/iuDvOfJh8Vy51TVKXtEe168jD2PxRvBwpHdMI5/vfUsPBr/rpVN0Y9OowuV2LWiy++aAxBZRy9pHKOeVt+iE5ozrOISup8dbSGs9AZQiMoJDryA=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by BY5PR10MB4147.namprd10.prod.outlook.com (2603:10b6:a03:20e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Mon, 14 Mar
 2022 06:04:24 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::e94a:3e9f:cb2c:9ed5]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::e94a:3e9f:cb2c:9ed5%5]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 06:04:24 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC v4 01/21] vfio-user: introduce vfio-user protocol
 specification
Thread-Topic: [RFC v4 01/21] vfio-user: introduce vfio-user protocol
 specification
Thread-Index: AQHYBowpN0q6N125FE+bUIMVtVRQyKy3/rGAgAbG7AA=
Date: Mon, 14 Mar 2022 06:04:24 +0000
Message-ID: <C438BDA5-9C65-4CB8-9857-4CD7738F9FE3@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
 <a9b696ca38ee2329e371c28bcaa2921cac2a48a2.1641584316.git.john.g.johnson@oracle.com>
 <20220309153453.25eee9dd.alex.williamson@redhat.com>
In-Reply-To: <20220309153453.25eee9dd.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0eee21d2-8cdf-4a3b-f32f-08da05807da1
x-ms-traffictypediagnostic: BY5PR10MB4147:EE_
x-microsoft-antispam-prvs: <BY5PR10MB4147F15FF63378459C3A7A54B60F9@BY5PR10MB4147.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FTN2j5sZu+alipcE4Js+bwIjbdgrKZkwXHUQGvsEXOrjVmOQHB57Ygo8ao7vRH3U9u0oNqEOUawd7oYGAsEXpLzqwHlT3OS66fMAZkyND8azFPB6chEUpAiUlltZqzy+EBfBAafewnveMFWamLDZBHaUXuvxSsV0Os31TJU+05Q1IsxvwStO0zgdiz6/srLWlDT/HatzblvbUDy02b0co3qpb9Ka4WWazrENFkg/V81PT37P+uLkxd43bHKzBaNc2Jp+YZNOLUqOUE/3lXGTBrBInDrnC+GpFQ1ynMSDntQOPE7awpeXAEl+oY4JMxTzG8E4vy7YWUbUWaSU6LY1UCAxfJgRihAgcVYZaHCRwh8bPwsZmsZNE8eEiTtTfZEUfRfmkLP60MGp6I7FiU5Avt00D+7/UaXVKcjeZZRKJjI/S8IDlhbPxylhtDX81bxba7MQ+y1eBQ7ezE8Im+ZXGOD9sWXpEp08PB8n6/+4hX+l/HNddir29v8/txNpVtrkUijfwC1XcKJObCtjXOIbmzgtlauczEHf2u0YQy7bzf5VPA84Ah6QhjDTpbA0lImAlPoxG/gxJNJq7hiPg7ltTaO2tyMo4f+MNllERU0R3su86ZaEC+gk9/+l44VegpUykkfrr9BOpBHz3tDZ8mI/+RtyHPdg/yOF9nGZj4F0gjpyE7Hq4RpiuByXQTvO/qQ4YtChMtt/rivfcdrnZW6Dv8FDv58y9/x1TDMjw7AHh2c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(2616005)(6512007)(33656002)(2906002)(83380400001)(36756003)(122000001)(66446008)(71200400001)(8936002)(38070700005)(66476007)(66556008)(4326008)(64756008)(26005)(76116006)(186003)(8676002)(66946007)(53546011)(38100700002)(86362001)(6506007)(316002)(6916009)(6486002)(508600001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDFYR256UnlVTklyWVkvTnV3Z3JoekpZblZVdFRVaFBFaWZWZk5FQkRMK1BU?=
 =?utf-8?B?Y3FMZXdGMXJTT0l1TXZlUTA3cFQ0L2tGbWtudE9YOURQR1BaM2FLb0s1MWZs?=
 =?utf-8?B?c3FlVDdabXNGenB5RkVWRHlXK3R4RksyemNlWVVWL1FqY2VhbnVqa3dWSXhK?=
 =?utf-8?B?NFovcDg4N3JrMStrUkl5MWIwZkVyaW40MXZaQm1VZExwSExTL0lqQW50TGJU?=
 =?utf-8?B?M0hLWWZtWFRLZGRkZnF1bkVYWFlrZUo0WXdmak9XNlEwa2xWQ1lvTTAwK1BK?=
 =?utf-8?B?R1h4dlhkMUJEM3hoY2FtVzNkM0lYWFFtTG92WnVoRlQyVUZ4UjhudVJ2a1RD?=
 =?utf-8?B?b1JYZjgxaWJhSjFuNzl1VzQrWjNVREZNS1dGV0lLV1VVdVdKcmNsaWo1cUtK?=
 =?utf-8?B?OFArbmVCWDVMN2NKREJqb2hmMC9nUGVNK0F1alUxYUdoN3NsS01DOGMzWXdo?=
 =?utf-8?B?M3E4KzFYUkpFSG1KbnRxVXF4cHNZKzhPVno1NGxyL2NKWDZ2RjdPaXhuVkpO?=
 =?utf-8?B?Z3c1MUFyUnRsMFcwbUIrS0IweXNmNnA4cytWKzU4dmdFcitsWGtsb2Y5bUNX?=
 =?utf-8?B?RzFWSmM2OTMxSWFyNzZzNWE2YmNxMjMrbU9KMm9mTDY4RzdsUFI4b09PY0dv?=
 =?utf-8?B?NmUzM0pVVWZxa1UzY09mVjZqTjd0dEEyTDNQaytFeXI2RHgya2hTSGRxOTlj?=
 =?utf-8?B?TVV0UzRxT2lCTW1zQitjY1RvNDFBVU1ZN3RpMVJuRlZzVE9FNXladUNOcHlw?=
 =?utf-8?B?UTU1YkQvNkI5ai80cnhUMk9wd1ZjVjY3RWoxL1J3dGgwazlsVFRIbnVxdE1W?=
 =?utf-8?B?aTBUdjAxVGRRMDlOc1NrekRadldVaTlrRXFLbzcrOTJ3UHN6UWRYakZVQ20x?=
 =?utf-8?B?YW9sNE03MXhUYnNnSnJaODF3TVhqaWl2V1dpU2JrUm9wcXJERmtFb2FNZnh0?=
 =?utf-8?B?NUZyWTRRYXRTUlN5V3ZITklYcHcxZ3ZibWV6SEFmazBURkZoa2pxcjczMWFH?=
 =?utf-8?B?QnZneUxqWW52MEZybE14N21PU0pGbjNCeC83Z0JsOWNEaUdGNTRJMW9HWTRv?=
 =?utf-8?B?VzFWMUpoWGlJRUh5WDE3MUZLU3pYOS9QY09qLzI3QlR0QklxUnRIQmZ2Zk5R?=
 =?utf-8?B?NTBwR0NZWFcyNDI1UmVPR2owbHZBUjd6eTJ2SUhTaTUyVGFPcmJvT0QyRy9H?=
 =?utf-8?B?dHU4UlUwcEI2bU54aUtiZ2NOZ3RiaUxHcXRVMDlUMDMvM1ZhekxSVnRJd29q?=
 =?utf-8?B?T0FOQU95L0dKWmVwSkZ2VWVpUnhjMEYrbjVBQmhVV3FGbngyeHpyNStTMS9U?=
 =?utf-8?B?OTM3THZXRld5emhHL0RxWC9pWEsyOHZ2RUhCUEdaMlUrMWNjclYrZk5idTdy?=
 =?utf-8?B?SWIrNExNSjZHZUF4UitoU3lBdzVFb0hDbmpKb3pOSk5CU3R6UVBoMmpJWXlk?=
 =?utf-8?B?SGdzQjlGVXpHR3hPeXV2U0ROUy9rbDY5Y0FQYVJ0b1JobHBpZkpKRHpaTE50?=
 =?utf-8?B?R3NjWWxLaEd4eHdoMEE1YnBNSnU2Nk4wRndyQmttcEp0K2Y5KzlGMG5zNVZT?=
 =?utf-8?B?SVhGSFVPRjB3MWJQbjE5aDRISlJhZVBZeHhwN0tDdm1MNmYyRnc0VC9OeE1P?=
 =?utf-8?B?a3o2dSs5NWcxL0JOOFByM3ZvK2ExQXZ6bU1EaWpzSzgzNUNLZWVoTmJ2dmRv?=
 =?utf-8?B?bEFxYWthTGtVaXRuSS9uSmNqcFpzd3RyRU1VaFIvbWdzNzJ2Rklrc3pxbCtr?=
 =?utf-8?B?ajVFOGU0Zi9kd3FidEJZOEg1ODFaS1NZYUZDWEc5SW5YY2pBYzZxeWdLY200?=
 =?utf-8?B?QXpKRlY5TExtNDNGdG9LRnQ3REIwRGdkbVBPdGJFbUUxZnJHQmhuTU1yWDZF?=
 =?utf-8?B?L1FWcDBaT25XTzNkQzNDb09UODVPbStyRHRGNDRoVE9KVHV4ZlJpSTk0eWo1?=
 =?utf-8?B?RWpoZHJ0dmNpVUVlSGVrM1ZnWldtSE8yQW5XbDIxWjk4Q2dkbzRtQlhONlVQ?=
 =?utf-8?B?ZENKRmdwbER3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <60984011781F8A4AABB7E531E68D3629@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eee21d2-8cdf-4a3b-f32f-08da05807da1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2022 06:04:24.6971 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DbxlX5UF/5Eh8KKPuZvYmNBaTIh4eztwXBCXK9GBU2iPszUat5M1LWCnDXPFiHPeE8oZASIsmB9Boi/yEwJxySc3UlrSHhc5BV2OSsNj2ew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4147
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10285
 signatures=693139
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203140038
X-Proofpoint-GUID: 5PqEfUFxIxQmIPj27VCHjfqFybr8lRpF
X-Proofpoint-ORIG-GUID: 5PqEfUFxIxQmIPj27VCHjfqFybr8lRpF
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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

DQoNCj4gT24gTWFyIDksIDIwMjIsIGF0IDI6MzQgUE0sIEFsZXggV2lsbGlhbXNvbiA8YWxleC53
aWxsaWFtc29uQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4+IA0KPj4gKw0KPj4gK1ZGSU8gcmVn
aW9uIGluZm8gdHlwZSBjYXANCj4+ICsiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiIiDQo+PiArDQo+
PiArVGhlIFZGSU8gcmVnaW9uIGluZm8gdHlwZSBpcyBkZWZpbmVkIGluIGBgPGxpbnV4L3ZmaW8u
aD5gYA0KPj4gKyhgYHN0cnVjdCB2ZmlvX3JlZ2lvbl9pbmZvX2NhcF90eXBlYGApLg0KPj4gKw0K
Pj4gKystLS0tLS0tLS0rLS0tLS0tLS0rLS0tLS0tKw0KPj4gK3wgTmFtZSAgICB8IE9mZnNldCB8
IFNpemUgfA0KPj4gKys9PT09PT09PT0rPT09PT09PT0rPT09PT09Kw0KPj4gK3wgdHlwZSAgICB8
IDAgICAgICB8IDQgICAgfA0KPj4gKystLS0tLS0tLS0rLS0tLS0tLS0rLS0tLS0tKw0KPj4gK3wg
c3VidHlwZSB8IDQgICAgICB8IDQgICAgfA0KPj4gKystLS0tLS0tLS0rLS0tLS0tLS0rLS0tLS0t
Kw0KPj4gKw0KPj4gK1RoZSBvbmx5IGRldmljZS1zcGVjaWZpYyByZWdpb24gdHlwZSBhbmQgc3Vi
dHlwZSBzdXBwb3J0ZWQgYnkgdmZpby11c2VyIGlzDQo+PiArYGBWRklPX1JFR0lPTl9UWVBFX01J
R1JBVElPTmBgICgzKSBhbmQgYGBWRklPX1JFR0lPTl9TVUJUWVBFX01JR1JBVElPTmBgICgxKS4N
Cj4gDQo+IFRoZXNlIHNob3VsZCBiZSBjb25zaWRlcmVkIGRlcHJlY2F0ZWQgZnJvbSB0aGUga2Vy
bmVsIGludGVyZmFjZS4gIEkNCj4gaG9wZSB0aGVyZSBhcmUgcGxhbnMgZm9yIHZmaW8tdXNlciB0
byBhZG9wdCB0aGUgbmV3IGludGVyZmFjZSB0aGF0J3MNCj4gY3VycmVudGx5IGF2YWlsYWJsZSBp
biBsaW51eC1uZXh0IGFuZCBpbnRlbmRlZCBmb3IgdjUuMTguDQo+IA0KDQoNCglXZSB3aWxsIGZv
bGxvdyB0aGUgaW50ZXJmYWNlcyB0aGF0IFFFTVUgdXNlcy4gIERvIHlvdSBoYXZlIGFuIGlkZWEN
CndoZW4gdGhlIFZGSU8gdjIgY2hhbmdlcyB3aWxsIGJlIHB1bGxlZCBpbnRvIFFFTVU/ICBXaWxs
IHRoZSB2MiBjb2RlIGJlDQpleHBlcmltZW50YWwgbGlrZSB2MSB3YXM/DQoNCg0KDQo+IC4uLg0K
Pj4gK1VudXNlZCBWRklPIGBgaW9jdGwoKWBgIGNvbW1hbmRzDQo+PiArLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCj4+ICsNCj4+ICtUaGUgZm9sbG93aW5nIFZGSU8gY29tbWFuZHMg
ZG8gbm90IGhhdmUgYW4gZXF1aXZhbGVudCB2ZmlvLXVzZXIgY29tbWFuZDoNCj4+ICsNCj4+ICsq
IGBgVkZJT19HRVRfQVBJX1ZFUlNJT05gYA0KPj4gKyogYGBWRklPX0NIRUNLX0VYVEVOU0lPTmBg
DQo+PiArKiBgYFZGSU9fU0VUX0lPTU1VYGANCj4+ICsqIGBgVkZJT19HUk9VUF9HRVRfU1RBVFVT
YGANCj4+ICsqIGBgVkZJT19HUk9VUF9TRVRfQ09OVEFJTkVSYGANCj4+ICsqIGBgVkZJT19HUk9V
UF9VTlNFVF9DT05UQUlORVJgYA0KPj4gKyogYGBWRklPX0dST1VQX0dFVF9ERVZJQ0VfRkRgYA0K
Pj4gKyogYGBWRklPX0lPTU1VX0dFVF9JTkZPYGANCj4+ICsNCj4+ICtIb3dldmVyLCBvbmNlIHN1
cHBvcnQgZm9yIGxpdmUgbWlncmF0aW9uIGZvciBWRklPIGRldmljZXMgaXMgZmluYWxpemVkIHNv
bWUNCj4+ICtvZiB0aGUgYWJvdmUgY29tbWFuZHMgbWF5IGhhdmUgdG8gYmUgaGFuZGxlZCBieSB0
aGUgY2xpZW50IGluIHRoZWlyDQo+PiArY29ycmVzcG9uZGluZyB2ZmlvLXVzZXIgZm9ybS4gVGhp
cyB3aWxsIGJlIGFkZHJlc3NlZCBpbiBhIGZ1dHVyZSBwcm90b2NvbA0KPj4gK3ZlcnNpb24uDQo+
IA0KPiBBcyBhYm92ZSwgSSdkIGdvIGFoZWFkIGFuZCBkcm9wIHRoZSBtaWdyYXRpb24gcmVnaW9u
IGludGVyZmFjZSBzdXBwb3J0LA0KPiBpdCdzIGJlaW5nIHJlbW92ZWQgZnJvbSB0aGUga2VybmVs
LiAgRGlydHkgcGFnZSBoYW5kbGluZyBtaWdodCBhbHNvIGJlDQo+IHNvbWV0aGluZyB5b3Ugd2Fu
dCB0byBwdWxsIGJhY2sgb24gYXMgd2UncmUgZXhwZWN0aW5nIGluLWtlcm5lbCB2ZmlvIHRvDQo+
IGVzc2VudGlhbGx5IGRlcHJlY2F0ZSBpdHMgaW9tbXUgYmFja2VuZHMgaW4gZmF2b3Igb2YgYSBu
ZXcgc2hhcmVkDQo+IHVzZXJzcGFjZSBpb21tdWZkIGludGVyZmFjZS4gIFdlIGV4cGVjdCB0byBo
YXZlIGJhY2t3YXJkcyBjb21wYXRpYmlsaXR5DQo+IHZpYSB0aGF0IGludGVyZmFjZSwgYnV0IGFz
IFFFTVUgbWlncmF0aW9uIHN1cHBvcnQgZm9yIHZmaW8tcGNpIGRldmljZXMNCj4gaXMgZXhwZXJp
bWVudGFsIGFuZCB0aGVyZSBhcmUgZGVzaXJlcyBub3QgdG8gY29uc29saWRhdGUgZGlydHkgcGFn
ZQ0KPiB0cmFja2luZyBiZWhpbmQgdGhlIGlvbW11IGludGVyZmFjZSBpbiB0aGUgbmV3IG1vZGVs
LCBpdCdzIG5vdCBjbGVhciBpZg0KPiB0aGUga2VybmVsIHdpbGwgY29udGludWUgdG8gZXhwb3Nl
IHRoZSBjdXJyZW50IGRpcnR5IHBhZ2UgdHJhY2tpbmcuDQo+IA0KPiBBSVVJLCB3ZSdyZSBleHBl
Y3RpbmcgdG8gc2VlIHBhdGNoZXMgb2ZmaWNpYWxseSBwcm9wb3NpbmcgdGhlIGlvbW11ZmQNCj4g
aW50ZXJmYWNlIGluIHRoZSBrZXJuZWwgInNvb24iLiAgVGhhbmtzLA0KPiANCg0KDQoJSeKAmW0g
bm90IHZlcnkgY29uY2VybmVkIGFib3V0IHdoaWNoIGhvc3Qga2VybmVsIGRyaXZlcnMgUUVNVSB3
aWxsDQppbnRlcmFjdCB3aXRoLCBhcyB2ZmlvLXVzZXIgZG9lc27igJl0IHRhbGsgdG8gYW55IG9m
IHRoZW0uICBJIGFtIGludGVyZXN0ZWQNCmluIHRoZSBkYXRhIHN0cnVjdHVyZXMgYmVpbmcgdXNl
ZC4gIFdpbGwgdGhleSByZW1haW4gZGlydHkgYml0bWFwIGJhc2VkLA0Kb3IgaXMgYSBkaWZmZXJl
bnQgc3RydWN0dXJlIGJlaW5nIGVudGVydGFpbmVkPw0KDQoJCQkJCQkJCUpKDQoNCg0K

