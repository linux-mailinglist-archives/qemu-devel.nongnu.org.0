Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A439251994
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 15:28:21 +0200 (CEST)
Received: from localhost ([::1]:49196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAYzr-0002ky-V5
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 09:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAYye-0002JV-Ni
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 09:27:04 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:44301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAYyI-0004fG-7u
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 09:27:04 -0400
Received: by mail-pf1-x441.google.com with SMTP id p11so4173589pfn.11
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 06:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=gpIojt6malPNe1yOMlBnEEfYMoed9AVAUIL2QUF9q1w=;
 b=m6w5Ry01c+vxwlu5CYZCFHsvzRrAb1eSyBxMtnIoCNzUyaZ2vzhpchdKuuorzX4uzW
 Wch4/Jr1TFtJ+1BbMoWAp7OTTpMmwZwwFt2X5ae6radrDsqXZDtMcdyDwvPwTcOQ54Rn
 jsj4POFaAVpDpXKSPspb7yCt0Xdepwbi4D1CuRnHcrEgR0kMyerpqTGSgA6XeDDZcDKN
 /Su4dv0V7Kv+ewaWsL2YvyZFljYB3OGP5+bD5bcFqwiDSpUPdUsF4ARuAWcxa/UQziM1
 bfpxctKFFSnUCOLf8FUq9a6U6PmdcqytJV4M5njWc+izvgxWIueWdkd3wVjBkwB7uEFC
 zlzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gpIojt6malPNe1yOMlBnEEfYMoed9AVAUIL2QUF9q1w=;
 b=dN824E3jszPzE2lIxjjRW9pMqjyBwWAVJvQeHQ0pAmF6Gdzliq6CISgCuzWMNPo817
 R0EdKBVUyEc0zWARHSVkLsDyyuaU2kGwJ1EZYaK5fLrPpUl7qBdg5v3iXd01R8QfY7sZ
 QHfHP1TyFoZAG3bTLwDatPpHeHTs22HUaG737KbF3gBd1/PhGHQOSx4Yna2b56GVnc23
 b4w2hJ8ottdKiHWVNlZKkAc4KTPLo9BehVp6FbIP26oziMKjK9/8TZGPtWMi9YQVga5g
 rKpnhSPbDTUJIEBUKAgsrFY+5+XO3tex9IlH6dla4DUYBAWjhPf2kYiiq2uimJ2ML7Yz
 JASA==
X-Gm-Message-State: AOAM532JSCpI9C3WbkD2y2Gha67USc9Hbx5Uwn0fri+1Zf+qu9FQF2A2
 F8wTvPbRrOKQQYXfYbSgw+xaftDVQyDJ0Q==
X-Google-Smtp-Source: ABdhPJw2TZZpENXOrKYi95DbQK229BkE/NM0GnBuXzJlBGFSBoFVAs9QDqPgQ5U4FLhCysbArVZMdQ==
X-Received: by 2002:a62:1803:: with SMTP id 3mr8313904pfy.198.1598361996358;
 Tue, 25 Aug 2020 06:26:36 -0700 (PDT)
Received: from [192.168.81.79]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id u3sm2751015pjn.29.2020.08.25.06.26.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 06:26:35 -0700 (PDT)
Subject: Re: [PATCH] meson: set colorout to auto
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20200825064342.2037-1-kraxel@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8cdf13b9-49c4-f12c-c67e-6e03e8e802b7@linaro.org>
Date: Tue, 25 Aug 2020 06:26:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200825064342.2037-1-kraxel@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.602,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/20 11:43 PM, Gerd Hoffmann wrote:
> Dunno why the default is set to "always".  IMHO it should be "auto",
> i.e. only colorize in case stdout goes to a terminal.  Cluttering
> logfiles and confusing compiler message parsers with terminal control
> sequences is not nice ...
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  meson.build | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Yes please.  All the color escape codes has broken emacs make next-error.

Although applying this doesn't seem to have helped...


r~

