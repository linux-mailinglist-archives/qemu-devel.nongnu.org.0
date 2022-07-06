Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 590AB569538
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 00:22:00 +0200 (CEST)
Received: from localhost ([::1]:40174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9DPB-00077G-OZ
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 18:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o9CKl-00076s-Gt
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 17:13:20 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:40904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o9CKi-0007uz-L3
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 17:13:18 -0400
Received: by mail-pl1-x62f.google.com with SMTP id b2so14642897plx.7
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 14:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2HxMiQKvjgPnTHaqjbemaUFGeVH5m+/2qeYPIrDW2mQ=;
 b=F4x2e9ZEPzCui4qBhNlIjZXxRz/Eu1nJ9EgJJ/0hnEpUMvQ9+sZ07/N8aNS86Qmw0A
 VslozE7Z1GVRhkh638zz+kcvlQ+fWki1DU6igR/d8THFLDGoh+y75UcKjLzGm52QWgOj
 2cECv4DeLQ9HJ2Tt8m0KX4yroGa/kfHgES7lZTWxHo5UvNZcvQysBItAAN8S/cyC7tij
 BsCG3QAD5DA8xbzBWi1wPxYuQS5YWKjkkzSisLhKvLtim80SOKceDw0n+H6PbKhOW3R7
 O44Z5GaL6IHD1JcbY7uAGlQ5lTra9g5vkWgooGA7I6RFDhoVoWBRi6T/9P03COmR0n5B
 dHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2HxMiQKvjgPnTHaqjbemaUFGeVH5m+/2qeYPIrDW2mQ=;
 b=cjW/BB6swYPYmQ/Zl3TxfPuWo8FJCFj+ZZ1DtVCkGUwsYXqqqIbNASXVf611QURCuC
 JjnbNrlI0MkBl6pbdAxcgBpDyd+Y0Z3uxIDGkSla8PgqFgv3EUCgjQ6aJqlTJSPB2w2O
 j9iiY5G8jw5wje7UC7kT8An/R4i6EAaChmD0u3hJsbYoFC3e7eI8OX2DsABXnUHW1bic
 ejV2FyuwgfJnqiRuMmMTpT7BKoqS8w/POk5VjmGwjdQrQcggJ+Mf/oGEAKrVm0sQr5Gj
 ykPZaginrsmrC6e3XAhbOahRosYVTnEHhBgn2SKPRsKaUl9azMuPgk61Yd4IawSX/h5B
 eRSQ==
X-Gm-Message-State: AJIora8vbQJckok/3Qr6Ih+jZnD31mPEe+/IhFfm4KnJRGY20zvtStYJ
 cutn33O/UwZ15yv//C8K1JU=
X-Google-Smtp-Source: AGRyM1vgbiLbORBu0/sYYW5f3k5RTURtGRQXT1RDYbJ6pJizpMsRHKxsn17kKL6CQ4loLrPm5M9vlg==
X-Received: by 2002:a17:902:eb8b:b0:16b:d27a:d7f5 with SMTP id
 q11-20020a170902eb8b00b0016bd27ad7f5mr25133922plg.37.1657141994873; 
 Wed, 06 Jul 2022 14:13:14 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a62bd04000000b00525714c3e07sm25171203pff.48.2022.07.06.14.13.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 14:13:14 -0700 (PDT)
Message-ID: <7c93f6c5-4643-ce96-2d69-d27cd1e3989a@amsat.org>
Date: Wed, 6 Jul 2022 23:13:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] scripts: check if .git exists before checking submodule
 status
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20220629160857.425400-1-berrange@redhat.com>
In-Reply-To: <20220629160857.425400-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62f.google.com
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

On 29/6/22 18:08, Daniel P. Berrangé wrote:
> Currently we check status of each submodule, before actually checking
> if we're in a git repo. These status commands will all fail, but we
> are hiding their output so we don't see it currently.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   scripts/git-submodule.sh | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

