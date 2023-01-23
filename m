Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5E3677708
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 10:06:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJsmO-0001rA-4M; Mon, 23 Jan 2023 04:06:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJsmM-0001pA-4o
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 04:06:14 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJsmK-0003vU-C1
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 04:06:13 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 e19-20020a05600c439300b003db1cac0c1fso8573276wmn.5
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 01:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hIjvQDBGwwQeJuOT9CrMS+HyRAjzK4pbkFrNNZr1/Lk=;
 b=M9yDVT8DU/AeAF9GI6W7VUD2f+ZFAvqGux0Siour8QWVCSsgElP2/gGMV969yEepWQ
 S9atQ8dgWOsstmHZWqKauALIs2fyhEg5UyeL4jBfDuhCjKbN8V16TVwTY0DmlSgxgB+3
 YBQqv2CNfLweISllJLA1AGxxSVlWIgneAHQFq/cBGbnFs7N6w3Nofoa8wz1bHAFICPGd
 J8BohYN25ElWRXyCzEjr7AK14Cumt7ZSHaIcxhbJRdOCvJCvre68jIxQA6hxxde92/Lb
 oqSZsDBGBvY5uVeGnhM2AWXaHSRobd0Wr9d3pPiIAwOtbR8Zo5A0V3WAhnF5DNRUe2sh
 BRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hIjvQDBGwwQeJuOT9CrMS+HyRAjzK4pbkFrNNZr1/Lk=;
 b=NE737fxr1DVPpsBK9+3rq54V6FD6/dp4N273SuxMOo9DvPNTG+4d68hF2mErGCHMuZ
 OIfWytwG2wmtxq1zKxu0HYN5xtb+2vFNzQEO/VXMjTliDg3uKS0O+RvRVwDhCp/ot90g
 JOrKpdfUcANhV8MsjQbTYbpRRvbo7nkm8Ayamo8J0v1YEJh573IhzyXLhiVDn/u5T3D+
 /BpmGMKuO96QF81R1c3vXf3e2cMTiubbeqshkAqbyND5y3bw0JeucZMRXiaAqKKha2Gf
 OluRzTHkUiUgHCxxAoq5KeS885egVcp/70geEQQ1HTfQbZzszsz5HlfxQvrUnA3xhqAI
 uByw==
X-Gm-Message-State: AFqh2krragaFfmPy17jV/MbnqMxKgg/PL85o8JHJz9y+PnN1VS1tZFVd
 LLWfziHSH7n6vUcNmue2j/lb7Q==
X-Google-Smtp-Source: AMrXdXu+nVvXVBNsstdccS+ESlhP6SnwAyJ17uVYrFRly6CeyVLLVY4feu/ZmEBWCto95plTEQq8kg==
X-Received: by 2002:a05:600c:4f86:b0:3db:66e:cfdd with SMTP id
 n6-20020a05600c4f8600b003db066ecfddmr21534011wmq.9.1674464770854; 
 Mon, 23 Jan 2023 01:06:10 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j8-20020a05600c1c0800b003d9862ec435sm10904586wms.20.2023.01.23.01.06.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 01:06:10 -0800 (PST)
Message-ID: <65cf6b01-a6d6-53ca-9ead-ebf50148cce7@linaro.org>
Date: Mon, 23 Jan 2023 10:06:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v5 7/9] target/avocado: Pass parameters to migration
 test on aarch64
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
References: <20230120184825.31626-1-farosas@suse.de>
 <20230120184825.31626-8-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230120184825.31626-8-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 20/1/23 19:48, Fabiano Rosas wrote:
> The migration tests are currently broken for an aarch64 host because
> the tests pass no 'machine' and 'cpu' options on the QEMU command
> line. Most other architectures define a default value in QEMU for
> these options, but arm does not.

There was some discussions around that in the past:
https://lore.kernel.org/qemu-devel/20190621153806.13489-1-wainersm@redhat.com/
https://lore.kernel.org/qemu-devel/CAFEAcA9NBu+L4wHfkLTv93wy90wjnV05EZ12PT6PmLjdZ5h_YA@mail.gmail.com/

> Add these options to the test class in case the test is being executed
> in an aarch64 host.

I'm not sure what we are aiming to test here.

Migration in general? If so, any random machine should work.
By hardcoding the 'virt' machine, at least this test is reproducible.

I'd rather fix that generically as "if a test requires a default
machine and the target doesn't provide any default, then SKIP the
test". Then adding machine-specific tests. Can be done on top, so

Acked-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tests/avocado/migration.py | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/tests/avocado/migration.py b/tests/avocado/migration.py
> index 4b25680c50..ffd3db0f35 100644
> --- a/tests/avocado/migration.py
> +++ b/tests/avocado/migration.py
> @@ -11,6 +11,8 @@
>   
>   
>   import tempfile
> +import os
> +
>   from avocado_qemu import QemuSystemTest
>   from avocado import skipUnless
>   
> @@ -26,6 +28,14 @@ class Migration(QemuSystemTest):
>   
>       timeout = 10
>   
> +    def setUp(self):
> +        super().setUp()
> +
> +        arch = os.uname()[4]
> +        if arch == 'aarch64':
> +            self.machine = 'virt'
> +            self.cpu = 'max'
> +
>       @staticmethod
>       def migration_finished(vm):
>           return vm.command('query-migrate')['status'] in ('completed', 'failed')


