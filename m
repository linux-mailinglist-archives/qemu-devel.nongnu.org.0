Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7871F2D1E27
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 00:13:40 +0100 (CET)
Received: from localhost ([::1]:52016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmPhL-0001bI-JD
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 18:13:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmPg9-00018z-Qp
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 18:12:25 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:42368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmPg4-0005XG-EP
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 18:12:25 -0500
Received: by mail-ej1-x641.google.com with SMTP id d17so21934458ejy.9
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 15:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kXBdppreIyvLHsRqI2M3/WFkLSkzEm0q56eh77E7qZ8=;
 b=HJ0No95CtSwH+KB818FpJkn9/xnFYTQQngRiS8K7/PVy+Jy0TvvygxColf0F3FQIkC
 5n9RPPjTbyYeb1KvIegQIGabxNKnrmuNqx07K24MCxWWQgXTrgnzUb9zzLmqteLl1KJD
 ibBV3WF4pz5JOOaM5XyvC727HovULlxaqxf+oPm9yInchmimXkIN8CLp9uVmziAyuVX1
 dzs/4p8oK2lXB4+fKRXibowHC9u4SI0fed87bmbA/1XrfG/gI7gi9+aU9OU57nN7oJAx
 XHIMZy+NZVmI3LJjdN91N+ya9CsJEws65LlWw9OfeK7bZ4PxqKH0z3ffVa/A7D3pMPhf
 2mlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kXBdppreIyvLHsRqI2M3/WFkLSkzEm0q56eh77E7qZ8=;
 b=reIBMPKdGqAHEtm6iVHHTQBd3PVOgqxUBV6EFiVVqknuFkayYzyYub9kMOy7rF5lOJ
 wEq6QZ/DVUsvl96EVnfC14p/KVxXuB7H6BT4oJ2mHg8mxCnoihPfsHPC+Tr7FTEWEt2R
 D6ABRKvTyV/z0mAil0hDuMfBHzr3te3yvrdYxYGxTOKLMDyFnZmmCjGv32Czi1Z6AFla
 ZNTjHuDPtQh44vhPEhbwBPMjhbL3J2Iz3t//H5PtylHR2RIlgwOXDbmWL3sf8sjtG954
 Vw+rvXm9U6UNFtEHGHwRcc/g98rYQ3QJmaZRwOU9cA7sbeiI1JHlUjmS/TEgeRnl7iDf
 mUOQ==
X-Gm-Message-State: AOAM531MCbuvy/XwHdXmzgT8BZ2iT2pfL8/77yOvZ4mvOKy7fQpEo1/E
 L4SFyRn76rcWYE1cuHi2Hi4=
X-Google-Smtp-Source: ABdhPJxP3vLKkHrlb6T9tA9IW6SWYi9PagmkSWp1RJoZrpOYHiL2KelMxb+o4h8bXMfpo15tJYf0sg==
X-Received: by 2002:a17:906:6414:: with SMTP id
 d20mr21256208ejm.82.1607382739178; 
 Mon, 07 Dec 2020 15:12:19 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id cb21sm15021193edb.57.2020.12.07.15.12.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 15:12:18 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: chenhc@lemote.com -> chenhuacai@kernel.org
To: Huacai Chen <zltjiangshi@gmail.com>
References: <1607160121-9977-1-git-send-email-chenhuacai@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f50f0f2a-4a8e-5d9a-d170-864b9277ec10@amsat.org>
Date: Tue, 8 Dec 2020 00:12:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1607160121-9977-1-git-send-email-chenhuacai@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x641.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/5/20 10:22 AM, Huacai Chen wrote:
> Use @kernel.org address as the main communications end point. Update the
> corresponding M-entries and .mailmap (for git shortlog translation).
> 
> Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
> ---
>  .mailmap    | 2 ++
>  MAINTAINERS | 8 ++++----
>  2 files changed, 6 insertions(+), 4 deletions(-)

Thanks, applied to mips-next.

