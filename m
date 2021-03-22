Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D2B344CB7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:05:10 +0100 (CET)
Received: from localhost ([::1]:36024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONzF-0005KG-IO
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:05:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lONwI-0003um-GN
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:02:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lONwG-0001DC-HN
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 13:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616432519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=75z6+nG/Dgp9BfZBquPqInzD5NIJbfYGqmjrw/LJd2k=;
 b=Z2g9O6E092yXjM9lSagzgmeJwcdeY1oKzE5L5vdtcY550PCJYgOkAsb3SgLAOKPi7bbxTX
 2L4yeP4wsZpwrIQvvSIRtK1K16SUkfmFKL9mcj3yizaIMCbsjZOU89ksIC2EH85JPXwYoi
 GOksNh5k8GzhSwc1yNlRNdOFJQP7n2c=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-20rmZHQ4O8Okr9jW2zwMfg-1; Mon, 22 Mar 2021 13:01:57 -0400
X-MC-Unique: 20rmZHQ4O8Okr9jW2zwMfg-1
Received: by mail-vk1-f200.google.com with SMTP id x23so2720217vkd.0
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 10:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=75z6+nG/Dgp9BfZBquPqInzD5NIJbfYGqmjrw/LJd2k=;
 b=qFefuW6Ch/kAammbOAxIWNSTXxRUMI1gJR7y5H7GLAJkFFjY9sNP05x2Of9KySYg14
 K1FsoCUJuZG5m+yGK8yFlZJ6Hww62mj5aa04q56iWUaOb8y6jczgzFX/kLoTwf9tujFD
 Me9fdSqvwijZSRoILsQuS3W5FjobKuJhE0n+38em5RFpMf0K8SQEoIu4fIH//oiTEiV6
 K8aZuBU6vm10cXsU57DFjxn/JEbIRyBdCzTQ/KPAxy/akQ3ZIWxICOXpfGL5Mg2rfjlr
 DwkVNVhWn+p6hCrFXqZj8X54WaiC6lc22yEtq5Wj72iGOncGFNy/mlBtBsyBUE4yByBu
 fmZQ==
X-Gm-Message-State: AOAM532hzolftfgJnvvIH1nqMIJPirRkgy1KHxuJha4gieXg6mA00we5
 6rQUj1wx7YeC4PPReoxww4tid5XGb+jTcNhGvrMcfZ3tzE5yUiKdGGehIhMp5hsKGh4c8HM+9S9
 U3SI076N17WAnBUHIlei7ganU2jp51WY=
X-Received: by 2002:a67:c80e:: with SMTP id u14mr564368vsk.39.1616432517320;
 Mon, 22 Mar 2021 10:01:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3cg8yH+V0Vd3v5MJPaPrXIhAf/Lh/Bx09scfwxdEayTZ0yeEJMvPYDHVdj/m7fBCWgLMKgwT4AvJPutzCdz4=
X-Received: by 2002:a67:c80e:: with SMTP id u14mr564340vsk.39.1616432517065;
 Mon, 22 Mar 2021 10:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210322142110.4766-1-alex.bennee@linaro.org>
In-Reply-To: <20210322142110.4766-1-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 22 Mar 2021 14:01:31 -0300
Message-ID: <CAKJDGDb-oby-_E0h_95HbEuiig=NXm+-ndP=NwRnEB_w4OGBig@mail.gmail.com>
Subject: Re: [RFC PATCH] gitlab: extend timeouts for CFI builds
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, dbuono@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 22, 2021 at 11:21 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
> These builds are running very close to the default build limit and as
> they are already pared down the only other option is to extend the
> timeout a little to give some breathing room.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.yml | 3 +++
>  1 file changed, 3 insertions(+)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


