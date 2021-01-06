Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6792EBDD7
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 13:46:38 +0100 (CET)
Received: from localhost ([::1]:33368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx8Cy-00010t-O4
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 07:46:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kx8BQ-00005q-0E
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 07:45:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kx8BL-000348-Mq
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 07:44:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609937094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ANcme2vQQV+Aiq8kM4Mu/zAG8oLfEDfdRisUjwrXyUY=;
 b=fyQAHGCilN1Se+mIFFoLyDJq2/G+om2Wbc2TVCSM7h8QK38RNAY90m7crCMPQpX2g9JwZd
 8WuiGoLqslteoVwBfgf13WC+5beNOAcGFBAbeSva3gfQsdV96dOCWFBn2JLc81jppEzEAR
 idrWtku2SL4uzMJtguIsk/PByEOd+u4=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-djRaloXbMr-lsr0dO-1j-A-1; Wed, 06 Jan 2021 07:44:53 -0500
X-MC-Unique: djRaloXbMr-lsr0dO-1j-A-1
Received: by mail-vk1-f198.google.com with SMTP id f139so1424469vke.23
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 04:44:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ANcme2vQQV+Aiq8kM4Mu/zAG8oLfEDfdRisUjwrXyUY=;
 b=P73zFT84MhwAjg2K0n6wu7zaihwH0/oOQNUPpwhyNw8TZV5DkvXV3TLxUzZt+9qHeC
 75hDV/dhXYQ3AKKyPoQbg1//3KWkhWsKhYrcwae2qM0OMtZO+2R2pOIOy/XqwCcBAxI3
 /7SjV+cv8M8J4FkRL9S+iajp1g5aJ61cTQC1Zab/eSEjyYHJaM6bSgdqANGq66A6joCl
 FpxMxtNyW459IzmtlofVT347PkJaziPwHhVEHy91GzD9nVFGKr3ffzYXVTjxblz4krtA
 DgGkKdfebW7sjxrysAj0WavAYcxZnELA2IdO8MZy6CV+Ee98Ybe2wWXxXBFaR3VXFXRC
 m+BA==
X-Gm-Message-State: AOAM532ibvNrMECPqx9acFOzbzVGQSBC9UHvh6fgI5j+CF3S9QLL+1OS
 L/AJMCsLJCtBPt63OOWVlert+aM/jIxzTi1hcbyNkYR6jDuST5glQfFUN5YoT0g0Ork9ReSFRc+
 9eRzy2YdakKYAKKQXq/hPqQCyaf9Fx50=
X-Received: by 2002:a05:6102:7d8:: with SMTP id
 y24mr2744354vsg.50.1609937092718; 
 Wed, 06 Jan 2021 04:44:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwovESwWmTovzPRiqPv+3U26+ofuvS7jF8UTZhSfKZSR+9XJm2Zil9zOcP9vuzYn9DQifZo761CfV/c59nCtkg=
X-Received: by 2002:a05:6102:7d8:: with SMTP id
 y24mr2744339vsg.50.1609937092451; 
 Wed, 06 Jan 2021 04:44:52 -0800 (PST)
MIME-Version: 1.0
References: <20210106114159.981538-1-berrange@redhat.com>
In-Reply-To: <20210106114159.981538-1-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 6 Jan 2021 09:44:41 -0300
Message-ID: <CAKJDGDYWvdOCJt=13Ue=pGaFtewptVeBFofT_ywdSye8KRBRCw@mail.gmail.com>
Subject: Re: [PATCH] cirrus: don't run full qtest on macOS
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 6, 2021 at 8:44 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> The Cirrus CI macOS build hosts have exhibited a serious performance
> degradation in recent months. For example the "qom-test" qtest takes
> over an hour for only the qemu-system-aarch64 binary. This is as much
> 20-40 times slower than other environments. The other qtests all show
> similar performance degradation, as do many of the unit tests.
>
> This does not appear related to QEMU code changes, since older git
> commits which were known to fully complete in less than 1 hour on
> Cirrus CI now also show similar bad performance. Either Cirrus CI
> performance has degraded, or an change in its environment has exposed
> a latent bug widely affecting all of QEMU. Debugging the qom-test
> showed no easily identified large bottleneck - every step of the
> test execution was simply slower.
>
> macOS builds/tests run outside Cirrus CI show normal performance.
>
> With an inability to identify any obvious problem, the only viable
> way to get a reliably completing Cirrus CI macOS job is to cut out
> almost all of the qtests. We choose to run the x86_64 target only,
> since that has very few machine types and thus is least badly
> impacted in the qom-test execution.
>
> With this change, the macOS jobs complete in approx 35 minutes.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  .cirrus.yml | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


