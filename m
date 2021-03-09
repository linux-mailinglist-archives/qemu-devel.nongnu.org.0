Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E083329F3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:15:30 +0100 (CET)
Received: from localhost ([::1]:53412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJe53-0007Tf-I4
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:15:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJdXM-0002ph-NY; Tue, 09 Mar 2021 09:40:40 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:37356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lJdXD-0003sW-Ab; Tue, 09 Mar 2021 09:40:40 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 129EeCwP153600;
 Tue, 9 Mar 2021 14:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=D9mVPDGiI7A0cK7HlpOiZ4Ww6H8cT2FDX1LOWmzKMrg=;
 b=ICSyRpPpA72o3QuW8JH9RRaXdZ6PPCcZw8nHfJaTfEGDYmRpdLK5VnkPGNC+4wfh3bun
 d5XqWmNg2aVWZucg0aGHLn8SszUwczbD32+Myy54XJ2P0GxtYCHv+bH3Y+G/jlDaTK7n
 k2rjJEmGT5X99V3zAOpmV8oqQioyIL/mrlA9Yu4KEvAqGS5n0DqiON0N9yOV50IwvzmP
 OtDS76e45LcTW6d4jJDzSPMpYw5GtLUvaVp6bblRQV6zKWrzr2UIBl68+J7ylpMcZ2AJ
 Pop3K/8O06H1Mu8g1mFVVRYwX6O4Y14C2U+rVPrgQpPlmlmmvG/IRGjGnTUBGOQtXtwQ LQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 37415r7gh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 14:40:29 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 129EVOYr193150;
 Tue, 9 Mar 2021 14:40:29 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by userp3030.oracle.com with ESMTP id 374knwwjvh-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Mar 2021 14:40:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZbQXWX1gT4ynho9Xiom+cOoPd4Sk3A+6NzeDYvitu1GzkG80yASwMNPG6QPjmp5unl6UX8UxKSC7FUwv9UElxoFk0kc5I+jI8AOQdE0ujCqX50WGEueJuw53bvtObxUr88OYOQiFP6zqPt4dQfCE+nl01WiMMWcOhn8HF6q8vxN1i3v3zUkf5M2Fa2gy2J0rxqk89WtexxPrZpVctt4tgwwp88ixAYAMSQmJZ8mEW7vGbcwaiiDE2zFsaykGTR0EbajYAd+Gk0o+oM2PFiOwkvlusCIvvEEMZn6YU8FennAPyaazdnqOD5EJNIPKrF8TAn0HCWBHAiQkX4X+iCBPSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9mVPDGiI7A0cK7HlpOiZ4Ww6H8cT2FDX1LOWmzKMrg=;
 b=actxkTm4Yagms481jgstwC38IZbtH4+2zUEg6NenfskI4LBHe1LN0fSYeiAbUnZ39hdjBFSGm64qkVRNX3p64FVV5hLy2GydIg7wUeKUIJ4wrXxBpBbYAxo6QwKuLyjm8zigBnSl0wXS13iyO08BcL0TZ7w8EsvnOapiRhD19Z7OAD72MiVEtd/FQPsnZFQyxcF+GBBY4W91CMqsU+aVGUXl9rYFZsirYYNFx3VxTUH8e9ZLEz5W7qCjIg6B93rZoQEOBWmOQ52wA72MtsQAyEUKW7bwQS6gOSYQEvF3DxYI/ChqWlnf0tUJMLZ+NIRX+WHu37cXfGJ6tiv97qhTeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9mVPDGiI7A0cK7HlpOiZ4Ww6H8cT2FDX1LOWmzKMrg=;
 b=XmLvLgOKCwpK0fSTNdZFYeXl+jBi5+Jry5Lk34O9GeT/Ti2IOhJDpP8TlqtMApHpwY+4iwl+/NS76Ag2h6e2+b/6nE818LDIP6DpdgmLEzZWRWos8XSBL2mU9TjX0oWB1vEex1Rpt77nbUP3FGBxa1iSoZqQ6B3JYTpSWspCyo8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM5PR10MB1771.namprd10.prod.outlook.com (2603:10b6:4:8::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.29; Tue, 9 Mar 2021 14:40:24 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3890.038; Tue, 9 Mar 2021
 14:40:24 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/6] coroutine/mutex: Store the coroutine in the
 CoWaitRecord only once
Date: Tue,  9 Mar 2021 14:40:12 +0000
Message-Id: <20210309144015.557477-4-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309144015.557477-1-david.edmondson@oracle.com>
References: <20210309144015.557477-1-david.edmondson@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO2P265CA0214.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::34) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO2P265CA0214.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9e::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26 via Frontend Transport; Tue, 9 Mar 2021 14:40:23 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 16c664e3;
 Tue, 9 Mar 2021 14:40:15 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01b315d6-211c-43e5-e173-08d8e3094637
X-MS-TrafficTypeDiagnostic: DM5PR10MB1771:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR10MB1771F8EAD25EC5DEB97EEED688929@DM5PR10MB1771.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hAN/ZpC6z8DJpko2Racloa2aW2MhwnVLyanQ8//DLRMKlWtYQB/0HBok/UysRh1I2Jq5PdbcERVIRBnNdm8zDt1ZcNWbZme3mJ93WQ17o8g9EzjNwiGfI4EEAYdqIbXAwJAIKJ384CNTjOsLMb0bOH59jcC6W8j8n+hrRVIY3EL/JT5ugOKgEJBGNVviqj1q3Q71FsM+Mfp2wKgBOF7hNWKeUgoidwB9+/wqOEiFAMK+Spx37CxY+mL8zg6X4xTdb735bBT+nJQHyFU1O5V9jjXii3SLoMQ8J/f7RtIYxuyawyu6HA7d/wvA0JMfst58pzcUBiBB/EJsN2cwxMKajeiJ+XQv/g35/+Wrb43tD4ZzuDW/SqL5eIvFsaOMOAIn7AwSREJhff4Gw1l6y5xBRMssHKTMxc9Y1UNNtJc2jHtWN9c/iePe6BZNeSDexTME/yeXh8K2kkHnoYB1iV6nMhUWxluL3uty4ExtBn1UoWgZa4+5wRTYw/YYg0S8V39NEDyd2thdqVJtwuOGnMWrNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(366004)(39860400002)(346002)(396003)(376002)(136003)(86362001)(186003)(83380400001)(66946007)(44832011)(316002)(52116002)(1076003)(36756003)(8676002)(8936002)(54906003)(66556008)(6916009)(478600001)(2616005)(4744005)(5660300002)(4326008)(2906002)(6666004)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?czVoQnE5YlBuVFdrbWV0Z0VKY0xRSHZsOXdERit3Mjd1TXRHNEVEVTk3NWd6?=
 =?utf-8?B?QVpTM2ovaXR0WTlicVlDWDZrYWJwR04vY2FwQWtOR1BDazFOTVpSMFJLV3k5?=
 =?utf-8?B?S2dzV3I4YTdhb3UzSkFOQkdkd2dsZVdkeWN2M2twbVBjZWJxNVZoTHJiVC9m?=
 =?utf-8?B?azVyN3ZFamNNNU5ZODROb0haWTlnaS9TeFFmN2ZRQ3lEblk2ZktqQWlYUm5r?=
 =?utf-8?B?MWtKVk1GT29DUG92U0kzeHdWS01jTFNzNG83THdUdk9hVlQ1UDkrYWZ6R0Fp?=
 =?utf-8?B?ZjNjTkxMd1ZzR0JRSDB6LzN6Y0FXYThIOUh6b2tMUSsxaUo1bDIzRW5CV3k0?=
 =?utf-8?B?bklDdEJIamZGSmQyQy91TU02RlJZdWlRZ0dQbThuQ1hlT2hhUmVNclY3Vjlu?=
 =?utf-8?B?dTA1QnVqQ0NsWnNUdW5ZUlVEcTVLSGk2MktyREVUN2xoVHdiR2lPR3pYa0dt?=
 =?utf-8?B?aVNMd2VlSlJxVVNxVUZHUnY2OWVHMUtJZVRHRDh0UStZR0NaSVdsdzMvc3I0?=
 =?utf-8?B?eEc2RDBGT0p0a0ZpaFdyT2RseFJWR1NGN2QzeXdqeE1UdXh6VU54MWVpWjcx?=
 =?utf-8?B?UlZ4bVZXUFh0SXdrcE1WWEVlb1JiWEx0VEZsbkRza29jZGhySU83cWVoaFBl?=
 =?utf-8?B?UktKQTlZOWdrSGNCNTVSbjlQUnFhZElFbkc2RXR4NHV2dW8raXpJblM0REI0?=
 =?utf-8?B?NVZxazU4c2lyUEVzQnBGMHNJRjRFVURhTUkyRGRTQ0VEQnZKRXZaRlhpcTNp?=
 =?utf-8?B?VDhURUJVaEcwUXg3L3pSS2JacG5oak5veGpoR3RBejVKZWJUcHdFZHdCaEJn?=
 =?utf-8?B?NWVDS0FXMENwNEVDRWN1bzFSOEdFYzAzV20zWjBkM3U5SHRBMGpkeHcxU09r?=
 =?utf-8?B?RDBxZWFFR3ZBcGZTZkJtQWg4Z0hJbE0xRDlUT0x1b2NtQS9oNG1ZU05YZEhT?=
 =?utf-8?B?U2lzQ2hiY05VTEtvWXdJbGxlZk5QRW82a0prakdkY2NNb2RRVGVjOUpBOGpG?=
 =?utf-8?B?ZGtSZWlFMXVVVk9LdWZDdDQrMFRkdnlaZytpZkduNmJDSUlkSnlZVGptcThX?=
 =?utf-8?B?T0NWOHRMZElTM2JtQzBqUTRvTU5oRGNqa0RjaS9aWnhQR3Z0aFJJVXB5UGVL?=
 =?utf-8?B?Sk9acWx4Y3NFSm5IbUgxV2pHQm5KQWlpa3VOZ1R3TUpsOGh6andWNEUyUkxs?=
 =?utf-8?B?ZWRiVXFhQnFiMGRVVUsrMENGVGtsMFFXR2t0QUVHZk5iT3M0L09odFIvWlFu?=
 =?utf-8?B?dFF5Z2luYzZ6OEpudFQ5YUNvQlJPSUprSGVrc1EwVlBmSGZlRldlVDd0T3VV?=
 =?utf-8?B?UFJOTmJ5VlF3aUhSaVFUM0dxYmhaTjVpNkIzbWJBOGJKK0lZUjZNLzZoTkpV?=
 =?utf-8?B?blNwaVFMWTJCcy95bE1OOEo1dWdMcFI0d09aNE1NalJ1WkZXaFE1SnROTngr?=
 =?utf-8?B?ZnVLb0xvOFRjU3Y0amp3bHM1eW1QSTQ5djFmV25XZ041S2tRS3QwekJ6K3F2?=
 =?utf-8?B?Zzc1ZkNUdHE1MUdFZnU5dDg4QWpIVFRRaGJ3Yy9DanpSWFFoYVovMUd3dno0?=
 =?utf-8?B?L1JqYjZ3YmJJQ2U1dHg1ZFlyaCs4Z3U2V2RhQTk1S0hWbjJJcGZEbFpXN29i?=
 =?utf-8?B?VXYvOW45cTRScmV3OEFFVWFzYnBUd1RjSkZFWlNDTUI2UE5PUWVJTzhPbkFV?=
 =?utf-8?B?ZndqaUpwNHR2MkhjUWg4MkxDN0ZscEhRbGRZNUE0dkZvMVk1dTZMOTdnblRX?=
 =?utf-8?B?VlZXVVdDTkRvaXNXaHV5T1hlSHlURXIvbWdJVGdwaldEbzZEUTdnYitCM1cy?=
 =?utf-8?B?VE9lWjI4SmhpVllkUytDZz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01b315d6-211c-43e5-e173-08d8e3094637
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 14:40:24.7561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uSt8duDHqZKvQtHuSpZPwEgG5EsCvn2GpWtIoYkTHxQFTES1g1X5oStV7lhONdSjGNa0oUr/sdYPVu65vg4gB9XDW1iqnTuQ6eZlCO9MXk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1771
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9917
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103090074
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9917
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103090075
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=david.edmondson@oracle.com; helo=userp2130.oracle.com
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
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When taking the slow path for mutex acquisition, set the coroutine
value in the CoWaitRecord in push_waiter(), rather than both there and
in the caller.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 util/qemu-coroutine-lock.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 5816bf8900..eb73cf11dc 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -204,7 +204,6 @@ static void coroutine_fn qemu_co_mutex_lock_slowpath(AioContext *ctx,
     unsigned old_handoff;
 
     trace_qemu_co_mutex_lock_entry(mutex, self);
-    w.co = self;
     push_waiter(mutex, &w);
 
     /* This is the "Responsibility Hand-Off" protocol; a lock() picks from
-- 
2.30.1


