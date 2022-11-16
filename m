Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DF062C2F5
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 16:48:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovKdV-0003au-Ar; Wed, 16 Nov 2022 10:47:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ovKdP-0003Wt-Hh; Wed, 16 Nov 2022 10:47:31 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ovKdO-0000WS-0S; Wed, 16 Nov 2022 10:47:31 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id c15so808888ybf.1;
 Wed, 16 Nov 2022 07:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u1APBwbyidv84xLp3MqmwgnlUlNkmBjzrSDCn8rOaVI=;
 b=LDfiBxWQulyFfnRPHoL8AqQNoW6C/U8uWp8fxlowiJtKlUJ+gfIURD1m94lDoyUHr6
 09HQ8uDVN4HT6z/HvqS1J/WvU9sRQWTIL0Idkpxj3LbK6q574q+uobDRZx+w+NfiS2Gn
 LLpTYS0o0xALD+ge5e/zL4MKk5Njv90CQ5VjxyPGh8e/UUjIcopm3tOQxv1lFfEFIQ8v
 w3L9Tn4LyYOCP7rpELrxBFgEMqz4YR2WxDzuqrlx/Eh4MSKVybtTdGy6RkR3x+kfn/ud
 bCSwn8AfrYNpQexS0d848CAvUhI7SIQRfxTirkdjsvOdp2kwftXIrNL1ygXbwnczNYkI
 isEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u1APBwbyidv84xLp3MqmwgnlUlNkmBjzrSDCn8rOaVI=;
 b=gCY+c3roXT9ax/B5HEWv53iCPJ8fbHltKaSMs5bW3gS6HcaAdoz67NcI9MZSFRwskF
 8NnoUbyHMxijho1iIaN3Ls6ouhyFF9TG2MPjmBttbobV5MdPXQKMFEhr+oBytePRHdJq
 oSnw2I/gIROaud1oD4aOrZZbeer5zM+70d6v8l73x8lMUaIGTGnS07KnykZo6qbmNWPj
 3IJhmBKBn0FTvHtSDBQtC0cmHKrQxXj4bd0numXdWBQZofYUl3TGUrdZndOY/2qezN1w
 EOv9EE5Sw0kFf+C8D+QLV+nKjnuj5g8SDp7Lt3T2mv8sgbsssgS6CWQsNx5N3PuGeAIm
 XNlg==
X-Gm-Message-State: ANoB5pksYmrSaCu0SV9XoiZNz0pNKp/yOkC+hFwC5EKVOfNfVCBqUCFW
 hIFZM4bZiDcZhpNbhYFnJ6RLhQL9BXpAaBQoYCc=
X-Google-Smtp-Source: AA0mqf7SthP0dmZMSGPkOnuzw0FoAjSLo9SaNizwP2ZFy53bQmpxuoJZbat37RlUKV0CQ5EcxrdjwpUWnuNUbasaP4s=
X-Received: by 2002:a5b:64d:0:b0:6de:4fcf:6343 with SMTP id
 o13-20020a5b064d000000b006de4fcf6343mr21683281ybq.207.1668613648608; Wed, 16
 Nov 2022 07:47:28 -0800 (PST)
MIME-Version: 1.0
References: <20221115163659.1595865-1-stefanha@redhat.com>
 <011801d8f967$5dad0f00$19072d00$@fiebig.nl>
 <CACGkMEtJ2+2yhHgD33wiWvUEREei2ThQAkRNFWzRrDt5D50u+g@mail.gmail.com>
 <008c01d8f9ad$6ba58e20$42f0aa60$@fiebig.nl>
In-Reply-To: <008c01d8f9ad$6ba58e20$42f0aa60$@fiebig.nl>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 16 Nov 2022 10:47:16 -0500
Message-ID: <CAJSP0QUcYkKjJ1NMvKcs=03Z0Yjm+SD6H0wScJ-Zx62sXb6egQ@mail.gmail.com>
Subject: Re: [PATCH for-7.2] rtl8139: honor large send MSS value
To: Tobias Fiebig <tobias@fiebig.nl>
Cc: Jason Wang <jasowang@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org, 
 qemu-stable@nongnu.org, Russell King - ARM Linux <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2e.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

I have sent a v2 with a fixed MSS mask constant but haven't tested it.

Thanks,
Stefan

