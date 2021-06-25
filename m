Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B546F3B489D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 20:09:50 +0200 (CEST)
Received: from localhost ([::1]:43576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwqGz-00066y-4u
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 14:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwqG1-0004rt-Le
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:08:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwqFy-0006U8-Cn
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:08:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624644524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BFbG31uRuLThsGH1x6hrSJEj0e74yt9sxvb+DxV+uXg=;
 b=UNQgSOsPR02zgOj+2AHmGp92j0L2CikQK/5E7A3Q2sJwlc7ypI7Q+Zamhdddxh/h2aeV6R
 67ka6AEqgGYFP8t5AcpPKXARBoDo18/i9zubGomxavFRhWGVNpv5GXPKdfSI952ZuGE1Fk
 sjmKrczFweyslbKcPewr8Sqtp1C9N78=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-u9_i_NiHO0Wsrr-ZBjyFhA-1; Fri, 25 Jun 2021 14:08:42 -0400
X-MC-Unique: u9_i_NiHO0Wsrr-ZBjyFhA-1
Received: by mail-ua1-f70.google.com with SMTP id
 h22-20020ab02a960000b029028c253cd10bso835141uar.16
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 11:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BFbG31uRuLThsGH1x6hrSJEj0e74yt9sxvb+DxV+uXg=;
 b=KZ3TvvpeY7dSIn9A6h3Rzhu7BTiLMcBQRYjbvT3GBQ41sIwXAJ9V0vrBI3AQbU3uBt
 YyvmfLZuPKhjLKLtdQJnB4wNYKSkQy0X6V3rr5CBrUsxVb+nnosgcLtnjukbHIJe+qxE
 ly8djP1FXUar6UJ8vIiKyiLTRdFM1/t7Z+9T9QHDO5K58qbAcKSQeqn0wsdvDDZ1G/qa
 vGyzAjwhHPu5zrbiNxsYRz72Hn54tWs4Nl1NXp5zW/MjXaBn2D+FSoiFwqQfk6G554lX
 1fesjju3A9NZCCMHk7388NqI9KvkeFT3CffZpj6LrD/s6rBAJkP/bTkqnXRSH+0x6k9P
 /50Q==
X-Gm-Message-State: AOAM533wynqeXEpWeq7igl6pEOUxvOA03V2FuUhFM+Yx/41kDKFuGQle
 7HcY6Prr+Kk/Eb9ZLLVzyi4pgseB1GYz1htQLuXH0bz0hc6qchV8KK0mzQr6Isgp3jUkaUartkc
 5WaEA7zt2F9uZFbAKlo60qK1YQVVHpao=
X-Received: by 2002:ab0:7412:: with SMTP id r18mr6381757uap.124.1624644522149; 
 Fri, 25 Jun 2021 11:08:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfFepOsEJBNF8OuylURquAmvHfaBwSXSl4jvPgnPGS2fJ+PMrN9jBSEjNQk9qbiUq3jlBitdGpxUk5jocYI3k=
X-Received: by 2002:ab0:7412:: with SMTP id r18mr6381739uap.124.1624644521991; 
 Fri, 25 Jun 2021 11:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210625112741.12566-1-alex.bennee@linaro.org>
In-Reply-To: <20210625112741.12566-1-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 25 Jun 2021 15:08:16 -0300
Message-ID: <CAKJDGDb4oNJoKZQXVekMB_xHx0MBcf_=7f0r0zM91LCCydUZWA@mail.gmail.com>
Subject: Re: [RFC PATCH] tcg/plugins: enable by default for TCG builds
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 qemu-devel <qemu-devel@nongnu.org>, robhenry@microsoft.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 25, 2021 at 8:27 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> Aside from a minor bloat to file size the ability to have TCG plugins
> has no real impact on performance unless a plugin is actively loaded.
> Even then the libempty.so plugin shows only a minor degradation in
> performance caused by the extra book keeping the TCG has to do to keep
> track of instructions. As it's a useful feature lets just enable it by
> default and reduce our testing matrix a little.
>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  docs/devel/tcg-plugins.rst |  3 ++-
>  configure                  |  2 +-
>  .gitlab-ci.d/buildtest.yml | 23 -----------------------
>  3 files changed, 3 insertions(+), 25 deletions(-)
>

As far as code is concerned, it looks good to me.

Reviewed-by: WIllian Rampazzo <willianr@redhat.com>


