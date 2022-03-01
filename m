Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3934C8CA3
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 14:28:49 +0100 (CET)
Received: from localhost ([::1]:58678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP2Ya-0008Ai-84
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 08:28:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nP2Vy-0007Gj-GH
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 08:26:06 -0500
Received: from [2607:f8b0:4864:20::b29] (port=42728
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nP2Vp-0002FB-Bl
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 08:26:06 -0500
Received: by mail-yb1-xb29.google.com with SMTP id f5so3365132ybg.9
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 05:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jCzxGsblQdeuEnY02w8XtrWq18MgV0b5E9iRxxHgPBA=;
 b=OH2pP5pogOP+ztkHoRU9BTtxWhymiosUKNNzI0Q4hR6P8CJ4RUMDWO+ZRiWhBNe/fl
 I/Ye2zSel87uO4RNs9t29r/hUq6PR3+lkXsTaSug6oJXuOVrc/lVr31McYHeiI2GQ8hY
 N7LP+Red6p0PopTK6y9NF/YC5a8VdaDwaPtRv3oR0ZRQcaF5114Pw3i/g4lpmkTERLsu
 IL0zcjwFVG14tWJoJoDGIIhfPD+1eeSQCq+Soe5EneVoeJHJtKzZgLK4yKri0Pykk7Y4
 FSgIckeg4gR+QAAguXP/cdR/H4Ofp4MnpY7UP65qI13+QcQYApKtJqPxnoosKQt0inQx
 9e6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jCzxGsblQdeuEnY02w8XtrWq18MgV0b5E9iRxxHgPBA=;
 b=6ARKRJoBmbO7dZ3j/1p7FwvH2UU53iXTW+atmU8URzN7PK6og8zxUlqmG+6Oxt0AFz
 +XXyOjolejFA3+2vLox4JtmJK/jsqezYGoWoXMniMEcz4H/4cXT5Q/qdEYIlgVOXjl3w
 2h1zNPFfenLEkRZjYpQOz+UUWZTnDpO9VgK8tL6dAPN0borip5r13/Qtzi9kG1kwveI2
 1uVKkU7AZSSTmYYE05GOMfUE7mx4gkaXDtg+Aa5MxSFjKYP16K33Py7/3q93+fvcvF29
 YSCIlMCxS2VHre1KJQ8C7pV1I05pAJnNNY2KWAjnS8rCfMCx97Ya7/Hs0+K+QUY5BHFF
 NFPg==
X-Gm-Message-State: AOAM5316eE7Z+R3rdozPBn7SybH9YdbiJmhiIeepH+jH5HIQraHyhTj9
 RCfYkP6rTuFw4+OcSvnVLLvlb01vqBMRo6UVda9TNw==
X-Google-Smtp-Source: ABdhPJxxJSmWNpmpeb3QZR7hpm0qrFa2O7m9jVb+YsDL5Tt1V5sd61389V0qw7rUYkmWoQ5K566iQboTGZIj6I0Nc3o=
X-Received: by 2002:a25:dc87:0:b0:624:4104:a331 with SMTP id
 y129-20020a25dc87000000b006244104a331mr24009965ybe.67.1646141154607; Tue, 01
 Mar 2022 05:25:54 -0800 (PST)
MIME-Version: 1.0
References: <20220228112613.520040-1-armbru@redhat.com>
In-Reply-To: <20220228112613.520040-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Mar 2022 13:25:43 +0000
Message-ID: <CAFEAcA9YfpNX=3B52zHUuSOwzcAaQc3EG5CUcsE-sEYjjmkBhQ@mail.gmail.com>
Subject: Re: [PULL 0/9] QAPI patches patches for 2022-02-28
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Feb 2022 at 11:26, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit fa435db8ce1dff3b15e3f59a12f55f7b3a347b08:
>
>   Merge remote-tracking branch 'remotes/jsnow-gitlab/tags/python-pull-request' into staging (2022-02-24 12:48:14 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2022-02-28
>
> for you to fetch changes up to 1428502c8c0c0cfbb04212558144fef970042cf3:
>
>   qapi: Belatedly adjust limitations documentation (2022-02-28 11:39:35 +0100)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2022-02-28
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

