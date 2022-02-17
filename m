Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA5A4B9AC6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 09:20:11 +0100 (CET)
Received: from localhost ([::1]:60590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKc1K-0002Ws-Qj
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 03:20:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbY5-0003yi-NU
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:57 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:15356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbY3-0004Sp-2n
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:57 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H7nRVu010825; 
 Thu, 17 Feb 2022 07:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=u+alNkJGCskCrSF9zd0oMT5VkMK1hK4YVA0Rfqb8RCk=;
 b=sw1Hdlv92EI6CLQBZGGDggqUtyN2mRxcQHHnbJWd9AgQthQiY3Oz/77eFyKzr5SP/VoL
 j7qMWxDtEzvSzSGHI4IElQIe9b15muUlZ5Fn5pa1WzrSPPgW5dm2kJE3fs0Mc7dSvAYq
 ZfG8TlrOFQGAlhkPmYRPA1Y6CsuPbjlg7E6Zuv0DCwjMAPxn9MDt4RoiAexK3z6NhvLV
 BNEEeB4SJd1bEgYU9RIbVYQIDKPqkn/rtNBQMr9dN+/GWOWw1sPQP4APqfasg5ihMbes
 jTmhhz9fPWq0qqFWowAS3jRO+24AB6CSLj6s//DkwtEhntU/ObFZ7LNN43LFOblXzN0G QQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8nkdmt3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:42 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21H7gU2R135603;
 Thu, 17 Feb 2022 07:49:41 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by userp3020.oracle.com with ESMTP id 3e8n4vje24-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jP5f4oZ89H3kInXO2i03/cHFtrZb8bCD/zV0uuM6y+okVK0cwvrap5YlSE6A+y1dZRjO1OExfMmhGrxE5IriukDu4IzpnbcbydAN/ZTHApER/CQjJ3r7WyYdsDkqmvduzXvvntFAF3zKoMM3xbUbQcPE7+aJvwaOpd12K3XxSF8KuPEr/NEq2HC60EyGofnbZO54jbiY1UeKrtL/Slq/7t+qzlBxz7hjIZjtW3/bitZkVL4ER/CvIn92ZtkVlISvHCpAs447W8jyGu9F06vrnAk1tsvM/2iFvEhUuy9Tx9++kzyljnLDijUs4Wn+P5lMBUliKbqYHP9NtlFV5M3DhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+alNkJGCskCrSF9zd0oMT5VkMK1hK4YVA0Rfqb8RCk=;
 b=Br8G2sPIX9orlAJLMB9sL70/bv4r9ovfICcPMcp+uja2HHbLXuK0y01Ne8xKkCvba8gqJxkys+n7i0P55i6BjaS2y7rf/iYVVRKNHriI1+e1ELf8x5FbOjsi3Cr+8+rRXMuCieZjySY+OLrNLfEDwktrm975QCrvHPBz0zn0vNuiLcQp05NZWq2b0Qp6gW7f89imz4/4rTkZDjPTzW4ORaPOoIDcwCnvDgt96epKVAoUTVDTJ3c1pS/eQJV7eQ0HRQuXGiYVplOabSlxgwBlQB56a5S2zytXiGiLRCt3sYfG6VCeQvBD9rRZTQPw2pyhTBY/txBvRcFmNbUGu9N41A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+alNkJGCskCrSF9zd0oMT5VkMK1hK4YVA0Rfqb8RCk=;
 b=oTpQ9cwR4TnYQNYg2RvO5/iMeAzkjWoOxBg/gVL1BOalKciuGa+sURJtqxeAVCpN62Dzxgbx0IPrSTTyvTM2d+mLHAz0hLXx6+fIQTPWmZ9qIYsCidw74f7dC5MvQNV4J3rc76EQBCElElSPVag1JHmbibbnd2GCNPhz5nAwtRY=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by DM6PR10MB3211.namprd10.prod.outlook.com (2603:10b6:5:1a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Thu, 17 Feb
 2022 07:49:38 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe%6]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 07:49:38 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 12/19] vfio-user: IOMMU support for remote device
Date: Thu, 17 Feb 2022 02:48:59 -0500
Message-Id: <f6dc62f6957a6ae2d289a5810d48c717eefff861.1645079934.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1645079934.git.jag.raman@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:806:a7::7) To CH2PR10MB4008.namprd10.prod.outlook.com
 (2603:10b6:610:c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a519daa-9d33-4179-c17c-08d9f1ea0c4d
X-MS-TrafficTypeDiagnostic: DM6PR10MB3211:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB32110A66300232269564B0A190369@DM6PR10MB3211.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AxG5zQg3NiKgsyBO4uvRFAQfujxBj8Ir60tHF39UhysPNM9z5+XsUZt8u8vQaVWFHahC/UtLefIi3JekLfCQFPhbHESP9y/7K6wRpbGi84sUKJuZAwwSsyfoDqUoLvI28QGGTd1KGYWuTymQYs0RLQ7xN0rdi8WreJTvXCDBU3LaT14kVikUJNun/oi60krvmA6R8oHseuX+0vnfbp/N3WC9CdU2LfUL6pjZW1vlIyeEzlY6lPVPYBzxslHnwLEAQdbm1y4MxfXJFKAjAytfHjGNGKbXE4kOrYokjX4qySJDqZfJrg4QlXOuH8pF/gqGP53/WIzHNI0eYHqeZ939hB251CC82YN2hdtzmCRFcyYksFB7nWqYzqFCATvaqNq4+5EfUpTukbsuC8zfAquhrUVY/nB0c1/E59COpq3D8rb+2SVqLQu9YyWom1LD6hFGwxfZ20i42Jsj6PdQtuObUQizKTE++RVA/URquDK1z/DyBCAuXZ1LMt3Wp/EwK2XGCIOwqlkpT+bLLwYpPvkbioc32tgipJImZextGAhed73TVJq/gdqLgBs0dfJ6WJUtIqvIFvMqiNSzE8h0BOZWxWS0veCYrA1hJdyFoCJ0zBxpRwOjopr4PnZhXOJpNnBPP5yhHDMoTPAiny/dnfsAzK8lVCDze64QYtmJBDCBAHjrb/z88dlcjHOHtO/QykKPqBx+sFau/XwCOEOQAE9PtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(186003)(66946007)(38350700002)(7416002)(4326008)(107886003)(26005)(66556008)(6916009)(8676002)(5660300002)(2616005)(8936002)(86362001)(38100700002)(66476007)(36756003)(316002)(508600001)(52116002)(6512007)(6506007)(2906002)(6666004)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFJyeEtwNWdrZ2RXQnRyLzAyYUNJSnBtSFV0V2Jndmo5VnkzeS8rQkJVS2tW?=
 =?utf-8?B?QklKMU01SkhLVGp4SXBwc1l3QzZjSXg2Q2RNWURRaXdpWXJTVzU3d1p3dDdC?=
 =?utf-8?B?RE93NGpQOFphdDVNeEFBaXkxaEhYbU1IWlZCbWtzdk1Ob3lxOG9QZGc5N1Ra?=
 =?utf-8?B?L0xlMk1wbGpFV0VsWi95T1NiVmJORUhrbnpJSUZueTdaajhzM3pnR21vbkd6?=
 =?utf-8?B?RVo3Z1pEbFA0TzRaeXF3M2ljSTdmdWtLeWZZVmt2a1JDWlJhMEhFWlVZMkt1?=
 =?utf-8?B?bFRJZmp2dXhjNC9DZDRvWU8vZEs3T1RBMWM1dzlGMlFXakVPR0FoYlppbnBy?=
 =?utf-8?B?YWZJZ3lWMDQvMy9xZUtVVFN0QmY5a1o4SHZxR3hzWmZ0OEZwK2sxUWhnZnN6?=
 =?utf-8?B?YlFvQ1ZJd3JGQlJSUDNLMDZ3eGN3MTFCbTJlcDRmeTE2cGQ2S2dMM0xRNXZC?=
 =?utf-8?B?VWEwQVFvZHJYRHA4bEFLb2VKWlRnNkdYTEcyTHBqQTRSTFdSM2FtNUdIZHdH?=
 =?utf-8?B?c0RGU3R5QlVna0swcWVQSFVwUFU3U1BzaXE3YkJUZnpVL0ZrVGlHWUhCNVRD?=
 =?utf-8?B?R21RSUZZNkk5b0x5SCtOaDIvYW84anFBK1lvbjl4MTE1UUg3QzNxMlRHZzJq?=
 =?utf-8?B?Q29zV0hOc0Myc3Y0alFFcEVmUk9ZRkNoWFJyOGNVNDZEa2xRS0l3NVlaMWM2?=
 =?utf-8?B?MitNQ3UvaHExZG0vVnRsaGkwaHVHeEwvT3plWTFyeDQ1ZnBLaFI0ZW0xd0c0?=
 =?utf-8?B?Y1d3M3I1VThGbmNaNjFNbkNEd3RaeXloUmxhMDQ5Qm1Rak5aUVI5RW9oS1hU?=
 =?utf-8?B?S1NGWXlCZXoyb1VlMG9IdWFZV0tKdHNLV2dNdldhWTMzNmNUbjJCcm9KN0lp?=
 =?utf-8?B?eUlIRWFOR3daOUFiZU81aHl0OWd6eFE1Rk1vVCt4RWpJR0g1Mmw0TUM2dnhk?=
 =?utf-8?B?UENWZHFreEhrc3pOdkptUUY0YzU0RXFaaHB6VXljZHN6WmVGWHFZUEtrcDNQ?=
 =?utf-8?B?SmJTOE4rTFdNOU40RWd6SFpnUzFOOTE2RzI2QUk2bWhlSFU1WGh5bzN6cVlK?=
 =?utf-8?B?M2ZDeDEzTXUyMElQV1o0MlBrNG9oeUxrOGF5d1ZmTE9LN0JpV05YOElucGlL?=
 =?utf-8?B?bXcwMFNIMFpHT2drQlAzUWwzWUhNaHpoeWI4Z3RzbEh2RjBWOGdJMXR3ZkZP?=
 =?utf-8?B?YnVDR2R3ZmVGdkl6eTJQckdjUXJJcUFGV3VFUG9MRlFjb05NRFJYVy90ZndU?=
 =?utf-8?B?SmhmenRHVGQ4NW5PeE9xS3QyNTZDbW9rajBnSXlpOW1WZTJQYlY1Yzl4elRH?=
 =?utf-8?B?cmZleVYzRE1qbVkvNGNaRllZQ0tFU2cwQkd6K1I1QjlYL056eStKNmR4MDkx?=
 =?utf-8?B?ekhVTzBRT0pFS2dkYTR3Qkt4TkU5bngxQ2hYUjVKZ2RBY3hCQ0RlNW83RFpT?=
 =?utf-8?B?SG0yc3ArV2pNUEJFVEdqaWxRb3crM1VvQjBmNk13MXBjbXR5bXpZYlRlMjR6?=
 =?utf-8?B?UWViZURVUFpEMjhrQ01ONWRNZ2NJWDZuai8xU3J2YnRwdUxJRzZGakdoaFNq?=
 =?utf-8?B?eU82RkZEQ25wd1YxRVNEWlFnTSt0eFlNMGFwd2hLL3IzdzRIdlBvTEFxZDNB?=
 =?utf-8?B?dThaU0I1OHNUQkU1YTZNOG1lUXpXV01xK0dxWkQrMDBRNVMyR2VsMTNHK1dL?=
 =?utf-8?B?ekFLL2RzclFMa0MzY2V6NzhCcmh4N0UwQWNmaTlQUFlhSlhlZFU3MW10eU9i?=
 =?utf-8?B?SjZlVGhUWC9DdkthcjdSc0RWM2FGdUNXZ0RvMm05aG4yN1RSNjZLYzg3YVpl?=
 =?utf-8?B?WTZ3MVp2SkZIeTIrZjEzTlZ4YzQwR3lwaU5lRmlJcGpoMmZyVGRnWFlIa2xh?=
 =?utf-8?B?c2JHQytxTFc0ZXMwb0NRQ1FDZUVFVXBaVmtPSTA4bVY3S1dyR3FTak96M2Uw?=
 =?utf-8?B?SmJuMW1wWk1seXpBTW1MSTVhbXNqejdIS2dycHBnKzB3UFZDN1MwOW9JS3hK?=
 =?utf-8?B?MmZ4OVZnajVCWElYUkhQZXp4Vmp6ZEUxVFl2WEdmYk9UaTRWOUUrbjBVdHNo?=
 =?utf-8?B?eFEzRTNYT29NNDZnRDJDcGJFZ2lXZS9TdXIxYVRTc0NWY09BdVNVVVk2MW1G?=
 =?utf-8?B?cVZLUGtCMXdzeWc1dWFkTFdRY2lXbXR6bHlYcHp1OUZQcjEwQ1hWK3orUnQ2?=
 =?utf-8?Q?jpFIej/s8XDMty0MD/b69Xo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a519daa-9d33-4179-c17c-08d9f1ea0c4d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 07:49:38.1949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFeGhCmu0dH0++DOxsyEihYheUWwRTfJPTZGNZJnsO/onnUugHk8eq5FPfsNwrEl4T7/pxHg5SbPT+GVEVtXYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3211
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10260
 signatures=675971
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202170034
X-Proofpoint-ORIG-GUID: Ek_fupDNrPTsRhu3OJGr-sii5OBMxM_B
X-Proofpoint-GUID: Ek_fupDNrPTsRhu3OJGr-sii5OBMxM_B
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

Assign separate address space for each device in the remote processes.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/hw/remote/iommu.h | 18 +++++++++
 hw/remote/iommu.c         | 78 +++++++++++++++++++++++++++++++++++++++
 MAINTAINERS               |  2 +
 hw/remote/meson.build     |  1 +
 4 files changed, 99 insertions(+)
 create mode 100644 include/hw/remote/iommu.h
 create mode 100644 hw/remote/iommu.c

diff --git a/include/hw/remote/iommu.h b/include/hw/remote/iommu.h
new file mode 100644
index 0000000000..8f850400f1
--- /dev/null
+++ b/include/hw/remote/iommu.h
@@ -0,0 +1,18 @@
+/**
+ * Copyright © 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef REMOTE_IOMMU_H
+#define REMOTE_IOMMU_H
+
+#include "hw/pci/pci_bus.h"
+
+void remote_configure_iommu(PCIBus *pci_bus);
+
+void remote_iommu_del_device(PCIDevice *pci_dev);
+
+#endif
diff --git a/hw/remote/iommu.c b/hw/remote/iommu.c
new file mode 100644
index 0000000000..50d75cc22d
--- /dev/null
+++ b/hw/remote/iommu.c
@@ -0,0 +1,78 @@
+/**
+ * IOMMU for remote device
+ *
+ * Copyright © 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+
+#include "hw/remote/iommu.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci.h"
+#include "exec/memory.h"
+#include "exec/address-spaces.h"
+#include "trace.h"
+
+struct RemoteIommuElem {
+    AddressSpace  as;
+    MemoryRegion  mr;
+};
+
+GHashTable *remote_iommu_elem_by_bdf;
+
+#define INT2VOIDP(i) (void *)(uintptr_t)(i)
+
+static AddressSpace *remote_iommu_find_add_as(PCIBus *pci_bus,
+                                              void *opaque, int devfn)
+{
+    struct RemoteIommuElem *elem = NULL;
+    int pci_bdf = PCI_BUILD_BDF(pci_bus_num(pci_bus), devfn);
+
+    if (!remote_iommu_elem_by_bdf) {
+        return &address_space_memory;
+    }
+
+    elem = g_hash_table_lookup(remote_iommu_elem_by_bdf, INT2VOIDP(pci_bdf));
+
+    if (!elem) {
+        g_autofree char *mr_name = g_strdup_printf("vfu-ram-%d", pci_bdf);
+        g_autofree char *as_name = g_strdup_printf("vfu-as-%d", pci_bdf);
+
+        elem = g_malloc0(sizeof(struct RemoteIommuElem));
+
+        memory_region_init(&elem->mr, NULL, mr_name, UINT64_MAX);
+        address_space_init(&elem->as, &elem->mr, as_name);
+
+        g_hash_table_insert(remote_iommu_elem_by_bdf, INT2VOIDP(pci_bdf), elem);
+    }
+
+    return &elem->as;
+}
+
+void remote_iommu_del_device(PCIDevice *pci_dev)
+{
+    int pci_bdf;
+
+    if (!remote_iommu_elem_by_bdf || !pci_dev) {
+        return;
+    }
+
+    pci_bdf = PCI_BUILD_BDF(pci_bus_num(pci_get_bus(pci_dev)), pci_dev->devfn);
+
+    g_hash_table_remove(remote_iommu_elem_by_bdf, INT2VOIDP(pci_bdf));
+}
+
+void remote_configure_iommu(PCIBus *pci_bus)
+{
+    if (!remote_iommu_elem_by_bdf) {
+        remote_iommu_elem_by_bdf = g_hash_table_new_full(NULL, NULL,
+                                                         NULL, NULL);
+    }
+
+    pci_setup_iommu(pci_bus, remote_iommu_find_add_as, NULL);
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 751d97852d..f47232c78c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3569,6 +3569,8 @@ F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: subprojects/libvfio-user
 F: hw/remote/vfio-user-obj.c
+F: hw/remote/iommu.c
+F: include/hw/remote/iommu.h
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 534ac5df79..bcef83c8cc 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -6,6 +6,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iommu.c'))
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: files('vfio-user-obj.c'))
 
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: vfiouser)
-- 
2.20.1


