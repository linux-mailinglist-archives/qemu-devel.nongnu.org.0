Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 623392736EF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 01:54:32 +0200 (CEST)
Received: from localhost ([::1]:54468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKVdf-0005hj-Fj
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 19:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin@koconnor.net>)
 id 1kKVcY-0005AE-0I
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 19:53:22 -0400
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44]:36196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kevin@koconnor.net>)
 id 1kKVcW-0004cM-GF
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 19:53:21 -0400
Received: by mail-qv1-xf44.google.com with SMTP id f11so8563823qvw.3
 for <qemu-devel@nongnu.org>; Mon, 21 Sep 2020 16:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koconnor.net; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=4ceQLvaWlCyryA0iCJUIb8De66cxpB/69/lZZn1kHrI=;
 b=BpxwdQ0Nvt124cYoW+7VDOnVpulvFIQ+KztSZzKzSf0e+pzY+KsQzOXU0h4x3DWW+L
 a9JDdRIHn60SZ3VNYnZ74urDjINZKHKsyzSClcf9ODVSX5DQI/i8TzuMMHprIUtFggeI
 HSW1fj+pFFfTNKqTCzuzT/amBgeTuLLWeGw7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4ceQLvaWlCyryA0iCJUIb8De66cxpB/69/lZZn1kHrI=;
 b=c2Nm8mw67JN6MYKtL0awAnRQr/21+nKl1sS9802un6QIjkGlbwdmBIGBwRR/+tsXgk
 jc/ibajNVf4i2NigIYrAr9yQFj4l/WkivSXeUbxZrmddJr9Ts5m+UzM+lxWsKrbv7C2y
 klVGTJDvStk/n43Gl3LpIgt3RNwNsNtXLG9oSFvvizW/X3c/MCJPzkkj371Xq8J2yIGA
 0i3e+lr6TbHGdJ0Df6T6xu42VW0s6pa6UIKhzgHWdyu2lrLfrARlWP3sfaDePjWh+LEj
 miu3mspiaw0xUsEjbFcSRFzgecOwliWdCK69pXdrZGC/rIJXsERMYskUdduyUeMVKhTn
 NkEQ==
X-Gm-Message-State: AOAM530UlGz0rG3KsiXmqMWjhnGpMc9TyO5+MvLVlZ5GAriXGjdBSaij
 nbz99q+/Ao4yMOThCyAYS1Hj4A==
X-Google-Smtp-Source: ABdhPJy8edm8wn7tPgd48f2H8t2hTGoLj1Ktrrvhb+ZJhaQ7MGjmly/QUFInHtU0AiEq54G9ETS49g==
X-Received: by 2002:ad4:45b3:: with SMTP id y19mr2839082qvu.59.1600732398061; 
 Mon, 21 Sep 2020 16:53:18 -0700 (PDT)
Received: from localhost ([64.18.9.197])
 by smtp.gmail.com with ESMTPSA id j31sm11754822qtc.33.2020.09.21.16.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 16:53:17 -0700 (PDT)
Date: Mon, 21 Sep 2020 19:53:16 -0400
From: Kevin O'Connor <kevin@koconnor.net>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 3/6] hw/sd/sdcard: Do not use legal address '0' for
 INVALID_ADDRESS
Message-ID: <20200921235316.GA2630326@morn.lan>
References: <20200918174117.180057-1-f4bug@amsat.org>
 <20200918174117.180057-4-f4bug@amsat.org>
 <874knra5fk.fsf@dusky.pond.sub.org>
 <6384105c-65ca-60f8-4fa0-afd2e46b144a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6384105c-65ca-60f8-4fa0-afd2e46b144a@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::f44;
 envelope-from=kevin@koconnor.net; helo=mail-qv1-xf44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 21, 2020 at 12:31:21PM +0200, Philippe Mathieu-Daudé wrote:
> Back to the SDcard, it might be less critical, so a migration
> breaking change might be acceptable. I'm only aware of Paolo
> and Kevin using this device for testing. Not sure of its
> importance in production.

FWIW, I only use the sdcard for testing (and only use sdhci-pci).  I
don't know if others use it in production, however.

Cheers,
-Kevin

