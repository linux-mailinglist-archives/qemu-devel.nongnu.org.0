Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9ED57C8C9
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 12:17:03 +0200 (CEST)
Received: from localhost ([::1]:60596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oETEs-0000Z5-KU
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 06:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oETAH-0006Zb-K2
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 06:12:26 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:37562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oETAD-0005yZ-BG
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 06:12:16 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-31e623a4ff4so11960737b3.4
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 03:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n83NQ8xBoGvkqTZvtQVMAclVRRfjvXVDdEVSiqLfdks=;
 b=Yu0fTa6VI+DsWKfwGFKoMqjsW+06jjUdy+iY0mAyheE6PXzCIqL4xA+9ZL8PIouHZ+
 porrvYD9AiBSjP3QFNOOTxJd/JNTGoZozbSyzgcY4eBSBVRRQm1OAXs6EcmIVQQs15KY
 gIri8fOCeK3m+0YEQ3vX1n5x8fSRPkkWNRPvU4ogdrIvhOB51m+UgLWh44XOZVsnXRRm
 D55RwxggISlqI7WZAOrDTbJb18IIvxO5BCh6sITtNWycb8SMIj0FOHqI/40rruenurqT
 8mugSdSFADtRZYfBdOfnlwdTb571gnxnF2rgCRKB8XU3jT/eLS5uj27sVVw6a2BbJjj+
 mbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n83NQ8xBoGvkqTZvtQVMAclVRRfjvXVDdEVSiqLfdks=;
 b=iniZ8jH1f6v+hhQYp8gmVd+tFdThJWshhogP3ETyZu9OuBJnJpU7Qhp37punrAzGY8
 ccZrBu60GM8pbBcdDysniftL3BJJYOfXeL0dsyyhAOIoMdPLdmRLXFlYEj7R1BTE3iy8
 1FIfo/+4wkQDqxoaA2o/O2MakfMbRD5av1DVVTWiOaZQqZNWWpIc63TssfjQgSSS8lpL
 Kot6SoNpsZU5SjRZLv60/OqKWnV8wVNWNW/f21cGmLct0+6J9JY7cYqEsr6dx/1jLurN
 TkxTskJjJzGCb9csMKrWkuFctGOP9kuxrzguapeiR/FT9yBt3BoDseZXmqL4n2eHIACF
 jO9A==
X-Gm-Message-State: AJIora9VDpSPyvPaJNJ4rHr5rPjToykVEaorEckBUWQlwO21ZsROFjCk
 Ye3WDYweP3FK2BqMNKlFKbTL73gsTsBCasJPIGSH5A==
X-Google-Smtp-Source: AGRyM1ts1YsRue+MgnXbZr0qjTZXP8vYLdmjoX/JMi440GlHYH8JDcHRLozrKAlvxjpeJY9jsQJIXFPunusrp7nX/Vg=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr45330467ywb.257.1658398331354; Thu, 21
 Jul 2022 03:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220720111926.107055-1-dgilbert@redhat.com>
In-Reply-To: <20220720111926.107055-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jul 2022 11:11:31 +0100
Message-ID: <CAFEAcA-1xvEJhPD-sN+TO4P_Gtdge1XKwtPvaNak8LCvDmX8nw@mail.gmail.com>
Subject: Re: [PULL 00/30] migration queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, leobras@redhat.com, quintela@redhat.com, 
 berrange@redhat.com, peterx@redhat.com, iii@linux.ibm.com, 
 huangy81@chinatelecom.cn
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Wed, 20 Jul 2022 at 12:22, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit 68e26e1e812c8b09313d7929271f6cbd47ef4c07:
>
>   Merge tag 'pull-la-20220719' of https://gitlab.com/rth7680/qemu into staging (2022-07-19 22:54:43 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220720c
>
> for you to fetch changes up to db727a14108b5f7ee1273f94e8ccce428a646140:
>
>   Revert "gitlab: disable accelerated zlib for s390x" (2022-07-20 12:15:09 +0100)
>
> ----------------------------------------------------------------
> Migration pull 2022-07-20
>
> This replaces yesterdays pull and:
>   a) Fixes some test build errors without TLS
>   b) Reenabled the zlib acceleration on s390
>      now that we have Ilya's fix
>
>   Hyman's dirty page rate limit set
>   Ilya's fix for zlib vs migration
>   Peter's postcopy-preempt
>   Cleanup from Dan
>   zero-copy tidy ups from Leo
>   multifd doc fix from Juan
>   Revert disable of zlib acceleration on s390x
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.1
for any user-visible changes.

-- PMM

