Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDFE32AA14
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 20:12:38 +0100 (CET)
Received: from localhost ([::1]:60994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHARh-0001Uu-R6
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 14:12:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@cloud.ionos.com>)
 id 1lHAPO-0008J1-9s
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 14:10:15 -0500
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:42436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@cloud.ionos.com>)
 id 1lHAPL-0001S6-R4
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 14:10:13 -0500
Received: by mail-lf1-x12a.google.com with SMTP id z11so32966969lfb.9
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 11:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O2Gip/1bzs1gyJyW+//4x51IHlR4FeEZ1gXyXgmh5fc=;
 b=i9i1ZGv7iOoZFRDvhQVm7GIzjIqYkUcU+eAjauw+GpGqGUTVh6KaHbmmXy03+6S4EF
 I0clJ0wfTdLk7XCQ31EYlLgKglZQyHoTroSaJ0i/tfeK7Ys6Tkg6jqzS6UtsrHiBkf88
 Shn07Bx/CBlMUG04ijCTuxcnbLLPCIHuBzAT9f2NA3RyEiuKV/tfLx4sEj1Wtffa7Q+H
 bJQMC4B3Q/mbTI2B9L6q9MfWD+6rZDV2DHtuCM7TuF9cBUJqi6Yd3CHJkDyiAGhUnL27
 57wq+AYyB+SLiZznRlMiXsVufndp6YipvTyANtEI18/3xJaDJHWgli5XJn9Qwo3c+Z+6
 ovbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O2Gip/1bzs1gyJyW+//4x51IHlR4FeEZ1gXyXgmh5fc=;
 b=cP8zJ57zvx2W0zsfMWoKiq57ldgtJhPGdf8khNDteBjZ2d6tYnI0QOV62J9xPskxSc
 oNkufMY2rUbDedXZ4ay+9/OgIamyXUPaQFZzHWwhBLRgiH/1MHSyn+7j5WIM46ORVTGk
 6leXIOhnz92mjGgE/dJC1lpAPqT4KPOfMlDxAMPWyVtpTU7WhJztFSMiPm9/EnnSTaGT
 jJI5f6IVkUAslnNVmw+eC72LlNxFggXsadmobz2IVnFwx3SsM+PSPHr98OUMHdXrcTLf
 GaCyJZ9EzN5XCAfiD/GQcUupyHVcnnjVpUeKlwpRJqfkkBI4VQ8wIhnMzuYefI0Ht7Xs
 7y0w==
X-Gm-Message-State: AOAM530HqS+UjZZedTjPJz/WZMQE8CxTLX3+z9K4jFvr1/5Td9Ml2SHX
 ldK3s4HHCb+dCF7CqiTPHj86tpSMRDBvgUcSN9tjzg==
X-Google-Smtp-Source: ABdhPJwEDL14GWnlZgJq0i/y8ze6/ekWXQUtivHqe8C4rdqxg612SreeYu34IB4apKDj12kp7Y6jcBFbqBST8SPZJ7Y=
X-Received: by 2002:a19:ab0a:: with SMTP id u10mr13865556lfe.540.1614712209854; 
 Tue, 02 Mar 2021 11:10:09 -0800 (PST)
MIME-Version: 1.0
References: <161290460478.11352.8933244555799318236.stgit@bmoger-ubuntu>
 <CAM9Jb+hOeKrQ1QxZm5zB1LioMNuyzzTObM8XL+zatqP7KdESWA@mail.gmail.com>
 <d2f234a5-e753-5a4e-97db-21bd0a0a69eb@amd.com>
 <CAM9Jb+hESq1yEbPcMWhJTVWoUK-es168bHoOayQ_N1vh3tdRRQ@mail.gmail.com>
 <cd9a84a3-f151-fa00-0b34-2652824bbbfc@amd.com>
 <CAM9Jb+jWfW5yFMy5b9fGXr9Hk4TUv5roOQGEm5C+BSR89e9C_g@mail.gmail.com>
 <CALzYo33ACktZcsQ2u=Q2=6drtKDvZYhBOhXXRhDDZRoh7WWu3A@mail.gmail.com>
 <fc966654-c04e-a61b-dd08-c28dd04bd316@amd.com>
 <CALzYo31mMJ_Rf9PAhAHHi6JHzBn_dc6ZhsU636r1UeEj5uuQKQ@mail.gmail.com>
 <d35d495c-a3e7-5a91-d936-99efd45b15b2@amd.com>
 <CALzYo33OfA8yJ4d7LN0kowdqG4_Ty-XZycV50WTrXtq0Ka+WSA@mail.gmail.com>
 <942a8eb2-9830-38df-4edd-a4712d7861ab@amd.com>
In-Reply-To: <942a8eb2-9830-38df-4edd-a4712d7861ab@amd.com>
From: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
Date: Tue, 2 Mar 2021 20:09:59 +0100
Message-ID: <CALzYo33S+GvLXCCybKtreReTR1A0LENSdDcqQXX9abijfvYvrQ@mail.gmail.com>
Subject: Re: [PATCH v2] i386: Add the support for AMD EPYC 3rd generation
 processors
To: Babu Moger <babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=pankaj.gupta@cloud.ionos.com; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Qemu Developers <qemu-devel@nongnu.org>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Pankaj, Sure.
>
> I will add signoff from you if it is fine with you.
Sure. Thank you!

>
> Signed-off-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Please use: Pankaj Gupta <pankaj.gupta@cloud.ionos.com >

Thanks,
Pankaj

