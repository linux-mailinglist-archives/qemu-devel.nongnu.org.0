Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C783162EEA8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 08:51:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovw8V-00087u-0j; Fri, 18 Nov 2022 02:50:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovw8H-00085i-Ro
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 02:50:03 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovw8F-0000lA-Nh
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 02:49:53 -0500
Received: by mail-wr1-x42b.google.com with SMTP id i12so4116404wrb.0
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 23:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dKkuCb8O/+hu/n0+GJwvMQVMe26uPPpG0q6cLUHmRw4=;
 b=bKtR8Kng35pWQtHmD8QjFPQOpaLLU7owhoMMARKufH0k8suo0YeC1DeZmqN4qdisoO
 Fx1ODH5BCoCm+30tdBFBs6+JX1H5RFd58VULVmRlc3LNO980BwtYD3O/Dp5zq9pIvF1O
 UN0D7rBM2S8G6k3R3x1vFmIgI4kbIcTTPkxvlb4h5lqUU3kOGrpb6KWpqYOyMM51sg05
 MoTRCj/IAN0fFCoO0aX4qtMPVEQCVeltICpSgjEDnU6jnbO3wgPkK7jylxu/KYXMe4na
 pvdXJqOVOTu95me28JmCRgqW3UAkxAH8kJIR6gczKfsI+l9+pcXVIM3qqiP36Pl3d9Y3
 H+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dKkuCb8O/+hu/n0+GJwvMQVMe26uPPpG0q6cLUHmRw4=;
 b=QEB3kPnvjkT9AXP+XmzAvQVzLnuCopNqjM7s7S+iaWoqePlaupUHGcpKdMr5pI3TNF
 /DvFS2UGZUSJuoO8mtUVBHclut6RuGnnASqZB1MH0jxQAp6UPBMgSw+NuJkxRLBP9Qrw
 h/uw7cn8611EZdwDxENA8wOrWezP85EQ7OsYnHjWT00fkiD/YI5W2vPkMeSISTawvU+s
 WWqHXEdggKCRzHSQDWdXR+376uz0PpZPmUZzhz2WVvcLxFxRD8CDq9AzFn5zckE4jp3x
 kR4/jBmEmbviyi1yQ0obg9UEgig42n5Pq127NxEslYW4aCspAWLjB6MvEM31vWFIEy72
 nopA==
X-Gm-Message-State: ANoB5pk2W68h14aSBTg3tSSSV8w+dS5TUUfe3dC0ZCVLxxv7Y+HtIA/R
 ETfJn1ZPdA4IhfxhFbbcBYfceQ==
X-Google-Smtp-Source: AA0mqf43x/2VWnnfVKrDPMQJdHkfWZT6qRRFqy8XQuXo38wQc+A+KoVuvCUEeFqcGPbg4iH31/Tx0Q==
X-Received: by 2002:a5d:5385:0:b0:241:beff:257a with SMTP id
 d5-20020a5d5385000000b00241beff257amr1623015wrv.656.1668757789817; 
 Thu, 17 Nov 2022 23:49:49 -0800 (PST)
Received: from [192.168.230.175] (34.red-88-29-175.dynamicip.rima-tde.net.
 [88.29.175.34]) by smtp.gmail.com with ESMTPSA id
 e5-20020a5d5005000000b002305cfb9f3dsm2827719wrt.89.2022.11.17.23.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 23:49:49 -0800 (PST)
Message-ID: <000c7ccb-562d-0c41-aacc-bc9481b76eae@linaro.org>
Date: Fri, 18 Nov 2022 08:49:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v3 04/13] docs/devel: add a maintainers section to
 development process
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com
References: <20221117172532.538149-1-alex.bennee@linaro.org>
 <20221117172532.538149-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221117172532.538149-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 17/11/22 18:25, Alex Bennée wrote:
> We don't currently have a clear place in the documentation to describe
> the roles and responsibilities of a maintainer. Lets create one so we
> can. I've moved a few small bits out of other files to try and keep
> everything in one place.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Message-Id: <20221111145529.4020801-6-alex.bennee@linaro.org>
> ---
>   docs/devel/code-of-conduct.rst           |   2 +
>   docs/devel/index-process.rst             |   1 +
>   docs/devel/maintainers.rst               | 106 +++++++++++++++++++++++
>   docs/devel/submitting-a-pull-request.rst |  12 +--
>   4 files changed, 113 insertions(+), 8 deletions(-)
>   create mode 100644 docs/devel/maintainers.rst

> +The Role of Maintainers
> +=======================
> +
> +Maintainers are a critical part of the project's contributor ecosystem.
> +They come from a wide range of backgrounds from unpaid hobbyists
> +working in their spare time to employees who work on the project as
> +part of their job. Maintainer activities include:
> +
> +  - reviewing patches and suggesting changes
> +  - collecting patches and preparing pull requests
> +  - tending to the long term health of their area
> +  - participating in other project activities
> +
> +They are also human and subject to the same pressures as everyone else
> +including overload and burnout. Like everyone else they are subject
> +to project's :ref:`code_of_conduct` and should also be exemplars of
> +excellent community collaborators.
> +
> +The MAINTAINERS file
> +--------------------
> +
> +The `MAINTAINERS
> +<https://gitlab.com/qemu-project/qemu/-/blob/master/MAINTAINERS>`__
> +file contains the canonical list of who is a maintainer. The file
> +is machine readable so an appropriately configured git (see
> +:ref:`cc_the_relevant_maintainer`) can automatically Cc them on
> +patches that touch their area of code.
> +
> +The file also describes the status of the area of code to give an idea
> +of how actively that section is maintained.
> +
> +.. list-table:: Meaning of support status in MAINTAINERS
> +   :widths: 25 75
> +   :header-rows: 1
> +
> +   * - Status
> +     - Meaning
> +   * - Supported
> +     - Someone is actually paid to look after this.
> +   * - Maintained
> +     - Someone actually looks after it.
> +   * - Odd Fixes
> +     - It has a maintainer but they don't have time to do
> +       much other than throw the odd patch in.
> +   * - Orphan
> +     - No current maintainer.
> +   * - Obsolete
> +     - Old obsolete code, should use something else.

We could add a line in MAINTAINERS 'Descriptions of section entries'
header: "If you modify this section, please keep in sync with the
description in docs/devel/maintainers.rst".

> +Becoming a reviewer
> +-------------------
> +
> +Most maintainers start by becoming subsystem reviewers. While anyone
> +is welcome to review code on the mailing list getting added to the
> +MAINTAINERS file with a line like::
> +
> +  R: Random Hacker <rhacker@example.com>
> +
> +will ensure that patches touching a given subsystem will automatically
> +be CC'd to you.

Although 'R:' tag means 'designated reviewer', such reviewers is
expected to provide regular spontaneous feedback. Otherwise being
subscribed to the list is sufficient.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


