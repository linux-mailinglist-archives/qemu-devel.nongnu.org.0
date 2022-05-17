Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF755529F95
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 12:37:16 +0200 (CEST)
Received: from localhost ([::1]:34732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nquZn-0007s6-KR
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 06:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nquPa-0004Vv-Mw
 for qemu-devel@nongnu.org; Tue, 17 May 2022 06:26:46 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:45295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nquPX-00062O-Uz
 for qemu-devel@nongnu.org; Tue, 17 May 2022 06:26:41 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2fed823dd32so71812157b3.12
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 03:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B8Icz8HV5bl3sIQyTHo7h3u7Jiq5YP87pQZF8OWJ/so=;
 b=K8jlCK08Ar2j4xRLllJAPR+lTgTDCZEE1UQaaAicrCKnOEBs92oxyiErahTVL2lQbE
 Dtw+ws/m15fuWhYalVEWC7MBUdY+hlR7KBEd42TTTVIg9bdVM+WQ6ERQ7Y75sseXoUwK
 rToB7LpuB/jbQlZVt6ZRDMYx3EIh7ifY6oosbKLSECGMmYnm6ZzUWxA1A11z8DngG5xb
 clsuRO66Fz75hsVi+uUoy98tLvKR3cNJdO+lftCumIutYx6tuH6vAaaJil9Z0IWgdhnR
 1tMK5Pl+MY7fopvwUHGXD1/D8AuVzW9aa9hSiaAbOk5ntcwnAUpk9UhLj1aZHX1iZFZj
 yeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B8Icz8HV5bl3sIQyTHo7h3u7Jiq5YP87pQZF8OWJ/so=;
 b=KpA9jG2i3ry7Q/zyfvi+U7hATuI/QO6FOygGrgaIzSzplUAlgx2739MEHW8JSK/eV4
 /25gXp1jRLb+a/JuAKhRBXFGD89G1/YzLXOVuM4xRcdSEnxTsoZ3LeCfsNhRVgztFiau
 aSXGXPYH3j2MBSTPDKyTzmuexzBv80kk4HZRfulYIRbg9z/O6cGunRt0t+F3YOvyVw9t
 /EPUQH2r2BzcfcOBXT2S90aCvEUTSmyY3v0XBfYwuIWFXb+GzUZ4Fgjtv7j1JkhtReL9
 /LLT2uyalsF0GShzpSRDJ55Ky9I3zTPEP+VSCNJRTCAhPqCkD0LOhApQkP3W/Xia/YCK
 1yTw==
X-Gm-Message-State: AOAM533soPMaJKSlDASt1Enhbl78QurqhRPdlDNNB4tWOtgjt+f0k9cm
 R6YV/yTCeYY3Ld8WzF6pujyji2hPShYR6QfSBIWekQ==
X-Google-Smtp-Source: ABdhPJyotvJgGSMxorvkb32eiMMBXKkDScacCiMkzA/Qf0ldLo/ClYOIBXCOMy8nTLbwTenMwM+RuvHyjY8RNq3oX9Q=
X-Received: by 2002:a0d:d4d0:0:b0:2fe:b86b:472d with SMTP id
 w199-20020a0dd4d0000000b002feb86b472dmr22639311ywd.469.1652783142399; Tue, 17
 May 2022 03:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAOYM0N09rSSr11vzOqBWLqZj96gxjdxxQYhi_qqzSYOkympCYw@mail.gmail.com>
In-Reply-To: <CAOYM0N09rSSr11vzOqBWLqZj96gxjdxxQYhi_qqzSYOkympCYw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 May 2022 11:25:31 +0100
Message-ID: <CAFEAcA8wb0eVHr=m03DewZ8ua6nGvToMTVDvtDQdQw4s+_5jiw@mail.gmail.com>
Subject: Re: why arm bootloader is big endian?
To: Liu Jaloo <liu.jaloo@gmail.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 May 2022 at 11:19, Liu Jaloo <liu.jaloo@gmail.com> wrote:
>
> from hw/arm/boot.c
>
> static const ARMInsnFixup bootloader[] = {
>     { 0xe28fe004 }, /* add     lr, pc, #4 */
>      ...
> }
>
> $ rasm2 -a arm -d -e 0xe28fe004
> add lr, pc, 4
>
> $ rasm2 --help
> -e           Use big endian instead of little endian
>
> why arm bootloader defalut is big endian?

It is not. This array is an array of 32 bit integers,
one per instruction. The code which writes it to guest
memory reads 32 bits from the array, and writes 32 bits
from the array into guest memory. It will byteswap
each word if the host and guest are different endian
(which in practice for Arm almost always means "if the
host is bigendian", so for x86 host arm guest we don't
need to swap).

rasm2 wants to disassemble a sequence of hex *bytes*,
which means that you need to specify them in the order
they appear in memory. If we've written a little-endian
32-bit value 0xe28fe004 to memory, then the bytes will
be 0x04 0xe0 0x8f 0xe2, and so you either need to
tell rasm2 '04e08fe2' or else cheat and use the -e
option (which will work as long as the insn really is
32 bits, ie you're not dealing with Thumb insns.)

-- PMM

