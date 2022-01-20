Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC149494D60
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 12:50:19 +0100 (CET)
Received: from localhost ([::1]:54240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAVxK-00089z-L2
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 06:50:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVIh-000673-Ak; Thu, 20 Jan 2022 06:08:19 -0500
Received: from [2a00:1450:4864:20::32c] (port=54038
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAVIf-0002Ig-Rx; Thu, 20 Jan 2022 06:08:19 -0500
Received: by mail-wm1-x32c.google.com with SMTP id n8so11245799wmk.3;
 Thu, 20 Jan 2022 03:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=M7rwRvbtP1Oljz6jO2iIiZfgNP9tUgxX3/gn6vH1pvc=;
 b=LXBakB1PXx6Cx+keb87v8ODagQLqYV6pWfl7ZOWY6awSnCooilH/rwVaStmWgRrovV
 bDNRB2ZhfWfemqVEPq/eyOde8iKU6SJi1FLmFp/xc0Ew+p+plHbi3Ep6mjeqOEBaFCrL
 bWWsKpoZjBmAtJZYEHkhpGwcBZptLjC7UQUSEo2lQ0knQZKmlG1itdteBSVtv0B2XQrg
 61OSGA/UHXRodip9JTjwz1M0ESh6vEYG5SO2ucxEX0sYmawoMm2V+GH4yv8P4FDUj8ez
 ++uWDku9BpvbU/6DfUhAYEng4RPjXGPiN4W2aZXdL16tvXNw+bReuSSaPATt9yJCAqqk
 jU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=M7rwRvbtP1Oljz6jO2iIiZfgNP9tUgxX3/gn6vH1pvc=;
 b=2wrV/0vGhTkASLU2mIP0ZtzRocGjBmTXbwNtYc046fA1wEufaPmih2fKIbyTQn8Qbv
 F56KBpDU0sDHE62LsQ3BSeTcxHtGWF6qWCn1QXARY/DSAakDu+1aR67xiDZ5OsXyHdq6
 uq3d3eTwO4jgNb19eajNRKUrCboUcfeQi60f5Jl5SpFik3REWH9zmSXOgAt6cv7ljYg4
 Z89VdudeGcz5XY8FGgUWcpk4WwjltSwSTtV1U713CVfZp0CUrY9FoR7U9fEdHyklib3g
 R+47kGgVjrEjU89jgctrZQY66vbe2CFspKwmmc6AaUUt2ujkBa2UfyTGZQlnYeBZscbs
 MVxQ==
X-Gm-Message-State: AOAM530CsxRvlLctirRyzigw/L6xC7IIaweYl9ra9nctnNQQSK6VmmUd
 BmtWWXUzEKsi5lu1sPT8MdXocL0jcr0=
X-Google-Smtp-Source: ABdhPJyl4xTAbruwoBkEM2bvTzFYE+V+mGh863/VY8GkIRoVq/jm9Y+kCf8tVERjFCeqsM1EvwY5FA==
X-Received: by 2002:a05:600c:1d11:: with SMTP id
 l17mr8484959wms.134.1642676893174; 
 Thu, 20 Jan 2022 03:08:13 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id w5sm2838673wrl.36.2022.01.20.03.08.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 03:08:12 -0800 (PST)
Message-ID: <ee20a0f8-c066-9cfd-e557-f402fb0860e3@amsat.org>
Date: Thu, 20 Jan 2022 12:08:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 6/6] tests: Manually remove libxml2 on MSYS2 targets
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>
References: <20220120110545.263404-1-f4bug@amsat.org>
 <20220120110545.263404-7-f4bug@amsat.org>
In-Reply-To: <20220120110545.263404-7-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Oops, 's/targets/runners/' in Subject...

On 1/20/22 12:05, Philippe Mathieu-Daudé wrote:
> lcitool doesn't support MSYS2 targets, so manually remove
> this now unnecessary library.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  .cirrus.yml              | 1 -
>  .gitlab-ci.d/windows.yml | 2 --
>  2 files changed, 3 deletions(-)

