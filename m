Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C70836B0CA
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 11:40:36 +0200 (CEST)
Received: from localhost ([::1]:57024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laxjH-0002vy-Hi
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 05:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laxgo-0001O8-6G
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 05:38:02 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1laxgm-0003ur-JI
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 05:38:01 -0400
Received: by mail-wr1-x434.google.com with SMTP id c4so16211319wrt.8
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 02:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B3BMf0LqFqptHJ+LztETu9rpOHqvqcrK4KW9vfZonIw=;
 b=oytAkOuNSz5eMmAqMApJb+NX8a8EkpvOEihtPKu2w/J4PvUX1YYGnf3G3kacFeCoC4
 NEDUmj7AoQkQfi5zPwWQlrdb8MwCgR+BqUgthkRIxquCnT5WF5LHfWwivsMPqvrySFNU
 3VP35dUWSg25jRkiBq25lSX/HweYa1yELMZTVRwwXw9xzEkBp9oNDn+FRkmIYtRwD3o/
 falrycTx5bI4rh0+fRJFJ0820zJUSb7h7Xcxk9pJHyv+4eoMATkPYDHDMT5GySzGybhP
 DEnc0dI0FjPkIfEH4LY9EPfeioPEG5dqaPYtGkzwjKyAGsxyg67ElY5hdQKINmMY/bsF
 s/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B3BMf0LqFqptHJ+LztETu9rpOHqvqcrK4KW9vfZonIw=;
 b=R3lvTJOohC5k5pQh+57et+ek9JqHUipDLI0OxId7wK0+jT8BIB1fc3rPnK3fYDzf6I
 GV/YcsXk3C1GjKQlHPqHB+IEk7DGdcVqma1FUqCDwwPASmXQNgKMnpKytTKiCj+x/vst
 VoU1aTzJC1NwKpqWaDzofhwMacKqR5ootdZgUuOqSc7ggVWBvGN6TPZoAOG4JsHgDGAP
 MS2eZu/aqYKfRpkwVvZUkJmshf1mBP7NF92BphYhiu3pZFsPW7ItosJamzXoWv63PZXj
 9KZHlx3f2zr4FABvkwYMQ153ERYocWLxNsv9zPQV6FR3NwkE6ePZ5pZDohwugRtC9yGA
 slFg==
X-Gm-Message-State: AOAM532IzOYYkYiwiNGILZ/D7Mf9u5cGI1l/9v7kTNwLBpkN75CBt5YY
 TFPBea6m4ClBi+yWwqrVRTY=
X-Google-Smtp-Source: ABdhPJyq8fnnyrrSsQKvu/PQI7xLIwi/7yVRhnuDZL5Glv9iZX5j6whqGtWgpBSYQBRK4eBVXZNvVA==
X-Received: by 2002:adf:8b02:: with SMTP id n2mr21160991wra.259.1619429879187; 
 Mon, 26 Apr 2021 02:37:59 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l14sm20757696wrv.94.2021.04.26.02.37.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 02:37:58 -0700 (PDT)
Subject: Re: [PATCH v1 13/25] hw/tricore: Add testdevice for tests in
 tests/tcg/
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20210419145435.14083-1-alex.bennee@linaro.org>
 <20210419145435.14083-14-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <df3cbf07-562f-087d-47b2-6b366c11f4ae@amsat.org>
Date: Mon, 26 Apr 2021 11:37:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210419145435.14083-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/19/21 4:54 PM, Alex Bennée wrote:
> From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> 
> this device is used to verify the correctness of regression tests by
> allowing guests to write their exit status to this device. This is then
> used by qemu to exit using the written status.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210305170045.869437-4-kbastian@mail.uni-paderborn.de>
> ---
>  include/hw/tricore/tricore_testdevice.h | 38 ++++++++++++
>  hw/tricore/tricore_testboard.c          |  8 +++
>  hw/tricore/tricore_testdevice.c         | 82 +++++++++++++++++++++++++
>  hw/tricore/meson.build                  |  1 +
>  4 files changed, 129 insertions(+)
>  create mode 100644 include/hw/tricore/tricore_testdevice.h
>  create mode 100644 hw/tricore/tricore_testdevice.c

> +#include "hw/tricore/tricore_testdevice.h"
> +
> +static void tricore_testdevice_write(void *opaque, hwaddr offset,
> +                                      uint64_t value, unsigned size)
> +{
> +    exit(value);

   ->  qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);

I'd rather use a 2 steps check of value such watchdog devices do
(to be sure the guest is still in control and isn't nut).


A general comments, all targets require a such test feature,
so we should have a generic user-creatable sysbus-testdev for that.

Regards,

Phil.

