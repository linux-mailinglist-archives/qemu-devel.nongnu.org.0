Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9B4391061
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 08:10:02 +0200 (CEST)
Received: from localhost ([::1]:51980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llmjw-0004UU-HF
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 02:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1llmid-0003mz-Tf
 for qemu-devel@nongnu.org; Wed, 26 May 2021 02:08:40 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:52977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1llmiZ-0002nv-Qo
 for qemu-devel@nongnu.org; Wed, 26 May 2021 02:08:39 -0400
Received: by mail-pj1-x102f.google.com with SMTP id q6so239872pjj.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 23:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tNkh+2l3yCBa7Kg0nAaI9BGcmahyUgoAHMMovXxiY38=;
 b=azAb/8O5PPVofpwoXTaTok13gU3PITiOVx+EvlY3N/QjyC+Abo6EATc2acEIhVGJGA
 Aks9o639v2/a23XqJoLONTtGXpbCb1nPLfyCuOAQApzop+WrQTqzzq88o+r/7UFQrGp1
 xboauOEpY8SqWAHOpH4PAoOiKH+Yng/dGQ+zdFJpupygvrWEkItOl6gdqaDjBiGzgtvi
 +0ZIszHJY6ThS/UvFs/Iv4FEhLdh5lGMCKpT0lyBjlteoWF6/+LrpR0lqlzGE/0mDesH
 swfX8Ln0acIXJyU7McGSsInkCdkNfPBIm4F4CnHYd8tdOYsGxiqt36tZGZNFIsCYery1
 RIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tNkh+2l3yCBa7Kg0nAaI9BGcmahyUgoAHMMovXxiY38=;
 b=T+Ev55Cy1T/TqkNUndmcjG8OJ72rNwAlAYbMsWdtkYnDjsI2qP85QYPLCSHJuMA19g
 9kbPuxGYKXAbLqNZAewOmGzAj2+pBMIk5fj/pggrTqi2+0FyE6L6+01Y76BUDZdZs9Pd
 KFii+6GjgQf5w88h8ug6zcdtuaL01XCNe71jsEpcyhCqOcCvZG4a1k3YOtEOSZWWbgZj
 9s+o2VTzGG8Ww88Mw3lbLUCpwEs0MPf3Wxrtrh/2iBe3adtaYFS/LZNcxGzgpvpuvG9p
 ngiDIQAGXh745A9uRMBtw0zpQeAhd26sJM9MVCtjJAJ3LrYkbFhgd2nFTVKSWNMEeKPJ
 qbJw==
X-Gm-Message-State: AOAM533uowkqOlrOiHTfLD/kPsYGqXJxpggbsM8+IK7vUMqdZHoda5YB
 DnWYB07MS3LoAIfW7rOG4mGTs7MkHrIzLA==
X-Google-Smtp-Source: ABdhPJwCHdHh/7dC7ccCvlR9r5PuxMJ/M1/j8oc2cdGh4RVKXnD3HgQEjdc6eFzjaJT1GpvbPLAbWQ==
X-Received: by 2002:a17:90a:b283:: with SMTP id
 c3mr34202589pjr.31.1622009313676; 
 Tue, 25 May 2021 23:08:33 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id l3sm5448211pgb.77.2021.05.25.23.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 23:08:32 -0700 (PDT)
Date: Wed, 26 May 2021 11:38:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] gitignore: Update with some filetypes
Message-ID: <20210526060830.ww5uhvmtt5encajd@vireshk-i7>
References: <79262dbe1f7888eb02e1911501eebafa6f2f6400.1616583806.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79262dbe1f7888eb02e1911501eebafa6f2f6400.1616583806.git.viresh.kumar@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24-03-21, 16:33, Viresh Kumar wrote:
> Update .gitignore to ignore .swp and .patch files.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  .gitignore | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/.gitignore b/.gitignore
> index 75a4be07240f..eb2553026c5e 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -13,3 +13,5 @@ GTAGS
>  *~
>  *.ast_raw
>  *.depend_raw
> +*.swp
> +*.patch

Ping.

-- 
viresh

