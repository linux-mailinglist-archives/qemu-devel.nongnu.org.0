Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 178C3537624
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 09:58:01 +0200 (CEST)
Received: from localhost ([::1]:50444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvaHn-0000Pt-Hf
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 03:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nvaE8-0005vE-GD
 for qemu-devel@nongnu.org; Mon, 30 May 2022 03:54:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nvaE6-0002oh-Tq
 for qemu-devel@nongnu.org; Mon, 30 May 2022 03:54:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653897250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xyLu02YyawDhaWf5lgDdO8t7avYbd1MkoGYYbV+7IXQ=;
 b=BxUJZhwn0b/yJvez5mZU1AwEeF+VVcYf4/0jSiKe/7Veni/N8md3CeXcge3GrzZj7yoyAW
 QAgwt4GEKeKpyHDcdcSi7HawZgGzO01AnibQCUZ1NzG7VbSiDuf5fRRGr0/x0pVbbquXLO
 vgMzrLO9wJaRV25jDTfOwawqY964y2w=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-81-47_Nq1bVOs-RaNolFAUfRg-1; Mon, 30 May 2022 03:54:08 -0400
X-MC-Unique: 47_Nq1bVOs-RaNolFAUfRg-1
Received: by mail-qt1-f198.google.com with SMTP id
 f40-20020a05622a1a2800b002fcc151deebso8740830qtb.4
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 00:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xyLu02YyawDhaWf5lgDdO8t7avYbd1MkoGYYbV+7IXQ=;
 b=USvo+eUM7PHYDamGk17QtssktAKK4AklS26Gjwff8JFi3JEZ5HpFbjHiJhNMlr7msV
 jiHIexKxCYR9j+405BYP7vpNNslLfpD1oAJR8768pxo7frG8LWASoGw8A0dgaOT673ZQ
 2SuF8aJNNDkaNUgeSYUHrFfFQrlQsE4gDW67F8QCa2IX3MJy3v9FXFsH7ZZyfCYqQF+0
 5cTIXGkRuFywuEuzeE7xTDsSO1egHeCsH/gpvCk5OCygvWGfINFyPGGMSKumR74G2fCp
 wpXodVi+poA3LOjTtAp0hPRY1wPw31LRCdeyPzIN1wp9Ko7Maxdr1xWfVISXnuIowNsx
 ZCOA==
X-Gm-Message-State: AOAM531YcY2fReDsyNAH2DPdwS8KhFDv2m+DXSTTNgaVlf7kk6L8VR35
 /VenOVZmdN6NxsPVYz8oCVd30uvYSt/UsX+wDIaF++KOhbglGKTgNV0or7H0z/ZgK/hjUVaIhBv
 HrawlYte0xREsrNo=
X-Received: by 2002:ad4:5cee:0:b0:464:53bb:a299 with SMTP id
 iv14-20020ad45cee000000b0046453bba299mr1568810qvb.92.1653897248136; 
 Mon, 30 May 2022 00:54:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyujqTogQqWij3R9jXJurof29UHRo9rc27nyG0TgVBRgTj9hCrURfyGU3LEZJFZ0HaVP8+puA==
X-Received: by 2002:ad4:5cee:0:b0:464:53bb:a299 with SMTP id
 iv14-20020ad45cee000000b0046453bba299mr1568794qvb.92.1653897247905; 
 Mon, 30 May 2022 00:54:07 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-216.web.vodafone.de.
 [109.43.179.216]) by smtp.gmail.com with ESMTPSA id
 bq44-20020a05620a46ac00b006a33bee9a47sm7712243qkb.63.2022.05.30.00.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 00:54:07 -0700 (PDT)
Message-ID: <0b56c840-4207-1d96-fcb0-983c19038fbb@redhat.com>
Date: Mon, 30 May 2022 09:54:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v1 29/33] gitlab: convert Cirrus jobs to .base_job_template
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
 <20220527153603.887929-30-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220527153603.887929-30-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 27/05/2022 17.35, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> This folds the Cirrus job rules into the base job
> template, introducing two new variables
> 
>    - QEMU_JOB_CIRRUS - identifies the job as making
>      use of Cirrus CI via cirrus-run
> 
>    - QEMU_JOB_OPTIONAL - identifies the job as one
>      that is not run by default, primarily due to
>      resource constraints. It can be manually invoked
>      by users if they wish to validate that scenario.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20220526110705.59952-3-berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/devel/ci-jobs.rst.inc | 14 ++++++++++++++
>   .gitlab-ci.d/base.yml      |  9 +++++++++
>   .gitlab-ci.d/cirrus.yml    | 16 ++++++++--------
>   3 files changed, 31 insertions(+), 8 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


