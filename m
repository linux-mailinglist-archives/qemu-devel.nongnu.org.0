Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5528D3931A3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 17:02:29 +0200 (CEST)
Received: from localhost ([::1]:36308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmHWm-0000sh-EJ
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 11:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmHU6-0007LG-9p
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:59:42 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmHU4-0000NF-Fy
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:59:41 -0400
Received: by mail-wr1-x433.google.com with SMTP id x7so154326wrt.12
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 07:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=xX20Hy7q3mA0GskIxWEOV1JH01jVQ3CyJUKSH6KTDpg=;
 b=W4jqUyxribClg71dk1BvHmPE0HFlKR0OxeKAhUgPoCIe8ulQbCoGy9eK4f8kl1HiHV
 Uy5vxBm1Jo+Aqh7S8LORbb4iibOQ479QYb5KEGPLpfnHzN53PNi0kNvfRMNdaeMZTu7w
 3ztNCqHZl/CGD1QfsQWC6yAsslFtiaeQ6fZNO2WMbcVVFK/XOmis91myJmgcGmWQXQl0
 0DuY3c4xh2Vs5QawsKiG2/DYhZnpKh+rarSM4q/aEFMNOXoRw4Zm5jeAvOsWcHC9Ne9g
 XwNV9bU74HSKA6sekoky/3EoGMacTyfPo6R7OVMvYq82feU4zOMLdVB9I15ySel7N14g
 OT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=xX20Hy7q3mA0GskIxWEOV1JH01jVQ3CyJUKSH6KTDpg=;
 b=DpP4+plS1zzs5mhy5kCtcnhpmulIghsz2ijISiRUQqq1UONMiCc2R1OigksdHG+fMU
 M055dxdZJeno8+dxORyxxg9sOyiDAy40mT9lYg5sdivUcrbh96PvqQbWMwgxSwEgmmj3
 vYA0jN3Pk0I1d648fD7wZqnyoO2pB58PThK3tG3cOwETrp/a6jZbOIP+zXETgY1tb0TH
 D3rwL/GrkwvUKpMz5c8JRZNTq6xEY0kPD+OxyHe9jzxI7RNvqJyg1FZ0uR/v/p4/kvFs
 XX3KqfuBTYbzJrXSjL9pOTD1NccMZRolN8g/4tmdad+1nC/NfEYPpsNap2I7l0SvE8uN
 07DA==
X-Gm-Message-State: AOAM531dZtDu2YOALt2ZWzUCncq8NrzYGfvP/dpEk1ZWbYxBNFynTMUz
 PfTPU55S77DCv2/V9rMadfKA9Q==
X-Google-Smtp-Source: ABdhPJzaaQlicjeqP33ms0+9frGGKKerrydLYNjAD9GYhwPK30N7TVhZOnuuBXCzecozD8o4bjADQQ==
X-Received: by 2002:adf:e5c8:: with SMTP id a8mr3816276wrn.155.1622127578837; 
 Thu, 27 May 2021 07:59:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i5sm3643908wrw.29.2021.05.27.07.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 07:59:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2431C1FF7E;
 Thu, 27 May 2021 15:59:37 +0100 (BST)
References: <20210525132418.4133235-1-f4bug@amsat.org>
 <20210525132418.4133235-3-f4bug@amsat.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/2] gitlab-ci: Convert check-dco/check-patch jobs to
 the 'rules' syntax
Date: Thu, 27 May 2021 15:59:30 +0100
In-reply-to: <20210525132418.4133235-3-f4bug@amsat.org>
Message-ID: <87pmxc1aue.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Danie?= =?utf-8?Q?l_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Per GitLab documentation [*]:
>
>   "rules replaces only/except and they can=E2=80=99t be used together
>    in the same job."
>
> Since the 'rules' syntax is more powerful and we are already using
> it, convert the check-dco/check-patch jobs so no job use the 'only/
> except' syntax.
>
> [*] https://docs.gitlab.com/ee/ci/yaml/#rules
>
> Inspired-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

