Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2F2406920
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 11:32:47 +0200 (CEST)
Received: from localhost ([::1]:45932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOctq-0006B6-Mc
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 05:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOcsZ-0005HQ-8N
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 05:31:28 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOcsV-0003Wh-OG
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 05:31:27 -0400
Received: by mail-wr1-x42d.google.com with SMTP id g16so1702694wrb.3
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 02:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RpAQ7vNrv0bASmLyuLZvnjH8wlkQv7MQ5QwSC9XkwA4=;
 b=UOSBZBxMMQ+p1jJPRw60jIJjumaIQmhqU0H7fMXMP3+qRUxs+NebOb5CurflMCI2n9
 bZPeBK3X5O0DLEkgMwqEVpkKnZmXZf0jPQc6NkmvMFi0FA6oArLTdQqphhMkGQCmuIYM
 jn6v+3dsM+KvQPvDSWDzKhtFb3l/2r7kt2vQZWpnUO7nVDIS5o1S5RUxFYGfNa+g/rtD
 wW2di7IOZkAggjl5JkVyK2NrQTVf2iYI4MulrqVkVTaVeSYIKaQAMNtsQHFMe6JFWjsf
 8Vo9C0BPsfNWvTBBtbTsgQkKYoW4M3hXti7jkYTwB8unKybadR/zOmVC2vVuD2eRIcLs
 h3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RpAQ7vNrv0bASmLyuLZvnjH8wlkQv7MQ5QwSC9XkwA4=;
 b=jQViW1rbspJ4bSEBgR5hb6urZPE/8zbtVGxU67rTCZmbPKeFGJqb6rJ2K+gVCjWnb6
 3JBCQ++CDq7YA+ZWDJ6UTEI0xRM7sj+ktZwB1guuPLuhcLyW58ks35QfeXMGEkl1bLOT
 fMtaJV6stb+CcblPQ8UlxkXGuJW7w+tDp26fJ2099PJI7PTsbpJJY75VJ5D0lsFclmnk
 MRHJ+pU0E1PibdqRmUTIA4nA1m2SG7ovcgQlkI504AXNwNnxgyvljssxYlvZytHVTgCb
 K5mj6n583OIRWY5nxCYvM0o4TEwzpd0K8PN/GTX1Rx1wqsvwJzYZtH/MV3Vh4BUaOsTw
 3LTA==
X-Gm-Message-State: AOAM531JJWcuvIi7hS1us3Hx+Oh+LWebrR+e1ycTFVSIoPrbWKW+XK0x
 bk/jt02V1nvNgo19bLf7blGsZ1G7hPjhORNjxJEqmQ==
X-Google-Smtp-Source: ABdhPJyrs4JSDKPBR2IwFzsjv6cO8UrwexQEZ3Dy34CgS7SiiboHYRsTu/DFV7i2Nu+b7nDyfOpNOqEWVlSN6UoEu5E=
X-Received: by 2002:a5d:4a08:: with SMTP id m8mr8470457wrq.263.1631266281438; 
 Fri, 10 Sep 2021 02:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-2-peter.maydell@linaro.org>
 <76cd3594-f864-232c-8687-19a1d44ff07e@linaro.org>
 <CAFEAcA_xUSMEoT34fkwiGef8D5Rwfkvre8o03YqgEw-qD86o=Q@mail.gmail.com>
 <d2263937-aa85-c51c-9a2b-bc50043e10c7@linaro.org>
In-Reply-To: <d2263937-aa85-c51c-9a2b-bc50043e10c7@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Sep 2021 10:30:31 +0100
Message-ID: <CAFEAcA_Swe0LE6m2JocLsyuV1ioDnK3N0y_hJ2QAXW86UxC=dw@mail.gmail.com>
Subject: Re: [PATCH 1/4] target/arm: Add TB flag for "MVE insns not predicated"
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 10 Sept 2021 at 07:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/9/21 3:46 PM, Peter Maydell wrote:
> > On Fri, 3 Sept 2021 at 14:58, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >> I think you need to go ahead and end the TB and resync immediately.
> >> Just set dc->base.is_jmp = DISAS_UPDATE_NOCHAIN instead.
> >
> > Is there a rule for when we should set is_jmp to DISAS_UPDATE_NOCHAIN,
> > when we should set it to DISAS_UPDATE_EXIT, and when we should call
> > gen_lookup_tb() ? We seem to use all three methods at various points
> > for "I changed some CPU state and want to end the TB"...
>
> UPDATE_EXIT is for when you need to return to the main loop; UPDATE_NOCHAIN merely avoids
> goto_tb.  Direct use of gen_goto_ptr should be reserved for branches (which I think is
> already the case).

And what about gen_lookup_tb() ? As far as I can tell the semantics of
this are the same as setting is_jmp to DISAS_UPDATE_EXIT: the "set PC
to s->base.pc_next" happens immediately rather than being done later in
arm_tr_tb_stop(), but I don't think that should make a difference.
Or is there a case where it matters?

If gen_lookup_tb() and DISAS_UPDATE_EXIT are the same, maybe we
should get rid of gen_lookup_tb() entirely ?

-- PMM

