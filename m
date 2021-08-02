Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C03673DD594
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:22:26 +0200 (CEST)
Received: from localhost ([::1]:45358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWxc-0000i2-Il
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWvI-0006Hy-Tz
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:20:00 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:44900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWvH-0002aN-Ci
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:20:00 -0400
Received: by mail-ed1-x531.google.com with SMTP id z11so1760756edb.11
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 05:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rrbF9dmCb4b/8rhsQkVQHzHZm1a9tvf6Qhsxq7ka71o=;
 b=Doo7LGz84tbArJEasry83owl66QQXwKEQFQWo8NExfuxjsiOWG4iL8IlvnTBTuV8aJ
 49dD970nhyll0vlGAUEysKKXl3MP6sg9R3O2s/gKGedtOzWFgXJvTbnA/g/15R2IirXM
 k3hRrVZN0Y98+LZIWap9HH2SK9rvfPOZq+1QDLvU4nE30LPC+Ir4XMPwvWhsBiKd2EUJ
 8JIuNILpP7Az/kfGCNgtpLinDADVuN1Nghxpr1hE35ip+EmShfKzSLcASx5Rh3A77LZ2
 iHYs8LyMSljvweYLUql26yCLX+3TJPvCUtMJ4Vo5s2eTtPXNBH7+s82qcupINx8GV4H7
 yfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rrbF9dmCb4b/8rhsQkVQHzHZm1a9tvf6Qhsxq7ka71o=;
 b=iur1u/FlDohvGbTXIktmsEXULuTVcY9IBvK5ux10t1KBFOX3Z6vop28/p3LAFFAHMz
 G5X2/ChJ/Otf26qdXha32q8OsqX2ptrURvqr0eQIkKiKLqRF+r5di5P0EKTNPHJ040Wa
 AQ1aAgAUym11yg2YTuhUv/1GmzGFFA4tCpS2k7kI90gjcqdECMEJFa2cEHuL7n/4spz1
 +6deupK3AKOONcLzSqFON5u8EyTbR69IgSscEDduIIBTnopyGtMzO75LGTGmU1S8tHvk
 WDJY9XCdqZhUhMJ5y0FONlS2iDxGgPbgX3u2ASXzCKNavu9CKzjLJfeSVVxLZ1qJcbJn
 BEWA==
X-Gm-Message-State: AOAM532dlKKvgJxXXwJ1sFUy7cc/Q/YvREqEUxa3vYAAlIkgWlVDrV1v
 +tU/o9RxPer32TuJgNazHfDBn8Os01+pNCPWF4babg==
X-Google-Smtp-Source: ABdhPJxdTB9G98CtNQfALHElZ3sQzabx4BsgeFddl4Ms5ortJ7VY0TTqyRF6YMGhARaC2SusMAstwo7IeMhzZymoxQg=
X-Received: by 2002:aa7:c647:: with SMTP id z7mr18683725edr.52.1627906797748; 
 Mon, 02 Aug 2021 05:19:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210729175554.686474-1-ehabkost@redhat.com>
 <20210729175554.686474-7-ehabkost@redhat.com>
In-Reply-To: <20210729175554.686474-7-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 13:19:14 +0100
Message-ID: <CAFEAcA9=ZSawKJ8ZAuirNFD=EfmuHs9Oxyr_uDch8ZD6q6Ao2w@mail.gmail.com>
Subject: Re: [PATCH for-6.2 06/10] docs: qom: Remove unnecessary class
 typedefs from example
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Jul 2021 at 19:01, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> When there's no specific class struct used for a QOM type, we
> normally don't define a typedef for it.  Remove the typedef from
> the minimal example, as it is unnecessary.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  docs/devel/qom.rst | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
> index 05d045bf570..dee60a64c0a 100644
> --- a/docs/devel/qom.rst
> +++ b/docs/devel/qom.rst
> @@ -20,9 +20,6 @@ features:
>
>     #define TYPE_MY_DEVICE "my-device"
>
> -   // No new virtual functions: we can reuse the typedef for the
> -   // superclass.
> -   typedef DeviceClass MyDeviceClass;
>     typedef struct MyDevice
>     {
>         DeviceState parent;

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

though I agree with Daniel that in the long-term we should reverse
the structure of the documents so the recommended macros go first
and the behind-the-scenes boilerplate last.

thanks
-- PMM

