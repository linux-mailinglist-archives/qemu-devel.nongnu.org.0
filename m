Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236164EBAE6
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 08:39:23 +0200 (CEST)
Received: from localhost ([::1]:57742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZRzF-00026b-PZ
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 02:39:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZRtm-0007bU-Ed
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 02:33:42 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:64394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZRti-0005NE-Hg
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 02:33:42 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22U2x7ox016620; 
 Wed, 30 Mar 2022 06:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2021-07-09;
 bh=tHM+ropir4SsYKKhIbLfgd2+WXf8InHqNa+H9lIlUUI=;
 b=gDP0l8evvRJTRJr9gLmRzIRqOPDL3Bp8P5/OoMk5KVtRVObkgeXZpwQPkKb7Njx4foS1
 hRCRZPA7Z7LyFbLEIeJKQF2K9Cy7R+44Rvzg/6WIdok5d8qIUvBct5y9oC5a3femuk1u
 auL0F0Kk60OBWgiLFaO/RqwFUCJOP+/pOd3VtctaPggnkIT/Xfb6Nll5IiXhWQn8cbd8
 pwkXazXeifqW3O9uM+BIZ4reltOI6fEyJL694CpOdrh+uggQ5KegPIGjI6HPiRD8tNqq
 0szTYUZ78g96SPLDfdEUL3GixQS8vadwMTFCCkS+e9xdGUgzXfuMazEk07pJ/q10aNSW NQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1uctrp2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 06:33:31 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22U6IC5G013067;
 Wed, 30 Mar 2022 06:33:30 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by userp3020.oracle.com with ESMTP id 3f1v9fk5ts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 06:33:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eebu9nOW8sCs2VAydVSQ8BabSWsqwz3Zlpy1I7r3RCLKrP4WtRV318qsAlTLMfWFyA26FoF8eqJZi6tvIdAiGjdh7Q+IA4mfOS5qP5d6O2nFGILEboHcbj/xYSO6z76RcTLYyOoXwhUDdD8SJRa3W66jwPKGojJc8CMFKm9jYP1w9zrdgAT0jVIdvhZzQYwA/Lb8oJv32ptlaU25EIek9tabGgqIO/j4lJDc4Mg7k11WzeF9v5QxC9Ceagy9He+YnaHdMy1V6435pM0WIK3FkyRTEa0no8aw8xfwGxTouFRqeQBY9nA8atet8S5LT6AG7lF1QZ8Ku6VMipcxginO5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHM+ropir4SsYKKhIbLfgd2+WXf8InHqNa+H9lIlUUI=;
 b=JjEMYmwM9TFK0EFCBh5VRuzqTRPAq8tcVFRVvK07LptrZLkWcY8M35z4qT3ERfVa1F4gqy3i29gnzJcGGGKHQG2Gkq2gC+j49k6yXtkbhgu0GokyrVy109G2m0AhXaX51w+9WEeCXxfuz36fScuLFqniYoo0jl0WZFBJW8v++S3qkNSy93UOtN2DYGInf2zgYABNJFobZdunpQG44GjxM6KPNWvHr++OKMu7wW6SoQMBEzVlLfWqJnca7uV9d00EQ71CEP1cDGVPA5rwMJFe5jYjsLgEefiTIPV9bVKZe88tkspL5oRD1mbdb4Ihjk80rZKC7HWWu2qauhkmnw5SjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHM+ropir4SsYKKhIbLfgd2+WXf8InHqNa+H9lIlUUI=;
 b=pm05OixDWPRGmhQ05to80vvb7Hp2NICZgFuHhn78oc5rtV+QmBevzRfwvkzaAo6RyGN2gu5Xx3u9QruA1wZOoOoaiy4JY14j+ONXD6vhuzz0JFConn2To5jv14pDKlsmk6kySnnIQNNK6zICYmW/FWutU+iRdm8LnJ6l4WEFyhA=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by BY5PR10MB4067.namprd10.prod.outlook.com (2603:10b6:a03:1b4::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 30 Mar
 2022 06:33:28 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96%6]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 06:33:28 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] vhost-vdpa multiqueue fixes
Date: Tue, 29 Mar 2022 23:33:10 -0700
Message-Id: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR11CA0006.namprd11.prod.outlook.com
 (2603:10b6:5:190::19) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 216e77ac-f8cc-454a-2ec8-08da12173341
X-MS-TrafficTypeDiagnostic: BY5PR10MB4067:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB4067D7154EDC743CBCE7DFD6B11F9@BY5PR10MB4067.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rfv+B2q5sh7WCggqk0dVY/0EmK4K34pfACNT0cGKvJkneTVXl7QIsdqqkVHR6i1YWfsxo9/O90y3mGWjJTWDrWPtYoltpGw4cOakMuT/XNpjYm+mZr3SGqaKoBo1l+Rnk+EiZGvnWOZCzBQG56mHmnvSqy2Hb1DWX2hNrXrRy+JomIpxxyhqxq/2LLsrydvM45uTQ0VJlbt5QWkoEQ6TUgN9fbcjAYQH5KuwOLFOSlhUWCuw8/ez/PVeKGhBhihhKlyI4ZgdiNlk6ekMXLp2n8MMdlEvt0Kc2fWzjJYyt/rVyPOc+iMPHU2Gu8/UEZZOoMHhzy7ObUx9Ipog4oWKZFnCX+JYZlWShCc+TctKYhma6hsDzpNij87Q22lmXc7C+s3ADgpmqTRdyZof34ZSzRjhApm970Tu0I9rTPioyMjjR2RfpacjE0+2EX0HrdmLikABopogjMCbeE1WEb1GORITmTV61VFc04rmhCGD/DBvqG4SEOLPZ8DHYLhI9JnffcBPHAyNIsEgg8uCVx8O+1KscSVJI5A3mDLg3tfnfBM8HdedwVn/djVGfdrESEEbuNhYqCEpX8czCujaUJ8/hciqZPU/FCSD9CsQbRiC/iR3ixqhrsENREHWWbK+7j6BFlftI0THLx01e1FmRdon3dOfzUmZXnJJdEVDNm+O7tS2WUGGN5DJDWlpUzScwKCyml3wrljwx5FCCwHpGHsOZPqLJc6LGYdcHec+7UJ9t+4WUKE+3fm749Qt8m6R7ycdP5Bfb8+MsiUffXG9JBCOxdhhJYNt7FIoAlQQk8hLLiuHsiTx/JsCVW72chgJIjbLlnpNEy8lWz8S3O26ff2Qkw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(6486002)(316002)(86362001)(966005)(36756003)(26005)(107886003)(6916009)(52116002)(186003)(66574015)(2906002)(2616005)(8936002)(6512007)(6506007)(6666004)(5660300002)(83380400001)(8676002)(4326008)(38350700002)(38100700002)(66476007)(66556008)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGJFcjB4QkVnOHNsL3lUcFBYMHdXSTRYTkIzY3UzQ2QvRDV1TVNxelZBK1Bm?=
 =?utf-8?B?aEZ4UFhkZFdqMjk5bGdnUGhyRmljRW50akUvNUVGWi83RGd1dGppcVBTTEI1?=
 =?utf-8?B?UGZVZXZjN2VTMDBxeGVZWExIRWZFbUJPRWx4WlY3dXFKWGE3bmlPenFGOFpD?=
 =?utf-8?B?OXJualR3QXRLbDl3dnoyN0w1MExkRGwwYjNNbzRTODNxKzd1ZExCSUM2Vk51?=
 =?utf-8?B?QS90c3dxS0UvYUZIYWVYQyt2MWpwSlNVN21vOWQ3YUQyOVVoMnRGV3JFeHQw?=
 =?utf-8?B?OVdINjl5dERRQlkyL1BlWUVGYTVrS0Z1UVNwQ1JTOG5tTk1vMFYxczNGZDFU?=
 =?utf-8?B?U3Q5eURRMy9wU2NIcncxU0ZrV29CQ3hERDlacHJMTDRFdkp1dUZyLzdXQy9t?=
 =?utf-8?B?akEzRGZYUTYxMU1pRHpJWlVFTGVwZ1hvNHBRcWJuLzNURm5GWWtjM3ZZRCtU?=
 =?utf-8?B?L2xKSUltYVhqam5JanNzc3o2UzJINU4rVXRFL0lhVm9CK2lpcG5hRTlkaUgr?=
 =?utf-8?B?YS9sTWZmY3FIWXAvckZFSStJV3hXeVh3SmNQNGNSQ08vdkIzcGJrOXlzQU1z?=
 =?utf-8?B?RE1qVUk4MllrSkw4c1l3U3hFTlVMSmhxdHZXbUpUSUpNL01ZYXBuaWJDK3Yx?=
 =?utf-8?B?QWR0WjlMY042QjdHUW1aaDh3eU5KSzFaNkEyRWxOVFMrSS9ocGNsSit4WkRI?=
 =?utf-8?B?TFRQYkxCb1Y1M09NUCtvem9SR0RGRm5FRnVjbkxBUUNGcmpLUHNUN2dUWHNW?=
 =?utf-8?B?ckZjUTdhZlZtbUZFYlp3V2dTVnJWbXNZMUhYVktZZXpJQjM2cmJLNTdKc3Rt?=
 =?utf-8?B?YXRYSDczZ29OYitvTUs1TndqMkRHZzRveGYrWElBYWIwclNzdDFBRzZMUUVs?=
 =?utf-8?B?ZG1wUmViUHpIWnZteHE3QUNiamVhMTE4UE1pZmhiMHI1SURTa3FET2tYRGha?=
 =?utf-8?B?K2krSy80WUZuTVJSa2pZYkk1NzAzSTNsQlZGL3BrRmYzd0ViUHJOV1RHL3VR?=
 =?utf-8?B?bUlYaVl5MHp1WkZuMHFTRjUzRmNyV2VJSCt4SDBHU2FzaWxiZkpQSXo0QVdu?=
 =?utf-8?B?VWNBS1RINTFScFZJMzZKMDRtT28wY1ZnaGs3Wlh5SWVkSTUxbk1yTFZPdWRD?=
 =?utf-8?B?eFZxZDNNNmxybjFoZ3A0Zm92RFJvV2RaUno3eGZpMkdyV1dVaDAzS2NMajF6?=
 =?utf-8?B?Y24xY2FEZEZubnBSc2RKYjBWNVdFRVB1QW44YnBZREFGRktZSjE5RFNIMlY1?=
 =?utf-8?B?VnIzd2RaZUZMN2NSRTZHRXZUNjNldlF5NE9BU21VamVWMi95Smd0aTlUeXhp?=
 =?utf-8?B?WTFYelNPcDFna1BDVFhGMGI2NkZzTXZxNjFxYlJIK2V4NktSVGNuZDhyeHc4?=
 =?utf-8?B?SWhxOTRQRTVpeTVzNlpzVjJ0SC93Rk1FdEpwOW11b3NWZXBBeVdERU9SNFJD?=
 =?utf-8?B?Y0x3WEIzUzErT0dhOXJjWlZ4ODJtU2hUWVVjRjFsQmU2VFBVQjB5YXBYQWds?=
 =?utf-8?B?WHVyeDVEU3UwVHNnVXdpa0k1WlZLUUU4VmJFc3ZQODhTUXpMcXJxT0dONUhV?=
 =?utf-8?B?MGVlaXJ6aTRVbkpqMUNOazZUNmxMTzdmcncyMmtTWkNGMUtEVnhFK1VFNnQw?=
 =?utf-8?B?eXRZR21JTE51QTlNdkJ5cWNyQjNuUWNrTUtFNzNOZUJWOFBabHgwWnAxWlBH?=
 =?utf-8?B?d2hGai9uRi9tallaMG1Fbm1XcHdiZlRHNS9pd0VtekZ6T2o1SmJobGVsc25a?=
 =?utf-8?B?WU80eVhScWJRU2piUUJrL1RZSEV3bExQUDkvQ0Q0amhFR3dOblFscWl2Wmgv?=
 =?utf-8?B?K3NhNTRPZDdLWVh2TlgwTnRmYjlwUjRvTU9mSFBrWU95SGFMb0NvN2J2aFJh?=
 =?utf-8?B?cXJ2U05iT1VJNlJwKzhCUlgxRGdEOWVlSGp1N0VSVkdmQVgvdmx4cUMyeDc4?=
 =?utf-8?B?TExKSE8wemtsRVBGWno3UDNoUlhYSmhMaWU0Q1NITGo3UHJXb3JvVHNVRXJt?=
 =?utf-8?B?OEgyOHJZZjN2L1JCVThyTnF0VnI2MVZMcVRIUEtaOTlYaDhjRWZlc05tVWk2?=
 =?utf-8?B?bUFEdkJhb1ZrK1JlNTlXa0hoZzNIWWRDTWkyRnZJMFhjaGFVL0xmZHNEUTdt?=
 =?utf-8?B?ZGw0MzBOMUlreExtREc1UndyNEhmb1UyL3JyZ1Bxdi9uRzFVeklVOXAyV1hS?=
 =?utf-8?B?TWRtaVc5TmNYMndva3lUVFpDM1VCd3FFU21GZmdGZlRDYVdpME9WYlNkSTRu?=
 =?utf-8?B?MEFVTy9WVXZGL21VQ2RsRHVmWjNvSnhISGV0ZTMxUVRHRVZ2RzVVbWh5Wlo0?=
 =?utf-8?B?MWg3a0tZT0JPNXlXNlVEcUdJY3VpWGxUS1NoUVhONGhUcEtiNzR1UT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 216e77ac-f8cc-454a-2ec8-08da12173341
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 06:33:28.1210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5uSSoI6AKyTcQVPHTPTUDjyDnqOl2h+gmT+viIV9ODP+bNeq+ckfrCjMR01RoSobN8tVleuogK5CoJkjG22Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4067
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10301
 signatures=695566
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 spamscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203300030
X-Proofpoint-ORIG-GUID: wCeniJFCy7_302-9QOD52hVP1LAHa_52
X-Proofpoint-GUID: wCeniJFCy7_302-9QOD52hVP1LAHa_52
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: si-wei.liu@oracle.com, eperezma@redhat.com, jasowang@redhat.com,
 eli@mellanox.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This patch series attempt to fix a few issues in vhost-vdpa multiqueue functionality. 

Patch #1 is the formal submission for RFC patch in:
https://lore.kernel.org/qemu-devel/c3e931ee-1a1b-9c2f-2f59-cb4395c230f9@oracle.com/

Patch #2 and #3 were taken from a previous patchset posted on qemu-devel:
https://lore.kernel.org/qemu-devel/20211117192851.65529-1-eperezma@redhat.com/

albeit abandoned, two patches in that set turn out to be useful for patch #4, which is to fix a QEMU crash due to race condition.

Patch #5 through #7 are obviously small bug fixes. Please find the description of each in the commit log.

Thanks,
-Siwei

---

Eugenio Pérez (2):
  virtio-net: Fix indentation
  virtio-net: Only enable userland vq if using tap backend

Si-Wei Liu (5):
  virtio-net: align ctrl_vq index for non-mq guest for vhost_vdpa
  virtio: don't read pending event on host notifier if disabled
  vhost-vdpa: fix improper cleanup in net_init_vhost_vdpa
  vhost-net: fix improper cleanup in vhost_net_start
  vhost-vdpa: backend feature should set only once

 hw/net/vhost_net.c         |  4 +++-
 hw/net/virtio-net.c        | 25 +++++++++++++++++++++----
 hw/virtio/vhost-vdpa.c     |  2 +-
 hw/virtio/virtio-bus.c     |  3 ++-
 hw/virtio/virtio.c         | 21 +++++++++++++--------
 include/hw/virtio/virtio.h |  2 ++
 net/vhost-vdpa.c           |  4 +++-
 7 files changed, 45 insertions(+), 16 deletions(-)

-- 
1.8.3.1


