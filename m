Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C5B2ED32A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 16:02:59 +0100 (CET)
Received: from localhost ([::1]:38684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxWoU-0004cQ-25
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 10:02:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxWnI-000479-Rh
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 10:01:44 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:42471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxWnG-0001pg-WB
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 10:01:44 -0500
Received: by mail-ed1-x52a.google.com with SMTP id g24so7994568edw.9
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 07:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0WcJsRUATsM/0+Cv91J2+OBSup0jvNmvdz+o7muULN0=;
 b=F6h+C1NBEGVv+ZXqIQtz2XCPI+zjCRk8cHxxEx93ha6icDGVM70ELfG8RmETsZZAM6
 NlLErhSk8eCXqwIkanrF3k0NuAQcz/YcC5tJjvmhhTKQRU6VYJQmalDZjjUbrHbPBb7q
 kS2rMZaxO8okkHV/tk1c2kqwVMTYKK/b1K0XoEb8FEmAWi+FxQHvYM/DAPcrVt/2l5Ky
 NJBq+Jmsh8W87IBY8HlZoBUBNDLtzf8c02P8Ez9xrBBDMyklkmXp7+S/BeT/vWMTS5c1
 kcYefD8R0mGxTl1pBQ0W36ZSOjwG381Kr39yzqTP38u1ars9VAZWDwm2MCbkTKYANJ/m
 eX1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0WcJsRUATsM/0+Cv91J2+OBSup0jvNmvdz+o7muULN0=;
 b=nEuWYCi15qQYytAb+SbHXzcM7K4pE3P+Ww72DdZ3ZacPGusil/jQUw2FgnDGtioF9L
 fvo14dtakpRWr3zEEEyk02mou1i+y24gacIFMNNVVZcrVTl6lGEKX2AkkDwin6AAkXB+
 hU2SPLFGg5X6C6gutSWNtpcMC7vfHA31ZQKQEWNH5V67kuuRGNBimbgJd/DVSAg646sr
 rjrEHe+3pderyO2R5YSbBmEkFoudzCrYydl2NHjehmxs1sRozoUIkD9+IFir92FqH2oL
 tSNGhuK05X8J8ZhmazIorQqXEoIls3vbo4plf/poPE1tRJveNV0PHDMoYOH6J/NP/OfX
 6PSQ==
X-Gm-Message-State: AOAM532l+l/7YnJBWdJu+21HnbbSKrsptOzGdL9JZ2JmGnbcvvL7WbQv
 rKdxc8jlLORLrRIrmMHQjQs1hjgWruyub8sNiuTUbQ==
X-Google-Smtp-Source: ABdhPJyeLIejm9uikHreU/kvUQ0fV3WdI2d8/QccqEKNyhnIjJ+EAUbCC7257D1TWhnSscvpTswX7i7lkwpcrgqr2dg=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr1957710edw.52.1610031700500;
 Thu, 07 Jan 2021 07:01:40 -0800 (PST)
MIME-Version: 1.0
References: <20210107140039.467969-1-pbonzini@redhat.com>
 <20210107140039.467969-2-pbonzini@redhat.com>
In-Reply-To: <20210107140039.467969-2-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 15:01:29 +0000
Message-ID: <CAFEAcA9yyUUmd+hj6kgAV8KWtCC41Q55JRfE0q1zTaDaOofgOQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] build-system: clean up TCG/TCI configury
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 7 Jan 2021 at 14:03, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Make CONFIG_TCG_INTERPRETER a Meson option, and enable TCI (though with
> a warning) if the host CPU is unsupported, making it more similar to
> other --enable-* options.

The current behaviour is kind of deliberate. Using the TCG
interpreter is a terrible idea and think it's better if we
don't let users end up using it without realising that they have.
(Personally I would vote to deprecate-and-delete TCI, and also
to just have configure error out on unknown host CPU architectures.)

thanks
-- PMM

