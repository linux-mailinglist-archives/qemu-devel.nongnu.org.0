Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201F8510143
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 17:01:21 +0200 (CEST)
Received: from localhost ([::1]:49674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njMgp-0001Li-Os
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 11:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njMej-0000O8-6a; Tue, 26 Apr 2022 10:59:09 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njMeh-0004WT-Io; Tue, 26 Apr 2022 10:59:08 -0400
Received: by mail-wr1-x42a.google.com with SMTP id j15so12617037wrb.2;
 Tue, 26 Apr 2022 07:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3TJhX6fzQ4LzTRRCpaJYKgTNgk+0/k2NraT6nKNXyWI=;
 b=dTC7xNiyCAEMeg9L3FjTBgUxoVRQKbFm/m0EG+JLzT0jvYN6TJjPbLXrSbqi24fzAH
 SrKJbzr7ckJ7oCE4u/A9TiMMCAF+LTAwBPplVWNCNz8ZF7nGLPIJ3j/S1el1yIJeS8G3
 FvQUrVXwwQXdrav6bTgP1LJ7dQyJ2v6BPZi8R8eWG4m/asQovPQxOJeHUxmKg1l+BTJu
 Pif03hgguRWf/WHqAzDEoRwntXupsIBec7hsjr9iYpMpgGLhwVH0nrILble2KB1ywS+5
 WWjausr2uhSqJ29kBIi6XgvJmXIXxToz3BgMzrW+J6PvW9LrAcMp/BPu8PNrrstKYyCK
 V+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3TJhX6fzQ4LzTRRCpaJYKgTNgk+0/k2NraT6nKNXyWI=;
 b=gy+m8Rh4Gjgf1XE6JrSKywZKkx7/pm0TejRzixg2x8zRSawbaIOx8w6sYrph6lPb3Y
 Zn+f5sGZSniG3u0fz0QKSzlWWypWDlQEVND+quk4/gnVzyp/tRzj07BUVvZ1MAMknvD2
 SevOFcQP0EIiLZAowK3xYI2wtVJ13GTjfyyjwDLlshwsK/6lGJILhSIJzOWRRjO+oWm4
 i+28guH0S+FSroS/A7msnR6vEL6MXdjeIaLrD2S9nxelhpo8pIAqE7/7KcbuM1QPK6Vg
 wIY8iI9stynOZ/DWLuv5/3XRyDrBzayjvkyf1AqY0oPHO7L59Dc4cR8aRNrYObXVG8su
 +3cA==
X-Gm-Message-State: AOAM530xXmRw6VWgpCsTljqXrauMA0V1zsHtetEJnPmMg9rwfSFAA+LL
 l9DRKG6Ast3Q6YFph3frmV8=
X-Google-Smtp-Source: ABdhPJwnk0RGtjudQnQNq0Z4A2WsAlcmJjVj+dAllJOOK+xdoDb5vgFU/ay0ebdGCEC6zoi3zFsUcQ==
X-Received: by 2002:a05:6000:1686:b0:20a:96e0:9bbe with SMTP id
 y6-20020a056000168600b0020a96e09bbemr18432772wrd.635.1650985145682; 
 Tue, 26 Apr 2022 07:59:05 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 l9-20020a1c7909000000b0038eb8171fa5sm11288015wme.1.2022.04.26.07.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 07:59:05 -0700 (PDT)
Message-ID: <d46c3aa0-f933-2c28-1a46-51ed6d7b55ca@redhat.com>
Date: Tue, 26 Apr 2022 16:59:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v2 2/8] coroutine-lock: release lock when restarting
 all coroutines
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220426085114.199647-1-eesposit@redhat.com>
 <20220426085114.199647-3-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220426085114.199647-3-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/22 10:51, Emanuele Giuseppe Esposito wrote:
> +#define qemu_co_queue_restart_all_lockable(queue, lock) \
> +    qemu_co_queue_restart_all_impl(queue, QEMU_MAKE_LOCKABLE(lock))

I think this function should be named qemu_co_queue_enter_all, for 
consistency with qemu_co_queue_enter_next.

Paolo

