Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB8F1E2932
	for <lists+qemu-devel@lfdr.de>; Tue, 26 May 2020 19:39:28 +0200 (CEST)
Received: from localhost ([::1]:41758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jddXz-0003zg-B3
	for lists+qemu-devel@lfdr.de; Tue, 26 May 2020 13:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jddVU-0000Pg-7G; Tue, 26 May 2020 13:36:52 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:38431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jddVT-0005Kf-7L; Tue, 26 May 2020 13:36:51 -0400
Received: by mail-qk1-x743.google.com with SMTP id f189so21461279qkd.5;
 Tue, 26 May 2020 10:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1TGHuJezfA7VGfMb0nJjVu3KUhXGXNlW/nSKttdeGD0=;
 b=ZoQQQYH8tbI1Dv3TIR/e2vLBGcsW4me5bKvbVUKndPxcPnDlmuKe8wu7NOKPkd+QQc
 Dr/51CAPwMqKYUCKb+e42WEomZdYu7n6TDlnqNLsI4vr9R4389x0ffWtX7M/A/hu7ETf
 OdwmBq3pwm4jBkiteF0y3JRqphNAS42L60l3PLh9god0pXMBUHFATBiagREA0xGI9qXX
 GfT9xrYvQl47Onm4VS+1GPH6ajdG5WxFmkPDWwE1o607K2oK8ydlkaGKgWFkW0K2V6dt
 jOb6ZpJnxL77YXLiZ+nwX9N0kSBRpKx8t5w+APlFZZbpjo0Iv+XALPVWKMzvalOQxOsJ
 w6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1TGHuJezfA7VGfMb0nJjVu3KUhXGXNlW/nSKttdeGD0=;
 b=Qn8Xt9iSHuyPxaloUF/p57YauaqJZ2cBc11QfhVmAiT8Gdi6lQHbGRMMQ74D39iUdV
 5E3Ng7EFftkmQuiNouAszHIMw5UokTeB6kYyBqahhkXUhZfzB6mMxfHeGZyfSGlxdFZA
 Qbpmswp95sjP909Oe2pAoryFYhMzqx7FC1CV7cIgMsFAyIcHEXW8tVmu0eh6gSbFkH8+
 /d31RWFm3i877oWevJJt+T5G8K6XrZdJkPDIXjc1TFytrWuMPkxIUzo5/L5N9waSo2/n
 vcpqANZE+m9orjkOfsiONhF8py6O153QNhauEg9JPWQUePMDPPfaf35TmKazMP0P8S+E
 EZQg==
X-Gm-Message-State: AOAM530QDicx4YPhWW7kYbj2QIOhuuFEyDPDLyMD5tZBuTtKY8aQIjhH
 EoPCs6qAGck9j+fQp8ab5xJ1gWQVKd90fNmr25k=
X-Google-Smtp-Source: ABdhPJzNVySN//WhPY0a5gHK7WziJtHdmF/9F+Wt5kwicBi/mK5uF0cK6reEutUDlLOxwut5Oiqb6atw40QxOWZG+8A=
X-Received: by 2002:a37:90f:: with SMTP id 15mr2584316qkj.339.1590514609304;
 Tue, 26 May 2020 10:36:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200526062252.19852-1-f4bug@amsat.org>
 <20200526062252.19852-14-f4bug@amsat.org>
In-Reply-To: <20200526062252.19852-14-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 May 2020 10:27:46 -0700
Message-ID: <CAKmqyKMYp99tBHO_T63ib06dHr1wu3ynP5aOPTxVh8v3nWHZeQ@mail.gmail.com>
Subject: Re: [PATCH 13/14] hw/display/omap_dss: Replace fprintf() call by
 qemu_log_mask(LOG_UNIMP)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::743;
 envelope-from=alistair23@gmail.com; helo=mail-qk1-x743.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 25, 2020 at 11:35 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Replace fprintf() call by qemu_log_mask(LOG_UNIMP), which is
> disabled by default. This avoid flooding the terminal when
> fuzzing the device.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/display/omap_dss.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/display/omap_dss.c b/hw/display/omap_dss.c
> index 32dc0d6aa7..21fde58a26 100644
> --- a/hw/display/omap_dss.c
> +++ b/hw/display/omap_dss.c
> @@ -619,7 +619,7 @@ static void omap_rfbi_transfer_start(struct omap_dss_=
s *s)
>      if (s->rfbi.control & (1 << 1)) {                          /* BYPASS=
 */
>          /* TODO: in non-Bypass mode we probably need to just assert the
>           * DRQ and wait for DMA to write the pixels.  */
> -        fprintf(stderr, "%s: Bypass mode unimplemented\n", __func__);
> +        qemu_log_mask(LOG_UNIMP, "%s: Bypass mode unimplemented\n", __fu=
nc__);
>          return;
>      }
>
> --
> 2.21.3
>
>

