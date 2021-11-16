Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58073453306
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 14:40:42 +0100 (CET)
Received: from localhost ([::1]:38042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmyhV-0005kz-8I
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 08:40:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmyE6-0000QO-Vc
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 08:10:19 -0500
Received: from [2a00:1450:4864:20::32a] (port=44587
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmyE5-0007Ue-A8
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 08:10:18 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso2338841wme.3
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 05:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HpRKJLJEVZyl3k5pZ2JTma8/l5gqDSHjszdkP/UK2xY=;
 b=gQca/H59k+xxZeNCEsw829QrAS92Y/MjMrEK1BoCSkmIVvHnu0YVlbF76vMgo+r585
 PPX9tVVkeQcruDeMoTWy/NoJrN0vEpAen0Dx9wAVOTqvW8NPQWNI1tM4fVOt6K1zE8vb
 Q3nqxHkgCJ9G13VcTtCVsdvsTd35RODN24T6Lpwq7DZ58LdbN8K/i/lSDaHxkBw9OHSQ
 CUxv1QTnxLmuBW5uZLCZqcsmkeVRRD/NAOl5EqnvJm7i2K40weKIdzYlaxJstCMhzPVz
 fHkFL38kToDghJY+NshFAxnTFUzq47sfpD0L96n1nibnhtI2O1T6aZ/DwpYbQhpf7/j6
 kQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HpRKJLJEVZyl3k5pZ2JTma8/l5gqDSHjszdkP/UK2xY=;
 b=kZyTpjF8xZk4GWZNgArtXXClmFJJ0jfJ+NQL3sJFYBwWrZDQPjlbsMOnVCZXcXyTK/
 voPduZ10pRabA3BdfJ2JFTm8Q7MNRyA/FAiuXgJ2CPFN7+hB88APE6Ag/y1bd6Jq6LGL
 LketRv8Woasb+hORscLrerucHyIuX/YGu5JV/GnXDibsIA/U5yX3nYKzu7QUo0848pYO
 4ZN5zb98Gu1bIi6rB1WIzD5L7PpbpiG99g/Gly3mMuOoZCe2jUZl6JNN5b/TQ7lmB+Nb
 AKP0lWlU18UPQHN/wxzE0vHxVkj9k+ecJzZrYb9n4R4vKja/e+vpmyvGhIm/9hc2JC1f
 BrKQ==
X-Gm-Message-State: AOAM532Dnw3W6gx51vwGV/4vS/LTKPW041MaM/en5zsWuLAqwCePVCUB
 9+SKQdVaDvaUUvKXRxbz8qbiNTMm3uFZV+86EoLz6A==
X-Google-Smtp-Source: ABdhPJxcXruUa9Uz1t2oiFxtYFCdBdl6wgYSpyw0Zk9618ogfvBmkzRLa/C0qSDP9fkWAnjJLjME+5aAj9U6dFFaAbQ=
X-Received: by 2002:a7b:c389:: with SMTP id s9mr7736151wmj.133.1637068215711; 
 Tue, 16 Nov 2021 05:10:15 -0800 (PST)
MIME-Version: 1.0
References: <20211116093834.76615-1-pbonzini@redhat.com>
 <CAFEAcA8=RsA37ErttuGKKfrb8Ooy9NJs=F4o4agQbgu=On9P5w@mail.gmail.com>
 <YZOdRHZn9h9Rdjlr@redhat.com>
In-Reply-To: <YZOdRHZn9h9Rdjlr@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Nov 2021 13:10:04 +0000
Message-ID: <CAFEAcA_PKATU93e2UuoiJB2xbt_y5WKtYY_D5t+SaozcDKQcyg@mail.gmail.com>
Subject: Re: [PATCH] meson: fix botched compile check conversions
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Nov 2021 at 12:00, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> I wonder if the problem is more fundamental than that. Passing
> stuff in --extra-cflags is done to influence the flags used to
> compile the QEMU end user binaries. Unfortunately --extra-cflags
> is also getting applied to all the meson.build feature checks.
>
> IMHO we would get a more reliable result if the meson.build
> checks were fully isolated from the cflags we used for building
> everything else, so the checks get a well understood, predictable
> environment.

If you're using --extra-cflags to pass in "-I/path/to/libfoo/headers"
then you do want that to be used in the meson check for "do we have
libfoo", though...

-- PMM

