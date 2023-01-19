Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFE86742EC
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 20:36:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIahO-0003MH-N9; Thu, 19 Jan 2023 14:35:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIahI-0003Lo-VB
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:35:41 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIahH-0003Vw-Et
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:35:40 -0500
Received: by mail-ed1-x532.google.com with SMTP id y19so4230219edc.2
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 11:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xiLSSqwfbKLxQNOvM3MkgA4xxeDTl/qkTGYp+jPRAJk=;
 b=T2ymIbrc+YJhnnc9xzZ2+vH9t7iFGt3CXssRTM1aBMIqZK7U+fOOFTotlfGo7ysIOH
 ouCMCl0WE9fXY2iHhHlD9Z8nq+y8aV25AP7KMTjzzrrx7GH9vRSjK6DQwchXnEgwBa2K
 3/buwJb9VCF3jQlamQLA6Ez5nWY5a5LKQoWVBkryGQ4R95c7U9JKUrln7iqyxxgDHpAs
 GLZWMW+MaLe6iCgfRwxoesRSh1KmkmJT3uvTJLGSzUYBqeijdWM9N/x/smDcnIau2GfC
 GIi04qOLhSLq6KvXCPf1TigAeUI0oaEIaTggSIH7gLe/XhEVdHIvbiRR3Yf0/OqZuALU
 bTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xiLSSqwfbKLxQNOvM3MkgA4xxeDTl/qkTGYp+jPRAJk=;
 b=0JRikMTvR8gUNujfTCPA4dPGOxPZaJFn1Wg0q4K2NVe/tYj1nyw0IQvDmjssW7smBD
 /jlF0WZzLxJwPRX5NQwMbUqUfCdJD6mH2DxnULqFCPG61jdDoc6dQ0qKx4HYivVUpQuh
 ggMVenzBsm3FJvjtdnsO6L418nrZcIzJZZDe0ALCXa/s852u1xpmDZIPoq8DWTXKENMo
 NLwIuys/nDfqCOGB5tfJnQ5UP/OElAFuB79qIu3/arCaYr5Nbu/Rv2e7d1rHQQKjwRNO
 np22X6BpdmZ4uWuewuegQMLWTvrMhsv9tt1WaLdpIFJ5pE/1tIb6+DvKmdIzx+IKxb75
 +WxQ==
X-Gm-Message-State: AFqh2kpXr2XnEPBWBSDzk2eUXixrIkoMRwZL4Rsud/qL3AGvi1DS/wN4
 Y+U4DXzq4JdQ8phXBH8G6/UEmA==
X-Google-Smtp-Source: AMrXdXvn1667eIQAwr4X3VU8+oWNp31axgIjw5IJumTxwJYIyIeJjQ7qH6FkKPYT1XGvrJ4bjH1jbQ==
X-Received: by 2002:aa7:cc81:0:b0:47e:eaae:9a5b with SMTP id
 p1-20020aa7cc81000000b0047eeaae9a5bmr11921143edt.42.1674156936897; 
 Thu, 19 Jan 2023 11:35:36 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 fi18-20020a056402551200b00487b73912c2sm15918968edb.12.2023.01.19.11.35.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 11:35:36 -0800 (PST)
Message-ID: <e0203997-0161-8abc-de76-ebd88f117545@linaro.org>
Date: Thu, 19 Jan 2023 20:35:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 10/18] Update lcitool and fedora to 37
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
 <20230119180419.30304-11-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119180419.30304-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
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
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Fedora 35 is EOL.
> 
> Update to upstream lcitool, that dropped f35 and added f37.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20230110132700.833690-7-marcandre.lureau@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/dockerfiles/fedora-win32-cross.docker | 4 ++--
>   tests/docker/dockerfiles/fedora-win64-cross.docker | 4 ++--
>   tests/docker/dockerfiles/fedora.docker             | 4 ++--
>   tests/lcitool/libvirt-ci                           | 2 +-
>   tests/lcitool/refresh                              | 6 +++---
>   5 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


