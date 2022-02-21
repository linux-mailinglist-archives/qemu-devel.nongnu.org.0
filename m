Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF9E4BDA92
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 16:32:55 +0100 (CET)
Received: from localhost ([::1]:58646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMAgI-0006Cu-JD
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 10:32:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nMAcD-0003Sh-T8
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:28:41 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:7542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nMAcA-0005ci-0X
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:28:40 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21LDYkJA016808; 
 Mon, 21 Feb 2022 15:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=cl0VcGfBqGOBUrFNcRX3Z2L2DxvJtjdIa7LItb5py9w=;
 b=QvWxREO3pVPxkI6Dy0ZI5QNBs8WpQ5l8Lw2ivCQtJJozzj6IFlcsjNzDN+KkHaTJFDdY
 D0stcpBbGffOFBbTNiuXDHBNxkzyZ/m9QGtr3zHVTDMP4WAgfTdoyKe/jo4h0pWYO+ES
 janVKk8sZlLwstUHqahm2XLokfTeCcT+eEeWkRhu5hIf9giDVTp+81n9wAkDGoi0F/lW
 c0P/4B/1Wg42bZPVXxADyshVPO1y3XePEhH69Icgp1kPsEeXj/uVn5jhVo9aFSvrhyUp
 W3kflZ9W9Wz78E1/1AJtolr/8PIUO33+bAFUvxABBeXzT+Atlqo9fm2HnEZZv3rU5355 bA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3earebm91b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Feb 2022 15:28:29 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21LFSSWh005732;
 Mon, 21 Feb 2022 15:28:28 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by aserp3020.oracle.com with ESMTP id 3eb47ysxw0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Feb 2022 15:28:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LwpWjEO5mJQoSKINMTJdIfQxLjpCFRY+IYsIC+O8UaaKWIX1Bg2+1c7WcGmpA5w8MK/3lY1YtXA3eYEgoPmUDIrA0eZOWgs1IOxcPNhzMUDn95OFlT52mNz82VPS7nGDVlB2glTVNSxxQUxBoWOUoGj2Hff27bjBFkpGADHS4o1ar2kdLW9GCNGd0M4ZEdyYdtd4hxZzHgvvzy79kPCsY1WAStJcaLK4DlTdfHd72zQLiCZVBUTLWZDx13jFIL4x/b0eO80/VwfbQYsWlFByZIl1HTS1EqE6fOqpSFzFwynn6hUk5Jdg1lFp4HyEgTBHTKH5AsPSll99SDv+28F0Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cl0VcGfBqGOBUrFNcRX3Z2L2DxvJtjdIa7LItb5py9w=;
 b=X6wu3b6Uikn5iIZacl6o1Qo3IVIkafJ/ZnOHz+LLlTgdvJeuMhbygVK7LNP6Jh68EXp7eW19pWKXNXN8mADV44nWifj3a4h5QUXdj30cPjwgLMeszfvEWRGKxjCSSA/ialV+3K3VC6h9ZxG13bTNhqQd0MtrkWfb7SKkeCo2/+sgciZCLVnW1rb+lM0OUyiDeFQt7WZ9tkHBV9StTF8/mo1YJOmXCWGPjpUYdG6C1dtCKNyRRutKW7lrih9jePW1OgGa/B10hZKxJitKzSUOcauLMfYWQu6VDelhXcGwwPbIc8knxt/kY1t3Vrlb2MHiU/D/5WVMB7kI0lavdYvGaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cl0VcGfBqGOBUrFNcRX3Z2L2DxvJtjdIa7LItb5py9w=;
 b=U6qteEIqMB3MpzPZ31chMNjxWFFL9u9MRcZWj73+7LCVf0ZFZAxSaOTWLDdUqSXYKvn3XhJY8wdWFCdG0WVSG6uuhftS8AmaLNZcGcoRcBJPjmWPXshXirv6/leM0fYP1XqSA30lSoJjqW/4IznthXMt0Fb1ltC8mhi5siQ5eEI=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by PH0PR10MB4408.namprd10.prod.outlook.com (2603:10b6:510:39::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Mon, 21 Feb
 2022 15:28:19 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406%4]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 15:28:19 +0000
Message-ID: <57e85450-e248-874e-78a0-06b74f8d3617@oracle.com>
Date: Mon, 21 Feb 2022 15:28:11 +0000
Subject: Re: [PATCH RFCv2 2/4] i386/pc: relocate 4g start to 1T where
 applicable
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-3-joao.m.martins@oracle.com>
 <20220214155318.3ce80da0@redhat.com>
 <fa172a19-5db6-a844-27d7-8497d306024e@oracle.com>
 <20220214163158.4c4b210b@redhat.com>
 <53b94f7a-a90b-3e9c-2e86-5d77410c46d2@oracle.com>
 <20220221075807.7415884a@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220221075807.7415884a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0460.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::15) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03942bbe-067c-43c9-abaa-08d9f54ec9db
X-MS-TrafficTypeDiagnostic: PH0PR10MB4408:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB4408C0ED238D6DA78ADAB7E8BB3A9@PH0PR10MB4408.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B51kCChC+9vOxvgRsDGgvqOzYyiuuxQ2YpPcFbpJCgeUglomVOrvyqIbTonBvqene9gZQDecBVRAb16GX1FkrxgHQDO0CSQGFmHPZ8L+zMi/ufswbDY8TZ7QIJ2pH2qg/aMwLwk9+fmVBybHs7B9rmgBp/6vbOFde3LIcCx5Bzrx3i8P6vDw1Xoz42Zq7cvgdc7Mpm7WAoBuGx8rmBG3cPkVTqFbcj7oEoWO6IjM8GAfhnzO3XvkaAZ6mHupXPJnLzqSQ4d48LegKLmnJnPZkKTredebwGF7OMwIPisMhohiUb8tU0mIWk1K+5lVjmEk0BlWOunBdAm0JfeVxMVXROQA65QxDY/fCqnb1Ns9g5virXzEZZpifHsKNh2ZaF1WmZ+8e6MQJZXsP1TC4JxeXLwAy0vic3xMOY6J7QZ7u3jMEojBJQLpwzW67IfAJJyEu0bKFeJol2blC+GU4w5vZXHzCpEEhUPGHWFjg6BWZoSCUPFL6FHdx1SyrKnDw+soF73tJ5vKREDUjbapLfXhJta//rIDvPtzIcdlrab1eJ5A6xZhJrfdzafPrieNIBSiUwgARhLavTIx8DXbEIw/Ze0btabhtIKrEcQRefsxrSHaLlsXYMNVAor6o6PVLGPAJxDvFB4Sv5yvfDwj9Pl46Ce6TziXevvJeL8HWqx2ISxYEnMeJf46hIg58ZqTt3/8ktcgJ9dvDMCKA9J9cGi07A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(54906003)(6916009)(186003)(26005)(8936002)(66946007)(5660300002)(83380400001)(7416002)(4326008)(66476007)(8676002)(66556008)(31696002)(316002)(86362001)(508600001)(6486002)(6506007)(36756003)(6666004)(2906002)(38100700002)(31686004)(53546011)(6512007)(2616005)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlJDTUpmWHljZnRwS1JyeVV4aE9McnVyZ3duWjJESHZaVDJvZDMvQVkzL3Jv?=
 =?utf-8?B?TVBraG01aS8xSUNWdzJnUVR2eDdJN3Y5Sjd4bVBuSUpPK093aG1ZbnY5RWMx?=
 =?utf-8?B?M013Yk4xNXBxOGpCWU5hZXBwYWlBaWRmSVZBQkFvZEo3UXVwTW9OSURYd3k4?=
 =?utf-8?B?SElvcnNCVDd1OCs5ck1Ga0g3SFFUL2VBa1B1TVJwdHNnc3VvMmFuS1ZmbWtx?=
 =?utf-8?B?K3JPSFg0d0xTbmFqMUJpenJYY2FXQUF0Wk1xaURrV0Jnb3MzT3pId1d4b1Q1?=
 =?utf-8?B?T1o4dzBYOVFVU0xLVmxRT2F1N2pSSUtheHJOWmt0elZTR3pJbUgxcE1zZTBk?=
 =?utf-8?B?bzBtTW5NTHc5VmdCTENoMzczWG5meGM0T2VpWC9XS3MwczhWVmF5TXJUVlZH?=
 =?utf-8?B?TnlXZHRoQ1lFNXdRbjZQOS90L1F6djkzVFdqMnRVSEtoS2dCQ3lYdGhFWHBG?=
 =?utf-8?B?M1JrWERheUtYVWdsV2NJdXg4dWN2OFBvMlZDRDYrQlNWa214K2M4UFBuT0l2?=
 =?utf-8?B?eDBUZ1FlNkxtUTlGUTFjeXJHRUNOa2pnWDFhKzY5bE9XSWtIK3F4d1V5Um1F?=
 =?utf-8?B?SlVlZjNHK2J0V2dKNXR4K1FwVVRBYm1zQU1jR3NpY1pGeHozYmQ3TUFiM3NL?=
 =?utf-8?B?ZlNzMEFhWTJiZ3ZEQnM5TU5TVGFCSmFROSswTmxTd1lKdTJPRWhzYjZ5RWVK?=
 =?utf-8?B?dkxmZGxWY0NEd204VWJHVG93blhza0xYb2RtWGVWNlNtQ3hRVkZjMDc3c2hw?=
 =?utf-8?B?VmFaU3VWdmpxcWN3STIrK1JmdkZ4eDBUOGJETW5zMzl5NjRTZ0dMdG9qUE1M?=
 =?utf-8?B?Z2pkN1VzNDVWMEt5OE84dTJlRDRTVWxoVHA0dmUzcnAyNW9aRlVhSzdhczNE?=
 =?utf-8?B?bW9rdGJDSFFJYWxPWnpQYVlqTk9VMDJEL0dtczkvNDJaVmNpVm0wTW5ZYmJ2?=
 =?utf-8?B?RytjcmlEcTZSRFZpdFFwZm5VamJIbjFHd2QrZVUwRTFiNUh2T09Wa1VncGdR?=
 =?utf-8?B?V0NCYXZJdzVOaUtwN0dtMnVXdEVNN1ZrcXhaUUgvSzBwSzNhZlIyeTN2WXV6?=
 =?utf-8?B?TWdUUE9QamdLc0lqdzJmL0paaitwbWlVSm0rTzJWTXNtSkgzSUNpZjlDZG5O?=
 =?utf-8?B?OXdJSE9TckM1OGI3WEVFN3UzYVZlbUhNa1RYRGZSbFB1K2I3dFZxRGR5NkpM?=
 =?utf-8?B?Y3VKUVljUExOVGY3KzRHWGJsQnlkemFYVUpHYXNndDNuOHNhRUpQeXFXS1ZV?=
 =?utf-8?B?bU1XOUNWWkg5K0dQZ0F4NDNaSjJQRjc1ZVVhSVlNQk51TXQrYnEyTlhMSUg1?=
 =?utf-8?B?cnpKYVMzZ0tlYkdGTmVubFRManN1YnVsbXkvcHZ2MC9hc3lWcjRYa21jaFRj?=
 =?utf-8?B?MisyQ2VLdDQ5a1J2aHRuR0MvMDNIVXhMVElsdjBwYTd3NmN1RnJsNkx5ekRq?=
 =?utf-8?B?QjJKVlRhUEN5N2VLaWNGWDF1SzF6UGh5YktTeDZjS0RNTnM0M1I4NWRYaGR5?=
 =?utf-8?B?K3Q3MGVDS1VIY1lzTzQ3MUFuMWFCSzQ4cnNwd1RQT0hJYkpRMDdyYVBYWkJX?=
 =?utf-8?B?V0VuZzI3NUE3Ry9OVzhJMGdUc1FuUmU1ZnI2SU84WWNXQkhhRXVqZUZDaFBP?=
 =?utf-8?B?am8xWVNWVE82ZEFzVk5KR1NYcVpQeFNEZCsxQUlpRmNGTjUwWnZFajRmaVFx?=
 =?utf-8?B?OXVIK09JZTMwWVUyRk9CbU5tck5aeU02WXc2U1pUTTVsdlkxZW9rdCsrREQ2?=
 =?utf-8?B?eWpkcVJxQnhkZitFeG52WGMvRVF6Y0xadkF4VVZvcmlnaGgxM0xNYkJGSGNV?=
 =?utf-8?B?cDd1ZjA4dGVRbE4wMVQxQ0U5NDNlTTVFYjh4eEhac0dqUFVkYWNiK1JaS3Vr?=
 =?utf-8?B?MTJYWUs3MWxpb1pTTGhIL2Jkc1E4N2xzakhhRWdRWEpyTWs4dWl0Y21GU09r?=
 =?utf-8?B?M0VHMUwwL3AveGJVZU9QZWRheGpTT1UyZW5lejhpdkN2VUZRd2pITmxxcXIv?=
 =?utf-8?B?dFJzL2JrNEdCZUxRMnBHNlJqbDEvZmRBUWlUTUZkakRINWp2ZENBeGpKcGJZ?=
 =?utf-8?B?UmcxaVZpQzArL3FqdjFZdkpDcU5PUmo4RkpYODhGUGNDbUZ6anZxYlNzZjFG?=
 =?utf-8?B?SzdoUXVLOHJscmNPaUhDZU5yMmtjVUJjSnpBellBUHYrUDdHV1FhY1JnMmhP?=
 =?utf-8?B?NWlPRWxQY1hQNlc1VFVRYnBQL0hhNlVVS2huSTJHbGFoRFhNdnBxYW9IOUFx?=
 =?utf-8?B?ZWpFbnpwRGIzZVkwb2M0bWIrVVF3PT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03942bbe-067c-43c9-abaa-08d9f54ec9db
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 15:28:19.5318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xbdu3orP1OUq07+lK/jQl+6RATxVLTHyjoop9bFcW8WPlje4Mdx99n5F5D9WuefVT2loXEdjJI1AGRurkErvrmm2vnnm/pcm8saVRgBSI8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4408
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10265
 signatures=677614
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202210091
X-Proofpoint-ORIG-GUID: BDE9TEqONYQ8ex4BQ0RlbKjsnD3eCBwx
X-Proofpoint-GUID: BDE9TEqONYQ8ex4BQ0RlbKjsnD3eCBwx
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
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
 Gerd Hoffmann <kraxel@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/21/22 06:58, Igor Mammedov wrote:
> On Fri, 18 Feb 2022 17:12:21 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> On 2/14/22 15:31, Igor Mammedov wrote:
>>> On Mon, 14 Feb 2022 15:05:00 +0000
>>> Joao Martins <joao.m.martins@oracle.com> wrote:  
>>>> On 2/14/22 14:53, Igor Mammedov wrote:  
>>>>> On Mon,  7 Feb 2022 20:24:20 +0000
>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:  
>>>>>> +{
>>>>>> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>>>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>>>>>> +    ram_addr_t device_mem_size = 0;
>>>>>> +    uint32_t eax, vendor[3];
>>>>>> +
>>>>>> +    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
>>>>>> +    if (!IS_AMD_VENDOR(vendor)) {
>>>>>> +        return;
>>>>>> +    }
>>>>>> +
>>>>>> +    if (pcmc->has_reserved_memory &&
>>>>>> +       (machine->ram_size < machine->maxram_size)) {
>>>>>> +        device_mem_size = machine->maxram_size - machine->ram_size;
>>>>>> +    }
>>>>>> +
>>>>>> +    if ((x86ms->above_4g_mem_start + x86ms->above_4g_mem_size +
>>>>>> +         device_mem_size) < AMD_HT_START) {    
>>>>>     
>>>> And I was at two minds on this one, whether to advertise *always*
>>>> the 1T hole, regardless of relocation. Or account the size
>>>> we advertise for the pci64 hole and make that part of the equation
>>>> above. Although that has the flaw that the firmware at admin request
>>>> may pick some ludricous number (limited by maxphysaddr).  
>>>
>>> it this point we have only pci64 hole size (machine property),
>>> so I'd include that in equation to make firmware assign
>>> pci64 aperture above HT range.
>>>
>>> as for checking maxphysaddr, we can only check 'default' PCI hole
>>> range at this stage (i.e. 1Gb aligned hole size after all possible RAM)
>>> and hard error on it.
>>>   
>>
>> Igor, in the context of your comment above, I'll be introducing another
>> preparatory patch that adds up pci_hole64_size to pc_memory_init() such
>> that all used/max physaddr space checks are consolidated in pc_memory_init().
>>
>> To that end, the changes involve mainly moves the the pcihost qdev creation
>> to be before pc_memory_init(). Q35 just needs a 2-line order change. i440fx
>> needs slightly more of a dance to extract that from i440fx_init() and also
>> because most i440fx state is private (hence the new helper for size). But
>> the actual initialization of I440fx/q35 pci host is still after pc_memory_init(),
>> it is just to extra pci_hole64_size from the object + user passed args (-global etc).
> 
> Shuffling init order is looks too intrusive and in practice
> quite risky.

Yeah, it is an intrusive change sadly. Although, why would you consider it
risky (curious)? We are "only" moving this:

	qdev_new(host_type);

... located at the very top of i440fx_init() and called at the top of q35_host
initilization to be instead before pc_memory_init(). And that means that an instance of an
object gets made and its properties initialized i.e. @instance_init of q35 and i440fx and
its properties. I don't see a particular dependence in PC code to tell that this
would affect its surroundings parts.

The actual pcihost-related initialization is still kept entirely unchanged.

> How about moving maxphysaddr check to pc_machine_done() instead?
> (this way you won't have to move pcihost around)
> 
I can move it. But be there will be a slight disconnect between what pc_memory_init()
checks against "max used address"  between ... dictating if the 4G mem start should change
to 1T or not ...  and when the phys-bits check is actually made which includes the pci hole64.

For example, we create a guest with maxram 1009G (which 4G mem start would get at
unchanged) and then the pci_hole64 goes likely assigned across the rest until 1023G (i.e.
across the HT region). Here it would need an extra check and fail if pci_hole64 crosses
the HT region. Whereby if it was added in pc_memory_init() then we could just relocate to
1T and the guest creation would still proceed.

> 
>> Raw staging changes below the scissors mark so far.
>>
>> -->8--  
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index b2e43eba1106..902977081350 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -875,7 +875,8 @@ static void x86_update_above_4g_mem_start(PCMachineState *pcms)
>>  void pc_memory_init(PCMachineState *pcms,
>>                      MemoryRegion *system_memory,
>>                      MemoryRegion *rom_memory,
>> -                    MemoryRegion **ram_memory)
>> +                    MemoryRegion **ram_memory,
>> +                    uint64_t pci_hole64_size)
>>  {
>>      int linux_boot, i;
>>      MemoryRegion *option_rom_mr;
>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> index d9b344248dac..5a608e30e28f 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -91,6 +91,8 @@ static void pc_init1(MachineState *machine,
>>      MemoryRegion *pci_memory;
>>      MemoryRegion *rom_memory;
>>      ram_addr_t lowmem;
>> +    uint64_t hole64_size;
>> +    DeviceState *i440fx_dev;
>>
>>      /*
>>       * Calculate ram split, for memory below and above 4G.  It's a bit
>> @@ -164,9 +166,13 @@ static void pc_init1(MachineState *machine,
>>          pci_memory = g_new(MemoryRegion, 1);
>>          memory_region_init(pci_memory, NULL, "pci", UINT64_MAX);
>>          rom_memory = pci_memory;
>> +        i440fx_dev = qdev_new(host_type);
>> +        hole64_size = i440fx_pci_hole64_size(i440fx_dev);
>>      } else {
>>          pci_memory = NULL;
>>          rom_memory = system_memory;
>> +        i440fx_dev = NULL;
>> +        hole64_size = 0;
>>      }
>>
>>      pc_guest_info_init(pcms);
>> @@ -183,7 +189,7 @@ static void pc_init1(MachineState *machine,
>>      /* allocate ram and load rom/bios */
>>      if (!xen_enabled()) {
>>          pc_memory_init(pcms, system_memory,
>> -                       rom_memory, &ram_memory);
>> +                       rom_memory, &ram_memory, hole64_size);
>>      } else {
>>          pc_system_flash_cleanup_unused(pcms);
>>          if (machine->kernel_filename != NULL) {
>> @@ -199,7 +205,7 @@ static void pc_init1(MachineState *machine,
>>
>>          pci_bus = i440fx_init(host_type,
>>                                pci_type,
>> -                              &i440fx_state,
>> +                              i440fx_dev, &i440fx_state,
>>                                system_memory, system_io, machine->ram_size,
>>                                x86ms->below_4g_mem_size,
>>                                x86ms->above_4g_mem_size,
>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>> index 1780f79bc127..b7cf44d4755e 100644
>> --- a/hw/i386/pc_q35.c
>> +++ b/hw/i386/pc_q35.c
>> @@ -203,12 +203,13 @@ static void pc_q35_init(MachineState *machine)
>>                              pcms->smbios_entry_point_type);
>>      }
>>
>> -    /* allocate ram and load rom/bios */
>> -    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory);
>> -
>>      /* create pci host bus */
>>      q35_host = Q35_HOST_DEVICE(qdev_new(TYPE_Q35_HOST_DEVICE));
>>
>> +    /* allocate ram and load rom/bios */
>> +    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
>> +                   q35_host->mch.pci_hole64_size);
>> +
>>      object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
>>      object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
>>                               OBJECT(ram_memory), NULL);
>> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
>> index e08716142b6e..c5cc28250d5c 100644
>> --- a/hw/pci-host/i440fx.c
>> +++ b/hw/pci-host/i440fx.c
>> @@ -237,7 +237,15 @@ static void i440fx_realize(PCIDevice *dev, Error **errp)
>>      }
>>  }
>>
>> +uint64_t i440fx_pci_hole64_size(DeviceState *i440fx_dev)
>> +{
>> +        I440FXState *i440fx = I440FX_PCI_HOST_BRIDGE(i440fx_dev);
>> +
>> +        return i440fx->pci_hole64_size;
>> +}
>> +
>>  PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>> +                    DeviceState *dev,
>>                      PCII440FXState **pi440fx_state,
>>                      MemoryRegion *address_space_mem,
>>                      MemoryRegion *address_space_io,
>> @@ -247,7 +255,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>>                      MemoryRegion *pci_address_space,
>>                      MemoryRegion *ram_memory)
>>  {
>> -    DeviceState *dev;
>>      PCIBus *b;
>>      PCIDevice *d;
>>      PCIHostState *s;
>> @@ -255,7 +262,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>>      unsigned i;
>>      I440FXState *i440fx;
>>
>> -    dev = qdev_new(host_type);
>>      s = PCI_HOST_BRIDGE(dev);
>>      b = pci_root_bus_new(dev, NULL, pci_address_space,
>>                           address_space_io, 0, TYPE_PCI_BUS);
>> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
>> index 9c9f4ac74810..d8b9c4ebd748 100644
>> --- a/include/hw/i386/pc.h
>> +++ b/include/hw/i386/pc.h
>> @@ -158,7 +158,8 @@ void xen_load_linux(PCMachineState *pcms);
>>  void pc_memory_init(PCMachineState *pcms,
>>                      MemoryRegion *system_memory,
>>                      MemoryRegion *rom_memory,
>> -                    MemoryRegion **ram_memory);
>> +                    MemoryRegion **ram_memory,
>> +                    uint64_t pci_hole64_size);
>>  uint64_t pc_pci_hole64_start(void);
>>  DeviceState *pc_vga_init(ISABus *isa_bus, PCIBus *pci_bus);
>>  void pc_basic_device_init(struct PCMachineState *pcms,
>> diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
>> index f068aaba8fda..1299d6a2b0e4 100644
>> --- a/include/hw/pci-host/i440fx.h
>> +++ b/include/hw/pci-host/i440fx.h
>> @@ -36,7 +36,7 @@ struct PCII440FXState {
>>  #define TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE "igd-passthrough-i440FX"
>>
>>  PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>> -                    PCII440FXState **pi440fx_state,
>> +                    DeviceState *dev, PCII440FXState **pi440fx_state,
>>                      MemoryRegion *address_space_mem,
>>                      MemoryRegion *address_space_io,
>>                      ram_addr_t ram_size,
>> @@ -45,5 +45,6 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
>>                      MemoryRegion *pci_memory,
>>                      MemoryRegion *ram_memory);
>>
>> +uint64_t i440fx_pci_hole64_size(DeviceState *i440fx_dev);
>>
>>  #endif
>>
> 

