Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1D21960E2
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 23:13:03 +0100 (CET)
Received: from localhost ([::1]:47684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHxDq-0004bL-F4
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 18:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49998)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHxCS-0003MX-Ij
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 18:11:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHxCR-0006K4-Ow
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 18:11:36 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:44203)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHxCR-0006JP-Jf
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 18:11:35 -0400
Received: by mail-pf1-x441.google.com with SMTP id b72so5140729pfb.11
 for <qemu-devel@nongnu.org>; Fri, 27 Mar 2020 15:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AhtDuOduRAGUkPFiU2x2IY78T59VTm/qwnkixYsUqxc=;
 b=TAM9mPeMEuMFjmO/dB/mXXEbQf88rPlmXIm8eisi0YgeF2Yxw6wtNy8SjelRHUvlXh
 puFJsaLYfxIRXfUR5CAbchB9Un4caCNydQ0VyqDrR1ZJzMONC4Rw8svNHCLE7vFt9uKH
 Pn0VSV/9LelZNCYT4gk7H8Ok4L9DFuNRH0hJ8qjFsiJRSF8Xkxa692mNyTa/fPkF4mE/
 CPVl+/w1xB2tpo5U00BS/+fKl1DiMEUH8GrhbHGKj8/32LgQsi4VtODzKu47UgAEwzX1
 6chjsjmo7Lx2DZ3gJMoMWBzKDkFQQWdxipIDvZPBYS7M6ju2qMERnC3K+RmPwPyXDlRs
 guEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AhtDuOduRAGUkPFiU2x2IY78T59VTm/qwnkixYsUqxc=;
 b=jazEPinHGqbHRvNwuZwzbkgF8+OmsOMXymWIHQqLKN6plKcHSs6CUSgke2PF7JnSgH
 Amf0WE+mJqC5XdqQ4mEQxJ7tJTN6paJhAE6o56qvKH4I+HDhKsdOvcL7sBej7n5AguAl
 oqFuNG9h5SmIl3PPY9bmVGIFJ61C8v1cU/ZjzVkDdDIHN+w8wltECfITLerLgVN9OuKr
 W+T6wdCCgAxGENam5hOY+bnGR4i84vBE8JdjImnd/EcdIbLmVQ09PUtAeOeeDnZJkFgh
 oVZspsq1hWraE+s2GbAbnEpHJOih3erlAfgfKzoynyoOKWLSWNXdcvQud7VTxVznUTh9
 6eaA==
X-Gm-Message-State: ANhLgQ12CtqnH9o589L6nRf/T6MJUrzLuwBXu3wo6nfGwcIlHaeHP3pu
 lzXGEA5+cwtqSUTCkZkRcuX+Cw==
X-Google-Smtp-Source: ADFU+vsudAHUtlRofXIeyl/3TY7rxcXA8WowoW3xusbsbqd8eesC7hN+YWgqv0X9golCQrL+VJvy0g==
X-Received: by 2002:a63:7517:: with SMTP id q23mr1516469pgc.54.1585347094536; 
 Fri, 27 Mar 2020 15:11:34 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id e7sm4889191pfj.97.2020.03.27.15.11.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2020 15:11:33 -0700 (PDT)
Subject: Re: [PATCH v1 3/7] tests/tcg: remove extraneous pasting macros
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200327094945.23768-1-alex.bennee@linaro.org>
 <20200327094945.23768-4-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cea362ac-6cee-f9f2-c86b-fae66f0ba4e6@linaro.org>
Date: Fri, 27 Mar 2020 15:11:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200327094945.23768-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/27/20 2:49 AM, Alex Bennée wrote:
> We are not using them and they just get in the way.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/x86_64/system/boot.S | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

