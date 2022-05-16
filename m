Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B791D5286C0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 16:17:12 +0200 (CEST)
Received: from localhost ([::1]:35544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqbX5-0004ON-Lq
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 10:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqbUz-0002rQ-Sg
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:15:01 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:41993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqbUv-0002XB-1V
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:14:58 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2ef5380669cso154516617b3.9
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 07:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7XhSi6S67esjOwLjSivS7UISK/hbpmcJCGmfQStiEx8=;
 b=w3bgh1pjL5mhlALp71tHRLcZ/PGhJ0Lb4JAPVuGgGdtYgalfVVGTgRNW0id3Ut/SLA
 ZWO0B/oc309HM+/Tpiq1tCQcXd2VCxpiSYaisvEOej32yhcmtH90kQl3Ca1XT4IySJQg
 h/XgR6fqf3E4AMWaiXYCarExYQdmwCupUouKM20WwxawujTUwcx+ruvIlzXaSb1CmsuR
 fqmabxeIxWwGUjT/qFfCDWhNwUP81HhKbC9/BFjGzy11SofQxE1NFPcN4pL9YYfdk4fM
 nTU+zGDQLK+D9YdMlaQ+2+YL91cUHVImr1lllIeFMv/cwFlszXyFxF16JhBJ46wWStCo
 ctYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7XhSi6S67esjOwLjSivS7UISK/hbpmcJCGmfQStiEx8=;
 b=P7g1RSWmyAHX1CWyBQ4ui6nWMhleKXvU1y8mvCdd1NEKZ0zDraM4NraRhEKEMtAIGv
 3rwE1VYuHK0laFhnk2BjrMOjzC17MYoXhG7wTfVq2fCbs69gCQ2LFGAa1j5TUQ86G76i
 JjgZdCD/x52g6cdx5vA93I5RtDdy1qEWIBYF7yvx+m8srAg4ONOvvNASlmHhdzMXaLIR
 zz+6loVs++EPdzYpENxwM0PTtsxrmivVQ5qmz6BZm9zUk8mQvv7zTeEOWOSl1jqJdmbL
 eQ+EXsqBsCnlrPCHyb/6AfZyDwuEFCUkDNYK8oqMq5YZW2Q9emUYlHNLWvHoBaQRUYX1
 ERWg==
X-Gm-Message-State: AOAM533K8sa2dJw/PlT0++KYhRbBuLe7/fTiz3wF3OXrSJqiUecoIleJ
 i7kpX+hAG1U9epzhg0P6n9/ijhTB8GyAFOA32qLTTA==
X-Google-Smtp-Source: ABdhPJz9AvzyiJ/q3mYuLRIBiarGD2+meE2+2BIZfL2xnbQAt7TgayGhD4DoVT7Y6EuXpvfpCWKfB269FE0WQokNxr4=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr20235255ywf.347.1652710490385; Mon, 16
 May 2022 07:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220516115912.120951-1-thuth@redhat.com>
In-Reply-To: <20220516115912.120951-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2022 15:14:39 +0100
Message-ID: <CAFEAcA-0uQH58GTVbEx5hNNzwmz08YLd8TigjSZ==uYd-vqaBQ@mail.gmail.com>
Subject: Re: [PATCH v2] Remove Ubuntu 18.04 conatiner support from the
 repository
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Fam Zheng <fam@euphon.net>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Christian Ehrhardt <christian.ehrhardt@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, 16 May 2022 at 14:04, Thomas Huth <thuth@redhat.com> wrote:
>
> According to our "Supported build platforms" policy, we now do not support
> Ubuntu 18.04 anymore. Remove the related container files and entries from
> our CI.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

minor nit: typo in subject: "container"

thanks
-- PMm

