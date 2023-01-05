Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FE765F7ED
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 00:58:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDa6v-0004gK-5H; Thu, 05 Jan 2023 18:57:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pDa6r-0004fv-Te
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 18:57:21 -0500
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pDa6q-0008DX-4F
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 18:57:21 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-4c131bede4bso1921697b3.5
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 15:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=i3rsBNINjwroO/L0UDmSIE8RUYU7i+ZW3PRf2LKQZFI=;
 b=oRXYvRGWG06RpMH6cCiP0hS+DB0bKApNpNZb+Bkz6ld9hKKpMI9eVud7ymYftVnWSp
 C21TCJh+6h7t4EKPZ86NG0CwUXEs94HUj01+7oEpekGw+Ni90vEmofxDTNGbYDHSYWxw
 K41pQHzLChv3CBv5LYPv/iyLCoLSt93to+XDeUCW7McOZ9UVoKVBVf2Wz4GmWf/fP4dH
 Ci7E9INnehoTMicalRF68rsXXujWdaIodFAoF+sulFJdeL2NP29AvAf8cWIUlRXayDow
 KT34gk0lTmQWkiwORyEFWQglu9I7KD6qLNDK+6y9QaX8M8Jt28MBLo1zeLfPDcQmoZo6
 3Uqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i3rsBNINjwroO/L0UDmSIE8RUYU7i+ZW3PRf2LKQZFI=;
 b=aKvo2gY6Iauf4JPsVVMgYXWpvRCs6+zKRA9U3bNiFAZ+MJWV76QETHU1+lq/L8+4DC
 G4rVKYVROAPkCxS8NoL1xCS6AdkznLTiu9a7dHFe/Wi1nFMck6h19cgb1czCJtQUA/3E
 OuVDnP+Ea3khfaQBHDi2JRXIi5I9KjxPrBsbOeT/tEGQaTdMQ2X4eRMDV06Ip/Ld1aj+
 7UHJ47vZ3MVHlKLf333Zm47HubT4sYqD6K6so1TPqB5EAh4Sa5qIG9Ckp8VpewS6J5nJ
 2TRdlGZ9Zu4a4VrlRd0tdq+0yTvevleG3Y0wM8PrcjLgIdi97Y11F1oDudUu0J4olchG
 3whQ==
X-Gm-Message-State: AFqh2koCVUt3lXqW+cRiQmcMoPKqi6lqpcI6MSGvxq2hlapidmdo0CQe
 hUfCah8A7n2bvRwzW0erynUFFQ3W7nTqN+CL+qQ=
X-Google-Smtp-Source: AMrXdXuVmdlfdFmSbqEZ584ckmmKUqZsKhc9MGHLnIIAK02htDERP/y6fS36W1hWENRCSyFHCzgLFUIxV8X8wyZK/20=
X-Received: by 2002:a81:610a:0:b0:47b:bada:70a0 with SMTP id
 v10-20020a81610a000000b0047bbada70a0mr5221202ywb.504.1672963038636; Thu, 05
 Jan 2023 15:57:18 -0800 (PST)
MIME-Version: 1.0
References: <20221130015358.6998-1-zhangdongdong@eswincomputing.com>
 <20221130015358.6998-2-zhangdongdong@eswincomputing.com>
In-Reply-To: <20221130015358.6998-2-zhangdongdong@eswincomputing.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 5 Jan 2023 15:57:07 -0800
Message-ID: <CAMo8BfKfDLuhVeeyYV3Fu6wXyGPfCL+RfzUMJ9awuu3pXsu8Tw@mail.gmail.com>
Subject: Re: [PATCH 1/1] Fix some typos
To: Dongdong Zhang <zhangdongdong@eswincomputing.com>
Cc: qemu-devel@nongnu.org, jsnow@redhat.com, crosa@redhat.com, 
 bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Tue, Nov 29, 2022 at 6:08 PM Dongdong Zhang
<zhangdongdong@eswincomputing.com> wrote:
> diff --git a/python/qemu/machine/qtest.py b/python/qemu/machine/qtest.py
> index 1a1fc6c9b0..906bd13298 100644
> --- a/python/qemu/machine/qtest.py
> +++ b/python/qemu/machine/qtest.py
> @@ -42,7 +42,7 @@ class QEMUQtestProtocol:
>      :raise socket.error: on socket connection errors
>
>      .. note::
> -       No conection is estabalished by __init__(), this is done
> +       No connection is estabalished by __init__(), this is done

There are two typos in this line, the other one is 'estabalished'.

-- 
Thanks.
-- Max

