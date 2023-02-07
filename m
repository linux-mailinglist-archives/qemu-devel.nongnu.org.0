Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED64268DC19
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 15:51:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPPIq-0003TG-Np; Tue, 07 Feb 2023 09:50:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPPIo-0003PW-D4
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:50:34 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPPIh-0003uN-TY
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 09:50:34 -0500
Received: by mail-wr1-x42f.google.com with SMTP id g6so5823178wrv.1
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 06:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/Gi6wIoAlUy+tailwC9qAgeHmJkMddpSItEmR85I/d4=;
 b=dc7cscTFqPAOgAc44s3AU5MYkL93tN6gBU6ujWkXWwXT9nslrKzHokh5wvywOLu6W1
 QwBHV/SGwiepGxkWnVzXzAZp/ssPlCORjjB35NNEylVe35+bL35624eGsCpB3l3UsyC3
 UIeCz/0cNHpCpqpKvS17SUy5FffQSn2OPm9i1BcKqhokaJHp0vxsFTmqFmiO4UuSwFu/
 eXWJui9zBg9YfRFqRKMF3XLevxCVtG4JwHHQlUC29NdJWdI6RDk0B6q5/XsIZQhTfLd8
 yFp5YpeotJtNXRVOsWI+TAJZikDYpKX7wyRapBSfWq4SFGOr5nR4R+6zORR9hV5PdeQP
 sz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Gi6wIoAlUy+tailwC9qAgeHmJkMddpSItEmR85I/d4=;
 b=4zCdjAKxdkIcIdim4CDrJg4J/h9c+Mhu//TbJxj/rwIYym90ljWrhBUq/8lHq1gFyZ
 O4WURtYvksN9X7i2XSLkXMy6mLHmTLpL2SqizEIsMTEjKNBQsx9+tnlDyFHVKJhskUBS
 vzBTG2kPepmXqusbII32VetFcuUvpSWD4bDmh6dLpTxnhCDMY5nzBJaHpDoDSdtvNEth
 LXeVSRtWup7NlekbfHBgl0K8U9OwziYNiAbnaEZXFXZ1jFsV1qz9YL2xQ9PuvlkAq9Sh
 gRrvnASNpv6ufyparekabWiy3XA1XfRAAjSHISlUkANuEAnPiw/xGNSiUxPF193JPh+o
 7pXA==
X-Gm-Message-State: AO0yUKVBiJayTTHPj7fpjPulp4+yBVdgW2XJnmvjYOaLnJKmol7cN8Bj
 CEHABTsHcloxbazhg7SW6ZFUwQ==
X-Google-Smtp-Source: AK7set8eQ5mNlQQcAqTBOB9Wm46pieEJScOO4dyaNa+QssY62vBHP7WDF9prNP4RCXUCRC6EQ5e6rA==
X-Received: by 2002:a5d:6e8a:0:b0:2bf:e39d:c8a7 with SMTP id
 k10-20020a5d6e8a000000b002bfe39dc8a7mr3492763wrz.44.1675781426308; 
 Tue, 07 Feb 2023 06:50:26 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r15-20020a5d694f000000b002c3e1e6eda0sm7954995wrw.99.2023.02.07.06.50.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 06:50:25 -0800 (PST)
Message-ID: <9153b2a8-a696-0486-feec-eab7545f693e@linaro.org>
Date: Tue, 7 Feb 2023 15:50:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 09/10] libqtest: make qtest_qmp_add_client work on win32
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-10-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230207142535.1153722-10-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 7/2/23 15:25, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Duplicate a socket to QEMU, and add it via 'getfd' on win32.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Acked-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qtest/libqtest.h |  2 --
>   tests/qtest/libqtest.c | 16 ++++++++++++++--
>   2 files changed, 14 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


