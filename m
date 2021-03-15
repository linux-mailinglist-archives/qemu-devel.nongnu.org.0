Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0267433C701
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 20:45:38 +0100 (CET)
Received: from localhost ([::1]:39220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLt9l-000175-1Z
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 15:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLt8A-0000Zt-BY
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:43:58 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:47016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLt88-0001ax-Rl
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 15:43:58 -0400
Received: by mail-qk1-x72d.google.com with SMTP id a9so32872495qkn.13
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 12:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8y6fQTz9RgHEfZdxfUZ6lArc+ptC0vdCE4d7bI8MiXQ=;
 b=EhPb0RGY/T8KP+o/+UwysaY5Ja7pmn/oeFne/O3jvD27pcjzTnMv3alQLv2scOHbSM
 vPM8esouQ819ckOW52WKkstJYvboQap54lJLihqK0UG7yXkoF6E0QdWcp2DhDkLZhhR4
 EZjB0WZaamBg5oda6A08TbeCCZ6sxybfsL237U/Flx+w8YhOFJbPSVgEKhRJpGhgfFvz
 KfnLbfIm0Ag22uBRoZRL4lWaZSzidOHYTFVMAFkVStQkYYWZYeCzvhzhCascIvXR9W1E
 4UPn/J42ajbRRIH0UddnO63rDn16Q+54tXdg52lxlpJ/lkwNnJwjCFN7O51UKga53dMc
 P3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8y6fQTz9RgHEfZdxfUZ6lArc+ptC0vdCE4d7bI8MiXQ=;
 b=J95wICGbadlpUBjlustswW3GUYWTRMJ3oyUEMii93YJ8naGD58dRZUNj6t71BuYvB1
 WOfgRyOjj9qjt+OjH2vJD07erEnPlap5YVFLxZGaBL9IlWQnbTgZudSic8uEaho3Hkna
 yq24y4efqhMBccK6UYWr6MrSzxx6a+YyhUUKEy5aNHqlQ+wypzsFz+o8sD6mPpPjC5hz
 iGMoCfKjOZs7V5m48Cu1Pz8ERXX5kR1MJCi+kaL07+E65jQ6cGKdmmpbnkseXyLiMQDc
 LcKOolJKqMA60xkSLPqjlT4/0jM7EI6bRnfXBazhcE/9vmBvnvU4uCG9a9Fh+dCFYW97
 GxtQ==
X-Gm-Message-State: AOAM531HZj7J7AMivCqpbyJ5wwPOLyC7qCIep0iK4TYWidM9Bwt+lcB8
 Oj98mjDDwIl8+zxKiDf53A/RAA==
X-Google-Smtp-Source: ABdhPJyAWpoQLnR9n0vklVWjIG2V9MD23jWiyfvTl24vUMNny2K/yYh0K/ATUkTMgPR6myM8s2IHcg==
X-Received: by 2002:a05:620a:13a6:: with SMTP id
 m6mr26880942qki.64.1615837435871; 
 Mon, 15 Mar 2021 12:43:55 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id j24sm13073020qka.67.2021.03.15.12.43.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 12:43:55 -0700 (PDT)
Subject: Re: [PATCH] Hexagon (target/hexagon) remove unnecessary checks in
 find_iclass_slots
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1615784037-26129-1-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <911513d6-4a90-e9b9-9298-2941967b14c5@linaro.org>
Date: Mon, 15 Mar 2021 13:43:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1615784037-26129-1-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/14/21 10:53 PM, Taylor Simpson wrote:
> Address feedback from Richard Henderson <<richard.henderson@linaro.org>
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/iclass.c | 4 ----
>   1 file changed, 4 deletions(-)

Queued.


r~

