Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D556343CEA3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:21:51 +0200 (CEST)
Received: from localhost ([::1]:48918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mflgU-0007Ef-3d
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfl2e-0005d0-Nf
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:40:41 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:43775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfl2Q-0006gF-Sg
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:40:33 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so2718910wmz.2
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 08:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f9C/3tsGCTrM6yXYfkHijkPRSM8Ff3aL5GP21FCZg7g=;
 b=cD9CMUtxBgocNAIr7o6Dm7EuZiyf25efShdKVhp3Q8y/zsxLSsSa9IGmCFBy7YYNGv
 kw6sZj8hM0bpQX1em+zeaf37HRiFjUHXvz2dZ05O24yJFDkCdbhx4OTUYdmvGVCgNLmi
 PEn25Xo8evq+bgEZEIZsX7P/YCjNU0XMw5RvEllNKQHUIe/YK38nEjduEQcutgdxEYvb
 o4pYBcgBhPGPwZk9YNumJkXbmcxtWREsjd42MA1UgTn9Riqu9Y1n07vZyFhnkuXBUi9w
 g4IR5AKDnya/CshLPhKOsIaFquJVWY7PjC2u+OQsUSd3u2gfmTCh4T0CSp8U1Y8Yn7Eb
 GMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f9C/3tsGCTrM6yXYfkHijkPRSM8Ff3aL5GP21FCZg7g=;
 b=Tg2elTMLMEYdHhGUWcbDkHWJhoPCC8TiUHapbFBLhWpp6v6FBhp/5BECXxbkA9ra4T
 JAiXg2ZQN7QAY0fcrHPj1/Bjjh79llg/FrA4Ka7Ek7fY3EmqCx+dIYeoNX5IiSgyrLwJ
 xYekPytku6z5pSuzmuk1N1jJyEAYFfWlZmap8latGscHnRrW8qHffQW/UqgtrkouuzQY
 mYKpkjzBWWn/XWOVfbvqNRnwl+xk0NouSZ/+aIeybNedP91EeVgdnZ0TY1pHll7Dur+q
 B8SKuhmYWbqBXGDO4WDfXXLyOXwyXzsOMJVD5HktuTzGuE2JiNQ0YetkwTOUU4/68Ju6
 r7Lg==
X-Gm-Message-State: AOAM533f6BaXw+VZZkvWRN4liFJ3U/EtUt/I1qihf+CGtdsZ3+otKDq1
 +UlVusmgvTrorxF5m2dCAI69WikXAoo=
X-Google-Smtp-Source: ABdhPJzwjXRVhsOXkRvJwSHaJCramgUcs7H8XId+h6sTh7DlzaW2uJeewFFpfw5EphcL+HBvQmkToQ==
X-Received: by 2002:a05:600c:5113:: with SMTP id
 o19mr6383001wms.104.1635349224033; 
 Wed, 27 Oct 2021 08:40:24 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id p12sm240749wrr.67.2021.10.27.08.40.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 08:40:23 -0700 (PDT)
Message-ID: <6ea73bbb-99b3-4ee3-4946-ca5a7e858ce5@amsat.org>
Date: Wed, 27 Oct 2021 17:40:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 07/11] hw/char/sh_serial: Add device id to trace output
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635342377.git.balaton@eik.bme.hu>
 <5bfade7f5e807a3e950b328a5a11a67859e176cf.1635342377.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <5bfade7f5e807a3e950b328a5a11a67859e176cf.1635342377.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 15:46, BALATON Zoltan wrote:
> Normally there are at least two sh_serial instances. Add device id to
> trace messages to make it clear which instance they belong to
> otherwise its not possible to tell which serial device is accessed.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/char/sh_serial.c  | 6 ++++--
>  hw/char/trace-events | 4 ++--
>  2 files changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

