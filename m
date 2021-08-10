Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF733E7B94
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 17:01:41 +0200 (CEST)
Received: from localhost ([::1]:55684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDTG8-0007JP-Oo
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 11:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mDTEf-0006RA-S4
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:00:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mDTEd-0004iM-2s
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:00:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628607606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=atn1ykfY5ibRm+jWgTCfoGXpKNOGlV8c2sTQnXX116E=;
 b=YmXqhw8zV/ghCxhqeQBRV6JnTra2toCBp7OF/uaIcqasYMkua7AcB+EAFuz15XD/tzcCzx
 RIc+NupTKZ0WFQGng1eAGPMkqwpkU3+a3duRP4ATeTLg0sV83CoKNcBEp8CjWKP89YvNc/
 ymIPMnSSKB7Wcd3nNOlzQ5xKZbmqPmQ=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-_12LkcexNCyMyCZWhhtOEQ-1; Tue, 10 Aug 2021 11:00:02 -0400
X-MC-Unique: _12LkcexNCyMyCZWhhtOEQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 r23-20020a17090aa097b0290176fc47a8b7so2532610pjp.6
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 08:00:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=atn1ykfY5ibRm+jWgTCfoGXpKNOGlV8c2sTQnXX116E=;
 b=F/4YXeUPcIhgxSfYO1jisaEy7wgPq0QfIoafvZ1FvqGzdQ9aWjJQH+yeWtZ2kXjZgy
 Fa7qNAYz9dRusaj6oiZuQahnxG/X6reDPZHgdpOlIk66D8oyVjm5ZOvSj+O5ulGNTwqy
 I3QL7sl0CEXo3Xunggt8h+eKSVQQBITFC2Rh4nmlxuGbe91HbXG87kF9Rgq1RWW+bolF
 asK4HUNyhLOji85Z97/IMUC/oGdL/D9lj+/yRCu6+SjwCIpDY1kb4JGC9q1En1qp/NMS
 uJ/lu2afFGK5mfvbnUJf19wwEouYN8u2wizqbShfVS7r7Z0nRB71ky14YtDEAFNX7X3w
 Q5Jw==
X-Gm-Message-State: AOAM531Cn9zlPAF46WoK6yNPjMojbXsz+QIu0SQ8YfiMrMCr3rVwGbmr
 yTcQAvwCdd6EUXEs8wjq6Fh6+PxZT5kX3u8I2H/Lnplv2iuEyelo4+gZ1bAhfhrPrFDdZNIwLN2
 VjR4aQcv+pMWUhb859O98zsCHC4Lunrg=
X-Received: by 2002:a17:90a:de16:: with SMTP id
 m22mr5453394pjv.38.1628607601915; 
 Tue, 10 Aug 2021 08:00:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUyfAwtiL1E5Q2aZa2htZrMawhfcGR5lQyeUFPagCYCcXsv+PPSqpNnuxLaZc60ojykcQq6jT/1A9ZnWvIzVA=
X-Received: by 2002:a17:90a:de16:: with SMTP id
 m22mr5453364pjv.38.1628607601651; 
 Tue, 10 Aug 2021 08:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210810140653.3969823-1-berrange@redhat.com>
 <20210810140653.3969823-3-berrange@redhat.com>
In-Reply-To: <20210810140653.3969823-3-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 10 Aug 2021 11:59:35 -0300
Message-ID: <CAKJDGDYOU-9iUCaLgrYQN4tTohwnPcttBT6P7p=_T5fqZbeTBA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gitlab: skip many more targets in windows cross builds
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 10, 2021 at 11:07 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> The windows cross builds still take way too long in gitlab CI, so need
> more targets to be skipped. We don't want to hurt coverage of other
> cross builds more though, so we let jobs fine tune with a new env
> variale $CROSS_SKIP_TARGETS.

s/variale/variable

>
> We take the set of targets that are considered relatively niche or
> very old architectures, and skip approx half of them in win32 builds
> and the other half of them in win64.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  .gitlab-ci.d/crossbuild-template.yml | 2 +-
>  .gitlab-ci.d/crossbuilds.yml         | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


