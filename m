Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD26A611343
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:44:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPbz-00009F-W5; Fri, 28 Oct 2022 09:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ooPan-0008Mi-KO
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:40:13 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ooPal-0007sL-RU
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:40:13 -0400
Received: by mail-qk1-x72a.google.com with SMTP id z30so3377982qkz.13
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 06:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=t2H9oqHZQ+P4RCwqgK/9A1RSj7T0euBczKmcwW6jgrE=;
 b=C0kzKvTpKCIsn/s3qYKVZ6oIwR/7m8N4JcCOFAC7d8+VmuqCkuwcXwKSjr1BHjFIVX
 ivdkyoRp2PxW0aP2Of6RBGQqWmf+wTfv8/9itv8+Wp+T9CJqDmOXhAt3ZK3lxzzvpf2o
 306KPasEaxXKCNLnm315eHehA+HzddpRSnNXlN2jrwTD4wxqHNk7uYhIESjk1P/0v8LD
 9S8q7m+HxuCAHZtNy/W2pejJhPeULuXPc8ROjR7j1tMXk5J7sXokK6k4WIFBOXRmNkhf
 YHDbfaarJBQmqF8LcM4LUVDHFnvFVFm+hzZx+c24JsSxueM7hLXhEVAC64xgaICo8QPD
 DVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t2H9oqHZQ+P4RCwqgK/9A1RSj7T0euBczKmcwW6jgrE=;
 b=pYjDdmS4RtiFu886Pca3lsvXTlREXWpYe/opLOImuKeFw3ainaL/BbAO8Eki5nJ6sd
 NwN8TKPsJ47ogqatzRfyW5Zun9Xkb3FWAVgus2cY+udfpOSuyBhNW5tVvb5i3dhiJZPJ
 SnFYSmM/ZAtc9QM8JRJMxe1OZaDeq/YUEWHHBZrHioDrpGezn0d1Ou3apNktGDhEJ24p
 lwTsYFsCNKWi3hlXpdB97Xr4D0tiNR5Ob679Pl5iP2x2K/xdFd8YnLKuMJtDckvGgZtH
 fav4IOnTfkbAB2z4PturGWv2fJwmY2OoMjmFCYqqXWR+hlctR915IMbbQcG/uhv5/okp
 PevQ==
X-Gm-Message-State: ACrzQf3ygE7Tcctdo/SH2X+r9jgt4nybazFxEERH0HRxIQqit5JgHIUb
 nQ7LpHihKdidaogMepigioqjJffxcLSe1k1Kyxs=
X-Google-Smtp-Source: AMsMyM60MaeQa83wCETJHfxyqJSXA0aPB+Mid4eJJhKvtVTbi0k19ALnwX32QFzLjwaMZ7FOnl+gFIM4hy66NtUK6no=
X-Received: by 2002:a05:620a:480c:b0:6f9:feef:64ef with SMTP id
 eb12-20020a05620a480c00b006f9feef64efmr5002800qkb.342.1666964410906; Fri, 28
 Oct 2022 06:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <E1ooNWu-0002oC-76@lizzy.crudebyte.com>
In-Reply-To: <E1ooNWu-0002oC-76@lizzy.crudebyte.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 28 Oct 2022 21:39:59 +0800
Message-ID: <CAEUhbmXK_oJa5+14G=i_yxfmqcpnSW4TL-B5Fj0SOx0NL9L6qA@mail.gmail.com>
Subject: Re: [PATCH] 9pfs: fix missing sys/mount.h include
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Thomas Huth <thuth@redhat.com>, 
 Stefan Hajnoczi <stefanha@gmail.com>, Warner Losh <imp@bsdimp.com>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 28, 2022 at 7:30 PM Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
>
> Fixes the following build error:
>
>   fsdev/file-op-9p.h:156:56: error: declaration of 'struct statfs' will
>   not be visible outside of this function [-Werror,-Wvisibility]
>     int (*statfs)(FsContext *s, V9fsPath *path, struct statfs *stbuf);
>                                                        ^
>
> As Windows neither has statfs, nor sys/mount.h, don't include it there.
>
> Fixes: 684f91203439 ("tests/9p: split virtio-9p-test.c ...")
> Link: https://lore.kernel.org/all/2690108.PsDodiG1Zx@silver/
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  fsdev/file-op-9p.h | 2 ++
>  1 file changed, 2 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

