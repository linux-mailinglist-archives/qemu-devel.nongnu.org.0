Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E198C4B2F21
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 22:13:07 +0100 (CET)
Received: from localhost ([::1]:40734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIdE2-0003O0-3H
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 16:13:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIdB1-0000kp-Dz
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 16:09:59 -0500
Received: from [2607:f8b0:4864:20::102f] (port=53828
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIdAy-0001iB-8H
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 16:09:59 -0500
Received: by mail-pj1-x102f.google.com with SMTP id qe15so9141866pjb.3
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 13:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fFo+7znAgpAOvSbkgKf78CkysP09Agcce271x4EvgQI=;
 b=IF6g7z18lPI8YwUhBPtp1LZmGXtPNTO6Ya+sCbdvsulRf43YnNnxP+Vm+k6ngx0YeE
 l0s1UmNTKLCKx9ekPJDcZhHNlDlwTlec7+e/2x9cjbc5W2tRT9NMUpgCzrydwSrso7F0
 /1TlZmV1x2mMDoq178PmPxEdHfSUlo4LBm7iyO7PdFlq5JE6Tbqs1d3Se8uITlq/cazg
 0ejd0UK1VZV28O/eBSbwFJ4eC3/VNSImN8O1mAAbS4I0zBHsDNTvUIRlcGiufkTP7DSu
 n2hnB0tzbxTdhVTj4ftP1chb0HR+AokTCcJ/TK9+/2yYvJXPQyVy0iLOfKO9kW6FmwUC
 rh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fFo+7znAgpAOvSbkgKf78CkysP09Agcce271x4EvgQI=;
 b=vz+B9a1Ke4St8/eIKhmzz/uWUi83dasViSRqGj8FWIo529gWYCjPQuELht1PyCAX3u
 x6DCASUpXKE+kNDsyslLf5H6bcN7pw5pQfHHA+uI5blk1kKoZ7DLEFQfP20QvuXq234E
 8wwublSX4jvTV6l1mwb9AuS2+/AlRP6BpQ3yHLQu5Wp45PZO4/d0P0iVoAi2isDARUOr
 r/KTBSTH6jgP+1SfH076RMUEP35lEGfRHGia+umliT3F2z2AjBQ6JKh0KZlD5Cob77u/
 CLsCl300jlCQ8yDljxbaygaapNuXeSqi/M7IUYM+RKleABhbdA7IftzB4n5nR/FgThW0
 sL+A==
X-Gm-Message-State: AOAM530+l4WJ1ABENM3FNkChMs2YFgpAXdV/WoYOjDDzq3Jlpe7oAX5X
 aoDVtICPsO5/scAEtLoC6Zn5gQ==
X-Google-Smtp-Source: ABdhPJxjP1u+Kx7O8dbsykurpWz5KR2LnBZdfmhQWwlif/S4mvVqElOH6MGiJgp0ClNiZiOCtW68Nw==
X-Received: by 2002:a17:90a:359:: with SMTP id 25mr2239625pjf.93.1644613794766; 
 Fri, 11 Feb 2022 13:09:54 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id p17sm28429214pfh.59.2022.02.11.13.09.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 13:09:54 -0800 (PST)
Message-ID: <40511e37-d277-00d0-704c-401e6c7254d7@linaro.org>
Date: Sat, 12 Feb 2022 08:09:44 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 05/11] tests/docker: introduce debian-riscv64-test-cross
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220211160309.335014-1-alex.bennee@linaro.org>
 <20220211160309.335014-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220211160309.335014-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/22 03:03, Alex Bennée wrote:
> Cross building QEMU for riscv64 still involves messing about with sid
> and ports. However for building tests we can have a slimmer compiler
> only container which should be more stable.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/container-cross.yml                     |  7 +++++++
>   tests/docker/Makefile.include                        |  2 ++
>   .../dockerfiles/debian-riscv64-test-cross.docker     | 12 ++++++++++++
>   tests/tcg/configure.sh                               |  2 +-
>   4 files changed, 22 insertions(+), 1 deletion(-)
>   create mode 100644 tests/docker/dockerfiles/debian-riscv64-test-cross.docker

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

