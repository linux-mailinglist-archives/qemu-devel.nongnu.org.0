Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 466596256D5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 10:29:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otQKa-0008Gz-A0; Fri, 11 Nov 2022 04:28:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1otQKY-0008G0-Jy
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 04:28:10 -0500
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1otQKX-0001hT-78
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 04:28:10 -0500
Received: by mail-qt1-x832.google.com with SMTP id h21so2417682qtu.2
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 01:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k0YT2Sh5zr65bAcFk2TlvGXo4PYG3zf10Qn1sRihd6c=;
 b=FgbyGqwwolPH+T/st7aSRRfsJbuUuFrJctLYv1dy6MvxF33LEwXEp/DWL25pae1Wjk
 lRFSJOgbzVqBEsU2YjPjI712DoTr3BLpf5bRkPILdS6ukthiRJeW8dUrD4T5WE1IOPXI
 GqYu1qmtlSiZk56F4E9Vkmj0wSYMvY0bpLzncn3vcKwNr5H9tHh/GRMA/qRtzdrRX36H
 +7QK7Eoc9mInvW76F3N32WAFH6ORewS0FeTtG4ym9QXOJUjNE3rudcvQfyA1mAhQCCUr
 xxRj1XmFwOvEj4VXyv4YROo702H5XDQWoQskVLuOuhpvE99QLDG5z1dqTM0UHq8qxBOO
 jedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k0YT2Sh5zr65bAcFk2TlvGXo4PYG3zf10Qn1sRihd6c=;
 b=m5pWd3AdkURxQm6+o/xnR6wnWt4Nx36M0prbbikkcGerQwTmzypgQrxKkyu0X1el3x
 yLA/hdIfa8SMycBNWfxPA+lfUsz83gdgz4gMTAC5HxXX+09QrmFdWoilpF5QnTmhvhzp
 1fqVZKP259+yn6lvLNbzcWusoXq+/2hf9RJoCpa+4LByqvHTCp1j2pFV4MdTicCUrUVe
 9lhNzRw1bxM+znggP5ZAHr8ggr00uhcfVg8kcgsukfrsjma8R5J6zCSlh1KTdexmDYB9
 nOEFpMn6q1cCWZSzqyc7aPpMYG/ggKb1G3rPD2he714xbyTdzsXCnJYyYkthU6CmGVQp
 E1Ug==
X-Gm-Message-State: ANoB5plQikC2QcK0KyKhNjGTObasYnMsL7vPCaBit/4qojdAWXBelFGU
 /4v2W7Yeu0zUvy3KsbV/iY2cRqwZZU7xsLO22xI=
X-Google-Smtp-Source: AA0mqf6WsOqH+TlOgR2W3TpkrRmT60/+DI1+60ilmKblyYrIIkjw7qz4tnX8K/puXAeXUaG9jtDXuDjZQLLsVodpXoY=
X-Received: by 2002:ac8:4747:0:b0:38a:e1e0:18a6 with SMTP id
 k7-20020ac84747000000b0038ae1e018a6mr535432qtp.365.1668158885673; Fri, 11 Nov
 2022 01:28:05 -0800 (PST)
MIME-Version: 1.0
References: <20221111042225.1115931-1-bin.meng@windriver.com>
 <20221111042225.1115931-5-bin.meng@windriver.com>
 <Y24QzpMDpcLnAsPH@redhat.com>
In-Reply-To: <Y24QzpMDpcLnAsPH@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 11 Nov 2022 17:23:58 +0800
Message-ID: <CAEUhbmXpeiEGuVXJUStCyOr5otYuGvifN9iFJjnh-GgHx9G6pA@mail.gmail.com>
Subject: Re: [PATCH v2 04/19] osdep.h: Introduce a QEMU file descriptor type
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x832.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Daniel,

On Fri, Nov 11, 2022 at 5:08 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Fri, Nov 11, 2022 at 12:22:10PM +0800, Bin Meng wrote:
> > Introduce a new QemuFd_t type to represent a file descriptor for
> > different platforms. On POSIX platforms, this is a file descriptor
> > On Windows, this is a file handle.
>
> Can we not use  _open_osfhandle() to obtain a C runtime
> file descriptor from the Windows HANDLE.  We do this in
> QEMU's socket code, so we don't have to work wit different
> types and APIs on Windows, and I think that's much nicer
> in general.
>

I am sorry I don't understand your suggestion. I checked
qemu-sockets.c and did not see how sockets connect to this change.

This change is required to make 9pfs Windows support much easier.

Regards,
Bin

