Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF2E30E010
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:52:55 +0100 (CET)
Received: from localhost ([::1]:56550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7LOg-0008IO-IJ
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:52:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7LKr-0006MY-Id
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:48:57 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7LKp-0006xn-JQ
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:48:56 -0500
Received: by mail-wm1-x32b.google.com with SMTP id y187so293350wmd.3
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 08:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=E6+oHOhkiWdqXpujW03yjqgLtptwthJ2io+LaY8BQ20=;
 b=J92mOCi8yIIeTT4hTbus62+n7K1kSpzNaHVj40xOjL0T/jecTgad11RmEURavfKF5w
 QxjyHtRROmMq4egVS9mOvOsDzp+XUf1Pyfg4DnHCXX4xwo5OVKb4ve4bIKsWb3xOMqGA
 wocPeFk9I34hbV9BotIBdT9Xf//Wvekv1OyrtZV8meaHnehM2Jwko34G/KzzbTIX6bZf
 ursU6DVuq3Jh3JNF2wU0JrRQqAzhq2vk1Rijo2C1h8kHGwy7/SBTAQiX2K3NkwJo2Otu
 P7Y6Te655oS6KCDSMuxlHJ1V0PJAPbcsycWPpXTI5LbPgDnTOb2/F7PfF/guaIp+Y62h
 /Y8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=E6+oHOhkiWdqXpujW03yjqgLtptwthJ2io+LaY8BQ20=;
 b=mDJ8suYRn1TsGkdMuy9Vgs5riuX1os0zpKXne1ceGZkncbrHg6kDwuYWvwtFNeDubN
 yBfrJEeTrrR5HDuJwoubon4QpgPLV/JVHO/ot28e+tAhA5FK9+0WYrW0haRIObnG90nq
 XT8pmG8X3uDS6curYfjEcUskCzlQmgWsC8ExxUVYHg4sv3IlUOq4bXMbzY5BtNe3vwOP
 r/wHv/lS3nLPlFL1EaKgDu3HDahk2rgtlsf6V3dD7d0CkHofw3xW+1fYb3rsNKXFDzQr
 1PA3PSqJ8z9S7/K1tI/CS8rrow+HQtEQQtTIkxd82pv79pkWh4B7Xo/Bj/E70ABgDGt+
 3PIw==
X-Gm-Message-State: AOAM532vj8u0HFENQja+8RDTinA0cUx0Q4rk5wTtHp3PX+TLuvqe7TBf
 CP6GpnwHn6wFroYTIA0yyVaRjQ==
X-Google-Smtp-Source: ABdhPJz+nTDeHYii7Zya0u8j0kyBsqG54bnuvygQgPrROp7j1wpchD2Qt6cUZ1y2VYR0EWEALWf9zQ==
X-Received: by 2002:a1c:730f:: with SMTP id d15mr3580967wmb.135.1612370933825; 
 Wed, 03 Feb 2021 08:48:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c2sm3518938wmd.10.2021.02.03.08.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 08:48:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AE0D51FF7E;
 Wed,  3 Feb 2021 16:48:51 +0000 (GMT)
References: <20210201100903.17309-1-cfontana@suse.de>
 <20210201100903.17309-20-cfontana@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v15 19/23] i386: split cpu accelerators from cpu.c,
 using AccelCPUClass
Date: Wed, 03 Feb 2021 16:47:00 +0000
In-reply-to: <20210201100903.17309-20-cfontana@suse.de>
Message-ID: <874kitrtak.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> i386 is the first user of AccelCPUClass, allowing to split
> cpu.c into:
>
> cpu.c            cpuid and common x86 cpu functionality
> host-cpu.c       host x86 cpu functions and "host" cpu type
> kvm/kvm-cpu.c    KVM x86 AccelCPUClass
> hvf/hvf-cpu.c    HVF x86 AccelCPUClass
> tcg/tcg-cpu.c    TCG x86 AccelCPUClass
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>

OK I'm beginning to see it... but you should mention that in the
original classifcation patch: "by making an AccelCPUClass we will be
able to specialise it later for individual targets" or something like
that.

The details of this particular patch I'm going to leave to the x86
experts.

--=20
Alex Benn=C3=A9e

