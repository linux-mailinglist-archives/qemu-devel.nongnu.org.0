Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 219AE594A77
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 02:18:40 +0200 (CEST)
Received: from localhost ([::1]:39370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNkI3-0008Qs-69
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 20:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkEN-0005rs-D7
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 20:14:51 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:34341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkEL-0001OL-TG
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 20:14:51 -0400
Received: by mail-pl1-x62a.google.com with SMTP id z19so7780481plb.1
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 17:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=1iEaQtJ62A6T2Ix7XZEBYKm6r5rMGDaTC5oPlGi3rRg=;
 b=EtYXCcu9U3qD1PfiKYCI0ZN/kLzQ0qFBwoKiJh4lQdXuvjTbWqPtGw73zWlbRlbXC7
 o+1ljAg11m4y3OGgJg+6t3PHXO5no+m3EWCQuk8BZ4Yq5tnKWBNZOr9ydFKeulpDsfsn
 efqpOCwZD0UgjE9SxeLfo9velraK3rQ3J3WHU+oWFVyN+m8jVjXNuFs7a/IBH747JpBA
 sy4Fnf5qwueW0ysE5xhp9ql0j3OkiJ7Q5YcG66ebt5yF2nWoW6EdALy0Foa2AF5C6HXr
 zSSE6se+sh1KXBE8nH8XZgggWYibeUMzV76yJi4gTr0wq4QJclM5xfCb/HFJw7Wnh+u9
 01gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=1iEaQtJ62A6T2Ix7XZEBYKm6r5rMGDaTC5oPlGi3rRg=;
 b=drYES0ouhx2j7psOnccjb7aOL7iUS7UFrWPPaM+1s3WReRGyChj8Ib3zr0r5n8Ypoe
 3Y7jhJ6iEk8s/bq9RlGUozorJHumDqU2YhQW5FrMWxAkzDXeWtuAVGZJbjWXGpriIjP6
 fEHyDTwv6mhtCxaNufsTccTm4n//t8pyxxpPtYu9vhcijz/NxYs+z0Gf3dQwKfXfqKtD
 3uN0JOd7dt6CwJDnvDi+Byiup96q1D74Y4J/33y7rXy+L/ZjBgDC+qeo+KI4/eUxjBVF
 1FYAsgPHLwypL98SU9ei8vJd3fKfyaQ7PjALZWFlOJQmx22geUwhvsps7aS7MR6qteWd
 xatw==
X-Gm-Message-State: ACgBeo1fyEITWJnZCwM6/7tUbcmmo+aCE8j+Pq6cwV80d1hljWADVvEi
 D3qKhfGHQDAMWHl8tymVAH8=
X-Google-Smtp-Source: AA6agR4zlXPiv+wnMU0vp4+7Ln9Hr3Q8WcGSQ+GGK/dGgPi6Zj6YcieqRCgvK5KhiXUojeP2M1KoFA==
X-Received: by 2002:a17:90a:640c:b0:1f7:6ecf:33b6 with SMTP id
 g12-20020a17090a640c00b001f76ecf33b6mr30382008pjj.3.1660608888613; 
 Mon, 15 Aug 2022 17:14:48 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a170902788800b0016d6420691asm7557684pll.207.2022.08.15.17.14.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 17:14:48 -0700 (PDT)
Message-ID: <d17b2566-db54-0f6d-be22-d44b77b23837@amsat.org>
Date: Tue, 16 Aug 2022 02:14:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 10/20] disas/nanomips: Delete nanomips.h
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-11-milica.lazarevic@syrmia.com>
In-Reply-To: <20220815072629.12865-11-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 15/8/22 09:26, Milica Lazarevic wrote:
> Header file nanomips.h has been deleted for the nanomips disassembler to
> stay consistent with the rest of the disassemblers which don't include
> extra header files.
> 
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.h | 28 ----------------------------
>   1 file changed, 28 deletions(-)
>   delete mode 100644 disas/nanomips.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

