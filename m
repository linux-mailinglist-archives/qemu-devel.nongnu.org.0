Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 708F23389D4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:17:03 +0100 (CET)
Received: from localhost ([::1]:39642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKeqs-0002Lu-Eq
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:17:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKeff-0002yu-Hu
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:05:27 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:46693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKefb-0004H9-Uo
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:05:27 -0500
Received: by mail-ej1-x62c.google.com with SMTP id r17so52207288ejy.13
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 02:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ff6AUFDFM3llHRljDwaLdj5FXXAGDgBfZivmDK7I5fQ=;
 b=e5bgwhK8oRKAoKqfTlLQFj+/oqqqZvG0CKoqJybd7cidDXjxsB3sCK1T2VgQjYlHj2
 EFJb2qcxMjr2zWQ8dhMhZ87USDjbYbUXcpGgWYj87pK9BBiUf0zAYIgWbXVqgq0hJVn3
 KIwHA4MpQjq5Mt+Gx2hz1QHiS/3CYIXaGpHrpnT6j68GKPE2UzD1omVjcgTwhSEJI9Hg
 hJxZUDnrs2tU5/YAzsDiXqqgQzFSOotRRBLcQoXTZFj5QzDwBpizduXCy0wAlIKCXhQM
 +r2zfH/9HXAwrwNyg0HjXOuzU4GeFCQGIFaUI/PB2w4+1QVBSJwMfzQFKNvZVR4eqrMP
 kGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ff6AUFDFM3llHRljDwaLdj5FXXAGDgBfZivmDK7I5fQ=;
 b=L9B1GK835/Q6sJyVHlx2dmk5BvmYNpkhi9JN4c2raHR0INL3bKak5tDMG/Nc1gaUQE
 NbGE3xeUqfr+cDI72MR1kUFjA75F9HOV3oc71sr9lAxNzsoJAZKr5t2QMSpCrxTA4IqV
 jaq74mXyjN9NmSOm+ShVV6ddIccmv6XluOQLMzGXhwRmfGclP4nGv9h1BgN1lX13Cp6x
 BIqSrmtGjfFi2k65bTWbJF11rkg9tbyoyWEh0pcKIf5ZrLTvFs05/cIkhOiX4C85Xr7U
 SJqbqnh8lxqSzFu3S39xWkgxXuh+/B0+LMe5hTRkEDhQRzZTQ7/pLAXnXXlCL7ZNqijm
 m2SA==
X-Gm-Message-State: AOAM530HItBNfn3NNMOP4CktfXWKxmhuiiBat6HzMM36shYZYzXrOvqQ
 Fk9VPIdh4iLga2eFOlNjrXODazcQ6AxUznoc8+wn0YJUqogFNw==
X-Google-Smtp-Source: ABdhPJzI4FkWYfaSe7i2xm3wOva++JL3yXwELU0x8ZwFww1VX9mrM/caPzey2nixUsgZ/3CPLRyNRy7QtAxKT4GKALM=
X-Received: by 2002:a17:906:b14d:: with SMTP id
 bt13mr7611337ejb.407.1615543520992; 
 Fri, 12 Mar 2021 02:05:20 -0800 (PST)
MIME-Version: 1.0
References: <b9b0e381-c045-bab1-eea7-b8112526e5e8@c-sky.com>
 <CAFEAcA_jnLzZN-nA+Cf_HwGjxvOaxUzZ44LYxqpcmw=3eAU6qg@mail.gmail.com>
 <3edf7903-94a7-c16e-2b9e-644e1a41a77d@c-sky.com>
 <CAFEAcA8UqE65Qxy=c53CCPdYnVrwvBZGxU9SH9qk7Q6vGKDgyg@mail.gmail.com>
 <50fb9541-095d-18e8-1145-662f594600b6@c-sky.com>
 <CAFEAcA-zRB8t4h7eLsw5FbFtyBp6Ow16P4vvk2eA9t7Jcr42TQ@mail.gmail.com>
 <854d74fd-ef10-af51-93c0-2d66792e604c@c-sky.com>
 <CAFEAcA9i+9=a7DvQW+4W3jLzocLvKU3+8RioMDJyvLGLaemr=g@mail.gmail.com>
 <fbb65e1c-c4a7-1367-6648-5fdc09750169@c-sky.com>
In-Reply-To: <fbb65e1c-c4a7-1367-6648-5fdc09750169@c-sky.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Mar 2021 10:05:02 +0000
Message-ID: <CAFEAcA-d-8T8wE3JaZqrKdy7ZDJnYxBF3m_VHuBgG-ijRE7Qaw@mail.gmail.com>
Subject: Re: Question about edge-triggered interrupt
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Mar 2021 at 09:20, LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Thanks very much. By the way, in my opinion, the signal line in GICv2
> solution is
> something like "QEMU-specific weirdness" .

No, for the GICv2 that really is how the hardware works -- the interrupt
controller talks to the CPU via the classic IRQ and FIQ lines, and the
CPU itself has no particular access to what the interrupt controller
itself is doing. For GICv3 you have more of a point...

thanks
-- PMM

