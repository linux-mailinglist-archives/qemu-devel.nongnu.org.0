Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A58F1186040
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Mar 2020 23:32:47 +0100 (CET)
Received: from localhost ([::1]:59650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDboM-0006Gq-E7
	for lists+qemu-devel@lfdr.de; Sun, 15 Mar 2020 18:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46197)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDbid-0005Jh-8Q
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 18:26:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDbic-0005Dv-A0
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 18:26:51 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:40217)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDbic-000553-1D
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 18:26:50 -0400
Received: by mail-pf1-x442.google.com with SMTP id l184so8800049pfl.7
 for <qemu-devel@nongnu.org>; Sun, 15 Mar 2020 15:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Tvr8ewJhCk5yS/4KS3sSfE+qWn+Jkx1hGdGNVFkYqmE=;
 b=y7n1nOzs3EOEtkJpbK7e5B8wDz7PG2OO/sUskFsht9+DYN3Q3Gu5Ygi83x+pRKIAGk
 gGmQ/LrVpT08pAKcTdP2usnN34HaIdC1ITBB+4btBwNEse1MRfos5YkztqQ1+xl9xOKC
 HPh8pwmfJYxvNksT6al872yAC575GrZVymUbXR1VUW4fE9lOQKekkqvEglGhctlml4af
 Cz6Wml2SvKUjuLHa4rRQKQAIb4FVvVahdZ9xIJMkc3k/tS0oQJuvPC/UsCYzJjtKZKNU
 At9kbgiZy2kAKWg8pJWc1hzvhVlYCG4+0NoYwXp+js77BmVuLRXXmKxvBni7exiUrI9V
 G+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tvr8ewJhCk5yS/4KS3sSfE+qWn+Jkx1hGdGNVFkYqmE=;
 b=WP3kexOglVrXmWdnxLEdaY3HDB1XfYfRsM/emsYj07+gkx7rIjiha3ot5OLPfDYWc2
 /0HYeE2DDbjgNkUFMaNbjTa43ofXAYxJ9LNQsNcDvucUVJxL2aKSirBqKmdQ9RAhA4ET
 kTe/a/vQ6TTpiAIk3DReA/eLie4sP7Y8lOY5cXX6utva8PckBVVKa2ytsFK5zzzJhA3D
 10hhdmyzHVJag8Iu+pgktseZsYZdlIoUJz9L9Q3YWlzf3vu570s5wwsjlT0zFr7umbqx
 sSfkGA79CL3J6cvN5Shv8GTFML3qUsUjn+5koMRbuIh/WA+HnMtSr8cd2pccs+/wRnNC
 CktA==
X-Gm-Message-State: ANhLgQ0DkDwzPQ59d2DhF2vIbrGNNGNLzkOLZcp14o1ydYR8Qba/rCd4
 phF/55AEvfCTyKkKkzTgx610zQ==
X-Google-Smtp-Source: ADFU+vtMLQ40zyA6h9Zl2PaqyMy26hrObDZGBATNjHiLcUtyet2J7U8wqC4IpSIsdvE7toxJmvlzTA==
X-Received: by 2002:a05:6a00:4:: with SMTP id h4mr25147141pfk.92.1584311209172; 
 Sun, 15 Mar 2020 15:26:49 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 c207sm24588204pfb.47.2020.03.15.15.26.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 15:26:48 -0700 (PDT)
Subject: Re: [PATCH 5/9] hw/core/qdev-properties: Export qdev_prop_enum
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200313184607.11792-1-philmd@redhat.com>
 <20200313184607.11792-6-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <27a2e70b-c07a-71d6-49d2-ea0d8a948ec0@linaro.org>
Date: Sun, 15 Mar 2020 15:26:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313184607.11792-6-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/20 11:46 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/qdev-properties.h | 1 +
>  hw/core/qdev-properties.c    | 7 +++++++
>  2 files changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

