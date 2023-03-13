Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3316B71C2
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 09:56:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbdyO-0007wF-8s; Mon, 13 Mar 2023 04:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbdyG-0007tC-UZ
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:55:57 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbdyE-00067n-GK
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:55:56 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so7297749wmq.1
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 01:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678697751;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LsVEQcED9WXT/Ve5daaXDWObqeHky7fpXTG5TLSN56A=;
 b=XLh5FzSsh8E2RPnrzMH7silIhoIZJjsceR15KYrTL93w1Hi1VpDZ+AebsgQT44/6rA
 k+wP5tYtPDs2S0Kqpc1GzbtYsmnvd0BbNRLdBiX1okxI7BB5LIfyYXIT2W5kOElRCOQ7
 wo+zYYlfS5G+B16MVg4pz2IMw5jiZOLizpMBN9IjrwhlXnpA/WKQhS6k9/McT3CDnNl/
 oeQeg6jT5SfBHxwwZqm3+RDGWjr5XaXhCgNDhG+8ALMGa/0y4Lh3Dpo+gHnChwooqH6+
 kiWPKboxKmnu/hqcit2ZRwQ8iZ9WNNrf62B+tpvlocpb+yUQRrvKf+LcyoW63pfDqLJq
 gP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678697751;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LsVEQcED9WXT/Ve5daaXDWObqeHky7fpXTG5TLSN56A=;
 b=2w/jV6wpe4nPcf9ddctlkcvyxdd54XNCIHt+UmC1grdWjkWRao5+DjA9tUpUy5sQuB
 sweyOWkvs09s7MuhNbAMd1c+czQyRLYVE9zSRuMMwADrQPzxNxmyQPxWDwAuFjPDis80
 EIR/2flfwcisVjIzqBfrJkinapsUfs23N07/r30YWHJfoaGWmSu81YJXSLe6fFqFuOYS
 D9wR91d3k/j8kP8V63b613gGJd1jkBX+5aqql9g8prku3FYr4lE3SPkABEHhNZXPUfx5
 IjYzbj0k8W2RbNJV/gXlisdFGP9ggmJU4QsXeakoVphp4aUgP/4qbnugdHfNWpklT1wl
 NEUw==
X-Gm-Message-State: AO0yUKVFZFuUjJKPXJOdR639Sbhe/l/rcE1ot7BPdFkLFoN1f+Kmc3RT
 xn1a43g+hMSxfR3N4262PJcsDA==
X-Google-Smtp-Source: AK7set8hF8PJ0U70TCssvNqC+Oc72XPj+oi5UzXNsUmriEUdbleXTksapII8TKlCRoFNlP+HaL00kw==
X-Received: by 2002:a05:600c:a0a:b0:3df:eecc:de2b with SMTP id
 z10-20020a05600c0a0a00b003dfeeccde2bmr9710440wmp.11.1678697750861; 
 Mon, 13 Mar 2023 01:55:50 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c3b9300b003e1fee8baacsm867675wms.25.2023.03.13.01.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 01:55:50 -0700 (PDT)
Message-ID: <21b20a8a-090e-8196-720e-48469553ff53@linaro.org>
Date: Mon, 13 Mar 2023 09:55:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v8 09/11] tests/avocado: Pass parameters to migration test
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-10-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230309201434.10831-10-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/3/23 21:14, Fabiano Rosas wrote:
> The migration tests are currently broken for an aarch64 host because
> the tests pass no 'machine' and 'cpu' options on the QEMU command
> line.
> 
> Add a separate class to each architecture so that we can specify
> 'machine' and 'cpu' options instead of relying on defaults.
> 
> Add a skip decorator to keep the current behavior of only running
> migration tests when the qemu target matches the host architecture.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/avocado/migration.py | 83 +++++++++++++++++++++++++++++++++++---
>   1 file changed, 78 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


