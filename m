Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFAF4BFE7E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:26:24 +0100 (CET)
Received: from localhost ([::1]:52500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMXzb-000498-KL
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:26:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMXxB-0001TI-MG
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 11:23:53 -0500
Received: from [2607:f8b0:4864:20::1131] (port=46684
 helo=mail-yw1-x1131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMXxA-0006dw-0U
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 11:23:53 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2d07c4a0d06so180148287b3.13
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 08:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=sdBtgHvjaoGpi71Y+NLt8AUpT546WUD8rqFnY60eOs8=;
 b=nc8CvK4+qZBg9wTaW4q144gpLinsjtXWOZwIK15MJS/LuR4z8qG5mnZEIzxlSxPmEu
 6EkQyZdVQAuZyEoGL3ibIddfJQWeoAlKGYcbRBOM8iIlkfGCgwOGFWXa2ZrktdiR2qBj
 TdjGqS7yLTr+JDuZ0s+8BOENIrQ5NKLfUSQTiHwd5CEz0Z+AEPj3sJaawbGoTjY0dcO+
 L2sBLHgBUUp9Naq42h4nkmn6ToWZR4YPC+bgCI5dXkbIkHIXeZ2/2h+iiuFnSWoBU78i
 l0AwHFtKTF7C23vRvxcOps+VAPySQzn4cyXniwclQtyK32k6Jwm+lfx2XJrK32UM00PK
 zDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=sdBtgHvjaoGpi71Y+NLt8AUpT546WUD8rqFnY60eOs8=;
 b=AKyWOz7s88IRa3qfWtJ7CZzVEquCy08KM0yjISs3IgqjO5DemDldWQ8QfQI7f4m+lF
 OB/l/YwEZ7ansNlGaNFrjwW9I5bClUAG2AbuWWFJrnnKw+iaFWc495v6kEzMrIwLtEL+
 Lzwi65A8qcboGf2GB1Arr0MU+MlbQtewT2M8r+w0X48GCOVRLSj/MLH6pN05FJBrgk+N
 kVQQQFlCdaL0YyaxX6jTlBgTz/6WwXmKqSkBf/T3+/R+ok09Ybvq5ouT07EM1ALzlgoW
 EdkvxyOD3/dozgUC5/E3AkkW9/GhZljxGzopHg0SqmhJTW7U94kZ8uozsoWthDJLU1ao
 GH0g==
X-Gm-Message-State: AOAM530FfdKWV6ONMBn5/W8HGglBPO9Bi39XOgLaq59r6yZVl4DcMLLW
 9R47LOLPBs1Kj4EK5eTphkYo2aF+F3OkQA89MyzU79+V2xs=
X-Google-Smtp-Source: ABdhPJzhAH0UJXsN4msQ7Ogpo/faC4Q/hUipjrN4MF1pLJlztA8M5VnyM6a3vANLeuwA0Lxw6YG+sJ6WitmcL8MtSxE=
X-Received: by 2002:a05:690c:314:b0:2d6:b95b:bf41 with SMTP id
 bg20-20020a05690c031400b002d6b95bbf41mr21025972ywb.64.1645547030929; Tue, 22
 Feb 2022 08:23:50 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA_3C6JoHE288PUFMciO7e2OWK=z-a2168-b2r64H0QCPw@mail.gmail.com>
In-Reply-To: <CAFEAcA_3C6JoHE288PUFMciO7e2OWK=z-a2168-b2r64H0QCPw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Feb 2022 16:23:40 +0000
Message-ID: <CAFEAcA-NRsMbjBkxgJVh2y_aAm-z51Gaap8pXxChgd9=LbcXgg@mail.gmail.com>
Subject: Re: proposed release schedule for QEMU 7.0
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1131
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 at 17:09, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Here's my suggestion for release schedule dates for 7.0:
>
> 2021-12-14 Beginning of development phase
> 2022-03-08 Soft feature freeze. Only bug fixes after this point.
>            All feature changes must be already in a sub maintainer
>            tree and all pull requests from submaintainers must have
>            been sent to the list by this date.
> 2022-03-15 Hard feature freeze. Tag rc0
> 2022-03-22 Tag rc1
> 2022-03-29 Tag rc2
> 2022-04-05 Tag rc3
> 2022-04-12 Release; or tag rc4 if needed
> 2022-04-19 Release if we needed an rc4
>
> Any opinions/suggested tweaks?
>
> Easter this year is April 15-18th, which is slightly awkwardly
> between the theoretical release day and the more probable
> release-if-we-tag-rc4 day. But we can't really bring it forward
> as softfreeze is already only 2 weeks from now... We could
> move everything later by a week if we wanted more time before
> softfreeze, at the cost of having Easter fall in a probably
> more active part of the release cycle.

No complaints, so we'll go with this.

-- PMM

