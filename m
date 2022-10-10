Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F505F9C66
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 12:07:03 +0200 (CEST)
Received: from localhost ([::1]:33430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohpgc-0004m4-2N
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 06:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohpWP-0004Mw-BA
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:56:29 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohpWN-00081s-LG
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:56:28 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 g8-20020a17090a128800b0020c79f987ceso4851757pja.5
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 02:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5mN/0Fi6tkYvVOJNxQhuxM6pdBRIwOkZ2fDQltQOYuE=;
 b=QuUCMNL97eq5X2IjVt8hxD7QH6simE/9jwAK6qBWqoBIwO1cBzgVOaEHTW+yHHfxGb
 zuEUgd6V8xxFkuN+GPxn3mpglkdSUs64fE+bi2akf/Mo4wv6tsJhUQchPZDMzuquIvJv
 qAQvOiWc3NrF1YUmFt7inWNmkXPY21LVqg6/ZRo2MXIKYZxHtRJm3N54Uqb6RBF92fnj
 5ObpzGwt9HA78k7uAYr8MynU9Z6FXAC0ggPFzTMwlSwtz8Moup8XRX1+RP0vUSO3v/jC
 LrzTG9U90QhPXoST3YQCBhCE6MrOwBx/T+0pItN6gwgunUUC24BSsEqNjbI5H+zCmPt+
 l5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5mN/0Fi6tkYvVOJNxQhuxM6pdBRIwOkZ2fDQltQOYuE=;
 b=iBzv7oihvmrtsKFELLV4LPccRjqA9X+UkK6jdqw/ceudZZjCyQY2DWPP4Xu6lEdVoj
 T8OY8GMVZNtDvyvpPzHm1dHYiEXgdQ+wcuPyRbx8gtxyBAzXSn+ApWaQR/p+uT2FHgul
 PMVK939QWXeEbRsbpgHY62baVcOHCLtCTUDfydQA/5pgMk1Jx32XG80vYfulzZSWmbce
 WlWCloZvX/R1kis3SM0st92CsWzMZk2WNOq9zQ9uFfDNpWA3Zg8E6lMyalRSV1q+ZLuA
 0plzpjJQyRg56ABxM2gvoCGSUTFIyT8eFYHmk/UcRmZB5qRJN67TSgH7tVJsuonMzTEi
 IqdA==
X-Gm-Message-State: ACrzQf3s5xiE9YkLvboJg4Rcn6b61wVvGfzmDTAirY3ede5A5onVEKhm
 jHAp/wYLWtICUR8P3G8819olFmS+MCZ9e5OQGRpqnQ==
X-Google-Smtp-Source: AMsMyM62tofb79nUaltnPUoq2tgJqUCIfQL5dOcAua1K6q8nm6Cso/DcsHSJ9jiREgbPvUGUPQWI0VJycVbbQEooKnQ=
X-Received: by 2002:a17:902:aa8b:b0:178:8f1d:6936 with SMTP id
 d11-20020a170902aa8b00b001788f1d6936mr18373213plr.168.1665395786032; Mon, 10
 Oct 2022 02:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAAJ4Ao9crXap1OYiutSgG5caZHzVkM=WvQYpVD2XN1M8JsD3cQ@mail.gmail.com>
 <CAAJ4Ao9M8CnfBtiricqteAfhPhV9sOhiicSYVsrqtCp7CisK_Q@mail.gmail.com>
 <CAFEAcA80d1Qd3VrzV79_ywEryikfLrLNMbe50hjMEP8_HKNBvg@mail.gmail.com>
 <1727925.InMztqvFxb@silver>
 <CAFEAcA9PcDk5pnRrKQf2zRaX8h8KSA9SDHODS102iK3jd_fpUQ@mail.gmail.com>
 <CAAJ4Ao8sxnuxgeUFwvdwceMn6=xy_QxYuOzhAJcGthnSd1pRgQ@mail.gmail.com>
 <CAFEAcA-jRHEGyW-oA1rSXDuYa81x2SNt+vqrvUPtgK6Wr93sJg@mail.gmail.com>
 <CAAJ4Ao8wyZAE-r-ad9DwF-CrqNqTukZTYL5PYBX4_uUTrC3R7Q@mail.gmail.com>
In-Reply-To: <CAAJ4Ao8wyZAE-r-ad9DwF-CrqNqTukZTYL5PYBX4_uUTrC3R7Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Oct 2022 10:56:14 +0100
Message-ID: <CAFEAcA-gPrRLLMEStYe9t9uP4qRxXQCn3f9T9umd4dPotgzViQ@mail.gmail.com>
Subject: Re: [PATCH] error handling: Use TFR() macro where applicable
To: Nikita Ivanov <nivanov@cloudlinux.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org, 
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Greg Kurz <groug@kaod.org>, Jason Wang <jasowang@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1035.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 Oct 2022 at 09:34, Nikita Ivanov <nivanov@cloudlinux.com> wrote:
>
> Hi! Thanks for your notes. I'll try to send updated patches by the end of the day.
>
> On Fri, Oct 7, 2022 at 6:32 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>> I'm not sure why you've put the TEMP_FAILURE_RETRY on the outside here
>> rather than just on the individual function calls.
>
>
> The original code contained both branches in one while loop, so I was afraid that
> value `aiocb->aio_type & QEMU_AIO_WRITE` would change somehow during the loop.
> If you'll say that this is impossible, I'll adjust the code as you propose.

Oh, yes, I see. No, nothing should be changing that during the loop,
I think it's just written the way it is now because it seemed neater
when you write out the retry longhand.

-- PMM

