Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2907C4D782B
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Mar 2022 21:21:27 +0100 (CET)
Received: from localhost ([::1]:45032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTUiT-00046r-QZ
	for lists+qemu-devel@lfdr.de; Sun, 13 Mar 2022 16:21:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTUh6-0003OJ-SB
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 16:20:00 -0400
Received: from [2607:f8b0:4864:20::433] (port=33295
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTUh5-0002Im-DY
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 16:20:00 -0400
Received: by mail-pf1-x433.google.com with SMTP id s42so12569754pfg.0
 for <qemu-devel@nongnu.org>; Sun, 13 Mar 2022 13:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=C4zw8O51UZ+SbP7OlGrSn4pAiNhhd9TFG5m/m0/zj0k=;
 b=vy+/Nlpt+wsAIkfQ1XfXlO9zb86NMFhO6nCM7AoCnuUq2qVveGb3y5Uj0Cim7oxdXI
 WUwCUTyQOvM7pEbrfw4MW6rMCSjfIuFLX2z18c38SbbZ9ea1YjwDl2NLUxtN73vnGmph
 qfgGCahw2lZpwCJcKjkHAIYt43T7o5Kbdjc2E9mkbsIe1WELCS2kNeDGd4PJjNb7/HZH
 KCjpqvIMlkM9jYxDKFhWPjNEo8OB4aLAl7ckUSFqrW1KEibg60peMcV17Pwl92Fyk6Iz
 cGwZz5w00bW5NoS5Cjz5oT8iO+x6jo3KwT61kEmCLSx2ycYNJWzPry+6+LkJhQZW9RpZ
 5MhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C4zw8O51UZ+SbP7OlGrSn4pAiNhhd9TFG5m/m0/zj0k=;
 b=vL0AGDGvqvopiDcfTV2JpiBuzoWw9eNi5VBDXrzS63ASxLVhg//RATG/1l3CJ5CrSn
 Adw7spCzZ/gLo4ugAOxCGHjqq4RovAOoLque/XuOoP0iBDLAIT4Z12KfAZ5HYg8CnTwu
 x3aJ1UKu1Ehi66mA7F1FXeTQeAkQqflwRHyr5NIEh9juq7y2mBR1fmOXDkp1our9Vkg/
 rCBPzUMP2GD31c+EALMivRiPvTH5QIgbfX/YuCLwp8Xe0UD9nIsRkmrrulBNEVZzqpsh
 nvRPz6pQj5puGiGyVpUkb9YXhElp88OePyS94CmAOWBc38Zd8o3txbfcTDipAJo08x5l
 QNeQ==
X-Gm-Message-State: AOAM531fZYrGLuupQ684tn7hzFJcURBJhczPlQksazmYvRfBOx5qUf4B
 8rGmnM7MUhchP+pX2SpSQwpBdQ==
X-Google-Smtp-Source: ABdhPJxRoaUGoiP7ljxao9cboHfNbw168h3K37dWFKOiht2CtwT59beDbuS2H37js66E1bHHFsMzOQ==
X-Received: by 2002:a63:6bc8:0:b0:380:4fc1:f1ef with SMTP id
 g191-20020a636bc8000000b003804fc1f1efmr17617449pgc.451.1647202797744; 
 Sun, 13 Mar 2022 13:19:57 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 16-20020a056a00073000b004dfe2217090sm17718354pfm.200.2022.03.13.13.19.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Mar 2022 13:19:57 -0700 (PDT)
Message-ID: <d8e85004-de8d-fe7f-6bd3-a86ea5bb8e6a@linaro.org>
Date: Sun, 13 Mar 2022 13:19:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Question about atomics
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>
References: <CANCZdfpJVWFjrQDiYJy8xiw-THF8_3GNcu=0Pmbvp_6zAJbfHA@mail.gmail.com>
 <5bb620d4-96f0-cf7f-5530-af529a32c78d@linaro.org>
 <CANCZdfqwA8HbxYhud8pKxF_f=BMoMtrO+R=zg7GiKesz8_YZvg@mail.gmail.com>
 <e60a4298-17f3-d3e7-bf94-bf2dbbe83141@redhat.com>
 <CANCZdfqDSNhQYnb1PWi-753cJ4FvO-JBFmTW_mAAdezOQSDF1g@mail.gmail.com>
 <CANCZdfp61n8M8Qc9szvfqYcHnqnUADpkPmL9QHW0uDKDffJ2NA@mail.gmail.com>
 <da134ea5-ffe9-d544-62b4-1914aad15ab5@linaro.org>
 <CANCZdfoC8ArxyvD3PpBWiYdqONR32oeqioqk42CeoMeKRgecZQ@mail.gmail.com>
 <45371f77-cae6-bf96-802d-6a3e70d5e334@linaro.org>
 <CANCZdfrMaDY=0u-HAB9GY69NUTHES30V_agvZhCw3Gnr6aOomw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CANCZdfrMaDY=0u-HAB9GY69NUTHES30V_agvZhCw3Gnr6aOomw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/22 11:29, Warner Losh wrote:
> So I was assuming that the cas instructions for arm use start/end_exclsive under the covers.
> Is that the case?

Nope.  The store exclusive guest insn is implemented with a host cmpxchg.

Oh, I'd forgotten about the old arm cmpxchg64 syscall, which is still implemented with 
start/end_exclusive.  That should get fixed...


r~

