Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CD15311B0
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 17:47:55 +0200 (CEST)
Received: from localhost ([::1]:52638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntAHi-0000XJ-Oi
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 11:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ntAES-0004xO-C4
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:44:32 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:40538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ntAEQ-0006wL-Jd
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:44:32 -0400
Received: by mail-yb1-xb29.google.com with SMTP id z7so4860385ybf.7
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 08:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FqOr8ZVJa9lqYyIwxwYspqIEoDCp8zcSCeOOhUH62lc=;
 b=lKNd2Lo0SxCAbnoZeFYrgKP4i644DJlpNf/Is+jFbZJsSgjG4LjvfZaekLFvqNwifp
 qRAJIXJX1lQ2MSwvFazfYKSQJt/HFfl2oQh9VuooP641JRMa/pUcBYGSn/pyuTrCLst+
 I6JOQ0/kZ2fNodUfsmed8fwZFBcJx2/VOPjNBgfTCmEJULz+pQDJEEnm1Kl0f4uVYxGa
 1/TY+Uq2SKo8Po2KqW1rdcj2BQf38fZin26Jf1kZZP052qpdzQnoLzYuNr4CXtbK5pDE
 C1WQ6vDbJPiTzZk3jBbREaI4XXyTp2MX+u//T9bEsy0EpKAPjWXiIL3arlxeggfuCI8x
 uNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FqOr8ZVJa9lqYyIwxwYspqIEoDCp8zcSCeOOhUH62lc=;
 b=0b5j0dBEFMTSxYJk0DJvbvPNoA21Z9dvEEtvMoHPTFVXGe1d5/St/gGfMeLuUxaHDO
 kvGNtUrL1lS7XmvSbnJwJWLEIo22ritqN1b8X+UHxhRJQGfePttklPKDBwn+GfK+xyBT
 yXtaIw1yg7JS6O/QIkRKEKNR7UrZVPOVnW/dYrBqhVxpS4qyxa4Dq01SNZIxevnaGquN
 21LeoM85Or9ESQqAl8+jScdggeRBcpVijLwQwVjoJ0vbECtrVznPZxem1eYIddouojJ+
 +licHfCPFvXquMDc3OV63uJHX8bYoEfQ2A5BZhGaaHSM3fCvXYePsHDS4NGl4sZMTdyJ
 koww==
X-Gm-Message-State: AOAM531b/U6bE28qegXZXRzGopWeI2IHJ4knRDjGGaaff5XnPv7A3KnW
 2npEHcPoljlaMCe6E0DHljdvisDDQ2BHNVXYuxmfNA==
X-Google-Smtp-Source: ABdhPJzku/Pz6sYtIE+11eMyMlrwXmcQBxxU/pkNQKMZfXNcQP6Cq7PK1bsHzY9P1huYinA6XaDYVgpaq5X4qHFRQjM=
X-Received: by 2002:a05:6902:1021:b0:64f:51d0:f421 with SMTP id
 x1-20020a056902102100b0064f51d0f421mr17878763ybt.39.1653320669577; Mon, 23
 May 2022 08:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-10-richard.henderson@linaro.org>
 <CAFEAcA9x+xCFkLQX8wMnTr4JfFLN0nOnLan6y-Qt-tmzRe5mpA@mail.gmail.com>
 <840c75f7-069b-9c53-37ca-399489989758@linaro.org>
In-Reply-To: <840c75f7-069b-9c53-37ca-399489989758@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 16:44:18 +0100
Message-ID: <CAFEAcA9zt_sLhvFA0h2ySjJSJu7R=Gp8nYYT=0Onn7RknTORbQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/49] semihosting: Adjust error checking in
 common_semi_cb
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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

On Mon, 23 May 2022 at 16:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 5/23/22 05:13, Peter Maydell wrote:
> > The gdb implementation of the isatty call returns 0 or 1 on
> > success, and -1 on failure (though the only failure mode it has
> > is "you messed up the protocol packet format"):
> > https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=gdb/remote-fileio.c;h=fe191fb6069a53a3844656a81e77069afa781946;hb=HEAD#l1039
>
> Technically, isatty = 0 is failure not success and should also set ENOTTY.

There are multiple different APIs here with similar names but
not necessarily always the exact same behaviour in all cases:

Arm semihosting SYS_ISTTY:
https://github.com/ARM-software/abi-aa/blob/main/semihosting/semihosting.rst#sys-istty-0x09
 returns 1 if the handle identifies an interactive device.
         0 if the handle identifies a file.
         A value other than 1 or 0 if an error occurs
         (and implicitly sets errno, I assume)

GDB File-I/O isatty:
https://sourceware.org/gdb/onlinedocs/gdb/isatty.html#isatty
  Returns 1 if fd refers to the GDB console, 0 otherwise
Documentation doesn't say how it reports errors. Actual implementation
returns -1 and sets errno. (We should probably report some of these
spec issues as gdb bugs...)

isatty() POSIX function:
 returns 1 for a terminal
         0 with errno ENOTTY for not-a-terminal
         0 with some other errno for error cases

It looks like our 'host' implementation of the semihosting SYS_ISTTY
doesn't correctly do the matching up between the semihosting spec
and the isatty() function, so it will return the wrong value for
the error case.

thanks
-- PMM

