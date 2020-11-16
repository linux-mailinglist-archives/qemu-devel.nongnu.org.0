Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CAC2B44BF
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 14:34:05 +0100 (CET)
Received: from localhost ([::1]:44562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keedw-0001EX-NE
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 08:34:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keec3-00082w-F5
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:32:07 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:37423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keec0-0001jv-LW
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:32:07 -0500
Received: by mail-ed1-x542.google.com with SMTP id cq7so18701281edb.4
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 05:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wVNK869LYYO4+TwdW/v2+bqKYpO5DtOQj8cjmnI82NQ=;
 b=BjDaJENqg2vQ25Lzbo6dYbh+dIDQMBYfeHyUl9mETBsFHE+GQhFWS1HcPcVL+cAUnV
 HR7e4xLEX3RBaUk8MlskSyc1MCNKuda4hHZUqGBU8UUgie4GmShP7FLEgGiGp7FC57Vv
 oeEboFAarkF51y0aRLsncr5BlJBcYwR6F1IGU9AkRNzoaH8o3WKkKsIqwY+01JfiVJ0/
 PsE6iaD9ke2qqzz3q8gFCpGfDUE19JQDsJc+1Z+Sx8uUCiV5SVjR1404c40p5DuTbIf0
 5w1gpSmQoSS501pMweRRLoHx3v6PE7s5Z3Dcyb1P71NQ6VFhvS4X9nncOdAnsHdnlOK1
 wQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wVNK869LYYO4+TwdW/v2+bqKYpO5DtOQj8cjmnI82NQ=;
 b=HD1k7A57/ZxMI6hZnIzipmovifU/NWY5D+JnKjHatrtvMsPhGZdJG/4D1CKiu011/i
 7ofQbD01gwJlAdmuyzpDl9ERX1/q9V7q1LjUdGDnvFVVF5fPCSBOrUfzgtf5cTDSQ9dw
 QunUEogBVmg0A0xW8kfaiMNfYip87OkGBx+e9pdznP0bJjwZ10VkxDc8SQfcvT0ly4I/
 vTo1F/OvqBrTiPlTDtoJ+NSr4ly9yBIW3pZqOkEJjI662BUcfUzHKhpBXYwnJsaWV8eu
 Mn4JXZkUe02C1pn70CwT/XMU/4Qx8QGLJyL5/MiV6ToFDfNJ6Xq4BLoYLmr2ovV9kBW6
 QKUA==
X-Gm-Message-State: AOAM532lwZbgZsChzDh7RcmlDjCq+SflqqhnH/N/hXi9Vk+yKiHY1HuE
 PmqjVbNcD9g2MTYyxPU92/I66BGx7zoGbOcuK9jXuw==
X-Google-Smtp-Source: ABdhPJwR+21LooH6cNCMhYKVOC+T/Yok1BYZQl6WMg4fY1VejSaQRKZmvZ7KTjaKhr0Ra2t9UpcLel3iZvCNpiSnN0M=
X-Received: by 2002:aa7:d3cc:: with SMTP id o12mr15844440edr.36.1605533522347; 
 Mon, 16 Nov 2020 05:32:02 -0800 (PST)
MIME-Version: 1.0
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-14-ganqixin@huawei.com>
 <c2ca2185-4253-da71-eab4-f96b29067c96@amsat.org>
In-Reply-To: <c2ca2185-4253-da71-eab4-f96b29067c96@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Nov 2020 13:31:51 +0000
Message-ID: <CAFEAcA9nF=RFnjFoC6b3iCN2Cu_QFsWHzouiK4EZ8TFb6cZaeg@mail.gmail.com>
Subject: Re: [PATCH 13/13] bcm2835_cprman: put some peripherals of bcm2835
 cprman into the 'misc' category
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gan Qixin <ganqixin@huawei.com>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Nov 2020 at 13:28, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> Well, this is not an usable device but a part of a bigger device,
> so here we want the opposite: not list this device in any category.
>
> Maybe we could add a DEVICE_CATEGORY_COMPOSITE for all such QOM
> types so management apps can filter them out? (And so we are sure
> all QOM is classified).
>
> Thomas, you already dealt with categorizing devices in the past,
> what do you think about this? Who else could help? Maybe add
> someone from libvirt in the thread?

If we could get to the point where we can assert() that
dc->categories is non-zero in class init, we would be able
to avoid further "forgot to categorize device" bugs getting
into the tree in future, which seems like an argument for
having some way of marking "really just an implementation
detail" devices I guess?

thanks
-- PMM

