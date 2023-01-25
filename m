Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B3867C0CD
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 00:27:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKpAF-0001A7-04; Wed, 25 Jan 2023 18:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKpAC-00019c-QS
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 18:26:44 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKpAB-0001kO-2p
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 18:26:44 -0500
Received: by mail-wr1-x42d.google.com with SMTP id b7so160114wrt.3
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 15:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+qrguMF6QXafswABzj884yXejZ5kskF2eITDeOGbs6U=;
 b=Cdzt/UkO9981x0FFhxb83G/bnn8Eo8xYye+NAHsUm2aANXo5nlrnd4aaTnGwCu9wlE
 Z5VASCPnrrm2GKM1Y9Z5AKKULeRPK/sS9/mlTSLdKiQ45UtAaKRXnyDBIL48hq+3FkBV
 R1xuaUf6QeVbdBNGuRrIE9JfgtQvYdCduO1hAWVLpdg0gu+xXLn/Hjx901+d46fHFqeA
 93Zw0ZlcsUYdpaAUJpgCY0GaHiU/dFLLSx3UFJ3eios5PNMCO4NoQqvBcENYZXUovziV
 JoPGfEvaJl4SGRGnppzleI1/cXY8oeRVULeq5dZ/vmIf5HYSI/2tMPzj6xmw9yI2s4TF
 MIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+qrguMF6QXafswABzj884yXejZ5kskF2eITDeOGbs6U=;
 b=2T+YI+arEMFZMzPVGjKK0sX7EZZPIdhmJ7Q8xgtypZepYb5KlN+zjDQx3ibvrSn8RK
 kGk7c1zFiOgihJ1ovfXxwBYpUmCKE8buZdfgXD4NB0Blp76nFhlZg5sYXsYDi4r58PMp
 n5DdSx41Y9FA0GW0bu9al7sooobV6oEKVtKFHN1cel4BXSR2wCXdw96F8lWp7cbU/4Ql
 KFIIVPJWa5gsMCTsxwHZATa2htyIqSM+EoZhFMXFxuVPLrkW7/ZlgyHV7ib2yUQlsL0J
 28hYbtjLjrEvEfmnY3klpqfRu+hjDec1tj9P5b8uJgi/AnjTedB4l278M+zENVdGr8dU
 b3uQ==
X-Gm-Message-State: AO0yUKW/B2U1Gpc8xiQV/e0UoyBo9TLhSIYq6Z2GG6bD91DOwXqSeh35
 Wb7bhaRdELH+HY44DReiyEtfkA==
X-Google-Smtp-Source: AK7set/Tnhc+4VZvKF/TmkJFvhGlQTKs23v8WXEN4+rgC5wMUcsw1Q5cpppdo5PkWYiFQJm0WJ8RRg==
X-Received: by 2002:a05:6000:1005:b0:2bf:ae2f:5776 with SMTP id
 a5-20020a056000100500b002bfae2f5776mr7135903wrx.12.1674689201442; 
 Wed, 25 Jan 2023 15:26:41 -0800 (PST)
Received: from [192.168.0.114] ([196.77.22.181])
 by smtp.gmail.com with ESMTPSA id
 j26-20020a5d453a000000b002bdf3809f59sm5583858wra.38.2023.01.25.15.26.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 15:26:40 -0800 (PST)
Message-ID: <23fa0054-ba69-e1df-41c9-15c7b3e13b74@linaro.org>
Date: Thu, 26 Jan 2023 00:26:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 35/35] plugins: Iterate on cb_lists in
 qemu_plugin_user_exit
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Li-Wen Hsu
 <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
 <20230124180127.1881110-36-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230124180127.1881110-36-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 24/1/23 19:01, Alex Bennée wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Rather than iterate over all plugins for all events,
> iterate over plugins that have registered a given event.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20230117035701.168514-4-richard.henderson@linaro.org>

(Missing Alex's S-o-b)

> ---
>   plugins/core.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



