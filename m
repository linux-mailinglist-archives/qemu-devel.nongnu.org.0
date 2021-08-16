Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 808CB3EDB2E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 18:45:29 +0200 (CEST)
Received: from localhost ([::1]:56752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFfjs-0004Le-FZ
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 12:45:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfha-0000e9-6A
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:06 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:33086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhX-0007uY-9M
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:05 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GGZhsd008102; Mon, 16 Aug 2021 16:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=bHVoFr/SonDv8WbdTf1Kb6rfL+P7v0JCZowJuVtb15A=;
 b=gtiAxBX69Qnv4giWZxCS6aaWmiLr7T6vYivggc8IZtCfIKxwiQDcdDU+EWeGkQRiWX7Z
 gg8BIwIJZSbSKxjnBPrjneA1xI0poO9FnDatfwGDYo11kZKZaV1P8/klDwzXbZtsTKSi
 HAFMqS9eIG9hlnHpGdZkJuU/0QeJPOz8fYfhftQeXSJ1XlJrvW2a5AeGBsim1NfvGxEF
 XUxeGcEReC4Urt3O/bG3K8VuFE5ifNtGZCVr7uk0yGTOBACEtmeHfdoZQVQVIuGcW6+/
 adQZVaP8nWlW/iOF5SZpvfLlRtIJiABrxjwrDR/wNEeNJgAHiwQwwedQGsVKKC4SCk/e Ng== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=bHVoFr/SonDv8WbdTf1Kb6rfL+P7v0JCZowJuVtb15A=;
 b=mO2koF+1IP0aYiGSYpMiFZGz952RczCF0B5NtBJA0Ckm/4gPG/BWN3azHq7oTR4/lVAq
 0Xo/dXqm6uGkYj7HdyrlN4AeiLIKGErlyjDXpuFTo6FJrTFXgevoP/2VPmoMzqOjivXW
 4GUR6PD/TFKxKXKc+aEiY2jDpqcMMvaWivxqmQcOWsSysITRqSei8DaIzPsBpBSqNGN+
 eLRrOHEF29Sx99J7OMflDzDkhIeAS4WpWNe/qY5pOhDXbb9Y1Xi1Gi2uMbgYYgtCUNKn
 wgOOyQHFEGQ6nMCFpl7hchTu39zBv/h+alYtHdur2ouVKlynzSfeG2I/X7b3FiUi5PX2 ow== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3afgpghjpk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:00 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17GGeijB113651;
 Mon, 16 Aug 2021 16:42:59 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by aserp3020.oracle.com with ESMTP id 3ae5n609gk-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:42:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+HjycCWk8RntAqr2Mp1v+Ji6iSqcYdL+7NKUol8Ype6J/1jZMDxVp3iGA0mel7pKK5LZW01xKSSLK9dtmdL1aZm8L8ucnrBoZzW0wkW520X2BP875x5QEUOZoi9hvZZ/npQHj6CuK9ChuAqSho1j7BlRnxQfaWedbOzKcuUv8WLXX2BwR2hNN982D7b/Ps/2UkZkuiyftMRvjpKkAWSVu27/8AF+xNNlr1BmFQG+JYze36a/3zQxg8ws7pYEVNvhG/We+euA9xWLvWjxYD7Ue5cTo/tylb30tC11PXp3ZYmKryFuCR+Lp7WrIBNLbdbE+WenpsnjO+s86gH22F3RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHVoFr/SonDv8WbdTf1Kb6rfL+P7v0JCZowJuVtb15A=;
 b=Y2nIDJzOVS1N99blE6LMxVL1WbVsfIArd/glBRbDVZrbmSVEwaN4lm+/lOj1AKggo9/JGwUiFPsFFCA49c2rETNPsitd4Hh6MIP9L0oTzqBWpdexNjoL2ydun0WqfTgYNmvJ+QoPo3FyfIww/8+0iWhQK8wokN+5kzG2bnhMqhUyg5Jf7gufvnqNKGSJh2qU6Did+vaSp+P1MilAhsT0MLodIbeTch5M29FFHUTUV8NQmBAX+Jj59IsI+U2KuqVMXsgPFg78UiSI2zJ7CC6gDB5IdnPyTdFPAaos4+OdxVUvJQzp4Uo1jRb8SBZkhZ2zwj2MfUF0/fZ6P+QaHGE7bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHVoFr/SonDv8WbdTf1Kb6rfL+P7v0JCZowJuVtb15A=;
 b=upVZ1GvXrRG8CaeRaTqRz/ATXP+yxK/PQDYqR3jq3fMJXjqRg8UHHHiD7gszOvKP8pHqpAtweErlBJpXAgxhri8u9+TZbSaKgWL597p9TVq6vLThvSmXImMrHqcdhhRs4vjW4vhIvF3iTP4/HVfnn70f7D0dpdUiENiriVYDOiA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by BYAPR10MB3221.namprd10.prod.outlook.com (2603:10b6:a03:14f::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Mon, 16 Aug
 2021 16:42:57 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 16:42:57 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 04/16] vfio-user: connect vfio proxy to remote server
Date: Mon, 16 Aug 2021 09:42:37 -0700
Message-Id: <e9fa92081e0faf49089f4afb9a45187e49ea4bad.1629131628.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629131628.git.elena.ufimtseva@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::31) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nuker.hsd1.ca.comcast.net
 (2601:642:4000:a09:154a:3cd:532c:f36d) by
 BY3PR03CA0026.namprd03.prod.outlook.com (2603:10b6:a03:39a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Mon, 16 Aug 2021 16:42:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 062b21a8-2c59-4fbd-98ed-08d960d4e6d2
X-MS-TrafficTypeDiagnostic: BYAPR10MB3221:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3221185B80105D6CC97F5C328CFD9@BYAPR10MB3221.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kd/DSYq1O/rdNA3fAF3eTogp5v5GwSuTO1Ro8DZlA8z+SpvsviuEm+S373J4pSEWNYlgcI1krSpNjqAZ/iqjV59qRqgpAWUgtmfFsLMzGL4KUYSc3CBY7KRGQEC7W3C3SRkJlkET5BnEaGZNd1t9S3qa+7zQk/AlVCYu0CUpPwk1MKu5apXI89eNt8ed6CBIlybgaXa751MnyxMiHpa863+a8L/xwgq8vbisZ2o9OW8xtQd5amEj9oEx+xrVTmD3G164cFK9fYb0Cfr1tcwYyIK98AV3dxjA7uUXpJZAbuZLvhoetSD0bsfIG/B8+aqBPvSz7vzbN0B0a6h1sSAeGF4DcyXX7c1LQUs6NEs6nrPpyWuVh5IHB9+FyGZIlXuvmBgZqyfOxuucM5ZmVlBfL1mCCa3Lo9o7LLYXApAHJN8oBOsXXNNqBGfRukhY8PFSJl8/J9iJeJHgjpA94gbe7h7JLuIl56/bm2qL1YaH5W4oyAmNPVOq50QVPsPsQyVTnoTIdhT+s2XVW9g67LGPCnvwJKeEDYkefn1IMnVpY+q1EjdGR7s+89S8kPgUbbqxSQQeRaKX53Qygfsb07hL/OArBk74rMjW9UKSfjwzj4s0IWqw+/eum5A3ecbnt0kMKKqtbpvoim+S4e+IQdIwoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(346002)(366004)(396003)(136003)(2616005)(6916009)(66556008)(66476007)(66946007)(52116002)(83380400001)(478600001)(36756003)(5660300002)(6506007)(6666004)(6512007)(186003)(316002)(6486002)(86362001)(44832011)(8936002)(8676002)(38100700002)(4326008)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlBWdTMxeTZtZ0FQbzhJcVNoY0FRSlpGNkp4Q3BoLzAxNFQya20rSkdjb0pY?=
 =?utf-8?B?RUJrbkRNem5PMEtoNzFlWFpUS3VJUmZZOGpRdGhGK1ErVVA4MU1oN1c2b0pI?=
 =?utf-8?B?cjhGV2NKOCtPWWdkanM3aDJvaUF2dzIxdG0wNzJpZ05CUHQ4akRzNldpZ1ho?=
 =?utf-8?B?dmVTRlpPTXJoa0psc3lyZ0owSGxwS2ZkbnFvcmlkM1RDYzgvcG05TXJCcTRr?=
 =?utf-8?B?OEU2OWExSFZWTlUzWVpKd3hKb0xyY2tuS0tKbkUvYmdJLy9VbHJGWm4ycUQ3?=
 =?utf-8?B?WkZLOHdwTWZoVEZSWjNQaEhFcGxQRm96QkVMM3VseVFNMy8zdUNzMlJYOUcr?=
 =?utf-8?B?QjNRVHFqTjhKYStxNHl5QmJERmEvQ1IzYlg2UUt6SFlyczM4cnZ2ajBIeUsy?=
 =?utf-8?B?RDNJbVJWVFc1ZnFiN3lnckZRdmFTM2xoM3RVYlZTUG5Ub3hyNGwzUjd3QzR2?=
 =?utf-8?B?U2ZTcW5HS0Q4YWpGVmNoM0o4dVk0YThHdGJ4bEw1eHZ2UXlqd0pZblVDUStY?=
 =?utf-8?B?dFNpZ3EzNFV5TVpvSkFhNlltK2doRUd4ZUx6OWpLbmRZbDhPZXBNSU9aTU53?=
 =?utf-8?B?RFhnNmo2K0ZMZmU4S3pKOGhMalUvT0NES3VzKzZuWDUvdTlzVGVXQnZvblU1?=
 =?utf-8?B?TTEyb1BKRjUwWHV6eWRCSjRtdVlJNExCYisxMVhPNEo0YzFFUTYyYTJ6c0J4?=
 =?utf-8?B?M1dlZkZ0SnUvaTJGMHRJRVJHZGZQRTlvU1BmMlNDSGFXSldJcnNpdTM4cGxo?=
 =?utf-8?B?V081ZVpjaHQ0NHJ5YmU5SGZiODhMYTFva2NVczN6QTRiWVN0am1zL0twRG9i?=
 =?utf-8?B?Tkp1cEFEMFhKUlB1aXh5Qk1YZndzWXkweXNzQUcxT0pZVXRHNXJhYVgzWTBa?=
 =?utf-8?B?S1M1SXpNcFFDc1FPTHZrdERBMnR3MzBFSzZZc01MOWFyMG9uMTdIakdNT1ZT?=
 =?utf-8?B?ZEFzYXdyZWR4Wm1KbU5NSlovRG94VFBRMnlZRDhGQk1qTUhES3EwZjYzbzBI?=
 =?utf-8?B?eHQwT0Y4VzV1NUxGYU9CZWF4REp2L0JLT05jVnp3RFMrQUpwd1hrZnpvMTR3?=
 =?utf-8?B?OXpkRDVRS0JCSUszR01jcXRGZEZXN0VmUG96aHNGcWpZeWRRWTdxeldrTHdq?=
 =?utf-8?B?T1d3K1AyY29pbUFxZDhBdlp1SXhKMStlUUZKQ0g1M09KZk1LV2oxeFptY3Jo?=
 =?utf-8?B?YWJDZUpWb3BZSlJJb09SSVhDa25pa3V5Mml5TlYzTjFLRXVRWjV5SWJ5eGFn?=
 =?utf-8?B?Mkx2YWRXWVMrNS9BVHlKMEppMDdUMVQ4S0J1dFNydldPS2I1c1c4UFluT3F5?=
 =?utf-8?B?M09OMkp2c0FaTkc1dUc5eUhIcHNWQk1vWThIRForZnBkY2xwdm1oZnVRWG5U?=
 =?utf-8?B?RDN2TzNPUUxsUlpaZFl4VGV1YkJkaFo0YmxMdDFHNXJqenp1RklCVWN1UGEy?=
 =?utf-8?B?aFZxaUxzc2lPQnllemxxb0MyWGc2K0F3ZEtuRVNPY25BRGZIVGQ2NWc4QXF2?=
 =?utf-8?B?SFU0LzJIS1VuSWJhWmFEdVRVTzRna1EzTkptaW5GZldXMTVjWE1uM1J0RUNL?=
 =?utf-8?B?cXBqb0VhNVNFZUlsS0t6WlFkN2RBU3FPYVVTbkhCWGt3UjZlWi9RK09ZMUFo?=
 =?utf-8?B?WVg5TTZyV3Vvc0FvQ2d5YkJONEJzVE05R1ozdXdNcWtsZEV0WnRhL0Ivekps?=
 =?utf-8?B?bjNPR0RIL2tWV2s2dWVRVzd1TitndDlQWkZKTGZZUHhmR2xYSitMR1RPWEp5?=
 =?utf-8?B?ekxTL2NhWWt3ODJVQTZSUzZMekttUG9IYm1XY0JHaVdXaHU5VkxBamRHSGFN?=
 =?utf-8?B?MDJKZmFOMllzMlZSc05SNGwvWGxwS1FjUDU1QzhGcUJ3c1MyeFF4bHgzYklZ?=
 =?utf-8?Q?NcGiYF4MPf02u?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 062b21a8-2c59-4fbd-98ed-08d960d4e6d2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 16:42:57.2769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BGMtzRAw/I8joIGmNr9COxHgHFmXAOCrPVRr9KJnNiU4z9f2DraZyjCUtmNfp0rx3Y9YgOlcbh0hyKCEElUoAYE3KVhR6x/OJiQCy1mcpyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3221
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10078
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108160105
X-Proofpoint-GUID: oIFuVEKSr94_acTkya3rXAa8bHXfNF4M
X-Proofpoint-ORIG-GUID: oIFuVEKSr94_acTkya3rXAa8bHXfNF4M
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Johnson <john.g.johnson@oracle.com>

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user.h                |  66 ++++++++++++++
 include/hw/vfio/vfio-common.h |   2 +
 hw/vfio/pci.c                 |  29 ++++++
 hw/vfio/user.c                | 160 ++++++++++++++++++++++++++++++++++
 MAINTAINERS                   |   4 +
 hw/vfio/meson.build           |   1 +
 6 files changed, 262 insertions(+)
 create mode 100644 hw/vfio/user.h
 create mode 100644 hw/vfio/user.c

diff --git a/hw/vfio/user.h b/hw/vfio/user.h
new file mode 100644
index 0000000000..62b2d03d56
--- /dev/null
+++ b/hw/vfio/user.h
@@ -0,0 +1,66 @@
+#ifndef VFIO_USER_H
+#define VFIO_USER_H
+
+/*
+ * vfio protocol over a UNIX socket.
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ */
+
+typedef struct {
+    int send_fds;
+    int recv_fds;
+    int *fds;
+} VFIOUserFDs;
+
+typedef struct VFIOUserReply {
+    QTAILQ_ENTRY(VFIOUserReply) next;
+    VFIOUserFDs *fds;
+    uint32_t rsize;
+    uint32_t id;
+    QemuCond cv;
+    bool complete;
+    bool nowait;
+} VFIOUserReply;
+
+
+enum proxy_state {
+    VFIO_PROXY_CONNECTED = 1,
+    VFIO_PROXY_RECV_ERROR = 2,
+    VFIO_PROXY_CLOSING = 3,
+    VFIO_PROXY_CLOSED = 4,
+};
+
+typedef struct VFIOProxy {
+    QLIST_ENTRY(VFIOProxy) next;
+    char *sockname;
+    struct QIOChannel *ioc;
+    int (*request)(void *opaque, char *buf, VFIOUserFDs *fds);
+    void *reqarg;
+    int flags;
+    QemuCond close_cv;
+
+    /*
+     * above only changed when BQL is held
+     * below are protected by per-proxy lock
+     */
+    QemuMutex lock;
+    QTAILQ_HEAD(, VFIOUserReply) free;
+    QTAILQ_HEAD(, VFIOUserReply) pending;
+    VFIOUserReply *last_nowait;
+    enum proxy_state state;
+    bool close_wait;
+} VFIOProxy;
+
+/* VFIOProxy flags */
+#define VFIO_PROXY_CLIENT       0x1
+#define VFIO_PROXY_SECURE       0x2
+
+VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
+void vfio_user_disconnect(VFIOProxy *proxy);
+
+#endif /* VFIO_USER_H */
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 8af11b0a76..f43dc6e5d0 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -75,6 +75,7 @@ typedef struct VFIOAddressSpace {
 } VFIOAddressSpace;
 
 struct VFIOGroup;
+typedef struct VFIOProxy VFIOProxy;
 
 typedef struct VFIOContainer {
     VFIOAddressSpace *space;
@@ -143,6 +144,7 @@ typedef struct VFIODevice {
     VFIOMigration *migration;
     Error *migration_blocker;
     OnOffAuto pre_copy_dirty_page_tracking;
+    VFIOProxy *proxy;
 } VFIODevice;
 
 struct VFIODeviceOps {
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index d642aafb7f..7c2d245ca5 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -42,6 +42,7 @@
 #include "qapi/error.h"
 #include "migration/blocker.h"
 #include "migration/qemu-file.h"
+#include "hw/vfio/user.h"
 
 #define TYPE_VFIO_PCI_NOHOTPLUG "vfio-pci-nohotplug"
 
@@ -3361,13 +3362,35 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     VFIOUserPCIDevice *udev = VFIO_USER_PCI(pdev);
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
     VFIODevice *vbasedev = &vdev->vbasedev;
+    SocketAddress addr;
+    VFIOProxy *proxy;
+    Error *err = NULL;
 
+    /*
+     * TODO: make option parser understand SocketAddress
+     * and use that instead of having scaler options
+     * for each socket type.
+     */
     if (!udev->sock_name) {
         error_setg(errp, "No socket specified");
         error_append_hint(errp, "Use -device vfio-user-pci,socket=<name>\n");
         return;
     }
 
+    memset(&addr, 0, sizeof(addr));
+    addr.type = SOCKET_ADDRESS_TYPE_UNIX;
+    addr.u.q_unix.path = udev->sock_name;
+    proxy = vfio_user_connect_dev(&addr, &err);
+    if (!proxy) {
+        error_setg(errp, "Remote proxy not found");
+        return;
+    }
+    vbasedev->proxy = proxy;
+
+    if (udev->secure_dma) {
+        proxy->flags |= VFIO_PROXY_SECURE;
+    }
+
     vbasedev->name = g_strdup_printf("VFIO user <%s>", udev->sock_name);
     vbasedev->dev = DEVICE(vdev);
     vbasedev->fd = -1;
@@ -3379,6 +3402,12 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
 
 static void vfio_user_instance_finalize(Object *obj)
 {
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
+    VFIODevice *vbasedev = &vdev->vbasedev;
+
+    vfio_put_device(vdev);
+
+    vfio_user_disconnect(vbasedev->proxy);
 }
 
 static Property vfio_user_pci_dev_properties[] = {
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
new file mode 100644
index 0000000000..3bd304e036
--- /dev/null
+++ b/hw/vfio/user.c
@@ -0,0 +1,160 @@
+/*
+ * vfio protocol over a UNIX socket.
+ *
+ * Copyright © 2018, 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include <linux/vfio.h>
+#include <sys/ioctl.h>
+
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "qemu/main-loop.h"
+#include "hw/hw.h"
+#include "hw/vfio/vfio-common.h"
+#include "hw/vfio/vfio.h"
+#include "qemu/sockets.h"
+#include "io/channel.h"
+#include "io/channel-socket.h"
+#include "io/channel-util.h"
+#include "sysemu/iothread.h"
+#include "user.h"
+
+static IOThread *vfio_user_iothread;
+static void vfio_user_shutdown(VFIOProxy *proxy);
+
+
+/*
+ * Functions called by main, CPU, or iothread threads
+ */
+
+static void vfio_user_shutdown(VFIOProxy *proxy)
+{
+    qio_channel_shutdown(proxy->ioc, QIO_CHANNEL_SHUTDOWN_READ, NULL);
+}
+
+
+/*
+ * Functions only called by iothread
+ */
+
+static void vfio_user_cb(void *opaque)
+{
+    VFIOProxy *proxy = opaque;
+
+    qemu_mutex_lock(&proxy->lock);
+    proxy->state = VFIO_PROXY_CLOSED;
+    qemu_mutex_unlock(&proxy->lock);
+    qemu_cond_signal(&proxy->close_cv);
+}
+
+
+/*
+ * Functions called by main or CPU threads
+ */
+
+static QLIST_HEAD(, VFIOProxy) vfio_user_sockets =
+    QLIST_HEAD_INITIALIZER(vfio_user_sockets);
+
+VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp)
+{
+    VFIOProxy *proxy;
+    QIOChannelSocket *sioc;
+    QIOChannel *ioc;
+    char *sockname;
+
+    if (addr->type != SOCKET_ADDRESS_TYPE_UNIX) {
+        error_setg(errp, "vfio_user_connect - bad address family");
+        return NULL;
+    }
+    sockname = addr->u.q_unix.path;
+
+    sioc = qio_channel_socket_new();
+    ioc = QIO_CHANNEL(sioc);
+    if (qio_channel_socket_connect_sync(sioc, addr, errp)) {
+        object_unref(OBJECT(ioc));
+        return NULL;
+    }
+    qio_channel_set_blocking(ioc, true, NULL);
+
+    proxy = g_malloc0(sizeof(VFIOProxy));
+    proxy->sockname = sockname;
+    proxy->ioc = ioc;
+    proxy->flags = VFIO_PROXY_CLIENT;
+    proxy->state = VFIO_PROXY_CONNECTED;
+    qemu_cond_init(&proxy->close_cv);
+
+    if (vfio_user_iothread == NULL) {
+        vfio_user_iothread = iothread_create("VFIO user", errp);
+    }
+
+    qemu_mutex_init(&proxy->lock);
+    QTAILQ_INIT(&proxy->free);
+    QTAILQ_INIT(&proxy->pending);
+    QLIST_INSERT_HEAD(&vfio_user_sockets, proxy, next);
+
+    return proxy;
+}
+
+void vfio_user_disconnect(VFIOProxy *proxy)
+{
+    VFIOUserReply *r1, *r2;
+
+    qemu_mutex_lock(&proxy->lock);
+
+    /* our side is quitting */
+    if (proxy->state == VFIO_PROXY_CONNECTED) {
+        vfio_user_shutdown(proxy);
+        if (!QTAILQ_EMPTY(&proxy->pending)) {
+            error_printf("vfio_user_disconnect: outstanding requests\n");
+        }
+    }
+    object_unref(OBJECT(proxy->ioc));
+    proxy->ioc = NULL;
+
+    proxy->state = VFIO_PROXY_CLOSING;
+    QTAILQ_FOREACH_SAFE(r1, &proxy->pending, next, r2) {
+        qemu_cond_destroy(&r1->cv);
+        QTAILQ_REMOVE(&proxy->pending, r1, next);
+        g_free(r1);
+    }
+    QTAILQ_FOREACH_SAFE(r1, &proxy->free, next, r2) {
+        qemu_cond_destroy(&r1->cv);
+        QTAILQ_REMOVE(&proxy->free, r1, next);
+        g_free(r1);
+    }
+
+    /*
+     * Make sure the iothread isn't blocking anywhere
+     * with a ref to this proxy by waiting for a BH
+     * handler to run after the proxy fd handlers were
+     * deleted above.
+     */
+    proxy->close_wait = 1;
+    aio_bh_schedule_oneshot(iothread_get_aio_context(vfio_user_iothread),
+                            vfio_user_cb, proxy);
+
+    /* drop locks so the iothread can make progress */
+    qemu_mutex_unlock_iothread();
+    qemu_cond_wait(&proxy->close_cv, &proxy->lock);
+
+    /* we now hold the only ref to proxy */
+    qemu_mutex_unlock(&proxy->lock);
+    qemu_cond_destroy(&proxy->close_cv);
+    qemu_mutex_destroy(&proxy->lock);
+
+    qemu_mutex_lock_iothread();
+
+    QLIST_REMOVE(proxy, next);
+    if (QLIST_EMPTY(&vfio_user_sockets)) {
+        iothread_destroy(vfio_user_iothread);
+        vfio_user_iothread = NULL;
+    }
+
+    g_free(proxy);
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index d838b9e3f2..f429bab391 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1882,8 +1882,12 @@ L: qemu-s390x@nongnu.org
 vfio-user
 M: John G Johnson <john.g.johnson@oracle.com>
 M: Thanos Makatos <thanos.makatos@nutanix.com>
+M: Elena Ufimtseva <elena.ufimtseva@oracle.com>
+M: Jagannathan Raman <jag.raman@oracle.com>
 S: Supported
 F: docs/devel/vfio-user.rst
+F: hw/vfio/user.c
+F: hw/vfio/user.h
 
 vhost
 M: Michael S. Tsirkin <mst@redhat.com>
diff --git a/hw/vfio/meson.build b/hw/vfio/meson.build
index da9af297a0..739b30be73 100644
--- a/hw/vfio/meson.build
+++ b/hw/vfio/meson.build
@@ -8,6 +8,7 @@ vfio_ss.add(when: 'CONFIG_VFIO_PCI', if_true: files(
   'display.c',
   'pci-quirks.c',
   'pci.c',
+  'user.c',
 ))
 vfio_ss.add(when: 'CONFIG_VFIO_CCW', if_true: files('ccw.c'))
 vfio_ss.add(when: 'CONFIG_VFIO_PLATFORM', if_true: files('platform.c'))
-- 
2.25.1


