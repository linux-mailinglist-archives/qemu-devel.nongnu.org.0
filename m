Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 399534A934A
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 06:18:32 +0100 (CET)
Received: from localhost ([::1]:53356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFqzP-0000rj-0I
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 00:18:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFqxe-00009q-Om
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 00:16:42 -0500
Received: from [2607:f8b0:4864:20::635] (port=34575
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFqxd-0003rZ-7L
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 00:16:42 -0500
Received: by mail-pl1-x635.google.com with SMTP id h14so4218304plf.1
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 21:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zlNY5lAmZjQWr6uHyaMj+T4MOM9V7leeWFvS72Y6E7M=;
 b=PU48ng908hgpeja1VKrasgVqIjmz33af1arRA/pGQpn2SisFVutBZD/uO27cf2y9Ba
 ABG5XboMSDwEznB6GEoFvmQsdj+G4cEcZvX4+mxbn5AY8ZlbjIiCewNx981C8W7inUl7
 XrDshdV+k+8/BFFPhjErPElXFkzqdayXZgB+phLhm2x7A7yhedxKHR8k/RIS0IUxwGHM
 uynhY+AIZPo01zrc4wms/hzsSnA6RigqYb/H1jBQC/ZX5I7CdeFeBCgWcD8LPQLFCNU5
 WN0FRhH3FwtaPp93G9h2mealPvgyaeP0uTpWfekNxjtbMVh08GhLytGkh63HUBM8+Rc4
 5zBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zlNY5lAmZjQWr6uHyaMj+T4MOM9V7leeWFvS72Y6E7M=;
 b=hkCKwNFlaQwqJSeSRlUPyCqz13i/P2aIEb45MWKgMh7lKODe+IaH3MzK7lRfhiGDX6
 UfJOLi+jzlxqNDUrG15SJGtb4Vl7YpWk6HQTZ9BWhfmGQWVWIAZvbIByGhVCwUw5Qq4N
 FWsHSqfVj81UwDoOt0r54dhILzGkuOrHJoFq8R+ZyTx4t2bI4UUO+xHSbvKwgnNNAIeD
 1ZLhl/t0iqx0aPA7Fe60kJt//p70Ih4O+st/eo3H2+6yzrf6UaILX+qN40KnNd1GKoa8
 ak0OX0ViCn3Ld6BSRAy7qU7a6n2+R7z3gKMp7+qZB2a1WVjLbY7YB4LUO46d+boFEwzi
 q5VQ==
X-Gm-Message-State: AOAM530ZdJyezsi84gW5Y8tfVj5rKcQSUlDpRcCAq0OQtuGS/Itrw0Dt
 38oDQRy/wSatkOsV+w/tDRo=
X-Google-Smtp-Source: ABdhPJwAB7GZyjfaRNoTzdMCQJGJ/JMUUNQj6meSLN+HHx44hC37MT043VRoKIWM1mikex9Vz8rkNA==
X-Received: by 2002:a17:902:da81:: with SMTP id
 j1mr1572452plx.14.1643951799803; 
 Thu, 03 Feb 2022 21:16:39 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id oa5sm12401080pjb.0.2022.02.03.21.16.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 21:16:39 -0800 (PST)
Message-ID: <23c4d174-f18e-2932-1c25-6698285b53bf@amsat.org>
Date: Fri, 4 Feb 2022 06:16:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 21/27] qga/vss: use standard windows headers location
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com
References: <20220203173359.292068-1-pbonzini@redhat.com>
 <20220203173359.292068-22-pbonzini@redhat.com>
In-Reply-To: <20220203173359.292068-22-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 3/2/22 18:33, Paolo Bonzini wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Stop using special paths with outdated headers from an old SDK.
> 
> Instead, use standard include paths.
> 
> You can still build against the old SDK by running configure with
> --extra-cxxflags="-isystem `/path/to/inc/win2003/"

Superfluous back quote.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> (this also allows to build against MinGW headers, which are currently
> broken as in 9.0)
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   qga/vss-win32/install.cpp   | 2 +-
>   qga/vss-win32/provider.cpp  | 4 ++--
>   qga/vss-win32/requester.cpp | 4 ++--
>   qga/vss-win32/vss-common.h  | 6 +-----
>   4 files changed, 6 insertions(+), 10 deletions(-)

