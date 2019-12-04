Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8142A112CCC
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Dec 2019 14:41:11 +0100 (CET)
Received: from localhost ([::1]:39008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icUty-00053l-IA
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 08:41:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33729)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1icUs7-0004Fh-Tr
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 08:39:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1icUs6-0006S3-I3
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 08:39:15 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:38275)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1icUs6-0006Ra-8F
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 08:39:14 -0500
Received: by mail-pf1-x441.google.com with SMTP id x185so3672479pfc.5
 for <qemu-devel@nongnu.org>; Wed, 04 Dec 2019 05:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HfyHcT8LnXJmzN8lIjJLDzVoxV4uO/d2y1MsfPUV3/M=;
 b=nOQSfPY/7rHVd9Xy3V9auvJpVEcYdd3bIQBMtMKWK1nYJivdYWfTqsWgFXKt5Bv1Nj
 DWXkWAoclZlsXpL8J0RZBnIBuDJrQ9LLWTkLCSQUm1rtydmDAPghAy7tqW7vI5/Z6w7L
 4cML/Y0KXgbZKos1Ygo+sGHOFMrU7OM0jUJS02a3KT6MeBK6rCii5JZt2KdzDGeaZtt4
 W0LXhRWkigoPoMthOWZsHYDOX3j3Df27wEbjHQEa/rHJ8fdppD8V9N/+rUMuUdk/bmkL
 Hd5KqhJlxDLvjJi0QjuSbZNdmCFfM8ScucE0Sxsz6QCexZ5LaiUoYn+czvAu+YUEt6J8
 XKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HfyHcT8LnXJmzN8lIjJLDzVoxV4uO/d2y1MsfPUV3/M=;
 b=XR+A7Cogxx0t2WwbQQUyIVDvAJLKFpylfFvJJbRfPriw0qPygdc65zuch3CYC+SeUi
 /VeYdIiKpso/6iyuKUUy7cYH3VRTtumHnSvoqI1JEFpKm6JtjQATugVLXD+UC5Zad4jT
 SxXknQCyROkPTv4Lno+pZrZVXgzlo2cs4dhIJz5REyRd0lzW6+2tafSK8aXQPcaBl7f7
 jlXtU5zEd8//db3W/ysnjkZ8kwfWcxqTjtPgo2yWnrxZZovxkaYZykxcG0wex4D1wf08
 cou+f4N/fgglleoM5JP3FPYDQJ5VhcQPv4kGMfskX1DP/5uzM0uBev/Mg5IwWM9Y87Hq
 v/wg==
X-Gm-Message-State: APjAAAXs4Z2kuTjDNTe5SqvbTAs+cBdtVlpYjVUNrK7hc1B0WZ3pQsC/
 VlntfW6wLtaKNqbNfYOp9B88bg==
X-Google-Smtp-Source: APXvYqyGbcjccoGamnJdYTaQfHYVHCDONZqiAoz0WT+bF+tOL9SFjYYzqO9xA15KmtlVFYJvkci1lw==
X-Received: by 2002:a65:530d:: with SMTP id m13mr3513853pgq.172.1575466752574; 
 Wed, 04 Dec 2019 05:39:12 -0800 (PST)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d6sm6272141pju.8.2019.12.04.05.39.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2019 05:39:11 -0800 (PST)
Subject: Re: [PATCH v3] travis.yml: Run tcg tests with tci
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <87lfrtbtj6.fsf@linaro.org>
 <20191204083133.6198-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c727fe15-2448-22c5-2b0a-0ceb7bee2586@linaro.org>
Date: Wed, 4 Dec 2019 05:39:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191204083133.6198-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/19 12:31 AM, Thomas Huth wrote:
> -    # We manually include builds which we disable "make check" for
> +    # Check the TCG interpreter (TCI)
>      - env:
> -        - CONFIG="--enable-debug --enable-tcg-interpreter"
> -        - TEST_CMD=""
> +        - CONFIG="--enable-debug --enable-tcg-interpreter --disable-kvm

While we're changing things, the interpreter will go much faster with
optimization enabled.  We can change this to --enable-debug-tcg, which leaves
the asserts enabled, but compiles with -O2.


r~

