Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6AF343E9F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:58:12 +0100 (CET)
Received: from localhost ([::1]:33946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOIGB-0007B7-Ek
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOIAp-0003AT-1M
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:52:40 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:37810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOIAl-0003RN-6Z
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:52:37 -0400
Received: by mail-ed1-x529.google.com with SMTP id x21so18704650eds.4
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 03:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aXxa7bkft8AhZ46FYaElC+Iy+ubL7/9dDOs9rntxpVk=;
 b=banKQSGxm+WogHpYJh/00/GPa1Rj8NKHToM/xShHaS9TpKfC5GftwlKfzqw7fSLTkY
 HZQ1plIyGis7MM19uprhMBRgZehzp03QRBnIRfK9InOmK8xv/GOEztOHhevZR36wLSuD
 v4ZYiy2WPVZQLPZY76c634th1JnBV3Bult94+Ih9vN4FV5hFONoua1+NFMHrvf8dUYAZ
 /MeUadXxL80MBoGYTLB5VQcwRNmiTFE/qx7X+4+JWcJ8JAGC4I6g2O8AVO3g2Chucpmm
 OCjaN9IUcQTOMiQEf5h+K+rv8qeNMx68GhFLBBqIfaQje9QZBkoGsjODV+6KH5cCsQNF
 7gBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aXxa7bkft8AhZ46FYaElC+Iy+ubL7/9dDOs9rntxpVk=;
 b=fWNLWyB7BAHrXhtzBY8TRB1YlY1C630IsyGYRa8Ozor/lVmG/JFqg8LuSI1dCrmjwZ
 Grnb+5EoIEa/PnBJh4ipKfrKMbzr/Sbv/PLSgSUod4EXdrPvPOmBzmDgsTutZys7gU4u
 /nbvwsuFA9oEtlFMcR2QgpcoZGRBI+bFZOin5o9DGTU5dr4zIDRbZxc9sVc8fckxPAk4
 j+jSiCXe6eTZnBfpA6ATFxEDBKkxj7ok/utGikK1AcsJx5d7ejF6Euy3AyAaUVIpAeWA
 F6gmV5UnKKlDmu20853kEAh0v7ebkVSls/FLdbi00eNpAYHmfGHrjYEftLIulG4Xg5CJ
 Polg==
X-Gm-Message-State: AOAM531IV9blJXUTEhg5fuoii+Doru+fk3TOVW5TaZQnJtdo+RVwyEL6
 Q/AJrKjGPF/K68MT5S27yD1LTtwlAwZRjd1h24cg6A==
X-Google-Smtp-Source: ABdhPJxMDtz8iMKlFL6ot8etYV9MKznGoBxu9f9RgCSiUnu6bqvb3L5KQ7WSvSkIv2t3YKEsC8qdyLNMmtoK25F+4Io=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr24579543edv.44.1616410350089; 
 Mon, 22 Mar 2021 03:52:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210318092512.250725-1-berrange@redhat.com>
In-Reply-To: <20210318092512.250725-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Mar 2021 10:52:02 +0000
Message-ID: <CAFEAcA-z2Yw+9wxHSYsq3q_n9fQUgfmoEg4C1u=89cr+BWgOeQ@mail.gmail.com>
Subject: Re: [PULL v2 00/13] misc patches removing deprecated features
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Ian Jackson <iwj@xenproject.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Mar 2021 at 09:30, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> ----------------------------------------------------------------
> Remove many old deprecated features
>
> The following features have been deprecated for well over the 2
> release cycle we promise
>
>   ``-drive file=3Djson:{...{'driver':'file'}}`` (since 3.0)
>   ``-vnc acl`` (since 4.0.0)
>   ``-mon ...,control=3Dreadline,pretty=3Don|off`` (since 4.1)
>   ``migrate_set_downtime`` and ``migrate_set_speed`` (since 2.8.0)
>   ``query-named-block-nodes`` result ``encryption_key_missing`` (since 2.=
10.0)
>   ``query-block`` result ``inserted.encryption_key_missing`` (since 2.10.=
0)
>   ``migrate-set-cache-size`` and ``query-migrate-cache-size`` (since 2.11=
.0)
>   ``query-named-block-nodes`` and ``query-block`` result dirty-bitmaps[i]=
.status (since 4.0)
>   ``query-cpus`` (since 2.12.0)
>   ``query-cpus-fast`` ``arch`` output member (since 3.0.0)
>   ``query-events`` (since 4.0)
>   chardev client socket with ``wait`` option (since 4.0)
>   ``acl_show``, ``acl_reset``, ``acl_policy``, ``acl_add``, ``acl_remove`=
` (since 4.0.0)
>   ``ide-drive`` (since 4.2)
>   ``scsi-disk`` (since 4.2)

Just FYI, it turns out that removing 'query-cpus' has broken Xen,
whose libxl control library is still using it:

https://lists.xenproject.org/archives/html/xen-devel/2021-03/msg01178.html

This suggests we should probably try to coordinate a bit better
with Xen as one of our downstream QMP users.

Am I right in thinking that QEMU now has an option that Xen
could turn on in their CI for "make attempts to use deprecated
features fail" so they could catch them earlier in the
deprecate-and-delete cycle?

thanks
-- PMM

