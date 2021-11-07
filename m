Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F5444714D
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Nov 2021 04:22:04 +0100 (CET)
Received: from localhost ([::1]:44320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjYkt-0008Ng-0D
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 23:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mjYjo-0007fb-3c
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 23:20:56 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:47041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mjYji-0001AW-I0
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 23:20:55 -0400
Received: by mail-qt1-x830.google.com with SMTP id m25so1463512qtq.13
 for <qemu-devel@nongnu.org>; Sat, 06 Nov 2021 20:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BD0e6PV7lwFjUDWbzqXKvlrTSD8IizgpKaZ2L7ZjrSQ=;
 b=fnTutwajAq1SNVAiM8wuzVQcl3dHSP6fRHoz8+Ay69QWS1vr+SMt4sDpN7X49g2GYt
 E/w6UIR2J/QDARfByJTrfz3rq9BfkeIwJxoBilp7n5Z+wdbpnRqjt8AnTs+rwdpULWOK
 2DsGWHwOFD1xoOrkSz7lrcfDA8yemXknGHWjHmwu/LiCAVGxbAwbdNy0khv6D0V2cdHh
 sIhEmk8Gql0pza1yVZu//52r6l6TpTcz2FduExcs4Dp4PMK51E4oUiNI2P9uSrzhrOh/
 Q1jpFCZP7TeSKiByQCYPTjSxnJIi1f/EG3Y1lcc8ObqmK7V9wmiflSNm+GhywAOscIRR
 mhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BD0e6PV7lwFjUDWbzqXKvlrTSD8IizgpKaZ2L7ZjrSQ=;
 b=ACmz6GV+B0lXk4KrUsxqLN78SLm3/LqsiGNrrprRXERc7lxrFN4y4ANAsAo8Ib2/H/
 lxl7ghivueqLRJhMkZp8+TplNHTusFnLqUKFykG98hsGu42fAbUmorXeyw7EKO2cDaQH
 kgmTH6LFnM1KIIdhMILADonXNO6eb2NjeVF8L44/jWQ3kqTfSxry1S8al0PIt3hjCvGH
 2Oz6oVsOSKDF4hBu9dbzjBr0MQh5C162Lftg2y2s7i5MpzxY9PmfP9jwK4sAaT423qkJ
 5CyawU/qC5211lyzX/e5JREUK8LHLqOMg/4R2LETiUU6HTIZMsb+iZkjt+oddlDvsDax
 5QyQ==
X-Gm-Message-State: AOAM531XaZXeaNGYpMJb8PoR5+LMDhTgdplOs0+dAD0kqwsum1jCpGj4
 M/cIWo/Pc/kC5L3PadU7lODM2g==
X-Google-Smtp-Source: ABdhPJw9qoEqa3gl+wob57f9aJ0yxL1LAV5z2mBy2NVBw5MLYQo1gQPHXrArhIUnH7gsblbO5oKZbg==
X-Received: by 2002:ac8:615c:: with SMTP id d28mr70530515qtm.103.1636255247065; 
 Sat, 06 Nov 2021 20:20:47 -0700 (PDT)
Received: from [10.200.5.34] ([38.66.81.217])
 by smtp.gmail.com with ESMTPSA id c23sm3537751qka.89.2021.11.06.20.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Nov 2021 20:20:46 -0700 (PDT)
Subject: Re: [PULL 0/2] Migration 20211106 patches
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <20211106232941.46184-1-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <825b72a2-2589-d7b6-9b41-6a36808d7a9a@linaro.org>
Date: Sat, 6 Nov 2021 23:20:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211106232941.46184-1-quintela@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-3.407, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/6/21 7:29 PM, Juan Quintela wrote:
> The following changes since commit c39deb218178d1fb814dd2138ceff4b541a03d85:
> 
>    Merge remote-tracking branch 'remotes/kraxel/tags/egl-20211105-pull-request' into staging (2021-11-05 11:42:06 -0400)
> 
> are available in the Git repository at:
> 
>    https://github.com/juanquintela/qemu.git tags/migration-20211106-pull-request
> 
> for you to fetch changes up to f78d4ed701454f10079461b981ba2a61a95762ab:
> 
>    docs: fix qemu incorrect tag (2021-11-06 12:35:38 +0100)
> 
> ----------------------------------------------------------------
> Migration Pull request
> 
> - fix vhost-user crash when using postcopy (me)
> - fix incorrect tag for docs (hyman)
> 
> Please apply, Juan.
> 
> ----------------------------------------------------------------
> 
> Hyman Huang(黄勇) (1):
>    docs: fix qemu incorrect tag
> 
> Juan Quintela (1):
>    migration: Check that postcopy fd's are not NULL
> 
>   qapi/migration.json      | 10 +++++-----
>   migration/postcopy-ram.c |  4 ++++
>   2 files changed, 9 insertions(+), 5 deletions(-)

Applied, thanks.

r~

