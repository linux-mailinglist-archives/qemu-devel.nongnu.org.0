Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 030A238FD88
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 11:12:29 +0200 (CEST)
Received: from localhost ([::1]:55266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llT6y-0003kT-3X
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 05:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llT67-0002ru-8a
 for qemu-devel@nongnu.org; Tue, 25 May 2021 05:11:35 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:37515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llT64-0002Px-IK
 for qemu-devel@nongnu.org; Tue, 25 May 2021 05:11:35 -0400
Received: by mail-ej1-x62e.google.com with SMTP id et19so39122222ejc.4
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 02:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7soc/hBSe8lOJQvadw6e3JbNcCOouv6LPLVmunyO3nE=;
 b=xCV9Z5uoIhPEppKRDqVOajsJVmrF6Qj20VulEyyFeShujI17eTaxG0MNnRLsoSlEai
 zsLqRw+N3MpiQvnxoC0uCLM8aoy8jZKXy04kpyHLXh/edptkNJfa5nMrlJ7qwaYknlAk
 R+RI9aUqDKsqon+UYkA92avGTVTavCC9ruXqcQKQIlsbrAOe0e1DHFk/ZvB8EzXAKzjk
 X+LnG6/2S04QxUjehNcXoMvqUNjXmLBXmd42gPXv5yB6zano4X4w1bUNtVI+a+PQ1Aee
 M/5noWALOnWVhQ9aP858opTS5HS1NFaOwnxYfnBi0nD1qDchko3Fg4CmDyJRli2YSZGi
 Xpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7soc/hBSe8lOJQvadw6e3JbNcCOouv6LPLVmunyO3nE=;
 b=e8sRybdWAkt367hogsf3KWNPDMIVgzIOBpqmbC0rWLECKW34J8D0iKPT9GSlkPZe0W
 8FzxD6zIJyMXFHoGJrSRHoahgMjHv7vRqrn/H/z7lStrsSvm3srwtEUFol0Synt81DpA
 739hwEqqop+2z8lPWLPrGxSt9paWIlUnS6sbwmmh1DSAyCU6b5adxTb0RTjFnCMJDLFa
 srvQAdfCYAW7Vkr4JL8n/gA5B/1diwKzwbSsqYL4uCpslMOPTjGdbA4kLl5jeHKmDsXi
 paG/UUoUvw5vnQuwzSmOUrlhaSMclpcLNAXZenXBRwmC9IPEtEvOZwx8BFMnGGF8MK5c
 B+Eg==
X-Gm-Message-State: AOAM532ap8PWYGqugddBb3UjhBE/dNWyPwLUdxzv8NQhywFLBMREhwW1
 aMZg012jeKQhv81Mm/332VK6pQnxRO8pK+4OGnVZcw==
X-Google-Smtp-Source: ABdhPJzmjM9zr+iA+vpqIH1lShqCQscozQFtrcaX8+GWr4T339r01po1Oc1o6LkcMIaZjPgoFHSrF52ncSPrEB/6Rh4=
X-Received: by 2002:a17:906:9bd6:: with SMTP id
 de22mr27244033ejc.382.1621933890817; 
 Tue, 25 May 2021 02:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210516171023.510778-1-f4bug@amsat.org>
 <51541937-e1af-6c8b-c434-80918c2a5d9d@amsat.org>
In-Reply-To: <51541937-e1af-6c8b-c434-80918c2a5d9d@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 May 2021 10:11:07 +0100
Message-ID: <CAFEAcA9m_OQ-Mo=BH3fVY5ewE+_Hp3eHWKm+hj7Ug6jYB8WDWw@mail.gmail.com>
Subject: Re: [PATCH v2] disas/libvixl: Protect C system header for C++ compiler
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 May 2021 at 08:47, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Hi Peter, since libvixl is mostly used by the Aarch64 target,
> can you take this patch via your ARM tree? (Thomas reviewed
> it).



Applied to target-arm.next, thanks.

-- PMM

