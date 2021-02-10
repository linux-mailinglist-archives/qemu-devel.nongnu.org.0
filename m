Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1419331692B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 15:30:53 +0100 (CET)
Received: from localhost ([::1]:45754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9qW4-0001FY-4t
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 09:30:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1l9qU2-0000iz-1B
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 09:28:46 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:51373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1l9qTz-0000MT-VY
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 09:28:45 -0500
Received: by mail-pj1-x102c.google.com with SMTP id fa16so1206036pjb.1
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 06:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uX9HssvXOWTZuSig99aF5iObbgsJRwJshahAN4nMwQA=;
 b=RB3j5G4e3esTqEudfmK71k2lpSiW/XJpR17QWGxbPFmEAVWiCKD7VxcJdJ8aeA4L1y
 jxGh3ZLd4L8yOJIl/VeQP2S1rgyXlzEszKuN0NWXKyEd9bBJff9wnwBPDNm09tUw+28C
 ZKugwNgVZmKki8MnYnLHraFoFdlkHOcmM0hlN5l7zk8zWdSCGbccknH4jFCOcQV/uR18
 fFkGRMnmZggGktqrG3D+sQpheeICF59nZ9Ro0P2wn1ZoeD2j8LvpyzRquICdGVDZqhQ7
 xOIHClHNVaNhZDqFmMeoPOClPetlg0YpQTm8OWnce+gTHhQ/sScCp85fAgHE9q6YDqVe
 JPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uX9HssvXOWTZuSig99aF5iObbgsJRwJshahAN4nMwQA=;
 b=G6I8Ug9LKgqi2pMopCIb9qmDN/5Je+Dne40rQNdkmHEte9CmSg+mEfAkVLtIMZv9Fs
 O6srK/NUvEEN5k88O/ACEP2IQ66Fv0qKRJaYhUUtqvbknvZobfzguhU+tEtbNiMQ66rD
 01QQO1ZAcHlUEFiDqMOLw5G2LjUagUwJsUQNcnrb0sMjcsdWK6iZWd2Kgx+n0mCqinuX
 4EtY9gyokakk1b54H026zj4OGd9ICr41Y1V2Oi8FtPYfLmdvISY/gz2hii2cJfSYJSAa
 PsZRxT9y37uq0aXnsoVxciQrjxdeuSi3LGK/AIcA49mCyPdc8MoMYmousOioY7SCVRUS
 fdaw==
X-Gm-Message-State: AOAM5317EskfYgjYJ4HovvfQgon669R7GIMYM2dlBKNn44u/6em+3Cnh
 PX08lkk0kmewmhrMVX/UBWGNuk0I2frr6SIQJ9E=
X-Google-Smtp-Source: ABdhPJxgl+VXH09UqwZ3QnuzhV0q4yOIEU2iZaDaltcL+dAdEu+tyJeci2kjz4b56P1J/Kz68E07S5KfM7tZgj6RlhA=
X-Received: by 2002:a17:902:8643:b029:da:d5f9:28f6 with SMTP id
 y3-20020a1709028643b02900dad5f928f6mr3296511plt.8.1612967320634; Wed, 10 Feb
 2021 06:28:40 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QVZuh8H-U1vtFMhasqSsSy3OA4jmRvwZrQEAx3=1dcb+w@mail.gmail.com>
 <LO2P123MB2605DA330913C7D2DA311EF1C8D10@LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM>
In-Reply-To: <LO2P123MB2605DA330913C7D2DA311EF1C8D10@LO2P123MB2605.GBRP123.PROD.OUTLOOK.COM>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 10 Feb 2021 14:28:29 +0000
Message-ID: <CAJSP0QW7WqH1mmni84nn+id63nHLDNXd_nUDRaXKEifa2Jp=sQ@mail.gmail.com>
Subject: Re: QEMU hosting
To: Fosshost <admin@fosshost.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=stefanha@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <cleber@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 5, 2021 at 6:55 PM Fosshost <admin@fosshost.org> wrote:

> If you would like to apply, you can do so at https://fosshost.org/apply
>
> Feel free to join our IRC channel on freenode #fosshost if you have any questions regarding our work and service

Hi Thomas,
Thanks for the reply! I have forwarded the information to Cleber Rosa,
who is working on QEMU's CI system.

Stefan

