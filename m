Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1432E504
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 16:44:28 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58617 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL7W8-0001Fs-4l
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 10:44:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48451)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL7V9-0000tE-U0
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:43:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL7V8-0008MQ-Qz
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:43:27 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33147)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hL7V7-0008DQ-2G
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:43:26 -0400
Received: by mail-ot1-x341.google.com with SMTP id s11so4502833otp.0
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 07:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DFIJe8okj5jTgfUUyxnm6Ek5eIOppwKEa4ZITVL+KpI=;
	b=aNtOy65GB3GB1aav0KSA5UT8jk1v98+FqdYoCxixiNdukl9+EStUI45/upfZdsjda9
	EJxDGa+itPSA9kUZEOxOUOR6g0d0WM2gWm+1ANBV1OZqxJfSlg50PC0QEDorzGhPpNMf
	gipj/BiZGPGiR4HuACHSrKoih6oUxK1yMqyixzob3V5x8yGlQE2fOG4+cFSgRvC57ENB
	rFIlOn9MBYKIPpsiY2w99rP9nmBEprdKq+KhF1xthxbh9jrVQRspqLCOWgvgVON0y0nm
	x+F5p73Uireh94Y9kB9pdTXYw6N9UOLjY2svStPI3BKImvcx3SJFfThI9oaAW2TzwS/t
	SeNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DFIJe8okj5jTgfUUyxnm6Ek5eIOppwKEa4ZITVL+KpI=;
	b=YzkIEljW2rBOPBSfxHRmSbW85n1RwZRI7k8jn2uShCx8svfO/WYj7kH1YcOodH9RJF
	vrRumThMacQgZ2MaJih+oyPYri1GIEPhMj22cH/QU0Kl2l4qiJmz/l68OoUeL3YatoZD
	Hry3100s/HUxKNBLGKCvGe96wkO1x94eJRZBh6GNBfviHnNO/CI20tIAFK0TmUnqcp0s
	FWGAQTARI62Ukikh2P5B19B/FpMbhQzaUFmBXkU1CgHcOO87ZG9cBvGWT8j/qtBoRlDm
	UqxhigZOSUisYCXzyJ538N1uuFd56Sazo4q2spry42r8ZMJG4OwaF+lfxU2sBn2gBWiI
	imdQ==
X-Gm-Message-State: APjAAAUnkXFoPSG//nTMzBQKvl0GPZ3+FQHuGcWu1Ke/W+2qj/Wcuwhq
	zDgmIQaqj7GD0MB7T8NVWmrJkqF8gKV29kFIU4zku3ioTTM=
X-Google-Smtp-Source: APXvYqyXzj3k6KMLe4VBSPbS0cvoRyp0Tmk9U7Co4hxO8g+2UnRiLVvGjkcopg17gU9JGqXTt0DpX86PAuz+4YePwNo=
X-Received: by 2002:a9d:57c4:: with SMTP id q4mr4240282oti.151.1556549002178; 
	Mon, 29 Apr 2019 07:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190328230404.12909-1-richard.henderson@linaro.org>
	<20190328230404.12909-32-richard.henderson@linaro.org>
In-Reply-To: <20190328230404.12909-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Apr 2019 15:43:11 +0100
Message-ID: <CAFEAcA9nWq44C=m3exNJBO-YpheGRdzzAL529uCaFtUNGCWGkQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH for-4.1 v2 31/36] cpu: Introduce
 CPUNegativeOffsetState
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

On Thu, 28 Mar 2019 at 23:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Nothing in there so far, but all of the plumbing done
> within the target ArchCPU state.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +/*
> + * This structure must be placed in ArchCPU immedately
> + * before CPUArchState, as a field named "neg".
> + */
> +typedef struct CPUNegativeOffsetState {
> +    /* Empty */
> +} CPUNegativeOffsetState;

It would be nice if we could do a compile-time assert that
 offsetof(CPUArchState, neg) + sizeof(CPUNegativeOffsetState)
  == offsetof(CPUArchState, env)

but I guess the possibility of within-struct padding
between the two structs makes that dubious. Or does our
generated code rely on there being no padding between neg
and env anyway ?

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

