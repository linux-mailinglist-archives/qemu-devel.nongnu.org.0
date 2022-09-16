Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7EF5BA829
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 10:25:21 +0200 (CEST)
Received: from localhost ([::1]:49798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ6f1-0008EQ-Vm
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 04:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oZ6TZ-0008FA-7h
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 04:13:30 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:44724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oZ6TS-0003bg-NL
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 04:13:27 -0400
Received: by mail-ed1-x52d.google.com with SMTP id x94so13063085ede.11
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 01:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=3gve3CFSfT2s1zNZyYSjBAPOiWtOxtaI1Vra1iwgbQg=;
 b=y7R5+GYGtn+exlZ0gv6Qeiejcp6yqT1x6bOpfHlGE90J2PoxN+LkKw5KTsM8J+iiel
 d+01/wVjRfEGfUK6DlfgBRvcGRcB6hQmnS73XKMKQvfa0VZZgM9DebV9hY+bt6Txnv5X
 Dv8iOz41Vb9XbZtv9HB+/wMJzqFPCKMCxfvMTp4l9nZ8twjLYPg6FNiKd7xxEKHWTkXT
 +sy3CpJyGr+gt5JS7Lh2hVMR3BSilSsuNxJAvsUyQEUPGl0yZTz+YkBabmXIIuWGVZ0B
 3PJ1Fm0/6K1+BGTgaI/y0XGfacmPf/Ab4D7Dbu3fOUUFzjzWgiX1cPnra/No8VfBBJcM
 17kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=3gve3CFSfT2s1zNZyYSjBAPOiWtOxtaI1Vra1iwgbQg=;
 b=BVI2h2N//Zf9+AVgORdqVShMhl9j6j+DW7g7oFYl5UhS/xuMMU1QgpSla47vnmUqqy
 GvadJo3M9VnpsRLd24oKVfAqk894PORDB7QPnmYGF+c2wBpgn11w+A5nbQXHcWNPg9O2
 jLgV5drNKzTdnSULRVArrtrCkR5CLLrCyr7cwyUtUaIOsvYLWFj0hR8fmUA1gEwkzf4a
 9zpjnjQ85q39aInK/31zwLjYo3F/KLOVzceL/a71bhjIEwUS88dUquD7dBPKfvxUdvHN
 NDUsBiur2OMFhPWnNstF9eOu1PZ+yUQZsrO5yLWjtAs9z9jTcUJ0rprTatVgGfWam2s8
 98pA==
X-Gm-Message-State: ACrzQf1EGLnbAOIEvC7AAxVG3Kb+BPW0fzohNYsBW+ySy0j1AELPObaK
 Caj/AzraiZbmPN624iGPe0tNXA==
X-Google-Smtp-Source: AMsMyM5bFXujaqca62vguwTqlC3FMj+yz55qF+VaZCFzOr2ue6m6az2Yy8Jx1hPBzrzKqj20iNkH2A==
X-Received: by 2002:a05:6402:5179:b0:44e:d177:3a21 with SMTP id
 d25-20020a056402517900b0044ed1773a21mr3066618ede.20.1663315996618; 
 Fri, 16 Sep 2022 01:13:16 -0700 (PDT)
Received: from [10.9.7.77] (vpn-konference.ms.mff.cuni.cz. [195.113.20.101])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a170906538400b00780819f9e61sm1155681ejo.131.2022.09.16.01.13.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 01:13:16 -0700 (PDT)
Message-ID: <f1f4688f-4f4c-34ef-8c02-0d01cb811025@linaro.org>
Date: Fri, 16 Sep 2022 10:13:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 2/3] module: add Error arguments to module_load_one and
 module_load_qom_one
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220908183012.17667-1-cfontana@suse.de>
 <20220908183012.17667-3-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220908183012.17667-3-cfontana@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.816,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/8/22 20:30, Claudio Fontana wrote:
> improve error handling during module load, by changing:
> 
> bool module_load_one(const char *prefix, const char *lib_name);
> void module_load_qom_one(const char *type);
> 
> to:
> 
> bool module_load_one(const char *prefix, const char *name, Error **errp);
> bool module_load_qom_one(const char *type, Error **errp);
> 
> module_load_qom_one has been introduced in:
> 
> commit 28457744c345 ("module: qom module support"), which built on top of
> module_load_one, but discarded the bool return value. Restore it.
> 
> Adapt all callers to emit errors, or ignore them, or fail hard,
> as appropriate in each context.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   audio/audio.c         |   9 ++-
>   block.c               |  15 ++++-
>   block/dmg.c           |  18 +++++-
>   hw/core/qdev.c        |  10 ++-
>   include/qemu/module.h |  38 ++++++++++--
>   qom/object.c          |  18 +++++-
>   softmmu/qtest.c       |   6 +-
>   ui/console.c          |  18 +++++-
>   util/module.c         | 140 ++++++++++++++++++++++++------------------
>   9 files changed, 194 insertions(+), 78 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

