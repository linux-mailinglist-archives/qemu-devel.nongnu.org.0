Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C1E4EA2AA
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 00:07:29 +0200 (CEST)
Received: from localhost ([::1]:56202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYxWJ-0007uo-VD
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 18:07:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYxU9-0006Y7-Ll
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:05:13 -0400
Received: from [2607:f8b0:4864:20::634] (port=42613
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYxU7-0002wK-Tw
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:05:13 -0400
Received: by mail-pl1-x634.google.com with SMTP id p17so15913264plo.9
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 15:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:cc:from:in-reply-to:content-transfer-encoding;
 bh=iSYKLu04+wRUSW67GAdHME/gMdIPINNs+2vYuo/vU5w=;
 b=VjKx4/PxSApxs/bG1+Ngwzn35claKd/eA6CWICcmZ2hsyj9Xg/msJ+OgWO3ISwbI3m
 ygu7Gt9iX/p9TmfvsHFArRKbbn1A+++Zvs4RupCqn7rBzMYwY0qI1HtF2/riRvru2qdY
 I89dhF++KNCAPXAIBCVROOF62NqZRBX0e93R+NUCFYdqAK/roE72fyi8vTUWwIGK6s3U
 LbnTsbP5qfS1VUo336zjGuoCsfS882RID3y7dhINbEj9dasJJm87k9xCw1PLLBpwkLGw
 TEdNZ7mmJJ5ueFoCMTNr2nUvhW88k8q6Maf2x/kCRK+G3kLh6FV+N5MZo1JxQost1Dw8
 eYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=iSYKLu04+wRUSW67GAdHME/gMdIPINNs+2vYuo/vU5w=;
 b=k4677rlBZLIEv0V/81V/BNCPkrQgJFTE7lFzeEGDWgHYIEXFRW7on8QShEVU53/I2b
 gwOouxwh4DDQFXOjN6sPZoAK/gT9eSmgJqZ5j1T46K1j/VvchE7HTeoiTaeNz6uRFgBa
 kUgjPNmhTjVMuotjd2Vt7aDbl9H5Hh1MI66xurumSgM1dJikpmtj1uP0AD33zJApxRWn
 pEXDzo+M8WtMFNADn0Yv5w1xy9OmPEHVMJep28z3e+PMceOgkDohW+fEdxRfJPDa6U7t
 8lcFxlcUwcpdPpxLQG5yafdnjy+gGsW/kxDGWQPCHHKgjzbwj+MQhHlFbF7ZEu2VKaUG
 oFCw==
X-Gm-Message-State: AOAM5302m5l9dYxz8RuuEclR4DHMzC/99BqIeWR8l1sYhckRKEtC/xla
 E7sZFSCNzeJsXvZdDOsE1IE=
X-Google-Smtp-Source: ABdhPJwxu06xLPaN5fFJqqQY4AU4PsZ+xKuAjt0ZOCRW5g8c2TpFMuk/zAHNTWhLuWLY6GtMtPVa2w==
X-Received: by 2002:a17:90a:ce8b:b0:1c7:7567:9f7e with SMTP id
 g11-20020a17090ace8b00b001c775679f7emr1264221pju.10.1648505110512; 
 Mon, 28 Mar 2022 15:05:10 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:3c84:1cd:456b:b750?
 ([2600:70ff:f07f:0:3c84:1cd:456b:b750])
 by smtp.gmail.com with ESMTPSA id
 f192-20020a636ac9000000b0039836edcf42sm5355595pgc.85.2022.03.28.15.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 15:05:10 -0700 (PDT)
Message-ID: <73f067bd-9454-4c9a-e49c-cb3550812843@gmail.com>
Date: Tue, 29 Mar 2022 00:05:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] github: fix config mistake preventing repo lockdown
 commenting
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20220323114516.4163532-1-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220323114516.4163532-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/3/22 12:45, Daniel P. Berrangé wrote:
> The config key names were all wrong,

Since commit 2b678923bb@repo-lockdown (22 Aug 2020, 2 years ago...):

   feat: move to GitHub Actions

   BREAKING CHANGE: The deployment method and configuration
   options have changed.

https://github.com/dessant/repo-lockdown/commit/2b678923bbf2df051

> resulting in the repo lockdown
> throwing warnings:
> 
>    Unexpected input(s) 'pull-comment', 'lock-pull', 'close-pull',
>    valid inputs are ['github-token', 'exclude-issue-created-before',
>    'exclude-issue-labels', 'issue-labels', 'issue-comment',
>    'skip-closed-issue-comment', 'close-issue', 'lock-issue',
>    'issue-lock-reason', 'exclude-pr-created-before', 'exclude-pr-labels',
>    'pr-labels', 'pr-comment', 'skip-closed-pr-comment', 'close-pr',
>    'lock-pr', 'pr-lock-reason', 'process-only', 'log-output']
> 
> It still locked down the pull requests, due to its default config,
> but didn't leave the friendly message explaining why.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .github/workflows/lockdown.yml | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Preferably with description tweaked:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

