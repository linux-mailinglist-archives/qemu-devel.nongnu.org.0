Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC2F29E02F
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 02:11:13 +0100 (CET)
Received: from localhost ([::1]:59910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXwTA-0000h4-IY
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 21:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kXwPa-0008HX-1d
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 21:07:30 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:33058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kXwPY-0004oo-J9
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 21:07:29 -0400
Received: by mail-il1-f194.google.com with SMTP id f16so1487020ilr.0
 for <qemu-devel@nongnu.org>; Wed, 28 Oct 2020 18:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wQPZo6w5yZQMn+J3rkq2nnwM8s4Pf6vorq7cw+A4lgs=;
 b=cW5hZnMN0sgFVJtZNiAo1sj7SE/9sy2lQF1JEdhsTwtfi1lIsdzo57B+AH2hSHtXql
 Qemn/aqSuURmZSFZGpa5n/Z/Dgzt5ZlVdMaBtsxKjYzBB13c6fZZu/oC+QDSKZ2l80jF
 X3p+u/I6ePG3b+/s+yaLEVwDSvF+aNWPL/rfIyOW3OSz1jxemzk6+YubKBXztNSXtsIk
 FCIOBIQH6hHs1stZoNzUtNTC/ka8DiLkSk2HEU8tU+N5Jt2yxHGzRyfh9JfB2KFWqZaS
 E4MIYZ3+w/zBwZlGyZvfBUJ/LcLo+raKww7SnKYicXZqJBl/MZ0wJXDsr8GyQ8/txh8z
 Nw6A==
X-Gm-Message-State: AOAM531yfT+MIXz+CcN2tHarkmjKqCCO7ddRuZbHvigt9gelrbBUL5Dj
 gTkUIvSoXWUVCD+kBffbWyXYQELIbcs=
X-Google-Smtp-Source: ABdhPJwDItuvyvTjq0Z2RhV7cQnCFU45k+pU/D0EQy06NRJzQMTmgCZYYoXqVrNNJ5qTw0hviezgAw==
X-Received: by 2002:a92:25d3:: with SMTP id l202mr1395355ill.249.1603933647533; 
 Wed, 28 Oct 2020 18:07:27 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com.
 [209.85.166.54])
 by smtp.gmail.com with ESMTPSA id r14sm972845ilh.10.2020.10.28.18.07.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2020 18:07:27 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id u62so1599633iod.8
 for <qemu-devel@nongnu.org>; Wed, 28 Oct 2020 18:07:27 -0700 (PDT)
X-Received: by 2002:a5d:93d0:: with SMTP id j16mr1687387ioo.63.1603933647271; 
 Wed, 28 Oct 2020 18:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201028030701.14086-1-j@getutm.app>
 <20201028030701.14086-8-j@getutm.app>
 <20201028115946.GK221115@stefanha-x1.localdomain>
In-Reply-To: <20201028115946.GK221115@stefanha-x1.localdomain>
From: Joelle van Dyne <j@getutm.app>
Date: Wed, 28 Oct 2020 18:07:16 -0700
X-Gmail-Original-Message-ID: <CA+E+eSAfHXsYDbn5HnpGmQrpwpkAUBrMn7w4PwLDfMPctRwdFw@mail.gmail.com>
Message-ID: <CA+E+eSAfHXsYDbn5HnpGmQrpwpkAUBrMn7w4PwLDfMPctRwdFw@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] block: check availablity for preadv/pwritev on mac
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.194; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f194.google.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 21:05:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

If built with Xcode 11 (or below), a compile time error will occur due
to symbol not found. (QEMU's ./configure detects this and doesn't
enable it)
If built with Xcode 12 without the checks, a runtime error will occur.

-j

On Wed, Oct 28, 2020 at 5:23 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Tue, Oct 27, 2020 at 08:07:01PM -0700, Joelle van Dyne wrote:
> > macOS 11/iOS 14 added preadv/pwritev APIs. Due to weak linking, configure
> > will succeed with CONFIG_PREADV even when targeting a lower OS version. We
> > therefore need to check at run time if we can actually use these APIs.
> >
> > Signed-off-by: Joelle van Dyne <j@getutm.app>
> > ---
> >  block/file-posix.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
>
> What happens when preadv() is called prior to macOS 11/iOS 14?
>
> If I understand correctly the runtime check is preferrable because
> otherwise a binary compiled on recent macOS/iOS would ship with preadv()
> support but fail when executed on an older macOS/iOS?

