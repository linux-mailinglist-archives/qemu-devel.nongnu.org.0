Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17795A262E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 12:54:07 +0200 (CEST)
Received: from localhost ([::1]:33694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRWyT-0008Gl-KW
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 06:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oRWsv-0002mf-U1
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:48:23 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:38457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oRWst-0007lD-50
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 06:48:21 -0400
Received: by mail-qk1-x72b.google.com with SMTP id g21so791316qka.5
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 03:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=PNG0VRTUf2cOp0XLS5iHhTYD17W6A2MLSk/NKBaY0Eg=;
 b=PCy3apfckm/tlmQugzjOsbSZBBnuU2xMzWfaDmb74ua7JvrgKvKvomcY8Xe7kMxjJ1
 8Hpq+QxjXL4JK4PvSlgyhROcq9a7dDJ1kP0S04wyyLCIcVb2vbtpdWih66rjOZNOE3oJ
 mvVkMisBkbCMCPnqS1BWY7L5k+ojx6Vs+gUgvjfLku3C3pHd6SDHI8LO+ahj1Q07PbGw
 OWc/75xwAJDs7d03q+orYWKslvr2Tmo0Mc8vrhTqVoje3SNWThCMv0cRPDej7VsIDMKU
 1OBbExQs5XfQbRoxEJXhH9AFM8qO04G0mKav2kZ3t95fM56NNf8BVvNGB9oTbYxCO4Pk
 RS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=PNG0VRTUf2cOp0XLS5iHhTYD17W6A2MLSk/NKBaY0Eg=;
 b=41gZw00Xhcb8QZbubgL9V4M2wR3s5uE1/UvF6fJisuhB0aMG0zhZVTrqFPsOBjdZ1j
 uk1q9SAUsh4T9Q9Kgrcai/0zS7bjXOOX1NianjNfc8nCHBhSAZCctWJK2xsSE4bDgcio
 acAqoNDo2PKs9aqJr9YxTJsYt61Xy8girEsix6sfbT0W8+BBnwNB7IWe9KloKzacGKbc
 Ma+chmVZkBCh83BvQ8hak6BRafUlfcff+MM9/msDh4NQMbYDAUEDClZee1Q6tj/QlZ25
 0ZXGBrwJvRkr5VDKKfWqBF6GXl6H4p74ugLRnwnMNNAhjBlZeurTBFVUy7XvxfQgrRuW
 Jx0A==
X-Gm-Message-State: ACgBeo2koEnPjSX1pKaJhRmcY7p6TqyvPqU61Z9IxrUq4Oh1qxthSfsG
 AhorlmVrb5Z6TWZ/Lt9IWiVsb5WrMVFKK/bWxvI=
X-Google-Smtp-Source: AA6agR4VNn3BA5wuoN+y1QLq5LKAflCRGzMWoLdSkANVtzUnmzZhgpnG6vD9f7w63XpJu99dVhnjp9oZFPrmjuiu+lY=
X-Received: by 2002:a05:620a:2548:b0:6b6:113d:34fd with SMTP id
 s8-20020a05620a254800b006b6113d34fdmr5860521qko.132.1661510896543; Fri, 26
 Aug 2022 03:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-38-bmeng.cn@gmail.com>
 <YwZzlkoJOFxs7Uyy@work-vm>
In-Reply-To: <YwZzlkoJOFxs7Uyy@work-vm>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 26 Aug 2022 18:48:05 +0800
Message-ID: <CAEUhbmVOA0FMWTwiuNnwS8W3yWn7-6mnAMqUwwBZMBZ6TpKgRg@mail.gmail.com>
Subject: Re: [PATCH 37/51] tests/qtest: migration-test: Disable IO redirection
 for win32
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, Aug 25, 2022 at 2:53 AM Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Bin Meng (bmeng.cn@gmail.com) wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > On Windows the QEMU executable is created via CreateProcess() and IO
> > redirection does not work, so we need to set MigrateStart::hide_stderr
> > to false to disable adding IO redirection to the command line.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> Isn't it easier just to change the one place that tests this?
>

Yeah, will do in v2.

Regards,
Bin

