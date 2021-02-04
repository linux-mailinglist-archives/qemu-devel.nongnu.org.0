Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B5830F567
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:52:45 +0100 (CET)
Received: from localhost ([::1]:33240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7fzw-0003D1-EO
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:52:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1l7fy8-0001iw-F5
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:50:52 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:48306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1l7fy4-0005AL-3F
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:50:51 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 114EnlQe075836;
 Thu, 4 Feb 2021 14:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=corp-2020-01-29;
 bh=fhES0p7EnR5QcrRfZTKRocPXgf5tcaU9SDSWlCeAfiM=;
 b=qft1blweyX59mcTru4zNPxaEJ5kN8fCBYFRy+G9ha3rzBmqy0EZRJV2CToe8V92oDArz
 P1tZOMirriEagw6co7zh8EEpd9uRMWwSubPPxqDogHy6w40E/9ytq11tuSS7d5Zy9e9z
 nLQ2I7HbSZuD3gvROaDQLGf5ZqlJE4XJzhl/M+F39Fv2D6ZKMAVjHnolRTc3Ga4zMAPE
 6oDtkNtlF6y334WMTluRQyUIndAc83izdn4KbDP80A+OEu1258GIsXlNTxk69iAFnsUJ
 39aEv9kqAag7Zt78eqO5JK3PPEgYrWcJRoYzNnXJ2OHhhpL+UfgVQUP1WQuOvZ9tk303 XA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 36cvyb5re7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Feb 2021 14:50:19 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 114EfbHh155486;
 Thu, 4 Feb 2021 14:48:19 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by aserp3030.oracle.com with ESMTP id 36dh1sjfk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 04 Feb 2021 14:48:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oF5hWy2VXfYGSCTiatmT3yxUggESdVi1RuCycGraCpD/yEPSozhjpCOMlV6PCo6HApJR0Qg81gU37Q4g9JHLYzNzf/WVzBPxJ/ePtrWluGGRvC8FUDrmW2iOCSEOTWsNqMrT+jFZfT1oVfMWvTWINVn/bi/E1ZGq8YiYyNyW7rx9LUFjw6CZ6m5uXONfn+gFjNFxQfDEqKd9+TvidIppXvsPgnmo7/4bwggzRfscV9ViVbUec1ZaTNTkrn4x0BSQ+DEgXJyYomUM07RlHnK25ReprQeU+5BYw2EiV5AYIC9F6IZQS0DZpwnSTNJlb196f7e+qtz/omtpBpwOXqGOVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhES0p7EnR5QcrRfZTKRocPXgf5tcaU9SDSWlCeAfiM=;
 b=T1R7gIwrz5yXp+7SNak02RfBrinGoq6GZsRFpmwc/v9YDH/a+cNxqmfic7lsB4wBiEWx79KSXVPzagCy1suSps+ryppmlt5Kbtk+MHX+rBmn9Hcel/cactWwaxDOvt70SSNXB7Y1Zn8bmdzsMBKUASp+CZBSWAx+8hQ4rT0V9+k+sOVdlKIHdL6GkDpWuUMHax7SDMNODAsRs3HfFExMHpETUa8iaXIVfaGOLiniffSONaZfg3cBDuQUC7/cdrI/QWmqI8KfZ7IOQMSIqe0BDNwVMaGuYAKBVM5t9ZfumAI5x7wDb6sibu2whiu3mkKVurnqipa2yneqEP238CD1qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhES0p7EnR5QcrRfZTKRocPXgf5tcaU9SDSWlCeAfiM=;
 b=xoHKFYzhS184QU6yGTmLt9M0z5R8Tl/BNWpjseEbprbXlc1MPPcyHQduY2VWwxS+jREO4ElRNLXlUwROlJLBTGV0OjM2tmhQ0cdYTO9oo6Plmg8Sm9zi310/BlnCB/PqJ4TKj1PqTTQd6s/GbN0lOitztIBo3XlMq4xIw6ztNYw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from CH2PR10MB3912.namprd10.prod.outlook.com (2603:10b6:610:a::30)
 by CH2PR10MB3960.namprd10.prod.outlook.com (2603:10b6:610:6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Thu, 4 Feb
 2021 14:48:16 +0000
Received: from CH2PR10MB3912.namprd10.prod.outlook.com
 ([fe80::551e:116:b791:2ef0]) by CH2PR10MB3912.namprd10.prod.outlook.com
 ([fe80::551e:116:b791:2ef0%7]) with mapi id 15.20.3805.027; Thu, 4 Feb 2021
 14:48:16 +0000
Date: Thu, 4 Feb 2021 06:48:08 -0800
From: elena <elena.ufimtseva@oracle.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v21 00/20] Initial support for multi-process Qemu
Message-ID: <20210204144808.GA1897@heatpipe>
References: <cover.1611938319.git.jag.raman@oracle.com>
 <20210203161150.GA241524@stefanha-x1.localdomain>
 <20210203200205.GA29182@flaka> <20210204095145.GC549438@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210204095145.GC549438@redhat.com>
X-Originating-IP: [47.216.143.105]
X-ClientProxiedBy: BYAPR06CA0003.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::16) To CH2PR10MB3912.namprd10.prod.outlook.com
 (2603:10b6:610:a::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from heatpipe (47.216.143.105) by
 BYAPR06CA0003.namprd06.prod.outlook.com (2603:10b6:a03:d4::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Thu, 4 Feb 2021 14:48:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d92fe730-d50a-4565-7827-08d8c91be77a
X-MS-TrafficTypeDiagnostic: CH2PR10MB3960:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR10MB39601C4E83D83CF022F205618CB39@CH2PR10MB3960.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GBV9Qlj+eWgHGU1mMWRXXeTRk2+Atm8MfW72g3joxc9LBsE2FkR9QyaU2PpAhuy/Jd4s8mJTk8EamBWlmN9OsfMaannC96ZGuCILdEF4mLhcobQbwTo56M17S1/uWo9zjnTwTvtadDyPqNCcNY+5GK2d3soWEsWRkibDoIG4zmUrZkjNztgTfRohsJQ1sxfW+2QsxCoNtN8Z2nDqc0xXqiDphn6tb91c7ukIleh8bX0uIaT20QB2hDRpK+7zv+Dtyx/ydH6FXcEy0c2mdZEmyjeBVyfyr0hcni9jA4GGIAzytZrFBy1eoAc5z+LGL0pVvIdIv/Cb/ShozfSyfxwyKTmJHwhPfBWdia7WjIhYaYJMelVuMbHuYsR+2IjFkfiM4Zspzmin6KkKA/sXDmz70c9im/jFC55lRTANCmYeiAoK4vGFGU53E4eGN54kOTlifMnElWH+VniBO9akiF9uO/r8FygsHyZ2I1tOIG22lq4Es69URRb6rlcbbc2LeMsrdccsD22A9V+D/J7lMAo7DlMhEgoKf5Zk75BaqikXCxAbVdzTYXFXlFyupGNdcV6aWoipxWELygxl2z8d2oLHR9Y88NPtisCwksPUw+Ffz3g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB3912.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(136003)(366004)(346002)(39860400002)(186003)(6916009)(8936002)(6666004)(9576002)(1076003)(9686003)(966005)(86362001)(7416002)(55016002)(66946007)(66476007)(54906003)(316002)(6496006)(4326008)(52116002)(33716001)(2906002)(8676002)(5660300002)(16526019)(478600001)(26005)(66556008)(33656002)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YUpZZWFBT3VzclNuZWhHbHpWbHVtT1o4bjF5elE2V29RVC9WelFJelFPRG9s?=
 =?utf-8?B?TkliYTVyVWNXVjJkK3Mxd0kxVU9MR1BUVFdLN3NoN1JnQndKMGhFNnAvYXoz?=
 =?utf-8?B?cnExRVdNZ3VmaC9vVnZoaE9UNEdzR3FYUGdYRXM1NVU4N2dvM0lqbW5zSVhH?=
 =?utf-8?B?MngyOVFtdy9CdlR5R3VCcjBYZ284MUxLUnB4NkVuQ0FqRGh0bVFOd2IvVjNk?=
 =?utf-8?B?UzREeDREYWc0Y3NxWnUwcHhsNFBMM1J1WWgxeTY3V0ZiVW5uaWkzbExVR2Y0?=
 =?utf-8?B?Q3lEVk9XWS9jU2Q2Y0JGMDFmdEU2blFnbVZkNDhHN1Y0NjdiRFpwbFJRNXdv?=
 =?utf-8?B?a05zUHM4RmE2VFJRb3lnOEdpRDc2dGgxSE10V1dpdUVNdUtUY082ZGpZUXRN?=
 =?utf-8?B?bEJST3VSTU5rK2E5cCtRZlo3SE5FSzU3QjhUS0pMWlRKUSsvU3NUMVM1bm9H?=
 =?utf-8?B?OGlCNGNZNGZPUmNyMjk0WU96UU0veTNSVVJCdHErYUlWYnNZTGdqN2IwWUxD?=
 =?utf-8?B?Zk5nU1pCWlpab1QrK3FqTnllRXNvRysrR25JcXhsWStCMzJ1alAvZUJJS05P?=
 =?utf-8?B?Rnh1ZTF2emtFTEFLV0Uvdk5BQzdqTXRpU2dMbE5SY21mRnRabXk1LzUrUnVl?=
 =?utf-8?B?TlozcTIzT1FaY3kyZDNXNjlrSnNWY2ZxaVZ4ZDZ3OUppc0hORXV5M1Zjc2lx?=
 =?utf-8?B?aURuaVYvanRGUnY4a1Blakh6azdPWmVMRUYzcDhHeEpKZ3NCRkY3QzJFbEdR?=
 =?utf-8?B?emxQeHJCN1ZVNStxejIzYXZOaisyQytIQXQ1c1gvcEMyQS92RGpsM1NvRld2?=
 =?utf-8?B?eVZVRWErZUZ0WWpZdFh1TFJJdnlMVHpuL0t5ZEhKdTh1M2xDMk5JSjZoQUdq?=
 =?utf-8?B?akVoTzBYMHhLemRINmhkbkNxbVdzc1pnV1FiMWxaVnZGWGRoV1JLRWh6NUtr?=
 =?utf-8?B?ZS82bGRhYlJKTS9FcmUzenRPbGJiMmxOV0crS2Rtb3ljWXN6VlJaQnNXY3h1?=
 =?utf-8?B?T3Q3ZmxnM3ZFWnZkRFIwdXlHYUR0dEFEbThLeG5nUWM1RmtaanFnNGpGRVJr?=
 =?utf-8?B?T1NLaEhNTFZLb0ZweHFYVWVablJNWlc0aXppU2VkanRJV0VWWTFVRVltaFJk?=
 =?utf-8?B?L0g2OHZKblhwS2lLRTdUZ0NMYS9ZNmkwdXRKcU80M0hzMVBnVzR5T3F6UzBD?=
 =?utf-8?B?TXlMZUNIZ2dkaVdrS29CY2E3Y2g5anJ1QVNVTHNaMEhJeTNDamtYVmwrR2pW?=
 =?utf-8?B?L0kwUEFkd1NnVENORmhqZWNyc0NCQ3cybG1YcTBSYXIzbXBNQkZ3UDFCaTN3?=
 =?utf-8?B?VmszY1FJdCtzK2ZZYjJKZWVjaHFtU1dPNHdoWWlnb25KOGlLNWwzYkVZaklK?=
 =?utf-8?B?RkhuYzIwUkRpcFdIRGYrSElxeXQrbFBrZzhPeGNtUHppM1dBK3NxV2t4VS8y?=
 =?utf-8?B?ZHgrNlZWKzVjY1M0aVpSRjY2VWt0SE44UG9MemtkZktvM3NDcXZxN01WOFdV?=
 =?utf-8?B?Unh0VGhMSHVYMEpEYjFVU0lxcTc5UmVSRkF6YXpTUmdFbVU4bkM0VWVEZm54?=
 =?utf-8?B?L3MwaFdqTDBqSmhRbDUyQ3lCdWFTVTBOL3VvVjV5ZFBuckFLWGt3NEx1b2dv?=
 =?utf-8?B?eG03cUIzajlxS21USkw5bFNlWVA5NVd6bHFQM2FOUG5MeHF3Tkt6TmlGZTJH?=
 =?utf-8?B?MTBwWmtsVDVDRFRGY3VjVFN3V21tOVFzaFZTQkxHVTlSeExWVlFtZmVDUVlO?=
 =?utf-8?Q?9l6dfz9NJgtV8hTJRCrrg1OukpMQoUhIPzapf9w?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d92fe730-d50a-4565-7827-08d8c91be77a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB3912.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 14:48:16.1985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GYdbPK4vR2wYXiJc8QiO5oC3xqTWPhN5GdLYixLJxh2JldNtnNCL/0aY8cJB88YCJU945iDliHCScw6anr0ZlL3AjMNje3+J8K84ZnaQr+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB3960
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9884
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 phishscore=0
 suspectscore=0 mlxlogscore=987 bulkscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102040095
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9884
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 impostorscore=0
 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102040096
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=elena.ufimtseva@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, john.g.johnson@oracle.com, swapnil.ingle@nutanix.com,
 mst@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 Jagannathan Raman <jag.raman@oracle.com>, quintela@redhat.com,
 armbru@redhat.com, kanth.ghatraju@oracle.com, felipe@nutanix.com,
 thuth@redhat.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 dgilbert@redhat.com, alex.williamson@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, thanos.makatos@nutanix.com,
 kwolf@redhat.com, mreitz@redhat.com, ross.lagerwall@citrix.com,
 marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 09:51:45AM +0000, Daniel P. Berrangé wrote:
> On Wed, Feb 03, 2021 at 12:02:05PM -0800, Elena Ufimtseva wrote:
> > On Wed, Feb 03, 2021 at 04:11:50PM +0000, Stefan Hajnoczi wrote:
> > > On Fri, Jan 29, 2021 at 11:46:01AM -0500, Jagannathan Raman wrote:
> > > > This is the v21 of the patchset. This version has the following changes:
> > > 
> > > The docs/multi-process.rst file caused Sphinx to fail with "document
> > > isn't included in any toctree". I moved it into the system emulator
> > > documentation to resolve this. The new path is
> > > docs/system/multi-process.rst.
> > >
> > 
> > Hi Stefan
> > 
> > Ah, we did not --enable-docs and .travis.yml also disables them.
> > Will include into the tests we do for submission.
> 
> FWIW if you're relying on travis for testing before submission that's
> something you'll want to change real soon. Travis has discontinued its
> free service and turned it into a one time free trial. So all QEMU
> primary CI is moving to GitLab CI now and we'll be deleting remaining
> travis CI jobs any day now.  All you need todo is have a fork of the
> main qemu repo on gitlab, and when you push to your forkk the CI
> pipeline will run in GitLab.
>

Daniel, thank you for reminding about Travis and GitLab.

Elena
> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 

