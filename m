Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD856332A36
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:21:00 +0100 (CET)
Received: from localhost ([::1]:42486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeAN-0006GJ-Ok
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:20:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJdXN-0002r9-B7; Tue, 09 Mar 2021 09:40:41 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:47260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJdXB-0003nR-NH; Tue, 09 Mar 2021 09:40:41 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 129EdW55002507;
 Tue, 9 Mar 2021 14:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2020-01-29;
 bh=ivg1YK03628eD06d3Bc8f6LNatdlZ2ObHwxMU5SHTSg=;
 b=rvUJmD8eZioUfPdyiIy9UOt7tpyC+GlhB9n0U2BDeJFsHCISwLAuea0rzp18OPEXyxK+
 ljGj9NYZGjxhbuaJbv7UUJPvXUHUxaM5MAWYfwEwaNMsrG+BtGNJo82j3XWCEg/R9RA7
 rcYBjV9nRgJo1Kg9ebodQAoaAyO4JvnhvojBvOzv+q57Thh4DKg9oPnVLg5vODkzmX/A
 ZU7/+sXuO/ch7e7rh6mHR/t45GcZDCYfm7LALTTJRnW97MV3xxa/p/sKvUrFXqtrpGXn
 970fV3kEtieGQFJ+IU+nnwsNUTUNIjHdo3LBkAi+ru4WX+5vZ46B2lbP69SSyPAkh8Nb xA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 373y8bqmn5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 14:40:25 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 129EVOIU193167;
 Tue, 9 Mar 2021 14:40:24 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by userp3030.oracle.com with ESMTP id 374knwwjv0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 14:40:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ou3xFhtuIl+787QiYvLN2EPzrxTRWOFayenSXLrRcg/AZ3x1gzH7BORyYuzdkTK5pm4EQhcM73b3pmtodYPsKXNLYo+9TomJwML9NBLxd19n0xXkKlZziqRFO/XGAvoJGsAUfw6BYP3kXR+s9uqhv1hCmjMDFxDwVL5g5uSJC6EghhbLMX6H1YfjWvazSGiWfZMaIFdvRW89u0+fqe1FgdhEX2xw+l4p1KzK1ZC/N7PgmgxInfzbOzZ5Qt0UUwteShGFObvevtASARhnfETyqoW9PR06EloBSyXy/BUcD5sUzPqZhgmsn3Tj2HT6x2yt+kmuDU3iwe4XpRco2aoE1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivg1YK03628eD06d3Bc8f6LNatdlZ2ObHwxMU5SHTSg=;
 b=BqtqeUuZQ3ls292VMNKwg0Yp0ApXmBWBcx+0pgZQ0RPWcHbIb+he2tJtUT0fA5Qbh8HP+o1qpnEvB8anAodi5w11OOhCwN+bSIGrq1vZbr01i6jrUGdKYe6jAlCwZKm9CHq9ItzWrvMgVYhKqPjanjpKPq7w+NkqLHyPqLelZPjQsTcqtblgsmna9yYT6J4KPxDrGaN6ilvKWYHNc6yI+l7749vOFuapzondut2Hgt7h+NB3gnUMhsr83Q87IhyCTRUBG13Kz3GEW4tbKhcSk/bgEy8hpIcyFRGBLZVs8A/xa65HP9q2WQEWR+X8xE8dLBVYZaoTBp6CcYSwltA+Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivg1YK03628eD06d3Bc8f6LNatdlZ2ObHwxMU5SHTSg=;
 b=grdYiNQa8YkqrEHSyMV2R4xjKEFm9eo3XQYM1fUMA26f1s9ph4bj/oHk8I+ruqIZ7loAViDgaYuwhA2LZhcY7xn5dHVnnqAc0ETk2XV8/EqD36Z/Vq3zcE2626kJ38ZQw2cNM2NMpLRFLx2cp2db2BRSfO+z3MRBGWcHmQOVMtQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM6PR10MB3804.namprd10.prod.outlook.com (2603:10b6:5:1f6::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Tue, 9 Mar
 2021 14:40:21 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3890.038; Tue, 9 Mar 2021
 14:40:21 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] coroutine rwlock downgrade fix, minor VDI changes
Date: Tue,  9 Mar 2021 14:40:09 +0000
Message-Id: <20210309144015.557477-1-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO4P123CA0438.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::11) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO4P123CA0438.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a9::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26 via Frontend Transport; Tue, 9 Mar 2021 14:40:20 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 98e1bfbe;
 Tue, 9 Mar 2021 14:40:15 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf016efe-c42e-4492-32aa-08d8e3094423
X-MS-TrafficTypeDiagnostic: DM6PR10MB3804:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR10MB3804B78A7B581921441C66F888929@DM6PR10MB3804.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZZwwXT8iJL8w0aLiVuUq8SEphkah6du+uGnxSAH6j4PKdJlLc3ddVbCOn6Ixgf5qG6Az6RmFi0zC9whH529ka4xV4lTZGy/bjwgBlTBVDkMxfeNtaMfXNJNjX2b7JIJcBd8Nl8u48zldKWBY1cWsVKZoq1bahxyfoOiWfmJWnf8ftC/S46nM9d4/eJZzNDsbVmhq8SQVB+D66I96z3CYbHm7NlTHI1c1YSSz39UrC/1xpdhW0mmZV3sVrntG56eqwddGUGEYsTJkArCn0yK0ru9CDbTC/9lLRdQycEuyNtYrOMtkDGmjeKslRCd+SBDp12+rs3nzTfhoSjhkAIJJepggxlvO01ODnPKzbhE/NvqajBvmw7EdaRebAgSLPApr30WdDuVv2J2FvJ5hpDoq7rs++wks4ImC04H6jgFSXr0WIHpKfVH/pAhKLqprAlmjPZ9soAglTALqFfWzPdTwV6qnYLbHOf/+2Fe0aXgwOazFa/Rhj+FmlAQE31sbCViLLz5+u+RMlSv8+XMF7gdnEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(366004)(376002)(136003)(39860400002)(8936002)(52116002)(6666004)(66946007)(66476007)(66556008)(8676002)(316002)(54906003)(86362001)(1076003)(83380400001)(5660300002)(6916009)(478600001)(4326008)(44832011)(36756003)(2906002)(2616005)(186003)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MFZvY2hqRi9Ob09odGd4NU1YalVkelg1VC9IZFJ3b1ljejZnREZqdklhb1lH?=
 =?utf-8?B?ZkoyUW1kUjBPNCtOZ2ZyUCs2NUZNQmcxSnlHQlhGNzBseVdLamRBNS9tU2NZ?=
 =?utf-8?B?RGNrY094UUZIcHkvT2Q0emhkYm1QQ1BmSkdDMWpzeGFoL3hHazRGZC83SXh4?=
 =?utf-8?B?SXMvYzRvd0hvL0N5RTVsRzJKTzg4SUtuSmVvdHl2RU43YzRQelpKN2RkVnkv?=
 =?utf-8?B?SS8xVTRJWldkblB0SEpiLy96Z2JqU25rdVFwQ0NBUkt3Q1l1TDk1WUJWYU1s?=
 =?utf-8?B?Z2ROSjFmUFVLZzlMdnRwd210YlI5NWlFcy9QbWxjR2JybGM1YjErbVFpQ1Fj?=
 =?utf-8?B?VnQrbm5rVWd3TjY3QjBBajNhTk9DR2YybUJFaFpKeU8wc0RCb05NRi9Sd0pU?=
 =?utf-8?B?Ymo5RCtkS292TlB5ZGRlY2RQRW5hVmhtOHFHZXdIMW44b1BXK3lCYVl1QlQx?=
 =?utf-8?B?bHpQYWwzVXM1U2tjVlhlNGYzVDJZa21xYmxBNU5qbHAwenR3TGJYeTNuSVJU?=
 =?utf-8?B?c3pxNFlVZkFSY2U4d1FpZlVueGU2Y0dGemt0MmkvUXRHTjEyeWtRQ2hqaHd1?=
 =?utf-8?B?YWJvQXRzK3pQZDVCOHBYZm85TnBPUzhTRU5qOUNTMVFhcXVBVXlOMGZsU1NH?=
 =?utf-8?B?anNzTCtCeS9xSXhFSzFFeGFXc2FnZngxSmNqVWFOZkQvaWFkUW1xc3NxMnlo?=
 =?utf-8?B?L1htdXJwdVVGdXl5Q2xlTXhIeUR6SlJrelA5THAwaDI0K0VnTXl5a09oM3NP?=
 =?utf-8?B?aC9mNjFudjVXVkpDNVNRTmJFUzVXaHUzL0MrcXk0a0pGeGE4OWFFbzhKVXhR?=
 =?utf-8?B?WWJ3YlVHRXcraENkWUQ1SVFRSjlQYWdOZ3hPVnZBQk1QTDRJcExOZnZQdDRC?=
 =?utf-8?B?M2JPY2RGSXZyR21kc1ZUd2Y4UUNRLzB2QncyZVpBY3RmTlhISHV5NXZJR0py?=
 =?utf-8?B?cnZPY254NWNheGRDdk1xV0V3aVR2V1dNZDdQclVmZXBkZWR3WTFIYVZEdFVI?=
 =?utf-8?B?Ni9taHhGeCtMV0dMaFNDRWpLV0VGTlM1Ly9rVU5MUHJNejF5NEY0UThxSTlV?=
 =?utf-8?B?WmRIbkR2UVkyME9uTEhWZWJ3bTNmTlBKSzNCSHh3WG1PSmFqY1NhMC9uQ1RS?=
 =?utf-8?B?MFYwUlhjZVlhT0hTaWJXb3B3b2R1dGRMV21vbHNlcE9WanA1MitNVmZrYUNW?=
 =?utf-8?B?a2MvYzdLSWRteGZOOXlITDFXOGNSWm9yUW41dENZM2tnMVBFbmRtRkVHVFZJ?=
 =?utf-8?B?bm5URi8vUEhDT3dOMWZUV01VVXdBdUFvRTJVSXhuSG5qWWswc3VJaXlnOHB6?=
 =?utf-8?B?VFZWaDBrOEtzT01zRmFNR2Q1RTdtVjk0citFNG4rZXovcXdiOElzRGhHMFFK?=
 =?utf-8?B?TXh3RWM2WmZyN0VsSFFGS04rUmlWb3ZvQ0RmQ2cyaVpIQTdLVSs3K2Y2cXlT?=
 =?utf-8?B?akZRUFlkNGMyWWoxOURpSWRQSmR6dkFWemdEUWVYQ2cwNW9lWUx5TFlMUjU1?=
 =?utf-8?B?UWdPT2tHMWJ1aUVJQzE1VFRtOHJ5c2NBLzI0eWNTOGRNbGR3OHpJamhONUtw?=
 =?utf-8?B?YmNKSTF4VGdGeHpoU2FsWFh0N2lyZmk1djFWNVJhbkwyb29GdEszK0xlUzM5?=
 =?utf-8?B?Ukh0RWFoNCtRSmxvdDljcUhRajlrN3Z6Q05HSE02UkZhdUZWajR0czkzOXMz?=
 =?utf-8?B?dEl0aGlQdlVwbXdqODVLVXJjS255NndyTHhCajZlY2h5K2VwMXFnVlNxN2d5?=
 =?utf-8?B?emd6LzZXZWtpOTFhejFrWkZsNTNRTDJCNWZRVm9kN2lKS1VHVjRqN3cxU0Iz?=
 =?utf-8?B?M1M1b3J1NVdieW5VSXEvQT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf016efe-c42e-4492-32aa-08d8e3094423
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 14:40:21.5030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ioLqIoQoHpjHoa779tIA0TSGjuLS0tT9cEpvfviw4aWrH3HFctEdzO+3gxOy4ayBz8Qxo0NOjZL0Q0vPaOuS1H/XUxpSzFzeM2J1NDutvzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3804
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9917
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103090074
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9917
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 mlxscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103090075
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=david.edmondson@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Max Reitz <mreitz@redhat.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stressing the VDI code with qemu-img:

  qemu-img convert -p -W -m 16 -O vdi input.qcow2 output.vdi

leads to a hang relatively quickly on a machine with sufficient
CPUs. A similar test targetting either raw or qcow2 formats, or
avoiding out-of-order writes, completes fine.

At the point of the hang all of the coroutines are sitting in
qemu_co_queue_wait_impl(), called from either qemu_co_rwlock_rdlock()
or qemu_co_rwlock_upgrade(), all referencing the same CoRwlock
(BDRVVdiState.bmap_lock).

The comment in the last patch explains what I believe is happening -
downgrading an rwlock from write to read can later result in a failure
to schedule an appropriate coroutine when the read lock is released.

A less invasive change might be to simply have the read side of the
unlock code mark *all* queued coroutines as runnable. This seems
somewhat wasteful, as any read hopefuls that run before a write
hopeful will immediately put themselves back on the queue.

No code other than block/vdi.c appears to use
qemu_co_rwlock_downgrade().

The block/vdi.c changes are small things noticed by inspection when
looking for the cause of the hang.

v2:
- Add some r-by (Philippe, Paolo).
- Add a test for the rwlock downgrade behaviour (Paolo).
- Improve unlock to avoid thundering herd (Paolo).

David Edmondson (6):
  block/vdi: When writing new bmap entry fails, don't leak the buffer
  block/vdi: Don't assume that blocks are larger than VdiHeader
  coroutine/mutex: Store the coroutine in the CoWaitRecord only once
  test-coroutine: Add rwlock downgrade test
  coroutine/rwlock: Wake writers in preference to readers
  coroutine/rwlock: Avoid thundering herd when unlocking

 block/vdi.c                |  11 ++--
 include/qemu/coroutine.h   |   8 ++-
 tests/test-coroutine.c     | 112 +++++++++++++++++++++++++++++++++++++
 util/qemu-coroutine-lock.c |  27 ++++-----
 4 files changed, 138 insertions(+), 20 deletions(-)

-- 
2.30.1


