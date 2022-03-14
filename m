Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D50244D8677
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 15:07:55 +0100 (CET)
Received: from localhost ([::1]:45480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTlMY-0000sy-D7
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 10:07:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTl11-0001K4-JB
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:45:39 -0400
Received: from [2607:f8b0:4864:20::102b] (port=46770
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTl0z-0003Fc-9j
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 09:45:39 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 15-20020a17090a098f00b001bef0376d5cso14589862pjo.5
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 06:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=m4SziW5941a+ck3rd9BNGILE6A+8NEoEG3rpcMQ7OYg=;
 b=iHoLnlmebqF9ivV/VuMIYr62yiSpzC8/PH3eXLw7VLIfPNiTChOxotZk3FE74WLg0a
 flcOq01HOjO1DDIG3mLx9p/7m9k+rNusqtpgt4XJLCXmR3jEYCZrm6QNqsRPqQ8djWwx
 AAijzsfZC31dC+eOR1jBtQhpqoG+jOMymATCFGMJBXwWG3OWwejFb43a9s5Oa5b8eSdo
 yPmR83X9SO6BOVQLHeawhuLkWksZjal1Q4/gZ2V4/gdw6t0ZHRUxSVK4fJiMzWHJ88+5
 8E+vAKxVi/5WNTzogZ2+XA32tge8YcyWTJ1M1gO9KOuSeaCS95ez7CnJmX7rQdMIxOjb
 pn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m4SziW5941a+ck3rd9BNGILE6A+8NEoEG3rpcMQ7OYg=;
 b=crwzagW4xSH0fDi4f9VC2KWPtuoGTO7OPZhi3840PffXHbXzCdnzy+w4oIBY10lo8p
 1Fhyg4rc6Mt4m8H/egN1DipEJbd2dl21mFkOvKPTgVVVmMl+atjDYXIxllsVrFcC2KoG
 h0f0BdN+qmaZIBrW/WM/cxgHxUW7Wgt7NKW8qu0BsNSMqU31aNvKId+i7DEmnjI8/m+v
 C8wOxpqUGphBCpuF2gGpAbyvi7Ie3t7Wq+eim1vEf+tRIbelkF5Wv2sebajJ/qk0ZIKt
 ZA0Rj4g4A78x8HzfWhzroE/GGb5qYfXaJVHBvbbHiFbO/SQyASTL/hkRSflUyeHp/Jr1
 S+vQ==
X-Gm-Message-State: AOAM531gBnv69zCg3hdI+wxc549Fusj0hbwgF7pPsnp0v9JH4HKwao3M
 zBKbA8GJfVq61P5RE9Mt/xI=
X-Google-Smtp-Source: ABdhPJyV3fXGrqg9Y3ykdIA0ZRSt3QaOfwXI7qkpVGVJYZrhfoEydt5M2aKLARKo1FQC5jBhuEvTlw==
X-Received: by 2002:a17:902:8f83:b0:151:5c71:a6e6 with SMTP id
 z3-20020a1709028f8300b001515c71a6e6mr23744477plo.126.1647265535693; 
 Mon, 14 Mar 2022 06:45:35 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 mn3-20020a17090b188300b001bf3ac6c7e3sm17599917pjb.19.2022.03.14.06.45.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 06:45:35 -0700 (PDT)
Message-ID: <a87fc975-ff3b-f7a3-0bb4-9791f2ff3437@gmail.com>
Date: Mon, 14 Mar 2022 14:45:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 2/3] docs: rSTify MailingLists wiki; move it to QEMU Git
Content-Language: en-US
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org
References: <20220314104943.513593-1-kchamart@redhat.com>
 <20220314104943.513593-3-kchamart@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220314104943.513593-3-kchamart@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: pbonzini@redhat.com, thuth@redhat.com, eblake@redhat.com,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kashyap,

On 14/3/22 11:49, Kashyap Chamarthy wrote:
> This document is referred to from the GettingStartedDevelopers wiki
> which will be rSTified in a follow-up commit.
> 
> Converted from Mediawiki to rST using:
> 
>      $> pandoc -f Mediawiki -t rst MailingLists.wiki
>          -o mailing-lists.rst
> 
> It's a 1-1 conversion (I double-checked to the best I could).  I've also
> checked that the hyperlinks work correctly post-conversion.
> 
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---
>   docs/devel/index.rst         |  1 +
>   docs/devel/mailing-lists.rst | 53 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 54 insertions(+)
>   create mode 100644 docs/devel/mailing-lists.rst

> diff --git a/docs/devel/mailing-lists.rst b/docs/devel/mailing-lists.rst
> new file mode 100644
> index 0000000000..53dcbfb007
> --- /dev/null
> +++ b/docs/devel/mailing-lists.rst
> @@ -0,0 +1,53 @@
> +.. _mailing-lists:
> +
> +Mailing lists
> +=============
> +
> +-  `QEMU developers mailing
> +   list <http://lists.nongnu.org/mailman/listinfo/qemu-devel>`__
> +-  `QEMU stable mailing
> +   list <http://lists.nongnu.org/mailman/listinfo/qemu-stable>`__
> +-  `QEMU trivial patch mailing
> +   list <http://lists.nongnu.org/mailman/listinfo/qemu-trivial>`__
> +-  `QEMU users mailing
> +   list <http://lists.nongnu.org/mailman/listinfo/qemu-discuss>`__

This is a fair conversion from 
https://wiki.qemu.org/Contribute/MailingLists, but a good opportunity to 
improve (could be on top).

We could sort as:

  * qemu-discuss

    Meant for users. Ideally help should point at Documentation link,
    and in case of missing doc we should add it or at least a GitLab
    @Documentation ticket.

  * qemu-devel

    Meant for developers. "All patches must be sent there".

    Then developer sub-lists:

    - qemu-trivial

    - qemu-stable (this is kinda borderline, security issue fixes should
      Cc this list, however it has to be treated as a write-only list
      - a way to tag patches - no discussion happens there).

    - susbsystem specific

      > block layer

      > architecture specific

        . ARM
        . PPC
        . ...

> +.. _subsystem_specific_lists:
> +
> +Subsystem Specific Lists
> +------------------------
> +
> +These exist to make it a little easier to follow subsystem specific
> +patches. You should however continue to CC qemu-devel so your series
> +gets wide visibility.
> +
> +-  `QEMU ARM mailing
> +   list <https://lists.nongnu.org/mailman/listinfo/qemu-arm>`__
> +-  `QEMU block devices mailing
> +   list <https://lists.nongnu.org/mailman/listinfo/qemu-block>`__
> +-  `QEMU PowerPC mailing
> +   list <https://lists.nongnu.org/mailman/listinfo/qemu-ppc>`__
> +-  `QEMU RISC-V mailing
> +   list <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>`__
> +-  `QEMU s390x mailing
> +   list <https://lists.nongnu.org/mailman/listinfo/qemu-s390x>`__

