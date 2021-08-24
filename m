Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38033F5AEC
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 11:21:26 +0200 (CEST)
Received: from localhost ([::1]:59812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIScX-0002Vl-QN
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 05:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mISbi-0001i7-RX
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 05:20:34 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:38525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mISbh-0000ij-Al
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 05:20:34 -0400
Received: by mail-ed1-x52f.google.com with SMTP id q3so30612595edt.5
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 02:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O3V5PYKeCv/TYIqDMiUyfCEsQFUEP+pMNlMrP/ZOObw=;
 b=YwqhLzuTDQIISC1XTjzaIW3mo+c/4o5pOdu/P00xK56no5oWLtYN5fUrbgqWHfYgfa
 0tr94Bek06d3mJSdarmMoHXUA1k+2pcHp+UqL0YP1SISIQpubaWLQjruPXbf35Ev7OV+
 7tpxLSDvv+81gdGpe/l2ts+grxFOYv0N4MAUCTZkEhWvx4DEJe7P7/WU5Nr1k+sylUFD
 uPsc2dBfH0vC0HjFMUxfdNeOALek9dpB4+M3JLA/f8q1Ft41A6XiuZixQxbs1x+zF4Z1
 6X1+jFCxnA+G4jGBQH3yfeVj1U43h0vh7sNzSgAcEuugpHmKDUeUB13i2zsMR5BDSLo6
 sj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O3V5PYKeCv/TYIqDMiUyfCEsQFUEP+pMNlMrP/ZOObw=;
 b=s33qcSjmsxbiKsk2LT59wKUljTR7E1hMSchkjlF5T+kw0ZodZeWhFgdVOxVgh6fH5l
 /E66jwKrBPI4+ViuBKtPx3quh5KjDFXIy6EAVUOK1htEEWMKZS5OOzVlppQI+iHMTRzE
 kpAkQ3vNEF355GyR0KnMAr0A42MTfZ0ojs0LLPfhOi8ybWrBxgz2dll/ib6u9qfOde0v
 0k3DaOawFqE8nv6+FakgWCjqRlk+8VsY4nL90zaROQMJtDlhUFOv+Hy4uLFWk1g7OkoP
 0QmcS63BvvrOYTQXWyXU6gBWaNGLTwOvQ2RsMtk4h+nBq5WXVgJjtgLm+uMIVMhfANCO
 UukA==
X-Gm-Message-State: AOAM530+f22qLkCY8cg4j3pjqccXs2F3HHUKXV/ZlRotZHIeT0ZQ+aqH
 YVFJPkze+WvygYPWyiRc5hSGJT2jO7EFwLJRJrBsEQ==
X-Google-Smtp-Source: ABdhPJwx3iMyiAQL30C47gVqPHXOKqw072R+m999jAPiixXdNlq3beY5luy/coTLKZIdScQn4il3ep3Bw2f1rhk/ZKg=
X-Received: by 2002:aa7:cc0b:: with SMTP id q11mr20850777edt.251.1629796831465; 
 Tue, 24 Aug 2021 02:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210819171547.2879725-1-philmd@redhat.com>
 <20210819171547.2879725-3-philmd@redhat.com>
 <20210823183414.hmu4ly2y5zkbw3mg@habkost.net>
 <87ilzvntu1.fsf@dusky.pond.sub.org>
In-Reply-To: <87ilzvntu1.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 10:19:44 +0100
Message-ID: <CAFEAcA-2ShxjS6YAb_xBk=v5YJ5nLaaKtOLVEn7Vjfe6rkpp2A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw/usb/hcd-xhci-pci: Abort if setting link
 property failed
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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

On Tue, 24 Aug 2021 at 09:14, Markus Armbruster <armbru@redhat.com> wrote:
> In functions with an Error **errp parameter, use of &error_fatal is
> almost always wrong.

What are the cases where it is not wrong? My guess is "in board
code and other places where the error handling would have been
'print a message and call exit()' anyway".

-- PMM

