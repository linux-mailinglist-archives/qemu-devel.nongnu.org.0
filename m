Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 036E1690ECB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 18:02:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQAHh-0006Ri-M4; Thu, 09 Feb 2023 12:00:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pQAHb-0006Lx-5p
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 12:00:27 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pQAHY-0004Br-6p
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 12:00:26 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 319Gi1ZR031100; Thu, 9 Feb 2023 17:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=ORHKtyGQ2oHn/HNxkOCpkFDHTksRrMIigZT0NmJHjRo=;
 b=0znX+Z8osOIsj9r8QhpsikzYKYNisjcEhjGSGm2jwg+xPiA0slDZPmtmpG/VDXwJplOv
 li/RoPEaXV6+W5k1zcnTJsMBUy2BYv/8EMwt0eYTMkbX5Ihxz0x7jJegveaJ9AAym12S
 caGF95Wmiat5ujQucNDSPPSbqaTK+Z1L5PhRotI6bs9kvdAYlLDbTDCKeyEZttsld0za
 rLsaJihZ3rySDFb+pHtWcecjlg8PwYNByEhdIjUrPjwOb+NxalF/Nm/hRPxi8iSDOvVj
 2l6MM2+1wCSofcQKXNy810XDEPokgipsPP0TZ9asXKH1Mhi0Eaks24k13WN6YZu066Ci +A== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhdy1bbj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Feb 2023 17:00:17 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 319GiGsi025715; Thu, 9 Feb 2023 17:00:16 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2049.outbound.protection.outlook.com [104.47.73.49])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdtg5a1q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Feb 2023 17:00:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZhEi3m0rbdOlDK2TUXbIkfDiE+wUU2xr1XeEVTXiQlI28Bw/61sC0qqqz1+mui1zKiiRmql0C6unq9SqZxa5+JnPzvY95KVFZU9WJE/tygvOuwo+T2/Vs5Thp2Qtk0DE6sG1K6MBQEIGEk3vMjlJNAObX5IaO7raLzBIXIgvZZv5dNutsXIPbJHzoPoDzoZOQkVPMMla1rC6k/4BAMUl8vWGW+GyV4j16tqmIu0TR7P/0vsvQudtCJDN6sq2pCJ6WYvGfIfaWgmK1ZiJ6TU4Q9BycWEnWy3gOeiXW6auiFcE7x1h56Iz9mIgmDZIL5T62klGUGtMvftG+RYd1J/mSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORHKtyGQ2oHn/HNxkOCpkFDHTksRrMIigZT0NmJHjRo=;
 b=Fn+DzRipdnmQYMIHweD6S0DGnLpYh4ONibNCatbvbd+xHL6DVWACraQRDpCJ8BWqzF57qnIQUJLEXP5obz6cV5NoxwVP68vaj8jKvt6Eu8yuNLvubW2dGQH7rpq0VH9Z+PzwfJnhGPJYxmVpPhxpY33l+7vWg5m9fo2Wrg9FlUQoBtnCAO3mkc2YwUtBvnDlb2Fb63ty3czEPWI6C+wGfggyes6aXKBNf4hGEdzLCmB4av1SKTO6kDyeY/l1zVzDLoT13NzXPKw+Q/g23KW7YxilK4O38tz83ke05kxYxO+UG14OscIzT5Ayo+pYrBlepVQObtcS4Q1j0ToW7++jQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORHKtyGQ2oHn/HNxkOCpkFDHTksRrMIigZT0NmJHjRo=;
 b=hZg5Tr345Q1A1F8+bC0DC6MOPZti+GGcEqWQHZ9mgm7EPabztwxlmJ0fRLf4w6EXBFpUCRtTXgAi06D+M4IU3h2FqpXzSUUuzqRx3t5GUTmsibK7kRo/ibrF60tYK5yI1X0bYnroraO1b7dtGM4R/4JUyibDCGrlvJ6AKQEnqTQ=
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by BN0PR10MB4917.namprd10.prod.outlook.com (2603:10b6:408:116::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 17:00:14 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c%8]) with mapi id 15.20.6086.019; Thu, 9 Feb 2023
 17:00:14 +0000
Message-ID: <7beaf84a-008e-c9a3-3698-2a230196acf9@oracle.com>
Date: Thu, 9 Feb 2023 12:00:09 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V2 1/4] qapi: strList_from_string
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org
References: <1675795727-235010-1-git-send-email-steven.sistare@oracle.com>
 <1675795727-235010-2-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1CLFMUDvaOq2QXCKpb8Zj4PRr-tKV1q9L8m2EfgORPLj7A@mail.gmail.com>
 <32f34f74-213d-7107-907d-dda0a509878e@oracle.com> <87h6vwnstx.fsf@linaro.org>
 <87cz6j6tt0.fsf@pond.sub.org>
 <d25846e4-13fd-c683-b5e1-1660f4470d35@oracle.com>
 <875yca23dd.fsf@pond.sub.org>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <875yca23dd.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR03CA0149.namprd03.prod.outlook.com
 (2603:10b6:5:3b4::34) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|BN0PR10MB4917:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d059938-0a63-48d6-dbbb-08db0abf1c78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F2QyxQ9SqQgJdrH+XpDq9w25w0VGEqQWeMQfZjLzLZeREXRp+XThuTu8M+VZyN19tq0hD+4FGpMTiHTnlib6PzwdZ3vB1TnYa+hfa1Oxxrw2qaxafjmSxLsnKAABlgV5JnX2QataQVrMXd8EmP/40/FEvUl30pfN4BpzIqD+/3BLExs1LHILlzqtsh9MgD3k5b4Dgmo07Es+LCDPxs4uhRmB/rr/bub8lHQhowLdNjT79h33Kdtu+xT4q5nQIcqSo7NRUY8GpveD0vjDuEQC+1vgSyiKwpzrESQ8P6mDPEW/UXF2Gi/w/ejfU0fjiubIAnw5MrrEdCvtLlcsCbNe4Dw/tI0XLENh4BkIdQX0FKNvJYt1isqpCQhnf/R0g/b+zE5BoU6yPzGiCZkQrY8U/5mAAP6ON4IFO+c5HH9rEGP8Xk5LnknD/ggxHIE6sJsOHHfloqNDaadvvXsPyPLW6NVDKUCnMRHuKtqDn4DyGqahtHNS78Cnxu+wWx+XZJnMOHQJqsPAetRbexQSd2c8BYSwP5T28E82w8AhcuBR8xUDTmJDb4QrvqzOajK5GmVBt3YzDGfKf/XsMoHIGYJ8Lgz72SMqNrhXZwFItXnjikMMJNeRwlboqVKDtfHPgLQOSmpKH6D0sQulSal/aeyYppoDjXW9MhP4Pt/ytVsHuSnXCmveRX35FEIwSZRIsjjBdpal5eyPGVYiXYUlXe1lSAAy4eCQdUWlYZo/5LmXdpyds6UW3Xd5ZLDZZUcHcnmNSchowIPiLcEoyyjy7EBtl/z40xQFdEbkU2/tJup/GEW2WPQvAnjaelc8zr+pf6Fj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4684.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199018)(66574015)(31696002)(38100700002)(86362001)(44832011)(2906002)(54906003)(41300700001)(5660300002)(8936002)(66556008)(36756003)(83380400001)(4326008)(8676002)(6916009)(66946007)(6506007)(66476007)(316002)(478600001)(6486002)(966005)(53546011)(26005)(186003)(31686004)(6512007)(6666004)(36916002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkJQVGFZTnhrSm4wL21QVVpMZVhteUlRMzlLdnlQSSs2ZzVIQVJDMlFQcCtl?=
 =?utf-8?B?bWdhaWVmSnBKSjZOenh1bmVsR2ZoQThqT1A0aWpSZk5iZk1DajE3OHM1U1lN?=
 =?utf-8?B?YTVDcjRBMThYNjlQdmJEN0NCVExGOEhETXRsWnJQNVptb3RtS0lydFVoYnA2?=
 =?utf-8?B?ZmVNK0N4MnRnbjhBa2JqK3kwSXloWjBFWmhCN24vNFpUYUhhRGJoMHlldm5O?=
 =?utf-8?B?c2x3YWN3eUJxRGRFZXlEOHNIeTZWQXRaeFZCbER2QjFUaXc5akIxWk5FKys0?=
 =?utf-8?B?b2RhVi9UK3hkNVllS0Z2czdUeDdLb1dHbUc3eTJSSEJFVUlaRm5tNFpCeGd3?=
 =?utf-8?B?TlRqNGo4alBvL0pGWloxTTB5NFU2dk1ieHMwbGcyVzBpWVhVbG44czFyU2tm?=
 =?utf-8?B?eVYydE43RWhxTEhQNG5GV3ZQcTQvNlI3bGd6UkRWemQ4S1RCL1JLdnppRW03?=
 =?utf-8?B?QkRlSEZaUWpDUlNZWWJka3o4WnlaNDZzNkVZb1cySkZtNG5ZOWdDeWhFeXl4?=
 =?utf-8?B?MVNzSDExbHB2WHZvM2xrTGZUUFg2Q09PMW9TWFJuVVZyaWM1SWk3Um1YaCt0?=
 =?utf-8?B?Mzh2d3dZblRiczBGRTNJZVV6d1lyNk9YcGRZbzJ5NlQzRk1NcHFudVNjdS9H?=
 =?utf-8?B?Zm4xQlMwV3Z0aUJaRVJHNXBoNVVndWkzN2pwYXJjV0txYXJDODBVSTJoaWdr?=
 =?utf-8?B?N1NBTVh1OTUxYXkxMGVRbDBDeEtxMzJUSWw0ZWRCcVU4UlZHU0FyNXgrckJB?=
 =?utf-8?B?VllSYmZDbnNEUk5pWS9BR2VKaG4vWnhKNUV6V0hPWXMzVXNFcHF6RzI1VE5S?=
 =?utf-8?B?N2g3bEQyaW00bjl5SWVYNnl6QUZvMW9oRmppNDFCNEUzcTVNZmNZU2ZLTGEv?=
 =?utf-8?B?QWo2c2crUG9rQXdQSjlHazBnajM1WVNVb2VyUURQSnNSRkhTcVNKSFRZZHI1?=
 =?utf-8?B?b2lGbithcWtSNHNzT1grU0FsQXpjd1FaMG8vUWNvbnlzUU1KUTFRWm9wNXRR?=
 =?utf-8?B?SVBlb3lKQTgyeTBVaWhNdERLQ0RpSDFLV3hrM0pWSlJZS0I3OWUvdzJSVmY5?=
 =?utf-8?B?VC9tb0gvZUpqOGRMUHRZV25XTDNscDU0d3NSWXdQc1Bzc2UxaHovUU0yRFl4?=
 =?utf-8?B?RGZyNWtMZ2FRSUZvUHBrQ1dRRWppU3dya3BMVDRDdUVrdHZveGs5SGU0ZUUv?=
 =?utf-8?B?V2IwSjlseTBEWGZSUXhndDZEZVJJbWlIVldpc0pJZUFwSE4rK0ZwRXpLejdQ?=
 =?utf-8?B?YVZKSmFNQXdzRVM4SWZ1Z2xiRjRSSUZOVllvSmttL1V0Z09YUFp1dWRzMkxk?=
 =?utf-8?B?dTBrYk1CV1RXRmRCRUtSV0NRMDA2LzBxUE12NUl4ZXpZL04yZHUraU1qN285?=
 =?utf-8?B?QTBUVTFaTmJRRkVPQU9xNG5jNXFCVUh5Q1JzU2JqZmorVjBldExtd1gxSEVY?=
 =?utf-8?B?MkFzSjNoZnBmTmRMYlpXbGdHcXhtSWIyckZoaVExaHp2WVYwTHA5aDFvdXlV?=
 =?utf-8?B?K3E3cGtiZW1jT20vbTV3OUV2RmQ1dEZSOS9lNUhXTGtkREJQc1dSMU1TK01R?=
 =?utf-8?B?enRYTytlYTJXR2t0OU1IZks3endMbkxjRjl4Z21xTTBGek9ydjdYaVJiTEM5?=
 =?utf-8?B?Njg1TTdBOXBNUXliTkd5dVRPYlN2UHczbHRMSFVKTXhDTS8xNHExaTBQM1NB?=
 =?utf-8?B?UWY5RnFEeWhqVEhrdkZqWTNsTXZWU0xkQjV3MmNrSkxGajZoQThiZzRMekZt?=
 =?utf-8?B?Rld2Uy81ejMvZU1rM0swZmVxU0hHYTdQOUZnbFRjendOUktlNDFNVUJZSFN1?=
 =?utf-8?B?UGEwMnFnZWZDMDNFejZ6Q0tKRzN0OXFUTDBMT1ZEQk1qcjlpalgySUdGamNW?=
 =?utf-8?B?Ukd1bUp4Sk1NN214blRrUzZMSlVyQnBTSGZnT0dxazdqQ3QzZTlOaXJXZWZX?=
 =?utf-8?B?K2NLcW1OaXVieERLakFqQUd6YnVjYTlMYTRWVmtEaCtaSUMzdEp0UXRmYVJy?=
 =?utf-8?B?UE51RTJGSTdDaFg1dXErbU1tNzI1OTkwc3haNGY3WkM1eU90bXhNRzUzNEs1?=
 =?utf-8?B?RTByUlp5R1RyeHNpeWtlQzJNVDZNM216UlZZZzlIWCszem0wYU5JajNiY3dz?=
 =?utf-8?B?aUdzeEh6RUN3T0NwWC82NDdaRHh6NFRFYlRzclhqZXcrbHhXL2k4LzhnMHBI?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 9a+LItLTlkBPrwyoAASe5AAP+cbPKPNV6kqeFFcbeg5rhLIFtccBi7uGHN+bBE4qWQj19Nx+lohd6Y229Lcsiv5uFh3t4QQvarxvCOeDtL05rNFpOJ11l4oizCWcl/11KHKcYR1Jw43xP+5OQNxNEzEaCbvMFm6No4py+aKgXJt1JGLG4ZLPgbACfgu+3kRkhDcVhikmJP8tYKkGOGIbTeENv/sskUidOA9pjeqFmOXP3Va7PsZ2mEBsAkqyW8N+2afv7s+nDxjtvxw4tbxcUWWNXPJ8cYyinOqbZQ7g0G14586KS9mydPT0YGi0Fvw+D0bbOVNe/ORfXjv+O2HUlx+9XJifAVFYxIo9oCjikp2n7QWcBg9DmGgN8lTDVYe6J09Zrn491onrSVywnFJF9gGDQZDyVcY65MiaBvtmD441RKT3jexmIPjpaQ5WAOQZwOIa7lTKsBcngSzpQkhg8YHzNn4in2BudS2kV1DUFt9/CIm4HQ/R19UqSpw3ehSeTup0/OBlzQyBrULlNFvD5ybGeph9iATrVlwSvWOGAVj1msLTLGE4wivtR6Ugiv3S18B515t+xSsVRqRl9z9gkDyoHyU7aTVr0hB7V2x/SGIjaW4h38DAnxlXjxg/6up6ORvUCZjbjwd9t+q0ANRfqzJ+yqqYsVGV/1QaYuMh116+GiTqJ+lcUiHIUwphvlgCmKcDPhE43tKuQqba0GvRiNiOf6gp6pMoMeVwvItJoxvY7fbXtHNomgTnxqkuE6wVL9R8B5ZTvZBVO9n7gn6QSzukjEjJlaltwL3luItAoRiw1jUAIyjB4SvyMDqrIsatSJgiSEA9NwCfNsgvcRQFe0k5uepNKv5D+bwFS00uZ7A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d059938-0a63-48d6-dbbb-08db0abf1c78
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 17:00:13.8907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bDFkUfWcXNRjc818TGKU7llH/fhHzRblpfK2KfdegmODxPmF5d8e//q1d28u7jLbiHY3OTtXR2TEN1Mn+5ASLO9vR6En5PPu0MVgfeQiDe0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4917
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_13,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302090161
X-Proofpoint-GUID: RsHIEDCcwbR7bPKSlLGwihoMUYxZpuZW
X-Proofpoint-ORIG-GUID: RsHIEDCcwbR7bPKSlLGwihoMUYxZpuZW
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/9/2023 11:46 AM, Markus Armbruster wrote:
> Steven Sistare <steven.sistare@oracle.com> writes:
> 
>> On 2/9/2023 5:02 AM, Markus Armbruster wrote:
>>> Alex Bennée <alex.bennee@linaro.org> writes:
>>>
>>>> Steven Sistare <steven.sistare@oracle.com> writes:
>>>>
>>>>> On 2/8/2023 1:43 AM, Marc-André Lureau wrote:
>>>>>> Hi
>>>>>>
>>>>>> On Tue, Feb 7, 2023 at 10:50 PM Steve Sistare <steven.sistare@oracle.com> wrote:
>>>>>>>
>>>>>>> Generalize hmp_split_at_comma() to take any delimiter character, rename
>>>>>>> as strList_from_string(), and move it to qapi/util.c.
>>>>>>>
>>>>>>> No functional change.
>>>>>>
>>>>>> The g_strsplit() version was a bit simpler, but if you want to
>>>>>> optimize it a bit for 1 char delimiter only, ok.
>>>>>>
>>>>>> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>>>
>>>>> Yes, and it saves a malloc+free for the array.  Small stuff, but I
>>>>> thought it worth a few lines of code.  Thanks for the speedy review!
>>>>
>>>> But is the HMP path that performance critical? Otherwise I'd favour
>>>> consistent use of the glib APIs because its one less thing to get wrong.
>>>
>>> The patch reverts my recent commit 0d79271b570 "hmp: Rewrite
>>> strlist_from_comma_list() as hmp_split_at_comma()", with a different
>>> function name and place, and an additional parameter.
>>>
>>> There is no explanation for the revert.
>>>
>>> An intentional revert without even mentioning it would be uncourteous.
>>> I don't think this is the case here.  I figure you wrote this patch
>>> before you saw my commit, then rebased, keeping the old code.  A simple
>>> rebase mistake, easy enough to correct.
>>
>> Hi Markus, I am sorry, I intended no slight.
> 
> Certainly no offense taken :)
> 
>>                                               I will document your commit
>> in this commit message.  And in response to Alex' comment, I will use your
>> version as the basis of the new function.
>>
>> For more context, this patch has been part of my larger series for live update,
>> and I am submitting this separately to reduce the size of that series and make
>> forward progress:
>>     https://lore.kernel.org/qemu-devel/1658851843-236870-1-git-send-email-steven.sistare@oracle.com/
>>
>> In that series, strList_from_string is used to parse a space-separated list of args
>> in an HMP command, and pass them to the new qemu binary.
>>     https://lore.kernel.org/qemu-devel/1658851843-236870-16-git-send-email-steven.sistare@oracle.com/
>>
>> I moved and renamed the generalized function because I thought it might be useful
>> to others in the future, along with the other functions in this 'string list functions'
>> patch series.  But if you disagree, I can minimally modify hmp_split_at_comma() in its 
>> current location.
> 
> I'm fine with moving it out of monitor/ if there are uses outside the
> monitor.  I just don't think qapi/ is the right home.

I don't know where else it would go, as strList is a QAPI type.
include/qapi/util.h already defines QAPI_LIST_PREPEND and QAPI_LIST_APPEND, so it
seems like the natural place to add qapi strList functions.  I am open to
suggestions.

- Steve

> 
> I'm also fine with generalizing the function to better serve new uses.
> 

