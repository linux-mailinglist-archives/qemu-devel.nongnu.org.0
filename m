Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3E25640B2
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 16:18:46 +0200 (CEST)
Received: from localhost ([::1]:42684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7dxN-0005qm-Sn
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 10:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o7dwB-0004Fk-B4; Sat, 02 Jul 2022 10:17:31 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:39832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o7dw9-0007wd-Fo; Sat, 02 Jul 2022 10:17:31 -0400
Received: by mail-ej1-x62c.google.com with SMTP id ay16so8807770ejb.6;
 Sat, 02 Jul 2022 07:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/YknBcmYeFUWQBwMEkwvPCfKkGI1cxEVNkwGNORgwug=;
 b=C4KYTjDdStYpdAtTfkZa1yA4p1DzNSafQk1r0rFaALeC44MYgfdO5LXvM8ktUD7lF6
 X6yYZoeM298GyleJiAoyE4lRfJRuqL3UpvzQoqVPZm1IkKuiPx7MgwBb0v3PcZsKzRP6
 nTsSer3u/7+0e9pdPgqscsEUKI7axs4xeOgAIXy9CNiFcSwViHXY2x4qRBuf5n+rQnsS
 19LXs8Jh0ZovBmNxFj9dYdTJb1axfHamlpeXV7zJDIJvZ7hlwT7+TOSiud2K8sQpUv9r
 9sy5GUT/uygvjTnZqGaRJxsKhYVKhc7Q31S43rdJQkCsfgGxnOJG+43NnrkKDcxB/1q6
 /Xnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/YknBcmYeFUWQBwMEkwvPCfKkGI1cxEVNkwGNORgwug=;
 b=QZi0vro3XGo5KTTDo2p1rwYhuDV2mqgV20mVi7TI4EUznME3nljSJNVS85jliZVWpl
 QjnoRJmkKkNp7clfOEfoYrFOgUN+WZZ79dTtL8RA/fodqK3CZ1Rj7zlj/T+Jeivu6kCi
 xx6MyACf3jqSC//i333dAcVa9DDZAau7YOogp15P/BCjEvKb97iX4P2Bn5LsciY2pWJA
 NYowzApxi+cAA2UAaDjSkkSz9qtmvrkI59efcuXhBZaxiO2V7hZecxcJw/zaHvVA2B6v
 VRe+2oeOADuS3ub9j7AYAWjqvJ+4aSGgo4bWn9zNemFW8Jy562lFV0q/QkB690Te2MZe
 HIuQ==
X-Gm-Message-State: AJIora9WrJ51toO7nAW1MX76f49MYafJEtenQ3AYWDnBYu8t6wBuENP/
 30iwrOsA7PNHpJtfxLygEEM=
X-Google-Smtp-Source: AGRyM1vYp48Iu7xVHJ68q9pJTiSDrNlCcq90ekC3CJOOfdhkMhzOnX8J0iGDaHernPlfmi3BdRtmsg==
X-Received: by 2002:a17:906:9755:b0:722:f1e3:ec1a with SMTP id
 o21-20020a170906975500b00722f1e3ec1amr19612749ejy.709.1656771447554; 
 Sat, 02 Jul 2022 07:17:27 -0700 (PDT)
Received: from [192.168.242.248] (93-43-142-212.ip92.fastwebnet.it.
 [93.43.142.212]) by smtp.googlemail.com with ESMTPSA id
 f9-20020a17090660c900b007262a5e2204sm11794330ejk.153.2022.07.02.07.17.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 07:17:26 -0700 (PDT)
Message-ID: <7fc6758d-048c-6e5d-4730-a138bc317205@redhat.com>
Date: Sat, 2 Jul 2022 16:17:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC 0/8] Introduce an extensible static analyzer
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, "Denis V. Lunev" <den@openvz.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Peter Xu <peterx@redhat.com>, Alberto Garcia <berto@igalia.com>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Fam Zheng <fam@euphon.net>, Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Lieven <pl@kamp.de>
References: <20220702113331.2003820-1-afaria@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220702113331.2003820-1-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
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

On 7/2/22 13:33, Alberto Faria wrote:
> The current primary motivation for this work is enforcing rules around
> block layer coroutines, which is why most of the series focuses on that.
> However, the static analyzer is intended to be sufficiently generic to
> satisfy other present and future QEMU static analysis needs.
> 
> This is very early work-in-progress, and a lot is missing. One notable
> omission is build system integration, including keeping track of which
> translation units have been modified and need re-analyzing.
> 
> Performance is bad, but there is a lot of potential for optimization,
> such as avoiding redundant AST traversals. Switching to C libclang is
> also a possibility, although Python makes it easy to quickly prototype
> new checks, which should encourage adoption and contributions.
> 
> The script takes a path to the build directory, and any number of paths
> to directories or files to analyze. Example run on a 12-thread laptop:

Thanks, this is very useful!  Unfortunately there's quite a lot of fixes 
to go in (including your generated_co_wrapper cleanup series and 
mine[1]) before this can be enabled, but I think this is the way to go 
to 1) ease maintainability of coroutine code 2) move towards a model 
where there are no mixed coroutine/non-coroutine functions.

I'll review it when I'm back, since a phone screen is not the best 
environment to do that. :)

Paolo

[1] https://patchew.org/QEMU/20220509103019.215041-1-pbonzini@redhat.com/

