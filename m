Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EFF3FB706
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 15:34:46 +0200 (CEST)
Received: from localhost ([::1]:45808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKhQy-000745-Nw
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 09:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mKhPr-0006Kk-3j
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 09:33:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mKhPm-0004mK-44
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 09:33:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630330408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gf1P4Ksbt2msNnnSUgiA3Pc7+BRPEWrBQVm130029R0=;
 b=giVbQzDWBs7VJd5oVIg4uR2d7uzLk8WDdY0jNhdHym1lNBHa2ayyZvYpJUMBSkQ9r5gAMF
 jnRsQIH+QWbpRPwCo47aYJ7EdgvUPN8yj7/NBCyr4gHhx7HJZwIRFyuDBK4qOcli9Bqnsp
 iH0m0Zi3frWgws3CesNojytN+6745Cw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-8yX0ZBb0MrG5Drbt_lkhgw-1; Mon, 30 Aug 2021 09:33:25 -0400
X-MC-Unique: 8yX0ZBb0MrG5Drbt_lkhgw-1
Received: by mail-wm1-f69.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so10080470wml.5
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 06:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gf1P4Ksbt2msNnnSUgiA3Pc7+BRPEWrBQVm130029R0=;
 b=iwXf8YUNWzL8rnBOTKkVO+hYJ6KBfHgnCFf8jaDvg5NztArp6MdjBLAnhXaGn+NGo8
 YXukZ+e/cAIT7VOjsJtsu/plPFNY4zE8O+eilJjGbQ9v8+oVeZp/A6mk/Ss5dOGGAkFW
 WX2lE/mpi9oO8MZIbDvdZmUQZKrrSBinF1JcQaLPJCUIpwyhbmtJ7oydkvMmDH3LA65l
 QyUbbkbxsqApRWR2dVUTahFrkiMlbKvC4leeQLgIyOW2xiRuHlHx7TwOpiMq5mGkwBAM
 dG6W6K1P9PDi6mgsikPx43NEntDyB9bkfSe0OGqwtevdaGIiXGX+cDoMzYoOt36skT/1
 n8Fg==
X-Gm-Message-State: AOAM533Arxr5gTNLIYK97+wM3kMynh830Z0yjfxbyAwYpITnowEDMhfA
 wQn0Ik/V3kVYGze3f+MMM83+UKuUeACTSqx7pi0tgYnUWw+24xK6o0kSgnJhCF2mHRPJrEzrE+b
 oWvRV9N2wxgMZhvw=
X-Received: by 2002:a05:600c:3588:: with SMTP id
 p8mr5138883wmq.20.1630330404483; 
 Mon, 30 Aug 2021 06:33:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4mUkIIXEona8RiZvysL7Csb5QV8J+iVKnlGEr3Y+/qMedFEJoACDwAv9+aaugTsn5z4Slrw==
X-Received: by 2002:a05:600c:3588:: with SMTP id
 p8mr5138858wmq.20.1630330404298; 
 Mon, 30 Aug 2021 06:33:24 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id u9sm15496476wrm.70.2021.08.30.06.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 06:33:23 -0700 (PDT)
Subject: Re: [PULL 5/6] docs: split the CI docs into two files
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210825110018.100913-1-thuth@redhat.com>
 <20210825110018.100913-6-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <224f739e-96c6-0e14-e53d-d64a8ade64ca@redhat.com>
Date: Mon, 30 Aug 2021 15:33:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825110018.100913-6-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.932, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,

On 8/25/21 1:00 PM, Thomas Huth wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> This splits the CI docs into one file talking about job setup and usage
> and another file describing provisioning of custom runners.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> Message-Id: <20210812180403.4129067-2-berrange@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/devel/ci-jobs.rst    |  40 ++++++++++
>  docs/devel/ci-runners.rst | 117 ++++++++++++++++++++++++++++
>  docs/devel/ci.rst         | 159 +-------------------------------------
>  3 files changed, 159 insertions(+), 157 deletions(-)
>  create mode 100644 docs/devel/ci-jobs.rst
>  create mode 100644 docs/devel/ci-runners.rst

You took this one but not the following "docs: add definitions of
terms for CI/testing", is there something missing there?
https://www.mail-archive.com/qemu-devel@nongnu.org/msg830839.html


