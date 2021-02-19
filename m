Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E4731F704
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 11:06:21 +0100 (CET)
Received: from localhost ([::1]:56080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD2g0-0006On-7W
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 05:06:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD2eK-0005bu-3C
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:04:36 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:36166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD2eI-00081l-49
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:04:35 -0500
Received: by mail-ed1-x531.google.com with SMTP id l12so8845326edt.3
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 02:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=koh23eCvV3ZF67V21kukd2L1vk4m9X/66kmz0I5bE4g=;
 b=yjfqdfJ0am69K6LgZJe9d9IctiNb9dmXgBrGFAnv6S9wXktUqL3WLNB5iflJvpjOoq
 7qux700ljw1TJjDxbXmTJyB9ejVHmMuygSqTaOASDuyJwG61ZROsjaDi1lvlhvYAReFO
 cq4WG4WA9RDSKjCc47cQ3J6Maux4cMF4y3cXMMTj4K8G/U0WcgnWm8kWMao4RW1MOClv
 t/0SkJXUq5qz16qLqvWAQKd5syp7ndj/VH+YdrZAU3+ugC7fDHnBZtqi8TCKDfJzkxTu
 fAR911GHqajTF1NYUiTdWrnWqPMlB/nVvMERNZJe+tropepBNd70qpWAVU5wjmHCtOuH
 L3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=koh23eCvV3ZF67V21kukd2L1vk4m9X/66kmz0I5bE4g=;
 b=Sh/bZacHcMmV7nDyIRJhi735vVhggwLatZQyXIjMIzc2L19HgJ10wLEaDdP2rWqbC2
 OnP2THcRXL49auBpsGBlRvbY8cbku5K/8Isdte/eTJAP+Up35QMQsmn/EdnQpZpSmirJ
 Y1KBzfEfLhTot1Tk9oPOiNuvyhIJEaVPri0lgDf6BptT3Z/cSSoq8wXmm7ioMoA7B7Oq
 lt1hKMXk9oJwT4d7vSW7mcSO33pkSVWXl2t2b0zalQ8gr2tJBr3J9tOJJKnTjn+lwB4P
 6tqJ/qnraoRMxcwie/I2R6y1oDcOcayZIN5ilE2FleFQJhdItolT88AsUEBID0ej4TEa
 1pfw==
X-Gm-Message-State: AOAM532oH0k/q3IAScaB3mU+A5N5dPra3hamnXuHaHKRFdGe1/DZ5ZJE
 GdIxhzhybAqHnzXMBnYfpDRDBLuTK16iXOc9AWINKQ==
X-Google-Smtp-Source: ABdhPJyWekLvfdSUUcAD2Ejm8sjnpL1GKO9wj07OFXib/flHir0GfefQOlIqrUSsC8+uzs7b6RkfZRPGA9H90uOR+/0=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr8388139edd.52.1613729072342; 
 Fri, 19 Feb 2021 02:04:32 -0800 (PST)
MIME-Version: 1.0
References: <027101d7035b$2e94a600$8bbdf200$@etri.re.kr>
 <57e74877-84a4-0157-1407-a67156dc2b6e@redhat.com>
 <023201d70695$72b7a250$5826e6f0$@etri.re.kr>
In-Reply-To: <023201d70695$72b7a250$5826e6f0$@etri.re.kr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Feb 2021 10:04:21 +0000
Message-ID: <CAFEAcA9GJLr_GX3fHgssE2E=-q6waeN5ZKgWfCrdGAyK0e3C_g@mail.gmail.com>
Subject: Re: supported machines for aarch64
To: Chan Kim <ckim@etri.re.kr>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Feb 2021 at 08:05, <ckim@etri.re.kr> wrote:
> These are the machine lists that included cortex-a72 when I gave
> qemu-system-aarch64 --machine xxx --cpu help.

Adding '--machine whatever' to your command line does not change
the output of '--cpu help'. As Philippe says, it happens that
QEMU processes --cpu before --machine, so it handles '--cpu help',
prints the fixed list of supported CPUs, and ignores whether you
passed a valid --machine option or not.

There is no automated way to get QEMU to tell you which CPUs
a particular board model supports.

I recommend that you follow the advice given here
https://qemu.readthedocs.io/en/latest/system/target-arm.html#choosing-a-board-model
for how to choose a board model. (Short answer: if you know
you want to run guest code for a specific board type, use that
board type. Otherwise, use 'virt'.) Then, you should stick with
the default CPU type (ie, do not pass --cpu) for that board,
for all board types *except* 'virt'. For 'virt' you can pass
in the CPU type you want (and the documentation lists which
types it supports).

-- PMM

