Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E0C674316
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 20:49:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIauU-000142-JF; Thu, 19 Jan 2023 14:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIauS-00013h-4a
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:49:16 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIauQ-0006nF-DX
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:49:15 -0500
Received: by mail-ej1-x62f.google.com with SMTP id bk15so8482962ejb.9
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 11:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uDQnUo+GAsNpaWlrHycGOWoaB4j3psxCMiiaytQPb48=;
 b=xzDwvfSX+SlSwCQUIWTaVaZs4DDka8kMEfryqfxKaKJJyfduK78Q85A06IvBBMqyAQ
 u4XuMBITWvZelDUJDJ7pkEibmSZG/sqJO4TjeSjd4gMYUNoWYCvd22ykTmZIheNBqLzC
 gByUoCQNefKHTLHwlINFM0cUG0Hwkqh7vqE/XL3FOFx7s8KKsiva5q3qUAyX3dWvhL8k
 rv0KGzzBQITeCoJZ9mDuAiKwoaa9AnXYhdZRsnTt0ysX0xfHXSXdpv9zAuJwhSObwUj0
 LqeA+2Ol1eyjJwLX7CWRPNNzjQ2rcGVnmrFl0QsKBHCTkTs6iqHUOiekgm4Nzlb+WZD/
 NiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uDQnUo+GAsNpaWlrHycGOWoaB4j3psxCMiiaytQPb48=;
 b=e6IUCf8S5+wv2Hmk7m4sPj9E3CIc9KFP79uo4QUYnGkUbXLe8vj7Loq16fZymvBLoe
 km7cHbrabMBXPsH3xFyuzx+wc0Hulo3XtjpwbBBwGrN8DZuf8UiMDnV0alkSy2AO7KiN
 pyvbjNkqp+5cMA+ZcntZGBectBodZ4IkFzybVJ5kss7IRgum7Rst9nZJ70URdTtl9MLJ
 pBL0KLq+Su1eJ/HHP5IRtJ2+j2xTPzYjbKZZ90sdfkuuozEEUK28N58GTo9ZJmMgujuK
 mT0YFBthOwNznlg2RzzQQZeDmiWfO1HPMD6sfaW9LDWTRvNGRBMLCnSN36H93Km1/7TI
 xACw==
X-Gm-Message-State: AFqh2krVFQ+X2m2dFtBMwjdLjygVZx7x3VpkLBCYPbanCGW5jWog1/ni
 1VtYF1QKTgVRw41PYRKYk/v7Iw==
X-Google-Smtp-Source: AMrXdXvTQH5y56Swf2ZEtudzm8kJ+cVTVgQcpMqt0r6DHqdF3WJXEG5o+Sk6tI3DwBCDZCxSZHE6Uw==
X-Received: by 2002:a17:906:8d08:b0:86f:e30c:72c1 with SMTP id
 rv8-20020a1709068d0800b0086fe30c72c1mr14030191ejc.8.1674157752831; 
 Thu, 19 Jan 2023 11:49:12 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a0564021f0200b0048c85c5ad30sm16002713edb.83.2023.01.19.11.49.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 11:49:12 -0800 (PST)
Message-ID: <54802c99-05fb-9362-6a75-1509d77621af@linaro.org>
Date: Thu, 19 Jan 2023 20:49:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v4 12/15] tests/tcg: Do not build/run TCG tests if TCG
 is disabled
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-13-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119135424.5417-13-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
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

On 19/1/23 14:54, Fabiano Rosas wrote:
> The tests under tests/tcg depend on the TCG accelerator. Do not build
> them if --disable-tcg was given in the configure line.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   configure | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


