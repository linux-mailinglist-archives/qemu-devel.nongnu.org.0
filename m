Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CBA51FE5B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:33:31 +0200 (CEST)
Received: from localhost ([::1]:33874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no3Vy-0001sW-9T
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:33:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no2w5-0001RE-SL
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:56:25 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no2w4-0003ab-EL
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:56:25 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so12709120pjh.4
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 05:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y7paI7o7SUkxrOIDh+BUOg64ApqiPgjkBVq3RRyq7M8=;
 b=R93oKta0yiHTWnHSGb0DEsgqTpCErgBo4s00eLFtp3+6g8BZFHNDtKTQv4MIw/we9M
 +pCiLc07X4SJYTqKlRbRq+kEaTHnT2yYdDj/Mlq6nMzp+IEam+OXIncrG+f8tS2DzV2a
 QXVoNJXYzNxqEbUAadvRGbTR1Px8bBH7Cw9QbKkahaKwLVyul8VbV3qspXD1Dz/facA9
 m0NOPqFrRD4XuwovJeuGUHqwE5QOUoEtOJK/YW2OGOiM864Ox4V/zi6EY96zmR2V+bfv
 m4audJ0CkfMT+wOy1CF9ddQ2hB14OEddYm/G9SP/dVoMJVbGvadUskXhxo71KnF4ahHh
 6RgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y7paI7o7SUkxrOIDh+BUOg64ApqiPgjkBVq3RRyq7M8=;
 b=YY1OkSVnhBYeKPIvq3E7urYq7VVfouzVDTLncMxRQHHIxYv3Nu+ov9MTQaNnt51gBC
 zLDukaZVnFgRFTrXdelaLuYxHhfINPyeQoH+UlhWWmzyhu6N2FP0niwAAx72+sw80BXo
 QawcdKC5ouls5wCP4UFRBVVQlulGkwVbGU8JjdRatlp4ZHXntijg583bXvaQrT5GgpU6
 8ZIT8vkXXgSXuWdsrDbcwc87Qy8Sf9Xy6klWs37AtRjGIWSE76azu8wQUVYfBO+tTbkn
 mrXQdcFq1RxcL3pzhtmklbocmFWanIofQpgIsAkBvxi6Dm4aW1AcwKDldc6SHiLNimJL
 mc2A==
X-Gm-Message-State: AOAM531Coli8OD34BBy7IFmyGLkJALN17u0IkwM7fHWoquFHiIn99IEt
 c5aSu2tLgetx8uNqBj3lJvmZF/kFowY=
X-Google-Smtp-Source: ABdhPJwiUZ6LzrTlNZeJ8v94RwheT211XmBPhDj4R8RmE5oOvoPtPe21GMhYJyUaJQMSKc+R1QmE3w==
X-Received: by 2002:a17:902:ce0a:b0:156:72e2:f191 with SMTP id
 k10-20020a170902ce0a00b0015672e2f191mr15615830plg.76.1652100983201; 
 Mon, 09 May 2022 05:56:23 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x20-20020aa78f14000000b0050dc76281e7sm8611046pfr.193.2022.05.09.05.56.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 05:56:22 -0700 (PDT)
Message-ID: <0a86d473-9218-d525-d176-8bf6133bfb30@amsat.org>
Date: Mon, 9 May 2022 14:21:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH] tests/qtest: Enable more tests for the "mipsel" target
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20220414114655.604391-1-thuth@redhat.com>
In-Reply-To: <20220414114655.604391-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 14/4/22 13:46, Thomas Huth wrote:
> Allow the same set of tests for all MIPS targets, so that "mipsel"
> now gets some additional test coverage, too. While we're at it,
> simplify the definitions for qtests_mips64 and qtests_mips64el.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qtest/endianness-test.c |  1 +
>   tests/qtest/meson.build       | 14 +++-----------
>   2 files changed, 4 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

