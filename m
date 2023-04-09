Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6224D6DBFE9
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Apr 2023 14:52:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plUVP-00088R-4A; Sun, 09 Apr 2023 08:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1plUVJ-00087i-GP
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 08:50:45 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1plUVH-00022v-OJ
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 08:50:45 -0400
Received: by mail-yb1-xb32.google.com with SMTP id bv15so569650ybb.1
 for <qemu-devel@nongnu.org>; Sun, 09 Apr 2023 05:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681044641; x=1683636641;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AVGbY4iFIFQLInHImStlAaQwpiDMMrFNgjfbEFKFrFg=;
 b=Z/X0xSzMwIUkd/oam61AahSHb+hcd5zV0ZpyVYrwRUq+Dw2u5V5jW9nSrOyJ46E2WT
 U6hZ8E8ig/9OzMnAtnd8VQaMmLi7eiAeUHn5G2S8f1xhHgT8OVXuyVR9I5A1TXzllpzy
 XkUUrtfRRbVHBgqr6zXBIRlnrggJaS7p1H+/hSjaQndJqhtU2m+YWBlEl35oB+qWJ2hh
 VnTKmicWXli00n6OkcfJ0u9BGzH+IePwutsza1egVrl04XNX5QitvAPEOYArxBAtB0wr
 IMKEJmH8rj4KtKvGaJxQPoV2y/v01L2Hr3hY3YLcaxLqizv7gJ0SM0gzEjiNg3FbCxZk
 9qug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681044641; x=1683636641;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AVGbY4iFIFQLInHImStlAaQwpiDMMrFNgjfbEFKFrFg=;
 b=QmxQvn1ZwSeL8hs//BanxGKVRD5QjCviu4chB3Cxz9NxpKezTYpjWlgntneSJsqS6S
 NLnGrmrW9EneJh6oVu1aLm0TbNbnC571OzL+L+87mA3BOvcQ+HuFNw41E9aF2sStbpvj
 jpb00f5g1um0dY8DrvpqE1tZRQSTGHg9Q1b0Oxe/MTZu1a/rv0e4xazCYr4WPqA0UNxk
 KkX4v9nBRhuulownEuobTYyQhvtZmyv7DSR37ZqfWO73B6Ybd0/TERDYzw8IR8PUmkTe
 YeU357xhO0pEuV80wgqQbEFrCk1M1BPql8B1uwmZoks1vX9JgGm/xAMOYJ+gzOqa0MNl
 zQIg==
X-Gm-Message-State: AAQBX9fHSi9Ei+JUxwVU0rBSfeerZy0p4OD+ANZzNX5iWRNUutsKoIfj
 /20HK2KFy4ipiFASfHPm2Yir0jkwcyCP4EnmpGm+gKj8oYw=
X-Google-Smtp-Source: AKy350bahXsoqNFDZ2WaITX04TibPKFGEYEXRcw3pBhnmNahGB/EkAAQPf+TRA3vBwFt/OUNVU1VanVNLmuT1QoHaFI=
X-Received: by 2002:a25:cf8b:0:b0:b8c:473b:30df with SMTP id
 f133-20020a25cf8b000000b00b8c473b30dfmr5028658ybg.2.1681044641697; Sun, 09
 Apr 2023 05:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230406080045.21696-1-thomas.de_schampheleire@nokia.com>
In-Reply-To: <20230406080045.21696-1-thomas.de_schampheleire@nokia.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sun, 9 Apr 2023 08:50:29 -0400
Message-ID: <CAJSP0QUZT=6ZGTqXkSwJvsCfPG0-A00f174N=NJcp__XtANNAA@mail.gmail.com>
Subject: Re: [PATCH] tracetool: use relative paths for '#line' preprocessor
 directives
To: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb32.google.com
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

On Thu, 6 Apr 2023 at 09:22, Thomas De Schampheleire
<thomas.de_schampheleire@nokia.com> wrote:
>
> The event filename is an absolute path. Convert it to a relative path when
> writing '#line' directives, to preserve reproducibility of the generated
> output when different base paths are used.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  scripts/tracetool/backend/ftrace.py | 4 +++-
>  scripts/tracetool/backend/log.py    | 4 +++-
>  scripts/tracetool/backend/syslog.py | 4 +++-
>  3 files changed, 9 insertions(+), 3 deletions(-)

Thanks, applied to my block-next tree:
https://gitlab.com/stefanha/qemu/-/tree/block-next

qemu.git/master is currently frozen for the 8.0 release. The latest
release candidate is -rc3 and the final release is imminent. I don't
want to risk breaking and delaying the release at this stage, so I
have queued up this patch for the 8.1 release cycle.

The timing is unlucky, I would have liked to still include this in the
8.0 release. Thank you for the patch!

Stefan

