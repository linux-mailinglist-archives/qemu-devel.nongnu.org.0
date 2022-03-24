Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CA74E6211
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 12:05:54 +0100 (CET)
Received: from localhost ([::1]:53592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXLHs-0006lE-Nh
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 07:05:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXLCn-0004x9-NI
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 07:00:46 -0400
Received: from [2607:f8b0:4864:20::112f] (port=44811
 helo=mail-yw1-x112f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXLCk-0002wd-Ns
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 07:00:36 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2d07ae0b1c4so46307947b3.11
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 04:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DLzcI8vZmLrJvLGmlHlzGdaoF71YkMF+dyBNil2cdMI=;
 b=YY8bK0eWL9mQE4WYuBz5NFM13QHsBHJYinM1oLz1PUOCt8wmkyKdW4r39QNNKDS5Mb
 N+WW+v4eLzKbZNUof9GykXNVtRUaxVfQHByuPZmJRC0s/tBOPueXT+kDLTotCIecZPaF
 7lmSb1cmD5qQaAbDuiIwVWXKzMdR4Be152ua0+pN4A55j7JAAlB6Ac+SqOQGXQ5EQwqv
 hbu/ib7l7YiIUSBxqr87JyaBxhTxBLU+aMmlTc1uLaluYKAiXLOOKUfH1LvXVT8ogj1B
 Or5eB5unS8sLT4sYPqEqI2EVuN38tSblGhuCySRCH2joCI67+EVVg45NEZPqeY3vfZSH
 vkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DLzcI8vZmLrJvLGmlHlzGdaoF71YkMF+dyBNil2cdMI=;
 b=7uLxsvH0zk6uQxNX6lT0gfhfC57gXSC2ekQ0iTFYY2q6vSnK5nWN9lpLDSrZxsQ+MW
 CSHQtu+KBy+wigOjVdAJB0xOXze9bGzxxFaNe3dFmwa6W1Jdv1OlwrOMqS4QuMtyypLQ
 Qhaf3MABFarUQlMWGGWr+cs14LUxEMblG638HJxWREyzSA2EpyDsauKRzbWXoJSEZdEf
 3LwYlc42XKC08C6xEHvtVNC3uZfr73yLvAThWP49sXu0kEkGJ6VqjdQSPLFthM1wIppn
 0A6ZezpWmdgDQNDBWr7ImuaSIelrzC5hA7Rw3RkJU96Q+ZYUhMmgIxFmNHbaTEKz2fAH
 CHxA==
X-Gm-Message-State: AOAM5311d1OBtP45cQMupa4NP8Ap4MOhoBwJw7BWXhW+Cj7UoETsXuRH
 yKTkHDXMPGZe5nYWCvRykxUBm8wwOHTEj4GF/0hRuA==
X-Google-Smtp-Source: ABdhPJxDj/Je9ZCm6RV1HjQ2ayyoOhuRGV7z/czFxPz8vOxtvYft18SWzD4+lith/e4ldakBzz3nR9sb1PhJfXVt8I0=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr4105844ywb.257.1648119633751; Thu, 24 Mar
 2022 04:00:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220323112711.440376-1-alex.bennee@linaro.org>
 <CAFEAcA-Eua8V0L1bKRf1C5F7-cVyfcJ+EEnidaj90L+E86FHJg@mail.gmail.com>
 <871qys4hic.fsf@linaro.org>
In-Reply-To: <871qys4hic.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Mar 2022 11:00:20 +0000
Message-ID: <CAFEAcA__QoKC+dUCH93bFb0eSLbMhhQqxfR+DRihxRRfS8eEug@mail.gmail.com>
Subject: Re: [PULL for 7.0 0/8] i386, docs, gitlab fixes
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Mar 2022 at 19:05, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > Is there anything in here that would affect s390 host? The
> > s390 job seems to be consistently timing out, eg:
> > https://gitlab.com/qemu-project/qemu/-/jobs/2241445160
> > but I have a feeling this is a pre-existing intermittent
> > hang on that host...
>
> Nope - but I can see the tasks that are locked up:

We definitely seem to have a problem where the runner is
not correctly killing processes it has started when a
job hits the 1 hour timeout.

-- PMM

