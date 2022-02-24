Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B464C35E2
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 20:26:51 +0100 (CET)
Received: from localhost ([::1]:34394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNJlK-00071f-SN
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 14:26:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNJc3-0005tn-68
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:17:15 -0500
Received: from [2607:f8b0:4864:20::1133] (port=43267
 helo=mail-yw1-x1133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNJc0-0001B5-VF
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:17:14 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2d6d0cb5da4so8948547b3.10
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 11:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xcNxdfVsnr5m7KQlt33LiPf1MUqbdbCgiJ82fTQ4GT0=;
 b=xwT8A6vhZLc2z142dntbFuRvDznlm7xwN6LrbrlFieW/Ndf0czYYkwB63Qc9bsqCOM
 mDNqhGFMlPX62vYIdCDXiEPNO1U4/5kGWJgxqwBijq07qtqtrD/PfTFzaOu1/0aiwwx/
 QWl35o0zaU5gw4E/9wuru6FWsgvBvmmLhFToaUAazr7ycTt2zk5UWoURgGODlMiHQ9P2
 gqE8yUtHZnESM2x821FnUNgsSWTufwGI5JSowliFBVeNvU9SIL1+oonD6GzMqTemfKsI
 JaaqOaGL7H8JrNjzHVNLejusI4bVEjcNiJHJ/HG9m0BPK6+RWfSdi/D6PnhqVvnHU4Zd
 kySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xcNxdfVsnr5m7KQlt33LiPf1MUqbdbCgiJ82fTQ4GT0=;
 b=wknZ9f8cqesFC4igPsldTGE6aLSlIkYpDv7OEw1ODNWygNAxHLDs4kuapi2OOo1FUZ
 T7q41cVjgSEESIEjxyBQjWU545jsHYoYJawc9KoZjHO3OofjK14DMpPt5WFlKUQVEauL
 81aq47j8Q6f8c2E+opJfqEYboBEoA8S170DNoELMp++PBbuD/Yx/gdJdv1J40Og7MOfU
 0+oXW2kXMtiKR0wa6vLv8zR9zAmLbwTV85XW4/ucqNTk8vFUSYcS1NsCW4I2o+//LadW
 n5/1pLhLHthn/cKCu7IlF0cf53+47GVBq2G/jqt3+6Nb4lSWyCagUt6EIkCz9AUDxC9u
 zeIg==
X-Gm-Message-State: AOAM533KXOJy0S5iMO096JKLJn0ibmlbmAjZ2wz5pCPGNrK6h1RgMahA
 jpTuDjGGzcBPcfnL7ynQtR7HceiDaiYU1aFpu02mNaJZOCU=
X-Google-Smtp-Source: ABdhPJzn3CMIkzD9ZojZr4EQjBU+Z9fY7O2spo4LasZJera6OT6ZcWKfW68iuqWCdltX7BLP46jDJky414H65flWOk4=
X-Received: by 2002:a81:8c9:0:b0:2d7:6801:3fcc with SMTP id
 192-20020a8108c9000000b002d768013fccmr4032867ywi.347.1645730231984; Thu, 24
 Feb 2022 11:17:11 -0800 (PST)
MIME-Version: 1.0
References: <20220224183701.608720-1-marcandre.lureau@redhat.com>
 <20220224183701.608720-12-marcandre.lureau@redhat.com>
In-Reply-To: <20220224183701.608720-12-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Feb 2022 19:17:00 +0000
Message-ID: <CAFEAcA88ZOeFKT88=CqQM+DRaWmCA9MY2BPstNSKmVJbZCKv+A@mail.gmail.com>
Subject: Re: [PATCH 11/12] util: remove the net/net.h dependency
To: marcandre.lureau@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1133
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Feb 2022 at 18:39, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Move qemu_ether_ntoa() which is only needed in net/.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

