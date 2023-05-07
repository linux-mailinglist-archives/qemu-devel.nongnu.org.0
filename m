Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AD36F9914
	for <lists+qemu-devel@lfdr.de>; Sun,  7 May 2023 16:59:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvfqV-0002kE-9t; Sun, 07 May 2023 10:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pvfqS-0002ju-0K
 for qemu-devel@nongnu.org; Sun, 07 May 2023 10:58:40 -0400
Received: from mailout09.t-online.de ([194.25.134.84])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pvfqP-0006Fw-Tr
 for qemu-devel@nongnu.org; Sun, 07 May 2023 10:58:39 -0400
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout09.t-online.de (Postfix) with SMTP id 3621C4F4DC;
 Sun,  7 May 2023 16:58:34 +0200 (CEST)
Received: from [192.168.211.200] ([79.208.27.89]) by fwd77.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pvfqK-2Mjn6H0; Sun, 7 May 2023 16:58:32 +0200
Message-ID: <82513cf7-e7e2-caec-fd1b-b742eaa7f118@t-online.de>
Date: Sun, 7 May 2023 16:58:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 04/12] audio/pw: drop needless case statement
Content-Language: de-DE
To: marcandre.lureau@redhat.com, Gerd Hoffmann <kraxel@redhat.com>
Cc: dbassey@redhat.com, qemu-devel@nongnu.org
References: <20230506163735.3481387-1-marcandre.lureau@redhat.com>
 <20230506163735.3481387-5-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <20230506163735.3481387-5-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1683471512-93FFCC17-4F9485E4/0/0 CLEAN NORMAL
X-TOI-MSGID: 8c910ad5-b590-4940-b63e-a9ef39481c30
Received-SPF: none client-ip=194.25.134.84; envelope-from=vr_qemu@t-online.de;
 helo=mailout09.t-online.de
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   audio/pwaudio.c | 10 ----------
>   1 file changed, 10 deletions(-)

Reviewed-by: Volker Rümelin <vr_qemu@t-online.de>

> diff --git a/audio/pwaudio.c b/audio/pwaudio.c
> index 9eb69bfd18..51cfc0b052 100644
> --- a/audio/pwaudio.c
> +++ b/audio/pwaudio.c
> @@ -197,16 +197,6 @@ on_stream_state_changed(void *data, enum pw_stream_state old,
>   
>       trace_pw_state_changed(pw_stream_get_node_id(v->stream),
>                              pw_stream_state_as_string(state));
> -
> -    switch (state) {
> -    case PW_STREAM_STATE_ERROR:
> -    case PW_STREAM_STATE_UNCONNECTED:
> -        break;
> -    case PW_STREAM_STATE_PAUSED:
> -    case PW_STREAM_STATE_CONNECTING:
> -    case PW_STREAM_STATE_STREAMING:
> -        break;
> -    }
>   }
>   
>   static const struct pw_stream_events capture_stream_events = {


