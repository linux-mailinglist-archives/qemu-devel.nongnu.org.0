Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00344624151
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 12:24:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot5e4-00020m-Ep; Thu, 10 Nov 2022 06:22:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ot5dZ-00020Z-CJ
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 06:22:25 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ot5dW-0007pW-62
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 06:22:24 -0500
Received: by mail-pg1-x533.google.com with SMTP id 130so1514315pgc.5
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 03:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=D3bjm6cgHdWPQTh+GEGox2jy99q5dF7xtjBixSOC++E=;
 b=tb8NuUmzJLjtT66uIYocfuSd37uJhveK6e9ZWWCZL9CXPH+q15ASo7NhdWyu2/GDme
 NLOW596lQZB6Noyke41uoMlvCvIwLu+8jFom7L9OE6bE3i89zjqoqjs6xBFW/TlLEy6N
 2OSbg0Oev5oTVPkDJFP+psfm6Jdx3uendJ8HiiigwYOI17+OIcRWvCObQfmo0yFEUJn1
 PlLoVigRMSqcm7cyU4UlvxFVHrRYPEPy8w/NWVjUw2EZNuj01y8qFIOS1MQy6idQqnTs
 pK17+/kr8ZJDkqXkBwj5NUja8DHUv8EMoZLceEHk8JUnpZaAWRqIT2ZyY77cYPH4wdJu
 4DMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D3bjm6cgHdWPQTh+GEGox2jy99q5dF7xtjBixSOC++E=;
 b=zYYCCjYVNxLJe/fcK4THTCSVBBoUvGrsv2Wg7273l/K/hiY8ZgSe/JkVALtoOjfP+9
 KUZxsXyTV5wckXVQwEZQzxMuhqspZKRm5S8ANd6R+EHyNsti3N5tr4EFKdedvxIFuQAz
 t5uB68dK86skUvCcIf0TcQ4sk4Q0HlWKrpIBZhQ45FH0SCZGNiWsvfHY3Ux4JNK8wVuK
 a/QqaOsI/H409M2Gej/uCyHQn/fI/QUtYV43nod9iqsAAGSBupt7w73sE/CwaoOUI5Df
 2DZRJgZUzaKoEMi4qqTpQo+wjIWoj0X4YvUD35RDw0vT77LDt/r2m/OZO1fWefImJb8c
 INhg==
X-Gm-Message-State: ACrzQf1YK76lYO8b2RDNGhNAldnxX3cFikvPzMhj8UQQy/6s6GaApBVt
 63axK/M6JUmqiKWrB3rq+41CsRWByWHJaGodYXWQoQ==
X-Google-Smtp-Source: AMsMyM4YeuLjNtx1wM+HDr2qw2FKEfAIv3qqJkq72PZXUd13oJtFmlMdBL+df9id/Tyq29gMVrf10YF5mrwCpiIjZuc=
X-Received: by 2002:a05:6a00:1595:b0:56d:e04d:e0ab with SMTP id
 u21-20020a056a00159500b0056de04de0abmr45832817pfk.51.1668079339620; Thu, 10
 Nov 2022 03:22:19 -0800 (PST)
MIME-Version: 1.0
References: <20221109170009.3498451-1-peter.maydell@linaro.org>
 <cfbb4196-90e2-bb1a-eb2f-c49465b58f04@ilande.co.uk>
In-Reply-To: <cfbb4196-90e2-bb1a-eb2f-c49465b58f04@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Nov 2022 11:22:07 +0000
Message-ID: <CAFEAcA9RQzPMZkde=8Kfh09uxV9RC1rsb-UtEWPhcjj1Kf4e_A@mail.gmail.com>
Subject: Re: [PATCH for-8.0 0/2] hw/input/ps2: Convert to 3-phase reset
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x533.google.com
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

On Thu, 10 Nov 2022 at 10:36, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
> I haven't used the new ResettableClass myself previously, however it seems to match
> the excellent documentation at https://qemu.readthedocs.io/en/latest/devel/reset.html
> so feel free to add my Acked-by tag.
>
> One part that did stand out to me in the docs is the part that reads "For now
> migration of a device or bus in reset is not supported. Care must be taken not to
> delay resettable_release_reset() after its resettable_assert_reset() counterpart". Is
> this still a valid concern and something we need to think about? I'm thinking about
> if a guest triggers a SCSI bus or PCI bus reset for example.

That only matters if there's a way for the guest to hold the device
in reset, as opposed to resetting it as a point event. This is
theoretically possible to do with the new API, and was simply
impossible with the old API because with the old one reset was
always a one-shot point event.

thanks
-- PMM

