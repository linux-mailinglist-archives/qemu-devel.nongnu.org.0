Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD79581598
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 16:42:55 +0200 (CEST)
Received: from localhost ([::1]:46484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGLlu-0000L7-Ru
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 10:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oGLgG-0001Vr-2j
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 10:37:08 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:46804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oGLgC-0006GH-56
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 10:37:02 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 q7-20020a17090a7a8700b001f300db8677so594953pjf.5
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 07:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=etSJ14S+r2iUwB5YEmNbmz7r17IhRCCCeObfj4v0f60=;
 b=S0t9xoeeE2fvkZwL7OCO50Xq1a+8AqFAlydDQo4C6Hvf6BiROxu4T2WnJ/Hp80/IJ5
 VbcA9CldCGNUCiKlNOgdsT+rBinMoi7Mc/Jnu3A75AvPJ2jT21zp839Hp6sAnlPEHRjV
 vVyyni5II7E8poyip3Xcl68CjRPfstcmSJVacMCxuSiRSNjgjSbdfU+OYvyPxOfvi9KQ
 oiy0BSmhlGTB+GHTu+LTquLZwei5enHzx3pl4Pway/SMVAShcLAg3uc/OIF9zJJzGn36
 tbMhLjHFSxdYETGEvaUrNz1MnxFdE0FMtP4nEvzXMDS+DBg73BnTEZtD6qG5Mt9cdaDs
 wvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=etSJ14S+r2iUwB5YEmNbmz7r17IhRCCCeObfj4v0f60=;
 b=3kKSEak5beuiWBZYr2CcKs+Buxqq9bhh9+an3ozM3I6otHcZEs/Ak6D/CBvS9JzhqZ
 Dl3KrD4K04w87Eo4XjVfCjK2MbhKzQ+pCMa00d6OHIewINxT4euFBO8KXpsqNVMVzWQq
 z6Q7vapo6W+fOcBAdGRbABO0uIzSZDegb+L77aI06qxcihMeKna+smMV6ACG7c0q4wMI
 WINQAJ51XQpK9MRmHJfHv5wMYdDDYw03jcNYd+xwI4ophsTFGdtKIGEVtuK8pFWt9Uxd
 aMQi2jiVPi0YNcXDBkA3TzBtJsQVswsu0uOOXlWSZ+OGRWhyKoaDOzUeT8x+KIk4ug9K
 MIkQ==
X-Gm-Message-State: AJIora+IgBPgKUYdDceCt8mgzyxCNjhzbaNEERU7EmlV20U1wNzO4GUk
 ohGNqdBX/arpfXvmwqa3Nxo=
X-Google-Smtp-Source: AGRyM1tIEjUg8L+D7fz+NIp5PEyWAUObXgXOE5t9nO6xhb9QnoNPAlH87FARZzl4h2GHHIBlofKrbA==
X-Received: by 2002:a17:902:d50c:b0:16d:5881:a14f with SMTP id
 b12-20020a170902d50c00b0016d5881a14fmr14557236plg.22.1658846218658; 
 Tue, 26 Jul 2022 07:36:58 -0700 (PDT)
Received: from [192.168.205.175] (113.red-88-29-182.dynamicip.rima-tde.net.
 [88.29.182.113]) by smtp.gmail.com with ESMTPSA id
 a199-20020a621ad0000000b0052bead2183asm7053942pfa.159.2022.07.26.07.36.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 07:36:57 -0700 (PDT)
Message-ID: <843f0cf6-69cb-fee0-eeca-0e56dad3528d@amsat.org>
Date: Tue, 26 Jul 2022 16:36:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH] ui: -display dbus requires gbm
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, pbonzini@redhat.com
References: <20220726103100.2579854-1-marcandre.lureau@redhat.com>
In-Reply-To: <20220726103100.2579854-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 26/7/22 12:31, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> For now, -display dbus also requires GBM, for EGL setup.
> 
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1108
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   meson.build | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


