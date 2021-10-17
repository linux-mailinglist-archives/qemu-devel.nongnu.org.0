Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8668430A96
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Oct 2021 18:21:43 +0200 (CEST)
Received: from localhost ([::1]:60432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mc8ur-000519-DS
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 12:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mc8tF-0004En-US
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 12:20:01 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mc8tE-0004Yj-BY
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 12:20:01 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 z77-20020a1c7e50000000b0030db7b70b6bso7971683wmc.1
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 09:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iI5imLQZmdrZlXgYd1RRVSMeEVLBAVTMSPAB/XpC99I=;
 b=VuIxlxc5v981TyxXz5/Yz+v0kN3RVLBXq1NKSlRI8s/vwOwrIdQ6jI5RAHJtTBFKqK
 5zD4uJwD9SzB9nX8vAgl3yJTrCwiEJvujfR6JJJBIZQXDw/JNeqVP56x1I3TFcFkfZiQ
 qrpzd18kr5ilxUhIlbk4mVDm/FGMDRqbKu/ouySgIgm4WsR70Y76BukRoUVwNb3L2E5w
 jZI1Xpi58YiKlNkt0iCo9gp5fK2WhDO380ZyEWYxIIbsAJ1Ice+TQDR6l0ro2+VOhjuO
 cEhHasoztnrdmUzYQPWg+UjxroYEnWH4mSWsnHfYqdCMmORQ7aXA2rhM+LGcwOGN0Me/
 ERXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iI5imLQZmdrZlXgYd1RRVSMeEVLBAVTMSPAB/XpC99I=;
 b=CvsBK3frwR1sITC82oEOO+Dhju9UaXq2Dj+GsBzt9YhQukmIka92t+VbkYMI9UhXGK
 VE4AkrJbK2wcLmWrGsSP23aEUEdqfUG0F1IAGlgJnY0V2LnrAxG7zRWW43eOStfWj39w
 r/V+n0jL2HaRKwerB6MJMgMCNOI3p+QhHpOh2AlMhxzYx+8iOJNTWXiUcv8JotSh5hA5
 dybfzKtIDZl9hr8bobOm4Z8pQmW/PPsduS2yA+sDk0SteTK/BJ/STI78xsvLE2sBsVP0
 qyNdWyHd2AKJrnBhzmw2dn6iPhSBgTS7TgNWAup/+hHklLMxm11y7ZYnfTfcLzdhyfq6
 4eqQ==
X-Gm-Message-State: AOAM531+5AFK1W+YZiqqY/b8JjR3RAE5g8ROtFqs8rISu84ZVrfC+ndW
 XGkKvl7JeEEq/urMnqZhjrU=
X-Google-Smtp-Source: ABdhPJy5wtYWdjjqDx41fv1UtUNWdB88KhLP6QF2rkiDGNCMK//VMXZEJWxUyDqu3qtWIhWsuWZwwg==
X-Received: by 2002:a05:600c:350f:: with SMTP id
 h15mr25551455wmq.62.1634487598344; 
 Sun, 17 Oct 2021 09:19:58 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id u14sm5630270wrw.91.2021.10.17.09.19.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Oct 2021 09:19:57 -0700 (PDT)
Message-ID: <fa5e999d-bb0a-5a59-dbb7-f43d17dd42cf@amsat.org>
Date: Sun, 17 Oct 2021 18:19:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] via-ide: Set user_creatable to false
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1634259980.git.balaton@eik.bme.hu>
 <20211015092159.3E863748F57@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211015092159.3E863748F57@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 11:16, BALATON Zoltan wrote:
> This model only works as a function of the via superio chip not as a
> standalone PCI device.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
> This should be before the last patch changing via-ide or squshed into
> it. And similar to usb part but there I need to add it to the info
> struct. I can resend with these if you think this series worth the
> hassle. The previous one fixing the usb irq works without this clean up.
> 
>  hw/ide/via.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

