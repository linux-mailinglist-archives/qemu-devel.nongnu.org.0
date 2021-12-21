Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7160647C1EC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 15:52:56 +0100 (CET)
Received: from localhost ([::1]:42684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzgVb-0006Gq-I0
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 09:52:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mzgSg-0002uw-B2
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 09:49:54 -0500
Received: from [2a00:1450:4864:20::32c] (port=56240
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mzgSe-0004Zu-Rh
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 09:49:54 -0500
Received: by mail-wm1-x32c.google.com with SMTP id c66so5519759wma.5
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 06:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hfYdyu2Elm4lUPXVaLMD/yFNwrvrJlqP0PZwH8+TGIg=;
 b=DhNejIu0Ofdd4QTpvE9/4BAGeTWcUL+G69TudHiQ2zfOy/y3CNEEweHjgkZIh22Ztd
 rqclAXDBgFMWLAxo2BMP7jjuwpGrlSm3qwq9SVR42qraIP6wxmoeV6Cw/pjMVK0TARCp
 QgoqlD0iPUHkPTnuDw97ViYJsKiRFt+hUlN+0Wow2ASfX1/MdXEkPFTtcyx1s9HTo1M/
 VPvZGwdm28hFCr/nTcQdGQzzpOENW9ilocPLOzf/UvZYn5S0daGyJh5D+WoVpOV1S4Ai
 eTLUGXO+5MXZTWDQ62cyi42lLO4WBX0vebLj8XvObXGiahHaT/EDmRKQWZj9W9yjr4MU
 /wWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hfYdyu2Elm4lUPXVaLMD/yFNwrvrJlqP0PZwH8+TGIg=;
 b=m/ZSIPSqT8Agvru7MvqND0HM45aA09VVJ025r+NtXp9ieJe62W7KVWPLQO1h7IX9RN
 l/ugxqSr4n45MDdSb/hXsy1SPsd71wVRZvgzPSM6VG5DXfQQJbBXMV3eOYOIkBuiNECR
 92tTb6l+dWtQ4HgEHdGykH/B68JRxszMkuDmFSlRXwS5GWAzc8TWypsE/f3VblJ+/XVO
 ZVd+iC1Vnk65vigCcMKW5ehSDBEJvmNDsnWikUZNWg95WdU7KXe8Q2/i3CA1N3ypshMO
 q3AvftLcpc790wJ7g2+60pT3XGUzHrKenr35JUfuSLWH0E/D+iFlIJUVH0RyXYzFSMyz
 0tEQ==
X-Gm-Message-State: AOAM531OfeqToQ7xsGFRJsRy76D7B/BEtV2rF2eMRstgXbUZckitVcA8
 nzjsV6zB1o09pPTE692LWBU=
X-Google-Smtp-Source: ABdhPJwLd3T8JyGP1Sno8hxjoOzIE3lQTG4T1HndQqFkRiJD1OowyPMVHd3PTviA+2SL3iqxIvLVoA==
X-Received: by 2002:a1c:f316:: with SMTP id q22mr3066555wmq.33.1640098191228; 
 Tue, 21 Dec 2021 06:49:51 -0800 (PST)
Received: from [192.168.10.117] ([93.56.169.52])
 by smtp.googlemail.com with ESMTPSA id b10sm18952414wrg.19.2021.12.21.06.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 06:49:50 -0800 (PST)
Message-ID: <1b8249e6-ffe1-86e4-a2e8-c85c794438e0@redhat.com>
Date: Tue, 21 Dec 2021 15:47:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] vl: Add -set options to device opts dict when using JSON
 syntax for -device
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, MkfsSion <mkfssion@mkfssion.com>
References: <20211221071818.34731-1-mkfssion@mkfssion.com>
 <877dbyjj0t.fsf@dusky.pond.sub.org> <87h7b2i07h.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87h7b2i07h.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 13:58, Markus Armbruster wrote:
>> Is this a regression?  I suspect commit 5dacda5167 "vl: Enable JSON
>> syntax for -device" (v6.2.0).
> Obviously not a regression: everything that used to work still works.
> 

FWIW I think -set should be deprecated.  I'm not aware of any 
particularly useful use of it.  There are a couple in the QEMU tests (in 
vhost-user-test and in qemu-iotests 068), but in both cases the code 
would be easier to follow without; patches can be dusted off if desired.

Paolo

