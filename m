Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A267D37B322
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 02:42:57 +0200 (CEST)
Received: from localhost ([::1]:57734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgcxk-0006qU-Ne
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 20:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgcvE-0004g9-Rw
 for qemu-devel@nongnu.org; Tue, 11 May 2021 20:40:20 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:37451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgcvB-0001mF-M7
 for qemu-devel@nongnu.org; Tue, 11 May 2021 20:40:20 -0400
Received: by mail-oi1-x233.google.com with SMTP id k25so20784407oic.4
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 17:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SwOFt7kjTzcZyuHu+upuO6ErxwLgoUDeMCeG0biy9SY=;
 b=sF2E5oBJtPKDoLbd/IawCmO0v4O7X1H8GFkI1ZiviwDWDfwUeHE/gpUEuXrxMIQlrm
 xNTS+buIR8gDnWLTbrRBEnmMvbqfExHWooh4libzVrUJpKvto/+sPHitSZmdLvfokaL7
 eLuXLhS27uxO1iZF11s9OdLOTvgrGHAQLi1gkG3UtSEVjpj3AacWWBnbJUtkYr0N5G+s
 aeiOcDZMK9phgWh75V+yIrx+3vJVAE5ZKz+sQPObzyrThk9PTxVXMcNW5mdSHssaEHlp
 bdWDQaAJNKF1bYtGJAj0KN5banjXtbGt+Mh9Oiw2jntNvrwB8mJDZkzqhFX46Q//OZ0X
 eK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SwOFt7kjTzcZyuHu+upuO6ErxwLgoUDeMCeG0biy9SY=;
 b=Q8yJUllRc5wFHI1wOKtozlCzPsgOurQg2JIDP3yv8JlfBhMbOIERDqXECmLM9oDEw0
 o4tQhAEfImsIKvQno4AHnoavR3ShFDpAoR7lpLX7MjgviuTxmo1wBJknZm/fH2jOCgsV
 1GKOlW3r7WBVB+eHioDzB47pp8zEDEhOyA1u74Bnmy8UcEtip/yG4ZNaDrGClyC+FPw4
 08NsmHEIFP24vtCg22JNecWh32zQxn0uXpQ3O8/UYUPuHj3iuzZ7SzghxseE20ZH7CMB
 jIODrcvrEDe8+B4ZAqtRFGhktTcp3l1BxaUh7qxKyUqPWE/xyEYFqRl9KMu2sGZ0jK2C
 ghtQ==
X-Gm-Message-State: AOAM533Lm/DsmNWXR/eS6K1zktziM5g6+XqP8FlLG7Jxw8r98OgWpLEc
 XwLg5Xy0hbC5qThWRjV7vdV0oQ==
X-Google-Smtp-Source: ABdhPJyRSgjGxSKl8ZzxvJNBaZ3t3Frf0RjBRKDOavFU9btDiXNh5nOa/YR35l7paKYQquMMznowUA==
X-Received: by 2002:aca:4a8b:: with SMTP id x133mr5631661oia.52.1620780016608; 
 Tue, 11 May 2021 17:40:16 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id p1sm4226722otk.58.2021.05.11.17.40.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 17:40:16 -0700 (PDT)
Subject: Re: [PATCH 03/12] crypto: bump min nettle to 3.3, dropping RHEL-7
 support
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-4-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b8feae28-ead3-dcb7-7b95-7e1c9a587591@linaro.org>
Date: Tue, 11 May 2021 19:40:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511132641.1022161-4-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 8:26 AM, Daniel P. Berrangé wrote:
> It has been over two years since RHEL-8 was released, and thus per the
> platform build policy, we no longer need to support RHEL-7 as a build
> target. This lets us increment the minimum required nettle version and
> drop a lot of backwards compatibility code for 2.x series of nettle.
> 
> Per repology, current shipping versions are:
> 
>               RHEL-8: 3.4.1
>       Debian Stretch: 3.3
>        Debian Buster: 3.4.1
>   openSUSE Leap 15.2: 3.4.1
>     Ubuntu LTS 18.04: 3.4
>     Ubuntu LTS 20.04: 3.5.1
>              FreeBSD: 3.7.2
>            Fedora 33: 3.5.1
>            Fedora 34: 3.7.2
>              OpenBSD: 3.7.2
>       macOS HomeBrew: 3.7.2
> 
> Debian Stretch has the oldest version and so 3.3 is the new minimum.
> 
> Signed-off-by: Daniel P. Berrangé<berrange@redhat.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

