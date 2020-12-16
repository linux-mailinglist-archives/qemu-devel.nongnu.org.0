Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 821312DC77B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 21:02:25 +0100 (CET)
Received: from localhost ([::1]:60366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpd0C-0005fS-Jd
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 15:02:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcuq-0000yy-6K
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:56:52 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:43506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpcun-0005En-Mn
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:56:50 -0500
Received: by mail-oi1-x232.google.com with SMTP id q25so29028388oij.10
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 11:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VtpvsQTjHOKmC4FXabqwb7GVc6gnJrjuSnjvqXC+r4A=;
 b=BWU1qMU1Jkw6rGen4JzO4tGtHR3uE0Y77bGQ90dlla+vK5ncthR3fnpJSfA2OZ9Jda
 SIKpEmTaR1EJ7lknBtGliEdDmuCs+c3YOcMfPoZp3yk+Q5Xe4f8ijb3Uv5K4u97Rt4OC
 DlpRoc3/ZSpV7oab2Y4P+J9ddecdJrJaLMYyaCfdK2WyX7VgcRV9aIWx2Gle21wm3wdR
 vtZ8XB0OYtgqbFLhD17vf+wiqkNH8OKWDXIFy/fkQqcIEWdsXJocStWOYdHKBrQN5p8K
 ZjODLeMNKHIvIWc4Zm/THWMkmO4f5GEJKLaKt/1jdjBWOmPBKnktYGk5fj58XI6jaIpS
 phoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VtpvsQTjHOKmC4FXabqwb7GVc6gnJrjuSnjvqXC+r4A=;
 b=mwSRDFWNA3niEWyQwKzxNI91yA4J1qNXg9DKHQ434UK5KZgkQvpDx0NggR4OE6dlSf
 GnHpp8vdRp8Od9K+aOsvBPhPf6BUFc6yKAaZ7V8Ywv9M1WN2XVaoBGZzdB5qJd9RfVFi
 38IE3t6E1sQnJpK7B9ErKJ5NSfooLDNqhFJwyYjwtxcbphJK1fNSCLVk7YSnOabelxUd
 iNOVqDblf74ZBQP9C9/qAUpv8i2p9hDWw/fIGInNpUddDntbfzmk56ZaQNJoZwfJ7oxh
 3eVfO0Z0fVdVd+HoinJfrGJqjf4KvdjWCh3kLu/UCfI51ua6IsI3gsTP6HQJ1rTAf3xU
 qQzg==
X-Gm-Message-State: AOAM531NKVtTR83eK/S+qFsrxBpqwgER8fyk4bQrJd351FD8HNLpCbS/
 DB8043IdUbuDmjnuRpF3qXEqPQ==
X-Google-Smtp-Source: ABdhPJwdKtfPy8xdRen3NnOhB5TX6e5UXKhHeW3/rJ3ZVMBPiAHDrbHuv3gEZdhjz64XRSQmL8wn0w==
X-Received: by 2002:a54:400e:: with SMTP id x14mr2924631oie.21.1608148608603; 
 Wed, 16 Dec 2020 11:56:48 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id r4sm702639ooa.29.2020.12.16.11.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 11:56:47 -0800 (PST)
Subject: Re: [PATCH v1 5/6] gdbstub: drop gdbserver_cleanup in favour of
 gdb_exit
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201214153012.12723-1-alex.bennee@linaro.org>
 <20201214153012.12723-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <58a95756-411d-7cde-28a6-8aebfce44efe@linaro.org>
Date: Wed, 16 Dec 2020 13:56:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201214153012.12723-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 9:30 AM, Alex Bennée wrote:
> Despite it's name it didn't actually clean-up so let us document
> gdb_exit() better and use that.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/exec/gdbstub.h | 14 +++++++++++---
>  gdbstub.c              |  7 -------
>  softmmu/vl.c           |  2 +-
>  3 files changed, 12 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

