Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C06356F9965
	for <lists+qemu-devel@lfdr.de>; Sun,  7 May 2023 17:33:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvgMR-0002XB-MK; Sun, 07 May 2023 11:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pvgMP-0002X3-OI
 for qemu-devel@nongnu.org; Sun, 07 May 2023 11:31:41 -0400
Received: from mailout06.t-online.de ([194.25.134.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pvgMN-000645-U4
 for qemu-devel@nongnu.org; Sun, 07 May 2023 11:31:41 -0400
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout06.t-online.de (Postfix) with SMTP id 204D6186D3;
 Sun,  7 May 2023 17:31:36 +0200 (CEST)
Received: from [192.168.211.200] ([79.208.27.89]) by fwd82.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pvgMI-1v3crx0; Sun, 7 May 2023 17:31:34 +0200
Message-ID: <662af0fd-8e70-52af-7dc9-7eb7ca076514@t-online.de>
Date: Sun, 7 May 2023 17:31:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 07/12] audio/pw: add more details on error
To: marcandre.lureau@redhat.com, Gerd Hoffmann <kraxel@redhat.com>
Cc: dbassey@redhat.com, qemu-devel@nongnu.org
References: <20230506163735.3481387-1-marcandre.lureau@redhat.com>
 <20230506163735.3481387-8-marcandre.lureau@redhat.com>
Content-Language: de-DE
In-Reply-To: <20230506163735.3481387-8-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1683473494-7A86BC36-76F74FF7/0/0 CLEAN NORMAL
X-TOI-MSGID: 6699359a-51d2-4873-b1ac-9baeefbb8ea0
Received-SPF: none client-ip=194.25.134.19; envelope-from=vr_qemu@t-online.de;
 helo=mailout06.t-online.de
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

> From: Marc-André Lureau<marcandre.lureau@redhat.com>
>
> PipeWire uses errno to report error details.
>
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   audio/pwaudio.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Volker Rümelin <vr_qemu@t-online.de>

> diff --git a/audio/pwaudio.c b/audio/pwaudio.c
> index 2b12b40934..d0bc4680a6 100644
> --- a/audio/pwaudio.c
> +++ b/audio/pwaudio.c
> @@ -750,6 +750,7 @@ static int wait_resync(pwaudio *pw)
>       }
>       return 0;
>   }
> +
>   static void
>   on_core_error(void *data, uint32_t id, int seq, int res, const char *message)
>   {
> @@ -793,19 +794,19 @@ qpw_audio_init(Audiodev *dev)
>       pw->dev = dev;
>       pw->thread_loop = pw_thread_loop_new("PipeWire thread loop", NULL);
>       if (pw->thread_loop == NULL) {
> -        error_report("Could not create PipeWire loop");
> +        error_report("Could not create PipeWire loop: %s", g_strerror(errno));
>           goto fail;
>       }
>   
>       pw->context =
>           pw_context_new(pw_thread_loop_get_loop(pw->thread_loop), NULL, 0);
>       if (pw->context == NULL) {
> -        error_report("Could not create PipeWire context");
> +        error_report("Could not create PipeWire context: %s", g_strerror(errno));
>           goto fail;
>       }
>   
>       if (pw_thread_loop_start(pw->thread_loop) < 0) {
> -        error_report("Could not start PipeWire loop");
> +        error_report("Could not start PipeWire loop: %s", g_strerror(errno));
>           goto fail;
>       }
>   


