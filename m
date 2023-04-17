Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1401B6E47B9
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 14:30:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poNyd-0007mP-Ce; Mon, 17 Apr 2023 08:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1poNyb-0007mF-Ct
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 08:28:57 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1poNyZ-0005QH-8E
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 08:28:56 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2fa47de5b04so732802f8f.1
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 05:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681734533; x=1684326533;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EHlangfw+7m1YCMw8lZV9CNZHwQKHUWeJfkJFI19eOg=;
 b=bYg3qN6rK63/iJpugod5x88LFcz1ySMUUCQvLKN8kkAOJQfnJN+YlMvQnvFOStsAh6
 BjYH7KdED5M8d0IuoHaV/lK/N4fpjAIAylJ9HBBBLx824IF7/Y1MYngc6q0UJByU1Y8r
 Uy2/4QynzcQfW7tPQpQVwhDEstIAVTaN2cwo3HT8I5kxOVpsfGNBfApxzR/rkvqhc/cT
 s5AElOg4n4GJGRPIHK0RdoejuNQOcJUOSEXsE0bvLOrGL/2n82ceKv6+z7keZkcY76WS
 Xeq6yWo1ZJL05Cz8FwzIShenJKvi0sTHeAGK9HozDDLT5QsIgvegW8tNtkFIgcCBCjf7
 V39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681734533; x=1684326533;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EHlangfw+7m1YCMw8lZV9CNZHwQKHUWeJfkJFI19eOg=;
 b=O0RLo8C7e/HLN1gpUouCH7kAgBrijRUtlXps8kaAS8J9GKndnDu0MWuZRA2mYqhtNK
 H5Uh5LLM3RfBknk+0SB0vtHXXqXKEAYdegL+a4mFK7pO36TorjUp5CLZT/XJHY7pvzY8
 HRjSxWkr+8CvV2eRSL2AZsPKRvxymq6k1R34cBVNJKFhLvhjaNenvGQejeU+W67fqVCe
 1qQvXzLGB5lD7K1lGFd9xnYGTILtqtgH0woI9Ed3zesT30HjA7sBSBaYOYHYHqLCurmX
 evCJpK57pUB+c4VuSyqnDOY5Fl+BuCXlBkE34hMcEMTDForKJpCsbstn18VPTehHazW/
 y00A==
X-Gm-Message-State: AAQBX9c6rfMAjO3sECsYb7054tN5KddMX1M/FXbjZEqWQCZbgooVgsxw
 qITAcU+p/sX/7fahBgD5a5U=
X-Google-Smtp-Source: AKy350abVnY/wIAxkqlJo9mt+LIZ2kcEVzwVNhlLPlEpeUu8gGoZ0KZlxQblQ+9TrYZpypLwud6o1Q==
X-Received: by 2002:a5d:6e01:0:b0:2ef:a57e:bb9a with SMTP id
 h1-20020a5d6e01000000b002efa57ebb9amr5522963wrz.6.1681734533109; 
 Mon, 17 Apr 2023 05:28:53 -0700 (PDT)
Received: from [192.168.0.165] (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a7bc34a000000b003eeb1d6a470sm11782134wmj.13.2023.04.17.05.28.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 05:28:52 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <95698d88-85ba-0072-f23e-91e8b686dc52@xen.org>
Date: Mon, 17 Apr 2023 13:28:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/5] hw/xen: Fix memory leak in libxenstore_open() for Xen
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: no Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, xen-devel@lists.xenproject.org
References: <20230412185102.441523-1-dwmw2@infradead.org>
 <20230412185102.441523-3-dwmw2@infradead.org>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20230412185102.441523-3-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.284, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/04/2023 19:50, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> There was a superfluous allocation of the XS handle, leading to it
> being leaked on both the error path and the success path (where it gets
> allocated again).
> 
> Spotted by Coverity (CID 1508098).
> 
> Fixes: ba2a92db1ff6 ("hw/xen: Add xenstore operations to allow redirection to internal emulation")
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Paul Durrant <paul@xen.org>


