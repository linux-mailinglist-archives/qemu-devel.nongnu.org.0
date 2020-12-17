Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2542DD675
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 18:43:24 +0100 (CET)
Received: from localhost ([::1]:47502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpxJD-0008FP-HY
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 12:43:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steplong@quicinc.com>)
 id 1kpxHC-0006oe-8u
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 12:41:18 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:8379)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <steplong@quicinc.com>)
 id 1kpxH9-0001qk-SZ
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 12:41:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1608226875; x=1639762875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=uSIzAiVCcznhegL++70KmccLyv013QNG1hu4n2rGbG8=;
 b=WqwAzmZb8NqlxzkjjgG218qR/Nua90zVk6GAWwGQPIIF6OlJhHAMRGq6
 DLIbVtIiJ+ADgnXivuq3UwEiDkDh09QNqkL1W6J3S6q8qMQpm9CLUuoeZ
 D8VanJt02YSPTc/0fuzciGVQpIib4osaNobQ22NMe4OrV05mTNJgH5bf7 w=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 17 Dec 2020 09:41:12 -0800
X-QCInternal: smtphost
Received: from nasanexm03a.na.qualcomm.com ([10.85.0.103])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 17 Dec 2020 09:41:12 -0800
Received: from nasanexm03g.na.qualcomm.com (10.85.0.49) by
 nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Dec 2020 09:41:11 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03g.na.qualcomm.com (10.85.0.49) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Thu, 17 Dec 2020 09:41:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCGJ60P9bzTBRWJpwDwWjPKhOix+ldCxfXwqfuwk6CUtR4qBuyXGPhqR/w+BZ/USOnYfWNqpwmaAraFspkm1+F07GFxRBRTkKqLf78ZRgGlvjtVmi4ZuBrLQneyISioCVbhlQHE3jDOqKwuPsryuSoAks/Q5Zl9iApJg6HcClPrhBvgUfnZRwsxw3u5Ik8jA4arWwnQWIBq0ZXcKsbtMKJYKmlj++ypV9I6MHHheKZLCDJn/FsJMWSGyWPFsriRVEcp/GvugNQOiYmHB3gNH77QtmPFHby2mCGpPEnjUxEabOC/aKxWjIwAmlDX+1BiJlh3VKhQyyvi1R23Y0hDesA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSIzAiVCcznhegL++70KmccLyv013QNG1hu4n2rGbG8=;
 b=f2Recxe7vrId/W6eEx5wXRHK+ZFOaWhDi2nxOWbBddtFVDeQqwS4WeengnIj1ofYXIgdQb5OKEQZvKHq9pEn6Ui3XD30/JxNfcyOOjaxBgMCAduPvjkymRp2iWObOsd/KtNMiJK1qkY3ccQVI34TgO/lZT1Zxj+/1uo1wKtuTlr4Bsx//OBtMAuf44iIZOH0hlvPAGTd9TmX6RZt+1oiLGL88eIPOVgeR4fzt+nQJsLQ9ZwEgXYcIXz0I2p98Fd0mNal3ztyfF0pyid5/rWI/kcqcoTYT3/VF06skp2VsNyYK72AA+9kHioM11ZiIRgWI8YvspouFlT2oHB8EJS5dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSIzAiVCcznhegL++70KmccLyv013QNG1hu4n2rGbG8=;
 b=o+ZImMg7ZedrTQIO+CK/wT1B5g4s+FakOsG6KXqFPPmpZR94CFNuveNhqZ19baRkYy1/GbFr7JhfwL2haKT+l/dpmVJb60KuqWiC6CVhmNxt5+FlUhXX4fiqGIrLEaAoSpvMTlgJIwqjGW1dBLtHXDg0byE9suXj9cyZT2uIZN8=
Authentication-Results: vivier.eu; dkim=none (message not signed)
 header.d=none;vivier.eu; dmarc=none action=none header.from=quicinc.com;
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24) by MW2PR02MB3753.namprd02.prod.outlook.com
 (2603:10b6:907:f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Thu, 17 Dec
 2020 17:41:10 +0000
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::c07b:6b00:b5f0:a5d6]) by MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::c07b:6b00:b5f0:a5d6%7]) with mapi id 15.20.3654.024; Thu, 17 Dec 2020
 17:41:09 +0000
From: Stephen Long <steplong@quicinc.com>
To: <laurent@vivier.eu>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH] linux-user: Fix loading of BSS segments
Date: Thu, 17 Dec 2020 09:40:55 -0800
Message-ID: <20201217174055.544-1-steplong@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <c9106487-dc4d-120a-bd48-665b3c617287@gmail.com>
References: <c9106487-dc4d-120a-bd48-665b3c617287@gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [24.24.203.211]
X-ClientProxiedBy: BYAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::36) To MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from STEPLONG.qualcomm.com (24.24.203.211) by
 BYAPR05CA0023.namprd05.prod.outlook.com (2603:10b6:a03:c0::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.9 via Frontend Transport; Thu, 17 Dec 2020 17:41:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 215e89ec-085e-449b-c35f-08d8a2b2f0bf
X-MS-TrafficTypeDiagnostic: MW2PR02MB3753:
X-Microsoft-Antispam-PRVS: <MW2PR02MB375322BF7BC8772BF7E05FD6C7C40@MW2PR02MB3753.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:324;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BMGMT9tfSAK14/14FFSjBfGVPB1kykUsQ3cWdAkZQN1hQoFD1CjtXjW/HRCQuchBmpHf+gOvQC2vESSd60vuXvKVJKMeb3tLXKLKItKwXu2F7ZK9EY5WMxpUdYmOahbNP7eHUBDI+sAi6pWFGc4o3LtHsyNFmk4A23DOt0RxJ9KNsl+0KCVC+EZfB2ZVFG5KLKJFkgloPpEkoT5Gd43vwZ3ZJglKIatjHazCeCmIy3DOkwb2U3QUwYXpkmGkY57grU12UEPLGlfcaVp2vhQ4iAnUPWDj4RJA6KlUYrhxAnjtWpDOx9TPZ8rxxkq4dNZaeRtiwDTJtG9U4zPLKKGLBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0201MB3547.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(66946007)(6506007)(16526019)(4744005)(8676002)(66556008)(186003)(86362001)(316002)(66476007)(8936002)(5660300002)(2616005)(2906002)(1076003)(52116002)(6666004)(4326008)(6512007)(956004)(478600001)(26005)(36756003)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?RFMZ4pHcIqJHxxxUFv4MKdCZ+tJjanJmgQOXExeAjj0KYpvstM6Ayc0GFAyT?=
 =?us-ascii?Q?8WvVcvQ+HBgV1AP/4XxhMuVTjGTFTQM926ldkw6cq5npfXKZlXAFvfKsEDqa?=
 =?us-ascii?Q?86FAAbYEk2zZp0yuTavEcq9xp2ig2JSBrSeLlQy47wFEmMO5EHFuQ3h1AE70?=
 =?us-ascii?Q?ul3SWodBuZ/t34HXQhAqSqYK3+0NzR9X5EELug64DdXBW2/UuACpVk1d/p+l?=
 =?us-ascii?Q?bSILmUn5IjwbEEKFlOF7pyM47aszQHGxdNB/l5pgjYCTS4LlJGntephH8Z25?=
 =?us-ascii?Q?ppLn32eoZffOy4YSNfU7KmcKgX/YD1zGrQflX6n5WJtARyErn+D+R653iAez?=
 =?us-ascii?Q?4dwTwYJ8KG65gG2sE1bLQWvv5wpGbpbEFPNSPW9p2dBOotGtcJS1A9rWGDKh?=
 =?us-ascii?Q?BeL+ekgrF9plBymb3Gby3gSXJdm4GwawGTxe/gDKqriNMuzZ7mtYnTIi8IJX?=
 =?us-ascii?Q?7hu2ISsEQT3KtZzt3H4480gXoQ8En9+qha5gd896szqpwz3HIJXq6RhiyjnZ?=
 =?us-ascii?Q?pCkQpC4mPGp38AmCywxBvZv8IPfPDIxtBQy6359sZqP7nCjnsww85jqXuH/Y?=
 =?us-ascii?Q?Z/Y3Nd69FJl7WwbXnRMYJny2BFlBaWD+c8XiVVs5DC30tgTIl9tqTdHFg4je?=
 =?us-ascii?Q?I4ER+RthuH0fs46G9KM+xr7lv/MtkDlW9cX+9/8UShwUMamAq4B6fafDXsLp?=
 =?us-ascii?Q?tNl/vXvrJn9JHd74hQ6Z9Z0yHM8/jnq6GH3czapoeYeHjR1FqPzKrzyS7b0h?=
 =?us-ascii?Q?18IPvrc7IqdJsL45T3taZLc6eLCER8vQ22OurnWHP+U5neByXn/KxeEez+t8?=
 =?us-ascii?Q?ziANyu9v0np7pbv92s8GJvIDnGArvNTqAWZA+Wzf9Ax8KkhUEAo7o0ZnK4aN?=
 =?us-ascii?Q?toT8eQu8YHIffiQ53bX5ZodRmupuZIWl8YN608q6lMOTxigRrPY3UVPkRihM?=
 =?us-ascii?Q?lYk1oue8hyRc0xf7ORfN4OMvJSjw0BJevehGSnjbzujekdCQJ4AzJikexOmh?=
 =?us-ascii?Q?dTbX?=
X-MS-Exchange-CrossTenant-AuthSource: MWHPR0201MB3547.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 17:41:09.9423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-Network-Message-Id: 215e89ec-085e-449b-c35f-08d8a2b2f0bf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qVAyUBMRanASCV8gzKhjCy1ze+FDaA/fxGnIXCxNJQuuOD2hKr5yBILu/1mcEkJT3ZkcZUSnyjlJiSZRdl/xEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3753
X-OriginatorOrg: quicinc.com
Received-SPF: pass client-ip=199.106.114.39; envelope-from=steplong@quicinc.com;
 helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: thatlemon@gmail.com, philippe.mathieu.daude@gmail.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org, ben@decadent.org.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier wrote:
> Is this also fixing what "linux-user/elfload: Fix handling of pure BSS segments" [1] patch fixes?

I can do a v2 of my patch with a better commit description and addressing Peter's
questions, but feel free to take this patch instead. It has a much
clearer commit msg and seems to be more correct to me.

