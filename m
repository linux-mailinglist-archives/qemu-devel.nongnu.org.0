Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ACE3F5DC7
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 14:18:46 +0200 (CEST)
Received: from localhost ([::1]:36964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIVO4-0005Vh-3v
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 08:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIVMx-0004jG-OO
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 08:17:31 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:36441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIVMv-000200-VW
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 08:17:31 -0400
Received: by mail-ej1-x62f.google.com with SMTP id bt14so43977302ejb.3
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 05:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iLrqxLBq0flPKjlUuIGujKKKFTj9uvnbSbbhC+nNu1I=;
 b=jQkeWSUUkFXOVDn8E0oiLxvu/iiSK5uVsr4NtojJWc1i5e7DVfk2WwIZy14Ywgqnk2
 YrPP6ouyoxahO3orUJ2N7JJOI6s8lHSdy5YGppS8LyG99pcUPCYAFlNEt1T9wfzH/R8M
 e1jHs1ttvV2ntlG07AaNXzpQ7mOIq6N/wmFcEA2DPSp2SF7KlnAvGiNet1C+srsubaoZ
 fX5MpTB3u4Nuj7dfb9zVO0UaiGJeFeGZHxQVlIdB4bAWi0f/zD1Xwadsba/EwqpnUl9z
 +InG4WRHUKwMvKnvYE84+Bxkxa7ji5Gx9ZJyo8aja1hhNS7tvxMutf2yfqI9Km3mW605
 C2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iLrqxLBq0flPKjlUuIGujKKKFTj9uvnbSbbhC+nNu1I=;
 b=BUoAtCUruAPV1i49Bpdq8kr6GyD7N6knr3ruA8Bc7gZ2acKEm/KWJf6y/1VXr7Pi67
 ByDY8FzJLUVwTjik34pJ7TsjTFNKLGzWCC/YLnYmgtsTm58wI8nxU03ZV5R+9LF0cqYb
 SIuxKQJYR5udN+0n5cs9nIPIB8ziPOrgPhY+tC3Xd3YeRRfi3DqKQ0wBual/U7Xw+w/0
 eQdbF4CO7fppvJnNnYgYO8vsneOZSSI9loNN748BzFO08B+JmHowQ0gHWNR2adx/N1hD
 fyB2M8Q0gP4eE9XMsJL3JKeoDDOeoLv2sHMqIlpwPs/W9VaMaLbHXjuhKZMjVYSJiDBE
 BfxQ==
X-Gm-Message-State: AOAM532yC8GRdFioO3HagX/s5eqA34JrZlZMHxpWT6S27EFB5aC/I3K1
 rVeX6LNw9y20j4RKx4SKeoZZ+73Z0C2/L3XA/4PMmQ==
X-Google-Smtp-Source: ABdhPJySheqPwV4Z6fqg6fmNerTg2diTd4G7igrzv4CK1xuNmRDkM+LculMnwHg9Qgc/g6Olstq70YkVsZHQTImRVpw=
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr41361051ejz.250.1629807447972; 
 Tue, 24 Aug 2021 05:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210819171547.2879725-1-philmd@redhat.com>
 <20210819171547.2879725-3-philmd@redhat.com>
 <20210823183414.hmu4ly2y5zkbw3mg@habkost.net>
 <87ilzvntu1.fsf@dusky.pond.sub.org>
 <CAFEAcA-2ShxjS6YAb_xBk=v5YJ5nLaaKtOLVEn7Vjfe6rkpp2A@mail.gmail.com>
 <87tujfdp4c.fsf@dusky.pond.sub.org>
In-Reply-To: <87tujfdp4c.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 13:16:40 +0100
Message-ID: <CAFEAcA9_HGCVYX8smuAWhUDJ8NbfQ76XgJjOLd2EoyiS2gKC0A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw/usb/hcd-xhci-pci: Abort if setting link
 property failed
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Aug 2021 at 13:05, Markus Armbruster <armbru@redhat.com> wrote:
> When you know that all callers handle errors like &error_fatal does, use
> of &error_fatal doesn't produce wrong behavior.  It's still kind of
> wrong, because relying on such a non-local argument without a genuine
> need is.

Not using error_fatal results in quite a bit of extra boilerplate
for all those extra explicit "check for failure, print the error
message and exit" points. If the MachineState init function took
an Error** that might be a mild encouragement to "pass an Error
upward rather than exiting"; but it doesn't.

Right now we have nearly a thousand instances of error_fatal
in the codebase, incidentally.

-- PMM

