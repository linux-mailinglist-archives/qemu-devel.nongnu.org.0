Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A49DC6742E2
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 20:33:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIael-0001Yu-A9; Thu, 19 Jan 2023 14:33:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIaeT-0001V1-4U
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:32:55 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIaeR-0002bj-Kz
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:32:44 -0500
Received: by mail-ej1-x62c.google.com with SMTP id mg12so8421605ejc.5
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 11:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xkoedVGutWiz7y4sNCquQftWaDZePlvOv2dn1IDilb8=;
 b=r6vY0ScD37BTHRnsSTUiX1VNsw+wkfq+KNqeGIeTTLwvfyoox4qU4Q7/uFWv2owLbf
 ZUEARJFh1lrW38rHwymWnf6bpxYv5tmte7NGkdx1EQF3rp8KsVH3VwKiQLF7K2hDmofa
 8UvuRCtlf6qDmIv3jdWmFHMVgCgiW305PF6ucz6Qv/gUUpzAoch3F1GDR5Dp4vjAeoFV
 mJDLF0I/hIRWkifNMqjaNXmC9opooxMzlBm6VTjAXQWdbjPXrdxj1Je5dsvqIQ+Lcp7R
 /g5/4fNkojBzuFU4kHbutSfY4v6BtyNR1mQ0Ox19WYEZVO30u8fMfQiwGORUKh4pVQFM
 OaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xkoedVGutWiz7y4sNCquQftWaDZePlvOv2dn1IDilb8=;
 b=p7c0o5TacpQ1saOLcO5uZfcHdqyljI6Cmpo73uiOnTGMPxTstB38XtzIkd+nE2qPbl
 1B092vX7ePUpKeJ+CouDUIJ7n1l4THOO8Ddgmh5vmVThErBlwXKcd8hZRUvYJeQCtfKf
 yNmvdOKTc4ouWJgpl9QdqnLGaH8/ilN9d0MIlxpj/e5LjMeZEIBy4tI6EQzlhMhsfzhe
 +KVte1mnwLmZJDK+/XMAioHb+vDI2S3lvL7ZDrmAvmDJ/D5uLc5KSFw5oWlTK0Vc8kyc
 6oaZCFEhNQHTDx9rRHLXtwULlMXdX15MBKqZdQuMIX8+CyfWZZVNcR6YPiDF3qNCPxaU
 nwXw==
X-Gm-Message-State: AFqh2kq3hYfhSXjsbKUbkeObMHLUssLvFbgJLAsytaFcJu/KZvW1FmjD
 85Pzu/Ah3xjXnKaXescAnsRGlg==
X-Google-Smtp-Source: AMrXdXv9Ff+ROgvqtwLiPdfqEVxUJ9U+ZbcVzNsZcuY9x8Fmz3l7FywQlg0P9rEN++LqZpCpZr9lbg==
X-Received: by 2002:a17:907:a07b:b0:7c1:3f04:efa2 with SMTP id
 ia27-20020a170907a07b00b007c13f04efa2mr25537635ejc.29.1674156761900; 
 Thu, 19 Jan 2023 11:32:41 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a170906538b00b007c16e083b01sm16759504ejo.9.2023.01.19.11.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 11:32:41 -0800 (PST)
Message-ID: <1e56aed9-68dd-0436-f639-2fd89b41fea8@linaro.org>
Date: Thu, 19 Jan 2023 20:32:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 06/18] .gitlab-ci.d/windows: do not disable opengl
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
 <20230119180419.30304-7-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119180419.30304-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
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
> The previous patch should fix shader compilation.

s/should fix/fixed/

> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20230110132700.833690-3-marcandre.lureau@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/windows.yml | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


