Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEF635576C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 17:11:52 +0200 (CEST)
Received: from localhost ([::1]:50892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTnMt-000063-Un
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 11:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTnKM-0006dW-Vi
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:09:15 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:37656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTnKL-0001VZ-Ce
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:09:14 -0400
Received: by mail-ed1-x531.google.com with SMTP id s15so2033925edd.4
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 08:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1jU/PTEDy4yshRVzlm19PH/6aLAyV83IUVFlX4jw1is=;
 b=bjtqzn4JpgsmYmj3erm6buzXOnC7hfGMpUnQSbynwJ+XrLRIAZEJYsPYXWvA6DbVnU
 uMYa8kZH7U/0IL33ic0h9aySle6ZaWlIHCeh9hjtJ2O06SMzcxnp+RhSiOQqYTL/mm6x
 o1wQj8nu3/lnllODghenSRgjB2M5ijJRwWqhJWUzaJA770GH7nEKPrhScJRC0xDlmAmY
 0W/x7rQnwIrDAHz1ldanHKXM5DbVlirDStkR/0DgI+v0kRaXpfx62XBCyQGjV9mSXDJ4
 LDvWQmpBB+XB1NAHzJk0eh/3qaxbbrlm2z2fJjGBzgECZIuydHhFUEuU/9246YNmKOWP
 tYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1jU/PTEDy4yshRVzlm19PH/6aLAyV83IUVFlX4jw1is=;
 b=njlZgbbdzN5eiU0Wxr0Kv4yfsKCPiZIEQb/VYAbbXmclXUHOVvld2y+O1X6pRp7o6i
 +ekx2g+AQ4htXUtON5nkazx7QyBcHKXX7bWLycb7TSr6Uvs9VaAwFEDxhlBZHoOJTfHW
 LXVFQIv3krQ+n6eUZSdI4wL+F2mMwoMDElNz6y457X3fEFVYTljYdJOBAkGp+vbC1itb
 ELEXozommoTgxeSLxYgcukbsMRe2nV6eK4cm/6kwGUqg7QDBnQyZ9pmu/HE/bIe5nFEu
 ABLs/dshCCDoz5YfCoeDt4cHZ/8fPwkXQWlW+1BSUrSV16Bev38WANWLTGxnUo3PPqeM
 FMSg==
X-Gm-Message-State: AOAM532qcbwLzFxKdL47ow5JV+BW3wUuirwbvvIhv7+jKL2KRm9I/e3t
 /AP/qFE8R77jp8YDxfBebmNTjnud+Ac5mMTiCbn3gw==
X-Google-Smtp-Source: ABdhPJyos2woXszHHk8oXHSaLnPWqONtveAjCkSg9RNMYsSjotxifw6Wv0EMQjjEOCKsKk7ef/fauEKFCjb5KVZatSY=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr37946728edv.44.1617721751875; 
 Tue, 06 Apr 2021 08:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210406141909.1992225-1-jsnow@redhat.com>
 <20210406141909.1992225-2-jsnow@redhat.com>
In-Reply-To: <20210406141909.1992225-2-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Apr 2021 15:08:33 +0000
Message-ID: <CAFEAcA-qh9GQSs=JFcoN74gKF-6+DDL39T1kUbAmmcA+AS7Xzw@mail.gmail.com>
Subject: Re: [PATCH 1/1] sphinx: qapidoc: Wrap "If" section body in a
 paragraph node
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Michael Roth <michael.roth@amd.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 6 Apr 2021 at 15:19, John Snow <jsnow@redhat.com> wrote:
>
> These sections need to be wrapped in a block-level element, such as
> Paragraph in order for them to be rendered into Texinfo correctly.
>
> Before (e.g.):
>
> <section ids="qapidoc-713">
>   <title>If</title>
>   <literal>defined(CONFIG_REPLICATION)</literal>
> </section>
>
> became:
>
>   .SS If
>   \fBdefined(CONFIG_REPLICATION)\fP.SS \fBBlockdevOptionsReplication\fP (Object)
>   ...
>
>
> After:
>
> <section ids="qapidoc-713">
>   <title>If</title>
>   <paragraph>
>     <literal>defined(CONFIG_REPLICATION)</literal>
>   </paragraph>
> </section>
>
> becomes:
>
>   .SS If
>   .sp
>   \fBdefined(CONFIG_REPLICATION)\fP
>   .SS \fBBlockdevOptionsReplication\fP (Object)
>   ...
>
>
> Reported-by: Markus Armbruster <armbru@redhat.com>
> Tested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

It's a shame Sphinx doesn't diagnose this kind of mis-constructed
document tree.

thanks
-- PMM

