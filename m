Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7EC39E876
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 22:31:27 +0200 (CEST)
Received: from localhost ([::1]:58624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqLuA-0006Ts-2N
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 16:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1lqLhN-00082M-8J
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:18:14 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:45840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1lqLhK-0002mi-1F
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:18:12 -0400
Received: by mail-il1-x133.google.com with SMTP id b5so17421877ilc.12
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 13:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JhRI1cpUPMz052xPX2sQSUVtxlyGdKfcS4TX+3XhmX4=;
 b=Hs7G5GCSEsEIh+48k5yKszrp3P9aIp/6ybMKChEQcmnLu57WpfHj85CHiLZFheY/nX
 Arzc4mDATxXMjtBe4n3Wk1WpmNg3r6Vo3Na4kjdB+e230ELEnmi4Zwb5gYBmyU1CSOUI
 5V1rJyP+VtSYsmqMSqoC7RbFEYtMknp7TSXMqu6ZwR/z50G5nCNixNGw2wwNwRrL+zp4
 5yVqfEx5PNTGifGL5uOAypbQaMQvEcMSHfXOpl2klMScv+9lZZlGl9LnLOir9I33qG7z
 EjO0RFXK83A8zelv8mC+gSOjJu+PwziqiVgstesYHZg9eQ65xanEhKZgBdBqxIPILHAr
 hQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JhRI1cpUPMz052xPX2sQSUVtxlyGdKfcS4TX+3XhmX4=;
 b=Q2ZhZypI+0LCFVDdXYo+C4TGg2DSpQgnEvo8eU18BvfvAvgyjv0RxqnCrpcqOi8lD8
 oeeIj2HlGpfKUEUf4vLzyeQheEIvYLXe0AfO8zZcY/E8zrooYRSuwgrCmt33AxJOPqta
 4/b0G63dpTRdosazKMMmiSng4sXyto7ovnEWT5/P/jvR1yOkKbMlpQiD44rsk1k0oTyk
 gw21vnfTABcl0t+AKmiN9L5mVSI+2kNZDrxW+nAXeN8D1BxAF7KdLN9tWWbeDjbdEdQi
 YHXrbVPaqcx0q4pyWR6i7Eg6iN7H39TT/iKDcvHK9LtV7RzlYbUvL+Yav2bd94B4NL2s
 FHwg==
X-Gm-Message-State: AOAM530f813hfRXXOJFJOz3hneo39RphRWtmc+fBG918jHCGEI6dVuKU
 yHnU7lIhYtxPcjQ5TfIyYfQnLgvJl37LPisikz0SZw==
X-Google-Smtp-Source: ABdhPJzL7lF5f5l9ne/jCuI1MoDeB6Y2yXhpN1boJEZUvLA4lytaotD945JtwFVs4uwGR98kq7J+6j/yxiwIy9L+Vyk=
X-Received: by 2002:a05:6e02:4e:: with SMTP id
 i14mr16256036ilr.72.1623097087636; 
 Mon, 07 Jun 2021 13:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <01000179c92c4e24-efe56a44-af19-489d-b9c4-04386251a7de-000000@email.amazonses.com>
 <20210604133607.GB21481@quicinc.com>
In-Reply-To: <20210604133607.GB21481@quicinc.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 7 Jun 2021 14:17:56 -0600
Message-ID: <CANLsYkya2Y8cGHA2yV7JY12fXLTR_Rx2fWFUDicFgxSCBDBwPg@mail.gmail.com>
Subject: Re: [Stratos-dev] [PATCH 0/5] virtio: Add vhost-user based RNG service
To: Srivatsa Vaddagiri <vatsa@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-il1-x133.google.com
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
Cc: stratos-dev@op-lists.linaro.org, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Jun 2021 at 07:36, Srivatsa Vaddagiri <vatsa@codeaurora.org> wrote:
>
> * Mathieu Poirier via Stratos-dev <stratos-dev@op-lists.linaro.org> [2021-06-01 20:03:14]:
>
> > Hi all,
> >
> > This sets adds a vhost-user based random number generator (RNG),
> > similar to what has been done for i2c and virtiofsd.  In fact
> > the implementation for vhost-user-rng and vhost-user-rng-pci
> > follow what was done for vhost-user-i2c.
>
> Is there a Rust language based equivalent that is planned as well (just like
> what was done for virtio-i2c)?
>

Yes, that part is in the works.

> - vatsa
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation

