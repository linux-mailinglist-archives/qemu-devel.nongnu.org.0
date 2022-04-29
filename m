Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 409515143C0
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 10:16:08 +0200 (CEST)
Received: from localhost ([::1]:37318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkLnL-0005p5-AK
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 04:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkLkK-0004Tf-RC; Fri, 29 Apr 2022 04:13:00 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:40567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkLkJ-0001Zk-1s; Fri, 29 Apr 2022 04:13:00 -0400
Received: by mail-ej1-x634.google.com with SMTP id l18so13943782ejc.7;
 Fri, 29 Apr 2022 01:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n8avMxu4K70uNRLS+4piPXO0wYLWk9ILNuI97MWNzAo=;
 b=TuW/z3LdaQKR9cTroJ2DMGgc3rC9XFbbUvagTuVnf8n1e73uzuhnBXYjD9bjA0qWXJ
 ctANWMwkObESI3gALrlwA3or+xBIOutaPpQxqKhRk92pJl8Cu+UXFQyK8MaS0lBOHwrX
 7f9REazj5scDhtDmg6/JLqwx7ibxQw2fM6HuVdzuKhvzQwlb0CN5qY72+FBD3nwjVUFQ
 TdyMcIFvrwsNsG4cCDlomm3hrqaMhRr7NJLdG1ARfZSOxNE8heZYMQShZ1klHSefnfx5
 VL9MhSiZM0wbMcjwoorX2cz0A8DhKxGeHb5W6HYI1h3KNIikCjnapmxgn1qR6t+iunPD
 aVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n8avMxu4K70uNRLS+4piPXO0wYLWk9ILNuI97MWNzAo=;
 b=3K7XJWhtbIO4G9kwEUydscW56TkeK0JzAsjSXp47dFuyHhVwZciDqnNhkwjrzPFczL
 DGHKOrSR7yJlJi8OAncZIaBQWvZy1WirqMUkBOnfscoWd8fxoGL5zcK254DLtPlNC1oy
 L574d+ufwcnqruFXFHfYKCfrOKxuB5ccgqpAe8QyyfgDIxzSKtwGAFljLuuy62D9WYjN
 aQ78ilA26Kpbiw3zjFmx8Pp9gbpujJSeJJ/orLNNlklq3NGjPSauRrn+Dwxt2reaw+pN
 r65rUKNwfvw0jXqliAJ2wNLpuOZ10SmXwKZcdEMPq0cKoYA8Oetu9mAhSke2jb42FY3K
 WyQA==
X-Gm-Message-State: AOAM533xl2LP/ZwXXW3qwHlGA8mX581sPIaLWR3vtWRoI5c7JD2UV2Gz
 nnBoS2XE05wXI+yQqPUK6WA=
X-Google-Smtp-Source: ABdhPJz11tNudgrLV89uPdq+qM7u4Dmrk58WtponSiJbmVuYLb/bQpltpYBGBefF1MdzgqlKmyh6+w==
X-Received: by 2002:a17:907:1c0b:b0:6f3:d1f5:337b with SMTP id
 nc11-20020a1709071c0b00b006f3d1f5337bmr9760537ejc.309.1651219976986; 
 Fri, 29 Apr 2022 01:12:56 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 w7-20020a056402070700b0042617ba63bbsm2654363edx.69.2022.04.29.01.12.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 01:12:56 -0700 (PDT)
Message-ID: <70987d2b-e4d8-066d-9dac-b645a1d0e917@redhat.com>
Date: Fri, 29 Apr 2022 10:12:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v2 1/8] aio_wait_kick: add missing memory barrier
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220426085114.199647-1-eesposit@redhat.com>
 <20220426085114.199647-2-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220426085114.199647-2-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
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
> It seems that aio_wait_kick always required a memory barrier
> or atomic operation in the caller, but almost nobody actually
> took care of doing it.

I could not find any barrier in the callers, so I would remove the "almost".

Paolo

