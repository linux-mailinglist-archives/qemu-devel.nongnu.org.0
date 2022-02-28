Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A354C7898
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 20:16:55 +0100 (CET)
Received: from localhost ([::1]:53794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOlVt-00051L-G0
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 14:16:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nOlTp-0003mi-6N
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:14:45 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:5194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nOlTk-0008QM-KH
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 14:14:44 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21SIJqZ2009906; 
 Mon, 28 Feb 2022 19:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=/hH+SGl2i/At7/36liB3xMgbGo0Zqyj1JF9UBNxO+Tc=;
 b=dmtNGa4FLIiozPpnT+t7BFkPlb9UfYpSGiHmGCdtemKkcSQV1n3t0LG85pR7hkE633g8
 pvazswe28wrxja3zldR3hKtCBEY+HcAuQyyvwlmuzZrDA5Y6jmOS7dnWU5TW70HLi75N
 Tvj/53SlbIJu1PhlXbl6pQ+jbBEw3EWj4DAr0myr9fv3UG3xyEphlcRBz3vi4DCoI0/T
 9K5q8Lr8IJzJeli7mdqr6u07Eb8ea39wsgcYsnF+viutc2tKdSN2BakciO6+uK7Rahy8
 gy5uGzAeC2fk95hSSfcj7MmUONuIIYh/yibKPobF70qQOe0DU6uBfYNIUqjhS8kgrc53 1Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3eh14brpnr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 19:14:25 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21SIjtL3115923;
 Mon, 28 Feb 2022 19:14:24 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2042.outbound.protection.outlook.com [104.47.57.42])
 by userp3030.oracle.com with ESMTP id 3ef9avyn1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 19:14:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMT0BppEkEGemdpBDSBCPVgv9mXXBJtE0ADtapTMaSd7MIzWk4vIDYDxNpsWd7y3MPm3xwq0/L6Si0aQbyEdUptB9p9mntdQWaUHMXUNwV4mLbloFVhCNqThqRwxu4yTAthzL8x8DS0TxlZCNsqbbNXl8fppllM5Xp8bCHtanB6x383ZBb8mC4iOLjQJ53LksdH6rW0NhVtp8J4WIAwMFVajufAO82BUwHzRTENKzmbk7dpar8EIpFf4rGCQaBLgfLRuBz2s6E5To8by25EuetKyGmzn7my0jJ+RjLiWaI36Sk9JCxEo4+t7qI/K2kPUblSEaJFEddY5d+5Tlk286w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hH+SGl2i/At7/36liB3xMgbGo0Zqyj1JF9UBNxO+Tc=;
 b=mBVrr4Tx74En6fO7QlwJmXUKHZ7qaehKlyL57hnV8A/xGVReZtpReyES5auwBUyFdUzxe/CaSBrg+Fr9FM3K53/vO3gK7F26d89ljabjI2PTRluHHl+k+FgcNg91M0cPbqJ4OHz19dT3gywUTkhAmYN7hiEebSP2GX6oxPFWzxj78DH6qR0i2w8KRLGGlT0IrOjPjsUG1R9cJuzByOHCp+Tx9usV636ly08wfkVG9EXMZzIfe/5O27tShQszHBH/O7gMnsbbk4JuyH2Mk2F3BLgY9jj0FMdH80lXSlft6nClG7Fb9bzQcO5h+//1gKzCE0c5AR7lDDd5F4y+AE+Xgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hH+SGl2i/At7/36liB3xMgbGo0Zqyj1JF9UBNxO+Tc=;
 b=0LltcATH40IeBLnbSmPJ2CM/ey1ptNWRFGU7eb7ejsrF/KEngHtGzz5X3wCLf72vtV4R8TPgR9hrTxUWJhsmITsKNN8sHcwRpSvSQqHxAFA5Fxq2OV/kkOL02GAEkNjfHg112WR0uf5kT+zZj/HBPQKVezrkycdzLE8NvR7RQHI=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MW5PR10MB5668.namprd10.prod.outlook.com (2603:10b6:303:1a3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Mon, 28 Feb
 2022 19:14:21 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%4]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 19:14:21 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v6 07/19] vfio-user: define vfio-user-server object
Thread-Topic: [PATCH v6 07/19] vfio-user: define vfio-user-server object
Thread-Index: AQHYI8rnKM9j1seOjkuZ9f3gst03I6yeKkOAgAs87QA=
Date: Mon, 28 Feb 2022 19:14:21 +0000
Message-ID: <DD1CDEFD-D610-4A03-BDF5-4CC38A639CD2@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <309a6afc6f47d7e812a6f18ce591dff092efbb06.1645079934.git.jag.raman@oracle.com>
 <YhOxteVSJd3GpqkK@stefanha-x1.localdomain>
In-Reply-To: <YhOxteVSJd3GpqkK@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 546f4ec2-0528-4f50-a050-08d9faee869d
x-ms-traffictypediagnostic: MW5PR10MB5668:EE_
x-microsoft-antispam-prvs: <MW5PR10MB56688A2FF6C5FBC2C0AE44F790019@MW5PR10MB5668.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KyyuFxtj671oZ7cjXS0qEn65NJ13wSA7a+MbqDXixQEdPfEn8PM+eQoTs+anfzC1QxgiCwYjqGhT39c5vYEj0qPDvtp/vNQrt3wlf08jo6EUYDLcdVOt60xF9UU9WbXTWwgbVfwnsXCASNgKZ0dz71qlRSVVpA42lqPM2RG5+UgOJM19dTEVnebWm8ed7n84gJ2ama6b4xSpoUYTjquHPGvh2wcxsvOb9ZXqDogy9NSp1MZBwEGehMDg0e5fnrJ1Q1rKdd8E3zAmd/slbQ8M87/8QqXJCXXbvyOvIZaD/V3pZ6eYUVFhaB4TKknXuZppge5YC1/v54N0Hq2D6BxTrYQwt0yhbZlW2wbS4uhZAb9KCqfgECfbnt/FLruCP+WdgoPQHPCsVYbJvZ+HJQq87s6ZimtWWJTyaeWUuqjqeQ827MufYFHrj/2IAv2X/SK3DMEzs7P88vXt9aRswBCBViad1CRYvwp6Pqn8yDWh0S2xVYPpb4Lpycen+fDxCNHsC2X8dO0QBIOAru5y2FhK0/9OnGH3QjNs7+dI5LMOwYDfzKR5yCYc2EnhQNrowSGpM6lGTiAANPcjWds65T+pelQmKWcTCy0UnsobySICqeIi35+zCX+PAfDGvKTJn9QJR+lggWmGKiYUT6z9xiObYVW92HN+75uSsTWUOxTNifxKOwvaa4+efDPpGk+JM8PI3Pja+rZPTExx5AGqQVGLsJMa+H63uMDPB3c/KNM/dLBsPe3hSonnAeV8Hl3qg5ex
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(6486002)(71200400001)(6916009)(8936002)(44832011)(4744005)(186003)(2616005)(54906003)(8676002)(4326008)(91956017)(66556008)(66446008)(64756008)(36756003)(76116006)(66946007)(66476007)(33656002)(2906002)(7416002)(5660300002)(107886003)(53546011)(38100700002)(122000001)(316002)(6506007)(6512007)(38070700005)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RG9UMS9mTFYvbk1uZHVBWXZvaUhZa0JXbjBkVlZvZk8xSWlLbEh6VXp3R1d5?=
 =?utf-8?B?QzFzcWYxUHRsN3A4cmhxWUZWVkdaMnl0MzhtOEpqVzVWb2tsNC9YWUY1UVBH?=
 =?utf-8?B?Qm41Uy9TblRnL0QrenlDNzZQMVNETUM0Y2NiSVJ1Z0xxclJ3Znpvb05hUjZZ?=
 =?utf-8?B?cFVrbjN2cncxZWxZbmNJalMrM09kZ3ZpdjZOL2l3amZqRU9wcmVxb2hnNmlT?=
 =?utf-8?B?cTRMN08rS1JXVjl1T0ZNbk1OSSt4MHZEaXNRcEhxbjIwbUZBNUtEQXBLRzBK?=
 =?utf-8?B?L1JWUE1TRmptc1habWN3di9jOGF2NkF2L09QeVBCVnd5S2NnOVlJUURrL1Qz?=
 =?utf-8?B?MTlHVHl5Q1lTVlAyb1E2aWk5NmlrRzBqSlNsMnpqNE8xeUtIMlMrTlVBbmtF?=
 =?utf-8?B?aVh6aHQ2aC9sbldWc2grNFVoT2N3ZFVnSng1ZGxTTWlQc04zWUFKbmhxa0dL?=
 =?utf-8?B?SXJzdnZrcXcrUzA5bmtjZVdsTjFtNzRBazRjYlNhS21hS1RFaFlpVzUwcEwv?=
 =?utf-8?B?Q2EvZm45N3hTVHdlOFY1clpCNkhQT21iU1Z6eEVSMG9zSk5YOU4zN2djQTU3?=
 =?utf-8?B?UlZQU21qblBuN29Ld3N3MWtlVmNmN3VjZkJERjE1dTRxUElEdmRZVUxGd1B0?=
 =?utf-8?B?L3Vvc0U3YnZiR2pyM2J5QWVZcXJnbDBGcTJ6K0U0a2tFbVUxVlVmanQzYlRU?=
 =?utf-8?B?SkwwQ2VQRWZRckdrd1BvR283R2lEVC9zd2NvcVRVVXc1V01DR0VVNjh0Q2JP?=
 =?utf-8?B?b3NSb0J2SWJGRVlnbVBwNEt1U2g0aDRCYXJ5c2RWT0g2c2FsVXVVZmNFNEd0?=
 =?utf-8?B?RmNDbklycTkyOFJQZ0pwVmRycTN2dW9RTUtwRVk2cWY3ZGhGQVpEZ3Uxemxo?=
 =?utf-8?B?NmlHVkhsVzJVdUt0QUZjeXhHL1dzaE1OMTdaV3N1SnZCV3VDUjFaaDdpbHly?=
 =?utf-8?B?dTgySURCQmI3RzFtaXJRWHJxNUgzMnVzYVNoWGZhdi9ad2ZZZzR2V2xXbU00?=
 =?utf-8?B?NTRvK0dhUGFMMUNSZk84aVN2VW81K09ReFQ2T3ErejYvUTRERTUrUnlmZWxs?=
 =?utf-8?B?UWlVbXB0Z3dya1U0ZllvVTNSaEpTUllZdmROck1sa0h6TllmdE5ydDQyRVNO?=
 =?utf-8?B?THp5d2Vwb3Q5SVU3M2NXLzdNbTN3V3hvaXdrSEhUQUxkOHpVcVBlUFgwREN6?=
 =?utf-8?B?RVlxZGhvcHc4dm1QNjJGZ2hOWDJ3Y0libG5SQ3JjamNzQVFBc0V5S05PMFJX?=
 =?utf-8?B?eHd5VnpkdW9GM0xBTDAxYmZydkJLTERxc2lPaWlGNXJpUEwxTHJOTk5KRzVQ?=
 =?utf-8?B?dzBkdlM2SlE5SFJxMEk0YjRHYVZ3LzBhMnl0S1dIU1h2MXFjZGkwcGVCdHNp?=
 =?utf-8?B?VUZiTDU1bTJjVG9tbTJPYXFyOFRqOGhXNWUya252N2tZRk4yUkdwdXlLU041?=
 =?utf-8?B?WmR6eFZkMmZvK0VPTEJPNzV6WFhzZGtrZ09pb2pJd0xET2hvRzVWYTlhS0dB?=
 =?utf-8?B?Y3drYW1Sa2t6ZWxHZDFHbHNsOHVPRUJLTG43djNyaWRhQ0d4Tmg0RXJFT1dZ?=
 =?utf-8?B?Z0hodWxHQUoySktkUHdoQkpFTm1pYlp0cmUzNEtoNVBia2EvNng4a0IvRUpk?=
 =?utf-8?B?SHFCdkdxY0UzcnJYbnpGOFJ5M0tVVU5zMVErc3VqQ2NOMy94TmhwUTlCSm1w?=
 =?utf-8?B?UEZybURUMXRXazUyalViQVI2ZHVCQzJMdlRWZzJIT2FRY3prelZWMlhXMDIy?=
 =?utf-8?B?S1krQVVyQUxtMUh2QzMzeUtJUG5aMGhpMDU1MERBMktCTm9BNkFBRlZmdzUz?=
 =?utf-8?B?S08wbDNVTFdEd1ZLY2draW5iNTRzblRjdVhmcEpEb0t0TzM1d0wxeVgxM3M0?=
 =?utf-8?B?UVMxQkRVeklPZmRtc05kNHEvQysyQW1XRW91a2Znbmw3dmMwZWRzZ250LzB1?=
 =?utf-8?B?SFAzYUpTOS9IRDE1dE9FOEd0Q0xhOVkrMmpTdGNnOXBJdmdEVVJSdndrdE9P?=
 =?utf-8?B?UGZzVXpSd3FDT0RQTHF5NGNSNEN6OUtDNmtQRVZhbzJsUkNKbWtqVk9rakJM?=
 =?utf-8?B?L3ZtRFhWRXhFbUpvWUZERGdLMFMzYXByd1hKTUpJYVlqMXdCeGNYOHp4OTFk?=
 =?utf-8?B?WFVxWG5rNXpYMDNBSlVpK0NHcXV1N2pQZFhJQTduZHRJZmwyWFk0TnB1TEd4?=
 =?utf-8?B?dTJUZFdwbDl6TXNRc09vRnUrMXBEUkdSTGUwQUppZDg1ZXJ3WjlKZ2tEVUtI?=
 =?utf-8?B?U0JYU041QlI1emU4RDgrOXJwY3hBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E290B6678AD61B4B87593470A524790D@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 546f4ec2-0528-4f50-a050-08d9faee869d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 19:14:21.6179 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DRWGJjHjtu+7+naO3bRauBDd7ZLc2l8tSOgHLjd75eMqxET8y4xdZ181/MeWeY1UwkwSstqyyd5NG7SnqzsVcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5668
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10272
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 malwarescore=0
 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202280094
X-Proofpoint-GUID: xXXclWUskuqDi_X7V_1umQWEU3CthQr0
X-Proofpoint-ORIG-GUID: xXXclWUskuqDi_X7V_1umQWEU3CthQr0
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gRmViIDIxLCAyMDIyLCBhdCAxMDozNyBBTSwgU3RlZmFuIEhham5vY3ppIDxzdGVm
YW5oYUByZWRoYXQuY29tPiB3cm90ZToNCj4gDQo+IE9uIFRodSwgRmViIDE3LCAyMDIyIGF0IDAy
OjQ4OjU0QU0gLTA1MDAsIEphZ2FubmF0aGFuIFJhbWFuIHdyb3RlOg0KPj4gK3N0cnVjdCBWZnVP
YmplY3RDbGFzcyB7DQo+PiArICAgIE9iamVjdENsYXNzIHBhcmVudF9jbGFzczsNCj4+ICsNCj4+
ICsgICAgdW5zaWduZWQgaW50IG5yX2RldnM7DQo+PiArDQo+PiArICAgIC8qDQo+PiArICAgICAq
IENhbiBiZSBzZXQgdG8gc2h1dGRvd24gYXV0b21hdGljYWxseSB3aGVuIGFsbCBzZXJ2ZXIgb2Jq
ZWN0DQo+PiArICAgICAqIGluc3RhbmNlcyBhcmUgZGVzdHJveWVkDQo+PiArICAgICAqLw0KPj4g
KyAgICBib29sIGF1dG9fc2h1dGRvd247DQo+IA0KPiBUaGlzIGZpZWxkIGlzIGludHJvZHVjZWQg
YnV0IGl0IGlzIGhhcmRjb2RlZCB0byB0cnVlLiBJcyB0aGVyZSBhIHdheSB0bw0KPiBzZXQgaXQg
dG8gZmFsc2U/DQoNCldlIGNvdWxkIGFkZCBhIHByb3BlcnR5IHRvIOKAmVRZUEVfUkVNT1RFX01B
Q0hJTkXigJkgd2hpY2ggaW5kaWNhdGVzIGlmDQppdCB3b3VsZCBydW4gYXMgYSBzZXJ2ZXIvZGFl
bW9uLg0KDQpUaGFuayB5b3UhDQotLQ0KSmFnDQoNCg0K

