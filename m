Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F1A4A5AC8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:01:48 +0100 (CET)
Received: from localhost ([::1]:41328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEquw-0000HQ-Kt
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:01:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEqo7-0005bk-TT; Tue, 01 Feb 2022 05:54:43 -0500
Received: from [2a00:1450:4864:20::32b] (port=40879
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEqo6-0000h0-FV; Tue, 01 Feb 2022 05:54:43 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 l129-20020a1c2587000000b0035394fedf14so1509359wml.5; 
 Tue, 01 Feb 2022 02:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cOeEZ/NsRnidUIp0FsptD31Ix2QxxCxfqaVXaDQc4Ho=;
 b=C+uo7RIBo9EJcWjHXA0IlPixLZSxb4y75l1370nta8Bck4GJnyhrqzvubEW2Onq7vF
 si91T8HM8WpbkduSukIz/W1Uix0Yhtgik3VKvgSmrdrZpB2vj7T7XrFKisChc465jKBT
 W/c3FLOWcSPcn9gDWGb1AjE7N5shh3zZMZsQHbD0GG0RY0SOrH30FqlrDdEcFpWbiUJF
 zj5Fy331A7225bGiYlalbhqnPKelvC35e3ZceADIvvvaxva3ApNkGkjUQGSgWzNCZeS9
 aG+oJX4r6FJet/8Sgdmd9L+gihk/5Wq8Ev0V2Kq7ttjJrkdZmIu8S70yr314UPd8VT/2
 Ge/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cOeEZ/NsRnidUIp0FsptD31Ix2QxxCxfqaVXaDQc4Ho=;
 b=4MJ3EJtYGL+JILcV0vf/0v97H8u4v1K1pPycdnnImoGgL4mXq883hRxiDOiQWazWl8
 IkkmeAW3QiVCdFtyypVs5ZXhUadaR1TALZ2wLlJpA0ddSyGdDbm5XyLvxP7Ol2FYTBj0
 FkaqPV9kU/PP7rT5FJBwyCaFumMRh5bl1ld0T3jUbyNdeytJSTYUrM27YxKEWsaMC+gH
 zlr1fswcFVkWIDc/OE8ZR4Wmbev37mtvTJjHbqvuQkJVKZ6j4JL3WCwoviBeyz9SgHAW
 mxyxP3sTHT3sv7itYD+m9EbC2pzkS/+1xpsQy1WcbaZQFwwwex9gc1RCpIP/UdM72LaO
 3xaw==
X-Gm-Message-State: AOAM530QKjmlw12VlyzTXLqMCG6HUAjxt5BoUTflwg09ctrIrjh9mYtE
 hxzsqeE52O8CEnyAaLYQDSs=
X-Google-Smtp-Source: ABdhPJwAnx3+mmcIAeNlrsiyXFVZn3LX+CHAISwc9KGh8XpxyUuZ7PHiyxRPJEjkNFWyMX0tLfAtgg==
X-Received: by 2002:a05:600c:a4c:: with SMTP id
 c12mr1251789wmq.48.1643712880808; 
 Tue, 01 Feb 2022 02:54:40 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id 5sm16521281wrb.113.2022.02.01.02.54.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 02:54:40 -0800 (PST)
Message-ID: <6867fd1e-4392-f1ee-362c-118b1a2d8e86@amsat.org>
Date: Tue, 1 Feb 2022 11:54:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tests/lcitool: Allow lcitool-refresh in out-of-tree
 builds, too
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-trivial@nongnu.org, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220201085554.85733-1-thuth@redhat.com>
In-Reply-To: <20220201085554.85733-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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

On 2/1/22 09:55, Thomas Huth wrote:
> When running "make lcitool-refresh" in an out-of-tree build, it
> currently fails with an error message from git like this:
> 
>  fatal: not a git repository (or any parent up to mount point /)
>  Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).
> 
> Fix it by changing to the source directory first before updating
> the submodule.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/lcitool/Makefile.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


