Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C3B3713CF
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 12:51:44 +0200 (CEST)
Received: from localhost ([::1]:43544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWAx-00021L-LG
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 06:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldW73-00068P-OD
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:47:43 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:54815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldW70-00053j-IW
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:47:40 -0400
Received: by mail-wm1-x332.google.com with SMTP id k128so3047548wmk.4
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 03:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/NlqyFxQvKGeBVsfPxxFWzMURaFmXi/lMnboQhnMQts=;
 b=HrjJz66kfMgZY3s9nLVAJ2XZANhYDl+2EOiCwlgL2sGLQnTFQLntTvEDAUdmI7ybMP
 WJS1WpHtJDVpc/N8+w/YGSh6tuMpv9+2+ty3RFZFG22dxPP64ARpAppjHqyy2F3JUOJF
 os0FbZBOnx0UPd7irTlvh8KfxhhjtiJJSqjvEBMGDud4c9ILgHi8RJOCxVAPrDg19tiJ
 vpy3/epb4oSW3BiOs4vshV7Jp9+8KfuMtPAq4/gVFU1tbayWZD1+YB4Yj5nyjwXM4eqW
 g1KGOnWaOWJnldjzJ0nb8UknuiIDjxWyeW/RrAgVGXU6fG1w8MCKnHm0wd6l1sLvlSau
 TQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/NlqyFxQvKGeBVsfPxxFWzMURaFmXi/lMnboQhnMQts=;
 b=Hz46pbR3G8lhvg5cRTcTyASyE3pA7Ahp9vGEYRIy4HBc/yPB7Gup2zN1agYSbaeaQU
 xPHjjgyea3khbrV7gyp/Dxk2lGga1FIIoNrYY6BrVGMsVjAkFz/rJIQTZhDrXzmDmaX4
 zhNZ0QEF89vFMBBPfCcYTDwPQGKTljp4qFWhVuoYpG9wW9Q/P3FjSFdYC6IGp16G/Jg2
 zZdWa1/KmPBvxnoGOG/3RiTySuasI5j7TfQHKUOAWCkPRH0VPxReHuDHlVmjDiT1O4iE
 lbOFOidEWXyKFW1XlXMRi9SiPT805lnUVJVLFOheMSOVBDflbo8u2MKV73Gh98Ie3Ge3
 aFiQ==
X-Gm-Message-State: AOAM533ZEuXrd/rPx+NX7QTHNYjN9PFYZ+Z9mNfhdpCShmMi6fh5Kc/a
 1CLM1A0jC80IgK/4wqkSzW4=
X-Google-Smtp-Source: ABdhPJyh8kG1uofIf2nZBqTxBDEGEe+NBfE8ufe1d4zrv9bFuEgTrq6uCxeIu7KOX+iLM/DO+oOqpw==
X-Received: by 2002:a1c:e906:: with SMTP id q6mr21040795wmc.138.1620038856199; 
 Mon, 03 May 2021 03:47:36 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id j13sm15921850wrd.81.2021.05.03.03.47.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 03:47:35 -0700 (PDT)
Subject: Re: [qemu-web PATCH] Update website to point to the new bug tracker
 at GitLab instead of Launchpad
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20210503103007.1034171-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <92c95d95-dd59-4e52-ee14-a6b3925d43e0@amsat.org>
Date: Mon, 3 May 2021 12:47:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503103007.1034171-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,

On 5/3/21 12:30 PM, Thomas Huth wrote:
> We've started migrating the bug tickets from Launchpad to GitLab, so
> it does not make too much sense anymore that users open new tickets
> in the old system. Let's direct them now to the GitLab tracker instead.

We should document the user has to request a Gitlab 'Reporter' access to
the project, and warn there might be a delay of some days before the
request to be accepted, before the user be able to fill the bug.

TBH this is annoying and could discourage reporters to fill bugs.

Personally I fill a bug when I have all pieces in front of me. I'm
less motivated to take notes of my environment to come back filling
the bug ticket few days later.

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  contribute.md              | 3 ++-
>  contribute/report-a-bug.md | 5 ++++-
>  support.md                 | 2 +-
>  3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/contribute.md b/contribute.md
> index d7e295f..cbb476d 100644
> --- a/contribute.md
> +++ b/contribute.md
> @@ -3,7 +3,8 @@ title: Contribute to QEMU!
>  permalink: /contribute/
>  ---
>  
> -* Report a bug in our bugtracker: [https://bugs.launchpad.net/qemu/](https://bugs.launchpad.net/qemu/)<br>
> +* Report a bug in our bugtracker:
> +  <https://gitlab.com/qemu-project/qemu/-/issues><br/>
>    See also [How to report a bug](report-a-bug/) or [How to report a security bug](security-process/)
>  
>  * Clone ([or browse](https://gitlab.com/qemu-project/qemu)) the git repository: <br>`git clone https://gitlab.com/qemu-project/qemu.git`
> diff --git a/contribute/report-a-bug.md b/contribute/report-a-bug.md
> index 1cc42e7..922f699 100644
> --- a/contribute/report-a-bug.md
> +++ b/contribute/report-a-bug.md
> @@ -3,7 +3,10 @@ title: Reporting a bug
>  permalink: /contribute/report-a-bug/
>  ---
>  
> -Bugs can be filed at our [bug tracker](https://bugs.launchpad.net/qemu/), which is hosted on Launchpad. If you've got a problem with how your Linux distribution packages QEMU, use the bug tracker from your distro instead.
> +Bugs can be filed at our
> +[bug tracker](https://gitlab.com/qemu-project/qemu/-/issues), which is hosted
> +on GitLab. Note: If you've got a problem with how your Linux distribution
> +packages QEMU, please use the bug tracker from your distro instead.
>  
>  When submitting a bug report, please try to do the following:
>  
> diff --git a/support.md b/support.md
> index 252351c..b622362 100644
> --- a/support.md
> +++ b/support.md
> @@ -41,5 +41,5 @@ response. If you can't leave IRC open and wait you may be better
>  served by a mailing list.
>  
>  * If you think you have found a bug you can report it on [our bug
> -  tracker](https://bugs.launchpad.net/qemu/).<br>
> +  tracker](https://gitlab.com/qemu-project/qemu/-/issues).<br/>
>  Please see our guide on [how to report a bug](/contribute/report-a-bug/)
> 

