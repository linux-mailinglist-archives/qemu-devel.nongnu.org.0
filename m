Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB2C4BA62E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 17:40:33 +0100 (CET)
Received: from localhost ([::1]:34042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKjpX-0001VG-Vh
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 11:40:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nKjmq-0008WE-TT; Thu, 17 Feb 2022 11:37:45 -0500
Received: from [2607:f8b0:4864:20::c32] (port=35771
 helo=mail-oo1-xc32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nKjmp-0004Vi-60; Thu, 17 Feb 2022 11:37:44 -0500
Received: by mail-oo1-xc32.google.com with SMTP id
 189-20020a4a03c6000000b003179d7b30d8so223327ooi.2; 
 Thu, 17 Feb 2022 08:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hVjOnfoEw1XJprIsFPTDlJHbffibU6mY1ORjgyyWR8g=;
 b=DcIop0FiDeMFjUJAExybv0NkZ9Nyy8u8/1eFYUnXMVJ+GThoRXBYQBOrkHq7driSdI
 2u/GmJR+TZAzF1YRxc1Xm6IUrplR6V2g19nttVaH+z05VYbSmLs2Himod8Dg9gDuVrBm
 91ItU9FKheKQslziL0OimSmSf21zqiqKodNuv8oyRqgHl0FN9a/rV7waT+vmvqLmt4iq
 b64ZTtuPXbJePvbCrLT+7g4yiaNRgELzKwggZ5MdJGpHCq0P+EJumoVKy7QcXd31SUKP
 CE/qWuRSYQQBX/+mKi3IGcxjR9K7SKd9sO1U64A2ifs484u00uPUdTRXDQzDPzq8z8Uu
 2o/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hVjOnfoEw1XJprIsFPTDlJHbffibU6mY1ORjgyyWR8g=;
 b=YVUtIOvrsQuH1oO4E2cqwfSLesDmTSTXgK8qHGcK9raBd2PXuCmXfCCpH6jhbXs5Da
 J6nfso8Zy4WAI+uxjcdweTd8mCX0QiolykEY4o7o9kGW+Pou5kmmj6wD2uDSR3442qTo
 S65ZDXZ97B3F7pUacrjLL0QkXhc+yt0bAwFgI6Af0a+jZRsvU0m4qMcVPJt4bKh1pUHy
 NNsDGSE0G4717bPaw2PKKgraW3k6S87D4ZLbuMw+FloSlpUGSB6K+lExISouk9gd3jWD
 lw9WANwmGEB6SULQWzgDewpX6yGShxS/QDzRd84GBeuGwnMsuaR54n98v0T/tTd+89Ro
 muZA==
X-Gm-Message-State: AOAM5324RWkAL5jhdp/kgFuJh4JJkRQEFvCDq+hUOU4xk69sv/oev363
 Y+KBzi4LK9ss8qDrWouaqco7u0GIDOYNgBtsTAI=
X-Google-Smtp-Source: ABdhPJw/VFGQwjwEuKKRzT6Lq8iqiknbttopiUP9NhvgXtmrmMHFGLcQtu89u8U/mVOOIPCbm4BGPp3fuS3S2KeVnmA=
X-Received: by 2002:a05:6870:5b0e:b0:d3:4f0d:fef0 with SMTP id
 ds14-20020a0568705b0e00b000d34f0dfef0mr2533406oab.242.1645115857174; Thu, 17
 Feb 2022 08:37:37 -0800 (PST)
MIME-Version: 1.0
References: <20220216203415.138819-1-dmiller423@gmail.com>
 <20220216203415.138819-2-dmiller423@gmail.com>
 <45137b73-2c97-7b22-b497-45f6c4f30205@linux.ibm.com>
In-Reply-To: <45137b73-2c97-7b22-b497-45f6c4f30205@linux.ibm.com>
From: David Miller <dmiller423@gmail.com>
Date: Thu, 17 Feb 2022 11:37:25 -0500
Message-ID: <CAEgyohVRqmouZbFxfrzjiNyJMEiJFrh1izAa2nq89VYnaTr4sw@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] s390x/tcg: Implement
 Miscellaneous-Instruction-Extensions Facility 3 for the s390x
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=dmiller423@gmail.com; helo=mail-oo1-xc32.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, David Hildenbrand <david@redhat.com>,
 farman@linux.ibm.com, cohuck@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Will submit patch later today, thanks

