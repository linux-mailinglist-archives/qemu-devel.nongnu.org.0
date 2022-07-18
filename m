Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09772578550
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:26:50 +0200 (CEST)
Received: from localhost ([::1]:37256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRhx-0004wk-3C
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oDReR-0007TN-4I
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:23:11 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:23808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oDReO-00074v-Jf
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:23:10 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26IDZHPk029595;
 Mon, 18 Jul 2022 14:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=lgl77gCIWWzvBKKOPFEYF7PFsoYbcwa1abg9zVuRRwU=;
 b=ItLl+cS7OBWEuVaNCj0eOPC3ILadcGMSKQU50elqafl0AzMWk7LKlNjhcSU16Tlu5ox3
 Ilf+cPhSEROFdpNuvft5+mWPWgJP8Tu8OUDwlvqTyulQec+QcMnDdHXmV1en0JTWM7mo
 by95P2iac5dhz8EekMR/hKP6oDNb06KqMmeSXoeAJoi86OIDmpyJJgGHK0mHiUft9zMA
 ZvOZ5mrKBD+m3C/+mbUOrMbhZF0XzkoiMxCneqy75TkZQmvHRxeGDywGuyrj2jCNfslP
 ofrdgzZKdK3fIfnN0OWoGYfJ1X7yqJIZBVAe1fKRJuBTmKmeskhBRQe4Pere4n2ciPC3 iA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbnvtbe1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Jul 2022 14:22:59 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26ICGW81009109; Mon, 18 Jul 2022 14:22:58 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hc1ekmurw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Jul 2022 14:22:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfgQv6PaWpAYx/V8f5ev/b8jcgFOWX1XxKcjI8a82sAqVqLhK9AKTCHy/0i1ZlUM08GMksBlS/uKk5XPlakDUVcWzhI4/jy31JEis+QshE9aAC3DuHlsEQMZK2yLWuW0+jZJmisaDBt9sWls3WiuRflX7vcNRGTQzognDaH1TCrYTJx0MWZ+0U4mwLQ+cpoSMu3k8zcmcG+fltSnN+J1kbuYEpqGPqvK9gV72zqfxz+24pEiume3ymYT3YfhlsFSs/dQeD1Muo/Y1a8mWvSKSzs/Wk5aidqgQQ4wVMZgV6MmnZ9IXNskxYgQG51rGybcxW3N5N2GmlGeBttwtzYDJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgl77gCIWWzvBKKOPFEYF7PFsoYbcwa1abg9zVuRRwU=;
 b=DEe0kPeE0LETOtB8h1N9kJ8AguuID4+GNaV3p/J+yJx2ogDnEjhMzWAXWcfB6Km1BNxwTIgbx2xbM3LMQNKu8FRssm19cs7aaOgH2MPHF4xgq94iueSX8UEfn1CYmv4TRz33OZMh2sFF1ek0lTRHd5kPAiFFXsu+IaqUhXhzG3Xumd7hHEUKgY7Z5EIoeoFuIU+W6i8xQJjAcHjgaCkMej0oU1tK0CMD3fLKQ4V+rUaXH98t1tcSzXX1IULPLgKtt851/yzKhIDhCD8H/82kBLDNrvsw5gq31I6nCdVMpdoVK5pk0CTwlbRvUO1gq9cIt+ssAkPxSLtlovffZWLDtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgl77gCIWWzvBKKOPFEYF7PFsoYbcwa1abg9zVuRRwU=;
 b=XF5EEmt3Blz+GnkMiE2hBybn7iy21tprNeFVF/UFSuY+VneRlw5eQIPRBG/JPWNfntcaKWjmmuVBjlfH3QtxryuQMM367fR/NIT4B0oLwFphXt0oTYDz2x5u6Q8qjZfSNjmlZHM2DKZCMA/Fmrh89WjVFmmfvbdokW2C4U8W6HE=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BY5PR10MB4178.namprd10.prod.outlook.com (2603:10b6:a03:210::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Mon, 18 Jul
 2022 14:22:56 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%8]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 14:22:56 +0000
Message-ID: <d73ff771-d471-c063-32a9-2102f0658685@oracle.com>
Date: Mon, 18 Jul 2022 15:22:50 +0100
Subject: Re: [PATCH v8 08/11] i386/pc: factor out device_memory base/size to
 helper
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
References: <20220715171628.21437-1-joao.m.martins@oracle.com>
 <20220715171628.21437-9-joao.m.martins@oracle.com>
 <20220718150336.5a59af64@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220718150336.5a59af64@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0002.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::14) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 091b9425-98ca-4cb3-f14d-08da68c90210
X-MS-TrafficTypeDiagnostic: BY5PR10MB4178:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AW4mwyf1hEE+UyalrMApqtSzEc69REtCdjdYq1n0ayHWd5Qa3c9UTMKWVv7Yw/bVH+gEv6xgOUFijRC9rMUbLCoWiuoVtFqDiLZSyMFTu5pKNQK2LVbrrYZkjbD9KO0XnViid8HuhQqSv/Ax6CnDJdQGSk08O+vq3qrO8iB1DKDjQFqyEOhN8UkiAWXdFLIommDhAvql3ZfAsJWbFFZVegjHmSyEgGynj2/qvdpPXHDor/+uPCo1RePvsKADWUg3E9W5P/3BO/S9dPQQd04jXxWwK/b3UIIDqdqZakXhbkpvP93pVk7uGQlziOBoFiRiYMdTHISvAij+PNIQr8PaMPUF3BU6sgfGj421PsxR/fETs1n2Gv6YhNodMXyY164gZ8NgKHZ3AKbtrFAcHXvTY1kd3rpUNZ+XJFsb9nLKehPBUZvwHEmoFqk8hXEDXMkPlaQToZ8n2w8xarR5rY5dLnCu0SwC3Woemh67v8GfCxSFHMzVmCkz4L88eQ+iluaSH8nnDAQ5rGTESGWZ+8Lluf243yI64XeR2o0PQdzurhnwq9sTxGN5Z23i4t7h8BkMsiJy/I5Mig/mr8XekAGVjMFHJ5KL3LJFES2SUailLQGGflFowKL6Z2Qkx/+6bXRS+0oc9jSVnFmH9JSGqcn3HgBjjf1zxLhBo/noITGO9NaGthicgkqjDJE/ihjJMdtjAZG1VLqpw/hyaYhYjxctSLn2GxiGGTIW4NYBnnyppXxwBnfWPQs8ccXMfoG3Vn88/ldJwE3zTZN5/lSZhHYMKigxYRirFQ1Wp7VhgkYqa5BsSzPxyXZOWTQoyUnmVGTMsDk3gw/Bdt6ruIc6sLXInEsCBT8yY4q1qHVZpm0wGOg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(366004)(136003)(346002)(39860400002)(376002)(6486002)(41300700001)(31696002)(6666004)(478600001)(2616005)(186003)(53546011)(6506007)(26005)(6512007)(2906002)(38100700002)(54906003)(31686004)(6916009)(83380400001)(8936002)(7416002)(5660300002)(36756003)(316002)(66476007)(8676002)(66556008)(66946007)(86362001)(4326008)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFFnS1BMdGFtN2dmbGxMMmRyVlBoUGlTRGVKVzZ4WTdPaVRFQVhQeG5oMWM0?=
 =?utf-8?B?VzZxcjEyd3BrQ21XazRoVFVSa3FyZ05CZDRhVnlQeGlvR0VXLzhPRUNmNm9Q?=
 =?utf-8?B?NDI5OU5ldEJSMnBZK1htVlN2VUFvR3FBUVpUeXVSRzZWRXM5VUNhWmp2VVlj?=
 =?utf-8?B?bFVSQ0hVY24zcGwwUlh6dmF6YTBCNlJ5RU5Zb2FJVFNPR0pJZDhCRXpNaGNE?=
 =?utf-8?B?di95V3JJcEJpZjg0MjVCSEo5MVdKRjdMKzJ0dmlLZElOK3l5TjRYOEFBd0or?=
 =?utf-8?B?enNVUFZyWWkwWDdlZWV5U0twN1FnOW1Wa3RJY1djQko0UTV4QUNKcjI1ck9v?=
 =?utf-8?B?cGh5eWplSGtDM0VyeFU1SmpkNWg4dzVQaGV5bUFzNXVPdUtNU3ZvRjlQcGE1?=
 =?utf-8?B?WUNTNjIyNEJveFJZUEQ5c2xxaThUWHY2d2ZCN3lFNStORVNLZ2QzM1BWV0Fz?=
 =?utf-8?B?dUU3YXljMGU0bloyWDlreVFYWHVZc1VjTGx5YkZIRXJtZUJENlpaMDM2TDZB?=
 =?utf-8?B?dDZWb2Z1blhvbUNiWWhtQmRXa1RoMm5pY2NXSjI1dkEyUFp1TzVJOVBMUVlw?=
 =?utf-8?B?UkJNT3dTaGNxTU5zK3RtdDdWMGo5NklnZ0gxaTE3alVnbFVBcDZsZ21TZHV2?=
 =?utf-8?B?N3FpekhJZHMzRFI5clhCcU8wVk9NNHZaRVQ3UVVxeDlMNUR3a255L0I1eXpV?=
 =?utf-8?B?MldsazZsa0RWcUhXcnVNMVJHRjRQbFVlR1kyaDcvVnpkZ2ZnY0dReTNvUmdC?=
 =?utf-8?B?RU1Gb3Y3akxhbXI1b0p3Vkw0MW1xRFMxUEt5cVhtY1FXNU1KWjNMNnRzSXB5?=
 =?utf-8?B?enJ1MW5TWnNrWHZTL3lxOFBBVnFabjRmRnFOUThnR0ZwMFQxUHpUd2JpUnFv?=
 =?utf-8?B?OGhCRExmZUNYMkxGcFlQZHVteFRVTGFWNkpRQ2ZQaUpkeXBYNDhCbHdKdkRN?=
 =?utf-8?B?eFBTemYyVzcvWUZ4V0M4ZlpjMEtqL3N4bmZjZmFwem9vaGhwbVZneTR6WDg2?=
 =?utf-8?B?ZUU5NEdYY2RTd2ZLTkNZUzBpZXdWN0M3TlhSZHJoMWVERHFDeWFOUkc4N3po?=
 =?utf-8?B?MlJzNTgySDBMaklUQUVrcmkwa2FNU1diV3gwM2FxNGpoU2lENUhvbmFtRFVw?=
 =?utf-8?B?UGs4WWttR3lKc1pvNjRWMVJwYkFRV3dzT0l4YWpoWmhMdzJsd2NXb2FXd3Ni?=
 =?utf-8?B?SWdTNCt0S2dSd3hJMUpUUG5paUhHMjArZFZoMU1Fa3VYVHpsV0VsTURyeitK?=
 =?utf-8?B?N0lFNEVhSS9yRkN2ai8yQUc5VURxODQvYURQY3RtNE02SGlUeEdlMlJ1RWhQ?=
 =?utf-8?B?UGtPRW9pUk0rbDhnL0JRV3B6RTY3VHh6MitpMm11ZCtOcHlUY25CTkxxVVl2?=
 =?utf-8?B?Tjl2bm5SbUZueWZtTEtTekE0cTUyLzllNktveWVXdjVkOXNsZVEwTGN3dlhI?=
 =?utf-8?B?dDZlbjQ2N2g3ZFlySjdaZTFPRHlmU0MxdTFWWGhvRE9WNEp0M1hYL2ltSDFq?=
 =?utf-8?B?YmRRQWdURXI4OHpUUXRXR04wdTJRQi9pT3U5K0c3NnJJWnVwUXk1cE5ZYWJQ?=
 =?utf-8?B?bHdQRXRMOGEveEg1VHEzWlRCb1BMMk1RZnFHOVhjYlA2L0hoc1BnU3NXSTg5?=
 =?utf-8?B?U0Z3WlBLa1VMd3ZpNmc3UTFNM3RFZXUvS3BQdVJOY1FnNFpNajJOMWpGbGcy?=
 =?utf-8?B?VlRXRWRPaEZ6UUpCdzcyZk9PcTNvdVNIMmYxQUVTbzBaODd1MlpMdlZMdzQ4?=
 =?utf-8?B?R2FUeVUzeGY1NklvNy8vUkd1Mm1GbGJhTjlXbTZQUzM4RUhvaElSNHRxMTF5?=
 =?utf-8?B?UkRTZTJzK0dzRWZOOU1pTkppbTJpWHB5UnR2Wk0rTHRTRisycFM5YWhoRmRK?=
 =?utf-8?B?REs2UmZIdVIrNHQ4RDhZOEJTL1FibktPVEhDNlJINHNmVEhCVmVhM0phcS84?=
 =?utf-8?B?RjZMOWFDcVdiQ2czVjlGYUd1MkFhYU1sbG5wRUZUYndZNkI3M1VwbUZhMUR5?=
 =?utf-8?B?NXBkeHc0VXM5cFlCeEhYOFBtelBJUTF0RG1QbytsU1FhV1M2WlZmY2ZZaks2?=
 =?utf-8?B?bmlxKzBkdzFNWVFrY3hmOVYvQjBQK1c3VlhjdkdQbVY5UHNoZUFCSHMxR3ky?=
 =?utf-8?B?Z283UTRrYkk4MUxVTklvdkwxdkt5L29qdXJkTlVRdHBaU1R4THFIUEtrV3RE?=
 =?utf-8?B?eEE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 091b9425-98ca-4cb3-f14d-08da68c90210
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 14:22:56.1069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9YOh01DeoTNbDfeG/k6zCSblKlo+ijT023qtf6ATS7wRJUe8SvhC0rWd494oaoz+z3ROqz1R4pe1H+aweGNHt73VroF6DMmgHinTme03BxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4178
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_13,2022-07-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207180062
X-Proofpoint-GUID: K_-h15ymSt72z6M4HLvNYIHKCs6W9M2F
X-Proofpoint-ORIG-GUID: K_-h15ymSt72z6M4HLvNYIHKCs6W9M2F
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



On 7/18/22 14:03, Igor Mammedov wrote:
> On Fri, 15 Jul 2022 18:16:25 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> Move obtaining hole64_start from device_memory memory region base/size
>> into an helper alongside correspondent getters in pc_memory_init() when
>> the hotplug range is unitialized. While doing that remove the memory
>> region based logic from this newly added helper.
>>
>> This is the final step that allows pc_pci_hole64_start() to be callable
>> at the beginning of pc_memory_init() before any memory regions are
>> initialized.
>>
>> Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> 
> Acked-by: Igor Mammedov <imammedo@redhat.com>
> 
Thanks!
>> ---
>>  hw/i386/pc.c | 47 ++++++++++++++++++++++++++++++++---------------
>>  1 file changed, 32 insertions(+), 15 deletions(-)
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index c654be6cf0bd..cda435e3baeb 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -825,15 +825,37 @@ static hwaddr pc_above_4g_end(PCMachineState *pcms)
>>      return x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
>>  }
>>  
>> -static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
>> +static void pc_get_device_memory_range(PCMachineState *pcms,
>> +                                       hwaddr *base,
>> +                                       ram_addr_t *device_mem_size)
>>  {
>>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>      MachineState *machine = MACHINE(pcms);
>> +    ram_addr_t size;
>> +    hwaddr addr;
>> +
>> +    size = machine->maxram_size - machine->ram_size;
>> +    addr = ROUND_UP(pc_above_4g_end(pcms), 1 * GiB);
>> +
>> +    if (pcmc->enforce_aligned_dimm) {
>> +        /* size device region assuming 1G page max alignment per slot */
>> +        size += (1 * GiB) * machine->ram_slots;
>> +    }
>> +
>> +    *base = addr;
>> +    *device_mem_size = size;
>> +}
>> +
>> +
> 
> stray newline
> 
I'll remove it in the v9 respin.

>> +static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
>> +{
>> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>      hwaddr cxl_base;
>> +    ram_addr_t size;
>>  
>> -    if (pcmc->has_reserved_memory && machine->device_memory->base) {
>> -        cxl_base = machine->device_memory->base
>> -            + memory_region_size(&machine->device_memory->mr);
>> +    if (pcmc->has_reserved_memory) {
>> +        pc_get_device_memory_range(pcms, &cxl_base, &size);
>> +        cxl_base += size;
>>      } else {
>>          cxl_base = pc_above_4g_end(pcms);
>>      }
>> @@ -920,7 +942,7 @@ void pc_memory_init(PCMachineState *pcms,
>>      /* initialize device memory address space */
>>      if (pcmc->has_reserved_memory &&
>>          (machine->ram_size < machine->maxram_size)) {
>> -        ram_addr_t device_mem_size = machine->maxram_size - machine->ram_size;
>> +        ram_addr_t device_mem_size;
>>  
>>          if (machine->ram_slots > ACPI_MAX_RAM_SLOTS) {
>>              error_report("unsupported amount of memory slots: %"PRIu64,
>> @@ -935,13 +957,7 @@ void pc_memory_init(PCMachineState *pcms,
>>              exit(EXIT_FAILURE);
>>          }
>>  
>> -        machine->device_memory->base =
>> -            ROUND_UP(pc_above_4g_end(pcms), 1 * GiB);
>> -
>> -        if (pcmc->enforce_aligned_dimm) {
>> -            /* size device region assuming 1G page max alignment per slot */
>> -            device_mem_size += (1 * GiB) * machine->ram_slots;
>> -        }
>> +        pc_get_device_memory_range(pcms, &machine->device_memory->base, &device_mem_size);
>>  
>>          if ((machine->device_memory->base + device_mem_size) <
>>              device_mem_size) {
>> @@ -1046,13 +1062,14 @@ uint64_t pc_pci_hole64_start(void)
>>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>      MachineState *ms = MACHINE(pcms);
>>      uint64_t hole64_start = 0;
>> +    ram_addr_t size = 0;
>>  
>>      if (pcms->cxl_devices_state.is_enabled) {
>>          hole64_start = pc_get_cxl_range_end(pcms);
>> -    } else if (pcmc->has_reserved_memory && ms->device_memory->base) {
>> -        hole64_start = ms->device_memory->base;
>> +    } else if (pcmc->has_reserved_memory && (ms->ram_size < ms->maxram_size)) {
>> +        pc_get_device_memory_range(pcms, &hole64_start, &size);
>>          if (!pcmc->broken_reserved_end) {
>> -            hole64_start += memory_region_size(&ms->device_memory->mr);
>> +            hole64_start += size;
>>          }
>>      } else {
>>          hole64_start = pc_above_4g_end(pcms);
> 

