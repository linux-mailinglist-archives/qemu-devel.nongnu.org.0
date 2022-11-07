Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 873C561F338
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 13:29:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os1Dp-0003Iy-J2; Mon, 07 Nov 2022 07:27:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1os1Dn-0003Hc-2V
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 07:27:23 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1os1Dl-0001OA-E4
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 07:27:22 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A03DB225E7;
 Mon,  7 Nov 2022 12:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667824039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fY9/aA5mZ7MPYbFvipr5xTcYhxZHi9FylJdTLVmv+g8=;
 b=t+l6blvvMpPc4jWe5hYTfu0A4d3CQfmEttzWVedDGtlkVZqnNJJ8P+PvsozmIvDpHM4bir
 U6WXBwTzzxyHf1viv74AIYlWosjRU1KkYenog9j5GbrirSIB3wEyHPDY0mji6mK9rE0+mR
 WJVHuldvIhraZJFWVo4AeJ/7UKYzNT4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667824039;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fY9/aA5mZ7MPYbFvipr5xTcYhxZHi9FylJdTLVmv+g8=;
 b=VptN4zM+ofhhPcytJyXL7FkunZa3z8jnJ2noH8XNdbs555w8RmI0kH3QxXHAU1lM8kbvi1
 5/Grgkb2E2K/W5Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 729B013AC7;
 Mon,  7 Nov 2022 12:27:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XRtVGqf5aGO3NgAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 07 Nov 2022 12:27:19 +0000
Message-ID: <92cea786-0a5d-1ddd-68d5-14ca98143614@suse.de>
Date: Mon, 7 Nov 2022 13:27:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/3] net: Restore printing of the help text with "-nic
 help"
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, pbonzini@redhat.com
References: <20221104125705.415923-1-thuth@redhat.com>
 <20221104125705.415923-3-thuth@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20221104125705.415923-3-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

should -net and -netdev be adapted too?

For audio, we now have support for help options in both -audiodev and -audio..

Thanks,

Claudio

On 11/4/22 13:57, Thomas Huth wrote:
> Running QEMU with "-nic help" used to work in QEMU 5.2 and earlier versions
> (it showed the available netdev backends), but this feature got broken during
> some refactoring in version 6.0. Let's restore the old behavior, and while
> we're at it, let's also print the available NIC models here now since this
> option can be used to configure both, netdev backend and model in one go.
> 
> Fixes: ad6f932fe8 ("net: do not exit on "netdev_add help" monitor command")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  net/net.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/net/net.c b/net/net.c
> index c0516a8067..b4b8f2a9cc 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1571,8 +1571,18 @@ static int net_param_nic(void *dummy, QemuOpts *opts, Error **errp)
>      const char *type;
>  
>      type = qemu_opt_get(opts, "type");
> -    if (type && g_str_equal(type, "none")) {
> -        return 0;    /* Nothing to do, default_net is cleared in vl.c */
> +    if (type) {
> +        if (g_str_equal(type, "none")) {
> +            return 0;    /* Nothing to do, default_net is cleared in vl.c */
> +        }
> +        if (is_help_option(type)) {
> +            GPtrArray *nic_models = qemu_get_nic_models(TYPE_DEVICE);
> +            show_netdevs();
> +            printf("\n");
> +            qemu_show_nic_models(type, (const char **)nic_models->pdata);
> +            g_ptr_array_free(nic_models, true);
> +            exit(0);
> +        }
>      }
>  
>      idx = nic_get_free_idx();


