Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F10484E5883
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 19:36:41 +0100 (CET)
Received: from localhost ([::1]:45490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX5qb-0005Yh-2Q
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 14:36:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX5m3-0000tH-Cs
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:32:00 -0400
Received: from [2607:f8b0:4864:20::1029] (port=46757
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX5ly-0003zZ-R5
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 14:31:59 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 bx24-20020a17090af49800b001c6872a9e4eso2684590pjb.5
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 11:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eEzIKaC43fMLDfhmRqwIQWG1WCohVC0yvcmARYrVDMQ=;
 b=ciHDSpUASKVJTbqNOe9AW9y/QufjzCaduEQrTEOdxSxiy52OMJekwgIf7UErCycJzf
 EPA5Ou1ouIIEQ05scxXpyXvyVGqZWPQHIHqZA1hjaBOnqN1mVqZ2MfxHhPXpAZgciQ2M
 tNMz1P2SHD0bpvWV4sw5xl7PaXiMo53Kxpx12jF7I5cFqxmQQjJeVsF6z0N/tYW/tis+
 sOiGNxVHDT9WuKjoCfxsErE3i+Ok8fiDZHKcaR0ZsySiuq1vcgYSHEnsR9Ar6YM2+UCn
 Rgc+nOQ697SEGvtql2iplS5Nl2qNFSFRLDyvZ/gavKMur70cKj455DVuQykZdmVoc6Ke
 50oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eEzIKaC43fMLDfhmRqwIQWG1WCohVC0yvcmARYrVDMQ=;
 b=yxw+pKs4anqqoNHIFDpwEcPZVw6R2T0oazyh0ZKicd7n0jgsPt1g2UN9kISYBQv7HM
 4p177tv432OPNRIRWMznbFG35l3C1W3JnBIEgSGL2orpQQ21WZIiPivSvw8ZFEoV/krC
 g1+ix3/GItNJ7wq9gHWDa7/AG8bpLqpbSxHrkSFaOyrQdtTYYnI3LczrV8LhznzCNVYt
 TX9YGKCqCJU3MO9RI8YwVUE/DpY456PLvv4Z6+1dhBeXHJojA7fGaY9ukz/SjFPmOsvI
 myVhSA2kSbNhN9IOdSAIxCLSXaxuRHkULm9PpfepeTgLcQ3uX/fwgfyEc/sIzTVtWRjv
 cM8Q==
X-Gm-Message-State: AOAM531kjZCkLAoVT8sVo/hj1VnjHENXVu4/SD4PfILisHS6VDtLq8ab
 Lbet0U4l6CRL2a/5PuLhX2J3vA==
X-Google-Smtp-Source: ABdhPJxfrA3bfTtMgoWjJR3DAQEkHgj3bhn/MIKPjml1X8PAvFf7buwsz5AMhQE78ctl/n/xgu4Pwg==
X-Received: by 2002:a17:90a:ba10:b0:1bf:6900:2c5d with SMTP id
 s16-20020a17090aba1000b001bf69002c5dmr13504256pjr.36.1648060313355; 
 Wed, 23 Mar 2022 11:31:53 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a17090a4f0b00b001c6e4898a36sm6995073pjh.28.2022.03.23.11.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 11:31:52 -0700 (PDT)
Message-ID: <bb47ac2f-33c2-73fc-1c91-b61531134325@linaro.org>
Date: Wed, 23 Mar 2022 11:31:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 26/32] include: move os_*() to os-foo.h
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-27-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220323155743.1585078-27-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/22 08:57, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> For consistency with other os_ functions that do not have POSIX
> implementation, declare an inline function for the stub in os-win32.h.
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   include/qemu-common.h     | 4 ----
>   include/sysemu/os-posix.h | 2 ++
>   include/sysemu/os-win32.h | 4 +++-
>   os-win32.c                | 9 ---------
>   4 files changed, 5 insertions(+), 14 deletions(-)

This does two things, and should be split.

r~

