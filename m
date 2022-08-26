Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 595B65A2B54
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 17:33:51 +0200 (CEST)
Received: from localhost ([::1]:39626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRbLC-00082d-BF
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 11:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oRaef-0007go-Og
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:49:55 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:35833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oRaee-0001kB-26
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 10:49:53 -0400
Received: by mail-qt1-x834.google.com with SMTP id h22so1407615qtu.2
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 07:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=xW0nzFB7LtWVcz6HqiCOjl/OPbNRq4Pb0hyFFSA0AiU=;
 b=V/+IxDuCcEMSVfEK8dfEDfiPJOAkdRcM7B+Vy4NP0pDuevkVfEgnYQkpdnDMpCOCQc
 rIfWPbSzR7/P0nmS22+9wTpgyhW0xLLKM/NGIF1chBggrvh7GZLUQO3V5WSrk6T/Ecqv
 Af449vwzxc+spTwHFv9K+oqgjFxkqrIZ5jp+JZWqZPVyK576KSsJYRE/hD3iGkBTeRY3
 pMHBtRhHmWhOLP2XDNIE83RX9wQo0TznC0y0PrW8QGQetHHKvH/AQYlaGcbyzxd8ioRn
 1wt4W0e3s8pZpTUVnPC81hmiMReciyBhamnndYQUSeXAT87eofTkyBnEdl48igXoZFGZ
 eRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=xW0nzFB7LtWVcz6HqiCOjl/OPbNRq4Pb0hyFFSA0AiU=;
 b=JkoC0mdlc9+xvd/RPr6j0LjNXSETffgXNQ1ezpi61EQVKc/NDEU3P+wy3R2vFI3WAu
 ufWWQxtvrMMUu9Qtvbtxrn2EjST8YI8+iJvZMX2IeuEi2RNj+QtqgpuhTt6v7wFshpMK
 fS7zEgk13DxMxUb9k0jw4Rn0smSCIMAszBWpqCLriBriXZuavu+O7SyXwxtEIMLDvuYu
 KOVXned+S/O9tCNQC+76TYNcOfaWLikXLNn9aMfZtPBpybYleM23r4fWciglhxGQETqG
 0YEPP5Ba585wljpIQie8aO5b2g/R0limh9wqBx8EDqwsdjFmx3z0H8aaJyl+T+NhXJRO
 l05Q==
X-Gm-Message-State: ACgBeo3fbcEpXbvirLLNxlNOVe/NJTqZ5WjOpzqUdavXtCQ2S/Ll+DkK
 +HYf7zesr+Y61+y/nP/MwHMW9PfeU7NQY78LPsxU3yepwNI=
X-Google-Smtp-Source: AA6agR7TwGfme2QnkGt2CLvwEWV6gR0uMT6CGTooTEMHmz/9jPvM3AAVfl6fU9YLPUc5YKwuNfPPMSf/iTqPq4LP2hA=
X-Received: by 2002:a05:622a:181c:b0:344:6399:d8c0 with SMTP id
 t28-20020a05622a181c00b003446399d8c0mr46240qtc.334.1661525391036; Fri, 26 Aug
 2022 07:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-13-bmeng.cn@gmail.com>
 <YwZm0rAH5oStGc3F@work-vm>
In-Reply-To: <YwZm0rAH5oStGc3F@work-vm>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 26 Aug 2022 22:49:40 +0800
Message-ID: <CAEUhbmUcWgCgH8YnOtKZ5+g2M76pUFbcqdmzwFm-LsuVnjb=mg@mail.gmail.com>
Subject: Re: [PATCH 12/51] tests: Use g_mkdir_with_parents()
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x834.google.com
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

On Thu, Aug 25, 2022 at 1:58 AM Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Bin Meng (bmeng.cn@gmail.com) wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Use the same g_mkdir_with_parents() call to create a directory on
> > all platforms.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>
> > ---
> >
> >  tests/migration/stress.c              | 2 +-
> >  tests/qtest/migration-test.c          | 6 +++---
> >  tests/unit/test-crypto-tlscredsx509.c | 4 ++--
> >  tests/unit/test-crypto-tlssession.c   | 6 +++---
> >  tests/unit/test-io-channel-tls.c      | 6 +++---
> >  5 files changed, 12 insertions(+), 12 deletions(-)
> >

The exact portable replacement for mkdir() in glib is g_mkdir(), not
g_mkdir_with_parents().

I was misled by the GTK glib doc [1] before. I will change it to
g_mkdir() in v2 instead.

[1] https://docs.gtk.org/glib/?q=mkdir

Regards,
Bin

