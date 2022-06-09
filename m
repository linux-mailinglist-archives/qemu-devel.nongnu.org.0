Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BF7544D5C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:20:36 +0200 (CEST)
Received: from localhost ([::1]:60028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzI5T-0006iV-PM
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG3F-00033j-Q7
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:10:11 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:36544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG3C-0001Ge-S2
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:10:08 -0400
Received: by mail-yb1-xb32.google.com with SMTP id k2so1816860ybj.3
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 04:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wD4ZkGxPPATX+5NRHOqrcIfoQx7UZqGQ4oooBmRZh5g=;
 b=AMXlQbW0s5t4hUElj/4MnvlWvfZPNod82GHmIpwv+1M+S+Je67qfJTkHGb7Hh4P3Io
 z95QtGdmofjbfpRb6uPZWpHtdKRlOzoABYtUrX/neS4EnM8UJweYghosojrTdCOqym/0
 43/cW9I/mXeC9gc7RdSbtPzRTARpQfaeNiQMLVLu1GcZpZEPZvXx6Sj5JaXuFrcuJKGw
 XY0N0CyxPW1NiDYAdJOAX4qYHDH25pk1P6CbhI2IphNHPWqcnNnRdPCTJrR2HhJOqRFt
 Q/uo/HoehsIGBcywhfYggmblW/rWmI4pMQTQ3GT7vXUSKoyuTgukr1TAHWVMpJp4UqM3
 nyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wD4ZkGxPPATX+5NRHOqrcIfoQx7UZqGQ4oooBmRZh5g=;
 b=Ijzx6gZ7z8/4zdKeONLrwPGh5hqcDoVNP61vNhlCLvcWQ8cJ8s7FWeixHAUa/LbDgc
 2vcfQIE2wL00hpHwINXganR2AIBW6Kb1X7AvmkCR8uTzyQqf3xPQhENooymDPo2MGIol
 8NN/nxc40GUP+H+iXCeNtVz8FR0mUSB5k7DxWLJCS8wlO82p9w6+HfAJ+unnUJITWEbc
 //mcNgfPbLPbjTYS0LBc04KJkSGb66muagRmhy8ZrD247ytBu3sWClUKkmOv9tH23qEx
 +/DXENhphBU5BcH/YsUBZtJziqNrAmgWWI4kXfFRD2LrbQnspZz5tuDd+63adJ75T8X7
 S98g==
X-Gm-Message-State: AOAM532EhvKVwdxHmxBkvT9LZE+rdp6sUiG8jLm1WG5Eq0DxIQklfqOm
 IkyXz5VFVM1xV6ZLiGL+0FsZ/9Yg0dIwZ6XWQgyztQ==
X-Google-Smtp-Source: ABdhPJwrKLlvtQO37ZmsmEpKd03I50bvlf/xVSQxa8qhw4D2LWTeuxv0xe28BNqddpu/Ir3gA+3ZdbUaJS/8m57wnOo=
X-Received: by 2002:a25:1bc3:0:b0:65d:46e8:6322 with SMTP id
 b186-20020a251bc3000000b0065d46e86322mr37451765ybb.140.1654773005315; Thu, 09
 Jun 2022 04:10:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-39-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-39-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:09:54 +0100
Message-ID: <CAFEAcA_yZBG7XkbTyLd41DFaH6_fTk=223GMw_dnaHTEZ2ciEw@mail.gmail.com>
Subject: Re: [PATCH 38/50] lasips2: move lasips2 QOM types from lasips2.c to
 lasips2.h
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This allows the QOM types in lasips2.c to be used elsewhere by simply including
> lasips2.h.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

