Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD4E618828
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 20:03:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqfTu-000609-2g; Thu, 03 Nov 2022 15:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oqfTa-0005xe-GS
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 15:02:15 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oqfTY-0001kr-FA
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 15:02:05 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-369426664f9so24210487b3.12
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 12:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uq5mMlGziNoQeevWF0STtI0oL6dNsVPfhlIBNyBSq9A=;
 b=o0l9DvycxofLeQcG58NDoXaRTwARHhB9m6J4JFE4BLcmQ9RcstBbvasDlBf9/EXW9x
 KTihdYaTr/LJpji2CuYdMzw9d+zBk/Uu9JvL8VkVkHXEEAtnxvJcoVRegpDjizr18tBK
 EZiztMeJU7kJTOlXzvE8TvWICIaFdt+W+OQ1n30dDUekW33AuwX/jz5sgSg+Ls2HaDF/
 dCDbw0HTmqxCCELR5PIHKyHcw3gcFjbB36k0h2tyx+fhMmUrXV1gaLQzTdL35FMbtlrq
 VfTSMbfbuRTBCEndb7DS+vKMRAlE8t9+gk45eJWKUPWeEFHqyRQ+TRbJKIZDOPIGZ+3q
 8PrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uq5mMlGziNoQeevWF0STtI0oL6dNsVPfhlIBNyBSq9A=;
 b=wQNNOi+wJ78TQg2jscG+J0hDf++7az8TZX8K6Xq6NfVf3FtFnd1ck3a0t5/Kk5Bmze
 RnP36r2Xe1otjKML6msPmxZGFjZfiie4Ji3Vil0F5TSb+BZ1ySaQEhDfc3Y5AitkRfNv
 UJdq4zPApf1IUeTUHTxypOHIJiM5nn6odOOd0nwHj6UXgGAnDtLSDDDuVpHYgGWw4P9F
 oh837E7js4tb+EnyImlsowOIOIFYQ3HLL5pMTzY82WP1zAL4c+NsXv4FhunWOPDRZLV3
 AOwZ1c9NnMR0AoIARPK020Fp88/8fVKPD8fT90UMtaJ/hlQI1EvKE7FNMkzuQiRhe8sZ
 ac7g==
X-Gm-Message-State: ACrzQf3WX6sYYBBfa90aZB8V7dK2o6s72VamGVUT0p0xJtJYrbd34cux
 9MA/3iq/T8tQDnBVNVynB2cFne2VWxj7tKa/Wqk=
X-Google-Smtp-Source: AMsMyM6lOoT7RxXVBrd26go0qlKuHx4ezdXLEU+nZ9deeRnNm58pcSiwk4JD0FvDU29Isg6GK4j8Ybva+HEoWcP9D2Y=
X-Received: by 2002:a0d:cb07:0:b0:36b:bb5c:37b3 with SMTP id
 n7-20020a0dcb07000000b0036bbb5c37b3mr29897920ywd.62.1667502122286; Thu, 03
 Nov 2022 12:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <20221103173044.3969425-1-berrange@redhat.com>
 <20221103173044.3969425-2-berrange@redhat.com>
In-Reply-To: <20221103173044.3969425-2-berrange@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 3 Nov 2022 15:01:50 -0400
Message-ID: <CAJSP0QURm4ZCKb5gL8pZm6Gmc8MR8TkXp3ojAWUiyh8PKhi1rw@mail.gmail.com>
Subject: Re: [PATCH 1/2] gitlab: remove redundant setting of PKG_CONFIG_PATH
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 3 Nov 2022 at 13:30, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> The PKG_CONFIG_PATH variable is not defined in GitLab CI
> envs and even if it was, we don't need to set it to its
> existing value.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  .gitlab-ci.d/crossbuild-template.yml | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

