Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8594606B2A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:20:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oldtt-0004hV-Rz
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:20:29 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oldkp-0008Ta-0g
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oldkh-0008KO-0M
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:10:59 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oldkf-0003H0-3P
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:10:58 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 x31-20020a17090a38a200b0020d2afec803so1011495pjb.2
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 15:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a3PUQ9t3GrHLuFj1dQuxWB4bZv2L7hCpQ/K50OCmVbk=;
 b=knIs70X9StQ8ImLh5C/EUCAKTfyzGTWmxSJIXIzKVpwQuY16WJndLA5aKaDmAmh8Ho
 f5WhTmO0+CGjxfDiY5BYvhrdnKhPKszQMK5Mo41mTWIno5z3Spo5R413CbXcp5rKlXGs
 eW4gsTb9PhQP96ty0w1aCFQfnT22MAJshDA0x4E3AHjJIvdwiOw1OHJHPBY1X6mZhBGh
 XnhvpYBsCsXQbOdXXL/5dezk1zH+SJnfTdCBAPpUihf8eikqOj9lfSNg2dX7kXOAs/HW
 w+7eMeU09ZytcbCwTswHaIG3QLq2XSYD/mueOkdcGakR6k9FuYROteLqw0AXT4MJ/K7e
 /U1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a3PUQ9t3GrHLuFj1dQuxWB4bZv2L7hCpQ/K50OCmVbk=;
 b=mb9gB7UjebK+gL7sSGQ3yjL59SSMpmfirjj2B5lswiA8UhpPLxMS2QQ+pudE709mDA
 xT1bEoOGUFli3G1LuT1m00VR/mlZJ6CzTB498tqhpisvon2VvZJ1EoR2uRiqgPRsAP2k
 qu4sMb+6lGpg6tJvJtitGxDnVKRzaxwBM61HYgr6arptZhrnDOgCohzq/+mHNeQquwOI
 kwcCuIBfomsH2tYgmlLEF/+iXNUxWdV/MWyOt5r59pdryv9gzKIJMLCTJ7XKLboaRD9G
 BBNSBU0+kvTas+3ziusQRHhkgzbqZ7N0CS2v7PcdMpYxKDgWF5jlStmOHZBaTZXNjefw
 mPYw==
X-Gm-Message-State: ACrzQf1+mRTWtMs0LIDqTK0nmewnAUplpvKiWfc1s6st7IvpWnHMX1m9
 02YeZ0xJtMWdzzxuOcBgduUSSg==
X-Google-Smtp-Source: AMsMyM7qKWA0JT4CMT2X3c8QHxByoioJT7bAxtsg+XnR3KnPfRdRwn4I4rk6jNuVW+wPASAHpLcYiA==
X-Received: by 2002:a17:902:ea0c:b0:181:61d1:ac1c with SMTP id
 s12-20020a170902ea0c00b0018161d1ac1cmr16343808plg.120.1666303852685; 
 Thu, 20 Oct 2022 15:10:52 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a1709027e0900b001780e4e6b65sm13192245plm.114.2022.10.20.15.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 15:10:52 -0700 (PDT)
Message-ID: <bc7775b6-7a7f-a932-cf3b-61c667e83c8d@linaro.org>
Date: Fri, 21 Oct 2022 08:10:44 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 04/26] configure: don't enable cross compilers unless
 in target_list
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221020115209.1761864-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/22 21:51, Alex Bennée wrote:
> This avoids the unfortunate effect of always builds the pc-bios blobs
> for targets the user isn't interested in.
> 
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   configure | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/configure b/configure
> index 81561be7c1..dd6f58dcde 100755
> --- a/configure
> +++ b/configure
> @@ -1877,6 +1877,15 @@ probe_target_compiler() {
>     container_cross_ranlib=
>     container_cross_strip=
>   
> +  # We shall skip configuring the target compiler if the user didn't
> +  # bother enabling an appropriate guest. This avoids building
> +  # extraneous firmware images and tests.
> +  if test "${target_list#*$1}" != "$1"; then
> +      break;
> +  else
> +      return 1
> +  fi
> +
>     target_arch=${1%%-*}
>     case $target_arch in
>       aarch64) container_hosts="x86_64 aarch64" ;;

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

