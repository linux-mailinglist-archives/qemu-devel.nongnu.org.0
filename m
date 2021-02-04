Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 643A530F12B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 11:48:48 +0100 (CET)
Received: from localhost ([::1]:40714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7cBr-0002JC-HH
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 05:48:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7cAo-0001eM-5I
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:47:42 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7cAm-00055U-CO
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 05:47:41 -0500
Received: by mail-wr1-x42a.google.com with SMTP id c4so2892784wru.9
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 02:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=U/q+ed5nk8fE8kBOfiKNwOZQ4onKkZam6iRYsgcVvS0=;
 b=eK8PGHzG9n5LEqOFIQbuQpWWd1BVCADhPpCV8/ae1oVLhGzszHN8toDVFHnTl+RVud
 NShNPVASSwafTFIw9tm4NwNv0mUUVYl6CbHFSLnL9hvjcquj/dDsAPycmstfx4qaE/jf
 z9x0/M57kMZjCbVvIPjQ03LAaxkgUpkBTsJGyAaP2WKRMUlcYTYBL75QvwZGyWaLS/W6
 XNWDExsojZCzqktx3vpt/lCXRtYMXfbfTAvGYFKSliNxiRFzSpAJjZImjAJCQCIJCYSi
 Vyg7m50asmK1fbHs8b7bfr/oy/NBTI3yQ6fxI6PvdAUfiPbZYKmpyKKz2cmwpIp+axZx
 AsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=U/q+ed5nk8fE8kBOfiKNwOZQ4onKkZam6iRYsgcVvS0=;
 b=GuSiQfu8wGN4VDKAQBvFIl+kSKqdIh3189KY6zVJofthz0Ic4cNV9Ntib9MDbu57h2
 P1YffdY02H6ZI/geesMe9RZKDwYLy9CE1xuaJ3KOIogtO9TrZ5O6q3cLycQbYwRKeCur
 bV+/nwFYvHoXOqVKWbBlUeVBN6abGuv7Gd9kDAvQZcgjNoD8YUWUPC1qsQ+NCnofVJGA
 kVPkL8z4Ic96HWuPuXhjwpSNitwEuQfaDl94scdqzMqCrzYNAYPPPODG4yMvttfRQ9YP
 R81leQeQW4FDiVoUgqIpjQtOdIV+/kDjIEPDUIJZGjarGaNEq10xno6L1fR05MTZ9oie
 y/ow==
X-Gm-Message-State: AOAM533vWFZazPoDeRvRzgXEIdJohK6Bso+EYkuZsNEWjmdXjNzs1wCr
 zGJA3mOBQeZBb1IkK5JMOWnSzw==
X-Google-Smtp-Source: ABdhPJxpYAgWWk2MQaYFm8pTSMQsnrllkpbzkxdfe52/PEtBK9S434Xib+OgzIEdipDscqelSsFD1Q==
X-Received: by 2002:adf:ae01:: with SMTP id x1mr8529181wrc.381.1612435658641; 
 Thu, 04 Feb 2021 02:47:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i18sm8057257wrn.29.2021.02.04.02.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 02:47:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B8DB81FF7E;
 Thu,  4 Feb 2021 10:47:36 +0000 (GMT)
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-3-crosa@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 02/22] tests/acceptance/boot_linux.py: rename misleading
 cloudinit method
Date: Thu, 04 Feb 2021 10:47:31 +0000
In-reply-to: <20210203172357.1422425-3-crosa@redhat.com>
Message-ID: <87k0roqfcn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa <crosa@redhat.com> writes:

> There's no downloading happening on that method, so let's call it
> "prepare" instead.  While at it, and because of it, the current
> "prepare_boot" and "prepare_cloudinit" are also renamed.
>
> The reasoning here is that "prepare_" methods will just work on the
> images, while "set_up_" will make them effective to the VM that will
> be launched.  Inspiration comes from the "virtiofs_submounts.py"
> tests, which this expects to converge more into.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

