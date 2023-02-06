Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 883DF68BA33
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 11:31:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOylj-0007Eo-Ne; Mon, 06 Feb 2023 05:30:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pOylf-000769-Ob
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 05:30:36 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pOyle-0002vL-8L
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 05:30:35 -0500
Received: by mail-lf1-x130.google.com with SMTP id f34so16918834lfv.10
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 02:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bLERtPt6D0Jqj6BR7px4gZn3LTlgUSsijfxCMNYTU0I=;
 b=O4+UwhyTaY60u8OTeS3z+GnlHmBvEnOiSajG8JL/b+aQcvMO+BTc55X+k17jnapuCq
 KFJNIAbjI/FFeH6K/3J9+Q3QmRefFa2ORdTgSwg81aJwIfgE4ogSc63/UpKVKFnD1Pcb
 wOQrEjOnm1HGigb0buCeBlIACXdyS7he3b+Qv3nx0OkHmG6izAHt3Nv9INn/yMan1a8f
 yy9/mO1jqKymD91E7HMSqkSCZoeXe03EADDQVommCSp5I2LP3dyKxFGqDjsZ9HW1eXrS
 VKJJmG4BVyic2czBSAg4lgxNWqRb1dQZ/gL/VgZo/tDFeuS4XBYGTMQGcVR0NAoXfGOq
 bq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bLERtPt6D0Jqj6BR7px4gZn3LTlgUSsijfxCMNYTU0I=;
 b=Z3mki9NW6hJivu6MQSTGdL+Ntt3gc7A2OCQCNAqK3F8q0MH8sqmlSHjSwywsk5TSWG
 uXjpHzj64rwM817fNBWwY+2nXwk0jjFxt5hdrdCAnzisTALHmCHHDyZoBVnkKYeZh2zf
 OVFnMhCCanlIlqulxZYLkwOjx5wG71vx7aAtxEHZJNojrk7jax/neZfAUovy4b9waxHt
 PrmX9mJr/gYePpRsL3L7Y+vCnhsQMQsx5/fh8/vGHJILYFUKnHLsZiQxRF2iaP7gZmC3
 NlMg3Q3tt3RAf3/z8Bb50P+uuUlc3WxQzdoIA0B6ssUpXO9CEpwFLfI/nBnZ5Pp8Gu3i
 g5ZA==
X-Gm-Message-State: AO0yUKVIUxTh204Bzes2gTo9YiFNedhrWPWgJlnZd2lz2tbPbgykABu6
 ce8Il2YDbc0WgWvhpHvZcyqfEL99tIkUPXHG5hc=
X-Google-Smtp-Source: AK7set/2UJ5qIve2Yk7n2ipmT4P1emOmjw/Z3mY2c9CTyFFOygNQrarpqK9hhT8PqOsVya4Q0AJiM8U7hY1ksO0be2M=
X-Received: by 2002:a05:6512:3990:b0:4d5:82bb:7d39 with SMTP id
 j16-20020a056512399000b004d582bb7d39mr2409964lfu.129.1675679432052; Mon, 06
 Feb 2023 02:30:32 -0800 (PST)
MIME-Version: 1.0
References: <20230206102037.3621709-1-armbru@redhat.com>
In-Reply-To: <20230206102037.3621709-1-armbru@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 6 Feb 2023 14:30:20 +0400
Message-ID: <CAJ+F1C+sq1tpNAxyuX4N4pu+T8fnUci-0ComM80ozKv+zg9Y+A@mail.gmail.com>
Subject: Re: [PATCH] meson: Avoid duplicates in generated config-poison.h again
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, Feb 6, 2023 at 2:21 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Commit eed56e9a89f "configure, meson: move config-poison.h to meson"
> lost a "| sort -u".  Restore it.  config-poison shrinks from ~4500 to
> ~700 lines when all targets are enabled.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  scripts/make-config-poison.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/make-config-poison.sh b/scripts/make-config-poison.s=
h
> index d222a04304..1892854261 100755
> --- a/scripts/make-config-poison.sh
> +++ b/scripts/make-config-poison.sh
> @@ -13,4 +13,4 @@ exec sed -n \
>    -e    's///' \
>    -e    's/ .*//' \
>    -e    's/^/#pragma GCC poison /p' \
> -  -e '}' "$@"
> +  -e '}' "$@" | sort -u
> --
> 2.39.0
>
>


--=20
Marc-Andr=C3=A9 Lureau

