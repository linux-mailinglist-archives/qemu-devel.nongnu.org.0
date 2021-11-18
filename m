Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C27A845595E
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 11:47:43 +0100 (CET)
Received: from localhost ([::1]:41054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnexB-00034S-PU
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 05:47:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mneuk-0001G4-QK; Thu, 18 Nov 2021 05:45:10 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:24838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mneuh-0006oJ-7C; Thu, 18 Nov 2021 05:45:10 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AIAZA7V025611; 
 Thu, 18 Nov 2021 10:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=2CEE79zbVhWiC8HZ0tYBAG88xtWQHKlRgSwDE1s6EOM=;
 b=MziVuCsEy3gZfZ6bTAGM6IAsxIgCRQA+6XDWjZGm8nn06ntMdsXJwD8jZCpglOqsTpbJ
 H2YTV7Me5bQWK3lbnMqcKDrNETz6isMSzJzsYeC1gALDpRVVJQl8oQBwE59Iy8bqKqc3
 9h3iBg/LW9VI9m1rYVdjfZR/MbfR9tbRPPsx5nfxkyxdZE38QMRJxxbTP2sYjqunwsou
 ESzVQ5U/zMwUn5skWPxCpGzyY8jcy+qpsWsPUof78CmDOgFeTpkfFMzFudTQVRHh9lTq
 DgsXFF7T5BYRkbv9vQTswHTwF6JirJtzXp8EUZwUIVaiR0+F1tfiv3tXNKWdRh7jLTUA 2g== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cd1w86re7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 10:44:47 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AIAaXW3182114;
 Thu, 18 Nov 2021 10:44:46 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by aserp3030.oracle.com with ESMTP id 3ccccrhvkk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 10:44:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hObi7WXzeeEgcqXiyZaGU+6ygkikzTAXKwOdiw8Pu0isP9SnHpygkal6jxiMAs64iOLwK7ntiWRYkUmcWRTjt0Bsk+MwgmfPftYlTl6L6D+J2iGU9uSEKRiF1RGIYRjVdUTRIAqgSriTNLgml5OGdzEnomDV58jb3Nir6DXwnuWztdVdX43UOCkoQb1DAhLIuhdI6QgkJotsTcGtK8dlUa5/iDqud8CZ3OERZ2k+gQA4+MJd9s9UfiCK+nzKwOMx23MUZudN6V7OpK3ssXPF/GW0LvIT4p61jNffbFhU1sX6kgNN4jTDFx0YG5WpWcVV4AQXQ2dSwsLfiQEusUf8ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CEE79zbVhWiC8HZ0tYBAG88xtWQHKlRgSwDE1s6EOM=;
 b=JTCDIu+hbL75GoNvMc6xbzCXjRsgIF6FygVD7vd7r8in1O4OFmotbTLlRUO0PN0+nfHWkQcIrN5EIXhYmlS7wAPUMH1f5hSmgrv+1qiUJJoknlN2MxqGgyDXCoRIUQCeeuDhwoMjyXxdB8pMtXFRdXzs6yL7TM89zR8kJctTJcUTB6KhUbau8USmnvbhiG5qCGd8A+NMdMF0KqG0TJIw0d48yHXbLa4E0Excq3NKlrq8YbUtwChBdcz5N8cC2ltJ0H7xZMf9TxoaDzGLbtq1YsMfSdRku17cqd0vUoY9enasc2zjK3lE1s/B48T/cKfU+mABHjcvhvA1EcGLQXQNYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CEE79zbVhWiC8HZ0tYBAG88xtWQHKlRgSwDE1s6EOM=;
 b=iKbbuczMWN6g5anoLPpZqaNjdctgBhEWVgUNQXNM+l0VpXsJEFeyu4+ZJR8wGEos9aG/TwB86TDZHmCmTO8tPhBTP+bTgmUBon92RvDYARwpNVYkkVAFKvecRkIlqcSdSvwuc7f7ZoG2kpuzv6OschPKqGTLsMYl60VZPkMpadE=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by MN2PR10MB4048.namprd10.prod.outlook.com (2603:10b6:208:181::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 10:44:44 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::9418:7fcf:86ec:e0f4]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::9418:7fcf:86ec:e0f4%7]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 10:44:44 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH-for-6.2 v2 1/2] hw/block/fdc: Kludge missing floppy
 drive to fix CVE-2021-20196
In-Reply-To: <20211117232422.1026411-2-philmd@redhat.com>
References: <20211117232422.1026411-1-philmd@redhat.com>
 <20211117232422.1026411-2-philmd@redhat.com>
Date: Thu, 18 Nov 2021 10:44:39 +0000
Message-ID: <m2pmqxn3oo.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB7PR05CA0026.eurprd05.prod.outlook.com
 (2603:10a6:10:36::39) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
Received: from oracle.com (46.7.162.180) by
 DB7PR05CA0026.eurprd05.prod.outlook.com (2603:10a6:10:36::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 10:44:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 515453ef-56a4-42c3-c65a-08d9aa806ebb
X-MS-TrafficTypeDiagnostic: MN2PR10MB4048:
X-Microsoft-Antispam-PRVS: <MN2PR10MB404889FE56B212131C72A4D1F49B9@MN2PR10MB4048.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KMacLzJEQtouKDeSQjrCIK70ZfKXKVcCrMPSdCUys4DIYu+aWdWF4xNe+LMEbr0BCKGjDRaT3+TA0XQlIgH1iEv5NrpuGCyY57cttCzKPRQ9cfl5/+udDY10jgXNzLbDynmxYY5TRceg/zZqX6QWu3oUdVR/J6GBiY9IxCvKii49A9FqK3AgsRzJdwh0UYYQFCmYLpPtBsjzfTyv9VHqovJ40x6Bum8EW0ao1fkxOcIKwY/NvrZ6YA4xOtN1aeFeU+YmbTnvQzsBsibkItPEnm9g6IJweL89WURbJkhscKZwnWJuAmAh9TgettN9t5a1dJ76p0X1CFIXUFgXdhVF2nBX7M7hiafku0bZeLz0GtcIepLyRmHfvaESQD3n7kTVAYLVA+vd8DQz7BSIWtzsz29nH/ujqPvcKKzNX11jhVuYaYew2hkatLP7aBpD2FkP7JN9ZzdoOpq9XpsosvwSsors4ANVLfYdTuMUbCUx4fHpjBiW96blXVFxPOlIEe8mZsPyxMEgfJUbBa5TZvlrDKSriOVPgBBT5WwNJkv2yIO5E+/4VswPg8mKhLiLC2ng7YGJafT8lXUPJa/PaDzyW4sJx9VuHovkp2pachagfiWJ0AfZsUioBJwjC0DuTzvOZ3FfBQl73v303PqHr0/DCHQw0DNGbixiB+HZwWGTpTZy1X+dFU3oHKk34mof0AFrQbO3va/VafFC/57KSGDGFwjQ43U7ONfTE9rAX/lL8pUK2hobunlIUwcX2vqW6S/RMTJV8QRSuN+dCHcdw0r8TaFa0YQ5quJyK3Cjl5Bd6CCKBhUUCJmSZI2tdSwXc8xOAmHIFoDTg67w4PzTmqnhgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(8936002)(83380400001)(2906002)(186003)(66476007)(316002)(66946007)(4001150100001)(956004)(66556008)(966005)(4326008)(8676002)(44832011)(508600001)(55016002)(5660300002)(38100700002)(38350700002)(6666004)(54906003)(8886007)(52116002)(86362001)(36756003)(7416002)(2616005)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXp1OGdVNG54TldRZXR3cW5GcTNMVzdoSThPN29QY0NXeTNOM3lySDVkKzR6?=
 =?utf-8?B?QzMyQURSTCs5b014Vm9wN1dINW1kVng5ZlRFYWRjOC9uSm8vOTlHQ2ljWXhE?=
 =?utf-8?B?YTdaY0JlSHVvOWxucWkxUVo5aGVjc0VUdkpiT244TXRqeEZRRzhBM0ZVaXRO?=
 =?utf-8?B?K3lWUkp3bVBQR0pVM09NWWF2TkhFb21Wc0l6cFBudlpUaVIyTCt5TnRpYTUw?=
 =?utf-8?B?MTlBSXJRRnUyejVoNGtabGw2cjRSMUo0MzhoTDdTUGM3NWk5TkpQMUV6bms1?=
 =?utf-8?B?THErWjRYZjcwOUQ3amtrdjdLU0JadERNOUxPSU5iam83VW56OUp1SzFWVk9Y?=
 =?utf-8?B?b0JuNXlYK2pQYndNUnRrTThoRjJwU3JCRytxNFJOQjZzWGduYUU1NzNYZ3RS?=
 =?utf-8?B?L205cHV2eXc1czNCMFpCdGszc01Bd2VTalh0MEZvbkhlaTcrZXlpcThVWGNw?=
 =?utf-8?B?U0hlODJEYXkwYXM1Z3lWT3JNdldmeit1Q2VNZWJPVC9DZTRIaVV2OHJRQjRx?=
 =?utf-8?B?RXhibDBHcDNYNmFaNnpxQTZ3Rm9rZnE0NUlDVVZxaXJLdmZmUHROeHZqK2M1?=
 =?utf-8?B?Uy8rZTlQQVgyZWtQc3BNTjhVblNMS29rY1FqOHpxWXM5UDFQRTllYU1LMmhS?=
 =?utf-8?B?NXFnSnM1T1Jybm1mV0crYWlobTlrbzZHL3BOZWY4ZXY4c2JMckZzYU15RDRk?=
 =?utf-8?B?UW9kR0IyOE14bFlBTjZvRVVETmxJRjFHVkZMVlpOUjUxU2IxNGVuc0lEVHU2?=
 =?utf-8?B?K3pwQ290VXNhSmIyRjY4M2l3QXgvMTUrM2sycHZSM3Bjcm8rTzVYc29JdWg3?=
 =?utf-8?B?QXAxTmI1ZFFsWlh1ZU83eFJrVElxV1gvbExPS3dPRlhPVHR6VGNBSldHQWVY?=
 =?utf-8?B?bCtaSDQ5WUdnc2VadVRBQXovVXBkdTQ1SE1qK2Z1NjY2cjRhaFJxMW0rV085?=
 =?utf-8?B?VTc4WTVQdmVES3JwSVJtL1Ryd2xhTVFvblE2emowWnFycnl2SDQ1NndObE5m?=
 =?utf-8?B?Y1JwQnZCbjdJdWg3NkdQZ0dDUzAyQVBERkdkY1pZMkVVU3BzbjYvRFZnRzZK?=
 =?utf-8?B?NG56bnlUZ2hzNDRPNXk0YzdPK2RRR1NOOGg4TXZKdTdJcDZObVJoQWh2WUJV?=
 =?utf-8?B?UitHY2Z3SG9pUVdhclNFSTdGejZsTko0LzA3blJ2UW9iZVNRKzF0VDl2Q1I2?=
 =?utf-8?B?UzNNRlpadE9RamFZalRadmtqcTRsWExGM3RJeFErNDhSVnpPbTkyMTI2bEg0?=
 =?utf-8?B?aDIxWktEenNRZzVQeUNHaXdyc2tZOS95YXYvTG9QQjB2L3FidWp6bUhDTTZ1?=
 =?utf-8?B?Mm9heVNLSlJuV3dZV2RZRE1kN1llRk54dFpacGhiNlBGWGxmUUxKM1I0c3BT?=
 =?utf-8?B?aGlxdE5rME5NdllIMVJsUHBVK0JpTkVaUWJ4Zm56S21mVEgvaENrdUZSOVRa?=
 =?utf-8?B?K0RLc2pIMllyOG1jdDJMQ3MrRjVhT1dncHIzbmpvWU5LU1B1MFYrMnZRRmpW?=
 =?utf-8?B?WGJnWjgrbDI0QVY4R3dwOFE5Q2NFampDYlRldXlMcWJEU0lkUlo4emZiMEFZ?=
 =?utf-8?B?VEFaR3NrdVlKbFZSRUNBRDk0U3lGRVFKaW9CcWpyRnAwaTVOUVhPVk5VRzFt?=
 =?utf-8?B?K3BuMjhISjV1WngreGhITXRtSnpBQjJaa3lDTUVBeFBsd0Y0ZjBHaUNKeHFq?=
 =?utf-8?B?NjNlem1QdHFPNHlxUzVtU1ZkNlFhNWhFRUtoTTIvUzBWaDRxKzhCczdydjdZ?=
 =?utf-8?B?c3cvWXQveXdrSFcwSmtSekJ4aWVpYVM5c2FDbDcvNzFrc0lqM0hUS1AySmhB?=
 =?utf-8?B?ZEp1WHI0Z01sTS9DbS9PYU5jVFhzZk1Vd25kdnYvZXVuTWNrMzRqWTlhVU5o?=
 =?utf-8?B?TGF1am41bjAvOVc1Qlp3VGp1UzNhemI0clVMYUR6MEJvQmpaMjNwSTJpTXZL?=
 =?utf-8?B?NWJZTDRoRzRFWUF0MkNCMUNVcDFobWI1L21ROXJaM2JrSHNlL01yU1ppTGIv?=
 =?utf-8?B?UUxhUGhabHllVEErOE9DSVJmZU1jYWRWQlRKOE16SEtDNHFURGdmc3BjMjVm?=
 =?utf-8?B?dXBGS2Y1dnZtZHMrSnFLak9UOTZPNDNETVBpcVBhSGVsdTkyNWMxbWFwZkFq?=
 =?utf-8?B?dFhqcEdxbktrSjczS1VIaEZSWXdINE4zWjAyTHFjeHRyd3JwNHVpeXZXTWxY?=
 =?utf-8?Q?XPaq0Jr4iHkGuAD+IMHOPa4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 515453ef-56a4-42c3-c65a-08d9aa806ebb
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 10:44:44.2271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uBHt7UUyW3DsnmSjg366Xd8HkNGlpQ9Fh8AeBhZIIyMIh9TatR7ZRUjxkVYbxGGQZow6PiJobhhO2cCTiCnqaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4048
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10171
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111180062
X-Proofpoint-GUID: LE4cSd4f__CPitA2slMbYsA-8vEb2nGf
X-Proofpoint-ORIG-GUID: LE4cSd4f__CPitA2slMbYsA-8vEb2nGf
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gaoning Pan <pgn@zju.edu.cn>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

A small nit below, but otherwise looks good.

On Thursday, 2021-11-18 at 00:24:21 +01, Philippe Mathieu-Daud=C3=A9 wrote:
> Guest might select another drive on the bus by setting the
> DRIVE_SEL bit of the DIGITAL OUTPUT REGISTER (DOR).
> The current controller model doesn't expect a BlockBackend
> to be NULL. A simple way to fix CVE-2021-20196 is to create
> an empty BlockBackend when it is missing. All further
> accesses will be safely handled, and the controller state
> machines keep behaving correctly.
>
> Fixes: CVE-2021-20196
> Reported-by: Gaoning Pan (Ant Security Light-Year Lab) <pgn@zju.edu.cn>
> BugLink: https://bugs.launchpad.net/qemu/+bug/1912780
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/338
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/block/fdc.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> index fa933cd3263..eab17e946d6 100644
> --- a/hw/block/fdc.c
> +++ b/hw/block/fdc.c
> @@ -1161,7 +1161,19 @@ static FDrive *get_drv(FDCtrl *fdctrl, int unit)
> =20
>  static FDrive *get_cur_drv(FDCtrl *fdctrl)
>  {
> -    return get_drv(fdctrl, fdctrl->cur_drv);
> +    FDrive *cur_drv =3D get_drv(fdctrl, fdctrl->cur_drv);
> +
> +    if (!cur_drv->blk) {
> +        /*
> +         * Kludge: empty drive line selected. Create an anonymous
> +         * BlockBackend to avoid NULL deref with various BlockBackend
> +         * API calls within this model (CVE-2021-20196).
> +         * Due to the controller QOM model limitations, we don't
> +         * attach the created to the controller.
>
The created .... to the controller

Something is missing here, maybe 'device'?

Thanks,

Darren.

> +         */
> +        cur_drv->blk =3D blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL=
);
> +    }
> +    return cur_drv;
>  }
> =20
>  /* Status A register : 0x00 (read-only) */
> --=20
> 2.31.1

