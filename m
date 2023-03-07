Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E086AE7D4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:02:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZahL-0007xG-8m; Tue, 07 Mar 2023 12:02:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZagk-0007pO-Bx
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:01:29 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZagh-0002uB-Fx
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:01:20 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so17233895pjh.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678208477;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WyDyh5HVxYY8HoolXUwCi7zaXf37lTLiWGgOuOej6Ak=;
 b=xnP7IaYPniU3G8TYQekmf8PFTRTDDDwswRQ9IbtEQAtsDvmluNwDMd7RuEKWQ10Xei
 lCr4rWz6eWGmpNyd3t2ZTabHWDTqi7Nv6wu09/yg2aJ1whJ6dOtScuACTlv53n3G/ZtI
 mzPjnxvqapDk5c+pilGVaHf8/UOsZL7453YQCkntPg7LxtYIfrqElZ4ufiBtfJ+wDtzP
 ZLBXkm+jqZbbZK5Dadqgnbqam2H6pIFJL5tkfxRrEyB+5NElOZZZaHd1cBoG9sA62aHw
 /7LP2t14TGsFYY/pcgdzVeCFTSb/Af8TCDgOy4dLdSxWcALdRMURXiBB3L2VafwF/FD7
 e/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678208477;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WyDyh5HVxYY8HoolXUwCi7zaXf37lTLiWGgOuOej6Ak=;
 b=PhEEEAVuMM9O9w4BXCViyQvdbVFI+pShvTNWzC2JesOxr4bi5MDL2BvAGcXp04Mg8A
 c3BNj9VEf/5+N2f+dr0oItAkjUIfxV/D2QLy0U6B6MtaJPCdKX+uXHaxw/WDXp0NBA2l
 BgwaK+3f0o/B/CTMjHtimb/0UfEssBacRB+e3N/GEGKtxfje/cCYit46iM4k6KM+6Yy+
 17GadDT0J1iigHMRJdm44fhKP8osx33tnmE/PWg/e+j+45TejQNvc/5ce6zY8rkJJc0V
 49BSHFkXXwvIIHCdGsTIgFeafb8azKfVXIv1nS0bhGpBP7q0J8hPUwH76HGOX2XtxqbG
 2fgQ==
X-Gm-Message-State: AO0yUKVQ1Lezes4eBwmJNKXqBRqfKL0nN+t6GQg/e9cg7crsS+NT5jYX
 8N/K3kywZxI9/OWjL5hTrXDbTjlHQgwl9UnUqUgoaQ==
X-Google-Smtp-Source: AK7set/cTiy/pjbClj+VI4RzX6w89bVroZOUtZ95vrWybx8Cpq8d+o+zUwKX6gKQPdLvcrsvLGxfh9Huh+YdgzU9JHc=
X-Received: by 2002:a17:902:7e0c:b0:19c:be03:ce10 with SMTP id
 b12-20020a1709027e0c00b0019cbe03ce10mr5714105plm.9.1678208477378; Tue, 07 Mar
 2023 09:01:17 -0800 (PST)
MIME-Version: 1.0
References: <20230307070816.34833-1-jasowang@redhat.com>
In-Reply-To: <20230307070816.34833-1-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Mar 2023 17:01:06 +0000
Message-ID: <CAFEAcA_Pctm1m30Cm2Q2cpyp9JmNgej5nB0ovZGtjfFHU2R9SQ@mail.gmail.com>
Subject: Re: [PULL 00/51] Net patches
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
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

On Tue, 7 Mar 2023 at 07:08, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit 817fd33836e73812df2f1907612b57750fcb9491:
>
>   Merge tag 'audio-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2023-03-06 14:06:06 +0000)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to c19b566a3898510ec2b3e881b3fb78614b240414:
>
>   hw/net/eepro100: Replace DO_UPCAST(EEPRO100State) by EEPRO100() (2023-03-07 14:55:39 +0800)
>
> ----------------------------------------------------------------
>
> ----------------------------------------------------------------

Fails to build on Windows:
https://gitlab.com/qemu-project/qemu/-/jobs/3889073853
https://gitlab.com/qemu-project/qemu/-/jobs/3889073855
https://gitlab.com/qemu-project/qemu/-/jobs/3889073780
https://gitlab.com/qemu-project/qemu/-/jobs/3889073778

../tests/qtest/igb-test.c: In function 'data_test_init':
../tests/qtest/igb-test.c:219:15: error: implicit declaration of
function 'socketpair'; did you mean 'socket_uri'?
[-Werror=implicit-function-declaration]
219 | int ret = socketpair(PF_UNIX, SOCK_STREAM, 0, test_sockets);
| ^~~~~~~~~~
| socket_uri
../tests/qtest/igb-test.c:219:15: error: nested extern declaration of
'socketpair' [-Werror=nested-externs]

build-oss-fuzz failed on something involving fuzzing eepro100:
https://gitlab.com/qemu-project/qemu/-/jobs/3889073821

The 'crash-test' jobs failed with an assertion
"qemu-system-i386: -device igb: MSI-X is not supported by interrupt controller":
https://gitlab.com/qemu-project/qemu/-/jobs/3889073868
https://gitlab.com/qemu-project/qemu/-/jobs/3889073873

thanks
-- PMM

