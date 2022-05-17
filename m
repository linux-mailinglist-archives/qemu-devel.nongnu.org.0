Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F1952991F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 07:45:15 +0200 (CEST)
Received: from localhost ([::1]:34846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqq1B-00065e-S7
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 01:45:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqptM-00052F-6u
 for qemu-devel@nongnu.org; Tue, 17 May 2022 01:37:08 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:44570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqptK-000636-Np
 for qemu-devel@nongnu.org; Tue, 17 May 2022 01:37:07 -0400
Received: by mail-pg1-x530.google.com with SMTP id v10so16009193pgl.11
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 22:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NICvNK+n90/KPpa++3tv62HR8cHZ4zYW+NC7NqPzw8M=;
 b=XWl+3q9BIxOWE6fNeAEFf0GWaJzdkKtdk4Hnz4qi4I2myvuD09Sg719rfmSmSGAvng
 BkA0W/ZBHaWeBnKBMnEDAPO/6N3zEmx8QEj9/BkvhPwexlqCoOC6Wk0Ma0W7O/95JMby
 7+70Brv/aRJ8ZBYqsphGfj3N555HdQyq7cYibFUaQ2895+C2Fg7nxdmezcvyblkLpfDj
 xjnDsM3CPkffg36NMsgP0eSxN78RIu4KvZCEmgDdYaERQVH0d5R6rpIyXdlxvPP01jv7
 T/QOYioIxNeTxpYbb685W5JsUa+KIPP9OBuBsRsTgYvEvarAgHMXp+TphO+9bJhtz4hR
 muCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NICvNK+n90/KPpa++3tv62HR8cHZ4zYW+NC7NqPzw8M=;
 b=TAWEwmQSVFkoOcpidzuvyOzmgqcHtmxXczPx60fOkssUMXUnN+VRZJtBZba6ZsI23B
 gYJmJJa8mmNWeyMtYZhWbN8BnRSkinbzU6g7RPpo89RSVMPIOmrobxoNFszulfUjHhXO
 YE/1bIQ5elDEmK5HrAIRWvd5G56mFC4lXvOTsaJKXR1J9d0yV0CHDyWfzVP0b/fbPYhR
 NzZK0v6TZGYf468evTNiye2JD9D3tGeFE1rPKJoGIL4DsavkVcIdwZ6YCbOibTLXWmpB
 5jcjCun7Y8/XF7MFIOXboNr5EMI53hpQdxB9MIZEvaiU0hXKTOaBKVwMZkH+AN11f6qN
 WyjQ==
X-Gm-Message-State: AOAM532GdGNxcxKnd086U5+zLoda1bvj2rLVb8ij9p0AwvqZ3W1ghv1m
 43K/VxYIiocGDowdiqXIexTujw==
X-Google-Smtp-Source: ABdhPJz3Y/lRo5YBJWe+60x5aY6iIc0DlF/+N1GWzyjy02Fx+qhY9d4T49oGNyIyHoa4ynK0iNgtEw==
X-Received: by 2002:a63:3d5:0:b0:3c5:74b3:6988 with SMTP id
 204-20020a6303d5000000b003c574b36988mr18534108pgd.234.1652765825253; 
 Mon, 16 May 2022 22:37:05 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a62ee09000000b0050dc76281c3sm7775588pfi.157.2022.05.16.22.37.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 22:37:04 -0700 (PDT)
Message-ID: <944175f6-2874-6e4e-d63a-cdd3eb549bd6@linaro.org>
Date: Mon, 16 May 2022 22:37:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/3] tests/vm: Add capstone to the NetBSD and OpenBSD VMs
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220516145823.148450-1-thuth@redhat.com>
 <20220516145823.148450-2-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220516145823.148450-2-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/16/22 07:58, Thomas Huth wrote:
> The Capstone library that is shipped with NetBSD and OpenBSD works
> fine when compiling QEMU, so let's enable this in our build-test
> VMs to get a little bit more build-test coverage.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

