Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B783E4EA306
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 00:33:31 +0200 (CEST)
Received: from localhost ([::1]:44032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYxvW-0003H1-Mz
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 18:33:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYxrL-000052-LV
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:29:11 -0400
Received: from [2607:f8b0:4864:20::1033] (port=46728
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYxrK-0006D2-80
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:29:11 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 bx24-20020a17090af49800b001c6872a9e4eso862272pjb.5
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 15:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=trel5C4fkT8T4EojKGjQLFq7MvLEOW9fAQhUcr6ZSZw=;
 b=Sm0xSaRRMR5FU65/lINJGJxM3RY6uTtAFhECFqFFYdaglp0J8G+CUscNdKlIqdspk1
 WPMIwnGIh5t5qzPvLN2nVoktxqV01t9JWUeUzYla3biyyS/WmkHZ3bTuF9u8a76eVcu5
 JGH8Klr6u8ySM+WmW8pIbnzF91jH5lNJFrdlMe0SZOTUKs79P1olsQPuX6S5bl2CgdRF
 fmsS3dOlIeSZLkilKis5oBSgOIuLl7ABqSFs02dqmHrWTl89iQip8sAwO2xJgO4o8QfT
 ACHn5CLzXqn/dea7uzl0R+tEfwGSW7tacr/dKBeL8C9sV8xs0FftPs5DuAp8lX12yCNd
 tpQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=trel5C4fkT8T4EojKGjQLFq7MvLEOW9fAQhUcr6ZSZw=;
 b=UroqKDJf09HYutWKFmkeeODX9cuZKK7fYNTy3HTORMJihHnxmA6PpdnsQUveCjLJR9
 0k3530xyfFVuLZfIJdc2HoeG2LxSb9qVDQQVrRI2R9jbP71C0CqfjDIsdkcmMebJ2aOa
 FnkVhJB1Qo8lv4S1wdzObidfCmByTGoMXHVJwj947of3JmbwNnF48UQ+VRbZZcGNgjgx
 RKeUgOUQ7NjmDnXyQhnusNfNSqDybluMpWmKlem7pKjB18qeidyFKzm29djBfjtadpF3
 hgs9h0bNtNyEyql0N7dzWcHIdoweSuVO4dOMxw5kLsg03dXVLH7mwQ5C+OAryqiwesTF
 W64A==
X-Gm-Message-State: AOAM53172X7B4GgLyIDKjTCtkIEZ4ZuF1Ny36symYo/4WhtfLWrCQs5j
 ItLx/t1+4AmuWC1LMgET+8M=
X-Google-Smtp-Source: ABdhPJyxLZnKpQ3FJZ1tUDW9ZEqMteyhPM+QNuIshr9Aqd5AyYl9L90lfJfKvgIvY8q06+RhEhMlRw==
X-Received: by 2002:a17:902:7245:b0:156:20aa:1534 with SMTP id
 c5-20020a170902724500b0015620aa1534mr3228106pll.94.1648506548884; 
 Mon, 28 Mar 2022 15:29:08 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:3c84:1cd:456b:b750?
 ([2600:70ff:f07f:0:3c84:1cd:456b:b750])
 by smtp.gmail.com with ESMTPSA id
 102-20020a17090a0fef00b001c7b8eea25asm463118pjz.31.2022.03.28.15.29.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 15:29:08 -0700 (PDT)
Message-ID: <e3630a30-5c59-8fdb-d873-f19b88fa955a@gmail.com>
Date: Tue, 29 Mar 2022 00:29:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2] ui/console: Check console before emitting GL event
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
References: <20220325161216.74582-1-akihiko.odaki@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220325161216.74582-1-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/3/22 17:12, Akihiko Odaki wrote:
> Without this change, The GL output of a console overwrites the
> other consoles and makes them unusable.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   ui/console.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)

Thanks, queued to darwin-fixes.

