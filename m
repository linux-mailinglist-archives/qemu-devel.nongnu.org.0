Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4C3609EFE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 12:24:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omuRJ-0003ed-Sy; Mon, 24 Oct 2022 06:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1omuRH-0003e3-LO; Mon, 24 Oct 2022 06:12:11 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1omuRF-0001mf-WF; Mon, 24 Oct 2022 06:12:11 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E077422111;
 Mon, 24 Oct 2022 10:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666606326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GXxaNc6lVMzc+bLEe+8uWRygUirCXiCcG2IhXaY9aMc=;
 b=ZcBYAL+oH1duqVPEENIFcH08NLgb+bVJ17NgGmb4UOnHXeOopehGo5ELUDfaU4qv0LrNnt
 Pp4CWU2n8WhrCJnx19zyMI0ZW505CAjc9r06rqRpFU1k/q4uV6LPtQhYpKityxQlo4a17j
 PX91C7DLgGtARp6a2emuAdUv8rscI1o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666606326;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GXxaNc6lVMzc+bLEe+8uWRygUirCXiCcG2IhXaY9aMc=;
 b=j0ta+2YYnCcHWP5rtSexKX10oWKwmxvzqO06juEpjRvm1Jxu2M2UsOADdH93efgk1/4oDr
 8fWj1mhkULgH/GAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B866C13A79;
 Mon, 24 Oct 2022 10:12:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MXR9K/ZkVmOcCgAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 24 Oct 2022 10:12:06 +0000
Message-ID: <61e0fd3e-b1f5-64c0-acb8-d4586eb01a3a@suse.de>
Date: Mon, 24 Oct 2022 12:12:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] ui: remove useless typecasts
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20221022141204.29358-1-vr_qemu@t-online.de>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20221022141204.29358-1-vr_qemu@t-online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/22/22 16:12, Volker Rümelin wrote:
> Commit 8f9abdf586 ("chardev: src buffer const for write functions")
> changed the type of the second parameter of qemu_chr_be_write()
> from uint8_t * to const uint8_t *. Remove the now useless type
> casts from qemu_chr_be_write() function calls in ui/console.c and
> ui/gtk.c.
> 
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>

Reviewed-by: Claudio Fontana <cfontana@suse.de>

> ---
>  ui/console.c | 2 +-
>  ui/gtk.c     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/ui/console.c b/ui/console.c
> index 49da6a91df..65c117874c 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -1297,7 +1297,7 @@ static void kbd_send_chars(QemuConsole *s)
>          uint32_t size;
>  
>          buf = fifo8_pop_buf(&s->out_fifo, MIN(len, avail), &size);
> -        qemu_chr_be_write(s->chr, (uint8_t *)buf, size);
> +        qemu_chr_be_write(s->chr, buf, size);
>          len = qemu_chr_be_can_write(s->chr);
>          avail -= size;
>      }
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 92daaa6a6e..7ec21f7798 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -1763,7 +1763,7 @@ static void gd_vc_send_chars(VirtualConsole *vc)
>          uint32_t size;
>  
>          buf = fifo8_pop_buf(&vc->vte.out_fifo, MIN(len, avail), &size);
> -        qemu_chr_be_write(vc->vte.chr, (uint8_t *)buf, size);
> +        qemu_chr_be_write(vc->vte.chr, buf, size);
>          len = qemu_chr_be_can_write(vc->vte.chr);
>          avail -= size;
>      }


