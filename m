Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 515CD394C87
	for <lists+qemu-devel@lfdr.de>; Sat, 29 May 2021 16:33:37 +0200 (CEST)
Received: from localhost ([::1]:51056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ln01v-0008Bw-Vx
	for lists+qemu-devel@lfdr.de; Sat, 29 May 2021 10:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1ln00C-0007Gl-Fe
 for qemu-devel@nongnu.org; Sat, 29 May 2021 10:31:48 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:36576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1ln00A-0006Pn-Uh
 for qemu-devel@nongnu.org; Sat, 29 May 2021 10:31:48 -0400
Received: by mail-qk1-x729.google.com with SMTP id c20so7034238qkm.3
 for <qemu-devel@nongnu.org>; Sat, 29 May 2021 07:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=dtiZszvKTwUmNRCoiNxQj/JeCWSIF/tHzgGQ5dYfiEM=;
 b=tQ7rDBR0Igt2X3XIxxrH7rNQCAQvNTvZzjRhOg+IDqImAHweJ5WOiFMapU+ic15Lr1
 /zp7bv3zVH89OFwafplsr1keXUSZmgLTckQORtME2Xjuy894zsAU/t/xV+W/w+x0qqZ4
 zCbAxIKc+0aCgYR+ZO5Cju6F7xrWwhXbyLsbSHaGSk2R0OVPIMTR3PqEC8jZirmmju2m
 7vYlmME/dxDx+SHh3+B+J4wGg+NbJltA7+UtHa6rVFO7rKXntrPvHzVw6XEhbJCcjKTO
 pQiZWx+hRZDcN2URaA3xD5ltAXiRLyQWkUwned052LnKdvkGI1ntu+1W55kVDttS22+O
 jJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=dtiZszvKTwUmNRCoiNxQj/JeCWSIF/tHzgGQ5dYfiEM=;
 b=TJ0TYGceXGflE+JfCbEpA1mlJYEzKviA34RLlX3xvg0A/346MD2ca5bXUqwF7p3L+A
 3VCPkbsMBQn1YROehtHtRhu9hFVkZ+3HJOuyJAoKJ7C+4QtJl0B38NweNFnE9Gd0OU5b
 JL8A8ph09atbzr3pBlExJ3NuTFQoA8A64WAk1Rl+Kf2Xfa+5vfF5HkcMNL25ZlgIaPQP
 uqBHcXvzI1t1l4kK8kpPwbtAvu1lZNDBjVMFSCn+nWdFvMbJh0pLqjECgFlPjM3LMnlS
 WrZukj02ZhCstjhKaglbHsq4nN5ys8xfapVeqihxnwiWf7e0kJ4sqHtSRzkyv3mQ6XD2
 G9KQ==
X-Gm-Message-State: AOAM5318Mwcu4xDPCbkfO1JYCO7PoSqj7UGiJbjypVsGx8Qyurik0djG
 2mkbUeu96bdoo3C23DDbvFe22C61K3o=
X-Google-Smtp-Source: ABdhPJzgfFzZ1Z+8aEnX8DdUPpRHW9VQVA2GKgVvihP5/40QthkFLhmeNT4TItjrWdhNZV3awE5cyQ==
X-Received: by 2002:a05:620a:158a:: with SMTP id
 d10mr8456556qkk.268.1622298704285; 
 Sat, 29 May 2021 07:31:44 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id m10sm5456996qkk.113.2021.05.29.07.31.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 29 May 2021 07:31:43 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Windows 7 fails to boot with patch 7eff2e7c
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <C9E71465-DF65-4BCD-9989-E89968FF5E87@gmail.com>
Date: Sat, 29 May 2021 10:31:42 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <8266A9DE-A6BD-4E04-8187-8EE63E7D70DE@gmail.com>
References: <C9E71465-DF65-4BCD-9989-E89968FF5E87@gmail.com>
To: QEMU devel list <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x729.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If you have any patches you would like me to test out please send them =
to me. Thank you.

> On May 27, 2021, at 11:13 AM, Programmingkid =
<programmingkidx@gmail.com> wrote:
>=20
> I have noticed that Windows 7 has stopped being able to boot recently. =
After doing some bisecting I found out it was this patch that is causing =
this issue:
>=20
> 7eff2e7c652304157f503f2d406193bb9de10d58 is the first bad commit
> commit 7eff2e7c652304157f503f2d406193bb9de10d58
> Author: Richard Henderson <richard.henderson@linaro.org>
> Date:   Fri May 14 10:13:31 2021 -0500
>=20
>    target/i386: Cleanup read_crN, write_crN, lmsw
>=20
>    Pull the svm intercept check into the translator.
>    Pull the entire implementation of lmsw into the translator.
>    Push the check for CR8LEG into the regno validation switch.
>    Unify the gen_io_start check between read/write.
>=20


