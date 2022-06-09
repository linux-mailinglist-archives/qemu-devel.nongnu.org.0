Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69797544FC3
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:47:47 +0200 (CEST)
Received: from localhost ([::1]:59528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJRq-0004D5-GJ
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzHhu-0007Jy-1A
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:56:14 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:41958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzHhs-0004b2-BD
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 08:56:13 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso20990771pjg.0
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 05:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KfIRm17UYIFjEfN3ubXFf0+/OYQFgp7VCczp8lGobOg=;
 b=jzweONoA1hTWXwO7z5VmE+ruBn0TJEtQoehTFx4aYRQPQhXkYUP9pJPrgQUUF+z9t7
 RO7GYUCnRgQpWMsDrUV0JJQAe7f4Br7VPTmotgkMVUZ3L4AHzXgMNMbYMXc1gcA/TsR0
 cIaDY3DSREjfddfD2RrxXZJncyrSnEhQ2jU2A5nfBxQgZ4bgoC9gaS0YU2HDPcLWxH0r
 UdCIvEQ4ClDtZOdF2i+3dX93tM+puftu/7yTP1nwfKAhD5BjH8XfJ7nTkXK3B31qtmF8
 NE0vVgHzrd/c15++N62RVlkPA4Nd/2wripUdR8W4f/ikLJX1IZ3djbY4ueZyvCtdhCue
 3HNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KfIRm17UYIFjEfN3ubXFf0+/OYQFgp7VCczp8lGobOg=;
 b=ufbM8kzLPWVyX8K9MJAZLU6AFcuPfbvczINMlcIyTSyyx813jLpPTJgN3f0GiA3JbF
 PlV+xQJpsHttyQWBANYb+9f/4q9GGpROJINtGz1WZPtWW3k/dzwn3+mTkSgZ0noLVfdZ
 gXPRSU17hlPpTR4Cu2rUsp0DbvTtmI/aXi1G7cEzq5vPpRwmhHVCiA7qRkeD+9JIqrdD
 RSdyFhy3fkhFgrr28D7awT9uNuqwi3ct/6bGItDTiAOox+rHEZ+ECtuv4Jc6bOlvDEqG
 VYNQXM1AJX/MKTGri9tF3fIVSPHyD+I/K7LGrkadBAOZciuB3UxAdLymODaZ7eO+i58q
 TpMA==
X-Gm-Message-State: AOAM531giC67BAnzrRdqv2RWytsh9PyWoJliFu1j730Telgw6bM/m/Ki
 Hca90eQU4i76QWG6Yt8noDT/oTyswc1SYaeypK7mEQ==
X-Google-Smtp-Source: ABdhPJzzsPj1wMCqD+hQIub1yHyr8mxDdDHKQkACPIoejGgvQwK8YWwrbMcB/PMf1cf187XtVlka0IzaO2975qQQ5ZQ=
X-Received: by 2002:a17:902:930c:b0:167:8960:2c39 with SMTP id
 bc12-20020a170902930c00b0016789602c39mr17563019plb.33.1654779370339; Thu, 09
 Jun 2022 05:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220524110235.145079-1-berrange@redhat.com>
 <20220524110235.145079-8-berrange@redhat.com>
In-Reply-To: <20220524110235.145079-8-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 13:56:00 +0100
Message-ID: <CAFEAcA-nv+chmz1ih7FQp-Ptyx9qLSy8AbxRitcafiWNbDZUNQ@mail.gmail.com>
Subject: Re: [PATCH 07/20] migration: rename qemu_update_position to
 qemu_file_credit_transfer
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>, 
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 24 May 2022 at 12:46, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> The qemu_update_position method name gives the misleading impression
> that it is changing the current file offset. Most of the files are
> just streams, however, so there's no concept of a file offset in the
> general case.
>
> What this method is actually used for is to report on the number of
> bytes that have been transferred out of band from the main I/O methods.
> This new name better reflects this purpose.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

>  int qemu_peek_byte(QEMUFile *f, int offset);
>  void qemu_file_skip(QEMUFile *f, int size);
> -void qemu_update_position(QEMUFile *f, size_t size);
> +/*
> + * qemu_file_credit_transfer:
> + *
> + * Report on a number of bytes that have been transferred
> + * out of band from the main file object I/O methods.
> + */
> +void qemu_file_credit_transfer(QEMUFile *f, size_t size);
>  void qemu_file_reset_rate_limit(QEMUFile *f);
>  void qemu_file_update_transfer(QEMUFile *f, int64_t len);
>  void qemu_file_set_rate_limit(QEMUFile *f, int64_t new_rate);

What's the difference between "credit transfer" and "update
transfer" ? The latter also seems to just be adding a number
to a count of bytes-transferred...

-- PMM

