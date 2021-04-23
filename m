Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 035AF369D14
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:04:21 +0200 (CEST)
Received: from localhost ([::1]:45372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la4qS-0008Lm-1M
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4p3-0007u5-KT
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:02:53 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:37843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4p0-0003rf-M8
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:02:53 -0400
Received: by mail-pg1-x52e.google.com with SMTP id p2so20715061pgh.4
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 16:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yPEP9WrOmua4zNLym4CElDsb4jnFj5RG20i05uMDoQs=;
 b=FDvTZnfmKPzMQUyyzSI/d75PXwME6lJSquTavcWXBd+x5TnbL1RNwuyBppB6UvqRf6
 B+qboQ/m7wr6eHSaNam0jNWBnReCrHBCj56DqtNm2qVO3wVzoygfkfMIaK9Aph4fPcKh
 oXiPVvtXMHd0qnVXzPkN6969arxRTfHlv3y50XVoqM+R48kNVUp/UH6tOua1JkOHvsYB
 q1UvQIEdfjQVuRZr1iIEOWell7Eg3uf65PHOcl+MP1LdEavoesUynxK7AH2iAKP+0FSw
 b8Lz/m0BIUUURrdqwMYrtmC3i1LHmpQN+G5W39M/Z+I+e7bJj5JcpVt27elNaPISFHYm
 N2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yPEP9WrOmua4zNLym4CElDsb4jnFj5RG20i05uMDoQs=;
 b=edvdGijAHgOiGrWbKaLXx+VeSV99n+EDMHPT78cPeGko6Gw3rCAqKGLzrr2iTQJqs+
 pMSCrWFsd+SywqAmo3jfC3CeQH9PnVYIJBx6n04EIWdsZUw9lwq8DoMXDpgeu1nmVTEk
 68u36Ej0kLhxpbpN9Qo65sPosUVwjqlo3bG5m4k2MHLWVeOsRULgHmzbGgPpU2/yA2wN
 vML1Ge29IOHlD/nyntJDsz9lunVLwYkCPJ+zALoAdgyDQWP82MZqC12M6X4X4uZ7dsHT
 EjVUUEgmQN5QkFkUQIe0M836wGHebtaMPHCeV+igQkHPe19NrwS5P9I6eO7gaA9iPphz
 9qeg==
X-Gm-Message-State: AOAM533p6WhRqSjVvStHxVgVlgYZ7KMiiRK8tiFQHfpoemmLJ9hvptYa
 bJehHKYH/JhPsrDUPMF1sU/wHA==
X-Google-Smtp-Source: ABdhPJy50C4If0DZT1Sg3n9++FK2rPu+IkFumbryfYgkfubDCxNQVZiJRPwRkL9ufAB8dh/bMie2Zw==
X-Received: by 2002:a63:500a:: with SMTP id e10mr6025120pgb.242.1619218969316; 
 Fri, 23 Apr 2021 16:02:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id m2sm5725086pgv.87.2021.04.23.16.02.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 16:02:49 -0700 (PDT)
Subject: Re: [PULL 01/24] bsd-user: whitespace changes
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210423203935.78225-1-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9d563496-2f17-718b-ca00-f1b65e9da86a@linaro.org>
Date: Fri, 23 Apr 2021 16:02:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210423203935.78225-1-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 1:39 PM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> keyword space paren, no space before ( in function calls, spaces around
> operators.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/bsdload.c | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

