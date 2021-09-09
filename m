Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E177405AF6
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 18:34:20 +0200 (CEST)
Received: from localhost ([::1]:33606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mON0F-00035G-Gk
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 12:34:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mOMxv-0001N2-BE
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 12:31:55 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:41528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mOMxt-0003OV-GW
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 12:31:55 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 u15-20020a05600c19cf00b002f6445b8f55so1877858wmq.0
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 09:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1YUKj1oKXvQx96qSmi5sAgOQP/nHflJAVZ08acLGCgU=;
 b=lOlwUYhTA6Xd2HLmV6gcXSjugq/4SRLAvVUDPMW0qliF2IbYHBZ5IdWHGW8J7YTrN0
 h7uyewM29WYOinkxoVwbJ+NI/9tqG+wy4WSUS0BE4W1TpsEtW8bvDjarox18einE9sRU
 BOy18zRoub+OVp0ELN3Fj3qU7MhfjHpl7lEFQfPNjTHf3VGoCE5iHmx/8evdRsLzFLRM
 cxn252nF4bOGBnExjIAbKuUi4R+1hZ3eRySINKkgGaMO+GFXLwlhtJkirYRltN4Dry9u
 Ej46eVyMMzCvJmEc6ogVLx5/KEQw7rdhVwRzoyQSZzc3rJY1iJBdh4QHN1LxXWkoYjx2
 +Iaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1YUKj1oKXvQx96qSmi5sAgOQP/nHflJAVZ08acLGCgU=;
 b=rJCpWcnZ+dIrw0rFXL9jKN6sSSEve8wXfgvJ5VwPv8Wtds4rX3upF2Im/6k1z6h29Y
 WdaGEaA67nCrSQAzZqV8O/DG2rQ389QhBVnZkYA0J11H0eWTOzn1VVB5PADDxke3tWSv
 jxBEto89+NlvY1mGJBbluH+Xog4X3oeLmR5FQAUzfhZILLx2pfzRx4oiKOtIUkbMZdnl
 3j17swjcj76bTjS9YuWqJ2xpznxK5yk5ZXiThcRFGDqbjLz7gSaKsrYTuGG7bjS7NsNg
 +w1AU+1deuGVhsQhQw4azWGPKuhqTo0TgYuDKmDX/Xa1vkV8O5AvVDhNv+5jvY65tUrL
 06PQ==
X-Gm-Message-State: AOAM532QEkBxNVxsWzs4QrzUe/7R4l94vs/tk5sFvwqkEwS0oHobxM/r
 EimDLbnxzTF3qkeF/Tl9n/tSkCntn0o=
X-Google-Smtp-Source: ABdhPJxaOpsLA7D2bq0nBvPfY4HP25L6G4Fs90uQcNKbHjvDLO/MaD9Rq9KWCLkY4NIgFYH7OhXaYQ==
X-Received: by 2002:a7b:cb04:: with SMTP id u4mr4022900wmj.18.1631205111753;
 Thu, 09 Sep 2021 09:31:51 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id k1sm2136111wrz.61.2021.09.09.09.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 09:31:51 -0700 (PDT)
Subject: Re: [PULL 00/42] bsd-user updates to run hello world
To: Warner Losh <imp@bsdimp.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210907215332.30737-1-imp@bsdimp.com>
 <CAFEAcA9kF08A1PyPmBXfWykWZwP4+MoPOvTn4diu13Dkq04SVg@mail.gmail.com>
 <CANCZdfqpoqgyqWoX=y_GFfjhphGbZjWk2yS=ZTcrAiZa9Q3BJw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <344864f6-38f5-1478-5945-20c82f21d426@amsat.org>
Date: Thu, 9 Sep 2021 18:31:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CANCZdfqpoqgyqWoX=y_GFfjhphGbZjWk2yS=ZTcrAiZa9Q3BJw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.975,
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
Cc: Kyle Evans <kevans@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/9/21 5:12 PM, Warner Losh wrote:
> 
> 
> On Thu, Sep 9, 2021, 9:01 AM Peter Maydell <peter.maydell@linaro.org
> <mailto:peter.maydell@linaro.org>> wrote:
> 
>     On Tue, 7 Sept 2021 at 22:56, <imp@bsdimp.com
>     <mailto:imp@bsdimp.com>> wrote:
>     >
>     > From: Warner Losh <imp@bsdimp.com <mailto:imp@bsdimp.com>>
>     >
>     > The following changes since commit
>     f214d8e0150766c31172e16ef4b17674f549d852:
>     >
>     >   Merge remote-tracking branch
>     'remotes/pmaydell/tags/pull-target-arm-20210826' into staging
>     (2021-08-26 18:03:57 +0100)
>     >
>     > are available in the Git repository at:
>     >
>     >   https://gitlab.com/bsdimp/qemu.git
>     <https://gitlab.com/bsdimp/qemu.git> tags/bsd-user-pull-20210907-tag
>     >
>     > for you to fetch changes up to
>     dc96376e46a52ac63a27ea185c3f0a6fd54e3c82:
>     >
>     >   bsd-user: Update mapping to handle reserved and starting
>     conditions (2021-09-07 08:26:53 -0600)
> 
>     >  slirp                                         |    2 +-
> 
>     A bogus submodule update seems to have crept in here...
> 
> 
> So I need to fix this and resubmit?

Yes, but since there is no change in most of the commits, you don't
need to repost the whole, once pushed the new tag, you can just
post the the cover letter (which triggers Peter's scripts) and the
fixed "[PULL 07/42] bsd-user: move arch specific defines out of
elfload.c" which updated the submodule.

