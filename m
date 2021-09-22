Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383DA414A5B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 15:18:26 +0200 (CEST)
Received: from localhost ([::1]:57292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT28n-0007ku-8X
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 09:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mT1vw-0001Af-Oa
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:05:08 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mT1vu-0007Hs-Sz
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:05:08 -0400
Received: by mail-wr1-x42b.google.com with SMTP id u18so6618624wrg.5
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 06:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aJ66clh6OZ1uD4kSsGx5JQ3CeBW4KWGmGrFrDtC2pos=;
 b=bSNDTepi6i1YIUr9CvO3hEWHCOqmv50SbL6wn2ImcgxN+UNRgfheAKI+Qwns20QMaG
 SNoNyQGjFU9thXV7APykrr3VFAFQaMA4ZcJsK7sV1KFgMvnyO4sVbhNKyM7trXBRmmvv
 RKCxx/XLBziUMQbKj/oapPBVuryjx1TesfZIdL+fqhUcI3HXehXKFXF3sGlSghQoL7n4
 jhluWcwWWZ1xLxpWoxiaBoO2exv3MSMMyNQ/kFeG5fq3wkQ2ZFAapfvpbiJh5acpNwC7
 EMe7E1SnEPqqwFRWtlWaDXxDZoRV6/fZfouKiIRVYToSDOwjLMf0rCFAglK4Pu+CI5sk
 f57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aJ66clh6OZ1uD4kSsGx5JQ3CeBW4KWGmGrFrDtC2pos=;
 b=bUGoRS6+YyuafQ4S3EGzDNCc2HCRI9sZZJ8AKaTudDUvb6gtO3KQq72/bGHIyA8OSm
 AJsC3hwGfhluzWXHyXIu0acab+o8ZgEoq4dLU7+p+mWFP0sQU43kzuw3M+gIXN26cInp
 xke2lBQ9YcoHqpNYRoQzB7jgu+Ibn+vJUeph5PSt1u9E5H2Uk9gLktZbhkEN22U+HbSJ
 brAkZbz6+MlfrNuNfSyWxZ4gAfHIOor4gxevVGAAzsMY118NWad7yA7ciUMrsc5Kjo5e
 JgAET+RhqmBu0odKioaKA9xTNoCJmlNpjtW+GTIL633aI6aKR3/BTf9VjNfhb3s31mYV
 j1aA==
X-Gm-Message-State: AOAM530BtygqFw/bsIKakQNhtoUwTMsMVsYJh5oTyJP493hze5/vrrtB
 FsEmbFKGzDRUJvHcS457w0o=
X-Google-Smtp-Source: ABdhPJzAiMo0pX9GBYBnSkhDgKzxMdSeRaHZ0JsRnmjHwb+3iSARJqijjTNDkW9cCbjRaysVSF05qw==
X-Received: by 2002:adf:f4ca:: with SMTP id h10mr41887927wrp.159.1632315904617; 
 Wed, 22 Sep 2021 06:05:04 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id i18sm2137733wrn.64.2021.09.22.06.05.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 06:05:03 -0700 (PDT)
Message-ID: <09166fcf-7170-e466-0221-958703146fc5@amsat.org>
Date: Wed, 22 Sep 2021 15:05:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/3] docs: rSTify the "TrivialPatches" wiki
Content-Language: en-US
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org
References: <20210922121054.1458051-1-kchamart@redhat.com>
 <20210922121054.1458051-3-kchamart@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210922121054.1458051-3-kchamart@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kashyap,

On 9/22/21 14:10, Kashyap Chamarthy wrote:
> The original wiki is here[1].  I converted by copying the wiki source
> into a .wiki file and convert to rST using `pandoc`:
> 
>          $ pandoc -f Mediawiki -t rst trivial-patches.wiki -o trivial-patches.rst
> 
> [1] https://wiki.qemu.org/Contribute/TrivialPatches
> 
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---
>   docs/devel/trivial-patches.rst | 53 ++++++++++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)
>   create mode 100644 docs/devel/trivial-patches.rst
> 
> diff --git a/docs/devel/trivial-patches.rst b/docs/devel/trivial-patches.rst
> new file mode 100644
> index 0000000000..4ad0d25b9d
> --- /dev/null
> +++ b/docs/devel/trivial-patches.rst
> @@ -0,0 +1,53 @@
> +===============
> +Trivial Patches
> +===============
> +
> +Overview
> +========
> +
> +Trivial patches that change just a few lines of code sometimes languish
> +on the mailing list even though they require only a small amount of
> +review. This is often the case for patches that do not fall under an
> +actively maintained subsystem and therefore fall through the cracks.
> +
> +The trivial patches team take on the task of reviewing and building pull
> +requests for patches that:
> +
> +- Do not fall under an actively maintained subsystem.
> +- Are single patches or short series (max 2-4 patches).
> +- Only touch a few lines of code.
> +
> +**You should hint that your patch is a candidate by CCing
> +qemu-trivial@nongnu.org.**
> +
> +Repositories
> +============
> +
> +Since the trivial patch team rotates maintainership there is only one
> +active repository at a time:
> +
> +- git://git.corpit.ru/qemu.git trivial-patches - `browse <http://git.corpit.ru/?p=qemu.git;a=shortlog;h=refs/heads/trivial-patches>`__
> +- git://github.com/vivier/qemu.git trivial-patches - `browse <https://github.com/vivier/qemu/tree/trivial-patches>`__
> +
> +Workflow
> +========
> +
> +The trivial patches team rotates the duty of collecting trivial patches
> +amongst its members. A team member's job is to:
> +
> +1. Identify trivial patches on the development mailing list.
> +2. Review trivial patches, merge them into a git tree, and reply to state
> +   that the patch is queued.
> +3. Send pull requests to the development mailing list once a week.
> +
> +A single team member can be on duty as long as they like. The suggested
> +time is 1 week before handing off to the next member.
> +
> +Team
> +====
> +
> +If you would like to join the trivial patches team, contact Michael
> +Tokarev. The current team includes:
> +
> +- Michael Tokarev
> +- `Laurent Vivier <mailto:laurent@vivier.eu>`__

I asked Michael if he could send a qemu-trivial@ pullreq last month
when Laurent was on PTO and he said he hasn't done it in years.

Indeed:

$ git log --committer='Michael Tokarev'
commit 9a232487aab8a7640ff8853d7d8d7c27106b44f8
Date:   Fri Apr 13 18:45:45 2018 +0200

So I think you are trying to commit obsolete information.

Anyway, up to Michael to adjust.

Thanks for rstifying the doc :)

Phil.

