Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 277E261F339
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 13:29:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os1Ep-0003Tb-6G; Mon, 07 Nov 2022 07:28:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1os1EE-0003Rk-GV
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 07:27:51 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1os1EC-0001R5-UN
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 07:27:50 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5296422489;
 Mon,  7 Nov 2022 12:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667824063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tKmrk5fplH2CoszmA2GxnVvudZz/Cb5Qtjsoad5UCZs=;
 b=wURGWeITTITta87HU19fFpblXsGUyvC4Hd/4P7f+tSr9YA1wIYcA/exRt31j0hl+obZu4r
 WPp8JoZz+QqmeRhfh+3mcFw54n69kJU+tsKgIckmzTsYHQAsYZucNMg9U9ThqIJx3Rdh6U
 5+WMzWySgYKVa3o3ZBC7KAsDBgVCsU4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667824063;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tKmrk5fplH2CoszmA2GxnVvudZz/Cb5Qtjsoad5UCZs=;
 b=E+qA8NKLS8APoVSDqXHkURr18kR2uVozuaTiflGaoxT9Wgrytuwc637AggHAq5112eVgik
 MKpYfJp/RoeEwyCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 261B813AC7;
 Mon,  7 Nov 2022 12:27:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sFS1B7/5aGPyNgAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 07 Nov 2022 12:27:43 +0000
Message-ID: <11e7f68a-23eb-ba7b-c87a-4affb333285b@suse.de>
Date: Mon, 7 Nov 2022 13:27:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/3] net: Replace "Supported NIC models" with "Available
 NIC models"
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, pbonzini@redhat.com
References: <20221104125705.415923-1-thuth@redhat.com>
 <20221104125705.415923-4-thuth@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20221104125705.415923-4-thuth@redhat.com>
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

On 11/4/22 13:57, Thomas Huth wrote:
> Just because a NIC model is compiled into the QEMU binary does not
> necessary mean that it can be used with each and every machine.
> So let's rather talk about "available" models instead of "supported"
> models, just to avoid confusion.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  net/net.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/net.c b/net/net.c
> index b4b8f2a9cc..173195dbf9 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -943,7 +943,7 @@ int qemu_show_nic_models(const char *arg, const char *const *models)
>          return 0;
>      }
>  
> -    printf("Supported NIC models:\n");
> +    printf("Available NIC models:\n");
>      for (i = 0 ; models[i]; i++) {
>          printf("%s\n", models[i]);
>      }

Reviewed-by: Claudio Fontana <cfontana@suse.de>

