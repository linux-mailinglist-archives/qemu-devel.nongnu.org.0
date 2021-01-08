Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26C42EF1B1
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 12:56:44 +0100 (CET)
Received: from localhost ([::1]:36722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxqNn-0005VP-Ez
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 06:56:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxqMK-0004uO-50
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 06:55:12 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:35349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxqMI-0004mn-8n
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 06:55:11 -0500
Received: by mail-ed1-x534.google.com with SMTP id u19so10971968edx.2
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 03:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TT5sj4iaJu43b/QUazBJnf2Em/sDqdQRPcN8vEMLGlQ=;
 b=rOMcP/FDfddJ59bQmtIUlvjeCooqpYpQiXi+F9rkYjJb0e3/5guxuBDdpS1aG3OS3f
 4rGQmIvAtvwTaVYaQ2AQm50pCldwNB3xUfHiemBZmgfl6rTxRWNWFxyfF6eeaiVrkuZI
 QHkMnKzc36bzydvsVoOun79GNo/EFyFNi+yqJpjAyYKXpvMUguJxDeDIZiHbgVzFc+gX
 JWtg5fM0lJo+q7PccuRnnjAyIWdj1D+kcfDDt6/LaZxDD6Nv8u7PfgMOwGex0DRJ3w3B
 mrjb6zm3VabCFhwTFqPF2s7ydaWR+IaXKvb8F4N8Rt/8JPsN001DCFBXS1wj6PMGe0DX
 l9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TT5sj4iaJu43b/QUazBJnf2Em/sDqdQRPcN8vEMLGlQ=;
 b=Gd+OrSEzv9TeA0cWkTtNAUhbFUzMyUNtfgCya2uyvbde4tBhlQWLufvLpiyqvbjVE3
 R2rRwNZJYYVtVzPHjhdA1e8dUNF/i8syMN7ZKhPhJxjhc/0rAgoveF2eK8b6Ez/GDpht
 qiFC8eh+SYG35cCj8R2JISxBDAHkmySbSMCQ1zYtqNsmra84WpDcvW06lcuzAQtt0pFs
 fdzgdDd5rgtxwtLqltwLH0+ybVthKminyU4xlRu571Njd+fOvQzxnr04sBNr3IQx9oOq
 jFNFF5KyLDVnU9QEQJ5JPlCZrlDOPwenISdiR/BOn9bfeteOvgdgIhpFgsugVDPFKhC1
 oQQg==
X-Gm-Message-State: AOAM532qeoKAcxe7XdC5T1NDJzFXwESl2hMdSTs3KVq6TOlvn9zdGNsW
 GwxJJYs6CWI3itxATrTDDDu4XpepMb+GtVZuk3nU8A==
X-Google-Smtp-Source: ABdhPJyckDc+/6Etn43fiZ1uuKRn9BA9d8GkrLLZ6s1Q5Flec1t+BGz2awu6YoKhKr7qMj04u6ErSWGkmPsfbPWb7u0=
X-Received: by 2002:a50:fd18:: with SMTP id i24mr5140256eds.146.1610106908338; 
 Fri, 08 Jan 2021 03:55:08 -0800 (PST)
MIME-Version: 1.0
References: <20210107222253.20382-1-f4bug@amsat.org>
 <CAFEAcA-6SD7304G=tXUYWZMYekZ=+ZXaMc26faTNnHFxw9MWqg@mail.gmail.com>
 <CAAdtpL7CKT3gG8VCP4K1COjfqbG+pP_p_LG5Py8rmjUJH4foMg@mail.gmail.com>
In-Reply-To: <CAAdtpL7CKT3gG8VCP4K1COjfqbG+pP_p_LG5Py8rmjUJH4foMg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 11:54:57 +0000
Message-ID: <CAFEAcA_Sx3b3ppxUdnuUSkc-xJmGhp8WZ57jN6tDziwRNxQ-MQ@mail.gmail.com>
Subject: Re: [PULL 00/66] MIPS patches for 2021-01-07
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 kvm-devel <kvm@vger.kernel.org>, Paul Burton <paulburton@kernel.org>,
 Libvirt <libvir-list@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Jan 2021 at 11:28, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> Le ven. 8 janv. 2021 11:35, Peter Maydell <peter.maydell@linaro.org> a =
=C3=A9crit :
>> Looks like decodetree fails to cope with non-ASCII characters in
>> its input file -- probably this depends on the host locale settings:
>> I think these hosts run in the 'C' locale.
>
>
> Can you provide more information on your host so we can cover it in Gitla=
b-CI?

It's just the windows crossbuilds on x86-64 Linux, and also the
aarch32-on-aarch64 chroot. I'm pretty sure that the only relevant
detail here is going to be the host LANG/etc environment variable
settings when 'make' is run, though.

thanks
-- PMM

