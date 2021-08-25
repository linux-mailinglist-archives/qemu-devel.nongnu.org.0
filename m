Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACC83F7D08
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 22:11:58 +0200 (CEST)
Received: from localhost ([::1]:40816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIzFS-00019U-KF
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 16:11:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIzDb-00080j-Uk
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 16:09:51 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:46931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIzDa-0001uE-7R
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 16:09:51 -0400
Received: by mail-ed1-x532.google.com with SMTP id r19so846483eds.13
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 13:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AHa+dVUAIdoEfqH3LV5EKAuvAXgJRi1JiwORlCTFiuE=;
 b=pDROaHeB2rn/VTJtOtZxSmipuyDIDrkaK+RQzNmqsWnziTfbAraTWWtD6b+eo57so8
 VoI2dy4DPQOvcG6m/85+R5eFnccpEp5A9rPV9eFBzfLa/9GuSBjjO60MRYXZqoJuiKqT
 J6tTRDminyx/N3EHiqMfwwzpwXtXj+cjCm8lxxxLOYfShudMSBdxtMMdfF0C3C+WVxGo
 8dKzHwcNEuDJethtBmDC//iV2EmVSkX2s6eLuXoBxdqgIKY21bN5wYlefN9rs7nN4W+A
 /dw+Sv/zIZE0ju81ajk51/n6yJ1BL5AN5E27BqqKQM95trzcjEVl8AkmRHH6Ydv3lMua
 x/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AHa+dVUAIdoEfqH3LV5EKAuvAXgJRi1JiwORlCTFiuE=;
 b=E6cvfgP10ruFfJP1ilTrP7eb75haMCJe6TdrVlBKq9Dey/w4e8Qk580bFPjcIy+ufM
 PCFDzj6qIrPBnYRKgEgG1R4wz5+gQkBLo+V/ufcb0GBtMV7zBxvAyRMyQwqrSWF6KtAg
 Rrxav0TE4VEnHozFQWRq///c7zrgoXgtMlH3ibG0imOe7TlyyfKdYj0B0BFbjAwhASVH
 SYXos6aeT0Bn9H8/bIhTWjmaRMK9qOqTAdpa44LJWvr64ky1Zveg4DY1Vaglf89pkyNN
 SyjV9rgw5j1WZPiu8WSEpNgpxIcbSx6BMFs0t8CRZxvU1Oe71rehUOUMPKPHVXpjEP9/
 k82g==
X-Gm-Message-State: AOAM5322FeKSn5i444N/tC105SdqM2zUMBQW5K6AzPf1oLSOkclF0T2k
 qdfqjnYVZWTk0m8zTY2cNF2KmD8umLG2Fi7KDa9iKQ==
X-Google-Smtp-Source: ABdhPJwLAzget5eRArDn1iebLMpiuFDUUKmUQdatoHvkNWShED857+Sqr/7QqYWrpwxcVHfwJUhgIwIYC9aFZnVAk2s=
X-Received: by 2002:a05:6402:157:: with SMTP id
 s23mr344584edu.36.1629922188324; 
 Wed, 25 Aug 2021 13:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210825110018.100913-1-thuth@redhat.com>
In-Reply-To: <20210825110018.100913-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 25 Aug 2021 21:09:01 +0100
Message-ID: <CAFEAcA93qZjbu-L=b99JYxiLyvd06Axo5WKTQogP3O3+9r3B+Q@mail.gmail.com>
Subject: Re: [PULL 0/6] documentation updates
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Aug 2021 at 12:00, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter!
>
> The following changes since commit f9baca549e44791be0dd98de15add3d8452a8af0:
>
>   Update version for v6.1.0 release (2021-08-24 17:59:52 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2021-08-25
>
> for you to fetch changes up to 2e8801988282bf3a45b495efa8438509ff68056d:
>
>   docs: make sphinx-build be quiet by default (2021-08-25 12:19:18 +0200)
>
> ----------------------------------------------------------------
> * Various updates for the documentation
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

