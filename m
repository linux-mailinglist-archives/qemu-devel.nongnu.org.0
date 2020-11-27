Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBDF2C6670
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 14:11:47 +0100 (CET)
Received: from localhost ([::1]:41008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kidXN-0002co-Td
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 08:11:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kidW0-00024q-KJ
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 08:10:20 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:36302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kidVz-0002J1-0E
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 08:10:20 -0500
Received: by mail-wm1-x342.google.com with SMTP id f190so3466052wme.1
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 05:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=IzzGF8qH+so58eUWgTc4juPukS0ng5sEU9ebFUaHBrE=;
 b=fXYDrcCh7pkobxFR8fNhfLs35LwuiLnVxvD8B7ApqGOPh+ATOJ0+bnHoDqa6Icvxoy
 3W63gXeWWqVwitYH9ZRCGbcNKB/Sx/VCQCTR7QoaFPlw9EMH1YeMQWH9bw754MlucxA9
 tso3BpKFOYUQVf4/g1f7mxUc/+wVMzSasmgexhNpkxej/TTtH6WMQOZ0GqFBocddrQtH
 w5b8Z3GWG+IYlBJHR/K4QnqRq9UJPQwQv5SWM5OEtb+dHomH0VnXh8QyWhvHvnktUI2x
 ddUwO61JxuVGozvQz/hajFAA1dbzlSRtHHZ9dHzhc4vahuO+4weftawe79gxervqH/vk
 09dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=IzzGF8qH+so58eUWgTc4juPukS0ng5sEU9ebFUaHBrE=;
 b=NPcVmw3Tjw1NPBKXbno92li/NmaPoL0ZvIxgnuE4PLjrxMNjULEoi1BhmQi4YP2d7z
 PkQ+I7rHg+WwwbwZw++nmHeAGjCEiWBd62B05f4YhBwbdnoXjj6Kcd3J+Dph9Zu57PnH
 1tIqQPNGm/NhNBnXSkCo0WX6vUxzfm0DHKYl5WcVUvGjXj8oHEdBhNgL1Y1VSnepQoIX
 uaOKaMOBG1lnq9LBj8dhgRudRkd5SWfZvWESYC8KwwkfqjSZp0legVfYVZzwVz4D8TW3
 gbnVrpzrv7Vh55G5qz+FVEQyg6dbEFICR6S6w0ioZE9SIYykosrSoCB1s4WAX1ZS5KYe
 4D+w==
X-Gm-Message-State: AOAM533MugRkvgZwSiIZS3scL7IOro4vfV9lq4DNk5PY+gEKrSfSW0Ve
 eHNZ9VLZqxOxm0MKZZ3BQbIQ/w==
X-Google-Smtp-Source: ABdhPJyvpRZulvWwVNSIze88tUvomsnxwhxYq3vpjJcFpb7LbHOViCgb5XucNz3WwqbXQC5SCg8/2g==
X-Received: by 2002:a1c:1b06:: with SMTP id b6mr8943817wmb.101.1606482613851; 
 Fri, 27 Nov 2020 05:10:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z19sm13337407wmk.12.2020.11.27.05.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 05:10:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 518CC1FF7E;
 Fri, 27 Nov 2020 13:10:07 +0000 (GMT)
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
 <20201126112915.525285-7-marcandre.lureau@redhat.com>
 <CAFEAcA_vCVbMTPsOosFfTt0eoTvdm0KKz2gh0u1AEOrifqJTWQ@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 06/13] tests: remove GCC < 4 fallbacks
In-reply-to: <CAFEAcA_vCVbMTPsOosFfTt0eoTvdm0KKz2gh0u1AEOrifqJTWQ@mail.gmail.com>
Date: Fri, 27 Nov 2020 13:10:06 +0000
Message-ID: <878sangd3l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x342.google.com
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 26 Nov 2020 at 11:30, <marcandre.lureau@redhat.com> wrote:
>>
>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>> Since commit efc6c07 ("configure: Add a test for the minimum compiler
>> version"), QEMU explicitely depends on GCC >=3D 4.8.

technically the tests/tcg tests don't depend on the same compilers as
the main QEMU build. However as the cross compiler case is most likely
covered by our much more modern docker images and the buildin arm-on-arm
will re-use the host compiler this is fine.

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

