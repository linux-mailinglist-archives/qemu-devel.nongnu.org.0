Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE48510DB9
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 03:07:57 +0200 (CEST)
Received: from localhost ([::1]:51910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njW9s-0003Ym-Uc
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 21:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njW8q-0002EB-Gj
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 21:06:52 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:34307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njW8n-0001oD-ID
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 21:06:51 -0400
Received: by mail-pl1-x62a.google.com with SMTP id n8so299960plh.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 18:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uLU0HM9Npnehq8tUL6gp35+W5EWePIZHOcKSHxkM38g=;
 b=qpxrCl8ZDz1kCZuhlwObXWmu2mS0MlbCX9GMG09t8p3TF2W6NcTlwT6w6LtCctcAcL
 RoIUfeVAmperpAnkwscqsnH0e9R931dbxMkagI9VTmMSB5j3kQeS4DVKvKmP9ijmrfhW
 MsCo5m+iSv3L9RORTepyjECiJQR0/NbLoxkUoL/VGXVxYSEbDQjkYs22mDhLeHg0SFtW
 PlNYPLevts7wGRzPRbLXDunPvIQ7n1KPt/fOoIhr1DCQOzymjKr7aqPB/UIkhJYPKa3z
 cqgOILU3bZsVd4GNuR5Sm12PQaJtjJy8WAsKGXldKJ94ie0YTdPvAyke2g/BLr9aGEPd
 LK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uLU0HM9Npnehq8tUL6gp35+W5EWePIZHOcKSHxkM38g=;
 b=O9wQ3LXLjfDI1AvLpakvMg8VfSx2HgpUB1SVpdiNBTEcrrUXtupy6iEZ36tsWmYV4x
 qhoN/pWY5h6KCCgONhOQwk7x36Wonw0eITgv2H79UuVmZ0Cr6uy0ULE5CoY3DLF+Ue6r
 KZJSLYLscNia1jZ1bs0XIbFnufPIEzjcKKu19x9Jxz1XzUZFjptfKPzb5QY9PQmNU3Nl
 bNKwdE1Axu3jY34k0qfkKJJhxhch0oNOJD3WDDi5Aqc7zj6vQRqzhSuGoNQeNrltIzND
 TOMddvrAkunG2DQDJiXTwctHQ1rX03vS/ehS4pLYjWcrXMQ1kRJj3NLigZ1/3mWFF7Am
 fQzA==
X-Gm-Message-State: AOAM530eRViDfAUljQw+hNGi7ZHxpz3snnK7oqEEfTbax5OytoxbWe0Z
 2Ke7mXjUs4Tz5FfOFpVFPj2hNw0bbNqpIw==
X-Google-Smtp-Source: ABdhPJy9M/XqTkBfHDGaNICox72PKk7USOrSrcqNEtAS3xpfMxzj0chZboMwKtAiQ6CebMvQmt0bKg==
X-Received: by 2002:a17:902:f24c:b0:15c:b564:e4cc with SMTP id
 j12-20020a170902f24c00b0015cb564e4ccmr22308114plc.137.1651021607431; 
 Tue, 26 Apr 2022 18:06:47 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j127-20020a62c585000000b0050d567f70c2sm4131196pfg.171.2022.04.26.18.06.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 18:06:46 -0700 (PDT)
Message-ID: <fc04f48e-9eb1-4097-561a-65baf0587b14@linaro.org>
Date: Tue, 26 Apr 2022 18:06:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 11/26] util: replace pipe()+cloexec with
 g_unix_open_pipe()
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-12-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426092715.3931705-12-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/22 02:27, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> Suggested-by: Daniel P. Berrangé<berrange@redhat.com>
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   util/compatfd.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

