Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E404E4D8A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 08:46:26 +0100 (CET)
Received: from localhost ([::1]:47274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWvhJ-0006fI-6N
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 03:46:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWvfW-0004tw-0d
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 03:44:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWvfS-00041y-KN
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 03:44:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648021470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eACxuUsXxsWvWpkBtvwbt1f8GVxFOqka1F3NNKAsb8Y=;
 b=V97ZEUtPeknNXXjqVtkDdxjw7IwSTfOkuFJfDx1oTJhtOVP2YMbL9WeqVxQ02utkOZy0hR
 B4XmXUo3UGJypofN8OdZdBXmWE0peR9vB9SW0lq98+Hlp2Hf5bIndS+qXUsRaq3bFYHRJz
 3MB7uuEVN3khwNKsDfM5QJwNspd1v5w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-oY4EUluVPMq6ZDdQWMtpHQ-1; Wed, 23 Mar 2022 03:44:25 -0400
X-MC-Unique: oY4EUluVPMq6ZDdQWMtpHQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 v2-20020a05600c214200b0038c7c02deceso323695wml.8
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 00:44:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eACxuUsXxsWvWpkBtvwbt1f8GVxFOqka1F3NNKAsb8Y=;
 b=v9204mLSaxONHy/+7Bas0lx5R4H2OfOWlbvwUgrMqmLnMfRLCEvNbQJBlSCuPU7r++
 WjazR/5AiRiRarkgM9aMxnwz++Kf5sOz1ZWQe/tmt6DKxldeBMhszI1VaMwWMwQsSFa8
 u99SKMpSkNU4WNVG4/euWxOp4ZMN7+KINOC4igtWYFQY8zU1/1M6QmOEVc1FEUInVQ0A
 etxeKILAhmg66SSYgkL0V3fZEtVMgfSxmyOx9gQJhpmYYano50Tow5V2VKFc/72EPISh
 Tq7+bOGGDJrouzlfuovixHzaCNm6XSIxeXCUQfwc9PEuoUj9/Kp+dvbqU8iXCSWqCrMW
 /HVA==
X-Gm-Message-State: AOAM532SbW4UOiMyjqfjIuGzeGWU/9Qi905NmrOYfN/pdx3DKXQHLtKJ
 NGEANmeGNjhT+UCCE/pBvsl3glDrM+RarP6Q7Hx1crRDf3RNz+p62WWSWC3Oy/ilIkjQ7t9gGRK
 Pu2S0bJxmUQH7JXo=
X-Received: by 2002:adf:ab09:0:b0:203:f9ce:cc1d with SMTP id
 q9-20020adfab09000000b00203f9cecc1dmr18990457wrc.269.1648021464691; 
 Wed, 23 Mar 2022 00:44:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrn6MYjMI8BkBYaqcv6BVHiHGj8A5unY/Mm+XdiWpcgaFcJYmpzzAvyVHxh+8OuIxKYDYL4A==
X-Received: by 2002:adf:ab09:0:b0:203:f9ce:cc1d with SMTP id
 q9-20020adfab09000000b00203f9cecc1dmr18990442wrc.269.1648021464458; 
 Wed, 23 Mar 2022 00:44:24 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 y6-20020a05600015c600b00203fa70b4ebsm14725760wry.53.2022.03.23.00.44.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 00:44:24 -0700 (PDT)
Message-ID: <0ab85e95-2cb2-51ae-fa48-089f02ac0c0e@redhat.com>
Date: Wed, 23 Mar 2022 08:44:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 1/2] ci: Add github workflow for getting cirrus working
 properly
To: Yonggang Luo <luoyonggang@gmail.com>, QEMU Devel <qemu-devel@nongnu.org>
References: <20220322191409.1330-1-luoyonggang@gmail.com>
 <20220322191409.1330-2-luoyonggang@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220322191409.1330-2-luoyonggang@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=d0=b8=d0=b6?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5u0LjQtmU=?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/03/2022 20.14, Yonggang Luo wrote:
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>

Missing patch description ... why is this needed? I can't see anything 
related to Cirrus-CI in here?

> ---
>   .github/workflows/main.yml | 29 +++++++++++++++++++++++++++++
>   MAINTAINERS                |  4 +++-
>   2 files changed, 32 insertions(+), 1 deletion(-)
>   create mode 100644 .github/workflows/main.yml
> 
> diff --git a/.github/workflows/main.yml b/.github/workflows/main.yml
> new file mode 100644
> index 0000000000..85a392b962
> --- /dev/null
> +++ b/.github/workflows/main.yml
> @@ -0,0 +1,29 @@
> +# This is a basic workflow to help you get started with Actions
> +
> +name: CI
> +
> +# Controls when the action will run. Triggers the workflow on push or pull request
> +# events but only for the master branch
> +on:
> +  push:
> +    branches: [ master ]
> +  pull_request:
> +    branches: [ master ]
> +
> +# A workflow run is made up of one or more jobs that can run sequentially or in parallel
> +jobs:
> +  check-patch:
> +    name: Check Patch
> +    runs-on: ubuntu-latest
> +    steps:
> +      # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
> +      - uses: actions/checkout@v2
> +        with:
> +          fetch-depth: 0
> +      - name: Install dependent packages
> +        run: sudo apt install perl
> +      - name: Checkpatch
> +        run: |
> +          git fetch https://git.qemu.org/git/qemu.git master
> +          git tag base_tag_to_rebase FETCH_HEAD --force
> +          ./scripts/checkpatch.pl --mailback base_tag_to_rebase..
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cc364afef7..6d1dcc36b0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3612,10 +3612,12 @@ Build and test automation, general continuous integration
>   M: Alex Bennée <alex.bennee@linaro.org>
>   M: Philippe Mathieu-Daudé <f4bug@amsat.org>
>   M: Thomas Huth <thuth@redhat.com>
> +M: Yonggang Luo <luoyonggang@gmail>
>   R: Wainer dos Santos Moschetta <wainersm@redhat.com>
>   R: Beraldo Leal <bleal@redhat.com>
>   S: Maintained
> -F: .github/lockdown.yml
> +F: .github/workflows/lockdown.yml
> +F: .github/workflows/main.yml
>   F: .gitlab-ci.yml
>   F: .gitlab-ci.d/
>   F: .travis.yml

You also don't mention that change anywhere. And IIRC you've also only been 
involved in the Windows-related CI tasks so far? So it might make more sense 
to update the "Windows Hosted Continuous Integration" section instead?

  Thomas


