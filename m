Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707D843B7FD
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 19:14:11 +0200 (CEST)
Received: from localhost ([::1]:49304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfQ1a-0006ei-Gq
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 13:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfQ0M-0005HD-0V
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 13:12:54 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:34506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfQ0K-0003Fr-EO
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 13:12:53 -0400
Received: by mail-pf1-x436.google.com with SMTP id 127so132677pfu.1
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 10:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EfAZawKBvE0EsUME/4DRIpJCmUTNEMqpFVbadrwQYzM=;
 b=V4en9ffh2VZnIYIBVgwbG59w8LsO1Yz/gDFXEGuJIIJDWashCn3bIrcz+ufLIK2kDy
 yeeO6NrvdRjchOpnv8dy+UjYfMoi4tV69ZZ4aHFpC25lfc3VClgkkymeLnnO1+upMd8p
 qJCCsSqm+FFA9vaIT9M4iVdy+9qHLjrE8BOuWd3VNwvOr2Dj0jaBevLjfUboLJ4dKD8t
 Rjg4RIswbxoQJlNlHWl1vgriI/shj8jMajWJbSZHCo9VikS0l0I/2og9Fncxii5pGxe9
 RUIb1ZpW/55LDMWugwZn7WtSIyavVnhNU/QHwVayt3ukIG6fukNJOUja0q5HRjQOIy5n
 xfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EfAZawKBvE0EsUME/4DRIpJCmUTNEMqpFVbadrwQYzM=;
 b=HUS6qEKIPNAhCfN6lIr/DppstMjL1eqp4SqKIcC1wk8FFzOi5eOYywD8LIz+0Q7N+8
 GtnPaQ+QY+Gy4oIh9LUg33rBvv0B63aKYnl0sBVCsD+81bVRp3wqt3/gL3lV0O74KZS1
 lziUbiWfd3i+tKO6gi1Y4JwLNnmByJAa3M15NrJTT+SlEi5eKnAH5bPwm3tMWEJj+ggr
 +Uk7TwRROEy5UXht0hY/x7z0rg9H+SCBx2B91ooXRL888VV28QLujocXkybbx7oGFAPE
 H8L9llwNh1ifm5ZmwG6inQsU01H1O/V8hEmUlP2w7SZC+dtlFm9AOvH2EDA0y9isBLb4
 dDdQ==
X-Gm-Message-State: AOAM5301bfsUVHo1jqVeaVpFtK778kDqtLqFJrBSznepDCkpGJ1eP2UW
 ANxCafLWobC6cK9bCL8kbti+c3scBaF8Yg==
X-Google-Smtp-Source: ABdhPJxzIa6SFYypQSkhaQcusGj9w4zvFMyoYBiEB+KUq/hxpNjTo2MJlcl7w/33dooF7d3oHF3zow==
X-Received: by 2002:a63:36cb:: with SMTP id
 d194mr19651081pga.401.1635268369816; 
 Tue, 26 Oct 2021 10:12:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id n19sm1406329pjq.40.2021.10.26.10.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 10:12:49 -0700 (PDT)
Subject: Re: [PULL 0/5] virtiofs queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>, qemu-devel@nongnu.org
References: <20211026102933.103139-1-dgilbert@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cd4e581a-3890-1531-0ff7-de3debb0c9e8@linaro.org>
Date: Tue, 26 Oct 2021 10:12:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026102933.103139-1-dgilbert@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
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
Cc: vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 3:29 AM, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> The following changes since commit c5b2f559814104f4145f8bc310f4d33c7ead8f49:
> 
>    Merge remote-tracking branch 'remotes/vivier/tags/trivial-branch-for-6.2-pull-request' into staging (2021-10-23 14:30:10 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20211026
> 
> for you to fetch changes up to 555a76e5e5dc2cd3c84c5e1bc060be17d5b32584:
> 
>    virtiofsd: Error on bad socket group name (2021-10-25 19:38:32 +0100)
> 
> ----------------------------------------------------------------
> Virtiofsd pull 2021-10-26
> 
> New 'unsupported' feature for xattr mapping
>    Good for hiding selinux
> 
> Plus some tidy ups and error handling.
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> ----------------------------------------------------------------
> Dr. David Alan Gilbert (1):
>        virtiofsd: Error on bad socket group name
> 
> Vivek Goyal (4):
>        virtiofsd: xattr mapping add a new type "unsupported"
>        virtiofsd: Remove unused virtio_fs_config definition
>        virtiofsd: Add a helper to send element on virtqueue
>        virtiofsd: Add a helper to stop all queues
> 
>   docs/tools/virtiofsd.rst         |  6 +++
>   tools/virtiofsd/fuse_virtio.c    | 80 +++++++++++++++++++---------------------
>   tools/virtiofsd/passthrough_ll.c | 17 +++++++--
>   3 files changed, 58 insertions(+), 45 deletions(-)

Applied, thanks.

r~

