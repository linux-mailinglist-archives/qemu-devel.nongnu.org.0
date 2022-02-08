Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F6A4AD525
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 10:43:45 +0100 (CET)
Received: from localhost ([::1]:40254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHN2F-0007FH-FS
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 04:43:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1nHKpr-0001x5-PP
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:22:49 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:48312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1nHKpl-0001vg-VA
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:22:47 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2186pU43007539; 
 Tue, 8 Feb 2022 07:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=8UauS2CS3oErEplA5shbyREpZMDyj2XT9cAdMg2XCj0=;
 b=Hau8SC08TD5XEEo5KEhkv7wzYd2XeTs1msckEty5ayOZzDEnDpnH9MdfDrWEDzkqZA2x
 D2u6ZaYRJ1p3fsW8KtYk6GllfxYZOFbeamDDPNappvEE9HUxsGouQiG+H+UEnbiSfccr
 jEjBk5xOGd2PJGn6sPfn6y9MN3UjHkC/Pki1XpZ82eED2pm9wqWIrwQZZcRKwjkhScUq
 PdWHfmoIfQYOY/wvCxafios2S0rXgf5uWNOAJuoG4tfZdsmrIEExoqUJZ136AblhRNgi
 L+M0jGS9n0MvCF4TWnGnxGhVBKjCLXbn/T4H3nKfx23aKpqCSbDqsCnBqjidbpL1V0qI WA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e368tsxcx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Feb 2022 07:22:39 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 2187BlYu093365;
 Tue, 8 Feb 2022 07:22:38 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by userp3030.oracle.com with ESMTP id 3e1ebykknc-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 08 Feb 2022 07:22:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnUwoE1viz/1Sz7vc1dm1FC6Ypixay9iuncfnlmGxtZnG3Xp0ZsZAI0/mDGQuT7rymOmJYJXS8bpytTtGD/Iyvbck5/nBYTkSWagTPrrKDRfvYIZnOAQeqwiVeBBdsyQfa2lWsK/xRMEcW+UqDuEO8ABvNOcvP422WJZlAkI0j8RtCSAouTNF87xUPfW4i2YtYyDOE2gefPIWp1Q9fgFbic7m2SHkPAaWs+l24sV1sZoH02rVtzzhVAn1SixUxZWgSYciG05Y7i1f/gYqpa5/tyhg8LFpWGsLVcTVxT5KiCiUVsTOuRE3VGATE31S2eSwamNl1ovchtgTWvD6/Up/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UauS2CS3oErEplA5shbyREpZMDyj2XT9cAdMg2XCj0=;
 b=ReYMsAryeZVo4L3MJtjhW4dJodUsXZtALMd1MUhFz/L0Znjw+mj0XPVww7GXoKjiO5rxxZp3DEoVAy0RaXOtQJ/n1JfRRY0HnREa8F/XPqvSURLnQ/+X8WjLFINW3D3OB1a12tqH+s/fPIwxxdXYVhJfqS044QZ/zLIERROr/2mVlJ1XEi0M4Ig6eU1Zjl0QQpowXOUh6/UEAj7zJxkwROtLaWyktVSUVESel0UJ5RFJy2a2lmxiwTj6Ofdoa7ek6JmRObij2NeGWm9FnUpPZ1Z6Pw2a79syQtV863xqyFGctjHyRG7XK24HhZCW/mxRHk4xNUdQJHRXnsHgrxGBDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8UauS2CS3oErEplA5shbyREpZMDyj2XT9cAdMg2XCj0=;
 b=sk7LG6KQNkcZl45WlejkCFcwgqCPAhowzYfK6+D6FVGU82Z++4gRG0w1Sjb0P5Wh/eIObgMgdWKwx9sY3XaPLx/HXIvFRNwXoQm8LBXeN9yB6x6YM9UtfSVCLbYwBSSzoc0AcnlH2qsha7xNTW8W4pwcDmbBh9L+btHxooAqYzU=
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SN4PR10MB5608.namprd10.prod.outlook.com (2603:10b6:806:20b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 07:22:35 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::4bd:1cfa:5aee:6c81]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::4bd:1cfa:5aee:6c81%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 07:22:35 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC 6/8] multiprocess: add MPQEMU_CMD_BAR_INFO
Date: Mon,  7 Feb 2022 23:22:20 -0800
Message-Id: <234ed1f65ba8684d82f2e78ee6116d2209cbd499.1644302411.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644302411.git.elena.ufimtseva@oracle.com>
References: <cover.1644302411.git.elena.ufimtseva@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0006.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::19) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d255ef6c-5349-4b11-5023-08d9ead3c72c
X-MS-TrafficTypeDiagnostic: SN4PR10MB5608:EE_
X-Microsoft-Antispam-PRVS: <SN4PR10MB56084E05C2E51EB9B76126558C2D9@SN4PR10MB5608.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:121;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A21Yme1zVAxM4xe0RUvaOGWSfMq6C4mrKYf+g5HzfTqOz22TfgpnnVzXpT5r6MmP9cRtNT38l6w2hqUG2R3uB4SWG6s11oQIHadk/aiUjQgmQt81H2C8iYsbrCZDfyeOxbDOM60QsoWDs5AKLcE4g0yCFcCPFS4MFQMeJXq8ZikFn+06fMyqXdgo9cc6lVX1fW16Dq766Q84C07r2xl92rRXwUrQ45YzNNEZpjgovnAQD0gDGpR6bjTXqgQljRZIk/oppFaou6sS0Y/X6QMeQDrJfVSMhHHJ+oFhvygueDdNwYY59SeAkNiQY9JhXhvqxRdHujMv5knjSMhmElAAtm4KpyCULsruG/2Rdisfe8ejd4g+J4749xETJmF5KZntQl6emj5XZXujPxW+B25nxNYJJjm2Ir+FBM79sJtcf+H9D1VMVQIlLqUd0qk53IdFEZk82qb+hVU90VuGscONXInx8TSzXl4KpcJ2fsRAQ4OYupzzsGmvyICP44FmFLBjzq+M3qA74o0Oq/vOvjKjHmifoBEb6TAdA0M35lGSk+6uO5UnqWUeaYYO4cVwxIz8DMX94fP7OojEfHTuz6vTYS7uwiM7dX+45HcJjkoAxK5CZz5Lz21FOu2K1370k6GEbNFKk1aVQNJHIoZ9rrPYPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(36756003)(83380400001)(186003)(38100700002)(86362001)(5660300002)(7416002)(2616005)(6486002)(44832011)(508600001)(6666004)(8676002)(4326008)(52116002)(2906002)(66946007)(66476007)(6506007)(66556008)(6916009)(316002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TYrC+cRJelpkw8rEPsTbBqmzfkd8ZFUpdqamTMLc/DnQ62N+jt4sGJLdeujn?=
 =?us-ascii?Q?veMbtU35UIVMnV/P8kh9f//UAp/I3ZwPEjC5n2BANU2ayjjF8Q47nBDxOT/q?=
 =?us-ascii?Q?c3r6ifCTAq1PVbyIfuyQwTC9qPb+Y0POYsr147OytMNq38EE2L+Ioe2QChKq?=
 =?us-ascii?Q?z4Rj88vPaE4RtjtYGmItvU2c/ZuVLtza/R/Is07NwiTLBUdXyADuT2z3vF1p?=
 =?us-ascii?Q?6P8lWOHUy0cnAUB0I46L7MqwqanIOZhT2xLJ4LkFf6Mt04qi9JAowEJL3/5N?=
 =?us-ascii?Q?0B+GU+++iKaKg9TbqkdM0vh0AxdiP4CxUguAh3+ilWI/i7r0FIiN5CuFWPcH?=
 =?us-ascii?Q?YtDFV3psZs0cnDESzCPuobp2ymb6D2HWW6u1TfoAlpolvJQVngKtFxCTTrCY?=
 =?us-ascii?Q?DGe4Jh5jaL3Pzg/vY7J08gFCcM2+pLQbjFJU9YlAEV4F7+c5kbAzRYSDMvjX?=
 =?us-ascii?Q?x+37yHVjmINuiNlzqL7Cj0NFJF/mXRyRh+25H10/fZq+I1ZFw8jSSIrOLvPU?=
 =?us-ascii?Q?HoFQxW0m/tnUDpuZMRrmRjcS81JFqBq1h2ZYDTozdmyamj/oiTp/hUs4IYjw?=
 =?us-ascii?Q?1m2/WOPR9Zj++Exsy6Uo3DU92hUNhHGsCEhbTjm2DyrO7qlzqCDZT388kB1o?=
 =?us-ascii?Q?7LcsbLIYCan6iH3ZmmDyNYaz2QQmOExGiH9F/oNnzl61y8R4k8ZutfXc57Ja?=
 =?us-ascii?Q?CViJErVTx9OwzD0Rk4sMrLRG7QjKHUgdCZQBF449i8T3dryoLbP1e9cHoJeQ?=
 =?us-ascii?Q?nmseySaivkRBxwuPoMjYagw+26/Bx9anz/vxNzKkE6tr7EE04z/m60FsuqFl?=
 =?us-ascii?Q?gsH5VlNF43vLDsYu/npvbG0/keHe9XoOg1+Rfg5F+Z9ZHcxusEJ7jTRRvqMI?=
 =?us-ascii?Q?dZkKif5DUdjtp9OmK14mprRfU69KkUUn0O55ms4Ev44OrPvMjW7qrFOVrt1k?=
 =?us-ascii?Q?KeqtugcfzcYvs3it1/DtTxQFSRN0POB0D4trwqfFgFLvBcIGEisIxQPJmlfj?=
 =?us-ascii?Q?3wVBtzguXj5fSfzrkaaG4V6h+tMcwFG8O5xPMyIaBMVxo9URib5Hb2ymx+U+?=
 =?us-ascii?Q?2CSNGqkPE2q/Z3heLpibjuMeFdz82EPabmpTNjJM21iNMG5Ej3vnr5CmXT2j?=
 =?us-ascii?Q?0c66hwFRTwr1ItmtG1it+c2MbsG8Iyqk73vUOdpJ15dwaRxE4cyS28SOOo5J?=
 =?us-ascii?Q?0B1Uxezp6VLm2PUsojQuSlDbJ8RY6BLahpzNQ0HE0vfKw4+QXKSJKoa7jxBQ?=
 =?us-ascii?Q?kvV/eix/2xYSWy5q0YgnvpBanAs7DRljk9Kd0NckcvTB/xV8KWA5VlVkeiXC?=
 =?us-ascii?Q?vfvste96u1wT5yT/IM2pgTwvEp7lfU0ote2A5YA8HNpwGixuXBQIHB7wf2b7?=
 =?us-ascii?Q?bCZCfMQ2wPkSnoVr4EXvxiqxzUUHIPiDqVCvmZLExb6oUmcEySOrlfxRm1Fb?=
 =?us-ascii?Q?qa2E9VIceqnxpYPU/5rxCggNCycZHLVgceDp6QJACEW9G0+kf0NRILUl+bps?=
 =?us-ascii?Q?kiMqliAfYrs7BNLAoX6Hs7d9xhKa/CkCHIrImv4qfKlsOhmo26mYw9VhgI54?=
 =?us-ascii?Q?x2P9Bz6PwH7o2hGGsDNTHjZyssaMJL/qEtz0A9V0g8Hve4iUUJG76oxoTIfs?=
 =?us-ascii?Q?nzoSzZQeDw1Pa/V3D3x0bbajkQh2D4PAsY4Feaa0INUpXba46ck56gcP668o?=
 =?us-ascii?Q?dyrZbWn7uvvKmxqVeHvpfnItEPL43w4vlvABZuYB5gnrpOzb5JwoVAjuN2zn?=
 =?us-ascii?Q?vGhEHD04cA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d255ef6c-5349-4b11-5023-08d9ead3c72c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 07:22:35.1298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IGBv5wBdLCJJ6s8N9M3KTM2nLI59NECAlD1GO7JY6f77OO2ZvfFbaBDn0mNHFJ8n4uZz3pQdJhJstj4SeuxHJe0TIvb6WYET6XVa/pFlkqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5608
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10251
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202080038
X-Proofpoint-ORIG-GUID: 2p0JwgJgMQdMZFs2-VZqSHV2bjOBCrWP
X-Proofpoint-GUID: 2p0JwgJgMQdMZFs2-VZqSHV2bjOBCrWP
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: eduardo@habkost.net, john.g.johnson@oracle.com, cohuck@redhat.com,
 jag.raman@oracle.com, john.levon@nutanix.com, eblake@redhat.com,
 david@redhat.com, armbru@redhat.com, peterx@redhat.com, mst@redhat.com,
 berrange@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This command is used to request the bar type info from
remote device.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
---
 include/hw/remote/ioregionfd.h  |  2 ++
 include/hw/remote/machine.h     |  1 +
 include/hw/remote/mpqemu-link.h |  2 ++
 hw/remote/ioregionfd.c          | 28 ++++++++++++++++++++++++
 hw/remote/message.c             | 38 +++++++++++++++++++++++++++++++++
 hw/remote/remote-obj.c          |  1 +
 6 files changed, 72 insertions(+)

diff --git a/include/hw/remote/ioregionfd.h b/include/hw/remote/ioregionfd.h
index 85a2ef2c4f..66bb459f76 100644
--- a/include/hw/remote/ioregionfd.h
+++ b/include/hw/remote/ioregionfd.h
@@ -38,4 +38,6 @@ struct IORegionFDObject {
 typedef struct IORegionFDObject IORegionFDObject;
 
 GSList *ioregionfd_get_obj_list(void);
+IORegionFD *ioregionfd_get_by_bar(GSList *list, uint32_t bar);
+void ioregionfd_set_bar_type(GSList *list, uint32_t bar, bool memory);
 #endif /* IOREGIONFD_H */
diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h
index 2a2a33c4b2..71c53ba0d7 100644
--- a/include/hw/remote/machine.h
+++ b/include/hw/remote/machine.h
@@ -28,6 +28,7 @@ struct RemoteMachineState {
 typedef struct RemoteCommDev {
     PCIDevice *dev;
     QIOChannel *ioc;
+    GSList *ioregions_list;
 } RemoteCommDev;
 
 #define TYPE_REMOTE_MACHINE "x-remote-machine"
diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-link.h
index 4ec0915885..be546e4586 100644
--- a/include/hw/remote/mpqemu-link.h
+++ b/include/hw/remote/mpqemu-link.h
@@ -17,6 +17,7 @@
 #include "exec/hwaddr.h"
 #include "io/channel-socket.h"
 #include "hw/remote/proxy.h"
+#include "hw/remote/ioregionfd.h"
 
 #define REMOTE_MAX_FDS 8
 
@@ -41,6 +42,7 @@ typedef enum {
     MPQEMU_CMD_BAR_READ,
     MPQEMU_CMD_SET_IRQFD,
     MPQEMU_CMD_DEVICE_RESET,
+    MPQEMU_CMD_BAR_INFO,
     MPQEMU_CMD_MAX,
 } MPQemuCmd;
 
diff --git a/hw/remote/ioregionfd.c b/hw/remote/ioregionfd.c
index 85ec0f7d38..1d371357c6 100644
--- a/hw/remote/ioregionfd.c
+++ b/hw/remote/ioregionfd.c
@@ -63,6 +63,34 @@ GSList *ioregionfd_get_obj_list(void)
     return list;
 }
 
+IORegionFD *ioregionfd_get_by_bar(GSList *list, uint32_t bar)
+{
+    IORegionFDObject *ioregionfd;
+    GSList *elem;
+
+    for (elem = list; elem; elem = elem->next) {
+        ioregionfd = elem->data;
+
+        if (ioregionfd->ioregfd.bar == bar) {
+            return &ioregionfd->ioregfd;
+        }
+    }
+    return NULL;
+}
+
+void ioregionfd_set_bar_type(GSList *list, uint32_t bar, bool memory)
+{
+    IORegionFDObject *ioregionfd;
+    GSList *elem;
+
+    for (elem = list; elem; elem = elem->next) {
+        ioregionfd = elem->data;
+        if (ioregionfd->ioregfd.bar == bar) {
+            ioregionfd->ioregfd.memory = memory;
+        }
+    }
+}
+
 static void ioregionfd_object_init(Object *obj)
 {
     IORegionFDObjectClass *k = IOREGIONFD_OBJECT_GET_CLASS(obj);
diff --git a/hw/remote/message.c b/hw/remote/message.c
index 11d729845c..a8fb9764ba 100644
--- a/hw/remote/message.c
+++ b/hw/remote/message.c
@@ -29,6 +29,8 @@ static void process_bar_write(QIOChannel *ioc, MPQemuMsg *msg, Error **errp);
 static void process_bar_read(QIOChannel *ioc, MPQemuMsg *msg, Error **errp);
 static void process_device_reset_msg(QIOChannel *ioc, PCIDevice *dev,
                                      Error **errp);
+static void process_device_get_reg_info(QIOChannel *ioc, RemoteCommDev *com,
+                                        MPQemuMsg *msg, Error **errp);
 
 void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
 {
@@ -75,6 +77,9 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
         case MPQEMU_CMD_DEVICE_RESET:
             process_device_reset_msg(com->ioc, pci_dev, &local_err);
             break;
+        case MPQEMU_CMD_BAR_INFO:
+            process_device_get_reg_info(com->ioc, com, &msg, &local_err);
+            break;
         default:
             error_setg(&local_err,
                        "Unknown command (%d) received for device %s"
@@ -91,6 +96,39 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
     }
 }
 
+static void process_device_get_reg_info(QIOChannel *ioc, RemoteCommDev *com,
+                                        MPQemuMsg *msg, Error **errp)
+{
+    ERRP_GUARD();
+    uint32_t bar = (uint32_t)(msg->data.u64 & MAKE_64BIT_MASK(0, 32));
+    bool memory;
+
+    memory = (msg->data.u64 && MAKE_64BIT_MASK(32, 32)) == 1 ?  true : false;
+
+    IORegionFD *ioregfd;
+    MPQemuMsg ret = { 0 };
+
+    error_report("Bar is %d, mem %s", bar, memory ? "true" : "false");
+
+    memset(&ret, 0, sizeof(MPQemuMsg));
+    ret.cmd = MPQEMU_CMD_RET;
+    ret.size = sizeof(ret.data.u64);
+
+    ioregfd = ioregionfd_get_by_bar(com->ioregions_list, bar);
+    if (ioregfd) {
+        ret.data.u64 = ioregfd->bar;
+        if (ioregfd->memory != memory) {
+            ioregionfd_set_bar_type(com->ioregions_list, bar, memory);
+        }
+    } else {
+        ret.data.u64 = UINT64_MAX;
+    }
+    if (!mpqemu_msg_send(&ret, ioc, NULL)) {
+        error_prepend(errp, "Error returning code to proxy, pid "FMT_pid": ",
+                      getpid());
+    }
+}
+
 static void process_config_write(QIOChannel *ioc, PCIDevice *dev,
                                  MPQemuMsg *msg, Error **errp)
 {
diff --git a/hw/remote/remote-obj.c b/hw/remote/remote-obj.c
index 9bb61c3a2d..46c2e2a5bd 100644
--- a/hw/remote/remote-obj.c
+++ b/hw/remote/remote-obj.c
@@ -188,6 +188,7 @@ static void remote_object_machine_done(Notifier *notifier, void *data)
     *comdev = (RemoteCommDev) {
         .ioc = ioc,
         .dev = PCI_DEVICE(dev),
+        .ioregions_list = ioregions_list,
     };
 
     co = qemu_coroutine_create(mpqemu_remote_msg_loop_co, comdev);
-- 
2.25.1


