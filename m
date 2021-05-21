Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF1138C93F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 16:30:31 +0200 (CEST)
Received: from localhost ([::1]:48526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk6AX-00009l-Mq
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 10:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lk69l-0007ud-K2
 for qemu-devel@nongnu.org; Fri, 21 May 2021 10:29:41 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:33384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lk69j-0004sl-Su
 for qemu-devel@nongnu.org; Fri, 21 May 2021 10:29:41 -0400
Received: by mail-ej1-x630.google.com with SMTP id z12so29334521ejw.0
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 07:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pdub6D7sV0imYGC0/OXY7yxI4FQou6c+CXhhLwE5v04=;
 b=gZ9hvzjem22ibr5vd+g+dcccO7ZWuTp6E53wc7mKH5dicLzG8N01yPZf0GLt20zLWK
 hEzdeJNJddEYmwYUPno0lXW+tPoqPz5IuXKfLudi/BHVIupMAwatmdkmy2BkavQ2pTy+
 Q/ZGfK62KGvauijDEEVBfARtcENoZdlVkdxxWmfr8Qjv09v4UlRYupDFzhOcxuhfavcD
 jQvl/hu5tsQWZRCHD+pUGTW2wRehircjBu1EBKEkZN1tSmcAz9+nNjH9c529Jo65EGlv
 gFfVcLm406CJ1OtiHsm62pUMFfE5YAstfX+m4sOJ52BIvuDt3Q5fEa2/+mOoOjOmBadp
 wNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pdub6D7sV0imYGC0/OXY7yxI4FQou6c+CXhhLwE5v04=;
 b=UAJ7xBAzhtmF+3fTrU7qqHA9bBXjHhXVQxxkXt87FB96PqiSWbcwDqoIQKPwY7Y7zS
 SobJ0vPIJXcnktY/UAGbuxwIbdRcgh5IzDm1O/xiV9+z17DPanPDq2+5ugkDz0HPFOmL
 poZmw4Ks5FJPpP9r7LStmcExMiY9BjlBUMcQ+IrNq8RmHt7GQ72nicPwwMpp9hxxH75T
 qYQcXzZx65yiTsojoYrEESGy0gmlvyF519i4mn0QtMk89ghytdVHQwtH+GVom7uJBlzb
 wn/m3Jr3AfomHQclfmTUDTnWDy1FgtlfakUpwY9nfEKPyk9rqo3vP2EXQrXhrIz4vwUb
 uLkw==
X-Gm-Message-State: AOAM531mdyVzrv7CzcyRN0IPwHV9iG3BzCBXwTFetWHtrra0Vnkbjnmc
 zRNo5Kt0o/+mz4TnJl0DlL8LJukOb7gsBnJEfdj4MQ==
X-Google-Smtp-Source: ABdhPJwC2VlJwooTq2HYo1FkPwhtCoxflv/1lCAq/Bgmcx8IMs/RrfqkoiqfPsOIe3HyWoKbnIqmdc69E5GfKxwrco0=
X-Received: by 2002:a17:906:bcd6:: with SMTP id
 lw22mr10835261ejb.250.1621607377791; 
 Fri, 21 May 2021 07:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
 <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
 <a95cfa21-dde1-cf7c-a4e4-a5cf43c1de1d@redhat.com> <87sg2gb5lf.fsf@linaro.org>
 <b53b690c-f542-cc35-35a6-e577529ac303@amsat.org>
In-Reply-To: <b53b690c-f542-cc35-35a6-e577529ac303@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 May 2021 15:29:18 +0100
Message-ID: <CAFEAcA98XBN2x=FvJod8U4+NM3fpmJigQsWoi-v4L5HXQpT+Rw@mail.gmail.com>
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 21 May 2021 at 15:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> If you think these tests belong to tests/tcg/, I am OK to put
> them they, but I don't think adding the Avocado buildsys
> machinery to the already-complex tests/tcg/ Makefiles is going
> to help us...

This does raise the question of what we're actually trying
to distinguish. It seems to me somewhat that what tests/acceptance/
actually contains that makes it interestingly different from other
tests/ stuff is that it's specifically "tests using the Avocado
framework". On that theory we might name it tests/avocado/.

Or we could just leave it as it is -- is the current naming
actually confusing anybody? :-)

thanks
-- PMM

