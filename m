Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1884B6647
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 09:38:07 +0100 (CET)
Received: from localhost ([::1]:50170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJtLa-0005XB-RG
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 03:38:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJtJf-0004HV-Pq; Tue, 15 Feb 2022 03:36:07 -0500
Received: from [2a00:1450:4864:20::62d] (port=40613
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJtJd-0007On-Kr; Tue, 15 Feb 2022 03:36:07 -0500
Received: by mail-ej1-x62d.google.com with SMTP id p15so42579131ejc.7;
 Tue, 15 Feb 2022 00:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KwboSK8Jm36ruw+fM2paSrmLmkIv6bCbjLlJ9oM0qYU=;
 b=RuoTj33BLC89KgmAVctLZYw1iFhnmJ+OaNNv+QX57OfpcMIc++RZ+PDA9PSEW5gOmu
 PRJKuYuChYgl7WcvmRDcarW+4axsuSiCW2mf2oXTQVdm4QTVh84BoFVJ81kSslYh9Kf2
 GlhpBvAPnWfmfCkZzMSD0hHg2r4Zu6LVzK84sJiq0f8sOwKuQsUSyBi3mYVuAiEGKzY2
 8hiktDle0TiHpltbE+FkvsiKGJGo2SRKdQrcHN0Towd00EyTh5I4nJeIaGFJa/SrAQzc
 rZs3ghGjFmRJS4xhiuS9cLzMdVcXF8Wgm6s3VPty0oxNJlmNNmIx/C56QW7mtYFPYpAp
 iNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KwboSK8Jm36ruw+fM2paSrmLmkIv6bCbjLlJ9oM0qYU=;
 b=Npxk7iViAdtFMNQKPGqKF52AsSI4cPAbPSKGD/fw+a5fbxe5eSqwh4NR0HJZcS208f
 Hpgiv+JHioZ9DGQCNUKJunWa9X6uh1I//hb+RkLqCyKoMXfOt62OC6A8Z5bU3Mzo06Bf
 2x53QhEOoE/o57sSeJONkvbgLXV44XfUJRDyid9LF95LZTtCA3PF4DlaEmGPtvPT+PmM
 G3uvePulh2gIZZB4I0Iw6PxO3iXcN17o5GXou9aWd1NoCg70jVh8RkhALSX9Ozm3g3Jt
 M2WvRyKUDZ7qrdY7i/WtahBY5GZ7PLKnOVrhG6Je80pW7fU/CLaRSvE/vX4qvEoxxtFn
 29aA==
X-Gm-Message-State: AOAM533TzfsihZsqOIc2TKBB5Zld2kyWqMG9svnHeDdJqHbCGydvMF34
 L8psA30lh6rYX+7OdE/Y4I0=
X-Google-Smtp-Source: ABdhPJz2v/dOySPTfzIzOEBaEBjY+r6k6VHOiTDJmGOQSs7+JLxb3xvGiIuTi9EOZVLyyVncOpgqXQ==
X-Received: by 2002:a17:906:51c9:: with SMTP id
 v9mr1995614ejk.113.1644914163561; 
 Tue, 15 Feb 2022 00:36:03 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id f14sm1377454edf.67.2022.02.15.00.36.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 00:36:02 -0800 (PST)
Message-ID: <39bd75c8-b3b5-50b8-9a51-e845f40d0267@redhat.com>
Date: Tue, 15 Feb 2022 09:36:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 7/8] tests/qemu-iotests/testrunner: Print diff to
 stderr in TAP mode
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>
References: <20220209101530.3442837-1-thuth@redhat.com>
 <20220209101530.3442837-8-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220209101530.3442837-8-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/22 11:15, Thomas Huth wrote:
> When running in TAP mode, stdout is reserved for the TAP protocol.
> To see the "diff" of the failed test, we have to print it to
> stderr instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qemu-iotests/testrunner.py | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
> index 9d20f51bb1..1f7ca1f2f9 100644
> --- a/tests/qemu-iotests/testrunner.py
> +++ b/tests/qemu-iotests/testrunner.py
> @@ -404,7 +404,10 @@ def run_tests(self, tests: List[str], jobs: int = 1) -> bool:
>               if res.status == 'fail':
>                   failed.append(name)
>                   if res.diff:
> -                    print('\n'.join(res.diff))
> +                    if self.tap:
> +                        print('\n'.join(res.diff), file=sys.stderr)
> +                    else:
> +                        print('\n'.join(res.diff))
>               elif res.status == 'not run':
>                   notrun.append(name)
>               elif res.status == 'pass':

Queued, thanks.

Paolo

