Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7AB4255E3
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 16:57:25 +0200 (CEST)
Received: from localhost ([::1]:38846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYUpm-0005BI-V0
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 10:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYUlv-0001ps-8I
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:53:24 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYUlr-0000MY-So
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 10:53:23 -0400
Received: by mail-wr1-x435.google.com with SMTP id u18so19991290wrg.5
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 07:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=user-agent:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tglY389SybLIBWyAtBUN1scm2wAIoSuPH7MYUd7LjxM=;
 b=uBsEFO6yznVFAKVWNWIV08geA2DHo+ZHC2UxYKJViB+8kya/mUFfbyU1ubAoTEfsTe
 nnCp8vN63N8KCHHTMzl2JyDgAdMcATv+hC464Frq8M5vt1dv/tSzfRqlFXHQVmhMbv9X
 IY/vBsvwgoHW0X9pPrmrq3r3eAJSSXaHlRm+o0Ha45V9JTEWsyx63kmtL4aNovLmC3/B
 HFFIBVW/tbEkxcttfEr9INn9iTVpSARN0VKYgaVaKCSDxD62Npo5Ls37J+FqKdho9olr
 nAk2jeuTLTVNKuESMXpSXBkOUA/ppU4w+TqPzOxMn34yuPHyc87UboiuS2DhTHlQFwLD
 4bZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=tglY389SybLIBWyAtBUN1scm2wAIoSuPH7MYUd7LjxM=;
 b=aWiJkIcRJwEgGmsL2RkXvgN1s0oaM6m8KX6FiHix8uKRdNlURzM7mMXtw6VnQ/EL5X
 3yEVSvDUUtU7WKwsZXb9d9OLV6rD1THf3VESgCA1+RXb3P2Vuyc6Pbs5/8ec50jreDPw
 5knoqaa/BitlXgWGCVmf+B9JHNub3wsB3A+JmiKQdra6GcGO08Uz8K2G1kLQbkOHJlgM
 WxOmHO1d355rFQAZguios/UjsCSS4J+szHpv8sr4dDhL0aY1ECTtY5GkExja0JdU45UJ
 xlzMKbJgHQ4Rv4WU705c2RNLHw3pHAZIeHed6poboEGxZE3w6jl1dCR8BQ/gUHe272Xz
 HBhw==
X-Gm-Message-State: AOAM530lK0YjWw/jTG6x+Epsu7UAWl8E77VnL6ainM70ovJVu3QhNRu6
 XF/TG5ev40Lu9lKttqTuVYueQg==
X-Google-Smtp-Source: ABdhPJxaQRUb2pWU1UA3lDShJjkv2dKkSmrN77HxUSXYNW/FMGr24uS7B2XXhL3y1peYkYem34x6NA==
X-Received: by 2002:a05:600c:354a:: with SMTP id
 i10mr16829986wmq.70.1633618397669; 
 Thu, 07 Oct 2021 07:53:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g1sm9593418wmk.2.2021.10.07.07.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 07:53:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 02AA51FF96;
 Thu,  7 Oct 2021 15:53:16 +0100 (BST)
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Laurent Vivier <laurent@vivier.eu>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: Approaches for same-on-same linux-user execve?
Date: Thu, 07 Oct 2021 15:32:19 +0100
Message-ID: <877deoevj8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: assad.hashmi@linaro.org, qemu-devel@nongnu.org,
 James Bottomley <James.Bottomley@HansenPartnership.com>, qemu-arm@nongnu.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Arnd Bergmann <arnd.bergmann@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I came across a use-case this week for ARM although this may be also
applicable to architectures where QEMU's emulation is ahead of the
hardware currently widely available - for example if you want to
exercise SVE code on AArch64. When the linux-user architecture is not
the same as the host architecture then binfmt_misc works perfectly fine.

However in the case you are running same-on-same you can't use
binfmt_misc to redirect execution to using QEMU because any attempt to
trap native binaries will cause your userspace to hang as binfmt_misc
will be invoked to run the QEMU binary needed to run your application
and a deadlock ensues.

There are some hacks you can apply at a local level like tweaking the
elf header of the binaries you want to run under emulation and adjusting
the binfmt_mask appropriately. This works but is messy and a faff to
set-up.

An ideal setup would be would be for the kernel to catch a SIGILL from a
failing user space program and then to re-launch the process using QEMU
with the old processes maps and execution state so it could continue.
However I suspect there are enough moving parts to make this very
fragile (e.g. what happens to the results of library feature probing
code). So two approaches I can think of are:

Trap execve in QEMU linux-user
------------------------------

We could add a flag to QEMU so at the point of execve it manually
invokes the new process with QEMU, passing on the flag to persist this
behaviour.


Add path mask to binfmt_misc
----------------------------

The other option would be to extend binfmt_misc to have a path mask so
it only applies it's alternative execution scheme to binaries in a
particular section of the file-system (or maybe some sort of pattern?).

Are there any other approaches you could take? Which do you think has
the most merit?

Thanks,

--=20
Alex Benn=C3=A9e

