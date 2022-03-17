Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2979F4DC594
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 13:11:07 +0100 (CET)
Received: from localhost ([::1]:42858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUoy9-0004Z7-L5
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 08:11:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUosA-0000pa-Qm
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:04:54 -0400
Received: from [2607:f8b0:4864:20::b35] (port=34545
 helo=mail-yb1-xb35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUos9-0001ii-8j
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:04:54 -0400
Received: by mail-yb1-xb35.google.com with SMTP id h126so9833379ybc.1
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 05:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DWwNobMNiWCovvw9SdDwu2+GrTwsSluwUmKCILYFUDw=;
 b=tQsuD1JxEaOb8q/of1HBGzYle70UM6ZtFjyUXPMQ3wob1f14GwSsUtfSE+PElNzISr
 EoOUNacqPQgpcUE3MMJeuU8Mh2G/JQzl7d0b9+401xJ1bNv69LXx3fRF7auXrf3/4bO+
 s40T7SV8FiIOYjckP1B4/wnXX4cIr8yMqjtDfXs8Yv2GbICnd5SCmIFi8OzdsPjbZxAO
 eI8qyEPGWviIgSfe76qb/FvwlSKNxW0UoutXbxAGJmcmvv0SKPSdD3oBG2HDW9hS14wO
 S7rHDjF7YVOqULZENSfsSHWz3PC18x3KOa4KG7y7vnqt9lXC0ogRFYVU/uOlqKG8BrTI
 nDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DWwNobMNiWCovvw9SdDwu2+GrTwsSluwUmKCILYFUDw=;
 b=LvXYGlx9kYycXyiJDcLdxFMzDOCGuQSUSTQ/biECAX/HdISCoQbxdoZdOelS3Dyr5m
 hwuydtPX1SOnC7IVjLVz+cWymHNkeDx12FIJzAiIfdIts2fO7e/1VaTkLJa+Zqhd4yL2
 pg7+Ek4GKnGsKkEWWf4xRv+1aB9le2HlYaEKQV/4YhgGrhmBqTbhWku9DvX02GCFScKN
 UnlUVxWxteXXS/wmvRK3nurajyavzHKgy0JNeNjq5DvTpR8Rzpb9xs/rG7ltxOfIKSDa
 eNM+caTcoIP5joOE8iaLLEFlEZPmne0EjctZlJjCRcT90vP9mBTleIpGe2Fjj2RM2PP7
 Ztyg==
X-Gm-Message-State: AOAM533RVFUcVVPYoKB2iaPBd72mcglGGVGlOpmlv8u+/CAPaH527o3X
 40RkZyQ9PFiP0L5ZPgfdoTOQ0wlD1/kYN8GHl9WEKQ==
X-Google-Smtp-Source: ABdhPJy+i0cgKngUwj1lHZtWTjme22CiMgzXiDE0qhyndwZOjl3YjiE0AMl3XG7DqaxZBuOX/kOzGhGLFLiNm2lD9ws=
X-Received: by 2002:a25:bf8b:0:b0:633:8a66:c4cd with SMTP id
 l11-20020a25bf8b000000b006338a66c4cdmr4489644ybk.85.1647518692064; Thu, 17
 Mar 2022 05:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220317115644.37276-1-philippe.mathieu.daude@gmail.com>
 <20220317115644.37276-3-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220317115644.37276-3-philippe.mathieu.daude@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 12:04:40 +0000
Message-ID: <CAFEAcA_a7bYPvnqeWhWrS0O3CL9BqSn28pWqAEs_OU3drzpOAw@mail.gmail.com>
Subject: Re: [RFC PATCH-for-7.0 v3 2/2] ui/cocoa: run qemu_init in the main
 thread
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Mar 2022 at 11:57, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> From: Paolo Bonzini <pbonzini@redhat.com>
>
> Simplify the initialization dance by running qemu_init() in the main
> thread before the Cocoa event loop starts.  The cocoa_display_init()
> code that is post-applicationDidFinishLaunching: moves to the
> application delegate itself, and the secondary thread only runs
> the rest of qemu_main(), namely qemu_main_loop() and qemu_cleanup().
>
> This fixes a case where addRemovableDevicesMenuItems() calls
> qmp_query_block() while expecting the main thread to still hold
> the BQL.  The newly-introduced assertions in the block layer
> complain about this.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Message-Id: <20220307151004.578069-1-pbonzini@redhat.com>
> [PMD: Fixed trivial build failures & rebased]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(with or without the tweak you just mentioned for the
main_thread variable)

thanks
-- PMM

