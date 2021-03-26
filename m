Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B23F34A572
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 11:25:04 +0100 (CET)
Received: from localhost ([::1]:46014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPjeJ-0004dZ-80
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 06:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPjaM-0001Ha-98
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 06:20:58 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:37549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPjaK-0000Yy-CM
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 06:20:57 -0400
Received: by mail-ej1-x635.google.com with SMTP id w3so7603565ejc.4
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 03:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5WJN03Ew2msb1e6JG5mzDx9NLkxyPo7Y/N/B9i/feOk=;
 b=VusCNDBKNMaFze7Lnutcw2psNPQnQi4TZB1Q06POW0V6gExS8mxK/491KtuIwefCyy
 H7hChsrh9Lh+xuP6VCDwoQr9mOniRYRHd+Ln9GycpZB9xvH5dP0XDT1AtKt4/YI4JZzs
 cS3QbfCVlySh4a+2o1vKwd0Vl8/d+yJF3YRsP0kRRoxUFz5qnFRBxzmFMcmwixjol+V7
 wDIAlCELkWXvcALQhoTjmTjwv+eNWdCklJS8J9ZIWAd1KsBMXkIzWeEqZ/t2Kk+ulFlG
 G30asZ/ND8nT3ft+k1ChFq4MuZ2KcYEWe+1ewJ77t34xcA4BWyTycvKzqD4bL53VP1lG
 srCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5WJN03Ew2msb1e6JG5mzDx9NLkxyPo7Y/N/B9i/feOk=;
 b=pGkKhsGV8xwVmORhC3E1/BvUJSNlodH/5R3PW1SRAvDNiqrUj/acU9cCGbqAl+GjWR
 qYWKHi2nHl8XsOThecDWel/djHaLhXpujUCLxtYiH59hxMLdZH10qWlJyE3/vTF41Pzh
 jpFzjVEOBh3Q2jmrj2tYWpUBJPkBhM81oBOi5NfQkYtejVXTzCI1q4x8q6cRXEDV1QCq
 WGusFt2ReZw6WYfqGi/trQqm3EvK9L6iGUBJbHwA5LuicRHf6rHnJ/WJdlJrauYyhOVU
 AhPb/hjpvOAU6WM45XGaQHWLnh/wMNbL0UpSbhkR6a7ZsPvEqgn58WyyNBjQ/0N+gJLa
 8zJA==
X-Gm-Message-State: AOAM532ABBKuxQZ1jTirW2d+YVH7E34/m7/AXLe2CeDWIhaOyqp2pAId
 6SlwT6MxnqZXFKVPbKIzfJLbiKIxNRUmmqWt4ziqvw==
X-Google-Smtp-Source: ABdhPJws6FWSBH/yrJNI52CWe6GzlzX/nkox+RNtD8vpZSxL6eeNzthDEYM+yXZYsGvGxI26d4Qk3PyXaiWbIldnx0c=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr14768445ejc.250.1616754054595; 
 Fri, 26 Mar 2021 03:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210325153310.9131-1-peter.maydell@linaro.org>
 <20210325153310.9131-2-peter.maydell@linaro.org>
 <af25a32c-6bff-c44c-ff9c-65721d5e9e54@redhat.com>
In-Reply-To: <af25a32c-6bff-c44c-ff9c-65721d5e9e54@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Mar 2021 10:20:22 +0000
Message-ID: <CAFEAcA9WqyauWsF-5FbJMt=0NcRoZZfJmunDhvqyaSBUV1xm8w@mail.gmail.com>
Subject: Re: [PATCH for-6.0 1/4] include/hw/boards.h: Document
 machine_class_allow_dynamic_sysbus_dev()
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 26 Mar 2021 at 09:27, Auger Eric <eric.auger@redhat.com> wrote:
>
> Hi Peter,
>
> On 3/25/21 4:33 PM, Peter Maydell wrote:
> > The function machine_class_allow_dynamic_sysbus_dev() is currently
> > undocumented; add a doc comment.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  include/hw/boards.h | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/include/hw/boards.h b/include/hw/boards.h
> > index 4a90549ad85..27106abc11d 100644
> > --- a/include/hw/boards.h
> > +++ b/include/hw/boards.h
> > @@ -36,7 +36,21 @@ void machine_set_cpu_numa_node(MachineState *machine,
> >                                 const CpuInstanceProperties *props,
> >                                 Error **errp);
> >
> > +/**
> > + * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
> nit: s/of valid devices/of dynamically instantiable sysbus devices ?

I was trying to keep the summary line to be one line, which
doesn't give much space for nuance with a function name this long...


-- PMM

