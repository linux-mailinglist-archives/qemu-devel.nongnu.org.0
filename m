Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2858747956A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 21:26:45 +0100 (CET)
Received: from localhost ([::1]:52402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myJoS-0002uJ-1E
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 15:26:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myJnf-0002EW-Va
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 15:25:55 -0500
Received: from [2607:f8b0:4864:20::434] (port=46756
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myJne-0001GQ-9T
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 15:25:55 -0500
Received: by mail-pf1-x434.google.com with SMTP id t123so1809376pfc.13
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 12:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7pvWMtElCdiFT71ZN1rKEmhcSZ47N4WqKCmUTXbV9ro=;
 b=NUk1BHEPLH0FMpTibGJfh/eT3gEHUdLw+CigR3oZK/fQinDNmlDCldbHMlVg1svp2F
 YwfGWEAqX0P03Kcit59v9tTl92pb++KFm/qZV37UD9gX3+BGX8ZlkgmlP/g7R9bIIME4
 vkn4/kAySd9Mubp0h2iBoVS36JwtQb8GNzgUp/+a7+BCxV14BUIqb9T5RNpiCdI/urG/
 pcUFE8P+NmFi9ozyl1bGw2xY4S4+a/pTdeSsYwqZJ5pDfZYWic4ule6RNXuclv8h/koO
 dvOqy1dKY4688jJR4eQ/cgk44i/pQbPEycx+U2E7n42WAmVQodSXwhM9tTTLBC3cjU9x
 ds2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7pvWMtElCdiFT71ZN1rKEmhcSZ47N4WqKCmUTXbV9ro=;
 b=xJcSzUVbT9Tk7+IVD6/Lkm+rZcjOkGLK6YlKr2jv/oIKtCiYpCr2JSDwZb05xMd+rh
 BwS89Vd/Z/9Ws0G3bQ0nJ65evd4109hTRAaddAyzXjpGy5vwr6FlGhj5wuyh1P29aJ96
 xi+b4WLwlL0hwG5ts+OAkj6MUU1seSahmwP9gEOF0nKxHqoYVbD4pKElSAWqILzvlPqn
 d0GZyNwL4nSM7o62LvLE08Bj+V4xGN4L9/RsdrOr+c1qetzlxh1baraedbxtjacCFzBo
 zfKXvwuakjouICj/grVLgK1oYwULuZ+fTJDTNNvQryYTkBonW1Ud+/8Pxg7lq3OYd7rl
 Qkpw==
X-Gm-Message-State: AOAM531OJt/7z4+H3anCU84Cg+ALrXMssUARdkf2nQUA4ro5LNL03lVW
 PdM7/+qc/9PYiVBuwj6k6SY3GQ==
X-Google-Smtp-Source: ABdhPJzogSkpWQHJTmpDQtOtBr7bvQZF6sbnDAbHk0bFMBac4ec1bedMzeolwJp6A9AJdyaCR47/LA==
X-Received: by 2002:a65:4941:: with SMTP id q1mr4361398pgs.123.1639772752942; 
 Fri, 17 Dec 2021 12:25:52 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id h22sm96194pfv.184.2021.12.17.12.25.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 12:25:52 -0800 (PST)
Subject: Re: [PATCH 1/5] migration: All this fields are unsigned
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <20211216091332.25681-1-quintela@redhat.com>
 <20211216091332.25681-2-quintela@redhat.com>
 <efafa479-0c54-fbf2-58f8-17462935daa9@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3abdf9e0-3fa6-1bd6-0aa1-3325c0f23207@linaro.org>
Date: Fri, 17 Dec 2021 12:25:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <efafa479-0c54-fbf2-58f8-17462935daa9@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/21 1:26 AM, Philippe Mathieu-Daudé wrote:
> On 12/16/21 10:13, Juan Quintela wrote:
>>   multifd_send_terminate_threads(bool error) "error %d"
> 
> Nitpicking: bool is unsigned :)

Eh, while the value is not negative, bool will promote to int in stdarg.

r~

