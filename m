Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 978234AD807
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 12:58:39 +0100 (CET)
Received: from localhost ([::1]:37350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHP8o-0003oZ-NW
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 06:58:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHOX0-0008I3-Uh
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:19:37 -0500
Received: from [2607:f8b0:4864:20::102e] (port=53009
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHOWy-0006ze-Ck
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:19:34 -0500
Received: by mail-pj1-x102e.google.com with SMTP id v4so10006356pjh.2
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JTGLym6MfdSCtWCrUHDFQJ6BhW9VoTK/g1SAntjvTSA=;
 b=g1FlmXi8Z0fSjt+SiOxvugpf9vGqsOPzATFQJ+b2gyrlBIM31zNb2LxfIWu4usuoyW
 Fng/f29yrZjemLj7PUdQH3UUFpDfZqrjGIlvV4ZWk6/VNF6iC1s6V64Qf6HlrQPds6Ou
 n5y3MJbo7fa+M8AF102m9U2PUY0KGUzuoUoY+pez5z8sS9SXW1VU7MHmVQS/jp1+ljNp
 3xg+Qrv7PD0ZY24GZVNKIpn0aXIZBdsXOmaV4StioBNZkw6zgWaBAbT8CS6wwVUvi/5n
 lCxoXgT2PG8C4XY1uDw2ko0Jwnf4GCGdS87yMcFQO3uRcW/n5LValUDF3w9Ltoh7H4wt
 UI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JTGLym6MfdSCtWCrUHDFQJ6BhW9VoTK/g1SAntjvTSA=;
 b=Kqx/fYYGr62v9Z55iwSlQ4v0tAnJ5jM56uFJZfIeAJM+w9z/d9f+o5x4cR/OpbDwWW
 WEEli9U5X8XjXAKflU6DE9QOq5HZu/ojSnIpz9jHc6j6M6cf6zrHH+sCQN6WEtN7kwzp
 Dai9PoOn4RdgN0ZoC53nxUCENxWfaWTdLpSheHo9XKm9QE2ofYrOCHKkjhHyvK+ooIHu
 Adbk6uIrLa/vT/liMbDgOx4cmSbkapIKOy5OQcR4WFhovrse9YYrdLfbbfI5GD59QKRl
 04i2R7f15DWLK02TuFDHL+Z2G88AT4iB9DToLUtOh5lWJL5HGeam6I+dneFuGFAn7vlX
 qTNw==
X-Gm-Message-State: AOAM531hVm7zO+g355bnirLr0xL2/aOhz6404tNW/Cur4oNcXeoNxvFO
 riwaiINh9ZiFBHDINtq6+9Zzkg==
X-Google-Smtp-Source: ABdhPJzIpGNoJ9nPBNUjA9Xvf2fLh+U3K0GEpqEmAsADkmmLoTnXK9g8+J1nEqEnF0JiulqYlgo2xw==
X-Received: by 2002:a17:903:24e:: with SMTP id j14mr58699plh.10.1644319166838; 
 Tue, 08 Feb 2022 03:19:26 -0800 (PST)
Received: from [192.168.1.118] (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id mn7sm2349810pjb.8.2022.02.08.03.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 03:19:26 -0800 (PST)
Message-ID: <87706007-982b-eaaa-eca6-00dfd33a15d2@linaro.org>
Date: Tue, 8 Feb 2022 22:19:22 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/5] linux-user: Move sparc/host-signal.h to
 sparc64/host-signal.h
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220208071237.319844-1-richard.henderson@linaro.org>
 <20220208071237.319844-5-richard.henderson@linaro.org>
 <CAFEAcA-XH1yc-NbFQAgXo7BAtiVBgCACQ70EWf6CjndXaZVqBw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-XH1yc-NbFQAgXo7BAtiVBgCACQ70EWf6CjndXaZVqBw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: qemu-devel@nongnu.org, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/22 22:01, Peter Maydell wrote:
> On Tue, 8 Feb 2022 at 08:17, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We do not support sparc32 as a host, so there's no point in
>> sparc64 redirecting to sparc.
> 
> Where do we enforce that ? I couldn't see anything in
> configure or meson.build that forbids linux-user with
> a 32-bit sparc host, but I probably missed it.

The common-user/host/sparc directory is missing; meson will error out.


r~

