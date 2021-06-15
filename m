Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A76CC3A7C98
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 13:01:34 +0200 (CEST)
Received: from localhost ([::1]:37020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt6p3-00057N-PB
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 07:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt6nX-0003y8-Gx
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 06:59:59 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:41511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt6nS-00023V-4A
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 06:59:59 -0400
Received: by mail-ed1-x530.google.com with SMTP id g18so48528437edq.8
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 03:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DBsfqqGg/F1hbfQKagdoqc2bj4HLHyYfplQ9buiz5w4=;
 b=F51/0NTVyq8Jomgm0dWAFEogCHgE2ZRbyj6CDyQEtxjsRTPOH4otlnniy9ebUnpco9
 YYFP2vR28Y9WB3hx2CytQHJbMuD8O1OYIrho7gYuWEZ16nlCIRNBUuun7h/zMK9jTEIO
 DRaBVaiRtfaRY5xsh6EJSFV1Y8BFr0k5EvzT8AA3bC+7MPCzRZpXeanXW6MXcTsKkIoe
 K9Uo813sdp1JkoCP9AfZmpoUFvCUT/X8nmssvsp2ET96OsviSOWg/lYuqttLwJtWGGeJ
 Jx71/cPoKivhbi/R/PtxlM2i+f/jUG3eAITSRLiapl0AZPYQXltNBdtcSZgf6Sf5s6Hi
 +ABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DBsfqqGg/F1hbfQKagdoqc2bj4HLHyYfplQ9buiz5w4=;
 b=c/ROQQ90xbKFX5x2NKNpeRXUH7XQx8DR8xAgBfiznp9SBT4CvafFO1+wkX1d3x2dgR
 MKYOcLdQJvuOByryvvUuTmpusIzD9aDSWi8oHIYv5O9KVzZid14On1+7iDuiR29N/+Os
 CpsouINmnNfc4JR8F+hG2vdlwG81OLBPyyYdt4Ybq40W7Ttz5r/Tq7uPDY5++9cvLmDo
 Pjr58vVeiAa9E+uOxpwAZ8BvSgDQMrI93rn4r+VW/yOr8IoJUDhwbfi8K0U3J1t62HWL
 lhA2o8ZdThsjwAa9ipz6VDkBezPPtRZzMqsftIWbunTKT4PNQL4pqsQOs3oTHIdJpo++
 3XCA==
X-Gm-Message-State: AOAM531yKgL/rhnPpw78KbWB/mQhAA6/zIkyR49yNOBLFgDaddtaRNqV
 FzGcSMhePAsyMgiQooiWgg8dpq8kzw7jhHbQ44Iz6w==
X-Google-Smtp-Source: ABdhPJyxniLqZqIibSJCDwzpWVNKPKxvvzcSCZk47TYin+VdwArJqEvyELC0lJtfayXFkCIBBU9mJVxFSiQ2NnvnWnI=
X-Received: by 2002:a50:a413:: with SMTP id u19mr22006423edb.251.1623754792692; 
 Tue, 15 Jun 2021 03:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-18-agraf@csgraf.de>
In-Reply-To: <20210519202253.76782-18-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 11:59:17 +0100
Message-ID: <CAFEAcA91tkwO3ghBitmskOWHb-9p9Dfa8nENciEA1wRxzni4Wg@mail.gmail.com>
Subject: Re: [PATCH v8 17/19] arm: Add Hypervisor.framework build target
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 May 2021 at 21:23, Alexander Graf <agraf@csgraf.de> wrote:
>
> Now that we have all logic in place that we need to handle Hypervisor.framework
> on Apple Silicon systems, let's add CONFIG_HVF for aarch64 as well so that we
> can build it.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Tested-by: Roman Bolshakov <r.bolshakov@yadro.com> (x86 only)



Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

