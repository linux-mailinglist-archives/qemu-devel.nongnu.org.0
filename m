Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7352C359F9C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 15:13:24 +0200 (CEST)
Received: from localhost ([::1]:54640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUqwt-0001x0-GT
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 09:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUqvg-0001Nr-8g; Fri, 09 Apr 2021 09:12:08 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:40829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUqve-0003vm-KV; Fri, 09 Apr 2021 09:12:08 -0400
Received: by mail-ej1-x62f.google.com with SMTP id n2so8576605ejy.7;
 Fri, 09 Apr 2021 06:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vWFIXKcEBxh6L87kP1/H3Yx9SNZerDqwgMEtpKvSZgQ=;
 b=gGjz4M3f962pFQSmv8b31toQf6VAOMnj4NCHAGxbzC3MK7MBn0G7xaktH1vWhHL5KJ
 CDlxT0FhuOW5NfjdFUETwBc35Xw7scfRynVm1h3oy3cpbyyBq/4FKUHoZUUeJtWuHs9C
 mLAlA5TqzB95PS1CBA2ofAENBguni70ITAHqmkzXffM5eg/DR4n1QC/qUGgNLDr4JwrU
 GaQRyX3mrnk4V4kmlV+SkmWdoxNGEe2X9qKnt6Lrqguv73q3/NUO1ckVfvdY1cYCVvd9
 SGWxDE2Lylld3iRz7836B43rleYEaWPMv/TRhPXT8zvGQC65fuEQnt8byWFb2u+if9Ab
 V+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vWFIXKcEBxh6L87kP1/H3Yx9SNZerDqwgMEtpKvSZgQ=;
 b=Gw1eme4d551QJIvdxwghYEb5oCFvxeINBoZ3WY9EetsUTxlZiObAe+yU8mjf9j6PSV
 rY01BZtSSabodBwACvMbxi4HiAeoDsW93+mSte5m9vG9GCV7/WxZAaKgob+BNj4wYiBM
 /fmBh5EIVfItbBLgTfyk7MoBdwhiPNIQn/SH35J/yW2nIAtSj2LT2BJW258mEkzy918S
 2h0WanlThnvBSF9mM8DobzH683GiI7ncz/OCe+3FoF+dVmWa8IUyLWjwACaW2JDfVEkR
 RmKdIgz/fuC4rXkRASym5ojC384gOjtaSG/MhHhtHlNuGVcWLbEzCq20U78ubduEFcJL
 78BQ==
X-Gm-Message-State: AOAM533Ej7vlAC6F8hHKGMW58EaTTNL08tBTaVqGzGgJcOKptehwdUJv
 nDJPbK2nVzsakGtMANNqm6A=
X-Google-Smtp-Source: ABdhPJwT537UZ1dwV4vW9QvA+WiaqeACJdfVyFO4VzY8YY8UbyxdvzrCOOZm/KGZUUnR/E2tVWGcFg==
X-Received: by 2002:a17:906:39c3:: with SMTP id
 i3mr15943939eje.377.1617973924871; 
 Fri, 09 Apr 2021 06:12:04 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id e5sm1407073edr.64.2021.04.09.06.12.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 06:12:03 -0700 (PDT)
Subject: Re: [RFC PATCH-for-6.1 0/9] hw/clock: Strengthen machine (non-qdev)
 clock propagation
To: qemu-devel@nongnu.org
References: <20210409062401.2350436-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <774acc32-2d5a-298e-f47b-df763f86ad2d@amsat.org>
Date: Fri, 9 Apr 2021 15:12:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210409062401.2350436-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/9/21 8:23 AM, Philippe Mathieu-Daudé wrote:
> Hi Damian, Luc, Peter.
> 
> I've been debugging some odd issue with the clocks:
> a clock created in the machine (IOW, not a qdev clock) isn't
> always resetted, thus propagating its value.
> "not always" is the odd part. In the MPS2 board, the machine
> clock is propagated. Apparently because the peripherals are
> created directly in the machine_init() handler. When moving
> them out in a SoC QOM container, the clock isn't... I'm still
> having hard time to understand what is going on.
> 
> Alternatively I tried to strengthen the clock API by reducing
> the clock creation in 2 cases: machine/device. This way clocks
> aren't left dangling around alone. The qdev clocks are properly
> resetted, and for the machine clocks I register a generic reset
> handler. This way is safer, but I don't think we want to keep
> adding generic reset handlers, instead we'd like to remove them.
> 
> I'll keep debugging to understand. Meanwhile posting this series
> as RFC to get feedback on the approach and start discussing on
> this issue.

I wonder if this could be the culprit:

  commit 96250eab904261b31d9d1ac3abbdb36737635ffa
  Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
  Date:   Fri Aug 28 10:02:44 2020 +0100

      hw/clock: Only propagate clock changes if the clock is changed

      Avoid propagating the clock change when the clock does not change.

  diff --git a/include/hw/clock.h b/include/hw/clock.h
  index d85af45c967..9ecd78b2c30 100644
  --- a/include/hw/clock.h
  +++ b/include/hw/clock.h
  @@ -165,8 +165,9 @@ void clock_propagate(Clock *clk);
    */
   static inline void clock_update(Clock *clk, uint64_t value)
   {
  -    clock_set(clk, value);
  -    clock_propagate(clk);
  +    if (clock_set(clk, value)) {
  +        clock_propagate(clk);
  +    }
   }

I.e.:

- first use clock_set() to set the new period
- then call clock_update() with the same "new period"

-> the clock parent already has the new period, so the
   children are not updated.

