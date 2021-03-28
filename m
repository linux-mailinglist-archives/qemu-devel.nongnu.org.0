Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 006F134BCFF
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 17:44:01 +0200 (CEST)
Received: from localhost ([::1]:53970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQXa3-0005aA-Fd
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 11:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQXYh-00058B-4f
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 11:42:35 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:35440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQXYc-0001vV-UZ
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 11:42:34 -0400
Received: by mail-oi1-x22b.google.com with SMTP id x2so10844767oiv.2
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 08:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=85+/Y20/ELCJ+MWGsnmyd3aN+/M7cDDf1CrKBsqIQs8=;
 b=oXTvKBA3sJsQhUlZZvEUCvXh/7DzBVN/EfUGwluvZLKL+5Huj3l8TVkYyP4WSXeh6G
 4S+rZ+99CjSd7me2E7W16ua861Y83d3A4zY/F8k5/BOR5ZAdn44SQZrYB3BD0Y82lVW5
 fhUIUwf4zHR4dF4+mUKv9GAs9f0JMvUr4CQOiXgIuKlraUOwNqJxNRfOzo/WaYkQSG5l
 fT/6TrmJ1ubuVDvTS1uuyvLogFNHrSz2bTIozRbin0K0HQdToQCgb1EsCkSbvWWQ306j
 h2F5EmsC3AFnTEEeUtazuevE8c8groa5hY3iY8oMH2FjuBHMumoZppQYbnsqm78DvZah
 VIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=85+/Y20/ELCJ+MWGsnmyd3aN+/M7cDDf1CrKBsqIQs8=;
 b=cv+yJk896kMRTlU6exk535NGQ9fYmZXFjZJLE6AGrXpJExtwf7mtz5vdzbqWMDsxNq
 +zb7+O+M0LvUt3JD9/l79SkI5s6jSMvI5WWGKYd2MhrJBMSkyStQcWsNZES3p75h6rQI
 5GIV9GpyrT9F0sll+0kwLBMmW21gtG6Hz4rXwI9WIqQoxRpVO72d9hBhtvf1pyXlwr7K
 e8lXMc5U/Fnm+KqMRywNgDfF5i9ga3aBbmbA9hJLTT9iO6UOKN1vKgVeQD2llFJ88MY/
 NPGAITM/sY9HljkHfBycNuJJFkeNcC9/3PeJMYRLu2UZg6akuNbnG5IXH9YVwyAc/t9+
 ntFg==
X-Gm-Message-State: AOAM533Vq6pwYr89OFETameXMRYXr8brcOmcbQ7hc1NWWLOOnI01ogTw
 7msdyyH2qKhInl4N2ajQFC2PtA==
X-Google-Smtp-Source: ABdhPJxlqCaop+Zt5kTd0VPccaSoV1qteN2i8xZgq9ei2AuJnynmoA92fpgrHIv7J3j+czzxJlYLUg==
X-Received: by 2002:a54:409a:: with SMTP id i26mr16231909oii.41.1616946149063; 
 Sun, 28 Mar 2021 08:42:29 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id t22sm3832216otl.49.2021.03.28.08.42.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 08:42:28 -0700 (PDT)
Subject: Re: [RFC v12 04/65] target/arm: tcg: add sysemu and user subdirs
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-5-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5ca99b64-2f60-d668-4d75-b698f1cb2b2b@linaro.org>
Date: Sun, 28 Mar 2021 09:42:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-5-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/tcg/meson.build        | 3 +++
>   target/arm/tcg/sysemu/meson.build | 2 ++
>   target/arm/tcg/user/meson.build   | 2 ++
>   3 files changed, 7 insertions(+)
>   create mode 100644 target/arm/tcg/sysemu/meson.build
>   create mode 100644 target/arm/tcg/user/meson.build

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

