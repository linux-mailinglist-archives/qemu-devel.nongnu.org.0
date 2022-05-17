Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4B052AA27
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 20:10:45 +0200 (CEST)
Received: from localhost ([::1]:37140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr1eU-00039O-5k
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 14:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr1cp-0001VD-4Q
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:08:51 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:35439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr1cn-0001mn-Dh
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:08:50 -0400
Received: by mail-pl1-x631.google.com with SMTP id c2so316901plh.2
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 11:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MF2e1oYCwycsLuRmtC8tBFVNlZ1rgTrL4a9VFC+gH/U=;
 b=M26DEQL3BqjHdv3mX4guB4Ct/f6FliIKzhWpUAs5s4x1D4T+U/n13qyv0rS6du9R9L
 8aWAYyBbPNg+ZpQzbf4jO9fAhtnfQcWzJaZEaBcgiC7HxTILZ2XRXfkK4hf5P5sA9rN1
 iVvJGdZDN09BwGb8fBJwD7DFiTtcKp6HoK8UvPiyVNw9tnbBdJm1o5Nf8UcKFhOtFjn8
 +DQlDnOoR6acVhvbrDJxCXfD4RjPKCpzViPfUiEuE/3jpR3DLnW9IkQoMEnNmH+Sdyar
 w2x3q39mQR16XX19qxZB0CUEIUi/vlUVjcWCA2rkwT98piaLwK7eZrxnCNKEJhmhpeIR
 EQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MF2e1oYCwycsLuRmtC8tBFVNlZ1rgTrL4a9VFC+gH/U=;
 b=rmaTvGKBB4Bp0uJ18f3kSolZYZthi0sHpuZrI387p0c2X135wze20+ivjR9m8FmDBF
 m8lOXHch6lVq+hESZl9a3wBipIsOst49xDElTbZcIv2hQ6k0YzTjPDmYnt9E+yhgcI1h
 pKSm+FwGo1qo9uMOw8CM6QF/NyOscFS1OHjKfjfHmyZc+/9A7INh3Dr1NflzOI+Op4a3
 0K8GXmx5L9j0rKK61ryZUrEFUFs8iwtX3PS+Ykja8coZDCAfbuExV2bBOa7i4EsrpSq2
 POdKDNMFnRGOdxv+Inrt17swSxfa7qrvESMSyCyX9cAzXE0PNPP+Iat2DMX3PF0rSo26
 dz3w==
X-Gm-Message-State: AOAM531vvXtKSJObXBJXhx2btaVxQpmsy5AJJJbnKODc2ys5T9PR7gOV
 1VR1gLyfmrNiDTOJjr5CdITOyQ==
X-Google-Smtp-Source: ABdhPJxEvQgixCuzN6FF1OA44UHyZmnAy6bv9Tyvw5hQb33Ly1JV6TgCt65ILKr528CEZ4GCGpFmGw==
X-Received: by 2002:a17:903:2ca:b0:156:f1cc:7cb6 with SMTP id
 s10-20020a17090302ca00b00156f1cc7cb6mr24061012plk.174.1652810928052; 
 Tue, 17 May 2022 11:08:48 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a170902e55000b0015e8d4eb285sm9640968plf.207.2022.05.17.11.08.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 11:08:47 -0700 (PDT)
Message-ID: <8c0d6a6b-daaf-b664-6961-3e19e314ff87@linaro.org>
Date: Tue, 17 May 2022 11:08:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 02/16] build: clean up ninja invocation
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20220517092616.1272238-1-pbonzini@redhat.com>
 <20220517092616.1272238-3-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517092616.1272238-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

On 5/17/22 02:26, Paolo Bonzini wrote:
> Fix an incorrect "@@:" and move "-d keepdepfile" to the NINJAFLAGS variable.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   Makefile | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

