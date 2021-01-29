Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502A2308914
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:36:36 +0100 (CET)
Received: from localhost ([::1]:55178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5T0t-0007Os-Cz
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:36:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5STZ-0004ZH-W6
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 07:02:10 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:42629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5STW-0007fh-Vg
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 07:02:09 -0500
Received: by mail-ej1-x634.google.com with SMTP id r12so12608012ejb.9
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 04:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QZJP1TTfy2iOvpEi6sOsJbistrzDMWyxr83a9LBx14g=;
 b=FYE2dReq777MZIF9ywJbGKaIPUXzo+GntLXRYR6F8SUhLgfX4eL7XQDSvAacPqXbKP
 kXMwDO0VEq/+OBMyouvxkHmrCrkAEnGbCwK1ent362TtXjWEIK3Tzlxeq7Tiy2HNe9Wh
 xWgk3Zrqy3AIvAREIw6yIkrKSBcB5uC7LW/SQJ1yQP0/1i9BlERVXrP/E4c3uIb5tDGB
 LAuXJHBW2AYLOXwWh9rW4Z3Mfz/ZE0CahotoECyut81EkR5F/fe0E1xHSafOT1vXUMz0
 Ah4O4C5qSPWaRaFm3glT6rHiPhJrWv+zWVpWvYkpjh/iXOzljp/u1h6iMr3NlH5tN9lS
 f6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QZJP1TTfy2iOvpEi6sOsJbistrzDMWyxr83a9LBx14g=;
 b=m4rlmfxIc6WbwaRv+IoxF07NjuMPkXJEloUfe5O0oapN8iD8RG41OeI9uW6kuhVuzW
 yDczqE73am3BgcWQ1OFYxinzaAWnSMYQk6+c2uQmPtNBOXqQ67xl7qC8RzSO6Gq+VTdr
 74hvVxWNOgdMsJ5jahVo31UGJZxBJ4ARZg2rj6HAP5cmh7aOCDIa8kI+/OeXwd8KmVIi
 g5RxlMk1rnLkcEDMRGy+2iDTrgSxw+7w9CbUpuhf8eJQjc9NwfZI8R3OLTn1rIk3WZE1
 BWK509O4n9w6gi3D/w9UtjeWCKvaueIvatp2Y7tGUZdNL0jYdTcWGWIi6FkkdiqzOrZg
 skrg==
X-Gm-Message-State: AOAM530/bFJLaght36DyY19BInI7gA4YPnXolcEcD581aUz9zYwqqM1S
 1MW3fscxZb+iYYuKSpE/ZoVXkZnD8XNX62rx+lC4Gg==
X-Google-Smtp-Source: ABdhPJzx08wx81fMSwVaxJ3XiAQa7IM3Ho01Uv8cMFUni1NItmxeSf0Qyuz1KTgNNfTxs0kwBKIsUMq2fqDeis++4f0=
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr4241344ejc.482.1611921725215; 
 Fri, 29 Jan 2021 04:02:05 -0800 (PST)
MIME-Version: 1.0
References: <20210129081519.3848145-1-armbru@redhat.com>
In-Reply-To: <20210129081519.3848145-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jan 2021 12:01:53 +0000
Message-ID: <CAFEAcA_O=48U_3p_mKeRRY99OsJCRSTJmOefDT1gbHVdyE_C0A@mail.gmail.com>
Subject: Re: [PATCH RFC 0/1] QOM type names and QAPI
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jean-Christophe DUBOIS <jcd@tribudubois.net>,
 Qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 29 Jan 2021 at 08:15, Markus Armbruster <armbru@redhat.com> wrote:
> 2. We have some 550 type names containing '.'.  QAPI's naming rules
>    could be relaxed to accept '.', but keyval_parse()'s can't.
>
>    Aside: I wish keyval_parse() would use '/' instead of '.', but it's
>    designed to be compatible to the block layer's existing use of
>    dotted keys (shoehorned into QemuOpts).

> Of the type names containing '.' or '+'[**], 293 are CPUs, 107 are
> machines, and 150 are something else.  48 of them can be plugged with
> -device, all s390x or spapr CPUs.
>
> Can we get rid of '.'?

On this one, my vote would be "no". "Versioned machine names
include the QEMU version number" is pretty well entrenched,
and requiring users to remember that when they want version 4.2
they need to remember some other way of writing it than "4.2"
seems rather unfriendly. And 550 uses of '.' is a lot.

thanks
-- PMM

