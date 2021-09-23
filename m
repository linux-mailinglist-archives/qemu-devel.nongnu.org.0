Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FDC4161B6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 17:06:13 +0200 (CEST)
Received: from localhost ([::1]:57822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTQIe-00073H-Tq
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 11:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mTQGS-00053M-1p; Thu, 23 Sep 2021 11:03:57 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:35387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mTQGQ-0004Qg-EM; Thu, 23 Sep 2021 11:03:55 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M1aQN-1mS3Lz200R-0038b2; Thu, 23 Sep 2021 17:03:48 +0200
Subject: Re: [PATCH 1/2] hmp: Unbreak "change vnc"
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210909081219.308065-1-armbru@redhat.com>
 <20210909081219.308065-2-armbru@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <2a2a7d19-d5c5-5ca3-184d-baf450b840ff@vivier.eu>
Date: Thu, 23 Sep 2021 17:03:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210909081219.308065-2-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NXZH6PEuGnHo2hCBh5NIk/cVoOYz3/cqk/54h8sKocMA8uXoN63
 /7OSiwibtgXar793p2VUuflYPEgtcAnP6aE2jYUWFeEzEuEmIiAmeO69vXHPMUqyZbjpvCW
 StZrvPVr6kOIElsbXF0WXOpdvTTT8XqxZTGnEQdqqWeCbSCzOHfb9Xow4cgYsOlaRJ2pWil
 MrxD2vjGFpvpguRT2wV7g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+3uL7yUPwt4=:ETnySxqJmK2cRTluy8fPAe
 /PrVWX/2Y9D1Hikj8rTAFCOopylQ+sjGURxNRCNeOHTjtUzgaQvG6pHeyRProQB4z2BmLZiJ0
 OxVNppRpdS+GNwcSdPsAmIotWGJzl5v3BctuFEMOcPVPwbruCagpa2kAVfWa/Pk14gShKakZu
 wUBA6gjD95s4/y3WVole+4N5wCZ50YObyZDxeOGro/yq5virGiA7bs19r0nAaB5gd8h9lLNg3
 F+/6/cQk/KUm+/1+lRQqcGmDI1InigneNKK5HUN3nkZ9+m9UR5EH6VouapPJ0ErtT+eXDzU0D
 uBjawplsBvvXidtRDYx2IagYiwl+2Z5kEbQCyKHl+cqv6C4pSZZa8/JONVGKhBvwL7cLqb3Zm
 PxFwNdivWBLgqlkHMHNhab6O15lF640rMPRBOohh8rKsjR37PNjvFCotNQJVTYe5pdf+ODgfX
 AroZLVFYJU3tfLqmSbW5ybE10KIJ9RKPfHpw+FR3+DZkeUxAjGZMROiH+M5ERZ9KYMc9u7O85
 N94UkGcP1Z0/GSS8cSUaj4955EDgnJcaaBSG+jNji6w8OjxhWbYRWVi4q38OxwCMwkV+4n9QK
 wuPP1+5NqHzdTy6Hd6G8HwSIaw+SznfXparL8FI0p39tyaK3ZYuAyT3ytXq5bSiUBbjhOzOFP
 9LFzP2g6X3FSIKcbpVgTpa9rL5Bst0XQp1+Hdt2U+zH41/9cRqNNoAHFGuGkW/8sbLvTnL/+4
 H1izDHtjI0A4Dq6/YmovhlfDOn8zGFB2ZkwI+A==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>, pbonzini@redhat.com,
 kraxel@redhat.com, qemu-stable@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 09/09/2021 à 10:12, Markus Armbruster a écrit :
> HMP command "change vnc" can take the password as argument, or prompt
> for it:
> 
>     (qemu) change vnc password 123
>     (qemu) change vnc password
>     Password: ***
>     (qemu)
> 
> This regressed in commit cfb5387a1d "hmp: remove "change vnc TARGET"
> command", v6.0.0.
> 
>     (qemu) change vnc passwd 123
>     Password: ***
>     (qemu) change vnc passwd
>     (qemu)
> 
> The latter passes NULL to qmp_change_vnc_password(), which is a no-no.
> Looks like it puts the display into "password required, but none set"
> state.
> 
> The logic error is easy to miss in review, but testing should've
> caught it.
> 
> Fix the obvious way.
> 
> Fixes: cfb5387a1de2acda23fb5c97d2378b9e7ddf8025
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  monitor/hmp-cmds.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index e00255f7ee..a7e197a90b 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1496,7 +1496,7 @@ void hmp_change(Monitor *mon, const QDict *qdict)
>          }
>          if (strcmp(target, "passwd") == 0 ||
>              strcmp(target, "password") == 0) {
> -            if (arg) {
> +            if (!arg) {
>                  MonitorHMP *hmp_mon = container_of(mon, MonitorHMP, common);
>                  monitor_read_password(hmp_mon, hmp_change_read_arg, NULL);
>                  return;
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


