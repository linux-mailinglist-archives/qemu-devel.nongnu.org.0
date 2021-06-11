Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA963A48A4
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 20:27:26 +0200 (CEST)
Received: from localhost ([::1]:54346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrlsK-0004Hj-Ke
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 14:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lrlrS-00037a-Gd
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 14:26:30 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lrlrQ-0004Gu-Bw
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 14:26:30 -0400
Received: by mail-wr1-x42f.google.com with SMTP id a20so7059139wrc.0
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 11:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=2yKJypb+pxFK2fyzeLiIyP5PG14USxvGAvJawy9W1p8=;
 b=zahaMds2r/mH0wVH6LLauf6txpOJtxLah2k7qZTa2E5GENF6dbO3lioBIXoLntVuWp
 9a+gjM51iU1CdtfIJvTtAXSIHcwoUxlPAG/yZv7QKROrHggUogDaoFmRZMpW/szSomf2
 hXQMoZtM2PfnpOC+dAPyr8rG+hC5Ato3sKMnKK4MsJjSknrn2KvRAakMNozc1wKwzdnA
 swyz1DCDvxBQ7RFRiYSfHDW+vuD24UHnUGy7z2fzIYy4KrV88MB0VPD3sWOLOkG0paGs
 /v/kLGwoT3B3BcjzHGsNh6hOfhQr7jfNAdm8NdsIWtwtGpa2tTCTkzqConHKbTBOcQcU
 jIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=2yKJypb+pxFK2fyzeLiIyP5PG14USxvGAvJawy9W1p8=;
 b=sHd7kwKsdp0RdHIH5XpqlYVezsQLRLsS9CxeyPn6E72bu7lcooudegmFajIv//Kt1S
 sc7YfwGVLvDPhlcUqltC0dEB3vHaNBSVRTwMPVEPdFOo1LuUZwS9iq0rQON9HfhkWufD
 +wiiAdSGSpnSwC/ZxTvd+ZH/CqyiE3njDFuu9FvtbASN//G2V8r8RzLipRTiioxTzNqC
 rn2+jpIlNLckxcJ74dHoaUXAwVmad8vn+xm57SP46vDabdS52ahBjPiKlUgnQ4uOlscZ
 pdnc06R+hqOB2F4ppGH1EUhj70aiugCsJpwww36b157xcfjfKLioXVfCgrvoJoPsW4H7
 vH+w==
X-Gm-Message-State: AOAM5321tOTPagZJlSGjfWIhFUtiLrIV/hWzzjJcCBmxVd1rK/gyhQI2
 hQwc6W+edcvCxGZWlLF4J1apqQ==
X-Google-Smtp-Source: ABdhPJz63DSbDL+wasnuhpQamdfB9GR+PuCuTY/srWQ5kcvQoAyCEPvHKGXvM8XEe0K+aBWv2Nr4ww==
X-Received: by 2002:adf:b648:: with SMTP id i8mr5507178wre.425.1623435986792; 
 Fri, 11 Jun 2021 11:26:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k12sm13333537wmr.2.2021.06.11.11.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 11:26:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AA1561FF7E;
 Fri, 11 Jun 2021 19:26:24 +0100 (BST)
References: <BCB8773B-FC54-4C25-9B60-92C263165D38@gmail.com>
 <CAFEAcA-YuyZ9kyivh1dL_chxrtvBF=jOf3L59JuroL2U-e+Xsg@mail.gmail.com>
 <1ee4b7cf-d445-6497-705f-510009fc74f8@ilande.co.uk>
 <874ke4iqf8.fsf@linaro.org>
 <3D29C466-BB81-4BCA-96E9-A46721B1ED59@gmail.com>
 <d9109542-dd68-3e8b-4f53-a09576e16b1f@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: tb_flush() calls causing long Windows XP boot times
Date: Fri, 11 Jun 2021 19:22:48 +0100
In-reply-to: <d9109542-dd68-3e8b-4f53-a09576e16b1f@redhat.com>
Message-ID: <87sg1ogsvj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Programmingkid <programmingkidx@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> On 11/06/21 17:01, Programmingkid wrote:
>> Hello Alex,
>> The good news is the source code to Windows XP is available
>> online:https://github.com/cryptoAlgorithm/nt5src
>
> It's leaked, so I doubt anybody who's paid to work on Linux or QEMU
> would touch that with a ten-foot pole.

Indeed.

Anyway what the OP could do is run QEMU with gdb and -d nochain and
stick a breakpoint (sic) in breakpoint_invalidate. Then each time it
hits you can examine the backtrace to cpu_loop_exec_tb and collect the
data from tb->pc. Then you will have a bunch of addresses in Windows
that keep triggering the behaviour. You can then re-run with -dfilter
and -d in_asm,cpu to get some sort of idea of what Windows is up to.

--=20
Alex Benn=C3=A9e

