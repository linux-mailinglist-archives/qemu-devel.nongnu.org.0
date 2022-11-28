Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DC363AE1F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 17:54:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozhOd-0006jE-Jw; Mon, 28 Nov 2022 11:54:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozhOX-0006hI-Sm
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:54:13 -0500
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozhOW-0007DS-Fg
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 11:54:13 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id d128so14069561ybf.10
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 08:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5FjmwxMVk5i0RUuktMIUyrN0aTqW8nUi/GFxkLOYaic=;
 b=jqEvxQGbjc2SDSC04FHMeRxK9uHXWzT6ledS58xWFEaqAFWRxTTnxMymN+jzlbir8T
 80qT0a2uJ/Mp7ruWWBH0BHPEKQ52B8Yrxn/pnhUwnyYgZvkulrrYa3FyjnhEr9tJFKrQ
 5FkeuMt8vKHVOXC8IVyhMDcP4gk3J/ZAGVDpCDLc2NZTRbs3Tpsp6yjMip3Z1kQMncli
 De1tygzRbGPK6Ml+pEi1e8aiQTOvYSLxthN/AcR9qJHz3c0hcUxDZSIL85ikku0NOVWV
 prT5ouX0gl8qxYAKNsr3LsJTIrtcc+QFvKwmvBitQT2JFYX2slGyDxrUlVJoFzX7AoRH
 JzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5FjmwxMVk5i0RUuktMIUyrN0aTqW8nUi/GFxkLOYaic=;
 b=RgqXEbrR68THmv8au9Yx7FxN4iD9pxNVhwGEJMrmThdfeLXrmDK2XtSPFgVZp4KNEt
 WHT4qHbWaDUKD7bBL8QdNwPgKGJFHVbPn54GI56fNaYU606dphM84Z/eReoAx6ixYkhf
 iax4Sjdx7UXwAT4Rh5MfkaWD5ITwF93YxW1ADEvjRcwJfUP8cLHmzKFVdtvNwne0IHqo
 l8YHBXj5c5fu1gknEk3MCl4Qqj1zjFHvMpjD0RxXxVejRb/U4d/mIKQEfUJgQFvagmmn
 8wvAqCWtCVuBWgJlhZIbZcfstwF6M+2JF0ZOYiY6VQMiMkganLX24yfYGgbMkvfgG2jx
 ZdSA==
X-Gm-Message-State: ANoB5pmiJFwV9eiyyCBnbno2DcZ17FxIeC9pNg7Q26Alw0sm27gCTjAQ
 GqYN/lYoDox3JIPruO48mKAEXBQ4tylDqVTu/Vw=
X-Google-Smtp-Source: AA0mqf6Bcy1KFHAfDB8m5rq6cFZuHAzLdJ9BYz1RIT7eYEzawUU5dGl5gXmGzb7C9y0OmS2NRcY9QeqKeKAwaFBW0RI=
X-Received: by 2002:a25:bcf:0:b0:6f2:a9c3:cbad with SMTP id
 198-20020a250bcf000000b006f2a9c3cbadmr18676623ybl.118.1669654451333; Mon, 28
 Nov 2022 08:54:11 -0800 (PST)
MIME-Version: 1.0
References: <20221128092555.37102-1-thuth@redhat.com>
In-Reply-To: <20221128092555.37102-1-thuth@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 28 Nov 2022 11:53:59 -0500
Message-ID: <CAJSP0QWPc_AR1=Q1BQGkTk+v0vm53C8f5bD0uVm+UmDxDaQBFQ@mail.gmail.com>
Subject: Re: [PATCH v2 for-8.0 0/5] scripts/make-release: Decrease size of the
 release tarballs
To: Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2a.google.com
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

This is great. It will reduce qemu.org's network bandwidth consumption
and make QEMU release tarballs nicer to use due to reduced size.

I left a comment because I don't like patching the roms/ directory,
but if I'm the only one who doesn't like it then feel free to keep
that approach.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

