Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBCF3CEB11
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 20:41:06 +0200 (CEST)
Received: from localhost ([::1]:37338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5YCP-0002WS-TU
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 14:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m5YAa-0001Hw-9J
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 14:39:13 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:23552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m5YAX-0001ZQ-NB
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 14:39:11 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JIW26n023548; Mon, 19 Jul 2021 18:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=3L8Fx6RD+iorFCLQTDSVtWfLMs9hO6vbFOV1VsS9P+s=;
 b=xTEClw2Ms3gAQiMVmideFZ5MEcrV6FoUZWNKXC82dX2Aknedz6uA8aueh2t9q3YOKC+2
 bJoaseWlU+5WUyYOzQE/to/hF5f4gUL4zcVqaMXcd6lmttvpCmYVEaAiFRa/S/smVVhK
 XsBefVKZnia1L6JBX9eyVwIKfDg3yVl9FVhhKKZF/dy8RaT80+0U8sNxzd97m1xYvYSX
 1V/nt2oKw36yDX+rLyJN5VaCPWu9KZDB+TWlvcepTcaayU8j7ZMgiMzZetVfMIZbdHiG
 pmPgRT7JqOIr5bDoBrZVkGHYJc9pVScoFLrczDIoNlYVBNrsKz8LB/L2mm+CeTZNL2zy 9w== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=3L8Fx6RD+iorFCLQTDSVtWfLMs9hO6vbFOV1VsS9P+s=;
 b=ynN9GyDQeMq/KGRf4d454WG63+BBKUQkIcT8PA/u7XUbYqnWmur5ZcLv0BkbFFE5JeEu
 QSe7nbNGXZXkh3mWgHA7MgbcDKaLHo+HHFvb3gOn5tfj9k9SR3mKqCadTieZTRIxWZhx
 XS3XGX6sWQNH2SN3JGjw6d4S8HojAfnaEw0GuCnbZ7HRlPu5LIGP6vhLfWT1sfZAxDYP
 zE0vgQbgDZveUrJeCVeCqfm4iLte6Z+9l4Ph6tNiA8DGW09B1lFZhSJ2EJ3SXbxFfabR
 lFZCzvZMyp3p1D8Q68wTDC0Lj7s8WQN3u6z+xYYB5O7qAzRvJBiD9Gi5PtBEUJBRdCBe hw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39w9hfrtpx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 18:39:04 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16JIV3IT136418;
 Mon, 19 Jul 2021 18:39:03 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by aserp3020.oracle.com with ESMTP id 39uq156tj5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 18:39:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QblWsmcwZ1fOnpMyPlp9iVgrOYqnPBOEesFGDsIcTmP5EWkdwJXJ4Hujl3x/caCbCw5ypXBbNiWubV6WInqcvmbCCqSRZO9xt1bSQ/S0LCtYxo0v/GkReh+iQTMFyJ1vQOXHkuY0P3dYYK3jN8K/jYnV4LzWKWaGT65HQzxchN+EZHlIPHBAVO1AE51sy3tkc3MsJSoUCgaR/rjQruQVIxeBlA3X0GDaue/fuBri0OpGdRmMROi/il9HCSl4tQBJlDbVFfF9y7VVWZTNaZN7UNvfl2X7vK5ECKvRDVsk4hwqoXZUheLLjcVRdc/ROe2jM+frIjrIqrbywpXgR4ouOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3L8Fx6RD+iorFCLQTDSVtWfLMs9hO6vbFOV1VsS9P+s=;
 b=Kw91vKsdquTHzV5KG2apk4o18D/Yt/22vuoPfGjXJZ7laNKA89dCz9IHSfGVlOPtod3uK7qKjqgMSmT9OTWDb2Tj82lhWg3P9mp8lBzo8n2b+CHLRTtSztkhMEhqtTd2l4UyP8iM0ASY3aauWPbwqZU9RqN7+KU3Ghw+5QpHI2k0acphxojOz2xktSE40PYWN9nOG0COuOOVwYyFTqPzS7Ba8RjzqY1PipQr8P0ZiZVbE8DL/6pixS02IOHA1Fp2UW1pn4FqcOn1LjbuaHc8/iof8cdjk5u6YnFkOP26z3P8SRU3QhhfB5kJ7iyuHCufDxxKv2VJ8yv6XbS4qhiARQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3L8Fx6RD+iorFCLQTDSVtWfLMs9hO6vbFOV1VsS9P+s=;
 b=MmTvm1lSgzlobA1YrUiWxBbN7ey0nsfvvGCYYE5UriEqDIBiWFvuvV4Rbqkiti8UVqGlpuc4PWnG6RX1KuD/znAQrb0f3ZF4XUtptlsPSH/4T8c376UuXcr8AuUd+y2HpbHnXR1h7vwveAd6rcHbkhqRAmG2ftlJ5NN+jq8ZAi0=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4292.namprd10.prod.outlook.com (2603:10b6:a03:20d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 18:39:01 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812%7]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 18:39:01 +0000
Subject: Re: [PATCH V5 17/25] vfio-pci: cpr part 2
To: Alex Williamson <alex.williamson@redhat.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-18-git-send-email-steven.sistare@oracle.com>
 <20210716145133.4aa3f341.alex.williamson@redhat.com>
 <be26577b-8df6-a8b5-fe06-ea33552aa472@oracle.com>
 <20210719121021.6babb9ff.alex.williamson@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <2f85af36-5d64-99b0-5165-ceb73087d247@oracle.com>
Date: Mon, 19 Jul 2021 14:38:57 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210719121021.6babb9ff.alex.williamson@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR08CA0028.namprd08.prod.outlook.com
 (2603:10b6:805:66::41) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SN6PR08CA0028.namprd08.prod.outlook.com (2603:10b6:805:66::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.23 via Frontend Transport; Mon, 19 Jul 2021 18:38:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5f6f70a-4b39-4d41-3a79-08d94ae47a04
X-MS-TrafficTypeDiagnostic: BY5PR10MB4292:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB42928469E5A3D558015A02C0F9E19@BY5PR10MB4292.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M9s9duTWoJhdogoNIqfC8QR11hESMsEcr8iKL4V2vFkn0K9G/GzrmKu4U7avG1Ceyan+dx2ZwpIsL0hwZCQVqw70pT8T70g6WcaIj1HbIGB5mKr6J85KQKPwTkOvFuQvkMZ+boRAf8MEpD7C+m3bSL89bwoh3SSwktbRqEsLyfAhzNP/JAlXU5jp2C4KQJeMcb4PhiRwHPuy/bKyY7I2d8D/klMoMArJXc/fHgjnaCDQoSnsEv8546v15FLF/qhHxxHwQL+HXt/00SRVxygArCHG8S9HxQOncGfLb3xlU3cs1MgU1R5bBrR0YKqbQIDvp8t9Dbwee1IloDE2Hn/xk2/E+EYH/B8WTTVMduUKdlKdZuf+wEfmMMO0KPYlD77EEoO2uuVMC+AjmiGoiR6xo+spTKqxPPRXFPUkJfc60Q+ymyzVJPQcKX32yYuNWJhbg//BtxbLQ0yMuilqmP/5+BwZlPvD6d1YNPtGEHv+xMuopqqwo3ayGz/omFfcLR2jwFm1qjbDch4PNAOSBX9LcmiBhXutc8edSvKKV004hlZd2Gib3s1CibKyw3dAwIJqEHYAG2qd/qrenO9AvVVbcPg2U0MCz666ZPnw3Y5UZ3EEP7rI3UYs7afzB5qlUp4u1Sx7SJ7FjX3oaNBooQU7G4rc4L+d4z0OAm3rSUnw8ZTOCslm6n8aKS30e2ajymgBQUUamE5lapfKTEdizWHm450V+gM6IgSVL9OtwixyLio=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(136003)(376002)(39860400002)(346002)(38100700002)(478600001)(36916002)(6486002)(8936002)(66556008)(66476007)(7416002)(2906002)(31696002)(186003)(66946007)(2616005)(8676002)(107886003)(956004)(44832011)(86362001)(53546011)(5660300002)(83380400001)(31686004)(316002)(54906003)(36756003)(4326008)(16576012)(6916009)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NStKL2IzanZqU3Vnb0tBeFJVbUprRC9VNEt6VzJxb0FaeFE5Zlo4V3lvQnpM?=
 =?utf-8?B?ZGFkbWVkYURjTWprT3BSL1hxTVJHTWd0aFhDaVdmOVUvSEtKMFJ2Sm5KSDNH?=
 =?utf-8?B?VlZueU13NWpUQUExU2hRQURncHpUVVUxdU10L2hSWktNakcvTVZkNGZ0dzBY?=
 =?utf-8?B?Y0J5Qmp1QWRsYmx3YXhja3IxMTdiYXF3V2o2aFVNSjNYRmQra2NWUWFVdmtr?=
 =?utf-8?B?cTEwenhra0QzZEJlWitFOWsxcG95UXFYT2xCVXB5SnA5WG9sY1RQaVR4RDFp?=
 =?utf-8?B?dkFTVENwN3pNcTg2UE1nUkdRbCtnTzd3aWJ0TTdLTDR1WlVpN2VnYncwMHE4?=
 =?utf-8?B?Zkw4aVNpR1RySlZjcjk3ekFwbW9xSnFsd1JYVjRlbzVVLytJY2l0dGpMejhN?=
 =?utf-8?B?TWJTT3l0QURoZHpEWi9CMGpEdlNtR3B6ajBac3ZBUFI4ZWlmZWJPNy9iQ3lY?=
 =?utf-8?B?cUUwcXljMGEybzR5M3lPYnZEUjN0R3ZJYVZtMkxLaFVSaWxUSW5pN0JMS05X?=
 =?utf-8?B?SER0UW9mUFBOUWVTY0g4NFBod21vZkwvVGFIcjFlR2VrMnA0UnY2Q290UWx6?=
 =?utf-8?B?SGVwOVdsSFdiVzZaV0pTaGUwT2JTSVhsOFYrR0pxWS9NZDltZVJEaUFyVzg4?=
 =?utf-8?B?cGlOY1RQVk9KMkgzdG0wbGxtZ2tEOGI3NGJxd1FjNWlwN0ZmUmh6aFVJcmVV?=
 =?utf-8?B?cm0xZ0VoY2tkTGpNd25UbkVOQ3NObHI5eTMvK0ZJSHZoRmFxTGw4NEhxZ05U?=
 =?utf-8?B?NWl3S3l4TDlxOThxRWoybDROVlU2NDl1dHRrMUR6aTZnd29iLzVZWld4Y2FH?=
 =?utf-8?B?WDBEdnNDRmNhZ1JLNk11WXpVcjE0VXltWjZtalJQN3dGU09YSnA0MGd0U2tI?=
 =?utf-8?B?NjFGYVlXRkNydE5KWDhMR0ZjeGsrWllMd05nT0krZFFPdkN3YW9IR21RQjZt?=
 =?utf-8?B?ZWEzeE14c1VDZGZveVVSMlBuVmJ0MU0vRUsyTFBJOHIzY0xPcEt3YXBjTHRE?=
 =?utf-8?B?bGVwRC9VVUxIQTkyblVyQTdia3A0WmdmNnJZV056N2VxMTdzZEFsZHkvd3Vp?=
 =?utf-8?B?Si9uTXhtNG12dklwdVFRaUwzanl5WTI1cW41ME8vcHdocGNzdDduS2Rka0hQ?=
 =?utf-8?B?K2ZRSkZ6MW9nZVUzS1IzeUh1aGttR1VRbTY3RFRnNTdvYjhZRjhjZlRNaE1w?=
 =?utf-8?B?SnFyMllqNHIwb0cyT1pvTUlJejV5cUhSVVFUbXRVRkt6aldHWGVDb3VtU2x6?=
 =?utf-8?B?ODgyMTdrM2ZXSnF1VXdnQTlUNTEwOG0wT0RERHh4R3BoNTZ1ZEE4eE44OTAz?=
 =?utf-8?B?U01LWnVtT3Rsa0hMYkVZR1ZBNlhrbk5HenpJVnRCc1MwWUhZTTl3dlpuQ1ZB?=
 =?utf-8?B?SjdvWTNuaENHZTFvd29HdmtYc3RPVU1DRyt5MkY3RVBEZ2REb3JuOEhxdVQ2?=
 =?utf-8?B?YWQzNVlYZzJXa09qVVFKVHg2NjZNRnBTRGxIZUo1VlpZSFBQeU9FY1hDQUd4?=
 =?utf-8?B?cjhLa1VCaHRxNWNtUExkZ0xqdWlhK205SFNFMkgrTE1pbDU4RnRTTWdzYzY0?=
 =?utf-8?B?d0RiK3pQZ2lETHJybEF3KzNWb1RFdXNST2xIa2VOeU8zZDJTNzcyNUxBbEw5?=
 =?utf-8?B?VDRnQVFjbUw4Z3RnRUVpOUkxNWEwMXZncWx4YnZGdHpiSGtlckpQRk1pQW0x?=
 =?utf-8?B?LzBNcEVTZmtsUFhaM0dyWElrVjZKS0tRS0hQMjc4NGxwSGVIUHZXNmlBbWww?=
 =?utf-8?Q?G1iidzHyesUwL7v4LLpxZroSbzHg9QMsBoPqV4O?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f6f70a-4b39-4d41-3a79-08d94ae47a04
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 18:39:01.1751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YHeNSaaJZhNJsQ/vfl8I1YkTdJyItAnxaCXxo/fam4qlG9A6zNDmuPhJkaIFEiisKu9i5BilBe+PDUTwZV55fyH3ZCR3jv3N4eJDVkbUrHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4292
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10050
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107190105
X-Proofpoint-GUID: 8MrMCXQkrxxWA4HtIFgB1iOXeF-ra1xc
X-Proofpoint-ORIG-GUID: 8MrMCXQkrxxWA4HtIFgB1iOXeF-ra1xc
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/19/2021 2:10 PM, Alex Williamson wrote:
> On Mon, 19 Jul 2021 13:44:08 -0400
> Steven Sistare <steven.sistare@oracle.com> wrote:
> 
>> On 7/16/2021 4:51 PM, Alex Williamson wrote:
>>> On Wed,  7 Jul 2021 10:20:26 -0700
>>> Steve Sistare <steven.sistare@oracle.com> wrote:
>>>   
>>>> Finish cpr for vfio-pci by preserving eventfd's and vector state.
>>>>
>>>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>>>> ---
>>>>  hw/vfio/pci.c | 118 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>>>>  1 file changed, 116 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>>>> index 0f5c542..07bd360 100644
>>>> --- a/hw/vfio/pci.c
>>>> +++ b/hw/vfio/pci.c  
>>> ...  
>>>> @@ -3295,14 +3329,91 @@ static void vfio_merge_config(VFIOPCIDevice  
>>> *vdev)  
>>>>      g_free(phys_config);
>>>>  }
>>>>  
>>>> +static int vfio_pci_pre_save(void *opaque)
>>>> +{
>>>> +    VFIOPCIDevice *vdev = opaque;
>>>> +    PCIDevice *pdev = &vdev->pdev;
>>>> +    int i;
>>>> +
>>>> +    if (vfio_pci_read_config(pdev, PCI_INTERRUPT_PIN, 1)) {
>>>> +        error_report("%s: cpr does not support vfio-pci INTX",
>>>> +                     vdev->vbasedev.name);
>>>> +    }  
>>>
>>> You're not only not supporting INTx, but devices that support INTx, so
>>> this only works on VFs.  Why?  Is this just out of scope or is there
>>> something fundamentally difficult about it?
>>>
>>> This makes me suspect there's a gap in INTx routing setup if it's more
>>> than just another eventfd to store and setup.  If we hot-add a device
>>> using INTx after cpr restart, are we going to find problems?  Thanks,  
>>
>> It could be supported, but requires more code (several event fd's plus other state in VFIOINTx
>> to save and restore) for a case that does not seem very useful (a directly assigned device that
>> only supports INTx ?). 
> 
> It's not testing that the device *only* supports INTx, it's testing
> that the device supports INTx _at_all_.  That effectively means this
> excludes anything other than an SR-IOV VF.  There are plenty of valid
> and useful cases of assigning PFs, most of which support INTx even if
> we don't expect that's their primary operational mode.  Thanks,

OK, I'll look into it.  If this proves problematic, how do you feel about deferring
INTx support to a later patch?

- Steve

