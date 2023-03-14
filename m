Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 726466B9197
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 12:26:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc2mf-0004VH-P4; Tue, 14 Mar 2023 07:25:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1pc2ma-0004Ur-4W
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 07:25:32 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1pc2mX-00017k-65
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 07:25:31 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32E88cab013190; Tue, 14 Mar 2023 11:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2022-7-12;
 bh=uA4Y99TlkhgbxY0poxYr6kdh+C2uj5gE2LJhy9ECVm4=;
 b=Iv9yu8K34XdOBJ/BkS9jkaEKZz3+6MePQMf/qCibgDn8cw4Oyy1ocRyvhgSSaaegO7xK
 V+NF1U/jeTBOwrpNUSGEGKEU6115x2hpcNk0XigCblLUqoifaoPbE/+X7wFt2ic0rx1P
 zTDQhlXQf6kNNZW1DMROgs+gevwk2YzdvuYcKJqUmWsy2yr8olmU0AGhCbD1f6rIK5gY
 HIC2F68vOad4W+QATtQv8CYV+M/0oUVozTfcq3CeHyrY2Jqg0UhzA9fixfDS9sGPuO5x
 Nure0PgrORf6NadoMVL/t04VDCLJrrR1aanixBeozGZewxi5AhLMthCAgBFqQkI6NEL2 IA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p8h8te298-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Mar 2023 11:25:09 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32EA2RdK025109; Tue, 14 Mar 2023 11:25:08 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p8g35ydyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Mar 2023 11:25:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdDPfUpjlQKVptrA6LbdaVU78DFq1shyM9zuip8N/4wxe1RWJdDPeJ65cJb6I+mFsREJSpQ1fSOzAUopge8am72czgrRSTLT0g3UD0b7duNgiaBKkKQknAKpDSVp2/ogLbZu/zwWEz+hwq++6fZEZ8rDHtt2Pt6DytdXfpc4w4lh5rBqfTr0FrFggcSx70JIsagxA+cpXhzCQdSFk4rowhlWPhmDLQbA5QMJZL7B6ZZRZ0atWKg3E4cS6FDdTlf1zkd2Fq//LCcMlifWMVHTd3K87fmrLhSYFaA5i2ygKKCvbzCZbf7X42hmTbdsLgjP0Npud1nGcvXq00X1H1J6Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uA4Y99TlkhgbxY0poxYr6kdh+C2uj5gE2LJhy9ECVm4=;
 b=DVoNGUQX73UVfDYkOJM6RUUAn72yX7DyHE6ZH0EMDlZ9dhSHdvo6dMWof6HXBQ2inkjlwXdd8o2a0umc09xAfMm2IC2PUy9nGW4WucAyDLO/bbD0TfaF5nC32KiYU31b3kwb0aR7wiRwPs/Bt+LXDn4X+3JSD9C4C7pmYZVs+crqLYBSsLnf7Epn4X7QMJBpDc7RIFdJbSeybjMgxMypT+h3/+L9tCeHJTts4JEuUe4j64EaiJ7A+0fe1dDrmfwHvg3ynrRY6mY57uAipGYOo/dp/D+9EUDkJKGPhgTmBltMAeJ0PJ3cbIZlHhxkm4v3ib1YWXiM4bZcAqIbjK25EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uA4Y99TlkhgbxY0poxYr6kdh+C2uj5gE2LJhy9ECVm4=;
 b=Tclecv2PvrYt5V90qnYPRGMiFhhbTftYOJG4zSpKXei1Kn+CRg/JtbqjdpMpYlus3pfBzwqim5O3sOVP7TRyKC7TI/yq0wzHEeGJY4q2jhyUvtaQ1oDN+3FAYJYSxhXYX5/SZBJB5Cbga1CPV45GpOZK1NonPS887zX+1NG4zqE=
Received: from DS7PR10MB4926.namprd10.prod.outlook.com (2603:10b6:5:3ac::20)
 by PH0PR10MB4597.namprd10.prod.outlook.com (2603:10b6:510:43::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 11:25:05 +0000
Received: from DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::9ee4:1e8a:76b6:959b]) by DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::9ee4:1e8a:76b6:959b%2]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 11:25:05 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>, qemu-devel@nongnu.org
Cc: dgilbert@redhat.com, quintela@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: Re: [PATCH v7 1/6] memory: Reference as->current_map directly in
 memory commit
In-Reply-To: <20230310022425.2992472-2-xuchuangxclwt@bytedance.com>
References: <20230310022425.2992472-1-xuchuangxclwt@bytedance.com>
 <20230310022425.2992472-2-xuchuangxclwt@bytedance.com>
Date: Tue, 14 Mar 2023 11:25:00 +0000
Message-ID: <m2fsa7k22b.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0498.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::17) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|PH0PR10MB4597:EE_
X-MS-Office365-Filtering-Correlation-Id: bb778088-9f61-4ef6-76db-08db247ec28a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0zUtOTmp/AL8Kc0C+U53ijHpWAkHtmDmQtHYU2/gYq1r52aX/jjPrhLnaXSyu3ZQ6G2tQRfU56f/juOwcQaUvG2o0nOVBOOPazBkgc56LlruLCqhIRVkyuYd9FwzKRlU22X45+A6XRMZbqnif5MgZti0djZvv50Z+LTyWY1Db2G0dhvrUYl5uWSFef/CLJls6beRZ+V/xL0RWoG2BZta/6lzeiiZ6+PSM11N8HsGWm9gRMBdefH/94ixAYOWiDiNERO4KLiOK53Q6uk9GHRYm/FLlwv0NiNVY0fR7Wwn18Fp87NyxP32ccFEmkDSaGhgomKoO9SfOME6MS2yV/Zi1ROz8zYrSmHhUbDMXgZHOBTRNheqF7sUS2n3toFPRSupvV6TzxmXTnp/jr5JLAEHkEaVeOHN5CTd96BfkzgjiTH3PvNsa2+X9zxxQdejW9xbmYsTGiwqVyursFmoi+PNmlSVcOrLNZuWzvAtbZvdI25Z3Mbsexx+H0TZPGjamI0e3wVkCi4FelnIOueMQLklgs2pVMBcYYgQyJLAgD3JeMdcW36r7QtK8y+2xCxPvoopcoS8PMhypLWoaPJT6sngd05EoZ+jkUp7mh/nAJp1LxgSgVqs3LNPjHlMwNj5kQUsSvE2OJhndj3IwoPYWvU1Ug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB4926.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(366004)(396003)(39860400002)(346002)(451199018)(6666004)(316002)(36756003)(38100700002)(86362001)(83380400001)(186003)(26005)(6512007)(6506007)(2616005)(5660300002)(6486002)(478600001)(41300700001)(44832011)(8936002)(2906002)(66946007)(66556008)(66476007)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aM4jeW6raabY6msU5F04KUc0mNK7Z7D7Bhppu+6Lr2ee/BkTWpEP3VBMxcA2?=
 =?us-ascii?Q?81FfszRuXKTTUi6/4I2RSRnKZ/FwGhNhoWfYcKLfEhh81DBOel+6tz7XkerM?=
 =?us-ascii?Q?18GWwhEkyqYMutYm6TsOg4o4GwzcLdPnkdswrB2RF/SAQUEy+N5fKKFZspXc?=
 =?us-ascii?Q?hUo+2hHEocfzzneqhUfEwa414LCFfKlaK/kUk+bn+/GYuxAqqLym7en76um1?=
 =?us-ascii?Q?8KrJgrueyX78BnKbXjj7q8UOhVsC3NE10NvtYWdDhv3e03qH/Ry+myv4dCOR?=
 =?us-ascii?Q?J9uwSJYte+1b60BfAqq7YH79R7AAj/jGNpRxp7UoVTIiIZEY0JS+ok7m9L/W?=
 =?us-ascii?Q?RatzI+SiRcb//+2RkpJmfGEsrlwKlSat25TMKWU8VJzHN0VzYyQfhSBHWeS5?=
 =?us-ascii?Q?dbcEg4aq7Y4155cInTKh88sWbgYQaE7tngN8NHuWo+FfRJrgaWYbjlcUWTbb?=
 =?us-ascii?Q?FzUmt1pIc5VYvZyoKIhjYXWF4BkZ+9IV55yIkehYyl36e3POAQxGhEq3lZN1?=
 =?us-ascii?Q?060+z5aCPsx5PZwioRMe9Cm4Afj3my1j0UggSJ+CUkvLGbe/g2xIdH8Xjecq?=
 =?us-ascii?Q?2+0Xkb7VPD5cgMHq8wl6G+asl1rFohqocoNE8TMYtKB2oRYoMIaPFVyfgJfU?=
 =?us-ascii?Q?nTVZlbf95MKk/uq5fva9n8VZwilOXp6Yj0UW+CeRVglEqOz7v/Mvah1ZsClS?=
 =?us-ascii?Q?e94mICmjZ9G+V+19iRIYU0w3ev/qvByMN2jnr0U3pwGzrc/9qlNNeFeuAsfA?=
 =?us-ascii?Q?GqByCEVvQ0L05vu/xu+JktYyASO2JgETP0i6CuqLvwO5ZEMsu0SqJZwW79KS?=
 =?us-ascii?Q?KO84gACEAeN/TGCSztgULADuHczYajAK3jIrB/AtCrxmENMyjslnQanpNjj8?=
 =?us-ascii?Q?z7z2W+wT2RgohuAfhrmTJCZfy3HVcltkeFmUQ6fOWqJ/xV63L7DmjFZDpigC?=
 =?us-ascii?Q?MHcgrAWi/A23MupviIJ4d8mQVXfo/UtHXASAeOo2jKIzGIz9rod/Yn9N+oNb?=
 =?us-ascii?Q?gk/V/6d3L6uVI4iwDwElTQXdI1/Qm9ezBhdFsVql14jyOJYyg+IvcLtEE8hA?=
 =?us-ascii?Q?Y7cPiMHyeR8T/7Ll0yDe5jgZTpyUvTbMArWbtPL02fgN/ayo9fqUMSeR5fo3?=
 =?us-ascii?Q?YRrTpH7hmmHRvi/d8+xcLm+4X/29mentOkX6vy9wIz7SJLR+8Shynj896drq?=
 =?us-ascii?Q?C5NQPE+tdizvxZ8JwoasLeXH2kL7qWaFJxhSi5rDcQuSOb77jy1EeUgBBjZ8?=
 =?us-ascii?Q?Tm0NN645UVAeNclx3vu/37YvSpoRydWt2I3C5b7yhC0WsTBpsplK71BDGuDR?=
 =?us-ascii?Q?8bXz6Qywx6tOPehFdF7PvfDIyPH5EQzst8oGkJ77rKFMqyRml57WdBXqdvQx?=
 =?us-ascii?Q?eWhayTV2NCSqCJpbHPHRAUEgIqBwJIKpbmZXwkl1M4kzsrMZT9pIUNvGu47X?=
 =?us-ascii?Q?BplwSGFSJCNHWLEEQ2msD7Xxy9TTW03uCkZBqzidTOW5/YACz40dmnDMfgGG?=
 =?us-ascii?Q?BcRw9nDg/G1xgO1KkTETmQVic0q0THKqgllA4jFUWTr8kvt61+ePVJCS6Nfv?=
 =?us-ascii?Q?pfAOdvR65Qj7E3nG4kYvByhcgLILywLALJIe+6SsazluOKyY3GY6aJn4UASi?=
 =?us-ascii?Q?ow=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: qs+epIE0oK5xLZL5xWs6GjhIHFTgRJdwzb6X7uwHmd2FUUI6nXZYvuRKDoEJhiTRCa2Dt6w2nPrBoSADwWzHg6wwh7NhoXCBoevrPFcZ+6aRhOC2ffvVHmEYHFTTN+BfFYg1eXwVpaH/rWurRUe0j45pT+6AKJndzaQxFKclUv03Qq4CG5tWfyUZ3AmE7DWAS5qYrvLOSE8dPp2fW58tsBi0DF9m9NAM0TOByb6xPc0rY/bluFSWGh1/3qagTQbijK2dVRmcxb+99FqcPSXLfaBUNy8OwZy8CK23ArRU589sef0BBXRAIbiT/EV048zjKLd4tmlWnzqxtRQdSKkx4qaE/5oKUkr4qoV3o3Vrk6v9SfvE2zaniAgHkE6xfy5+T7Un8DhU4wpocUCUkIct2mSHcfUzY5t2m8817wt3kJ/1F1bFHUWyUPhGE1pcN8A8k5dOYtAdrw2qHfR3A1afU76JdK+P6EPCF1XPQeH2a5Z5VJmAaz/IOnlMKDEJypylMxP0W5bPeQTVGeGIZ+dbkejosVIzxhvYteVpS9F2vEa4OL2W4b9qj0aIz9biSjvGXlX2lS94Anj13+m7a8O3cxEHYJXKKhjKdUf/ok63UfTa30yCONENvgN9SX39D1UifrrMR7FJLL9MePwQO+uWMLJJiw20MbQn0e0ZtlDS6cNzjkPLqJr9Vh9Ft5VqBRpuUSHESwlg+uzoCWOfAu959LvbsX7BZu2MLPhl5bEu3NS1zcKCJcUiXU5+80pFlNHtYjVOrjyX8fmGbC7VbGDe1LjROWivVYRRTDX8tpMVyLP4/FTA5tHLkWvVb6X3JqOj6mgvGhJH/H0iP5qlsZgUVDJLeKebnuRrsNskwlL7Ri0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb778088-9f61-4ef6-76db-08db247ec28a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 11:25:05.3108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xn6q2KQmEcUjlch8L1T09qxDJtelNdDkpkdVT+tzsiGh1x0qBqtRFBqXhzlv/IpyOSZsyARBwdNAOIpwTCLMcVR/QzwnDNxP+6yqlCuCsBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4597
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_05,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303140097
X-Proofpoint-ORIG-GUID: QnecXncj-8qiJWIVoJhG-2n4Klr52I0a
X-Proofpoint-GUID: QnecXncj-8qiJWIVoJhG-2n4Klr52I0a
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0b-00069f02.pphosted.com
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

Chuang Xu <xuchuangxclwt@bytedance.com> writes:

> From: Peter Xu <peterx@redhat.com>
>
> Calling RCU variance of address_space_get|to_flatview() during memory

"variants" rather than "variance", perhaps?

> commit (flatview updates, triggering memory listeners, or updating
> ioeventfds, etc.) is not 100% accurate, because commit() requires BQL
> rather than RCU read lock, so the context exclusively owns current_map and
> can be directly referenced.
>
> Neither does it need a refcount to current_map because it cannot be freed
> from under the caller.
>
> Add address_space_get_flatview_raw() for the case where the context holds
> BQL rather than RCU read lock and use it across the core memory updates,
> Drop the extra refcounts on FlatView*.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  softmmu/memory.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
>
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 4699ba55ec..a992a365d9 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -61,6 +61,13 @@ struct AddrRange {
>      Int128 size;
>  };
>  
> +/* Called with BQL held */
> +static inline FlatView *address_space_to_flatview_raw(AddressSpace *as)
> +{
> +    assert(qemu_mutex_iothread_locked());
> +    return as->current_map;
> +}
> +
>  static AddrRange addrrange_make(Int128 start, Int128 size)
>  {
>      return (AddrRange) { start, size };
> @@ -155,7 +162,7 @@ enum ListenerDirection { Forward, Reverse };
>  #define MEMORY_LISTENER_UPDATE_REGION(fr, as, dir, callback, _args...)  \
>      do {                                                                \
>          MemoryRegionSection mrs = section_from_flat_range(fr,           \
> -                address_space_to_flatview(as));                         \
> +                address_space_to_flatview_raw(as));                     \
>          MEMORY_LISTENER_CALL(as, callback, dir, &mrs, ##_args);         \
>      } while(0)
>  
> @@ -753,6 +760,7 @@ static FlatView *generate_memory_topology(MemoryRegion *mr)
>  }
>  
>  static void address_space_add_del_ioeventfds(AddressSpace *as,
> +                                             FlatView *view,
>                                               MemoryRegionIoeventfd *fds_new,
>                                               unsigned fds_new_nb,
>                                               MemoryRegionIoeventfd *fds_old,
> @@ -774,7 +782,7 @@ static void address_space_add_del_ioeventfds(AddressSpace *as,
>                                                    &fds_new[inew]))) {
>              fd = &fds_old[iold];
>              section = (MemoryRegionSection) {
> -                .fv = address_space_to_flatview(as),
> +                .fv = view,
>                  .offset_within_address_space = int128_get64(fd->addr.start),
>                  .size = fd->addr.size,
>              };
> @@ -787,7 +795,7 @@ static void address_space_add_del_ioeventfds(AddressSpace *as,
>                                                           &fds_old[iold]))) {
>              fd = &fds_new[inew];
>              section = (MemoryRegionSection) {
> -                .fv = address_space_to_flatview(as),
> +                .fv = view,
>                  .offset_within_address_space = int128_get64(fd->addr.start),
>                  .size = fd->addr.size,
>              };
> @@ -833,7 +841,7 @@ static void address_space_update_ioeventfds(AddressSpace *as)
>      ioeventfd_max = QEMU_ALIGN_UP(as->ioeventfd_nb, 4);
>      ioeventfds = g_new(MemoryRegionIoeventfd, ioeventfd_max);
>  
> -    view = address_space_get_flatview(as);
> +    view = address_space_to_flatview_raw(as);
>      FOR_EACH_FLAT_RANGE(fr, view) {
>          for (i = 0; i < fr->mr->ioeventfd_nb; ++i) {
>              tmp = addrrange_shift(fr->mr->ioeventfds[i].addr,
> @@ -852,13 +860,12 @@ static void address_space_update_ioeventfds(AddressSpace *as)
>          }
>      }
>  
> -    address_space_add_del_ioeventfds(as, ioeventfds, ioeventfd_nb,
> +    address_space_add_del_ioeventfds(as, view, ioeventfds, ioeventfd_nb,
>                                       as->ioeventfds, as->ioeventfd_nb);
>  
>      g_free(as->ioeventfds);
>      as->ioeventfds = ioeventfds;
>      as->ioeventfd_nb = ioeventfd_nb;
> -    flatview_unref(view);
>  }
>  
>  /*
> @@ -1026,7 +1033,7 @@ static void flatviews_reset(void)
>  
>  static void address_space_set_flatview(AddressSpace *as)
>  {
> -    FlatView *old_view = address_space_to_flatview(as);
> +    FlatView *old_view = address_space_to_flatview_raw(as);
>      MemoryRegion *physmr = memory_region_get_flatview_root(as->root);
>      FlatView *new_view = g_hash_table_lookup(flat_views, physmr);
>  
> @@ -2979,8 +2986,7 @@ static void listener_add_address_space(MemoryListener *listener,
>              listener->log_global_start(listener);
>          }
>      }
> -
> -    view = address_space_get_flatview(as);
> +    view = address_space_to_flatview_raw(as);
>      FOR_EACH_FLAT_RANGE(fr, view) {
>          MemoryRegionSection section = section_from_flat_range(fr, view);
>  
> @@ -2994,7 +3000,6 @@ static void listener_add_address_space(MemoryListener *listener,
>      if (listener->commit) {
>          listener->commit(listener);
>      }
> -    flatview_unref(view);
>  }
>  
>  static void listener_del_address_space(MemoryListener *listener,
> @@ -3006,7 +3011,7 @@ static void listener_del_address_space(MemoryListener *listener,
>      if (listener->begin) {
>          listener->begin(listener);
>      }
> -    view = address_space_get_flatview(as);
> +    view = address_space_to_flatview_raw(as);
>      FOR_EACH_FLAT_RANGE(fr, view) {
>          MemoryRegionSection section = section_from_flat_range(fr, view);
>  
> @@ -3020,7 +3025,6 @@ static void listener_del_address_space(MemoryListener *listener,
>      if (listener->commit) {
>          listener->commit(listener);
>      }
> -    flatview_unref(view);
>  }
>  
>  void memory_listener_register(MemoryListener *listener, AddressSpace *as)
> -- 
> 2.20.1
-- 
Leaves are falling all around, it's time I was on my way.

