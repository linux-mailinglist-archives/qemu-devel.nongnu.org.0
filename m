Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D81E5363A2
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 15:58:23 +0200 (CEST)
Received: from localhost ([::1]:49874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuaTt-0004oq-RY
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 09:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuaQd-0001um-FV
 for qemu-devel@nongnu.org; Fri, 27 May 2022 09:54:59 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:34705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuaQb-0000Km-UC
 for qemu-devel@nongnu.org; Fri, 27 May 2022 09:54:59 -0400
Received: by mail-ej1-x632.google.com with SMTP id q21so8982350ejm.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 06:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=MhZcm0A3AG5uPxZqXTQWmS4FcwEhf27VPomuYdWZ+qw=;
 b=xZrTzDQBVrpLPIRBTkWTActg7Z8lZ3R8+cifb6sidxQs3ImP/8tAaVbyOd7nVi6Qos
 r6Q1d3QexWjOkS+Lx8SUB7hUWBysrRNGXKIHIBpxwTwF8SUHR8kiOeG/wEogSphbMiDv
 xU2Se7DFfK5eB6DPb3i/eKfN5YY8lTQpwZOyNs+sMnoPIo/MG9oT0VTJawJQmv6226IN
 fEPADWQjnrGPQu85z1QcA+LEgw/jKEpygN4W2PZNnKjD3LuJAk57KzGLJQe9DZDEW9bb
 Of3PaF6TeNOkoKcAG6C4zF1tjoXy3jmkDZtPHBWnM9tAdCJcIP7aDpQ6TyIw6bR1+U6e
 /IKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=MhZcm0A3AG5uPxZqXTQWmS4FcwEhf27VPomuYdWZ+qw=;
 b=dUcRP9v+0/T4r8I1iLL0mQOAp2cO6Z4fZ8E3q9MkKaJcZh/hzd7b21nQi3aFpt7wR2
 tLANdkFeqQLlnJsOtuVjy+Wq5ouHEiKR8IM6ltLFtPBIivWB5j4JP7gbkoZDTc1t3NCI
 l1m0o8LBfwYHzLVbR7dt3ufE43+jk2ofNMNKZbgpH4ZQ+8Gnfs2e0UYPl1M5ifxdmLVc
 Kzvaa8zIpF2pHmzg9AHC7457VNRozAyB5/epvQZy6B8aS+5GSB5NFbmjEfrheH2KIqac
 rNBVQZ6OH1o0/MYgihm2f2jSYwHG1qCg6Zk9kfqzy1pg1lBslhqtMu1rtI5WoKvezogk
 pYvw==
X-Gm-Message-State: AOAM531zoE9tYcH8qYa3G3Y9mWzAORNiiLodg1AStAqsH+9En08Z+Dhv
 A1Y0KY0h+toCvdZ6PMheuI3JOQ==
X-Google-Smtp-Source: ABdhPJza+BGka0X4jKGRJNGm5zddw9ad0G/yGNG7zcohkqkayCKi/PPdVEabJ/CuXtoRafCsrkK92Q==
X-Received: by 2002:a17:907:9612:b0:6fe:e969:e09b with SMTP id
 gb18-20020a170907961200b006fee969e09bmr22622615ejc.767.1653659696505; 
 Fri, 27 May 2022 06:54:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a05640234cf00b0042ab1735552sm1029443edc.66.2022.05.27.06.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 06:54:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 92EF81FFB7;
 Fri, 27 May 2022 14:54:54 +0100 (BST)
References: <20220516082310.33876-1-thuth@redhat.com>
User-agent: mu4e 1.7.23; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Wainer dos Santos
 Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>, =?utf-8?Q?Daniel?=
 =?utf-8?Q?_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v2] gitlab-ci: Switch the container of the
 'check-patch' & 'check-dco' jobs
Date: Fri, 27 May 2022 14:54:48 +0100
In-reply-to: <20220516082310.33876-1-thuth@redhat.com>
Message-ID: <875ylrytap.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
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


Thomas Huth <thuth@redhat.com> writes:

> The 'check-patch' and 'check-dco' jobs only need Python and git for
> checking the patches, so it's not really necessary to use a container
> here that has all the other build dependencies installed. By using a
> lightweight Alpine container, we can improve the runtime here quite a
> bit, cutting it down from ca. 1:30 minutes to ca. 45 seconds.
>
> Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

