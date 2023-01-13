Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AE1669C45
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:31:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKlV-0000LT-MY; Fri, 13 Jan 2023 09:10:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>)
 id 1pGKlT-0000Kp-2u; Fri, 13 Jan 2023 09:10:39 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>)
 id 1pGKlP-0003Pg-N2; Fri, 13 Jan 2023 09:10:37 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d2so1059787wrp.8;
 Fri, 13 Jan 2023 06:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+2tHuE+pAZzjo6/7R6grVcR/dQK4+/QgQSItoOy/gVw=;
 b=L4Xfn3h4ujoy2tyxjYxd9JH9yrTaue8Yd3sMYRv1JprJRIfLN8n0f/IBWM5WmcI7nT
 cq6APsqyLj27L3pI0pfCFRrvU3T1WWuA0Kx1FthTwmjRoSA4YgyL3AmcWckLk0UJ/02x
 VqgF2JRlktRdP0dYYVTTm/ZTaeQupdvrcADo7v0wJvu1HJqFgTmDnkv41g0n/hBNcsUc
 EI5pGEcK8g68+cJb/isY260Q3q68YGoQvqow3+96st1/7onDe06IJkDe96Es78ZebnrO
 f4q1oE3pM5nrhF4iHWwn92t0SNM0WBkookUjl2/eEyuhcH8Eq9WgPQqsLb+/IR5YSMyv
 0TNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+2tHuE+pAZzjo6/7R6grVcR/dQK4+/QgQSItoOy/gVw=;
 b=0ZQzKebmduOfFE0B5xDH0hmUKEoGLKLssblch0rlZzn/RpQLUMlZgcVp85MR3ar9iG
 hTlPSqEzqiWPQ8pkqI8+jf6p30SMarHi36kNA0lR75ri2ba5iIXdsG6EXedXMRwpxiVl
 Kb0HNdgejwCnhBdIb0lsNCOoJlRqnL4IZpHanuKIll6IyJgLvQvcpq9emtbRLxh2i/SN
 vsO43rHL9RMXW5udjrjZ6/Bd9zdyWfDVrS34FB+oFRs8JmMXGn9FPqIQpqr/pPy69Bx7
 ors/dOwWQVh6T6awFWLsYhP73SRooiGmHD1DLpUQY0D/9NKFIQHzfcpM8V4ibgYwf1Sg
 NR/A==
X-Gm-Message-State: AFqh2kp43T9JbZO+HkOoIrSfy9lkOHxNW/W3/Nz9Hsv06LzTuaANzvbw
 mMLuFhc7VuVd2EN1eHY7nZ4=
X-Google-Smtp-Source: AMrXdXsQ7l3fiOyAF3sSHpo0nb5OcX7iHB+PJgqQPlA9ne5fODgyUZuD6u4ca+TDNNvvFuQb6gDIfg==
X-Received: by 2002:adf:ecca:0:b0:2bd:e592:5460 with SMTP id
 s10-20020adfecca000000b002bde5925460mr957738wro.39.1673619030967; 
 Fri, 13 Jan 2023 06:10:30 -0800 (PST)
Received: from [192.168.33.3] ([147.235.205.60])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a056000120700b00241dd5de644sm19070114wrx.97.2023.01.13.06.10.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 06:10:30 -0800 (PST)
Message-ID: <7e7bf877-0300-7a2e-e0a4-f8db6eeae88b@gmail.com>
Date: Fri, 13 Jan 2023 16:10:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 0/1] hw/ide: share bmdma read and write functions
To: Bernhard Beschow <shentey@gmail.com>, John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20220219080818.327683-1-liavalb@gmail.com>
 <A83604D0-B156-4C34-BAF2-29D13D341386@gmail.com>
 <CAFn=p-bzzTM2cyEM_uVpnutj=7D5NgKFb3=854rNQe_Qc4GTfA@mail.gmail.com>
 <59AF7FF6-64F3-4633-B079-2C41DDF3B76C@gmail.com>
Content-Language: en-US
From: Liav Albani <liavalb@gmail.com>
In-Reply-To: <59AF7FF6-64F3-4633-B079-2C41DDF3B76C@gmail.com>
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=liavalb@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, MIME_HTML_ONLY=0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

<html style="direction: ltr;">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style id="bidiui-paragraph-margins" type="text/css">body p { margin-bottom: 0cm; margin-top: 0pt; } </style>
  </head>
  <body bidimailui-charset-is-forced="true" style="direction: ltr;">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/11/23 01:07, Bernhard Beschow
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:59AF7FF6-64F3-4633-B079-2C41DDF3B76C@gmail.com">
      <pre class="moz-quote-pre" wrap="">

Am 9. Januar 2023 19:24:16 UTC schrieb John Snow <a class="moz-txt-link-rfc2396E" href="mailto:jsnow@redhat.com">&lt;jsnow@redhat.com&gt;</a>:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Tue, Sep 6, 2022 at 10:27 AM Bernhard Beschow <a class="moz-txt-link-rfc2396E" href="mailto:shentey@gmail.com">&lt;shentey@gmail.com&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Am 19. Februar 2022 08:08:17 UTC schrieb Liav Albani <a class="moz-txt-link-rfc2396E" href="mailto:liavalb@gmail.com">&lt;liavalb@gmail.com&gt;</a>:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">This is a preparation before I send v3 of ich6-ide controller emulation patch.
I figured that it's more trivial to split the changes this way, by extracting
the bmdma functions from via.c and piix.c and sharing them together. Then,
I could easily put these into use when I send v3 of the ich6-ide patch by just
using the already separated functions. This was suggested by BALATON Zoltan when
he submitted a code review on my ich6-ide controller emulation patch.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Ping. Any news?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
*cough*.

Has this been folded into subsequent series, or does this still need attention?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Both piix and via still have their own bmdma implementations. This patch might be worth having.

Best regards,
Bernhard
</pre>
    </blockquote>
    <p>I see. Since you are still interested, I will try to see what was
      the outcome of that patch as I really don't remember if it passed
      the CI tests, etc. If applicable, I will send this as v2, or if
      it's already approved, then I guess we could just let it be merged
      to the tree?</p>
    <p><br>
    </p>
    <p>Best regards,</p>
    <p>Liav<br>
    </p>
    <blockquote type="cite"
      cite="mid:59AF7FF6-64F3-4633-B079-2C41DDF3B76C@gmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Liav Albani (1):
 hw/ide: share bmdma read and write functions between piix.c and via.c

hw/ide/pci.c         | 47 ++++++++++++++++++++++++++++++++++++++++
hw/ide/piix.c        | 50 ++-----------------------------------------
hw/ide/via.c         | 51 ++------------------------------------------
include/hw/ide/pci.h |  4 ++++
4 files changed, 55 insertions(+), 97 deletions(-)

</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

