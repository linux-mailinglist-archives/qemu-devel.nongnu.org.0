Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A413D7076
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 09:36:32 +0200 (CEST)
Received: from localhost ([::1]:33830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Hdf-0007As-Ih
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 03:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Hc8-0006Lz-PT
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 03:34:56 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:43577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Hc7-0005l2-1O
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 03:34:56 -0400
Received: by mail-ej1-x630.google.com with SMTP id ga41so20456006ejc.10
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 00:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ecZnnuuQVdyeJTDzyfNWgz84AWUOXf6o3fNUGnhUp9g=;
 b=bUW1dm/QT1appNet+OeZmEiYEg/zYKEO4tsdjhSi4kbKpvtEnUXSOa9kQxeScdG1uf
 m7GcW3Nlxcd511nbzw0htMEre1loHOHamyzdmWCsBK42mAFqQmlpXbBYQS0PRazJy1I4
 IX2yQu+bSfdpDhdxJ+Ay9Uato9nQ4cx/azYQ84mE+EU6ZoI2mNQyBxz1knntDOg76bAC
 uC58g7ihfA/KqKMs6dX+dTsaaY82hIdo4eryh4i9gY9OETeh8V8XUcex5xwbqmzsi4AM
 9RLbndFhRQKgtJzlgGCq+xq5gX+Qp2SD4OamJLQ7PeOsb44y1F42RReuB//uDM2iCbUD
 vezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ecZnnuuQVdyeJTDzyfNWgz84AWUOXf6o3fNUGnhUp9g=;
 b=bxJRpeEqzbu1nrXUmZkblHv5EWd0vPnCfmM8XFOUZ5dbjz9oIg1ub1gThEz79K3SJJ
 k17Tn0QqOG8iwj07XEZmwoSkip5I/5CLU8iG49Y2pL4XgM28DqUlWytA+7eiWmOItd6s
 y86wqi63wJF91R2IQJTDv3/81C38j/irmwttkWKagcSe8FEHZcwv1yoRcuWHOndvrQfT
 fZavsixw78/wRrYjplQL6xpJiS8y3NTIo0q/5XMO1sMkijLcuyjytTk1ZAetw4sT4bop
 trbJx/2xSjedr4mkahD9S27E0GwbyeBWK9eQx4/iiidq2xpSljYMnTwzL781Sw8GD+6h
 e+wg==
X-Gm-Message-State: AOAM5330JyPMf8e3jF3I4BExMm8hRQZ9OB4XcsgomanAHkX3OuxJjugd
 QWhhLiRAqNUMdQ5PANqafXKtEOgIKJo8pjlWj2h6cg==
X-Google-Smtp-Source: ABdhPJytniFAB2MWWExz0iuqAADa0p3saKnLNrpfCRUyGddmcncseT6yAqs9QN2qkwvdqCNjKtf9TdSq3WT6QfV8ajc=
X-Received: by 2002:a17:906:16cd:: with SMTP id
 t13mr21186463ejd.250.1627371293379; 
 Tue, 27 Jul 2021 00:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210726110544.1934386-1-kraxel@redhat.com>
In-Reply-To: <20210726110544.1934386-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jul 2021 08:34:11 +0100
Message-ID: <CAFEAcA91AP-aXk0LiYLLCiakkMskCj8tYgREyFzjPKgbMRC+gA@mail.gmail.com>
Subject: Re: [PULL 0/6] Fixes 20210726 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 26 Jul 2021 at 12:05, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit a2376507f615495b1d16685449ce0ea78c2caf9d:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-07-24 11:04:57 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/fixes-20210726-pull-request
>
> for you to fetch changes up to 584af1f1d955476aacba3350c4efb5865fc91c09:
>
>   ui/gtk: add a keyboard fifo to the VTE consoles (2021-07-26 10:24:49 +0200)
>
> ----------------------------------------------------------------
> ui: fixes for 6.1
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

