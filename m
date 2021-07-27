Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFE83D78B8
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 16:44:04 +0200 (CEST)
Received: from localhost ([::1]:39666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8OJP-0002iK-J9
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 10:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m8OIf-00022B-Ig
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 10:43:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m8OIc-0006EX-1h
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 10:43:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627396992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IBkWcG29FM8yKxsPfXeFA/J5fEcreUx2TQkNK1oQcAw=;
 b=Jlo5uFebOREY9G5it+9VlouC6CrbJwYAlnYI1AVnRU8v6XaXi9t5lhZaynokuJYStj23EU
 t3rtEdFidtDFP9lF5Q+FYLY9MdaeScLHHlDGVC0jBZ7vOZ3LB4XF6z3wagMVP/wtfk2x1p
 gaeByiISUlOfr9yIisZKvtux04KN170=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-AoOd_tXOMn--7mFpoYdZJw-1; Tue, 27 Jul 2021 10:43:04 -0400
X-MC-Unique: AoOd_tXOMn--7mFpoYdZJw-1
Received: by mail-pj1-f72.google.com with SMTP id
 r11-20020a17090a2e8bb029017382031497so15300224pjd.5
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 07:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IBkWcG29FM8yKxsPfXeFA/J5fEcreUx2TQkNK1oQcAw=;
 b=Vq4I25/l+T9wdh+D7aACw157viPNasykl52EQRGW1jpubzKFq+FPQrAHneG8G84T5z
 1lqaoxjT2kvV0pNB3L1G4NFNuB0FXy9piHGvfRpTHabA8+QlAlBAbmQQfJ9JgtP7Po30
 gT7THP/Zgx8mCg6M/ScCobQ0NCU4MpZ49IK5mu7Y+Zb39OwgD+Y/kti7nKzv6Uxx3NzS
 87MSm1FxqOG5m2aN7BrX+rXxx29qPA7fYdYHiqo/gT75iYBrJzTGDo+FewUtWFxxjGr5
 hDEpiCwb8Bd+s2qDjyzy4K7XTYtwpBwJF1E1j2LzkYMQcxdbT72kEPJB8zGbhacNX8tO
 bSgg==
X-Gm-Message-State: AOAM530OzWQd/36ayL70xcK2SYEsCxo5pA7AtFFS1qDKt4s1Dx2nTqkm
 jBqN0mnWRTw+wx4zlwDpJBWloQItIcUCTREvIBFSEXOdQTMniHx0TuAqyvJ35HbhiXERnuNtEMt
 LhqBYFoeou9FSh6BlmlobYds2lMFzk+g=
X-Received: by 2002:a65:6243:: with SMTP id q3mr23951105pgv.297.1627396982973; 
 Tue, 27 Jul 2021 07:43:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybLeYBE5UwZIczUWRUDjokXv6qW4kUGhOU91kmQwwhc1c9kyR+Xhgdaz8zzGBYE/9g8KEDVjg1l/753J/gTog=
X-Received: by 2002:a65:6243:: with SMTP id q3mr23951081pgv.297.1627396982692; 
 Tue, 27 Jul 2021 07:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210723113051.2792799-1-berrange@redhat.com>
In-Reply-To: <20210723113051.2792799-1-berrange@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 27 Jul 2021 11:42:36 -0300
Message-ID: <CAKJDGDYQ2h3V52cRNNDrh_QWpHUnaep6coPKoEVNfR6BQEQ=zg@mail.gmail.com>
Subject: Re: [PATCH v2] gitlab: only let pages be published from default branch
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 23, 2021 at 8:31 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> GitLab will happily publish pages generated by the latest CI pipeline
> from any branch:
>
> https://docs.gitlab.com/ee/user/project/pages/introduction.html
>
>   "Remember that GitLab Pages are by default branch/tag agnostic
>    and their deployment relies solely on what you specify in
>    .gitlab-ci.yml. You can limit the pages job with the only
>    parameter, whenever a new commit is pushed to a branch used
>    specifically for your pages."
>
> The current "pages" job is not limited, so it is happily publishing
> docs content from any branch/tag in qemu.git that gets pushed to.
> This means we're potentially publishing from the "staging" branch
> or worse from outdated "stable-NNN" branches
>
> This change restricts it to only publish from the default branch
> in the main repository. For contributor forks, however, we allow
> it to publish from any branch, since users will have arbitrarily
> named topic branches in flight at any time.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  .gitlab-ci.d/buildtest.yml | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


