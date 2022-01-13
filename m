Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F78D48DADC
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 16:44:30 +0100 (CET)
Received: from localhost ([::1]:59340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n82H7-0007MI-5Q
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 10:44:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n82C3-0004Ho-Ut
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:39:15 -0500
Received: from [2a00:1450:4864:20::433] (port=44919
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n82Bz-0001rq-BH
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:39:15 -0500
Received: by mail-wr1-x433.google.com with SMTP id k18so10796535wrg.11
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 07:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/3E3z/MOwTMvLZohO1vqwOB6dBLRM33id9vQH6S3ZtI=;
 b=MLSG3DwY/FNRodyOkWIwhCrnTmg/z5GPDpuBJgdZjmCrpt4vgEmLrXelvvL8D4Cfn1
 7TG2lAsg4R6nQZe+V4cbahWGz2KkVk6r+UbclCjcc5rye6SsuRmUvTNUBhW5+H27lyZ+
 DuGYCd/YxmCdcvO8saW0W6VOboHLzX32vz77yp20XsUcuRGLXsfAWI91XsfBc/S8i4He
 mOQIdYbKRX4yHbQKAusFUQ/62yDymCxxKDVy0tP+cTSgaOcCXNZxHi6NnS2sCNwVSUvI
 TeFZKameSc375K9JMRe1GJTbqouicBpqAogowQohyH/X714uKmAbKWiyW9SZtiet92ph
 CPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/3E3z/MOwTMvLZohO1vqwOB6dBLRM33id9vQH6S3ZtI=;
 b=jwVuD5SCjMe9UwOXHlmZz7tVls2uzIzC+27gxZlPO2SlJzP741cISFYUqLTpsw4mbD
 Ovcm2bR/XKXhM5OvIEkvl+9heSZVZJiLbY9Shycaf02DIYRyFtmzmvvxABjYYXXuq5qZ
 BsBgIaKp5IRDGBWIFFvA0gNN7LaNd+mWPpx+sV48CoZPjOGmul2U7aLHxfKZ+s7A2pWq
 FsehbgE1mWhdr1bIhmWCkbVYxWG+lXbnuiVIVm000QirNDJsAKblkFOr2PoLvvylKdR1
 lEQ9V6zzuYO0duPkUqFGZAosDURB9rTnVjKaNa72CJ02Gf5JkmmsOl4RXLuFDOd6EbyZ
 XdqQ==
X-Gm-Message-State: AOAM5307ydY+q5AwqaXrLcxqCzkMWjVdZmMYbIfQYJsXPGY/W87rkikU
 Vrfc5CxAOMftJbqW2eN36w2qDJ7bFVLeHvc/4DOciQ==
X-Google-Smtp-Source: ABdhPJyA2hz+DIWu/KOdK1deS4BPXPg5uclRZH681kwwsmPMQRYXotC1LL/3uagQAX7apfCQVH3KzdT+MWHP51vOC1c=
X-Received: by 2002:a5d:6848:: with SMTP id o8mr4714493wrw.2.1642088347178;
 Thu, 13 Jan 2022 07:39:07 -0800 (PST)
MIME-Version: 1.0
References: <20220105205628.5491-1-oxr463@gmx.us>
 <CAFEAcA8cY0R-jU8zH_QY4PehRnFCpJSo07VBQeXtxHKhMxjpZA@mail.gmail.com>
 <j1qGqi5somTrN_l7NlnO4O5sgwVeMYkdDQpTeSA_4yCJIfkWQiTTknlJTNc3CZXhvStUz749KLloYnHDmhA7kEIbRf-cA-3nHGXy0qjsIAY=@infinite-omicron.com>
In-Reply-To: <j1qGqi5somTrN_l7NlnO4O5sgwVeMYkdDQpTeSA_4yCJIfkWQiTTknlJTNc3CZXhvStUz749KLloYnHDmhA7kEIbRf-cA-3nHGXy0qjsIAY=@infinite-omicron.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 15:38:56 +0000
Message-ID: <CAFEAcA9pTXOzHBbEJfNjcZaAksgx1XsYDhcbKMBHV6yAoFgx9g@mail.gmail.com>
Subject: Re: [PATCH] docs/can: convert to restructuredText
To: Lucas Ramage <lucas.ramage@infinite-omicron.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: oxr463@gmx.us, thuth@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 Jan 2022 at 15:26, Lucas Ramage
<lucas.ramage@infinite-omicron.com> wrote:
>
> Hi Peter,
>
> Thanks for that.
>
> The next on the list is docs/ccid.txt, should this go in the same "Device Emulation / Emulated Devices" section? It mentions USB at the top.


Yes, please.

thanks
-- PMM

