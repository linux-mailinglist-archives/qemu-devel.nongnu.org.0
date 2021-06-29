Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D8B3B705F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 12:05:19 +0200 (CEST)
Received: from localhost ([::1]:36336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyAcH-00049s-Rg
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 06:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1lyAbA-0003Om-Ti
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 06:04:08 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:52610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1lyAb8-0001lM-Ai
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 06:04:08 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15TA1Wld014533; Tue, 29 Jun 2021 10:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2020-01-29;
 bh=ixxg2PTWlIusvsKoJf23vSfP8bLP1N7ajKDb4Q7Z5d8=;
 b=owzRBK2UZabUl0THFQP28HHVjfBgxm5CINLrUrb4GVJGUF8NEIiSafveB2aT6f1ZFTxP
 ZJz/27cO2DOwqZM25z8iV8lEljD2nDjOaQp0OHRfBNuTQjgNvtKV3OoAOY+NymHHfUEk
 KU+vPVdKQTmhVZcp62maNp1V3D0KuqAhjHlyW2XY2aZZd76XoeqWued6nzo9xuKwPyM8
 LcdWrRFs9VknkMvX6muivr5BY5gXfOn2AnkD1spb8Yzh4Z0PT6KUfZBmNxS/MlK4wd2L
 FEHdec+h46ozpQQr8aUUl7/FDIsvS1mBMdeakTapATg8xQmKDl8ourWHzIKtUBk/A0Bh zg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39f1hckh3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Jun 2021 10:03:54 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15TA29Rs159369;
 Tue, 29 Jun 2021 10:03:53 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2047.outbound.protection.outlook.com [104.47.73.47])
 by userp3020.oracle.com with ESMTP id 39ee0ue67m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Jun 2021 10:03:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmEs1Tpl7i9JtdDmH+LK2tFDki6FiYTcjfvWkvtYK9AYGkGsOumlZEJaeRdK2GuQqRl0GVm0essgtAsrqx4fkT6SxhpDbBkKUUvKCFQO/WF/I0qIdrhFbnXQUCwfdglG0/TLqt8wk4croySa+fRaeS5kC9jEs6Ee7VSvElG1t8EPovkFALih1PEEyRLu6JuNt+kUOOtfTZVG/OMS91gluQapL/3t/lE6/FaaFoEAKF8RP/gv9Nj+Q0peLKteUTs13dW3yyzZXFWYowx7ovEr2bgw1nULARkcqOhkVibpqB1fplQmHoRl40Fx/x7D9IV7pQmzx1aLcfyHprHfcZ2W/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixxg2PTWlIusvsKoJf23vSfP8bLP1N7ajKDb4Q7Z5d8=;
 b=SKy0dGCWbcyVbk1uQeiRdRRdd1NCWUFs5t1jJDeUDDCgFEDLOT6OnwDV5ma8xIoT+Ngjz1/WSAo9q3VmCNmyxIP9UQx/PGTENUQ2kBiDyswXX2PAnW7hqkjKhuPe9fL7mOGvf7qfCFQ/g15SArWOzO3aDNYS81/uNAVcH/tGKhA+hJGRW/h/i045w9dU1Qx+KCQrdO1U6WDfSkGBFZlaWIYfT5lm8HwkhheNg/DgxCyO4MhgLy0Gv224tFCXSywEIOCZs/2xKOLn7gko2m6Gu5kHNN0hrr1s/kLcFTMNaSSSOgFdyZ9N04VhRuRaWUENxyerIEzL6yxEqOLJexoumg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixxg2PTWlIusvsKoJf23vSfP8bLP1N7ajKDb4Q7Z5d8=;
 b=IMmZd11IbSG4s4kxAV8e2mwb2+9jWmwRzg6Q93BKxAsrnTRtIeZ571lBmcBeq4nU3S3kdRrqIbirR2eNe6dib75jVp4eLSy05/aSavuHvbgYrRefK3h8cq5h+NgBYlo9aIWn6QuvjvNm0XiwR7CA2EBOwYKeYi52eIJLxUqh02s=
Authentication-Results: bu.edu; dkim=none (message not signed)
 header.d=none;bu.edu; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by BLAPR10MB4995.namprd10.prod.outlook.com (2603:10b6:208:333::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Tue, 29 Jun
 2021 10:03:50 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::1539:60e1:df69:3676]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::1539:60e1:df69:3676%9]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 10:03:50 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 3/3] fuzz: make object-name matching case-insensitive
In-Reply-To: <20210628052349.113262-4-alxndr@bu.edu>
References: <20210628052349.113262-1-alxndr@bu.edu>
 <20210628052349.113262-4-alxndr@bu.edu>
Date: Tue, 29 Jun 2021 11:03:45 +0100
Message-ID: <m24kdhrnr2.fsf@oracle.com>
Content-Type: text/plain
X-Originating-IP: [79.97.215.145]
X-ClientProxiedBy: AM0PR10CA0009.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::19) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from oracle.com (79.97.215.145) by
 AM0PR10CA0009.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend
 Transport; Tue, 29 Jun 2021 10:03:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50ba819e-208f-4ff2-8596-08d93ae5318b
X-MS-TrafficTypeDiagnostic: BLAPR10MB4995:
X-Microsoft-Antispam-PRVS: <BLAPR10MB49959EBF4597A0D788A6FD00F4029@BLAPR10MB4995.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:605;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uF+1FWF6IBp1Ll5wjbkzBYbv6Tb1rsH90OnnnRAxxoer8XOWirQF2RfU2R3oF/N4117rQdRGhx4tdIX6Y/DeoqOaXBxRBbY3rze9YajN76jbgNpXFuvR742VQmwlnCwnYmuFTr/dm/bS7e+5GQ1ttCc6QXXJS+DZfQIFR43kXeOa1c+xhJTykgau56zKJONHq2jHsHfgdIVarRuEk+ljZ6ZMTQyh/nB6gDHU4Ka5rgczxHeR8mteVLBFiqroXvlKAzKok/vOhc2JS3aeFA/PZ0WQBSmh3OqpiJma5BShGUOtIyGBqaBnsWhcSZWvPZUlbvrgodDq24FnE8Cv9pMMwT69/Sjw2nqgsMprZAhLIbciSfjGgMSg2kC4AE4IZGNLt0yPPeudF1wJEH2kD+HYcTmLeN5HpOmDdgJWkd8Cn9sc8CSjHQTLWAVsrI25Gr2k2Cxc1vHy/wf7txSIjR6MRQiCOTwzldQpIyVbveHIEl7GajQUoi0aul/0zMg6KW1coze42HnK2e2RHTq6CVrNXilrYKveDbGrzliHY7Ah5PbhpWRasEevE1GqYKpNUGsptZHCyMN/pdyIznp/c24CWs4naz0c3S2U3KpwC4fwBAshB1RV5YfzZSt0nRsfi06ceZEOCjt7R0okyVwhJgzH0ViCjHzkTyQTc/iWdX/DSkO/iXyP+XE0XoVU6w26gmHv84kR01F4xFowMo9rOlhSxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(396003)(366004)(39860400002)(346002)(5660300002)(86362001)(186003)(16526019)(2906002)(83380400001)(55016002)(66556008)(8936002)(54906003)(36756003)(316002)(44832011)(956004)(478600001)(8676002)(6666004)(52116002)(7696005)(8886007)(38350700002)(26005)(2616005)(66476007)(4326008)(66946007)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hzU4TMx+aUij+6bfOsT3ojrVMod0ZS4NkKmKTn9R2xyNtd0vAqnWIVKgNiJu?=
 =?us-ascii?Q?iri7ZBTRiHXGxlRrJPm3KEQfQuk1gJ7yydF3FHN/O+lufYFu2ET1S1Dc8y14?=
 =?us-ascii?Q?dM9urIJ1ewZtulOBrBGXwLrDx+6QXqwYICnNHEIosHGWzliOfNIWDRhLNjq7?=
 =?us-ascii?Q?AuyV0TXqbDgHC01Wr71/1QYVpQficjMQs9eEYYf2W7T7zu/6Cmp0v23DCnAZ?=
 =?us-ascii?Q?fnnVvSE+sgTSeCA/G3KSNfRqDKfIIZyZEcxk0Pkf/fr6X24C/OIu/EWO8iAG?=
 =?us-ascii?Q?FcSd6jhswPl9UeTjxNt8EHKbu43z6S+LmgVTHSE2D1hBKTtVYofcjaNYhkwt?=
 =?us-ascii?Q?DUQ8jZf2tN0RG7anZZ43k/V4S+KXfM6zRYnDsAGzbf04RFqdLf0TidrrQ7TD?=
 =?us-ascii?Q?9p6T7pOmtxxLqcNFVc4ir+2qnOlaRpiSXhKeJafrqSjSDiV+3weviB3InJRT?=
 =?us-ascii?Q?sgOwqh/CBodqJE0pHciebRiLW5lURr1WrtaxrpMk67/xjRWU7/AvuHcCrT2x?=
 =?us-ascii?Q?I02MojM9J/U71fu4pYi3ERfX9EszA5w3X6r+rLyU6EzXuz84Wl8ldO1/sIPw?=
 =?us-ascii?Q?yPMBP6e6Czp9BkoRH8U8qwzBqslytzBCy0aJ+sFQeBzac02usnCPS1Yw3LWb?=
 =?us-ascii?Q?ZYHAcBrvS2n9c+alA+4hCO68uB+cIVad+eC3Fd2rtet9BUyoeUsJX6CxyWUy?=
 =?us-ascii?Q?/e3QNbWDMSUHKjuiBh/2qCYZ7XCZRMYc+2YsgGYVVMSNswEU3UsXbJC3TJdm?=
 =?us-ascii?Q?TD4qHPM58+KJJMbAv5nHCaLFXPJvjXZqxCtXwc3wYdIKNphJ7C3jTQv1u29O?=
 =?us-ascii?Q?SXDVqxr6apdoOKXT7d3750FS9P7FBQtIrTxz1BO55ch1bB5twnQOhFiVcYU+?=
 =?us-ascii?Q?+S3ngPweeLu72cugiF1/Q5njGe+63q1am3HnDZ2RmYHJGEDAXTcy9eNcQ1HW?=
 =?us-ascii?Q?+WTouZd5t8H7z2O73SjgneSnWqMZi4EiZ8YQvE2k3OvVom7uJlmPpGdiXjay?=
 =?us-ascii?Q?swvMh75rVRopKbcbhI2ULgzub7HUl6O0a5acqjZW56Y/tziMk4xEgedUxIb9?=
 =?us-ascii?Q?HxmGbcODqftOLxOM9ayJeTaj55sVCRH7Di1rEXbcjiikegHhJg05pnSBpbzC?=
 =?us-ascii?Q?EJQAcYCouFGnenPGrgqJLhEaQnHt5CBzT2LQq+kqhq0NIUaEP0qXNyK8JV/G?=
 =?us-ascii?Q?FaEelhBCN6xHHjirEY2OdvSxwdrZmwKkv+hhOY3eXrwLfXsREhfhjLekvfqH?=
 =?us-ascii?Q?4afCGFGjhLzc/e+loJpiQiZgVD9AIh9AxRNFjq14jVr0n8+akciw90lgrREn?=
 =?us-ascii?Q?r9CQCXY8bWUw/s4UvjEcAHXE?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ba819e-208f-4ff2-8596-08d93ae5318b
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 10:03:50.4288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7a5Ku4i1bGzaMqjMf+e9VVUFd1+f46oQxCwcjcQ4uGVDEKv6XjHXfJXidMSV+B+EXCQIbC7Csco9k1wZpFaAxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4995
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10029
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 spamscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106290069
X-Proofpoint-ORIG-GUID: 7PkrGVpvHKq02JkE4S2-Jp5Uy8fdHtGD
X-Proofpoint-GUID: 7PkrGVpvHKq02JkE4S2-Jp5Uy8fdHtGD
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On Monday, 2021-06-28 at 01:23:49 -04, Alexander Bulekov wrote:
> We have some configs for devices such as the AC97 and ES1370 that were
> not matching memory-regions correctly, because the configs provided
> lowercase names. To resolve these problems and prevent them from
> occurring again in the future, convert both the pattern and names to
> lower-case, prior to checking for a match.
>
> Suggested-by: Darren Kenny <darren.kenny@oracle.com>

Thanks for doing this, LGTM.

> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren.

> ---
>  tests/qtest/fuzz/generic_fuzz.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index 71d36e8f6f..0695a349b2 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -751,8 +751,13 @@ static int locate_fuzz_memory_regions(Object *child, void *opaque)
>  
>  static int locate_fuzz_objects(Object *child, void *opaque)
>  {
> +    GString *type_name;
> +    GString *path_name;
>      char *pattern = opaque;
> -    if (g_pattern_match_simple(pattern, object_get_typename(child))) {
> +
> +    type_name = g_string_new(object_get_typename(child));
> +    g_string_ascii_down(type_name);
> +    if (g_pattern_match_simple(pattern, type_name->str)) {
>          /* Find and save ptrs to any child MemoryRegions */
>          object_child_foreach_recursive(child, locate_fuzz_memory_regions, NULL);
>  
> @@ -769,8 +774,9 @@ static int locate_fuzz_objects(Object *child, void *opaque)
>              g_ptr_array_add(fuzzable_pci_devices, PCI_DEVICE(child));
>          }
>      } else if (object_dynamic_cast(OBJECT(child), TYPE_MEMORY_REGION)) {
> -        if (g_pattern_match_simple(pattern,
> -            object_get_canonical_path_component(child))) {
> +        path_name = g_string_new(object_get_canonical_path_component(child));
> +        g_string_ascii_down(path_name);
> +        if (g_pattern_match_simple(pattern, path_name->str)) {
>              MemoryRegion *mr;
>              mr = MEMORY_REGION(child);
>              if ((memory_region_is_ram(mr) ||
> @@ -779,7 +785,9 @@ static int locate_fuzz_objects(Object *child, void *opaque)
>                  g_hash_table_insert(fuzzable_memoryregions, mr, (gpointer)true);
>              }
>          }
> +        g_string_free(path_name, true);
>      }
> +    g_string_free(type_name, true);
>      return 0;
>  }
>  
> @@ -807,6 +815,7 @@ static void generic_pre_fuzz(QTestState *s)
>      MemoryRegion *mr;
>      QPCIBus *pcibus;
>      char **result;
> +    GString *pattern;
>  
>      if (!getenv("QEMU_FUZZ_OBJECTS")) {
>          usage();
> @@ -836,10 +845,17 @@ static void generic_pre_fuzz(QTestState *s)
>  
>      result = g_strsplit(getenv("QEMU_FUZZ_OBJECTS"), " ", -1);
>      for (int i = 0; result[i] != NULL; i++) {
> +        pattern = g_string_new(result[i]);
> +        /*
> +         * Make the pattern lowercase. We do the same for all the MemoryRegion
> +         * and Type names so the configs are case-insensitive.
> +         */
> +        g_string_ascii_down(pattern);
>          printf("Matching objects by name %s\n", result[i]);
>          object_child_foreach_recursive(qdev_get_machine(),
>                                      locate_fuzz_objects,
> -                                    result[i]);
> +                                    pattern->str);
> +        g_string_free(pattern, true);
>      }
>      g_strfreev(result);
>      printf("This process will try to fuzz the following MemoryRegions:\n");
> -- 
> 2.28.0

