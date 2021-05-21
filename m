Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 717B638C997
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 16:58:11 +0200 (CEST)
Received: from localhost ([::1]:48660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk6bK-0003OF-HS
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 10:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lk6Zu-0002CF-Vc
 for qemu-devel@nongnu.org; Fri, 21 May 2021 10:56:42 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:42172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lk6Zs-00013C-Nr
 for qemu-devel@nongnu.org; Fri, 21 May 2021 10:56:42 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14LEPoe2027591; Fri, 21 May 2021 14:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=/LhORirmVwVzfRSG3tiDaSDU+BGnPXJhDerwkwQNM60=;
 b=Swn7nWyGLASXSt6tS6AuIz5KDhCUCbPf+V/yfHyjXNMS/q8WCpodmQ+qXC+3j1N4xKBM
 f0BB69j6jkC3VLAVH3DUM3hfOh+u0SoCFsjv79SEfUs3+lNUMJS+7yBmKOc2Dlarxvqf
 xjyi/+Z6XsBi47WlBCq2LHh3cVeVV6Gxu79IFgAHerALX+tt+CjID3bdLzh49BoylEuj
 0NZUtFQM/LuyPdvaHbKZjWY07lZIRfRqbvrzS99QySlYHzSzdX+Vx1rOZH61H2EWiuPd
 4IbgvQXep+El0JB+vhA1x7BdOmT3RVQUTCMMKVys8yiVA+FcsZFmzCdqRzE3ZVMqPZi0 +g== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 38n4utrxnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 14:56:36 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14LEtBKB085655;
 Fri, 21 May 2021 14:56:35 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by userp3030.oracle.com with ESMTP id 38megnmee4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 14:56:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXCpjRAgnvppDzFZDt0y1Ik0KGPB9Ay59q6ZT2bvNeYhTajytzVUlEuFiXTSadspV1Om/b8z2xMGovYOY36FrDUCVdwaoAzIf57w6uEMJIgZkc3utR+8wSByCkyFF4TxxcZ+le8p8qiqsZRSq/3jNKk/tZehmWAOfU9Tg521aBBuNfsjZLdU11ZuSq+qgA83lp7SbyB/3BOmbrJ6vTiCsGrKhSqIMF1lQ5Avn9RGvt4jQsAp0KZ9ibpxAVKzFqKH9V6WUdtKtUkvqYGZjm4F5X0FiHTY80FvsDCGR4HTZRNKDCG/Uuw0TWWVkC9/aDtXX2M+6O2usslm2jbRu+KivQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/LhORirmVwVzfRSG3tiDaSDU+BGnPXJhDerwkwQNM60=;
 b=Ml/uhbYMUHoqNMNFEb6GjuBmTTVqr9nJ0ujFfndde2HLgASJfPkyl5k1gxxH/2FdICIUUOXiq/vlwZXoYS9aOZ2tv+mxr76eFXZTTljXPuLV72mGByH+SHQ8XEnuwXUaTzxPVqDo+6uxZtX4/dTtEDvxMuSnfeTT9FIqZWbKgEK5pfzmh5Yq1auG1VCGLpPc7jnogwfMITfcHFeTktt0moHe68+sxT1E2bVWG5UK0/SNpfNPfiuBZTkr+h9XbXWiRbE0rNMCbc6VqzllQcE5VFzYLIbEAkW8FRLFi/bUTTryG0lQOVor9WxYUFtJF1JVwN67f72hdtkQykYeJTLwmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/LhORirmVwVzfRSG3tiDaSDU+BGnPXJhDerwkwQNM60=;
 b=TGOTLRZ5C7+4KDn/JtLdbYdMNwhsDb3TAU5ijF4ycEkEyJE2UgUt5NywFcAWLxt35NldGyfcvozoXPIbk6DWgad5XcdZL6Wou6Sd7oX+axTiqDmIWvYUzsRWJuO4kaxSqTCuEZq9+/0s6fxA3Eonz0HGLXCYRKRuNQCQekK++Es=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2806.namprd10.prod.outlook.com (2603:10b6:a03:88::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 21 May
 2021 14:56:32 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4150.026; Fri, 21 May 2021
 14:56:32 +0000
Subject: Re: [PATCH V3 00/22] Live Update [restart]
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <YJwFkhlYISA9INwO@stefanha-x1.localdomain>
 <4d3dd5ff-5180-16df-ab48-11de610dd396@oracle.com>
 <YJ5kokhzyA5tCom3@stefanha-x1.localdomain>
 <29356c3a-0b3f-2773-4f9f-18ff4ed4d5bb@oracle.com> <YKOPnkefxgRZ8PoQ@work-vm>
 <a1d3dfea-d15e-35a3-a216-3ce65600f2d6@oracle.com> <YKQULUn5F+x1wrYI@work-vm>
 <38dc91ab-b96b-1cc3-bf8b-84ff77b334fd@oracle.com> <YKZgZELudL9HobEe@work-vm>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <37713c98-5f2a-6cff-d3c4-9e1c60cc4107@oracle.com>
Date: Fri, 21 May 2021 10:56:29 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <YKZgZELudL9HobEe@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: CY4PR22CA0073.namprd22.prod.outlook.com
 (2603:10b6:903:ad::11) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 CY4PR22CA0073.namprd22.prod.outlook.com (2603:10b6:903:ad::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Fri, 21 May 2021 14:56:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ff8c196-371d-4f09-ed50-08d91c689f71
X-MS-TrafficTypeDiagnostic: BYAPR10MB2806:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB2806D7410971BE21522D4605F9299@BYAPR10MB2806.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IXhAmx4Z45kS6OxpYCasyBp/WsO473N1RdbncVazaC1woU0KcaRpUGP/MwtkkgSgtRBhFp6i+6itAE99Ir2hL6kMTQ+LXiSWJ3myM9aJUcvoNu/N3rJpKkUbYs/Z7lRd5CoF/s81z1w8VH8wu46FX0ARPdpFFL1rt8i2Wih+QNlWj9QUcuH0pBzGHFApb9Tb0hiDXwe0FYUlt8YzOyWz6xvUWREUJR6k5iP/1KAfcBcDBsmLS094keOVjx8/A/Mrs8k2bq61YoqQ2xSAlRSkojopTtoIuuAnQ2agModdjFxJIYDvz0eOrr4kptDTSHTwSAhcUKJEO/mqJISP3WqTp/TJuEPK1Z//9xuM6RwbA2rskBTnKbcVbbZaYZNiEQCZiyu7APsxqa5PNJhqXsODxmZyAl7U853mApq1T5tfezmLdksX+LuUJj98kObavfsM8/B3fRh+GeoeYKPtrmY9gAIuak3vo/sEu3Y4c0Xff81XIn9dLeBbXQGpjvHjl9jItlnhUZoomDBQGBqGm5JdEq4W9a21Lm52apVIh2XtT6G/O4MAkIxhfbbNyjOu3gAsnXLumaGoEC5SziXhK+a3K64agf/eRqZ11Fm5+WL0BzIoErrDqf3EqtBhuxrMlo3BE2hbC7C68lNP0IJ4t7zYqYjMSSTlYP6lWZHKsZB6qgPG+h1k561ReBZLF9biJzAa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(396003)(39860400002)(136003)(346002)(16576012)(53546011)(66946007)(478600001)(316002)(186003)(956004)(86362001)(8936002)(4744005)(2906002)(4326008)(5660300002)(66476007)(2616005)(38100700002)(26005)(31686004)(54906003)(6916009)(36916002)(7416002)(6486002)(31696002)(44832011)(8676002)(107886003)(16526019)(66556008)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RFF5cEpmTkpjR2JEZG5DVmxHZjh0MWNoZkFPRUhyQnFONnpWa3h5OHRoZldt?=
 =?utf-8?B?K2xZczNRKzQrUFVBMnl6Rk5FWmFKN3V6U0dNRGxzdWZhM3o4NGdwU1RaN3Fv?=
 =?utf-8?B?OEd0dEZDR0I2WGJzSTBYTXAyZWJHN1lNaFZPQ1lpTDIwYU1WVkJRZ24rS2Rx?=
 =?utf-8?B?Uy9DMDlpazBoNkFaVmtsdmYvVlp2QlE3SFFyaVdDVUllVThwT1VydHVRZWFD?=
 =?utf-8?B?bUFoUEZYQk1nYW0vVUtWRUVaaTBrMGF6MndEcVA2cFpoTXpaenpjRmdlSDlR?=
 =?utf-8?B?OWhRY1Z5VnV4dTJyZ0V3U2hrdTZhbHJJNlprUVBvQm01a0pwMjV2MmpqS1JL?=
 =?utf-8?B?cENkb0Q4YnFhWW5UNTRqREFnWktiZ3dqdnlkMGYxQVN4cXRzT1BHV21neHRw?=
 =?utf-8?B?UWp2U2NKeTZYWjdpZklmbER0R2IwR2dJVmNxOE8zNXM3YkVyVVU4TGRYWDBh?=
 =?utf-8?B?NDRrcEk4Z1M5RmowS29jTTZMbDhGam1Pb01iV1B0VE52UjZNYmVIUHBUTnVB?=
 =?utf-8?B?SjVxVHB1TThoY1ZmTnVJbm03dmxhblh1czFLZVpKNWNkYTRBcjh5a2p3QTBJ?=
 =?utf-8?B?S3dZMGhRWnpkclJqeEt1blRvckxIT0g5N0ZpTTM0Ly93dDVGbVY3aDQ4V1hR?=
 =?utf-8?B?WnRMTXY2MjVFc1pZVE9BZVJ5MTY0aXNxWTZ2dlJqOGV6NFRzaEl1dHhOY3dD?=
 =?utf-8?B?cnZLem41OGt1bTY1R1NReGN3b0JzOFlGdllrWFVQRjJNV1dvWlhIZVNiOVVr?=
 =?utf-8?B?UHk1RTBYRUFmRFlKSkJHYWxsSGRPbHhsS1lRSUhqcGsxYUxsUjhHb0VDeDBa?=
 =?utf-8?B?WW5xS0s3UmNlL3NRL3ViZ0dlY1YweEVLcFRGK3puQXM1R0cwV0RzdUpyYXRt?=
 =?utf-8?B?d0VVT29EK2kyNE1nVjlOdFhoUmwzc3pqUkxjK1FxUzV2SnNjSE1KMFEwT00y?=
 =?utf-8?B?ZURnTzVmMTB1N2tuN2pzVnk5LytCS0xzNHFabVZrK3p1aElka0VtOTZtczJI?=
 =?utf-8?B?bTd6N3NLU0dWUmRtbHluditNWTdUTmhrTUFzZDAvcEUxT0ZmUnlDc1Y1d2RS?=
 =?utf-8?B?M0gzR2N5dEVMNmRDTTJUT1B2ZllGMWI2NnYxZVgrazFadnRjZ1JLbkdBWll5?=
 =?utf-8?B?NXRobk1NZE13ZzdROWNEUFQzNDE4VTBKV3dQZWE2QjlzQW52UFY1OFNlQWQ0?=
 =?utf-8?B?RGprSzJMVHRLVFVIZ0E2RXFBOXNJV0dCTGg5bHVJUUFMU0xreEoyeEhNSGhO?=
 =?utf-8?B?dTZOeTZLRXY4VldVU3RNb3JmWXNQeWtGT3NqQXFPQW1NcGNjcndWNzhtV3k3?=
 =?utf-8?B?M3B4YnIxR2dsK3hvMUZrUFBpbFltRXNNRng5MStaYmowclNuUXZ5MG9id3Fi?=
 =?utf-8?B?THJXdVhLYy9HUWgramFhWjBidWRGTkg0V0d0SW80WldhNXBDM0hoelJBZ0E2?=
 =?utf-8?B?QjdIbkZYdjFkMUltdUlMbVRNWEVBYVpDRE5YUkZRaXZHQll1NEN2NWVDQ2xQ?=
 =?utf-8?B?Tm5hMmliMXF0bGt5dWxjS2x3VElWOTlQVERnTTNBY1lwTzhMOWlhZGlPS20v?=
 =?utf-8?B?RjViZWRsKytZZndyeVNKRHA2QlRudi9KSlJlUFM2amxxTVpwaXNSeDdBSFBP?=
 =?utf-8?B?dHBsTVBHcGpvWlE0YjRheEtSTTNCaldmNzlacWhOdEVBOXB4bXY2UlczNGFx?=
 =?utf-8?B?bktUMldpeWJjVVhldWRCYnRLekNDQ0tIcjZCNUhLWTdFSzlkUTVQdzcwM1lB?=
 =?utf-8?Q?zhxWPDnCg9jG3zeNUUAvhT/KFfK2Q8tnAUdioWz?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff8c196-371d-4f09-ed50-08d91c689f71
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 14:56:32.8085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgI61cVF5YBEuJOIt5sPEP8EVEPnWICScZjQRvHf35Ocxss+KtKQ3lYEoxOmFopEgcuEIIDgARmYSmmEHk0KlQagGyz6xU8i7b53RPmzLRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2806
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9990
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210081
X-Proofpoint-GUID: OeNFDfS_KWM3noVQSd5WGNiVaZe75TvL
X-Proofpoint-ORIG-GUID: OeNFDfS_KWM3noVQSd5WGNiVaZe75TvL
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/2021 9:13 AM, Dr. David Alan Gilbert wrote:
> On the 'restart' branch of questions; can you explain,
> other than the passing of the fd's, why the outgoing side of
> qemu's 'migrate exec:' doesn't work for you?

I'm not sure what I should describe.  Can you be more specific?
Do you mean: can we add the cpr specific bits to the migrate exec code?

- Steve

