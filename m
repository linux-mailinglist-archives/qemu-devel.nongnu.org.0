Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 399FB4B9A33
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 08:56:15 +0100 (CET)
Received: from localhost ([::1]:35388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKbe9-0001NP-VK
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 02:56:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbXc-0003kH-0Q
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:30 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:55532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbXX-0004QF-8H
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:26 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H5Q2s5009055; 
 Thu, 17 Feb 2022 07:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2021-07-09;
 bh=BTSJEma3MctcLXiTX2JPNvU9DiUm5+/R3CJyJh7rax8=;
 b=W+ahZD64KO6MliTQj7pU40mpIFqhL51Kh17uV+hU/NLXQ7nJP/nEpdlJfeiJ4m/yQ6T+
 Iw/RjMCeOcS8FdRD/EjTcvIFK4xLDfcXnjzDgOQkRbApo15GpjHAaaGCkOzF+B2wdLYZ
 aWJNCfOXCK23TxDXgnVRPbfQPnfBhaCk+sJuchCBvlmn7yodTMfXd0KPLxQpapZKXktz
 RBdItcR6K6A41k/GFa62WTMvqRdKzHFCh56a5NQMruiNshkxMmupq2OWZtJrpFcLRbml
 NakrCQcbaUj6hlk+3Kep9Isg9IgqVcNQeptOvqY5CGdL8V4yoCS5b7xQoqnt8Nn6fV84 hw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8nb3mhq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21H7gDYC030230;
 Thu, 17 Feb 2022 07:49:14 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2040.outbound.protection.outlook.com [104.47.73.40])
 by aserp3020.oracle.com with ESMTP id 3e8nvtf66j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAaIgsjNdpc8jdf+bmyKvgF7+saaOe/LvsBVs58fUcDpUNVN7BVtozT4R5tNNfNLxCj1sN4+qhmOgSK+OuFKkqI02N5gvM605EiHxEs0dDT6gxLifnFYtSNd+wGncL2irgXSoBjE3sGQfiYUyTsmTSk1Zt/W13bYK1S45ev3rWNVwmHVAOwR308+/h0K7RBU8t9oqOv8vxxt1JFA2iUzSk9aiRs13LO6pRY5VN7J55lZWAK2vOAi5CVPb1miY/NMs+3XcpcepIyXwRSqNnClsfbmorp3JyyTE/FMQ1iWhS7lvhxXXLAaSCnVfH6Rk42dtSW8tOpdPfHmeBPyJ6GBMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTSJEma3MctcLXiTX2JPNvU9DiUm5+/R3CJyJh7rax8=;
 b=LurAgkcvVvMaq8+21wwrVO5wWCu19se8oGi5/WHgMb/gfKzp4uPILSqb2R1kMU9FEUCxy3UUrpay5kZwBLy92fTlUyUJnBrwBGFR/G5AgSqbG741be9fvkfrNkjQEYRx4R/vQGdScjGa/xAzaFcw185Wo1OQAB+188C+/Ghpa4V92ZLLylqav5R4QkQ1lDIaoXAXRo8aBKkm8EQju7qegWP9VN2Da0EoolhqX+QypvW+C9C/Dwp0vEN2jw8YKpvVtDIl8OWOO+62pZt9n64FjIealEgW7mUxfc3wo72mZnHjOy/F6NB1oefu05tpCeE4R6b7XZIjELgdJ+w4PxBo1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTSJEma3MctcLXiTX2JPNvU9DiUm5+/R3CJyJh7rax8=;
 b=VuXMQwkurXAbV1ylN5jcCmsQrfFbehx0dtG5Z6MpwCbGZlZzqSxH8ll3d/9MJjuCXaIr1E5KkHCPG3T1XyBslfNxr+ZW2nC69n6xhcgQlQmIYqMfSdFJ0wN/UwPi/hFOTiNcfAoq17zJak/vMgU4Wu2veTtfRuHkY4sstwMyN7o=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by BL0PR10MB3009.namprd10.prod.outlook.com (2603:10b6:208:75::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Thu, 17 Feb
 2022 07:49:12 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe%6]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 07:49:12 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 00/19] vfio-user server in QEMU
Date: Thu, 17 Feb 2022 02:48:47 -0500
Message-Id: <cover.1645079934.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:806:a7::7) To CH2PR10MB4008.namprd10.prod.outlook.com
 (2603:10b6:610:c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a349e22d-c9b5-4cb6-485c-08d9f1e9fcd8
X-MS-TrafficTypeDiagnostic: BL0PR10MB3009:EE_
X-Microsoft-Antispam-PRVS: <BL0PR10MB3009A2923A486AD74CDD02E490369@BL0PR10MB3009.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AnpNXPTbP60Lx3VmgkERm6bglfPRqaHu+BW5QnMiWyfHOe8TaKuNeXGYj8HNMWLH1+7AWa6AGsZTh6kdvbSUEwqYgOvvXObOtz9FilYp0Yoz1URc0SkTnIEcwqi7hG/dmmCKI4bs2HNroS9ITAv0HFFrIjD14pNp8n7fAkVmOAzywELbvQpYojFaXlHbk+uNyffabuLzjDt54u0CK91m1Jg/8+zhe169ItMboHVu+cQaicoU62705aODGwM4VyXN3DJgBKv2wrxNoJqmmU0gt9bJMS4i3OCu1M28nxmI3XJHI8HiZ6FSu8qvfzdfPkk8g9at+npbn8Hn0PgHPB4T0aA/GvikmV1lnEMCP0i6znd+Vn30MghpYee1OehbU6Fr+3BJRk172uWPGBgB0qJxbPINmnciI7XKatj4xEyUjdLtkbv0rZfua9gN6UGA31gRbFZcA+P63PDUROS5QyNHOdTCNvOv7GuIugMYcAhoXS8GX8TrB3QwFLxmij8KkukqX18sb5RikPX7p6HOHiklEGFspgpBsZAl+5Yk/Iy33U3x2p3e0hzqUdGhAEq3+3QF04UM1rJ/RSnEEUmu2lJXBQpfGRtqQpeGwk87U6JxDqbX96McDNAUg+Gsu++gv9Kg1vqy0r7e1d5AlE4JphQgMtOOPb+oVz2VqJC5dpviAYdXgQePpZS/XGJtgczkbulKbXmZLncUjiCtcSf6bQ0DUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6666004)(66946007)(6916009)(66476007)(4326008)(38350700002)(316002)(36756003)(38100700002)(2616005)(6486002)(508600001)(66556008)(6506007)(8676002)(107886003)(26005)(2906002)(83380400001)(5660300002)(86362001)(7416002)(8936002)(6512007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blVKaGdGb2hEbnp1czZyd1FRMVFxbHJONVJWYW5kdmVMTEl6SXR6clF3aWgw?=
 =?utf-8?B?YWF0V0I2NEJTdUM4Y3hBenRneDdteVNzUmJjTHBQQm5oaHJCL3dZbkw3dEoy?=
 =?utf-8?B?UXp1ckdoWmlnejFlQklWN3lNT0ExUGN4aEF0T2V3VW02OFBTdEpvQlYySlhY?=
 =?utf-8?B?TE1KOWY0cHBJYWk3cHlVdjZMWm5GMHNCdXdocDFjNzVvRXJYLzVQeXBwbVFY?=
 =?utf-8?B?K01YMXhBL0xVZVBxcXhCZkpMRy9VMkJEY3JBMDJoUFN0eXhnVUI4NHBiUGgv?=
 =?utf-8?B?MFdQK1FkMUFPM0ovTDVwaXBYOVhZUmxjS3pUYUpOaE9vNGV6UWY2YnY5azh1?=
 =?utf-8?B?R0dmZ0ZEQ1RDNlAzV0w1ZmQxK05xY3dhMG1EdmM3eUhvWFJWQnh0dDRVbFps?=
 =?utf-8?B?Tjl3TXIrNFpYQk1kNDhPY1lrVnp5K0hTU0xMUENyL3VyZ0hLd0ZRM0RmOTZn?=
 =?utf-8?B?eE1SR2JybFZPM2JZSlNZM2xoampRZXRmakxJZHlFd0V1czdyVXJqbUtkRUtj?=
 =?utf-8?B?amFNd2hjT1ROUEpKMENjdDhSMllQb1ZOOURmOUppQ0JpV0d4QjVaNWlucG1Y?=
 =?utf-8?B?UnNaYXFOcTNZZGdoOEltaUVwblV3UVFBYi9SSTF4U2lTMmp6ZFY5cU5SY1JU?=
 =?utf-8?B?WTI0T3JYSzdjUjM0VjdHTUZPZEljdXI4MU9JL2NnY2FydG9oREpQbWFUNy8x?=
 =?utf-8?B?bkZ2WDVOVFhZSld1and6VmZxSklmYzlFM0xiSGpDUzJmM0dyQUJqL2pBdzNF?=
 =?utf-8?B?Unc5bDhVTnR6MytIalJ4eHUybkd3UVpuaDdQdDQ1VnFMekpUcGpnVWJINE9a?=
 =?utf-8?B?eDBFelkvVzh0cE9GVE95MlVFK0FzREt1RjM4TUVpdE1nNXBmRHVRZEkzdGNq?=
 =?utf-8?B?Tm02M0NnTy9PN3RKRFpEN2JoMU1EdDgzUUJDTU9KL3o1N0ZmYWtkYkxzUjND?=
 =?utf-8?B?NThRZU9yVEVGSDJheUFJWmVRbXhKcDJWeW9BVkhqcHJXc2VKbk9leDRmWUsv?=
 =?utf-8?B?OVVwa2RWd3JPVHI2NEhraVhpNFZXeURXazZDYVFYVDQrRHRNREt2b3BuVUJ4?=
 =?utf-8?B?UEVwdEVjZGN5VTcxdjhIY0U4QldnemZwZzlDaGJkU0tmRzFnekRsanhqaHZB?=
 =?utf-8?B?aS83d3EyRjRzb1hDcStTeU9tZ2VPa3BrejdsVTJsVWxvNWNVZllvY1VpelJE?=
 =?utf-8?B?V1NrY1RHeTNIVFdacTNGOTg3aFUvaEd5QTllamJLRGk1UUlUV0RYTUF1SlJt?=
 =?utf-8?B?V01ndUVOUHVOMWFGN0g4Szg4S2FjY0tHTzVGaG9wQnNxT3hIaGhPN05wVCtp?=
 =?utf-8?B?alJuQ2RNR3RsaDZOVnFJbmVmemxaUzN5K0VNSytJS0VaVUZ6ZWpCb0tGVWlx?=
 =?utf-8?B?TkdRS20wWEJWNkRwOVBMODJ0UnRpWGFReFg3MVhIWVR0cE9YeWxtZGswQkI3?=
 =?utf-8?B?a2hqNHdxNXdpTVBJWndZeC9uYXlqMkVMRmN2TUF3THBQckpKc3JnTk5mU01X?=
 =?utf-8?B?Y1JmMFd3bUNnN0RKMDZObFlpelRSMGpUbUxkdktRQkRrd3p3b2Y1elNXb3dV?=
 =?utf-8?B?dk0xcG5pa3RvYU43VDA5TStEb2w4cXlDOVlTekExNkNwUGdzbm9KaHcySVNi?=
 =?utf-8?B?YVpoVEo2YjhKR1dJNGI4TC9TNU8rck15Z3plTUZuS2w0TDhGTFNWNGZocnEz?=
 =?utf-8?B?ZmhvTlF6YXIyTGlZWjI3cmlJaFYrb2krOVAvRDdteFFITUZ5ZHZua2duYUxF?=
 =?utf-8?B?Z3NHOEp2eGNLYW9KQTRYMzNRN0ZUaEFKMWYxeXMxamlhQ2JMa3haUEJsZmFx?=
 =?utf-8?B?VmFRdHd6d1dPMlN3RFkvd3B6aDg5emp0bFJwSXdQclN1V1BYNHh4MHNucnVS?=
 =?utf-8?B?VmRpRUord2ZBamo1NUFuREJPWWhxaG1uRFByNHk1ZW1oVEV1bkV3ME1tS2hK?=
 =?utf-8?B?eml0b0VqL0Z0QjhuazN4NVZyYy9yNFZvQ2hlUkI2WjBKcWhmclYvSE91czV6?=
 =?utf-8?B?Z2crb0NxdW0xdWMzenFQUUhkVWJPWkpwSnhkeE90NFdhMkgxYTdqZjl5TGpx?=
 =?utf-8?B?WU9ESG4reUJWQVZJNDVHaldGdm81Uk1hcDI4dTh5NWh1eFFqbXJqOFBkMSs2?=
 =?utf-8?B?akUvaGhPZU1Oclo3K2hCSllyU281clVjVCtkVmZyTTVQbU03OUpzQjJRVFJ6?=
 =?utf-8?Q?debewpkj36qUnd56cYjTXEo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a349e22d-c9b5-4cb6-485c-08d9f1e9fcd8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 07:49:12.2904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mi5YoCmuEqodTR4B9tXXrBSkA8SNEuwH1vpZ5cNqSG8MgI80GwIvMue7ENTfw0kcOUJviWP2YLroxysNoqkDPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB3009
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10260
 signatures=675971
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202170034
X-Proofpoint-GUID: UrqSvKUo8AcAzv7lUowyLZiLaj-3_lVD
X-Proofpoint-ORIG-GUID: UrqSvKUo8AcAzv7lUowyLZiLaj-3_lVD
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, jag.raman@oracle.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is v6 of the server side changes to enable vfio-user in QEMU.

Thank you very much for your feedback for the last revision which
helped to streamline the overall design. We've made the following
changes to this revision:

[PATCH v6 03/19] qdev: unplug blocker for devices
  - removed test which prevented an unplug blocker
    from getting added if migration was in progress
  - added comments to function

[PATCH v6 04/19] remote/machine: add HotplugHandler for remote machine
  - changed commit message prefix from vfio-user to "remote/machine"

[PATCH v6 05/19] remote/machine: add vfio-user property
  - new in this series

[PATCH v6 07/19] vfio-user: define vfio-user-server object
  - fixed typo noted in the review
  - moved error message before setting "o->socket = NULL" in
    vfu_object_set_socket()
  - added "vfio-user=on" to the usage comment at the top of file

[PATCH v6 08/19] vfio-user: instantiate vfio-user context
  - added error message to the object set property message when
    server is already running

[PATCH v6 09/19] vfio-user: find and init PCI device
  - added more detailed error message for device unplug blocker

[PATCH v6 10/19] vfio-user: run vfio-user context
  - send ID of device in VFU_CLIENT_HANGUP instead of path
  - disable FD handler in object finalize

[PATCH v6 12/19] vfio-user: IOMMU support for remote device
  - new in this series

[PATCH v6 13/19] vfio-user: handle DMA mappings
  - Setup IOMMU for remote machine if vfio-user is enabled
  - Map/Unmap the DMA regions in the IOMMU address space in
    dma_register()/dma_unregister() using
    pci_device_iommu_address_space() function

[PATCH v6 14/19] vfio-user: handle PCI BAR accesses
  - vfu_object_bar_rw() - directly access the bar region
    instead of accessing via address_space_rw()
  - register handler for PCI ROM region
  - set read only flags for read only MemoryRegions with
    vfu_setup_region()

[PATCH v6 15/19] vfio-user: handle device interrupts
  - setup separate PCI bus map_irq and set_irq for
    vfio-user during remote machine init
  - index hash table using PCI bud device function numbers

[PATCH v6 16/19] vfio-user: handle device interrupts
  - new in this series

[PATCH v6 17/19] vfio-user: register handlers to facilitate migration
  - enable streaming for migration data instead pre-determining
    the migration data size at boot
  - dropped migrated_devs static variable to track the number of
    devices migrated
  - added helper functions to independently start stop block and
    network devices
  - updated qemu_remote_savevm() to migrate data of all the
    devices under the target device

[PATCH v6 18/19] vfio-user: handle reset of remote device
  - new in this series

[PATCH v6 19/19] vfio-user: avocado tests for vfio-user
  - use QMP command for hotplug instead of HMP command
  - confirm the state of source and destination VMs after migration
  - testing megasas device instead of lsi53c895a as lsi53c895a
    doesn't seem to support IOMMU, which is enabled by default
    on the server

We dropped the following patches from the previous revision:
  - pci: isolated address space for PCI bus
  - pci: create and free isolated PCI buses
  - vfio-user: set qdev bus callbacks for remote machine

We are looking forward to your comments.

Thank you very much!

Jagannathan Raman (19):
  configure, meson: override C compiler for cmake
  tests/avocado: Specify target VM argument to helper routines
  qdev: unplug blocker for devices
  remote/machine: add HotplugHandler for remote machine
  remote/machine: add vfio-user property
  vfio-user: build library
  vfio-user: define vfio-user-server object
  vfio-user: instantiate vfio-user context
  vfio-user: find and init PCI device
  vfio-user: run vfio-user context
  vfio-user: handle PCI config space accesses
  vfio-user: IOMMU support for remote device
  vfio-user: handle DMA mappings
  vfio-user: handle PCI BAR accesses
  vfio-user: handle device interrupts
  softmmu/vl: defer backend init
  vfio-user: register handlers to facilitate migration
  vfio-user: handle reset of remote device
  vfio-user: avocado tests for vfio-user

 configure                                  |   21 +-
 meson.build                                |   44 +-
 qapi/misc.json                             |   23 +
 qapi/qom.json                              |   20 +-
 include/block/block.h                      |    1 +
 include/exec/memory.h                      |    3 +
 include/hw/pci/pci.h                       |    6 +
 include/hw/qdev-core.h                     |   35 +
 include/hw/remote/iommu.h                  |   18 +
 include/hw/remote/machine.h                |    2 +
 include/hw/remote/vfio-user-obj.h          |    6 +
 include/migration/vmstate.h                |    2 +
 include/sysemu/sysemu.h                    |    4 +
 migration/savevm.h                         |    2 +
 block.c                                    |    5 +
 block/block-backend.c                      |    3 +-
 blockdev.c                                 |    2 +-
 hw/pci/msi.c                               |   13 +-
 hw/pci/msix.c                              |   12 +-
 hw/remote/iommu.c                          |   78 ++
 hw/remote/machine.c                        |   54 +-
 hw/remote/vfio-user-obj.c                  | 1286 ++++++++++++++++++++
 migration/savevm.c                         |   89 ++
 migration/vmstate.c                        |   19 +
 softmmu/physmem.c                          |    4 +-
 softmmu/qdev-monitor.c                     |   26 +
 softmmu/vl.c                               |   17 +
 stubs/defer-backend-init.c                 |    7 +
 stubs/vfio-user-obj.c                      |    6 +
 tests/qtest/fuzz/generic_fuzz.c            |    9 +-
 .gitlab-ci.d/buildtest.yml                 |    2 +
 .gitmodules                                |    3 +
 Kconfig.host                               |    4 +
 MAINTAINERS                                |    7 +
 hw/remote/Kconfig                          |    4 +
 hw/remote/meson.build                      |    4 +
 hw/remote/trace-events                     |   11 +
 meson_options.txt                          |    2 +
 stubs/meson.build                          |    2 +
 subprojects/libvfio-user                   |    1 +
 tests/avocado/avocado_qemu/__init__.py     |   14 +-
 tests/avocado/vfio-user.py                 |  234 ++++
 tests/docker/dockerfiles/centos8.docker    |    2 +
 tests/docker/dockerfiles/ubuntu2004.docker |    2 +
 44 files changed, 2088 insertions(+), 21 deletions(-)
 create mode 100644 include/hw/remote/iommu.h
 create mode 100644 include/hw/remote/vfio-user-obj.h
 create mode 100644 hw/remote/iommu.c
 create mode 100644 hw/remote/vfio-user-obj.c
 create mode 100644 stubs/defer-backend-init.c
 create mode 100644 stubs/vfio-user-obj.c
 create mode 160000 subprojects/libvfio-user
 create mode 100644 tests/avocado/vfio-user.py

-- 
2.20.1


