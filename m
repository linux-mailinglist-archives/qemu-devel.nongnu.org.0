Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A28EF514838
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 13:31:07 +0200 (CEST)
Received: from localhost ([::1]:52708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkOq2-000804-8H
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 07:31:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nkOnx-000677-EC; Fri, 29 Apr 2022 07:29:00 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:35811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nkOns-0008EM-G8; Fri, 29 Apr 2022 07:28:53 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id w187so13948626ybe.2;
 Fri, 29 Apr 2022 04:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BfuPlLgO+D4K4jBLwsBNT2x0NlLN7I9do90WBJg7/Co=;
 b=ZfUJK6hmNq4sbfSyAsxQvOS0CPqBSQtdVzwXv9j6wEf0Lt0Ylgu5BxPTj6Nt4yPZ49
 g+L754jNx+GSv2I+kjvSelgmg/qqLAINbfP0VfsVR9bSqTPupbMeqxaDrZ8BEH3I8wcC
 v8AfGVIwg7MH/gRfHlyBa2yQSGaaZjUID5y5/2R6CiWjQ9L5VvS5iBlkqL7LslEyJUve
 Uo7cG9xtEwRjGsxadwi0k/tttulJbZNb1XOJZlUvMv/bSdnWuMdd5kWTLm8/fPJOkgTb
 R0oU3jC/qY5CpHJslGMarY6t6EJyct07jftqi1eadzLCemxpLIfXsFum70kptqbkoUec
 eCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BfuPlLgO+D4K4jBLwsBNT2x0NlLN7I9do90WBJg7/Co=;
 b=S8tJgoG5bL5aaBsOjwa2Gxu6VH8aQ5cZF4OcK9bH1m3dJ1hFrM2iie1o5td7nxcyuM
 mDlExWKc5dfo4VxoWKIc8IFOtlbqWcXc/L/QEtQgXOsWSVBn/deXUYlAwBA4+MwtA9o+
 4ecNeFORmWLdD4sN0sRAAcnHNVUoQvKytrSlSfC9QlSj/YbnDIEdFGpXzufRVQH4Zihp
 Mztx8jEZoeh+aFpvyJD07l/BUAwzAwFUnzbbvX+0Cr7r+zcqmGB+GGlFrKwT5EODCBpy
 HopWmK2GVf3CKsG8jD0p4WnzYvmpXGLFZZ2EbzF6AyUDvbOhN/pRsDtkg3tTNgoAJdP0
 7Z8g==
X-Gm-Message-State: AOAM5314j2UNWVexYOyVi0Di5wL4bbl9F/q3ICJncudm7XLE/xmoKYRs
 rFvnMQnf5l19J9SUuli0RPwqP6OBbJBPppaCgZo=
X-Google-Smtp-Source: ABdhPJwnK4h5wyFpoFaQACsk3cx8iOgwtmVzO0RjwJ/246RqiONgzBrs9wU+wl1cbcedTG/9Wiiq+dfeUW9t8KsIXRw=
X-Received: by 2002:a25:4944:0:b0:648:a796:a2 with SMTP id
 w65-20020a254944000000b00648a79600a2mr17970508yba.123.1651231730667; 
 Fri, 29 Apr 2022 04:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1651228000.git.qemu_oss@crudebyte.com>
 <b322ab298a62069e527d2b032028bdc9115afacd.1651228001.git.qemu_oss@crudebyte.com>
In-Reply-To: <b322ab298a62069e527d2b032028bdc9115afacd.1651228001.git.qemu_oss@crudebyte.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 29 Apr 2022 19:28:39 +0800
Message-ID: <CAEUhbmUVb_MLEGbKaJKjL023KUDUy=wvf9KCNn+NeAMW0SeELg@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] 9pfs: fix wrong errno being sent to Linux client
 on macOS host
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-stable@nongnu.org,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Greg Kurz <groug@kaod.org>, Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Guohuai Shi <guohuai.shi@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 29, 2022 at 7:16 PM Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> Linux and macOS only share some errno definitions with equal macro
> name and value. In fact most mappings for errno are completely
> different on the two systems.
>
> This patch converts some important errno values from macOS host to
> corresponding Linux errno values before eventually sending such error
> codes along with 'Rlerror' replies (if 9p2000.L is used that is). Not
> having translated errnos before violated the 9p2000.L protocol spec,
> which says:
>
>   "
>   size[4] Rlerror tag[2] ecode[4]
>
>   ... ecode is a numerical Linux errno.
>   "
>
>   https://github.com/chaos/diod/wiki/protocol#lerror----return-error-code
>
> This patch fixes a bunch of misbehaviours when running a Linux client
> on macOS host. For instance this patch fixes:
>
>   mount -t 9p -o posixacl ...
>
> on Linux guest if security_mode=mapped was used for 9p server, which
> refused to mount successfully, because macOS returned ENOATTR==93
> when client tried to retrieve POSIX ACL xattrs, because errno 93
> is defined as EPROTONOSUPPORT==93 on Linux, so Linux client believed
> that xattrs were not supported by filesystem on host in general.

This issue looks exact the same issue we were trying to fix when
supporting 9p on Windows host,

What we did is like this:
http://patchwork.ozlabs.org/project/qemu-devel/patch/20220425142705.2099270-10-bmeng.cn@gmail.com/

But we had some questions in mind (see the commit message of our
patch, and below)

>
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Link: https://lore.kernel.org/qemu-devel/20220421124835.3e664669@bahia/
> Reviewed-by: Greg Kurz <groug@kaod.org>
> ---
>  hw/9pfs/9p-util.h | 30 ++++++++++++++++++++++++++++++
>  hw/9pfs/9p.c      |  2 ++
>  2 files changed, 32 insertions(+)
>
> diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> index 2cc9a5dbfb..c3526144c9 100644
> --- a/hw/9pfs/9p-util.h
> +++ b/hw/9pfs/9p-util.h
> @@ -58,6 +58,36 @@ static inline uint64_t host_dev_to_dotl_dev(dev_t dev)
>  #endif
>  }
>
> +/* Translates errno from host -> Linux if needed */
> +static inline int errno_to_dotl(int err) {
> +#if defined(CONFIG_LINUX)
> +    /* nothing to translate (Linux -> Linux) */
> +#elif defined(CONFIG_DARWIN)
> +    /*
> +     * translation mandatory for macOS hosts
> +     *
> +     * FIXME: Only most important errnos translated here yet, this should be
> +     * extended to as many errnos being translated as possible in future.
> +     */
> +    if (err == ENAMETOOLONG) {
> +        err = 36; /* ==ENAMETOOLONG on Linux */
> +    } else if (err == ENOTEMPTY) {
> +        err = 39; /* ==ENOTEMPTY on Linux */
> +    } else if (err == ELOOP) {
> +        err = 40; /* ==ELOOP on Linux */
> +    } else if (err == ENOATTR) {
> +        err = 61; /* ==ENODATA on Linux */
> +    } else if (err == ENOTSUP) {
> +        err = 95; /* ==EOPNOTSUPP on Linux */
> +    } else if (err == EOPNOTSUPP) {
> +        err = 95; /* ==EOPNOTSUPP on Linux */
> +    }

What happens if a macOS guest is running on QEMU from a macOS host?
Here all macOS errnos are translated to the Linux errnos. Will macOS
be happy?

> +#else
> +#error Missing errno translation to Linux for this host system
> +#endif
> +    return err;
> +}
> +
>  #ifdef CONFIG_DARWIN
>  #define qemu_fgetxattr(...) fgetxattr(__VA_ARGS__, 0, 0)
>  #define qemu_lgetxattr(...) getxattr(__VA_ARGS__, 0, XATTR_NOFOLLOW)
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 4a296a0b94..0cd0c14c2a 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -1054,6 +1054,8 @@ static void coroutine_fn pdu_complete(V9fsPDU *pdu, ssize_t len)
>              }
>              len += ret;
>              id = P9_RERROR;
> +        } else {
> +            err = errno_to_dotl(err);
>          }
>
>          ret = pdu_marshal(pdu, len, "d", err);
> --

Regards,
Bin

