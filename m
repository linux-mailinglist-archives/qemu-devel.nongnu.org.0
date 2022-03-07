Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326D24D043E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 17:37:10 +0100 (CET)
Received: from localhost ([::1]:46842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGM8-0008QB-Sm
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 11:37:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGKR-000718-5H
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:35:23 -0500
Received: from [2607:f8b0:4864:20::b33] (port=46015
 helo=mail-yb1-xb33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGKL-0005kw-68
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:35:19 -0500
Received: by mail-yb1-xb33.google.com with SMTP id w16so32079512ybi.12
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 08:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1Wp6f3MXDnkjXrCQLbZWhK2kG2BVx6JuSNEbUN9Egp4=;
 b=Ym5EpVqts7lSZqZiedHkah8IZckrA8RT+yvBlm0RmALxSd+wkc3vav5o5EdeBTISpN
 i+LD+1p7kU7ph0UZIE94OAvsM/FbModX2ys5L94OS8rjreHA7Zwm27ndCeLS9sCiI+Uq
 AQO0Whu7EM/rj/BKgYlvVb2mIsksXlbUVXeMLRdyGoRJOVkymImYgFrTZC/ogO6DQsQW
 PnzHppmkUClAqiBz2WHpa22kKJJqU6MAcXrH+bn3vhPfDWmXXxYxPo7UOv9CvJ/TYgOW
 ZVpVesUG8MDo1ZaqpzLjsDNXC6OMfwjjtyxWXOVAIEW4AFrGFR0h0jXmHe3cNEG5Mm4q
 L3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Wp6f3MXDnkjXrCQLbZWhK2kG2BVx6JuSNEbUN9Egp4=;
 b=FplclCOcXGnjGRnOXjLkeLP0iouOOt7jfYj5RlPU9jSAdn7AOyDQkwaunUB03KPGhu
 n7ByI8rAJlshcPNFH1R4OEA50ABOf5gkJpjp4EM7vMGMnUbIFB6qExZBi4gQ9vtIKW0N
 hZa9HquarPX5Q859gvz2UGFRcoXcz2QHS2/60MimCtbWQ0RSBHlgySlk3r2Hwubd+j3a
 9RXFK/0xtSd5cShtqMCDWjG1qqPj2DDonDPH1dR8Sn7SpO9o5YQMSHxVl7JmtLpLZW0U
 1PXN5YO6GtYeaiLynJ9zFp5xI5SAfk7g6VBEaOnLwAKUCYZU7701hGMCScyNcLS1uCiq
 +aRQ==
X-Gm-Message-State: AOAM532yNZgZOHTHt+SZnPGO++fjFAOCpIw58ISdy5TchdmX/qmGTpyW
 AIIqJxZOZTyW67vxl1bp4h/LSl1hGwp8hQcM4moNGQ==
X-Google-Smtp-Source: ABdhPJwWj9FrPh6zYEkCw6fB2/KPduTIzAyCYhABsrsgIvgtwcfGlo5F8TDXFUMIhlYlu9WOl0P1H93GIuboDnnROJk=
X-Received: by 2002:a25:6e84:0:b0:628:97de:9430 with SMTP id
 j126-20020a256e84000000b0062897de9430mr8877700ybc.288.1646670916274; Mon, 07
 Mar 2022 08:35:16 -0800 (PST)
MIME-Version: 1.0
References: <20220307151004.578069-1-pbonzini@redhat.com>
 <59f773ed-9a1f-10ff-637e-b41848aa534d@gmail.com>
 <CAFEAcA8XshU90eKJM_4+_mLRhUCN+ExWzCkPTveLht0bWBb8=w@mail.gmail.com>
 <CAMVc7JU=easTepCd=j0QHWBcFrry7iYXgX1BbQjs27fmxZGXrA@mail.gmail.com>
In-Reply-To: <CAMVc7JU=easTepCd=j0QHWBcFrry7iYXgX1BbQjs27fmxZGXrA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Mar 2022 16:35:05 +0000
Message-ID: <CAFEAcA8h0E5i=iJswVwC+v_=vs_u92-s90wMgq_C5ZjSTsrZSw@mail.gmail.com>
Subject: Re: [RFC uncompiled PATCH] cocoa: run qemu_init in the main thread
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Mar 2022 at 16:27, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> On Tue, Mar 8, 2022 at 1:14 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > The main benefit of Paolo's suggestion from my point of view is
> > that it entirely eliminates the odd situation where cocoa.m wants to
> > make calls back into QEMU code where it does not itself hold
> > the iothread lock in the current thread, but instead knows that
> > some other thread does and is waiting for it. Instead we end up
> > with a much more straightforward situation of "every time we
> > call into QEMU code we hold the iothread lock directly ourselves".

> The current cocoa.m somehows calls back into QEMU code in main, but
> that is not necessary as demonstrated in:
> https://patchew.org/QEMU/20220307134946.61407-1-akihiko.odaki@gmail.com/
>
> With the code is moved, it becomes only a difference of the place
> where the code without iothread is located, in main or in
> [-QemuCocoaAppController applicationDidFinishLaunching:].

That series doesn't remove the general design that has quite a bit
of "we know some other thread holds the lock and waits for us" code.
It also gives us the opposite problem that we're now calling a lot
of Cocoa APIs from something other than the main Cocoa thread.

thanks
-- PMM

