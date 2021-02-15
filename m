Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BAF31C184
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 19:29:56 +0100 (CET)
Received: from localhost ([::1]:48846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBid9-0004gY-7Q
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 13:29:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lBibP-0003jS-Du
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 13:28:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lBibN-000559-L0
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 13:28:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613413684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ISgo0SgkNpZLe7AFp7RIanreaW0RsuG3l14rAZCOSGA=;
 b=fEwb0Tsd7O3aYpvzJL44+fdurepilO+QD5BG4DYsrTDYDzkfbc6lik57rh2dBovYaRimni
 tALet7wE/LmnDk4Los0itvzYOI/5E6Te5j5XC50BB/YTSPzjGEGKUT0mUV9OfpJYMQQpG8
 O+DPjdxBbcoRFg3ACKXgkX1rZMwQIyk=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-wqh7Lgq2PKWvAFhn6W_AqA-1; Mon, 15 Feb 2021 13:28:01 -0500
X-MC-Unique: wqh7Lgq2PKWvAFhn6W_AqA-1
Received: by mail-ua1-f72.google.com with SMTP id k10so831670uag.12
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 10:28:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ISgo0SgkNpZLe7AFp7RIanreaW0RsuG3l14rAZCOSGA=;
 b=tbxkg+qv9y5kk6TdpJhOxJuQugtBM7Ls1z6ZmKvnsc02wcgAXOGl1KLvXTyrda95kj
 V4gtZLmagUx8nNk7uICl0IdydQp/CkaU0UtspAi3uSDM3esVTnuujCecS9aHVH2o3/ww
 tIrle7nfo8Zdmqa7RgsIqN1nutZ46ixQkaa1Z4LnPFQ9pzyLShg5Z4ho9h25o8MdSotW
 G5n+7Rcs5AxOJIJNRmaTCZyHp7po+LiiuO1ZqFhsX7vOnclWC5mvCW/Vls2UYbmgWCTU
 NGOYw/tvz8TjhXkQLSkntmVjJ0/hgfeXZ3k7y+PtrDuQyFeDuI6rwYcH9zkrtBTGkj+l
 ekIg==
X-Gm-Message-State: AOAM530nnAtMT2A6KR3DnrRiOvk2eREEAyaI1expFHqV20QzYQAKSHI1
 XGMB5gSU5VEuUGTaMNCyXNeZwHokpwglXjodyLnw0330T+/sjTiylWPWTkblLI7407gwe3d3/ss
 Yg81n0oc/24SIbaFCaRzgPRNJTNjlZmI=
X-Received: by 2002:a1f:a2c2:: with SMTP id l185mr9165157vke.2.1613413681453; 
 Mon, 15 Feb 2021 10:28:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcDQfZ6QO5gfqL4HgoYrgFx/oofns+tcmbSBpzerzjaSQjLYEd+CCo/1/CQgRJkNoZX1fuL7dWkLNoLsBOHTA=
X-Received: by 2002:a1f:a2c2:: with SMTP id l185mr9165151vke.2.1613413681298; 
 Mon, 15 Feb 2021 10:28:01 -0800 (PST)
MIME-Version: 1.0
References: <20210215171438.935665-1-philmd@redhat.com>
In-Reply-To: <20210215171438.935665-1-philmd@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 15 Feb 2021 15:27:35 -0300
Message-ID: <CAKJDGDZ+Y8Fv1rfAVYDSBo-PsFBAHkHvaJg1Q2oFKcm43_GLxw@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci: Display Avocado log content when tests timeout
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 15, 2021 at 2:14 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Since commit ba2232bae6d ("gitlab-ci: Refactor code that show logs
> of failed acceptances") we display the log content of failing tests
> (Avocado "FAIL" event).
>
> Since we are also interested in tests timeouting, update our global
> Avocado config to display log content for the "INTERRUPT" event,
> "possible when the timeout is reached" (See [*]).
>
> [*] https://avocado-framework.readthedocs.io/en/latest/guides/writer/chap=
ters/writing.html#test-statuses
>
> Suggested-by: Willian Rampazzo <willianr@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  .gitlab-ci.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


