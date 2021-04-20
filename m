Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9374A365822
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 13:53:54 +0200 (CEST)
Received: from localhost ([::1]:35192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYowz-0002eR-G7
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 07:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYov5-0001rv-IE
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 07:51:55 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:39920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYov3-00060J-Rm
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 07:51:55 -0400
Received: by mail-ej1-x629.google.com with SMTP id v6so56535721ejo.6
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 04:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ls/mWbl/L6KF7uI4URSMGx2X4UsBf+c4NIxbAp5nduw=;
 b=nGN6qscAzwtlZCOa6JPE6BkYxHAYZIF7FiSEuAegzU7n9IJsN78JKKilT/OiJzzdrb
 IdjHyjF5lQs/JwuOMHDprdoxVDN8HtKF3EUORdOOq/kwSmSq80ilOn6Elq8dcI51Uvpy
 xJ1n59pe0FVNvwkm3/QKvnySBMVzE7RrFqOcsny9eZY/puF5UXnbXnUL1klGfBfEqQZ+
 amjzXHpSxJ8aPgTtijcIyLYEMykS1SUFNEIPgcdSE98yJD0/az5bGk3/PDYpYwR2vFul
 2B7e/bvvR2l7wJv1iQ0UyB38qxwaiD7CXtmgQ6CCS1Tg5KWKoESSWCimJUnL4l3M2MWi
 4rxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ls/mWbl/L6KF7uI4URSMGx2X4UsBf+c4NIxbAp5nduw=;
 b=dsPq0RN2M30NY3BmUJ4Mi5gBIkXjF3ZZXmcLd9yfQU6Q0lZ9TNpNk250bJCKC/Gk7F
 l06HUJBgKch/lVH4yHU8QlsYJ9Cqphn3FmnseMuaIVG83UIGVfZWcP1HTDh+soxo/Id0
 8LJuiUdIxLGiNKa6LrLjrvAcKgsuNF75SiIPrrZifeLSmeoop37JUkCibsNZegNKUrrn
 xj32XaNYGprcwXOMVs8COoAjc6hFqpReGcAeJtrB6w0RSIKY7SPdDRa4f6Vd5K3DZA03
 WjLwoPdKCrehB6JV9zGFWh8Z8yamzlcl+JtUbTRGuMpYN5h8FkhbIjbzFfyGcxARG0rv
 8cCg==
X-Gm-Message-State: AOAM533j8mebMau5y1sYlKGvkPJ0dVGDYraP1sdliK7typWPfLNFFVF4
 IOgyZzPcwcArEwcrwf6mSiMsF+Uxa310iY5bVoGLOw==
X-Google-Smtp-Source: ABdhPJxH7O6hdQbkFIfm5nt3ofv7xBKh9dRXHhHdXcEET82NktaCmJI7+RJcsZzIImNlUkoXeWdzuowtRHCG3VQ3lJA=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr26975598ejc.407.1618919508363; 
 Tue, 20 Apr 2021 04:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210420051907.891470-1-armbru@redhat.com>
 <YH6Q+mnnzkx8lloR@redhat.com> <YH6d+LUPKqstoLHP@work-vm>
In-Reply-To: <YH6d+LUPKqstoLHP@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Apr 2021 12:50:56 +0100
Message-ID: <CAFEAcA8ARLDBXPL1kDYN8QXw_dC5t9vHEb=T06d2gX7tSkKFJA@mail.gmail.com>
Subject: Re: [PATCH] migration: Deprecate redundant query-migrate result
 @blocked
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Apr 2021 at 10:25, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Daniel P. Berrang=C3=A9 (berrange@redhat.com) wrote:
> > On Tue, Apr 20, 2021 at 07:19:06AM +0200, Markus Armbruster wrote:
> > > Result @blocked is true when and only when result @blocked-reasons is
> > > present.  It's always non-empty when present.  @blocked is redundant.
> > > It was introduced in commit 3af8554bd0 "migration: Add blocker
> > > information", and has not been released.  This gives us a chance to
> > > fix the interface with minimal fuss.
> > >
> > > Unfortunately, we're already too close to the release to risk droppin=
g
> > > it.  Deprecate it instead.
> > >
> > > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > > ---
> > > This is alternative to "[PATCH v2] migration: Drop redundant
> > > query-migrate result @blocked".
> > >
> > >  qapi/migration.json | 9 +++++++--
> > >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
> Yes,
>
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>
> Peter: Do you want to pick that up directly ?

Yep; applied to master for 6.0.

thanks
-- PMM

