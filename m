Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C85423F6175
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 17:21:22 +0200 (CEST)
Received: from localhost ([::1]:43702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIYEr-0002Sg-TX
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 11:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIYDi-0001gZ-AX
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:20:10 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:34584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIYDg-0001cj-Mt
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 11:20:09 -0400
Received: by mail-ej1-x635.google.com with SMTP id u3so45159456ejz.1
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 08:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pMD60j/EfzbarC817usLCRFMlaAufPSMKLVo4Jb8R3w=;
 b=DbHHgHWC4ckPMrnS6sGwITTP2EpY1jcrGKEP7mgk4mTgGbUxVKbTAKg9X7FRLP9hqW
 mFF/1r/RvDHLX+vlx50ZUZWJovVa0rulomfLzSZt/BLVT5SK/yqq+qjsxZNUR1SS+YwK
 UgXsRTUo4L49mfuhjZ3KBbt92zyCtT4dlq7IShlH+sChbLhbA9tSiuXKEjFe6oOcXWsf
 sxzPQMbhdnZf1gWeCFxFJ14V8TZPMhP6C6wHGaTkvxSQFtbQ5DwrmsJuIO4sNrbbqCfT
 eHrSYIBH2edY0Ov//l1UJw87IoRyUjnNq6zclGlj9w4wp9b3qs0LQb2Ik8y7FVvv7bFO
 9Kzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pMD60j/EfzbarC817usLCRFMlaAufPSMKLVo4Jb8R3w=;
 b=syylO9U9IdiqgDErAGts1k1defDPFLl3yDpXFf+ENSfPbLNOdI7ZyOU+Z6vx+J2bQW
 dsK//jBMz0wS+8WcVa5U9MKJWjBtEAQNrK0DlSYC1aSOLHRqEJ60sdvKFRgHjoMvIOw7
 kK1ImlOOLjCwtAT3sQ1abcS+Q91CwI73BY9Ff4pVA+HuJS3iDMnae+I70aTzKoX+qc5q
 TkWEdwqbyfcKxfYeKWDzX4YRqfH08T+TjfbLzPO0/BnTs0BawtjAXadxrptPPKRKmD3a
 cJ/oa1X3gpMTnjb3S84UKOsY6m4rKvaGUnmvWhN3UdR/hCbBVD9l4axlem/KrYxuMCpA
 55yg==
X-Gm-Message-State: AOAM531GjML+Vjla+5ZGOYPVGXpjdlbeJ8aTypQXRbN1vGapeEcOivnJ
 bw0lIg32Z2O6bDluaWHLGxxcP4OtzbZKk/lQO8Vizw==
X-Google-Smtp-Source: ABdhPJzEUuNgLEFm3gpFsLp2GQMKx2K8yYTcZIMM3A1KxODNtlS/frreCscEpnmU885x/0ZaaLZ3sv0aNJrdAtg7rL0=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr41242042ejy.407.1629818406916; 
 Tue, 24 Aug 2021 08:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210819171547.2879725-1-philmd@redhat.com>
 <20210819171547.2879725-3-philmd@redhat.com>
 <20210823183414.hmu4ly2y5zkbw3mg@habkost.net>
 <87ilzvntu1.fsf@dusky.pond.sub.org>
 <CAFEAcA-2ShxjS6YAb_xBk=v5YJ5nLaaKtOLVEn7Vjfe6rkpp2A@mail.gmail.com>
 <87tujfdp4c.fsf@dusky.pond.sub.org>
 <CAFEAcA9_HGCVYX8smuAWhUDJ8NbfQ76XgJjOLd2EoyiS2gKC0A@mail.gmail.com>
 <87bl5mdik9.fsf@dusky.pond.sub.org>
 <CAFEAcA_8yQu2nbyjhCXKPROP=LLr6iKw2bTg0sHCM0uamwGz5w@mail.gmail.com>
 <87o89man77.fsf@dusky.pond.sub.org>
In-Reply-To: <87o89man77.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 16:19:19 +0100
Message-ID: <CAFEAcA-=TJm=0WFKbAc27NtL2VJroMHAURpzJRdYkg8LLKBagQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw/usb/hcd-xhci-pci: Abort if setting link
 property failed
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 24 Aug 2021 at 16:15, Markus Armbruster <armbru@redhat.com> wrote:
> True, except when I called it "kind of wrong", I was still talking about
> functions with an Error **errp parameter.

Oh yes, so you were. I even quoted your sentence starting
"In functions with an Error **errp parameter ...".
I must have been half-asleep still this morning.

Apologies for starting an unnecessary thread after which we all
turn out to be in complete agreement :-)

-- PMM

