Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B485D4C188F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 17:24:23 +0100 (CET)
Received: from localhost ([::1]:47728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMuRC-00065I-RR
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 11:24:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <josh.a.seaton@gmail.com>)
 id 1nMuOZ-0004Gb-5S
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 11:21:40 -0500
Received: from [2a00:1450:4864:20::535] (port=38866
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <josh.a.seaton@gmail.com>)
 id 1nMuOX-00078P-4x
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 11:21:38 -0500
Received: by mail-ed1-x535.google.com with SMTP id s24so38579541edr.5
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 08:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xwmcOaBnUoN55DPONtuXZ8IK9pvCjkpUu6C5cW2q6Yg=;
 b=kcJkDF6LWknYgq1z8yGDCN4iY+CGaK5Ye/QoYc9QerXfskzI4HHtp7TeciPYhOW9ep
 SarGsRLfSIPXmYrc5v6i7v/RM8woJTFgVvDrdt71EPwwBtRjbgLJptTc3CetAS/cvKX6
 Eu/pPFERsBPO0ttnJksADp8vQdPeff614px/Rk+7piyFjTKBLVbC9KY+1OzAnWLKPIdC
 Jiy0UPvefpkR09IX9W+EYfA3YinmI252EmzWawISoizH4gQltKOmUPAdGuBSpKjpNA23
 tQ1vIVZt5EGVFFobVzV7W/ttze1CapUqwNVpmZi9ByZPFmTVt8ywBuum3Gki9COOKpye
 UJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xwmcOaBnUoN55DPONtuXZ8IK9pvCjkpUu6C5cW2q6Yg=;
 b=MlSEdHthkjcBcqFUPjqprHcAsVcEaTpJXMXEhbycHvKNbSfl7guH3yoW8DSpVchGmQ
 UIfTpv+z51RXap4bxTKgsiJXkYdloBTlLoheofXRk0s3M2Aq5UV8pG2mohk7yi0dKihT
 D+t/AbIxwjhxreKv73McPI0BaCP1j994xCkfcLe37e+4uwg73QMEXhhvzUs3vsDhNSLn
 eX/aCvRw3QzMfYMgxfVnYecb29/QhcbBZuBP0JgDaBq1ofn0P6d9Jm/cDy4J0RJS+2ji
 MJFMzPtPwc5xANGB8hQNzPcF8cDWR3gf/zPlN3y9lVEXr9oSkDRdIKIrT8e9o1El8L9I
 FtHQ==
X-Gm-Message-State: AOAM530iHwHpRBVnhn6PPqI79g9bzsCr1zHKDupiI6yjGApXmTQaIB6b
 8OSzCsP5EO6kJS7rEUCFtK+Xf+wA7ZUfwG4oV2o=
X-Google-Smtp-Source: ABdhPJwNBaJa9IqDsK7U6rwBZmITcLXP4nhmQPe4cy+4Pw8ULD4DyLAZYVON2Jn6NQ9fEoBSQyyr11xZPw9oQQWQXUU=
X-Received: by 2002:a50:d61b:0:b0:413:373c:5206 with SMTP id
 x27-20020a50d61b000000b00413373c5206mr150828edi.289.1645633295573; Wed, 23
 Feb 2022 08:21:35 -0800 (PST)
MIME-Version: 1.0
References: <CAPbYy+_XEvLYuPa5jgMde7YAgk2Cx4wDi=QnJiLn9zT5ALjROA@mail.gmail.com>
 <59b4fb65-10b6-8d4b-e257-cea50381f168@amsat.org>
 <CAPbYy+9ksqwk04EfiFGcebsgwGjjJz9GO48oekYVbybbJZUiSQ@mail.gmail.com>
 <37ee69c4-885d-b94f-fa57-b8b17363ebaa@redhat.com>
In-Reply-To: <37ee69c4-885d-b94f-fa57-b8b17363ebaa@redhat.com>
From: Joshua Seaton <josh.a.seaton@gmail.com>
Date: Wed, 23 Feb 2022 08:21:24 -0800
Message-ID: <CAPbYy+_opG==TQZSe8vhN6qTCTPHnTrTxHOPFkcWhp_ZgBq81A@mail.gmail.com>
Subject: Re: configure: How to pass flags to the Objective-C compiler?
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=josh.a.seaton@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> You can use this patch (which is going to be merged soon):
Any ETA on when this will merge?

> This entry in the machine file affects the compilation steps:
>
> +  test -n "$objcc" && echo "objc_args = [$(meson_quote $OBJCFLAGS $EXTRA_OBJCFLAGS)]" >> $cross
Great! I had naively assumed that there was more plumbing involved
than merely defining the variable`objc_args`.


Joshua.

