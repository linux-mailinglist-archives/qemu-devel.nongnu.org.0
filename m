Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2876F4A933B
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 06:10:55 +0100 (CET)
Received: from localhost ([::1]:50980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFqs1-0007Hs-Vq
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 00:10:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFqpz-0006Tn-LP
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 00:08:47 -0500
Received: from [2607:f8b0:4864:20::102c] (port=54006
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFqpu-0000pL-Ny
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 00:08:47 -0500
Received: by mail-pj1-x102c.google.com with SMTP id h12so4442613pjq.3
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 21:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6zz1+8A43e1h6Qs+07zxBppMbyJhHdo/NsY/5pVqKR4=;
 b=e1cKW5zUEpcgJ9RHxcpS01mK1A36QVCqz7P5Vs9kCAXOtBkhFAaep43LfFm34MwJR0
 yDtzve2QZsDCaL+NS1+yE7T+JScIKVHLoOnzxcvvyBaOokrQbVuV6XOuVhqTlnUnYV7a
 OjV3Xyn30p7d3MSvBolgUNSJvMxR77hbikeZSArmn/jDB2Byh+FthD2665HgxqqaMj0V
 uVp6drVIDajsXfwRebxHAucmM7/Y/dGITbnTROb3sik2UL1+R4hLob9RpAzkBclFnyt0
 SerU/0qeiGPbR/VoeaTbvbxREQfQlLjpsQ80ZLdpYJ3GAFFkMcX49fVyeVJ7OU9V5rJL
 0zYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6zz1+8A43e1h6Qs+07zxBppMbyJhHdo/NsY/5pVqKR4=;
 b=T0QKydTUnhqv2kZSJhj/0LPbbjayhBxfZFxYQ53iwBTMrtwWT/+x2W1A0oeOctrrI0
 /XAkin7vZNdcv7uFcxvl8M4KfPPcrnrNsDEj+uJG7f2IKmgz/l3l1uT1aYOa/lbsg44o
 dzm3vcBAaS5cjrVpM7CASSr5tKWS7QHdd2namn4FDLlmPzUs/RhPvPuaAeROu2cpHkzu
 0IiKSdii34u3CLFjCZ72KlHbryBYAHNYVYQ4SsDArnKfZtY02+eU2MisK7nMBqI8+wsy
 8xoix5QluQZsdCifj9NJic6bU2PptWoB1MJQ71VehrhN/k2Bq/TbfpGKaY7+AeiOilzh
 xzhw==
X-Gm-Message-State: AOAM533hCLy4vLVAE4R7Bv+tdtyy1hR7iks2JhjULaTXCIZQkUkZ8ZCf
 gK2dlvAtBlsQswW9778L9Ps=
X-Google-Smtp-Source: ABdhPJzKrfLPGMOMeBF6I6FZEEHHgdmWHdo0VCtL08FxY7Ga2TwzUbVH57aI8kzVtMod8QaulAneLA==
X-Received: by 2002:a17:90a:741:: with SMTP id
 s1mr1264955pje.161.1643951319676; 
 Thu, 03 Feb 2022 21:08:39 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id l8sm747770pfc.187.2022.02.03.21.08.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 21:08:39 -0800 (PST)
Message-ID: <fabd921e-6445-d5c0-3482-4c81db8085d6@amsat.org>
Date: Fri, 4 Feb 2022 06:08:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 11/27] meson: define qemu_cflags/qemu_ldflags
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com
References: <20220203173359.292068-1-pbonzini@redhat.com>
 <20220203173359.292068-12-pbonzini@redhat.com>
In-Reply-To: <20220203173359.292068-12-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 3/2/22 18:33, Paolo Bonzini wrote:
> Prepare for moving more compiler tests to Meson.  If the full set
> of compiler flags is needed in a cc.compiles/cc.links test, it will
> be handy to have a variable analogous to QEMU_CFLAGS.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   meson.build | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

