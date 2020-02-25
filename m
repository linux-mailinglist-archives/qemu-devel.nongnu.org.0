Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB98416EBCA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 17:54:05 +0100 (CET)
Received: from localhost ([::1]:60302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6dTA-00028I-V6
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 11:54:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44204)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6dRe-0000X5-UT
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 11:52:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6dRe-0001Zd-0I
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 11:52:30 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:43979)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6dRd-0001ZK-QP
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 11:52:29 -0500
Received: by mail-ot1-x342.google.com with SMTP id p8so119682oth.10
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 08:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cZyJjAFTXWUCDvEbQw3SPVTqAmYDNd3bKTWHuVvJ2nY=;
 b=NSPqdDDoyrOWMzRKPDVnwrAGeM1vYZz5TrWjhNW7MisYpefYQetQ8uUyU/r9SnHXjf
 hfCxnFWtqtdC1PqCK9CLs40T1YV42jLr3Yrsq0RU/C8SIlIEpjTKYp5099WnPI+8sKjJ
 Xyrxf6NCK9RGgq/RB4/Mu8hvPlSzr08oTluxlD5d7LpP4ZeZunfWcdWO7sCXTFbi3Q9H
 0boUnouYjXiz3V4ZjkZUcWglsGLWNST5Zc5QY5DcSOTrxoZzgKBkada0MdxFkOBYTwIj
 zEcfPV5l/4VyDfoazs8BeqRLvq7dDgQAtjNUCKJisTxDbKiBAcgj7lM2CzJRKCgDMEQ7
 YHJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cZyJjAFTXWUCDvEbQw3SPVTqAmYDNd3bKTWHuVvJ2nY=;
 b=IAIz+QJTddsqLuHZyQWUXMK6Zh95DTy49Y2aU17HcIhtXpPQeQJkQKO4V73yY2rJuE
 zkLGAwY5U6KIB2tP1N6TRv0OfbEGqFYkCL5Lr0eo4jbfhhd5a0R6k2v/oAl3VdaQ5S+4
 q48Dmsbd95gHtMXJ+c98hTYd2wBsyIXKECfvFnJ/NVYgcyfQmnNDmXSnJb09q5o+G3eP
 0Ito8RgiiSV6TK/yfdXmi5KJCMYHfkl36vpu9jVAxKzAcN9wUXc+OjXgcnRY09yFZwJC
 NbN1I1O8a+RP1ITDWhB3PSnsEkQtCNWB3PfPdNtuUF+DC1hQ+aacQfyFu8gB00nvOVbb
 bC+w==
X-Gm-Message-State: APjAAAXx8SyiJwzxtT+/yrMDZQsZxH2KugJHqW02+iQACEtT7tO8gO9P
 ce3NPuOihyHkUe2YU77ns9FFSyOjt+rrOZoTlLvyyQ==
X-Google-Smtp-Source: APXvYqx4gy+zB6kHR5M5H4bJj1JL4Y9E+J6+MM9Yc/j53GBQ4oHNGfNJCo9bJ9SZL9BEVI3Y+HkulfB4gUo2f1Kwyis=
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr42486528otq.97.1582649548905; 
 Tue, 25 Feb 2020 08:52:28 -0800 (PST)
MIME-Version: 1.0
References: <20200225163758.12996-1-pbonzini@redhat.com>
 <20200225163758.12996-2-pbonzini@redhat.com>
In-Reply-To: <20200225163758.12996-2-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 16:52:17 +0000
Message-ID: <CAFEAcA9FCJqEv4FngLbRpd7s==T-7SKqTvV7AFa=DgEKcZCmfQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] docs: system: remove target OS documentation
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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

On Tue, 25 Feb 2020 at 16:38, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> This section covers OSes up to Windows 2000, and as such it is mostly
> obsolete.  Zap it.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

