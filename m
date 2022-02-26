Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1A14C5609
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 14:06:19 +0100 (CET)
Received: from localhost ([::1]:52600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNwmA-0008Ob-Gu
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 08:06:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNwiu-0006OE-9X
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 08:02:56 -0500
Received: from [2607:f8b0:4864:20::b2a] (port=40640
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNwis-0002yV-F5
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 08:02:55 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id u12so11178862ybd.7
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 05:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Refxn54vu5VeoxbPyaVWdRrGQXwHuwlpxuLsIn78eFo=;
 b=EwdVHBj5rxYXmkbG2Bt1Yj9YIqyPEnNjgL8x+QunPDQPFzku07NGdKV7F8I6SNii+c
 8TX/vOvlimLIR8fY8/jbs92B9/QwUeSIFiS3/oD6S+bhy8coFD3tcM0hpfizxq3smRH6
 VmX7GS8ghvV8n0Er+7eFaWwqEEhvA5h2bsLWQddaGMlqiF3J40O1AfqjuDCm4tZ8pi8U
 Tx3dMM6bMDhIcOIihSKrMZdvCsQl9ljyREvJqlLsK1S4EcqQT9qAUCuMTZr2WwkW/Fzi
 O9OKIJIpjicxTTzkCNmcb5V2tl8kS5v2gJXK5CPiBfef+yQ3Er+l1msZWXiVa/AWDHin
 gbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Refxn54vu5VeoxbPyaVWdRrGQXwHuwlpxuLsIn78eFo=;
 b=1Z0EItGbTdjFVcr994UQ7kj/QfSEWdEY6B1LfLYUpWVMom1liUx71DJLHciqdo8lAZ
 VsZ9bw/VeD51/2ffxErUjOwGmBzMiua7VFSf5OhIm12dB6YmRUHX3OKFAJIUFDR/yi5A
 +ayQ8JkWmq9Hm911+kOqWtSSQdkTPoKF+wlv9R5ZMUSX0y0Y30Nipu6wh9gkj0PQOkNF
 LE0W+XlqHhBsD26vDoFNGdLzs2uc8xjcRy2aUUamx0vo/qmIecdBRMJqaXsuYaic5Vfk
 bRJqQgGcRH8A0sG5dqQDxLQC/eXLtjRzLTIn0ZkYe6tJbwYwv2ifNg6UK+6CPfdPn3Hl
 2hNA==
X-Gm-Message-State: AOAM532GAJ8yHOezu3lEgJGbX0XnpvPJCRRNbdKqiGHDFEiqFJ03ULgV
 JXqMhvHSDjowYnREIHIafgXV0FSfm1ggn0zF9YwuwA==
X-Google-Smtp-Source: ABdhPJxhMH4juGspEKWw1OCK4Q20eNlEBD6GguFqlWuFdhzwnB40IC9z5TTY4TRNTWZdbIRhvSQGF/4XbV4kXy325/4=
X-Received: by 2002:a25:497:0:b0:624:8ba2:fc8e with SMTP id
 145-20020a250497000000b006248ba2fc8emr11519929ybe.39.1645880572959; Sat, 26
 Feb 2022 05:02:52 -0800 (PST)
MIME-Version: 1.0
References: <20220226124535.76885-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220226124535.76885-1-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 26 Feb 2022 13:02:41 +0000
Message-ID: <CAFEAcA-XgD5yotXLc+kfv3Q0HROnb5owkyi9iZ7Ls1RLV+Jddw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] cutils: Introduce bundle mechanism
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
Cc: Programmingkid <programmingkidx@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 26 Feb 2022 at 12:45, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> Developers often run QEMU without installing. The bundle mechanism
> allows to look up files which should be present in installation even in
> such a situation.

This is supposed to work already -- it is why find_datadir() looks
at a path based on qemu_get_exec_dir() as well as at the
CONFIG_QEMU_DATADIR.

If you want to replace that mechanism, you need to explain:
 * under what circumstances it isn't working correctly
 * why we should replace it with a different design rather
   than attempting to fix its bugs
 * why the design you're proposing is the right way to do that

The cover letter is a good place to explain that sort of
thing, so people understand why the patchset is doing what
it is before they dive into the detail.

thanks
-- PMM

