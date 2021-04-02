Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D14EF352F3D
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 20:28:24 +0200 (CEST)
Received: from localhost ([::1]:54256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSOWt-0006Tk-BW
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 14:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keescook@chromium.org>)
 id 1lSOUP-0005xk-Fz
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 14:25:49 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:38735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <keescook@chromium.org>)
 id 1lSOUN-0004R3-La
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 14:25:49 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 k23-20020a17090a5917b02901043e35ad4aso4947624pji.3
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 11:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7WB9dyBxJfyi+dnN/pUTcNGEGmQQ19of2/quWexK5LI=;
 b=S6NXdtr+LlK6Nx57Jl5hfAvwLV62rZq1q9FrJPkyMVNZcnp6YgfAJ0ljinGEeEojZL
 542zCwNZXfoWy1Ucv+WcLme19/ihTv0HTdcMLHfon7tz7nivoz3RFfhLKvd4pdkzVuhR
 5HVoI7ahUuhXAv+n/q9uCCpZVw9CCf5emX71w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7WB9dyBxJfyi+dnN/pUTcNGEGmQQ19of2/quWexK5LI=;
 b=pLjjdCUKwBtgKrESzBgoTh/VeUrQZpNE0jNEQ17yX7GiwTKAnakZnMBuqbTMIGUpKk
 o9ji6DsB5NKp6KbVNsFYe007rKkBmpZbMWlN1MGKvxFw4GJRmcYrjPL4w682qSs0+MM6
 pIJpNN+yqF4SctKeyNrzSEub4S4yXgNyFJ7K1N8Sc2WS3fPURLpU5s9zmQ43zx7a7TFu
 DOiKfz8VIMJbVz1B7KsCHKlnj+vb9mT2MEFXFTwVpZxqgBIwdW8XnUOfFzrcpcGZRnUT
 a65SF30y2RyqABy9ixTF9p+SfJJf7x2sofH2H6Q6L9XA8Pjh5wpTyciD50cjC2G0sPrN
 6f1g==
X-Gm-Message-State: AOAM532H8hBD1IUp91Hmdk5wzvqiPqd4bYxgp3Og+WGk+eZ3BafstFij
 3Ae4XPB6n6G4cSouUTeIshfiKA==
X-Google-Smtp-Source: ABdhPJxFdQIKTxzrvLroVyzxnLHiDY5q50gwTx44nmerTmTqVhmwikVsbTgh8V9WzpbDCaKSwEXltw==
X-Received: by 2002:a17:90a:9413:: with SMTP id
 r19mr14769842pjo.65.1617387944473; 
 Fri, 02 Apr 2021 11:25:44 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id p17sm8464878pjv.49.2021.04.02.11.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 11:25:43 -0700 (PDT)
Date: Fri, 2 Apr 2021 11:25:42 -0700
From: Kees Cook <keescook@chromium.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH] qemu_fw_cfg: Make fw_cfg_rev_attr a proper kobj_attribute
Message-ID: <202104021125.53164550A@keescook>
References: <20210211194258.4137998-1-nathan@kernel.org>
 <161428829728.2305454.15456455443457551559.b4-ty@chromium.org>
 <CA+icZUWdeWSy52bU4cjHau1hn5NiFAozaHgDb=geaaCYOET9+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+icZUWdeWSy52bU4cjHau1hn5NiFAozaHgDb=geaaCYOET9+w@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=keescook@chromium.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gabriel Somlo <somlo@cmu.edu>,
 Nick Desaulniers <ndesaulniers@google.com>, qemu-devel@nongnu.org,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
 Sami Tolvanen <samitolvanen@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 02, 2021 at 08:42:07AM +0200, Sedat Dilek wrote:
> On Thu, Feb 25, 2021 at 10:25 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Thu, 11 Feb 2021 12:42:58 -0700, Nathan Chancellor wrote:
> > > fw_cfg_showrev() is called by an indirect call in kobj_attr_show(),
> > > which violates clang's CFI checking because fw_cfg_showrev()'s second
> > > parameter is 'struct attribute', whereas the ->show() member of 'struct
> > > kobj_structure' expects the second parameter to be of type 'struct
> > > kobj_attribute'.
> > >
> > > $ cat /sys/firmware/qemu_fw_cfg/rev
> > > 3
> > >
> > > [...]
> >
> > Applied to kspp/cfi/cleanups, thanks!
> >
> > [1/1] qemu_fw_cfg: Make fw_cfg_rev_attr a proper kobj_attribute
> >       https://git.kernel.org/kees/c/f5c4679d6c49
> >
> 
> I have queued this up in my custom patchset
> (for-5.12/kspp-cfi-cleanups-20210225).
> 
> What is the plan to get this upstream?

I haven't sent it to Linus yet -- I was expecting to batch more of these
and send them for v5.13. (But if the kvm folks snag it, that's good
too.)

-Kees

> 
> Feel free to add my:
> 
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
> 
> - Sedat -

-- 
Kees Cook

