Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCB256A6CF
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 17:23:12 +0200 (CEST)
Received: from localhost ([::1]:57934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9TLT-0006h4-AB
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 11:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o9TJw-0004vf-4M
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:21:36 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:11688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o9TJu-0006rh-2S
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:21:35 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 267Eke8U004460;
 Thu, 7 Jul 2022 15:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=cPoA6EMI+1sXlZ4a3Tvz2cEcp8z9RagZ4Bm9lt0OGkE=;
 b=OhgzZ6nt2j2+mhFWmK22/QJtHetOkoHt8kZpMFphbug3IhMHx7TfK7EtPL2BYYqLALnq
 y8p3lW18Fz/rz5yhKyZdEdfPHTPfgXRLIRDwxR1MJ4loHQZUMNfQJksMVyJpMSlGesMS
 pX8OYW9BZmOhmFGQGZ5+BKrXyTGAUx77NkFTM9jJLEGJRoOvwkuuFMs/aqkNGNzEAMAV
 ew9+FBlVQLSHVTpNA/V9Ty9ZXQ2j7lhNrEF6mgJy/HjPcHvQPWU/DHUReGivtKec0h7/
 GKk2XrA5T6c63fXnzPxdoW2B7+Sraxn2IuDEt8nHXKWuyJ6fHs9ATu40qIBpVQHiy6Zd JQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4ubynjv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jul 2022 15:21:21 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 267FFJTp031180; Thu, 7 Jul 2022 15:21:21 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h4ud5vj19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jul 2022 15:21:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFd2zdcM+vosvywI36CVIMk9Fw1TwuzlfiQnUttEzpS74QB7hHIZPyt30bWKZiV+jetA/SRrN6d7tM0h7ikQoc7xHRLylVt0r2cTdn3Ib8M1oUk4yadur236timchH4gSBdjKzHcbfk4T7H2IzoIckPOgFDJuQ34oL8BsvjcL25vtB2Lin1YEqKgEMEa1v732qO5jjNPeP8lkyqJSvPXWUa/IdE7lEammYd+i1K76Kn5N6zhu+1XQenQ/z3QsAyyecK6BApXQMHLkbbxRiVjcYdhbZAbONZSdY08D6XwR/fBxag5lkjdkgp9MMQvve4qWYeuL6ra7B3C/rME8gf4Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPoA6EMI+1sXlZ4a3Tvz2cEcp8z9RagZ4Bm9lt0OGkE=;
 b=WAt1cGdN5m2AtpRpmb2KjmYNl8IHynh7tOx+YgsX1mo/jtj/mZQkou1rHhdhrV381UFys9p4SJFcNA+lvemCXMJF06KGMqnlkl2hSJU1xm96JhyzM4HHKftwTOrR8vLPOv22XM/QHYCNjhTT2govt1PQIiPm0nTk/glc//SGxydX8xSDwDIc7A8zDiaFY8VkOeufsktIVH1zWvwuaM985bgXNRfEoNYYRIzWvnMicxshrlJWNgAHP5iQmPQdSUyW3D+X+PmGRGteh4b7SkMZ1v6jici/eA84VoCiMBewTMV++lWXKkUBkdVX72RwxxMLCant48Fmd2QZUZSOK0UjCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPoA6EMI+1sXlZ4a3Tvz2cEcp8z9RagZ4Bm9lt0OGkE=;
 b=Jn46MF2PTmvxh0ZRaWxrTNVr07LoHaCr6Jo1xjq3JMuQMNececl7+nvMZPGaoVHBgovftjA2yHtcJUiplv8P1W4vzHhDwTBd72ajzsLJDHTBNjZoyHDvkiXdTJwuNKyVYsfAyaW4yRT8XJN0DKYYRNaQCwIja2Lfu+gaeswb4Ts=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by DM6PR10MB2985.namprd10.prod.outlook.com (2603:10b6:5:71::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Thu, 7 Jul
 2022 15:21:18 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 15:21:17 +0000
Message-ID: <b9ae2b09-4b25-34f7-e9ed-1aad3ebfadf5@oracle.com>
Date: Thu, 7 Jul 2022 16:21:07 +0100
Subject: Re: [PATCH v6 07/10] i386/pc: handle unitialized mr in
 pc_get_cxl_range_end()
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-8-joao.m.martins@oracle.com>
 <20220707150533.68892c2e@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220707150533.68892c2e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0016.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::10) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50495497-d0a9-483c-a1a0-08da602c56c8
X-MS-TrafficTypeDiagnostic: DM6PR10MB2985:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T1dTaqXKm4B4uS5r5g4abHEzf1afSgnVZm6i8DKUD55DkYvwj/AK/mSRTTLkDUPfBtH41cBFCtrha/u0adaUPuMSlvdkxxwscWYY+rAw17X6iGZD2To0hL1LXPjWkqwSjls02IH2faYIkZPS/LIslfBGA0p/Chx2juEa2xTOjlxxteevUnhyVtEHfm+wAWl+s+mU1lBZEK/EDUe0PX9PAURj86y4faRO828JUP50487sbGBMSKCFmvWxnuYsK0Hx2pKfkDKEmK930KB3c7Il57n0KvApOJq0OjsVH8q82cUhFkGNpS8a0tDKXgoxDXbj9ASChd45Df6NwubbLm49XOAtmYV059yW2+yQnWGBJmmd02pf7pBXOFFwdw2GcDaIftBW4fIEEqbzjtPb0/XdsheCoADOXlWluo5CTp+DNR7kA3aLrsdS7kFhV0Vdx7LihzI6iZXrxPWM9gwReo5oF/8ZInjkT1OvBgMk9XhbrmR0h1+cLVl3As1VqoBng7bzdYcDwH4ZtT+K8QHfHAby908fHjeq+khiPrVF9cx69X3L7rMe8/dUfY8UZRUXf53MRyVS28bznJaYw6zlGY86EwcIweTQ29Iw5s+dN9Zd2pVURTtb5TwlWyB6fKVK/SP9m5agQ7QbfO88WVef/AAEjiKRvyxE2hZiTJFtIcOJ1PLRpolIQapnZPIgOhRsTWcmhy+7xxkwVKCCQj4RJ2RPwhriJfHrRBhMtSyYKy8R0Ev4/W7t7T+PMuBz3fgFA6ultJKIvH78Z0C7h+Y7kh5csxtzdjzODQf11WOE/HFgZn0CGxAzM3l9znN79z+rmMQT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(39860400002)(136003)(376002)(366004)(396003)(6512007)(66476007)(6506007)(66556008)(6486002)(8676002)(66946007)(4326008)(26005)(6666004)(478600001)(53546011)(316002)(41300700001)(54906003)(86362001)(31696002)(6916009)(38100700002)(83380400001)(2616005)(31686004)(186003)(5660300002)(36756003)(7416002)(8936002)(2906002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWJWd3QxcWVMVDlqV3c3cjg0L1hvN050V1o1ZjZrUUpvNDFPZkhwT205RFM5?=
 =?utf-8?B?WXhyd243cTJxSXdmRy84UEo3Y2lNSGlFd2cxOW1EdVM2di8zbnZIS1B1Uy8r?=
 =?utf-8?B?OTFyWFF1V0dnMGEyUmtYZlZrUFd0NjAySlh5ODhoTjVsM2NYdkxBTmoxejZi?=
 =?utf-8?B?Rk5KcUpxZ29hNmRaOEZic011bU9LUlVxOFFxWjViNmRyWkZnb3p5WXF0MW9B?=
 =?utf-8?B?WU5QTzFMMlhZQXprdGt1akU5VnlEdUxZY01kVnQva3ZMUEdmczlSR1N4ZUZY?=
 =?utf-8?B?c2VkNjZvaU5yWGF4ZjI4UzhaRlpObmRYcUJKdHd1L2RVNEtuT0tKTUtKcVd5?=
 =?utf-8?B?d0Z3OEJ0UEFMK3pKeGJrakoxZXU0czFsNExSREpCNndCMURHeUNKRW9UVGcy?=
 =?utf-8?B?RWlMQXhObzRRNG5POFJNdGR3QWxZRGNsUEFRRnQ1cklVYkErcGk5RGN0dDRB?=
 =?utf-8?B?NlhjOE1TUUtPZXNQN2xOZURkb005YU5BMGRDNDlTZzZZcnNOUUpRbnVTVys3?=
 =?utf-8?B?N2haVDhHOVRleEs5WVlGTG10enJUZmFZSWpGdlQwWG1JK2UybDViUWZwdXFS?=
 =?utf-8?B?MUpCZFBIaU03QmdFK3MvSTlVdWFVeE5WSDNySi9OZlZ5eU1vczlvTW1STm1M?=
 =?utf-8?B?dVlaalJhQTRQVUsybWdKbmcxYXQ3Zm55RWI3QStPbFMySlkreWIwdkE3WkQr?=
 =?utf-8?B?MFc2TEdLemkwaVdFYy8wUXpBaHZSQ2lmSmhCdGdjM3owaXZ4T0RMdnlkQ0E2?=
 =?utf-8?B?VFNNK2VLQklqYkVXOXJodUJGZmsyYXlsVnBBZ1B4VVBWdmdCQVMzNVMyS1dD?=
 =?utf-8?B?RzQrZlIwczF5WDZpSzJla1A1S2I0UERKbUt6MlRySi9HSmpPeDhzbHgvRURi?=
 =?utf-8?B?TEdiNjFnQnMwVEx3RmlWTjBqQWpCWGJDM3ZSV3pKQXZCeXg1Q25ORkEvN09N?=
 =?utf-8?B?akZWeXJDaDFCRklEcVVBWEFlUStJbUIwODBBc3oxb0lEQzhOTmVPelN3aWpD?=
 =?utf-8?B?TzhlZFJUOU4wMlhvdnJQY1NKa25jNG9jK3BTUndIWGNwRHVBdmw5UWFyMC81?=
 =?utf-8?B?dFBNU2JPUjlnY0UxYUpvc3U3eVVLdUFhOFNDdzNxNmxPU0N6SG9zaUlheHdu?=
 =?utf-8?B?dGtHTFN5aStKV081TmFJKzZtMzY4M3ErN3MyOHpOMjdDREs5NlE0V016NVpk?=
 =?utf-8?B?bXREWUoyVS9kK1hnckgrVnZpblg5ZEVwenlMZVpzRWFkaXExU2pHL1RTUmZU?=
 =?utf-8?B?dnRLaUpIZS91NlE2eVcyMmlVeDIrNS9PZjdpUWxSd0R1bDVMQ1NMTXp1akxX?=
 =?utf-8?B?Q3p0STQ1L0dXSVE0V3BRMkh2Y1J2QXpjT1R2UjZ3QzFaWkczbWlDLzlwOUJk?=
 =?utf-8?B?dXBXbU9lUW56cGZWNzU4RFd4dTZBMXFEVEFudlR0U3Nqd0FId2JyUzVNdWtu?=
 =?utf-8?B?NldWclpoeURuUi8xSVZDV0lsby8remh6ME1iWUlER2lFWDQxTUpGek1ReEZz?=
 =?utf-8?B?MW5OOHc3a3R2bW5kUDRYa3ZHZkhybVdreFhYUmxoSC82MStxUWQvVWh3d0t3?=
 =?utf-8?B?U2paVzVGaDZrR09iNnlKUU1ZT1JzUytsWjBIaWNtL08wMDZZcE5CZ29hY1Uv?=
 =?utf-8?B?eXlweTRNQmRublFtN0kySVAzdDJ1ZTduTmtJVk1jRk5GNEx4V0dYeEpXSEN2?=
 =?utf-8?B?TnUxUGVEUEdvUXhGMWJyTWVOT0ZteWFvTm5tNWdZSkp3d3R5alFoTk0rQWxY?=
 =?utf-8?B?Y3R6RlY0eGR1eFRSejd6ZmNXblVkYkQ2bnZYM0NndGkrdnRhTjZpcVMrcXZp?=
 =?utf-8?B?bnVmSkw2cVIxUHdBRkZNUE1KYUFYL2JpUmhDMXNaTk1TT1F3QzkzV2pnbHJM?=
 =?utf-8?B?WDl4a0Iyd1ZLNzNQMjEzd2pvRTlPMzM0dGEyYlVZeWd6Q0p6czFtSFJhcXFa?=
 =?utf-8?B?dGxoYmFMWi9ITnVuN2JLQmpPMUFpZXJmN3hvVWdEQWt5ZGRTMmNpM3ZUZ3Y4?=
 =?utf-8?B?V1NuSkZVamJKcXhlNGtqYXhJQWFPdGY4cndCeDI4d0ZHWithV0Evb3BvMU1p?=
 =?utf-8?B?SGZYcXJUcUg2WGZZdFFZWWRxdklYNFlJZG9aT21qUWFkQnBaWXlEZkM1SzVq?=
 =?utf-8?B?ZEp1ODFiNGFVMGlSZ2w1OGx3M1FKWG9wbjhVSUs0UVVWNFZPL1Z5NFBGUjc2?=
 =?utf-8?B?eFE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50495497-d0a9-483c-a1a0-08da602c56c8
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 15:21:17.9037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KDmuW8Yt+5ziVqxxmhY2ctKbmTD2iocg/EEd1v5T1DCpJdLDLuPYU/QlnhDe0pLxIS1gO08Cpa4GLDyp0wmWpQNvMvWXlNiLZs3jiqexpIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2985
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-07_12:2022-06-28,
 2022-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207070061
X-Proofpoint-GUID: -nMhRm-c_jmBmfazhUt4cYif-HtIHrJ1
X-Proofpoint-ORIG-GUID: -nMhRm-c_jmBmfazhUt4cYif-HtIHrJ1
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
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



On 7/7/22 14:05, Igor Mammedov wrote:
> On Fri,  1 Jul 2022 17:10:11 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> This in preparation to allow pc_pci_hole64_start() to be called early
>> in pc_memory_init(), handle CXL memory region end when its underlying
>> memory region isn't yet initialized.
>>
>> Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>  hw/i386/pc.c | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 8655cc3b8894..d6dff71012ab 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -857,6 +857,19 @@ static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
>>                  start = fw->mr.addr + memory_region_size(&fw->mr);
>>              }
>>          }
>> +    } else {
> 
> 
>> +        hwaddr cxl_size = MiB;
>> +
>> +        start = pc_get_cxl_range_start(pcms);
>> +        if (pcms->cxl_devices_state.fixed_windows) {
>> +            GList *it;
>> +
>> +            start = ROUND_UP(start + cxl_size, 256 * MiB);
>> +            for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
>> +                CXLFixedWindow *fw = it->data;
>> +                start += fw->size;
>> +            }
>> +        }
> 
> /me wondering if this can replace block above that supposedly does
> the same only using initialized cxl memory regions?
> 

I was thinking about the same thing as of writing.

If the calculation returns the same values might as well just replace it
as opposed to branching out similar logic.

I can do that in v7.

