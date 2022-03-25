Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAED4E7A67
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:24:38 +0100 (CET)
Received: from localhost ([::1]:60302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXpY5-0007qj-AE
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:24:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpTx-0007VZ-4C
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:25 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:11658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpTu-00035r-FA
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:20 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PHJCs2031416; 
 Fri, 25 Mar 2022 19:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=qTPNoJb++i62u9jPgOKXnaF+7uWbatISZSIia3W0U20=;
 b=vdnOu3OIM6ieJnh7BOnVeE3esCcP1xy/yzF17rpOJ44jOJXBLSBkNY3ZJy3s7ZAkvIBP
 TI/LDCCGGIyBt+Hf7Jm6lxjtAvnuRXSFC48vh/JH2f2UmE3HMBBW6+gR2+ugObzC7YfV
 q78vsbKV+dk3WyRg1ses7iQ5ENgKZMxSKBtlr0tLwIchbI3CSWoLOqUrW3HXaAfBP4LZ
 t6vFJB90eOj6nkTCtRSiaTquH0pIwgA4b2fJ8Qb24DJK3F+9Jbp+dT9qnh0u5ZA5Zm0J
 9AeaEZwS1Lv4MPZ2c69wu4JR3H5N9jt9Ifj1F9MzP8Kv6C8f8RHW+LDSqa13Bp0M7V9N 1w== 
Received: from aserp3030.oracle.com ([141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew7qtgb2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:12 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22PJIFXe015896;
 Fri, 25 Mar 2022 19:20:10 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2044.outbound.protection.outlook.com [104.47.56.44])
 by aserp3030.oracle.com with ESMTP id 3ew5793v0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OyVOktu09QEHnWPfxOiMya3r6eSB7eVtCtdCYEl5L3og4ZDlMqM3xqNS/yA4UV9hVxUYkMLNTZPp7t5ddn1V47nHepTUtXozvFT6JQhZ0brbbbHwtw8C+0sMGqkXSrfQXkddJEAHltsA4OYv3yECT1Z9weuTJ8uu81xbExeqivrthTvmY0lehjcj6a3GLZm+Cw1cMtlkxsGGyqivULt5jQGR+MXJiEjH5ViLwgFbJWD58fgURDPhD0xvRL7MXgpzqRM7LnNaV34ISH/Mztf6/jAljFCoOhR2ni2kDFEgAGloWrTatoGCxOhwIptUgcSTtUzkWOabev1oUZG8XNKx6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTPNoJb++i62u9jPgOKXnaF+7uWbatISZSIia3W0U20=;
 b=WTgS22iAzEjGQCWWBKV1Y/KaqKixN+kgQalZ9UjERAptu/xilWKYxhoEQmQrjjtC55BLuDLE7s+GB3NMXZShOe8Wm7LhN7YQUMiWyunJhWY/cba8cNvLAEUCENkJMNKWFkfxE+JEb7i8IFgLV6tDEFijIjvOGxD1SMgWUfFHPYtKr2iLk3tBs1ez8PIqS8R1j6DRiecUEZis1maiTs/9bjWJudpglAaEBX+HryIqjS4j/bvg3717EtlX2h2uxt+pgqC7pRP/4nJZCxptocd53rJvkF/Bdt14lcETT/bmJeP97ebVd388nfW+kWyMSdrye3MekM3d9pB+yBjypgIKyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTPNoJb++i62u9jPgOKXnaF+7uWbatISZSIia3W0U20=;
 b=vTnAGSvICnqxWR4TwP16kh2eu3mpUT9fzmy10zSklJUP10z8HLvb5WVIcNqa1QX4XTNlvaXSbmyWgOvMf+F3pqCJ3Iaa9h2sKIGSkaj1HHWmXz7JqfUyrJ3B/xo0aHdnZ7uc86YU8QHaTyOObBcaRbJvF9t/1zACoIfFD51s9Vo=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN0PR10MB5206.namprd10.prod.outlook.com (2603:10b6:408:127::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 19:20:08 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 19:20:08 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 07/17] vfio-user: define vfio-user-server object
Date: Fri, 25 Mar 2022 15:19:36 -0400
Message-Id: <35c1c4121dab88dc66548b8d47b27db275ac08d8.1648234157.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1648234157.git.jag.raman@oracle.com>
References: <cover.1648234157.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR2101CA0024.namprd21.prod.outlook.com
 (2603:10b6:805:106::34) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2879cec7-73e1-4747-d28a-08da0e94798b
X-MS-TrafficTypeDiagnostic: BN0PR10MB5206:EE_
X-Microsoft-Antispam-PRVS: <BN0PR10MB520674B9621F0DB61586665B901A9@BN0PR10MB5206.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7XTD6pW4vg43ppm9Go4mjGEqn+8n67uW4W+5N2mFCJ11kAuCy5A+bV4OpDJ70V1bFFN+qZU1efFHqRp0y1S+4aGadHnw4GvS4fya7m3lnZ2A4xmrUQ8K4Ywp1u2A21g0msp9596E992UZn1QHXt9A72LZIc/vIC+8gSYq7tJ45Mp2qkYnFhTY4hZPjClPUvVmPMCDOSEYB7LQAQ1qUNXaCdUBKy6Unq6ReioPhCpnkZPW3Toluq4milBrDvBVEen7J1sSxsy0a04RUXSZfQmzoxgNOKnfePkCUmY66Pwhy9tKWOz389yDdBFusP7FKkXVQYt3Pt7z1b0P0kKGiFe91llil0+NPYPCa+nmnUUIpaKLDLeGqkU4zPk6O+OKUKeekbLOtQAvYn9xIt5vXaRz4iphdf7j7/7c85mXfUgJWdsNmzImnOh3aP1FsHGT0r9h0M5ZnVD8Fyo3p2JfaO1yeyVA2hKlMB9z6aA0I4WSHtkYaC+Oe+61t0OEWyuKXl6A7x4KG48LGM9SYBKn5R/jAYzHlABEVe21yY5a9BDTfMwDlKbHzhf6XftUL5ok3q0eCBKbupyHP33FeT6mLkaTz6tGwU6A4QBZ51VA57Tg3saBI7bhuH5daiz8skCBrDVKUGjlb/rPv3EopweNlY6TtbE6cmy9nem25TzprAIRDfff5vILyByQawgGlTGZaazlhrrMWyaXIPm0u7KkUPW2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(107886003)(316002)(2616005)(26005)(83380400001)(6486002)(36756003)(6666004)(6512007)(6506007)(52116002)(30864003)(66946007)(2906002)(86362001)(508600001)(38100700002)(38350700002)(6916009)(66476007)(8936002)(7416002)(5660300002)(66556008)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUowVW53UGEwYndnZENaaytyeHlGOWM3THpLdWZ1cGpXTS9DbTFjWEY5OWw0?=
 =?utf-8?B?R1VtUU1lMEhaa2RZdm91bldBVGVWV2FNOGVqMjJ6K294UHBVcEZ0UTBZWS9U?=
 =?utf-8?B?UVgxWE1zTGZjMU9Vb0hDaVN4bGxwNVBtTmdOSVcySTdPWTc1c0FpNTZNdEFr?=
 =?utf-8?B?RzlnRGJjRmtWK0dRZXR5bzJzSmJyTStSUXE4Y0lJckdoZWRNUVAvSmNVcDRJ?=
 =?utf-8?B?SUF2UDgyNmhadlNMRCtpTjhOajNOZHBXNm9nRHF1STk2bzd4Q2pXamdJREVv?=
 =?utf-8?B?TjZJS0pnKzJVcGgzWUkwb2luNUJSY3d1bk5mcVN1WXNDU1owK2djS3k2VXc5?=
 =?utf-8?B?VHpzZWF4NDBXSHhhKy9PNnFEclBlUDNxQ1dJaFZ0cDZCYjF5cFY0TVJVaUdL?=
 =?utf-8?B?MDY5Z1diVmFQUUFNMHk3RE5XUjF1QjQ5S05vT25BWUpxWFpNZno4ZkpKaVFF?=
 =?utf-8?B?Q1U4RWJHSHZsaDcwN1JxOHM2NkJCRlg5eEM5L00rZiswNWYzS3kvR1NBZC9Y?=
 =?utf-8?B?SVFxenFocFNKcFl5UExseERIT0JjU0xmR09YUEtoeEdERlV3b05ZZWEvTXZ3?=
 =?utf-8?B?U2p2UzljTitVWklkcVpNRy8wSG9Hc1hLc1czbC90MDlTbW1uUHRFVHRTMHpO?=
 =?utf-8?B?SUpTQldOZGRmOVhza1RFekxmNyt3c2tTcGwwcVI4T1ZkRW1yV01lWlRrNnVB?=
 =?utf-8?B?Z2hVUDBqSDFUeE1WSjczcUlEbHNPMldjcEJaOGVoeUgvSnJwYXZqUUtaVVA4?=
 =?utf-8?B?Z1FJcTRXUTBRQVVjRGtYNXBSSkU5TmdMSExSakU3V3RKVlE1a2RlY01MMEVD?=
 =?utf-8?B?V3VuMWJLUm5EVit1RmRLbndhOCtJVjZWTGdHdVdxTFFDa2RnSmFFZ05NVnhZ?=
 =?utf-8?B?MFZlVGRlUHIrNUFLaTlqMllxRnE3ZG1TeCtQbmdXOVRqdlBhVzZudi9YUlA3?=
 =?utf-8?B?cnBlSjhuL1Z5WVJDT2FKTVZXcDZGczJhREdDN1NiZmsyaHRQV3dQbU5ZdWg5?=
 =?utf-8?B?b1VCMmtlekRZbU1tdWVabU51UE9lckpTbkFSSjlvay9PbzJ5RGNleTBtWTlL?=
 =?utf-8?B?bUtkTmxhNVlvSEp3NG1kclNaeUJJaHhtbDdnTEg0cGw4ZkovbjllYU9CN281?=
 =?utf-8?B?QW1wNGh0cmZoL2J6QVVyOHRXdmNCMUFJMzJGZzFseTQ5YWxKNzJwTlh6empq?=
 =?utf-8?B?aHl2Z1E3R3ZxTHVCcUxnbGRtcFl6QWt1ODdxSWdtWW5Uc0xlYXFwNmdRQUxy?=
 =?utf-8?B?VXRkWlRsSE5TUFFrT1ZNSmJINXJNVXpZMGV0RUVrdjJXNDg5S0N4T0FjazBj?=
 =?utf-8?B?YytuUTZPYmlRQkttWTZwcDBRRHFTTURSL2xNS1FxeVEwTmtUQ254NlJ4WUVX?=
 =?utf-8?B?bmJwMjlSZ3dhekNiUEJQMWRDREsyZ293clV0c0w4cisxcWNXY1EvRWZyN3No?=
 =?utf-8?B?YzVEZ1p4VVlBZGZIOEozWkVzbG5SQ0l3dHgvbWpiQ080OUZBc1RsQnd0Mk1N?=
 =?utf-8?B?RWlSdkFBUEpDd0hodS9SYXR3dW40b3BoTFFvU1RmeFNrZkFONmViS3ZmekFo?=
 =?utf-8?B?a3pmOWlZcjZzbWZnNTNzT2h4RTZwVzVtRnVraTlnZmF2ME9hbE1VejBFdTY2?=
 =?utf-8?B?T2NkTjJ6ZEtyUGFpaXlOWGZwblRHOWNiN2UvaURoNm9HZnIxQVVPMWgrOFdi?=
 =?utf-8?B?QWJoampORjV2MzNkYzhEbE1MS1VPZmFJQ1NydWgyQmd5WWxUR2d5ZXhaV28x?=
 =?utf-8?B?Z3Awd1U4R2hOekU1UzEwK1dUdVY0aTI5dFZXWHZXMFhpaE1RV3RCK0R0NHJE?=
 =?utf-8?B?L0RsVFVLMXlZYU9SZkEzQ2NEUFNSRVpVTStBQ1FIOU14SXY4ZzlIYmVqTFhy?=
 =?utf-8?B?THBnbXVKejcrRS9GRkN4ODVHOFBMOE5MakpXMlZ3RUpqK0ZWTUNYMGhNT1pV?=
 =?utf-8?B?QTVpaXU2MjBzcDJKSnpkWm9jZWpCdEdEdzk3TStWdSt0VXM4QkZXbVBZQTU4?=
 =?utf-8?B?N1puVEYvYkVsbG01ekIwdXBaSXFIaEpzOW9uTHhza3pHRmFaS1RzU0VQNjNs?=
 =?utf-8?B?U1I3UzVGb2lpd1ZUWEFOVW9YcXA2THJYTjhQWnNpSTZzQmk2VkE0d0h3eXBB?=
 =?utf-8?B?clRkb3VCOG9pRWpjYmhPTm5JRHRWTGVBSTBMbUpEc2RiWXVwT1F5VnVUcmZK?=
 =?utf-8?B?Vlg0YVNNZXc5UTA2V3VhRldsbXBMSG5qZW9adCtIL2JqS09weTgzN0ZmRUM0?=
 =?utf-8?B?Z1hkTVlDNHR1UlkzSU1ZQXNLZW9ObVR2aVhoV0tyYTJFajFBUStrc1l5RTYz?=
 =?utf-8?B?VFR6OTkrU3A5L0pITVZieGlHL0ZsaS90RSswNjhDeEVxYUdvaDk1UT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2879cec7-73e1-4747-d28a-08da0e94798b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 19:20:08.5845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MwZZ/72irX9ADU+mvEx0uED7PM20R5uiYgoIeMMMzOGEDPs8wpDOza/TO2f2bH51SZrXsfmA/3xJseGyeY32uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5206
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10297
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203250106
X-Proofpoint-GUID: tGQWrJz1nWiTFeLC5BU72Tifa8x4Ptd9
X-Proofpoint-ORIG-GUID: tGQWrJz1nWiTFeLC5BU72Tifa8x4Ptd9
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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

Define vfio-user object which is remote process server for QEMU. Setup
object initialization functions and properties necessary to instantiate
the object

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 qapi/qom.json               |  20 +++-
 include/hw/remote/machine.h |   8 +-
 hw/remote/machine.c         |  23 ++++
 hw/remote/vfio-user-obj.c   | 211 ++++++++++++++++++++++++++++++++++++
 MAINTAINERS                 |   1 +
 hw/remote/meson.build       |   1 +
 hw/remote/trace-events      |   3 +
 7 files changed, 264 insertions(+), 3 deletions(-)
 create mode 100644 hw/remote/vfio-user-obj.c

diff --git a/qapi/qom.json b/qapi/qom.json
index eeb5395ff3..e7b1758a11 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -703,6 +703,20 @@
 { 'struct': 'RemoteObjectProperties',
   'data': { 'fd': 'str', 'devid': 'str' } }
 
+##
+# @VfioUserServerProperties:
+#
+# Properties for x-vfio-user-server objects.
+#
+# @socket: socket to be used by the libvfiouser library
+#
+# @device: the id of the device to be emulated at the server
+#
+# Since: 7.1
+##
+{ 'struct': 'VfioUserServerProperties',
+  'data': { 'socket': 'SocketAddress', 'device': 'str' } }
+
 ##
 # @RngProperties:
 #
@@ -842,7 +856,8 @@
     'tls-creds-psk',
     'tls-creds-x509',
     'tls-cipher-suites',
-    { 'name': 'x-remote-object', 'features': [ 'unstable' ] }
+    { 'name': 'x-remote-object', 'features': [ 'unstable' ] },
+    { 'name': 'x-vfio-user-server', 'features': [ 'unstable' ] }
   ] }
 
 ##
@@ -905,7 +920,8 @@
       'tls-creds-psk':              'TlsCredsPskProperties',
       'tls-creds-x509':             'TlsCredsX509Properties',
       'tls-cipher-suites':          'TlsCredsProperties',
-      'x-remote-object':            'RemoteObjectProperties'
+      'x-remote-object':            'RemoteObjectProperties',
+      'x-vfio-user-server':         'VfioUserServerProperties'
   } }
 
 ##
diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h
index 8d0fa98d33..2fcb9dada5 100644
--- a/include/hw/remote/machine.h
+++ b/include/hw/remote/machine.h
@@ -26,6 +26,12 @@ struct RemoteMachineState {
     bool vfio_user;
 };
 
+struct RemoteMachineClass {
+    MachineClass parent_class;
+
+    bool auto_shutdown;
+};
+
 /* Used to pass to co-routine device and ioc. */
 typedef struct RemoteCommDev {
     PCIDevice *dev;
@@ -33,7 +39,7 @@ typedef struct RemoteCommDev {
 } RemoteCommDev;
 
 #define TYPE_REMOTE_MACHINE "x-remote-machine"
-OBJECT_DECLARE_SIMPLE_TYPE(RemoteMachineState, REMOTE_MACHINE)
+OBJECT_DECLARE_TYPE(RemoteMachineState, RemoteMachineClass, REMOTE_MACHINE)
 
 void coroutine_fn mpqemu_remote_msg_loop_co(void *data);
 
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index a9a75e170f..70178b222c 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -78,25 +78,48 @@ static void remote_machine_set_vfio_user(Object *obj, bool value, Error **errp)
     s->vfio_user = value;
 }
 
+static bool remote_machine_get_auto_shutdown(Object *obj, Error **errp)
+{
+    RemoteMachineClass *rmc = REMOTE_MACHINE_GET_CLASS(obj);
+
+    return rmc->auto_shutdown;
+}
+
+static void remote_machine_set_auto_shutdown(Object *obj, bool value,
+                                             Error **errp)
+{
+    RemoteMachineClass *rmc = REMOTE_MACHINE_GET_CLASS(obj);
+
+    rmc->auto_shutdown = value;
+}
+
 static void remote_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    RemoteMachineClass *rmc = REMOTE_MACHINE_CLASS(oc);
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
 
     mc->init = remote_machine_init;
     mc->desc = "Experimental remote machine";
 
+    rmc->auto_shutdown = true;
+
     hc->unplug = qdev_simple_device_unplug_cb;
 
     object_class_property_add_bool(oc, "vfio-user",
                                    remote_machine_get_vfio_user,
                                    remote_machine_set_vfio_user);
+
+    object_class_property_add_bool(oc, "auto-shutdown",
+                                   remote_machine_get_auto_shutdown,
+                                   remote_machine_set_auto_shutdown);
 }
 
 static const TypeInfo remote_machine = {
     .name = TYPE_REMOTE_MACHINE,
     .parent = TYPE_MACHINE,
     .instance_size = sizeof(RemoteMachineState),
+    .class_size = sizeof(RemoteMachineClass),
     .class_init = remote_machine_class_init,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_HOTPLUG_HANDLER },
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
new file mode 100644
index 0000000000..c4d59b4d9d
--- /dev/null
+++ b/hw/remote/vfio-user-obj.c
@@ -0,0 +1,211 @@
+/**
+ * QEMU vfio-user-server server object
+ *
+ * Copyright © 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL-v2, version 2 or later.
+ *
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+/**
+ * Usage: add options:
+ *     -machine x-remote,vfio-user=on,auto-shutdown=on
+ *     -device <PCI-device>,id=<pci-dev-id>
+ *     -object x-vfio-user-server,id=<id>,type=unix,path=<socket-path>,
+ *             device=<pci-dev-id>
+ *
+ * Note that x-vfio-user-server object must be used with x-remote machine only.
+ * This server could only support PCI devices for now.
+ *
+ * type - SocketAddress type - presently "unix" alone is supported. Required
+ *        option
+ *
+ * path - named unix socket, it will be created by the server. It is
+ *        a required option
+ *
+ * device - id of a device on the server, a required option. PCI devices
+ *          alone are supported presently.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+
+#include "qom/object.h"
+#include "qom/object_interfaces.h"
+#include "qemu/error-report.h"
+#include "trace.h"
+#include "sysemu/runstate.h"
+#include "hw/boards.h"
+#include "hw/remote/machine.h"
+#include "qapi/error.h"
+#include "qapi/qapi-visit-sockets.h"
+
+#define TYPE_VFU_OBJECT "x-vfio-user-server"
+OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
+
+/**
+ * VFU_OBJECT_ERROR - reports an error message. If auto_shutdown
+ * is set, it aborts the machine on error. Otherwise, it logs an
+ * error message without aborting.
+ */
+#define VFU_OBJECT_ERROR(o, fmt, ...)                                     \
+    {                                                                     \
+        if (vfu_object_auto_shutdown()) {                                 \
+            error_setg(&error_abort, (fmt), ## __VA_ARGS__);              \
+        } else {                                                          \
+            error_report((fmt), ## __VA_ARGS__);                          \
+        }                                                                 \
+    }                                                                     \
+
+struct VfuObjectClass {
+    ObjectClass parent_class;
+
+    unsigned int nr_devs;
+};
+
+struct VfuObject {
+    /* private */
+    Object parent;
+
+    SocketAddress *socket;
+
+    char *device;
+
+    Error *err;
+};
+
+static bool vfu_object_auto_shutdown(void)
+{
+    bool auto_shutdown = true;
+    Error *local_err = NULL;
+
+    if (!current_machine) {
+        return auto_shutdown;
+    }
+
+    auto_shutdown = object_property_get_bool(OBJECT(current_machine),
+                                             "auto-shutdown",
+                                             &local_err);
+
+    /*
+     * local_err would be set if no such property exists - safe to ignore.
+     * Unlikely scenario as auto-shutdown is always defined for
+     * TYPE_REMOTE_MACHINE, and  TYPE_VFU_OBJECT only works with
+     * TYPE_REMOTE_MACHINE
+     */
+    if (local_err) {
+        auto_shutdown = true;
+        error_free(local_err);
+    }
+
+    return auto_shutdown;
+}
+
+static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    VfuObject *o = VFU_OBJECT(obj);
+
+    qapi_free_SocketAddress(o->socket);
+
+    o->socket = NULL;
+
+    visit_type_SocketAddress(v, name, &o->socket, errp);
+
+    if (o->socket->type != SOCKET_ADDRESS_TYPE_UNIX) {
+        error_setg(errp, "vfu: Unsupported socket type - %s",
+                   SocketAddressType_str(o->socket->type));
+        qapi_free_SocketAddress(o->socket);
+        o->socket = NULL;
+        return;
+    }
+
+    trace_vfu_prop("socket", o->socket->u.q_unix.path);
+}
+
+static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
+{
+    VfuObject *o = VFU_OBJECT(obj);
+
+    g_free(o->device);
+
+    o->device = g_strdup(str);
+
+    trace_vfu_prop("device", str);
+}
+
+static void vfu_object_init(Object *obj)
+{
+    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(obj);
+    VfuObject *o = VFU_OBJECT(obj);
+
+    k->nr_devs++;
+
+    if (!object_dynamic_cast(OBJECT(current_machine), TYPE_REMOTE_MACHINE)) {
+        error_setg(&o->err, "vfu: %s only compatible with %s machine",
+                   TYPE_VFU_OBJECT, TYPE_REMOTE_MACHINE);
+        return;
+    }
+}
+
+static void vfu_object_finalize(Object *obj)
+{
+    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(obj);
+    VfuObject *o = VFU_OBJECT(obj);
+
+    k->nr_devs--;
+
+    qapi_free_SocketAddress(o->socket);
+
+    o->socket = NULL;
+
+    g_free(o->device);
+
+    o->device = NULL;
+
+    if (!k->nr_devs && vfu_object_auto_shutdown()) {
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+    }
+}
+
+static void vfu_object_class_init(ObjectClass *klass, void *data)
+{
+    VfuObjectClass *k = VFU_OBJECT_CLASS(klass);
+
+    k->nr_devs = 0;
+
+    object_class_property_add(klass, "socket", "SocketAddress", NULL,
+                              vfu_object_set_socket, NULL, NULL);
+    object_class_property_set_description(klass, "socket",
+                                          "SocketAddress "
+                                          "(ex: type=unix,path=/tmp/sock). "
+                                          "Only UNIX is presently supported");
+    object_class_property_add_str(klass, "device", NULL,
+                                  vfu_object_set_device);
+    object_class_property_set_description(klass, "device",
+                                          "device ID - only PCI devices "
+                                          "are presently supported");
+}
+
+static const TypeInfo vfu_object_info = {
+    .name = TYPE_VFU_OBJECT,
+    .parent = TYPE_OBJECT,
+    .instance_size = sizeof(VfuObject),
+    .instance_init = vfu_object_init,
+    .instance_finalize = vfu_object_finalize,
+    .class_size = sizeof(VfuObjectClass),
+    .class_init = vfu_object_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+static void vfu_register_types(void)
+{
+    type_register_static(&vfu_object_info);
+}
+
+type_init(vfu_register_types);
diff --git a/MAINTAINERS b/MAINTAINERS
index 0488bae9d0..e7b0297a63 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3598,6 +3598,7 @@ F: include/hw/remote/proxy-memory-listener.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: subprojects/libvfio-user
+F: hw/remote/vfio-user-obj.c
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index dfea6b533b..534ac5df79 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -6,6 +6,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
+remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: files('vfio-user-obj.c'))
 
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: vfiouser)
 
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 0b23974f90..7da12f0d96 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -2,3 +2,6 @@
 
 mpqemu_send_io_error(int cmd, int size, int nfds) "send command %d size %d, %d file descriptors to remote process"
 mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d, %d file descriptors to remote process"
+
+# vfio-user-obj.c
+vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
-- 
2.20.1


