Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A517B1382AC
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jan 2020 18:43:42 +0100 (CET)
Received: from localhost ([::1]:59718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iqKnV-0004A6-81
	for lists+qemu-devel@lfdr.de; Sat, 11 Jan 2020 12:43:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59393)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jcmvbkbc@gmail.com>) id 1iqKmi-0003M0-9T
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 12:42:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jcmvbkbc@gmail.com>) id 1iqKmh-0002WB-4l
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 12:42:52 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:42410)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jcmvbkbc@gmail.com>) id 1iqKmg-0002Rw-VA
 for qemu-devel@nongnu.org; Sat, 11 Jan 2020 12:42:51 -0500
Received: by mail-pf1-x443.google.com with SMTP id 4so2729181pfz.9
 for <qemu-devel@nongnu.org>; Sat, 11 Jan 2020 09:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NpkFZHwIJlVA27pe3Ix0uPTjKZbGtnzZ86JXk+3hoa0=;
 b=WIkQrPJrKgjFl1jHbeKVNtImQN+RVw/+b668pJECAXYZHV4b8h19eN/pe+h1qktw2G
 hvg/KHQbi1XkGT5IlwPRKEPrw89F06F3tkJ1CjRMKKnmOC3MP2Dp8eNmowsXWTa2Q1EP
 03vODuk5mxieh8TVHGLVZvsGp6qzxFzVC+sDy8MoJW9NV7aHy9ETh2nIRVczWnqKBDsg
 kaKBrOMEvzX3fUwnVxTyLNvmr+stnNAZH+CS767K0Nr37CHimKF9GP/uGSGDkxD73lae
 rSYIiZYrdq+yvuAR59vG7xiRGYGKIqgxds4vTJiuwceeho+zTqPDaNxUKhKuVUSr/Iay
 1cRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NpkFZHwIJlVA27pe3Ix0uPTjKZbGtnzZ86JXk+3hoa0=;
 b=FFgllTUZJLn66QeLDkyLamrZPwDl9InaytLddGNbpizjbFfAWy5kM7cRWyzap9BfpM
 uB4+qlpNo2sundeSrRBjop/M8rA6PygIwNKtRL7k7xX0+2yjk8cKM8jceNmu9nLoMCf5
 2tp6EbIRBQMtmV4/kFkjTFywkMyWmp3bw+L5HvnJTYN1ib8T8yIGEtLWl2kDJ0MU1fEA
 V3TlxNGOt7YtWonGQmHdAgPduTVffSBgUngdePofroAm4FiWJXZekZiryF9JFW4e4K+2
 wHwfUnxg/q5Tt9ebLdbjyhzB+wcPwlpfV/q/fq7U9Iq0yCnadaQiBcELekaYF8Jwa6wq
 Aqyg==
X-Gm-Message-State: APjAAAXukC11kPJeRAB2z4YLjWdApeqDItAVp5N/BTSFg7xqSkGRNFFf
 HZiY9YIpk5gu9Jh60aqT25KP8g6QDnYjIiHXlWM=
X-Google-Smtp-Source: APXvYqzaVmkLeT0z3HEkf+INbiYZ1jsESA/DHeEOtH3YIxy5sP+8X/xShECXoi0uqBv3iZDNOkCG70HApCkulvaYxlI=
X-Received: by 2002:a63:5062:: with SMTP id q34mr12152618pgl.378.1578764568866; 
 Sat, 11 Jan 2020 09:42:48 -0800 (PST)
MIME-Version: 1.0
References: <1578757241-29583-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1578757241-29583-8-git-send-email-aleksandar.markovic@rt-rk.com>
In-Reply-To: <1578757241-29583-8-git-send-email-aleksandar.markovic@rt-rk.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 11 Jan 2020 09:42:38 -0800
Message-ID: <CAMo8Bf+Z_Butin=skbBXwR-4ouOZfp8FXwGqiTQYZCj6WD8SPw@mail.gmail.com>
Subject: Re: [PATCH v4 07/19] linux-user: xtensa: Remove unused constant
 TARGET_NR_syscall_count
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jan 11, 2020 at 7:43 AM Aleksandar Markovic
<aleksandar.markovic@rt-rk.com> wrote:
>
> From: Aleksandar Markovic <amarkovic@wavecomp.com>
>
> Currently, there is no usage of TARGET_NR_syscall_count for target
> xtensa, and there is no obvious indication if there is some planned
> usage in future.
>
> ---
>
> cc: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  linux-user/xtensa/syscall_nr.h | 2 --
>  1 file changed, 2 deletions(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max

