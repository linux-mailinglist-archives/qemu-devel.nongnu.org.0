Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F646742F3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 20:37:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIaic-0004sX-8L; Thu, 19 Jan 2023 14:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIaiW-0004m7-L3
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:36:57 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIaiT-0003qs-A9
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:36:55 -0500
Received: by mail-ej1-x634.google.com with SMTP id kt14so8467818ejc.3
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 11:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lzgB0mP3CcgbFyQiMNfLkiHTxW49PnzWUQWjVUT6cM0=;
 b=PHb2SN9h2iYzJf9zXWQogZQFNZWnU5f3mMP01qnks1mIy5TqHJ6FSKnrQ9mzF4j2O8
 vUyoHFHJBuDqnR6XiTRDixBi4W+s5SIr+2/M6ArI4eN35r6YMxrEZ6wyXJhJmeCR4r9W
 +NjsSiEJ9D4KIZorwTBI26sv1rEH4AKnjrzKSJjFM6LLPmKGb6ZbRdXvNBtD2yU2BBbH
 6xSc0Nhv97TuJ9XNeY2Pp67Q4zKV+muvKoiWaIL6Jih9wSJ8w6w+1eJVHgWtBNqQwuLO
 5u/m6buDAaZm0F4d2L2FyX8QR/lpPiJXRzv4mR8qJh44PTcLtOnaVvt6CMD2dHA/qhAp
 MnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lzgB0mP3CcgbFyQiMNfLkiHTxW49PnzWUQWjVUT6cM0=;
 b=wAFvapOXhmTTAwiAcu0os0IHTFKF6Xx+Ma3YW6lt7AJmhAHsNlWfUxbbjVeB4i+ZI2
 DhKLFzdgegg6cfWz59bfKCrI1Z3wRRlMRQpd+7kSSmxd6fNSOKbB9Z6iOF9NZverJh8K
 sPl18yhOpjL2vHDtdMr3e0IGVGkD+dkvvbNWi6NsCvZ4CDNszdAmxFHvGG655lM/+g1F
 u2h1G4ql3uCIAVm6UBt7HqJhGXl2TcUupoF5gWYYbR6cvecWHDy6DGCqD9Me/ZNwhZbC
 z2hWNcryu9OPFHxLX5JL5jMqi0RCnHPjum5D0E/0NFvZ4Npmcebwp9kmzsjP8DwpG+BL
 FqSQ==
X-Gm-Message-State: AFqh2krETcdszgjC+zR5D/fsCFnP2y8XfWHx4eLgJUOoxxVs9UpI2feo
 8h73o1bCS2CCSyHhGnbPoaBbOQ==
X-Google-Smtp-Source: AMrXdXtK8/t4J8mA7AH2xeVM65zmYbOcnjDcP5mJrOZmvicClKE0hAwccqbxcrpHzH9gKMiXESoSOw==
X-Received: by 2002:a17:907:c99c:b0:7c0:d6ba:c934 with SMTP id
 uj28-20020a170907c99c00b007c0d6bac934mr7135108ejc.13.1674157011705; 
 Thu, 19 Jan 2023 11:36:51 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 kw16-20020a170907771000b0084d43e23436sm14835007ejc.38.2023.01.19.11.36.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 11:36:51 -0800 (PST)
Message-ID: <91d9a6b9-a59e-4b04-6369-d2e64c353184@linaro.org>
Date: Thu, 19 Jan 2023 20:36:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 14/18] tests/docker: drop debian-tricore-cross's partial
 status
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Bandan Das <bsd@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cleber Rosa <crosa@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20230119180419.30304-1-alex.bennee@linaro.org>
 <20230119180419.30304-15-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119180419.30304-15-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 19/1/23 19:04, Alex Bennée wrote:
> This image is perfectly capable of building QEMU, and indeed we do
> that on gitlab. Drop the DOCKER_PARTIAL_IMAGES setting so we can also
> test the gitlab build locally.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/Makefile.include | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


