Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 049842B18DA
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 11:15:44 +0100 (CET)
Received: from localhost ([::1]:46712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdW7L-0006Lh-2i
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 05:15:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdW4V-0005JX-Jo
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:12:47 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:39059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdW4T-0002Hn-Sf
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:12:47 -0500
Received: by mail-ed1-x543.google.com with SMTP id e18so10066507edy.6
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 02:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E7dPH8+MqDC8AZTpAs3Zo2mNH8pxaD+/sIjtCQl3Pms=;
 b=NwglDyLuljDnKqgii9OqAGMe35v+FAMjKQ0nQLd7Lxl/DvWo3Mjtjq8D3bqlAl7RbC
 rpaYzPA17tU8WvaxWaaPsq7sHCbO6rb95tcq/zrbUNMKXu1msTiTfhkn8Xr6BdOybYOy
 CnavXVk7ABmBxFvu2070JRLPWT2sA7oPEwpTwbbfUo9oZmnB9mGPVGrsyKv9xEgMjx44
 xUwwT66ZxAaI8rf9VFybFLhyB90ikPVz4ZpSMg0oyd5oewc9FC+HWQsNLJFX9dytHk0h
 M/ZLZY+6OtWlmbKA55kiZND7zw0XjjyA010HoygvK8mXCZB+1tekjQnuyja0OyySFgcO
 +PTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E7dPH8+MqDC8AZTpAs3Zo2mNH8pxaD+/sIjtCQl3Pms=;
 b=I7ChiQabG0uKivr1XaHtgGmS9Tb0f/FQntZ8cSnbUSnlwmBM1mJt+oOeMmljKndl9t
 kZg1imi5Ak4iXRiDg97ZWkSgDiFWrCiF8Gckqn+8nVJ73Gna6lpzp4fU7jHhnBNHjzK/
 qvBIYw9HitK+Gr7ABew1h6Mde7X+3JJTwebTlb+bpbGyCQ60LmxUrfs61d/goUN9c5nM
 C1budYfp5W136F5IkATYuQ+UOGgwR0X4gPyg47yX7VwE9DTt0hiChNxQHZJzwGckhRS1
 5iLqxlM+vpiv8aXe/cGilyIgyWrP9Zzt5E5L7otJ6OUpxAnULV5iQy0kYCzDm13WeOzT
 3/HA==
X-Gm-Message-State: AOAM533zwQ7hMsnXPsizeGIbpRFpTKGZHvNqUTJ8CFz157iIuifZJ/GT
 mIZFf92wTmI48WHc31PHo63wrCYHRR9vAb5e5jniRw==
X-Google-Smtp-Source: ABdhPJzPYaAnKelJ1c9wl3WiMHWkRAQhs9ML05sel2PS7jf5ACkeGYksbVU/p1rU27jBJIjJWI1bS+zUGzmHWFa4CmI=
X-Received: by 2002:a05:6402:b35:: with SMTP id
 bo21mr1837418edb.52.1605262362822; 
 Fri, 13 Nov 2020 02:12:42 -0800 (PST)
MIME-Version: 1.0
References: <20201112125824.763182-1-ganqixin@huawei.com>
 <20201112125824.763182-3-ganqixin@huawei.com>
In-Reply-To: <20201112125824.763182-3-ganqixin@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Nov 2020 10:12:31 +0000
Message-ID: <CAFEAcA-30x8FS8Kmz3AzvJAR0z7_7utAfPEhCTYmq-dvKW9wFA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] ads7846: put it into the 'input' category
To: Gan Qixin <ganqixin@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Thomas Huth <thuth@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 13 Nov 2020 at 03:32, Gan Qixin <ganqixin@huawei.com> wrote:
>
> The category of the ads7846 device is not set, put it into the 'input'
> category.
>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/display/ads7846.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/display/ads7846.c b/hw/display/ads7846.c
> index 023165b2a3..cb3a431cfd 100644
> --- a/hw/display/ads7846.c
> +++ b/hw/display/ads7846.c
> @@ -163,10 +163,12 @@ static void ads7846_realize(SSISlave *d, Error **errp)
>
>  static void ads7846_class_init(ObjectClass *klass, void *data)
>  {
> +    DeviceClass *dc = DEVICE_CLASS(klass);
>      SSISlaveClass *k = SSI_SLAVE_CLASS(klass);
>
>      k->realize = ads7846_realize;
>      k->transfer = ads7846_transfer;
> +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
>  }
>
>  static const TypeInfo ads7846_info = {

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Really we should move the file too...

thanks
-- PMM

