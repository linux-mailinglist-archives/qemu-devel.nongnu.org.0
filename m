Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13843683599
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 19:49:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMvgb-0000ny-Cq; Tue, 31 Jan 2023 13:48:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMvg9-0000iB-Hh
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:48:25 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMvg8-0000uP-0t
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 13:48:25 -0500
Received: by mail-pf1-x42d.google.com with SMTP id g9so8831862pfk.13
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 10:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8w7oPZU3khxNecWU+59JWC+ApepEBmgIMZeQYyhg21c=;
 b=F3GqmWMAtc1JTdwE5HYamNuVsRnUZzYRpYu6a18z1aANZAnMS//WmpObacdMFbC1wU
 kqd5syEWlVzQb78RDdjzi+duHoTCHfsrK5bcArDgtrMF14+W4OEKTWAq/xRWUzltTk3m
 EhRForDhGlAT2qJYwEc4+msea3Qm7ilRhcHidtJMoDM7FMCqMjviNh12it6kr+O3VP5D
 qehPXOg2lkGU28myOxmtg/i2v2Heo5Hf5aEoIzYTvbgQFjYDHkUxXK366iTVMCmvWb7S
 +vKYE2kODhQINEGR0JxOEJZS7XqX/U5Maa/VwVJeEo997yDMNy/E/LYM2OoUNJ5GI232
 ezhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8w7oPZU3khxNecWU+59JWC+ApepEBmgIMZeQYyhg21c=;
 b=TldsrrJK+hhEc4o4CKmjvPEXFBFES7I46cGakEGHoKyA/DDkgnd02mhMCWZK0uDIF5
 5jdAdJBkXPGW84K/g+EsSMKJmFcXQFgW3Z6N+l2tlx6pxnyw5B+sMyP4skxVsrAvJLiD
 lX9fP7v+VGChywLb5xGjss2FC1JGZW06ZKKnWq3COwDM+kCjIfnie2R1kkK9ffEAZqZc
 WLtdNCDXOf6FWlauaCtV5/cnVvtn+zRpmsFY7sD3ziY7oOgHHD4r+tEL2vdtNu2qnGuu
 +ihuRuIu7xkX+DqCkVLQh0dnuKG/cQ/03zH0Z5L9+mPaTG1lC0pfx/oa4RbAnXAOc2ii
 dJbg==
X-Gm-Message-State: AO0yUKUH01ZMSre5HTA7qvVDVS4I8f7C5+5ECXEpnyA/7ronaxs0JlEF
 8hacGeEVHh/BduiW6ZERsU35K5PUoVpHyTI7S1ZP5w==
X-Google-Smtp-Source: AK7set8k0YA/YH/tBzZxDRnC1Gbceo+xNjr09WZ5gPe9KuF8VDQcqHdn09p2SsZa1K+nJUbeJ/o+Bn9l4WK7iVMUrGg=
X-Received: by 2002:a62:f842:0:b0:590:3edc:d2ec with SMTP id
 c2-20020a62f842000000b005903edcd2ecmr4218395pfm.27.1675190901650; Tue, 31 Jan
 2023 10:48:21 -0800 (PST)
MIME-Version: 1.0
References: <20230131182048.15535-1-vlaomao@gmail.com>
In-Reply-To: <20230131182048.15535-1-vlaomao@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Jan 2023 18:48:10 +0000
Message-ID: <CAFEAcA-7S75kL=GOiAO_pem=3RkacGL4mKe6dehibrbLc-k2uw@mail.gmail.com>
Subject: Re: [PATCH qemu 0/1] MAC address falls to permanent
To: Vlao Mao <vlaomao@gmail.com>
Cc: dmitry@daynix.com, jasowang@redhat.com, qemu-trivial@nongnu.org, 
 qemu-devel@nongnu.org, laurent@vivier.eu
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 31 Jan 2023 at 18:22, Vlao Mao <vlaomao@gmail.com> wrote:
>
> A bug was found with the vmxnet3 driver, after changing the MAC address
> and rebooting, it falls into the category of a permanent address until
> the VM is turned off.

For some network device models (those where the hardware has an
EEPROM and we're modelling "guest programmed a new MAC address
into the EEPROM") that is the correct behaviour. Is the vmxnet3
definitely one of the kind which is not supposed to have a
permanent MAC address backing storage ? (It's paravirtual, so
this would hopefully be indicated in the specs for it.)

thanks
-- PMM

