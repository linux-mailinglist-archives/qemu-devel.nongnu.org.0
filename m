Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BD36F40E4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:16:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptn3K-0002th-UU; Tue, 02 May 2023 06:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptn3H-0002tN-Ee
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:16:08 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptn3F-0007VI-QS
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:16:07 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-50bcc565280so1894509a12.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 03:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683022563; x=1685614563;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kn53eJL3e1UJEfOoWFZDWg2D8EXb59vpIm1IxJ5T4Lo=;
 b=us4YAqew9SDAvsv1Xu92GSzAUwddaul/n9MhlVRS7EvxvvJ06wAOhZ4mYaqNyovYu7
 LWY1imnT2ZbB8S76B3vsbF8wRpQMiaL6tOUSP1hfgXqyX9HcPs39ydlWHUe0OzjWDsOe
 OWbCwP06ZqXf/kEnRXJYY27MAIlNkkRXJAcHJFSnmqF4d8MA4XH+7XB7AwPtUQM7WZMY
 LBPCbKGJw4hmcS9KbvhilbgjE2F/8T7nWJLX46n6bhUMhnB97apW9gQ9TnFbEKiA5ZQy
 iT/KiHEM11BpfHYrNoWbhZqLU3jMy/vn36je+gqJ/HhKE5YwYDqWjeK4bdnFESDVgKhT
 c3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683022563; x=1685614563;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kn53eJL3e1UJEfOoWFZDWg2D8EXb59vpIm1IxJ5T4Lo=;
 b=BKq1N/Jsbmw8CsK5mE2irrkUR0UlhhMSmo1ALTVjxS/7B8s+d1iqAWnRdijQjooxhW
 eyyvjxCMY3VJf65GWJEndTfuTXVZPc5SdwQGD7G5hSoOcKdGQYk1PtvbefYlfwdqptVY
 4DePqNV0LNJMdqqyjVFZMMaFUezoSWFW5N784/u5tzDFJ14q09b4qeMfAm1F7E6lVjgu
 1+MA6dhvnltLBR/LgwuqMEyP+8yrY3ZzlJ8s+19H/tDi0efneYOW/bA+1YOKMFnI+ylL
 Nn7eWwU4K1a+QRCzXE3ObdHIxD3X8le4rJuLh5MwaLVauhWNwBMedkljo3qTrgQt90BL
 gMsg==
X-Gm-Message-State: AC+VfDwQVtmPMcHmb/x6maNa2F4AkoEANGv5FO4U2D3wN5bTdqbLVZtL
 QklhIJNpuFoaa5KLeGS2uF4faHgYlFKKD8xGj1tjQw==
X-Google-Smtp-Source: ACHHUZ5C6mQ8Hh9yldQG6mvJ0BnUNq3lLv6c9Buo8+kj6mrapVtKZaDgNn7S/gfsTifckfaD2s5UW6higcrIp9IyTt0=
X-Received: by 2002:a05:6402:150c:b0:504:aae4:a034 with SMTP id
 f12-20020a056402150c00b00504aae4a034mr8369336edw.31.1683022563547; Tue, 02
 May 2023 03:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230425103250.56653-1-dani@danielbertalan.dev>
In-Reply-To: <20230425103250.56653-1-dani@danielbertalan.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 11:15:52 +0100
Message-ID: <CAFEAcA9vHxxNGp4SC9AYnqCmLZ-a87MeD7Uq6no8n2Vxy9gi_w@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/bcm2835_property: Implement "get command line"
 message
To: Daniel Bertalan <dani@danielbertalan.dev>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 25 Apr 2023 at 11:34, Daniel Bertalan <dani@danielbertalan.dev> wrote:
>
> This query copies the kernel command line into the message buffer. It
> was previously stubbed out to return empty, this commit makes it reflect
> the arguments specified with `-append`.
>
> I observed the following peculiarities on my Pi 3B+:
> - If the buffer is shorter than the string, the response header gives
>   the full length, but no data is actually copied.
> - No NUL terminator is added: even if the buffer is long enough to fit
>   one, the buffer's original contents are preserved past the string's
>   end.
> - The VC firmware adds the following extra parameters beside the
>   user-supplied ones (via /boot/cmdline.txt): `video`, `vc_mem.mem_base`
>   and `vc_mem.mem_size`. This is currently not implemented in qemu.

Are there any particularly interesting bits of guest software
that try to read this property ?

I added a brief comment to the code about the no-NUL-terminator
and short-buffer handling so that future readers of the code
don't have to refer back to the commit message:
+            /*
+             * We follow the firmware behaviour: no NUL terminator is
+             * written to the buffer, and if the buffer is too short
+             * we report the required length in the response header
+             * and copy nothing to the buffer.
+             */

and have applied this to target-arm.next; thanks.

-- PMM

