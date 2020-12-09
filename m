Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A631A2D4A66
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:36:26 +0100 (CET)
Received: from localhost ([::1]:53258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5GD-0001lq-Kq
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:36:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn44B-0003fd-Mt
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:19:55 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:46977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn449-0003Gv-Qt
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:19:55 -0500
Received: by mail-ot1-x342.google.com with SMTP id w3so2285451otp.13
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4R1AzvvOJbaQck2xWcevzmy70mGRQXD9TCQoJxgt0rQ=;
 b=NqVGdO+URjtfVU0ddZfQsH5viGB6JsFmSZOks3fU+dFVAikG9gp54t/jA7Bqoqj0Nm
 qrMVKXQh1uXTHNZWgvuaTvT+nVf+FT6Rrouhn8IIB0JqFunCYNmD1QRaotja9jKeoSOJ
 Ikv1Y8erDMeKetf+4z5aAQofFGRvTG9GFO9CXqng7ItAuGgNMbMneSTOTu7i5xXjITnY
 fCCe5hQ+petg2E2swOc7jjU0AERlMZi9nlTOOUFfaYezAng44pj7zp1SPxxM4TTHXeXP
 yzNMg2pQ/+5J0NJomSt6rvr5C6eA4fbZMT8zcyuERoGuA/ia16e6eOIK8l3794h2BGEL
 HuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4R1AzvvOJbaQck2xWcevzmy70mGRQXD9TCQoJxgt0rQ=;
 b=XaIA6GevmzCkz1I52lMbm+UFC+WM+9SA8+AS4KrXV3oYXasec10O/RIbAAtMf3ATSd
 mjCt5slKwnQuOsMitAD4hldCheLgfcobRwOgiMXNpWkEfzOYvcC8IyX7CixHiK4ixTot
 lF8SVfG75Lmy0vh6+ONMIjA1ffcMCO71qv0vQDtn0HUGq5k0mpdh/gXK8hpNydvn791F
 VwLTZ2mMhjQnY5qTvZa/JGJtpzbTPIHUwmgPjtjTn9VTmmgWKfAIoM7tRgMhC6LdV+ak
 01DwbEkOwAFMMKfp6rQK0g5R24DZ2xwx10VkGIKKkUVPZgZUulWGfCSOMBYVDku8viRJ
 6YWw==
X-Gm-Message-State: AOAM532AerLNddhPQOgN1Ouv8Yibktx0bZ045KENzwIHYwabWCFM+ykg
 rHzW0Mu9IIZFg2eIEddhcwUd+A==
X-Google-Smtp-Source: ABdhPJwXm6Zlp6aYxs1g/um5aXpEbiwoUwhSeMBeUhnrDIocRc4CAMoz667+wrP77ZqL7pbn1XDSTw==
X-Received: by 2002:a05:6830:1d71:: with SMTP id
 l17mr2907557oti.269.1607537991663; 
 Wed, 09 Dec 2020 10:19:51 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u15sm445566oiv.28.2020.12.09.10.19.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 10:19:51 -0800 (PST)
Subject: Re: [PATCH v1 2/6] gitlab: include aarch64-softmmu and ppc64-softmmu
 cross-system-build
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20201209170059.20742-1-alex.bennee@linaro.org>
 <20201209170059.20742-3-alex.bennee@linaro.org>
 <69b5c2c5-1065-6713-d1d8-396a63c0bf99@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8c1f3dab-cb95-c5d8-cd0b-cbef76c86986@linaro.org>
Date: Wed, 9 Dec 2020 12:19:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <69b5c2c5-1065-6713-d1d8-396a63c0bf99@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/20 11:08 AM, Thomas Huth wrote:
> On 09/12/2020 18.00, Alex Bennée wrote:
>> Otherwise we miss coverage of KVM support in the cross build. To
>> balance it out add cris-softmmu and ppc-softmmu to the exclude list
>> which do get coverage elsewhere.
> 
> Could you maybe add arm-softmmu to the exclude list? It's a subset of
> aarch64-softmmu, so we should not lose much if we exclude it here.

Indeed, arm32 kvm has already been dropped, so arm-softmmu is a strict subset
of aarch64-softmmu.


r~

