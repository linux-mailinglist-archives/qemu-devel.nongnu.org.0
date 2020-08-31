Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CB3258169
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 20:56:22 +0200 (CEST)
Received: from localhost ([::1]:37832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCoyb-0001XU-Sl
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 14:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kCopf-0005T8-TU
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 14:47:07 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:45899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kCopc-00084e-Ty
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 14:47:07 -0400
Received: by mail-ej1-x642.google.com with SMTP id i26so9526620ejb.12
 for <qemu-devel@nongnu.org>; Mon, 31 Aug 2020 11:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Md6CUMeFbgsZ5lhNsNLNA36fUMUCsxm5Dog1Ag3KM9M=;
 b=m+eQF3t5V2un9FaZEo4GFQD+xwO50aku4mZeVeauPU2BOetnnBQxKUeajI+HQpkvJH
 v70qQqUVyE8+YdfXiRI4BR7loLFBTeoKCjire4Y6Alcs1VIZBg3c2xBYujYgorIO0W1J
 iIFolRqgPAEkmejneJHGBYWRILQEg2NWo5U3PNVlbNhKqQfd/AUqijbK/w9vc4SJB8SC
 /PluP0D0NC1i4k6nGk4Egjky48SXDFycGDS4DhzTES2u1SmTJzFjrRN2zaeNHy0KNeBk
 K+W1XjkQ67t+7Onsp+SdY6NwNheOgZOB+3v/8N8q6yFlewisx+iZdwuH0zu1x9XFV0CB
 qC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Md6CUMeFbgsZ5lhNsNLNA36fUMUCsxm5Dog1Ag3KM9M=;
 b=h4iBy7L3gKRP9tfMR6AWWHhyDebsFNsa4VCREVJlg6+grpdwGk80qSaJebaFD1Bxop
 HzOd0ozvZlmBdVn7PiSLIDlY9d+y2baatEnohvsEkLeuNbI3I9bSacE1Jx3DBwwI3cSK
 G7eY110aBEJ2wyv+aIi0UbwY3sHFdNChaO0Ij3PCbTggkaey9PmRCS9ABDBTdbBqfX/k
 iF5K/5OZHgjfg0SNT+UWxvFMPDFf2P0eXFnu1ViojgYNYPfDEW7nj0dKhN3AMdURwF3D
 oi+LSoLswhZkzyY0cY6r5Mc+yVCuyshxFgun/QCc9ZS7OBfdCJg5KpVQRELah6WXYJ+J
 5anQ==
X-Gm-Message-State: AOAM533mdlt7Qv3EnHLLNSw0OXcjhYZ69My/qhgo+svlD2KrB5J39pkA
 XJ6KgcXJawlQEE+DyDuq0HQJMIr0F/J0NeCNKGMbIQ==
X-Google-Smtp-Source: ABdhPJxONIgUlt00nN6yWQTLBBp9FSGH4WUm9geZx3vFae7RHW7l+ZGOVqQO/UWhJFu3RTTVkjHA1YSezl4hn+IaAag=
X-Received: by 2002:a17:906:f28b:: with SMTP id
 gu11mr2163999ejb.407.1598899622986; 
 Mon, 31 Aug 2020 11:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200825192110.3528606-1-ehabkost@redhat.com>
 <20200825192110.3528606-46-ehabkost@redhat.com>
In-Reply-To: <20200825192110.3528606-46-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Aug 2020 19:46:51 +0100
Message-ID: <CAFEAcA-MLDX2gZZ52uwa5K2Ke_v-naF6qofRaSqfPd+=xgd5nQ@mail.gmail.com>
Subject: Re: [PATCH v3 45/74] mos6522: Rename QOM macros
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 qemu-ppc <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 Aug 2020 at 20:42, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> Rename the MOS6522_DEVICE_CLASS and MOS6522_DEVICE_GET_CLASS
> macros to be consistent with the TYPE_MOS6522 and MOS6522 macros.
>
> This will make future conversion to OBJECT_DECLARE* easier.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes series v2 -> v3: new patch added to series v3

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

