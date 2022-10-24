Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9680D60BBB4
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 23:11:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on49X-0005ud-NI; Mon, 24 Oct 2022 16:34:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1on49V-0005uP-C8; Mon, 24 Oct 2022 16:34:29 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1on49Q-0004nF-OE; Mon, 24 Oct 2022 16:34:29 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29OI9Tp9010233;
 Mon, 24 Oct 2022 20:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=k8KmasN0lO9QB+7yNRffu/j0LWhjvE1W/HILtjVO5kU=;
 b=cBkQN3ak566O8T7uSmp/FSuzLWmgdGS3cm+tXMXD0yjgKKKyfiPVrG46UPgc6VJvvibZ
 BYz8oyBcT0NRZOhAOEYExJ313osSwcWTtqT0s9wUzaw7Eg3hyOi4yHOse5IU2cx03r6z
 lBQikrJMovMwOKHZpH6KxmGN9Sb8WHOlyuHx+04DE0w4Vkd/KsBqrfWysuxJTp6RjzjR
 vOkOjzf/jD8Olk9xBPACP7Ob7+I0ag11GA2pQN666TlTTk15FXEbNRhmsFf1VJepoYzo
 BxIvDi5aNX/rrJlynFEsbxvaijlYISN/D/UG+uITy3U8cr1Ch3MtW77nHRVRJURd5nlY Ug== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kc741ngc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Oct 2022 20:34:09 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29OJEw9v032203; Mon, 24 Oct 2022 20:34:07 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3kc6ya7rqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Oct 2022 20:34:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktVJcXkxvzrgk5on9jHovmmSx5KkV2aCghj0oss26tPWU0d7OgqSor8vkJWIT/TnDIS1MiRwwtFASMYcq0nXjZhgBg+rCXm6JHJNQVmUgCof4K7h+zySkONs87sLHC93aL9XO3zKOc9+W4mX56VbvfrioOeCoUGpdgGV6lZJLm6o49JXcf7f8X35PoxACAQ+NLILHAeh8ZilUOeeymDvbdACScmceY/QweYqDi/CSzA/nny4VuJ25cfdSj7IcXo7/haLPNWiMEbtkYWpvPSHLY7WMXCsH1hf/XaQUTGTNPtOX/R557XDzuHjjYQIPPVMqxtiCHPv5ahdGNEK3RAH9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8KmasN0lO9QB+7yNRffu/j0LWhjvE1W/HILtjVO5kU=;
 b=hAfSql07CnoOVkm9rDxQohNa0TkVkeCg/W+FZAv3r1hOb7vRVz0H3yWL1xAlaw2UP70sTOT9F5mFG1FqWMgLwLfiVvz4nK4mK+8vIISvo7COTTZpL/bN5faXHrNNO0JQWqp9Dypz+To1lD2bxO8POZe/sAUAlICPrjM+hJIIGCdjsqrIt15Nl5Bn4sNkEKQ7RZxY/gGXEH171rbDSZI42hCBiXoxaTImH3m8QqS8VYdv4Iqg7JXME27Hq+YyOPgtK/QgK8rz4C/skfMDdCJZTqyDdBWRNbkvZBo8CS17QK8z29dsc1Vdsd+JyWeGkq1sfMkpO9IBCVs31+CoZZdgKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8KmasN0lO9QB+7yNRffu/j0LWhjvE1W/HILtjVO5kU=;
 b=CM/U3iw3jqYBsaASKiTBIh8WGUUy/JrfI6tuJACEdOjUpPkk1/ZSy+jDqUVx6Yuz4rbrsWCgOeRSaVUdpono1wX5B9ur7OzhXfNlAWhFMgtrT6griTPQPcQdEJmoaafDjFGinZZ9N91YcYnPdkOBk1JQe217eSBmYJRDbtFKlEw=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SA1PR10MB5821.namprd10.prod.outlook.com (2603:10b6:806:232::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 20:34:06 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::f7b2:af85:fe37:31a7]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::f7b2:af85:fe37:31a7%9]) with mapi id 15.20.5746.028; Mon, 24 Oct 2022
 20:34:06 +0000
Message-ID: <4e83f764-49b7-6105-6326-836f8dd89934@oracle.com>
Date: Mon, 24 Oct 2022 15:34:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2] hw/acpi/erst.c: Fix memory handling issues
Content-Language: en-US
To: "Christian A. Ehrhardt" <lk@c--e.de>, qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, qemu-stable@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221024100323-mutt-send-email-mst@kernel.org>
 <20221024154233.1043347-1-lk@c--e.de>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20221024154233.1043347-1-lk@c--e.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0047.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::22) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SA1PR10MB5821:EE_
X-MS-Office365-Filtering-Correlation-Id: fc402202-e804-411b-7dac-08dab5ff18a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QINu/heKFPR2wNbdxvLxASrYwNETcZ1XNz+rGT7D+JSMvJ3UmJ4D5Yvpxz2ZR+e+XagVFSGJ4t/OlGn84m+p+DNA/gcM8l/CruhpgycWnMXItzyv8IGJitHVKCJFX2WswENR0v7JEAyEdTbNj6WxURSfRn5iZwcqroIjzGGRDEjR5BFyaOD7Z7vyE1n1VUNPEeQ6sugGRWhr6Cv4pvZmy/AVQZEWwzpdNd+bbL7qbCukkB5vNqcOCFgxMiFYnVfQQVqjVEZ2uP3K7eKx5cFdsqYFlVuN9/MRvc3x+pAKoLd01Kq+qXNdUhmpmbExlaQAw1+7sv90dJJkExtkl6DvMQ7Uu2nbUlSjhxiaGjaCTMax+FO8+lBZuJgnS4Tvc0dD3r14H9TiHTeM4rXrIdct4Goqbmgmg0NR5L2zSF5rnRWtm45NrMUeW/a6q6Vn6tHfN+JRXypiheyW0bcARbJweG2wJZ12iwPPwrlWg5wY3p0RQmaYHsQ/B2887BLumBEgI+XrVcfodnn+vmCFVlQf1TgAnRfVlqomZfAb90wQJHv6stjF5K658Ss7NmorgZBjiHW76E3cyAzqWS65zsHlbesSuVloOt8zQcCMQ3tyTaAvP402QPYaCvbukCCYyu2qqc+ZTdGDAERVi2KMIeHZcZOx0IO5oa/Hs0qA7ctQmIZMj6e/DsJQ4elt/b4T02UE0iHFcENNtHTbmMc39dJb4hy254da3PZleMFwywD05WCQQ4kUR26cOKaZkZmMM9kHm9cupPX1UQuMJpqVnOnFY50C4UNzqM5JPByxUpT+UZo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(39860400002)(366004)(376002)(136003)(451199015)(31696002)(6512007)(53546011)(186003)(2616005)(6506007)(66946007)(86362001)(66556008)(66476007)(478600001)(8676002)(316002)(41300700001)(36756003)(5660300002)(31686004)(6666004)(2906002)(4326008)(54906003)(6486002)(38100700002)(83380400001)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3hrZ3JLSExJcmU5bk1tOFJKVDQzbzlkSlhnOU43TFp6L2drU2ZpMWNuL2FP?=
 =?utf-8?B?K1prOFdmalFhd2kyUmFmaVRnTENXY3REelhRS21Qc1lNcUFvNFppYmhETjh2?=
 =?utf-8?B?R0tRdndlZ0dVY09vaUxoT1VmQm9kbTdXbnZpdG81OExFOWRydmpZYjNjRnQw?=
 =?utf-8?B?MjNXQ1Mwakc1a1EzMW1QditlZE9QckNoSlp4VXEvUDJFVis4blB2cS81cWY0?=
 =?utf-8?B?aEFRajdxd0oxQkQ4RldzeCtuMVlwbndPaTNMaFVDdTNWUDhTaCtwMURtQ1Iv?=
 =?utf-8?B?VnV5aVRoUWhOQlU5d3ZjWmNUTG5jaVZtSHZ1YkhUcCtNcGtVRjE4c24yTWtG?=
 =?utf-8?B?cVJ6bUNiQTVYM24wRmgyNVJYbmxPaVdJRE9FRDdMZ1RGWTFDVmVia01RNXRD?=
 =?utf-8?B?d09BR3hvbmVvTERlRVBiUHRPNFFWL1FJZ3NhUnMwVCtEcnhLZitiYUFxdWdW?=
 =?utf-8?B?V3dWU3ZNOUM0czdGU3BxYVFWYzUrOGs1b2NFNVJLNnNXbWtVQk00bnBZVE9V?=
 =?utf-8?B?d3JUc2wxVjJzdUZyN3VTZEpJek9CeVhUR3NtRHpnQTJsUzdUVFk3anVkNEl5?=
 =?utf-8?B?b1JGeWNnMS9xTkJsOXJTdGZ2NFZEWUY2WWVORjBLMHAreE45M3dOTm5SVkF1?=
 =?utf-8?B?bDA4N3F1MU8zZEt6UUZBNWJiQ05WcjNtK044TURRSUd6WEp2cEN6TDhWeVVr?=
 =?utf-8?B?YVFmTVVXcDY5S0NwK0dUSzJxRmcyU3huZENUeXdUL1dRQjAzaHhiM1piY1Jh?=
 =?utf-8?B?Vkt0aGcxSnp6d0dmS3N6TitWTUFkdkpRUzhxT09kazgvc1pVT29XNkc3QzZT?=
 =?utf-8?B?Skd6SnAvaVlxcGNLbU56UmpNN0Evc2I3d0lBbWJQemVDU1E0VnFGMS8valpZ?=
 =?utf-8?B?SFV4QlRSdnRKYy9sZS9WZVBqT0pFQVFpeExLK2o2dUkwRlJlR1lDN1JhMVp0?=
 =?utf-8?B?QVhzMktab0xIVXgrcFF2MHhWZGpBY0NISnFmUEJzaEp2R2phc1EvWldJZmpm?=
 =?utf-8?B?UkVSN29SL1FRN3dKQnFtNC9JNGtrRk5yc1hxdmRNVGtvNlpuVGFEd1greVo2?=
 =?utf-8?B?SE92ZkZkeSs1TFA2bWRwZ2dMaGcrWnhIc1R0RndFekx1cExieGY0YmRrZTAx?=
 =?utf-8?B?TWt1dDFva3RrNTRuUDBuYzRpZWVKU2RyeVRRc3BBcWpodHNyc1M0QnQwbElV?=
 =?utf-8?B?Y2xYNXRpdjNrY2phdWV4eVJBMW01c3BBcXhsaW45c25NTy9wREJOUkwxK1hv?=
 =?utf-8?B?Q1ZjeWZaUVFaU1ZydlA0blRKNk9acDBrdURGSnU3Nm1oNG1mS3Fvay9uZCs2?=
 =?utf-8?B?S29ESUFVNWpPQXpsOUd2akpwMEkwZmJxeU1NL29KQjA4d3p3RUtwRFVFSTdE?=
 =?utf-8?B?ZXBlN2ZydkpCUEVYWWkzcWg3aHlCMEJBNDJoRnFOZTVPTWVUcUtHK0Q5M1FI?=
 =?utf-8?B?L0lhdEtrUFg2ZzdmZXlORmwyN1JmcEUwbk5vZkw0YjREeTcvTDVLTmo3TDNy?=
 =?utf-8?B?ZWdKdTk2bzJyWEtEbUl6cG93MW01bkh6Q0hlV2FCNmRnRndTRllDQmd2eEFi?=
 =?utf-8?B?UUhYUjczMmFJV1VjbjFXOE9CMHNHYXdGY1VsRzBGQ3lDS3VkdExBbk1nOHMz?=
 =?utf-8?B?QW9KczRmTjRqV2VsRUNETlRBbUdYQ0Y4bmxqR1poUHRHNjc2MzBXL1BQcFgv?=
 =?utf-8?B?ZTdKT2daRGhNblQwcXFXNC84NWZ3UUJUQUQ0VGtIdzdXZ3I0ZVFEMDJETEJk?=
 =?utf-8?B?WUNTTktYcXpIYTJidnhrMWRUZ2djcUxNQk1Fa1poQm44aVRKZmVIM3VQNkEz?=
 =?utf-8?B?ZXFKbjNnR3V1dXI2VFMwMGtjN3hGdHpwQm1wbmo3YThxeGpIKzI3UHFhWStm?=
 =?utf-8?B?SnZLM21Nb0ZhQkt3NlNPcHptY3VrMFhzbzY0eHlaUkhJdjljMjVTTGw4NXVj?=
 =?utf-8?B?QUMwbGpIMU53dm5mUm1mRHRZbGc3UUxNRmwwdERWRnZpOFNnOE52aE5lNmRR?=
 =?utf-8?B?bEVUTkFINFc0SllpNE9aRzJYMUhxSXlQK0VQS0ZJY2RFR2s1aTBSa1kxelZT?=
 =?utf-8?B?Y1hmM3lpNy8vWDlFMTVxM3U4SnlicVdwQlEyMDNLWVlHQ3hFYmVEbDNkUWhN?=
 =?utf-8?B?MHpsbjQyb0FxdnA5dktiSlpROUFkNWxTWW9zdS9mQXVIeDN4RWlxT2dVWEhD?=
 =?utf-8?Q?FNZXxRU5K1DV2d0D9JOJWGQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc402202-e804-411b-7dac-08dab5ff18a9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 20:34:06.2957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hHulUDhaK1EwLVkjTtIBuVnf+vDifekpQ+zsn7sqoZIfdFG2AwRdbx2SuIZts0Fr5b9984hAPzDdK4NFQLZ0n502+DGJ+jnM8UFAVyaKipk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5821
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-24_07,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210240123
X-Proofpoint-GUID: Jc7k2ZM3lf80cgKdRI2UAaHFvaPn_TpA
X-Proofpoint-ORIG-GUID: Jc7k2ZM3lf80cgKdRI2UAaHFvaPn_TpA
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 10/24/22 10:42, Christian A. Ehrhardt wrote:
> - Fix memset argument order: The second argument is
>    the value, the length goes last.
> - Fix an integer overflow reported by Alexander Bulekov.
> 
> Both issues allow the guest to overrun the host buffer
> allocated for the ERST memory device.
> 
> Cc: Eric DeVolder <eric.devolder@oracle.com
> Cc: Alexander Bulekov <alxndr@bu.edu>
> Cc: qemu-stable@nongnu.org
> Fixes: f7e26ffa590 ("ACPI ERST: support for ACPI ERST feature")
> Tested-by: Alexander Bulekov <alxndr@bu.edu>
> Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>

Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>

Thanks Christian!
eric

> ---
>   hw/acpi/erst.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> index df856b2669..aefcc03ad6 100644
> --- a/hw/acpi/erst.c
> +++ b/hw/acpi/erst.c
> @@ -635,7 +635,7 @@ static unsigned read_erst_record(ERSTDeviceState *s)
>           if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
>               rc = STATUS_FAILED;
>           }
> -        if ((s->record_offset + record_length) > exchange_length) {
> +        if (record_length > exchange_length - s->record_offset) {
>               rc = STATUS_FAILED;
>           }
>           /* If all is ok, copy the record to the exchange buffer */
> @@ -684,7 +684,7 @@ static unsigned write_erst_record(ERSTDeviceState *s)
>       if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
>           return STATUS_FAILED;
>       }
> -    if ((s->record_offset + record_length) > exchange_length) {
> +    if (record_length > exchange_length - s->record_offset) {
>           return STATUS_FAILED;
>       }
>   
> @@ -716,7 +716,7 @@ static unsigned write_erst_record(ERSTDeviceState *s)
>       if (nvram) {
>           /* Write the record into the slot */
>           memcpy(nvram, exchange, record_length);
> -        memset(nvram + record_length, exchange_length - record_length, 0xFF);
> +        memset(nvram + record_length, 0xFF, exchange_length - record_length);
>           /* If a new record, increment the record_count */
>           if (!record_found) {
>               uint32_t record_count;
> 

