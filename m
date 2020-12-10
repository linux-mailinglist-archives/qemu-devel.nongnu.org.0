Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A37FB2D5E8C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:49:36 +0100 (CET)
Received: from localhost ([::1]:54120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knNG9-0000rr-Ij
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:49:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knNDe-0008H4-Ld
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:46:58 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:39808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knNDc-0005lC-PL
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:46:58 -0500
Received: by mail-ej1-x644.google.com with SMTP id n26so7670341eju.6
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 06:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Gnog/ZDg4vUsu/nZaon+KwESfvhC1ZcgHfRWYsilTJU=;
 b=OjSF7hTNj1VGglWlkOX0X1dBduXiJvq389R+cxqIRwpdEkAwU8C5xqSali8y4qg8kQ
 pHavcUZQGOsp9DEGYk18bL13bmlauyNPgd0sBkZssiO0lKWy2/DWw1UtvYBCluM2oMdQ
 PHiZXb5s5FzA0N20bAAA8nJUZRvRPjFj81mOqgDVUy+SZjiqkvLr6cW2kKWMYLznsYrD
 XMcQo0K4qkNutd1YtTpRiVA5OktEQTUTSfuFw7QxGdel2tGxXgGtCA3GPYr1c+/4ZohD
 33fgdKz7FyeAuUXHkhmBmeL8BS33Ruobz4pMx6s5SkTkBxZz/DGojTp4q+l2BSzt1QWZ
 brAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Gnog/ZDg4vUsu/nZaon+KwESfvhC1ZcgHfRWYsilTJU=;
 b=ibItL9cLwcy5PPK3nrih8ZU3pRikd9LVngR8rQfGTCxiSvsEMonzYg4bP4+wCQkBZZ
 bj+dk6fEej3evWU9CDwwRkMQYdxVn96ENOvbHioQy5sN1PTKx9Txf2w4VG82WASrAi7B
 YstuuO6C+S9Q6cuc/fZGWVUH5qJ5Y4juv8qyiwlGKp0TFJ30HCOcFHK1r4jBQ/EO61JO
 uKrZmfz4/Wzi1SNy8Jv+WMd4vuFO9VG+ao8HXr29xAoVG4ezvMM4W3tOr6sJdwkQrLSO
 AIXi7l83F2Fp1qMw8pCgknqxBB8Sqo8cge3vEWeQKknUzwgfdbosy/HjefS/Ho9boQMt
 ZH8Q==
X-Gm-Message-State: AOAM533MJXKzGphao2c+poHkkw9hGEs4dVgDyjbjhT4Gt4V0G2s077fv
 vGggv+KJouqVNiiR0V7r+ex6ixABiITV8N0pBCnCxA==
X-Google-Smtp-Source: ABdhPJxDzx70qFg8/+8SQWp/wzh+hCnvMQcmbo3zM+VkDnGHRz9EtVJKzK7XDjv+P9nGgZ56Jg0bEdx1VWHQ+YEXXGU=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr6677002ejf.407.1607611614716; 
 Thu, 10 Dec 2020 06:46:54 -0800 (PST)
MIME-Version: 1.0
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-4-marcandre.lureau@redhat.com>
 <fead8bf1-7848-8809-c67a-e6354e7b5cf7@redhat.com>
In-Reply-To: <fead8bf1-7848-8809-c67a-e6354e7b5cf7@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Dec 2020 14:46:43 +0000
Message-ID: <CAFEAcA986crbUmJLR2GU5PE9BOq8w9KWKA5obYfY3eSoviMtnw@mail.gmail.com>
Subject: Re: [PATCH v3 03/13] compiler.h: remove GCC < 3 __builtin_expect
 fallback
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Dec 2020 at 14:32, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 12/10/20 2:47 PM, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Since commit efc6c07 ("configure: Add a test for the minimum compiler
> > version"), QEMU explicitely depends on GCC >=3D 4.8.
> >
> > (clang >=3D 3.4 advertizes itself as GCC >=3D 4.2 compatible and suppor=
ts
> > __builtin_expect too)
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> Shouldn't it becleaner to test in the configure script or Meson that
> likely() and unlikely() are not defined, and define them here
> unconditionally?

That sounds like way more infrastructure than we need if
just checking "is it already defined" is sufficient...

-- PMM

