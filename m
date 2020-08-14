Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53317244E4F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 20:05:17 +0200 (CEST)
Received: from localhost ([::1]:57834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6e4q-0001iU-Dq
	for lists+qemu-devel@lfdr.de; Fri, 14 Aug 2020 14:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k6e3c-0000Sv-Gb
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 14:04:00 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:37700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k6e3b-0003vH-5Z
 for qemu-devel@nongnu.org; Fri, 14 Aug 2020 14:04:00 -0400
Received: by mail-wr1-x442.google.com with SMTP id y3so9109575wrl.4
 for <qemu-devel@nongnu.org>; Fri, 14 Aug 2020 11:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+80pBPQDiXfAC9dVlzhj/xoqF2WY/PBN7ftRjmVQv5I=;
 b=Bz741luAx6WKUl6E+DPyEFhP/WvAPHjZMdP8gAuoRJkzDERPy6qq7LiHJtO9INruQQ
 YRWt6qN2qFQpka6kCUrcPmZR8zYdsMQD64N/3ep7xoYG6OeKGQAefOPNHq0jrTMgqUdK
 uAOJyOwAMbPk264IoLiugHna/b4UVq94aRl7L/+Jqim6nfQxIZqn/0aKtJkJaYpOtE6n
 EBiyqNZRp2Np+KjO2OgBbgcGhVEXyMzeK/UkEnikVyl7TP8o4x50F5ERsz+lm3RLgete
 343WUblr0zyJZiKeV2dqwglwqtre1Qlf7LyZDPdashXmjDKVMimDkoazOSeXwu51YIYi
 3KeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+80pBPQDiXfAC9dVlzhj/xoqF2WY/PBN7ftRjmVQv5I=;
 b=qWpKGh+dXGw2WfDfhLCPLo+/Kc3ziBBvROdXbsmtuCwfl9KWI0JDpcqub/P/j5L9N8
 iONNNPCKQ6VzkcKqSqTaoyl08Qo4ZziNdcC/RjoNytUZcSg4QTBPNnzUxBiKkAiug1VG
 UJOQf7WeBjEHsTENEESNaFDFO8bOoOc9azxzbeoVbNhm7h2I0b53ykX89xAx2/4RYdeB
 pkiBXTArUVHdMN92m2Y+sHx+JbYpVu3uL2KSXc9FzthUMHx0bwoJtQpLIqCDhxc/KA5f
 luwFVcRZ3lURLlkANOGP/K/GNFfoCzaUrVU14tdKMcPl8aZot/MFiZNNBOmjBWhRUjqF
 QQDg==
X-Gm-Message-State: AOAM531GCI4Rpo6uTQ6jZi53XcdLOO+glyEpx9ZZ5hh0PhES7tUQdELJ
 OoeUOhpmdm39lg8LfUa01aDwAZoMeko=
X-Google-Smtp-Source: ABdhPJwh1shFD9pbD+u9ySYNABjLPXNPqMp75EvfHh2sr2sw1niUBD1OHa499qsU2PwADVsS6DhMEQ==
X-Received: by 2002:adf:b602:: with SMTP id f2mr3567297wre.186.1597428237787; 
 Fri, 14 Aug 2020 11:03:57 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id p14sm18906275wrg.96.2020.08.14.11.03.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2020 11:03:57 -0700 (PDT)
Subject: Re: [PATCH 22/41] can_emu: Delete macros for non-existing typedef
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20200813222625.243136-1-ehabkost@redhat.com>
 <20200813222625.243136-23-ehabkost@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f0e9a90b-76a2-9ee4-d2f3-dcded798f22a@amsat.org>
Date: Fri, 14 Aug 2020 20:03:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200813222625.243136-23-ehabkost@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/14/20 12:26 AM, Eduardo Habkost wrote:
> CanBusClass doesn't exist.  This will break when we automatically
> convert the code to use OBJECT_DEFINE_TYPE().  Delete the macros
> that reference the non-existing typedef.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/net/can_emu.h | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/include/net/can_emu.h b/include/net/can_emu.h
> index fce9770928..7e90fd8a45 100644
> --- a/include/net/can_emu.h
> +++ b/include/net/can_emu.h
> @@ -100,10 +100,6 @@ struct CanBusClientState {
>  };
>  
>  #define TYPE_CAN_BUS "can-bus"
> -#define CAN_BUS_CLASS(klass) \
> -     OBJECT_CLASS_CHECK(CanBusClass, (klass), TYPE_CAN_BUS)
> -#define CAN_BUS_GET_CLASS(obj) \
> -     OBJECT_GET_CLASS(CanBusClass, (obj), TYPE_CAN_BUS)
>  #define CAN_BUS(obj) \
>       OBJECT_CHECK(CanBusState, (obj), TYPE_CAN_BUS)
>  
> 


