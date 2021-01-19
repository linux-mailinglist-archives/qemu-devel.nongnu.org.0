Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A89A2FB8E7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:34:48 +0100 (CET)
Received: from localhost ([::1]:37196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1s5n-0002UN-1s
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:34:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1l1s2V-0001Eu-Qu
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:31:24 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:37322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1l1s2Q-0002ut-2S
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:31:21 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JEOOb1023585;
 Tue, 19 Jan 2021 14:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=k9ndqdMYrPzBtTmr/SPQVXOYjn+L3JvKqkmiX72uogE=;
 b=Ubl0Jv6pKuuV1NX58CH7AlkLAYArQvypSnQXPBY3K78hqnWMtb2SgLhdOeKiX/UpEqvS
 atbiVNjrlBU9eoE0AuLFwHheWTZ8OHDsRCqSLaEL3/VWqeuMkBc//ZGLrcVimTPVNtGY
 4/5UrfJIPaSdYSi7eowzGVEeR9P2CSpk1GIA6KiDKlPzuNDY1RRtb1uK71d2232cRASe
 MfhDRzbegPE011FdnLIaWadtdVbwb3+Bn8dCVnG7HMRTKVDa5uu12ZzwX3Wp3eAO8Vam
 zzc1iR/jzMt6koOuX2QFEDlIaWAti5Zz70bBkbfbngBmniW/IgfVXO9oY4qCexU08I+j lA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 363nnahert-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 14:28:06 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JEQtwA047482;
 Tue, 19 Jan 2021 14:28:05 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by userp3020.oracle.com with ESMTP id 3649wrmnx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 14:28:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aPmFfdz9B2rbmxC03QG4Q6kzKKWZOYx9BfbJ7PiC0Y/Mgac8pV11EvTtaep8635dPi9nYLWIfMrBhTNZhlpa0Pp5PaZn9IMYkkiV/geK0tJXKbvXl9jNIvwINfqKb/0QnWhSuJQ3bRP+fGNwhwSF/HItVG67BUi6s6QFtVEkcy1tSZ+BAyQW4psvDkgC1j3Ys8KBixvF8A2mhEhE/79QDpvI8Wjn/TBT2JEGOwfDJyVsRtnwbevDvtMAy/IvfWssYw515FN61AOmNe3dQ/4MX3x2QiGWGxjnSwdaIF9daIOUA45KeFs9baUXPKM8NIaHR5kgRsKb7DZI8EAP5FD/8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9ndqdMYrPzBtTmr/SPQVXOYjn+L3JvKqkmiX72uogE=;
 b=jJECYiJLCeRU2I4rjS8jG1rshpmBE9R3T3JQo2N92T9Ms8HV360BlxY0lhqlEuduUAgc9KVTqYmdn5yUZau6qJ5aivaX+xhTPaZmQ4ZHRS11Ff5UjP9ukZpUkt6USM45TZ8yUMMUVQZNYIOg/gm3yueBgN2/igSv/DbRFvYye3jsaYB3lQlAm3o9fesYr4mTA3IUNWJMhniu9rShJyhIZjS9HJu5/giz59XZWVoPfa+/lDqtYykY5LMzLJJdYSc1spB40/aRTj37ofjV3NAkUIRTk/KVJ0/LBZNSGePpHlqgqEwl2n8UVywh+QZ9GqQmN8h+vn6yeG+EtKRe7QE9RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9ndqdMYrPzBtTmr/SPQVXOYjn+L3JvKqkmiX72uogE=;
 b=E4rMkLw5gLpTF0UJO0xZIV0lzkHzXd0AJK5i0g7/8WAoO1DXApDg9bMIUUVKO5puQa0rJzV630cTOY0sjo3UoN5HU/9XHyrCj3dMndRCZhG+vD+YWCoXuWDMQ3ABAXuyoTVUl+PsGkoLPY99HAQYiHBOk7B9LbzQ++mmekCdFcU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR10MB2048.namprd10.prod.outlook.com (2603:10b6:300:10d::19)
 by MWHPR10MB1757.namprd10.prod.outlook.com (2603:10b6:301:7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Tue, 19 Jan
 2021 14:22:17 +0000
Received: from MWHPR10MB2048.namprd10.prod.outlook.com
 ([fe80::106e:c89d:3be1:6a52]) by MWHPR10MB2048.namprd10.prod.outlook.com
 ([fe80::106e:c89d:3be1:6a52%3]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 14:22:17 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/2] target/i386: Add "-cpu +kvm-no-defaults"
Date: Tue, 19 Jan 2021 14:22:07 +0000
Message-Id: <20210119142207.3443123-3-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119142207.3443123-1-david.edmondson@oracle.com>
References: <20210119142207.3443123-1-david.edmondson@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO4P123CA0091.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::6) To MWHPR10MB2048.namprd10.prod.outlook.com
 (2603:10b6:300:10d::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO4P123CA0091.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:191::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Tue, 19 Jan 2021 14:22:15 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 6754d73e;
 Tue, 19 Jan 2021 14:22:07 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac66a43c-fe43-4c0b-10f9-08d8bc859fc4
X-MS-TrafficTypeDiagnostic: MWHPR10MB1757:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB175746C0CE6D5DE8164D39D088A30@MWHPR10MB1757.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eHOdRjSoE2LCmerBJDe0Om0MexohGhVaGi7dmQKkoq5SrCu6WirJYWUBPGbt+pw31ArwYIXRCTByWb1vDa64Ut7Di3AL1sgnZXbd9uH6J5pSCCb5xo6I12LWFPjwH0AxwbnAunozih6IWF+E5ysgFcIDZQlAIRK+o1rv3rd4siNcX5DVd1YzRUgxIewYpqpOhZcxUoLklICEmxwkdF5zs0PUgVt5xeaAed6Qvn1T88Jmi2qQ3ov7AFLqD97PdAOkx3y6eB1g69Yfh4V36HgxKvdLvoWcDXmHNnvNqsnUjekPin/T1DbBf/n3E9xlXC3QlVu9Up9wlyl+wKeBQ6W4XYxRmwNZUNRUx2FOnuBbZNcMn45LTrkGmkXPStJZucMxlFr2fofItoOvlvbxjz0s3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR10MB2048.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(376002)(346002)(136003)(366004)(52116002)(86362001)(54906003)(316002)(66556008)(2616005)(5660300002)(8936002)(1076003)(66476007)(66946007)(83380400001)(478600001)(8676002)(36756003)(107886003)(6916009)(2906002)(4326008)(186003)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GO6vTMW7puDn2AQoETXL13UzS1o5VN+O6M0FZO5IVubHDXHZP4NKT5RxvXyH?=
 =?us-ascii?Q?EsLwMbO97X+JodGjkIk2gKkJpEv1KFslcTdNnLkmN9TjXyZzKbgJX9t1TLpo?=
 =?us-ascii?Q?ZYa4Twbmmz9OqaywyYhqZ2kedah5YFsIuqY4XeGgLc+GnwRfVtLKI2mRPUTr?=
 =?us-ascii?Q?9ih1+Oixwu+lhaIke9q2Ox8XKcXQhBRnCUVLrfUSfMvEqGKe2NfUNH72DSaE?=
 =?us-ascii?Q?4fZVDJI8GTX+45mncI7c1j4ayI/ASgfqZG2E+FJzJf36UxlUmfo/vg0S8+dR?=
 =?us-ascii?Q?frFfC4csqcQhDU6tb4iJx+Yl/SGWq+fLHljjfoOr+/xdW8rkzkqVslyD+/6u?=
 =?us-ascii?Q?/rPGI5pCzg+hQa4owkASBB1dSQTDHnSv9uODxjhISBDKROwFR6qOWt2XAcLl?=
 =?us-ascii?Q?Q5VEvzkn5iIgVp2Tt454YNuc5Grw9tW256U835wAbGzbN1aVWxSH2zCSMaHD?=
 =?us-ascii?Q?QPQs1mx0Y0RIFcSEujTUoxb9MvR5Q8BOYjsrreq0TUUOsNMVVD0czPlwU7Nk?=
 =?us-ascii?Q?Vn7/q7+4GDTfw4ruAx74P/MRuWu0QNAkGmvlovnMgVmIJq5V9AZeEuHtIncN?=
 =?us-ascii?Q?VfI3G+dd8YKOlHKh2AZAq0zi/28VRG/qVgELVCtrKFjyWPgT+uw+SXw8AYkB?=
 =?us-ascii?Q?QRacGj8HfwvCuw4PxurtFMR5WXJNvkeVpTjvxwVUTnX6j/3Q7kk+s8+VpS60?=
 =?us-ascii?Q?M2j0OLirNDCI1iXpSMDiuB0+7ALOtUxRsnEIH4XRjnw9r8ezk02axtfHYQzn?=
 =?us-ascii?Q?GFjCPARQ9XIAzzjioqFlBXKbZIvo8QDzc8pLPZ+g3LiU+TsvYXdU/kzY/7/v?=
 =?us-ascii?Q?9bYufWs3pnm/29z4mht5eygNxnB7jUPK13laegV117SrlEqukCphTOvG5dIY?=
 =?us-ascii?Q?4QSRCjXSwakB/hlbYFcuf9BUHM7Unl88/DSqYOcQvcg7PhKqBrZI89ATen3H?=
 =?us-ascii?Q?/d/cb7ND22vxcrXx+iG1B+xNnO1SzQuFvSQabARY/1G0T31MmFnP+pLSyh4F?=
 =?us-ascii?Q?E4yR68iztw1ilLvTdgyoINsDbw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac66a43c-fe43-4c0b-10f9-08d8bc859fc4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR10MB2048.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 14:22:17.1533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9FPRjnde46hX1p2brapxtspbcS+xZY4y74c/odgc+m91MCWNrORnP+WwSc8WAQzhuP1Jat9i5ap7iLpzuG0r3saCa4DP+lT9jcrI1oVnjGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1757
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9868
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 bulkscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190087
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9868
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 spamscore=0
 mlxlogscore=999 clxscore=1011 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190087
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Edmondson <david.edmondson@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Joao Martins <joao.m.martins@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joao Martins <joao.m.martins@oracle.com>

When enabling reporting to the guest that the hypervisor is KVM via
"+kvm", we also enable all of the known KVM features that are
supported by the host kernel. A new "kvm-no-defaults" option for -cpu
defeats this, enabling KVM reporting but *not* enabling any specific
KVM features. Those features can be enabled one-by-one using existing
feature flags, such as kvmclock, kvm-pv-eoi, etc.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 target/i386/cpu.c | 5 +++++
 target/i386/cpu.h | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 13f58ef183..4f1e807815 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6398,6 +6398,10 @@ static void x86_cpu_expand_features(X86CPU *cpu, Error **errp)
     int i;
     GList *l;
 
+    if (kvm_enabled() && cpu->kvm_no_defaults) {
+        env->features[FEAT_KVM] = 0;
+    }
+
     for (l = plus_features; l; l = l->next) {
         const char *prop = l->data;
         if (!object_property_set_bool(OBJECT(cpu), prop, true, errp)) {
@@ -7269,6 +7273,7 @@ static Property x86_cpu_properties[] = {
     DEFINE_PROP_BOOL("cpuid-0xb", X86CPU, enable_cpuid_0xb, true),
     DEFINE_PROP_BOOL("lmce", X86CPU, enable_lmce, false),
     DEFINE_PROP_BOOL("l3-cache", X86CPU, enable_l3_cache, true),
+    DEFINE_PROP_BOOL("kvm-no-defaults", X86CPU, kvm_no_defaults, false),
     DEFINE_PROP_BOOL("kvm-no-smi-migration", X86CPU, kvm_no_smi_migration,
                      false),
     DEFINE_PROP_BOOL("vmware-cpuid-freq", X86CPU, vmware_cpuid_freq, true),
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d23a5b340a..f76af4a771 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1744,6 +1744,9 @@ struct X86CPU {
     /* if set, limit maximum value for phys_bits when host_phys_bits is true */
     uint8_t host_phys_bits_limit;
 
+    /* Don't automatically enable all of the discovered KVM features. */
+    bool kvm_no_defaults;
+
     /* Stop SMI delivery for migration compatibility with old machines */
     bool kvm_no_smi_migration;
 
-- 
2.29.2


