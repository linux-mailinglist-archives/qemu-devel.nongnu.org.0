Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E5A4E6A31
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 22:23:36 +0100 (CET)
Received: from localhost ([::1]:41166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXUve-0004QU-T7
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 17:23:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXUud-0003lX-Ve
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 17:22:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXUua-0004wV-4x
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 17:22:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648156946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4lAMy8w6VA3HG9tcZoh8pLrOpOy5jr7qQzO6RFr9CmM=;
 b=BK9L0/jJJREsATC+6XrHsL+2O3R5t7fXX+W7L/+ZScH4T/uiJgC29tH/fK8qKmd4jYtFnZ
 RsxA/wVg5m6W/lUbQKu01KxwsGOsB4PHoAXgPEVc7RrGzAy6NB2px7f8SgRieOcLo49Nm/
 2hD1nWeYR/tzWslAt926f+xUthUl7Lg=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-d53_k5QJNAOD1he4l6ymgw-1; Thu, 24 Mar 2022 17:22:25 -0400
X-MC-Unique: d53_k5QJNAOD1he4l6ymgw-1
Received: by mail-vk1-f197.google.com with SMTP id
 e14-20020ac5c14e000000b0033ef6f852dcso1148551vkk.19
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 14:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4lAMy8w6VA3HG9tcZoh8pLrOpOy5jr7qQzO6RFr9CmM=;
 b=ZuTi6YJz+i1TaoNi5yoD7QFrVO9zYzzUnqYUcL7RaLVAV+GDvzW7ywZoP1N98RQeE1
 ABCZuisM48wz7Oq5IIRmFr8NhVdn2tFTNNk+t8U0crZh1ky1uLqT7Pzg082A95bgFQvp
 4rTWk9wGDg8cwVabYnAiuBdAKu78Puc9H9KPNwn9CQd3myOZ8eOcC6p996WjExt4xWAB
 goPw/1FnA+odH9fbwsn6fGLPOK2s5HQi5uF9VymqnhyuIGtBDWaP0bOYmL2Az74zzcjC
 X1klZWrMKGJPNKp3gVU+z4inFc7FKSpvELvbYoePq35Bj5/Wg0kbGZdNZLKynprszrqr
 jgfA==
X-Gm-Message-State: AOAM533lGcOraWHVjDnu0Fev8aJ099x7PL+oFEG+3uXjVwTGU07cCV/R
 EoCUnhBRKDQJzFh9py3JrC/ahWn/paZypEQmQazGI7HDoHugSXAEE+BXKSDO/1ictbfTGSw8gC5
 uVTpmWD/ljwIZmmD9txj9qjp3PDUs8yM=
X-Received: by 2002:a1f:3244:0:b0:332:2037:83b1 with SMTP id
 y65-20020a1f3244000000b00332203783b1mr3801227vky.24.1648156944645; 
 Thu, 24 Mar 2022 14:22:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhWGRvzzCj2hJtqr1fNqywdgLY2z/iR9qN5/Sda6uflENuuwqKeWj2TOwUSkXJ7Mg/qP7LLEMRG2ofGVRs6lU=
X-Received: by 2002:a1f:3244:0:b0:332:2037:83b1 with SMTP id
 y65-20020a1f3244000000b00332203783b1mr3801220vky.24.1648156944389; Thu, 24
 Mar 2022 14:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-13-victortoso@redhat.com>
In-Reply-To: <20220324175015.232794-13-victortoso@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 24 Mar 2022 17:22:13 -0400
Message-ID: <CAFn=p-ZmsmnMC3fC9cdnZ=2t41ti5aoFzuxu0k_7NhcwBvzmLQ@mail.gmail.com>
Subject: Re: [PATCH 12/14] qapi: ui examples: add missing websocket member
To: Victor Toso <victortoso@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 24, 2022 at 1:50 PM Victor Toso <victortoso@redhat.com> wrote:
>
> As the websocket is not optional in VncBasicInfo.
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/ui.json | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 664da9e462..a810ed680c 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -710,10 +710,10 @@
>  #
>  # <- { "event": "VNC_CONNECTED",
>  #      "data": {
> -#            "server": { "auth": "sasl", "family": "ipv4",
> +#            "server": { "auth": "sasl", "family": "ipv4", "websocket": false,
>  #                        "service": "5901", "host": "0.0.0.0" },
>  #            "client": { "family": "ipv4", "service": "58425",
> -#                        "host": "127.0.0.1" } },
> +#                        "host": "127.0.0.1", "websocket": false } },
>  #      "timestamp": { "seconds": 1262976601, "microseconds": 975795 } }
>  #
>  ##
> @@ -738,9 +738,9 @@
>  #
>  # <-  { "event": "VNC_INITIALIZED",
>  #       "data": {
> -#            "server": { "auth": "sasl", "family": "ipv4",
> +#            "server": { "auth": "sasl", "family": "ipv4", "websocket": false,
>  #                        "service": "5901", "host": "0.0.0.0"},
> -#            "client": { "family": "ipv4", "service": "46089",
> +#            "client": { "family": "ipv4", "service": "46089", "websocket": false,
>  #                        "host": "127.0.0.1", "sasl_username": "luiz" } },
>  #       "timestamp": { "seconds": 1263475302, "microseconds": 150772 } }
>  #
> @@ -765,9 +765,9 @@
>  #
>  # <- { "event": "VNC_DISCONNECTED",
>  #      "data": {
> -#            "server": { "auth": "sasl", "family": "ipv4",
> +#            "server": { "auth": "sasl", "family": "ipv4", "websocket": false,
>  #                        "service": "5901", "host": "0.0.0.0" },
> -#            "client": { "family": "ipv4", "service": "58425",
> +#            "client": { "family": "ipv4", "service": "58425", "websocket": false,
>  #                        "host": "127.0.0.1", "sasl_username": "luiz" } },
>  #      "timestamp": { "seconds": 1262976601, "microseconds": 975795 } }
>  #
> --
> 2.35.1
>

Okie-dokey.

Reviewed-by: John Snow <jsnow@redhat.com>


