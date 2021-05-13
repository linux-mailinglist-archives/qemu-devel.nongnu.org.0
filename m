Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7555837F8D3
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 15:34:01 +0200 (CEST)
Received: from localhost ([::1]:46972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhBTU-0002Zl-Fw
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 09:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhBSA-0001TC-Fw
 for qemu-devel@nongnu.org; Thu, 13 May 2021 09:32:38 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:37663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhBS8-0001ie-He
 for qemu-devel@nongnu.org; Thu, 13 May 2021 09:32:38 -0400
Received: by mail-ej1-x62f.google.com with SMTP id w3so39897531ejc.4
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 06:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jm4jyBCILknS+0M8fQvmodUPsGJL14Vt24l23hh8MW4=;
 b=iFqm6DsA5AtXF010VN1CwDCrOmRLwlivKgBLQqrDit1sL7vyMpOkHRlCMllieRir1L
 oO/RdrfMqb1khlYM4sPYw5P+BKqxMj6rcITGQjA2eKqFqdLLh0ECsZvo/LDD0pJdwqi7
 5gA/lR1GlIn/j2/fuNQrV8MiWVAWEHjhiaea1o3XkqDlyoKVglS0vN1kIZK5vkoaTOVt
 IBvP7xNXLsDjFV6oeQ+T+1XtfXv2nW3RUpCfqI+7jzysvCIWdKU2CzW0wk9y4o/ukb6S
 gUHJjRlECunhSYwuO2ToD8jSGPSNyodsKvVc/6glCW34/pn7sxbTrtNjXS6ip7hLx4Mi
 OPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jm4jyBCILknS+0M8fQvmodUPsGJL14Vt24l23hh8MW4=;
 b=iFKvSGgXlLeLA4RBVXuhfMep9xslZVqXI3o1opHkJChifpDaORzVJqU2YAbH14fgb5
 8qA/wqJFvyKA63sCRsNt4guC6z8zGzSsyyk7HvGK+wRYUpCWENwFyj3r5z3inlAvMVXL
 8LsEOH2UIXVhlRwbgjesHqlgnBWkEl3S+NbfIER4LMAUdwpZDVSWw6NwGmlBXkmP97MU
 u79l9BT4+J5pA3CEcqrEEuMqezEYNLpm1BBXEaE/e4M2qo+x4qkNMsaKdkdQtaDBzjAV
 okAcyg4qXymDs3MdLgRmPDdwHMyQogX9xItgJ17861qYIKan05WX5YwI/Fhh0PxtSQOK
 o3WQ==
X-Gm-Message-State: AOAM530X0euecTypJ7ZLw9EnT75zlhOGClSbhIqglHrSmghEtOSOHn8k
 xj1RqvKxhU5wUm+B1FvzrFLPX0EY0PSmGnQnDpZWKg==
X-Google-Smtp-Source: ABdhPJxFB+v1skeQfwqiBPlgUftq6dty9AVs89wRvmt+hf9U54OISDgeknKiIj1Q29PwiqBb1a9fqOCe18+ujp1DXOI=
X-Received: by 2002:a17:906:980a:: with SMTP id
 lm10mr14251176ejb.482.1620912754765; 
 Thu, 13 May 2021 06:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210511150842.207155-1-dgilbert@redhat.com>
 <CAFEAcA-caAPn5Lzt=t2u7V5zWkdhbADdSQWd74v+OMOcRqD-ow@mail.gmail.com>
 <YJ0m5lUl4lWRZw4M@work-vm>
In-Reply-To: <YJ0m5lUl4lWRZw4M@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 14:32:23 +0100
Message-ID: <CAFEAcA_LUhH-wU6Bd-qe3MVYqYJ05pgpSnrxCrcvJ=3dmibkkA@mail.gmail.com>
Subject: Re: [PULL 00/17] migration queue
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: David Hildenbrand <david@redhat.com>, Kunkun Jiang <jiangkunkun@huawei.com>,
 huangy81@chinatelecom.cn, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 May 2021 at 14:17, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > Fails to build on the gitlab cross build job:
> > https://gitlab.com/qemu-project/qemu/-/jobs/1258047823
> >
> > ../migration/ram.c: In function 'host_page_from_ram_block_offset':
> > ../migration/ram.c:3092:12: error: cast to pointer from integer of
> > different size [-Werror=int-to-pointer-cast]
> > return (void *)QEMU_ALIGN_DOWN((uintptr_t)block->host + offset,
> > ^
>
> Interesting; it's compiling fine on my i686 debian chroot I normally use
> to find 32bit-isms.

Yeah, it was ok on the 32-bit machine I use too. It's maybe
a bit of code that's hidden by ifdefs or whatever on my setup
but exposed on the gitlab builder.

-- PMM

