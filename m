Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0713D47A137
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 16:49:06 +0100 (CET)
Received: from localhost ([::1]:33594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myyQr-0006Xi-5T
	for lists+qemu-devel@lfdr.de; Sun, 19 Dec 2021 10:49:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1myyNG-0002Cq-V5
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 10:45:24 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:41775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1myyNE-000301-Ru
 for qemu-devel@nongnu.org; Sun, 19 Dec 2021 10:45:22 -0500
Received: from quad ([82.142.30.186]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MDN3O-1moYmo2sDu-00AVvo; Sun, 19
 Dec 2021 16:45:16 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] linux-user: netlink: Add IFLA_VFINFO_LIST
Date: Sun, 19 Dec 2021 16:45:13 +0100
Message-Id: <20211219154514.2165728-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211219154514.2165728-1-laurent@vivier.eu>
References: <20211219154514.2165728-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0LajsI0CFDOvSL/VYJkpYGpIgaVA5yhHfDAuofBmOHyzviNfrjE
 C5OBuyHWD56rQvq2/LvTFao6T1s20S98dzwRFk9NFmdr2G8KYe1g0OXLIJXjIb7/eEEvmwU
 3XiFr0HolvEtXAHFHYNxhhWkEqgxUHspsVhX86/MEGjhEybbY3m3OCIb2iqgoaNRQ/zEJBy
 AnPbfWM9XZbwHJms44IfQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+D5//Cfz6Zc=:ou9iAta4wHEuVX7aI5jkgr
 YshZCq2utK2fBG1cjZuomCJMIiiau4xWOVMSMUxqwRmh7J9ykqQsO2E4ncADSdkS1R82b12wu
 h4jRtg6fvauwTNJ+hXB0QNC6Iyf89ZfLouVhc1hs7SGfugyJJsZ3c2QbwygJDx1qox4+7GuNn
 j46D2YBc9W+nf2ytVfD1VAsM9Z4dm0HPbLm0XezWMp4Gyxk9FX0OSiDzRm2DoOXubZcR9wBug
 5BWKcMuRNNKYrpV10f8KDFFdHNthxPcLNsd+YzIzDZMkNguB0mR1PSPFUSaZP9BVI+bRqvPPA
 aq/nQmftJQx4XSlPQ3IpBBOG/3ZzlgclxbNidLivQJoZ+J4KMm7xt0/mi20Oovlo/5tKZ4gJe
 SPhyIWSvC9tyFOELyUbTHs3izQO+F3nD0EsRORh26T0uq6iTdPDGiDeLVV9a89SZumNbQoVj4
 eP0bwWzt+WyMp4ti3ItuXn9j4X37tqgDTswKsq+Rlr4RWTl50O8psuWOZfvhGoJj58Ucn2zmG
 9s3yjgs0T2RbuZhHBoMt8Mj1GioJQTzInND7X9D/9rOVOAYVrAxtybzl/dUI0IyPZQa8FJDC4
 71TN0NdkWg8Bx5hZDFHxgvyMRbmy/aIpZEZ+vMOHflMgPEwMS7StRRmbaJcxN2KavGPrEsf39
 im2N6QJuqh4NfAHHdZ3l+OIjlAGo/jrLroHkMdvDi07E72i12gWsyZ/CqcAlXEUj05Pg=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  # QEMU_LOG=unimp ip a
  Unknown host QEMU_IFLA type: 22

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/fd-trans.c | 174 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 174 insertions(+)

diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
index 14c19a90b2b0..36e4a4c2aae8 100644
--- a/linux-user/fd-trans.c
+++ b/linux-user/fd-trans.c
@@ -271,6 +271,37 @@ enum {
     QEMU___RTA_MAX
 };
 
+enum {
+    QEMU_IFLA_VF_STATS_RX_PACKETS,
+    QEMU_IFLA_VF_STATS_TX_PACKETS,
+    QEMU_IFLA_VF_STATS_RX_BYTES,
+    QEMU_IFLA_VF_STATS_TX_BYTES,
+    QEMU_IFLA_VF_STATS_BROADCAST,
+    QEMU_IFLA_VF_STATS_MULTICAST,
+    QEMU_IFLA_VF_STATS_PAD,
+    QEMU_IFLA_VF_STATS_RX_DROPPED,
+    QEMU_IFLA_VF_STATS_TX_DROPPED,
+    QEMU__IFLA_VF_STATS_MAX,
+};
+
+enum {
+    QEMU_IFLA_VF_UNSPEC,
+    QEMU_IFLA_VF_MAC,
+    QEMU_IFLA_VF_VLAN,
+    QEMU_IFLA_VF_TX_RATE,
+    QEMU_IFLA_VF_SPOOFCHK,
+    QEMU_IFLA_VF_LINK_STATE,
+    QEMU_IFLA_VF_RATE,
+    QEMU_IFLA_VF_RSS_QUERY_EN,
+    QEMU_IFLA_VF_STATS,
+    QEMU_IFLA_VF_TRUST,
+    QEMU_IFLA_VF_IB_NODE_GUID,
+    QEMU_IFLA_VF_IB_PORT_GUID,
+    QEMU_IFLA_VF_VLAN_LIST,
+    QEMU_IFLA_VF_BROADCAST,
+    QEMU__IFLA_VF_MAX,
+};
+
 TargetFdTrans **target_fd_trans;
 QemuMutex target_fd_trans_lock;
 unsigned int target_fd_max;
@@ -808,6 +839,145 @@ static abi_long host_to_target_data_xdp_nlattr(struct nlattr *nlattr,
     return 0;
 }
 
+static abi_long host_to_target_data_vlan_list_nlattr(struct nlattr *nlattr,
+                                                     void *context)
+{
+    struct ifla_vf_vlan_info *vlan_info;
+
+    switch (nlattr->nla_type) {
+    /* struct ifla_vf_vlan_info */
+    case IFLA_VF_VLAN_INFO:
+        vlan_info = NLA_DATA(nlattr);
+        vlan_info->vf = tswap32(vlan_info->vf);
+        vlan_info->vlan = tswap32(vlan_info->vlan);
+        vlan_info->qos = tswap32(vlan_info->qos);
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "Unknown host VLAN LIST type: %d\n",
+                      nlattr->nla_type);
+        break;
+    }
+    return 0;
+}
+
+static abi_long host_to_target_data_vf_stats_nlattr(struct nlattr *nlattr,
+                                                    void *context)
+{
+    uint64_t *u64;
+
+    switch (nlattr->nla_type) {
+    /* uint64_t */
+    case QEMU_IFLA_VF_STATS_RX_PACKETS:
+    case QEMU_IFLA_VF_STATS_TX_PACKETS:
+    case QEMU_IFLA_VF_STATS_RX_BYTES:
+    case QEMU_IFLA_VF_STATS_TX_BYTES:
+    case QEMU_IFLA_VF_STATS_BROADCAST:
+    case QEMU_IFLA_VF_STATS_MULTICAST:
+    case QEMU_IFLA_VF_STATS_PAD:
+    case QEMU_IFLA_VF_STATS_RX_DROPPED:
+    case QEMU_IFLA_VF_STATS_TX_DROPPED:
+        u64 = NLA_DATA(nlattr);
+        *u64 = tswap64(*u64);
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "Unknown host VF STATS type: %d\n",
+                      nlattr->nla_type);
+        break;
+    }
+    return 0;
+}
+
+static abi_long host_to_target_data_vfinfo_nlattr(struct nlattr *nlattr,
+                                                  void *context)
+{
+    struct ifla_vf_mac *mac;
+    struct ifla_vf_vlan *vlan;
+    struct ifla_vf_vlan_info *vlan_info;
+    struct ifla_vf_spoofchk *spoofchk;
+    struct ifla_vf_rate *rate;
+    struct ifla_vf_link_state *link_state;
+    struct ifla_vf_rss_query_en *rss_query_en;
+    struct ifla_vf_trust *trust;
+    struct ifla_vf_guid *guid;
+
+    switch (nlattr->nla_type) {
+    /* struct ifla_vf_mac */
+    case QEMU_IFLA_VF_MAC:
+        mac = NLA_DATA(nlattr);
+        mac->vf = tswap32(mac->vf);
+        break;
+    /* struct ifla_vf_broadcast */
+    case QEMU_IFLA_VF_BROADCAST:
+        break;
+    /* struct struct ifla_vf_vlan */
+    case QEMU_IFLA_VF_VLAN:
+        vlan = NLA_DATA(nlattr);
+        vlan->vf = tswap32(vlan->vf);
+        vlan->vlan = tswap32(vlan->vlan);
+        vlan->qos = tswap32(vlan->qos);
+        break;
+    /* struct ifla_vf_vlan_info */
+    case QEMU_IFLA_VF_TX_RATE:
+        vlan_info = NLA_DATA(nlattr);
+        vlan_info->vf = tswap32(vlan_info->vf);
+        vlan_info->vlan = tswap32(vlan_info->vlan);
+        vlan_info->qos = tswap32(vlan_info->qos);
+        break;
+    /* struct ifla_vf_spoofchk */
+    case QEMU_IFLA_VF_SPOOFCHK:
+        spoofchk = NLA_DATA(nlattr);
+        spoofchk->vf = tswap32(spoofchk->vf);
+        spoofchk->setting = tswap32(spoofchk->setting);
+        break;
+    /* struct ifla_vf_rate */
+    case QEMU_IFLA_VF_RATE:
+        rate = NLA_DATA(nlattr);
+        rate->vf = tswap32(rate->vf);
+        rate->min_tx_rate = tswap32(rate->min_tx_rate);
+        rate->max_tx_rate = tswap32(rate->max_tx_rate);
+        break;
+    /* struct ifla_vf_link_state */
+    case QEMU_IFLA_VF_LINK_STATE:
+        link_state = NLA_DATA(nlattr);
+        link_state->vf = tswap32(link_state->vf);
+        link_state->link_state = tswap32(link_state->link_state);
+        break;
+    /* struct ifla_vf_rss_query_en */
+    case QEMU_IFLA_VF_RSS_QUERY_EN:
+        rss_query_en = NLA_DATA(nlattr);
+        rss_query_en->vf = tswap32(rss_query_en->vf);
+        rss_query_en->setting = tswap32(rss_query_en->setting);
+        break;
+    /* struct ifla_vf_trust */
+    case QEMU_IFLA_VF_TRUST:
+        trust = NLA_DATA(nlattr);
+        trust->vf = tswap32(trust->vf);
+        trust->setting = tswap32(trust->setting);
+        break;
+    /* struct ifla_vf_guid  */
+    case QEMU_IFLA_VF_IB_NODE_GUID:
+    case QEMU_IFLA_VF_IB_PORT_GUID:
+        guid = NLA_DATA(nlattr);
+        guid->vf = tswap32(guid->vf);
+        guid->guid = tswap32(guid->guid);
+        break;
+    /* nested */
+    case QEMU_IFLA_VF_VLAN_LIST:
+        return host_to_target_for_each_nlattr(RTA_DATA(nlattr), nlattr->nla_len,
+                                              NULL,
+                                          host_to_target_data_vlan_list_nlattr);
+    case QEMU_IFLA_VF_STATS:
+        return host_to_target_for_each_nlattr(RTA_DATA(nlattr), nlattr->nla_len,
+                                              NULL,
+                                           host_to_target_data_vf_stats_nlattr);
+    default:
+        qemu_log_mask(LOG_UNIMP, "Unknown host VFINFO type: %d\n",
+                      nlattr->nla_type);
+        break;
+    }
+    return 0;
+}
+
 static abi_long host_to_target_data_link_rtattr(struct rtattr *rtattr)
 {
     uint32_t *u32;
@@ -945,6 +1115,10 @@ static abi_long host_to_target_data_link_rtattr(struct rtattr *rtattr)
         return host_to_target_for_each_nlattr(RTA_DATA(rtattr), rtattr->rta_len,
                                               NULL,
                                                 host_to_target_data_xdp_nlattr);
+    case QEMU_IFLA_VFINFO_LIST:
+        return host_to_target_for_each_nlattr(RTA_DATA(rtattr), rtattr->rta_len,
+                                              NULL,
+                                             host_to_target_data_vfinfo_nlattr);
     default:
         qemu_log_mask(LOG_UNIMP, "Unknown host QEMU_IFLA type: %d\n",
                       rtattr->rta_type);
-- 
2.33.1


