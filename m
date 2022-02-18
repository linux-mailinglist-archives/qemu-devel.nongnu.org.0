Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 495E84BC2D3
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Feb 2022 00:19:38 +0100 (CET)
Received: from localhost ([::1]:53294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nLCXI-0004n9-Rx
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 18:19:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nLCVa-00042w-Dt
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 18:17:50 -0500
Received: from [2607:f8b0:4864:20::429] (port=35753
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nLCUz-0003Fs-Sv
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 18:17:48 -0500
Received: by mail-pf1-x429.google.com with SMTP id l19so3526958pfu.2
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 15:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/1MV/cBkqKp9Y6QuM//D7wysmF/LMDW22u/28xsO8MQ=;
 b=NjAG+KVe0PoD2M2JdAn1YVOS4sYnNlzx2dOWzTV79DZTQbGYg93+87vJ63RT5p4b2O
 aZ8h6TkyagsWCD8hp5Faj2qww+C8czfbPiB5QdVaV8dBHwQmpSRrG9+akFz/sxSx1HKL
 J5LTr+10IZsNn9egw5a0MwKYbmenKdv1C/tO62ExYRMiwBNekkwQeXJfLXaAea9ZQcT5
 E50SMhGB9rbNhg2UzXEeyJx7pEP4HmH6lhmgHeTVfSxUr1Det7TNtEUDb4UxJGDleEJ3
 gTKbgyJQJ0UkV+fNmjrcTQPUQ0dpHqjKVc5XrhVJ6aUasRWLRByjt8z6gXhMZ/lSDmbV
 OWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/1MV/cBkqKp9Y6QuM//D7wysmF/LMDW22u/28xsO8MQ=;
 b=rrGrfQbd28lZ+Tq7e7ZPDW0EsnuXBl4XK4ch9xxrLgK+bhstkmxaxEl37BlyhMJ4tY
 WGBuLZEnsp3dI3Efg9Ki02jdj6s/e4K6RcMbbDwxVjGVVmZ4vuUrTF+q+oiDHIxVdS/w
 fR6GDAc57h6/PN30uUULtirulS0J62s8AebSWB+3veD++komDwi2cUW7RZUmdb+Kay0J
 21A6rzcZUrinVWRnFJ3IdrmUW6D033yoqCHrx6pLzycYTX155rKTRfP23acZJB4Om8tv
 3rnDEgRxyNjNh5uUKIMPuGTGyFp5eLBUdkDwOjy8vTzK64zKX1ezRPYqWuCXGR5ZkJqN
 4CKQ==
X-Gm-Message-State: AOAM531smEHqII7qywyAP9zAuMVc4xXpqb94K18Yazy35pDEztq/tLxl
 loQpjh/+SwLlzJq7HgJwGuKUag==
X-Google-Smtp-Source: ABdhPJweJ/EHNc99FnyKmCatc0uEM5Aniy7hZq0UoJger7SGnMaJLK+UuYGMCojb+/B0PYYty+DkAg==
X-Received: by 2002:a05:6a00:198e:b0:4e1:52be:877d with SMTP id
 d14-20020a056a00198e00b004e152be877dmr9975412pfl.78.1645226231762; 
 Fri, 18 Feb 2022 15:17:11 -0800 (PST)
Received: from [10.2.47.129] ([203.47.94.50])
 by smtp.gmail.com with ESMTPSA id j8sm4123755pfu.55.2022.02.18.15.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 15:17:11 -0800 (PST)
Message-ID: <07ec6bea-154c-7a9d-78ee-69f5b926e75e@linaro.org>
Date: Sat, 19 Feb 2022 10:17:03 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: 'make check-acceptance' failing on s390 tests?
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA9uVgPzkYHZk3jFNKj6d-rOh25gNFM_bKz=G7G+0B=1+A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9uVgPzkYHZk3jFNKj6d-rOh25gNFM_bKz=G7G+0B=1+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/22 02:04, Peter Maydell wrote:
> Hi; is anybody else seeing 'make check-acceptance' fail on some of
> the s390 tests?
> 
>   (009/183) tests/avocado/boot_linux.py:BootLinuxS390X.test_s390_ccw_virtio_tcg:
> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
> Timeout reached\nOriginal status: ERROR\n{'name':
> '009-tests/avocado/boot_linux.py:BootLinuxS390X.test_s390_ccw_virtio_tcg',
> 'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/clang/tests/results/j...
> (900.20 s)
> 
> 
>   (090/183) tests/avocado/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_fedora:
> FAIL: b'1280 800\n' != b'1024 768\n' (26.79 s)

FWIW, yes, I'm seeing those.


r~

