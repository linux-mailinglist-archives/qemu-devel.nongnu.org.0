Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F28238021B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 04:45:04 +0200 (CEST)
Received: from localhost ([::1]:51776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhNp1-0007JA-7G
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 22:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lhNo6-0006RE-8A; Thu, 13 May 2021 22:44:06 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:44896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lhNo4-0005d2-UA; Thu, 13 May 2021 22:44:06 -0400
Received: by mail-yb1-xb32.google.com with SMTP id h202so37108337ybg.11;
 Thu, 13 May 2021 19:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m2tgCqJzYz883D+QJhnqLh530MPdEycwrId2U/SWna0=;
 b=D745G667Wjt4xty39F4bFswcfL+rU7OfzOYuqlReMnNV6BWeGgGPM5bWjALyk8rTtm
 lJXt8s2/l8kI+ddGDubHg86jFY7/IldC/W3MQwkNUUjDjsRpzf2WD4dT/a6L9xw7XAdO
 VsBlM/H+XbOp9xVzyeNndc6J2tMGfpNVGxlFhQ9Zfz+6x9cP3Ob3l7QmUAyFlPpTZhee
 ybUJFcbkF2IO8+db6hgrta3e00LMhx29omrGEa87/zzLc1VcWB/uB/48Vs5rd7pmlgGn
 FpnerzlX1Xtkj+ZfUZJSWoPdxdsDaajQxRYZ2iRc/6lU4t92K5XczlwI5ceFt1Zu2UgF
 pLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m2tgCqJzYz883D+QJhnqLh530MPdEycwrId2U/SWna0=;
 b=U7ocI3QHxPoVXv1eZQycbMMr7oufr+GDLRFqkg12PXFC4PlQx+zHIIQGGRxq8OCrYA
 tfDIbL6loAo4rL1sMGNEBswqwSkMvuwzMZbvafiuCB7F8GeWvZa8zr9dvpoS62DQ0EF7
 Bm3efqp0im9V+zV/svimrZHXNrRxBSO059hpp6bmwbXWJx6XlKBo8LeHadl/J1rD+UTF
 FpFNOHELBWgutJIf0D8K1c7q7mS09YVdsV8uLA5sD8858FrvtZ/R4ZS5oBbZRZmcoIf0
 6dxnGCfeDmo55YHFSIaircQt8L3U2WPeuHNIEwOLyNIbEZK+i3M03En97QJ3lAa6q73J
 Yvng==
X-Gm-Message-State: AOAM533Afswaqll7Vquqx+PGdQFb9r5o1AQvo1fd67zSV19HYN6rUKpE
 QzkvA0Ch2Hspr1+B2bTG7cL3LpSiR/zLRlRH7Bg=
X-Google-Smtp-Source: ABdhPJwbVsztdeSt81tCxgOM6RU9Yre/Ods3SCFA33vg8QQ+fEiI+Atgj+uGBumXz3jAhMWzvN7cbzaYZ1czhHX+t3w=
X-Received: by 2002:a25:d990:: with SMTP id
 q138mr65673094ybg.387.1620960243710; 
 Thu, 13 May 2021 19:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210513163858.3928976-1-philmd@redhat.com>
 <20210513163858.3928976-5-philmd@redhat.com>
In-Reply-To: <20210513163858.3928976-5-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 14 May 2021 10:43:51 +0800
Message-ID: <CAEUhbmUoOtYtfPX95toq-2c_TNgo2vgLcLn6+avYfUJbH1m2pg@mail.gmail.com>
Subject: Re: [PATCH 04/10] hw/arm/Kconfig: Remove unused DS1338 symbol from
 i.MX25 PDK Board
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 14, 2021 at 12:56 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> In commit c4f00daa5b3 ("imx25-pdk: create ds1338 for qtest inside
> the test") we removed the DS1338 device from the i.MX25 machine
> but forgot to remove it in the machine Kconfig definitions, do
> it now.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/arm/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

