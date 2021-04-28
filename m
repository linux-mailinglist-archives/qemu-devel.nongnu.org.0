Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E1B36DF86
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:26:21 +0200 (CEST)
Received: from localhost ([::1]:39042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbppE-0001sx-Ab
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpnO-0000mm-Da
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:24:26 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:44674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpnM-0007Yu-DJ
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:24:26 -0400
Received: by mail-pl1-x633.google.com with SMTP id y1so17768656plg.11
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 12:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iVSVHhA9vb7hyg4ixCNUXcIqNKVHe/Df9cZogeilUfA=;
 b=RUKlpVcvuaXJ/p0q49U5T7rJ2MF6NsebYL52bbcKk1MsabpxkL8vdoFkSRb7z9hH8p
 TXC9zv3Dof9NIA0N2u7obgd2pDm0PwleaHAPDYofhJaI8k+mhBH0JFKmUK32yTzTu9me
 kSL1kOqi1JUg+KzUxOTCd+Ve31OannJLo8auybR6OKwiWAJMWZp1LVsy8LQ6ERZzy/i8
 6LZU4VXV2Ur1FIsGOhjvEAjKj19Y6RgR5jtYzd8UwPDvjX8skkVuZ3vIUYN/RWd4mEbL
 xEaHHCCMTWSCujvoxNIPFJiR69ESiNEu+aJ+k6/HoKnKeR902As9yx+dsYunnNB/IPKE
 WwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iVSVHhA9vb7hyg4ixCNUXcIqNKVHe/Df9cZogeilUfA=;
 b=ikWuCxNpqdB1PeEwfvf6j7HM5+2lP4E4u4TNo1dqWvdER1sw6xuaaSvF/poaB7FyhK
 Fv7CKWudN243utMb82SlNraoFnSPt2iH0C0DYDZ4kWPvfJ8A/H9GuHfeLpUqacIvs8uw
 OlTsKl8IjV+K90eju0aWd/I9d3GZYXXx0Z4x1+dUSjHP0nX9YkRg+tV8hnTmQnOYpDE0
 BU+IVoLtMsgTjGxKyIV4VNSmLdgKAlkx73+PoXnto3/6drPu2cRs9p4jwA9afaF4llRT
 Tv+TVhGy/aLrNWTp7BV/pZj7HrgERAH3LfxcoJawCBC+oNtXpkQBnJdyyLzxWCDA5T1I
 YgwA==
X-Gm-Message-State: AOAM530tqaTIYwwpDuBZxC74fM8ktmfjM+7r2CSpWC2AYU48VlTz1E2q
 iq36jTnu2odT6XW5zcklSZv0Og==
X-Google-Smtp-Source: ABdhPJwTmDXVFRP1QdjTwFXaD6mpWlzAj5MK8IEBhBVL0ds0l6SY9+PeLbCyBo3U164vpkRTPoQotg==
X-Received: by 2002:a17:902:8307:b029:ec:86a4:90fa with SMTP id
 bd7-20020a1709028307b02900ec86a490famr31956270plb.22.1619637862929; 
 Wed, 28 Apr 2021 12:24:22 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e23sm412453pgg.76.2021.04.28.12.24.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 12:24:22 -0700 (PDT)
Subject: Re: [PATCH 2/2] util/meson: Build iov/hexdump/buffer_is_zero with
 virtiofsd
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210428144813.417170-1-philmd@redhat.com>
 <20210428144813.417170-3-philmd@redhat.com>
 <e06f3f24-9ff2-bf3c-91c4-178af60c6c59@linaro.org>
 <160e4c85-e8c0-304d-7151-1040f8d310ba@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a4dabeaf-4df8-2779-f028-3d135fe84bef@linaro.org>
Date: Wed, 28 Apr 2021 12:24:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <160e4c85-e8c0-304d-7151-1040f8d310ba@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 10:56 AM, Philippe Mathieu-Daudé wrote:
> Are you suggesting to remove the 'if have_block' check? This makes build
> a the files pointlessly for user-mode-only builds...

But since the objects are not included in the binary, I don't care.

The build system is already too complex, and building a couple of extra small 
files makes only milliseconds of difference.


r~

