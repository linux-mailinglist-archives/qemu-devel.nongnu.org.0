Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8443BBCEB
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 14:39:44 +0200 (CEST)
Received: from localhost ([::1]:53104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Nt1-0002Yc-M6
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 08:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0NqN-00012m-1o
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:36:59 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:40726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0NqL-0007Ig-DT
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:36:58 -0400
Received: by mail-wr1-x42f.google.com with SMTP id l5so5170203wrv.7
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 05:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=vhTYcA0DHzhRubP3wwWTxRAwzfuVCKyUoUseEbpOmyM=;
 b=zYH6dQqbnhycdLzaIHNTD98u/iC+fZbHML6Z7vC5WeItZhI+uFfcnyi8nb2YQereb2
 ITPmFaVvoP8AuyqGV2ObVNOk/3UugPcFK7l40+KhLPzb9qYoOiAL2HiXEUpoF8CvnrBc
 y+dSLIHuABdd1i15aeb3suxb0s8T53gL6W+0T7fRzHc85WJPDQ4kJ6Io6MeSfu2qRekp
 bqNmMlqEFV5rfHa8jWbFI8Dak+hgl1MymhXTuLQ7GAgzapagIThBPFbzIiTyTtSfa8d0
 l8BtS+VewVTThLhdgNAzvCj9NuTL4YpiG9M4NoKaB0WxYtEEK7B5fwieQe/VAM2/h9Va
 B8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=vhTYcA0DHzhRubP3wwWTxRAwzfuVCKyUoUseEbpOmyM=;
 b=rI0RAFf8u5OMVaq/Sq3oI1ra/Nk+17rPybHUsbs4lN5Na8bh6xW+cFVV6CFVvbSHSi
 kb9tj6sl4JaniuQF0TdMrjy+D8DKoZi0pZfAS0dZ39BhGjKxYoMxvLzskQXenpN6zpYB
 v4IvnTs9BbPb4sUbz4U/ZsIGt/3XHw9mZXtvQSerlFXbNiOACg2NQtWdw1fmz62D43KI
 6JSEXn26eJpJ/08LONrpZ//SEgf8Qa9/lJbOSRplCi5IlLpe50kCL4O088c+1DINU3CK
 javMqRqR0ifmsw0nqpI+sCbjF5z0qD+Od4MA9GkGOIOecA/Wop/62d3EuumuFqcLOqS5
 5WfA==
X-Gm-Message-State: AOAM530FZ5FeZrxm7+01o3nm/zzKYhxM3EVbKPRmEzt+EZBsq1jxjtjd
 5J/SrZkK3Jur7IzOSllezl8WYA==
X-Google-Smtp-Source: ABdhPJzKPkeR8KeO0SxwMsKORJRAj2DgHaqa8CBKoRyP21f+T5bQ7FcOX22fSdsERT3dlKNDrhUUdQ==
X-Received: by 2002:a5d:5586:: with SMTP id i6mr15667251wrv.195.1625488615221; 
 Mon, 05 Jul 2021 05:36:55 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c9sm13100117wro.5.2021.07.05.05.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 05:36:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C37B91FF7E;
 Mon,  5 Jul 2021 13:36:53 +0100 (BST)
References: <20210623142245.307776-1-berrange@redhat.com>
 <20210623142245.307776-6-berrange@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 05/22] tests/docker: remove FEATURES env var from
 templates
Date: Mon, 05 Jul 2021 13:36:48 +0100
In-reply-to: <20210623142245.307776-6-berrange@redhat.com>
Message-ID: <87v95p3pju.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> In preparation for switching to auto-generated dockerfiles, remove the
> FEATURES env variable. The equivalent functionality can be achieved in
> most cases by just looking for existance of a binary.
>
> The cases which don't correspond to binaries are simply dropped because
> configure/meson will probe for any requested feature anyway.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

