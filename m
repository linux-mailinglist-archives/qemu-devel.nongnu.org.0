Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764674BEE72
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 01:36:35 +0100 (CET)
Received: from localhost ([::1]:43438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMJAQ-0007f5-4V
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 19:36:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMJ8m-0006gR-BL; Mon, 21 Feb 2022 19:34:52 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:42581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMJ8k-0000fq-LH; Mon, 21 Feb 2022 19:34:52 -0500
Received: from [192.168.100.1] ([82.142.17.50]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M730b-1nJplp0C3r-008cve; Tue, 22 Feb 2022 01:34:46 +0100
Message-ID: <96592c2c-0fd3-443a-80b6-ac5b6d1e6bd5@vivier.eu>
Date: Tue, 22 Feb 2022 01:34:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/1] vdpa: Make ncs autofree
Content-Language: fr
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20220214193415.1606752-1-eperezma@redhat.com>
 <20220214193415.1606752-2-eperezma@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220214193415.1606752-2-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2vip0x3L8odmZYzCPSYr8nnqquOISQ6OpkgLGWYiNEqK5QWMPkM
 NQNP9nj1FxBP7HpYDpvr0RgHE/hTWa4an3sIVt1taLvlVX2keKdx9NoK5/qxMO38r78oEXp
 pe9EEgetFvhQ8mJdy1HFZAEiG55X/DpEHgEUas83bYNQm/65blwhaiGIEmVUCnourSzzifk
 Z2ECelK/riDdRkfUwsK6Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+ii3IkOvuNc=:Zcf60wPbb1CUAZHaKmYMVs
 e5q+Waq0UYR4zM/Xhb4ZvI8jBtBhtsk01jPeXscGQcRnHmLoozl11486jBJT3QGYUiTQD09zq
 1pDAz148ilfgK7qzptYVBU3YH88/wNJd9ZQyUg10aFlUEBg5+kosyQlavzQ1/x9sQuAvTcyzk
 Q432xP/9dsVmc1pc8IGIGNmLJDYgHFt4JVBC+RJkK9KQ7/JuyY8ewxVa6nGbTGHgA53V5YjJj
 3zG5O7sMbYOZflixzHAEkmHrQPQ4GzD8eNNoDdrOnMvwGIMplAbAPH3dCPqYTPlCiMNE3opXI
 NtJjV+rANN/eqm6L2m6anIBUhOgHtn9cndERk31NQHGigqPHE0LQ+PCCpMdIPGjjN9NsqiMa8
 6w4w12jUWPx53/lu+UzuHVhVhiUO8d87ygoJLo9i8qa64Wg3G4uVJO9bALe85BRZcV1Dzcsoj
 Euu3IvXXMNhlt50tPIRxspLUE3wChDr13acad2Gvc2zxa51m2E/r5eowgF2eRRSP5ob6HrL0W
 R2VmGWvMMvSexJZ6lXxmhE9qKqn7qBd+RozQupw2BW2TtTMUCpLzbfyd8wUpjCqsqys34Y3Wb
 Bj+ucTZiRpkHD6XFI+Jst7ebRzqTqBNZclnXIWDTiBBHG1O2QXiB/ZaZEihqB/Ovpcx02SbPj
 phJUoAOE2dBJLUsKxKq4mdjp9dJDEEiS84ysOiy7XSCAezFI32GpcDDyno7X6k1eoVio=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 14/02/2022 à 20:34, Eugenio Pérez a écrit :
> Simplifying memory management.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   net/vhost-vdpa.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 4125d13118..4befba5cc7 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -264,7 +264,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>   {
>       const NetdevVhostVDPAOptions *opts;
>       int vdpa_device_fd;
> -    NetClientState **ncs, *nc;
> +    g_autofree NetClientState **ncs = NULL;
> +    NetClientState *nc;
>       int queue_pairs, i, has_cvq = 0;
>   
>       assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
> @@ -302,7 +303,6 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>               goto err;
>       }
>   
> -    g_free(ncs);
>       return 0;
>   
>   err:
> @@ -310,7 +310,6 @@ err:
>           qemu_del_net_client(ncs[0]);
>       }
>       qemu_close(vdpa_device_fd);
> -    g_free(ncs);
>   
>       return -1;
>   }

Applied to my trivial-patches branch.

Thanks,
Laurent



