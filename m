Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C42DA602548
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 09:13:07 +0200 (CEST)
Received: from localhost ([::1]:51142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okgmf-0005VZ-I3
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 03:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linmq006@gmail.com>)
 id 1okgJY-0003iP-E7
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:43:00 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:38624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <linmq006@gmail.com>)
 id 1okgJV-00032G-Du
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 02:43:00 -0400
Received: by mail-pg1-x531.google.com with SMTP id 129so12506402pgc.5
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 23:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4g8VvE3JApbWezv9hwMXX7O9Pa6ndFnwDT6v6+ivgTE=;
 b=V/pY6KfBocq2ZIxVzVg8Gnv4dlhND9llXfYNSFFJ8U7ltI0Hl85JoFsMmX3or3xsAL
 1DOBtry5aKMOmUhqabXcTCY864B6PEzRNnNH/c89ZeRlM4XMT++O/HFcfvwCRkDEsKLO
 LCEb1ei5ddcy3E2OyjOBmoNRQHT7Um0crZ20LarzzOGqTEOQQo5TpWI0A2rZ8WrhNtf4
 TO8MilP/We9OCoohFbqZLs+BaP9IYe9oI46A4aFO8j7l3FGLHzC42YB82cHrvTexZntb
 d4aeQvF5UKxPqyptaSvfYLOvN/WqtFk0grW2i6aekDz0j6a1/7xGxseTVvNg0iI0ho5N
 4m6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4g8VvE3JApbWezv9hwMXX7O9Pa6ndFnwDT6v6+ivgTE=;
 b=5Gh2mIYkfRHnjBIMiF/UWcFLEbisFVun5nDGUKIj5x0s96GH1FPz/TF/bhB/2QCYXj
 NICCVsKnHzTUiRuTMfrcrkaKZL5g2shdLUK3F+s/2WJ+5SQweOZsAldcsItS2kVjUWj3
 VrxdCHQ3WkLxVdTg1x+YgZ/uzUGkQzItP5Zld9ATdkyCXqu1AjfIh1yEL4AmJ3kNsaZh
 f+ZYCvBvco0Ab2KRjj7lc2vfuSPhb8X8HOCdLFCYFE98AaKc8utZ8e22U2A/ISjSaeMR
 AVs5alcZYROAyh4g0fCAk5eOI8R9W987QHsC7dRVAUlb8yMuTT9hqd7sGN02anMSUYnu
 kn9Q==
X-Gm-Message-State: ACrzQf16rhW1vj5i3wXXOkBCzWkR8kja0eWzO6KIOieILtUce7UpYJWv
 nWYNTuf5xnpSxg2Wkgn0heM=
X-Google-Smtp-Source: AMsMyM7eaQkmm33HUWg97umOcqGDzv35h/TiLFjNkGmNAU4OnscfyH8JFNI5neLCZnzmdsKtVcS8Xw==
X-Received: by 2002:a05:6a00:1a93:b0:565:b185:cc18 with SMTP id
 e19-20020a056a001a9300b00565b185cc18mr1729319pfv.70.1666075373723; 
 Mon, 17 Oct 2022 23:42:53 -0700 (PDT)
Received: from [192.168.108.167] ([159.226.94.108])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a17090a290200b0020a7d076bfesm7248689pjd.2.2022.10.17.23.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Oct 2022 23:42:52 -0700 (PDT)
Message-ID: <5d630010-57f8-fd11-04fc-6e52bdc15a80@gmail.com>
Date: Tue, 18 Oct 2022 14:42:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH] qga: Fix memory leak in split_list
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org
References: <20221018044645.863859-1-linmq006@gmail.com>
 <CAJ+F1CLJFer=UoS7Udn0youfEgGAPG8xZJ9SokbGQm5CvXhugQ@mail.gmail.com>
From: Miaoqian Lin <linmq006@gmail.com>
In-Reply-To: <CAJ+F1CLJFer=UoS7Udn0youfEgGAPG8xZJ9SokbGQm5CvXhugQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=linmq006@gmail.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2022/10/18 14:32, Marc-André Lureau wrote:
> Hi
>
> On Tue, Oct 18, 2022 at 8:47 AM Miaoqian Lin <linmq006@gmail.com> wrote:
>
>     We should use g_strfreev to free the memory allocated by g_strsplit().
>     Use g_free() will cause a memory leak.
>
>     Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
>     ---
>      qga/main.c | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/qga/main.c b/qga/main.c
>     index 5a9d8252e075..04902076b25d 100644
>     --- a/qga/main.c
>     +++ b/qga/main.c
>     @@ -934,7 +934,7 @@ static GList *split_list(const gchar *str, const gchar *delim)
>          for (i = 0; strv[i]; i++) {
>              list = g_list_prepend(list, strv[i]);
>          }
>     -    g_free(strv);
>     +    g_strfreev(strv);
>
>
> No, this is intentional. We are building a list of allocated strings, we shouldn't free those.
>  

I get it. Thanks for your response. Sorry for the mistake.


> thanks

