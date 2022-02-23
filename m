Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FFA4C19D0
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 18:21:12 +0100 (CET)
Received: from localhost ([::1]:43168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMvKA-0002I1-FA
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 12:21:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nMvIQ-0001YC-3R
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 12:19:23 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:29044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nMvIJ-0002ai-Rm
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 12:19:20 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21NH72NM018680; 
 Wed, 23 Feb 2022 17:19:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Qw2VU5+BY4wrGBJdIaerKEpdhHHF2ngZpgfjt+QYxK0=;
 b=EWg8hwvgExDZyVEneRGiPQWLDe+RCxBS1PTU82iT9z4pPrebpBx4OntZ4lH2atT1NNgC
 1MI50pUy7q3CfSmSQNgODkkMlBpLMQSqypPrvgrdIS+6xgIsNZHkGpDWINF5TkT99Q9I
 EJ1dRJ3RJrI5zUsxD3ByJ2qBS3wV8erGkfwhj67sA0zDeftofxO/YEm7TUns/oV4ZD7y
 Cz5qlaLogF1UZPNkvVD/biCX7E8fld/L2svCF0LE0FeOZQOsyFZQhYogzgue2O/94x8/
 fcXMUkDFZqYQZtE3j7f3HrVPkllfTowhVhweVNoj7M+7y7VDFLG9/B51xNGDR/+ZB0hx wQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ectsx4ymp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 17:19:06 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21NHBdN6182877;
 Wed, 23 Feb 2022 17:19:05 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by userp3030.oracle.com with ESMTP id 3eannw68f5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 17:19:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fRpugmNId+9qJqAzw3/XGRwMxMENGJA1o3xKmRSntCbeN/Y8Y7MAnfEl36L3c7UZ9aUcyZUOJyW06sNbJ2AuQX6sR6sVTRtFBgPZxFsaxZ9Plf0v2Z7IvjADP0yrodfzYJeoID+qU/bjIqU+PliDPxKRMmHo59hcT7DXuqJ9dbS36tGlNnRFGIbVai2j27b8ZkdQXsY1aoS3Wy5cGOomOOtdIiCuiHAsofRqfzfJYzIXqPW3i4Dai1Quy0OCDj0e/+spd1vMbX9Y04vViaw6VeIPEKGR3OcoWXVZ8mTaKDFFu4L7HdKJvk87M45Oewc6z6LO47rHNCz5az3VQRIp2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qw2VU5+BY4wrGBJdIaerKEpdhHHF2ngZpgfjt+QYxK0=;
 b=hMOXKdJNY8eIRzOv1aaH+TeWwI8OPd8ttJCMQlggDJvreGEESyzRraILgq96ajfEEUUwt+1yA5lGh0ju4ClsoAwjR/kX2HRnZxxTvSM63RktwoA8d92qDgKOG7ckHmYQr1PLKM0V8Fy91qRSsIBDvUSz/L1KItzCS1pOyVLXf5LhjsPL07a+7yDwHW6UdbQGxmEFpi6ZhORe91LR49RYnN+fTYnKoqsTvrGTBiFWREniPoCFEhoif+vAXO6jsJfQrX4UO+L53vBcVPxcFGNFTetcYf52pvqqc/+22alzWCyNH2kmjVCexkKjzhowgSqT5zxvVmCbSeXvZEZiDqARKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qw2VU5+BY4wrGBJdIaerKEpdhHHF2ngZpgfjt+QYxK0=;
 b=cuwiU28EGUqutv+016Vc/LvgiWVJMjBAoGquEjVpdpNfRtnhp4RIEuYfsZilGhqkCs1sYYl2QDDsrk8zqejpjYItge0HowAAN3kqY6aeGcU7KY5DkxqTCjTzmzH5K2Dtz8OkTxRaY5zmNs8KfVNMU3CSOifygMZNWbrtSxLv1Eg=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by CH2PR10MB3912.namprd10.prod.outlook.com (2603:10b6:610:a::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Wed, 23 Feb
 2022 17:19:03 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406%6]) with mapi id 15.20.5017.024; Wed, 23 Feb 2022
 17:19:03 +0000
Message-ID: <04efb316-e231-7abd-0eb6-5b0241afd5f2@oracle.com>
Date: Wed, 23 Feb 2022 17:18:55 +0000
Subject: Re: [PATCH RFCv2 3/4] i386/pc: warn if phys-bits is too low
Content-Language: en-US
From: Joao Martins <joao.m.martins@oracle.com>
To: Igor Mammedov <imammedo@redhat.com>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-4-joao.m.martins@oracle.com>
 <20220214160325.62b6436d@redhat.com>
 <f627c202-5281-affb-c439-ea394c3ab70a@oracle.com>
In-Reply-To: <f627c202-5281-affb-c439-ea394c3ab70a@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR03CA0056.eurprd03.prod.outlook.com
 (2603:10a6:207:5::14) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f71fbf6-7ef2-4140-0d0c-08d9f6f09675
X-MS-TrafficTypeDiagnostic: CH2PR10MB3912:EE_
X-Microsoft-Antispam-PRVS: <CH2PR10MB3912D8C14DDCBABA89AE291EBB3C9@CH2PR10MB3912.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EYVvVTroheqtZjP7ofZ0iQ1/VgJW7WsGpa9t/NymU8GqcMSFzSo6o0hUgPhnyqnPKQ06tUtypfRxUzZ0/pQpirDtOPKKohx2da/bH/2Iq+fc0g8uqPFriwY6gWEnk0NltsuA48TZkqkMY6WulrXmzMnG/eu+Mt6x8ab533ogzfvSI/O1bcouY/dXX/84PGry2aRt4wx7QySx4w2MP5sjk7OVUXrIKlb7RYUboDrxiwhmoYBhUuooGQL6aCNeX9ejKJ3bYtvTNibEO/1DEjDskolXPpS7BtGg5GcC1DDXE55FEafgfvpSCGJl+T3MzzoUXGbWWd/PEMMJHNvg13tbAgJeiv+hEZ3U7i7wjtzPeqOJCJQ6D1Qaj5FkhvKT03EMYjIWre+njvH0+Zulgu4d3LTRBEWFe1J041VHtE7fan+CqVdlTDJ7I9zTKfuaJ7piZHjUfBjpFLwa3WVWF8oh5JcAZ939T3FIW9z68SIVE4V/SQPm04nNHXFIA+nFtq515To5Cosu3khFn06b05ZUXYM6xy+jkxSiHLMErjtImokV+JYQlXHJfZFx368av7/WubB9lFAD3WECf99glManqkRBanLpBEeCFYn9Z0haFVxXM8A1xL0KNeMfcJ6lemZfk40gWiH6YXUhyntqhtVnC9ZFsg+XYpa31GEyY/hNYOX0Oxu1/WRQpQX5ksCgkGayZPo899QI8wWTGQIO9qJVGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(26005)(6512007)(36756003)(186003)(6486002)(31686004)(2616005)(2906002)(83380400001)(31696002)(8936002)(4326008)(6916009)(54906003)(508600001)(86362001)(38100700002)(316002)(66946007)(53546011)(8676002)(6666004)(66476007)(66556008)(6506007)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUtIdy9vMTM4emwrc3pWcW9rUGxmRmlJYjQ0dVh1SEV2OWJBbVRUcTlpblVx?=
 =?utf-8?B?RjgzdUhkbHc0RHZhSUcySFBEYWd4TVRKYWhJQjRnWTh1YUxuWnAycGZJNGlr?=
 =?utf-8?B?dGxYT1lQWmR0WlJlN3B2dTI4am9ZS2JPWjlvbzN0aXEyM3YzZnl4T2FtRTR1?=
 =?utf-8?B?NGZZVlFyMWsyNk42WU0xVTBoNjFVMkZnSEk4RG0wMU5GQzZ3d3hSZWt3Nlh6?=
 =?utf-8?B?MXFrS3pWVVJUN3lsajRLMFpNR3dITndPeHZJNUthYW5aQjNWcGVzVCs4VjRY?=
 =?utf-8?B?bE9tSmMvUzI3aW1La1ZjWjVVTEpBYTQ0UWFOc0dGeDB3SWZ4eDdtRVFFMWM0?=
 =?utf-8?B?Nk1HdkhZVUdFYStSbUs3UXdVSDRnQnI0b2Q4eVQ3ME1sYVhhdnpmREpGTmJB?=
 =?utf-8?B?YkZ5RHpDbUM2WEFpU3RpYU1ObEVVVEpWQjVaMUpES2ZEUXZlSkY0ZUZGakNT?=
 =?utf-8?B?MHl1T2J6eVAwc2c2TG8wWVF4cWNxclpud2JTRnB2YXEyVzFGZlFtUUE2ejB5?=
 =?utf-8?B?UnRQMGNlTm1JeWpvcGVZUm5Mak5EODlUTVp1dFkwZ0hLSitVbkZNZjk1aDZZ?=
 =?utf-8?B?Wms2a1VwR0REZTJMd09mQXhnc1JlbHRGTmlEamJpSTd5RHFHZWxBK3kzZFI2?=
 =?utf-8?B?YVBGTkIzbnZpcDc1VUxLY0o5SndGUGUwdHZoVlBNRW8yQjZvd1grL3ljRmtx?=
 =?utf-8?B?UHZZNFNFNkRXT1VRSDhjQlFib0dvWVQyRnc1NkxRK1puV1NoV29rNVVGR1Yx?=
 =?utf-8?B?allqakI5Z2tzWGoyTXo3SUJlekQycWl3V09QZm9QZnFoY3k3bzFVM3NscWFj?=
 =?utf-8?B?VnFQdHhWL1lwZmtqMWJXWHJySWFzcUpyZmJuclBiWkxxRXVlS2pleDh1Vi9W?=
 =?utf-8?B?eE40N2lDSTdsdGxaUThsRW80UWFOaXQ1OFpLNmlYbi9ubmFCY0w4akYvdlpD?=
 =?utf-8?B?eVN4bkxtOUFCZVRZVzJGK1dyeE8wR1ZXbTI4aXFHME5BSU0zSFlkQ1Y2TkFa?=
 =?utf-8?B?bjZHK1lGYzMwUVVuNjB0YmdEYmtOdjJTalYwVVdzdGo4RDIzdVhhS29rQU11?=
 =?utf-8?B?K29neHJRbE1IL29IRDFPR0VOOElQaWFZay8xVlRLUjF3ZHBXajFTbnlpVThl?=
 =?utf-8?B?MnB1UmhmQ1BqMDhxU2FWdHphYzBac3JUdFFGOGdsVHpjUjNrL1hrR0IzTnJD?=
 =?utf-8?B?bzZ2dk1UL2pmVkNXUEFlTWFCNnRLbDNlU0FncjlVL3JuSWNaVW85a0FneVFx?=
 =?utf-8?B?YkhLTGVMMTE2bUw2MnpFR2FOT0k4ZnYxOW1VQ3NNTkxMMWdxT0xvZDlqUlY3?=
 =?utf-8?B?ZFhkOEZ1OXkvVVJrWG9nODNXV2tzcGUzSHNPa0RVWldJckNJQXBrRml1dnNN?=
 =?utf-8?B?Y3dsTjdiSFJoQm5pazhldnVGem93ZUFKeXBNRnIwOVk5VW05UVpSTkU4RDFH?=
 =?utf-8?B?ZXp4M2xKdlNxaWFHS2ZNTEJQakVSMFZsOTcvcDdyNm9VZVdBYUxwUUQyVE9L?=
 =?utf-8?B?eWhFZVZYMUo5SmhTR2JiRFd2NFFYdWwrMmtPcUJ6TG1RdzZLOXAwSDZpdFNQ?=
 =?utf-8?B?VlNrUE15MzZJRDFDT0J4U2QyVlUrWGE0eTNhU1BYaU8rVW9HRDhhMmRGOXZt?=
 =?utf-8?B?dVBsQVFwWERTb2ZXQnVZMlNaL0RaNWNCKys5Zm5leFFPRnJtak1xVFF2NGxI?=
 =?utf-8?B?eDRURWhIRitDM2RBOCtZTU40V1lNREpzS1NGOE1sbnYrYk5vbmk4YjRzUmxy?=
 =?utf-8?B?VkRCalhBbVIvWC9VdUQ4My9yRTg0UUdFa3BVWFBrTWN2cW9WbWcvcC9KYnBt?=
 =?utf-8?B?N1RQMFZ3bGY3YmhwdEVUZG5uUEVWMjE0bEpIV3JPN2s3MVZTakxDcWNtbVEx?=
 =?utf-8?B?TWluREk1bEJoK0NnbUZXZUYydGtnVGdpbVJpbTBJSUJZWHBMa0tEai9nRkZt?=
 =?utf-8?B?L1Q3Q1RaUmVpYURJelV4Wm1DNVQzSXBabDFQOFp4bUNwTEE4UTZwam0vcXAx?=
 =?utf-8?B?b3RHeXRCNjBiYWJaSk14R0dLWVdFUVN0cWMyOTdWY1ZxeTRTMVpWSjA3a1BK?=
 =?utf-8?B?SkFpcVU4UmRnY0R4L1RVdStrN3VyWGVjMndJaCtEd0pYQ251S1lrdkx3VWkv?=
 =?utf-8?B?bDdGSnFWU3VxblJ4RU1ERHdHQ1hISHd6dHpVODlJVTlZSGZFY3RKa1REbkU0?=
 =?utf-8?B?NWhtcjlsR0ZBNnRGZ1pxdUYzSEhvYlFVcU1DdEg0M0wzWndQbzhiRiszQTBj?=
 =?utf-8?B?SUJlR0Z4VXpmYnZhYktFRDRaNStRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f71fbf6-7ef2-4140-0d0c-08d9f6f09675
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 17:19:02.9279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ELPBynt03lWhrRdCfDGZVV420nyLLdjFfJCR7fhvlVGv+J6WSgte2l3i8NOcct83q77hRNZpZ+Fwv7v/uaumDCmM8vezN5osNvhQLYgAkh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB3912
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10267
 signatures=681306
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202230098
X-Proofpoint-ORIG-GUID: vkiMLLKB4u_NK-4X1QR2beKO4we7B2hN
X-Proofpoint-GUID: vkiMLLKB4u_NK-4X1QR2beKO4we7B2hN
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/22 15:18, Joao Martins wrote:
> On 2/14/22 15:03, Igor Mammedov wrote:
>> On Mon,  7 Feb 2022 20:24:21 +0000
>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>
>>> Default phys-bits on Qemu is TCG_PHYS_BITS (40) which is enough
>>> to address 1Tb (0xff ffff ffff). On AMD platforms, if a
>>> ram-above-4g relocation happens and the CPU wasn't configured
>>> with a big enough phys-bits, warn the user. There isn't a
>>> catastrophic failure exactly, the guest will still boot, but
>>> most likely won't be able to use more than ~4G of RAM.
>>
>> how 'unable to use" would manifest?
>> It might be better to prevent QEMU startup with broken setup (CLI)
>> rather then letting guest run and trying to figure out what's
>> going wrong when users start to complain. 
>>
> Sounds better to be conservative here.
> 
> I will change from warn_report() to error_report()
> and exit.
> 

I was running through x86_64 qtests prior to submission
and it seems that the inclusion of a pci_hole64_size in
the check added by this patch would break tests if we were
to error out. So far, I'm keeping it as a warning over
compatibility concerns, not limited these 5 test failures
below. Let me know otherwise if you disagree, or if you
prefer another way.

Summary of Failures:

 1/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/qom-test               ERROR           0.07s
  killed by signal 6 SIGABRT
 4/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/test-hmp               ERROR           0.07s
  killed by signal 6 SIGABRT
 7/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/boot-serial-test       ERROR           0.07s
  killed by signal 6 SIGABRT
44/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/test-x86-cpuid-compat  ERROR           0.09s
  killed by signal 6 SIGABRT
45/56 qemu:qtest+qtest-x86_64 / qtest-x86_64/numa-test              ERROR           0.17s
  killed by signal 6 SIGABRT

