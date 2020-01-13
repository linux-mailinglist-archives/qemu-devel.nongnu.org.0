Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2099D138E3C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 10:52:20 +0100 (CET)
Received: from localhost ([::1]:47996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iqwOR-0006eE-7E
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 04:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39438)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iqwMy-0005pv-4b
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 04:50:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iqwMt-0007MV-29
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 04:50:47 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:38489)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iqwMs-0007Le-SX
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 04:50:43 -0500
Received: by mail-ot1-x32e.google.com with SMTP id z9so6250062oth.5
 for <qemu-devel@nongnu.org>; Mon, 13 Jan 2020 01:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q5U+hGStM50y23a8dqGPVPcluA+HCdHYa5Ji7WepJWo=;
 b=MSQbbisxPCm0nayzjmQ0u/ERBDBA4QCEvc5qYyR3QE34P/97/SXFD9eA7r7/FTcSmY
 FuwUVDdDEqSGXNcM4QuGxrVIEJL0l8N37ab/X41aMLQaCCbnl+zXFR+r2btR6L3FsybG
 +u2T/nGmUN5I3KtI3j+5Q4+DxJXRgSYSNTSvahkMRViGP57qaU5QUrba61/YWlYFoSN7
 j/k6qFB2uJDv3/uKVu+J1IFKEuWY3g3zXD6m73lx1SGPtNiUI4ZLEbeHyykGhhCARQEF
 Yze5ZRVxOcX/vkZDCdtu0Muvc+n+C0YpdBrPqqgbj/iSWvBjZn43D5ZF/o0JlAxkGwQW
 hUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q5U+hGStM50y23a8dqGPVPcluA+HCdHYa5Ji7WepJWo=;
 b=plXPmbzfcuPR6r8caNje6zwDwuWLl4RmGI00OOrWNjIhrikbymTaWochBAsLH7TPgG
 5B19v+4CWVkcByf3abVdW17fZuaO3MoZ6dxrZSLfbt/BM4S51Ofa/C15q3HpqJFtcobC
 hA3sqbmEeNdwbYC6SpGr2byzbwxZOmoPmagTye06x55jSyB396N9xHNbiOKKo9EHc2rE
 qJycvUkaScaYKjEuX11RIvauTcHvOUGXeSlBeUBje/3UsUfwndehZGcK9wyk6kFSB5lR
 S3fk2ANsXVGKGUNMhr5L+AJ0S5Z/rB7MuhZO0mOp+O+Mr503C/pLEb+MjBP7ewzKt0HG
 w+yg==
X-Gm-Message-State: APjAAAXY9GJNAGsrbCyOBvKNwRj15g9jgy2jPNRvlfKqpq9KRRo21os7
 hbDTwU1TloM/30rMdkPYzQsHmV3DSIR+iSc/L2lDaw==
X-Google-Smtp-Source: APXvYqyUJr8czHPFzxY4FytHD2dGo5MXfWZjfdSB0EyLJXZ9ZyEyTL776mWx3nyIH/Vkac59LV7KWdS0I36XdS+L7cs=
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr11468680otq.97.1578909041702; 
 Mon, 13 Jan 2020 01:50:41 -0800 (PST)
MIME-Version: 1.0
References: <1578486775-52247-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1578486775-52247-1-git-send-email-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jan 2020 09:50:30 +0000
Message-ID: <CAFEAcA9FROjJ=x5ZCkPdLeDsDFxyWmhN_qQJfM=dLmqtrN5TTA@mail.gmail.com>
Subject: Re: [PULL 00/38] Misc patches for 2020-01-08
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32e
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 8 Jan 2020 at 12:37, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit c4d1069c2563f70a5271af6e9e000add64e593be:
>
>   Merge remote-tracking branch 'remotes/elmarco/tags/dbus-vmstate7-pull-request' into staging (2020-01-06 18:22:42 +0000)
>
> are available in the git repository at:
>
>
>   git://github.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 083b266f69f36195aef22cb224f86b99ca0d6feb:
>
>   chardev: Use QEMUChrEvent enum in IOEventHandler typedef (2020-01-08 11:15:35 +0100)
>
> ----------------------------------------------------------------
> * Compat machines fix (Denis)
> * Command line parsing fixes (Michal, Peter, Xiaoyao)
> * Cooperlake CPU model fixes (Xiaoyao)
> * i386 gdb fix (mkdolata)
> * IOEventHandler cleanup (Philippe)
> * icount fix (Pavel)
> * RR support for random number sources (Pavel)
> * Kconfig fixes (Philippe)
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

