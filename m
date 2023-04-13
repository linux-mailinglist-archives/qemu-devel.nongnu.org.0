Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A5B6E141F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 20:26:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn1ce-0001GH-M3; Thu, 13 Apr 2023 14:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pn1cc-0001G7-Jf
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 14:24:38 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pn1cZ-0006Cp-JG
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 14:24:38 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-94a34a14a54so371470566b.1
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 11:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681410268; x=1684002268;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sTvE/qjyBtaVFsER5jj5KhZ5lrpUMIeo1L0gvpWjfrU=;
 b=bGfOnvhkmfBm/SbA3f6tayRj8s3RcTQiQYAnoxFyO26cm2YMKQkLuNhTOHqL2DCiM4
 UaLmGOKB30H72iFXICGPgH0zYKHlWuwUy18Jrz6VoammfP4NPlCyduvWJc3JMFi8SZ3y
 EI8+VfSzuA+n1v92rDE7sMWhle+wukQPbQybsff3u4sd1PNzPEzfji8O//wtwfb4DlbB
 hMPG+k0wn9XGUCT7rNfaM9R1WMhG1XtoeG6tXimREDFqN92qZFN8mtNj7hK4ZI/qna7O
 OFkurUglg9/x1fdBKaIISRFA/8BfRHm1q0Eu0Vm7jbyrhH9qQOybIEKUiVM/iCbCwNuC
 pvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681410268; x=1684002268;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sTvE/qjyBtaVFsER5jj5KhZ5lrpUMIeo1L0gvpWjfrU=;
 b=ftKU6qQ/uD4j53DZXShLc9uJb7pMo0+cjNMRwq7QnfMyYqmi2HxnoiazIB1ETa4j5B
 rUp8BMZWe8QlbEvQVWF4WYlHDPg/m6Jg9DsphUZT9Hr6a6ePoeEMWRPFHUDOKw43VgbG
 KCY3eZRx4I/OjWXl9WNyD7RP4As10n/XXF2Yl5Pja3Pj4vRI/iNZJ2i2Rf2Dase3wDGT
 mp1UTabbXXb0UYE5Nhn/UmOfJ5aeBg9srgFtNs3INqEMF7WWK/OPvC7CHtDTot9bq82v
 Mg9yyWzhzGB6i7gZooOwCI5resRt+DxMEltEHiTPjSK/lWiAvt9yRmKFE0vlkKMIcalN
 Q7vA==
X-Gm-Message-State: AAQBX9dXc5BYvabtiioNw1a844CXXjOjqUMnb1SMIXQLhryWbhxRcTms
 YG5G3zvsiusTaVFifOqteScLQvECKEgx/gVdO92GUA==
X-Google-Smtp-Source: AKy350YGibS7/2RZMcgj3lyOLdHKVy9wb5WhkPwCtB2HC/p03gZj9ng2bCaRubY+T4wKkXukC6IHlRxaEuXkI9Ppw2g=
X-Received: by 2002:a50:9e09:0:b0:506:6baa:2d07 with SMTP id
 z9-20020a509e09000000b005066baa2d07mr1719034ede.6.1681410267815; Thu, 13 Apr
 2023 11:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230413171946.2865726-1-stefanha@redhat.com>
In-Reply-To: <20230413171946.2865726-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Apr 2023 19:24:17 +0100
Message-ID: <CAFEAcA8J4zWVL=dBAY1KYxU_im392xU1rU=GN=yQKhG6Og=SAQ@mail.gmail.com>
Subject: Re: [PATCH] rtl8139: fix large_send_mss divide-by-zero
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>, 
 Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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

On Thu, 13 Apr 2023 at 18:21, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> If the driver sets large_send_mss to 0 then a divide-by-zero occurs.
> Even if the division wasn't a problem, the for loop that emits MSS-sized
> packets would never terminate.
>
> Solve these issues by skipping offloading when large_send_mss=0.

> diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
> index 5a5aaf868d..5f1a4d359b 100644
> --- a/hw/net/rtl8139.c
> +++ b/hw/net/rtl8139.c
> @@ -2154,6 +2154,9 @@ static int rtl8139_cplus_transmit_one(RTL8139State *s)
>
>                  int large_send_mss = (txdw0 >> CP_TC_LGSEN_MSS_SHIFT) &
>                                       CP_TC_LGSEN_MSS_MASK;
> +                if (large_send_mss == 0) {
> +                    goto skip_offload;
> +                }

Looks like 0 is the only problematic value for the code, so
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

