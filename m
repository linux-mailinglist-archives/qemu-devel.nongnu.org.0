Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C2B307803
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:29:46 +0100 (CET)
Received: from localhost ([::1]:52156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58Is-0007z7-0e
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:29:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l58GO-0006dq-2r
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:27:12 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:40281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l58GM-0002Br-Em
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 09:27:11 -0500
Received: by mail-ed1-x52e.google.com with SMTP id a14so6826617edu.7
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 06:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xBX8sM8ENgieHjEoDLywYqUrCBz8yoTFMXXgAEqRxEw=;
 b=jxY7ZvP68UNwu1njciGSLU7mj89O+QPd+Extl7sgm5GzD6IwNnB78riqwCLyMi17Os
 X0R0we2uj5Js8z4enG1flK2o2MO2ckf0CYbUHNF9JAOlsfV8iErg3vP7DtZ+UIzcEp0g
 LxdzjZUTHS/9Owm4J+wgFmvBJNoDW9+dB9sCzKOB8XSxbUrEk8cnv1qPNPeFicmuQiwA
 5wOckzD3TfI8EqHmlYXXoLgF21jdWUQge1St40zUtjQwF76YAJGBBwEdes2Ysj0knh2v
 piyDwauoKhmi0lh3twCfKepgdZkYedzXF9WusmYKsnNXfxmD98tf6PE0YX09NqqXSeaE
 K9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xBX8sM8ENgieHjEoDLywYqUrCBz8yoTFMXXgAEqRxEw=;
 b=M12APgP5qzd1PvQobUl2M8XrPP1MGuyBq69A+B5Mt85a0gY2w8G4kiGYQbicuNEgFR
 3dZnJe208cb4OV8r3BrYA+xg7fFh02LOE6uHqc9DK6teMuwPqhICD4Y3NyFbNXMYQI5y
 ZfSwrR6hV4RN92wRvmGXNRl4sUFywDUENt4o1RZlkiHqEkvF29lpyHpAE7aYFrqJXWs/
 wpm1pDyQyzmX2txdRr5nYfbAt+Hg4NXadcFa+qcKqS1OnHkui38CL+WYI2GSJE6lPVVT
 nRNNhSa9sWVzQe4aMPbXXzaEf+5lsTVQd+oEzQuiAf9lN+iXfoCtQokJvd33yRhisHYH
 PizQ==
X-Gm-Message-State: AOAM531FDxytzdXWL5KbmsXvdCoHH7njUpnEZpIwXTSpQExiRrB6g8yK
 GEoC3vbXnqnpVET4GpKnaKHSC6o1M6z8BirUxRcM8g==
X-Google-Smtp-Source: ABdhPJw3fzNVPy7uojwweyMxLjwXljEhpSM4ibE2QflTyrIGb9ZRJkJ8sgsmB0AOANejCrkpCUUrOJ0HoSdcxuymvHE=
X-Received: by 2002:a05:6402:1701:: with SMTP id
 y1mr14038805edu.251.1611844029126; 
 Thu, 28 Jan 2021 06:27:09 -0800 (PST)
MIME-Version: 1.0
References: <20210128135627.2067003-1-sw@weilnetz.de>
In-Reply-To: <20210128135627.2067003-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 14:26:58 +0000
Message-ID: <CAFEAcA_6NS0RinTcoSdx=ZfZyXHe12g-Yc8WMmQW0Uj6cenG4Q@mail.gmail.com>
Subject: Re: [PATCH] tests/tcg: Replace /bin/true by true (required on macOS)
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 at 13:59, Stefan Weil <sw@weilnetz.de> wrote:
>
> /bin/true is missing on macOS, but simply "true" is available as a shell builtin.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

It's also in /usr/bin/true if you happen to need a real
executable rather than a builtin. Either way we shouldn't
be hardcoding the path here.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

