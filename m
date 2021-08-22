Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1353F4091
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 18:49:29 +0200 (CEST)
Received: from localhost ([::1]:55964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHqf0-00023M-Ot
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 12:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mHqeD-0001NZ-JQ
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 12:48:37 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:33558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mHqeB-0008V0-8l
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 12:48:37 -0400
Received: by mail-ed1-x530.google.com with SMTP id s25so9619251edw.0
 for <qemu-devel@nongnu.org>; Sun, 22 Aug 2021 09:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kIWfSHKqVH5kY6t5p6CadCJJ+HYzZDacPfag/Xk1KcA=;
 b=b9n3bIE3Rki4V/7cRbQ0bayJsts72Qo0SiAMumEhHF3vqWDTWW8/p5CVoeSlNFl9pg
 CAtZFh1Q9RXL/x/XtwxFfi9nsNq/AjAzb/9v3D+ZEve07PFn1Kcs0twrzaNY6udlNS+U
 BVjlrOuQETKhz32LZ2+GxHAPi1Eh0ejrY2nm+6WqjBkVoU8zI3l0gHaxupeFqvVhVcth
 HRWHyxSyxSi+WrMzYAZOZ298PExdDJJ7wfBceOAYNUAw/mTUOVkg6QFzZGrATGKvaolz
 dEdhLSlomjz68fxTKg+7QDFLsKK+vqjZpdjXeVBxEn0ztUA6dxg9xkABC/TEXXYIh7gL
 wqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kIWfSHKqVH5kY6t5p6CadCJJ+HYzZDacPfag/Xk1KcA=;
 b=RUf+B30YD1GK6MbOpnXsL9A56iVE7J9TtawtVTni8lwcsXz6dxk8N726JB97t3R1wh
 59QP0httlm11j8EJIbLE/b8gpjXx21p4e5yF2X5bzDE38dD7AzqV1WZHq8UJuJ5b9v/f
 abCV6ArLUcUSlU+jWxt2qWtA3YLXLyDjuct3y1QPlfCyrnLkNmAlbKEFBKrVuG/RmWOs
 nssZ6SkpC2h2au2LJBIRg+DjIYqCp+9W14dy+UxTQ9Q/y2I85+j0gTz0yjptnIFHItGq
 vkmJ1WuA80VIphtlg3gUrC7hdaQblPkGWbsnvFkXsgGIRaeQJw7WA3WG9p1186vKEhhY
 P8qg==
X-Gm-Message-State: AOAM530+khtESh2aLHHlE7L5k9nkQbIxNnNTDgvF/KO3fxh4e3jEw/2P
 JM/zm0aDja6XIEssxUXIT8SbmYHIPBmE/vKqMxpGrQ==
X-Google-Smtp-Source: ABdhPJxWd+O9H70eTZXaWtD2Lt/SqrSIFZWPiT0UpaP8kjIqrPJI0VgSrQyjFfaG2i89RVX3s5aslOz97ES/Siz+AWo=
X-Received: by 2002:a50:ff03:: with SMTP id a3mr32685248edu.100.1629650913522; 
 Sun, 22 Aug 2021 09:48:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAM2a4uwQ0M=TmFdWaaO-E_2J06fpH1ghXhYJJKBP6s5j90ASLg@mail.gmail.com>
In-Reply-To: <CAM2a4uwQ0M=TmFdWaaO-E_2J06fpH1ghXhYJJKBP6s5j90ASLg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 22 Aug 2021 17:47:46 +0100
Message-ID: <CAFEAcA9SeTTcU_p+-KwGJPyYG7pKzSJGGb287tXYOvN13E6-iQ@mail.gmail.com>
Subject: Re: Testing a microcontroller emulation by loading the binary on
 incomplete Flash emulation
To: Gautam Bhat <mindentropy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 22 Aug 2021 at 15:37, Gautam Bhat <mindentropy@gmail.com> wrote:
>
> Hi,
>
> I am to implement a very simple microcontroller for my understanding
> of Qemu development. This microcontroller runs its code from
> programmable flash which is bit-, byte- and word addressable. To do
> some initial tests of my nascent microcontroller implementation I
> would like to load a very simple program binary. Is there a way to
> load this binary and start execution without emulating Flash
> controller and memory?

Just create a plain old RAM memory region, and then load the
guest binary into it with the 'generic loader' (which can
take an ELF file or a raw binary).

-- PMM

