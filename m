Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C07FA17E0A1
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 13:53:25 +0100 (CET)
Received: from localhost ([::1]:42712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBHuO-0002ok-RO
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 08:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34579)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBHra-00082K-Ct
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 08:50:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBHrZ-0003x5-5j
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 08:50:30 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:44241)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBHrY-0003t9-RE; Mon, 09 Mar 2020 08:50:29 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MaIGB-1ioU620zpd-00WILQ; Mon, 09 Mar 2020 13:50:19 +0100
Subject: Re: [PATCH v3 12/12] monitor/hmp-cmds: Remove redundant statement in
 hmp_rocker_of_dpa_groups()
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20200302130715.29440-1-kuhn.chenqun@huawei.com>
 <20200302130715.29440-14-kuhn.chenqun@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <5224a100-b573-9d92-09ec-b7f0b5b824ce@vivier.eu>
Date: Mon, 9 Mar 2020 13:50:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200302130715.29440-14-kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:gXg9lWx7sn5VqNEQKodDFiMSkYMvxQHZE5RnPbsmYP7w4BaiB11
 PtU1iUWnCsx9LZoxvvE3ZVXRAES/IhS5JLQgnqfcJiAI/btlfyYSEiWoHUHAZbPXhVB0+xP
 vkqC2YBP2eJx+dUTUUQ1fEnn0EsmM3vOYt33okh1/eZisV0o2PJ59x8JCzpyMhO2VYH0oK+
 oIAtwIIcZuPaQFdB+8/1w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ncrj1F0UDlw=:FSKUUT7yHbIndMVmMbz/eY
 JXSS16F1sdp/Excab7XGGX1HgxAC/YIQrfpGAj3xxvPR87E0qvpzQkhB991PvH4TBr8/LqO8J
 b5sfeOm2NfIfgCx1uB7/h2Qut7rJWjtduiF8f9xodubfXYBWCbYrsx1osveHb3VeIfSGy94wm
 XEOqDcriWnjo874KlNJyPI0DXsy/ZMDS4R+i1ltb+d3HCci2rJng5l/d016t0gGbF0VmPqkTo
 ovaX9FXX6ihb3wvbG/VCvREDsMgbTLAlx1+e3+j3kWPc3LCf7FSJyXn8oHS3uh2peGbQ8ZMpE
 AxwvKX22DQzrhTz6keB8J8uLT40Y2dOl2XaY1odnRs9MBEsI8Tbfc7RisT/GqP4NUVuAszRLT
 4v6C/Puj3cUnS3q89EsWzjUf2Xl40qrzw6PGgMa9s9SvG4XgYTSr4j3uIvfLteuzONy77RTMD
 yGmNU6XTvzHilZqvo302qbQ9mBVfst/MPPb2iHx05gmVPhQdyi5hzKWxVgRfrDuF7tGt6Jdk4
 pgfdsF1TLvrlOuj0HZlx688EAcj33PFkbTHFY3KLUmzjTAjrEHSwza9l6NpGzWH+4ZuK22QV6
 IeechsZMfY+5/WWELoD1urOyu++98M0uyD0Wy2SB9xnPqRvT4TWrZPTGzvev8Nz9jt8XOZVRO
 nU8jz/LEDSC8yA+BGjffHJQCIOdhhiaGAWmpD1B0GBbL9HyIYz/9TW+0dxbtSqVmfohbXfDfg
 t4y41TKKci6sIaIQuJ4iDKPdKo37nAXAOdCGzGd3JRP3y/D5E7+ZcolzLSey3yryyJ3N4FcoI
 uZKYYfx/tB1OghZenKYJvItxY0ZPFz5BEwdexE0dWFGkytwruY9TKc8q0npQuRggw71bkA4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
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
Cc: peter.maydell@linaro.org, Euler Robot <euler.robot@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 zhang.zhanghailiang@huawei.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 02/03/2020 à 14:07, Chen Qun a écrit :
> Clang static code analyzer show warning:
> monitor/hmp-cmds.c:2867:17: warning: Value stored to 'set' is never read
>                 set = true;
>                 ^     ~~~~
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> v1->v2: move the 'set' declaration to the for() statement(Base on Philippe's suggestion).
> ---
>  monitor/hmp-cmds.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 53bc3f76c4..c6b0495822 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -2808,7 +2808,6 @@ void hmp_rocker_of_dpa_groups(Monitor *mon, const QDict *qdict)
>      const char *name = qdict_get_str(qdict, "name");
>      uint8_t type = qdict_get_try_int(qdict, "type", 9);
>      Error *err = NULL;
> -    bool set = false;
>  
>      list = qmp_query_rocker_of_dpa_groups(name, type != 9, type, &err);
>      if (err != NULL) {
> @@ -2820,6 +2819,7 @@ void hmp_rocker_of_dpa_groups(Monitor *mon, const QDict *qdict)
>  
>      for (g = list; g; g = g->next) {
>          RockerOfDpaGroup *group = g->value;
> +        bool set = false;
>  
>          monitor_printf(mon, "0x%08x", group->id);
>  
> @@ -2864,14 +2864,11 @@ void hmp_rocker_of_dpa_groups(Monitor *mon, const QDict *qdict)
>  
>          if (group->has_set_eth_dst) {
>              if (!set) {
> -                set = true;
>                  monitor_printf(mon, " set");
>              }
>              monitor_printf(mon, " dst %s", group->set_eth_dst);
>          }
>  
> -        set = false;
> -
>          if (group->has_ttl_check && group->ttl_check) {
>              monitor_printf(mon, " check TTL");
>          }
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

