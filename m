Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C93310DD2
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:24:55 +0100 (CET)
Received: from localhost ([::1]:48632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l83ug-00071D-88
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:24:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l83tE-0005hI-Sq
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:23:24 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:40566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l83tD-0004v7-3J
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:23:24 -0500
Received: by mail-ej1-x636.google.com with SMTP id i8so12780844ejc.7
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 08:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rep0lK1KaNu1xs3vZkB5bz8Z3dVym5AcZHkpq0teltk=;
 b=AaMcHpNlYGVi88Deche4k8xjCPSDHhtRuxjG57kUr/w80uCk2pg83KVpUpQ7DEFzdL
 WMIblTxaSopFwvC3IvkOYxfId2klrCh9IWmQGgsRwApeZsQujP48jnaK5az3pdpn5Dw6
 Fg8cwkhaown6pr4+f1oS5BXdKpoNCtfd9UaIYa69jiCuPrkFyvu1Ajgp3HzFIINU/UIQ
 1802XTzPZc+KhNvL201rIjejUG8PmkLfvFkjb4Wat/0blgvEx7yTNg7wJ5RAuzrpWub8
 IO92o9l1YT5zejXXb9szB1semsN1+XphQH8s6uf4vJ+WFhiMy3yChxez/icd+BQRPZTH
 B5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rep0lK1KaNu1xs3vZkB5bz8Z3dVym5AcZHkpq0teltk=;
 b=oC7ubZk+sT9qf9VHEXWV+oyeGbLeIeVpeGspGKoFR/1kZh+rbaFoFZtKhhdhZ7YkTt
 QdrDQlKKsQHtKy0DAs1wr1EBG1sc4i4lyay2FD+j5L2c9Dvuz4ivfkd8sFaPyQpmlKjm
 5hdv9qHnhiC2WttpdNZz1BjjONTG+mcSqDPO58H65rEusfgC5BpPFfof0qMCvx8jKXiJ
 36E4et1QmPvZGKUshqdrlJovpephRCGwSI4ecQ3iwDiPdMv/U6YTzaAxOztMSrTOiyOS
 c/cVufBHAHHjceb8/5iAAgniU0kyMbq+rmnAWbHazJFeunG+oc9USZs4wdSUsGfbWNEH
 olSA==
X-Gm-Message-State: AOAM533OQ/Q0uuYltxKxCIeO3rUNYD9wme8ER5r7d+SuxZFjTu1zwdH6
 r1jt58tIKztFb6mJUsY1Z8uF8vVii++fCVLV5H441Q==
X-Google-Smtp-Source: ABdhPJyOxTFWabdk5KA2AOI6RbXHP3kQHbCPttiLoKpTmqMJQQcTZHRFGVE5WUlVFON4Yz4PeH4bAtpgkZI5ESO7mjM=
X-Received: by 2002:a17:906:3a89:: with SMTP id y9mr4718295ejd.4.1612542201455; 
 Fri, 05 Feb 2021 08:23:21 -0800 (PST)
MIME-Version: 1.0
References: <20210204154327.386529-1-stefanha@redhat.com>
 <CAFEAcA9krQPfgzLSEimNdN7dUQJbqUObGtoiK7A9ZOGKxanR+g@mail.gmail.com>
 <20210205162105.GB416527@stefanha-x1.localdomain>
In-Reply-To: <20210205162105.GB416527@stefanha-x1.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2021 16:23:10 +0000
Message-ID: <CAFEAcA-VFfcWzH47nxgthtcdkCzm8c74uo3rj8Zd=M3mWAXX7g@mail.gmail.com>
Subject: Re: [PULL v2 00/27] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Feb 2021 at 16:21, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> Thanks, I update the patch in question.
>
> It looks like the GitLab CI doesn't include a clang version that
> produces this error because the pipeline passed for me:
> https://gitlab.com/stefanha/qemu/-/pipelines/251524779
>
> Is there something clang-specific you want to check in the CI? Maybe
> clang 3.4, the oldest version supported according to ./configure?

Would probably be nice I guess. My ad-hoc builds use clang 6,
which is what tripped up here.

thanks
-- PMM

