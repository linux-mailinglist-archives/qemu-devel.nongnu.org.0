Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F133413636
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 17:28:36 +0200 (CEST)
Received: from localhost ([::1]:38038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mShhC-0003pP-Uk
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 11:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mShfV-0002mr-TF
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 11:26:49 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mShfU-0004iz-AD
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 11:26:49 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i23so40430284wrb.2
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 08:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J8z58QU6cld6O77+st3RQZ0DqKLwRRQz0h6eSAVI/QY=;
 b=KzDXozol6kHILX0cE7xV8sgnm9IPzfi/nl2XObTKyL4b4TMUrDbl1ZOzjwyj3Xacor
 z0mxYO8QA8BYlUbXXH5naoNST481obrzZgplIB5+H25/qmVEdH2P6kSoTUW/MlfnvviV
 gqOJFB3jLhBAQNBMbku9KxDzO6rYB5tnAWGEPMcX5fpA//50YShWOwRUp6EnEFqt76wO
 tp5oAEppKLykGQRC54Vu0po+UVlRLcsxkyztkn0FOp1Oo0SCYiVM5FglfEwM7ySJfJ8W
 rNCGj3lLSsyUnzpZNRziofv9rwDvojAwIRA83t/+mNnwZYjxS/avS315TKpvMHV42KWa
 YusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J8z58QU6cld6O77+st3RQZ0DqKLwRRQz0h6eSAVI/QY=;
 b=P6BcrLiK/Mcl3v70Ny+Y+Iql+02Y/syBQOqt1Eu6kDp3boNqNqk77pWAmh7bPDxbEl
 nggGRFUZfITd7ONoUN7puVu5NegGDZMu0lvhDTrXp+fj6ojx1TSm7UhqLeAm1C7yQLsQ
 e6wsyyM0gR9R0zcxqHGIKWLUlfN/wwsSDYmM8T4we46cMea+JLTA/BjdvaEHUoLcFRX3
 6RPv9n3w10CLUpOR55B1S9titkc4zR13iiCEhRNoXxKB8HC0J1gGBn/zfdQNf5pPVoHz
 ZFAUW4VL2BjL9yeGOi9oQAE2UuWLx8sCvjcfEqXUlmZoH2/y3Nn1tlpTQkbkasyEPVYk
 7gSA==
X-Gm-Message-State: AOAM530KORB5LDu7XPYvoZV5DjyYYjyj18Eai4ilSDbMc8KBt7+cCC2q
 sMuG2g6oQtj8mINZHviU1EtStfe6TFH9GmII9qFXpQ==
X-Google-Smtp-Source: ABdhPJwKclSQy42QcErCXM9mvoXhMvOn3WBI1Qg13kVD625dra6M7Gv5mgeNvDcV2ZweHiD1f5ndTxuorPCEdPUxLK0=
X-Received: by 2002:adf:f185:: with SMTP id h5mr36347600wro.302.1632238006767; 
 Tue, 21 Sep 2021 08:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
 <CAFEAcA9XxgFYj6jzNGEhgMHhB2UQF_X3ZLigu4sRPrR3Zfj8sg@mail.gmail.com>
 <f371bf7a-71e7-b6fa-4d0c-0a71b7b7f19c@linaro.org>
In-Reply-To: <f371bf7a-71e7-b6fa-4d0c-0a71b7b7f19c@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Sep 2021 16:25:54 +0100
Message-ID: <CAFEAcA9DyA5-itPBqBmB9buZ+y1u2xR5ozAjg6x3714=Kz6hHA@mail.gmail.com>
Subject: Re: [PULL 00/35] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Sept 2021 at 14:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/20/21 3:07 AM, Peter Maydell wrote:
> > This seems to result in a failure on the s390x all-linux-static
> > CI job:
> > https://gitlab.com/qemu-project/qemu/-/jobs/1604251543
> > due to a core dump running the 'trap' test.
>
> Curious.  I can't reproduce this on s390x.ci.qemu.org manually.

I've just seen this on an unrelated merge:
https://gitlab.com/qemu-project/qemu/-/jobs/1609218763
so it's presumably an existing intermittent failure :-/

-- PMM

