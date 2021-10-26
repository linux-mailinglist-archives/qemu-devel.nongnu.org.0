Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B111E43B501
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:01:00 +0200 (CEST)
Received: from localhost ([::1]:51032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfNwh-0002eI-RL
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfNuD-00009L-C8
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 10:58:25 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfNu2-0001Xy-Bs
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 10:58:24 -0400
Received: by mail-wr1-x431.google.com with SMTP id m22so16450582wrb.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 07:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vnkuq1AYSkUP5+5R9SqV6zxJzBGglRpVU31mbV+LRug=;
 b=dfkoLW5s65H6y2Sgr4nDKXJ3HelQcN6p/TIg86iWAncCmpGPyN1YZi/KxuEN2dHxXt
 TjTgsNHMJpa/Nfg8/DlXKTWg6i9to5d4UpobFppcmDJI32cCmUesR/btwdbLc5Nh9Tll
 PYvzM7LTKqMBneoMHGipzL3hnFizHvYghk9zVVAxBUSK8zMTVthddH07/vrYl8k+mxG5
 Sjd69k126ptd9kM064T281hY3fsUgf+KgXjv/agK8GWUOIIwZOfNjAFnW0kfHsaMCF1w
 LyRil87qG7Rg6Z1nMPdB1qRht1sSQDY9eRD0auoFd6kLhEL9RsxqEa2fXbA1jLcT/VPM
 brxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vnkuq1AYSkUP5+5R9SqV6zxJzBGglRpVU31mbV+LRug=;
 b=hhvqIa+lJeeIbMzGxu77J5zG+66Y+md3HeA+92gyo3Y5zOrpVzzU+nBjBq7ogrICAy
 ijiQt4Dcwp0WwQAH8ucLFOH8+XBs/icef7Yd/d7OvDv2POLnnofJRmruhUp2ylEV/Pr2
 xeBW2dAvR5hQx7mQD/SZLIj0OFULafkezUayuNTKpzHFGcOryuxc5V+bFMF3UAvYg8S4
 XArtG7Vn9EgWphq8psEIWwBVw0V1Gu+uYJw6/cmMTFbGD90KF2IHDsn9B3rgeAAFh8Mf
 557oDmVAd3SOjdlfrDQ2yhANpHcEtYzyGofAeb0uynFe7oVdn+0R4O4xIQCtThG2Q6Hx
 ix2A==
X-Gm-Message-State: AOAM533HsGYheIPrPQiWBmJwGXeeGr5ZrLMuLzJd2SvKmKFsuPzjHrRI
 cLOyO2ybiwEhIOIWO3VNFwI=
X-Google-Smtp-Source: ABdhPJw6Deg/sRRYJZzuTYqrajhDYanAxLl4r9QRyThHxqV5NL9BUPkoBiwHbN1X18NR5t7Z3FkuJA==
X-Received: by 2002:a5d:4d05:: with SMTP id z5mr18819170wrt.408.1635260292880; 
 Tue, 26 Oct 2021 07:58:12 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id v4sm12079462wrs.86.2021.10.26.07.58.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 07:58:12 -0700 (PDT)
Message-ID: <a7d65f8c-efbf-3001-f840-df6951acc2c3@amsat.org>
Date: Tue, 26 Oct 2021 16:58:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 03/28] tests/docker: Update debian-hexagon-cross to a
 newer toolchain
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Brian Cain <bcain@quicinc.com>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211026102234.3961636-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.215,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>,
 Brian Cain <brian.cain@gmail.com>, pbonzini@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, berrange@redhat.com,
 robhenry@microsoft.com, aaron@os.amperecomputing.com,
 Willian Rampazzo <willianr@redhat.com>, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 12:22, Alex Bennée wrote:
> From: Brian Cain <brian.cain@gmail.com>
> 
> The new dockerfile uses a complete toolchain built by CodeLinaro.
> Remove the special casing that was necessary when the dockerfile
> built the toolchain from source.

Can we start using .container_job_template for the
currently special-cased hexagon-cross-container job then?

> Suggested-by: Brian Cain <bcain@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> [AJB: fix MAINTAINERS]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20211014224435.2539547-4-richard.henderson@linaro.org>
> 
> squash! tests/docker: Update debian-hexagon-cross to a newer toolchain
> ---
>  MAINTAINERS                                   |   1 -
>  tests/docker/Makefile.include                 |  24 +--
>  .../dockerfiles/debian-hexagon-cross.docker   |  45 +-----
>  .../build-toolchain.sh                        | 141 ------------------
>  4 files changed, 9 insertions(+), 202 deletions(-)
>  delete mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh

