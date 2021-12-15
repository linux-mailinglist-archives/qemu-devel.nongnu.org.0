Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 153F4475D35
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 17:18:33 +0100 (CET)
Received: from localhost ([::1]:48646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWzA-0002iK-6s
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 11:18:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWXE-0001lc-9R
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:49:40 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:60718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWXB-0007bi-RF
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:49:39 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFEKAAW010344; 
 Wed, 15 Dec 2021 15:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=UXFcvUSn7EaMG7AGmRe0wjsIus1JI4MGI02YGdS6+xE=;
 b=eyZuRFzFovKYFocw9Whf+uIM+V5+py2ZLOWQqetfB8l0FBh9reIPNOLjA5CsuKPaSyoT
 9eykY/nUfHDAcXOVTGG1qLls+yN3wQ8PcnSWyvm1tAKijuirVt6Cg8ixiT3XLK6Wi1dg
 VtEThyuOChbYAYiIFSLmDfENFi30xW2/f8vmQZFB2XW3gXd1Z/QEL21QDEk6xNNM34nR
 T+E0QcJzOjAqdEfigXyzozt/9B6Maolmu3Z033fatnKhEq6q/JD+Wv7kmNUYffugPXY2
 zodmShaZQzvZ3PpI3k5l2hoLlJKEv7a+EVxyIcbQfExI1kGUc1L9wywXPfxyHxOxkHtX Ug== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx5akf07g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:49:35 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFkXhm157788;
 Wed, 15 Dec 2021 15:49:34 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2045.outbound.protection.outlook.com [104.47.73.45])
 by aserp3020.oracle.com with ESMTP id 3cxmrc1a7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:49:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mywJSKYP5fzeb4SWEWWO33qOKzmti7SL61lzw6QZD6F4wD07fzQh+Ur1pfeSnx+L47MMMXwyqp4c4e4PUb1sVQ27/Qi9aiHAllHkP12YieBpL1TphpAAxhdLpjT40dQ4TGTJeB9gMIGKUhok7jXjdM2/BMrSgJPW/Hesa9qNtWKdBsrAFx0v6XdP/T8w9gvWSyHF1Lu8rCb/PMxM6aoC0K+DmaEoRuVoTh+CWKmtWYSCUX9ljsAAGm5VCDe4KCadRLk519LeC61XSvaTs2n7ZDZXWeTMfvdVTF8PLhOxoyA8eICkAMmgAMn56j8KzIgQPcyBrHr5QrfLsLN+QxWAEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXFcvUSn7EaMG7AGmRe0wjsIus1JI4MGI02YGdS6+xE=;
 b=Eie03ZDb8RMMRhIVdFcy/XGFH/PoJ95+iH8SSF1n1HTT85xyAFq2RpB0rdX7sXT7q4A3L7R31PabZ032XnpmDU5fyPQt7hf/+BArUefYPOvcFwbTxgS/IfVDkBeko16/ezf4JqifM0oAKX9D3KlKgP910VgP7yhZFY9+ONBU6b3yOi2mFyjc39ThA5BnlOGUQkusLrj8QXz+ncT8CQyfTZXhilpPnwBY0D1asn+649rWoFi61DfTB3ke3az4TaMg+PY0G1/OyplXT9iqDLFLf/WO9g6QVuO8lmhlGOb+gGAo2UJSCRoMQYg27Wj3zGOMsA2FJGv/F9mHxpSJfaAO3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXFcvUSn7EaMG7AGmRe0wjsIus1JI4MGI02YGdS6+xE=;
 b=f+BU+WrEO2KdSoDl2GoRPPgoyrrxgHEyX64LJqTLhS7wcxZtyQJQbpDX/9QMH43zABM/yRQILf2fCa0LM21tyMTG+ss7wXw7TT7PY4MnXB8zC+ivDAV3FEkVImLBq6mCTuuu6R2hsITngWj1aUvVpyeuaYLxyyQOLXeDqzj/y9s=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB4237.namprd10.prod.outlook.com (2603:10b6:208:1dc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 15:49:32 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%5]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 15:49:32 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 11/12] vfio-user: register handlers to facilitate
 migration
Thread-Topic: [PATCH v3 11/12] vfio-user: register handlers to facilitate
 migration
Thread-Index: AQHXvmCLC0AeScKEyUu2nHU+gyyom6vnRKCAgEzVUYA=
Date: Wed, 15 Dec 2021 15:49:32 +0000
Message-ID: <F48606B1-15A4-4DD2-9D71-2FCAFC0E671F@oracle.com>
References: <cover.1633929457.git.jag.raman@oracle.com>
 <9f85493af346c32d34cca3622e8293053b5c7440.1633929457.git.jag.raman@oracle.com>
 <YXmauWJFaVBtdUFq@stefanha-x1.localdomain>
In-Reply-To: <YXmauWJFaVBtdUFq@stefanha-x1.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 514938df-62e9-4d77-0191-08d9bfe27cbb
x-ms-traffictypediagnostic: MN2PR10MB4237:EE_
x-microsoft-antispam-prvs: <MN2PR10MB4237E2AD1C5C1F365C2A23EB90769@MN2PR10MB4237.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W/Qil/WeuAhqvIlkStnuRNRrPh0oB5Z6b3VQpCI0eWTc9IuOvjYpHk7t1khpFhr29jiw3RBZp0RW3JZVhaoE1Zt+a2ifQc77gI1haLSdk3xP0gFUrhL8l/G4p+JR+ba0B1fdyJKYd6+dEu0It2pQti79DBF1T/pzfGlEjiViPPYHRDpIANPt1/3T6YDkDQmu7Cpaorj9Kr+IWRrOdKeIGV0uQj0Too7tM1wzqbzXNiC/iITTmUQBtPBCJwX4ATWkVWJL0PGaWubCz82rf0l4SkVMzUOpgmDXxKuhYfdBNMUwI8oUU/O5rXEIqaZxOM7sswfe/t1xvHmvmyq/qpfxcbTgdESEZb+xMh9oHW+8MigX02H2+pPrpUGMW+i7/ekFynKta2irEcVbLaWAoHlsCgZN9tqQ9L4EXcNw43V2Bf5xelHXV0ytphAjfVMvo9LULfmdbb67QQ8fKCJH7bdDzYu7h9oN1ZY7q1VtWOT3Zv9f+gMS1dFf6aN0GvwYQFgRs0sfIjhDRFiFGBBm6YhayUg7lTuAGX+YVL1oY+h43lDBq2och78a8Fc9P6NLLXrykCBZLUQOda3uV/UJQAh+gVE6euHd6pga4UEptSB9148YRFW8MjCzMcC8oKCoS4t3NgG69iow52FifEJI5UdmqG0ZvGnA16ZfFYAn4Tdxduw2dstT1qsY9gh5UDCnGuQqbhshaWjAqru1HIjHNqn+u8MRrxw/UFbusf+SUlg1rlk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(7416002)(6486002)(4326008)(33656002)(71200400001)(44832011)(8676002)(186003)(66446008)(66476007)(66946007)(2616005)(86362001)(508600001)(6916009)(8936002)(54906003)(38100700002)(38070700005)(5660300002)(316002)(53546011)(76116006)(83380400001)(36756003)(64756008)(66556008)(6512007)(122000001)(6506007)(2906002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TUV4b1FWdVFqb2l1TnZRYlBWUElsajRLT0dYVXdpcUNJNHJBMDRDWXV2WU4x?=
 =?utf-8?B?cVJXYzJSa0hsS25HUkRCTXZjSGVpUzBjNEo0MDJ5MHpoV1NFbXZxaTEzVk85?=
 =?utf-8?B?MElCQjhQT1BxaER0YnRmSk1jbDRnSUpyQ3hWeW9DWUpNc0ZBd0kyb3ltMmls?=
 =?utf-8?B?R2ZCeDhLV0tTT1g0TXd2QjZPT3FjUmtUVmVoOGpyaWQrMGhJRzhkcDJJVGdT?=
 =?utf-8?B?eUZSb1IyNkdjVkIvM29zRng1ZnhIbzN0YmJQTGdRVmxRSkdodGhmNjJOQUFB?=
 =?utf-8?B?NEFmZ0Q0NWtUM2cvelgycVNLMkJqaVUyR2Nua2ZhVk4zWTBLWVNvRVRDaUdo?=
 =?utf-8?B?OXlVQzgrQVFXMlM0dC9JZUlWQUtNcXEzUS9oS0puVXRIY1RkOTV5Q01DbFdp?=
 =?utf-8?B?aEJyVHhqZVRERi9uYXBNWG1peG9NeWRqVlZ0OUhFdVBML0xDUUd6K1FBTWRZ?=
 =?utf-8?B?UWtGbUFLRks3c1ZLb1NOUE8yUGlFeUMzOUlNYzRXaG1pVEhGZUJIQUcxNW5H?=
 =?utf-8?B?RTRMS2l2dENWd3pPbEhwV0FPek95Z2hyWjZwNitjUnlzdVJDLzMyM1VDVnR2?=
 =?utf-8?B?U0I0TGNQMmFUVnk4OUdVb3Y3T3RrL0dWYkpBYVJLL3FrNjlubUVRaEwwZ2lJ?=
 =?utf-8?B?ZjdlMUR5VXk0cnJjbWEzckxyQTJic2RWUVRHWEtqcUhOUGxXUUNVNUNTaTky?=
 =?utf-8?B?VVFQZTluWHhHdUZBS1JMZEswbzdPem5RYUVIUHdwdVJzbFQrS29Ndnk4dFBJ?=
 =?utf-8?B?bHJkYUsrN1FhZUM3Z3VLemh5MnYxM0VXekhCVU5UOVg2NUwwR0Z1ZCtrVEQ5?=
 =?utf-8?B?bDUwMjF1VGJsQXhsK1FvY1YyTWpvc2FSNVUrK0taQzVwTWJpbzZ6WGU4Ym9C?=
 =?utf-8?B?TG9NNVlUVnp6eHN1dkpOckVUMy9FTC9NdFpoM3h5aUx1TXRsVnI5bFFyNlpv?=
 =?utf-8?B?b0UwS1hZY3FyMFIvZnhGRTQ5THNEdUJJd2NKR0M0UW9PVm0rc2wwa2gvbEY2?=
 =?utf-8?B?MEQ0UmQyVUJVMHpwY2lSNGJqU1g3SFRGTktzdCs5ZTllVHdhanVQL3BzUmV0?=
 =?utf-8?B?dXU0MUdMR1QrWHFHRU0rdk53dkl6LzlEK0s4TEVZMFhjL256bTIvYnN6U1M5?=
 =?utf-8?B?UHZ0ZVJVVUw5WmFkN01Tbmpnek94cDZKTE9Gd1d0b0dwekp2L0hEbXRXYmJk?=
 =?utf-8?B?Vi9zN0lQL1VqaTNtRDBGZmExWWxYa2hheTEwZlY1ZUlxYTIwT0l5dFZ6Zzhy?=
 =?utf-8?B?UGwwYVdEdVJGdWM3S0Q3MDhZMXppN0JwdlpTUUZqK0pQclAwWVdiMFZqUnlp?=
 =?utf-8?B?WE1XQmpkd0JlbmxqMkVMMGZlb25zd2liZ1VnVzFVTVFMNzF2czAvQWxYNWI4?=
 =?utf-8?B?aS9DaUFxUU9rS0xtSmc5S3d0RnVpa1UxelZmSVNBRDdTelVzWmt1VmNjbjFI?=
 =?utf-8?B?Z2IvemRjTld1N05IWTBGNjEwL05QM0JRSUhrVkY1Zjl1NHI2SGgvS0FURjJD?=
 =?utf-8?B?S20raWpVUGY5bkhDT0VKNUJITmhXMDN3aVNGSW9WSVRZdGI1ejN5cUt6cFlS?=
 =?utf-8?B?aXdQNmNpMG5VZC96eG1UZ1M4R0tJeldLWWhHdXB6U05PTU0vaFhjWVdZbWI5?=
 =?utf-8?B?QTd1SzdRaHBKdE5tcEpDOUN1MFZXRDhsRVZrZEpDRDRMekZ5TWYrYmJ1a01o?=
 =?utf-8?B?Szh0VWJuY2tHU3JWaHArTmRIT3NFNzByUW0rbnFCSmt4MGU5Qlh4WmxoVkdh?=
 =?utf-8?B?YVZtYmQzTEp1S3ZReElzNkF6TXMyMHNwRmgxR1E3dXcySU9rKy96ZEFqeTdw?=
 =?utf-8?B?OWxVNWdTbENuNGlYd3RoMkNMVlpGY05YR0FiKythSmIwMXpkeFhWbVMwWkVj?=
 =?utf-8?B?U2FoQVNHdm95UUNhSWE5M1VWR0JqUVlUZzlBU0NTUGFLRlJSWC85MU1FaE1Z?=
 =?utf-8?B?YlMxTDhYVmdGdTVncVlDbWhsR2J6N1F5WVF2Z3VVd2haNzhINDVuUzRIMVhz?=
 =?utf-8?B?blNldmFndG9IT1ZmbUVSK0JsbUoyU0dGUXZHTDU3TjdrdXNnejFkcHVoOGI3?=
 =?utf-8?B?ZHVzNHR3Mkl4aVJOWjNVSkU4dlZwYkRXSTlwb2RETnNkZkVvOGgrME9qNlV5?=
 =?utf-8?B?SkVsTDN5UlcydTBTamRoaGNwRmVCcldtZ3AwS3lNaWgrazRLWU5KdlM1by9T?=
 =?utf-8?B?ZlUyejdBWjNjK1hleXdJRUQ5OU5YbW1pelFSOHpHUFJxTUJleGovaGdtcE9x?=
 =?utf-8?B?eWYzY0R0MXdMMjh1OHhLVFZ2OG1nPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B203E7366F5A64FBF7F34BFBAFFA06B@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 514938df-62e9-4d77-0191-08d9bfe27cbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 15:49:32.4374 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AokheaeA/7z70xuUTNy2zrC21y0odIF4xQxmzhYjnABVPz8KVkmCtmNf4NcOtUpYxqlwWjzJlYlltbJDQDYypg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4237
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150090
X-Proofpoint-GUID: 00PfOzFlUKsnjSjCOoBR7x5FRHDBn_Uq
X-Proofpoint-ORIG-GUID: 00PfOzFlUKsnjSjCOoBR7x5FRHDBn_Uq
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
 "thuth@redhat.com" <thuth@redhat.com>,
 "swapnil.ingle@nutanix.com" <swapnil.ingle@nutanix.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "philmd@redhat.com" <philmd@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gT2N0IDI3LCAyMDIxLCBhdCAyOjMwIFBNLCBTdGVmYW4gSGFqbm9jemkgPHN0ZWZh
bmhhQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gTW9uLCBPY3QgMTEsIDIwMjEgYXQgMDE6
MzE6MTZBTSAtMDQwMCwgSmFnYW5uYXRoYW4gUmFtYW4gd3JvdGU6DQo+PiArc3RhdGljIHZvaWQg
dmZ1X21pZ19zdGF0ZV9ydW5uaW5nKHZmdV9jdHhfdCAqdmZ1X2N0eCkNCj4+ICt7DQo+PiArICAg
IFZmdU9iamVjdCAqbyA9IHZmdV9nZXRfcHJpdmF0ZSh2ZnVfY3R4KTsNCj4+ICsgICAgVmZ1T2Jq
ZWN0Q2xhc3MgKmsgPSBWRlVfT0JKRUNUX0dFVF9DTEFTUyhPQkpFQ1QobykpOw0KPj4gKyAgICBz
dGF0aWMgaW50IG1pZ3JhdGVkX2RldnM7DQo+PiArICAgIEVycm9yICpsb2NhbF9lcnIgPSBOVUxM
Ow0KPj4gKyAgICBpbnQgcmV0Ow0KPj4gKw0KPj4gKyAgICAvKioNCj4+ICsgICAgICogVE9ETzog
bW92ZSB0byBWRlVfTUlHUl9TVEFURV9SRVNVTUUgaGFuZGxlci4gUHJlc2VudGx5LCB0aGUNCj4+
ICsgICAgICogVk1TRCBkYXRhIGZyb20gc291cmNlIGlzIG5vdCBhdmFpbGFibGUgYXQgUkVTVU1F
IHN0YXRlLg0KPj4gKyAgICAgKiBXb3JraW5nIG9uIGEgZml4IGZvciB0aGlzLg0KPj4gKyAgICAg
Ki8NCj4+ICsgICAgaWYgKCFvLT52ZnVfbWlnX2ZpbGUpIHsNCj4+ICsgICAgICAgIG8tPnZmdV9t
aWdfZmlsZSA9IHFlbXVfZm9wZW5fb3BzKG8sICZ2ZnVfbWlnX2ZvcHNfbG9hZCwgZmFsc2UpOw0K
Pj4gKyAgICB9DQo+PiArDQo+PiArICAgIHJldCA9IHFlbXVfcmVtb3RlX2xvYWR2bShvLT52ZnVf
bWlnX2ZpbGUpOw0KPj4gKyAgICBpZiAocmV0KSB7DQo+PiArICAgICAgICBlcnJvcl9zZXRnKCZl
cnJvcl9hYm9ydCwgInZmdTogZmFpbGVkIHRvIHJlc3RvcmUgZGV2aWNlIHN0YXRlIik7DQo+PiAr
ICAgICAgICByZXR1cm47DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgcWVtdV9maWxlX3NodXRk
b3duKG8tPnZmdV9taWdfZmlsZSk7DQo+PiArICAgIG8tPnZmdV9taWdfZmlsZSA9IE5VTEw7DQo+
PiArDQo+PiArICAgIC8qIFZGVV9NSUdSX1NUQVRFX1JVTk5JTkcgYmVnaW5zIGhlcmUgKi8NCj4+
ICsgICAgaWYgKCsrbWlncmF0ZWRfZGV2cyA9PSBrLT5ucl9kZXZzKSB7DQo+IA0KPiBTZWUgYmVs
b3cgYWJvdXQgbWlncmF0ZWRfZGV2cy4NCj4gDQo+PiArICAgICAgICBiZHJ2X2ludmFsaWRhdGVf
Y2FjaGVfYWxsKCZsb2NhbF9lcnIpOw0KPj4gKyAgICAgICAgaWYgKGxvY2FsX2Vycikgew0KPj4g
KyAgICAgICAgICAgIGVycm9yX3JlcG9ydF9lcnIobG9jYWxfZXJyKTsNCj4+ICsgICAgICAgICAg
ICByZXR1cm47DQo+PiArICAgICAgICB9DQo+PiArDQo+PiArICAgICAgICB2bV9zdGFydCgpOw0K
Pj4gKyAgICB9DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyB2b2lkIHZmdV9taWdfc3RhdGVfc3Rv
cCh2ZnVfY3R4X3QgKnZmdV9jdHgpDQo+PiArew0KPj4gKyAgICBWZnVPYmplY3QgKm8gPSB2ZnVf
Z2V0X3ByaXZhdGUodmZ1X2N0eCk7DQo+PiArICAgIFZmdU9iamVjdENsYXNzICprID0gVkZVX09C
SkVDVF9HRVRfQ0xBU1MoT0JKRUNUKG8pKTsNCj4+ICsgICAgc3RhdGljIGludCBtaWdyYXRlZF9k
ZXZzOw0KPj4gKw0KPj4gKyAgICAvKioNCj4+ICsgICAgICogbm90ZTogY2FsbGluZyBiZHJ2X2lu
YWN0aXZhdGVfYWxsKCkgaXMgbm90IHRoZSBiZXN0IGFwcHJvYWNoLg0KPj4gKyAgICAgKg0KPj4g
KyAgICAgKiAgSWRlYWxseSwgd2Ugd291bGQgaWRlbnRpZnkgdGhlIGJsb2NrIGRldmljZXMgKGlm
IGFueSkgaW5kaXJlY3RseQ0KPj4gKyAgICAgKiAgbGlua2VkIChzdWNoIGFzIHZpYSBhIHNjcy1o
ZCBkZXZpY2UpIHRvIGVhY2ggb2YgdGhlIG1pZ3JhdGVkIGRldmljZXMsDQo+IA0KPiBzL3Njcy9z
Y3NpLw0KPiANCj4+ICsgICAgICogIGFuZCBpbmFjdGl2YXRlIHRoZW0gaW5kaXZpZHVhbGx5LiBU
aGlzIGlzIGVzc2VudGlhbCB3aGlsZSBvcGVyYXRpbmcNCj4+ICsgICAgICogIHRoZSBzZXJ2ZXIg
aW4gYSBzdG9yYWdlIGRhZW1vbiBtb2RlLCB3aXRoIGRldmljZXMgZnJvbSBkaWZmZXJlbnQgVk1z
Lg0KPj4gKyAgICAgKg0KPj4gKyAgICAgKiAgSG93ZXZlciwgd2UgY3VycmVudGx5IGRvbid0IGhh
dmUgdGhpcyBjYXBhYmlsaXR5LiBBcyBzdWNoLCB3ZSBuZWVkIHRvDQo+PiArICAgICAqICBpbmFj
dGl2YXRlIGFsbCBkZXZpY2VzIGF0IHRoZSBzYW1lIHRpbWUgd2hlbiBtaWdyYXRpb24gaXMgY29t
cGxldGVkLg0KPj4gKyAgICAgKi8NCj4+ICsgICAgaWYgKCsrbWlncmF0ZWRfZGV2cyA9PSBrLT5u
cl9kZXZzKSB7DQo+PiArICAgICAgICBiZHJ2X2luYWN0aXZhdGVfYWxsKCk7DQo+PiArICAgICAg
ICB2bV9zdG9wKFJVTl9TVEFURV9QQVVTRUQpOw0KPiANCj4gVGhlIG9yZGVyIG9mIHRoZXNlIHR3
byBmdW5jdGlvbnMgaXMgcmV2ZXJzZWQgaW4gbWlncmF0aW9uL21pZ3JhdGlvbi5jLg0KPiBGaXJz
dCB3ZSBwYXVzZSB0aGUgVk0sIHRoZW4gd2UgaW5hY3RpdmF0ZSBkaXNrcy4NCj4gDQo+IEkgdGhp
bmsgd2UgbmVlZCB0byB6ZXJvIG1pZ3JhdGVkX2RldnMgaW4gY2FzZSBtaWdyYXRpb24gZmFpbHMg
YW5kIHdlIHRyeQ0KPiB0byBtaWdyYXRlIGFnYWluIGxhdGVyOg0KPiANCj4gIG1pZ3JhdGVkX2Rl
dnMgPSAwOw0KPiANCj4gVGhpcyBpcyBzdGlsbCBub3QgcXVpdGUgcmlnaHQgYmVjYXVzZSBtYXli
ZSBvbmx5IGEgZmV3IFZmdU9iamVjdHMgYXJlDQo+IHN0b3BwZWQgYmVmb3JlIG1pZ3JhdGlvbiBm
YWlscy4gQSBkaWZmZXJlbnQgYXBwcm9hY2ggZm9yIGNvdW50aW5nDQo+IGRldmljZXMgaXMgbmVj
ZXNzYXJ5LCBsaWtlIHplcm9pbmcgbWlncmF0ZWRfZGV2cyBpbg0KPiB2ZnVfbWlnX3N0YXRlX3N0
b3BfYW5kX2NvcHkoKS4NCg0KSGkgU3RlZmFuLA0KDQpJIHVuZGVyc3RhbmQgdGhhdCBpdOKAmXMg
aW1wb3J0YW50IHRvIGRldGVjdCBjYW5jZWxsYXRpb24uIEhvd2V2ZXIsIEnigJltIG5vdCBzdXJl
IGhvdw0KdG8gZ28gYWJvdXQgZG9pbmcgaXQuDQoNClRoZSBkaWZmaWN1bHR5IGlzIHRoYXQgdGhl
IG1pZ3JhdGlvbiBjYWxsYmFja3MgYXJlIHBlciBkZXZpY2UvVkZJTyBjb250ZXh0LiBUaGVyZSBp
cw0Kbm8gZ2xvYmFsIGNhbGxiYWNrIHRvIGluZGljYXRlIHdoZW4gYWxsIHRoZSBkZXZpY2VzIGhh
dmUgYmVlbiBtaWdyYXRlZCBzdWNjZXNzZnVsbHkuDQoNCldlIGNvdWxkIHByb2JhYmx5IGhhdmUg
YSBiaXRtYXAgb2YgZGV2aWNlc+KAmSBtaWdyYXRpb24gc3RhdHVzLCBhbmQgc2V0IGl0IHdoZW4N
Cm1pZ3JhdGlvbiBkYXRhIHdhcyBzZW50IHRvIGNsaWVudD8gV2hlbiBtaWdyYXRpb24gaXMgY2Fu
Y2VsbGVkIGFuZCB0aGUgc3RhdGUNCnN3aXRjaGVzIHRvIHJ1bm5pbmcsIHdlIGNvdWxkIGNoZWNr
IHRoaXMgYml0IGFuZCBkZXRlY3QgY2FuY2VsbGF0aW9uPw0KDQo+IA0KPj4gQEAgLTQyMiw2ICs3
MjIsMzUgQEAgc3RhdGljIHZvaWQgdmZ1X29iamVjdF9tYWNoaW5lX2RvbmUoTm90aWZpZXIgKm5v
dGlmaWVyLCB2b2lkICpkYXRhKQ0KPj4gICAgICAgICByZXR1cm47DQo+PiAgICAgfQ0KPj4gDQo+
PiArICAgIC8qDQo+PiArICAgICAqIFRPRE86IFRoZSAweDIwMDAwIG51bWJlciB1c2VkIGJlbG93
IGlzIGEgdGVtcG9yYXJ5LiBXZSBhcmUgd29ya2luZyBvbg0KPj4gKyAgICAgKiAgICAgYSBjbGVh
bmVyIGZpeCBmb3IgdGhpcy4NCj4+ICsgICAgICoNCj4+ICsgICAgICogICAgIFRoZSBsaWJ2Zmlv
LXVzZXIgbGlicmFyeSBhc3N1bWVzIHRoYXQgdGhlIHJlbW90ZSBrbm93cyB0aGUgc2l6ZSBvZg0K
Pj4gKyAgICAgKiAgICAgdGhlIGRhdGEgdG8gYmUgbWlncmF0ZWQgYXQgYm9vdCB0aW1lLCBidXQg
dGhhdCBpcyBub3QgdGhlIGNhc2Ugd2l0aA0KPj4gKyAgICAgKiAgICAgVk1TRHMsIGFzIGl0IGNh
biBjb250YWluIGEgdmFyaWFibGUtc2l6ZSBidWZmZXIuIDB4MjAwMDAgaXMgdXNlZA0KPj4gKyAg
ICAgKiAgICAgYXMgYSBzdWZmaWNpZW50bHkgbGFyZ2UgYnVmZmVyIHRvIGRlbW9uc3RyYXRlIG1p
Z3JhdGlvbiwgYnV0IHRoYXQNCj4+ICsgICAgICogICAgIGNhbm5vdCBiZSB1c2VkIGFzIGEgc29s
dXRpb24uDQo+PiArICAgICAqDQo+PiArICAgICAqLw0KPiANCj4gTXkgcXVlc3Rpb24gZnJvbSB0
aGUgcHJldmlvdXMgcmV2aXNpb24gd2FzIG5vdCBhbnN3ZXJlZDoNCj4gDQo+ICBsaWJ2ZmlvLXVz
ZXIgaGFzIHRoZSB2ZnVfbWlncmF0aW9uX2NhbGxiYWNrc190IGludGVyZmFjZSB0aGF0IGFsbG93
cyB0aGUNCj4gIGRldmljZSB0byBzYXZlL2xvYWQgbW9yZSBkYXRhIHJlZ2FyZGxlc3Mgb2YgdGhl
IHNpemUgb2YgdGhlIG1pZ3JhdGlvbg0KPiAgcmVnaW9uLiBJIGRvbid0IHNlZSB0aGUgaXNzdWUg
aGVyZSBzaW5jZSB0aGUgcmVnaW9uIGRvZXNuJ3QgbmVlZCB0byBiZQ0KPiAgc2l6ZWQgdG8gZml0
IHRoZSBzYXZldm0gZGF0YT8NCg0KSW4gYm90aCBzY2VuYXJpb3MgYXQgdGhlIHNlcnZlciBlbmQg
LSB3aGV0aGVyIHVzaW5nIHRoZSBtaWdyYXRpb24gQkFSIG9yDQp1c2luZyBjYWxsYmFja3MsIHRo
ZSBtaWdyYXRpb24gZGF0YSBpcyB0cmFuc3BvcnRlZCB0byB0aGUgb3RoZXIgZW5kIHVzaW5nDQp0
aGUgQkFSLiBBcyBzdWNoIHdlIG5lZWQgdG8gc3BlY2lmeSB0aGUgQkFS4oCZcyBzaXplIGR1cmlu
ZyBpbml0aWFsaXphdGlvbi4NCg0KSW4gdGhlIGNhc2Ugb2YgdGhlIGNhbGxiYWNrcywgdGhlIGxp
YnJhcnkgdHJhbnNsYXRlcyB0aGUgQkFSIGFjY2VzcyB0byBjYWxsYmFja3MuDQoNClRoYW5rIHlv
dSB2ZXJ5IG11Y2ghDQotLQ0KSmFnDQoNCg==

