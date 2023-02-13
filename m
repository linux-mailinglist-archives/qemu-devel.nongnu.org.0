Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DBD694867
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:45:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRa4Y-0007jg-KB; Mon, 13 Feb 2023 09:44:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pRa4O-0007jF-71
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:44:40 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pRa4G-00063P-Ma
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:44:34 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DAUpXB014784; Mon, 13 Feb 2023 14:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2022-7-12;
 bh=V1ucDSpsiGZKjPIqlDNgYqGEJ6ijHxYWq5rlWzzNglI=;
 b=0N++R18KJK52w/NVa42CAQ4M6bQ13fZuaaMOBGXBRTzP3R6FrmmODQC7em9nZtlw0bEF
 SCsP4JsHR5MXjYyub2fI7KlQG8tPqZxLEpqczWanqCqayEPUOCIQf/I4uMBf8kwN8liG
 fmWBgmj8wREl8WjZVdxPiTsQIeXZ5QVR21ZMVTs2oAFiClOhxPZ6k3KlTD8BCeqJ2kT+
 LuvJIXv2Aj/UJP4Ao/Y1rAnqG6DWLwWBctqcXindexMSfVhnVYKYQ3QpETuo6NibTaOj
 FmX59cO213iv9IOKUmJbOhgQXKtuERRmo8VUVHEA+OCdzG9fynRUAXdBNhjZrG5+SBIS eg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np2w9tws8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 14:44:29 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31DE5l2j028234; Mon, 13 Feb 2023 14:44:28 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3np1f46nfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 14:44:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrP0h9fXcW/s1/NXkW/N3GhqaObzW8hELqF5yP/4bgsMJ2z1ywtOVP+OOFqm7oDMnkZ6cHvDjMCc2sztqOlNs02QmQkZzyxmCgmEuzzHV7RERWuBKCV0hilBESojf+4yHQhiqL5moLJywCZuFMmLVlMnFKDXCrL6MZ+ry2WH5ad89FBUL13O1B3lzdVw6MvaoO3fzt2DdrhoDAxtXh3MilS6KHsrcteeKywFn0m8YjMedKyAnxFUW8Qxl+mqvIZG7j8qpjoK8csclcmJ1ihWW3G4M4rJrvJiZ1wJft3sjCBELwvgalklbN7IYE7boQdD4YJs7MpNoXNJiCeoEnVpag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1ucDSpsiGZKjPIqlDNgYqGEJ6ijHxYWq5rlWzzNglI=;
 b=iMvHcnF81H2sEAnjlINuqq28p4umvQ3gzOWijBUe1eDFgvK4jw3FM/RebveXVP5FrikhrhotYweyXqFJZPaB6otLyexTfIMMFzGF6V5bsi6m+hIbJsS/86QJXkhhX4iGfETr1XlApN7HVsh4Uj8T2+hbfR1ky6WROf5dg5pl+2NYGIn9HaIsy+vOgJ9RdwxGjoli3YEVLPRblmHE7s/2jCt2oDxi6yc6WnVIEr6Zkv+8yrjv7C+OhUH+1VR5GVKZkFyEJ/AeHht4i05MeQ30nmanHObYiPnsP8w4gG9JCQcAIfCz7i0FpAenDL/1A1LZ7+bTGpoZxJOpeq4+3R6yiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1ucDSpsiGZKjPIqlDNgYqGEJ6ijHxYWq5rlWzzNglI=;
 b=ay3gb3h6OEmzo1VUf81prnxffDxtL0QvsOyooYkjKsSu2ukoCuwgF0sYQtx2p/SmINFpjT9pINpGd/OdKxV5DlcRkG9QxQJ+lSKAfYNEWrsgabSenvDwXHvQRhPYXsx7CSv3niB3DTrNebfAUzDvLRHf6dgAuSyTtht0x712fuQ=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by MN2PR10MB4352.namprd10.prod.outlook.com (2603:10b6:208:1de::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.9; Mon, 13 Feb
 2023 14:44:26 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3%7]) with mapi id 15.20.6111.010; Mon, 13 Feb 2023
 14:44:26 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 06/10] fuzz/virtio-net: remove fork-based fuzzer
In-Reply-To: <20230205042951.3570008-7-alxndr@bu.edu>
References: <20230205042951.3570008-1-alxndr@bu.edu>
 <20230205042951.3570008-7-alxndr@bu.edu>
Date: Mon, 13 Feb 2023 14:44:21 +0000
Message-ID: <m2fsb9r5fe.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0010.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::15) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5138:EE_|MN2PR10MB4352:EE_
X-MS-Office365-Filtering-Correlation-Id: 06a35158-047b-4258-38e7-08db0dd0cddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dNziO6Xb/6XbAYq22Hncw6lzfKWKu8MGCtK5tLjVx0YZuLUkDVjkGW4yWSVsYnunSBWnxQe52iyDDZ7txc6/e0LAXyCed00S6F8fdXoyT6Wk6upe8WmLwJNA2fyj5tyY3Ac44Kt/XbZhMxAb3lQWT22urOUsgCTRQhbpPbFzuNPqg++pwuSxR+TTD02KPsxWWJeZE9fELM4nlucnYY8pwqhtJpp/GY+q96EikBaEMIVjd4VHYzYqDsmG7SL2CnSZ95Ea+9pVm1boUBRRW+9l7eneL+IUNNpijlhCMWo58te4AgrG3+hVlEZF9vT0BP34Xj3QZAGzAlmtmTrKAjZjW5z2BBAerceFWmr9kWu2kJ3vHC1GDIbTTUkBdE7SCIauVwRs80QrrNYD/orI7s2HQO1NFfch+V7WFAmB5IbANUdZH6HsuOJdJ7Hov7+KY16FaTyjn6KqjJMIImZVSr6K1jGXvleAPyUKqdSR6a/tpLUM6reZEf8RVqgqetuggAHLyPM/E57u2JYpYVNuxu53AECPj/UF+fZx/fEXFDjirqHe8DQxwB9UrowplfefsCHWRHTpj+Pg+jN8W6jOvCfjnSht6sSzdB7IKE5Qu2Z8FGN6/udaA4HrUSr36DIBwwq1u+RL5sKJXwzCCrrysOsHXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(396003)(376002)(366004)(39860400002)(451199018)(36756003)(86362001)(8936002)(38100700002)(2906002)(66476007)(4326008)(5660300002)(41300700001)(44832011)(8676002)(66556008)(66946007)(83380400001)(2616005)(54906003)(316002)(6666004)(26005)(186003)(6506007)(6512007)(6486002)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qge2eIel1vKtZLc/CvI0ZVJVgSUO4skKUFs8cYpfCVXkQHDJi7x5rjeCCQJE?=
 =?us-ascii?Q?ef8MLVsniysPkSFS5aSO2cm5UVOUTt2rXoGgQH2ERa3eTK7oj7WDSvOwTnQn?=
 =?us-ascii?Q?zXlB+FHEqO8BE0KZJevQjc+34L9fA1fWHu54CySKNLCGk65XKMco/UNjwvyB?=
 =?us-ascii?Q?J1ul8CEVPjU/MUzyHKJCSLhrBSJr1JxeikuJHLLersCEcqti2ykg1uuZqtqZ?=
 =?us-ascii?Q?uOmv5rA6RNg5EzxTQ570HkUPwsLvJk7rTSx+DDqFDaeyFhmMkuwwRblMvGoa?=
 =?us-ascii?Q?X4O9eQqyNjWB9R22qJOg5snkMSeT6Zl/5qPEPXinSaZ6/RMZGBQbhPC4Kdsi?=
 =?us-ascii?Q?x2LzeOgpHUDeQ+FLq0a3meX7nN1SS7IOsjdASbRjbl1ZNYa31UrFCO3qito9?=
 =?us-ascii?Q?z2QumLQ0teITAzrvWlRZT5FRhlg+RNSxDOrhwUvTdFv/1UJLEq0K40vjcfnG?=
 =?us-ascii?Q?8l67zwzEnP5yjdQGqHmmnCTci6Amy/bzBu8v4vhuvfc5prfSYEF0IF1NS8iS?=
 =?us-ascii?Q?55GYlH6ODACmwyRbk+JYv4532TTbe3OsIKwTiueNzzP1ye6WS00x7tXXWqWA?=
 =?us-ascii?Q?bFMcKSXaPT8Qd+mPCM+ADLCrDx9pPI8pbzziDBOHIQDYTaf0s77bfZSVUOvc?=
 =?us-ascii?Q?8fZr+rwyleml/s0LN5tkCzuw00itfoAakmPRWipvyCzCwPL18cuUuLLYryGi?=
 =?us-ascii?Q?te7hUErAmgCIZ9EoGU1ZitNQhCVhPhYKPe7tD0UBn1VDUdHJq/zj8K6f4M0t?=
 =?us-ascii?Q?ohSJBQ8iM4QrFZXwlN6zpx31hQt2Z6u7PWtOGA0Yr9H8gJBD7OMKS6feikM3?=
 =?us-ascii?Q?VbSftsFx0qSviwgMcdaeEqKgk+1GGLFU+6WGsKalt9Xrf6Ym/VRAZKvsqjen?=
 =?us-ascii?Q?kLE6nFAb/HYCYbjlum/IKLmmdrKi6KfsjUXAM3+JGnZt1RvjJmO/Yil7sclW?=
 =?us-ascii?Q?zM9IIPDF/SymVPTnU3sWyLQuzimpn65L1xbP2fs5QkNenSJVwssIq0rvvg1m?=
 =?us-ascii?Q?mBooyvVPSBOWVefhcBNfCQjxpqE4KJz6HwBARMK4eR9Uu8w4PoymDBp2PIMF?=
 =?us-ascii?Q?uzCzNPnkaVNHVhq5XtjrC7uMAIIbOZNAwSUi/ws0toCFoM9MSYP372WvJqqE?=
 =?us-ascii?Q?Z2Cm2bS19VFmbX5vhUgFQh/Z77/nIz9Ctnol90Z1/M+HD+xnphrJOMe/2mNM?=
 =?us-ascii?Q?P0rgHpVqTHBds4G/+/MzSqik4S7GXMWsIfXnG4Lndrdx6bRl7bQBcyL2QQMq?=
 =?us-ascii?Q?dgcWsJoSJmf6rX7HfW3E8z8wb3Po+aQNafy4zwHapA8HpIoXrha4cEuAIOrO?=
 =?us-ascii?Q?RtmuLDaO6V1T25fvT9Y4bw53YCz1VLniHBRZ/mCb44GxwfEcC1jLjO42mPDk?=
 =?us-ascii?Q?TZNJyrvHXRjl0D71LNm5NezF6iFCj1zBQVbHa2c4ZdYrVf+Z7tuIoLE58iI6?=
 =?us-ascii?Q?XaBCAMOEn9UT9sUvCaMM1uHeJXjUI3R7p6NcXpQidmiiK8l5iHbhtl7KDuRG?=
 =?us-ascii?Q?q66uYWOaBHgAP1xvalnzlceofqmS/KPi22sgMh/ljuRyePsqG0upsxVG+LzB?=
 =?us-ascii?Q?BJFkC956v6x+aZ34olefNvH0i0MOGwR/PcL65/oYdPAFqUgegoHwxQi1JBne?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: zC4UHyrRcSay/pHKJ2B9SQOcbN4xk3FIMRbZR29EQD04sVAGBKpXzKw88Ycw4bt8Oxb54m1reLtdVWWn8bRPgHTeq+AHuD8t+4YHP7NJLrL/L6rPwCHFgfrYreYkG+Z5swiYHzeTpjjTV3KSdr5IXX5Es/BvnZ0uIVArU6AyRC2+AMoECUW+fBqrybKc0NLai6K5P3c/Nwu6FFmYNzQMRwBDFUuNqAjEmEAIg04K+b14QAWhM7zAX/ACca3u/6Z4QxOWZwlk3qfAXRNXpYBpo9MU1OGSOE8h359IJ508fjWF6eH/UjvCQ40cRwMCrNeSPY+MHWU0MGpRUL/+kz+g6Pf9PP3dvYihdIhFVITGXwObSxVXaKt7lN3TEcV3liyPVPY6f1OosKdC39pC814jf13wJdWAjPObJJkaQzW4iRgoWeu45/k40yy8RNiXDDqBweTZpD8xwhmsYlFG8wjwjA4sfQ3jBQWMfBLN3+9whQLipyFN8whEdIvWNlcRYMrbKMNxh3rusz8q7Tzj2dtxUz9s9OpIcYEHLsZSipzBQ5sGwQ7Rb3mlWUF2vFombo0MAUjOMv/pkcWIdM8hPzif6k9adWUsLvxOMtORAycga9lMWIVNuOBV+s2tfHFw64PZ7QCEuAJKDo7UBaq8Rf4E6nFEHPROr9TWXPNj+Yw/pw7b1M/mFb0Wmov8hn/9xUI2ft+zgvHyfki/gYkNmSQ+TbBoUEq17XsFGyRk17Cf8NWfKk8WJGMohd0tarL30zs3igMxd2aHQIsjsLVEC/C2ENbrf/9qnWKcwN+ijra8vS/LlGoCt8ceK2oDoO/pMaq12NQg0FwkwcdVGAah1DrQvg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06a35158-047b-4258-38e7-08db0dd0cddf
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 14:44:26.4200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rK8LT863TS4BxR4UT1MbntK2Rwcafed2EXbK/MhqyiKWxmOHpcQu26nwCv9bBWB5jbum/rPS9suaWxhTTnS5/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4352
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_09,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302130133
X-Proofpoint-GUID: ng30iXGY6PbDTgSLTkO7iA5nJkXp2i5I
X-Proofpoint-ORIG-GUID: ng30iXGY6PbDTgSLTkO7iA5nJkXp2i5I
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Saturday, 2023-02-04 at 23:29:47 -05, Alexander Bulekov wrote:
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren.

> ---
>  tests/qtest/fuzz/virtio_net_fuzz.c | 54 +++---------------------------
>  1 file changed, 5 insertions(+), 49 deletions(-)
>
> diff --git a/tests/qtest/fuzz/virtio_net_fuzz.c b/tests/qtest/fuzz/virtio_net_fuzz.c
> index c2c15f07f0..d245ee66a1 100644
> --- a/tests/qtest/fuzz/virtio_net_fuzz.c
> +++ b/tests/qtest/fuzz/virtio_net_fuzz.c
> @@ -16,7 +16,6 @@
>  #include "tests/qtest/libqtest.h"
>  #include "tests/qtest/libqos/virtio-net.h"
>  #include "fuzz.h"
> -#include "fork_fuzz.h"
>  #include "qos_fuzz.h"
>  
>  
> @@ -115,36 +114,18 @@ static void virtio_net_fuzz_multi(QTestState *s,
>      }
>  }
>  
> -static void virtio_net_fork_fuzz(QTestState *s,
> -        const unsigned char *Data, size_t Size)
> -{
> -    if (fork() == 0) {
> -        virtio_net_fuzz_multi(s, Data, Size, false);
> -        flush_events(s);
> -        _Exit(0);
> -    } else {
> -        flush_events(s);
> -        wait(NULL);
> -    }
> -}
>  
> -static void virtio_net_fork_fuzz_check_used(QTestState *s,
> +static void virtio_net_fuzz_check_used(QTestState *s,
>          const unsigned char *Data, size_t Size)
>  {
> -    if (fork() == 0) {
> -        virtio_net_fuzz_multi(s, Data, Size, true);
> -        flush_events(s);
> -        _Exit(0);
> -    } else {
> -        flush_events(s);
> -        wait(NULL);
> -    }
> +    virtio_net_fuzz_multi(s, Data, Size, true);
> +    flush_events(s);
> +    fuzz_reboot(s);
>  }
>  
>  static void virtio_net_pre_fuzz(QTestState *s)
>  {
>      qos_init_path(s);
> -    counter_shm_init();
>  }
>  
>  static void *virtio_net_test_setup_socket(GString *cmd_line, void *arg)
> @@ -158,23 +139,8 @@ static void *virtio_net_test_setup_socket(GString *cmd_line, void *arg)
>      return arg;
>  }
>  
> -static void *virtio_net_test_setup_user(GString *cmd_line, void *arg)
> -{
> -    g_string_append_printf(cmd_line, " -netdev user,id=hs0 ");
> -    return arg;
> -}
> -
>  static void register_virtio_net_fuzz_targets(void)
>  {
> -    fuzz_add_qos_target(&(FuzzTarget){
> -            .name = "virtio-net-socket",
> -            .description = "Fuzz the virtio-net virtual queues. Fuzz incoming "
> -            "traffic using the socket backend",
> -            .pre_fuzz = &virtio_net_pre_fuzz,
> -            .fuzz = virtio_net_fork_fuzz,},
> -            "virtio-net",
> -            &(QOSGraphTestOptions){.before = virtio_net_test_setup_socket}
> -            );
>  
>      fuzz_add_qos_target(&(FuzzTarget){
>              .name = "virtio-net-socket-check-used",
> @@ -182,20 +148,10 @@ static void register_virtio_net_fuzz_targets(void)
>              "descriptors to be used. Timeout may indicate improperly handled "
>              "input",
>              .pre_fuzz = &virtio_net_pre_fuzz,
> -            .fuzz = virtio_net_fork_fuzz_check_used,},
> +            .fuzz = virtio_net_fuzz_check_used,},
>              "virtio-net",
>              &(QOSGraphTestOptions){.before = virtio_net_test_setup_socket}
>              );
> -    fuzz_add_qos_target(&(FuzzTarget){
> -            .name = "virtio-net-slirp",
> -            .description = "Fuzz the virtio-net virtual queues with the slirp "
> -            " backend. Warning: May result in network traffic emitted from the "
> -            " process. Run in an isolated network environment.",
> -            .pre_fuzz = &virtio_net_pre_fuzz,
> -            .fuzz = virtio_net_fork_fuzz,},
> -            "virtio-net",
> -            &(QOSGraphTestOptions){.before = virtio_net_test_setup_user}
> -            );
>  }
>  
>  fuzz_target_init(register_virtio_net_fuzz_targets);
> -- 
> 2.39.0

