Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D074B3FA
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Apr 2019 18:43:24 +0200 (CEST)
Received: from localhost ([127.0.0.1]:34124 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hKQQ7-0005RZ-KS
	for lists+qemu-devel@lfdr.de; Sat, 27 Apr 2019 12:43:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1hKQKw-0001Ae-7h
	for qemu-devel@nongnu.org; Sat, 27 Apr 2019 12:38:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1hKQAX-00057R-8F
	for qemu-devel@nongnu.org; Sat, 27 Apr 2019 12:27:17 -0400
Received: from mail-yw1-f50.google.com ([209.85.161.50]:39213)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1hKQAV-0004ye-5b; Sat, 27 Apr 2019 12:27:15 -0400
Received: by mail-yw1-f50.google.com with SMTP id x204so2270796ywg.6;
	Sat, 27 Apr 2019 09:27:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=uqoxPsgFwcAEy1xyP9m8aUmcsILjiHBcVsasaxC7RrY=;
	b=NYo4QQ0CpsQKKjB9a6Tvp3c/8ciL9eYFiYFD0btKLCjFoUV7qMENmMle8FNngw7zAj
	qipCmMq+3UTAjAkY60+Gdb/CuSFy9Dri9ZS6yBxprx2SNXTNzi1+97UkMcXZaBJkuOYc
	r2Tn/mjgUAQ7Z9JAbc3zeae61LuOX67xfoKfLYnhMUz2VWplTEUXE2XBb56357SAnqxm
	E1uMHFLn8uQB0snVsxaFGeZ6YzrTQ9pAG3Hh14Sni5V0whYfgAWsScdNDMqUbRISgDbi
	Wxw0deAF3f6O+tt3s24fu4fnHQ1b00xpIfkZ5oYZVqh81wRj855WunxooHGs4VmmZJta
	PPZg==
X-Gm-Message-State: APjAAAXgp2zWjGgQiTfN3DfK4HTpCrLzgkir07sSqytPunyqm97bJBnr
	FiRUUcAFdl+kFhpgTf/KzPkxVMW2AqQCyqR52o0ZavDr
X-Google-Smtp-Source: APXvYqzBKZNoT3lk/JLlaxpyFByjBjqZI7zgCFTikVv3EDy+ZgIp3r8pjJpwHa3AlDjgvR8pO9+/tvbO+DaKAtIIaTQ=
X-Received: by 2002:a0d:d547:: with SMTP id x68mr30755670ywd.356.1556382431231;
	Sat, 27 Apr 2019 09:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190427162429.3617-1-f4bug@amsat.org>
In-Reply-To: <20190427162429.3617-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sat, 27 Apr 2019 18:27:00 +0200
Message-ID: <CAAdtpL5=iiuD4ifCzs_kRE3LTq_u11z2J9qa=K8TpOHvxdBy+A@mail.gmail.com>
To: QEMU Trivial <qemu-trivial@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.161.50
Subject: Re: [Qemu-devel] [PATCH] hw/sparc/leon3: Allow load of uImage
 firmwares
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Fabien Chouteau <chouteau@adacore.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Apr 27, 2019 at 6:24 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Grrr sent from wrong computer.

