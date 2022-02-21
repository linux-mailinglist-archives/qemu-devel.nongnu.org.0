Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8087C4BD9F6
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 14:39:42 +0100 (CET)
Received: from localhost ([::1]:56322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM8uj-00047H-KT
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 08:39:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nM8AU-00063P-5t
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:51:58 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:43324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nM8AQ-0001Im-U2
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:51:53 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21L9e4CE003636; 
 Mon, 21 Feb 2022 12:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : references : date : in-reply-to : message-id : content-type :
 mime-version; s=corp-2021-07-09;
 bh=OKJd1uMIq0J/URB0n1qL+BYUV7k93Fc6M0cIgK8T72g=;
 b=TOyVQplt5nVsI5YSmQIY3V/OT6jY5PYizPJEyOpMInJQd4BWli8bY1ggC/k95VIz0oLf
 4wR9+J/lUWfZS8bSfVz0q3ieh9xkPS1nKD5uD/G3eK9lkn5NDnF+xGnw94+7LTpxBnim
 zZ0zGJ13ZLzOfEBzyO1gG6vhMwnMzAWw3zIE8I0dRwkcxk//3dMCqCSvGQD7wRGY9lcf
 PeRXlj6MaFlOMByyKpqjH/AaY/4KdtB4LqIft1J2BIkSm3qSK57k1rPWq4FjVsUWzlTx
 Rf4cDdhZ+w9dqfbJUi59HkZtEioemYV4PIhxcye/W1rVtoKhGOOu3QAx6QsZiEiA8qTA Dg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3earebkwkc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Feb 2022 12:51:42 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21LCoRUX187895;
 Mon, 21 Feb 2022 12:51:41 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by aserp3020.oracle.com with ESMTP id 3eb47ynqn7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Feb 2022 12:51:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9XDya09fBCv5sqtoFK9Nwk4t9aBb9Tbt45g/0qE56InBiHtfovS8kKPgn9hh7iiWKBVt5bCzM7bdwkpfQ2mG+rLCXL880M2hUXgjVCF/Mk312CXRzEpCMsRZF6BzGk43qc1976qwRA67tM8O5mdPlkQtcv6MGV3fkgxEfkb8VYrIg1Xvdb7+jAgllWD0SpKfU2Hd/P06SGiu4rJax6EAHaYrELVW1Yva1whydlxPguMqEzJP3zNIe7BAQFAJVupeldRe32aXUZ6tasszx6NuN/EsPQgNBKCneZPywtiJlGMCIqDLlQxlKi40viLCLDOsuFB6/4thKe1KHYIcBWAhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKJd1uMIq0J/URB0n1qL+BYUV7k93Fc6M0cIgK8T72g=;
 b=XOH6tLyBt4vSsZOcMJyXPHVLfe5V0CrEm7TrQTNwpIRgqQ5e6ZD7LjSV42fYWuK1zY5+vwst1K4lGF43Zsaw959uuEgjQfzqBzX7fgdGoPSluRik8xWHaidVKUJ2OBMTtR2CSVYBRQhdmHlkqjj9JFhKUDo0yk9dJqHBYJ5asgooGV64hrS2xrXHhOF2+QWpaS1BZtRt96jYxnYP/I1jOBjcicmGdw218CY2d2NlanDOtlEUSkPO/Q3jxTkWum/c1N8e1fdheULSKoytin7GhY5CK/PRlWoekznaCsXQ9HE8NxJM7YfKPHAkK9ByfBlEXCFyAN9TTXng4ekhl6Kp3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OKJd1uMIq0J/URB0n1qL+BYUV7k93Fc6M0cIgK8T72g=;
 b=AJ5echhW9YX5CnNTZ4i+WFz4ZFaN+CcAkFu3yhsoQ4UTO3K8sH9ZmRiQ6XinU/cwXW0a3wAIUTKGxsTfiXAOkqsj+gaCCZGhxh3RcPeNh4WazR3OjMLMRsees0NHSan7Zwt8vYv/k0O6g/+d32lZi48eqbm/6VXYvtjjUof/qBI=
Received: from DS7PR10MB4926.namprd10.prod.outlook.com (2603:10b6:5:3ac::20)
 by PH0PR10MB4501.namprd10.prod.outlook.com (2603:10b6:510:43::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Mon, 21 Feb
 2022 12:51:39 +0000
Received: from DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::e429:a820:ef6e:98d9]) by DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::e429:a820:ef6e:98d9%6]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 12:51:39 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: Yang Zhong <yang.zhong@intel.com>
Subject: Re: [PATCH v2 1/8] x86: Fix the 64-byte boundary enumeration for
 extended state
References: <20220217060434.52460-1-yang.zhong@intel.com>
 <20220217060434.52460-2-yang.zhong@intel.com>
Date: Mon, 21 Feb 2022 12:51:33 +0000
In-Reply-To: <20220217060434.52460-2-yang.zhong@intel.com> (Yang Zhong's
 message of "Wed, 16 Feb 2022 22:04:27 -0800")
Message-ID: <cuna6ekpelm.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::18) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f916e48d-d597-4c95-d9fd-08d9f538e6d2
X-MS-TrafficTypeDiagnostic: PH0PR10MB4501:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB45012AE2AE0EB24C7FCD3BD6883A9@PH0PR10MB4501.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GbZMArmfHg/BderLiECaHjTzZxrD9h14HLSWDOuI9QB8paH0063yNl/8XEkw8u3MfwomjJS6MSmOCLe4sFhXh5DmuyC93orTAeD9CO8q+yCHsXLp0ZuMBJi6AinuCWZSZ+sxTMj9jYylgimlMrKWZtd9aEn7O2ZQUOpMNJre9tvEtIMAd3nYzIg7eiAnFn4gaJ1ikoE5XENoiNMTFMWitcJxZ6YYbrB0rXsA53jcuWTe1Uo/nCRz1JQvLNoJJi3y+4n03Osc339RfbdJESwy+Kf/AcbsTNBfT5aBjKH7feiuEY4+vH8LGnkAFNmrbbm79RiH8j10b/GL2Yy17pPWZVzUxADFjuLPsrmZfDDijRiHqSkdj+SBzaf5Ayitu5FqdZ4oS9m+YXMsmBEy1lrFrgz/C5vX08O5ukdgwP7QL8cjWT0AWfzWK3Eahsub3BFR4JEzTW0oYLIwqPi9Ucjx/jLTvZybtJ3wPdsPiYeSfspNGxWqsAROLBLuwc9y1UPibT0SS17bI7cm0wY8L05uPQjz/wqMF57PmVUt4SqXxomFYhn30Ce5DyE87+ODzlT8rvbCj71X4JlPLyrXgd/XnQ0SICpGMT+pcL3eRoltrVPJCNzwqvNGayOfaD8fSXaRmRwe1//EOE+5XneEKRLdCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB4926.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(8676002)(66476007)(66946007)(66556008)(6486002)(508600001)(6916009)(316002)(6512007)(8936002)(5660300002)(2616005)(52116002)(44832011)(6666004)(2906002)(86362001)(186003)(6506007)(38100700002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rl/Mutc/nWZpl7QwvEYaciTWcPGl3sZrv1ZnQM06ZrPwPpt0U8iNzEs7RAuj?=
 =?us-ascii?Q?TQxLQZC/F4n6dE/rLdB6iiqZ40Y3APDYIgt5ArN3XwhqocrTZhZY8R5DIJVf?=
 =?us-ascii?Q?y5L4PK6YHF0710senWaSOKa4SRnbHu/sskiXIp1a9e6SV+i1qgaKbjPX013P?=
 =?us-ascii?Q?wasb0Yi6SENkOaOfPfDyBIdKy2Bg/3UrczKx2SdSSvOydpXTVgX6iiG++cZo?=
 =?us-ascii?Q?xzUJoKJw7puvmrMEvWa8aPNVjts0ilYDjPzN8PDT75S2zmdn6nqTGTFnqNk1?=
 =?us-ascii?Q?hXNiewvpbOpkUPDCT2ViharBpsDpM5HMxxjlNtmXyQbhLxSdrdMz/d9nw536?=
 =?us-ascii?Q?QSE0YgsV41j+cUtBPaToynF/GL08IxCNxrolOy77Hr2xitjwRA9jObrGfBvx?=
 =?us-ascii?Q?PRcoEWzl77HdLQkUR8LXcLIG6XdEyL2MGhzIOz9bpANCvJYYxq8vu61TmSVQ?=
 =?us-ascii?Q?H6j2VcBAS5NOC/9b/8GoBXdaI8lmrLygAABCdjzegZmbfwjlv5bysBnM7ziI?=
 =?us-ascii?Q?frBymXvl9rpfT4uGLBJ4eEv8Q30BWM5PlFdpAXglq48EkQIEiuEFfnK0ikD5?=
 =?us-ascii?Q?XY79auNmIwhvA0ccTyryubxMfaxp8t0c1nfwi0Kp/625BRBQQJ+GXt/qQW0V?=
 =?us-ascii?Q?FIxJfP3R8J9MHw1hKleKgkYKBc4GesjfPteQae8ls329gIVZUqxs+A0zcm7B?=
 =?us-ascii?Q?UpoMMVWPFegg4hCobydCZ8D/km2FIdsRA+JdWGkrTwjdyWqYMN6YCvzQ3zYf?=
 =?us-ascii?Q?ihNlVyi5gHBQ5M6FYulQWDDPgVygWpR3CnC7/Lj0i3xbv22s8G3pias16fIb?=
 =?us-ascii?Q?Aqac0ZtSKebNSVsvM2LhRFF5Ck83UyUT10gCQnUWtmSVaiBrKNEEQkjuUK7J?=
 =?us-ascii?Q?erzBP4K8b6NPY9KpdgMEU0TON80a+tc2aE5k48tCJ4U1RsM7C3kR4Ep6AAVg?=
 =?us-ascii?Q?yFB0qj4Hg388eZ8PHoYI0e6qsCQunClPcKvrYwnI+AflFcQc1vBquCAKroWQ?=
 =?us-ascii?Q?Gns5gN/8jDiHOXDKtD0h9h8Qx1mZTPLJrcCKKcSFNcqv/RcntCQcQfYSC9Ix?=
 =?us-ascii?Q?LUF2WL4nmupW2wBPivzb2ycsIwQVMUVhN+VXXBWnldxDuVBQTjFVMbZbeBAH?=
 =?us-ascii?Q?7EtoPkjUAOGScqexBMtHfJwAiFOAyVOmwV0RPAR/oOAWjhLTqs1tnThAKIBf?=
 =?us-ascii?Q?xF5/Qm5c55IiNVdCPE8EkQnFKe4r7gJv97qGTuNMYw1iKJI7LdBn+e8DXieS?=
 =?us-ascii?Q?3qFAfY0oi/V22QJE0oGQejNo/XaDq4LJ005wJzwtSohd77a8MQZ7mkyV3MmZ?=
 =?us-ascii?Q?l809BJ4H2/MZ/klfBElLJLvA3l/ttvEHTF8Rma6xEvhtD9rU4ADmECEBbQOj?=
 =?us-ascii?Q?lu5cDu5M11tbpM8hFZMVgK+o4CKtZhHBhqXxtJU3WS2BVISDoQ3cD9AoaDbq?=
 =?us-ascii?Q?5o5iZJ+TylWjK/s2eesDykVWGQfysmMmXpd8nD5VoHU1SQtskhLIg96/TCvH?=
 =?us-ascii?Q?COcSjrwhvoL25huN39ToO2gjy69+5ZEMjjuPifxARnr8nwK3Oe+6m2HwMU+a?=
 =?us-ascii?Q?UmLGbTU21lL5CZ8wxVbUQjXRlHQUPQzrMr1fvnXGmnr2/rtTAucLfyofkvnw?=
 =?us-ascii?Q?Ehsh+OgGFYp8ajmQhXwoE9XqbA7YAvhKSiU/IAcp7IkWRJatEpochLKFsJSr?=
 =?us-ascii?Q?yPG0vVidlgBqzwjv2/RXHUjQcI8Ojp+v7csFRIz9IWGqAEOK?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f916e48d-d597-4c95-d9fd-08d9f538e6d2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 12:51:39.2311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +13AGDv7tgBg/bZ2VE8Rgtkk329RSwmVNcE1tXzwX4VhoIp8bkyavdTKJw20bQHBs4wa3nAvwGYI5kVAAYrhW5Lq4tlLTmFxKFGrokZx8g4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4501
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10264
 signatures=677614
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202210077
X-Proofpoint-ORIG-GUID: z_L0mWTwIARMuJBNzgGeG32Y3ArrBMLb
X-Proofpoint-GUID: z_L0mWTwIARMuJBNzgGeG32Y3ArrBMLb
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: kevin.tian@intel.com, seanjc@google.com, jing2.liu@linux.intel.com,
 qemu-devel@nongnu.org, wei.w.wang@intel.com, pbonzini@redhat.com,
 guang.zeng@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2022-02-16 at 22:04:27 -08, Yang Zhong wrote:

> From: Jing Liu <jing2.liu@intel.com>
>
> The extended state subleaves (EAX=0Dh, ECX=n, n>1).ECX[1]
> indicate whether the extended state component locates
> on the next 64-byte boundary following the preceding state
> component when the compacted format of an XSAVE area is
> used.
>
> Right now, they are all zero because no supported component
> needed the bit to be set, but the upcoming AMX feature will
> use it.  Fix the subleaves value according to KVM's supported
> cpuid.
>
> Signed-off-by: Jing Liu <jing2.liu@intel.com>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  target/i386/cpu.h         | 6 ++++++
>  target/i386/cpu.c         | 1 +
>  target/i386/kvm/kvm-cpu.c | 1 +
>  3 files changed, 8 insertions(+)
>
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 9911d7c871..de1dc124ab 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -548,6 +548,11 @@ typedef enum X86Seg {
>  #define XSTATE_Hi16_ZMM_MASK            (1ULL << XSTATE_Hi16_ZMM_BIT)
>  #define XSTATE_PKRU_MASK                (1ULL << XSTATE_PKRU_BIT)
>
> +#define ESA_FEATURE_ALIGN64_BIT         1
> +
> +#define ESA_FEATURE_ALIGN64_MASK        (1U << ESA_FEATURE_ALIGN64_BIT)
> +
> +
>  /* CPUID feature words */
>  typedef enum FeatureWord {
>      FEAT_1_EDX,         /* CPUID[1].EDX */
> @@ -1354,6 +1359,7 @@ QEMU_BUILD_BUG_ON(sizeof(XSavePKRU) != 0x8);
>  typedef struct ExtSaveArea {
>      uint32_t feature, bits;
>      uint32_t offset, size;
> +    uint32_t ecx;
>  } ExtSaveArea;
>
>  #define XSAVE_STATE_AREA_COUNT (XSTATE_PKRU_BIT + 1)
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index aa9e636800..37f06b0b1a 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5487,6 +5487,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>                  const ExtSaveArea *esa = &x86_ext_save_areas[count];
>                  *eax = esa->size;
>                  *ebx = esa->offset;
> +                *ecx = esa->ecx & ESA_FEATURE_ALIGN64_MASK;
>              }
>          }
>          break;
> diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
> index d95028018e..ce27d3b1df 100644
> --- a/target/i386/kvm/kvm-cpu.c
> +++ b/target/i386/kvm/kvm-cpu.c
> @@ -104,6 +104,7 @@ static void kvm_cpu_xsave_init(void)
>              if (sz != 0) {
>                  assert(esa->size == sz);
>                  esa->offset = kvm_arch_get_supported_cpuid(s, 0xd, i, R_EBX);
> +                esa->ecx = kvm_arch_get_supported_cpuid(s, 0xd, i, R_ECX);
>              }
>          }
>      }

dme.
-- 
We're deep in discussion, the party's on mute.

