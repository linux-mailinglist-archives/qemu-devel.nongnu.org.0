Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2080E4C0
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 16:28:25 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58411 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL7Ga-0000kd-Vm
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 10:28:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL7Eu-0008Ex-IZ
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:26:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL7Et-00054N-5B
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:26:40 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33018)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hL7Es-000503-Vr
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:26:39 -0400
Received: by mail-ot1-x341.google.com with SMTP id s11so4445509otp.0
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 07:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tuzXliXF5E6nhNadl2R8+1YInp7+QPibzGkdQfp1iz0=;
	b=oeAPVitJT9ZN+Rb3yg9klavpcTcQyIBWI3yjgd1JPBUjsb7wRp1lWjjuJvmdjt4WH+
	K4ktNSXHqILHzRyE83U4XE2xIueTWSNuAyiFaKatf0yF4qqlxw6FYoV0GBYbEqzET8UM
	erTM7U+JeKOnZzLkdV9tSa/FW4c5zwNh9kHXtskwGj8iJLRQL47e7YqM3+G8AX0ZB//l
	jWevuoMWa9rupRsylMvtqgmttnjTXzdbJcaiXB8ORoDyF5jaANI5e5xnOYvGU9rFadLL
	Bh4RXoK9Vj+OZpXQcC1d80ZFSbmtYFCQP7TiGU9017pBVNEjWsc1ZTKmOvmaOK68hjPl
	ycKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tuzXliXF5E6nhNadl2R8+1YInp7+QPibzGkdQfp1iz0=;
	b=WjwXtkrj1vxRrDaWZDU8chAvSVMlyl+GW1DBTcAvWisPe6TPcAzybXQ4IHZ5FaodEz
	PGTv+vEqY4N1ZnIGfvDr5AfwZsYj7POqoUqnoBlv7b69JbF28geiFm0IpdDYFvgTEEUT
	cJz9k9DFSDgR3bSNNCCcfaMKxDEuwpHzB6PksPTrXxrhB1XkApaNab6SE+PO2+78KF9M
	hvFPzQR/y5bf5m6YT2Ra+aPjgj6WKpy4Q0IHW6tg/o7DxIuNde9XLoTgmGR6rW6aa2D0
	Xzo4lN9z08we6AsT8fk+5BZ19vhrqL+fmjSog4HI7xYtf+1cOvi8biSLg2IwAN/OBI7b
	GPYg==
X-Gm-Message-State: APjAAAUFvsy2xuxJv+KsM3X+f62Y/1sTs+oLg+UpR+x8UaHgkgfzx13J
	q+4RK+aaSGE2ZYj+4QAvDckvWRfnKDCxNPtgaZ7QrQ==
X-Google-Smtp-Source: APXvYqyOmnTfp1ksM9/lH7jSCG0Rqj6T/5+WGyBhPLCczOh6HfYdSLCvROLZ70uPmLz6fKE9j/o2gdVLV89ewRw1QHM=
X-Received: by 2002:a9d:61c6:: with SMTP id h6mr1375064otk.316.1556547992643; 
	Mon, 29 Apr 2019 07:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190328230404.12909-1-richard.henderson@linaro.org>
	<20190328230404.12909-28-richard.henderson@linaro.org>
In-Reply-To: <20190328230404.12909-28-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Apr 2019 15:26:21 +0100
Message-ID: <CAFEAcA-xPtMuMqJyCNPcYb=5neCw29VTfWRBzE01DFfovR0vCg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH for-4.1 v2 27/36] target/unicore32: Use
 env_cpu, env_archcpu
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Mar 2019 at 23:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

