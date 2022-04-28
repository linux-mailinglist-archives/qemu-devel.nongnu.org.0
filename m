Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C537513E64
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 00:12:02 +0200 (CEST)
Received: from localhost ([::1]:54762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkCMj-00036L-DW
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 18:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkCLO-0001ec-Pw
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 18:10:38 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:40922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkCLN-000669-CX
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 18:10:38 -0400
Received: by mail-ed1-x535.google.com with SMTP id p18so7047557edr.7
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 15:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ehHDCgENqRKPpxOpJzY/f7wwuLJ7/oIlRyqucYU3z04=;
 b=NMA5slfrQQJqge4syYX4hfkrst/9gIx6E8rf2JgrD+8wySrLknyXDlAjZ8IUSH/s7Z
 iVve9Exh2cgafBYUG4vVT4G/ePE6OPwpleORu2Sn/YwRDBaBRG6HDPHOG2l+DX/ty3Ix
 NyqdeqwN8+c9/0SzS9YcT0gH4jFhPK/FjZ2hxlX8gLOgEP09MGRwKzTG+REJS9n4J2Ig
 HvQXAHLc9pWODmvlvRoZ0nIkqm5xdtP3f48d9krVQ/j8npq1jO3otaVDpcExAVlJnJyf
 B0e4q2Mg0i6guIlY4hEa7b/lW7Wcp0yFPfmhVouMkOsPXohjJ1h4sVI1C1XVMdKJx9P4
 /e1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ehHDCgENqRKPpxOpJzY/f7wwuLJ7/oIlRyqucYU3z04=;
 b=FJ6khsM0peYxL4n9DD5b9DJk+xXkUKNBX334vQdAuEyiJZsEwHv8OroZMxrEPzOn8Y
 FxNNMOh8ZUfLuPM9p7297YZDX+NnPRH5fWvperwMhFrmn9Xc18g2hNFK3zEyiTd+9/SX
 6KwVUQHkMACgoMtfLQTxJ+/3FomWCFIbVt3aS9/EVaOHBNgvvb7zs+zlLN1az1Ajk6/Q
 5WAqiHF3uVdc7q/CtjPu5lxx5abNde+3KHjDwVW6i+7TRB2uY3Kdcy75/LnJQqTD3emB
 HNKMyTTYHCCITeuznVOrnscq+3u1nBNAQpyOjxJ46SvhnYt1y1+ndT2q1d1SvrpTa5Zv
 5teQ==
X-Gm-Message-State: AOAM530JVJ9uoyfgMy0CgfjNgEowLZngVxxbdmM6z0R83ey1VtYDyMSM
 jjP606Bqxt/hx5mtCCjTpWw=
X-Google-Smtp-Source: ABdhPJw4/BwifBZF/yX9Q+5XPhsePme4zb55wvjmljmIjJjfRpudgC1lO+xaX5ynNo8Ie82Mrswh0w==
X-Received: by 2002:a50:8a96:0:b0:425:e046:76d9 with SMTP id
 j22-20020a508a96000000b00425e04676d9mr26519732edj.115.1651183836061; 
 Thu, 28 Apr 2022 15:10:36 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 mm30-20020a170906cc5e00b006f3ef214e06sm65999ejb.108.2022.04.28.15.10.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 15:10:35 -0700 (PDT)
Message-ID: <0b0afdba-2f8f-1035-458b-f13d1f09f355@redhat.com>
Date: Fri, 29 Apr 2022 00:10:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/2] build improvments
Content-Language: en-US
To: Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org
References: <20220428182120.302066-1-kkostiuk@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220428182120.302066-1-kkostiuk@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
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
Cc: Michael Roth <michael.roth@amd.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/22 20:21, Konstantin Kostiuk wrote:
> Konstantin Kostiuk (2):
>    configure: Add cross prefix for widl tool
>    qga-vss: always build qga-vss.tlb when qga-vss.dll is built
> 
>   configure                 | 3 +++
>   qga/vss-win32/meson.build | 4 ++--
>   2 files changed, 5 insertions(+), 2 deletions(-)

Both titles make sense, but they didn't reach the mailing list.

Paolo


