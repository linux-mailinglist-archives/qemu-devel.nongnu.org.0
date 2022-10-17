Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2180F60139C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 18:39:04 +0200 (CEST)
Received: from localhost ([::1]:53414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okT8n-0007B6-PW
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 12:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chrisfriedt@gmail.com>)
 id 1okT6j-00053M-Oh
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 12:36:53 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:33491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chrisfriedt@gmail.com>)
 id 1okT6h-0000xc-JX
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 12:36:52 -0400
Received: by mail-ej1-x62e.google.com with SMTP id q9so26338378ejd.0
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 09:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rxrVQNtbzXVwL9NfQ0RuQ9PwPbXX/croa0hL5zBLDAA=;
 b=aBsTe40bKx8lk0WwV94g6Ub6wyTSeHLoJWCQcjlUCFeo7xtMGPBp1dKbbCv6BgPF+A
 SzfXmEaNVQxJmpnDdsCCZr+35xHA/KTPySHEvSp4Dzzu5fBImCn+gdQuIhJRpnCfK9Wg
 FJTJAfYJxoAhKsqPdP3IueSwq1R6TRE4mzZrK+LQCaogeakIITBrOUX1IQxrywnJgCaV
 0IAYWAUHg5yTE3sqM/fRttb4JoSTZwhGEjzsttJk+wLTY8MdMxH7eJweMNsMAAgigL80
 7ec1muX4H/5ptFQTtmuodD9SO8RyO7/bP2/qTBhw5v4PD8kDXICMrguhuD8dn07GGSsn
 L05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rxrVQNtbzXVwL9NfQ0RuQ9PwPbXX/croa0hL5zBLDAA=;
 b=MIxhzaWXdCjGb2tZQCUs7jz11RnuXmIUWPyTJbSTFKFLnQDyERPEypH+atQMiYYE8a
 eDHYtulJNdUXPF+vOdndDb3pcXgcXiLAIFzhhrHR1P6QBDf8gpVhb9YkVKn5eusb9DXW
 6TMIHyZiYQpuk/wNK4AWx5/va+9RHMpta6qnxKSZZ37Qbo+NJWrFg9Z9N/0M/Z+VieQr
 aGDjO77aSlEw8VoEaoa9KbxNifvq68zZm6am6tAo2NXTbTSzRu/sstZdbGimIAedZUcZ
 qhinTWLITSZFez5LzX813VU1WvyaNbP0GFXvl/7Ux4d30fLjPYGuBjc4TCWkvH0Fxr21
 BIDQ==
X-Gm-Message-State: ACrzQf3Vhk0KceRCkdL5IsKbbVSScmQddt75rsd8B38SKFwZEtWus7O7
 w7b6Dk43pzht5jf97VFcSTTw+AdTMBCIqTuBq9SaPLoWbw0=
X-Google-Smtp-Source: AMsMyM7AxN4c1jsPeFax+Sr57ToMaYrYdvOnZfxVzRrYiqtPcQzA0vueejRmVe19R5jWPibSrup9XZY9WCki/PReGv4=
X-Received: by 2002:a17:906:5d04:b0:77f:ca9f:33d1 with SMTP id
 g4-20020a1709065d0400b0077fca9f33d1mr9428123ejt.526.1666024594386; Mon, 17
 Oct 2022 09:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20221015211025.16781-1-chrisfriedt@gmail.com>
 <79e5307d-1c6e-614b-815b-4e796db71b17@kernel.org>
In-Reply-To: <79e5307d-1c6e-614b-815b-4e796db71b17@kernel.org>
From: Christopher Friedt <chrisfriedt@gmail.com>
Date: Mon, 17 Oct 2022 12:36:22 -0400
Message-ID: <CAF4BF-QcCbBfMSXwJ=eB--vaZeA4rUiC5946dz-M0hU9CO882w@mail.gmail.com>
Subject: Re: [v2] hw: misc: edu: fix 2 off-by-one errors
To: Jiri Slaby <jirislaby@kernel.org>
Cc: qemu-devel@nongnu.org, cfriedt@meta.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=chrisfriedt@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Mon, Oct 17, 2022 at 2:23 AM Jiri Slaby <jirislaby@kernel.org> wrote:
> On 15. 10. 22, 23:10, Chris Friedt wrote:
> > From: Christopher Friedt <cfriedt@meta.com>
> This should be split into two patches. This way, it's hard to review.

I can do that :-)

Thanks for the review

