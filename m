Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A57D3BF539
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 07:39:46 +0200 (CEST)
Received: from localhost ([::1]:40966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1MlE-0001r6-Ox
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 01:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m1Mjf-0001AW-Dq
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 01:38:07 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:39477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m1Mjc-0000mi-0h
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 01:38:07 -0400
Received: by mail-oi1-x236.google.com with SMTP id b2so6470844oiy.6
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 22:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xjw2k1ABWJdaKjNmOkqk7x0YEyOOnm9iGe1LGaslSY0=;
 b=A5ZuhJL5fA3H+hW6CebLU9jeu0orEcmkghMGuERIFX/NRG4BSfI/3nrM6QVmfeGOOA
 8PxjVomzip6pD6ppNb7gDJN4DQson5WEO3mFpAyOennja3Km7WsoReOoalnCFa+B08eW
 hv5kjNdC+ZecSnYsb7F4EHAcgRvs6hXBh+uEryx5cA0rA0qMlS1aGY0NDGh41YxkQZ3D
 Gx3ZBfUgdL92onZmJUlhEqC2jdLUHsXN2kC/b9CEtLCzI+PIrIxiJeoFxF3oJvqQJqZ7
 MHD/0vbk/YWnrBntHlrThg6dklhZpSt2Y3c8amGPJB7vKqWQfOYkVR9jGHBNYa3XS3Ah
 QZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xjw2k1ABWJdaKjNmOkqk7x0YEyOOnm9iGe1LGaslSY0=;
 b=RH21N0QJ1O0IxxTvsdmyyXt/7OWM2eMkgrfib4cPVRr+s1xE9W+K60pz1BS4WpQo5/
 MseQyFLCeBma2rWtBUw0D7GjXuOOS4L9o3YiyYi21tWOzmKllQtgnhuBZXScQKcu3u+f
 5uL1YGpEFw/LEfhJ36xgy+0stcj3xMDN1YMNfcufGWRevbwI05wXp6uIGVgkLH+lfmFZ
 Qp5AChFSxkfPrwXKcPvF38bpAs0XqCa3WH8FTxT4MiZrS+umN0peucFEkHA191d+2Da+
 HhRbqHkpHo1khmF8lssUJqr8AjwiYuxs4JMlBw82hAfx67mlMYPzH9znhQMjc/MR4lIw
 Ozbg==
X-Gm-Message-State: AOAM530CBfbqW0bZMYziNRYJw2kZDCrtZu/TFS+o9HuBFnYsw4NYseLO
 U+ejmUTC+OGkCp58CF6qnh95zmeNz6gjiA99W1A=
X-Google-Smtp-Source: ABdhPJw27iKSAfnccF0U2DBDFUtXz1o60qg3BzgPYpHmAkXPI2H88wa6MEaaSzHkywAEIuPzjnp7+eGzItRGiFPrv3w=
X-Received: by 2002:a54:4e87:: with SMTP id c7mr21397518oiy.143.1625722681971; 
 Wed, 07 Jul 2021 22:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <797ADA26-0366-447F-85F0-5E27DC534479@gmail.com>
In-Reply-To: <797ADA26-0366-447F-85F0-5E27DC534479@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Thu, 8 Jul 2021 14:37:51 +0900
Message-ID: <CAMVc7JXgn5ttSEjPB_=rS9CsYiQOFS48hcAbr3NQnom-qk75VA@mail.gmail.com>
Subject: Re: Picture missing in About dialog on cocoa ui
To: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oi1-x236.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

My installation correctly shows the picture. Please make sure you
install it and run the installed binary (not the binary located in the
build directory). The new code should work reliably once you install
it while the old code may or may not work depending on how you execute
the binary.

Regards,
Akihiko Odaki

On Thu, Jul 8, 2021 at 2:00 AM Programmingkid <programmingkidx@gmail.com> w=
rote:
>
> Hello, now that the code to add the icon to QEMU has been restored for Ma=
c OS, I think it is time to revert patch e31746ecf8dd2f25f687c94ac14016a3ba=
5debfc. This patch was made to fix the missing icon in the About dialog but=
 it doesn't seem to work any more. I do not see a picture in the About dial=
og on Mac OS 11.1. The easiest fix for this issue is to revert the mentione=
d patch. When I ran
> 'git revert e31746ecf8dd2f25f687c94ac14016a3ba5debfc' the picture in the =
About dialog appeared again.

