Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6CD47718E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 13:23:17 +0100 (CET)
Received: from localhost ([::1]:56614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxpn1-0002ea-Uy
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 07:23:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxplu-0001oR-Ta
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:22:08 -0500
Received: from [2607:f8b0:4864:20::52c] (port=33701
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxplq-00028L-DJ
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:22:03 -0500
Received: by mail-pg1-x52c.google.com with SMTP id f125so23008814pgc.0
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 04:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lsFI1omoaWaQsDNRTJkI0rRIbH4GtkYULWyLyVCjv/w=;
 b=zJgfRIjExAKNyh9Qeg/7iXqHCuCkZS8+nz5nHLf7WozMsechB+jywwTdVCmVZD0eOm
 zbVVlzGxXC3l4FQoL7eCz8BVcZ8Hn1bvJm2skD2r8AFnpYhudr2SRLnlotBOZMhT7z5+
 oNjtrA+MbbpQwIqm2DPUazrsUbru3lgtAVWCr5BnXG5n3HkH5GdY/Yh+BDgTViygKrrs
 HGTQZtpuiBvn+v3XdjMpAiU6nTHVBnrh2ss4sCuBr+EBhDhu8mFxDriV9CgIXdjPi2bl
 6r6Dv9E7Y4FdF1G7/sxxaMb2h38bkZQlTEji18PWSldCFxpwLWyUCQZ0YlE8MxdU0qo9
 LFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lsFI1omoaWaQsDNRTJkI0rRIbH4GtkYULWyLyVCjv/w=;
 b=DRvZwr7j67dcuXdBYuxr2TaNL4ZnWcIzF1IjohbLtZHrOJL4CTyL+Z0bW3X44oPgc/
 0hB/S3xWtusGAU75ZqcUXPlKpGlLVXkn/7uXvON0WBCmN077FdWxNZMdZxIw+NCVaH+S
 lCrK31wVa4u/K+NKeoIkm3oMyFC4k5ONULw3NdCoOOWZgjDCYJ3fcSpIrjPonyRKusEK
 9OPQWRaZANcXBoCITuiPYLeYdQ5sConEctQ01KMsdPQJqSHDZ4bj4b3ISH9jbzY9CRNP
 ahkJ2y5KFptXlJWICroCZw6HBwQduJkVs9P5/OdeTPC3Ugb8ZjWB2CwadWDBW/ZW0hzy
 LcFQ==
X-Gm-Message-State: AOAM530F/T9fw/nid1XMUb+9g3Y+WtJYfhnEjhYOHB8clKkUcwTlGkMP
 taFe6NxuaXGySfSng/iFfi8xWw==
X-Google-Smtp-Source: ABdhPJzzyGYtsdMExFtKLZ4c8i4MxRoFGcRLXnwsdHWJ/nE5dwGhL6xq3KJv7nmEpsnUnPutv2lhNQ==
X-Received: by 2002:a63:9:: with SMTP id 9mr11629018pga.136.1639657319018;
 Thu, 16 Dec 2021 04:21:59 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id q19sm5199104pgb.77.2021.12.16.04.21.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 04:21:58 -0800 (PST)
Subject: Re: [PULL 000/102] ppc queue
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211215165847.321042-1-clg@kaod.org>
 <2ef5a85e-8955-2028-026d-7cb3ad13d718@linaro.org>
 <2f7401a9-a466-2e5b-df8b-6544fc7b16ba@kaod.org>
 <56e6beae-1c4f-2723-6174-f239f1a38c94@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c794cd0d-fb49-467b-dc2b-01f2ea86a4c2@linaro.org>
Date: Thu, 16 Dec 2021 04:21:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <56e6beae-1c4f-2723-6174-f239f1a38c94@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.034,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Leonardo_Augusto_Guimar=c3=a3es_Garcia?= <lagarcia@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/21 11:02 PM, Cédric Le Goater wrote:
>>> Fails testing:
>>>
>>> /home/gitlab-runner/builds/yKcZqVC9/0/qemu-project/qemu/docs/specs/ppc-spapr-hcalls.rst:101:Block 
>>> quote ends without a blank line; unexpected unindent.
>>
>> I didn't see it under  :
>>
>>   https://gitlab.com/legoater/qemu/-/pipelines/429852244
>>
>> Is the job being run by default ?
> 
> It's certainly due to
> 
>    [PULL 017/102] docs: rSTify ppc-spapr-hcalls.txt
> 
> However, it does not reproduce on f34 and 21.10 systems using python-sphinx
> 3.4.3-2 and 3.5.4-2

Correct, it's a system running 18.04.5 LTS, python3-sphinx 1.6.7.

https://gitlab.com/qemu-project/qemu/-/jobs/1890700682

Is our s390x ci host really the only one left running 18.04?
That seems like a mistake...


r~

