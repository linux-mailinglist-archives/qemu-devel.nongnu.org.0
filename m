Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E45A5F7A91
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 17:31:41 +0200 (CEST)
Received: from localhost ([::1]:42064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogpK7-0007A0-5Z
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 11:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ogoP5-0003lA-3A; Fri, 07 Oct 2022 10:32:43 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:62826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <miguel.luis@oracle.com>)
 id 1ogoOz-0006JK-Qm; Fri, 07 Oct 2022 10:32:39 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 297BwtVI003425;
 Fri, 7 Oct 2022 14:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=+ZwA6qWtzlMGEMEIiPi5ZCWwkWrm+k1M3Xbkam1l/7M=;
 b=QlsfIk9Ibo5+pAyRg+H5z04R4vsACPebirhLO7nL8qnXngTCCoHPz1uHpNILKqMpIwTa
 5UaPRLbVtbj+Gn1nmXG2dHpN+OQ7X61BibYcA5IXQHKD9s6ChoqURJwszNsoFsPKBq9/
 +8d69FzTkbl/FwqdGxNzHmHKQyrhfrG/EsoJzz9hEFi5qDbu7HJuXEO2QL/+jZ85l6xP
 1LsSdXamWggfcyIUmy8myQIeu/WvCBpmTv8dli2oOj2+NO3GacDPIIP/jzWUB9q9Gr3O
 CQ+fz1HUx96Z7FJcyCX4OyeDBW/dUgOt/+Wz8oZ1B34F/4ffqII7lHRZgRnEshVFsgcU Jg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k15up6ktq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Oct 2022 14:32:33 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 297E8pFC000572; Fri, 7 Oct 2022 14:32:32 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3jxc06w5fj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Oct 2022 14:32:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DFtqA+J2linQKKJ3PpgRuYhG53wDx6ktBwyVHFL3w6zp5/rOAcft8bbs4ywBa14Es94VWXtcCzsruxcqUAcl173OiU2V8FN8/GlG1Bb52y+nmyrF1Ebrih5bn60RUhJDC1hCxjFx9nrBgVS0O7YZwDp4JgQ63Dn6gOiLgEDEZO/bVpsqA0Y/deOGswL/sLF5gbiowtWk7ENqOKKJz4QhGY1UQINRyJWzU2UWsefYD8urHtPMvJt7fabIEYu9Sz9Jxjo0B0NrenM+YYPMffRG8RwYWQR5H0b5bBZWFuaBAkxXv4kp9+mg4jIEZJ6uoAMK/AJelWSK1u3IaxDU7j1jiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ZwA6qWtzlMGEMEIiPi5ZCWwkWrm+k1M3Xbkam1l/7M=;
 b=aednEaNd9tMmvIqnCY3CwkuholT40Tul8JFUsi0meZ7cu/JL6WDMS1vxE+DUWxuIDKTEA0WQujaHBRl+ZIh8wUIv0OmdMeT9VFxfdbT6JNxcMgvdqt+uBuVzy934zRACwpzXJrGO0+Jn3I+fzmqvlb54LXxdqLcL0k4J/bTM5MB6KiZVDwQvgxOLoXCxIpNVoPjSnsRvUkq4F8MhvgwWThbyvYWpFZPxRixPuY0mdwyzbyNJPUu9MkoyfLGcpB4MWwF+4IYVcKW4G3v1g5CkjcgFE8R4VjZopo31Cw6i0sSRkbOVwbS3by01V/J83spX/CUiB0TT6lWbdfRvxZ4HfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ZwA6qWtzlMGEMEIiPi5ZCWwkWrm+k1M3Xbkam1l/7M=;
 b=A6tLLPq5UN8xU+z1gk1Ja/lfXK4n0mWbQsOJ7wgI3qxSOBnRNxMwelwwbJXaALV0+8ThcTA1/rUVYFXdQVhTJkn2PJPewTawbCjxmJE5tjTv6s8DuboDlNjGojUaiUggVveWyHwK18fa/hoIDp/b814xfny5gQXjN7H2tS10t5k=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by BN0PR10MB4871.namprd10.prod.outlook.com (2603:10b6:408:128::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Fri, 7 Oct
 2022 14:32:30 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::4c04:3c29:4a50:d882]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::4c04:3c29:4a50:d882%6]) with mapi id 15.20.5709.015; Fri, 7 Oct 2022
 14:32:30 +0000
From: Miguel Luis <miguel.luis@oracle.com>
To: Ani Sinha <ani@anisinha.ca>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "mst@redhat.com" <mst@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>, "shannon.zhaosl@gmail.com"
 <shannon.zhaosl@gmail.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>
Subject: Re: [External] : Re: [PATCH 3/3] tests/acpi: virt: update ACPI GTDT
 binaries
Thread-Topic: [External] : Re: [PATCH 3/3] tests/acpi: virt: update ACPI GTDT
 binaries
Thread-Index: AQHYzQ1KCn7TbHLvOUCJOI4DZiGyO63pPUqAgBnb2wA=
Date: Fri, 7 Oct 2022 14:32:30 +0000
Message-ID: <7221FAF0-40E9-4371-A590-0FB8311D064D@oracle.com>
References: <20220920162137.75239-1-miguel.luis@oracle.com>
 <20220920162137.75239-4-miguel.luis@oracle.com>
 <e69478d3-12d4-f47-ae82-1c0f878bd8@anisinha.ca>
In-Reply-To: <e69478d3-12d4-f47-ae82-1c0f878bd8@anisinha.ca>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB5433:EE_|BN0PR10MB4871:EE_
x-ms-office365-filtering-correlation-id: fa0bb14a-b662-45b1-a543-08daa870c3d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OjazEZ6dGA+IWSX7uVfHIiOkKsVkL0hdiWuV9n4DvI9Aw0t9p1zndmZcvIhdXel/LfW7T50A5cblvQOQpBYsOB07fxyH+pN8cOWQOgfcpgNMe1gxg+m5A98kbsRbDKGGFbSFv34caNNV7F4UhJt7Q9r/hJyRkjtDCbYNWVkisrpWf9O/EkpMaIT/3TKendtyVe341JQsj8BS8uuJuXDLLxDdfPngRCipzNxwtCS0NNgx8O6G5KrkdYMZgH6e5AoLDcmd0DLk9jCkvnV9w3LWD70PSxi7d5vQcLGzJwLQFhEhXazfoZi2sDEvIVH3NMWHJlxl01gz4TRl7NEbkqTDPummo/Qj+yljPQr7YcWpLEOGDTl4H7pPxShdA4EYU8hrSbTlVKdMNO15OINF+F+ssgKHomqMRezdDwH8TUFysWt47rdBAKQsWpR0b8PA3LZDdXXxJ23Numft6t/vb1sYa557TO4XtMHW37TVhPvaWKzxxUlMONy6xCjFzrp1d31R2MiUJt4c/65YwamfoWP8DKKiXGFBrq+pxSlA8X7zR+eDJPFHjA8mlSRxsLNKnkBeuJ6RJu/kdvrAzmlxroIzvAHk3endfiGDiEwDDuLgxjNTuMABEBR1PNHTDZF/m2hoCfHTTUA3Mn0/Bhh5K6oyXFfBiBPj0ES9R+x1cLsjKcbkN5Z+iUH1ZMaJ41R3GOz/1B1yqaEkOhGQV+Ja8pzt6p3Zug4DTcMSQhFHLZSy0j6vyEU63sr1RZ4vx+raesSFOFSXyqBBbUY5DzQK917HwcafYVkhBPZzerE10cvmKpQqGvJddtYdOu7jC/pESaD7E/ZR52/TfjQlOJCQZ0bFRA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5433.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199015)(36756003)(86362001)(122000001)(186003)(33656002)(83380400001)(38070700005)(38100700002)(2616005)(6506007)(53546011)(6512007)(478600001)(41300700001)(54906003)(71200400001)(2906002)(44832011)(316002)(5660300002)(66476007)(6916009)(6486002)(8676002)(4326008)(66556008)(64756008)(91956017)(66446008)(66946007)(76116006)(8936002)(45980500001)(505234007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ek9JMXFpbTJrMFJZQ082WGsvSVJMZWR1SDVaYStETHBBWEoxbndNb1YzUlRa?=
 =?utf-8?B?MzJSbkVoN01ML3NCOGZ1eGt6SXFOU3hvYU1jbE5SK0dWYWk4VjVBdUFmc2tj?=
 =?utf-8?B?cWIwb2NhU3dnRGZjNEhxVEN3V2tOVk5VSUQ4UXVpSVllT0RJa0dSWDhNamdO?=
 =?utf-8?B?bjFxYXZKME43enVkZXE4MkNXRTB1aDlkTFNDUGNkSkpSSG1PSWtHRHR4a3VL?=
 =?utf-8?B?d1J3MC9OWWhNRG5UK2FqTXV0M0FqajlyV2VMeUtUOE9wMk1vUGtzZGN4cjNn?=
 =?utf-8?B?QUdyeDNZTEpDSEZkVm1HVklNV2JwL09KWTdOYUlaM0poRGVHeG8ralJHOTRS?=
 =?utf-8?B?V2NVaFpidGVOVEl4Mmp5eFR1ZmtTdkk2VzUyRjVOZUFNcjBvUFdnSzI3Vmpa?=
 =?utf-8?B?Y3V6emFJRVIxdEVvYWlQYWtnYlpuRUdqR1BPQk1UbTk1b0h2RnhON0puRjNN?=
 =?utf-8?B?MVhKUXZWSkUrQzlJa2E0VFg2MFJueUpUMVllUnZQakQzRmxiVDFOclFGc3ZN?=
 =?utf-8?B?VW84SUgvVmJmMG1BeGZMOGVjRFVVWnk1emV5SVBsR2ZDeHNyVThMcW5xOFpZ?=
 =?utf-8?B?R01JQlhZd1V6RjROc1NNLzJ6VmljQTExcjV2aWJpNzUvdFYrWExsQXUzd0kr?=
 =?utf-8?B?Uys2ZGhXZDJudWwzRm9hMmRxa0FKWXBVYW1wMDc4NWlBOXllMmlLeG93NTQ4?=
 =?utf-8?B?Y1pqU2QyL040WkJJQlh0NEJTWlV1THhVV1lRNC9MV3pDb1BwYUdsYmVRZE04?=
 =?utf-8?B?NUpGdTQyT3pCNDIrVXgxWndhR2tGY2ROVHlmUHNERDdZWlNYR2YzM3J1aVpQ?=
 =?utf-8?B?SFhWUFkwSW5nUFFwZkMzdDhFVUV6SVgwVnJTMEgyWmw2Y1VOajhOSFdyQmx0?=
 =?utf-8?B?c1BiaDUvM2llQThiTEdlSml4c0dld3FZWk05M1pGLzJVRUt1MG5hSUJwUGRM?=
 =?utf-8?B?TFliVk9Va1FCOGtud2JuY1BRcnBDYXVmbGExQmVIeTVNaVN3Q0tJOWllOWFu?=
 =?utf-8?B?dFFRWTBSTTB0VDZNWlNnV2tkZjNDZ2k4MzFacURSblYwSWpXbGptNGU1aS9O?=
 =?utf-8?B?dUw1REF1OW0rMnVwdFhoRGswM28vNExyVDROSXUyMXRaM0lJWFFZMHpQQWdJ?=
 =?utf-8?B?ajEycHpBc2NWOStPZGh0YlJXNU8xUks0NjNJMml6MkZodzVzTit2WWxGR2hF?=
 =?utf-8?B?c1JaWkI2TjZGUzU2YjdGUlJBQWt1UmhSR2plNUxwTTIxWHZzMm8waEpST0oy?=
 =?utf-8?B?MEg1VUF3YTRJVFpTT3RpMk42WnZPTHNpQ2dYdW8zMVJEV0M0T1lBeUJSU09E?=
 =?utf-8?B?bElocDdiV1FOUDFJR0F4aVpiaHJOc2VFUHZDMUNVMFhTa3JrVXh3S0FvMVp2?=
 =?utf-8?B?bTRSOUpQT2FRSERhYld3WmVDbFB1aVVyKzlFTE5xaWl2LzgyaWVyQUNubTJo?=
 =?utf-8?B?MjRFejUyeHh6Q3hteDR3MjZ3NnpGMEV0aW13M0k0V1JZRklPMnQzR1FnTWZR?=
 =?utf-8?B?SVExSnRYNG5YVWROMHZ0YU1mVVZSb2RDblQ2Z2RUQWUxeVRPQkc2NWJLYlBY?=
 =?utf-8?B?VUk5WkgyVXI5ejJJejdhbUlZTTRDV0ZvYzVWU1JTWjBIWUlnejUva2RXRGZy?=
 =?utf-8?B?Rk5iNzc5YzcyMlJGM2pHYms0YTRpZm9xSXJubGJVRklzUnRTNzFmRkJZa2c5?=
 =?utf-8?B?N0pXUUlvdGNnaE5EL2FDeHVRazRGdHBWZVBCankvVExXbnllOVZ4V2tPeXMx?=
 =?utf-8?B?MjlmMkcyOFR6WnVJNlhhVUk2Qm9qVWZIZGtHeUZzT2Q1SXhVL1JlRnRucEpi?=
 =?utf-8?B?dU9nQ3RQdS9sRG1DRzY4dUkxQm8rNkxhaXQ5NWw0azFDaDB3ekJUL2pUSTc1?=
 =?utf-8?B?bi80T0tKTVR3ZnpLUHovTENjMzRySmMzWDNIL1lhNjZLcWJrZHBNdnE5d1Np?=
 =?utf-8?B?UUliNy9HbHNUem1SMWFtcmdIc090RzBCYkZ1b1V0T0lHQnYxTzJpaXdhNFJn?=
 =?utf-8?B?UHJUZVdFVm5UTWFrWGtieU91KzEyMUN4b0Z3TmE4amI0QXRXNHJuTWs1Mk9q?=
 =?utf-8?B?aGpiSzYyUmtST3B5U1pTUzVxWDEzSjNhUEZZd2p2bndxMlNjaXlFUHVIcTNv?=
 =?utf-8?B?cE92Nzc2QVA1V2I2bkpZeVl4R2ZYN1RVZmdaUnNMWXdUYmlINzYxOXBQL3Az?=
 =?utf-8?Q?X5eVr0E2lREQ5DFHgNlTOSE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B7723D9F79ACD4DB0C003CFA98D7CDD@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa0bb14a-b662-45b1-a543-08daa870c3d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 14:32:30.1658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CWArOEmKLvmXQrWdm+J8h0rQF9ikf7EqAk38cBaiALBRtEgrOZJSMUfvUZTf7IFU+kxTCxMHEB/kDblXf+xBOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4871
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 spamscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210070087
X-Proofpoint-GUID: X_ZALPLz7zY2ntTgEK_653GMCYVHrOep
X-Proofpoint-ORIG-GUID: X_ZALPLz7zY2ntTgEK_653GMCYVHrOep
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

DQo+IE9uIDIxIFNlcCAyMDIyLCBhdCAwMzozOSwgQW5pIFNpbmhhIDxhbmlAYW5pc2luaGEuY2E+
IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiBUdWUsIDIwIFNlcCAyMDIyLCBNaWd1ZWwgTHVpcyB3
cm90ZToNCj4gDQo+PiBTdGVwIDYgJiA3IG9mIHRoZSBiaW9zLXRhYmxlcy10ZXN0LmMgZG9jdW1l
bnRlZCBwcm9jZWR1cmUuDQo+PiANCj4+IERpZmZlcmVuY2VzIGJldHdlZW4gZGlzYXNzZW1ibGVk
IEFTTCBmaWxlcyBmb3IgR1REVDoNCj4+IA0KPj4gICAgQEAgLTEzLDE0ICsxMywxNCBAQA0KPj4g
ICAgIFswMDBoIDAwMDAgICA0XSAgICAgICAgICAgICAgICAgICAgU2lnbmF0dXJlIDogIkdURFQi
ICAgIFtHZW5lcmljIFRpbWVyIERlc2NyaXB0aW9uIFRhYmxlXQ0KPj4gICAgIFswMDRoIDAwMDQg
ICA0XSAgICAgICAgICAgICAgICAgVGFibGUgTGVuZ3RoIDogMDAwMDAwNjANCj4+ICAgICBbMDA4
aCAwMDA4ICAgMV0gICAgICAgICAgICAgICAgICAgICBSZXZpc2lvbiA6IDAyDQo+PiAgICAtWzAw
OWggMDAwOSAgIDFdICAgICAgICAgICAgICAgICAgICAgQ2hlY2tzdW0gOiA4Qw0KPj4gICAgK1sw
MDloIDAwMDkgICAxXSAgICAgICAgICAgICAgICAgICAgIENoZWNrc3VtIDogOUMNCj4+ICAgICBb
MDBBaCAwMDEwICAgNl0gICAgICAgICAgICAgICAgICAgICAgIE9lbSBJRCA6ICJCT0NIUyAiDQo+
PiAgICAgWzAxMGggMDAxNiAgIDhdICAgICAgICAgICAgICAgICBPZW0gVGFibGUgSUQgOiAiQlhQ
QyAgICAiDQo+PiAgICAgWzAxOGggMDAyNCAgIDRdICAgICAgICAgICAgICAgICBPZW0gUmV2aXNp
b24gOiAwMDAwMDAwMQ0KPj4gICAgIFswMUNoIDAwMjggICA0XSAgICAgICAgICAgICAgQXNsIENv
bXBpbGVyIElEIDogIkJYUEMiDQo+PiAgICAgWzAyMGggMDAzMiAgIDRdICAgICAgICBBc2wgQ29t
cGlsZXIgUmV2aXNpb24gOiAwMDAwMDAwMQ0KPj4gDQo+PiAgICAtWzAyNGggMDAzNiAgIDhdICAg
ICAgICBDb3VudGVyIEJsb2NrIEFkZHJlc3MgOiAwMDAwMDAwMDAwMDAwMDAwDQo+PiAgICArWzAy
NGggMDAzNiAgIDhdICAgICAgICBDb3VudGVyIEJsb2NrIEFkZHJlc3MgOiBGRkZGRkZGRkZGRkZG
RkZGDQo+PiAgICAgWzAyQ2ggMDA0NCAgIDRdICAgICAgICAgICAgICAgICAgICAgUmVzZXJ2ZWQg
OiAwMDAwMDAwMA0KPj4gDQo+PiAgICAgWzAzMGggMDA0OCAgIDRdICAgICAgICAgU2VjdXJlIEVM
MSBJbnRlcnJ1cHQgOiAwMDAwMDAxRA0KPj4gICAgQEAgLTQ2LDE2ICs0NiwxNiBAQA0KPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVHJpZ2dlciBNb2RlIDogMA0KPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBvbGFyaXR5IDogMA0KPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQWx3YXlzIE9uIDogMA0KPj4gICAg
LVswNTBoIDAwODAgICA4XSAgIENvdW50ZXIgUmVhZCBCbG9jayBBZGRyZXNzIDogMDAwMDAwMDAw
MDAwMDAwMA0KPj4gICAgK1swNTBoIDAwODAgICA4XSAgIENvdW50ZXIgUmVhZCBCbG9jayBBZGRy
ZXNzIDogRkZGRkZGRkZGRkZGRkZGRg0KPj4gDQo+PiAgICAgWzA1OGggMDA4OCAgIDRdICAgICAg
ICAgUGxhdGZvcm0gVGltZXIgQ291bnQgOiAwMDAwMDAwMA0KPj4gICAgIFswNUNoIDAwOTIgICA0
XSAgICAgICAgUGxhdGZvcm0gVGltZXIgT2Zmc2V0IDogMDAwMDAwMDANCj4+IA0KPj4gICAgIFJh
dyBUYWJsZSBEYXRhOiBMZW5ndGggOTYgKDB4NjApDQo+PiANCj4+ICAgIC0gICAgMDAwMDogNDcg
NTQgNDQgNTQgNjAgMDAgMDAgMDAgMDIgOEMgNDIgNEYgNDMgNDggNTMgMjAgIC8vIEdURFRgLi4u
Li5CT0NIUw0KPj4gICAgKyAgICAwMDAwOiA0NyA1NCA0NCA1NCA2MCAwMCAwMCAwMCAwMiA5QyA0
MiA0RiA0MyA0OCA1MyAyMCAgLy8gR1REVGAuLi4uLkJPQ0hTDQo+PiAgICAgICAgIDAwMTA6IDQy
IDU4IDUwIDQzIDIwIDIwIDIwIDIwIDAxIDAwIDAwIDAwIDQyIDU4IDUwIDQzICAvLyBCWFBDICAg
IC4uLi5CWFBDDQo+PiAgICAtICAgIDAwMjA6IDAxIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwICAvLyAuLi4uLi4uLi4uLi4uLi4uDQo+PiAgICArICAgIDAwMjA6
IDAxIDAwIDAwIDAwIEZGIEZGIEZGIEZGIEZGIEZGIEZGIEZGIDAwIDAwIDAwIDAwICAvLyAuLi4u
Li4uLi4uLi4uLi4uDQo+PiAgICAgICAgIDAwMzA6IDFEIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDFF
IDAwIDAwIDAwIDA0IDAwIDAwIDAwICAvLyAuLi4uLi4uLi4uLi4uLi4uDQo+PiAgICAgICAgIDAw
NDA6IDFCIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDFBIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAvLyAu
Li4uLi4uLi4uLi4uLi4uDQo+PiAgICAtICAgIDAwNTA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAvLyAuLi4uLi4uLi4uLi4uLi4uDQo+PiAgICArICAg
IDAwNTA6IEZGIEZGIEZGIEZGIEZGIEZGIEZGIEZGIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwICAv
LyAuLi4uLi4uLi4uLi4uLi4uDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IE1pZ3VlbCBMdWlzIDxt
aWd1ZWwubHVpc0BvcmFjbGUuY29tPg0KPiANCj4gQWNrZWQtYnk6IEFuaSBTaW5oYSA8YW5pQGFu
aXNpbmhhLmNhPg0KPiANCg0KVGhhbmsgeW91IGZvciB0aGUgdGFncyBBbmkuIEnigJl2ZSBjb2xs
ZWN0ZWQgdGhlbSBhbmQgd2lsbCBzcGluIHYyIHNvb24uDQoNClRoYW5rcywNCk1pZ3VlbA0KDQo+
PiAtLS0NCj4+IHRlc3RzL2RhdGEvYWNwaS92aXJ0L0dURFQgICAgICAgICAgICAgICAgICAgfCBC
aW4gOTYgLT4gOTYgYnl0ZXMNCj4+IHRlc3RzL2RhdGEvYWNwaS92aXJ0L0dURFQubWVtaHAgICAg
ICAgICAgICAgfCBCaW4gOTYgLT4gOTYgYnl0ZXMNCj4+IHRlc3RzL2RhdGEvYWNwaS92aXJ0L0dU
RFQubnVtYW1lbSAgICAgICAgICAgfCBCaW4gOTYgLT4gOTYgYnl0ZXMNCj4+IHRlc3RzL3F0ZXN0
L2Jpb3MtdGFibGVzLXRlc3QtYWxsb3dlZC1kaWZmLmggfCAgIDMgLS0tDQo+PiA0IGZpbGVzIGNo
YW5nZWQsIDMgZGVsZXRpb25zKC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS90ZXN0cy9kYXRhL2Fj
cGkvdmlydC9HVERUIGIvdGVzdHMvZGF0YS9hY3BpL3ZpcnQvR1REVA0KPj4gaW5kZXggOTQwOGI3
MWI1OWMwZTBmMjk5MWMwMDUzNTYyMjgwMTU1YjQ3YmMwYi4uNmY4Y2I5YjhmMzBiNTVmNGM5M2Zl
NTE1OTgyNjIxZTNkYjUwZmViMiAxMDA2NDQNCj4+IEdJVCBiaW5hcnkgcGF0Y2gNCj4+IGRlbHRh
IDQ1DQo+PiBrY21ZZEQ7QnBVZjJ9eGpKVXxeYXZreFBvPktOTCpWUTR4VCNmcyRZVjBMSD07bmc5
UioNCj4+IA0KPj4gZGVsdGEgNDUNCj4+IGpjbVlkRDtCcFVmMn14akpVfHtOKiRSKSlBV1ByZyQ5
VGZvPjglNl5Gb3khRTgNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2RhdGEvYWNwaS92aXJ0
L0dURFQubWVtaHAgYi90ZXN0cy9kYXRhL2FjcGkvdmlydC9HVERULm1lbWhwDQo+PiBpbmRleCA5
NDA4YjcxYjU5YzBlMGYyOTkxYzAwNTM1NjIyODAxNTViNDdiYzBiLi42ZjhjYjliOGYzMGI1NWY0
YzkzZmU1MTU5ODI2MjFlM2RiNTBmZWIyIDEwMDY0NA0KPj4gR0lUIGJpbmFyeSBwYXRjaA0KPj4g
ZGVsdGEgNDUNCj4+IGtjbVlkRDtCcFVmMn14akpVfF5hdmt4UG8+S05MKlZRNHhUI2ZzJFlWMExI
PTtuZzlSKg0KPj4gDQo+PiBkZWx0YSA0NQ0KPj4gamNtWWREO0JwVWYyfXhqSlV8e04qJFIpKUFX
UHJnJDlUZm8+OCU2XkZveSFFOA0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvdGVzdHMvZGF0YS9hY3Bp
L3ZpcnQvR1REVC5udW1hbWVtIGIvdGVzdHMvZGF0YS9hY3BpL3ZpcnQvR1REVC5udW1hbWVtDQo+
PiBpbmRleCA5NDA4YjcxYjU5YzBlMGYyOTkxYzAwNTM1NjIyODAxNTViNDdiYzBiLi42ZjhjYjli
OGYzMGI1NWY0YzkzZmU1MTU5ODI2MjFlM2RiNTBmZWIyIDEwMDY0NA0KPj4gR0lUIGJpbmFyeSBw
YXRjaA0KPj4gZGVsdGEgNDUNCj4+IGtjbVlkRDtCcFVmMn14akpVfF5hdmt4UG8+S05MKlZRNHhU
I2ZzJFlWMExIPTtuZzlSKg0KPj4gDQo+PiBkZWx0YSA0NQ0KPj4gamNtWWREO0JwVWYyfXhqSlV8
e04qJFIpKUFXUHJnJDlUZm8+OCU2XkZveSFFOA0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvdGVzdHMv
cXRlc3QvYmlvcy10YWJsZXMtdGVzdC1hbGxvd2VkLWRpZmYuaCBiL3Rlc3RzL3F0ZXN0L2Jpb3Mt
dGFibGVzLXRlc3QtYWxsb3dlZC1kaWZmLmgNCj4+IGluZGV4IDk1N2JkMWI0ZjYuLmRmYjg1MjNj
OGIgMTAwNjQ0DQo+PiAtLS0gYS90ZXN0cy9xdGVzdC9iaW9zLXRhYmxlcy10ZXN0LWFsbG93ZWQt
ZGlmZi5oDQo+PiArKysgYi90ZXN0cy9xdGVzdC9iaW9zLXRhYmxlcy10ZXN0LWFsbG93ZWQtZGlm
Zi5oDQo+PiBAQCAtMSw0ICsxIEBADQo+PiAvKiBMaXN0IG9mIGNvbW1hLXNlcGFyYXRlZCBjaGFu
Z2VkIEFNTCBmaWxlcyB0byBpZ25vcmUgKi8NCj4+IC0idGVzdHMvZGF0YS9hY3BpL3ZpcnQvR1RE
VCIsDQo+PiAtInRlc3RzL2RhdGEvYWNwaS92aXJ0L0dURFQubWVtaHAiLA0KPj4gLSJ0ZXN0cy9k
YXRhL2FjcGkvdmlydC9HVERULm51bWFtZW0iLA0KPj4gLS0NCj4+IDIuMzYuMA0KPj4gDQo+PiAN
Cg0K

