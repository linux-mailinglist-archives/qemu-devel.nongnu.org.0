Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF82A2F3B58
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 21:03:38 +0100 (CET)
Received: from localhost ([::1]:41464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzPtC-0000c7-0c
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 15:03:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kzPr9-0007pz-OJ; Tue, 12 Jan 2021 15:01:31 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:57519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1kzPr8-0002mP-2D; Tue, 12 Jan 2021 15:01:31 -0500
Received: from [192.168.100.1] ([82.252.137.42]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MVv4X-1kYIlM2le9-00RmU6; Tue, 12 Jan 2021 21:01:25 +0100
Subject: Re: [PATCH] hw/ide/ahci: Replace fprintf() by
 qemu_log_mask(GUEST_ERROR)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210112112955.1849212-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <84dd3422-81a9-d10d-b855-1ce377204b10@vivier.eu>
Date: Tue, 12 Jan 2021 21:01:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112112955.1849212-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tnM5g3B14HZzG6hoeZbQfjVZVYDp00azJhKLQAtFqT+bOZiC3eN
 D1+E8ESqSSXsQtxUh9BEbb6vBf8EYR/SddBrrWGh3MB6k5sL9NQBlTh77Qrp8Uam9hBVdDp
 oRrSoX48a3KLevQTBzbgqAFQYS5IaQtZRBzDwC6CWbi7kwukqMQ0CposD1oNy8Q6gC3C6LF
 r2Hs7E9ncum4wokxA2AXQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:S8V/S5dHR/o=:vq0TA1K3pZ2SCpTsDLpDNA
 SiLpcp/2Ujqr2URHmI4xrM7j4m1teNk3M5bBdnsNa9Ns7PUiHOb3ikRTy5mlgNvi0vdU8mEfh
 KC6BG9sTlkTeMfRReb8xdjKe0ARwtLGavfOqRvZzueGZgOYxNAFw4qA01wAnDt1M3y4+IgC9T
 juZHw36n5Tt3l0SReJ0tPMCUR64VBNahet/+EkFQvPcJCVOY2odfZqFrRHzLWk4l3EcRPsaXV
 tFxP1EfYOexxNvUsYm64tG/DfqiZu41WPYOJP78++3i8OQ6+oxIdcEDnzfwcnECnhw6CQnwXn
 SA/VWI0/FpzCBhSfNBA/GltPauv4SxyySaYzo5+ci9t+kyKOC8cbKV96DlYWyJ8yJbAZEvBxY
 PiX/wv76XNZXwV9/7N5foHh7mxjaJDa1VF9iKK22N4xLoNgjNKe+ycecff52vxaJ9QmfEqhW1
 OQXHhziwkg==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 12/01/2021 à 12:29, Philippe Mathieu-Daudé a écrit :
> Replace fprintf() calls by qemu_log_mask(LOG_GUEST_ERROR).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/ide/ahci.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
> index 4b675b9cfd8..6d50482b8d1 100644
> --- a/hw/ide/ahci.c
> +++ b/hw/ide/ahci.c
> @@ -465,8 +465,9 @@ static void ahci_mem_write(void *opaque, hwaddr addr,
>  
>      /* Only aligned reads are allowed on AHCI */
>      if (addr & 3) {
> -        fprintf(stderr, "ahci: Mis-aligned write to addr 0x"
> -                TARGET_FMT_plx "\n", addr);
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "ahci: Mis-aligned write to addr 0x%03" HWADDR_PRIX "\n",
> +                      addr);
>          return;
>      }
>  
> @@ -1111,7 +1112,8 @@ static void process_ncq_command(AHCIState *s, int port, uint8_t *cmd_fis,
>      g_assert(is_ncq(ncq_fis->command));
>      if (ncq_tfs->used) {
>          /* error - already in use */
> -        fprintf(stderr, "%s: tag %d already used\n", __func__, tag);
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: tag %d already used\n",
> +                      __func__, tag);
>          return;
>      }
>  
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


