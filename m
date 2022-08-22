Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA4859BD0F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 11:43:05 +0200 (CEST)
Received: from localhost ([::1]:38182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ3xY-0000ts-P0
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 05:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ3eo-0004BZ-CX
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 05:23:42 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:42759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ3ek-0001FO-Eu
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 05:23:39 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-3378303138bso235618627b3.9
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 02:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=O6B/c9TJjiemaflmOpawH/XEN+ZPWcwrvXfZGVHxnc4=;
 b=ouGFjgwv8dsYeBMWcVM/7bLDT2I5I7wBUTU92uPJhI3NO+b7yJ5MJMD3TX9W04WCur
 Lk188wRv44laOzTpEbDpnlT2OiJ7PXiE4elx0CLLJveAl0aTr3sGtYue3E0+piCGXr+V
 ONXZZ2mnkWAvlpbh7sIKTA5aTQF4nnotit5eZWn3Lus+nbhp4RXrKoyIIp7m93kMQibJ
 0JfbemyEhCgOULy53cxEeKXcRWHukqPt0iiwP++xJvexF3+MoX4wnXJH0Mf8I//Sph8I
 AAMkrNjEj/+xyIzBjq66eGxCoRxqn7PYn+nfaPBpJwtHzHwNbdtasYoFH6H+mYru6z5e
 ARFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=O6B/c9TJjiemaflmOpawH/XEN+ZPWcwrvXfZGVHxnc4=;
 b=pHw8RfgGR89vZmsdHUp7E30ELRft7vygzhI6E7AnoB59G9vdyT1qHULG/i/qkGyqOM
 xXp3+tvIpzctBigWGFrdS2roW+3IYZAGytYag3j8QoYG0MKlh0R/4XmA5Q0XiEK3aTPj
 pB6vxCZ+hZdkZEyC5uKBVhiGpOgaSs+0V7ETzrqrCka43HCGI/rkJgY6l5zsvTSbaFuA
 7EI5zbuMdY5XFqQJ50TOCEkuai1KWJxyLiVDghBqzFqaz4SxibC3JuAwYJlH+kgl6zx3
 GKPVI+8v9hvEMx2k6g3K4q6XS8lziAe/0FzV8MdQZoVBNgcufI5UQZwlVNJm7tyPruHB
 wt+g==
X-Gm-Message-State: ACgBeo0bHLFdTud1PZd0jSK/UJcfcIII8nTRTGHnV82nqb99gPfjbP6u
 n6uL/eW70EM9slhK6MJGOPVg3tkEs6yLtCMvLqTK1w==
X-Google-Smtp-Source: AA6agR4XmRuw1fcPdMqiyf9MBfMoGPpu6pUPnYaMgI6xyMrpzmNyoITnKbgQB7DfbPE0vmkzxp//mdOSU6ikHc15pEQ=
X-Received: by 2002:a81:84c2:0:b0:33a:527a:785f with SMTP id
 u185-20020a8184c2000000b0033a527a785fmr8010697ywf.469.1661160217251; Mon, 22
 Aug 2022 02:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220822085041.127776-1-anton.drap@auriga.com>
In-Reply-To: <20220822085041.127776-1-anton.drap@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Aug 2022 10:22:55 +0100
Message-ID: <CAFEAcA-C87Qgyvc_yqtiecA9EBE50J9CZgQY5FiAqDm+pQx67Q@mail.gmail.com>
Subject: Re: [PATCH v3] Loading new machines and devices from external modules
To: Drap Anton <drapas86@gmail.com>
Cc: qemu-devel@nongnu.org, vladimir.sebelev@auriga.com, 
 "Drap, Anton" <anton.drap@auriga.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Aug 2022 at 09:53, Drap Anton <drapas86@gmail.com> wrote:
>
> From: "Drap, Anton" <anton.drap@auriga.com>

>     This patch is to add two parameters `add_machine` and `add_modinfo`.
> `add_machine` is to add machines from external modules.
> `add_modinfo` is to add devices from external modules, needed for a new
> machine, for example.
> Additional, 'arch' parameter of QemuModinfo is changed to a list.

I don't think there's much point in your continuing to post
versions of this patchset, because the answer remains "we don't
want to do this, as a policy and design decision". Until and
unless you persuade us that it's a good idea to change that
decision, time spent on code changes doesn't seem like a good
use of effort to me.

thanks
-- PMM

