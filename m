Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F007166457E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:01:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFGKX-000099-9m; Tue, 10 Jan 2023 10:14:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFGKU-00007o-Gw
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 10:14:22 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFGKT-0002Ro-3q
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 10:14:22 -0500
Received: by mail-pg1-x52b.google.com with SMTP id 78so8432107pgb.8
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 07:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oOwy63v1dDoCpWWdk0xyMVf8vfYo6F/FFfZ+jCSLrJg=;
 b=uaKnivNX24MkBTMikO1zVrRv37B5IGUoonbv6xlSgXpsEHgApz82xjkwQoGWgFhN3O
 kRF8gCrb618xsfHRiw14guCbVwr49n20PTBfc0uGJsAzdLRN9cMtCyR55KE/G343MgnD
 U+yLgx0YOHuctsWcdQROb/bDu5rqkPAP9UNkfWIH1b8aXVtBe7oVmnYINO6lbhyLznYY
 OU/MQt0252hGEr1GqcboJlc8kM+o2hrGqzuJXeq9DQc/EzUgZIU7v3QQ3uMrQW/o7Y2F
 CXe8Dg8l9EUW+uhPNbAmIta0abd5fgp3+SxWnjOJP7kr+v124TJ6nJVA+4LEF4a0yrah
 6u6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oOwy63v1dDoCpWWdk0xyMVf8vfYo6F/FFfZ+jCSLrJg=;
 b=ImVVmYOgx4DbBYnGy0915ouJh5X4rl6wYPzjaAhOVvLph4xgN9g+/1f/c715uQ+sSQ
 RIFdxwgphTS0dcZvU7pQLsuXCtFxBJDHlxE3l3BJsNtYBivVXJO4bP0zndrjwdPCKabH
 Wzezqx5twnpJERv1of4R1GZoJWGaRT0R/9qzQrpXg08FQO3RaHWN+cTk5x6t++SLQnfo
 IW2FsozsgDlNzZ1mr0jA4D0KtNk3TIr7s1cTVU0eobFmqzrlZ/5qaP/wld8K8laXabZH
 DsyMREyPRK8nmZfR66D7jGZ4LpGTwJAl4j5cK8fzFJSRL15KUycZMQayrZcoKCP/9+FG
 pF/Q==
X-Gm-Message-State: AFqh2kohBLCT6FbQycVrEaE8e5k0+cnCEityetKv28GRWObS0Txkyym2
 2Cmn1zjoOL3o02rb2D13S7/UYJZ5Jx/N+BHrha3uZmoFyWh4lw==
X-Google-Smtp-Source: AMrXdXsND2AQEyBik3KrJdW62WJ1DAtvs/kvgilnHeFCjYbZ5xBOVStmCa3g+YpXfkZziggLcA+naHBLnEsDf3igHLI=
X-Received: by 2002:a63:9d47:0:b0:4af:9f91:54d1 with SMTP id
 i68-20020a639d47000000b004af9f9154d1mr721077pgd.192.1673363659610; Tue, 10
 Jan 2023 07:14:19 -0800 (PST)
MIME-Version: 1.0
References: <20230110151318.24462-1-peter.maydell@linaro.org>
In-Reply-To: <20230110151318.24462-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Jan 2023 15:14:08 +0000
Message-ID: <CAFEAcA9Nynw=SYxL3trYo382XLqnpWDx9P1qK6t05PvMByXf9g@mail.gmail.com>
Subject: Re: [PATCH] Makefile: allow 'make uninstall'
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 10 Jan 2023 at 15:13, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Meson supports an "uninstall", so we can easily allow it to work by
> not suppressing the forwarding of it from Make to meson.

Oops, sorry for the double-post; both emails are identical,
so just ignore this second one.

-- PMM

