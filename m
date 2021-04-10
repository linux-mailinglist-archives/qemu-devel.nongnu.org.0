Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D9935AC19
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 11:05:08 +0200 (CEST)
Received: from localhost ([::1]:37822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lV9YB-00030u-Gj
	for lists+qemu-devel@lfdr.de; Sat, 10 Apr 2021 05:05:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lV9WW-0002Qv-AU
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 05:03:24 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lV9WU-0005Os-M3
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 05:03:23 -0400
Received: by mail-ed1-x52f.google.com with SMTP id g17so8464801edm.6
 for <qemu-devel@nongnu.org>; Sat, 10 Apr 2021 02:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Dp0qgDOV97lB+01BnZHSTnQLxav3JAgB3BU3e2730fw=;
 b=dzZL6Z9lZVPRnMxVWuz7tM7vbVyE1dh2cuk/fMCSg/q2bxgfEu1IutXXIrIW++7/xQ
 g8aE0NKOXezZPqfjKmi8vM7iNCSAGyuOnaL2q/VFajY5hFMWuW7OukIondAc3Wu1eNkR
 o41bzPFZ11JHFRpcLISLKMxWdQamRuYD5TJIaYf29HDBFmoHovyUXy7osx9KvbMrbwq3
 1w0uTcZz8kHntwDgu7tWS5J9K5ChWMVUWawUYxng0PJVEt6UmRL9+8Dby236hHlkvFYP
 aOVyAujtS1njBdYr06Yasiw9XUQwlb4HrCzW4pHWUPzuMWZ3Cz6OpYQibG7I2MGu66H1
 b0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dp0qgDOV97lB+01BnZHSTnQLxav3JAgB3BU3e2730fw=;
 b=VjNBTK+VyYu7ajvXUTo0ZuS4FJodgVHhsrJoRV1dMr+yZkWMY6btj4VuqSix87BMGO
 XlWOj/V/61gV4x6iyLnj07nCfw70iUe8Ko7B+PdShb2XYBfyw9S28rYVKXahQ2Sxqlqv
 w/QDrWZUy3/U5y879zaLQMzLzQAUupLmmj2Jl6H86tuHmi24WPpDJz+00RRNIcaqImQ/
 9L52pUERyb7DmbHhCNal7bINMnqEZm2W0P4AQHpsJG/hq6+nvG4QFXzhzuHcUKTDGw2q
 XNHkzbWx/VW9M/xoEth8FM8h3LeE73tbBcFiv9l4zpWjkNXJ70mfD4MIHP2M3JeYS+kj
 x/7A==
X-Gm-Message-State: AOAM5304FhZWFGPfSRN3HltlCn0GD0sefCk3tlQOP2S3Q2LSVnsTtwil
 tIZkiPeKtnbVsOd3vywawAkQQIxpwu7L9A==
X-Google-Smtp-Source: ABdhPJy/XYfbOrngCvhcDDTRwmquqvkqrZi+clQMRzbiqdxS7U/QbDpw+3f274JHS/FSBFgoCuYT5g==
X-Received: by 2002:a05:6402:27ce:: with SMTP id
 c14mr21020393ede.263.1618045400724; 
 Sat, 10 Apr 2021 02:03:20 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id z4sm2673183edb.97.2021.04.10.02.03.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Apr 2021 02:03:20 -0700 (PDT)
Subject: Re: gitlab-ci check-dco test
To: Richard Henderson <richard.henderson@linaro.org>
References: <524450fb-2baa-12de-710a-3e05ea1f3f25@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a5fbeeb4-2985-d3c7-148c-b942cf4fcd16@amsat.org>
Date: Sat, 10 Apr 2021 11:03:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <524450fb-2baa-12de-710a-3e05ea1f3f25@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/10/21 4:58 AM, Richard Henderson wrote:
> On development branches, it's not uncommon to push
> temporary --fixup patches, and normally one doesn't
> sign those.  But then of course one get hate-mail
> from the gitlab-ci job about the failing test.
> 
> Is there a way to make it fatal on staging, but
> merely a warning on other branches (a-la checkpatch)?

To only run check-dco on branch /staging on any namespace:

-- >8 --
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3480d79db3a..f0d21da57f0 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -781,9 +781,9 @@ check-dco:
   needs:
     job: amd64-centos8-container
   script: .gitlab-ci.d/check-dco.py
-  except:
+  only:
     variables:
-      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH ==
'master'
+      - $CI_COMMIT_BRANCH == 'staging'
   variables:
     GIT_DEPTH: 1000

---

