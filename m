Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F256B3F9E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 13:45:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pac7l-0001Av-TS; Fri, 10 Mar 2023 07:45:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pac7c-0001AP-Pu
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 07:45:20 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pac7b-0004EU-3L
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 07:45:20 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so5059826pjz.1
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 04:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678452317;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RpuYiEAKbm4Qfr2AKsSAnd879Dy4ZTeAB8TgLuhER/c=;
 b=Kl2BezlzW7es/06NzB30kxas1opljwlWmMi5ZVFb5rMVNCYC+lr9Bwc8gjCtZCSA85
 ZGfQGwJqUm9FBsn8AuWQxxU+X2dTEZT/oPkUopKRTJ2loddyJ7dt/YFVLTPKitE2TfaA
 XXOtMB/A6g+L4/9oJ64vlaTrW3rd6SXnMuuj/NE1qFbHyfEcO/oGbb7uE1jHWWexVBSj
 uObyltnoZNcnNbeiYP4e6iSnhZnkRXQa5E5nE3hFczY8Z/p2dF+RJ1YjgNiZJUjDuqpc
 gmm2SZ4R13se1CO8SMKByqXNcJC3t8yIUN3PD85b8Xrp/CYynKCKnSmBQ5DbjKtwMo5O
 r8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678452317;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RpuYiEAKbm4Qfr2AKsSAnd879Dy4ZTeAB8TgLuhER/c=;
 b=A7TeKNDfDnlhTaktWJfpR/Kv/bNm8c+p8emd9Kc48ZWFyiUsZ9/my5zHtK2QH+I8Tt
 K31hWd70SMuBxST88MtXJbyO5BwGq0HbFboOIyC6jxxQyvGFs3uGv3fiVYIyd25R/vzj
 qKQEf39cp7EiUF3DRTHT/Nt6YJn/98sj1kMS4uXwjIAH1EolvoBKtuLy0vtxdoVrpU3+
 fw1R3fHP5rgmNBEkxZUXUMwkNdzIMwBuIBUTUzxBi/kSmOxxaRp7n2CvfzsJtjjbNWCH
 4XeWA6n2mGBmpt8p/8bTXyTyhVvrjy+s0pBVRp3GaUclNaCmu5gk1BIkEm8t4OnoXYGQ
 yWrA==
X-Gm-Message-State: AO0yUKXqHnFmdlNsPGFDKw+Q8TsWLWWqEZUrCJUrjw7iHfN5PpIZC66i
 /jtN6JxZ0u+tWUaAhqf68ZqcqVVASiU/qcWdxK2f6w==
X-Google-Smtp-Source: AK7set8Q3ym1GXmnDqhCCSpmZnUx60vtG9pBjafalSnocKOF0obpg88yYKi8c8ebgh8kAZ62nVs7nfc5dEi2XztD75g=
X-Received: by 2002:a17:90b:f12:b0:237:5834:2808 with SMTP id
 br18-20020a17090b0f1200b0023758342808mr9517485pjb.0.1678452317328; Fri, 10
 Mar 2023 04:45:17 -0800 (PST)
MIME-Version: 1.0
References: <20230205040737.3567731-1-alxndr@bu.edu>
 <20230205040737.3567731-2-alxndr@bu.edu>
 <9cfa0cc8-01c7-cf79-72ef-3224d1276e16@proxmox.com>
 <20230310122347.hghmijad7wajiqne@mozz.bu.edu>
 <20230310123117.d2uxze7zqtigmg44@mozz.bu.edu>
In-Reply-To: <20230310123117.d2uxze7zqtigmg44@mozz.bu.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Mar 2023 12:45:05 +0000
Message-ID: <CAFEAcA8YLrr0Ltt-CAdTDrh2zyzzyqWgfx39fy0zJwLFqdGQGg@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] memory: prevent dma-reentracy issues
To: Alexander Bulekov <alxndr@bu.edu>
Cc: Fiona Ebner <f.ebner@proxmox.com>, qemu-devel@nongnu.org, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Fam Zheng <fam@euphon.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
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

On Fri, 10 Mar 2023 at 12:32, Alexander Bulekov <alxndr@bu.edu> wrote:
> This MR seems to be "lsi-ram".
>
> From hw/scsi/lsi53c895a.c:
>
> memory_region_init_io(&s->ram_io, OBJECT(s), &lsi_ram_ops, s,
>         "lsi-ram", 0x2000);
>
> So the LSI device is reading an LSI "Script" from its own IO region.. In
> this particular case, I think there was no reason to use
> memory_region_init_io rather than memory_region_init_ram, but this makes
> me worried that there are other devices that use something like this.

This particular device predates the entire MemoryRegion set of
abstractions, so it might have seemed easier at the time.
The endianness handling of the current code is also a bit
confusing and might make it tricky to convert to a RAM MR.

thanks
-- PMM

