Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED07D3346C6
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 19:33:09 +0100 (CET)
Received: from localhost ([::1]:52866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK3ds-0005JI-LC
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 13:33:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK3bU-0004mv-3x
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 13:30:40 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:35881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK3bR-0002kP-Ja
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 13:30:39 -0500
Received: by mail-ed1-x529.google.com with SMTP id l12so29616086edt.3
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 10:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=dgT924STmCtbac0RrU1vSECs+ABRYe1cvyiQaIMcPRI=;
 b=KtyyG67lynkxz/CZVnDv3N6ntvLSWP7PCAzNwPANZmiZSmoGCwiXnsPrVA4XfBAdCg
 +Q8l1dpx0miEtjXi0/FT5ink6nsk39u6lPwiuwXGenukuxlb6rxwUKn0vxs3jQrK6hbi
 IJGMmga3AgbCNO6PcbirHp2oo6e73Q+x+VL+acpIMprLR2U0nuo3XBsC7hMxDzXBPNaR
 yYRbdi7IbJyAxHI3icIuB0jYSOoGV9rr+p6dacsyfNaVVh6mdSzzrN0atRDFVwRp+G5C
 DguQzSyI0L829g1g/9eZAMOKenOS84QBwV5AzaxTLQw2eHTLVCmGj/Wm0xoyok+n3E63
 UqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=dgT924STmCtbac0RrU1vSECs+ABRYe1cvyiQaIMcPRI=;
 b=FGGKi/vONjHxgdpiVFhOCgqg0PtSZn4sWElHVwuejGoudtKGKVdfR7r4JpbVErhC18
 tJ/V19yVzX9PvBzkxX4QdoieYSwTNt3y40c+5IQknAHpVN6KuXIzt/eAq+u1oR+LKKP/
 hLEkucr6viZJZywV41Zpj/ZicS9SJULCAbwQ9ediey6mZlu5yOQ3WMJVkCxcJaJnqhDq
 XSidniypdYaoq5wq/8XCG7hESQEE8QRt8qw3TcAHfSKEi4qYozDfZV/GIcRXR/s7Ke6e
 1LtKwr0eZyE1dzMTveqDOnEq9nHmCJxjIbYM+2UtnVncjGucjNHCSwWfu5ixdcbrXVXU
 93VA==
X-Gm-Message-State: AOAM530/07K19Hu2xwipoffFbC8AfRZdNzS1dzBN9x/0UHr/xFfh4eFB
 r55LiRvplE1wszJWR/scCxCESn60ukaW+g==
X-Google-Smtp-Source: ABdhPJxLolowda5hqDLZX8co44XLwiH3VCBsVRJE1QGQC/nKPPFvSY9UggwkeKOF1FmGmBH6xT0KTg==
X-Received: by 2002:aa7:c0c7:: with SMTP id j7mr4810337edp.298.1615401034690; 
 Wed, 10 Mar 2021 10:30:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id bx24sm139872ejc.88.2021.03.10.10.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 10:30:33 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BE6541FF7E;
 Wed, 10 Mar 2021 18:30:32 +0000 (GMT)
References: <20200812115816.4454-1-matthias@weckbecker.name>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Matthias Weckbecker <matthias@weckbecker.name>
Subject: Re: [PATCH] plugins: new syscalls plugin
Date: Wed, 10 Mar 2021 18:26:53 +0000
In-reply-to: <20200812115816.4454-1-matthias@weckbecker.name>
Message-ID: <87sg527tfb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Matthias Weckbecker <matthias@weckbecker.name> writes:

> This commit adds a new syscalls plugin that displays the syscalls
> as they are executed and returned. This plugin outputs the number
> of the syscall as well as the syscall return value.
>
> Works in *-user only.
>
> Essentially, this commit restores:
>
>   https://lists.gnu.org/archive/html/qemu-devel/2018-06/msg00846.html
>
> by using the new QEMU plugin API.

Sorry I missed this last year, I've queued to plugins/next. That said in
it's current form you basically replicate what you already have with
-strace:

  ./qemu-aarch64 -strace -d plugin -plugin ./tests/plugin/libsyscall.so ./t=
ests/tcg/aarch64-linux-user/testthread
  syscall #214
  13165 brk(NULL) =3D 0x000000000049a000
  syscall #214 returned -> 4825088
  syscall #214
  13165 brk(0x000000000049af90) =3D 0x000000000049af90
  syscall #214 returned -> 4829072
  syscall #160
  13165 uname(0x5500800498) =3D 0
  syscall #160 returned -> 0
  syscall #96
  13165 set_tid_address(4825296,0,4294967293,4826880,4825088,253) =3D 13165
  syscall #96 returned -> 13165

So it would be nice to make the default maybe do something more useful
(like emulate strace -C output). You could certainly keep the verbose
output controlled by a flag.

Still as it is it at least ensures we exercise the code ;-)

--=20
Alex Benn=C3=A9e

