Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE40365C53D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 18:43:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClHx-00044D-NF; Tue, 03 Jan 2023 12:41:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pClHw-00042l-3g
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 12:41:24 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pClHu-0007YL-Cc
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 12:41:23 -0500
Received: by mail-pl1-x62f.google.com with SMTP id 17so33413780pll.0
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 09:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EeSiNLZ9AMf8Y3T9zWy+2/VWs5tl2a2H2uzQHAfk1l4=;
 b=t2PX6naKRa6O8WJuSc1k3RsgQ0QvIqp4pyx1iC3ps3SjGJUUx+dtSmqvmpW3XDJWiY
 F7IORNY0QCNXAFVB37obzHJi6eqmhaSD2OqrjNDYuNue2napN6bJQjgbj9dD0BQb+vne
 SpEg5q27M5+sdRYZaF44X8Dtnk0m+yjGgxVyOsfoNrvh++ZYeCKCiEDMz3aB7P4QEFk3
 kVmpKwv4lq2J45pDZ36hJHsA7RSIaUsMOVkmYkNbLvIHz2GZZ131dbf/J9UZhbxIDH96
 KuUZmUs4jixKsTUw4GqeJKz1jTAGBCp3XvZ4+A/HV6sMYOwLGGtkbrdj/AfcDlXFD7dI
 VykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EeSiNLZ9AMf8Y3T9zWy+2/VWs5tl2a2H2uzQHAfk1l4=;
 b=wxVrl65BdjPgTdUBcdUmIBppjfvVM9IbQ9fjYgOskbviYdMNiiswVC6oVBTkpXvlRv
 BLX93ZiE+jNtqc08EAaMBqwkA6hW8LpMw3uaCBmjQ07JV7iqEK/VQ0w58jc4cH8g2V8W
 c79pYiuFls2/fG4+ccs8pY/EVhw8FN1VXzgopNbnorq4qfC/odQyV7pqIH5z6cPmT1iG
 nOgxHs1HGbdbfgzkBGFZsP8ppfriOy+jZ7Zs0rGEDZ4wQRaudu52DsGGESgsc4O8j93T
 2IvNMyudZ+qIbh6/24CZ0MFhJAPWeb3nU3ixP3I4RHP9EevOfxK+BjD+JFZuqP46p7fi
 N+JA==
X-Gm-Message-State: AFqh2kq9d9nXTXiDg9ByHfsc5PUPbT0+w0zoFkjIAVfbVOO9Z/ciwb5z
 vJhR8vCfsB1N6J2P/wo76jdlewPO9vbfYyv2kWWkAw==
X-Google-Smtp-Source: AMrXdXs/XhyrUbKkxGVfcdGc0Tipq6R6Mcw1ykT1B/gmlmPtkWzV7/mwGA1BvYGErUhC1g8eWTNQ5SgIJq+0A6GLK6I=
X-Received: by 2002:a17:903:268c:b0:192:8d9e:d70a with SMTP id
 jf12-20020a170903268c00b001928d9ed70amr1877030plb.19.1672767680497; Tue, 03
 Jan 2023 09:41:20 -0800 (PST)
MIME-Version: 1.0
References: <20221223085047.94832-1-agraf@csgraf.de>
In-Reply-To: <20221223085047.94832-1-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Jan 2023 17:41:09 +0000
Message-ID: <CAFEAcA-1PUCFZPAF25uy1VqjgciKXiYmfW-89q6QqKhf1io7Lw@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/intc/arm_gicv3: Bump ITT entry size to 16
To: Alexander Graf <agraf@csgraf.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Shashi Mallela <shashi.mallela@linaro.org>, Eric Auger <eric.auger@redhat.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 23 Dec 2022 at 08:50, Alexander Graf <agraf@csgraf.de> wrote:
>
> While trying to make Windows work with GICv3 emulation, I stumbled over
> the fact that it only supports ITT entry sizes that are power of 2 sized.
>
> While the spec allows arbitrary sizes, in practice hardware will always
> expose power of 2 sizes and so this limitation is not really a problem
> in real world scenarios. However, we only expose a 12 byte ITT entry size
> which makes Windows blue screen on boot.
>
> The easy way to get around that problem is to bump the size to 16. That
> is a power of 2, basically is what hardware would expose given the amount
> of bits we need per entry and doesn't break any existing scenarios. To
> play it safe, this patch set only bumps them on newer machine types.

This is a Windows bug and should IMHO be fixed in that guest OS.
Changing the ITT entry size of QEMU's implementation introduces
an unnecessary incompatibility in migration and wastes memory
(we're already a bit unnecessarily profligate with ITT entries
compared to real hardware).

thanks
-- PMM

