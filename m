Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7695D48512E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:34:04 +0100 (CET)
Received: from localhost ([::1]:33802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53cJ-00007h-HI
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:34:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53Y0-0005eT-9t
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:29:37 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:58593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53Xu-0008I8-NG
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:29:36 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MWjUc-1mtwgq2bzk-00X2uv for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022
 11:29:28 +0100
Message-ID: <3d75c088-8e81-d268-956b-59b66b81ad06@vivier.eu>
Date: Wed, 5 Jan 2022 11:29:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/3] linux-user: netlink: Add IFLA_VFINFO_LIST
Content-Language: fr
To: qemu-devel@nongnu.org
References: <20211219154514.2165728-1-laurent@vivier.eu>
 <20211219154514.2165728-2-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211219154514.2165728-2-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4JSPQAby2ThLk8eBkKmzPaBYKGb1UPUOKmx+3q4qHh3C3eSe4di
 0GjUYVpPDmuk0c0SMFWPWGgnfHjepmbl6CuiCGt6/9a5v5hCXLOnhH97z8okmvYjrnG9ALK
 U5r1HGmz+txwyPySDEOFRV970LZ1jmohIAC0xB0GywXRSkUD2roro5oXUX+BEXG39dik8a7
 uuOACTr8datMMq8zSy4vA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bm2YpoSKJp4=:sJNFlXuTcQDNlC2b7f9Pk7
 QoNIN2nm/jjgnhsZ3LndgVWkTJ5w4MDmdc3GirfHswDwp+BT4WJi8FPvKcp0+QqAdc9yWqrtf
 VokbZQPlZHB5uxsv9b6BaB1E9goSZ5noTNBq48R1eoKWwNJleKx81dQZAH6e21HwicDveMemN
 zWHCO5KBpavYDVjlHtI2N13rUObVZTP20bf7lhrxgjLeu7PLugfD/4vLAY0CCCHT9VxEHDDRm
 wJkqHsF07e5gDVODy+GCW80Cq4St/TQ8DK1T6331UECJD5xnA1+qC7OyDJealiM9YdtL5REqa
 cTXT3ehyZ/jLzKim2quVJv6r9DUWMNdrntHAq03C7mbhxOY+Vw1tRk4omJZr83jUfA4ygF44C
 ztLrX6Rd6PV2ds9sV/EEHvg46OguC020wV80RWbyMI/QaZ4rxyCXspc8wvhGdibVGr899DOEz
 M75d20b5dte4za+wQHutXW1h64OUib0bMrrxzvSIWUbdom+3H77d91lIyS6QLakMmCVO1EAOH
 0g8RFr1fvKDeusHba6AXV2V6QtVGqxvvAYZu28Leibvay2Ew6Y+QVUrOFj9li/WLT8h2/jQEv
 1XWbEX6TuHarCvbwzvsFgTj1IJ8szqYXsjxzt4Ejs4fUVhrwxIJfimgrCzZxnzCqAfQpVFYj+
 ZLA6KKbvzOeA6R9ZE1IzE+9Z9WI15MecwXQz0k4Vz9+TTCK9u6JRH6xV2wJ+N/UmDwdE=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.057,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 19/12/2021 à 16:45, Laurent Vivier a écrit :
>    # QEMU_LOG=unimp ip a
>    Unknown host QEMU_IFLA type: 22
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   linux-user/fd-trans.c | 174 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 174 insertions(+)
> 
> diff --git a/linux-user/fd-trans.c b/linux-user/fd-trans.c
> index 14c19a90b2b0..36e4a4c2aae8 100644
> --- a/linux-user/fd-trans.c
> +++ b/linux-user/fd-trans.c
> @@ -271,6 +271,37 @@ enum {
>       QEMU___RTA_MAX
>   };
>   
> +enum {
> +    QEMU_IFLA_VF_STATS_RX_PACKETS,
> +    QEMU_IFLA_VF_STATS_TX_PACKETS,
> +    QEMU_IFLA_VF_STATS_RX_BYTES,
> +    QEMU_IFLA_VF_STATS_TX_BYTES,
> +    QEMU_IFLA_VF_STATS_BROADCAST,
> +    QEMU_IFLA_VF_STATS_MULTICAST,
> +    QEMU_IFLA_VF_STATS_PAD,
> +    QEMU_IFLA_VF_STATS_RX_DROPPED,
> +    QEMU_IFLA_VF_STATS_TX_DROPPED,
> +    QEMU__IFLA_VF_STATS_MAX,
> +};
> +
> +enum {
> +    QEMU_IFLA_VF_UNSPEC,
> +    QEMU_IFLA_VF_MAC,
> +    QEMU_IFLA_VF_VLAN,
> +    QEMU_IFLA_VF_TX_RATE,
> +    QEMU_IFLA_VF_SPOOFCHK,
> +    QEMU_IFLA_VF_LINK_STATE,
> +    QEMU_IFLA_VF_RATE,
> +    QEMU_IFLA_VF_RSS_QUERY_EN,
> +    QEMU_IFLA_VF_STATS,
> +    QEMU_IFLA_VF_TRUST,
> +    QEMU_IFLA_VF_IB_NODE_GUID,
> +    QEMU_IFLA_VF_IB_PORT_GUID,
> +    QEMU_IFLA_VF_VLAN_LIST,
> +    QEMU_IFLA_VF_BROADCAST,
> +    QEMU__IFLA_VF_MAX,
> +};
> +
>   TargetFdTrans **target_fd_trans;
>   QemuMutex target_fd_trans_lock;
>   unsigned int target_fd_max;
> @@ -808,6 +839,145 @@ static abi_long host_to_target_data_xdp_nlattr(struct nlattr *nlattr,
>       return 0;
>   }
>   
> +static abi_long host_to_target_data_vlan_list_nlattr(struct nlattr *nlattr,
> +                                                     void *context)
> +{
> +    struct ifla_vf_vlan_info *vlan_info;
> +
> +    switch (nlattr->nla_type) {
> +    /* struct ifla_vf_vlan_info */
> +    case IFLA_VF_VLAN_INFO:
> +        vlan_info = NLA_DATA(nlattr);
> +        vlan_info->vf = tswap32(vlan_info->vf);
> +        vlan_info->vlan = tswap32(vlan_info->vlan);
> +        vlan_info->qos = tswap32(vlan_info->qos);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "Unknown host VLAN LIST type: %d\n",
> +                      nlattr->nla_type);
> +        break;
> +    }
> +    return 0;
> +}
> +
> +static abi_long host_to_target_data_vf_stats_nlattr(struct nlattr *nlattr,
> +                                                    void *context)
> +{
> +    uint64_t *u64;
> +
> +    switch (nlattr->nla_type) {
> +    /* uint64_t */
> +    case QEMU_IFLA_VF_STATS_RX_PACKETS:
> +    case QEMU_IFLA_VF_STATS_TX_PACKETS:
> +    case QEMU_IFLA_VF_STATS_RX_BYTES:
> +    case QEMU_IFLA_VF_STATS_TX_BYTES:
> +    case QEMU_IFLA_VF_STATS_BROADCAST:
> +    case QEMU_IFLA_VF_STATS_MULTICAST:
> +    case QEMU_IFLA_VF_STATS_PAD:
> +    case QEMU_IFLA_VF_STATS_RX_DROPPED:
> +    case QEMU_IFLA_VF_STATS_TX_DROPPED:
> +        u64 = NLA_DATA(nlattr);
> +        *u64 = tswap64(*u64);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "Unknown host VF STATS type: %d\n",
> +                      nlattr->nla_type);
> +        break;
> +    }
> +    return 0;
> +}
> +
> +static abi_long host_to_target_data_vfinfo_nlattr(struct nlattr *nlattr,
> +                                                  void *context)
> +{
> +    struct ifla_vf_mac *mac;
> +    struct ifla_vf_vlan *vlan;
> +    struct ifla_vf_vlan_info *vlan_info;
> +    struct ifla_vf_spoofchk *spoofchk;
> +    struct ifla_vf_rate *rate;
> +    struct ifla_vf_link_state *link_state;
> +    struct ifla_vf_rss_query_en *rss_query_en;
> +    struct ifla_vf_trust *trust;
> +    struct ifla_vf_guid *guid;
> +
> +    switch (nlattr->nla_type) {
> +    /* struct ifla_vf_mac */
> +    case QEMU_IFLA_VF_MAC:
> +        mac = NLA_DATA(nlattr);
> +        mac->vf = tswap32(mac->vf);
> +        break;
> +    /* struct ifla_vf_broadcast */
> +    case QEMU_IFLA_VF_BROADCAST:
> +        break;
> +    /* struct struct ifla_vf_vlan */
> +    case QEMU_IFLA_VF_VLAN:
> +        vlan = NLA_DATA(nlattr);
> +        vlan->vf = tswap32(vlan->vf);
> +        vlan->vlan = tswap32(vlan->vlan);
> +        vlan->qos = tswap32(vlan->qos);
> +        break;
> +    /* struct ifla_vf_vlan_info */
> +    case QEMU_IFLA_VF_TX_RATE:
> +        vlan_info = NLA_DATA(nlattr);
> +        vlan_info->vf = tswap32(vlan_info->vf);
> +        vlan_info->vlan = tswap32(vlan_info->vlan);
> +        vlan_info->qos = tswap32(vlan_info->qos);
> +        break;
> +    /* struct ifla_vf_spoofchk */
> +    case QEMU_IFLA_VF_SPOOFCHK:
> +        spoofchk = NLA_DATA(nlattr);
> +        spoofchk->vf = tswap32(spoofchk->vf);
> +        spoofchk->setting = tswap32(spoofchk->setting);
> +        break;
> +    /* struct ifla_vf_rate */
> +    case QEMU_IFLA_VF_RATE:
> +        rate = NLA_DATA(nlattr);
> +        rate->vf = tswap32(rate->vf);
> +        rate->min_tx_rate = tswap32(rate->min_tx_rate);
> +        rate->max_tx_rate = tswap32(rate->max_tx_rate);
> +        break;
> +    /* struct ifla_vf_link_state */
> +    case QEMU_IFLA_VF_LINK_STATE:
> +        link_state = NLA_DATA(nlattr);
> +        link_state->vf = tswap32(link_state->vf);
> +        link_state->link_state = tswap32(link_state->link_state);
> +        break;
> +    /* struct ifla_vf_rss_query_en */
> +    case QEMU_IFLA_VF_RSS_QUERY_EN:
> +        rss_query_en = NLA_DATA(nlattr);
> +        rss_query_en->vf = tswap32(rss_query_en->vf);
> +        rss_query_en->setting = tswap32(rss_query_en->setting);
> +        break;
> +    /* struct ifla_vf_trust */
> +    case QEMU_IFLA_VF_TRUST:
> +        trust = NLA_DATA(nlattr);
> +        trust->vf = tswap32(trust->vf);
> +        trust->setting = tswap32(trust->setting);
> +        break;
> +    /* struct ifla_vf_guid  */
> +    case QEMU_IFLA_VF_IB_NODE_GUID:
> +    case QEMU_IFLA_VF_IB_PORT_GUID:
> +        guid = NLA_DATA(nlattr);
> +        guid->vf = tswap32(guid->vf);
> +        guid->guid = tswap32(guid->guid);
> +        break;
> +    /* nested */
> +    case QEMU_IFLA_VF_VLAN_LIST:
> +        return host_to_target_for_each_nlattr(RTA_DATA(nlattr), nlattr->nla_len,
> +                                              NULL,
> +                                          host_to_target_data_vlan_list_nlattr);
> +    case QEMU_IFLA_VF_STATS:
> +        return host_to_target_for_each_nlattr(RTA_DATA(nlattr), nlattr->nla_len,
> +                                              NULL,
> +                                           host_to_target_data_vf_stats_nlattr);
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "Unknown host VFINFO type: %d\n",
> +                      nlattr->nla_type);
> +        break;
> +    }
> +    return 0;
> +}
> +
>   static abi_long host_to_target_data_link_rtattr(struct rtattr *rtattr)
>   {
>       uint32_t *u32;
> @@ -945,6 +1115,10 @@ static abi_long host_to_target_data_link_rtattr(struct rtattr *rtattr)
>           return host_to_target_for_each_nlattr(RTA_DATA(rtattr), rtattr->rta_len,
>                                                 NULL,
>                                                   host_to_target_data_xdp_nlattr);
> +    case QEMU_IFLA_VFINFO_LIST:
> +        return host_to_target_for_each_nlattr(RTA_DATA(rtattr), rtattr->rta_len,
> +                                              NULL,
> +                                             host_to_target_data_vfinfo_nlattr);
>       default:
>           qemu_log_mask(LOG_UNIMP, "Unknown host QEMU_IFLA type: %d\n",
>                         rtattr->rta_type);

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent


