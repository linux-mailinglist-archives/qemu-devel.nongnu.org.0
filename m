Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3D44CAE0F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 20:02:32 +0100 (CET)
Received: from localhost ([::1]:48310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPUF4-00067l-In
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 14:02:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPUAo-0001ku-CI
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:58:06 -0500
Received: from [2607:f8b0:4864:20::b29] (port=46903
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPUAl-0001bk-Sg
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:58:05 -0500
Received: by mail-yb1-xb29.google.com with SMTP id b35so5270523ybi.13
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 10:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u5SSfwvjCU54jw9z1Q2Xjbg4yid9LhVUTJqkcLM8oOE=;
 b=acSvw62H7coCEkGkJzQzP6+qIYgEXgfJqy69ooLXhtkZ+TMPRl27EVFXkI1p9s66zW
 iMAlIFkHWlEcKyLigovhceymawoA+XvfmZ838JqtYCg/WA5vcDER0Wd7GCeAAw0Q/Kfx
 pa9A4PJv3EJuCbo5RHayJwkXpRfsTNbnwCXdpaAXyH6Q7QH9qT4P+fLMq7Em+8eqeZxN
 zzsVdrAqYdPbTtC3pTXxsbpT/khOarX7+qjzlPOPL3f+/dUdv/ys+gIUOllEDWdZc35m
 1f9YRxkq3LPc5KabhH0W4LbnON22xG0LaP3EBwDrv4rtMe6YlhYVDSYiYZktEKkHsTGP
 rkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u5SSfwvjCU54jw9z1Q2Xjbg4yid9LhVUTJqkcLM8oOE=;
 b=tnehODdMzQrm03la4Yb7R4JNXUy7+x7XyoHEJK9tklHv3YxQm+qgUEVFyyGmdoM7b/
 YvbIKilBJrPd4YOgCuxv4I3I+vJ2j0B0MgWEBsvkoIkRDjbny5mlNNq93rhOAotHhUzE
 AbCStBbQ02R1F4asNrGkf0RvFBbkG/2xUOaHbIdumiTZhiIiYvJN09IDVUAkoZolABhb
 l9TVfEyUOpE//Tgl/cnz20sMh193YDsxt6p7SOAE+ew5u9anrStDNDm7PRiOMY1vP+tp
 uDWuh4VFDzMankF7VObC/6/ZsLbqpBBnjEOgjj0I0vt7nr851el3mlabtjlNiYbzosyS
 /14Q==
X-Gm-Message-State: AOAM533ShdyTSnedy5AIibRYSBySYsxd8hpWTAqE33oxfsfdlqzPRRij
 BGwLTj6gyqw/Vdu6plLjwMwMHURIqg9wWoAgXQtbu1MDbAg=
X-Google-Smtp-Source: ABdhPJwcpFSRyyvow0H08wV1987+cDU65JwS/mbFOA+AOrMvVL4PxjSe59HK4Phfln4reDxz+iqgfWNVJU1tnh9C5vY=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr29141186ybs.140.1646247482875; Wed, 02
 Mar 2022 10:58:02 -0800 (PST)
MIME-Version: 1.0
References: <E1nPTwO-0006pl-Np@lizzy.crudebyte.com>
In-Reply-To: <E1nPTwO-0006pl-Np@lizzy.crudebyte.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Mar 2022 18:57:51 +0000
Message-ID: <CAFEAcA8g8TZxA=nUkJr2iDd8S50rc9btPoX15zOqzZ4hMjRnGw@mail.gmail.com>
Subject: Re: [PATCH] 9pfs: drop Doxygen format from qemu_dirent_dup() API
 comment
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Mar 2022 at 18:43, Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> API doc comments in QEMU are supposed to be in kerneldoc format, so drop
> occurrences of "@c" which is Doxygen format for fixed-width text.
>
> Link: https://lore.kernel.org/qemu-devel/CAFEAcA89+ENOM6x19OEF53Kd2DWkhN5SN21Va0D7yepJSa3Jyg@mail.gmail.com/
> Based-on: <E1nP9Oz-00043L-KJ@lizzy.crudebyte.com>
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  hw/9pfs/9p-util.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> index 8b92614e6c..22835c5f61 100644
> --- a/hw/9pfs/9p-util.h
> +++ b/hw/9pfs/9p-util.h
> @@ -116,8 +116,8 @@ static inline off_t qemu_dirent_off(struct dirent *dent)
>   * Duplicate directory entry @dent.
>   *
>   * It is highly recommended to use this function instead of open coding
> - * duplication of @c dirent objects, because the actual @c struct @c dirent
> - * size may be bigger or shorter than @c sizeof(struct dirent) and correct
> + * duplication of dirent objects, because the actual struct dirent
> + * size may be bigger or shorter than sizeof(struct dirent) and correct
>   * handling is platform specific (see gitlab issue #841).
>   *
>   * @dent - original directory entry to be duplicated
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

