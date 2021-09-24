Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E17416EDC
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:27:16 +0200 (CEST)
Received: from localhost ([::1]:41804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThUA-0005Yi-Cn
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mThSz-0004jh-VT
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:26:02 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:34483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mThSy-00035z-9L
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:26:01 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t8so25502452wri.1
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ur5WFZhAGFzS1ntsVV+a5XE8z52K++qXUNLHFfNLphE=;
 b=nX/M9oCK9I6xEdEohEIScy3HnxscrhWykuh5SnFHv0ykOXMWLZiIKanbUV05ZEJPif
 32C0mXATzxCA8uDPJtgWzcf/0OF9CwhxGaG6bRexeCOKSI3werCjshe6BekBkJqTEi7I
 ByC1MnREMtZsdBnz4NS3l9i8OhAHYzN2yJCP6u/29lUmlgxMJ5BcLGiIgC3QRNnsWM/D
 HEMYqpU70sqT0yWNkctFgxYxJendh00rO1qSQyRxILsB5LWdoqHU4+p9pTQj/hBPqt4j
 HIlkSdPM6XzPkLm4HkVkxePUBpkWGYezWYOrm3GqsVVAvulgUCXpJ4Kd4NHAbeapHzk2
 Qd2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ur5WFZhAGFzS1ntsVV+a5XE8z52K++qXUNLHFfNLphE=;
 b=yJxCRT7HYw0zXZ00VTnRYrtBxDdEgJIKBpCo+WD4tstpAy1DwopqaQcBZaqxdOZ9W6
 LEqCW04UjwxLS5NoNaUGJ2MVYSrummdTU44QiTwoKDlBjCqu/PUJHg8xXgqqY6Vhq8MN
 2twkwBsKQuTbDWS1soT658MuMhmMFJ0ShbJKjN7D0b88HTDC/+VCdhEbAE3McPPR1rF8
 3cGQGgIE4R+3nNFIoCVYoRDOpMvyKAoiseajcGoyqmLGaGeTMBiphOVlT6suPmMgE8uO
 REN7ZHeo5iyVZ0VXpHRqjZmT+aSaAzC1YA6/gnqD7kCV7W0GwFJZcTgtGBczNZDrY83h
 nc0A==
X-Gm-Message-State: AOAM532I0CyPhipDCD/hYaaQG7PnZaYZWHBj/yQRHD2vZvteUTZ6mqXe
 7eOxHISfLQRTE9MjCkkys4xXy9tM+fZh0xgHyaWu5Q==
X-Google-Smtp-Source: ABdhPJyYj9vM8Yz0yLWKnBVFOLNs/K4NyGxa8pSjPeGCaRKsWAqX9Kwrk6Cw68dH+h1GH3NCbGXpvEmf4rjKFOBhEB8=
X-Received: by 2002:a1c:a54e:: with SMTP id o75mr683664wme.32.1632475557585;
 Fri, 24 Sep 2021 02:25:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210923191323.59726-1-jsnow@redhat.com>
 <20210923191323.59726-3-jsnow@redhat.com>
In-Reply-To: <20210923191323.59726-3-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Sep 2021 10:25:04 +0100
Message-ID: <CAFEAcA_2xVWAUs==JkicS9m8WZvU-s_ieNZy-4+jjYz-N0as=A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] docs/sphinx: change default role to "any"
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eric Blake <eblake@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Sept 2021 at 20:14, John Snow <jsnow@redhat.com> wrote:
>
> This interprets single-backtick syntax in all of our Sphinx docs as a
> cross-reference to *something*, including Python symbols.
>
> From here on out, new uses of `backticks` will cause a build failure if
> the target cannot be referenced.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  docs/conf.py | 5 +++++
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

