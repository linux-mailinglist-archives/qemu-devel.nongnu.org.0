Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BF0444412
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:58:57 +0100 (CET)
Received: from localhost ([::1]:57394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHj6-0002C7-9M
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miHd1-0000ck-1Z
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:52:40 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:39676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1miHcz-0004UF-4A
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:52:38 -0400
Received: by mail-wr1-x431.google.com with SMTP id d27so3994280wrb.6
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AaiS1AYe6k56kU8on+AE9NLPLQkEkihqyy0RdhtI8y8=;
 b=CAbF6oo+sB5WONr5253WDHg41yKSwECLruF70+sCqFU9o7mdoYDsvSRfMvjI1xP2BY
 Z7l8M70cAcZoqCtoGM1r6GgVp+DTjuxj5exfhDZjSVQpSEiOWS+0Ej1v0PCjDxSLsrhU
 8HDfRXw/CzllsUthOz4daqlMnqeSc36YLmyKwU+brNeHHoT5nBji5kO1K/uvtZG0u/6e
 6r7PVFrrkCWuNXfOtMLu1HM/e2hho/KIYIkaKVMrXyoCF7aReTcnthXhIFUndkWTHYEZ
 jhtB0NIU70ko5nfdWcXYFAGlhDuH4COIi63EW4IJxRPx4FKdSUV2Z5fkS7zGexN0t/WI
 fBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AaiS1AYe6k56kU8on+AE9NLPLQkEkihqyy0RdhtI8y8=;
 b=DmSazSxP4/90gXX9UVrboNmotZd8Vx+hlpZCWeU04BN/AiH/xCn4BhvQyHsAoJOsrx
 jL9gsslDaaT5NAa2iX1F1JzG3jY1MW1Ps5OdssUGeo1cYqmEYYYD/HfogzpEjaAKQgB5
 a+d4mrM9ntZycezEOqID7Yaeu/JG3bolKYyFo0VTfH+vKi+xFnfjBPyhGzngaYKYhllL
 xOuMzVxux3wPDTA9U6I02dLfi94jQsJt5OTTKrCZ07sKqY0OzVZ/gJKe1vSZMR8NLes6
 D4WZskzeycTfEwnSZK01iLDk0IKu+e//TAVHOiVhD/wl28Dh7zgdmcYiT/2ADF3fcxxU
 G/dA==
X-Gm-Message-State: AOAM531JZYp9mER6dnm9tYeGKSTjmU5VCW5YOV3sp2ULTNNYnAZqkVco
 uXKeGJiv+sdajISNWrCpJJslnS6VHpA=
X-Google-Smtp-Source: ABdhPJzJN8Ykyk5/0soAqJco6E7k1k6B+/GbJmULXJKRarMG0AKWjWsATnZplqwOmKS6gUT93wCrpA==
X-Received: by 2002:a5d:6691:: with SMTP id l17mr41610835wru.227.1635951155340; 
 Wed, 03 Nov 2021 07:52:35 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id c16sm2094916wrx.96.2021.11.03.07.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 07:52:34 -0700 (PDT)
Message-ID: <9c33af99-d897-89cf-fda7-d37c3224eb54@amsat.org>
Date: Wed, 3 Nov 2021 15:52:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/6] docker: update fedora container to Fedora 34
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20211103144844.1285634-1-jsnow@redhat.com>
 <20211103144844.1285634-4-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211103144844.1285634-4-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.528,
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
Cc: Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/21 15:48, John Snow wrote:
> Fedora 33 will be EOL 2021-11-23, before QEMU 6.2 will release. Upgrade
> the version we're testing as our minimum now.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/docker/dockerfiles/fedora.docker | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


