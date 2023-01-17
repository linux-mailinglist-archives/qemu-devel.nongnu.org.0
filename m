Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B97466DE71
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 14:14:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHlml-0001Dv-7A; Tue, 17 Jan 2023 08:13:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHlmR-0001B8-GQ
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:13:35 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHlmO-00075C-6O
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:13:33 -0500
Received: by mail-pf1-x42d.google.com with SMTP id c26so18978657pfp.10
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 05:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iRWepeZp9hSCEPWSEKpHqVVptnobCtl7tvYe9R/UMJI=;
 b=U+aM+XhAd81g70+W1f0Hnoa9S7Jpz6FtyxCiIeT7osErFKAjZaiAizQUaMsGrNnJSy
 JR0pJtKakYQJ0Ng+sIuMh4lNCK9KiQDXQwSkCLwVlwMMezUGhtsIjp+oBkSn6wx+Ivfm
 uR/MJeQlbTgnLdCWlbMZl3vcWB/fViKM+WudCzYJFaJN0T2cXXc0O/0LziTf7+fx0c40
 kUJWz1YV3sEGw5jjZSOLswK0nzj3CFqYeTMr/hC1HHSoxcC/Vo1bPZKV+rYQGpC0cXP0
 bcAo0EaOOEBbL1Hfvw3PVCme7efuuR3eXu5inHrKlTMkcrZYMgoeIG/e1jOt8VqMWjUH
 MGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iRWepeZp9hSCEPWSEKpHqVVptnobCtl7tvYe9R/UMJI=;
 b=XJtiF0/y3hH8GDGhJJFdRcNSaFBXiTU8jmIJAdzhHeBMfNwbxwNThOvSY7XodmNry8
 SqjINkTOPXYB8kVMNaC24sH5UZDfZobXI4mV4vuU4PVAFa/eeScmR/9kXg5RccS3m+5d
 gozoPzmb03NEnTV6c2ixK/upKp0eYQJOwKuQn4FyzBcYN5oXw+Nld/v4spxetFVZcVto
 vLhmT8YKYufIZCJPW+XF1ZAi5u2mS7b9sseyhFaEKA1yQ3MMDEHKJqq9bX85xFicI4ww
 a88ZGhJNb1V1Us8G1hbzlUHGOsQIu6NitqqEREo+qd5vZIg0sNEldMZFEnoXEuwfEqqn
 FdEw==
X-Gm-Message-State: AFqh2kq4uhYcQradGrd8oXN39d/M9eErsAXnWNS54pp0T0KUsrj3DVfQ
 CPBZW1bIm91HAHQkodcSryHBwMC8JBqS9VVBnI3NiQ==
X-Google-Smtp-Source: AMrXdXturOD3lVhT0VEcGkaJgRGrnMNODOMmHJtsS1w4V0c/6Ei8iOXL3W/UU/8LSEBi7Bt4p21NXMFKY341ID1MG/k=
X-Received: by 2002:a63:234d:0:b0:4ce:ca5c:c472 with SMTP id
 u13-20020a63234d000000b004ceca5cc472mr207634pgm.105.1673961210040; Tue, 17
 Jan 2023 05:13:30 -0800 (PST)
MIME-Version: 1.0
References: <20221202151202.24851-1-pyr@spootnik.org>
 <Y8acMi/eZAYfILg3@redhat.com>
 <CAJwCgu8aP9fF6u2dv9dMZypftAupyMx71BxvoDeqj7nxxFZj5w@mail.gmail.com>
In-Reply-To: <CAJwCgu8aP9fF6u2dv9dMZypftAupyMx71BxvoDeqj7nxxFZj5w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 13:13:18 +0000
Message-ID: <CAFEAcA8dbBfuNMNccdziYDp-JyXqhB7sieX4xcGvJ0iad60fVA@mail.gmail.com>
Subject: Re: [PATCH] ui/vnc.c: Allow websocket connections over AF_UNIX sockets
To: Pierre-Yves Ritschard <pyr@spootnik.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 17 Jan 2023 at 13:05, Pierre-Yves Ritschard <pyr@spootnik.org> wrote:
>> Allowing websockets is fine, but just removing this check is not
>> sufficient

> Thank you, these semantics weren't obvious to me, I will adapt accordingly and post a new patch


When you do, please make sure you include a Signed-off-by: line.
This is how you say you're legally OK to contribute the change
and happy for it to go into QEMU, so we can't take code without one:

https://www.qemu.org/docs/master/devel/submitting-a-patch.html#patch-emails-must-include-a-signed-off-by-line

thanks
-- PMM

