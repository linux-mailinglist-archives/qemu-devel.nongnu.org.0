Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB1615087A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Feb 2020 15:35:25 +0100 (CET)
Received: from localhost ([::1]:42022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iycou-000769-Gj
	for lists+qemu-devel@lfdr.de; Mon, 03 Feb 2020 09:35:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39481)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iycnn-0006Gu-WD
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 09:34:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iycnm-0006gQ-Mg
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 09:34:15 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:39705)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iycnm-0006eP-HW
 for qemu-devel@nongnu.org; Mon, 03 Feb 2020 09:34:14 -0500
Received: by mail-ot1-x344.google.com with SMTP id 77so13810096oty.6
 for <qemu-devel@nongnu.org>; Mon, 03 Feb 2020 06:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HOmYWzYE/qC6q2n+o+sTa2kv2stI9GudmWtRnJ48RsE=;
 b=m6Ebjlx6NQwYJU8XRHZMXjavIGGLb8z+knKf7chv6CS6y2jGc+JYszi8cq9J1eoqaZ
 pS52cuvMGvTf31+qjD/a5y8AoBSaxRWD7HLddAp97VS8h8GdWPPFhQ1O39gQEleWar6z
 g28bzcuQcdED/OuKNjzdp+0rO9BYlqFX/TDmh9xTagli6qESU/Iz1A8qgx1LT41p+Ve/
 fpdIt0iRQkwOeIpk6A+1xHkF28GbIKiiLvG/4V4PRcfOuUDnxHNixDUZUqScnFiAy6cd
 pLdljkHI8UeCTQXSMRsI/YsPkimM9GwFRLxv6yPN7tT5tqD7zZ3NTodQmnDYihvDF0qK
 pjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HOmYWzYE/qC6q2n+o+sTa2kv2stI9GudmWtRnJ48RsE=;
 b=UzbhvHefS5IIdG+MOKlj6NWWZl90QAz5f4JxMURMAys4D2Tbtxgbi+3pc0Sp1wj2IP
 oShkiLRQ+u0EvO09HtiWNNk04HRyKemLgemunj7I0XswmzQ7Pk8fzTeEsa6qvlL1HqHx
 qcP4nEJPnSLY//13/4OBdqX3pcewhjdY6aW88STqltj8TV6Q6xYIZ23m0iAZJlUgR8MA
 eQ+A8qN0RMPARYlskvYGJ+3awAcaja+X1lk/oz2KlHO6AW8E0wI1AjjiZE2OTrLN0t+I
 Xkd3HGGWtnB8uhUoxFPk+CGUiO4nW+QulxcqDQCChxJ0lRhCFlYTq2nAZLGAaWjDRIxz
 0aCg==
X-Gm-Message-State: APjAAAWbcKB7VlW62sFDPpKb6rTdjjp819zQ4Hx/qMU4wZwPdKQlniZP
 dslNoT6xZLTbc9Ge4rTC6dkOJhX63RIaIPChlkYSXg==
X-Google-Smtp-Source: APXvYqw/J/jdU4FdvmmkqawsqjfeASCI9ifXFW/ybepw4+q4V2PcNeHjjQrL7DQeZ/XoNnhnMFlY9VJIpBGAizFhg+Y=
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr18077753otd.91.1580740453297; 
 Mon, 03 Feb 2020 06:34:13 -0800 (PST)
MIME-Version: 1.0
References: <20200203141346.11790-1-thuth@redhat.com>
In-Reply-To: <20200203141346.11790-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Feb 2020 14:34:02 +0000
Message-ID: <CAFEAcA9cy=-AMCOXmz1NnkApuGfyo=qPZj726haaO12ERiu_Cw@mail.gmail.com>
Subject: Re: [qemu-web PATCH v2] Update the documentation links to point to
 our generated docs
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 3 Feb 2020 at 14:14, Thomas Huth <thuth@redhat.com> wrote:
>
> We are now providing the generated QEMU documentation files directly
> on our www.qemu.org webserver, so we should link to these files now.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Do not link to qemu-doc anymore, use the index page instead

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

