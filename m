Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222A43C868C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:02:06 +0200 (CEST)
Received: from localhost ([::1]:44480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gOi-00074R-PD
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1m3gK0-0002QU-1V
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:57:12 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:40737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1m3gJy-0004nM-76
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:57:11 -0400
Received: by mail-yb1-xb29.google.com with SMTP id p22so3637491yba.7
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 07:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ijo4brgGYpv4RyUZzaZGVXtqqBdOrQfA7FF7LN/DFXk=;
 b=IM25IgiILD4wFMCF+txjZI2u9xdn6UiJ/STG5qXeuZPK7qAA63Az7vfxJ4wT8ZKZXe
 ihImC2xunqQvPLj0WJ/MhZad6ELUTG726wbi16/yP+xN4Hutz60SF6kHYfUsELLw9j/A
 UsIPk9pjNn5HHpUSefgAgpHFWAXocdY7Y8FEMUjg+awtPLpt2NanoEYfdAfxUgQA6PHB
 WKZf2NNgF/UIWvsYnOFoxkNoVsRjb2o8WHIL1qLQDqUcay28lofYvkIQHXG1OLCXLc0b
 Kasq4l7tCLBTCxuLDXxtdqTv1Kb6MTxLrc6gJmvB831xFxYgWqJ1jeJQrbbEEILyPk4W
 3iNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ijo4brgGYpv4RyUZzaZGVXtqqBdOrQfA7FF7LN/DFXk=;
 b=bbN8qZEDE1Oy2OEaDxKsKA0r2hvjB5RKenw87cb+0B/DSAfcUZ/nhEGwbj0GpwCnlk
 tTzb+njGr3s3fWlAjmFMbXjVk8hF+zsP1ndlGSVn7EO05p8yc5YGdlq583uNxHl3z262
 CnJLm3uMXvUZOouiCT5V6winGs3UwC9L6d3rvxgYmNNqbe4y9zzL3CE8ULA/lhFpzjJ5
 KeAcMe0fZ99bfKfw/+q0HCU83eFRjm3WJFxNsR7UhLXx9hZ/6ip3gwUULWpP+BexTkf9
 wH3Qur9HPWxZxS9cUfFFmaEEjSl55AT9OvNI8EFAeMrsGFsCD/cHXYqe1DstYFJ0W014
 1a7g==
X-Gm-Message-State: AOAM532idUjlcexwSJU8LyaVZBbKJxI4ZJFAaQYdyF2hhExG8Y+IH39e
 9CYRA0uZJ7kj4RWkpG6brk0PNl10sRlW8Okk5tM=
X-Google-Smtp-Source: ABdhPJzqNNtKy+n/bWVFd0tOB/vvvPNyXAh0/1UhqnMK0FqU5OvKgjlhxm4OndZ7U87XDEPcGclC9ajHkVfMtx8uOvw=
X-Received: by 2002:a25:be02:: with SMTP id h2mr14272602ybk.91.1626274629311; 
 Wed, 14 Jul 2021 07:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210709160843.339796-1-li.zhang@ionos.com>
 <20210709160843.339796-2-li.zhang@ionos.com>
In-Reply-To: <20210709160843.339796-2-li.zhang@ionos.com>
From: Li Zhang <zhlcindy@gmail.com>
Date: Wed, 14 Jul 2021 16:56:58 +0200
Message-ID: <CAD8of+oLBOGDfs+btkvvcyP16vUq3V0Lz8Cjd917DfuXMkK+kQ@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 2/2] chardev: refactor qmp_chardev_add and
 qmp_chardev_change
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 Pankaj Gupta <pankaj.gupta@ionos.com>, QEMU <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=zhlcindy@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Li Zhang <li.zhang@ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping

On Fri, Jul 9, 2021 at 6:11 PM Li Zhang <zhlcindy@gmail.com> wrote:
>
> To improve the problematic source code in qmp_chardev_change
> and some redundant source code, the functions qmp_chardev_add
> and qmp_chardev_change are refactored. It is mentioned in thread:
> https://lists.nongnu.org/archive/html/qemu-devel/2021-04/msg03167.html
>
> Signed-off-by: Li Zhang <li.zhang@ionos.com>
> ---
>  chardev/char.c | 72 ++++++++++++++++++++++++++------------------------
>  1 file changed, 37 insertions(+), 35 deletions(-)
>
> diff --git a/chardev/char.c b/chardev/char.c
> index d959eec522..cb6f287cd2 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -1028,23 +1028,10 @@ Chardev *qemu_chardev_new(const char *id, const char *typename,
>      return chr;
>  }
>
> -ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
> -                               Error **errp)
> +static ChardevReturn *chardev_add(const char *id, Chardev *chr,
> +                                  Error **errp)
>  {
> -    const ChardevClass *cc;
>      ChardevReturn *ret;
> -    Chardev *chr;
> -
> -    cc = char_get_class(ChardevBackendKind_str(backend->type), errp);
> -    if (!cc) {
> -        return NULL;
> -    }
> -
> -    chr = chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
> -                      backend, NULL, false, errp);
> -    if (!chr) {
> -        return NULL;
> -    }
>
>      if (!object_property_try_add_child(get_chardevs_root(), id, OBJECT(chr),
>                                         errp)) {
> @@ -1062,6 +1049,26 @@ ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
>      return ret;
>  }
>
> +ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
> +                               Error **errp)
> +{
> +    const ChardevClass *cc;
> +    Chardev *chr;
> +
> +    cc = char_get_class(ChardevBackendKind_str(backend->type), errp);
> +    if (!cc) {
> +        return NULL;
> +    }
> +
> +    chr = chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
> +                      backend, NULL, false, errp);
> +    if (!chr) {
> +        return NULL;
> +    }
> +
> +    return chardev_add(id, chr, errp);
> +}
> +
>  ChardevReturn *qmp_chardev_change(const char *id, ChardevBackend *backend,
>                                    Error **errp)
>  {
> @@ -1070,7 +1077,6 @@ ChardevReturn *qmp_chardev_change(const char *id, ChardevBackend *backend,
>      Chardev *chr, *chr_new;
>      bool closed_sent = false;
>      bool handover_yank_instance;
> -    ChardevReturn *ret;
>
>      chr = qemu_chr_find(id);
>      if (!chr) {
> @@ -1089,11 +1095,22 @@ ChardevReturn *qmp_chardev_change(const char *id, ChardevBackend *backend,
>          return NULL;
>      }
>
> +    cc = CHARDEV_GET_CLASS(chr);
> +    cc_new = char_get_class(ChardevBackendKind_str(backend->type), errp);
> +    if (!cc_new) {
> +        return NULL;
> +    }
> +
>      be = chr->be;
>      if (!be) {
>          /* easy case */
> -        object_unparent(OBJECT(chr));
> -        return qmp_chardev_add(id, backend, errp);
> +        chr_new = chardev_new(id, object_class_get_name(OBJECT_CLASS(cc_new)),
> +                              backend, NULL, false, errp);
> +        if (!chr_new) {
> +            return NULL;
> +        }
> +
> +        goto out;
>      }
>
>      if (!be->chr_be_change) {
> @@ -1101,12 +1118,6 @@ ChardevReturn *qmp_chardev_change(const char *id, ChardevBackend *backend,
>          return NULL;
>      }
>
> -    cc = CHARDEV_GET_CLASS(chr);
> -    cc_new = char_get_class(ChardevBackendKind_str(backend->type), errp);
> -    if (!cc_new) {
> -        return NULL;
> -    }
> -
>      /*
>       * The new chardev should not register a yank instance if the current
>       * chardev has registered one already.
> @@ -1147,18 +1158,9 @@ ChardevReturn *qmp_chardev_change(const char *id, ChardevBackend *backend,
>       */
>      chr->handover_yank_instance = handover_yank_instance;
>
> +out:
>      object_unparent(OBJECT(chr));
> -    object_property_add_child(get_chardevs_root(), chr_new->label,
> -                              OBJECT(chr_new));
> -    object_unref(OBJECT(chr_new));
> -
> -    ret = g_new0(ChardevReturn, 1);
> -    if (CHARDEV_IS_PTY(chr_new)) {
> -        ret->pty = g_strdup(chr_new->filename + 4);
> -        ret->has_pty = true;
> -    }
> -
> -    return ret;
> +    return chardev_add(id, chr_new, errp);
>  }
>
>  void qmp_chardev_remove(const char *id, Error **errp)
> --
> 2.25.1
>


-- 

Best Regards
-Li

