Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EF7508AFA
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:44:24 +0200 (CEST)
Received: from localhost ([::1]:46448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBZ9-0002yL-EA
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nhB85-0004bQ-Qn
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:16:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nhB83-0004YP-C6
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:16:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650464179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W2iP+S/YLDwHc0ybRS2GGUzSt8/dp7kSWQpfYjeX93k=;
 b=bKO3GxinW4B6Qquuv8AdTgXGEyE0f7xzeKauVI38p+Fgp7qXiNBot1y1GuDTEFWXWDltnN
 O682gfNwbsm/q8uFchYOTSdI7ngy0wr7uJqNHWPOsaUVyWvApStjKLqnJ9hYeZbOlQta/5
 VtVbjp/pgrFpbWn0X3vZrxdAeoA0pqs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-jhY3u7qqOzGXKZJG6cWxBQ-1; Wed, 20 Apr 2022 10:16:18 -0400
X-MC-Unique: jhY3u7qqOzGXKZJG6cWxBQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 p18-20020adf9592000000b00207bc12decbso440965wrp.21
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 07:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W2iP+S/YLDwHc0ybRS2GGUzSt8/dp7kSWQpfYjeX93k=;
 b=KAEBAlwYSuBJoHFdmG+oXT9+x7toqDUYe44cWrEbniR6ysRpA1PDAY8JbFFILSHgzc
 zCyKSb8Pf8Se+I1zNdu438bisVQDpmFyQm5DduAIOca6akhrHUP80Epem6c2kOnhUIEL
 2rpxP50pF54BSdcSnUAMAtOx7Lw6iMqc2Z9L1+YOC3O/+5KehP1W32K3GuhCfNXD6D6Q
 OP4YpcjQ2ECNnWX3fs3/k7P9ZLdMwMLSQxFEyoW3Rivwr+O0aFdEpyzGDjKFuljDWC+1
 Wfp6g3ZpxVFFEm7FNJ2aCEDKDV+MjpoR4vyfVadzG9C5S8s+Ibn4iAXy61+CzaEqzUq0
 JRmg==
X-Gm-Message-State: AOAM531m7KFnEV9OdBDXG1LVLe7jlQiSpNLKu97oiQC/NYjjs3F94Zbo
 H0Jpj0DiS2AuULSh2U3eg1d5gR5Xiwe28eS1Vo0sYWUugUUF0NtbHs6YbH+ffqPmBmgcbhJeTdg
 vwCbPRGE4QyMCk/M=
X-Received: by 2002:adf:fdcd:0:b0:207:a471:3ca4 with SMTP id
 i13-20020adffdcd000000b00207a4713ca4mr16063597wrs.415.1650464177055; 
 Wed, 20 Apr 2022 07:16:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7JXefFAXX5UAiUbNjCkuoo4Oa+4dq8OlZKuSImEDa4ZU4bwZ6ezZpiuj5KBZsuQDByJX3zA==
X-Received: by 2002:adf:fdcd:0:b0:207:a471:3ca4 with SMTP id
 i13-20020adffdcd000000b00207a4713ca4mr16063572wrs.415.1650464176855; 
 Wed, 20 Apr 2022 07:16:16 -0700 (PDT)
Received: from [192.168.8.102]
 (dynamic-046-114-174-058.46.114.pool.telefonica.de. [46.114.174.58])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a5d47ca000000b0020a992ce354sm690wrc.76.2022.04.20.07.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 07:16:16 -0700 (PDT)
Message-ID: <2093f0c0-3c7b-a7eb-13f4-549174dde359@redhat.com>
Date: Wed, 20 Apr 2022 16:16:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 33/41] tests: move libqtest.c under libqos/
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-34-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220420132624.2439741-34-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/04/2022 15.26, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Since commit a2ce7dbd917 ("meson: convert tests/qtest to meson"),
> libqtest.h is under libqos/ directory. Let's move the .c along with it.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   docs/devel/qtest.rst                | 4 ++--
>   tests/qtest/{ => libqos}/libqtest.c | 4 ++--
>

This is definitely wrong. libqtest.c is the outer framework for the qtests, 
and should certainly not reside within libqos, i.e. the qtests that are not 
using the libqos framework should not depend on files in libqos.

Not sure why libqtest.h got moved there, but that certainly was a mistake, 
too. Please move libqtest.h back to the tests/qtest/ folder instead.

  Thomas


