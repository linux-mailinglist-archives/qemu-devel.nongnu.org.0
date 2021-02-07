Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9C2312658
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 18:13:00 +0100 (CET)
Received: from localhost ([::1]:60044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8ncJ-0004FW-0F
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 12:12:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8na9-0003a2-CI
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 12:10:46 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8na4-0006ob-4P
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 12:10:45 -0500
Received: by mail-wr1-x433.google.com with SMTP id a1so14411779wrq.6
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 09:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iF+hY2IV6VYgKEUtzaMXeWLXOqayZAhiOABVYSalV/4=;
 b=uAGgs/urLLBYdRz1Bdn27ZIHGNjwSB92nfTlf3wZF2ZEzICqcQUxjLfBd4ErzE605p
 ZIwPp8hyN0g+qBhsOatbubQSH8DCyBr5NRUUYEKDBuemog5Qdjp4U0zAJnsVk5655O+0
 Hx+BruuJjQEZt7kriQ0c3KvV/MSVTOw7N2bjdoulO1EiNc3ec019T6WS6x3UMqUWtBNL
 QUwzzyfGTNOaw6+fPMfW/IA6FKnC+80F9FaeZQ4o7L/uRnfeDo5SBH4kdKvXClAKJg7E
 7uKxQr4jc0FuwlieeDm1zht6YDguggYQX5zSULyf9bfQoj0v+cW34go9SGU5R/2E8RfX
 GVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iF+hY2IV6VYgKEUtzaMXeWLXOqayZAhiOABVYSalV/4=;
 b=eEo19aEz1B+17BNWU+/kh7cbgsZBCRc2IlJef99mBMHBSgsqgPwfroRZ5xUz+XJ/+b
 PLIVnA/At8q61gBnNmPW0T74JMboplEK3gwMv6fET8ZDV/VL0PXl4a13uAUH5KATWuHL
 Fz4UAXDwx2TgAcWNaudFelsIdOsPCvhSWHAdxxmX0wsgiXamzyNAXjoiLm1kipPP1fqv
 +lXnfmoHlmzwklD20fpmTAwsMZyxrgG6iBemPlfzPEOFSDX5jF6wyR6Wg2CL2/KlBRGO
 rgonvPufMpNPUpVlfXzNkWOCC72zgkVn9RWPL49MbFWVTW5C1W0aGfwNEXkjWpe1URi7
 b4uw==
X-Gm-Message-State: AOAM532PcfCP5Jxi/4Z+EzjB/BmsTqn0JP5PtKhNdjxQGGwobjH26KQw
 LTQ3KA0/bZ8rN1Xb8aUrRzc=
X-Google-Smtp-Source: ABdhPJzpYDosB8IdzljO8UNy06Io3Syyzij47xOTIIPxDtYDEi4hLBJWEIA98+yg+PwSRIM9zCIxag==
X-Received: by 2002:a5d:6089:: with SMTP id w9mr7855356wrt.412.1612717838622; 
 Sun, 07 Feb 2021 09:10:38 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x18sm5084812wmi.8.2021.02.07.09.10.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Feb 2021 09:10:37 -0800 (PST)
Subject: Re: [PATCH] migration: Drop unused VMSTATE_FLOAT64 support
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20201022120830.5938-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d258bc62-1a17-aeed-13ac-b61297e01a04@amsat.org>
Date: Sun, 7 Feb 2021 18:10:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201022120830.5938-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/22/20 2:08 PM, Peter Maydell wrote:
> Commit ef96e3ae9698d6 in January 2019 removed the last user of the
> VMSTATE_FLOAT64* macros. These were used by targets which defined
> their floating point register file as an array of 'float64'.

Similar candidate: VMSTATE_CPUDOUBLE_ARRAY()

> We used to try to maintain a stricter distinction between
> 'float64' (a type for holding an integer representing an IEEE float)
> and 'uint64_t', including having a debug option for 'float64' being
> a struct and supposedly mandatory macros for converting between
> float64 and uint64_t. We no longer think that's a usefully
> strong distinction to draw and we allow ourselves to freely
> assume that float64 really is just a 64-bit integer type, so
> for new targets we would simply recommend use of the uint64_t type
> for a floating point register file. The float64 type remains
> as a useful way of documenting in the type signature of helper
> functions and the like that they expect to receive an IEEE float
> from the TCG generated code rather than an arbitrary integer.
> 
> Since the VMSTATE_FLOAT64* macros have no remaining users and
> we don't recommend new code uses them, delete them.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/migration/vmstate.h | 13 -------------
>  migration/vmstate-types.c   | 26 --------------------------
>  2 files changed, 39 deletions(-)

