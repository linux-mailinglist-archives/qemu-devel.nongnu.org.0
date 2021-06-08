Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 294BD3A042A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 21:47:28 +0200 (CEST)
Received: from localhost ([::1]:45646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqhh8-0001l9-98
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 15:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqhfh-0000pA-TO
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:45:57 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:52764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqhfe-0006rp-Sm
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:45:57 -0400
Received: by mail-pj1-x102d.google.com with SMTP id h16so12564403pjv.2
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 12:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=f31/IXx2CyoQaQwra/NsU49d/EiqyMKxo6Ya+9FT0Rg=;
 b=xdjgtpX9BD4pOVb9xWhhbPS5Q44hNzKGyE3fjSBEvRNbho+54cvns3yCChgcH4Xhvy
 9XxhDuvDWoZ1vH60JfaXBJPbCNOYYwnykiVgpQ84B8q2k6RiZYTfL8GZFVSxj6zWpovb
 Ibpj92kFcisTbST5UkoRA3ZoHUEJgum4J2+sWWeZg6hi9/eBt7Qn4oSe5aADY47uuEye
 fBAuv+wHaUMrK4JGHa9khqAYaepv4/CVwmNZEOzNlBFqyDBVZ08ASYcTsk9CzwSdHmSB
 t0CbJu4p7cJpBegYSTN4M6eBXp3icEU8SwoVQ0XOvbSFw/temxRa0zC+FGkftOigCNfl
 +sWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f31/IXx2CyoQaQwra/NsU49d/EiqyMKxo6Ya+9FT0Rg=;
 b=pOFvLquFceqHklH8DJyAm1986G6PdRe6yfoxDtcFdWv6qMFCVDY0Z3YVb1PBOEbuKj
 T58ofR3hQ+LLd1PZnL/9yssgqFjlbQadtnh2O4+ysVFgjDv0RmOWMCOKT3cZbgmQzckM
 UKYQIIvJR4UVgnpNXWIt8K0O9+FP3yhaaMLEZAQZ8rTW1/NweBOV0o8kRX4lYZb9E0qt
 N/k+CdXG0FCKEcKwr8tT8r2Zs6A/kXTRar8PARp2+C0Tdv2rVPkyVWHkFQNnsk/2mBBz
 KAaG6W5Dgqd8oDJK3YiFM4bP4V58VkCLxMe7dp4xGOcAPSsPigqjCWntOGRFovceE6L+
 7WsQ==
X-Gm-Message-State: AOAM533P7Heb4RmueowOJ7pXrK70cFuZ7C6Xa0OdG6nZzKApVkh1ABrI
 MXx6TB4MVyVBCgJ70DHKLKnvwmKcMQ7kfA==
X-Google-Smtp-Source: ABdhPJxwJWjH/LHjQgAYRHm+hsaeNfI45yNbTFb9JS1i4I2DRQ2jNEDJ36nuJYM3ZuFDrxw983+EZQ==
X-Received: by 2002:a17:902:e751:b029:106:65ba:5c80 with SMTP id
 p17-20020a170902e751b029010665ba5c80mr1368494plf.36.1623181553397; 
 Tue, 08 Jun 2021 12:45:53 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 p36sm12128749pgm.74.2021.06.08.12.45.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 12:45:52 -0700 (PDT)
Subject: Re: [PATCH 05/26] configure, meson: convert pam detection to meson
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210608112301.402434-1-pbonzini@redhat.com>
 <20210608112301.402434-6-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <08135c0f-ce6b-53ad-be57-eba428fbfbf5@linaro.org>
Date: Tue, 8 Jun 2021 12:45:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210608112301.402434-6-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 4:22 AM, Paolo Bonzini wrote:
> +pam = not_found
> +if not get_option('auth_pam').auto() or have_system
> +  pam = cc.find_library('pam', has_headers: ['security/pam_appl.h'],

The condition doesn't look right.
Why are we looking for pam if --disable-pam-auth?

Surely

   if not get_option('auth_pam').disabled() and have_system

?


r~

