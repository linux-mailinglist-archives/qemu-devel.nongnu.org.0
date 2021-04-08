Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B6435878E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 16:54:34 +0200 (CEST)
Received: from localhost ([::1]:49404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUW3F-00013l-9d
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 10:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lUW2G-0000M1-5s
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 10:53:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lUW2D-0000Xs-KI
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 10:53:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617893608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TsfSnsG+JlNwYeYVghuV8BXej27O43KqihMa8JpMyFs=;
 b=jRgZPPkdJhPvwE+bRPbQ2SXWUU4lC3cK7OdFhp/Yxtzrq97jWApSKbR0+fzYtpbf+VzJDv
 JS9s42htUhX4qY1X4RIGcAMeYXPYrYBH/3Y7RPnptYWYSN9Y9z4whV/ed1CZg8PDV1Wmd6
 eKPETEob0iNTdNEfImkoX0BIS0w6/i8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-2x4ZPAKaMneMIB0_x1YtMA-1; Thu, 08 Apr 2021 10:53:26 -0400
X-MC-Unique: 2x4ZPAKaMneMIB0_x1YtMA-1
Received: by mail-ej1-f72.google.com with SMTP id d6so971131ejd.15
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 07:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TsfSnsG+JlNwYeYVghuV8BXej27O43KqihMa8JpMyFs=;
 b=Cw6o06ED7DhXlBnbngHHg5Bao6ZxiJPZBNmQoFbH/QzL/mUa/mQYEpHC3A2xVGZ66R
 kX8cjaJ9AQNyU3MwowXvvRnmIvl4+jpK93VWWihkKZ4WCTTZ1omGHUrdF/N9PuhjFWik
 TPBG7C6nST7SiphVHTCBmrUukFOf8YySgQBwVIEfzCT/KC9ZoyQm4r1ogEnG2gMzqqv+
 XpLzwfp49emzSr29fhdXLkI021wKOIA1b77oWaY0q1gvpjIXGThMt7Bkm0rrpLTJj17b
 D3pPOpSLAuhGRrEtg4/s+4R5ZxWOmBx19WlWaGq1ow+0TCUHvwFuf3+XCAmR3T+fLJH4
 Ntdg==
X-Gm-Message-State: AOAM5339Kl+Ia4YhM++46UpA28hXhtfy9AMrTblNY7dI1BZ5g1OfPhdn
 wXocAKYm/gUBd6pfUasBXbeg6Vn1AcxltzLccSJisvFWJxfDi7qf+yAEl8vHkCfOitZj9urOuq9
 zcJEQ6ue9czsyqco=
X-Received: by 2002:a17:907:118c:: with SMTP id
 uz12mr3244205ejb.308.1617893605580; 
 Thu, 08 Apr 2021 07:53:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTw/m33M6jTA02qZ4VuTp3yJchz5VQOyJJDG6ciS65BLoPUunE9DtRZJmvNpUWwWM0bOA1kA==
X-Received: by 2002:a17:907:118c:: with SMTP id
 uz12mr3244180ejb.308.1617893605363; 
 Thu, 08 Apr 2021 07:53:25 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id f21sm4352240edq.55.2021.04.08.07.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 07:53:24 -0700 (PDT)
Subject: Re: [PATCH] vmstate: Constify some VMStateDescriptions
To: Keqian Zhu <zhukeqian1@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org
References: <20210408140706.23412-1-zhukeqian1@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ae3656dc-bb31-7881-b87d-c04de07df4d9@redhat.com>
Date: Thu, 8 Apr 2021 16:53:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210408140706.23412-1-zhukeqian1@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/21 4:07 PM, Keqian Zhu wrote:
> Constify vmstate_ecc_state and vmstate_x86_cpu.
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>  hw/block/ecc.c           | 2 +-
>  include/hw/block/flash.h | 2 +-
>  target/i386/cpu.h        | 2 +-
>  target/i386/machine.c    | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


