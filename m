Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3B6A053E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 16:45:35 +0200 (CEST)
Received: from localhost ([::1]:37166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2zCY-0002Vd-F5
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 10:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60327)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i2zBO-00022R-UU
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 10:44:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i2zBN-0002zh-Sd
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 10:44:22 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:36616)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i2zBN-0002yv-LK
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 10:44:21 -0400
Received: by mail-pl1-x643.google.com with SMTP id f19so94563plr.3
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 07:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B17CKcks8FPD7jX4cZI41pdsDLZUe3W1R2U6vUWsgCY=;
 b=Ir0u3wUp602d8ZoaxCmD/2qq20HmF5Uo0pRNAquNsutt2egUSrfH05YyDxGpmKNYMv
 x67O0L5aTQ9250OjoGntu051OQh9nTcLa9LFdEyjXkqR3rO09dhtIMFxktIGi7ROiJgp
 C7o6SFdWnG9FQBCk4UgAW7hbVJvEs6wtQByXZGnzSW3cdy5szuaQOz9PFW4Ye5AQEXKK
 9JvBNrUWyWU/qmSIuIKl7aCRzjZXARjiF+p0wy8kJ6OEBgc/XRNXpa177eQgwfD7CfVx
 Z5UsYU7rZs+Y+Sh2qUFeBZIrh75ip02f9w2IGD/6VCFoHE+RGhZZ6JFljHK3BnMGXdOh
 BSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B17CKcks8FPD7jX4cZI41pdsDLZUe3W1R2U6vUWsgCY=;
 b=gmhuMD1EH28LJNpnapuxHDYGrfRmd5YLsXvNgBsDbt3q/UfbyMDGKTZE5AcYUB8jwx
 ZZWdicuLrSlZRVFRZPP9Z4OI9slxrV12UrEsNooN4m/2L7zYCqjsnx71vM2UQ2A+7xTE
 Q7iEJHCHi/Jw/hB8thpm7uI7p0H43Wbc5Bcskp1iTAZXB3LrNB7hgIOiEVb2fsIRR8p4
 K0LMIdmlhUkRtOZS3mQ52FBkfm6l7Ae1HDBRDybAAamTedOL1BAAdJrqnXU/gWVVO9XT
 eQTwPol7PzXJgK9TeLJF6fm4xnKImhf8q+3lJfsp5ba8d4vwLv8IRT/OWffTRjJjE+Hf
 vCvQ==
X-Gm-Message-State: APjAAAU3y2hFjdhM8BLKpdTMYKVISfu0SxIrza3K9SaLU0RnBHsl9T1r
 RdcY6k0NecE8yd3ucOUL3DcPRw==
X-Google-Smtp-Source: APXvYqzJAKS4/dCzgOjIuh4UhOluba8n/0PeTGdlYltzjXaDQdifEu5kYhCV08i3O542PFuSUfFH6g==
X-Received: by 2002:a17:902:524:: with SMTP id 33mr4761654plf.27.1567003460250; 
 Wed, 28 Aug 2019 07:44:20 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id g14sm3050664pfb.150.2019.08.28.07.44.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Aug 2019 07:44:19 -0700 (PDT)
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20190828111004.28013-1-david@redhat.com>
 <20190828111004.28013-2-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <07f892a0-c8d8-9960-1536-082121cf2618@linaro.org>
Date: Wed, 28 Aug 2019 07:44:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190828111004.28013-2-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-devel] [PATCH v1 1/2] tcg: Make probe_write() return a
 pointer to the host page
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/28/19 4:10 AM, David Hildenbrand wrote:
> + * If the access is permitted, returns the host address similar to
> + * tlb_vaddr_to_host(). Returns NULL in case direct access to the host page
> + * is not allowed or if the size is 0.

Maybe we can find some better language -- "not allowed" sounds like a
permissions check, and we longjmp out on permission check failures.

Perhaps "if the page requires i/o access"?

Why are you returning NULL for size 0?  Just because the caller hasn't
committed to a size and thus we haven't checked watchpoints?


r~

