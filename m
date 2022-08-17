Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D910E5970D4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 16:21:09 +0200 (CEST)
Received: from localhost ([::1]:58672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOJuu-0002PR-Fa
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 10:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOJr2-0008AE-Sn
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 10:17:13 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:44669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOJqy-0001Kf-54
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 10:17:07 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-33387bf0c4aso129553367b3.11
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 07:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=gSQYwIur0TnWqw87RShg0kBuK+dqi6tF48wXcCwRLUc=;
 b=uceGiycAX+DsBAU0HMKeOdUN7PQiF9u3JV6BuUjVgAKrhAajjDVrTIaE2zfBGR1ves
 80IkIAuiogx2aHt6PAm1xFH9RPMsRSuyZV6yPFhdDU7oXcq5tcHM+u/+lrEWPE6A/WT7
 qU4/9/iNZKiacw2VUvIZOdvKw3kAEppJn4BiDx1bIt3V9tTouajU1ihcooaQ+T/lH5ON
 J6Q+e4xwHojVsKPTgVrfPMje1u+OQQnRtIUQd/9l8cgzBNsZsXhMp1v5MKmubtj9xbNm
 1y/8DNY1F4+KYP04+jbADy9C9rAn9t6YaBvcG0WpUf+Y9QYhisoDQUZaUtQWussIqMB1
 v4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=gSQYwIur0TnWqw87RShg0kBuK+dqi6tF48wXcCwRLUc=;
 b=tVg1Zg66LQwMZVpRe4DXPcEK2kyqE8PSelsQ6Y0tbkopa4ssAGJbATucUOVFjiocNM
 sjrMBhOqK8hLNNIlsW4A8cv0ni6pNP+nKseDQLOoL9DIyR0c0IDZC+Hum56X+EynUzHq
 zZWGH3qpstj5d90sNA+fQYR+Yq+54o4/zaUWE7btXo/s3OE1655BNVehZjAa+xR/O3Y1
 bEHLZwAM9BZCHVlb5y85N4vUKi+0JY7Nne5Zz8fpESyXR52YUNM0A+1qMB31XAENw5YB
 T5oyVArmmrGGfN1zNnZH7oe+/hDKnVPcT+dFkAUCViZhZlom4FSwJ/d/DvnCWrYZUtOl
 13Fg==
X-Gm-Message-State: ACgBeo1y6sEUiUCSa2P0y6/LWG3Z0d8yW1tzPiDzTUUdgXjKePgSE9Z+
 CFpslXiECwBmv7hyww/Q+pVUxLXjAvK6VTNKaXWg8Q==
X-Google-Smtp-Source: AA6agR7E9QCcmvHnyYpcyn6yfDiQ1n4cBbaiiIY2McqAxe7ba0Tf0iCXNV9ihMFfoGYobBEUU2lm8sNRhnCDiPXyzvE=
X-Received: by 2002:a81:10a:0:b0:333:618e:190b with SMTP id
 10-20020a81010a000000b00333618e190bmr7089270ywb.10.1660745822511; Wed, 17 Aug
 2022 07:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAAJ4Ao9crXap1OYiutSgG5caZHzVkM=WvQYpVD2XN1M8JsD3cQ@mail.gmail.com>
 <877d3jupln.fsf@pond.sub.org> <3206015.kY3CcG7ZbH@silver>
 <7218690.D19hzYb2mh@silver> <87mtcen7bz.fsf@pond.sub.org>
 <CAAJ4Ao9rqmMjR2CGHBUKE8VH3pC0iuAJhUXv5Vqo5koGodt=jw@mail.gmail.com>
 <CAAJ4Ao_77mWH34V6GvrCP6suW0FPTV539C2amAm4EXbMyaLK6w@mail.gmail.com>
 <CAAJ4Ao__fJraFsh4=D-+2DfEe2B8y18yd3zOBwJ5d++x2aWQGA@mail.gmail.com>
In-Reply-To: <CAAJ4Ao__fJraFsh4=D-+2DfEe2B8y18yd3zOBwJ5d++x2aWQGA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Aug 2022 15:16:21 +0100
Message-ID: <CAFEAcA9bCqGRZ=oYCmmnaxkNfftRDdFk4d2wfHfW-Je_apb3Ww@mail.gmail.com>
Subject: Re: [PATCH] error handling: Use TFR() macro where applicable
To: Nikita Ivanov <nivanov@cloudlinux.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Greg Kurz <groug@kaod.org>, Jason Wang <jasowang@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk <kkostiuk@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 17 Aug 2022 at 15:06, Nikita Ivanov <nivanov@cloudlinux.com> wrote:
>
> Hi! Are there any updates? I have not received any comments since the last email.

Looking at the thread, I don't think we (yet) have consensus on the
right thing to do here...

thanks
-- PMM

