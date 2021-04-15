Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FA5360797
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 12:51:23 +0200 (CEST)
Received: from localhost ([::1]:38074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWzak-000166-6J
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 06:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWzZ6-0000SR-MO
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:49:40 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:39631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWzZ4-0006d3-1m
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:49:40 -0400
Received: by mail-ed1-x533.google.com with SMTP id g17so26752874edm.6
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 03:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zY14ioKaR9lJGjtGdzcBrzjq/TDEfEQsSavC5DQhLp4=;
 b=Tmn5Y1XYKLwy3Jq2iYgcTgCz9SEGbZUPIRzDD7CPP9LSxMnqAbux0Y8YC6/pSYo3T5
 z7SyB1GilKnY5NmuvOZI2NbNM37+r+dO5T3dibEJFqgYFhzJBJpSQ0R4FA2psjHjqN4B
 SYq5PlpUQiP83sRWWNkIpn6kmENyUNhjNi2qFk/2apXUbdyxzWvp808SLhSKU4ZmpuTY
 J4NzGgTHJOEGU5bX/QohE5hnx/sV5KbulIKfCFnNlIzhJ7DJz5VV+5qZ8Z1lzjb8wr7B
 BAPmoPGUuc+innC3BJtxZwRDzD+hoADbOTdOTPwnU1f6D5ISeCeMTFyHVe3WFNQ+wDVU
 YsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zY14ioKaR9lJGjtGdzcBrzjq/TDEfEQsSavC5DQhLp4=;
 b=cLlOdWKFOoAjtyO+DippqwxTUrpxTsYBMloPcV4OR0B2IM+erYS7nOOrBU9Xf6qjH1
 AgfVCFdSLTfk+3DEFus0H2ddrGaT9BG42o1RGJmMwepdM3s0LiXzQuOYqTVgRLy741Zl
 90p2m9+Bh/p2fcVMfL8X43otUjm7wk//niMZKjUe7tYjwZff1vMt1ZVacnm4chCFxWwF
 +cZ/P7Iw91uNJF3ebEjr4mPk9slNoGY14AjpU2I/nX6CvVAGSlWflI53vUnMz9/Rn/CQ
 bRlq/poQO67OeA1t+l+d8gvnuqFjYC2GJhmtaNSoPuLHzf1sCCW+cy6s7d/uskS7lCKF
 AxvA==
X-Gm-Message-State: AOAM531MQBLfJP+sA+9AQFaTToZxIkuUukZCRTANR6dd7olEKxflj8PA
 loTTN5eTfZh98YV9IhelmnS6ERoKkjM93eBEkc9CYA==
X-Google-Smtp-Source: ABdhPJxRYKe+Bu00ktVHmzGVhpwDKHCxVI7BWD9oJLg9FeoMGCuf9f4Aou4dRcr2wLlGVSWK59GfS8vzGRsiJt2nDOw=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr3402006edt.36.1618483775914; 
 Thu, 15 Apr 2021 03:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210413160850.240064-1-pbonzini@redhat.com>
 <CAFEAcA8vf5Ra0MxwunQPGsahnHgaSCE9QYS86xY7tkKEVSO+TA@mail.gmail.com>
 <87r1jcgkdw.fsf@dusky.pond.sub.org>
In-Reply-To: <87r1jcgkdw.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Apr 2021 11:48:48 +0100
Message-ID: <CAFEAcA85Hm_bpxdjotESPTHhwbHz9xME93rRAZ1_Kiih1QQ3kw@mail.gmail.com>
Subject: Re: [PULL v2 0/3] osdep.h + QOM changes for QEMU 6.0-rc3
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Apr 2021 at 06:57, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Tue, 13 Apr 2021 at 17:18, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >> Paolo Bonzini (2):
> >>       osdep: include glib-compat.h before other QEMU headers
> >>       osdep: protect qemu/osdep.h with extern "C"
> >>
> >> Thomas Huth (1):
> >>       qapi/qom.json: Do not use CONFIG_VIRTIO_CRYPTO in common code
> >
> > Given Dan's review, I think that the osdep patches need another
> > revision. So my plan is to cherry-pick the CONFIG_VIRTIO_CRYPTO
> > patch here and tag rc3 with just that. If we need an rc4 (which
>
> Uh, I had a question on that one:
>
> Message-ID: <87tuo9j7hw.fsf@dusky.pond.sub.org>
> https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg02341.html

Sorry, I missed that. Let me know if the discussion ends up concluding
that we should revert this change for 6.0.

thanks
-- PMM

